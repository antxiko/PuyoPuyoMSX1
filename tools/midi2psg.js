// MIDI to PSG music data converter for MSX1
// Generates note events with proper durations
const fs = require('fs');
const buf = fs.readFileSync('C:/Users/Antxiko/Documents/PuyoPuyoVS/Alice Cooper - Poison.mid');

let pos = 0;
function readU32() { const v = buf.readUInt32BE(pos); pos += 4; return v; }
function readU16() { const v = buf.readUInt16BE(pos); pos += 2; return v; }
function readVarLen() { let v = 0; while (true) { const b = buf[pos++]; v = (v << 7) | (b & 0x7F); if (!(b & 0x80)) break; } return v; }

pos += 4; readU32(); readU16();
const numTracks = readU16(); const ticksPerBeat = readU16();

const allTracks = [];
for (let t = 0; t < numTracks; t++) {
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
    pos = trkEnd;
    allTracks.push(events);
}

const PSG_CLOCK = 1789772.5;
function noteToPeriod(midiNote) {
    const freq = 440.0 * Math.pow(2, (midiNote - 69) / 12.0);
    let period = Math.round(PSG_CLOCK / (16.0 * freq));
    if (period < 1) period = 1;
    if (period > 4095) period = 4095;
    return period;
}

// Build channel data with note-on and note-off tracking
const START_TICK = 2880;
const DURATION_TICKS = 120 * 120 * 2; // ~2 minutes
const END_TICK = START_TICK + DURATION_TICKS;
const FRAMES_PER_ROW = 5;
const ticksPerRow = 24;
const MAX_ROWS = Math.ceil(DURATION_TICKS / ticksPerRow);

function buildChannelWithDuration(events, startTick, endTick, maxRows) {
    // For each row: 0 = silence, >0 = MIDI note playing
    // We track note-on/off properly
    const rows = new Array(maxRows).fill(0); // MIDI note number, 0 = off

    // Build timeline: for each note-on find matching note-off
    const ons = events.filter(e => e.type === 'on' && e.tick >= startTick && e.tick < endTick);

    for (const on of ons) {
        const startRow = Math.floor((on.tick - startTick) / ticksPerRow);

        // Find note-off for this note
        const off = events.find(e => e.type === 'off' && e.note === on.note && e.tick > on.tick && e.tick < endTick);
        const endRow = off ? Math.floor((off.tick - startTick) / ticksPerRow) : startRow + 4;

        // Fill rows with this note (but don't exceed a reasonable duration)
        const maxDur = Math.min(endRow, startRow + 20); // cap at 20 rows
        for (let r = startRow; r < maxDur && r < maxRows; r++) {
            if (rows[r] === 0) { // Don't overwrite existing notes
                rows[r] = on.note;
            }
        }
    }

    return rows;
}

// Channel A = vocal melody (Track 5, chan 3) + secondary guitar (Track 3, chan 1)
// Channel B = main guitar riff (Track 4, chan 2)
// Channel C = bass (Track 2, chan 0)
const melodyRows = buildChannelWithDuration(allTracks[5] || [], START_TICK, END_TICK, MAX_ROWS);
const guitar2Rows = buildChannelWithDuration(allTracks[3] || [], START_TICK, END_TICK, MAX_ROWS);
const guitarRows = buildChannelWithDuration(allTracks[4] || [], START_TICK, END_TICK, MAX_ROWS);
const bassRows = buildChannelWithDuration(allTracks[2] || [], START_TICK, END_TICK, MAX_ROWS);

// Merge channels
const chanA = new Array(MAX_ROWS).fill(0);
const chanB = new Array(MAX_ROWS).fill(0);
const chanC = new Array(MAX_ROWS).fill(0);

for (let r = 0; r < MAX_ROWS; r++) {
    chanA[r] = melodyRows[r] || guitar2Rows[r] || 0;
    chanB[r] = guitarRows[r] || 0;
    chanC[r] = bassRows[r] || 0;
}

