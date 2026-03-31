#!/usr/bin/env node
// build_assets.js — Build all game assets from tileset PNG + map JSON
// Usage: node tools/build_assets.js [tileset.png] [map.json]
// Generates: .zx0 files in MSXgl/projects/puyopuyo/out/ ready for RawFiles

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const baseDir = path.resolve(__dirname, '..');
const zx0Path = path.join(baseDir, 'MSXgl/tools/compress/ZX0/zx0.exe');
const outDir = path.join(baseDir, 'MSXgl/projects/puyopuyo/out');
const tmpDir = path.join(baseDir, 'assets');

const tilesetPng = process.argv[2] || path.join(baseDir, 'assets/tileset.png');
const mapJson = process.argv[3] || null;

console.log('=== Build Assets ===\n');

// 1. Build tileset .zx0 files
console.log('--- Tileset ---');
execSync(`node "${path.join(baseDir, 'tools/tileset2code.js')}" "${tilesetPng}"`, { stdio: 'inherit' });

// 2. Build map .zx0 if provided
if (mapJson) {
    console.log('\n--- Map ---');
    const data = JSON.parse(fs.readFileSync(mapJson, 'utf8'));
    const mapBuf = Buffer.alloc(data.tiles.length);
    for (let i = 0; i < data.tiles.length; i++)
        mapBuf[i] = data.tiles[i];

    const mapBinFile = path.join(tmpDir, '_map.bin');
    const mapZx0File = mapBinFile + '.zx0';

    fs.writeFileSync(mapBinFile, mapBuf);
    execSync(`"${zx0Path}" -f "${mapBinFile}" "${mapZx0File}"`, { encoding: 'utf8' });

    const mapZx0 = fs.readFileSync(mapZx0File);
    console.log(`Map: ${data.tiles.length} -> ${mapZx0.length} bytes (ZX0)`);

    // Copy to build output
    fs.copyFileSync(mapZx0File, path.join(outDir, 'screen_game.zx0'));
    console.log(`Copied to ${outDir}/screen_game.zx0`);

    fs.unlinkSync(mapBinFile);
    fs.unlinkSync(mapZx0File);
}

// 3. Verify all assets
console.log('\n--- Assets in build dir ---');
const assets = ['tileset_pat.zx0', 'tileset_col.zx0', 'music_game.zx0', 'screen_game.zx0'];
let total = 0;
for (const f of assets) {
    const fp = path.join(outDir, f);
    if (fs.existsSync(fp)) {
        const size = fs.statSync(fp).size;
        total += size;
        console.log(`  ${f}: ${size} bytes`);
    } else {
        console.log(`  ${f}: MISSING`);
    }
}
console.log(`  Total: ${total} bytes (${(total/1024).toFixed(1)} KB)`);
console.log(`  Page 0 free: ${15616 - total} bytes`);

console.log('\nDone! Run build.sh to compile the ROM.');
