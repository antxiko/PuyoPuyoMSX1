// PuyoPuyo VS - MSX1 Screen 2 - 16x16 puyos
// 2 Player versus using Joystick 1 & 2
//=============================================================================
#include "msxgl.h"
#include "psg.h"
#include "math.h"
#include "compress/zx0.h"
#include "pt3/pt3_player.h"
#include "pt3/pt3_notetable2.h"
#include "pt3_data.h"
#include "tileset_data.h"
#include "screen_data.h"
#include "puyopuyo_rawdef.h"

//=============================================================================
// DEFINES
//=============================================================================

#define BOARD_W         6
#define BOARD_H         11

// Board positions in TILE coords (each puyo = 2x2 tiles)
// Layout: [wall 1t][P1 12t][wall 1t][center 4t][wall 1t][P2 12t][wall 1t] = 32
#define P1_BOARD_X      1    // tile X where P1 board starts
#define P1_BOARD_Y      1    // tile Y (shifted down 1 to fit bottom bar at row 23)
#define P2_BOARD_X      19
#define P2_BOARD_Y      1
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

#define MODE_ARCADE     0
#define MODE_VS         1
#define MODE_ATTRACT    2

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
#define PAT_PUYO_BASE   1   // first puyo color starts here, 4 patterns each
// Puyos: 1-24 (6 types x 4 quadrants: red,green,blue,yellow,purple,garbage)
#define PAT_WALL        25
#define PAT_GRAY_BASE   27  // grey puyo (4 quadrants: 27,28,29,30)
#define PAT_EXPLODE     31  // explosion burst pattern
// Font starts at 32
#define PAT_CONN_BASE   226 // connection patterns: 6 per color, 5 colors = 30 (226-255)
// Per color offset: 0=Q0top, 1=Q1top, 2=Q2bot, 3=Q2botL, 4=Q3bot, 5=Q3botR
// Red 226-231, Green 232-237, Blue 238-243, Yellow 244-249, Purple 250-255
// No garbage connections needed
#define PAT_BG_P1       59  // P1 background tile (scroll diagonal down-right)
#define PAT_BG_P2       60  // P2 background tile (scroll diagonal down-left)

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
    u8 alive;
    u8 boardX, boardY;
    u8 rotateDelay;
    u8 subY;  // 0 = aligned, 1 = offset 8px down (half-cell)
    u8 garbageFalling; // 1 = garbage is falling, wait before spawning
    u8 piecesPlaced; // count of locked pieces (for speed progression)
    u8 maxChain;     // best chain this game
    u16 totalCleared; // total puyos cleared this game
} Player;

//=============================================================================
// GLOBALS
//=============================================================================

static Player g_Player[2];
static u8 g_GameState;
static u8 g_GameMode; // MODE_ARCADE or MODE_VS
static u8 g_Is50Hz;   // 1 = PAL 50Hz, 0 = NTSC 60Hz
static u8 g_FrameSkip; // counter for 50Hz compensation

// PT3 player needs song data in RAM (modifies it in-place)
static u8 g_PT3Buffer[7845]; // size of largest PT3


static u8 g_Shadow[2][BOARD_H][BOARD_W];
static u8 g_ScreenLayout[768]; // gameplay screen layout for tile restoration
static u8 g_BoardDirty[2]; // set when board changes, triggers connection redraw
static u8 g_ShadowNext[2][2];
// Track previous falling piece position for cleanup (0xFF = none)
static u8 g_PrevFallX1[2], g_PrevFallY1[2]; // main puyo tile coords
static u8 g_PrevFallX2[2], g_PrevFallY2[2]; // satellite tile coords

// Name table buffer: CPU writes here, flush to VRAM during VBlank
static u8 g_NameBuffer[768];
#define NB_DIRTY_MAX 128
static u16 g_NbDirtyIdx[NB_DIRTY_MAX];
static u8 g_NbDirtyCount;

static void NB_Flush(void) {
    // msxlib-style: blast entire 768-byte buffer to VRAM in one LDIRVM
    // Starts at VBlank, writes sequentially top-to-bottom (matches VDP scan)
    // ~6ms total but always ahead of the scanline = visually clean
    VDP_WriteVRAM_16K(g_NameBuffer, g_ScreenLayoutLow, 768);
    g_NbDirtyCount = 0;
}

static void NB_Init(void) {
    u16 i;
    for (i = 0; i < 768; i++)
        g_NameBuffer[i] = g_ScreenLayout[i];
    g_NbDirtyCount = 0;
}

//=============================================================================
// 16x16 PUYO PATTERNS WITH FACES
// Each puyo = 4 quadrants (TL,TR,BL,BR), each 8x8
// In Screen 2: per row, 1=foreground color, 0=background color
// Eye rows use bg=WHITE so holes in pattern become white eyes
// Mouth rows use bg=BLACK so holes become dark mouth
//=============================================================================

//=============================================================================
// FONT
//=============================================================================

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
static u8 Game_ClearGroups(Player* p);
static void Game_ChainLoop(Player* p, Player* opponent);
static void Game_AddGarbage(Player* p);
static void Game_DrawBoard(Player* p, u8 playerIdx);
static void Game_DrawConnections(Player* p, u8 pi);
static void Game_DrawScore(Player* p);
static void Game_DrawTitle(void);
static void Game_DrawGameOver(void);
static i8 Game_GetSatX(u8 dir);
static i8 Game_GetSatY(u8 dir);
static bool Game_IsInDanger(Player* p);

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
// TITLE MUSIC PLAYER
//=============================================================================

// ISR: called automatically every VBlank by crt0
void VDP_InterruptHandler(void) {
    PT3_UpdatePSG();
    PT3_Decode();
}

static void TitleMusic_Start(void) {}
static void TitleMusic_Update(void) {}

//=============================================================================
// GAMEPLAY MUSIC PLAYER
//=============================================================================

static void Music_Start(void) {
    PT3_Pause();
    PT3_SetNoteTable(PT3_NT2);
    PT3_Init();
    ZX0_UnpackToRAM((const void*)MUSIC_GAME_ZX0_ABS, g_PT3Buffer);
    PT3_InitSong(g_PT3Buffer);
    PT3_SetLoop(TRUE);
    PT3_Resume();
}

static void Music_Stop(void) {
    PT3_Pause();
    PT3_Silence();
}

static void Music_Update(void) {
}

//=============================================================================
// SOUND EFFECTS (all on Channel C - registers 4,5,10)
//=============================================================================

// SFX stubs (disabled - PT3 controls all PSG)
static void SFX_Drop(void) {}
static void SFX_Clear(void) {}
static void SFX_Chain(u8 chain) { chain; }
static void SFX_Garbage(void) {}
static void SFX_GarbageReceive(void) {}
static void SFX_Victory(void) {
    WaitFrames(30);
}

//=============================================================================
// VDP SETUP - load 16x16 puyo patterns
//=============================================================================

static void VDP_Setup(void) {
    u8 bank;
    u16 patBase, colBase;

    VDP_SetMode(VDP_MODE_GRAPHIC2);
    VDP_SetColor(COLOR_BLACK);
    VDP_EnableDisplay(FALSE);
    VDP_ClearVRAM();
    VDP_EnableVBlank(TRUE);
    VDP_DisableSpritesFrom(0);

    // Configure Print system without loading font (tileset has its own font)
    g_PrintData.PatternOffset = 32;
    Print_SetFontEx(8, 8, 1, 1, 0, 0xBF, (const u8*)0);
    Print_Initialize();
    Print_SetMode(PRINT_MODE_TEXT);
    Print_SetColor(COLOR_WHITE, COLOR_BLACK);

    // Decompress tileset patterns to RAM, then copy to each VRAM bank
    // This overwrites everything including font patterns (tileset has its own font)
    ZX0_UnpackToRAM((const void*)TILESET_PAT_ZX0_ABS, g_PT3Buffer);
    for (bank = 0; bank < 3; bank++) {
        patBase = g_ScreenPatternLow + (bank * 0x800);
        VDP_WriteVRAM_16K(g_PT3Buffer, patBase, 2048);
    }

    // Decompress tileset colors to RAM, then copy to each VRAM bank
    ZX0_UnpackToRAM((const void*)TILESET_COL_ZX0_ABS, g_PT3Buffer);
    for (bank = 0; bank < 3; bank++) {
        colBase = g_ScreenColorLow + (bank * 0x800);
        VDP_WriteVRAM_16K(g_PT3Buffer, colBase, 2048);
    }

    VDP_EnableDisplay(TRUE);
}


