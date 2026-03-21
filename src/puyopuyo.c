// PuyoPuyo VS - MSX1 Screen 2 - 16x16 puyos
// 2 Player versus using Joystick 1 & 2
//=============================================================================
#include "msxgl.h"
#include "psg.h"
#include "math.h"
#include "pt3/pt3_player.h"
#include "compress/pletter.h"
#include "music_data.h"
#include "title_music.h"
#include "title_data.h"

//=============================================================================
// DEFINES
//=============================================================================

#define BOARD_W         6
#define BOARD_H         12

// Board positions in TILE coords (each puyo = 2x2 tiles)
// Layout: [wall 1t][P1 12t][wall 1t][center 4t][wall 1t][P2 12t][wall 1t] = 32
#define P1_BOARD_X      1    // tile X where P1 board starts
#define P1_BOARD_Y      0    // tile Y
#define P2_BOARD_X      19
#define P2_BOARD_Y      0
#define CENTER_X        14   // center info column (4 tiles wide: 14,15,16,17)

#define PUYO_EMPTY      0
#define PUYO_RED        1
#define PUYO_GREEN      2
#define PUYO_BLUE       3
#define PUYO_YELLOW     4
#define PUYO_PURPLE     5
#define PUYO_GARBAGE    6
#define PUYO_COUNT      5

#define STATE_TITLE     0
#define STATE_PLAYING   1
#define STATE_GAMEOVER  2

#define DROP_SPEED_INIT    16
#define DROP_SPEED_MIN     3
#define DROP_SPEED_SOFT    1
#define LOCK_DELAY         8

#define DIR_UP    0
#define DIR_RIGHT 1
#define DIR_DOWN  2
#define DIR_LEFT  3

// Pattern indices in VRAM (16x16 puyo = 4 tiles: TL, TR, BL, BR)
// Pat 0 = empty
// Pat 1-4 = red (TL,TR,BL,BR), 5-8 = green, 9-12 = blue, 13-16 = yellow, 17-20 = garbage
// Pat 21 = wall
#define PAT_EMPTY       0
#define PAT_BG          26  // animated background tile
#define PAT_PUYO_BASE   1   // first puyo color starts here, 4 patterns each
// Puyos: 1-24 (6 types x 4 quadrants: red,green,blue,yellow,purple,garbage)
#define PAT_WALL        25
#define PAT_GRAY_BASE   27  // grey puyo (4 quadrants: 27,28,29,30)
#define PAT_EXPLODE     31  // explosion burst pattern
// Font starts at 32

#define CHAIN_GARBAGE_BASE  1

//=============================================================================
// TYPES
//=============================================================================

typedef struct {
    u8 board[BOARD_H][BOARD_W];
    u8 puyoX, puyoY;
    u8 puyoColor1, puyoColor2;
    u8 puyoDir;
    u8 nextColor1, nextColor2;
    u8 dropTimer;
    u8 dropSpeed;
    u8 lockTimer;
    u8 inputDelay;
    u16 score;
    u16 prevScore;
    u8 chainCount;
    u8 pendingGarbage;
    u8 prevGarbage;
    u8 alive;
    u8 boardX, boardY;
    u8 rotateDelay;
    u8 subY;  // 0 = aligned, 1 = offset 8px down (half-cell)
    u8 piecesPlaced; // count of locked pieces (for speed progression)
    u8 maxChain;     // best chain this game
    u16 totalCleared; // total puyos cleared this game
} Player;

//=============================================================================
// GLOBALS
//=============================================================================

static Player g_Player[2];
static u8 g_GameState;
static u8 g_FrameCount;

// Music player state
static u16 g_MusicRow;
static u8 g_MusicFrameCount;
static bool g_MusicPlaying;

static u8 g_Shadow[2][BOARD_H][BOARD_W];
static u8 g_ConnPool; // next free pattern index for connection pool (128-255)
static u8 g_BoardDirty[2]; // set when board changes, triggers connection redraw
static u8 g_ShadowNext[2][2];
static u8 g_WallsDrawn;

//=============================================================================
// 16x16 PUYO PATTERNS WITH FACES
// Each puyo = 4 quadrants (TL,TR,BL,BR), each 8x8
// In Screen 2: per row, 1=foreground color, 0=background color
// Eye rows use bg=WHITE so holes in pattern become white eyes
// Mouth rows use bg=BLACK so holes become dark mouth
//=============================================================================

// Pattern data: [5 types][4 quadrants][8 rows]
// Types: 0=Red/Happy, 1=Green/Surprised, 2=Blue/Sleepy, 3=Yellow/Angry, 4=Garbage
static const u8 g_PuyoPat[6][4][8] = {
    // RED (Q0)
    {
        { 0x07, 0x1F, 0x3F, 0x30, 0x38, 0x24, 0x26, 0x1C }, // TL
        { 0xE0, 0xF8, 0xFC, 0x0C, 0x1C, 0x24, 0x64, 0x38 }, // TR
        { 0xFF, 0xFF, 0xFF, 0x7F, 0x7F, 0x3F, 0x1F, 0x03 }, // BL
        { 0xFF, 0xFF, 0xFF, 0xFE, 0xFE, 0xFC, 0xF8, 0xC0 }, // BR
    },
    // GREEN (Q1)
    {
        { 0x07, 0x3F, 0x7F, 0x0C, 0x1E, 0x22, 0x22, 0x22 }, // TL
        { 0xE0, 0xFC, 0xFE, 0x30, 0x78, 0x44, 0x44, 0x44 }, // TR
        { 0x1C, 0xFF, 0xFF, 0x7F, 0x7F, 0x3F, 0x0F, 0x03 }, // BL
        { 0x38, 0xFF, 0xFF, 0xFE, 0xFE, 0xFC, 0xF8, 0xC0 }, // BR
    },
    // BLUE (Q2)
    {
        { 0x07, 0x1F, 0x3F, 0x7F, 0x1C, 0x22, 0x14, 0x1C }, // TL
        { 0xE0, 0xF8, 0xFC, 0xFE, 0x38, 0x44, 0x28, 0x38 }, // TR
        { 0xFF, 0xFF, 0xFF, 0x7F, 0x3F, 0x1F, 0x0F, 0x03 }, // BL
        { 0xFF, 0xFF, 0xFF, 0xFE, 0xFC, 0xF8, 0xF0, 0xC0 }, // BR
    },
    // YELLOW (Q3)
    {
        { 0x07, 0x1F, 0x7F, 0x7F, 0x1C, 0x22, 0x22, 0x22 }, // TL
        { 0xE0, 0xF8, 0xFE, 0xFE, 0x38, 0x44, 0x44, 0x44 }, // TR
        { 0x1C, 0xFF, 0xFF, 0x7F, 0x7F, 0x1F, 0x0F, 0x03 }, // BL
        { 0x38, 0xFF, 0xFF, 0xFE, 0xFC, 0xFC, 0xF0, 0xC0 }, // BR
    },
    // PURPLE (Q4) - from morado.png
    {
        { 0x0F, 0x3F, 0x3F, 0x7F, 0x18, 0x24, 0x22, 0x1C }, // TL
        { 0xF0, 0xFC, 0xFC, 0xFE, 0x18, 0x24, 0x44, 0x38 }, // TR
        { 0xFF, 0xFF, 0xFF, 0xFF, 0x7F, 0x3F, 0x3F, 0x0F }, // BL
        { 0xFF, 0xFF, 0xFF, 0xFF, 0xFE, 0xFC, 0xFC, 0xF0 }, // BR
    },
    // GARBAGE - piedra (stone face from piedra.png)
    {
        { 0x0F, 0x3B, 0x7F, 0xE7, 0xDB, 0xDA, 0xCB, 0xC3 }, // TL
        { 0xF0, 0xFC, 0xFE, 0xE7, 0xDB, 0xDB, 0xCB, 0xC3 }, // TR
        { 0xE7, 0xFF, 0xFF, 0xBE, 0xFF, 0x77, 0x3F, 0x1E }, // BL
        { 0xE7, 0xFD, 0xFF, 0xFF, 0xFF, 0xF6, 0xFC, 0xF8 }, // BR
    },
};

// Color data per row: [5 types][4 quadrants][8 rows]
// Most rows: puyo_color on BLACK (body)
// Eye rows: puyo_color on WHITE (holes = white eyes)
// Mouth rows: puyo_color on BLACK (holes = dark mouth)
// Body rows: fg=body_color, bg=BLACK
// Eye rows: fg=WHITE, bg=body_color (white eyes on body, pupils=body color covered by black sprites)
#define RC COLOR_MERGE(COLOR_MEDIUM_RED, COLOR_BLACK)
#define RE COLOR_MERGE(COLOR_WHITE, COLOR_MEDIUM_RED)
#define GC COLOR_MERGE(COLOR_DARK_GREEN, COLOR_BLACK)
#define GE COLOR_MERGE(COLOR_WHITE, COLOR_DARK_GREEN)
#define BC COLOR_MERGE(COLOR_LIGHT_BLUE, COLOR_BLACK)
#define BE COLOR_MERGE(COLOR_WHITE, COLOR_LIGHT_BLUE)
#define YC COLOR_MERGE(COLOR_DARK_YELLOW, COLOR_BLACK)
#define YE COLOR_MERGE(COLOR_WHITE, COLOR_DARK_YELLOW)
#define MC COLOR_MERGE(COLOR_MAGENTA, COLOR_BLACK)
#define ME COLOR_MERGE(COLOR_WHITE, COLOR_MAGENTA)
#define XC COLOR_MERGE(COLOR_GRAY, COLOR_BLACK)

