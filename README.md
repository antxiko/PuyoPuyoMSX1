# PUYO PUYO VS — MSX1

> Two players. Five colors. One Z80. No mercy. **Zero flicker.**

A from-scratch competitive Puyo Puyo built for the MSX1, pushing the TMS9918A to its absolute limits. Written in C with [MSXgl](https://github.com/aoineko-fr/MSXgl), hand-tuned for a machine from 1983.

**The game runs at 2x speed with rock-solid graphics.** After twenty builds of relentless optimization — from dynamic pattern pools to pre-computed tilesets, from direct VRAM writes to a RAM-buffered name table with VBlank-only differential flushing — the rendering pipeline is now flicker-free by construction. Every name table write lands during VBlank. Every connection draws at the exact frame a piece locks. Every placed puyo stays perfectly still. The TMS9918A has been tamed.

---

## What is this?

A real, playable, feature-complete Puyo Puyo VS running on 3.58 MHz and 16KB of RAM at double speed with zero graphical glitches. Two players face off on a single MSX — or one player challenges a CPU opponent with 8 brutality levels. Puyos fall, chains explode, garbage rains. The Z80 does not flinch.

---

## Features

- **Arcade mode** — fight through 8 CPU difficulty levels, from "learning to walk" to the final boss
- **VS mode** — two humans on one MSX: keyboard/joystick 1 vs joystick 2
- **Chain window** — real-time chain counter overlay appears during combos
- **5 puyo colors** + garbage blocks that fall from the sky
- **Chain combos** — the soul of Puyo Puyo, with escalating visual effects
- **Blob connections** — same-color puyos fuse visually when adjacent, 30 pre-computed connection tiles
- **Smooth 8px falling** — half-tile precision at 2x speed, not the usual 16px jumps
- **Spawn animation** — puyos emerge from the top, 8 pixels at a time
- **Garbage from above** — animated non-blocking gravity, like the arcade
- **Zero-flicker rendering** — RAM-buffered name table with VBlank-only differential flush
- **PT3 tracker music** — 3 channels of AY-3-8910 goodness via VBlank ISR
- **Diagonal scrolling backgrounds** — each player gets their own animated pattern
- **Speed progression** — every 10 pieces, the pressure increases
- **Explosion effects** — visual burst when groups are cleared
- **3-2-1-GO countdown** — because every match deserves a proper start
- **Game over animation** — loser's puyos fade to grey, row by row
- **Stats screen** — score, max chain, total clears for both players
- **Custom screen layout** — designed pixel by pixel in our visual editor
- **ZX0 compressed assets** — tileset, screen layout, and music squeezed into 31KB of ROM

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
- **TheNestruo** — graphic design & art direction (the game would be MUCH uglier without him)
- **Claude Opus 4.6** — code, tools, engine integration
- **Aki** — title music: *Milky Way in My Pocket* (FOReVER 2026 - 8bit winter games)
- **LaesQ** — gameplay music: *Ostagazuzulum* (FOReVER 2026 - 8bit winter games)
- **MSXgl** by Aoineko — the framework that makes MSX C development possible
- **PT3 player** — S.V.Bulba, Dioniso, MSXKun, SapphiRe, mvac7

---

## The Great Connection Wars (builds 161-169)

There are bugs you fix in an afternoon, and then there are bugs that drag you into the underworld and make you question reality. The puyo connection rendering was the latter.

It started innocently: "the connections flicker sometimes." Nine builds, forty-seven failed theories, and one complete architectural rewrite later, we finally understood what was happening — and it was everything, all at once.

**Build 161** — The original sin. Connections used a dynamic pattern pool (indices 128-255) that was rewritten to VRAM every single frame. Each connection required 17 bytes of VRAM writes: 8 for pattern data, 8 for color data, 1 for the name table. With a full board, that's hundreds of writes per frame, far exceeding what the VBlank period allows. The TMS9918A doesn't forgive.

**Build 162-163** — We tried write buffers, pre-computing everything in RAM before flushing to VRAM. We tried drawing connections only for the affected player. We tried partial connection updates around the last locked piece. Each fix solved one problem and created two more. The pattern pool was shared between players — Player 1's connection patterns would overwrite indices that Player 2 was still referencing, causing puyos to display in the wrong color.

**Build 164** — The great cleanup. Removed every dead variable, unused function, and zombie code path. Stripped 300+ bytes of RAM waste. The code was clean. The connections still flickered.

**Build 165** — The architectural revolution. Replaced the entire dynamic pattern pool with 36 pre-computed fixed patterns loaded once at startup. Each puyo color gets 6 connection variants (top-filled TL, top-filled TR, bottom-filled BL, bottom-filled-with-left-edge BL, bottom-filled BR, bottom-filled-with-right-edge BR). Connection drawing went from 17 VRAM bytes per tile to exactly 1. A 17x reduction. The pool was dead. The flickering continued.

**Build 166-167** — The falling piece was the traitor. Every frame, the subY drawing code would RestoreTile (write background) then immediately VDP_Poke (write puyo) at the same position, even when the piece hadn't moved. The VDP would scan between those two writes and display the background for one scanline pass — a flicker visible to the human eye but invisible to the logic. We added position tracking to skip redundant redraws. But then connections started disappearing because the cleanup code was overwriting them. We made connections redraw every frame — but that overloaded VRAM writes again when the board was full.

**Build 168** — The shadow loop revelation. The shadow comparison system was marking `g_BoardDirty` from the cleanup code, which triggered a full connection redraw on the next frame. But that redraw wrote base puyo patterns first, erasing the connections, then redrew them — visible as a one-frame flash. The fix: trigger `g_BoardDirty` from inside the shadow loop itself, so connections are redrawn in the SAME frame, right after the base patterns, never leaving a frame without them.

**Build 169** — The final boss: `Shadow_Invalidate()`. During chain combos, `Game_AnimateGravity` was calling `Shadow_Invalidate()` which nuked the ENTIRE shadow table — every cell set to 0xFF, forcing every puyo on the board to be redrawn from scratch, erasing all connections, then redrawing them one frame later. The connections would vanish during every single chain. The fix was surgical: instead of invalidating everything, only invalidate the specific cells that actually moved during gravity (source and destination). Puyos that didn't move kept their shadow clean, their connections untouched, their dignity intact.

**Build 170** — The ghost connections. Everything looked perfect until we noticed a green puyo showing connection edges with no neighbor in sight. The connection code only *wrote* connected quadrants — it never *erased* disconnected ones. When a neighbor vanished (cleared in a combo), the old connection pattern stayed in VRAM like a scar. The fix: write all 4 quadrants of every puyo — connection pattern where adjacent, base pattern where not. No ghosts survive. And one final reordering: cleanup runs *before* the shadow loop, not after, so the shadow redraws on top of cleaned tiles instead of the cleanup erasing what the shadow just painted. Background scroll moved to last — the falling pieces deserve the VBlank, not the wallpaper.

**Build 170** — The ghost connections. Everything looked perfect until we noticed a green puyo showing connection edges with no neighbor in sight. The connection code only *wrote* connected quadrants — it never *erased* disconnected ones. When a neighbor vanished (cleared in a combo), the old connection pattern stayed in VRAM like a scar. The fix: write all 4 quadrants of every puyo — connection pattern where adjacent, base pattern where not. No ghosts survive.

**Build 177** — The connection spam revelation. We discovered that every 8 frames, when the piece transitioned between subY states, the shadow loop was setting `g_BoardDirty = TRUE`. This triggered a FULL connection redraw — every puyo on both boards, 4 tiles each — creating periodic VRAM bursts that caused the persistent flickering everyone thought was "just how MSX1 works." The fix: remove `g_BoardDirty` from the shadow loop entirely. Connections only redraw when the board actually changes (piece locks, gravity, garbage). Inline connection restoration in the shadow loop handles cells that get redrawn without triggering a full board connection pass.

**Build 179** — The Name Buffer. The nuclear option. **TheNestruo** proposed the idea that changed everything: instead of writing to VRAM directly during the game loop, buffer the entire name table in RAM and flush only the changes during VBlank. ALL name table writes now go to a 768-byte RAM buffer (`g_NameBuffer`). A dirty list tracks which tiles changed. After `Halt()`, `NB_Flush()` writes ONLY the changed tiles to VRAM — during VBlank, when the display is off. The CPU never touches the name table outside of VBlank again. Flickering eliminated by definition. The entire rendering architecture — from direct VRAM pokes to buffered differential updates — was rebuilt in a single session. One idea. One conversation. Zero flicker.

**Build 180** — The phantom connections. One last bug: falling pieces showed connection patterns before landing. The inline connection code in the shadow loop was checking `visible[y][x]` (which includes the falling piece overlay) instead of `p->board[y][x]` (which only has placed puyos). One condition added: `p->board[y][x] == color`. Connections now appear exactly when puyos lock — not a frame before, not a frame after.

Twenty builds. Three architectural rewrites. One RAM buffer that changed everything.

From 17 bytes per connection per frame to 1. From hundreds of VRAM writes during active display to zero. From "it flickers and we don't know why" to "it cannot flicker by construction."

*The TMS9918A was never the problem. We were.*

---

*Built for the machine that started it all. Long live the Z80.*