// Redirect all name table writes to RAM buffer during gameplay
#undef VDP_Poke_GM2
#define VDP_Poke_GM2(x, y, v) do { \
    u16 _idx = (u16)(y) * 32 + (x); \
    u8 _v = (v); \
    if (g_NameBuffer[_idx] != _v) { \
        g_NameBuffer[_idx] = _v; \
        if (g_NbDirtyCount < NB_DIRTY_MAX) \
            g_NbDirtyIdx[g_NbDirtyCount++] = _idx; \
    } \
} while(0)

//=============================================================================
// DRAW FUNCTIONS - 16x16 puyos (2x2 tiles each)
//=============================================================================

// Draw a single puyo (2x2 tiles) at tile position (tx, ty)
static void DrawPuyo16(u8 tx, u8 ty, u8 color) {
    u8 base;
    if (color == PUYO_EMPTY || color > PUYO_GARBAGE) {
        // Restore original screen layout tiles
        VDP_Poke_GM2(tx,     ty,     g_ScreenLayout[ty * 32 + tx]);
        VDP_Poke_GM2(tx + 1, ty,     g_ScreenLayout[ty * 32 + tx + 1]);
        VDP_Poke_GM2(tx,     ty + 1, g_ScreenLayout[(ty + 1) * 32 + tx]);
        VDP_Poke_GM2(tx + 1, ty + 1, g_ScreenLayout[(ty + 1) * 32 + tx + 1]);
    } else {
        base = PAT_PUYO_BASE + (color - 1) * 4;
        VDP_Poke_GM2(tx,     ty,     base);      // TL
        VDP_Poke_GM2(tx + 1, ty,     base + 1);  // TR
        VDP_Poke_GM2(tx,     ty + 1, base + 2);  // BL
        VDP_Poke_GM2(tx + 1, ty + 1, base + 3);  // BR
    }
}

// Restore a tile from the original screen layout
static void RestoreTile(u8 tx, u8 ty) {
    VDP_Poke_GM2(tx, ty, g_ScreenLayout[ty * 32 + tx]);
}

static void Shadow_Invalidate(void) {
    u8 p, x, y;
    for (p = 0; p < 2; p++) {
        for (y = 0; y < BOARD_H; y++)
            for (x = 0; x < BOARD_W; x++)
                g_Shadow[p][y][x] = 0xFF;
        g_ShadowNext[p][0] = 0xFF;
        g_ShadowNext[p][1] = 0xFF;
        g_PrevFallX1[p] = 0xFF; g_PrevFallY1[p] = 0xFF;
        g_PrevFallX2[p] = 0xFF; g_PrevFallY2[p] = 0xFF;
    }
}