static const u8 g_PuyoCol[6][4][8] = {
    // RED (Q0)
    {
        { RC, RC, RC, RE, RE, RE, RE, RE }, // TL
        { RC, RC, RC, RE, RE, RE, RE, RE }, // TR
        { RC, RC, RC, RC, RC, RC, RC, RC }, // BL
        { RC, RC, RC, RC, RC, RC, RC, RC }, // BR
    },
    // GREEN (Q1)
    {
        { GC, GC, GC, GE, GE, GE, GE, GE }, // TL
        { GC, GC, GC, GE, GE, GE, GE, GE }, // TR
        { GE, GC, GC, GC, GC, GC, GC, GC }, // BL
        { GE, GC, GC, GC, GC, GC, GC, GC }, // BR
    },
    // BLUE (Q2)
    {
        { BC, BC, BC, BC, BE, BE, BE, BE }, // TL
        { BC, BC, BC, BC, BE, BE, BE, BE }, // TR
        { BC, BC, BC, BC, BC, BC, BC, BC }, // BL
        { BC, BC, BC, BC, BC, BC, BC, BC }, // BR
    },
    // YELLOW (Q3)
    {
        { YC, YC, YC, YC, YE, YE, YE, YE }, // TL
        { YC, YC, YC, YC, YE, YE, YE, YE }, // TR
        { YE, YC, YC, YC, YC, YC, YC, YC }, // BL
        { YE, YC, YC, YC, YC, YC, YC, YC }, // BR
    },
    // PURPLE (Q4)
    {
        { MC, MC, MC, MC, ME, ME, ME, ME }, // TL
        { MC, MC, MC, MC, ME, ME, ME, ME }, // TR
        { MC, MC, MC, MC, MC, MC, MC, MC }, // BL
        { MC, MC, MC, MC, MC, MC, MC, MC }, // BR
    },
    // GARBAGE
    {
        { XC, XC, XC, XC, XC, XC, XC, XC },
        { XC, XC, XC, XC, XC, XC, XC, XC },
        { XC, XC, XC, XC, XC, XC, XC, XC },
        { XC, XC, XC, XC, XC, XC, XC, XC },
    },
};

#undef RC
#undef RE
#undef GC
#undef GE
#undef BC
#undef BE
#undef YC
#undef YE
#undef MC
#undef ME
#undef XC

// Pupil sprite patterns: 8x8 sprites, BLACK color
// [4 puyo types][2 eyes: left TL + right TR][8 rows]
// Only top half of puyo has pupils (TL and TR tiles)
static const u8 g_PupilSprite[4][2][8] = {
    // RED pupils
    { { 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x18, 0x00 },   // left eye
      { 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x18, 0x00 } },  // right eye
    // GREEN pupils
    { { 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00 },
      { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x18 } },
    // BLUE pupils
    { { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00 },
      { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00 } },
    // YELLOW pupils
    { { 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x14, 0x0C },
      { 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x28, 0x18 } },
};

// Animated background pattern (very subtle: ~4 pixels spread across 8x8)
static const u8 g_BgBasePattern[8] = {
    0x00, 0x00, 0x10, 0x00, 0x00, 0x02, 0x00, 0x00
};

static const u8 g_PatEmptyTile[8] = {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};

static const u8 g_PatWallTile[8] = {
    0xFF, 0x81, 0xBD, 0xA5, 0xA5, 0xBD, 0x81, 0xFF
};

// Explosion burst pattern (8x8 star)
static const u8 g_PatExplode[8] = {
    0x08, 0x49, 0x2A, 0x1C, 0x1C, 0x2A, 0x49, 0x08
};

static const u8 g_WallColor = COLOR_MERGE(COLOR_WHITE, COLOR_DARK_BLUE);
static const u8 g_EmptyColor = COLOR_MERGE(COLOR_BLACK, COLOR_BLACK);

//=============================================================================
// FONT
//=============================================================================
#include "font/font_mgl_sample8.h"

//=============================================================================
// FORWARD DECLARATIONS
//=============================================================================
static void Game_Init(void);
static void Game_InitPlayer(Player* p, u8 bx, u8 by);
static void Game_SpawnPair(Player* p);
static void Game_Update(void);
static void Game_UpdatePlayer(Player* p, u8 joyPort);
static bool Game_CanPlace(Player* p, u8 x, u8 y);
static void Game_LockPair(Player* p);
static bool Game_ApplyGravity(Player* p);
static u8 Game_ClearGroups(Player* p);
static void Game_ChainLoop(Player* p, Player* opponent);
static void Game_AddGarbage(Player* p);
static void Game_DrawBoard(Player* p, u8 playerIdx);
static void Game_DrawConnections(Player* p);
static void Game_DrawScore(Player* p);
static void Game_DrawTitle(void);
static void Game_DrawGameOver(void);
static i8 Game_GetSatX(u8 dir);
static i8 Game_GetSatY(u8 dir);
static void SFX_Update(void);
static void SFX_Drop(void);
static void Game_FlashWalls(Player* p, u8 color);
static void Game_RestoreWalls(void);
static bool Game_IsInDanger(Player* p);
static void SFX_Clear(void);
static void SFX_Chain(u8 chain);
static void SFX_Garbage(void);
static void SFX_GarbageReceive(void);
static void SFX_Victory(void);

//=============================================================================
// HELPERS
//=============================================================================

static i8 Game_GetSatX(u8 dir) {
    static const i8 dx[4] = { 0, 1, 0, -1 };
    return dx[dir];
}

static i8 Game_GetSatY(u8 dir) {
    static const i8 dy[4] = { -1, 0, 1, 0 };
    return dy[dir];
}

static void WaitFrames(u8 count) {
    while (count > 0) { Halt(); count--; }
}

//=============================================================================
// MUSIC PLAYER (custom, row-based)
//=============================================================================

//=============================================================================
// TITLE MUSIC PLAYER
//=============================================================================

static void TitleMusic_Start(void) {
    g_MusicRow = 0;
    g_MusicFrameCount = 0;
    g_MusicPlaying = TRUE;
    PSG_Mute();
    PSG_SetRegister(7, 0x38);
}

static void TitleMusic_Update(void) {
    u16 a;

    if (!g_MusicPlaying) return;

    g_MusicFrameCount++;
    if (g_MusicFrameCount < TITLE_MUSIC_FRAMES_PER_ROW) return;
    g_MusicFrameCount = 0;

    a = g_TitleMusicData[g_MusicRow];

    if (a == 1) {
        PSG_SetRegister(8, 0);
    } else if (a > 1) {
        PSG_SetRegister(0, (u8)(a & 0xFF));
        PSG_SetRegister(1, (u8)(a >> 8));
        PSG_SetRegister(8, 11);
    }

    g_MusicRow++;
    if (g_MusicRow >= TITLE_MUSIC_ROWS) {
        g_MusicRow = TITLE_MUSIC_LOOP_ROW;
    }
}

//=============================================================================
// GAMEPLAY MUSIC PLAYER
//=============================================================================

static void Music_Start(void) {
    g_MusicRow = 0;
    g_MusicFrameCount = 0;
    g_MusicPlaying = TRUE;
    PSG_Mute();  // silence first
    // Enable tone on all 3 channels, disable noise
    // Register 7: bits 0-2 tone (0=on), bits 3-5 noise (1=off)
    PSG_SetRegister(7, 0x38);  // 00111000 = tones on, noise off
}

static void Music_Stop(void) {
    g_MusicPlaying = FALSE;
    PSG_Mute();
}

static void Music_Update(void) {
    u16 a, b, c;

    if (!g_MusicPlaying) return;

    g_MusicFrameCount++;
    if (g_MusicFrameCount < 3) return;
    g_MusicFrameCount = 0;

    a = g_MusicData[g_MusicRow][0];
    b = g_MusicData[g_MusicRow][1];
    c = g_MusicData[g_MusicRow][2];

    // Channel A (registers 0,1=tone, 8=volume)
    if (a == 1) {
        PSG_SetRegister(8, 0);
    } else if (a > 1) {
        PSG_SetRegister(0, (u8)(a & 0xFF));
        PSG_SetRegister(1, (u8)(a >> 8));
        PSG_SetRegister(8, 11);
    }

    // Channel B (registers 2,3=tone, 9=volume)
    if (b == 1) {
        PSG_SetRegister(9, 0);
    } else if (b > 1) {
        PSG_SetRegister(2, (u8)(b & 0xFF));
        PSG_SetRegister(3, (u8)(b >> 8));
        PSG_SetRegister(9, 8);
    }

    // Channel C (registers 4,5=tone, 10=volume)
    if (c == 1) {
        PSG_SetRegister(10, 0);
    } else if (c > 1) {
        PSG_SetRegister(4, (u8)(c & 0xFF));
        PSG_SetRegister(5, (u8)(c >> 8));
        PSG_SetRegister(10, 12);
    }

    g_MusicRow++;
    if (g_MusicRow >= MUSIC_ROWS) {
        g_MusicRow = MUSIC_LOOP_ROW;
    }
}

