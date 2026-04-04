#!/usr/bin/env node
// build_jetos.js — Generate jetos ZX0 assets from jetos.png
// Outputs: jetos_pat.zx0, jetos_col.zx0, jetos_map.bin in MSXgl out/

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const baseDir = path.resolve(__dirname, '..');
const zx0Path = path.join(baseDir, 'MSXgl/tools/compress/ZX0/zx0.exe');
const outDir = path.join(baseDir, 'MSXgl/projects/puyopuyo/out');
const jetosImg = path.join(baseDir, 'assets/jetos.png');
const jetosJson = path.join(baseDir, 'assets/jetos.json');

// Read PNG via PHP
const phpScript = `$im = imagecreatefrompng("${jetosImg.replace(/\\/g, '/')}"); $w = imagesx($im); $h = imagesy($im); echo $w . " " . $h . "\\n"; for ($y = 0; $y < $h; $y++) { for ($x = 0; $x < $w; $x++) { $c = imagecolorat($im, $x, $y); echo (($c >> 16) & 0xFF) . "," . (($c >> 8) & 0xFF) . "," . ($c & 0xFF) . ","; } echo "\\n"; }`;

const tmpPhp = path.join(baseDir, 'assets/_jetos_read.php');
fs.writeFileSync(tmpPhp, '<?php ' + phpScript + ' ?>');
const phpResult = execSync(`C:\\php\\php.exe "${tmpPhp}"`, { encoding: 'utf8', maxBuffer: 10 * 1024 * 1024 });
fs.unlinkSync(tmpPhp);

const lines = phpResult.trim().split('\n');
const dims = lines[0].split(' ');
const imgW = parseInt(dims[0]);
const imgH = parseInt(dims[1]);
const cols = imgW / 8;
const rows = imgH / 8;
const numTiles = cols * rows;

console.log(`Reading ${jetosImg}`);
console.log(`Image: ${imgW}x${imgH}, Grid: ${cols}x${rows} = ${numTiles} tiles`);

// MSX1 palette
const MSX_PAL = [[0,0,0],[0,0,0],[33,200,66],[94,220,120],[84,85,237],[125,118,252],[212,82,77],[66,235,245],[252,85,84],[255,121,120],[212,193,84],[230,206,128],[33,176,59],[201,91,186],[204,204,204],[255,255,255]];

function nearest(r, g, b) {
    let best = 0, bd = Infinity;
    for (let c = 0; c < 16; c++) {
        const dr = r - MSX_PAL[c][0], dg = g - MSX_PAL[c][1], db = b - MSX_PAL[c][2];
        const d = dr*dr + dg*dg + db*db;
        if (d < bd) { bd = d; best = c; }
    }
    return best;
}

// Parse pixels
const pixels = [];
for (let y = 0; y < imgH; y++) {
    const vals = lines[y + 1].split(',');
    for (let x = 0; x < imgW; x++) {
        pixels.push(nearest(parseInt(vals[x*3]), parseInt(vals[x*3+1]), parseInt(vals[x*3+2])));
    }
}

// Generate patterns and colors
const patBuf = Buffer.alloc(numTiles * 8);
const colBuf = Buffer.alloc(numTiles * 8);

for (let ty = 0; ty < rows; ty++) {
    for (let tx = 0; tx < cols; tx++) {
        const ti = ty * cols + tx;
        for (let py = 0; py < 8; py++) {
            const cs = [];
            for (let px = 0; px < 8; px++)
                cs.push(pixels[(ty * 8 + py) * imgW + tx * 8 + px]);

            const cnt = new Array(16).fill(0);
            cs.forEach(c => cnt[c]++);
            let bg = cnt.indexOf(Math.max(...cnt));
            let fg = bg, sm = 0;
            for (let c = 0; c < 16; c++)
                if (c !== bg && cnt[c] > sm) { sm = cnt[c]; fg = c; }
            if (fg === bg) fg = 0;

            let pb = 0;
            for (let px = 0; px < 8; px++)
                if (cs[px] !== bg) pb |= (0x80 >> px);

            patBuf[ti * 8 + py] = pb;
            colBuf[ti * 8 + py] = (fg << 4) | bg;
        }
    }
}

// Compress patterns
const patBin = path.join(baseDir, 'assets/_jetos_pat.bin');
fs.writeFileSync(patBin, patBuf);
execSync(`"${zx0Path}" -f "${patBin}" "${path.join(outDir, 'jetos_pat.zx0')}"`);
const patZx0 = fs.readFileSync(path.join(outDir, 'jetos_pat.zx0'));
console.log(`Patterns: ${patBuf.length} -> ${patZx0.length} bytes (ZX0)`);
fs.unlinkSync(patBin);

// Compress colors
const colBin = path.join(baseDir, 'assets/_jetos_col.bin');
fs.writeFileSync(colBin, colBuf);
execSync(`"${zx0Path}" -f "${colBin}" "${path.join(outDir, 'jetos_col.zx0')}"`);
const colZx0 = fs.readFileSync(path.join(outDir, 'jetos_col.zx0'));
console.log(`Colors: ${colBuf.length} -> ${colZx0.length} bytes (ZX0)`);
fs.unlinkSync(colBin);

// Generate map from jetos.json (if exists)
if (fs.existsSync(jetosJson)) {
    const data = JSON.parse(fs.readFileSync(jetosJson, 'utf8'));
    const mapBuf = Buffer.alloc(numTiles);
    for (let i = 0; i < numTiles; i++) mapBuf[i] = data.tiles[i];
    fs.writeFileSync(path.join(outDir, 'jetos_map.bin'), mapBuf);
    console.log(`Map: ${numTiles} bytes`);
}

console.log('Done!');