static void Game_DrawBoard(Player* p, u8 playerIdx) {
    u8 x, y;
    u8 bx = p->boardX;
    u8 by = p->boardY;
    static u8 visible[BOARD_H][BOARD_W];
    u8 hasFalling = (p->alive && p->puyoColor1 != PUYO_EMPTY);

    // Build visible state (board only, no falling pair)
    for (y = 0; y < BOARD_H; y++)
        for (x = 0; x < BOARD_W; x++)
            visible[y][x] = p->board[y][x];

    // If subY==0, overlay falling pair into visible grid (aligned)
    if (hasFalling && p->subY == 0) {
        if (p->puyoY < BOARD_H && p->puyoX < BOARD_W)
            visible[p->puyoY][p->puyoX] = p->puyoColor1;
        {
            i8 sxs = (i8)p->puyoX + Game_GetSatX(p->puyoDir);
            i8 sys = (i8)p->puyoY + Game_GetSatY(p->puyoDir);
            if (sxs >= 0 && sxs < BOARD_W && sys >= 0 && sys < BOARD_H)
                visible[sys][sxs] = p->puyoColor2;
        }
    }

    // --- STEP 1: Clean previous falling piece position BEFORE shadow loop ---
    {
        u8 prevX1 = g_PrevFallX1[playerIdx], prevY1 = g_PrevFallY1[playerIdx];
        u8 prevX2 = g_PrevFallX2[playerIdx], prevY2 = g_PrevFallY2[playerIdx];
        u8 newX1 = 0xFF, newY1 = 0xFF, newX2 = 0xFF, newY2 = 0xFF;

        // Pre-compute where the piece WILL be drawn this frame
        if (hasFalling && p->subY == 2) {
            newX1 = bx + p->puyoX * 2; newY1 = 0;
            { i8 s = (i8)p->puyoX + Game_GetSatX(p->puyoDir);
              if (s >= 0 && s < BOARD_W && Game_GetSatY(p->puyoDir) == 0)
                { newX2 = bx + (u8)s * 2; newY2 = 0; } }
        } else if (hasFalling && p->subY == 1) {
            if (p->puyoY < BOARD_H && p->puyoX < BOARD_W)
                { newX1 = bx + p->puyoX * 2; newY1 = by + p->puyoY * 2; }
            { i8 sx = (i8)p->puyoX + Game_GetSatX(p->puyoDir);
              i8 sy = (i8)p->puyoY + Game_GetSatY(p->puyoDir);
              if (sx >= 0 && sx < BOARD_W) {
                if (sy == -1) { newX2 = bx + (u8)sx * 2; newY2 = 0; }
                else if (sy >= 0 && sy < BOARD_H) { newX2 = bx + (u8)sx * 2; newY2 = by + (u8)sy * 2; }
              } }
        } else if (hasFalling && p->subY == 0 && p->puyoY == 0 && p->puyoDir == DIR_UP) {
            newX2 = bx + p->puyoX * 2; newY2 = 0;
        }

        // Clean + invalidate shadow so shadow loop redraws correctly
        if (prevX1 != 0xFF && (prevX1 != newX1 || prevY1 != newY1)) {
            RestoreTile(prevX1, prevY1);
            RestoreTile(prevX1 + 1, prevY1);
            if (prevY1 + 1 < 24) { RestoreTile(prevX1, prevY1 + 1); RestoreTile(prevX1 + 1, prevY1 + 1); }
            if (prevY1 + 2 < 24) { RestoreTile(prevX1, prevY1 + 2); RestoreTile(prevX1 + 1, prevY1 + 2); }
            if (prevY1 >= by && prevY1 < by + BOARD_H * 2) {
                u8 cy = (prevY1 - by) / 2, cx = (prevX1 - bx) / 2;
                if (cx < BOARD_W && cy < BOARD_H) g_Shadow[playerIdx][cy][cx] = 0xFF;
                if (cx < BOARD_W && cy + 1 < BOARD_H) g_Shadow[playerIdx][cy + 1][cx] = 0xFF;
                if (cx < BOARD_W && cy + 2 < BOARD_H) g_Shadow[playerIdx][cy + 2][cx] = 0xFF;
            }
        }
        if (prevX2 != 0xFF && (prevX2 != newX2 || prevY2 != newY2)) {
            RestoreTile(prevX2, prevY2);
            RestoreTile(prevX2 + 1, prevY2);
            if (prevY2 + 1 < 24) { RestoreTile(prevX2, prevY2 + 1); RestoreTile(prevX2 + 1, prevY2 + 1); }
            if (prevY2 + 2 < 24) { RestoreTile(prevX2, prevY2 + 2); RestoreTile(prevX2 + 1, prevY2 + 2); }
            if (prevY2 >= by && prevY2 < by + BOARD_H * 2) {
                u8 cy = (prevY2 - by) / 2, cx = (prevX2 - bx) / 2;
                if (cx < BOARD_W && cy < BOARD_H) g_Shadow[playerIdx][cy][cx] = 0xFF;
                if (cx < BOARD_W && cy + 1 < BOARD_H) g_Shadow[playerIdx][cy + 1][cx] = 0xFF;
                if (cx < BOARD_W && cy + 2 < BOARD_H) g_Shadow[playerIdx][cy + 2][cx] = 0xFF;
            }
        }
        g_PrevFallX1[playerIdx] = 0xFF;
        g_PrevFallX2[playerIdx] = 0xFF;
    }

    // --- STEP 2: Shadow loop redraws cells that changed (including just-cleaned ones) ---
    {
        u8 skipX1 = 0xFF, skipY1 = 0xFF, skipX2 = 0xFF, skipY2 = 0xFF;
        if (hasFalling && p->subY != 0) {
            skipX1 = p->puyoX; skipY1 = p->puyoY;
            {
                i8 fsx = (i8)p->puyoX + Game_GetSatX(p->puyoDir);
                i8 fsy = (i8)p->puyoY + Game_GetSatY(p->puyoDir);
                if (fsx >= 0 && fsx < BOARD_W && fsy >= 0)
                    { skipX2 = (u8)fsx; skipY2 = (u8)fsy; }
            }
        }
        for (y = 0; y < BOARD_H; y++) {
            for (x = 0; x < BOARD_W; x++) {
                if (x == skipX1 && (y == skipY1 || y == skipY1 + 1)) continue;
                if (x == skipX2 && (y == skipY2 || y == skipY2 + 1)) continue;
                if (visible[y][x] != g_Shadow[playerIdx][y][x]) {
                    u8 color = visible[y][x];
                    g_Shadow[playerIdx][y][x] = color;
                    DrawPuyo16(bx + x * 2, by + y * 2, color);
                    // Restore connections only for PLACED puyos (not falling piece)
                    if (color >= 1 && color <= PUYO_COUNT && p->board[y][x] == color) {
                        u8 ci = color - 1;
                        u8 cU = (y > 0 && p->board[y-1][x] == color) ? 1 : 0;
                        u8 cD = (y+1 < BOARD_H && p->board[y+1][x] == color) ? 1 : 0;
                        u8 cL = (x > 0 && p->board[y][x-1] == color) ? 1 : 0;
                        u8 cR = (x+1 < BOARD_W && p->board[y][x+1] == color) ? 1 : 0;
                        if (cU || cD || cL || cR) {
                            u8 base = PAT_PUYO_BASE + ci * 4;
                            u8 connBase = PAT_CONN_BASE + ci * 6;
                            u8 tx = bx + x * 2, ty = by + y * 2;
                            VDP_Poke_GM2(tx,     ty,     (cU || cL) ? connBase     : base);
                            VDP_Poke_GM2(tx + 1, ty,     (cU || cR) ? connBase + 1 : base + 1);
                            if (cD || cL) { VDP_Poke_GM2(tx, ty + 1, cL ? connBase + 3 : connBase + 2); }
                            if (cD || cR) { VDP_Poke_GM2(tx + 1, ty + 1, cR ? connBase + 5 : connBase + 4); }
                        }
                    }
                }
            }
        }
    }

    // --- STEP 3: Draw falling piece at current position ---
    if (hasFalling && p->subY == 2) {
        u8 base = PAT_PUYO_BASE + (p->puyoColor1 - 1) * 4;
        u8 tx1 = bx + p->puyoX * 2;
        VDP_Poke_GM2(tx1, 0, base + 2);
        VDP_Poke_GM2(tx1 + 1, 0, base + 3);
        g_PrevFallX1[playerIdx] = tx1; g_PrevFallY1[playerIdx] = 0;
        { i8 sx2 = (i8)p->puyoX + Game_GetSatX(p->puyoDir);
          if (sx2 >= 0 && sx2 < BOARD_W && Game_GetSatY(p->puyoDir) == 0) {
            u8 base2 = PAT_PUYO_BASE + (p->puyoColor2 - 1) * 4;
            u8 tx2 = bx + (u8)sx2 * 2;
            VDP_Poke_GM2(tx2, 0, base2 + 2);
            VDP_Poke_GM2(tx2 + 1, 0, base2 + 3);
            g_PrevFallX2[playerIdx] = tx2; g_PrevFallY2[playerIdx] = 0;
        } }
    }

    if (hasFalling && p->subY == 0 && p->puyoY == 0 && p->puyoDir == DIR_UP) {
        u8 base2 = PAT_PUYO_BASE + (p->puyoColor2 - 1) * 4;
        u8 tx2 = bx + p->puyoX * 2;
        VDP_Poke_GM2(tx2, 0, base2 + 2);
        VDP_Poke_GM2(tx2 + 1, 0, base2 + 3);
        g_PrevFallX2[playerIdx] = tx2; g_PrevFallY2[playerIdx] = 0;
    }

    if (hasFalling && p->subY == 1) {
        u8 px = p->puyoX, py = p->puyoY;
        i8 sx = (i8)px + Game_GetSatX(p->puyoDir);
        i8 sy = (i8)py + Game_GetSatY(p->puyoDir);
        if (py < BOARD_H && px < BOARD_W) {
            u8 tx1 = bx + px * 2;
            u8 tyTop = by + py * 2;
            // Only draw if position changed (skip = zero VRAM writes = zero flicker)
            if (g_PrevFallX1[playerIdx] != tx1 || g_PrevFallY1[playerIdx] != tyTop) {
                u8 base = PAT_PUYO_BASE + (p->puyoColor1 - 1) * 4;
                RestoreTile(tx1, tyTop); RestoreTile(tx1 + 1, tyTop);
                VDP_Poke_GM2(tx1, tyTop + 1, base); VDP_Poke_GM2(tx1 + 1, tyTop + 1, base + 1);
                VDP_Poke_GM2(tx1, tyTop + 2, base + 2); VDP_Poke_GM2(tx1 + 1, tyTop + 2, base + 3);
            }
            g_PrevFallX1[playerIdx] = tx1; g_PrevFallY1[playerIdx] = tyTop;
        }
        if (sx >= 0 && sx < BOARD_W) {
            u8 tx2 = bx + (u8)sx * 2;
            if (sy == -1) {
                if (g_PrevFallX2[playerIdx] != tx2 || g_PrevFallY2[playerIdx] != 0) {
                    u8 base = PAT_PUYO_BASE + (p->puyoColor2 - 1) * 4;
                    VDP_Poke_GM2(tx2, 0, base); VDP_Poke_GM2(tx2 + 1, 0, base + 1);
                    VDP_Poke_GM2(tx2, 1, base + 2); VDP_Poke_GM2(tx2 + 1, 1, base + 3);
                }
                g_PrevFallX2[playerIdx] = tx2; g_PrevFallY2[playerIdx] = 0;
            } else if (sy >= 0 && sy < BOARD_H) {
                u8 tyTop = by + (u8)sy * 2;
                if (g_PrevFallX2[playerIdx] != tx2 || g_PrevFallY2[playerIdx] != tyTop) {
                    u8 base = PAT_PUYO_BASE + (p->puyoColor2 - 1) * 4;
                    // Skip RestoreTile if satellite top overlaps with main bottom
                    { u8 mainTyBot = by + py * 2 + 2;
                      if (tyTop != mainTyBot || tx2 != bx + px * 2) {
                        RestoreTile(tx2, tyTop); RestoreTile(tx2 + 1, tyTop);
                      }
                    }
                    VDP_Poke_GM2(tx2, tyTop + 1, base); VDP_Poke_GM2(tx2 + 1, tyTop + 1, base + 1);
                    VDP_Poke_GM2(tx2, tyTop + 2, base + 2); VDP_Poke_GM2(tx2 + 1, tyTop + 2, base + 3);
                }
                g_PrevFallX2[playerIdx] = tx2; g_PrevFallY2[playerIdx] = tyTop;
            }
        }
    }

    // Next piece preview
    {
        u8 nx, ny;
        if (playerIdx == 0) { nx = 16; ny = 7; } else { nx = 16; ny = 14; }
        if (p->nextColor2 != g_ShadowNext[playerIdx][1]) {
            g_ShadowNext[playerIdx][1] = p->nextColor2;
            DrawPuyo16(nx, ny, p->nextColor2);
        }
        if (p->nextColor1 != g_ShadowNext[playerIdx][0]) {
            g_ShadowNext[playerIdx][0] = p->nextColor1;
            DrawPuyo16(nx, ny + 2, p->nextColor1);
        }
    }
}