//=============================================================================
// SOUND EFFECTS (all on Channel C - registers 4,5,10)
//=============================================================================

static u8 g_SfxTimer;   // frames remaining for current SFX
static u8 g_SfxVolume;  // current SFX volume (decays)

// Call every frame to handle SFX decay on channel C
static void SFX_Update(void) {
    if (g_SfxTimer > 0) {
        g_SfxTimer--;
        // Decay volume
        if (g_SfxTimer > 0 && (g_SfxTimer & 1) == 0 && g_SfxVolume > 0) {
            g_SfxVolume--;
        }
        PSG_SetRegister(10, g_SfxVolume);
        if (g_SfxTimer == 0) {
            PSG_SetRegister(10, 0); // silence channel C
        }
    }
}

// Piece locks into place - short thud
static void SFX_Drop(void) {
    PSG_SetRegister(4, (u8)(600 & 0xFF));
    PSG_SetRegister(5, (u8)(600 >> 8));
    g_SfxVolume = 10;
    g_SfxTimer = 6;
    PSG_SetRegister(10, g_SfxVolume);
}

// Group of 4+ cleared - bright pop
static void SFX_Clear(void) {
    PSG_SetRegister(4, (u8)(200 & 0xFF));
    PSG_SetRegister(5, (u8)(200 >> 8));
    g_SfxVolume = 13;
    g_SfxTimer = 12;
    PSG_SetRegister(10, g_SfxVolume);
}

// Chain combo - ascending pitch per chain step
static void SFX_Chain(u8 chain) {
    u16 tone = 250 - (chain * 25);
    if (tone < 50) tone = 50;
    PSG_SetRegister(4, (u8)(tone & 0xFF));
    PSG_SetRegister(5, (u8)(tone >> 8));
    g_SfxVolume = 14;
    g_SfxTimer = 15;
    PSG_SetRegister(10, g_SfxVolume);
}

// Garbage sent to opponent - low rumble
static void SFX_Garbage(void) {
    PSG_SetRegister(4, (u8)(900 & 0xFF));
    PSG_SetRegister(5, (u8)(900 >> 8));
    g_SfxVolume = 12;
    g_SfxTimer = 10;
    PSG_SetRegister(10, g_SfxVolume);
}

// Garbage received/lands - impact thump
static void SFX_GarbageReceive(void) {
    PSG_SetRegister(4, (u8)(1200 & 0xFF));
    PSG_SetRegister(5, (u8)(1200 >> 8));
    g_SfxVolume = 14;
    g_SfxTimer = 8;
    PSG_SetRegister(10, g_SfxVolume);
}

// Victory jingle (plays after music stops, uses all channels)
static void SFX_Victory(void) {
    PSG_SetRegister(7, 0x38); // all tones on
    // C major arpeggio ascending
    PSG_SetRegister(0, (u8)(213 & 0xFF)); PSG_SetRegister(1, (u8)(213 >> 8)); // C4
    PSG_SetRegister(8, 12);
    WaitFrames(8);
    PSG_SetRegister(0, (u8)(169 & 0xFF)); PSG_SetRegister(1, (u8)(169 >> 8)); // E4
    WaitFrames(8);
    PSG_SetRegister(0, (u8)(142 & 0xFF)); PSG_SetRegister(1, (u8)(142 >> 8)); // G4
    WaitFrames(8);
    // Big C5 chord
    PSG_SetRegister(0, (u8)(106 & 0xFF)); PSG_SetRegister(1, (u8)(106 >> 8)); // C5
    PSG_SetRegister(2, (u8)(169 & 0xFF)); PSG_SetRegister(3, (u8)(169 >> 8)); // E4
    PSG_SetRegister(4, (u8)(213 & 0xFF)); PSG_SetRegister(5, (u8)(213 >> 8)); // C4
    PSG_SetRegister(8, 13); PSG_SetRegister(9, 10); PSG_SetRegister(10, 10);
    WaitFrames(20);
    // Fade
    PSG_SetRegister(8, 6); PSG_SetRegister(9, 4); PSG_SetRegister(10, 4);
    WaitFrames(10);
    PSG_Mute();
}

//=============================================================================
// VDP SETUP - load 16x16 puyo patterns
//=============================================================================

static void VDP_Setup(void) {
    u8 colorBuf[8];
    u8 bank, c, q, i, idx;
    u16 patBase, colBase;

    VDP_SetMode(VDP_MODE_GRAPHIC2);
    VDP_ClearVRAM();
    VDP_EnableVBlank(TRUE);

    VDP_DisableSpritesFrom(0);

    for (bank = 0; bank < 3; bank++) {
        patBase = g_ScreenPatternLow + (bank * 0x800);
        colBase = g_ScreenColorLow + (bank * 0x800);

        // Pattern 0: empty (true black)
        VDP_WriteVRAM_16K(g_PatEmptyTile, patBase, 8);
        for (i = 0; i < 8; i++) colorBuf[i] = g_EmptyColor;
        VDP_WriteVRAM_16K(colorBuf, colBase, 8);

        // Pattern PAT_BG: animated background
        VDP_WriteVRAM_16K(g_BgBasePattern, patBase + (PAT_BG * 8), 8);
        for (i = 0; i < 8; i++) colorBuf[i] = COLOR_MERGE(COLOR_DARK_BLUE, COLOR_BLACK);
        VDP_WriteVRAM_16K(colorBuf, colBase + (PAT_BG * 8), 8);

        // Patterns 1-20: puyo types with faces (5 types x 4 quadrants)
        for (c = 0; c < 6; c++) {
            for (q = 0; q < 4; q++) {
                idx = PAT_PUYO_BASE + (c * 4) + q;
                VDP_WriteVRAM_16K(g_PuyoPat[c][q], patBase + (idx * 8), 8);
                VDP_WriteVRAM_16K(g_PuyoCol[c][q], colBase + (idx * 8), 8);
            }
        }

        // Pattern 21: wall
        VDP_WriteVRAM_16K(g_PatWallTile, patBase + (PAT_WALL * 8), 8);
        for (i = 0; i < 8; i++) colorBuf[i] = g_WallColor;
        VDP_WriteVRAM_16K(colorBuf, colBase + (PAT_WALL * 8), 8);

        // Patterns 23-26: grey puyo (same shape as red, grey+white colors)
        for (q = 0; q < 4; q++) {
            idx = PAT_GRAY_BASE + q;
            VDP_WriteVRAM_16K(g_PuyoPat[0][q], patBase + (idx * 8), 8);  // reuse red shape
            for (i = 0; i < 8; i++) {
                u8 orig = g_PuyoCol[0][q][i];
                u8 fg = orig >> 4;
                u8 bg = orig & 0x0F;
                if (fg != COLOR_WHITE) fg = COLOR_GRAY;
                if (bg != COLOR_BLACK) bg = COLOR_GRAY;
                colorBuf[i] = (fg << 4) | bg;
            }
            VDP_WriteVRAM_16K(colorBuf, colBase + (idx * 8), 8);
        }

        // Pattern 31: explosion burst
        VDP_WriteVRAM_16K(g_PatExplode, patBase + (PAT_EXPLODE * 8), 8);
        for (i = 0; i < 8; i++) colorBuf[i] = COLOR_MERGE(COLOR_WHITE, COLOR_BLACK);
        VDP_WriteVRAM_16K(colorBuf, colBase + (PAT_EXPLODE * 8), 8);
    }

    Print_SetTextFont(g_Font_MGL_Sample8, 32);
    Print_SetColor(COLOR_WHITE, COLOR_BLACK);
}

//=============================================================================
// DRAW FUNCTIONS - 16x16 puyos (2x2 tiles each)
//=============================================================================

// Draw a single puyo (2x2 tiles) at tile position (tx, ty)
static void DrawPuyo16(u8 tx, u8 ty, u8 color) {
    u8 base;
    if (color == PUYO_EMPTY || color > PUYO_GARBAGE) {
        VDP_Poke_GM2(tx,     ty,     PAT_BG);
        VDP_Poke_GM2(tx + 1, ty,     PAT_BG);
        VDP_Poke_GM2(tx,     ty + 1, PAT_BG);
        VDP_Poke_GM2(tx + 1, ty + 1, PAT_BG);
    } else {
        base = PAT_PUYO_BASE + (color - 1) * 4;
        VDP_Poke_GM2(tx,     ty,     base);      // TL
        VDP_Poke_GM2(tx + 1, ty,     base + 1);  // TR
        VDP_Poke_GM2(tx,     ty + 1, base + 2);  // BL
        VDP_Poke_GM2(tx + 1, ty + 1, base + 3);  // BR
    }
}

