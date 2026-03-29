;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module zx0
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ZX0_UnpackToRAM
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
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/compress/zx0.c:19: void ZX0_UnpackToRAM(const void* source, void* dest)
;	---------------------------------
; Function ZX0_UnpackToRAM
; ---------------------------------
_ZX0_UnpackToRAM::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/compress/zx0.c:85: __endasm;
	dzx0_standard:
	ld	bc, #0xFFFF
	push	bc
	inc	bc
	ld	a, #0x80
	dzx0s_literals:
	call	dzx0s_elias
	ldir
	add	a, a
	jr	c, dzx0s_new_offset
	call	dzx0s_elias
	dzx0s_copy:
	ex	(sp), hl
	push	hl
	add	hl, de
	ldir
	pop	hl
	ex	(sp), hl
	add	a, a
	jr	nc, dzx0s_literals
	dzx0s_new_offset:
	pop	bc
	ld	c, #0xFE
	call	dzx0s_elias_loop
	inc	c
	ret	z
	ld	b, c
	ld	c, (hl)
	inc	hl
	rr	b
	rr	c
	push	bc
	ld	bc, #1
	call	nc, dzx0s_elias_backtrack
	inc	bc
	jr	dzx0s_copy
	dzx0s_elias:
	inc	c
	dzx0s_elias_loop:
	add	a, a
	jr	nz, dzx0s_elias_skip
	ld	a, (hl)
	inc	hl
	rla
	dzx0s_elias_skip:
	ret	c
	dzx0s_elias_backtrack:
	add	a, a
	rl	c
	rl	b
	jr	dzx0s_elias_loop
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/compress/zx0.c:86: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