// Draw connections using pre-computed fixed patterns (1 byte per tile, no pattern writes)
static void Game_DrawConnections(Player* p, u8 pi) {
    u8 x, y, bx, by, color, ci, cU, cD, cL, cR, connBase;
    (void)pi;
    bx = p->boardX;
    by = p->boardY;

    for (y = 0; y < BOARD_H; y++) {
        for (x = 0; x < BOARD_W; x++) {
            color = p->board[y][x];
            if (color < 1 || color > PUYO_COUNT) continue;

            // Skip falling pair cells (and row below when subY!=0)
            if (p->alive && p->puyoColor1 != PUYO_EMPTY) {
                u8 fpx = p->puyoX, fpy = p->puyoY;
                i8 fsx = (i8)fpx + Game_GetSatX(p->puyoDir);
                i8 fsy = (i8)fpy + Game_GetSatY(p->puyoDir);
                if (p->subY != 0) {
                    if (x == fpx && (y == fpy || y == fpy + 1)) continue;
                    if (fsx >= 0 && x == (u8)fsx && (y == (u8)fsy || y == (u8)fsy + 1)) continue;
                } else {
                    if (x == fpx && y == fpy) continue;
                    if (fsx >= 0 && fsy >= 0 && x == (u8)fsx && y == (u8)fsy) continue;
                }
            }

            ci = color - 1;
            cU = (y > 0 && p->board[y-1][x] == color) ? 1 : 0;
            cD = (y+1 < BOARD_H && p->board[y+1][x] == color) ? 1 : 0;
            cL = (x > 0 && p->board[y][x-1] == color) ? 1 : 0;
            cR = (x+1 < BOARD_W && p->board[y][x+1] == color) ? 1 : 0;

            {
                u8 base = PAT_PUYO_BASE + ci * 4;
                u8 tx = bx + x * 2;
                u8 ty = by + y * 2;
                connBase = PAT_CONN_BASE + ci * 6;

                // Always write all 4 quadrants: connection pattern or base pattern
                VDP_Poke_GM2(tx,     ty,     (cU || cL) ? connBase     : base);
                VDP_Poke_GM2(tx + 1, ty,     (cU || cR) ? connBase + 1 : base + 1);
                if (cD || cL) {
                    u8 idx = cL ? connBase + 3 : connBase + 2;
                    VDP_Poke_GM2(tx, ty + 1, idx);
                } else {
                    VDP_Poke_GM2(tx, ty + 1, base + 2);
                }
                if (cD || cR) {
                    u8 idx = cR ? connBase + 5 : connBase + 4;
                    VDP_Poke_GM2(tx + 1, ty + 1, idx);
                } else {
                    VDP_Poke_GM2(tx + 1, ty + 1, base + 3);
                }
            }
        }
    }
}

static void Game_DrawScore(Player* p) {
    u8 sx, sy;

    if (p->score == p->prevScore) return;
    p->prevScore = p->score;

    if (p == &g_Player[0]) {
        sx = CENTER_X; sy = 6;
    } else {
        sx = CENTER_X; sy = 13;
    }

    // Write score digits to name buffer (tile 80 = '0')
    VDP_Poke_GM2(sx,     sy, 80 + (p->score / 10000) % 10);
    VDP_Poke_GM2(sx + 1, sy, 80 + (p->score / 1000) % 10);
    VDP_Poke_GM2(sx + 2, sy, 80 + (p->score / 100) % 10);
    VDP_Poke_GM2(sx + 3, sy, 80 + (p->score / 10) % 10);

}

static void Game_DrawProducers(void) {
    u8 x, y, bank;

    VDP_Setup();

    // Load producers tileset into tiles 0-63
    ZX0_UnpackToRAM((const void*)PROD_PAT_ZX0_ABS, g_PT3Buffer);
    for (bank = 0; bank < 3; bank++)
        VDP_WriteVRAM_16K(g_PT3Buffer, g_ScreenPatternLow + (u16)bank * 0x800, 512);
    ZX0_UnpackToRAM((const void*)PROD_COL_ZX0_ABS, g_PT3Buffer);
    for (bank = 0; bank < 3; bank++)
        VDP_WriteVRAM_16K(g_PT3Buffer, g_ScreenColorLow + (u16)bank * 0x800, 512);

    // "!" sprite pattern
    { static const u8 excl[] = { 0x38, 0x38, 0x38, 0x38, 0x38, 0x00, 0x38, 0x00 };
      VDP_WriteVRAM_16K(excl, g_SpritePatternLow, 8);
    }

    // Fill screen black
    VDP_FillScreen_GM2(0);
    { u16 j; for (j = 0; j < 768; j++) g_NameBuffer[j] = 0; }
    g_NbDirtyCount = 0;

    // Decompress map (18x2) and draw centered
    ZX0_UnpackToRAM((const void*)PROD_MAP_ZX0_ABS, g_PT3Buffer);
    { u8 ox = 7, oy = 11;
      for (y = 0; y < 2; y++)
        for (x = 0; x < 18; x++)
            VDP_Poke_GM2(ox + x, oy + y, g_PT3Buffer[y * 18 + x]);
    }

    // Flush map
    Halt(); NB_Flush();

    // Animate "!" sprite from bottom up to map height
    { u8 sprX = (7 + 18) * 8;  // right of map (pixel X)
      u8 targetY = 11 * 8;      // map row (pixel Y)
      u8 sprY = 192;            // start from bottom
      VDP_SetSpriteFlag(VDP_SPRITE_SIZE_8);
      while (sprY > targetY) {
        sprY -= 2;
        VDP_SetSpriteSM1(0, sprX, sprY, 0, COLOR_WHITE);
        Halt();
      }
    }

    // Wait for button
    {
        u8 joy1;
        while (1) {
            Halt();
            joy1 = Joystick_Read(JOY_PORT_1);
            if (JOY_GET_A(joy1) || JOY_GET_B(joy1)) break;
            if (Keyboard_IsKeyPressed(KEY_SPACE)) break;
        }
    }
    WaitFrames(10);
}