static void Shadow_Invalidate(void) {
    u8 p, x, y;
    for (p = 0; p < 2; p++) {
        for (y = 0; y < BOARD_H; y++)
            for (x = 0; x < BOARD_W; x++)
                g_Shadow[p][y][x] = 0xFF;
        g_ShadowNext[p][0] = 0xFF;
        g_ShadowNext[p][1] = 0xFF;
    }
    g_WallsDrawn = FALSE;
}

// Draw a falling puyo at sub-tile position (2x2 tiles with 1-tile Y offset)
static void DrawPuyoSub(u8 tx, u8 ty, u8 color) {
    u8 base;
    if (color == PUYO_EMPTY || color > PUYO_GARBAGE) return;
    base = PAT_PUYO_BASE + (color - 1) * 4;
    // Draw bottom half of puyo at ty, top half at ty+1
    VDP_Poke_GM2(tx,     ty,     base + 2);  // BL at top
    VDP_Poke_GM2(tx + 1, ty,     base + 3);  // BR at top
    VDP_Poke_GM2(tx,     ty + 1, base);      // TL at bottom
    VDP_Poke_GM2(tx + 1, ty + 1, base + 1);  // TR at bottom
}

static void Game_DrawBoard(Player* p, u8 playerIdx) {
    u8 x, y;
    u8 bx = p->boardX;
    u8 by = p->boardY;
    u8 visible[BOARD_H][BOARD_W];
    u8 hasFalling = (p->alive && p->puyoColor1 != PUYO_EMPTY);

    // Build visible state (board only, no falling pair)
    for (y = 0; y < BOARD_H; y++)
        for (x = 0; x < BOARD_W; x++)
            visible[y][x] = p->board[y][x];

    // If subY==0, overlay falling pair into visible grid (aligned)
    if (hasFalling && p->subY == 0) {
        if (p->puyoY < BOARD_H && p->puyoX < BOARD_W) {
            visible[p->puyoY][p->puyoX] = p->puyoColor1;
        }
        {
            i8 sxs = (i8)p->puyoX + Game_GetSatX(p->puyoDir);
            i8 sys = (i8)p->puyoY + Game_GetSatY(p->puyoDir);
            if (sxs >= 0 && sxs < BOARD_W && sys >= 0 && sys < BOARD_H) {
                visible[sys][sxs] = p->puyoColor2;
            }
        }
    }

    // Only update changed cells (each cell = 2x2 tiles)
    for (y = 0; y < BOARD_H; y++) {
        for (x = 0; x < BOARD_W; x++) {
            if (visible[y][x] != g_Shadow[playerIdx][y][x]) {
                g_Shadow[playerIdx][y][x] = visible[y][x];
                DrawPuyo16(bx + x * 2, by + y * 2, visible[y][x]);
            }
        }
    }

    // If subY==1, draw falling pair at half-cell offset (between rows)
    if (hasFalling && p->subY == 1) {
        // Force redraw of affected cells next frame
        u8 px = p->puyoX, py = p->puyoY;
        i8 sx = (i8)px + Game_GetSatX(p->puyoDir);
        i8 sy = (i8)py + Game_GetSatY(p->puyoDir);

        // Draw main puyo at half position: tile row = py*2 + 1
        if (py < BOARD_H && px < BOARD_W) {
            u8 ty = by + py * 2 + 1;
            u8 base = PAT_PUYO_BASE + (p->puyoColor1 - 1) * 4;
            VDP_Poke_GM2(bx + px * 2,     ty,     base);      // TL
            VDP_Poke_GM2(bx + px * 2 + 1, ty,     base + 1);  // TR
            VDP_Poke_GM2(bx + px * 2,     ty + 1, base + 2);  // BL
            VDP_Poke_GM2(bx + px * 2 + 1, ty + 1, base + 3);  // BR
            // Invalidate shadow for this cell and the one below
            g_Shadow[playerIdx][py][px] = 0xFF;
            if (py + 1 < BOARD_H) g_Shadow[playerIdx][py + 1][px] = 0xFF;
        }

        // Draw satellite puyo at half position
        if (sx >= 0 && sx < BOARD_W && sy >= 0 && sy < BOARD_H) {
            u8 ty = by + (u8)sy * 2 + 1;
            u8 base = PAT_PUYO_BASE + (p->puyoColor2 - 1) * 4;
            VDP_Poke_GM2(bx + (u8)sx * 2,     ty,     base);
            VDP_Poke_GM2(bx + (u8)sx * 2 + 1, ty,     base + 1);
            VDP_Poke_GM2(bx + (u8)sx * 2,     ty + 1, base + 2);
            VDP_Poke_GM2(bx + (u8)sx * 2 + 1, ty + 1, base + 3);
            g_Shadow[playerIdx][(u8)sy][(u8)sx] = 0xFF;
            if ((u8)sy + 1 < BOARD_H) g_Shadow[playerIdx][(u8)sy + 1][(u8)sx] = 0xFF;
        }
    }

    // Draw walls once
    if (!g_WallsDrawn) {
        // P1 walls: left at x=0, right at x=13
        for (y = 0; y < 24; y++) {
            VDP_Poke_GM2(0, y, PAT_WALL);
            VDP_Poke_GM2(13, y, PAT_WALL);
            VDP_Poke_GM2(18, y, PAT_WALL);
            VDP_Poke_GM2(31, y, PAT_WALL);
        }
        g_WallsDrawn = TRUE;
    }

    // Next piece preview (2 puyos stacked, in center area)
    {
        u8 nx, ny;
        if (playerIdx == 0) {
            nx = CENTER_X; ny = 2;
        } else {
            nx = CENTER_X + 2; ny = 2;
        }
        if (p->nextColor1 != g_ShadowNext[playerIdx][0]) {
            g_ShadowNext[playerIdx][0] = p->nextColor1;
            DrawPuyo16(nx, ny, p->nextColor1);
        }
        if (p->nextColor2 != g_ShadowNext[playerIdx][1]) {
            g_ShadowNext[playerIdx][1] = p->nextColor2;
            DrawPuyo16(nx, ny + 2, p->nextColor2);
        }
    }
}

// Draw blob connections: fill corners where same-color puyos are adjacent
static void Game_DrawConnections(Player* p) {
    u8 x, y, color, ci, q, bx, by;
    u8 patBuf[8];
    bx = p->boardX;
    by = p->boardY;

    for (y = 0; y < BOARD_H; y++) {
        for (x = 0; x < BOARD_W; x++) {
            color = p->board[y][x];
            if (color < 1 || color > PUYO_COUNT) continue;

            // Skip falling pair cells
            if (p->alive && p->puyoColor1 != PUYO_EMPTY) {
                if (p->puyoX == x && p->puyoY == y) continue;
                {
                    i8 sx2 = (i8)p->puyoX + Game_GetSatX(p->puyoDir);
                    i8 sy2 = (i8)p->puyoY + Game_GetSatY(p->puyoDir);
                    if ((u8)sx2 == x && (u8)sy2 == y) continue;
                }
            }

            ci = color - 1;
            {
                u8 cU = (y > 0 && p->board[y-1][x] == color) ? 1 : 0;
                u8 cD = (y+1 < BOARD_H && p->board[y+1][x] == color) ? 1 : 0;
                u8 cL = (x > 0 && p->board[y][x-1] == color) ? 1 : 0;
                u8 cR = (x+1 < BOARD_W && p->board[y][x+1] == color) ? 1 : 0;

                if (!cU && !cD && !cL && !cR) continue;

                for (q = 0; q < 4; q++) {
                    u8 needFill = 0;
                    u8 tx, ty2, bank, idx, i;

                    if (q == 0 && (cU || cL)) needFill = 1;
                    if (q == 1 && (cU || cR)) needFill = 1;
                    if (q == 2 && (cD || cL)) needFill = 1;
                    if (q == 3 && (cD || cR)) needFill = 1;

                    if (!needFill) continue;
                    if (g_ConnPool >= 255) continue;

                    for (i = 0; i < 8; i++) patBuf[i] = g_PuyoPat[ci][q][i];

                    if (q < 2) {
                        patBuf[0] = 0xFF; patBuf[1] = 0xFF; patBuf[2] = 0xFF;
                    } else {
                        patBuf[5] = 0xFF; patBuf[6] = 0xFF; patBuf[7] = 0xFF;
                        if (q == 2 && cL) { patBuf[3] |= 0x80; patBuf[4] |= 0x80; }
                        if (q == 3 && cR) { patBuf[3] |= 0x01; patBuf[4] |= 0x01; }
                    }

                    tx = bx + x * 2 + (q & 1);
                    ty2 = by + y * 2 + (q >> 1);
                    bank = ty2 / 8;
                    idx = g_ConnPool++;

                    VDP_WriteVRAM_16K(patBuf, g_ScreenPatternLow + (u16)bank * 0x800 + (u16)idx * 8, 8);
                    VDP_WriteVRAM_16K(g_PuyoCol[ci][q], g_ScreenColorLow + (u16)bank * 0x800 + (u16)idx * 8, 8);
                    VDP_Poke_GM2(tx, ty2, idx);
                }
            }
        }
    }
}

