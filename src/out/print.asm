;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module print
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _VDP_Poke_16K
	.globl _VDP_FillVRAM_16K
	.globl _VDP_WriteVRAM_16K
	.globl _g_PrintData
	.globl _g_SLTSL
	.globl _g_GRPACY
	.globl _g_GRPACX
	.globl _g_LOGOPR
	.globl _g_CMASK
	.globl _g_CLOC
	.globl _g_FNKSTR
	.globl _g_ATRBYT
	.globl _g_BDRCLR
	.globl _g_BAKCLR
	.globl _g_FORCLR
	.globl _g_CSRX
	.globl _g_CSRY
	.globl _g_CLIKSW
	.globl _g_MLTPAT
	.globl _g_MLTATR
	.globl _g_MLTCGP
	.globl _g_MLTCOL
	.globl _g_MLTNAM
	.globl _g_GRPPAT
	.globl _g_GRPATR
	.globl _g_GRPCGP
	.globl _g_GRPCOL
	.globl _g_GRPNAM
	.globl _g_T32PAT
	.globl _g_T32ATR
	.globl _g_T32CGP
	.globl _g_T32COL
	.globl _g_T32NAM
	.globl _g_TXTPAT
	.globl _g_TXTATR
	.globl _g_TXTCGP
	.globl _g_TXTCOL
	.globl _g_TXTNAM
	.globl _g_CLMLST
	.globl _g_CRTCNT
	.globl _g_LINLEN
	.globl _g_LINL32
	.globl _g_LINL40
	.globl _g_HexChar
	.globl _g_CHAR_16
	.globl _g_MSXMID
	.globl _g_MSXVER
	.globl _g_ROMVersion
	.globl _g_BASRVN
	.globl _g_VDP_DW
	.globl _g_VDP_DR
	.globl _g_CGTABL
	.globl _g_SVFFFD
	.globl _g_RG27SAV
	.globl _g_RG26SAV
	.globl _g_RG25SAV
	.globl _g_SVFFF8
	.globl _g_MINROM
	.globl _g_RG23SAV
	.globl _g_RG22SAV
	.globl _g_RG21SAV
	.globl _g_RG20SAV
	.globl _g_RG19SAV
	.globl _g_RG18SAV
	.globl _g_RG17SAV
	.globl _g_RG16SAV
	.globl _g_RG15SAV
	.globl _g_RG14SAV
	.globl _g_RG13SAV
	.globl _g_RG12SAV
	.globl _g_RG11SAV
	.globl _g_RG10SAV
	.globl _g_RG09SAV
	.globl _g_RG08SAV
	.globl _g_PROCNM
	.globl _g_SLTWRK
	.globl _g_SLTATR
	.globl _g_SLTTBL
	.globl _g_EXPTBL
	.globl _g_MNROM
	.globl _g_DRWANG
	.globl _g_DRWSCL
	.globl _g_DRWFLG
	.globl _g_GYPOS
	.globl _g_GXPOS
	.globl _g_BRDATR
	.globl _g_CASPRV
	.globl _g_OLDSCR
	.globl _g_SCRMOD
	.globl _g_FLBMEM
	.globl _g_KANAMD
	.globl _g_KANAST
	.globl _g_CAPST
	.globl _g_CSTYLE
	.globl _g_CSRSW
	.globl _g_INSFLG
	.globl _g_ESCCNT
	.globl _g_GRPHED
	.globl _g_WINWID
	.globl _g_LOWLIM
	.globl _g_INTCNT
	.globl _g_INTVAL
	.globl _g_JIFFY
	.globl _g_PADX
	.globl _g_PADY
	.globl _g_INTFLG
	.globl _g_RTYCNT
	.globl _g_TRPTBL
	.globl _g_HIMEM
	.globl _g_BOTTOM
	.globl _g_PATWRK
	.globl _g_LINWRK
	.globl _g_KEYBUF
	.globl _g_NEWKEY
	.globl _g_OLDKEY
	.globl _g_CLIKFL
	.globl _g_ONGSBF
	.globl _g_FNKFLG
	.globl _g_FNKSWI
	.globl _g_CODSAV
	.globl _g_FSTPOS
	.globl _g_LINTTB
	.globl _g_BASROM
	.globl _g_ENSTOP
	.globl _g_VCBC
	.globl _g_VCBB
	.globl _g_VCBA
	.globl _g_PLYCNT
	.globl _g_MUSICF
	.globl _g_QUEUEN
	.globl _g_MCLPTR
	.globl _g_MCLLEN
	.globl _g_SAVVOL
	.globl _g_VOICEN
	.globl _g_SAVSP
	.globl _g_PRSCNT
	.globl _g_LSTMOD
	.globl _g_LSTCOM
	.globl _g_COMMSK
	.globl _g_ESTBLS
	.globl _g_FLAGS
	.globl _g_ERRORS
	.globl _g_DATCNT
	.globl _g_DEVNUM
	.globl _g_OLDINT
	.globl _g_OLDSTT
	.globl _g_MEXBIh
	.globl _g_RSIQLN
	.globl _g_RSFCB
	.globl _g_TOCNT
	.globl _g_RSTMP
	.globl _g_YSAVE
	.globl _g_XSAVE
	.globl _g_NORUSE
	.globl _g_MODE
	.globl _g_ROMA
	.globl _g_CHRCNT
	.globl _g_EXBRSA
	.globl _g_AVCSAV
	.globl _g_ACPAGE
	.globl _g_DPPAGE
	.globl _g_RS2IQ
	.globl _g_VOICCQ
	.globl _g_VOICBQ
	.globl _g_VOICAQ
	.globl _g_QUEBAK
	.globl _g_QUETAB
	.globl _g_ASPCT2
	.globl _g_ASPCT1
	.globl _g_HEADER
	.globl _g_HIGH
	.globl _g_LOW
	.globl _g_CS240
	.globl _g_CS120
	.globl _g_GETPNT
	.globl _g_PUTPNT
	.globl _g_REPCNT
	.globl _g_SCNCNT
	.globl _g_FRCNEW
	.globl _g_QUEUES
	.globl _g_MINUPD
	.globl _g_MAXUPD
	.globl _g_TRGFLG
	.globl _g_STATFL
	.globl _g_RG7SAV
	.globl _g_RG6SAV
	.globl _g_RG5SAV
	.globl _g_RG4SAV
	.globl _g_RG3SAV
	.globl _g_RG2SAV
	.globl _g_RG1SAV
	.globl _g_RG0SAV
	.globl _g_CNSDFG
	.globl _g_USRTAB
	.globl _g_CLPRIM
	.globl _g_WRPRIM
	.globl _g_RDPRIM
	.globl _Print_Initialize
	.globl _Print_SetMode
	.globl _Print_SetFont
	.globl _Print_SetColor
	.globl _Print_SetColorShade
	.globl _Print_SetTextFont
	.globl _DrawChar_Layout
	.globl _Print_Clear
	.globl _Print_Backspace
	.globl _Print_DrawChar
	.globl _Print_DrawCharX
	.globl _Print_DrawText
	.globl _Print_DrawBin8
	.globl _Print_DrawHex8
	.globl _Print_DrawHex16
	.globl _Print_DrawInt
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_g_LINL40	=	0xf3ae
_g_LINL32	=	0xf3af
_g_LINLEN	=	0xf3b0
_g_CRTCNT	=	0xf3b1
_g_CLMLST	=	0xf3b2
_g_TXTNAM	=	0xf3b3
_g_TXTCOL	=	0xf3b5
_g_TXTCGP	=	0xf3b7
_g_TXTATR	=	0xf3b9
_g_TXTPAT	=	0xf3bb
_g_T32NAM	=	0xf3bd
_g_T32COL	=	0xf3bf
_g_T32CGP	=	0xf3c1
_g_T32ATR	=	0xf3c3
_g_T32PAT	=	0xf3c5
_g_GRPNAM	=	0xf3c7
_g_GRPCOL	=	0xf3c9
_g_GRPCGP	=	0xf3cb
_g_GRPATR	=	0xf3cd
_g_GRPPAT	=	0xf3cf
_g_MLTNAM	=	0xf3d1
_g_MLTCOL	=	0xf3d3
_g_MLTCGP	=	0xf3d5
_g_MLTATR	=	0xf3d7
_g_MLTPAT	=	0xf3d9
_g_CLIKSW	=	0xf3db
_g_CSRY	=	0xf3dc
_g_CSRX	=	0xf3dd
_g_FORCLR	=	0xf3e9
_g_BAKCLR	=	0xf3ea
_g_BDRCLR	=	0xf3eb
_g_ATRBYT	=	0xf3f2
_g_FNKSTR	=	0xf87f
_g_CLOC	=	0xf92a
_g_CMASK	=	0xf92c
_g_LOGOPR	=	0xfb02
_g_GRPACX	=	0xfcb7
_g_GRPACY	=	0xfcb9
_g_SLTSL	=	0xffff
_g_PrintData::
	.ds 46
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
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:153: bool Print_Initialize()
;	---------------------------------
; Function Print_Initialize
; ---------------------------------
_Print_Initialize::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:155: Print_SetColor(0xF, 0x0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0f
	call	_Print_SetColor
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x00
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x00
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/vdp.h:480: inline u8 VDP_GetMode() { return g_VDP_Data.Mode; }
	ld	a, (#_g_VDP_Data + 0)
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:164: switch (VDP_GetMode()) // Screen mode specific initialization
	sub	a, #0x03
	jr	NZ, 00102$
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:258: inline void Print_SetTabSize(u8 size) { g_PrintData.TabSize = size; }
	ld	hl, #(_g_PrintData + 4)
	ld	(hl), #0x03
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:185: g_PrintData.ScreenWidth = 32;
	ld	hl, #0x0020
	ld	((_g_PrintData + 22)), hl
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:186: break;
	jp	00103$
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:231: default:
00102$:
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:233: return FALSE;
	xor	a, a
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:234: }
00103$:
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:238: return TRUE;
	ld	a, #0x01
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:239: }
	ret