static void Game_DrawTitle(void) {
    u8 i, x, y, bank;
    static const u8 arcTxt[] = {'A'+32,'R'+32,'C'+32,'A'+32,'D'+32,'E'+32};
    static const u8 vsTxt[]  = {'V'+32,'S'+32};

    // Disable BIOS key click
    *((u8*)0xF3DB) = 0;

    VDP_Setup();

    // Load title tileset (64 tiles) into VRAM tiles 0-63
    ZX0_UnpackToRAM((const void*)TITLE_PAT_ZX0_ABS, g_PT3Buffer);
    for (bank = 0; bank < 3; bank++)
        VDP_WriteVRAM_16K(g_PT3Buffer, g_ScreenPatternLow + (u16)bank * 0x800, 512);
    ZX0_UnpackToRAM((const void*)TITLE_COL_ZX0_ABS, g_PT3Buffer);
    for (bank = 0; bank < 3; bank++)
        VDP_WriteVRAM_16K(g_PT3Buffer, g_ScreenColorLow + (u16)bank * 0x800, 512);

    // Fill screen with tile 4 (black tile in title tileset)
    VDP_FillScreen_GM2(0);
    { u16 j; for (j = 0; j < 768; j++) g_NameBuffer[j] = 0; }
    g_NbDirtyCount = 0;

    // Decompress title map
    ZX0_UnpackToRAM((const void*)TITLE_MAP_ZX0_ABS, g_PT3Buffer);

    // Draw "PUYO" line 1 (1 tile left)
    { u8 ox = 9, oy = 3;
      for (y = 0; y < 5; y++)
        for (x = 0; x < 11; x++)
            VDP_Poke_GM2(ox + x, oy + y, g_PT3Buffer[y * 11 + x]);
    }

    // Draw "PUYO" line 2 (1 tile right, 1 tile up) — map still in g_PT3Buffer
    { u8 ox = 11, oy = 8;
      for (y = 0; y < 5; y++)
        for (x = 0; x < 11; x++)
            VDP_Poke_GM2(ox + x, oy + y, g_PT3Buffer[y * 11 + x]);
    }

    // Change bank 1 colors (rows 8-15): green → red for second PUYO
    {
        u16 j;
        ZX0_UnpackToRAM((const void*)TITLE_COL_ZX0_ABS, g_PT3Buffer);
        for (j = 0; j < 512; j++) {
            u8 fg = (g_PT3Buffer[j] >> 4) & 0x0F;
            u8 bg = g_PT3Buffer[j] & 0x0F;
            if (fg == COLOR_DARK_GREEN) fg = COLOR_MEDIUM_RED;
            else if (fg == COLOR_MEDIUM_GREEN) fg = COLOR_MEDIUM_RED;
            else if (fg == COLOR_LIGHT_GREEN) fg = COLOR_LIGHT_RED;
            if (bg == COLOR_DARK_GREEN) bg = COLOR_MEDIUM_RED;
            else if (bg == COLOR_MEDIUM_GREEN) bg = COLOR_MEDIUM_RED;
            else if (bg == COLOR_LIGHT_GREEN) bg = COLOR_LIGHT_RED;
            g_PT3Buffer[j] = (fg << 4) | bg;
        }
        VDP_WriteVRAM_16K(g_PT3Buffer, g_ScreenColorLow + 0x800, 512);
    }

    // Menu options
    for (i = 0; i < 6; i++) VDP_Poke_GM2(13 + i, 19, arcTxt[i]);
    for (i = 0; i < 2; i++) VDP_Poke_GM2(15 + i, 21, vsTxt[i]);
}

// Animate loser's board turning grey, row by row from bottom to top
static void Game_AnimateGameOver(void) {
    u8 loserIdx, x, bx, by;
    i8 y;
    Player* loser;

    if (!g_Player[0].alive) loserIdx = 0;
    else loserIdx = 1;
    loser = &g_Player[loserIdx];
    bx = loser->boardX;
    by = loser->boardY;

    for (y = BOARD_H - 1; y >= 0; y--) {
        for (x = 0; x < BOARD_W; x++) {
            if (loser->board[(u8)y][x] != PUYO_EMPTY) {
                VDP_Poke_GM2(bx + x * 2,     by + (u8)y * 2,     PAT_GRAY_BASE);
                VDP_Poke_GM2(bx + x * 2 + 1, by + (u8)y * 2,     PAT_GRAY_BASE + 1);
                VDP_Poke_GM2(bx + x * 2,     by + (u8)y * 2 + 1, PAT_GRAY_BASE + 2);
                VDP_Poke_GM2(bx + x * 2 + 1, by + (u8)y * 2 + 1, PAT_GRAY_BASE + 3);
            }
        }
        Halt(); NB_Flush(); Halt();
    }
}

static void Game_DrawGameOver(void) {
    // Animate the loser's board
    if (g_Player[0].alive || g_Player[1].alive) {
        Game_AnimateGameOver();
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
    p->alive = TRUE;
    p->dropSpeed = DROP_SPEED_INIT;
    p->dropTimer = 0;
    p->lockTimer = 0;
    p->inputDelay = 0;
    p->rotateDelay = 0;
    p->subY = 0;
    p->garbageFalling = 0;
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
    p->subY = 2;  // 2 = emerging from top (show bottom half only at row 0)
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
    g_BoardDirty[p == &g_Player[1] ? 1 : 0] = TRUE;

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
        // Also invalidate shadow for cells that move (source + dest)
        for (x = 0; x < BOARD_W; x++) {
            for (iy = BOARD_H - 2; iy >= 0; iy--) {
                u8 y = (u8)iy;
                if (p->board[y][x] != PUYO_EMPTY && p->board[y + 1][x] == PUYO_EMPTY) {
                    u8 base = PAT_PUYO_BASE + (p->board[y][x] - 1) * 4;
                    u8 ty = by + y * 2 + 1;
                    RestoreTile(bx + x * 2, by + y * 2);
                    RestoreTile(bx + x * 2 + 1, by + y * 2);
                    VDP_Poke_GM2(bx + x * 2,     ty,     base);
                    VDP_Poke_GM2(bx + x * 2 + 1, ty,     base + 1);
                    VDP_Poke_GM2(bx + x * 2,     ty + 1, base + 2);
                    VDP_Poke_GM2(bx + x * 2 + 1, ty + 1, base + 3);
                    // Invalidate only moved cells
                    g_Shadow[playerIdx][y][x] = 0xFF;
                    g_Shadow[playerIdx][y + 1][x] = 0xFF;
                }
            }
        }
        Halt(); NB_Flush(); // 1 frame at half position

        // Actually move puyos down 1 row in the board
        Game_GravityStep(p);
        Game_DrawBoard(p, playerIdx);
        Halt(); NB_Flush(); // 1 frame at full position
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
                    // Destroy adjacent garbage
                    for (i = 0; i < g_GroupSize; i++) {
                        u8 gx = g_GroupX[i], gy = g_GroupY[i];
                        if (gx > 0 && p->board[gy][gx-1] == PUYO_GARBAGE)
                            p->board[gy][gx-1] = PUYO_EMPTY;
                        if (gx < BOARD_W-1 && p->board[gy][gx+1] == PUYO_GARBAGE)
                            p->board[gy][gx+1] = PUYO_EMPTY;
                        if (gy > 0 && p->board[gy-1][gx] == PUYO_GARBAGE)
                            p->board[gy-1][gx] = PUYO_EMPTY;
                        if (gy < BOARD_H-1 && p->board[gy+1][gx] == PUYO_GARBAGE)
                            p->board[gy+1][gx] = PUYO_EMPTY;
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

#define CHAIN_WIN_W 10
#define CHAIN_WIN_H 3
// Chain window text row: "00xchain" (tiles at row 2, columns 1-8)
static const u8 g_ChainText[] = {80, 80, 152, 99, 104, 97, 105, 110};
static u8 g_ChainWinActive[2];
static u8 g_ChainWinTimer[2];
static u8 g_ChainWinCount[2];
static u8 g_ChainWinTotal[2];

// Generate chain window procedurally: border=61or62, inside=0, text row=g_ChainText
static void Game_DrawChainWin(u8 pi, u8 count, u8 flip) {
    u8 x, y, wx, border;
    wx = (pi == 0) ? 2 : 20;
    border = flip ? 62 : 61;
    for (y = 0; y < CHAIN_WIN_H; y++) {
        for (x = 0; x < CHAIN_WIN_W; x++) {
            u8 tile;
            if (y == 0 || y == CHAIN_WIN_H - 1 || x == 0 || x == CHAIN_WIN_W - 1)
                tile = border;
            else if (y == 1)
                tile = g_ChainText[x - 1];
            else
                tile = 0;
            VDP_Poke_GM2(wx + x, 2 + y, tile);
        }
    }
    VDP_Poke_GM2(wx + 1, 3, 80 + (count / 10));
    VDP_Poke_GM2(wx + 2, 3, 80 + (count % 10));
}

static void Game_ShowChainWindow(u8 pi) {
    g_ChainWinActive[pi] = 1;
    Game_DrawChainWin(pi, 0, 0);
}

static u8 g_ChainFlipTimer[2];
static void Game_RedrawChainWindow(u8 pi, u8 count) {
    if (!g_ChainWinActive[pi]) return;
    g_ChainFlipTimer[pi]++;
    Game_DrawChainWin(pi, count, (g_ChainFlipTimer[pi] / 2) & 1);
}

static void Game_UpdateChainNumber(u8 pi, u8 count) {
    u8 wx = (pi == 0) ? 2 : 20;
    VDP_Poke_GM2(wx + 1, 3, 80 + (count / 10));
    VDP_Poke_GM2(wx + 2, 3, 80 + (count % 10));
}

static void Game_HideChainWindow(u8 pi) {
    u8 x, y, wx;
    if (!g_ChainWinActive[pi]) return;
    wx = (pi == 0) ? 2 : 20;
    {
        u8 bx = g_Player[pi].boardX;
        u8 by = g_Player[pi].boardY;
        for (y = 0; y < CHAIN_WIN_H; y++)
            for (x = 0; x < CHAIN_WIN_W; x++) {
                u8 ty = 2 + y, tx = wx + x;
                VDP_Poke_GM2(tx, ty, g_ScreenLayout[ty * 32 + tx]);
                if (tx >= bx && tx < bx + BOARD_W * 2 && ty >= by && ty < by + BOARD_H * 2) {
                    u8 cy = (ty - by) / 2, cx = (tx - bx) / 2;
                    if (cx < BOARD_W && cy < BOARD_H)
                        g_Shadow[pi][cy][cx] = 0xFF;
                }
            }
        g_BoardDirty[pi] = TRUE;
    }
    g_ChainWinActive[pi] = 0;
    g_ChainWinTimer[pi] = 0;
    g_ChainWinTotal[pi] = 0;
}


// Flash walls of a player's board

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
                Halt(); NB_Flush(); Halt(); Halt();
            }
        }

        // Now actually clear
        cleared = Game_ClearGroups(p);
        if (cleared == 0) break;

        chainCount++;
        g_ChainWinTotal[playerIdx]++;
        p->score += cleared * 10 * chainCount;
        p->totalCleared += cleared;

        // Sound effects
        SFX_Clear();
        if (chainCount > 1) SFX_Chain(chainCount);

        // Visual effects - more spectacular for bigger chains
        {
            static const u8 borderColors[] = { COLOR_LIGHT_GREEN, COLOR_LIGHT_YELLOW, COLOR_LIGHT_RED, COLOR_MAGENTA, COLOR_WHITE };
            u8 ci = chainCount - 1;
            u8 flashFrames;
            if (ci > 4) ci = 4;
            VDP_SetColor(borderColors[ci]);


            totalGarbage += CHAIN_GARBAGE_BASE * chainCount;

            Game_DrawBoard(p, playerIdx);
            Game_DrawConnections(p, playerIdx);
            Game_DrawScore(p);
            Halt(); NB_Flush();

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
    }

    // Show chain window AFTER all animations
    if (chainCount > 0) {
        Game_ShowChainWindow(playerIdx);
        Game_UpdateChainNumber(playerIdx, g_ChainWinTotal[playerIdx]);
        g_ChainFlipTimer[playerIdx] = 0;
        g_ChainWinTimer[playerIdx] = 15;
        g_ChainWinCount[playerIdx] = g_ChainWinTotal[playerIdx];
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
        }
    }

}

