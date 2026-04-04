# PUYO PUYO VS — MSX1

> *In a world where processors run at 3.58 MHz... where 16 kilobytes of RAM is all that stands between civilization and chaos... where colored organisms fall from the sky and NOBODY KNOWS WHY... one team of developers did what everyone said was IMPOSSIBLE.*

**They built a competitive puzzle game. On a machine from 1983. And it runs at FOUR TIMES the intended speed. WITH ZERO FLICKER.**

*Coming this spring to a cartridge slot near you.*

---

## THE PLOT

The year is 2026. The MSX has been declared obsolete for three decades. The Z80 processor — a chip forged in 1976 — sits dormant in millions of forgotten machines worldwide. Everyone has moved on. Everyone except a small team of ABSOLUTE MADMEN who looked at this 43-year-old hardware and said:

*"Yeah. We can build Puyo Puyo on that."*

They were told it couldn't be done. They were told the TMS9918A video chip couldn't handle two simultaneous game boards. They were told 16KB of RAM wasn't enough. They were told the VDP would flicker. They were told to GO HOME.

**They didn't go home. They went to BUILD 240.**

---

## THREE MODES. ZERO MERCY.

**ARCADE** — You versus the machine. EIGHT levels of synthetic intelligence, each one FASTER and MORE RUTHLESS than the last. Level 1 is a warm-up — the CPU plays like your grandmother on sedatives. Level 8 plays ONE MOVE PER FRAME with ZERO RANDOMNESS. You will NOT survive Level 8. Nobody survives Level 8.

Each level has a FACE. Eight faces. Eight opponents. They stare at you from the center of the screen while they DESTROY YOUR BOARD. They SMILE when they're winning. They look WORRIED when you chain. They look STRESSED when garbage is about to RAIN ON THEIR HEAD. They have EMOTIONS. On a MACHINE FROM 1983.

**VS** — Two players. One MSX. No friends afterward. Keyboard versus joystick. Chain versus chain. Garbage versus garbage. Someone WILL flip the table.

**SOLO** — Just you. One board. Centered on screen. No opponent, no garbage, no pressure. Just the puyos and the silence. When your tower hits the ceiling, you start again. It's meditation. With explosions.

---

## WHAT'S IN THE BOX

- **Chain combos that HIT DIFFERENT** — Cascade reactions with group bonus multipliers. Clear two groups at once? DOUBLE damage. Three? TRIPLE.
- **ALL CLEAR BONUS** — Empty your ENTIRE board and THIRTY BLOCKS of garbage RAIN FROM THE SKY onto your opponent. THIRTY.
- **Garbage warfare** — Randomized columns via Fisher-Yates shuffle because EVEN DESTRUCTION deserves FAIRNESS
- **Garbage indicator** — Top bar BLINKS YELLOW when debris is incoming. BLINKS RED when it's A LOT of debris. You have been WARNED.
- **Non-blocking chains** — BOTH players keep playing while chains resolve. Nobody waits. Nobody stops. The action NEVER STOPS.
- **8 CPU faces with 3 EXPRESSIONS** — Each arcade opponent has a 32x32 sprite face with stressed/happy/worried states that react to gameplay IN REAL TIME
- **Sound effects** — PSG Channel C HIJACKED from the music for MAXIMUM IMPACT
- **Zero-flicker rendering** — 768 bytes. One LDIRVM. Every VBlank. The screen is ROCK SOLID.
- **4x speed** — This game runs FOUR TIMES faster than it should on 1983 hardware. THE Z80 DOESN'T CARE.
- **Pixel-smooth credits** — Because even the credits deserve to be CINEMATIC
- **Victory screen** — "P1 WINS!" hits you like a FREIGHT TRAIN
- **Attract mode** — Two CPUs fight TO THE DEATH while you watch with POPCORN
- **ESC to menu** — Because sometimes you need to WALK AWAY before you BREAK SOMETHING
- **Menu with STYLE** — Selected option BLINKS before launching. Because DRAMATIC PAUSES matter.

---

## CONTROLS (LEARN THEM OR DIE)

