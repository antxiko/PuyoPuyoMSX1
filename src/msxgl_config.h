// PuyoPuyo VS - MSXgl configuration (MSX1 only)
#pragma once

//-----------------------------------------------------------------------------
// BIOS MODULE
//-----------------------------------------------------------------------------
#define BIOS_CALL_MAINROM			BIOS_CALL_DIRECT
#define BIOS_CALL_SUBROM			BIOS_CALL_INTERSLOT
#define BIOS_CALL_DISKROM			BIOS_CALL_INTERSLOT
#define BIOS_USE_MAINROM			TRUE
#define BIOS_USE_VDP				TRUE
#define BIOS_USE_PSG				TRUE
#define BIOS_USE_SUBROM				FALSE
#define BIOS_USE_DISKROM			FALSE

//-----------------------------------------------------------------------------
// VDP MODULE
//-----------------------------------------------------------------------------
#define VDP_VRAM_ADDR				VDP_VRAM_ADDR_14
#define VDP_UNIT					VDP_UNIT_U8

// Only Screen 2 (Graphic 2)
#define VDP_USE_MODE_T1				FALSE
#define VDP_USE_MODE_G1				FALSE
#define VDP_USE_MODE_G2				TRUE
#define VDP_USE_MODE_MC				FALSE
#define VDP_USE_MODE_T2				FALSE
#define VDP_USE_MODE_G3				FALSE
#define VDP_USE_MODE_G4				FALSE
#define VDP_USE_MODE_G5				FALSE
#define VDP_USE_MODE_G6				FALSE
#define VDP_USE_MODE_G7				FALSE

#define VDP_USE_VRAM16K				TRUE
#define VDP_USE_SPRITE				TRUE
#define VDP_USE_COMMAND				FALSE
#define VDP_USE_CUSTOM_CMD			FALSE
#define VDP_AUTO_INIT				TRUE
#define VDP_USE_UNDOCUMENTED		FALSE
#define VDP_USE_VALIDATOR			TRUE
#define VDP_USE_DEFAULT_PALETTE		FALSE
#define VDP_USE_MSX1_PALETTE		FALSE
#define VDP_USE_DEFAULT_SETTINGS	TRUE
#define VDP_USE_16X16_SPRITE		FALSE
#define VDP_USE_RESTORE_S0			TRUE
#define VDP_USE_PALETTE16			FALSE
#define VDP_ISR_SAFE_MODE			VDP_ISR_SAFE_DEFAULT
#define VDP_INIT_50HZ				VDP_INIT_DEFAULT

//-----------------------------------------------------------------------------
// INPUT MODULE
//-----------------------------------------------------------------------------
#define INPUT_USE_JOYSTICK			TRUE
#define INPUT_USE_KEYBOARD			TRUE
#define INPUT_USE_MOUSE				FALSE
#define INPUT_USE_DETECT			FALSE
#define INPUT_USE_ISR_PROTECTION	TRUE
#define INPUT_JOY_UPDATE			FALSE
#define INPUT_HOLD_SIGNAL			FALSE
#define INPUT_KB_UPDATE				FALSE
#define INPUT_KB_UPDATE_MIN			0
#define INPUT_KB_UPDATE_MAX			8

//-----------------------------------------------------------------------------
// MEMORY MODULE
//-----------------------------------------------------------------------------
#define MEM_USE_VALIDATOR			FALSE
#define MEM_USE_FASTCOPY			FALSE
#define MEM_USE_FASTSET				FALSE
#define MEM_USE_DYNAMIC				FALSE
#define MEM_USE_BUILTIN				TRUE

//-----------------------------------------------------------------------------
// PRINT MODULE
//-----------------------------------------------------------------------------
#define PRINT_USE_TEXT				TRUE
#define PRINT_USE_BITMAP			FALSE
#define PRINT_USE_VRAM				FALSE
#define PRINT_USE_SPRITE			FALSE
#define PRINT_USE_FX_SHADOW			FALSE
#define PRINT_USE_FX_OUTLINE		FALSE
#define PRINT_USE_2_PASS_FX			FALSE
#define PRINT_USE_GRAPH				FALSE
#define PRINT_USE_VALIDATOR			FALSE
#define PRINT_USE_UNIT				FALSE
#define PRINT_USE_FORMAT			FALSE
#define PRINT_USE_32B				FALSE
#define PRINT_SKIP_SPACE			FALSE
#define PRINT_COLOR_NUM				8
#define PRINT_WIDTH					PRINT_WIDTH_1
#define PRINT_HEIGHT				PRINT_HEIGHT_1

//-----------------------------------------------------------------------------
// MATH MODULE
//-----------------------------------------------------------------------------
#define RANDOM_8_METHOD				RANDOM_8_ION
#define RANDOM_16_METHOD			RANDOM_16_XORSHIFT

//-----------------------------------------------------------------------------
// AUDIO
//-----------------------------------------------------------------------------
#define PSG_CHIP					PSG_INTERNAL
#define PSG_ACCESS					PSG_DIRECT
#define PSG_USE_NOTES				FALSE
#define PSG_USE_EXTRA				TRUE
#define PSG_USE_RESUME				TRUE

// PT3 player
#define PT3_SKIP_HEADER				FALSE
#define PT3_AUTOPLAY				FALSE
#define PT3_EXTRA					TRUE

//-----------------------------------------------------------------------------
// DEBUG
//-----------------------------------------------------------------------------
#define DEBUG_TOOL					DEBUG_DISABLE
#define PROFILE_TOOL				PROFILE_DISABLE
#define PROFILE_LEVEL				10
