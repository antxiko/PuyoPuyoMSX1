;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module psg
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_PSG_VolumeBackup
	.globl _PSG_SetRegister
	.globl _PSG_GetRegister
	.globl _PSG_SetTone
	.globl _PSG_SetNoise
	.globl _PSG_SetMixer
	.globl _PSG_SetVolume
	.globl _PSG_SetEnvelope
	.globl _PSG_SetShape
	.globl _PSG_EnableTone
	.globl _PSG_EnableNoise
	.globl _PSG_EnableEnvelope
	.globl _PSG_Mute
	.globl _PSG_Resume
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_g_PortPrimarySlot	=	0x00a8
_g_PortReadKeyboard	=	0x00a9
_g_PortAccessKeyboard	=	0x00aa
_g_PortControl	=	0x00ab
_g_VDP_DataPort	=	0x0098
_g_VDP_RegPort	=	0x0099
_g_VDP_AddrPort	=	0x0099
_g_VDP_StatPort	=	0x0099
_g_PSG_RegPort	=	0x00a0
_g_PSG_DataPort	=	0x00a1
_g_PSG_StatPort	=	0x00a2
_g_PSG_Ext_RegPort	=	0x0010
_g_PSG_Ext_DataPort	=	0x0011
_g_PSG_Ext_StatPort	=	0x0012
_g_MSXMusic_IndexPort	=	0x007c
_g_MSXMusic_DataPort	=	0x007d
_g_MSXAudio_IndexPort	=	0x00c0
_g_MSXAudio_DataPort	=	0x00c1
_g_MSXAudio_IndexPort2	=	0x00c2
_g_MSXAudio_DataPort2	=	0x00c3
_g_RTC_AddrPort	=	0x00b4
_g_RTC_DataPort	=	0x00b5
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_g_PSG_VolumeBackup::
	.ds 3
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
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:60: void PSG_SetRegister(u8 reg, u8 value)
;	---------------------------------
; Function PSG_SetRegister
; ---------------------------------
_PSG_SetRegister::
	out	(_g_PSG_RegPort), a
	ld	a, l
	out	(_g_PSG_DataPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:71: PSG_VAR_WRITE = value;
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:74: }
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:78: u8 PSG_GetRegister(u8 reg)
;	---------------------------------
; Function PSG_GetRegister
; ---------------------------------
_PSG_GetRegister::
	out	(_g_PSG_RegPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:89: return PSG_VAR_READ;
	in	a, (_g_PSG_StatPort)
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:92: }
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:98: void PSG_SetTone(u8 chan, u16 period)
;	---------------------------------
; Function PSG_SetTone
; ---------------------------------
_PSG_SetTone::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:109: u8 reg = (chan * 2);
	add	a, a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:110: PSG_VAR_REG = reg;
	out	(_g_PSG_RegPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:111: PSG_VAR_WRITE = (u8)period;
	push	af
	ld	a, e
	out	(_g_PSG_DataPort), a
	pop	af
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:112: PSG_VAR_REG = ++reg;
	inc	a
	out	(_g_PSG_RegPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:113: PSG_VAR_WRITE = (u8)(period >> 8);
	ld	a, d
	out	(_g_PSG_DataPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:116: }
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:120: void PSG_SetNoise(u8 period)
;	---------------------------------
; Function PSG_SetNoise
; ---------------------------------
_PSG_SetNoise::
	ld	c, a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:129: PSG_VAR_REG = PSG_REG_NOISE;
	ld	a, #0x06
	out	(_g_PSG_RegPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:130: PSG_VAR_WRITE = period;
	ld	a, c
	out	(_g_PSG_DataPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:133: }
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:137: void PSG_SetMixer(u8 mix)
;	---------------------------------
; Function PSG_SetMixer
; ---------------------------------
_PSG_SetMixer::
	ld	c, a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:146: PSG_VAR_REG = PSG_REG_MIXER;
	ld	a, #0x07
	out	(_g_PSG_RegPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:147: PSG_VAR_WRITE = ~mix;
	ld	a, c
	cpl
	out	(_g_PSG_DataPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:150: }
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:154: void PSG_SetVolume(u8 chan, u8 vol)
;	---------------------------------
; Function PSG_SetVolume
; ---------------------------------
_PSG_SetVolume::
	ld	b, a
	ld	c, l
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:164: PSG_VAR_REG = PSG_REG_AMP_A + chan;
	ld	a, b
	add	a, #0x08
	out	(_g_PSG_RegPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:165: PSG_VAR_WRITE = vol;
	ld	a, c
	out	(_g_PSG_DataPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:168: }
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:172: void PSG_SetEnvelope(u16 period)
;	---------------------------------
; Function PSG_SetEnvelope
; ---------------------------------
_PSG_SetEnvelope::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:181: PSG_VAR_REG = reg;
	ld	a, #0x0b
	out	(_g_PSG_RegPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:182: PSG_VAR_WRITE = (u8)period;
	ld	a, l
	out	(_g_PSG_DataPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:183: PSG_VAR_REG = ++reg;
	ld	a, #0x0c
	out	(_g_PSG_RegPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:184: PSG_VAR_WRITE = (u8)(period >> 8);
	ld	a, h
	out	(_g_PSG_DataPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:187: }
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:191: void PSG_SetShape(u8 shape)
;	---------------------------------
; Function PSG_SetShape
; ---------------------------------
_PSG_SetShape::
	ld	c, a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:199: PSG_VAR_REG = PSG_REG_SHAPE;
	ld	a, #0x0d
	out	(_g_PSG_RegPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:200: PSG_VAR_WRITE = shape;
	ld	a, c
	out	(_g_PSG_DataPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:203: }
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:207: void PSG_EnableTone(u8 chan, bool val)
;	---------------------------------
; Function PSG_EnableTone
; ---------------------------------
_PSG_EnableTone::
	ld	b, a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:212: PSG_VAR_REG = PSG_REG_MIXER;
	ld	a, #0x07
	out	(_g_PSG_RegPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:213: u8 mix = PSG_VAR_READ;
	in	a, (_g_PSG_StatPort)
	ld	e, a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:216: u8 bit = 1 << chan;
	ld	c, #0x01
	inc	b
	jp	00111$
00110$:
	sla	c
00111$:
	djnz	00110$
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:217: mix &= ~bit;
	ld	a, c
	cpl
	and	a, e
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:219: if (val == 0)
	inc	l
	dec	l
	jr	NZ, 00102$
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:220: mix |= bit;
	or	a, c
00102$:
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:225: PSG_VAR_WRITE = mix;
	out	(_g_PSG_DataPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:227: }
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:231: void PSG_EnableNoise(u8 chan, bool val)
;	---------------------------------
; Function PSG_EnableNoise
; ---------------------------------
_PSG_EnableNoise::
	ld	b, a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:236: PSG_VAR_REG = PSG_REG_MIXER;
	ld	a, #0x07
	out	(_g_PSG_RegPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:237: u8 mix = PSG_VAR_READ;
	in	a, (_g_PSG_StatPort)
	ld	e, a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:240: u8 bit = 8 << chan;
	ld	c, #0x08
	inc	b
	jp	00111$
00110$:
	sla	c
00111$:
	djnz	00110$
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:241: mix &= ~bit;
	ld	a, c
	cpl
	and	a, e
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:243: if (val == 0)
	inc	l
	dec	l
	jr	NZ, 00102$
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:244: mix |= bit;
	or	a, c
00102$:
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:249: PSG_VAR_WRITE = mix;
	out	(_g_PSG_DataPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:251: }
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:255: void PSG_EnableEnvelope(u8 chan, bool val)
;	---------------------------------
; Function PSG_EnableEnvelope
; ---------------------------------
_PSG_EnableEnvelope::
	ld	b, a
	ld	c, l
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:260: PSG_VAR_REG = PSG_REG_AMP_A + chan;
	ld	a, b
	add	a, #0x08
	out	(_g_PSG_RegPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:261: u8 vol = PSG_VAR_READ;
	in	a, (_g_PSG_StatPort)
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:264: vol &= 0x0F;
	and	a, #0x0f
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:266: if (val != 0)
	inc	c
	dec	c
	jr	Z, 00102$
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:267: vol |= PSG_F_ENV;
	set	4, a
00102$:
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:272: PSG_VAR_WRITE = vol;
	out	(_g_PSG_DataPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:274: }
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:280: void PSG_Mute()
;	---------------------------------
; Function PSG_Mute
; ---------------------------------
_PSG_Mute::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:294: loop(i, 3)
	ld	c, #0x00
00103$:
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:296: PSG_VAR_REG = PSG_REG_AMP_A + i;
	ld	a,c
	cp	a,#0x03
	ret	NC
	add	a, #0x08
	out	(_g_PSG_RegPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:298: g_PSG_VolumeBackup[i] = PSG_VAR_READ;
	ld	hl, #_g_PSG_VolumeBackup
	ld	b, #0x00
	add	hl, bc
	in	a, (_g_PSG_StatPort)
	ld	(hl), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:300: PSG_VAR_WRITE = 0;
	ld	a, #0x00
	out	(_g_PSG_DataPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:294: loop(i, 3)
	inc	c
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:304: }
	jp	00103$
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:309: void PSG_Resume()
;	---------------------------------
; Function PSG_Resume
; ---------------------------------
_PSG_Resume::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:320: loop(i, 3)
	ld	c, #0x00
00103$:
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:322: PSG_VAR_REG = PSG_REG_AMP_A + i;
	ld	a,c
	cp	a,#0x03
	ret	NC
	add	a, #0x08
	out	(_g_PSG_RegPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:323: PSG_VAR_WRITE = g_PSG_VolumeBackup[i];
	ld	hl, #_g_PSG_VolumeBackup
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	out	(_g_PSG_DataPort), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:320: loop(i, 3)
	inc	c
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/psg.c:327: }
	jp	00103$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
