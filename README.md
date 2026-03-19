# PuyoPuyo VS - MSX1

> A fully playable 2-player Puyo Puyo clone running on an MSX1 with just 32KB of ROM.
> Built entirely by an AI (Claude Opus 4.6) in a single conversation session, with pixel art by a human.

---

## The Story

This game was created from scratch in one continuous pair-programming session between a human and an AI. The human said: *"I want to make a Puyo Puyo game for MSX1, in Screen 2, player vs player, with joysticks."*

And so it began.

What followed was an intense, iterative development process where the AI wrote every single line of C code, designed the game architecture, implemented the Puyo Puyo mechanics, composed music by hand, built a custom PSG sound engine, created an animated background system, and debugged VDP timing issues in real-time - all while the human tested each build in openMSX and provided feedback.

The human's contribution? **The pixel art.** Four beautiful 16x16 puyo faces with personality, and a menacing garbage stone with hollow eyes. Drawn in Photoshop, exported as PNG, and automatically converted to MSX tile data by the AI's custom image parser. Every other aspect - from the flood-fill chain detection algorithm to the hand-transcribed "I'm Yours" melody - came from the machine.

## Features

- **Pure MSX1 compatible** - Runs on any MSX1 with 16KB VRAM (TMS9918A)
- **Screen 2 (Graphic 2 mode)** - 256x192 pixels, 16 colors
- **32KB ROM** - Fits comfortably with room to spare
- **2-Player Versus** - Player 1 (Joystick 1 / Keyboard) vs Player 2 (Joystick 2)
- **Full Puyo Puyo mechanics:**
  - Group detection (flood-fill, 4+ to clear)
  - Chain combos with escalating effects
  - Garbage system (send stones to opponent)
  - Garbage offset (counter incoming garbage with your own chains)
  - Garbage blocks break into random colors when adjacent groups are cleared
- **16x16 pixel puyos** with unique face designs per color:
  - Red: angular brow eyes
  - Green: big round eyes
  - Blue: star/sparkle eyes
  - Yellow: droopy lash eyes
  - Garbage: stone face with hollow black eyes
- **2-color-per-line trick** for eye detail (fg=white eyes, bg=body color on eye rows)
- **Music:** "I'm Yours" by Jason Mraz, hand-transcribed note by note for 2-channel PSG
- **Sound effects** on PSG Channel C with auto-decay:
  - Drop thud, clear pop, chain ascending pitch
  - Garbage sent rumble, garbage received impact
  - Victory jingle (C major arpeggio)
- **Visual effects:**
  - Border color flash on chain combos (green -> yellow -> red -> magenta -> white)
  - Opponent wall flash red when garbage is incoming
  - Danger warning: walls flash red when board is nearly full
  - Chain counter display in center panel
- **Animated background** - subtle dark blue dot pattern with vertical scroll
- **Shadow buffer rendering** - only changed tiles are written to VRAM (zero flicker)

## Controls

| Action | Player 1 | Player 2 |
|--------|----------|----------|
| Move | Arrow keys / Joystick 1 | Joystick 2 |
| Rotate CW | Up / Z / Space / Button A | Up / Button A |
| Rotate CCW | X / Button B | Button B |
| Fast drop | Down | Down |
| Start game | Space / Button A | Button A |

## Technical Details

- **Framework:** [MSXgl](https://github.com/aoineko-fr/MSXgl) by Aoineko
- **Compiler:** SDCC (Small Device C Compiler) targeting Z80
- **Language:** C (no assembly)
- **Target:** ROM_32K (pages 1&2, 0x4000-0xBFFF)
- **VDP Mode:** Graphic 2 (Screen 2) with 3-bank pattern/color tables
- **Audio:** AY-3-8910 PSG direct register access
  - Channel A: Melody
  - Channel B: Bass
  - Channel C: Sound effects with volume decay
- **Tile system:** 22 unique 8x8 patterns (5 puyo types x 4 quadrants + wall + background)
- **Custom image pipeline:** Node.js script reads PNG pixel data, classifies white/body/transparent, generates C arrays with per-row color attributes

## Building

1. Clone [MSXgl](https://github.com/aoineko-fr/MSXgl) into the project root as `MSXgl/`
2. Copy the contents of `src/` into `MSXgl/projects/puyopuyo/`
3. Copy `ojopuyo.png` and `piedra.png` to the project root for reference
4. Run `build.sh` (or `build.bat` on Windows) from `MSXgl/projects/puyopuyo/`
5. The ROM will be generated at `MSXgl/projects/puyopuyo/out/puyopuyo.rom`

Pre-built ROMs are available in the `builds/` folder.

## Running

Load any `.rom` file from `builds/` in your favorite MSX emulator:

```
openmsx -machine C-BIOS_MSX1 -cart builds/puyo_037.rom
```

Or flash it to a real cartridge and play on hardware!

## Screenshots

*Coming soon*

## Credits

- **Code, architecture, music, sound engine, build system:** Claude Opus 4.6 (Anthropic)
- **Pixel art (puyo faces, garbage stone):** [@antxiko](https://github.com/antxiko)
- **Framework:** [MSXgl](https://github.com/aoineko-fr/MSXgl) by Guillaume 'Aoineko' Blanchard
- **Music:** "I'm Yours" originally by Jason Mraz (PSG arrangement by Claude)
- **MIDI tools:** [midi2pt3](https://launchpad.net/midi2pt3) by Amaury Carvalho

## License

This project is provided as-is for educational and entertainment purposes. The MSXgl framework is licensed under CC BY-SA by its author.

---

*Built with love, silicon, and a lot of VDP_Poke_GM2 calls.*
