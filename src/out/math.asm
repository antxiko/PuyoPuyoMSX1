;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module math
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Math_SignedDiv_ASM
	.globl _g_RandomSeed16
	.globl _g_RandomSeed8
	.globl _Math_Div10
	.globl _Math_Div10_16b
	.globl _Math_Mod10
	.globl _Math_Mod10_16b
	.globl _Math_Flip
	.globl _Math_Flip_16b
	.globl _Math_Negative16
	.globl _Math_Swap
	.globl _Math_SetRandomSeed8
	.globl _Math_GetRandom8
	.globl _Math_SetRandomSeed16
	.globl _Math_GetRandom16
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_g_RandomSeed8::
	.ds 2
_g_RandomSeed16::
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:26: i8 Math_Div10(i8 val) __NAKED __FASTCALL __PRESERVES(a, b, c, iyl, iyh)
;	---------------------------------
; Function Math_Div10
; ---------------------------------
_Math_Div10::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:42: __endasm;
	ld	d, #0
	ld	h, d
	ld	e, l
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	l, h
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:43: }
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:47: i16 Math_Div10_16b(i16 val) __NAKED __FASTCALL __PRESERVES(b, d, e, iyl, iyh)
;	---------------------------------
; Function Math_Div10_16b
; ---------------------------------
_Math_Div10_16b::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:70: __endasm;
	ld	bc, #0x0D0A
	xor	a
	add	hl, hl
	rla
	add	hl, hl
	rla
	add	hl, hl
	rla
	add	hl, hl
	rla
	cp	c
	label_0:
	jr	c, label_0 + #4
	sub	c
	inc	l
	label_1:
	djnz	label_1 - #7
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:71: }
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:83: u8 Math_Mod10(u8 val) __NAKED __PRESERVES(b, c, d, e, iyl, iyh)
;	---------------------------------
; Function Math_Mod10
; ---------------------------------
_Math_Mod10::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:105: __endasm;
	ld	h, a
	rrca
	rrca
	rrca
	rrca
	add	a, h
	adc	a, #0
	daa
	ld	l, a
	sub	h
	rra
	sbc	a, a
	and	#5
	add	a, l
	daa
	and	#0x0F
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:106: }
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:114: u8 Math_Mod10_16b(u16 val) __NAKED __FASTCALL __PRESERVES(b, c, d, e, iyl, iyh)
;	---------------------------------
; Function Math_Mod10_16b
; ---------------------------------
_Math_Mod10_16b::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:140: __endasm;
	ld	a, h
	add	a, l
	adc	a, #0
	ld	h, a
	rrca
	rrca
	rrca
	rrca
	add	a, h
	adc	a, #0
	daa
	ld	h, a
	sub	l
	rra
	sbc	a, a
	and	#5
	add	a, h
	daa
	and	#0x0F
	ld	l, a
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:141: }
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:152: u8 Math_Flip(u8 val) __NAKED __PRESERVES(c, d, e, h, l, iyl, iyh)
;	---------------------------------
; Function Math_Flip
; ---------------------------------
_Math_Flip::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:174: __endasm;
	ld	b, a
	rlca
	rlca
	xor	b
	and	#0xAA
	xor	b
	ld	b, a
	rlca
	rlca
	rlca
	rrc	b
	xor	b
	and	#0x66
	xor	b
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:175: }
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:179: u16 Math_Flip_16b(u16 val) __NAKED __PRESERVES(c, iyl, iyh)
;	---------------------------------
; Function Math_Flip_16b
; ---------------------------------
_Math_Flip_16b::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:191: __endasm;
	ld	a, h
	call	_Math_Flip
	ld	e, a
	ld	a, l
	call	_Math_Flip
	ld	d, a
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:192: }
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:196: i16 Math_Negative16(i16 val) __NAKED __FASTCALL __PRESERVES(b, c, d, e, iyl, iyh)
;	---------------------------------
; Function Math_Negative16
; ---------------------------------
_Math_Negative16::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:208: __endasm;
	xor	a
	sub	l
	ld	l, a
	sbc	a, a
	sub	h
	ld	h, a
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:209: }
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:213: u16 Math_Swap(u16 val) __NAKED __PRESERVES(a, b, c, iyl, iyh)
;	---------------------------------
; Function Math_Swap
; ---------------------------------
_Math_Swap::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:221: __endasm;
	ld	e, h
	ld	d, l
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:222: }
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:230: void Math_SignedDiv_ASM() __NAKED __PRESERVES(b, c, d, e, h, l, iyl, iyh)
;	---------------------------------
; Function Math_SignedDiv_ASM
; ---------------------------------
_Math_SignedDiv_ASM::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:248: __endasm;
	_Math_SignedDiv64::
	sra	a
	_Math_SignedDiv32::
	sra	a
	_Math_SignedDiv16::
	sra	a
	_Math_SignedDiv8::
	sra	a
	_Math_SignedDiv4::
	sra	a
	_Math_SignedDiv2::
	sra	a
	ret	p
	inc	a
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:249: }
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:320: void Math_SetRandomSeed8(u8 seed) { g_RandomSeed8 = (u16)seed; }
;	---------------------------------
; Function Math_SetRandomSeed8
; ---------------------------------
_Math_SetRandomSeed8::
	ld	c, a
	ld	iy, #_g_RandomSeed8
	ld	0 (iy), c
	ld	1 (iy), #0x00
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:325: u8 Math_GetRandom8() __NAKED
;	---------------------------------
; Function Math_GetRandom8
; ---------------------------------
_Math_GetRandom8::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:350: __endasm;
	ld	hl, (_g_RandomSeed8)
	ld	a, r
	ld	d, a
	ld	e, a
	add	hl, de
	xor	l
	add	a
	xor	h
	ld	l, a
	ld	(_g_RandomSeed8), hl
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:351: }
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:415: void Math_SetRandomSeed16(u16 seed)
;	---------------------------------
; Function Math_SetRandomSeed16
; ---------------------------------
_Math_SetRandomSeed16::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:417: if (seed)
	ld	a, h
	or	a, l
	jr	Z, 00102$
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:418: g_RandomSeed16 = seed;
	ld	(_g_RandomSeed16), hl
	ret
00102$:
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:420: g_RandomSeed16 = 0x7FFF;
	ld	hl, #0x7fff
	ld	(_g_RandomSeed16), hl
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:421: }
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:434: u16 Math_GetRandom16() __NAKED __FASTCALL
;	---------------------------------
; Function Math_GetRandom16
; ---------------------------------
_Math_GetRandom16::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:455: __endasm;
	xrnd:
	ld	hl, (_g_RandomSeed16)
	ld	a, h
	rra
	ld	a, l
	rra
	xor	h
	ld	h, a
	ld	a, l
	rra
	ld	a, h
	rra
	xor	l
	ld	l, a
	xor	h
	ld	h, a
	ld	(_g_RandomSeed16), hl
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/math.c:461: }
	.area _CODE
	.area _INITIALIZER
__xinit__g_RandomSeed8:
	.dw #0x0001
__xinit__g_RandomSeed16:
	.dw #0x0001
	.area _CABS (ABS)