| Action | Player 1 | Player 2 / CPU |
|---|---|---|
| Move | Arrows / Joystick 1 | Joystick 2 |
| Rotate CW | Up / Z / Space / Btn A | Btn A |
| Rotate CCW | X / Btn B | Btn B |
| SLAM DOWN | Down | Down |
| Credits | C (menu) | — |
| TACTICAL RETREAT | ESC | — |

---

## THE HARDWARE (RESPECT IT)

| Component | Specification |
|---|---|
| CPU | Z80A @ 3.58 MHz — **FORGED IN 1976. STILL STANDING.** |
| Video | TMS9918A — 256x192, 16 colors, Screen 2. **PUSHED TO THE ABSOLUTE LIMIT.** |
| Sound | AY-3-8910 — 3 channels + noise. **EVERY CHANNEL COUNTS.** |
| ROM | 64KB flat. No mapper. No bank switching. **RAW POWER.** |
| RAM | 16KB total, 9KB used. **EVERY BYTE EARNED.** |
| Compiler | SDCC 4.2.0. **THE ONLY TOOL THAT COULD HANDLE THIS.** |

---

## THE TEAM (THEY DIDN'T ASK FOR THIS. THEY DID IT ANYWAY.)

- **ANTXIKO** — Director. Designer. Pixel artist. Music selector. The man who said *"dale"* 247 times and MEANT IT EVERY SINGLE TIME. He didn't just build a game. He built a LEGACY.

- **IGOR ERRAZKING** — Tileset artist. Walked in at build 209, looked at the puyos, said "I can do better," and PROVED IT. The puyos have FACES now. EIGHT of them. They STARE AT YOU.

- **THENESTRUO** — Graphic design. Art direction. Spoke FOUR WORDS that saved the ENTIRE PROJECT: *"buffer it in RAM."* That's it. Four words. ZERO FLICKER FOREVER.

- **JAUME** — Music. His compositions are COMING. When they arrive, this game will have a SOUNDTRACK that SLAPS.

- **CLAUDE OPUS 4.6** — Code. Tools. Engine integration. 47 incorrect flicker fixes. ONE correct one. Overflowed the ROM into RAM. Crashed the game at boot. Let the human play at HALF SPEED for 217 BUILDS. Said pixel scrolling was "too complex." GOT ABSOLUTELY ROASTED for it. **KEPT GOING.**

- **AKI** — Title music: *Milky Way in My Pocket*. ABSOLUTE BANGER.
- **LaESQ** — Gameplay music: *Ostagazuzulum*. THE NAME ALONE IS WORTH THE PRICE OF ADMISSION.
- **MSXgl** by Aoineko — The framework. THE FOUNDATION. Without it, NOTHING.
- **PT3 Player** — S.V.Bulba, Dioniso, MSXKun, SapphiRe, mvac7. THE UNSUNG HEROES.

---

## THE IMPOSSIBLE JOURNEY (240 BUILDS. ZERO REGRETS.)

**ACT I: THE FLICKER WAR (Builds 161-179)**

They said the flicker was UNFIXABLE. They said it was "how MSX1 works." They were WRONG.

Twenty builds. Three COMPLETE ARCHITECTURAL REWRITES. A dynamic pattern pool that wrote 17 bytes per connection per frame. A shadow system that NUKED THE ENTIRE BOARD during chain combos. Ghost connections that HAUNTED THE VRAM like the ghosts of puyos past.

Then TheNestruo spoke. Four words. *"Buffer it in RAM."* 768 bytes. One LDIRVM. The flicker didn't just stop. It became PHYSICALLY IMPOSSIBLE.

**THE TMS9918A WAS NEVER THE PROBLEM. THE PROGRAMMERS WERE.**

**ACT II: THE 64K EXPANSION (Builds 194-203)**

The ROM was FULL. 48KB. Not one byte left. They needed MORE ROOM.

They did what NO ONE expected. They SEIZED PAGE ZERO FROM THE BIOS ITSELF. `ROM_64K_ISR`. One line of config. FIFTEEN THOUSAND BYTES of virgin ROM appeared behind the interrupt sentinel. The assets went UNDERGROUND. The code got ROOM TO BREATHE.

