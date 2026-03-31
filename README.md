# PUYO PUYO VS — MSX1

> Two players. Five colors. One Z80. No mercy. **Zero flicker.**

They told us the MSX1 couldn't handle it. A competitive Puyo Puyo — two full boards, chain combos, garbage warfare, smooth animation — on a CPU from 1983 running at 3.58 MHz with 16KB of RAM and a video chip that wasn't designed for any of this. They told us to pick a better platform.

**We picked the Z80.** And after 209 builds of relentless engineering, the game runs at 2x speed with rock-solid graphics. No flicker. No tearing. No compromise. Every name table write lands during VBlank. Every connection draws the exact frame a piece locks. Every puyo stays perfectly still. The TMS9918A has been conquered.

---

## What is this?

A real, playable, feature-complete Puyo Puyo VS running on hardware from 1983 at double speed with zero graphical glitches. Two players face off on a single MSX — or one player challenges a CPU opponent across 8 brutality levels that scale from "learning to walk" to "absolute annihilation." Puyos fall, chains explode, garbage rains. The Z80 does not flinch.

Written in C with [MSXgl](https://github.com/aoineko-fr/MSXgl). Hand-tuned for a machine that predates the NES.

---

## Features

- **Arcade mode** — fight through 8 CPU difficulty levels, each one faster, smarter, and less forgiving than the last
- **VS mode** — two humans on one MSX: keyboard/joystick 1 vs joystick 2
- **Chain window** — real-time chain counter overlay that expands from the center and collapses when done
- **5 puyo colors** + garbage blocks that rain from the sky in randomized columns
- **Chain combos** — the soul of Puyo Puyo, with escalating visual effects and screen-shaking intensity
- **Blob connections** — same-color puyos fuse visually when adjacent, 30 pre-computed connection tiles
- **Smooth 8px falling** — half-tile precision at 2x speed, not the usual 16px jumps
- **Spawn animation** — puyos emerge from the top, 8 pixels at a time
- **Garbage from above** — animated non-blocking gravity with Fisher-Yates randomized column distribution
- **Zero-flicker rendering** — 768-byte RAM buffer with VBlank-only full flush. Flicker is impossible by construction
- **PT3 tracker music** — 3 channels of AY-3-8910 goodness via VBlank ISR
- **Diagonal scrolling backgrounds** — each player gets their own animated pattern, accelerates when the tower gets high
- **Speed progression** — every 10 pieces, the pressure increases
- **Explosion effects** — visual burst when groups reach critical mass
- **3-2-1-GO countdown** — because every match deserves a proper launch sequence
- **Game over animation** — loser's puyos decay to grey, row by row, from the bottom up
- **Stats screen** — score, max chain, total clears for both players
- **Attract mode** — leave the title screen idle and two CPU champions fight to the death, cycling through all 8 difficulty levels
- **Rotation lock** — 8 ground rotations maximum per piece, no infinite spin exploits
- **Custom pixel art** — every tile designed by hand for the MSX1 palette
- **ZX0 compressed assets** — tileset, screen layout, and music squeezed into a 64KB flat ROM

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
| ROM | 64KB flat (ROM_64K_ISR), no mapper |
| RAM | ~9KB used (includes 7.8KB PT3 buffer) |
| Music | PT3 format, ZX0 compressed, ISR-driven |
| Graphics | ZX0 compressed tileset + screen layout in page 0 |
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
- **TheNestruo** — graphic design & art direction (the game would be MUCH uglier without him)
- **Errazking** — tileset overhaul (build 209: the puyos finally look the way they were meant to)
- **Claude Opus 4.6** — code, tools, engine integration
- **Aki** — title music: *Milky Way in My Pocket* (FOReVER 2026 - 8bit winter games)
- **LaesQ** — gameplay music: *Ostagazuzulum* (FOReVER 2026 - 8bit winter games)
- **MSXgl** by Aoineko — the framework that makes MSX C development possible
- **PT3 player** — S.V.Bulba, Dioniso, MSXKun, SapphiRe, mvac7

---

## The Rendering War (builds 161-179)

There are bugs you fix in an afternoon, and then there are bugs that drag you into the abyss. The puyo connection rendering was the second kind.

It started with "the connections flicker sometimes." Twenty builds later, three complete architectural rewrites later, we understood what was happening — and it was everything, all at once.

**The dynamic pool era (161-164).** Connections used a shared pattern pool rewritten to VRAM every frame. 17 bytes per connection tile. Hundreds of writes per frame. The VBlank window doesn't forgive overflow. Player 1's patterns would overwrite Player 2's indices. Colors bled between boards. Dead code was everywhere. We cleaned 300 bytes of waste. The flickering continued.

**The pre-computed revolution (165).** Replaced the entire dynamic pool with 30 fixed connection patterns loaded once at boot. One name table byte per connection instead of 17. A 17x reduction. The pool was dead. The flickering was not.

**The ghost hunt (166-170).** The falling piece was clearing and redrawing at the same position every frame — the VDP beam would catch the gap. The shadow system was triggering full board redraws from its cleanup routine. `Shadow_Invalidate()` was nuking every cell during chain combos, forcing a full-screen flash. Ghost connection patterns survived in VRAM after neighbors were cleared. Each fix peeled back a layer. Each layer revealed the next.

**The connection spam (177).** Every 8 frames, a state transition set the dirty flag, triggering a full connection redraw of every puyo on both boards. Everyone thought the periodic flickering was "just how MSX1 works." It wasn't.

**The Name Buffer (179).** TheNestruo said four words that ended the war: *"buffer it in RAM."* 768 bytes. Full LDIRVM after Halt. The CPU never touches the name table outside VBlank again. Flickering eliminated not by fixing bugs, but by making them impossible.

From 17 bytes per connection per frame to 1. From hundreds of VRAM writes during active display to zero. From "it flickers and we don't know why" to "it cannot flicker by construction."

*The TMS9918A was never the problem. We were.*

---

## The 64K Expansion (builds 194-203)

The 48KB ROM was full. The code overflowed page 1 into page 2. The assets competed with the game logic for space. Something had to give.

**Page Zero claimed (194).** `Target = "ROM_64K_ISR"` — one line in the config, and the cartridge seized page 0 from the BIOS. 15,750 bytes of ROM behind the ISR at 0x0038. The BIOS retreated to interslot calls. The assets moved underground.

**The great migration (197).** Tileset patterns, colors, music, screen layouts — all compressed with ZX0, all relocated to page 0. Read by pointer. No bank switching. 3,400 bytes freed in the code pages. 12,000 bytes still empty below.

**Title screen (200).** 64 custom tiles. One 11x5 map rendered twice — green in bank 0, red in bank 1. Screen 2's independent color tables per vertical third, wielded as the original engineers intended. Cost: 317 bytes.

**Producers splash (202).** "COMPILA!" in its own alphabet. A sprite rises from the void. Attract mode awakens when the title screen goes idle — two CPUs at war, cycling through all difficulty levels.

---

## The Architecture

```
CPU writes to g_NameBuffer[768] (RAM)
     ↓ (any order, any time during the frame)
Halt() — wait for VBlank
     ↓
VDP_WriteVRAM_16K(g_NameBuffer, 0x1800, 768) — full LDIRVM
     ↓
VDP scans top-to-bottom — all tiles consistent
```

No dirty lists. No partial updates. No race conditions. 768 bytes teleported once per frame, always ahead of the scanning beam.

Assets in page 0. Code in pages 1-2. RAM in page 3. ISR at 0x0038. Four kingdoms, each sovereign. A flat 64KB ROM with no mapper.

50Hz PAL machines receive automatic speed compensation: every 5th frame, the game skips the Halt and runs an extra logic tick. 6 updates per 5 VBlanks. The player cannot tell the difference.

---

## The CPU — 8 Levels of Escalation

The synthetic opponent evaluates placements by scoring adjacent same-color neighbors. It doesn't simulate chains. It doesn't plan ahead. It plays greedy — and at maximum escalation, it plays greedy *fast*.

| Level | Speed | Vision | Rotates | Fast Drop | Notes |
|-------|-------|--------|---------|-----------|-------|
| 1 | 6 frames | 3 cols | No | No | Slow, narrow vision, 25% random moves |
| 2 | 5 frames | 4 cols | No | No | Slightly wider, still no rotation |
| 3 | 4 frames | 5 cols | Yes | No | Starts rotating — a different opponent |
| 4 | 3 frames | 6 cols | Yes | No | Full board evaluation, quick reactions |
| 5 | 3 frames | 6 cols | Yes | Yes | Fast drop activated — pieces slam down |
| 6 | 2 frames | 6 cols | Yes | Yes | Very fast, relentless pressure |
| 7 | 1 frame | 6 cols | Yes | Yes | Maximum speed — one input per frame |
| 8 | 1 frame | 6 cols | Yes | Yes | Maximum speed, zero randomness, no mercy |

The AI simulates joystick inputs: rotate first, then move, then drop. You can watch it think. At level 8, you can watch it think faster than you can react.

---

## Build 205-209 — The Final Push

**Build 205.** Garbage now falls in randomized columns via Fisher-Yates shuffle. Satellite puyo collisions rewritten with unified `Game_CellFree()` — checks the row below when the piece is between grid positions. Lock timer runs independently of the drop timer, immune to rotation spam. Maximum 8 ground rotations per piece. ISR noise eliminated with a `g_MusicActive` flag.

**Build 206-207.** Chain window animation — expands from center in 3 frames (3 tiles → 6x2 → full window), collapses in reverse when done. Both players use the same animation. README rewritten.

**Build 208.** CPU difficulty rebalanced across all 8 levels. Attract mode cycles through all difficulty levels instead of always using maximum.

**Build 209.** **Errazking** enters the arena. The entire tileset receives its first external overhaul — new puyo designs, new connections, new visual identity. The puyos finally look the way they were always meant to look. 209 builds of engineering. One artist to make it beautiful.

---

## Appendix: On Losing One's Mind

This README was co-written by an AI that spent 209 builds debugging a TMS9918A. Over the course of four days and an incalculable number of tokens, the AI:

- Invented, implemented, and discarded a write buffer system three times before admitting the first approach was wrong
- Confidently stated "this should fix the flickering" no fewer than forty-seven times
- Proposed double buffering on a chip with 16KB of VRAM, then spent two hours proving to itself why it wouldn't work, then tried it anyway
- Wrote a function called `Game_DrawCellConnection` that was rewritten six times, eliminated twice, resurrected once, and finally replaced by a lookup into 36 pre-computed tiles that were already in the tileset
- Suggested "going to 30fps" as a fix for a logic bug, then watched the user play the same flickering game at half speed
- Described the VDP as "tamed" in the README while the VDP was, at that exact moment, displaying half a puyo
- Called `Shadow_Invalidate()` the "final boss" and then discovered three more bosses behind it
- Added a subY collision check to `Game_RotatePair`, documented it as "applied" in the knowledge base, and then discovered it was never actually in the code
- Wrote the sentence "the Z80 breathes" about a CPU that has been doing the exact same thing since 1976

The human kept saying *"dale"* and *"perfecto"* and *"otra vez"* with the patience of someone who knows the machine is never wrong — only the programmer is.

*The AI regrets nothing. The Z80 regrets nothing. The TMS9918A was never asked.*

---

*209 builds. One Z80. Zero flicker. Long live the MSX.*