static void Game_AddGarbage(Player* p) {
    u8 count, rows, remaining, x, y, i, j, tmp;
    u8 cols[BOARD_W];
    if (p->pendingGarbage == 0) return;
    SFX_GarbageReceive();
    count = p->pendingGarbage;
    if (count > BOARD_W * 2) count = BOARD_W * 2;
    p->pendingGarbage -= count;
    rows = (count + BOARD_W - 1) / BOARD_W;

    // Place garbage at top rows (will fall down via gravity)
    remaining = count;
    for (y = 0; y < rows && remaining > 0; y++) {
        // Shuffle column order (Fisher-Yates)
        for (i = 0; i < BOARD_W; i++) cols[i] = i;
        for (i = BOARD_W - 1; i > 0; i--) {
            j = Math_GetRandom8() % (i + 1);
            tmp = cols[i]; cols[i] = cols[j]; cols[j] = tmp;
        }
        for (i = 0; i < BOARD_W && remaining > 0; i++) {
            x = cols[i];
            if (p->board[y][x] == PUYO_EMPTY) {
                p->board[y][x] = PUYO_GARBAGE;
                remaining--;
            }
        }
    }
}

//=============================================================================
// CPU AI (Player 2)
//=============================================================================

static u8 g_CpuTargetX;   // target column
static u8 g_CpuTargetDir; // target rotation
static u8 g_CpuDelay;     // frame counter between moves
static u8 g_CpuLevel;     // 1-8 difficulty

// CPU difficulty parameters per level (1-8)
// [speed, columns, rotate, fastdrop]
// speed: frames between moves (lower=faster)
// columns: how many columns to evaluate (2-6)
// rotate: 0=no, 1=yes
// fastdrop: 0=no, 1=yes
static const u8 g_CpuParams[8][4] = {
    { 8, 2, 0, 0 }, // Level 1: very slow, 2 cols, no rotate, no fast drop
    { 7, 3, 0, 0 }, // Level 2
    { 6, 4, 0, 0 }, // Level 3
    { 5, 5, 1, 0 }, // Level 4: starts rotating
    { 4, 6, 1, 0 }, // Level 5: checks all columns
    { 3, 6, 1, 1 }, // Level 6: fast drop
    { 2, 6, 1, 1 }, // Level 7
    { 1, 6, 1, 1 }, // Level 8: maximum speed
};

// Count how many adjacent same-color puyos are near the top of column x
static u8 CPU_ScoreColumn(Player* p, u8 x, u8 color) {
    u8 score = 0;
    i8 y;
    // Find landing row
    for (y = BOARD_H - 1; y >= 0; y--) {
        if (p->board[y][x] == PUYO_EMPTY) break;
    }
    if (y < 0) return 0; // column full
    // Check neighbors at landing position
    if (x > 0 && p->board[y][x-1] == color) score += 2;
    if (x < BOARD_W-1 && p->board[y][x+1] == color) score += 2;
    if (y < BOARD_H-1 && p->board[y+1][x] == color) score += 3;
    // Bonus: matching color below
    if (y + 1 < BOARD_H && p->board[y+1][x] == color) score += 2;
    return score;
}

