# PUYO PUYO VS — MSX1

> It's spring. The flowers are blooming. The birds are singing. And inside a Z80 running at 3.58 MHz, colored blobs are falling from the sky and exploding in chain reactions that send grey rubble raining onto your best friend's side of the screen. Life is good.

This is Puyo Puyo VS for the MSX1. A from-scratch competitive puzzle game built for a machine from 1983, running at a speed it was never designed to reach, with graphics that should not be possible on a TMS9918A. 228 builds. Zero flicker. One beautiful spring.

---

## What a lovely day to play Puyo Puyo

Two players sit at the same MSX. The sun comes through the window. Puyos fall gently from the top of the screen in pairs. You rotate them, guide them down, stack them by color. When four of the same color touch — pop. They vanish. The puyos above them fall. If THOSE form a group — pop again. That's a chain. Your opponent gets garbage. They panic. You smile. The birds keep singing.

Or you play alone. The SOLO mode puts your board in the center of the screen, just you and the puyos, no pressure, no opponent, just a warm afternoon and falling colors. When your tower reaches the top, you start again. There's no rush. It's spring.

Or you fight the CPU. Eight levels. Level 1 barely knows what it's doing — it places puyos at random half the time and takes forever to react. Level 8 plays one move per frame with zero randomness and no mercy. Somewhere in between, you'll find your match. The sun will still be shining when you lose.

---

## Features (it's a long list, but the weather is nice, take your time)

- **Three modes** — Arcade (vs CPU, 8 levels), VS (two humans), Solo (just you and the puyos)
- **Chain combos** — the soul of the game, with group bonus for simultaneous multi-clears
- **Garbage warfare** — randomized columns, Fisher-Yates shuffled, because even debris deserves fairness
- **All Clear bonus** — empty your entire board and 30 garbage blocks rain on your opponent
- **Blob connections** — 30 pre-computed tiles make adjacent puyos fuse into satisfying blobs
- **Smooth animation** — 8-pixel falling precision at 4x speed, because spring days go fast
- **Zero-flicker rendering** — 768-byte RAM buffer, VBlank-only flush, flickering is literally impossible
- **Non-blocking chains** — both players keep playing while chains resolve, nobody waits
- **Garbage indicator** — top bar blinks yellow or red when debris is incoming, like a weather warning
- **Sound effects** — channel C of the PSG, borrowed from the music just long enough to go "pop"
- **PT3 music** — three channels of AY-3-8910, with 50Hz compensation so it sounds the same everywhere
- **Scrolling backgrounds** — diagonal patterns that speed up when your tower gets dangerously high
- **Credits with style** — roles scroll down, names scroll up, directions randomized, pixel-smooth
- **Victory screen** — because winning deserves a moment in the sun
- **Attract mode** — two CPUs play while you watch, cycling through all difficulty levels
- **ESC to menu** — because sometimes the garden needs watering

---

## Controls

| Action | Player 1 | Player 2 / CPU |
|---|---|---|
| Move | Arrows / Joystick 1 | Joystick 2 |
| Rotate CW | Up / Z / Space / Btn A | Btn A |
| Rotate CCW | X / Btn B | Btn B |
| Fast drop | Down | Down |
| Credits | C (menu) | — |
| Back to menu | ESC | — |

---

## Under the Hood (but who wants to be under a hood on a day like this)

| Spec | Value |
|---|---|
| CPU | Z80A @ 3.58 MHz |
| VDP | TMS9918A — Screen 2, 256x192, 16 colors |
| PSG | AY-3-8910 — 3 tone + 1 noise |
| ROM | 64KB flat (ROM_64K_ISR), no mapper |
| RAM | ~9KB used |
| Compiler | SDCC 4.2.0 via MSXgl |

---

## The People Who Made This Happen

Some people write code. Some people draw pixels. Some people pick music. Some people just say *"dale"* and *"perfecto"* until the game works. It takes all kinds.

- **Antxiko** — game design, pixel art, music selection, patience beyond measure
- **Igor Errazking** — tileset artist, gave the puyos the face they always deserved
- **TheNestruo** — graphic design, art direction, and the four words that ended the flicker war: *"buffer it in RAM"*
- **Jaume** — music (coming soon, spring is young)
- **Claude Opus 4.6** — code, tools, 47 incorrect flicker fixes, one correct one
- **Aki** — title music: *Milky Way in My Pocket*
- **LaesQ** — gameplay music: *Ostagazuzulum*
- **MSXgl** by Aoineko — the framework
- **PT3 player** — S.V.Bulba, Dioniso, MSXKun, SapphiRe, mvac7

---

## The Journey (abridged, because the full version is 228 builds long)

**Builds 1-160.** The game exists. Puyos fall. Chains work. It flickers terribly.

**Builds 161-179.** The Great Flicker War. Dynamic pattern pools. Shared indices. Shadow invalidation. Ghost connections. Nineteen builds of agony. Then TheNestruo says *"buffer it in RAM"* and the war ends in one afternoon. 768 bytes. One LDIRVM. Zero flicker. Forever.

**Builds 194-203.** The ROM was full. We claimed page 0 from the BIOS. 15KB of free space appeared. The assets moved underground. The title screen cost 317 bytes.

**Builds 205-218.** Garbage randomization. Satellite collision fixes. Non-blocking chain system. The entire chain loop — gravity, flash, clear, effects — rewritten as a per-player state machine. One step per frame. The game never pauses. Also, the human discovered the pieces had been falling at half speed for 217 builds.

**Build 209.** Errazking's tileset. The puyos finally look beautiful.

**Builds 219-228.** Sound effects. All Clear bonus. Victory screen. Credits with pixel scroll. SOLO mode. ROM optimization recovered 2.7KB. CPU difficulty rebalanced — level 1 is now actually easy. The weather got warmer. The game got better.

---

## Building

See [COMPILE.md](COMPILE.md) for full instructions.

```bash
node tools/build_assets.js
cp src/puyopuyo.c MSXgl/projects/puyopuyo/
cd MSXgl/projects/puyopuyo && node ../../engine/script/js/build.js
```

ROM output: `MSXgl/projects/puyopuyo/out/puyopuyo.rom` (65,536 bytes)

---

## On the Nature of Making Things

This game was built in a week. A human and an AI, sitting together (metaphorically), building a Puyo Puyo for a computer from 1983. The human knew what the game should feel like. The AI knew how to write C for a Z80. Between them, they figured out the rest.

The AI made mistakes. Many mistakes. It said "this should fix the flickering" forty-seven times. It proposed double buffering on a chip with 16KB of VRAM. It let the human play at half speed for 217 builds. It overflowed the ROM into RAM and crashed the game at boot. It said pixel scrolling was "too complex" and the human said "no es tan complejo no te flipes."

The human made no mistakes. The human just kept saying *"dale"* and *"otra vez"* and *"perfecto"* and occasionally *"furcia"* when the AI deserved it.

The game works. The puyos fall. The chains explode. The connections hold. The credits scroll. The music plays at the right speed on both 50Hz and 60Hz machines. There are three modes and eight difficulty levels and sound effects and an attract mode and a garbage indicator and a victory screen.

It's spring 2026. The MSX is 43 years old. The Z80 has been running since 1976. And somewhere, two colored blobs are falling side by side toward a board where their friends are waiting.

*228 builds. One Z80. Zero flicker. What a lovely spring.*
