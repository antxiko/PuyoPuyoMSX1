// tileset2code.js - Convert tileset_tiled.png to MSX Screen 2 pattern+color C arrays
// Usage: node tools/tileset2code.js [tileset.png] [output.h]
// Requires PHP with GD (uses it to read PNG since Node has no native PNG support)

const fs = require('fs');
const { execSync } = require('child_process');

const path = require('path');
const baseDir = path.resolve(__dirname, '..');
const inputFile = process.argv[2] || path.join(baseDir, 'assets/tileset_tiled.png');
const colorFile = process.argv[3] || path.join(baseDir, 'color_table.bin');
const outputFile = process.argv[4] || path.join(baseDir, 'src/tileset_data.h');

// Use PHP to extract pixel data from PNG (RGB values for each pixel)
const phpScript = `
$img = imagecreatefrompng('${inputFile.replace(/\\/g, '/')}');
$w = imagesx($img); $h = imagesy($img);
echo "$w $h\\n";
for ($y = 0; $y < $h; $y++) {
    for ($x = 0; $x < $w; $x++) {
        $c = imagecolorat($img, $x, $y);
        $r = ($c >> 16) & 0xFF;
        $g = ($c >> 8) & 0xFF;
        $b = $c & 0xFF;
        echo "$r $g $b ";
    }
    echo "\\n";
}
`;

console.log(`Reading ${inputFile}...`);
const phpResult = execSync(`C:\\php\\php.exe -r "${phpScript.replace(/"/g, '\\"').replace(/\n/g, ' ')}"`, { encoding: 'utf8', maxBuffer: 10 * 1024 * 1024 });

const lines = phpResult.trim().split('\n');
const [imgW, imgH] = lines[0].split(' ').map(Number);
console.log(`Image: ${imgW}x${imgH}`);

// Parse pixels
const pixels = [];
for (let y = 0; y < imgH; y++) {
    pixels[y] = [];
    const vals = lines[y + 1].trim().split(/\s+/).map(Number);
    for (let x = 0; x < imgW; x++) {
        pixels[y][x] = [vals[x * 3], vals[x * 3 + 1], vals[x * 3 + 2]];
    }
}

// MSX1 palette
const msxPalette = [
    [0, 0, 0],       // 0 transparent
    [0, 0, 0],       // 1 black
    [36, 219, 70],   // 2 medium green
    [109, 235, 143], // 3 light green
    [77, 80, 230],   // 4 dark blue
    [118, 114, 255], // 5 light blue
    [200, 71, 72],   // 6 dark red
    [84, 243, 242],  // 7 cyan
    [232, 91, 87],   // 8 medium red
    [255, 130, 128], // 9 light red
    [217, 200, 82],  // 10 dark yellow
    [234, 212, 136], // 11 light yellow
    [32, 170, 60],   // 12 dark green
    [195, 91, 183],  // 13 magenta
    [203, 203, 203], // 14 gray
    [255, 255, 255]  // 15 white
];

// Find closest MSX color for an RGB value (skip color 0 = transparent)
function closestMSXColor(r, g, b) {
    let bestIdx = 1, bestDist = Infinity;
    for (let i = 1; i < 16; i++) {
        const dr = r - msxPalette[i][0];
        const dg = g - msxPalette[i][1];
        const db = b - msxPalette[i][2];
        const dist = dr * dr + dg * dg + db * db;
        if (dist < bestDist) { bestDist = dist; bestIdx = i; }
    }
    return bestIdx;
}

// Tileset: 32x8 grid of 8x8 tiles = 256 tiles (matches MSX Screen 2 VRAM layout)
const COLS = imgW / 8;
const ROWS = imgH / 8;
const numTiles = COLS * ROWS;
console.log(`Grid: ${COLS}x${ROWS} = ${numTiles} tiles`);

// All colors derived from PNG pixels

// For each tile, extract 8 rows of pattern + color
const patterns = []; // [tile][8 bytes]
const colors = [];   // [tile][8 bytes]