_g_RDPRIM	=	0xf380
_g_WRPRIM	=	0xf385
_g_CLPRIM	=	0xf38c
_g_USRTAB	=	0xf39a
_g_CNSDFG	=	0xf3de
_g_RG0SAV	=	0xf3df
_g_RG1SAV	=	0xf3e0
_g_RG2SAV	=	0xf3e1
_g_RG3SAV	=	0xf3e2
_g_RG4SAV	=	0xf3e3
_g_RG5SAV	=	0xf3e4
_g_RG6SAV	=	0xf3e5
_g_RG7SAV	=	0xf3e6
_g_STATFL	=	0xf3e7
_g_TRGFLG	=	0xf3e8
_g_MAXUPD	=	0xf3ec
_g_MINUPD	=	0xf3ef
_g_QUEUES	=	0xf3f3
_g_FRCNEW	=	0xf3f5
_g_SCNCNT	=	0xf3f6
_g_REPCNT	=	0xf3f7
_g_PUTPNT	=	0xf3f8
_g_GETPNT	=	0xf3fa
_g_CS120	=	0xf3fc
_g_CS240	=	0xf401
_g_LOW	=	0xf406
_g_HIGH	=	0xf408
_g_HEADER	=	0xf40a
_g_ASPCT1	=	0xf40b
_g_ASPCT2	=	0xf40d
_g_QUETAB	=	0xf959
_g_QUEBAK	=	0xf971
_g_VOICAQ	=	0xf975
_g_VOICBQ	=	0xf9f5
_g_VOICCQ	=	0xfa75
_g_RS2IQ	=	0xfaf5
_g_DPPAGE	=	0xfaf5
_g_ACPAGE	=	0xfaf6
_g_AVCSAV	=	0xfaf7
_g_EXBRSA	=	0xfaf8
_g_CHRCNT	=	0xfaf9
_g_ROMA	=	0xfafa
_g_MODE	=	0xfafc
_g_NORUSE	=	0xfafd
_g_XSAVE	=	0xfafe
_g_YSAVE	=	0xfb00
_g_RSTMP	=	0xfb03
_g_TOCNT	=	0xfb03
_g_RSFCB	=	0xfb04
_g_RSIQLN	=	0xfb06
_g_MEXBIh	=	0xfb07
_g_OLDSTT	=	0xfb0c
_g_OLDINT	=	0xfb0c
_g_DEVNUM	=	0xfb16
_g_DATCNT	=	0xfb17
_g_ERRORS	=	0xfb1a
_g_FLAGS	=	0xfb1b
_g_ESTBLS	=	0xfb1c
_g_COMMSK	=	0xfb1d
_g_LSTCOM	=	0xfb1e
_g_LSTMOD	=	0xfb1f
_g_PRSCNT	=	0xfb35
_g_SAVSP	=	0xfb36
_g_VOICEN	=	0xfb38
_g_SAVVOL	=	0xfb39
_g_MCLLEN	=	0xfb3b
_g_MCLPTR	=	0xfb3c
_g_QUEUEN	=	0xfb3e
_g_MUSICF	=	0xfb3f
_g_PLYCNT	=	0xfb40
_g_VCBA	=	0xfb41
_g_VCBB	=	0xfb66
_g_VCBC	=	0xfb8b
_g_ENSTOP	=	0xfbb0
_g_BASROM	=	0xfbb1
_g_LINTTB	=	0xfbb2
_g_FSTPOS	=	0xfbca
_g_CODSAV	=	0xfbcc
_g_FNKSWI	=	0xfbcd
_g_FNKFLG	=	0xfbce
_g_ONGSBF	=	0xfbd8
_g_CLIKFL	=	0xfbd9
_g_OLDKEY	=	0xfbda
_g_NEWKEY	=	0xfbe5
_g_KEYBUF	=	0xfbf0
_g_LINWRK	=	0xfc18
_g_PATWRK	=	0xfc40
_g_BOTTOM	=	0xfc48
_g_HIMEM	=	0xfc4a
_g_TRPTBL	=	0xfc4c
_g_RTYCNT	=	0xfc9a
_g_INTFLG	=	0xfc9b
_g_PADY	=	0xfc9c
_g_PADX	=	0xfc9d
_g_JIFFY	=	0xfc9e
_g_INTVAL	=	0xfca0
_g_INTCNT	=	0xfca2
_g_LOWLIM	=	0xfca4
_g_WINWID	=	0xfca5
_g_GRPHED	=	0xfca6
_g_ESCCNT	=	0xfca7
_g_INSFLG	=	0xfca8
_g_CSRSW	=	0xfca9
_g_CSTYLE	=	0xfcaa
_g_CAPST	=	0xfcab
_g_KANAST	=	0xfcac
_g_KANAMD	=	0xfcad
_g_FLBMEM	=	0xfcae
_g_SCRMOD	=	0xfcaf
_g_OLDSCR	=	0xfcb0
_g_CASPRV	=	0xfcb1
_g_BRDATR	=	0xfcb2
_g_GXPOS	=	0xfcb3
_g_GYPOS	=	0xfcb5
_g_DRWFLG	=	0xfcbb
_g_DRWSCL	=	0xfcbc
_g_DRWANG	=	0xfcbd
_g_MNROM	=	0xfcc1
_g_EXPTBL	=	0xfcc1
_g_SLTTBL	=	0xfcc5
_g_SLTATR	=	0xfcc9
_g_SLTWRK	=	0xfd09
_g_PROCNM	=	0xfd89
_g_RG08SAV	=	0xffe7
_g_RG09SAV	=	0xffe8
_g_RG10SAV	=	0xffe9
_g_RG11SAV	=	0xffea
_g_RG12SAV	=	0xffeb
_g_RG13SAV	=	0xffec
_g_RG14SAV	=	0xffed
_g_RG15SAV	=	0xffee
_g_RG16SAV	=	0xffef
_g_RG17SAV	=	0xfff0
_g_RG18SAV	=	0xfff1
_g_RG19SAV	=	0xfff2
_g_RG20SAV	=	0xfff3
_g_RG21SAV	=	0xfff4
_g_RG22SAV	=	0xfff5
_g_RG23SAV	=	0xfff6
_g_MINROM	=	0xfff7
_g_SVFFF8	=	0xfff8
_g_RG25SAV	=	0xfffa
_g_RG26SAV	=	0xfffb
_g_RG27SAV	=	0xfffc
_g_SVFFFD	=	0xfffd
_g_CGTABL	=	0x0004
_g_VDP_DR	=	0x0006
_g_VDP_DW	=	0x0007
_g_BASRVN	=	0x002b
_g_ROMVersion	=	0x002b
_g_MSXVER	=	0x002d
_g_MSXMID	=	0x002e
_g_CHAR_16	=	0x0034
_g_HexChar:
	.db #0x30	; 48	'0'
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x34	; 52	'4'
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0x37	; 55	'7'
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x41	; 65	'A'
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:243: void Print_SetMode(u8 mode)
;	---------------------------------
; Function Print_SetMode
; ---------------------------------
_Print_SetMode::
	ld	c, a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:245: g_PrintData.SourceMode = mode;
	ld	hl, #_g_PrintData + 21
	rrd
	ld	a, c
	rld
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:247: switch (g_PrintData.SourceMode)
	ld	a, (hl)
	and	a, #0x0f
	sub	a, #0x04
	ret	NZ
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:312: g_PrintData.DrawChar = DrawChar_Layout;
	ld	hl, #_DrawChar_Layout
	ld	((_g_PrintData + 19)), hl
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:316: };
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:317: }
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:322: void Print_SetFont(const u8* font)
;	---------------------------------
; Function Print_SetFont
; ---------------------------------
_Print_SetFont::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	ex	de, hl
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:324: if (font == NULL) // Use Bios font (if any)
	ld	a, d
	or	a, e
	jr	NZ, 00102$
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:325: Print_SetFontEx(8, 8, 6, 8, 1, 255, (const u8*)g_CGTABL + 8);
	ld	bc, (_g_CGTABL)
	ld	hl, #0x0008
	add	hl, bc
	ex	de, hl
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:197: g_PrintData.PatternX     = patternX;
	ld	hl, #_g_PrintData
	ld	(hl), #0x08
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:198: g_PrintData.PatternY     = patternY;
	ld	bc, #_g_PrintData + 1
	ld	a, #0x08
	ld	(bc), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:199: g_PrintData.UnitX        = sizeX;
	ld	hl, #(_g_PrintData + 2)
	ld	(hl), #0x06
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:200: g_PrintData.UnitY        = sizeY;
	ld	hl, #(_g_PrintData + 3)
	ld	(hl), #0x08
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:201: g_PrintData.CharFirst    = firstChr;
	ld	hl, #(_g_PrintData + 16)
	ld	(hl), #0x01
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:202: g_PrintData.CharLast     = lastChr;
	ld	hl, #(_g_PrintData + 17)
	ld	(hl), #0xff
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:203: g_PrintData.CharCount    = lastChr - firstChr + 1;
	ld	hl, #(_g_PrintData + 18)
	ld	(hl), #0xff
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:204: g_PrintData.FontPatterns = patterns;
	ld	((_g_PrintData + 24)), de
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:205: g_PrintData.FontAddr     = g_PrintData.FontPatterns - (firstChr * g_PrintData.PatternY); // pre-compute address of the virtual index 0 character (used to quick drawing in PutChar_GX functions)
	ld	a, (bc)
	ld	c, a
	ld	b, #0x00
	ld	a, e
	sub	a, c
	ld	c, a
	ld	a, d
	sbc	a, b
	ld	b, a
	ld	((_g_PrintData + 26)), bc
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:325: Print_SetFontEx(8, 8, 6, 8, 1, 255, (const u8*)g_CGTABL + 8);
	jp	00106$
