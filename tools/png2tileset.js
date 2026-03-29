// png2tileset.js — Convert a PNG image (MSX colors, 256x192) to tileset + map
// Usage: node tools/png2tileset.js <input.png> [tileset_out.png] [map_out.json]
// Output: unique tiles as tileset PNG (32xN grid) + map JSON for the editor

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const baseDir = path.resolve(__dirname, '..');
const inputFile = process.argv[2];
if (!inputFile) { console.log('Usage: node tools/png2tileset.js <input.png> [tileset.png] [map.json]'); process.exit(1); }
const tilesetOut = process.argv[3] || inputFile.replace('.png', '_tileset.png');
const mapOut = process.argv[4] || inputFile.replace('.png', '_map.json');

// Read PNG via PHP
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
const phpResult = execSync(`C:\\php\\php.exe -r "${phpScript.replace(/"/g, '\\"').replace(/\n/g, ' ')}"`, { encoding: 'utf8', maxBuffer: 50 * 1024 * 1024 });

const lines = phpResult.trim().split('\n');
const [imgW, imgH] = lines[0].split(' ').map(Number);
console.log(`Image: ${imgW}x${imgH}`);

if (imgW % 8 !== 0 || imgH % 8 !== 0) {
    console.error('ERROR: Image dimensions must be multiples of 8');
    process.exit(1);
}

// Parse pixels
const pixels = [];
for (let y = 0; y < imgH; y++) {
    pixels[y] = [];
    const vals = lines[y + 1].trim().split(/\s+/).map(Number);
    for (let x = 0; x < imgW; x++) {
        pixels[y][x] = [vals[x * 3], vals[x * 3 + 1], vals[x * 3 + 2]];
    }
}

const COLS = imgW / 8;
const ROWS = imgH / 8;
console.log(`Grid: ${COLS}x${ROWS} = ${COLS * ROWS} tile positions`);

// Extract all 8x8 tiles and find unique ones
const tileHashes = new Map(); // hash -> tile index
const uniqueTiles = [];       // array of { pixels: [8][8][3] }
const tileMap = [];            // [ROWS * COLS] tile indices

for (let ty = 0; ty < ROWS; ty++) {
    for (let tx = 0; tx < COLS; tx++) {
        // Extract 8x8 tile
        const tile = [];
        const hashParts = [];
        for (let y = 0; y < 8; y++) {
            tile[y] = [];
            for (let x = 0; x < 8; x++) {
                const px = pixels[ty * 8 + y][tx * 8 + x];
                tile[y][x] = px;
                hashParts.push(px[0], px[1], px[2]);
            }
        }
        const hash = hashParts.join(',');

        let idx;
        if (tileHashes.has(hash)) {
            idx = tileHashes.get(hash);
        } else {
            idx = uniqueTiles.length;
            tileHashes.set(hash, idx);
            uniqueTiles.push(tile);
        }
        tileMap.push(idx);
    }
}

console.log(`Unique tiles: ${uniqueTiles.length} / ${COLS * ROWS} total`);
if (uniqueTiles.length > 256) {
    console.warn(`WARNING: ${uniqueTiles.length} unique tiles exceeds MSX limit of 256!`);
}

// Generate tileset PNG (32 columns, ceil(uniqueTiles/32) rows)
const TSET_COLS = 32;
const TSET_ROWS = Math.max(Math.ceil(uniqueTiles.length / TSET_COLS), 1);
const tsetW = TSET_COLS * 8;
const tsetH = TSET_ROWS * 8;

console.log(`Tileset: ${tsetW}x${tsetH} (${TSET_COLS}x${TSET_ROWS} grid)`);

// Build pixel data for tileset
let pixelData = `${tsetW} ${tsetH}\n`;
for (let y = 0; y < tsetH; y++) {
    for (let x = 0; x < tsetW; x++) {
        const tileIdx = Math.floor(y / 8) * TSET_COLS + Math.floor(x / 8);
        const px = x % 8;
        const py = y % 8;
        if (tileIdx < uniqueTiles.length) {
            const c = uniqueTiles[tileIdx][py][px];
            pixelData += `${c[0]} ${c[1]} ${c[2]} `;
        } else {
            pixelData += '0 0 0 ';
        }
    }
    pixelData += '\n';
}

// Write tileset PNG via PHP
const tmpFile = path.join(baseDir, 'assets/_png2tileset_tmp.txt');
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
imagepng($img, '${tilesetOut.replace(/\\/g, '/')}');
echo "Done";
`;
execSync(`C:\\php\\php.exe -r "${writeScript.replace(/"/g, '\\"').replace(/\n/g, ' ')}"`, { encoding: 'utf8' });
fs.unlinkSync(tmpFile);

console.log(`Tileset: ${tilesetOut}`);

// Write map JSON (editor-compatible format)
const mapData = {
    width: COLS,
    height: ROWS,
    tiles: tileMap
};
fs.writeFileSync(mapOut, JSON.stringify(mapData));
console.log(`Map: ${mapOut} (${COLS}x${ROWS}, ${tileMap.length} entries)`);

console.log(`\nDone! ${uniqueTiles.length} unique tiles extracted.`);
if (uniqueTiles.length <= 256) {
    console.log('Fits in MSX Screen 2 (max 256 tiles).');
} else {
    console.log(`EXCEEDS MSX limit by ${uniqueTiles.length - 256} tiles — need to reduce.`);
}