static void Game_DrawScore(Player* p) {
    u8 sx, sy;

    if (p->score == p->prevScore && p->pendingGarbage == p->prevGarbage) return;
    p->prevScore = p->score;
    p->prevGarbage = p->pendingGarbage;

    if (p == &g_Player[0]) {
        sx = CENTER_X; sy = 8;
    } else {
        sx = CENTER_X; sy = 12;
    }

    Print_SetPosition(sx, sy);
    Print_DrawChar('0' + (p->score / 10000) % 10);
    Print_DrawChar('0' + (p->score / 1000) % 10);
    Print_DrawChar('0' + (p->score / 100) % 10);
    Print_DrawChar('0' + (p->score / 10) % 10);

    if (p->pendingGarbage > 0) {
        Print_SetPosition(sx, sy + 1);
        Print_DrawChar('G');
        Print_DrawChar('0' + (p->pendingGarbage / 10) % 10);
        Print_DrawChar('0' + p->pendingGarbage % 10);
    } else {
        Print_SetPosition(sx, sy + 1);
        Print_DrawChar(' ');
        Print_DrawChar(' ');
        Print_DrawChar(' ');
    }
}

static void Game_DrawTitle(void) {
    u16 i;

    // Disable BIOS key click
    *((u8*)0xF3DB) = 0;

    // Set up Screen 2 and clear VRAM
    VDP_SetMode(VDP_MODE_GRAPHIC2);
    VDP_ClearVRAM();
    VDP_EnableVBlank(TRUE);

    // Decompress title screen patterns to VRAM (3 banks x 2048 = 6144 bytes at 0x0000)
    Pletter_UnpackToVRAM(g_TitlePattern, g_ScreenPatternLow);

    // Set up name table: 0,1,2,...,255 repeated 3 times (at 0x1800)
    for (i = 0; i < 768; i++) {
        VDP_Poke_16K((u8)(i & 0xFF), g_ScreenLayoutLow + i);
    }

    // Decompress title screen colors to VRAM (3 banks x 2048 = 6144 bytes at 0x2000)
    Pletter_UnpackToVRAM(g_TitleColor, g_ScreenColorLow);
}

// Animate loser's board turning grey, row by row from top
// Uses dedicated grey puyo patterns so winner's puyos are unaffected
static void Game_AnimateGameOver(void) {
    u8 loserIdx, y, x, bx, by;
    Player* loser;

    if (!g_Player[0].alive) loserIdx = 0;
    else loserIdx = 1;
    loser = &g_Player[loserIdx];
    bx = loser->boardX;
    by = loser->boardY;

    for (y = 0; y < BOARD_H; y++) {
        for (x = 0; x < BOARD_W; x++) {
            if (loser->board[y][x] != PUYO_EMPTY) {
                // Replace with grey puyo pattern
                VDP_Poke_GM2(bx + x * 2,     by + y * 2,     PAT_GRAY_BASE);
                VDP_Poke_GM2(bx + x * 2 + 1, by + y * 2,     PAT_GRAY_BASE + 1);
                VDP_Poke_GM2(bx + x * 2,     by + y * 2 + 1, PAT_GRAY_BASE + 2);
                VDP_Poke_GM2(bx + x * 2 + 1, by + y * 2 + 1, PAT_GRAY_BASE + 3);
            }
        }
        Halt(); Halt();
    }
}

static void Game_DrawGameOver(void) {
    // Animate the loser's board
    if (g_Player[0].alive || g_Player[1].alive) {
        Game_AnimateGameOver();
    }

    // Show winner in center
    Print_SetPosition(CENTER_X, 10);
    if (!g_Player[0].alive && !g_Player[1].alive) {
        Print_DrawText("DRAW");
    } else if (!g_Player[0].alive) {
        Print_DrawText("P2 W");
    } else {
        Print_DrawText("P1 W");
    }
}

// Dedicated stats screen with "STATS" written using puyos
static void Game_DrawStatsScreen(void) {
    u8 p, sx, sy;
    Player *pw;

    // Reinit VDP to get clean patterns/colors
    VDP_Setup();
    VDP_FillScreen_GM2(PAT_EMPTY);

    // Decorative puyo row at top
    DrawPuyo16(2,  1, PUYO_RED);
    DrawPuyo16(6,  1, PUYO_GREEN);
    DrawPuyo16(10, 1, PUYO_BLUE);
    DrawPuyo16(14, 1, PUYO_YELLOW);
    DrawPuyo16(18, 1, PUYO_RED);
    DrawPuyo16(22, 1, PUYO_GREEN);
    DrawPuyo16(26, 1, PUYO_BLUE);

    // "STATS" title text
    Print_SetPosition(11, 4);
    Print_DrawText("- STATS -");

    // Winner text
    Print_SetPosition(11, 9);
    if (!g_Player[0].alive && !g_Player[1].alive) {
        Print_DrawText("DRAW GAME!");
    } else if (!g_Player[0].alive) {
        Print_DrawText("P2  WINS!");
    } else {
        Print_DrawText("P1  WINS!");
    }

    // Stats for both players side by side
    for (p = 0; p < 2; p++) {
        pw = &g_Player[p];
        sx = (p == 0) ? 3 : 19;
        sy = 12;

        Print_SetPosition(sx + 1, sy);
        if (p == 0) Print_DrawText("PLAYER 1");
        else        Print_DrawText("PLAYER 2");

        Print_SetPosition(sx, sy + 2);
        Print_DrawText("SCORE");
        Print_SetPosition(sx + 1, sy + 3);
        Print_DrawChar('0' + (pw->score / 10000) % 10);
        Print_DrawChar('0' + (pw->score / 1000) % 10);
        Print_DrawChar('0' + (pw->score / 100) % 10);
        Print_DrawChar('0' + (pw->score / 10) % 10);
        Print_DrawChar('0' + pw->score % 10);

        Print_SetPosition(sx, sy + 5);
        Print_DrawText("CHAIN");
        Print_SetPosition(sx + 3, sy + 6);
        Print_DrawChar('0' + pw->maxChain);

        Print_SetPosition(sx, sy + 8);
        Print_DrawText("CLEAR");
        Print_SetPosition(sx + 2, sy + 9);
        Print_DrawChar('0' + (pw->totalCleared / 100) % 10);
        Print_DrawChar('0' + (pw->totalCleared / 10) % 10);
        Print_DrawChar('0' + pw->totalCleared % 10);
    }
}

//=============================================================================
// GAME LOGIC (unchanged)
//=============================================================================

static void Game_InitPlayer(Player* p, u8 bx, u8 by) {
    u8 x, y;
    for (y = 0; y < BOARD_H; y++)
        for (x = 0; x < BOARD_W; x++)
            p->board[y][x] = PUYO_EMPTY;

    p->boardX = bx;
    p->boardY = by;
    p->score = 0;
    p->prevScore = 0xFFFF;
    p->chainCount = 0;
    p->pendingGarbage = 0;
    p->prevGarbage = 0xFF;
    p->alive = TRUE;
    p->dropSpeed = DROP_SPEED_INIT;
    p->dropTimer = 0;
    p->lockTimer = 0;
    p->inputDelay = 0;
    p->rotateDelay = 0;
    p->subY = 0;
    p->piecesPlaced = 0;
    p->maxChain = 0;
    p->totalCleared = 0;
    p->puyoColor1 = PUYO_EMPTY;
    p->puyoColor2 = PUYO_EMPTY;

    p->nextColor1 = (Math_GetRandom8() % PUYO_COUNT) + 1;
    p->nextColor2 = (Math_GetRandom8() % PUYO_COUNT) + 1;
}

static void Game_SpawnPair(Player* p) {
    p->puyoX = 2;
    p->puyoY = 0;
    p->puyoDir = DIR_UP;
    p->subY = 0;
    p->puyoColor1 = p->nextColor1;
    p->puyoColor2 = p->nextColor2;
    p->nextColor1 = (Math_GetRandom8() % PUYO_COUNT) + 1;
    p->nextColor2 = (Math_GetRandom8() % PUYO_COUNT) + 1;
    p->dropTimer = 0;
    p->lockTimer = 0;
    if (p->board[0][2] != PUYO_EMPTY || p->board[0][3] != PUYO_EMPTY) {
        p->alive = FALSE;
    }
}

static bool Game_CanPlace(Player* p, u8 x, u8 y) {
    if (x >= BOARD_W || y >= BOARD_H) return FALSE;
    return (p->board[y][x] == PUYO_EMPTY);
}