00102$:
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:327: Print_SetFontEx(font[0] >> 4, font[0] & 0x0F, font[1] >> 4, font[1] & 0x0F, font[2], font[3], font+4);
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	a, (hl)
	push	af
	and	a, #0x0f
	ld	-2 (ix), a
	pop	af
	rlca
	rlca
	rlca
	rlca
	and	a, #0x0f
	ld	-1 (ix), a
	ld	a, (de)
	push	af
	and	a, #0x0f
	ld	e, a
	pop	af
	rlca
	rlca
	rlca
	rlca
	and	a, #0x0f
	ld	d, a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:197: g_PrintData.PatternX     = patternX;
	ld	hl, #_g_PrintData
	ld	(hl), d
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:198: g_PrintData.PatternY     = patternY;
	ld	hl, #(_g_PrintData + 1)
	ld	(hl), e
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:199: g_PrintData.UnitX        = sizeX;
	ld	hl, #(_g_PrintData + 2)
	ld	a, -1 (ix)
	ld	(hl), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:200: g_PrintData.UnitY        = sizeY;
	ld	hl, #(_g_PrintData + 3)
	ld	a, -2 (ix)
	ld	(hl), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:201: g_PrintData.CharFirst    = firstChr;
	ld	hl, #(_g_PrintData + 16)
	ld	a, -3 (ix)
	ld	(hl), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:202: g_PrintData.CharLast     = lastChr;
	ld	hl, #(_g_PrintData + 17)
	ld	a, -4 (ix)
	ld	(hl), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:203: g_PrintData.CharCount    = lastChr - firstChr + 1;
	ld	a, -4 (ix)
	sub	a, -3 (ix)
	inc	a
	ld	(#(_g_PrintData + 18)),a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:204: g_PrintData.FontPatterns = patterns;
	ld	((_g_PrintData + 24)), bc
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:205: g_PrintData.FontAddr     = g_PrintData.FontPatterns - (firstChr * g_PrintData.PatternY); // pre-compute address of the virtual index 0 character (used to quick drawing in PutChar_GX functions)
	push	bc
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00113$:
	add	hl, hl
	jr	NC, 00114$
	add	hl, de
00114$:
	djnz	00113$
	pop	bc
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	ld	b, a
	ld	((_g_PrintData + 26)), bc
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:327: Print_SetFontEx(font[0] >> 4, font[0] & 0x0F, font[1] >> 4, font[1] & 0x0F, font[2], font[3], font+4);
00106$:
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:328: }
	ld	sp, ix
	pop	ix
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:391: void Print_SetColor(u8 text, u8 bg)
;	---------------------------------
; Function Print_SetColor
; ---------------------------------
_Print_SetColor::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:421: u8 col = text << 4 | bg;
	add	a, a
	add	a, a
	add	a, a
	add	a, a
	or	a, l
	ld	c, a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/vdp.h:480: inline u8 VDP_GetMode() { return g_VDP_Data.Mode; }
	ld	a, (#_g_VDP_Data + 0)
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:422: switch (VDP_GetMode())
	sub	a, #0x03
	ret	NZ
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:447: u16 dst = (u16)g_ScreenColorLow + g_PrintData.PatternOffset * 8;
	ld	a, (#_g_PrintData + 28)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, (_g_ScreenColorLow)
	add	hl, de
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:448: VDP_FillVRAM(col, dst, 0, g_PrintData.CharCount * 8);
	ld	iy, #_g_PrintData + 18
	ld	e, 0 (iy)
	ld	d, #0x00
	ex	de, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	push	hl
	push	bc
	push	iy
	ex	de, hl
	push	hl
	ld	a, c
	call	_VDP_FillVRAM_16K
	pop	iy
	pop	bc
	pop	hl
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:449: dst += 256 * 8;
	ld	de, #0x0800
	add	hl, de
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:450: VDP_FillVRAM(col, dst, 0, g_PrintData.CharCount * 8);
	ld	e, 0 (iy)
	ld	d, #0x00
	ex	de, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	push	hl
	push	bc
	push	iy
	ex	de, hl
	push	hl
	ld	a, c
	call	_VDP_FillVRAM_16K
	pop	iy
	pop	bc
	pop	hl
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:451: dst += 256 * 8;
	ld	e, l
	ld	a, h
	add	a, #0x08
	ld	d, a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:452: VDP_FillVRAM(col, dst, 0, g_PrintData.CharCount * 8);
	ld	l, 0 (iy)
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	hl
	ld	a, c
	call	_VDP_FillVRAM_16K
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:456: };
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:459: }
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:464: void Print_SetColorShade(const u8* shade)
;	---------------------------------
; Function Print_SetColorShade
; ---------------------------------
_Print_SetColorShade::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
	ex	(sp), hl
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/vdp.h:480: inline u8 VDP_GetMode() { return g_VDP_Data.Mode; }
	ld	a, (#_g_VDP_Data + 0)
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:482: switch (VDP_GetMode())
	sub	a, #0x03
	jr	NZ, 00113$
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:492: u16 dst = (u16)g_ScreenColorLow + g_PrintData.PatternOffset * 8;
	ld	a, (#_g_PrintData + 28)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc, (_g_ScreenColorLow)
	add	hl, bc
	ld	c, l
	ld	b, h
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:493: for (u8 i = 0; i < g_PrintData.CharCount; ++i)
	ld	-1 (ix), #0x00
00111$:
	ld	hl, #_g_PrintData + 18
	ld	a,-1 (ix)
	sub	a,(hl)
	jr	NC, 00113$
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:495: VDP_WriteVRAM(shade, dst,           0, 8);
	push	bc
	ld	hl, #0x0008
	push	hl
	ld	e, c
	ld	d, b
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_VDP_WriteVRAM_16K
	pop	bc
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:496: VDP_WriteVRAM(shade, dst + 256 * 8, 0, 8);
	ld	hl, #0x0800
	add	hl, bc
	push	bc
	ex	de, hl
	ld	hl, #0x0008
	push	hl
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_VDP_WriteVRAM_16K
	pop	bc
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:497: VDP_WriteVRAM(shade, dst + 512 * 8, 0, 8);
	ld	hl, #0x1000
	add	hl, bc
	push	bc
	ex	de, hl
	ld	hl, #0x0008
	push	hl
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_VDP_WriteVRAM_16K
	pop	bc
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:498: dst += 8;
	ld	hl, #0x0008
	add	hl, bc
	ld	c, l
	ld	b, h
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:493: for (u8 i = 0; i < g_PrintData.CharCount; ++i)
	inc	-1 (ix)
	jp	00111$
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:503: };
00113$:
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:506: }
	ld	sp, ix
	pop	ix
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:874: void Print_SetTextFont(const u8* fontData, u8 offset)
;	---------------------------------
; Function Print_SetTextFont
; ---------------------------------
_Print_SetTextFont::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	ex	de, hl
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:876: g_PrintData.PatternOffset = offset;
	ld	hl, #(_g_PrintData + 28)
	ld	a, 4 (ix)
	ld	(hl), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:879: if (fontData == NULL) // Use Bios font (if any)
	ld	a, d
	or	a, e
	jr	NZ, 00102$
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:880: Print_SetFontEx(8, 8, 1, 1, 1, 255, (const u8*)g_CGTABL + 8); // @todo Should be [1, 255] to include all characters
	ld	bc, (_g_CGTABL)
	ld	hl, #0x0008
	add	hl, bc
	ex	de, hl
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:197: g_PrintData.PatternX     = patternX;
	ld	hl, #_g_PrintData
	ld	(hl), #0x08
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:198: g_PrintData.PatternY     = patternY;
	ld	hl, #(_g_PrintData + 1)
	ld	(hl), #0x08
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:199: g_PrintData.UnitX        = sizeX;
	ld	hl, #(_g_PrintData + 2)
	ld	(hl), #0x01
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:200: g_PrintData.UnitY        = sizeY;
	ld	hl, #(_g_PrintData + 3)
	ld	(hl), #0x01
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:201: g_PrintData.CharFirst    = firstChr;
	ld	hl, #(_g_PrintData + 16)
	ld	(hl), #0x01
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:202: g_PrintData.CharLast     = lastChr;
	ld	hl, #(_g_PrintData + 17)
	ld	(hl), #0xff
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:203: g_PrintData.CharCount    = lastChr - firstChr + 1;
	ld	hl, #_g_PrintData + 18
	ex	(sp), hl
	pop	hl
	push	hl
	ld	(hl), #0xff
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:204: g_PrintData.FontPatterns = patterns;
	ld	bc, #_g_PrintData + 24
	ld	l, c
	ld	h, b
	ld	(hl), e
	inc	hl
	ld	(hl), d
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:205: g_PrintData.FontAddr     = g_PrintData.FontPatterns - (firstChr * g_PrintData.PatternY); // pre-compute address of the virtual index 0 character (used to quick drawing in PutChar_GX functions)
	ld	a, (#(_g_PrintData + 1) + 0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	d, a
	ld	((_g_PrintData + 26)), de
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:880: Print_SetFontEx(8, 8, 1, 1, 1, 255, (const u8*)g_CGTABL + 8); // @todo Should be [1, 255] to include all characters
	jp	00103$
00102$:
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:882: Print_SetFontEx(8, 8, 1, 1, fontData[2], fontData[3], fontData+4);
	ld	hl, #0x0004
	add	hl, de
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	de
	inc	de
	ld	a, (de)
	ld	e, a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:197: g_PrintData.PatternX     = patternX;
	ld	hl, #_g_PrintData
	ld	(hl), #0x08
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:198: g_PrintData.PatternY     = patternY;
	ld	hl, #(_g_PrintData + 1)
	ld	(hl), #0x08
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:199: g_PrintData.UnitX        = sizeX;
	ld	hl, #(_g_PrintData + 2)
	ld	(hl), #0x01
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:200: g_PrintData.UnitY        = sizeY;
	ld	hl, #(_g_PrintData + 3)
	ld	(hl), #0x01
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:201: g_PrintData.CharFirst    = firstChr;
	ld	hl, #(_g_PrintData + 16)
	ld	(hl), e
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:202: g_PrintData.CharLast     = lastChr;
	ld	hl, #(_g_PrintData + 17)
	ld	(hl), c
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:203: g_PrintData.CharCount    = lastChr - firstChr + 1;
	ld	hl, #_g_PrintData + 18
	ex	(sp), hl
	ld	a, c
	sub	a, e
	inc	a
	pop	hl
	push	hl
	ld	(hl), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:204: g_PrintData.FontPatterns = patterns;
	ld	bc, #_g_PrintData + 24
	ld	l, c
	ld	h, b
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:205: g_PrintData.FontAddr     = g_PrintData.FontPatterns - (firstChr * g_PrintData.PatternY); // pre-compute address of the virtual index 0 character (used to quick drawing in PutChar_GX functions)
	ld	a, (#(_g_PrintData + 1) + 0)
	push	bc
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00121$:
	add	hl, hl
	jr	NC, 00122$
	add	hl, de
00122$:
	djnz	00121$
	pop	bc
	ld	a, -2 (ix)
	sub	a, l
	ld	e, a
	ld	a, -1 (ix)
	sbc	a, h
	ld	d, a
	ld	((_g_PrintData + 26)), de
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:882: Print_SetFontEx(8, 8, 1, 1, fontData[2], fontData[3], fontData+4);
00103$:
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:883: Print_Initialize();
	push	bc
	call	_Print_Initialize
	ld	a, #0x04
	call	_Print_SetMode
	pop	bc
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:887: const u8* src = g_PrintData.FontPatterns;
	ld	a, (bc)
	ld	-2 (ix), a
	inc	bc
	ld	a, (bc)
	ld	-1 (ix), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:888: u16 dst = (u16)g_ScreenPatternLow + (offset * 8);
	ld	l, 4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc, (_g_ScreenPatternLow)
	add	hl, bc
	ld	c, l
	ld	b, h
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:894: VDP_WriteVRAM(src, dst, 0, g_PrintData.CharCount * 8);
	pop	hl
	push	hl
	ld	l, (hl)
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	bc
	push	hl
	ld	e, c
	ld	d, b
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_VDP_WriteVRAM_16K
	pop	bc
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/vdp.h:480: inline u8 VDP_GetMode() { return g_VDP_Data.Mode; }
	ld	a, (#_g_VDP_Data + 0)
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:896: switch (VDP_GetMode())
	sub	a, #0x03
	jr	NZ, 00109$
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:905: dst += 256 * 8;
	ld	hl, #0x0800
	add	hl, bc
	ld	c, l
	ld	b, h
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:911: VDP_WriteVRAM(src, dst, 0, g_PrintData.CharCount * 8);
	pop	hl
	push	hl
	ld	l, (hl)
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	bc
	push	hl
	ld	e, c
	ld	d, b
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_VDP_WriteVRAM_16K
	pop	bc
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:912: dst += 256 * 8;
	ld	hl, #0x0800
	add	hl, bc
	ex	de, hl
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:918: VDP_WriteVRAM(src, dst, 0, g_PrintData.CharCount * 8);
	pop	hl
	push	hl
	ld	l, (hl)
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	hl
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_VDP_WriteVRAM_16K
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:921: };
00109$:
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:922: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:927: void DrawChar_Layout(u8 chr)
;	---------------------------------
; Function DrawChar_Layout
; ---------------------------------
_DrawChar_Layout::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ld	c, a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:932: u8 shape = chr - g_PrintData.CharFirst + g_PrintData.PatternOffset;
	ld	hl, #_g_PrintData + 16
	ld	b, (hl)
	ld	a, c
	sub	a, b
	ld	hl, #_g_PrintData + 28
	ld	c, (hl)
	add	a, c
	ld	-1 (ix), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:933: u16 dst = (u16)g_ScreenLayoutLow + (g_PrintData.CursorY * g_PrintData.ScreenWidth) + g_PrintData.CursorX;
	ld	hl, #_g_PrintData + 6
	ld	c, (hl)
	ld	de, (#_g_PrintData + 22)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	__mulint
	ld	iy, (_g_ScreenLayoutLow)
	add	iy, de
	ld	a, (#_g_PrintData + 5)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	iy
	pop	bc
	add	hl, bc
	ex	de, hl
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:934: VDP_Poke(shape, dst, g_ScreenLayoutHigh);
	ld	a, -1 (ix)
	call	_VDP_Poke_16K
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:935: }
	inc	sp
	pop	ix
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1100: void Print_Clear()
;	---------------------------------
; Function Print_Clear
; ---------------------------------
_Print_Clear::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1113: VDP_FillVRAM(0, g_ScreenLayoutLow, g_ScreenLayoutHigh, 24 * g_PrintData.ScreenWidth);
	ld	hl, (#(_g_PrintData + 22) + 0)
	ld	c, l
	ld	b, h
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	hl
	ld	de, (_g_ScreenLayoutLow)
	xor	a, a
	call	_VDP_FillVRAM_16K
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1116: }
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1121: void Print_Backspace(u8 num)
;	---------------------------------
; Function Print_Backspace
; ---------------------------------
_Print_Backspace::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ld	-1 (ix), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1142: u16 dst = g_ScreenLayoutLow + (g_PrintData.CursorY * g_PrintData.ScreenWidth) + g_PrintData.CursorX - num;
	ld	hl, #_g_PrintData + 6
	ld	c, (hl)
	ld	de, (#_g_PrintData + 22)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	__mulint
	ld	hl, (_g_ScreenLayoutLow)
	add	hl, de
	ld	bc, #_g_PrintData + 5
	ld	a, (bc)
	ld	e, a
	ld	d, #0x00
	add	hl, de
	ld	e, -1 (ix)
	ld	d, #0x00
	cp	a, a
	sbc	hl, de
	ex	de, hl
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1143: VDP_FillVRAM(0, dst, g_ScreenLayoutHigh, num);
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	xor	a, a
	call	_VDP_FillVRAM_16K
	pop	bc
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1144: g_PrintData.CursorX -= num;
	ld	a, (bc)
	sub	a, -1 (ix)
	ld	(bc), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1147: }
	inc	sp
	pop	ix
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1152: void Print_DrawChar(u8 chr)
;	---------------------------------
; Function Print_DrawChar
; ---------------------------------
_Print_DrawChar::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1161: g_PrintData.DrawChar(chr);
	ld	hl, (#_g_PrintData + 19)
	call	___sdcc_call_hl
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1164: g_PrintData.CursorX += PRINT_W(g_PrintData.UnitX);
	ld	bc, #_g_PrintData + 5
	ld	a, (bc)
	inc	a
	ld	(bc), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1165: }
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1171: void Print_DrawCharX(c8 chr, u8 num)
;	---------------------------------
; Function Print_DrawCharX
; ---------------------------------
_Print_DrawCharX::
	ld	c, a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1173: for (u8 i = 0; i < num; ++i)
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, l
	ret	NC
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1174: Print_DrawChar(chr);
	push	hl
	push	bc
	ld	a, c
	call	_Print_DrawChar
	pop	bc
	pop	hl
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1173: for (u8 i = 0; i < num; ++i)
	inc	b
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1175: }
	jp	00103$
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1180: void Print_DrawText(const c8* str)
;	---------------------------------
; Function Print_DrawText
; ---------------------------------
_Print_DrawText::
	ex	de, hl
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1182: while (*str != 0)
00107$:
	ld	a, (de)
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1184: if (*str == '\t')
	ld	c,a
	or	a,a
	ret	Z
	sub	a, #0x09
	jr	NZ, 00105$
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:446: g_PrintData.CursorX += PRINT_W(g_PrintData.UnitX) + g_PrintData.TabSize - 1;
	ld	bc, #_g_PrintData + 5
	ld	a, (bc)
	ld	hl, #(_g_PrintData + 4)
	ld	l, (hl)
;	spillPairReg hl
	add	a, l
	ld	(bc), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:447: g_PrintData.CursorX &= ~(g_PrintData.TabSize - 1);
	ld	hl, #(_g_PrintData + 4)
	ld	l, (hl)
;	spillPairReg hl
	dec	l
	push	af
	ld	a, l
	cpl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	pop	af
	and	a, l
	ld	(bc), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1185: Print_Tab();
	jp	00106$
00105$:
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1186: else if (*str == '\n')
	ld	a, c
	sub	a, #0x0a
	jr	NZ, 00102$
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:454: g_PrintData.CursorX = 0;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x00
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.h:455: g_PrintData.CursorY += PRINT_H(g_PrintData.UnitY);
	ld	bc, #_g_PrintData + 6
	ld	a, (bc)
	inc	a
	ld	(bc), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1187: Print_Return();
	jp	00106$
00102$:
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1193: Print_DrawChar(*str);
	push	de
	ld	a, c
	call	_Print_DrawChar
	pop	de
00106$:
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1194: str++;
	inc	de
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1196: }
	jp	00107$
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1201: void Print_DrawBin8(u8 value)
;	---------------------------------
; Function Print_DrawBin8
; ---------------------------------
_Print_DrawBin8::
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1203: u8 flag = (u8)(1 << 7);
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1204: for (u8 i = 0; i < 8; ++i)
	ld	bc, #0x80
00103$:
	ld	a, b
	sub	a, #0x08
	ret	NC
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1206: Print_DrawChar((value & flag) ? '1' : '0');
	ld	a, l
	and	a,c
	jr	Z, 00107$
	ld	de, #0x0031
	jp	00108$
00107$:
	ld	de, #0x0030
00108$:
	push	hl
	push	bc
	ld	a, e
	call	_Print_DrawChar
	pop	bc
	pop	hl
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1207: flag >>= 1;
	srl	c
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1204: for (u8 i = 0; i < 8; ++i)
	inc	b
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1212: }
	jp	00103$
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1217: void Print_DrawHex8(u8 value)
;	---------------------------------
; Function Print_DrawHex8
; ---------------------------------
_Print_DrawHex8::
	ld	e, a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1219: Print_DrawChar(g_HexChar[(value >> 4) & 0x000F]);
	ld	bc, #_g_HexChar+0
	ld	a, e
	rlca
	rlca
	rlca
	rlca
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	and	a, #0xf
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	d, (hl)
	push	bc
	push	de
	ld	a, d
	call	_Print_DrawChar
	pop	de
	pop	bc
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1220: Print_DrawChar(g_HexChar[value & 0x000F]);
	ld	d, #0x00
	ld	a, e
	and	a, #0x0f
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	c, (hl)
	ld	a, c
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1224: }
	jp	_Print_DrawChar
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1229: void Print_DrawHex16(u16 value)
;	---------------------------------
; Function Print_DrawHex16
; ---------------------------------
_Print_DrawHex16::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1231: Print_DrawHex8(value >> 8);
	ld	c, h
	push	hl
	ld	a, c
	call	_Print_DrawHex8
	pop	hl
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1232: Print_DrawHex8((u8)value);
	ld	a, l
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1233: }
	jp	_Print_DrawHex8
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1254: void Print_DrawInt(i16 value)
;	---------------------------------
; Function Print_DrawInt
; ---------------------------------
_Print_DrawInt::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-10
	add	iy, sp
	ld	sp, iy
	ld	c, l
	ld	b, h
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1257: if (value < 0)
	ld	d, b
	bit	7, d
	jr	Z, 00102$
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1259: Print_DrawChar('-');
	push	bc
	ld	a, #0x2d
	call	_Print_DrawChar
	pop	bc
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1260: value = -value;
	xor	a, a
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
00102$:
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1264: c8* ptr = str;
	ld	hl, #0
	add	hl, sp
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1265: *ptr = 0;
	ld	(hl), #0x00
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1266: while (value >= 10)
	push	hl
	pop	iy
00103$:
	ld	-2 (ix), c
	ld	-1 (ix), b
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1268: *++ptr = '0' + (value % 10);
	push	iy
	pop	hl
	inc	hl
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1266: while (value >= 10)
	ld	a, -2 (ix)
	sub	a, #0x0a
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C, 00105$
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1268: *++ptr = '0' + (value % 10);
	push	hl
	pop	iy
	push	hl
	push	iy
	ld	de, #0x000a
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__modsint
	pop	iy
	pop	hl
	ld	a, e
	add	a, #0x30
	ld	(hl), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1269: value /= 10;
	push	iy
	ld	de, #0x000a
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divsint
	ld	c, e
	ld	b, d
	pop	iy
	jp	00103$
00105$:
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1271: *++ptr = '0' + value;
	ld	a, c
	add	a, #0x30
	ld	(hl), a
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1272: while (*ptr != 0)
00106$:
	ld	a, (hl)
	or	a, a
	jr	Z, 00109$
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1273: Print_DrawChar(*ptr--);	
	dec	hl
	ld	c, a
	push	hl
	ld	a, c
	call	_Print_DrawChar
	pop	hl
	jp	00106$
00109$:
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/print.c:1274: }
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
