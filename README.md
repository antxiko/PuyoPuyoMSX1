# PuyoPuyo VS - MSX1

**A full-featured Puyo Puyo clone for MSX1, written in C with MSXgl.**

Two players. Five colors. One screen. Pure 8-bit chaos.

---

## The Game

PuyoPuyo VS is a competitive puzzle game where two players battle head-to-head on a single MSX1. Colored blobs (puyos) fall from the sky in pairs. Stack four or more of the same color together and they explode, sending garbage blocks raining down on your opponent. Chain reactions multiply the damage. Last player standing wins.

### Features

- **2-Player VS** on a single MSX1 (keyboard + joystick or 2 joysticks)
- **CPU opponent** with 8 difficulty levels
- **5 puyo colors** + garbage blocks
- **Chain combos** with visual effects
- **Blob connections** — adjacent same-color puyos merge visually
- **Smooth 8px falling** with animated gravity
- **PT3 music** — full 3-channel tracker music
- **Diagonal scrolling backgrounds** — unique per player
- **Speed progression** — game gets faster every 10 pieces
- **Stats screen** — score, max chain, clears

### Controls

| Action | Player 1 | Player 2 |
|---|---|---|
| Move | Arrow keys / Joy1 | Joy2 |
| Rotate CW | Up / Z / Space / Btn A | Btn A |
| Rotate CCW | X / Btn B | Btn B |
| Fast drop | Down | Down |

---

## Technical Details

- **Platform**: MSX1 (TMS9918A, AY-3-8910)
- **ROM**: 48KB with ISR
- **Framework**: [MSXgl](https://github.com/aoineko-fr/MSXgl)
- **Compression**: ZX0

---

## Tools

Graphics editor: [MSXJuanEditor](https://github.com/antxiko/MSXJuanEditor)

---

*Made with love for the MSX platform. Long live the Z80.*