static bool Game_CanMovePair(Player* p, i8 dx, i8 dy) {
    i8 nx = (i8)p->puyoX + dx;
    i8 ny = (i8)p->puyoY + dy;
    i8 sx = nx + Game_GetSatX(p->puyoDir);
    i8 sy = ny + Game_GetSatY(p->puyoDir);
    if (nx < 0 || nx >= BOARD_W || ny < 0 || ny >= BOARD_H) return FALSE;
    if (p->board[ny][nx] != PUYO_EMPTY) return FALSE;
    if (sx < 0 || sx >= BOARD_W) return FALSE;
    if (sy >= 0 && sy < BOARD_H && p->board[sy][sx] != PUYO_EMPTY) return FALSE;
    if (sy >= BOARD_H) return FALSE;
    return TRUE;
}

static void Game_RotatePair(Player* p, i8 direction) {
    u8 newDir = (p->puyoDir + direction + 4) % 4;
    i8 sx = (i8)p->puyoX + Game_GetSatX(newDir);
    i8 sy = (i8)p->puyoY + Game_GetSatY(newDir);
    i8 kickX, kickY, px, py;
    if (sx >= 0 && sx < BOARD_W && sy >= 0 && sy < BOARD_H) {
        if (p->board[sy][sx] == PUYO_EMPTY) { p->puyoDir = newDir; return; }
    }
    if (sx >= 0 && sx < BOARD_W && sy < 0) { p->puyoDir = newDir; return; }
    kickX = -Game_GetSatX(newDir);
    kickY = -Game_GetSatY(newDir);
    px = (i8)p->puyoX + kickX;
    py = (i8)p->puyoY + kickY;
    if (px >= 0 && px < BOARD_W && py >= 0 && py < BOARD_H) {
        if (p->board[py][px] == PUYO_EMPTY) {
            sx = px + Game_GetSatX(newDir);
            sy = py + Game_GetSatY(newDir);
            if (sx >= 0 && sx < BOARD_W && sy >= 0 && sy < BOARD_H && p->board[sy][sx] == PUYO_EMPTY) {
                p->puyoX = px; p->puyoY = py; p->puyoDir = newDir; return;
            }
        }
    }
}

static void Game_LockPair(Player* p) {
    u8 sx, sy;
    if (p->puyoY < BOARD_H && p->puyoX < BOARD_W)
        p->board[p->puyoY][p->puyoX] = p->puyoColor1;
    sx = p->puyoX + Game_GetSatX(p->puyoDir);
    sy = p->puyoY + Game_GetSatY(p->puyoDir);
    if (sy < BOARD_H && sx < BOARD_W)
        p->board[sy][sx] = p->puyoColor2;
    p->puyoColor1 = PUYO_EMPTY;
    p->puyoColor2 = PUYO_EMPTY;
    p->subY = 0;
    SFX_Drop();
    g_BoardDirty[0] = TRUE; g_BoardDirty[1] = TRUE;

    // Speed progression: every 10 pieces, increase speed
    p->piecesPlaced++;
    if (p->piecesPlaced % 10 == 0 && p->dropSpeed > DROP_SPEED_MIN * 2) {
        p->dropSpeed -= 2;
    }
}

// Drop all floating puyos by exactly 1 row. Returns TRUE if anything moved.
static bool Game_GravityStep(Player* p) {
    bool moved = FALSE;
    u8 x;
    i8 iy;
    // Scan bottom-up so puyos don't chain-fall in one call
    for (x = 0; x < BOARD_W; x++) {
        for (iy = BOARD_H - 2; iy >= 0; iy--) {
            u8 y = (u8)iy;
            if (p->board[y][x] != PUYO_EMPTY && p->board[y + 1][x] == PUYO_EMPTY) {
                p->board[y + 1][x] = p->board[y][x];
                p->board[y][x] = PUYO_EMPTY;
                moved = TRUE;
            }
        }
    }
    return moved;
}

// Animated gravity: drop puyos 8px at a time with visual feedback
static void Game_AnimateGravity(Player* p, u8 playerIdx) {
    u8 x, bx, by;
    i8 iy;
    bx = p->boardX;
    by = p->boardY;

    while (TRUE) {
        // Find which puyos will fall (have empty below)
        bool willFall = FALSE;
        for (x = 0; x < BOARD_W; x++) {
            for (iy = BOARD_H - 2; iy >= 0; iy--) {
                if (p->board[(u8)iy][x] != PUYO_EMPTY && p->board[(u8)iy + 1][x] == PUYO_EMPTY) {
                    willFall = TRUE;
                    break;
                }
            }
            if (willFall) break;
        }
        if (!willFall) break;

        // Draw half-step: show falling puyos at +1 tile offset (8px)
        for (x = 0; x < BOARD_W; x++) {
            for (iy = BOARD_H - 2; iy >= 0; iy--) {
                u8 y = (u8)iy;
                if (p->board[y][x] != PUYO_EMPTY && p->board[y + 1][x] == PUYO_EMPTY) {
                    u8 base = PAT_PUYO_BASE + (p->board[y][x] - 1) * 4;
                    u8 ty = by + y * 2 + 1; // offset by 1 tile (8px)
                    // Clear original position top tile row
                    VDP_Poke_GM2(bx + x * 2,     by + y * 2, PAT_BG);
                    VDP_Poke_GM2(bx + x * 2 + 1, by + y * 2, PAT_BG);
                    // Draw puyo shifted down 8px
                    VDP_Poke_GM2(bx + x * 2,     ty,     base);
                    VDP_Poke_GM2(bx + x * 2 + 1, ty,     base + 1);
                    VDP_Poke_GM2(bx + x * 2,     ty + 1, base + 2);
                    VDP_Poke_GM2(bx + x * 2 + 1, ty + 1, base + 3);
                }
            }
        }
        Halt(); // 1 frame at half position

        // Actually move puyos down 1 row in the board
        Game_GravityStep(p);

        // Redraw affected area
        Shadow_Invalidate();
    g_BoardDirty[0] = TRUE; g_BoardDirty[1] = TRUE;
        Game_DrawBoard(p, playerIdx);
        Halt(); // 1 frame at full position
    }
}

static u8 g_Visited[BOARD_H][BOARD_W];
static u8 g_GroupX[BOARD_H * BOARD_W];
static u8 g_GroupY[BOARD_H * BOARD_W];
static u8 g_GroupSize;

static void Game_FloodFill(Player* p, u8 x, u8 y, u8 color) {
    if (x >= BOARD_W || y >= BOARD_H) return;
    if (g_Visited[y][x]) return;
    if (p->board[y][x] != color) return;
    g_Visited[y][x] = 1;
    g_GroupX[g_GroupSize] = x;
    g_GroupY[g_GroupSize] = y;
    g_GroupSize++;
    if (x > 0) Game_FloodFill(p, x - 1, y, color);
    if (x < BOARD_W - 1) Game_FloodFill(p, x + 1, y, color);
    if (y > 0) Game_FloodFill(p, x, y - 1, color);
    if (y < BOARD_H - 1) Game_FloodFill(p, x, y + 1, color);
}

static u8 Game_ClearGroups(Player* p) {
    u8 x, y, i, totalCleared = 0, color;
    for (y = 0; y < BOARD_H; y++)
        for (x = 0; x < BOARD_W; x++)
            g_Visited[y][x] = 0;
    for (y = 0; y < BOARD_H; y++) {
        for (x = 0; x < BOARD_W; x++) {
            color = p->board[y][x];
            if (color >= 1 && color <= PUYO_COUNT && !g_Visited[y][x]) {
                g_GroupSize = 0;
                Game_FloodFill(p, x, y, color);
                if (g_GroupSize >= 4) {
                    // Clear the group
                    for (i = 0; i < g_GroupSize; i++)
                        p->board[g_GroupY[i]][g_GroupX[i]] = PUYO_EMPTY;
                    totalCleared += g_GroupSize;
                    // Convert adjacent garbage to random color puyos
                    for (i = 0; i < g_GroupSize; i++) {
                        u8 gx = g_GroupX[i], gy = g_GroupY[i];
                        if (gx > 0 && p->board[gy][gx-1] == PUYO_GARBAGE)
                            p->board[gy][gx-1] = (Math_GetRandom8() % PUYO_COUNT) + 1;
                        if (gx < BOARD_W-1 && p->board[gy][gx+1] == PUYO_GARBAGE)
                            p->board[gy][gx+1] = (Math_GetRandom8() % PUYO_COUNT) + 1;
                        if (gy > 0 && p->board[gy-1][gx] == PUYO_GARBAGE)
                            p->board[gy-1][gx] = (Math_GetRandom8() % PUYO_COUNT) + 1;
                        if (gy < BOARD_H-1 && p->board[gy+1][gx] == PUYO_GARBAGE)
                            p->board[gy+1][gx] = (Math_GetRandom8() % PUYO_COUNT) + 1;
                    }
                }
            }
        }
    }
    return totalCleared;
}