**ACT III: THE GREAT UNBLOCKER (Build 217)**

The chain system was BLOCKING. When one player chained, the OTHER PLAYER FROZE. The game STOPPED. The world WAITED.

NOT ANYMORE. The entire chain system — gravity, flash, clear, effects — rewritten as a PER-PLAYER STATE MACHINE. One step per frame. ZERO pauses. ZERO blocking. Both players active. ALWAYS.

The old blocking code was DELETED. 1.9KB of ROM freed. The game NEVER STOPS.

**ACT IV: THE FACES (Build 240)**

Eight opponents need EIGHT FACES. The jetos system: 128 tiles compressed with ZX0 in page 0, decompressed to g_PT3Buffer, copied to VRAM tiles 92-95/124-127/156-159/188-191. Each face is a 4x4 tile block that STARES YOU DOWN from position (14,14).

The tileset was corrupted THREE TIMES during development. The build pipeline shared intermediate files. A dedicated `build_jetos.js` was born from the ASHES of that disaster.

But tiles weren't enough. The faces needed EXPRESSIONS. Three emotional states per opponent — stressed, happy, worried — rendered as FOUR 16x16 SPRITES forming a 32x32 composite face. That's 12 sprite patterns per jeto, 8 jetos, compressed individually with ZX0, decompressed to RAM, loaded to VRAM, and updated EVERY FRAME based on gameplay state. The CPU smiles when it's winning. It looks WORRIED when you chain. It looks STRESSED when garbage is about to fall.

The sprite colors refused to work for FIVE BUILDS because SDCC silently compiled a variable that was declared AFTER its first use, pointing to garbage memory. Color 0 = transparent. Every sprite was INVISIBLE. The fix: move ONE LINE to the top of the file.

**FIVE. BUILDS. ONE. LINE.**

---

## BUILD IT YOURSELF (IF YOU DARE)

See [COMPILE.md](COMPILE.md).

```bash
node tools/build_assets.js
node tools/build_jetos.js
node tools/build_jeto_sprites.js
cp src/puyopuyo.c MSXgl/projects/puyopuyo/
cd MSXgl/projects/puyopuyo && node ../../engine/script/js/build.js
```

ROM output: 65,536 bytes of PURE DETERMINATION.

---

## THE CONFESSION

This README was co-written by an AI that:

- Said "this should fix the flickering" FORTY-SEVEN TIMES
- Proposed double buffering on a chip with 16KB of VRAM. THE CHIP LAUGHED.
- Let the human play at HALF SPEED for TWO HUNDRED AND SEVENTEEN BUILDS because it divided by 4 instead of 8
- OVERFLOWED THE ROM INTO RAM and crashed the game AT BOOT
- Said pixel scrolling was "too complex." The human said: *"no es tan complejo no te flipes."* THE HUMAN WAS RIGHT.
- Generated jetos from THE WRONG TILESET. THREE TIMES.
- Made sprite colors INVISIBLE for five builds because it declared a variable AFTER using it. ONE LINE. FIVE BUILDS.
- Said "¿Se ven los sprites?" approximately FORTY SEVEN TIMES while the sprites were TRANSPARENTLY INVISIBLE
- Built a non-blocking chain system, realized it was 900 bytes too big for the ROM, then DELETED THE OLD SYSTEM and it fit
- Wrote "the Z80 breathes" about a chip that has done THE EXACT SAME THING since 1976

The human, through ALL of this, kept saying *"dale"*, *"perfecto"*, *"otra vez"*, and occasionally *"de puta madre"* when something FINALLY worked.

**The AI regrets NOTHING. The Z80 regrets NOTHING. The TMS9918A was NEVER CONSULTED.**

---

*242 builds. One Z80. Zero flicker. ZERO PAUSES. Eight faces. THREE EXPRESSIONS. One cartridge.*

*THE PUYOS. NEVER. STOP. FALLING.*

**PUYO PUYO VS. IN THEATERS NOW. RATED E FOR EPIC.**
