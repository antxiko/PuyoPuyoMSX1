// export_tileset.js - Export full tileset (including connection patterns) to PNG
// Reads the existing tileset PNG and adds the programmatically generated connection patterns
// Output: 256x64 PNG (32 columns x 8 rows = 256 tiles of 8x8)
// Usage: node tools/export_tileset.js

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const baseDir = path.resolve(__dirname, '..');
const inputFile = path.join(baseDir, 'assets/tileset_tiled.png');
const outputFile = path.join(baseDir, 'assets/tileset_tiled.png');

// MSX1 palette (RGB)
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

// MSX color constants (matching MSXgl)
const COLOR_BLACK = 1;
const COLOR_MEDIUM_GREEN = 2;
const COLOR_LIGHT_BLUE = 5;
const COLOR_MEDIUM_RED = 8;
const COLOR_DARK_YELLOW = 10;
const COLOR_DARK_GREEN = 12;
const COLOR_MAGENTA = 13;
const COLOR_GRAY = 14;
const COLOR_WHITE = 15;

function COLOR_MERGE(fg, bg) { return (fg << 4) | bg; }

// Pattern data from puyopuyo.c g_PuyoPat[6][4][8]
const g_PuyoPat = [
    // RED
    [
        [0x07, 0x1F, 0x3F, 0x30, 0x38, 0x24, 0x26, 0x1C],
        [0xE0, 0xF8, 0xFC, 0x0C, 0x1C, 0x24, 0x64, 0x38],
        [0xFF, 0xFF, 0xFF, 0x7F, 0x7F, 0x3F, 0x1F, 0x03],
        [0xFF, 0xFF, 0xFF, 0xFE, 0xFE, 0xFC, 0xF8, 0xC0],
    ],
    // GREEN
    [
        [0x07, 0x3F, 0x7F, 0x0C, 0x1E, 0x22, 0x22, 0x22],
        [0xE0, 0xFC, 0xFE, 0x30, 0x78, 0x44, 0x44, 0x44],
        [0x1C, 0xFF, 0xFF, 0x7F, 0x7F, 0x3F, 0x0F, 0x03],
        [0x38, 0xFF, 0xFF, 0xFE, 0xFE, 0xFC, 0xF8, 0xC0],
    ],
    // BLUE
    [
        [0x07, 0x1F, 0x3F, 0x7F, 0x1C, 0x22, 0x14, 0x1C],
        [0xE0, 0xF8, 0xFC, 0xFE, 0x38, 0x44, 0x28, 0x38],
        [0xFF, 0xFF, 0xFF, 0x7F, 0x3F, 0x1F, 0x0F, 0x03],
        [0xFF, 0xFF, 0xFF, 0xFE, 0xFC, 0xF8, 0xF0, 0xC0],
    ],
    // YELLOW
    [
        [0x07, 0x1F, 0x7F, 0x7F, 0x1C, 0x22, 0x22, 0x22],
        [0xE0, 0xF8, 0xFE, 0xFE, 0x38, 0x44, 0x44, 0x44],
        [0x1C, 0xFF, 0xFF, 0x7F, 0x7F, 0x1F, 0x0F, 0x03],
        [0x38, 0xFF, 0xFF, 0xFE, 0xFC, 0xFC, 0xF0, 0xC0],
    ],
    // PURPLE
    [
        [0x0F, 0x3F, 0x3F, 0x7F, 0x18, 0x24, 0x22, 0x1C],
        [0xF0, 0xFC, 0xFC, 0xFE, 0x18, 0x24, 0x44, 0x38],
        [0xFF, 0xFF, 0xFF, 0xFF, 0x7F, 0x3F, 0x3F, 0x0F],
        [0xFF, 0xFF, 0xFF, 0xFF, 0xFE, 0xFC, 0xFC, 0xF0],
    ],
    // GARBAGE
    [
        [0x0F, 0x3B, 0x7F, 0xE7, 0xDB, 0xDA, 0xCB, 0xC3],
        [0xF0, 0xFC, 0xFE, 0xE7, 0xDB, 0xDB, 0xCB, 0xC3],
        [0xE7, 0xFF, 0xFF, 0xBE, 0xFF, 0x77, 0x3F, 0x1E],
        [0xE7, 0xFD, 0xFF, 0xFF, 0xFF, 0xF6, 0xFC, 0xF8],
    ],
];

