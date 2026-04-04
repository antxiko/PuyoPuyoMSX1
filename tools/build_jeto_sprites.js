#!/usr/bin/env node
// build_jeto_sprites.js — Generate sprite data for each jeto
// Each jetox.png is 96x32 = 3 poses of 32x32 pixels
// Each pose = 4 sprites of 16x16 (TL, TR, BL, BR)
// MSX1 16x16 sprite format: 32 bytes per sprite (left 8x16 + right 8x16)
// Output per jeto: 3 poses × 4 sprites × 32 bytes = 384 bytes → ZX0

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const baseDir = path.resolve(__dirname, '..');
const zx0Path = path.join(baseDir, 'MSXgl/tools/compress/ZX0/zx0.exe');
const outDir = path.join(baseDir, 'MSXgl/projects/puyopuyo/out');

const MSX_PAL = [[0,0,0],[0,0,0],[33,200,66],[94,220,120],[84,85,237],[125,118,252],[212,82,77],[66,235,245],[252,85,84],[255,121,120],[212,193,84],[230,206,128],[33,176,59],[201,91,186],[204,204,204],[255,255,255]];

function nearest(r, g, b) {
    // For sprites: skip color 0 (transparent), start at 1
    // Black pixels map to color 1 (black, visible in sprites)
    let best = 1, bd = Infinity;
    for (let c = 1; c < 16; c++) {
        const dr = r - MSX_PAL[c][0], dg = g - MSX_PAL[c][1], db = b - MSX_PAL[c][2];
        const d = dr*dr + dg*dg + db*db;
        if (d < bd) { bd = d; best = c; }
    }
    return best;
}

function readPng(filePath) {
    const tmpPhp = path.join(baseDir, 'assets/_tmp_read.php');
    const phpCode = `<?php $im = imagecreatefrompng("${filePath.replace(/\\/g, '/')}"); $w = imagesx($im); $h = imagesy($im); echo $w . " " . $h . "\\n"; for ($y = 0; $y < $h; $y++) { for ($x = 0; $x < $w; $x++) { $c = imagecolorat($im, $x, $y); echo (($c >> 16) & 0xFF) . "," . (($c >> 8) & 0xFF) . "," . ($c & 0xFF) . ","; } echo "\\n"; } ?>`;
    fs.writeFileSync(tmpPhp, phpCode);
    const result = execSync(`C:\\php\\php.exe "${tmpPhp}"`, { encoding: 'utf8', maxBuffer: 10 * 1024 * 1024 });
    fs.unlinkSync(tmpPhp);
    const lines = result.trim().split('\n');
    const dims = lines[0].split(' ');
    const w = parseInt(dims[0]), h = parseInt(dims[1]);
    const pixels = [];
    for (let y = 0; y < h; y++) {
        const vals = lines[y + 1].split(',');
        for (let x = 0; x < w; x++)
            pixels.push(nearest(parseInt(vals[x*3]), parseInt(vals[x*3+1]), parseInt(vals[x*3+2])));
    }
    return { w, h, pixels };
}

// MSX 16x16 sprite format: 32 bytes
// First 16 bytes = left column (8 pixels wide, 16 rows)
// Next 16 bytes = right column (8 pixels wide, 16 rows)
function extractSprite16(pixels, imgW, sx, sy, bgColor) {
    const buf = Buffer.alloc(32);
    // Left 8x16
    for (let y = 0; y < 16; y++) {
        let byte = 0;
        for (let x = 0; x < 8; x++) {
            const c = pixels[(sy + y) * imgW + sx + x];
            if (c !== bgColor) byte |= (0x80 >> x);
        }
        buf[y] = byte;
    }
    // Right 8x16
    for (let y = 0; y < 16; y++) {
        let byte = 0;
        for (let x = 0; x < 8; x++) {
            const c = pixels[(sy + y) * imgW + sx + 8 + x];
            if (c !== bgColor) byte |= (0x80 >> x);
        }
        buf[16 + y] = byte;
    }
    return buf;
}

// Find most common color for sprite (non-background)
function findSpriteColor(pixels, imgW, sx, sy, bgColor) {
    const counts = new Array(16).fill(0);
    for (let y = 0; y < 16; y++)
        for (let x = 0; x < 16; x++) {
            const c = pixels[(sy + y) * imgW + sx + x];
            if (c !== bgColor) counts[c]++;
        }
    let best = 1, bestCount = 0;
    for (let c = 1; c < 16; c++)
        if (counts[c] > bestCount) { bestCount = counts[c]; best = c; }
    return best;
}

console.log('=== Building jeto sprites ===\n');

for (let j = 1; j <= 8; j++) {
    const file = path.join(baseDir, `assets/jetos/jeto${j}.png`);
    if (!fs.existsSync(file)) { console.log(`jeto${j}.png not found, skipping`); continue; }

    const img = readPng(file);
    console.log(`jeto${j}.png: ${img.w}x${img.h}`);

    // Background color = top-left pixel
    const bgColor = img.pixels[0];

    // 3 poses × 4 sprites × 32 bytes patterns + 3 poses × 4 colors
    const patBuf = Buffer.alloc(3 * 4 * 32); // 384 bytes
    const colBuf = Buffer.alloc(3 * 4);       // 12 bytes

    for (let pose = 0; pose < 3; pose++) {
        const px = pose * 32; // each pose is 32px wide
        // 4 sprites: TL(0,0) TR(16,0) BL(0,16) BR(16,16)
        const offsets = [[0,0],[16,0],[0,16],[16,16]];
        for (let s = 0; s < 4; s++) {
            const sx = px + offsets[s][0];
            const sy = offsets[s][1];
            const spr = extractSprite16(img.pixels, img.w, sx, sy, bgColor);
            spr.copy(patBuf, (pose * 4 + s) * 32);
            colBuf[pose * 4 + s] = findSpriteColor(img.pixels, img.w, sx, sy, bgColor);
        }
    }

    // Combine patterns + colors
    const combined = Buffer.concat([patBuf, colBuf]); // 396 bytes

    // Compress
    const binFile = path.join(baseDir, `assets/_jeto${j}_spr.bin`);
    const zx0File = path.join(outDir, `jeto${j}_spr.zx0`);
    fs.writeFileSync(binFile, combined);
    execSync(`"${zx0Path}" -f "${binFile}" "${zx0File}"`);
    const zx0 = fs.readFileSync(zx0File);
    console.log(`  ${combined.length} -> ${zx0.length} bytes (ZX0) [3 poses × 4 sprites]`);
    console.log(`  Colors: ${Array.from(colBuf).join(',')}`);
    fs.unlinkSync(binFile);
}

console.log('\nDone!');