// Show explosion burst where puyos are about to be cleared
static void Game_FlashCleared(Player* p, u8 playerIdx) {
    u8 i, x, y, bx, by, tx, ty;
    bx = p->boardX;
    by = p->boardY;
    for (i = 0; i < g_GroupSize; i++) {
        x = g_GroupX[i]; y = g_GroupY[i];
        tx = bx + x * 2; ty = by + y * 2;
        // Draw explosion pattern in all 4 quadrants
        VDP_Poke_GM2(tx,     ty,     PAT_EXPLODE);
        VDP_Poke_GM2(tx + 1, ty,     PAT_EXPLODE);
        VDP_Poke_GM2(tx,     ty + 1, PAT_EXPLODE);
        VDP_Poke_GM2(tx + 1, ty + 1, PAT_EXPLODE);
        g_Shadow[playerIdx][y][x] = 0xFF; // force redraw next frame
    }
}

// Show chain text in center area
static void Game_ShowChain(u8 chainCount) {
    Print_SetPosition(CENTER_X, 10);
    Print_DrawChar('0' + chainCount);
    Print_SetPosition(CENTER_X, 11);
    Print_DrawChar('C');
}

// Clear chain text
static void Game_ClearChainText(void) {
    Print_SetPosition(CENTER_X, 10);
    Print_DrawChar(' ');
    Print_SetPosition(CENTER_X, 11);
    Print_DrawChar(' ');
}

// Flash walls of a player's board
static void Game_FlashWalls(Player* p, u8 color) {
    u8 y, bx = p->boardX;
    u8 colorBuf[8];
    u8 i, bank;
    // Change color of wall pattern temporarily by rewriting color table for wall pattern
    for (i = 0; i < 8; i++) colorBuf[i] = COLOR_MERGE(color, COLOR_BLACK);
    for (bank = 0; bank < 3; bank++) {
        VDP_WriteVRAM_16K(colorBuf, g_ScreenColorLow + (bank * 0x800) + (PAT_WALL * 8), 8);
    }
}

static void Game_RestoreWalls(void) {
    u8 colorBuf[8];
    u8 i, bank;
    for (i = 0; i < 8; i++) colorBuf[i] = COLOR_MERGE(COLOR_WHITE, COLOR_DARK_BLUE);
    for (bank = 0; bank < 3; bank++) {
        VDP_WriteVRAM_16K(colorBuf, g_ScreenColorLow + (bank * 0x800) + (PAT_WALL * 8), 8);
    }
}

// Check if a player is in danger (puyos in top 2 rows)
static bool Game_IsInDanger(Player* p) {
    u8 x;
    for (x = 0; x < BOARD_W; x++) {
        if (p->board[0][x] != PUYO_EMPTY || p->board[1][x] != PUYO_EMPTY)
            return TRUE;
    }
    return FALSE;
}

static void Game_ChainLoop(Player* p, Player* opponent) {
    u8 chainCount = 0, totalGarbage = 0, cleared;
    u8 playerIdx = (p == &g_Player[0]) ? 0 : 1;
    u8 oppIdx = (playerIdx == 0) ? 1 : 0;

    while (TRUE) {
        Game_AnimateGravity(p, playerIdx);

        // First find groups without clearing them
        {
            u8 x, y, color;
            u8 groupsFound = 0;
            for (y = 0; y < BOARD_H; y++)
                for (x = 0; x < BOARD_W; x++)
                    g_Visited[y][x] = 0;

            for (y = 0; y < BOARD_H; y++) {
                for (x = 0; x < BOARD_W; x++) {
                    color = p->board[y][x];
                    if (color >= 1 && color <= PUYO_COUNT && !g_Visited[y][x]) {
                        g_GroupSize = 0;
                        Game_FloodFill(p, x, y, color);
                        if (g_GroupSize >= 4) {
                            // Flash the group before clearing
                            Game_FlashCleared(p, playerIdx);
                            groupsFound = 1;
                        }
                    }
                }
            }

            if (groupsFound) {
                // Show flash for a moment
                Halt(); Halt(); Halt();
            }
        }

        // Now actually clear
        cleared = Game_ClearGroups(p);
        if (cleared == 0) break;

        chainCount++;
        p->score += cleared * 10 * chainCount;
        p->totalCleared += cleared;

        // Sound effects
        SFX_Clear();
        if (chainCount > 1) SFX_Chain(chainCount);

        // Visual effects - more spectacular for bigger chains
        {
            u8 borderColors[] = { COLOR_LIGHT_GREEN, COLOR_LIGHT_YELLOW, COLOR_LIGHT_RED, COLOR_MAGENTA, COLOR_WHITE };
            u8 ci = chainCount - 1;
            u8 flashFrames;
            if (ci > 4) ci = 4;
            VDP_SetColor(borderColors[ci]);

            // Show chain count in center (bigger display for bigger chains)
            if (chainCount > 1) {
                Game_ShowChain(chainCount);
            }

            totalGarbage += CHAIN_GARBAGE_BASE * chainCount;

            Game_DrawBoard(p, playerIdx);
            Game_DrawScore(p);

            // Longer pause for bigger chains
            flashFrames = 4 + (chainCount > 2 ? chainCount * 2 : 0);
            if (flashFrames > 16) flashFrames = 16;
            while (flashFrames > 0) {
                Halt();
                // Flash border on/off for big chains
                if (chainCount >= 3 && (flashFrames & 3) == 0) {
                    VDP_SetColor((flashFrames & 4) ? borderColors[ci] : COLOR_BLACK);
                }
                flashFrames--;
            }
        }

        // Restore border
        VDP_SetColor(COLOR_BLACK);
        Game_ClearChainText();
    }

    p->chainCount = chainCount;
    if (chainCount > p->maxChain) p->maxChain = chainCount;

    if (totalGarbage > 0) {
        if (p->pendingGarbage > 0) {
            if (totalGarbage >= p->pendingGarbage) {
                totalGarbage -= p->pendingGarbage; p->pendingGarbage = 0;
            } else {
                p->pendingGarbage -= totalGarbage; totalGarbage = 0;
            }
        }
        if (totalGarbage > 0) {
            opponent->pendingGarbage += totalGarbage;
            SFX_Garbage();
            // Flash opponent walls red
            Game_FlashWalls(opponent, COLOR_LIGHT_RED);
            // Show garbage count in center
            Print_SetPosition(CENTER_X, 10);
            Print_DrawChar('+');
            Print_DrawChar('0' + (totalGarbage / 10) % 10);
            Print_DrawChar('0' + totalGarbage % 10);
            Halt(); Halt(); Halt(); Halt(); Halt(); Halt();
            Game_RestoreWalls();
            Print_SetPosition(CENTER_X, 10);
            Print_DrawChar(' ');
            Print_DrawChar(' ');
            Print_DrawChar(' ');
        }
    }

}

static void Game_AddGarbage(Player* p) {
    u8 count, rows, remaining, x, y;
    i8 iy;
    if (p->pendingGarbage == 0) return;
    SFX_GarbageReceive();
    count = p->pendingGarbage;
    if (count > BOARD_W * 2) count = BOARD_W * 2;
    p->pendingGarbage -= count;
    rows = (count + BOARD_W - 1) / BOARD_W;
    for (iy = 0; iy < (i8)(BOARD_H - rows); iy++)
        for (x = 0; x < BOARD_W; x++)
            p->board[iy][x] = p->board[iy + rows][x];
    remaining = count;
    for (y = BOARD_H - rows; y < BOARD_H && remaining > 0; y++)
        for (x = 0; x < BOARD_W && remaining > 0; x++) {
            if (Math_GetRandom8() % 6 != 0) { p->board[y][x] = PUYO_GARBAGE; remaining--; }
            else p->board[y][x] = PUYO_EMPTY;
        }
}

//=============================================================================
// PLAYER UPDATE
//=============================================================================