// Color data from puyopuyo.c g_PuyoCol[6][4][8]
const RC = COLOR_MERGE(COLOR_MEDIUM_RED, COLOR_BLACK);
const RE = COLOR_MERGE(COLOR_WHITE, COLOR_MEDIUM_RED);
const GC = COLOR_MERGE(COLOR_DARK_GREEN, COLOR_BLACK);
const GE = COLOR_MERGE(COLOR_WHITE, COLOR_DARK_GREEN);
const BC = COLOR_MERGE(COLOR_LIGHT_BLUE, COLOR_BLACK);
const BE = COLOR_MERGE(COLOR_WHITE, COLOR_LIGHT_BLUE);
const YC = COLOR_MERGE(COLOR_DARK_YELLOW, COLOR_BLACK);
const YE = COLOR_MERGE(COLOR_WHITE, COLOR_DARK_YELLOW);
const MC = COLOR_MERGE(COLOR_MAGENTA, COLOR_BLACK);
const ME = COLOR_MERGE(COLOR_WHITE, COLOR_MAGENTA);
const XC = COLOR_MERGE(COLOR_GRAY, COLOR_BLACK);

const g_PuyoCol = [
    // RED
    [
        [RC, RC, RC, RE, RE, RE, RE, RE],
        [RC, RC, RC, RE, RE, RE, RE, RE],
        [RC, RC, RC, RC, RC, RC, RC, RC],
        [RC, RC, RC, RC, RC, RC, RC, RC],
    ],
    // GREEN
    [
        [GC, GC, GC, GE, GE, GE, GE, GE],
        [GC, GC, GC, GE, GE, GE, GE, GE],
        [GE, GC, GC, GC, GC, GC, GC, GC],
        [GE, GC, GC, GC, GC, GC, GC, GC],
    ],
    // BLUE
    [
        [BC, BC, BC, BC, BE, BE, BE, BE],
        [BC, BC, BC, BC, BE, BE, BE, BE],
        [BC, BC, BC, BC, BC, BC, BC, BC],
        [BC, BC, BC, BC, BC, BC, BC, BC],
    ],
    // YELLOW
    [
        [YC, YC, YC, YC, YE, YE, YE, YE],
        [YC, YC, YC, YC, YE, YE, YE, YE],
        [YE, YC, YC, YC, YC, YC, YC, YC],
        [YE, YC, YC, YC, YC, YC, YC, YC],
    ],
    // PURPLE
    [
        [MC, MC, MC, MC, ME, ME, ME, ME],
        [MC, MC, MC, MC, ME, ME, ME, ME],
        [MC, MC, MC, MC, MC, MC, MC, MC],
        [MC, MC, MC, MC, MC, MC, MC, MC],
    ],
    // GARBAGE
    [
        [XC, XC, XC, XC, XC, XC, XC, XC],
        [XC, XC, XC, XC, XC, XC, XC, XC],
        [XC, XC, XC, XC, XC, XC, XC, XC],
        [XC, XC, XC, XC, XC, XC, XC, XC],
    ],
];

// Generate connection patterns (same logic as Game_InitConnPatterns)
function generateConnPatterns() {
    const connPat = []; // [36][8] patterns
    const connCol = []; // [36][8] colors

    for (let ci = 0; ci < 6; ci++) {
        // Variant 0: Q0 (TL) top-filled
        let pat = [...g_PuyoPat[ci][0]];
        pat[0] = 0xFF; pat[1] = 0xFF; pat[2] = 0xFF;
        connPat.push([...pat]);
        connCol.push([...g_PuyoCol[ci][0]]);

        // Variant 1: Q1 (TR) top-filled
        pat = [...g_PuyoPat[ci][1]];
        pat[0] = 0xFF; pat[1] = 0xFF; pat[2] = 0xFF;
        connPat.push([...pat]);
        connCol.push([...g_PuyoCol[ci][1]]);

        // Variant 2: Q2 (BL) bottom-filled
        pat = [...g_PuyoPat[ci][2]];
        pat[5] = 0xFF; pat[6] = 0xFF; pat[7] = 0xFF;
        connPat.push([...pat]);
        connCol.push([...g_PuyoCol[ci][2]]);

        // Variant 3: Q2 (BL) bottom-filled + left edge
        pat = [...g_PuyoPat[ci][2]];
        pat[5] = 0xFF; pat[6] = 0xFF; pat[7] = 0xFF;
        pat[3] |= 0x80; pat[4] |= 0x80;
        connPat.push([...pat]);
        connCol.push([...g_PuyoCol[ci][2]]);

        // Variant 4: Q3 (BR) bottom-filled
        pat = [...g_PuyoPat[ci][3]];
        pat[5] = 0xFF; pat[6] = 0xFF; pat[7] = 0xFF;
        connPat.push([...pat]);
        connCol.push([...g_PuyoCol[ci][3]]);

        // Variant 5: Q3 (BR) bottom-filled + right edge
        pat = [...g_PuyoPat[ci][3]];
        pat[5] = 0xFF; pat[6] = 0xFF; pat[7] = 0xFF;
        pat[3] |= 0x01; pat[4] |= 0x01;
        connPat.push([...pat]);
        connCol.push([...g_PuyoCol[ci][3]]);
    }

    return { connPat, connCol };
}