// Trim trailing silence
let usedRows = 0;
for (let r = MAX_ROWS - 1; r >= 0; r--) {
    if (chanA[r] || chanB[r] || chanC[r]) { usedRows = r + 1; break; }
}
usedRows = Math.ceil(usedRows / 4) * 4;

// Find loop point
let loopRow = 0;
for (let r = 0; r < usedRows; r++) {
    if (chanC[r] > 0 && chanB[r] > 0) { loopRow = r; break; }
}

console.log(`Used rows: ${usedRows}, Loop: ${loopRow}`);

// Collect unique notes
const allNotes = new Set();
for (let r = 0; r < usedRows; r++) {
    if (chanA[r]) allNotes.add(chanA[r]);
    if (chanB[r]) allNotes.add(chanB[r]);
    if (chanC[r]) allNotes.add(chanC[r]);
}
const noteList = Array.from(allNotes).sort((a, b) => a - b);
const noteToIndex = {};
noteList.forEach((n, i) => { noteToIndex[n] = i + 1; });

console.log(`Unique notes: ${noteList.length}`);

// Now encode with state changes only
// For each row + channel: encode the note INDEX if it CHANGED from previous row, else 0 (sustain)
// Use 255 for note-off (silence)
const encA = new Array(usedRows).fill(0);
const encB = new Array(usedRows).fill(0);
const encC = new Array(usedRows).fill(0);

let prevA = 0, prevB = 0, prevC = 0;
for (let r = 0; r < usedRows; r++) {
    if (chanA[r] !== prevA) {
        encA[r] = chanA[r] ? noteToIndex[chanA[r]] : 255;
        prevA = chanA[r];
    }
    if (chanB[r] !== prevB) {
        encB[r] = chanB[r] ? noteToIndex[chanB[r]] : 255;
        prevB = chanB[r];
    }
    if (chanC[r] !== prevC) {
        encC[r] = chanC[r] ? noteToIndex[chanC[r]] : 255;
        prevC = chanC[r];
    }
}

// Count active
let actA=0,actB=0,actC=0;
for(let r=0;r<usedRows;r++){if(encA[r])actA++;if(encB[r])actB++;if(encC[r])actC++;}
console.log(`Events - A:${actA} B:${actB} C:${actC}`);

// Generate header
let output = `// Music: "Poison" by Alice Cooper - PSG 3-channel
// Auto-generated from MIDI
#pragma once

#define MUSIC_ROWS ${usedRows}
#define MUSIC_FRAMES_PER_ROW ${FRAMES_PER_ROW}
#define MUSIC_LOOP_ROW ${loopRow}
#define MUSIC_NOTE_COUNT ${noteList.length}

static const u16 g_MusicPeriods[${noteList.length + 1}] = {
    0,
`;
for (let i = 0; i < noteList.length; i++) {
    const p = noteToPeriod(noteList[i]);
    const noteName = ['C','C#','D','D#','E','F','F#','G','G#','A','A#','B'][noteList[i]%12];
    const octave = Math.floor(noteList[i]/12)-1;
    output += `    ${p}, // ${i+1}: ${noteName}${octave}\n`;
}
output += `};\n\n`;

output += `// Row data: 3 bytes/row (chA, chB, chC)\n`;
output += `// 0=sustain, 255=note off, 1-${noteList.length}=note index\n`;
output += `static const u8 g_MusicRows[] = {\n`;

let dataBytes = 0;
for (let r = 0; r < usedRows; r++) {
    output += `    ${encA[r]}, ${encB[r]}, ${encC[r]},`;
    if (r % 20 === 0) output += ` // row ${r}`;
    output += '\n';
    dataBytes += 3;
}
output += `};\n`;

console.log(`Data: ${dataBytes} bytes + ${(noteList.length+1)*2} bytes periods = ${dataBytes+(noteList.length+1)*2} total`);

fs.writeFileSync('C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/projects/puyopuyo/music_data.h', output);
console.log('Written music_data.h');
