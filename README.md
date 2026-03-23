# PUYO PUYO VS — MSX1

> Two players. Five colors. One Z80. No mercy.

A from-scratch competitive Puyo Puyo built for the MSX1, pushing the TMS9918A to its absolute limits. Written in C with [MSXgl](https://github.com/aoineko-fr/MSXgl), hand-tuned for a machine from 1983.

---

## What is this?

A real, playable, feature-complete Puyo Puyo VS running on 3.58 MHz and 16KB of RAM. Two players face off on a single MSX — or one player challenges a CPU opponent with 8 brutality levels. Puyos fall, chains explode, garbage rains. The Z80 does not flinch.

---

## Features

- **Human vs Human** — keyboard + joystick, or two joysticks
- **Human vs CPU** — 8 difficulty levels, from "learning to walk" to "merciless"
- **5 puyo colors** + garbage blocks that fall from the sky
- **Chain combos** — the soul of Puyo Puyo, with escalating visual effects
- **Blob connections** — same-color puyos fuse visually when adjacent
- **Smooth 8px falling** — half-tile precision, not the usual 16px jumps
- **Spawn animation** — puyos emerge from the top, 8 pixels at a time
- **Garbage from above** — animated non-blocking gravity, like the arcade
- **PT3 tracker music** — 3 channels of AY-3-8910 goodness via VBlank ISR
- **Diagonal scrolling backgrounds** — each player gets their own direction
- **Speed progression** — every 10 pieces, the pressure increases
- **Explosion effects** — visual burst when groups are cleared
- **3-2-1-GO countdown** — because every match deserves a proper start
- **Game over animation** — loser's puyos fade to grey, row by row
- **Stats screen** — score, max chain, total clears for both players
- **Custom screen layout** — designed pixel by pixel in our visual editor
- **ZX0 compressed assets** — tileset, screen layout, and music fit tight

---

## Controls

| Action | Player 1 | Player 2 / CPU |
|---|---|---|
| Move | Arrows / Joystick 1 | Joystick 2 |
| Rotate CW | Up / Z / Space / Btn A | Btn A |
| Rotate CCW | X / Btn B | Btn B |
| Fast drop | Down | Down |

CPU takes over Player 2 automatically when the joystick is idle.

---

## Under the Hood

| Spec | Value |
|---|---|
| CPU | Z80A @ 3.58 MHz |
| VDP | TMS9918A — Screen 2, 256x192, 16 colors |
| PSG | AY-3-8910 — 3 tone channels |
| ROM | 48KB with VBlank ISR hook |
| RAM | ~9KB used (includes 7.8KB PT3 buffer) |
| Music | PT3 format, ZX0 compressed, ISR-driven |
| Graphics | ZX0 compressed tileset + screen layout |
| Compiler | SDCC via MSXgl build system |

---

## Project Structure

```
src/puyopuyo.c         The entire game in one file
src/tileset_data.h     Compressed tileset (auto-generated)
src/screen_data.h      Compressed screen layout (auto-generated)
src/pt3_data.h         Compressed PT3 music (auto-generated)
assets/                Source graphics, screen layouts, music
tools/                 Tileset converter, screen editor, MIDI tools
```

---

## Building

Requires [MSXgl](https://github.com/aoineko-fr/MSXgl) and [Node.js](https://nodejs.org/).

```bash
cd src
node ../MSXgl/engine/script/js/build.js
```

ROM output: `src/out/puyopuyo.rom`

---

## Tools

All game graphics were created with **[MSXJuanEditor](https://github.com/antxiko/MSXJuanEditor)** — a native Windows app (built with Tauri/Rust) for editing MSX1 tiles, screen maps, and sprites with real hardware constraints.

---

## Credits

- **Antxiko** — game design, pixel art, music selection
- **Claude Opus 4.6** — code, tools, engine integration
- **MSXgl** by Aoineko — the framework that makes MSX C development possible
- **PT3 player** — S.V.Bulba, Dioniso, MSXKun, SapphiRe, mvac7

---

*Built for the machine that started it all. Long live the Z80.*
