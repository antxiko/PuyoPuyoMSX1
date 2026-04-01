# How to Compile Puyo Puyo VS

## Prerequisites

| Tool | Version | Notes |
|------|---------|-------|
| **Node.js** | v18+ (tested with v22.17.1) | [nodejs.org](https://nodejs.org/) |
| **PHP** | Any with GD module | Required for PNG pixel extraction |
| **MSXgl** | Included in repo | `MSXgl/` folder |

SDCC, ZX0, and MSXhex are bundled inside `MSXgl/tools/` — no need to install them separately.

### PHP Setup (Windows)

1. Download PHP from [php.net](https://windows.php.net/download/)
2. Extract to `C:\php\`
3. Enable GD in `php.ini`: uncomment `extension=gd`
4. Add `C:\php` to your PATH

### Verify PHP works

```bash
php -r "echo gd_info()['GD Version'];"
```

## Building

### Step 1: Build assets (tileset, music, screen layout)

```bash
cd PuyoPuyoVS
node tools/build_assets.js
```

This generates `.zx0` compressed files in `MSXgl/projects/puyopuyo/out/`.

### Step 2: Copy source to MSXgl project directory

```bash
cp src/puyopuyo.c MSXgl/projects/puyopuyo/
cp src/tileset_data.h MSXgl/projects/puyopuyo/
cp src/screen_data.h MSXgl/projects/puyopuyo/
cp src/pt3_data.h MSXgl/projects/puyopuyo/
cp src/music_data.h MSXgl/projects/puyopuyo/
cp src/title_data.h MSXgl/projects/puyopuyo/
cp src/msxgl_config.h MSXgl/projects/puyopuyo/
cp src/project_config.js MSXgl/projects/puyopuyo/
```

### Step 3: Compile ROM

```bash
cd MSXgl/projects/puyopuyo
node ../../engine/script/js/build.js
```

### Step 4: Output

The ROM is at:
```
MSXgl/projects/puyopuyo/out/puyopuyo.rom
```

Size: exactly 65,536 bytes (64KB flat ROM, no mapper).

## One-liner (after first setup)

```bash
cp src/puyopuyo.c MSXgl/projects/puyopuyo/ && cd MSXgl/projects/puyopuyo && rm -f out/puyopuyo.rel && node ../../engine/script/js/build.js
```

Note: `rm -f out/puyopuyo.rel` forces recompilation. SDCC doesn't track header changes automatically.

## Running

### openMSX (recommended emulator)

```bash
openmsx -machine "Philips_NMS_8255" -cart out/puyopuyo.rom
```

### Real hardware

Flash to a compatible cartridge:
- MSX Simple 64K ROM Cartridge
- MegaFlashROM SCC+ SD
- Carnivore2

## Project Structure

```
src/puyopuyo.c          Main game source (~2200 lines of C)
src/tileset_data.h       Tileset reference (data in page 0)
src/project_config.js    MSXgl configuration (ROM_64K_ISR)
assets/tileset.png       Game tileset (256 tiles, 8x8 each)
assets/screen_layout.json Game screen layout
tools/build_assets.js    Asset pipeline (PNG → ZX0)
tools/tileset2code.js    Tileset converter (uses PHP/GD)
tools/screen_editor.html Web-based tile & screen editor
MSXgl/                   MSXgl framework (SDCC + tools bundled)
```

## Technical Details

| Parameter | Value |
|-----------|-------|
| Target | ROM_64K_ISR (64KB flat, ISR at 0x0038) |
| CPU | Z80A @ 3.58 MHz |
| VDP | TMS9918A, Screen 2 (Graphic 2) |
| PSG | AY-3-8910, 3 channels |
| Compiler | SDCC 4.2.0 (bundled) |
| Compression | ZX0 (bundled) |
| Framework | MSXgl by Aoineko |
| Code pages | 1-2 (0x4000-0xBFFF) |
| Asset page | 0 (0x0100-0x3FFF, ~12KB free) |
| RAM page | 3 (0xC000-0xFFFF, ~9KB used) |

## Troubleshooting

**"PHP not found"** — Install PHP with GD module and add to PATH.

**"Compile error"** — Delete `out/puyopuyo.rel` and rebuild. SDCC doesn't track `.h` file changes.

**ROM overflows into page 3** — Check `Higher` in build output. Must be < 0xC000. Remove dead code or optimize.

**Tileset looks wrong** — Rebuild assets: `node tools/build_assets.js assets/tileset.png assets/screen_layout.json`