for (let tileIdx = 0; tileIdx < numTiles; tileIdx++) {
    const tx = (tileIdx % COLS) * 8;
    const ty = Math.floor(tileIdx / COLS) * 8;
    const pat = [];
    const col = [];

    for (let row = 0; row < 8; row++) {
        let fg, bg;

        {
            // Derive colors from PNG pixels (for tiles not in color table)
            const rowColors = [];
            for (let x = 0; x < 8; x++) {
                const [r, g, b] = pixels[ty + row][tx + x];
                rowColors.push(closestMSXColor(r, g, b));
            }
            const freq = {};
            rowColors.forEach(c => { freq[c] = (freq[c] || 0) + 1; });
            const sorted = Object.entries(freq).sort((a, b) => b[1] - a[1]);
            fg = parseInt(sorted[0][0]);
            bg = sorted.length > 1 ? parseInt(sorted[1][0]) : fg;
        }

        // Build pattern byte: 1=fg, 0=bg
        // Match each pixel to fg or bg using RGB distance
        let byte = 0;
        const fgRGB = msxPalette[fg];
        const bgRGB = msxPalette[bg];
        for (let x = 0; x < 8; x++) {
            const [r, g, b] = pixels[ty + row][tx + x];
            const dfg = (r-fgRGB[0])**2 + (g-fgRGB[1])**2 + (b-fgRGB[2])**2;
            const dbg = (r-bgRGB[0])**2 + (g-bgRGB[1])**2 + (b-bgRGB[2])**2;
            if (dfg <= dbg) byte |= (1 << (7 - x));
        }

        pat.push(byte);
        col.push((fg << 4) | bg);
    }

    patterns.push(pat);
    colors.push(col);
}

// Write raw binary, compress with ZX0, generate C header with compressed data
const zx0Path = path.join(baseDir, 'MSXgl/tools/compress/ZX0/zx0.exe');
const tmpDir = path.join(baseDir, 'assets');

// Write pattern binary (2048 bytes = 256 tiles x 8 bytes)
const patBuf = Buffer.alloc(2048);
for (let i = 0; i < numTiles; i++)
    for (let r = 0; r < 8; r++)
        patBuf[i * 8 + r] = patterns[i][r];
const patBinFile = path.join(tmpDir, '_tileset_pat.bin');
fs.writeFileSync(patBinFile, patBuf);

// Write color binary (2048 bytes)
const colBuf = Buffer.alloc(2048);
for (let i = 0; i < numTiles; i++)
    for (let r = 0; r < 8; r++)
        colBuf[i * 8 + r] = colors[i][r];
const colBinFile = path.join(tmpDir, '_tileset_col.bin');
fs.writeFileSync(colBinFile, colBuf);

// Compress with ZX0
const patZx0File = patBinFile + '.zx0';
const colZx0File = colBinFile + '.zx0';
execSync(`"${zx0Path}" -f "${patBinFile}" "${patZx0File}"`, { encoding: 'utf8' });
execSync(`"${zx0Path}" -f "${colBinFile}" "${colZx0File}"`, { encoding: 'utf8' });

const patZx0 = fs.readFileSync(patZx0File);
const colZx0 = fs.readFileSync(colZx0File);

console.log(`Pattern: 2048 -> ${patZx0.length} bytes (ZX0)`);
console.log(`Color:   2048 -> ${colZx0.length} bytes (ZX0)`);

// Generate C header
function buf2cArray(buf) {
    const bytes = [];
    for (let i = 0; i < buf.length; i++)
        bytes.push('0x' + buf[i].toString(16).toUpperCase().padStart(2, '0'));
    const lines = [];
    for (let i = 0; i < bytes.length; i += 16)
        lines.push('    ' + bytes.slice(i, i + 16).join(', '));
    return lines.join(',\n');
}

let output = `// Auto-generated from ${path.basename(inputFile)}\n`;
output += `// ${numTiles} tiles, ZX0 compressed pattern + color data\n`;
output += `#pragma once\n\n`;
output += `static const u8 g_TilesetPat_Zx0[] = {\n${buf2cArray(patZx0)}\n};\n\n`;
output += `static const u8 g_TilesetCol_Zx0[] = {\n${buf2cArray(colZx0)}\n};\n`;

fs.writeFileSync(outputFile, output);

// Cleanup temp files
fs.unlinkSync(patBinFile);
fs.unlinkSync(colBinFile);
fs.unlinkSync(patZx0File);
fs.unlinkSync(colZx0File);

console.log(`Written ${outputFile} (${fs.statSync(outputFile).size} bytes)`);