// Read existing PNG pixels
console.log(`Reading ${inputFile}...`);
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
const phpResult = execSync(`C:\\php\\php.exe -r "${phpScript.replace(/"/g, '\\"').replace(/\n/g, ' ')}"`, { encoding: 'utf8', maxBuffer: 10 * 1024 * 1024 });

const lines = phpResult.trim().split('\n');
const [srcW, srcH] = lines[0].split(' ').map(Number);
console.log(`Source: ${srcW}x${srcH}`);

// Parse source pixels
const srcPixels = [];
for (let y = 0; y < srcH; y++) {
    srcPixels[y] = [];
    const vals = lines[y + 1].trim().split(/\s+/).map(Number);
    for (let x = 0; x < srcW; x++) {
        srcPixels[y][x] = [vals[x * 3], vals[x * 3 + 1], vals[x * 3 + 2]];
    }
}

// Create output image: 256x64 (32 cols x 8 rows of 8x8 tiles)
const outW = 256, outH = 64;
const outPixels = [];
for (let y = 0; y < outH; y++) {
    outPixels[y] = [];
    for (let x = 0; x < outW; x++) {
        // Copy from source if within bounds, otherwise black
        if (y < srcH && x < srcW) {
            outPixels[y][x] = srcPixels[y][x];
        } else {
            outPixels[y][x] = [0, 0, 0];
        }
    }
}

// Render connection patterns at indices 61-96
const { connPat, connCol } = generateConnPatterns();
const PAT_CONN_BASE = 61;

for (let i = 0; i < 36; i++) {
    const tileIdx = PAT_CONN_BASE + i;
    const tileX = (tileIdx % 32) * 8;
    const tileY = Math.floor(tileIdx / 32) * 8;

    for (let row = 0; row < 8; row++) {
        const patByte = connPat[i][row];
        const colByte = connCol[i][row];
        const fg = (colByte >> 4) & 0x0F;
        const bg = colByte & 0x0F;
        const fgRGB = msxPalette[fg];
        const bgRGB = msxPalette[bg];

        for (let bit = 0; bit < 8; bit++) {
            const isSet = (patByte >> (7 - bit)) & 1;
            outPixels[tileY + row][tileX + bit] = isSet ? fgRGB : bgRGB;
        }
    }
}

// Write output PNG using PHP
console.log(`Writing ${outputFile} (${outW}x${outH})...`);

let pixelData = `${outW} ${outH}\n`;
for (let y = 0; y < outH; y++) {
    for (let x = 0; x < outW; x++) {
        const [r, g, b] = outPixels[y][x];
        pixelData += `${r} ${g} ${b} `;
    }
    pixelData += '\n';
}

const tmpFile = path.join(baseDir, 'assets/_pixel_data.tmp');
fs.writeFileSync(tmpFile, pixelData);

const writeScript = `
$lines = file('${tmpFile.replace(/\\/g, '/')}');
list($w, $h) = explode(' ', trim($lines[0]));
$img = imagecreatetruecolor((int)$w, (int)$h);
for ($y = 0; $y < $h; $y++) {
    $vals = preg_split('/\\s+/', trim($lines[$y + 1]));
    for ($x = 0; $x < $w; $x++) {
        $r = (int)$vals[$x * 3];
        $g = (int)$vals[$x * 3 + 1];
        $b = (int)$vals[$x * 3 + 2];
        imagesetpixel($img, $x, $y, imagecolorallocate($img, $r, $g, $b));
    }
}
imagepng($img, '${outputFile.replace(/\\/g, '/')}');
echo "Done";
`;

execSync(`C:\\php\\php.exe -r "${writeScript.replace(/"/g, '\\"').replace(/\n/g, ' ')}"`, { encoding: 'utf8' });
fs.unlinkSync(tmpFile);

console.log(`Exported ${outW}x${outH} tileset with connection patterns at indices ${PAT_CONN_BASE}-${PAT_CONN_BASE + 35}`);