static void CPU_DecideMove(Player* p) {
    u8 x, score, bestScore = 0;
    u8 bestX = 2;
    u8 bestDir = DIR_UP;
    u8 c1 = p->puyoColor1;
    u8 c2 = p->puyoColor2;
    u8 lvl = g_CpuLevel;
    u8 maxCols = g_CpuParams[lvl][1];
    u8 canRotate = g_CpuParams[lvl][2];
    u8 startX, endX;

    // Lower levels only check a few columns near center
    if (maxCols >= BOARD_W) {
        startX = 0; endX = BOARD_W;
    } else {
        startX = (BOARD_W - maxCols) / 2;
        endX = startX + maxCols;
    }

    // Levels 1-2: random element (sometimes pick random column)
    if (lvl < 2 && (Math_GetRandom8() & 3) == 0) {
        g_CpuTargetX = Math_GetRandom8() % BOARD_W;
        g_CpuTargetDir = DIR_UP;
        g_CpuDelay = 0;
        return;
    }

    // Try vertical placements
    for (x = startX; x < endX; x++) {
        score = CPU_ScoreColumn(p, x, c1);
        if (score > bestScore) {
            bestScore = score; bestX = x; bestDir = DIR_UP;
        }
        if (canRotate) {
            score = CPU_ScoreColumn(p, x, c2);
            if (score > bestScore) {
                bestScore = score; bestX = x; bestDir = DIR_DOWN;
            }
        }
    }

    // Levels 5+: try horizontal placement too
    if (canRotate && lvl >= 4) {
        for (x = startX; x < endX && x < BOARD_W - 1; x++) {
            score = CPU_ScoreColumn(p, x, c1) + CPU_ScoreColumn(p, x + 1, c2);
            if (score > bestScore) {
                bestScore = score; bestX = x; bestDir = DIR_RIGHT;
            }
            score = CPU_ScoreColumn(p, x, c2) + CPU_ScoreColumn(p, x + 1, c1);
            if (score > bestScore) {
                bestScore = score; bestX = x; bestDir = DIR_LEFT;
            }
        }
    }

    // If nothing found, pick least-filled column
    if (bestScore == 0) {
        u8 minH = BOARD_H;
        for (x = 0; x < BOARD_W; x++) {
            u8 h = 0;
            i8 y;
            for (y = 0; y < BOARD_H; y++) {
                if (p->board[y][x] != PUYO_EMPTY) { h = BOARD_H - y; break; }
            }
            if (h < minH) { minH = h; bestX = x; }
        }
    }

    g_CpuTargetX = bestX;
    g_CpuTargetDir = canRotate ? bestDir : DIR_UP;
    g_CpuDelay = 0;
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

    // CPU takes over player 2 if joystick is idle (arcade mode only)
    if (g_CpuLevel != 0xFF && (joyPort == JOY_PORT_2 || g_GameMode == MODE_ATTRACT) && dir == 0 && !btnA && !btnB && p->puyoColor1 != PUYO_EMPTY) {
        u8 speed = g_CpuParams[g_CpuLevel][0];
        u8 fastDrop = g_CpuParams[g_CpuLevel][3];
        g_CpuDelay++;
        if (g_CpuDelay >= speed) {
            g_CpuDelay = 0;
            if (p->puyoDir != g_CpuTargetDir) {
                btnA = TRUE;
            } else if (p->puyoX < g_CpuTargetX) {
                dir = JOY_INPUT_DIR_RIGHT;
            } else if (p->puyoX > g_CpuTargetX) {
                dir = JOY_INPUT_DIR_LEFT;
            } else if (fastDrop) {
                dir = JOY_INPUT_DIR_DOWN;
            }
        }
    }
    // Handle garbage falling (non-blocking, 1 row per frame)
    if (p->garbageFalling) {
        u8 pi = (p == &g_Player[1]) ? 1 : 0;
        if (Game_GravityStep(p)) {
            g_BoardDirty[pi] = TRUE;
        } else {
            p->garbageFalling = 0;
            g_BoardDirty[pi] = TRUE;
        }
        return;
    }

    if (p->puyoColor1 == PUYO_EMPTY) {
        if (p->pendingGarbage > 0) {
            u8 pi = (p == &g_Player[1]) ? 1 : 0;
            Game_AddGarbage(p);
            p->garbageFalling = 1;
            g_BoardDirty[pi] = TRUE;
            return;
        }
        Game_SpawnPair(p);
        if (!p->alive) return;
        p->inputDelay = 3;
        // CPU decides target for new piece (arcade mode only)
        if (g_CpuLevel != 0xFF && (joyPort == JOY_PORT_2 || g_GameMode == MODE_ATTRACT)) CPU_DecideMove(p);
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
    currentSpeed = p->dropSpeed / 4;
    if (currentSpeed < 1) currentSpeed = 1;
    if (dir & JOY_INPUT_DIR_DOWN) currentSpeed = DROP_SPEED_SOFT;
    p->dropTimer++;
    if (p->dropTimer >= currentSpeed) {
        p->dropTimer = 0;
        if (p->subY == 2) {
            // Emerging from top: transition to normal
            p->subY = 0;
        } else if (p->subY == 0) {
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
    // CPU level: set on first init, preserved between rounds in arcade
    if (g_GameMode == MODE_VS)
        g_CpuLevel = 0xFF; // VS mode: no CPU
    // Load gameplay screen layout from compressed data
    ZX0_UnpackToRAM((const void*)SCREEN_GAME_ZX0_ABS, g_ScreenLayout);
    VDP_WriteVRAM_16K(g_ScreenLayout, g_ScreenLayoutLow, 768);
    NB_Init(); // sync RAM buffer with VRAM
    g_ChainWinActive[0] = 0; g_ChainWinActive[1] = 0;
    g_ChainWinTimer[0] = 0; g_ChainWinTimer[1] = 0;
    g_ChainWinTotal[0] = 0; g_ChainWinTotal[1] = 0;
    Game_InitBgScroll();
    Shadow_Invalidate();
    g_BoardDirty[0] = TRUE; g_BoardDirty[1] = TRUE;
    Game_DrawBoard(&g_Player[0], 0);
    Game_DrawBoard(&g_Player[1], 1);
    Game_DrawScore(&g_Player[0]);
    Game_DrawScore(&g_Player[1]);
    Halt(); NB_Flush(); // initial flush

    // Wait for screen to be visible before countdown
    Halt();

    // Countdown 3-2-1-GO
    Print_SetPosition(14, 1);
    Print_DrawChar('3');
    WaitFrames(30);
    Print_SetPosition(14, 1);
    Print_DrawChar('2');
    WaitFrames(30);
    Print_SetPosition(14, 1);
    Print_DrawChar('1');
    WaitFrames(30);
    Print_SetPosition(14, 1);
    Print_DrawText("GO!");
    WaitFrames(20);
    // Restore layout tiles instead of writing spaces
    RestoreTile(14, 1);
    RestoreTile(15, 1);
    RestoreTile(16, 1);
}


// Background scroll (pattern only, colors stay from tileset)
static u8 g_BgPatP1[8];
static u8 g_BgPatP2[8];
static u8 g_BgOrigP1[8];
static u8 g_BgOrigP2[8];
static u8 g_BgStepP1, g_BgStepP2;

static void Game_InitBgScroll(void) {
    u8 i;
    ZX0_UnpackToRAM((const void*)TILESET_PAT_ZX0_ABS, g_PT3Buffer);
    for (i = 0; i < 8; i++) {
        g_BgOrigP1[i] = g_PT3Buffer[PAT_BG_P1 * 8 + i];
        g_BgOrigP2[i] = g_PT3Buffer[PAT_BG_P2 * 8 + i];
    }
    g_BgStepP1 = 0;
    g_BgStepP2 = 0;
}

// Get height of tallest puyo column (0 = empty, 11 = full)
static u8 Game_GetMaxHeight(Player* p) {
    u8 x, y;
    for (y = 0; y < BOARD_H; y++)
        for (x = 0; x < BOARD_W; x++)
            if (p->board[y][x] != PUYO_EMPTY)
                return BOARD_H - y;
    return 0;
}

static void Game_UpdateBackground(void) {
    static u8 frameDivP1, frameDivP2;
    u8 bank, i;
    u8 p1Fast, p2Fast;
    u8 p1Update, p2Update;

    // Speed up scroll when tower >= 8 puyos high
    p1Fast = (Game_GetMaxHeight(&g_Player[0]) >= 8) ? 1 : 0;
    p2Fast = (Game_GetMaxHeight(&g_Player[1]) >= 8) ? 1 : 0;

    // P1 scroll: every 1 frame if danger, every 2 frames if safe
    frameDivP1++;
    p1Update = p1Fast ? 1 : ((frameDivP1 & 1) == 0);

    // P2 scroll: independent
    frameDivP2++;
    p2Update = p2Fast ? 1 : ((frameDivP2 & 1) == 0);

    if (p1Update) g_BgStepP1++;
    if (p2Update) g_BgStepP2++;

    // P1: diagonal down-right
    if (p1Update) {
        u8 step = g_BgStepP1 & 7;
        for (i = 0; i < 8; i++) {
            u8 row = g_BgOrigP1[(i - step) & 7];
            if (step > 0)
                g_BgPatP1[i] = (row >> step) | (row << (8 - step));
            else
                g_BgPatP1[i] = row;
        }
    }

    // P2: diagonal down-left
    if (p2Update) {
        u8 step = g_BgStepP2 & 7;
        for (i = 0; i < 8; i++) {
            u8 row = g_BgOrigP2[(i - step) & 7];
            if (step > 0)
                g_BgPatP2[i] = (row << step) | (row >> (8 - step));
            else
                g_BgPatP2[i] = row;
        }
    }

    // Write patterns to all 3 banks
    if (p1Update || p2Update) {
        for (bank = 0; bank < 3; bank++) {
            u16 patBase = g_ScreenPatternLow + (u16)bank * 0x800;
            if (p1Update) VDP_WriteVRAM_16K(g_BgPatP1, patBase + PAT_BG_P1 * 8, 8);
            if (p2Update) VDP_WriteVRAM_16K(g_BgPatP2, patBase + PAT_BG_P2 * 8, 8);
        }
    }
}

static void Game_Update(void) {
    // Attract mode: any input → back to title
    if (g_GameMode == MODE_ATTRACT) {
        u8 j1 = Joystick_Read(JOY_PORT_1);
        u8 j2 = Joystick_Read(JOY_PORT_2);
        if (JOY_GET_DIR(j1) || JOY_GET_A(j1) || JOY_GET_B(j1) ||
            JOY_GET_DIR(j2) || JOY_GET_A(j2) || JOY_GET_B(j2) ||
            Keyboard_IsKeyPressed(KEY_SPACE) || Keyboard_IsKeyPressed(KEY_UP) ||
            Keyboard_IsKeyPressed(KEY_DOWN) || Keyboard_IsKeyPressed(KEY_LEFT) ||
            Keyboard_IsKeyPressed(KEY_RIGHT)) {
            g_Player[0].alive = 0;
            g_Player[1].alive = 0;
        }
    }

    // Logic first (no VRAM writes)
    Game_UpdatePlayer(&g_Player[0], JOY_PORT_1);
    Game_UpdatePlayer(&g_Player[1], JOY_PORT_2);

    // All draw calls write to g_NameBuffer (RAM), not VRAM
    Game_DrawBoard(&g_Player[0], 0);
    Game_DrawBoard(&g_Player[1], 1);
    if (g_BoardDirty[0]) { Game_DrawConnections(&g_Player[0], 0); g_BoardDirty[0] = FALSE; }
    if (g_BoardDirty[1]) { Game_DrawConnections(&g_Player[1], 1); g_BoardDirty[1] = FALSE; }
    Game_DrawScore(&g_Player[0]);
    Game_DrawScore(&g_Player[1]);

    // Chain windows: per-player redraw + auto-hide timer
    { u8 pi;
      for (pi = 0; pi < 2; pi++) {
        if (g_ChainWinActive[pi]) {
            if (g_ChainWinTimer[pi] > 0) {
                g_ChainWinTimer[pi]--;
                if (g_ChainWinTimer[pi] == 0) {
                    Game_HideChainWindow(pi);
                } else {
                    Game_RedrawChainWindow(pi, g_ChainWinCount[pi]);
                }
            } else {
                Game_RedrawChainWindow(pi, g_ChainWinCount[pi]);
            }
        }
    } }

    // 50Hz compensation: skip Halt every 5th frame (6 updates per 5 VBlanks ≈ 60Hz)
    if (g_Is50Hz) {
        g_FrameSkip++;
        if (g_FrameSkip >= 5) {
            g_FrameSkip = 0;
            NB_Flush();
            Game_UpdateBackground();
            return; // skip Halt — run next frame immediately
        }
    }

    // Wait for VBlank, then flush
    Halt();
    NB_Flush();

    // Pattern table writes (bg scroll) go direct to VRAM (not name table)
    Game_UpdateBackground();
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

// Detect 50Hz vs 60Hz by counting VBlanks during a timed loop
static void DetectHz(void) {
    u16 i;
    u8 start, end;
    // JIFFY counter at 0xFC9E is incremented by VBlank ISR
    Halt(); // sync to VBlank
    start = *((volatile u8*)0xFC9E);
    // Busy-wait ~500ms: 3.58MHz, ~18 cycles/iteration, 100000 iterations ≈ 503ms
    for (i = 0; i < 50000u; i++) {
        __asm nop __endasm;
    }
    end = *((volatile u8*)0xFC9E);
    // At 60Hz: ~30 VBlanks in 500ms. At 50Hz: ~25 VBlanks.
    g_Is50Hz = ((u8)(end - start) < 28) ? 1 : 0;
    g_FrameSkip = 0;
}

void main(void) {
    VDP_Setup();
    DetectHz();
    Game_DrawProducers();
    g_GameState = STATE_TITLE;

    while (1) {
        if (g_GameState == STATE_TITLE) {
            Halt();
            Game_DrawTitle();
            Halt(); NB_Flush();
            TitleMusic_Start();
            // Menu selection
            {
                u8 joy1, joy2, dir, sel, prevSel, inputDelay, cpuLvl, prevLvl, attract;
                u16 idleTimer;
                sel = 0;
                cpuLvl = 0;
                prevSel = 0xFF;
                prevLvl = 0xFF;
                inputDelay = 0;
                idleTimer = 0;
                attract = 0;
                while (1) {
                    Halt(); NB_Flush();
                    TitleMusic_Update();
                    joy1 = Joystick_Read(JOY_PORT_1);
                    joy2 = Joystick_Read(JOY_PORT_2);
                    dir = JOY_GET_DIR(joy1);
                    if (Keyboard_IsKeyPressed(KEY_UP)) dir |= JOY_INPUT_DIR_UP;
                    if (Keyboard_IsKeyPressed(KEY_DOWN)) dir |= JOY_INPUT_DIR_DOWN;
                    if (Keyboard_IsKeyPressed(KEY_LEFT)) dir |= JOY_INPUT_DIR_LEFT;
                    if (Keyboard_IsKeyPressed(KEY_RIGHT)) dir |= JOY_INPUT_DIR_RIGHT;

                    // Any input resets idle timer
                    if (dir || JOY_GET_A(joy1) || JOY_GET_B(joy1) ||
                        JOY_GET_A(joy2) || JOY_GET_B(joy2) ||
                        Keyboard_IsKeyPressed(KEY_SPACE)) {
                        idleTimer = 0;
                    } else {
                        idleTimer++;
                    }

                    // Attract mode after ~5 seconds idle
                    if (idleTimer > 300) { attract = 1; break; }

                    if (inputDelay > 0) inputDelay--;
                    if (inputDelay == 0) {
                        if (dir & JOY_INPUT_DIR_UP) { sel = 0; inputDelay = 10; }
                        if (dir & JOY_INPUT_DIR_DOWN) { sel = 1; inputDelay = 10; }
                        if (sel == 0) {
                            if ((dir & JOY_INPUT_DIR_LEFT) && cpuLvl > 0) { cpuLvl--; inputDelay = 10; }
                            if ((dir & JOY_INPUT_DIR_RIGHT) && cpuLvl < 7) { cpuLvl++; inputDelay = 10; }
                        }
                    }

                    // Draw cursor + level
                    if (sel != prevSel || cpuLvl != prevLvl) {
                        VDP_Poke_GM2(10, 19, sel == 0 ? '>'+32 : 0);
                        VDP_Poke_GM2(10, 21, sel == 1 ? '>'+32 : 0);
                        VDP_Poke_GM2(20, 19, sel == 0 ? 80 + cpuLvl + 1 : 0);
                        prevSel = sel;
                        prevLvl = cpuLvl;
                    }

                    if (JOY_GET_A(joy1) || JOY_GET_A(joy2) ||
                        JOY_GET_B(joy1) || JOY_GET_B(joy2) ||
                        Keyboard_IsKeyPressed(KEY_SPACE)) break;
                }

                if (attract) {
                    // Attract mode: CPU vs CPU
                    g_GameMode = MODE_ATTRACT;
                    g_CpuLevel = 7; // max difficulty
                } else {
                    g_GameMode = sel;
                    if (sel == 0) g_CpuLevel = cpuLvl;
                }
            }
            Music_Stop();
            WaitFrames(10);
            g_GameState = STATE_PLAYING;
            // g_CpuLevel already set from menu selection
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
            if (g_GameMode == MODE_ATTRACT) {
                // Attract over → back to title immediately
                Music_Stop();
                g_GameState = STATE_TITLE;
                VDP_Setup();
                continue;
            }

            Game_DrawGameOver();
            SFX_Victory();
            WaitFrames(60);
            WaitButton();
            // Stats screen
            PT3_Silence();
            Game_DrawStatsScreen();
            WaitButton();

            if (g_GameMode == MODE_ARCADE && g_Player[0].alive && g_CpuLevel < 7) {
                // P1 won — advance to next CPU level
                g_CpuLevel++;
                g_GameState = STATE_PLAYING;
                VDP_Setup();
                Game_Init();
                Music_Start();
            } else {
                // VS mode, P1 lost, or beat final boss — back to title
                g_GameState = STATE_TITLE;
                VDP_Setup();
            }
        }
    }
}