static void Game_UpdatePlayer(Player* p, u8 joyPort) {
    u8 joy, dir;
    bool btnA, btnB, btnUp;
    u8 currentSpeed;
    if (!p->alive) return;
    joy = Joystick_Read(joyPort);
    dir = JOY_GET_DIR(joy);
    btnA = JOY_GET_A(joy);
    btnB = JOY_GET_B(joy);
    btnUp = FALSE;
    if (joyPort == JOY_PORT_1) {
        if (Keyboard_IsKeyPressed(KEY_LEFT))  dir |= JOY_INPUT_DIR_LEFT;
        if (Keyboard_IsKeyPressed(KEY_RIGHT)) dir |= JOY_INPUT_DIR_RIGHT;
        if (Keyboard_IsKeyPressed(KEY_DOWN))  dir |= JOY_INPUT_DIR_DOWN;
        if (Keyboard_IsKeyPressed(KEY_UP))    btnUp = TRUE;
        if (Keyboard_IsKeyPressed(KEY_Z))     btnA = TRUE;
        if (Keyboard_IsKeyPressed(KEY_X))     btnB = TRUE;
        if (Keyboard_IsKeyPressed(KEY_SPACE)) btnA = TRUE;
    }
    if (dir & JOY_INPUT_DIR_UP) { btnUp = TRUE; dir &= ~JOY_INPUT_DIR_UP; }
    if (p->puyoColor1 == PUYO_EMPTY) {
        Game_AddGarbage(p);
        Game_SpawnPair(p);
        if (!p->alive) return;
        p->inputDelay = 3;
        return;
    }
    if (p->inputDelay > 0) p->inputDelay--;
    if (p->inputDelay == 0) {
        if (dir & JOY_INPUT_DIR_LEFT) {
            if (Game_CanMovePair(p, -1, 0)) { p->puyoX--; p->inputDelay = 5; }
        } else if (dir & JOY_INPUT_DIR_RIGHT) {
            if (Game_CanMovePair(p, 1, 0)) { p->puyoX++; p->inputDelay = 5; }
        }
    }
    if (p->rotateDelay > 0) {
        p->rotateDelay--;
        if (!btnA && !btnB && !btnUp) p->rotateDelay = 0;
    }
    if (p->rotateDelay == 0) {
        if (btnUp || btnA) { Game_RotatePair(p, 1); p->rotateDelay = 8; }
        else if (btnB) { Game_RotatePair(p, -1); p->rotateDelay = 8; }
    }
    currentSpeed = p->dropSpeed / 2;
    if (currentSpeed < 1) currentSpeed = 1;
    if (dir & JOY_INPUT_DIR_DOWN) currentSpeed = DROP_SPEED_SOFT;
    p->dropTimer++;
    if (p->dropTimer >= currentSpeed) {
        p->dropTimer = 0;
        if (p->subY == 0) {
            // Half-step: check if we can move down
            if (Game_CanMovePair(p, 0, 1)) {
                p->subY = 1;
                p->lockTimer = 0;
            } else {
                // Can't move down even half-step, try to lock
                p->lockTimer++;
                if (p->lockTimer >= LOCK_DELAY) {
                    Game_LockPair(p);
                    Game_ChainLoop(p, (p == &g_Player[0]) ? &g_Player[1] : &g_Player[0]);
                }
            }
        } else {
            // Full step: complete the move to next row
            p->subY = 0;
            p->puyoY++;
            p->lockTimer = 0;
        }
    }
}

//=============================================================================
// GAME INIT & UPDATE
//=============================================================================

static void Game_Init(void) {
    Game_InitPlayer(&g_Player[0], P1_BOARD_X, P1_BOARD_Y);
    Game_InitPlayer(&g_Player[1], P2_BOARD_X, P2_BOARD_Y);
    VDP_FillScreen_GM2(PAT_BG);
    // Center column: black background (no scroll)
    {
        u8 cx, cy;
        for (cy = 0; cy < 24; cy++)
            for (cx = CENTER_X; cx < CENTER_X + 4; cx++)
                VDP_Poke_GM2(cx, cy, PAT_EMPTY);
    }
    Shadow_Invalidate();
    g_BoardDirty[0] = TRUE; g_BoardDirty[1] = TRUE;
    Game_DrawBoard(&g_Player[0], 0);
    Game_DrawBoard(&g_Player[1], 1);
    Game_DrawScore(&g_Player[0]);
    Game_DrawScore(&g_Player[1]);
    Print_SetPosition(CENTER_X, 7);
    Print_DrawText("VS");

    // Countdown 3-2-1-GO
    Print_SetPosition(CENTER_X + 1, 11);
    Print_DrawChar('3');
    WaitFrames(30);
    Print_SetPosition(CENTER_X + 1, 11);
    Print_DrawChar('2');
    WaitFrames(30);
    Print_SetPosition(CENTER_X + 1, 11);
    Print_DrawChar('1');
    WaitFrames(30);
    Print_SetPosition(CENTER_X, 11);
    Print_DrawText("GO!");
    WaitFrames(20);
    Print_SetPosition(CENTER_X, 11);
    Print_DrawText("   ");
}

static u8 g_BgScrollOffset;

static void Game_UpdateBackground(void) {
    u8 scrolled[8];
    u8 i, bank;
    u16 patBase;
    static u8 frameDiv;

    frameDiv++;
    if ((frameDiv & 7) != 0) return; // update every 8 frames
    g_BgScrollOffset++;

    // Vertical scroll: shift rows up by offset (wrapping around)
    for (i = 0; i < 8; i++) {
        scrolled[i] = g_BgBasePattern[(i - g_BgScrollOffset) & 7];
    }

    // Write to PAT_BG in all 3 banks
    for (bank = 0; bank < 3; bank++) {
        patBase = g_ScreenPatternLow + (bank * 0x800);
        VDP_WriteVRAM_16K(scrolled, patBase + (PAT_BG * 8), 8);
    }
}

static u8 g_DangerFlash;

static void Game_Update(void) {
    Music_Update();
    SFX_Update();
    Game_UpdateBackground();

    // Danger + garbage wall flash
    g_DangerFlash++;
    {
        bool p1Danger = Game_IsInDanger(&g_Player[0]);
        bool p2Danger = Game_IsInDanger(&g_Player[1]);
        bool needRestore = TRUE;

        if (p1Danger || p2Danger) {
            if ((g_DangerFlash & 7) < 4) {
                if (p1Danger) Game_FlashWalls(&g_Player[0], COLOR_LIGHT_RED);
                if (p2Danger) Game_FlashWalls(&g_Player[1], COLOR_LIGHT_RED);
                needRestore = FALSE;
            }
        }
        // Garbage pending: flash walls yellow (slower blink)
        if (!p1Danger && g_Player[0].pendingGarbage > 0 && (g_DangerFlash & 15) < 8) {
            Game_FlashWalls(&g_Player[0], COLOR_LIGHT_YELLOW);
            needRestore = FALSE;
        }
        if (!p2Danger && g_Player[1].pendingGarbage > 0 && (g_DangerFlash & 15) < 8) {
            Game_FlashWalls(&g_Player[1], COLOR_LIGHT_YELLOW);
            needRestore = FALSE;
        }
        if (needRestore) {
            Game_RestoreWalls();
        }
    }
    Game_UpdatePlayer(&g_Player[0], JOY_PORT_1);
    Game_UpdatePlayer(&g_Player[1], JOY_PORT_2);
    Game_DrawBoard(&g_Player[0], 0);
    Game_DrawBoard(&g_Player[1], 1);
    if (g_BoardDirty[0] || g_BoardDirty[1]) {
        g_ConnPool = 128;
        Game_DrawConnections(&g_Player[0]);
        Game_DrawConnections(&g_Player[1]);
        g_BoardDirty[0] = FALSE;
        g_BoardDirty[1] = FALSE;
    }
    Game_DrawScore(&g_Player[0]);
    Game_DrawScore(&g_Player[1]);
}

//=============================================================================
// MAIN
//=============================================================================

static void WaitButton(void) {
    u8 joy1, joy2;
    while (1) {
        Halt();
        joy1 = Joystick_Read(JOY_PORT_1);
        joy2 = Joystick_Read(JOY_PORT_2);
        if (JOY_GET_A(joy1) || JOY_GET_A(joy2)) break;
        if (Keyboard_IsKeyPressed(KEY_SPACE)) break;
    }
}

void main(void) {
    VDP_Setup();
    PSG_SetMixer(~(PSG_TONE_A_ON | PSG_TONE_B_ON | PSG_TONE_C_ON));
    PSG_Mute();
    g_GameState = STATE_TITLE;
    g_FrameCount = 0;

    while (1) {
        Halt();
        if (g_GameState == STATE_TITLE) {
            Game_DrawTitle();
            TitleMusic_Start();
            // Wait for button press while playing title music
            {
                u8 joy1, joy2;
                while (1) {
                    Halt();
                    TitleMusic_Update();
                    joy1 = Joystick_Read(JOY_PORT_1);
                    joy2 = Joystick_Read(JOY_PORT_2);
                    if (JOY_GET_A(joy1) || JOY_GET_A(joy2)) break;
                    if (JOY_GET_B(joy1) || JOY_GET_B(joy2)) break;
                    if (Keyboard_IsKeyPressed(KEY_SPACE)) break;
                }
            }
            Music_Stop();
            WaitFrames(10);
            g_GameState = STATE_PLAYING;
            VDP_Setup();
            Game_Init();
            Music_Start();
        }
        else if (g_GameState == STATE_PLAYING) {
            Game_Update();
            if (!g_Player[0].alive || !g_Player[1].alive) {
                Music_Stop();
                g_GameState = STATE_GAMEOVER;
            }
        }
        else if (g_GameState == STATE_GAMEOVER) {
            Game_DrawGameOver();
            SFX_Victory();
            WaitFrames(60);
            WaitButton();
            // Stats screen
            PSG_Mute();
            Game_DrawStatsScreen();
            WaitButton();
            g_GameState = STATE_TITLE;
            VDP_Setup();
        }
    }
}
