// MIDI to PSG converter for PuyoPuyo game
// Converts a MIDI file to the game's music format
// Usage: node midi2game.js <input.mid> <output.h> <varPrefix> <melodyChan> <bassChan> <framesPerRow> <endTick|0=auto>
const fs = require('fs');
const args = process.argv.slice(2);
if (args.length < 6) {
    console.log('Usage: node midi2game.js <input.mid> <output.h> <varPrefix> <melodyChan> <bassChan> <framesPerRow> [endTick]');
    process.exit(1);
}

const [inputFile, outputFile, varPrefix, melodyChanStr, bassChanStr, fprStr] = args;
const melodyChan = parseInt(melodyChanStr);
const bassChan = parseInt(bassChanStr);
const FRAMES_PER_ROW = parseInt(fprStr);
const endTickOverride = args[7] ? parseInt(args[7]) : 0;

const buf = fs.readFileSync(inputFile);
let pos = 0;
function readU32() { const v = buf.readUInt32BE(pos); pos += 4; return v; }
function readU16() { const v = buf.readUInt16BE(pos); pos += 2; return v; }
function readVarLen() { let v = 0; while (true) { const b = buf[pos++]; v = (v << 7) | (b & 0x7F); if (!(b & 0x80)) break; } return v; }

pos += 4; readU32(); readU16();
const numTracks = readU16(); const ticksPerBeat = readU16();

// Parse all events
const allEvents = [];
for (let t = 0; t < numTracks; t++) {
    pos += 4; const trkLen = readU32(); const trkEnd = pos + trkLen;
    let runningStatus = 0, absTick = 0;
    while (pos < trkEnd) {
        const delta = readVarLen(); absTick += delta;
        let status = buf[pos];
        if (status & 0x80) { runningStatus = status; pos++; } else { status = runningStatus; }
        const type = status & 0xF0, chan = status & 0x0F;
        if (type === 0x90 || type === 0x80) {
            const note = buf[pos++], vel = buf[pos++];
            allEvents.push({ tick: absTick, note, vel: (type === 0x90) ? vel : 0, chan, type: (type === 0x90 && vel > 0) ? 'on' : 'off' });
        } else if (type === 0xA0 || type === 0xB0 || type === 0xE0) pos += 2;
        else if (type === 0xC0 || type === 0xD0) pos += 1;
        else if (status === 0xFF) { pos++; const ml = readVarLen(); pos += ml; }
        else if (status === 0xF0 || status === 0xF7) { const sl = readVarLen(); pos += sl; }
    }
    pos = trkEnd;
}

const PSG_CLOCK = 1789772.5;
function noteToPeriod(midiNote) {
    const freq = 440.0 * Math.pow(2, (midiNote - 69) / 12.0);
    let period = Math.round(PSG_CLOCK / (16.0 * freq));
    if (period < 1) period = 1;
    if (period > 4095) period = 4095;
    return period;
}

const melodyEvents = allEvents.filter(e => e.chan === melodyChan);
const bassEvents = allEvents.filter(e => e.chan === bassChan);

// Calculate ticks per row based on tempo
// Default: match musical timing
const ticksPerRow = Math.round(ticksPerBeat / 6); // 16th note resolution

const maxTick = Math.max(...allEvents.map(e => e.tick));
const END_TICK = endTickOverride > 0 ? endTickOverride : maxTick;
const MAX_ROWS = Math.ceil(END_TICK / ticksPerRow);

function buildChannel(evts) {
    const rows = new Array(MAX_ROWS).fill(0);
    const ons = evts.filter(e => e.type === 'on' && e.tick < END_TICK);
    for (const on of ons) {
        const startRow = Math.floor(on.tick / ticksPerRow);
        const off = evts.find(e => e.type === 'off' && e.note === on.note && e.tick > on.tick);
        const endRow = off ? Math.floor(off.tick / ticksPerRow) : startRow + 4;
        for (let r = startRow; r < endRow && r < MAX_ROWS; r++) {
            if (rows[r] === 0) rows[r] = on.note;
        }
    }
    return rows;
}

const melodyRows = buildChannel(melodyEvents);
const bassRows = buildChannel(bassEvents);

// Trim trailing silence
let usedRows = 0;
for (let r = MAX_ROWS - 1; r >= 0; r--) {
    if (melodyRows[r] || bassRows[r]) { usedRows = r + 1; break; }
}
usedRows = Math.ceil(usedRows / 4) * 4;

// Find loop point
let loopRow = 0;
for (let r = 10; r < usedRows; r++) {
    if (melodyRows[r] > 0 && melodyRows[r-1] === 0) { loopRow = r; break; }
}

console.log(`${inputFile}: ${usedRows} rows, loop=${loopRow}, ${usedRows * 6} bytes`);

// Generate output
let output = `// Auto-generated from ${inputFile}\n#pragma once\n\n`;
output += `#define ${varPrefix}_FRAMES_PER_ROW ${FRAMES_PER_ROW}\n`;
output += `#define ${varPrefix}_LOOP_ROW ${loopRow}\n\n`;
output += `static const u16 g_${varPrefix}Data[][3] = {\n`;

let prevM = -1, prevB = -1;
for (let r = 0; r < usedRows; r++) {
    const m = melodyRows[r], b = bassRows[r];
    let mVal, bVal;
    if (m > 0 && m !== prevM) mVal = noteToPeriod(m);
    else if (m === 0 && prevM > 0) mVal = 1;
    else mVal = 0;
    if (b > 0 && b !== prevB) bVal = noteToPeriod(b);
    else if (b === 0 && prevB > 0) bVal = 1;
    else bVal = 0;
    prevM = m; prevB = b;
    output += `    { ${mVal}, ${bVal}, 0 },\n`;
}
output += `};\n\n#define ${varPrefix}_ROWS (sizeof(g_${varPrefix}Data) / sizeof(g_${varPrefix}Data[0]))\n`;

fs.writeFileSync(outputFile, output);
console.log(`Written ${outputFile}`);
