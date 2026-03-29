// build_title.js — Convert title tileset PNG + map JSON to ZX0 assets
const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const baseDir = path.resolve(__dirname, '..');
const zx0Path = path.join(baseDir, 'MSXgl/tools/compress/ZX0/zx0.exe');
const outDir = path.join(baseDir, 'MSXgl/projects/puyopuyo/out');
const tmpDir = path.join(baseDir, 'assets');

const tilesetPng = path.join(baseDir, 'assets/tileset_titulo.png');
const mapJson = path.join(baseDir, 'assets/Puyo_titulo.json');

// MSX1 palette
const msxPalette = [[0,0,0],[0,0,0],[36,219,70],[109,235,143],[77,80,230],[118,114,255],[200,71,72],[84,243,242],[232,91,87],[255,130,128],[217,200,82],[234,212,136],[32,170,60],[195,91,183],[203,203,203],[255,255,255]];
function closestMSX(r,g,b) { let best=1,bestD=1e9; for(let i=1;i<16;i++){const dr=r-msxPalette[i][0],dg=g-msxPalette[i][1],db=b-msxPalette[i][2],d=dr*dr+dg*dg+db*db; if(d<bestD){bestD=d;best=i;}} return best; }

// Read PNG via PHP
console.log('Reading ' + tilesetPng + '...');
const phpScript = `
$img = imagecreatefrompng('${tilesetPng.replace(/\\/g, '/')}');
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
const phpResult = execSync(`C:\\php\\php.exe -r "${phpScript.replace(/"/g, '\\"').replace(/\n/g, ' ')}"`, { encoding: 'utf8', maxBuffer: 10*1024*1024 });
const lines = phpResult.trim().split('\n');
const [imgW, imgH] = lines[0].split(' ').map(Number);
const tilesPerRow = imgW / 8;
const numTiles = tilesPerRow * (imgH / 8);
console.log(`Tileset: ${imgW}x${imgH} = ${numTiles} tiles`);

// Parse pixels and convert to MSX format
const pixels = [];
for (let y = 0; y < imgH; y++) {
    pixels[y] = [];
    const vals = lines[y + 1].trim().split(/\s+/).map(Number);
    for (let x = 0; x < imgW; x++)
        pixels[y][x] = [vals[x*3], vals[x*3+1], vals[x*3+2]];
}

const patterns = [], colors = [];
for (let t = 0; t < numTiles; t++) {
    const tx = (t % tilesPerRow) * 8, ty = Math.floor(t / tilesPerRow) * 8;
    const pat = [], col = [];
    for (let row = 0; row < 8; row++) {
        const rowColors = [];
        for (let x = 0; x < 8; x++) {
            const [r,g,b] = pixels[ty+row][tx+x];
            rowColors.push(closestMSX(r,g,b));
        }
        const freq = {}; rowColors.forEach(c => freq[c]=(freq[c]||0)+1);
        const sorted = Object.entries(freq).sort((a,b)=>b[1]-a[1]);
        const fg = parseInt(sorted[0][0]), bg = sorted.length>1 ? parseInt(sorted[1][0]) : fg;
        let byte = 0;
        const fgRGB=msxPalette[fg], bgRGB=msxPalette[bg];
        for (let x=0;x<8;x++) {
            const [r,g,b] = pixels[ty+row][tx+x];
            const dfg=(r-fgRGB[0])**2+(g-fgRGB[1])**2+(b-fgRGB[2])**2;
            const dbg=(r-bgRGB[0])**2+(g-bgRGB[1])**2+(b-bgRGB[2])**2;
            if (dfg<=dbg) byte|=(1<<(7-x));
        }
        pat.push(byte); col.push((fg<<4)|bg);
    }
    patterns.push(pat); colors.push(col);
}

// Write pattern + color binaries
const patBuf = Buffer.alloc(numTiles*8), colBuf = Buffer.alloc(numTiles*8);
for (let i=0;i<numTiles;i++) for(let r=0;r<8;r++) { patBuf[i*8+r]=patterns[i][r]; colBuf[i*8+r]=colors[i][r]; }

const patBin = path.join(tmpDir, '_title_pat.bin');
const colBin = path.join(tmpDir, '_title_col.bin');
fs.writeFileSync(patBin, patBuf);
fs.writeFileSync(colBin, colBuf);

// Compress with ZX0
execSync(`"${zx0Path}" -f "${patBin}" "${patBin}.zx0"`);
execSync(`"${zx0Path}" -f "${colBin}" "${colBin}.zx0"`);
const patZx0 = fs.readFileSync(patBin+'.zx0');
const colZx0 = fs.readFileSync(colBin+'.zx0');
console.log(`Title pat: ${numTiles*8} -> ${patZx0.length} bytes (ZX0)`);
console.log(`Title col: ${numTiles*8} -> ${colZx0.length} bytes (ZX0)`);

// Copy to build dir
fs.copyFileSync(patBin+'.zx0', path.join(outDir, 'title_pat.zx0'));
fs.copyFileSync(colBin+'.zx0', path.join(outDir, 'title_col.zx0'));

// Map binary + compress
const mapData = JSON.parse(fs.readFileSync(mapJson, 'utf8'));
const mapBuf = Buffer.alloc(mapData.tiles.length);
for (let i=0;i<mapData.tiles.length;i++) mapBuf[i]=mapData.tiles[i];
const mapBin = path.join(tmpDir, '_title_map.bin');
fs.writeFileSync(mapBin, mapBuf);
execSync(`"${zx0Path}" -f "${mapBin}" "${mapBin}.zx0"`);
const mapZx0 = fs.readFileSync(mapBin+'.zx0');
console.log(`Title map: ${mapData.tiles.length} -> ${mapZx0.length} bytes (ZX0)`);
fs.copyFileSync(mapBin+'.zx0', path.join(outDir, 'title_map.zx0'));

// Cleanup
[patBin, patBin+'.zx0', colBin, colBin+'.zx0', mapBin, mapBin+'.zx0'].forEach(f => { try{fs.unlinkSync(f)}catch(e){} });

console.log(`\nTotal: ${patZx0.length+colZx0.length+mapZx0.length} bytes`);
console.log(`Tiles: ${numTiles}, Map: ${mapData.width}x${mapData.height}`);
console.log('Files: title_pat.zx0, title_col.zx0, title_map.zx0');
