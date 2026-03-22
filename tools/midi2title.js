// MIDI to PSG title music converter - "The Power of Love" by Celine Dion
// Extracts melody (chan 0) + bass (chan 4), outputs simple format for title screen
const fs = require('fs');
const buf = fs.readFileSync('c:/Users/Antxiko/Documents/PuyoPuyoVS/DION.Power of love K.mid');

let pos = 0;
function readU32() { const v = buf.readUInt32BE(pos); pos += 4; return v; }
function readU16() { const v = buf.readUInt16BE(pos); pos += 2; return v; }
function readVarLen() { let v = 0; while (true) { const b = buf[pos++]; v = (v << 7) | (b & 0x7F); if (!(b & 0x80)) break; } return v; }

pos += 4; readU32(); readU16();
const numTracks = readU16(); const ticksPerBeat = readU16();

pos += 4; const trkLen = readU32(); const trkEnd = pos + trkLen;
const events = [];
let runningStatus = 0, absTick = 0;
while (pos < trkEnd) {
    const delta = readVarLen(); absTick += delta;
    let status = buf[pos];
    if (status & 0x80) { runningStatus = status; pos++; } else { status = runningStatus; }
    const type = status & 0xF0, chan = status & 0x0F;
    if (type === 0x90 || type === 0x80) {
        const note = buf[pos++], vel = buf[pos++];
        events.push({ tick: absTick, note, vel: (type === 0x90) ? vel : 0, chan, type: (type === 0x90 && vel > 0) ? 'on' : 'off' });
    } else if (type === 0xA0 || type === 0xB0 || type === 0xE0) pos += 2;
    else if (type === 0xC0 || type === 0xD0) pos += 1;
    else if (status === 0xFF) { pos++; const ml = readVarLen(); pos += ml; }
    else if (status === 0xF0 || status === 0xF7) { const sl = readVarLen(); pos += sl; }
}

const PSG_CLOCK = 1789772.5;
function noteToPeriod(midiNote) {
    const freq = 440.0 * Math.pow(2, (midiNote - 69) / 12.0);
    let period = Math.round(PSG_CLOCK / (16.0 * freq));
    if (period < 1) period = 1;
    if (period > 4095) period = 4095;
    return period;
}

const melodyEvents = events.filter(e => e.chan === 0);

// 71 BPM, 120 ticks/beat
// Take ~55 seconds (intro + verse + chorus): ticks 0 to ~6720 (14 bars of 480 ticks)
// Use ticksPerRow=20 for reasonable resolution
// FRAMES_PER_ROW=7 for slow ballad feel (50Hz PAL: 50/7 = 7.14 rows/sec)
// Actual playback: 7.14 rows/sec * 20 ticks/row = 142.8 ticks/sec
// 71 BPM * 120 ticks/beat / 60 = 142 ticks/sec -> perfect match!
const FRAMES_PER_ROW = 5;
const ticksPerRow = 20;
const START_TICK = 0;
const END_TICK = 24000; // ~2.8 minutes - full song through choruses
const MAX_ROWS = Math.ceil((END_TICK - START_TICK) / ticksPerRow);

function buildChannel(evts) {
    const rows = new Array(MAX_ROWS).fill(0);
    const ons = evts.filter(e => e.type === 'on' && e.tick >= START_TICK && e.tick < END_TICK);
    for (const on of ons) {
        const startRow = Math.floor((on.tick - START_TICK) / ticksPerRow);
        const off = evts.find(e => e.type === 'off' && e.note === on.note && e.tick > on.tick);
        const endRow = off ? Math.floor((off.tick - START_TICK) / ticksPerRow) : startRow + 4;
        for (let r = startRow; r < endRow && r < MAX_ROWS; r++) {
            if (rows[r] === 0) rows[r] = on.note;
        }
    }
    return rows;
}

const melodyRows = buildChannel(melodyEvents);

// Trim trailing silence
let usedRows = 0;
for (let r = MAX_ROWS - 1; r >= 0; r--) {
    if (melodyRows[r]) { usedRows = r + 1; break; }
}
usedRows = Math.ceil(usedRows / 4) * 4;

// Find a good loop point (where melody restarts after intro)
let loopRow = 0;
for (let r = 20; r < usedRows; r++) {
    if (melodyRows[r] > 0 && melodyRows[r-1] === 0) {
        loopRow = r;
        break;
    }
}

console.log(`Used rows: ${usedRows}, Loop row: ${loopRow}`);
console.log(`Data size: ${usedRows * 6} bytes`);

let output = `// "The Power of Love" by Celine Dion - melody only PSG arrangement
// Auto-generated from MIDI
#pragma once

#define TITLE_MUSIC_FRAMES_PER_ROW ${FRAMES_PER_ROW}
#define TITLE_MUSIC_LOOP_ROW ${loopRow}

static const u16 g_TitleMusicData[] = {\n`;

let prevMelody = -1;
for (let r = 0; r < usedRows; r++) {
    const m = melodyRows[r];

    let mVal;
    if (m > 0 && m !== prevMelody) {
        mVal = noteToPeriod(m);
    } else if (m === 0 && prevMelody > 0) {
        mVal = 1;
    } else {
        mVal = 0;
    }

    prevMelody = m;

    output += `    ${mVal},\n`;
}

output += `};\n\n#define TITLE_MUSIC_ROWS ${usedRows}\n`;

fs.writeFileSync('c:/Users/Antxiko/Documents/PuyoPuyoVS/src/title_music.h', output);
console.log('Written src/title_music.h');
