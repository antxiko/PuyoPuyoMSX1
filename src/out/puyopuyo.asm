;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module puyopuyo
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _VDP_InterruptHandler
	.globl _PT3_UpdatePSG
	.globl _PT3_Decode
	.globl _PT3_Silence
	.globl _PT3_SetLoop
	.globl _PT3_Resume
	.globl _PT3_Pause
	.globl _PT3_InitSong
	.globl _PT3_Init
	.globl _ZX0_UnpackToRAM
	.globl _Math_GetRandom8
	.globl _Print_SetColor
	.globl _Print_DrawText
	.globl _Print_DrawChar
	.globl _Print_SetTextFont
	.globl _VDP_DisableSpritesFrom
	.globl _VDP_Poke_16K
	.globl _VDP_FillVRAM_16K
	.globl _VDP_WriteVRAM_16K
	.globl _VDP_RegWriteBakMask
	.globl _VDP_RegWrite
	.globl _VDP_SetMode
	.globl _VDP_ClearVRAM
	.globl _Keyboard_IsKeyPressed
	.globl _Joystick_Read
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
	.globl _g_Font_MGL_Sample8
	.globl _PT3_NT2
	.globl _g_BDOS
	.globl _g_MASTER
	.globl _g_RAMAD3
	.globl _g_RAMAD2
	.globl _g_RAMAD1
	.globl _g_RAMAD0
	.globl _g_BREAKV
	.globl _g_DISKVE
	.globl _g_KANJTABLE
	.globl _g_STRSRC
	.globl _g_SUBRID
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
_g_Player:
	.ds 188
_g_GameState:
	.ds 1
_g_FrameCount:
	.ds 1
_g_PT3Buffer:
	.ds 7845
_g_Shadow:
	.ds 132
_g_ScreenLayout:
	.ds 768
_g_ConnPool:
	.ds 1
_g_BoardDirty:
	.ds 2
_g_ShadowNext:
	.ds 4
_g_PrevFallX1:
	.ds 2
_g_PrevFallY1:
	.ds 2
_g_PrevFallX2:
	.ds 2
_g_PrevFallY2:
	.ds 2
_g_PrevSubY:
	.ds 2
_g_Visited:
	.ds 66
_g_GroupX:
	.ds 66
_g_GroupY:
	.ds 66
_g_GroupSize:
	.ds 1
_g_CpuTargetX:
	.ds 1
_g_CpuTargetDir:
	.ds 1
_g_CpuDelay:
	.ds 1
_g_CpuLevel:
	.ds 1
_g_BgPatP1:
	.ds 8
_g_BgPatP2:
	.ds 8
_g_BgOrigP1:
	.ds 8
_g_BgOrigP2:
	.ds 8
_g_BgStep:
	.ds 1
_Game_UpdateBackground_frameDiv_65536_1205:
	.ds 1
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
;./puyopuyo.c:316: static i8 Game_GetSatX(u8 dir) {
;	---------------------------------
; Function Game_GetSatX
; ---------------------------------
_Game_GetSatX:
	ld	c, a
;./puyopuyo.c:318: return dx[dir];
	ld	hl, #_Game_GetSatX_dx_65536_605
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
;./puyopuyo.c:319: }
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
_g_SUBRID	=	0x0000
_g_STRSRC	=	0x0002
_g_KANJTABLE	=	0xf30f
_g_DISKVE	=	0xf323
_g_BREAKV	=	0xf325
_g_RAMAD0	=	0xf341
_g_RAMAD1	=	0xf342
_g_RAMAD2	=	0xf343
_g_RAMAD3	=	0xf344
_g_MASTER	=	0xf348
_g_BDOS	=	0xf37d
_PT3_NT2:
	.dw #0x0d10
	.dw #0x0c55
	.dw #0x0ba4
	.dw #0x0afc
	.dw #0x0a5f
	.dw #0x09ca
	.dw #0x093d
	.dw #0x08b8
	.dw #0x083b
	.dw #0x07c5
	.dw #0x0755
	.dw #0x06ec
	.dw #0x0688
	.dw #0x062a
	.dw #0x05d2
	.dw #0x057e
	.dw #0x052f
	.dw #0x04e5
	.dw #0x049e
	.dw #0x045c
	.dw #0x041d
	.dw #0x03e2
	.dw #0x03ab
	.dw #0x0376
	.dw #0x0344
	.dw #0x0315
	.dw #0x02e9
	.dw #0x02bf
	.dw #0x0298
	.dw #0x0272
	.dw #0x024f
	.dw #0x022e
	.dw #0x020f
	.dw #0x01f1
	.dw #0x01d5
	.dw #0x01bb
	.dw #0x01a2
	.dw #0x018b
	.dw #0x0174
	.dw #0x0160
	.dw #0x014c
	.dw #0x0139
	.dw #0x0128
	.dw #0x0117
	.dw #0x0107
	.dw #0x00f9
	.dw #0x00eb
	.dw #0x00dd
	.dw #0x00d1
	.dw #0x00c5
	.dw #0x00ba
	.dw #0x00b0
	.dw #0x00a6
	.dw #0x009d
	.dw #0x0094
	.dw #0x008c
	.dw #0x0084
	.dw #0x007c
	.dw #0x0075
	.dw #0x006f
	.dw #0x0069
	.dw #0x0063
	.dw #0x005d
	.dw #0x0058
	.dw #0x0053
	.dw #0x004e
	.dw #0x004a
	.dw #0x0046
	.dw #0x0042
	.dw #0x003e
	.dw #0x003b
	.dw #0x0037
	.dw #0x0034
	.dw #0x0031
	.dw #0x002f
	.dw #0x002c
	.dw #0x0029
	.dw #0x0027
	.dw #0x0025
	.dw #0x0023
	.dw #0x0021
	.dw #0x001f
	.dw #0x001d
	.dw #0x001c
	.dw #0x001a
	.dw #0x0019
	.dw #0x0017
	.dw #0x0016
	.dw #0x0015
	.dw #0x0014
	.dw #0x0012
	.dw #0x0011
	.dw #0x0010
	.dw #0x000f
	.dw #0x000e
	.dw #0x000d
_g_MusicTitle_Zx0:
	.db #0x00	; 0
	.db #0xa1	; 161
	.db #0x56	; 86	'V'
	.db #0x6f	; 111	'o'
	.db #0x72	; 114	'r'
	.db #0x74	; 116	't'
	.db #0x65	; 101	'e'
	.db #0x78	; 120	'x'
	.db #0x20	; 32
	.db #0x54	; 84	'T'
	.db #0x72	; 114	'r'
	.db #0x61	; 97	'a'
	.db #0x63	; 99	'c'
	.db #0x6b	; 107	'k'
	.db #0x65	; 101	'e'
	.db #0x72	; 114	'r'
	.db #0x20	; 32
	.db #0x49	; 73	'I'
	.db #0x1e	; 30
	.db #0x20	; 32
	.db #0x31	; 49	'1'
	.db #0x2e	; 46
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x6d	; 109	'm'
	.db #0x6f	; 111	'o'
	.db #0x64	; 100	'd'
	.db #0x75	; 117	'u'
	.db #0x6c	; 108	'l'
	.db #0x65	; 101	'e'
	.db #0x3a	; 58
	.db #0x20	; 32
	.db #0x4d	; 77	'M'
	.db #0x69	; 105	'i'
	.db #0x6c	; 108	'l'
	.db #0x6b	; 107	'k'
	.db #0x79	; 121	'y'
	.db #0x20	; 32
	.db #0x57	; 87	'W'
	.db #0x61	; 97	'a'
	.db #0xf9	; 249
	.db #0x3e	; 62
	.db #0x69	; 105	'i'
	.db #0x6e	; 110	'n'
	.db #0xe7	; 231
	.db #0xf5	; 245
	.db #0x3a	; 58
	.db #0x50	; 80	'P'
	.db #0x6f	; 111	'o'
	.db #0xb4	; 180
	.db #0xb8	; 184
	.db #0x74	; 116	't'
	.db #0xfe	; 254
	.db #0x6e	; 110	'n'
	.db #0x62	; 98	'b'
	.db #0xc5	; 197
	.db #0x0a	; 10
	.db #0xa9	; 169
	.db #0x20	; 32
	.db #0x41	; 65	'A'
	.db #0x6b	; 107	'k'
	.db #0x16	; 22
	.db #0x20	; 32
	.db #0x31	; 49	'1'
	.db #0x34	; 52	'4'
	.db #0x2d	; 45
	.db #0x6f	; 111	'o'
	.db #0x33	; 51	'3'
	.db #0x2d	; 45
	.db #0x32	; 50	'2'
	.db #0x6f	; 111	'o'
	.db #0x32	; 50	'2'
	.db #0x36	; 54	'6'
	.db #0x9a	; 154
	.db #0x5b	; 91
	.db #0x41	; 65	'A'
	.db #0x59	; 89	'Y'
	.db #0x08	; 8
	.db #0x41	; 65	'A'
	.db #0x43	; 67	'C'
	.db #0x42	; 66	'B'
	.db #0x5d	; 93
	.db #0xe6	; 230
	.db #0xfc	; 252
	.db #0x1a	; 26
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x2d	; 45
	.db #0x00	; 0
	.db #0xf7	; 247
	.db #0x99	; 153
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0xc8	; 200
	.db #0x10	; 16
	.db #0xce	; 206
	.db #0xf4	; 244
	.db #0x3b	; 59
	.db #0x66	; 102	'f'
	.db #0x11	; 17
	.db #0xed	; 237
	.db #0xa8	; 168
	.db #0xba	; 186
	.db #0xf8	; 248
	.db #0xf5	; 245
	.db #0xb2	; 178
	.db #0x60	; 96
	.db #0x8b	; 139
	.db #0xf8	; 248
	.db #0x11	; 17
	.db #0x72	; 114	'r'
	.db #0x12	; 18
	.db #0xf0	; 240
	.db #0xba	; 186
	.db #0xf8	; 248
	.db #0xf5	; 245
	.db #0xf6	; 246
	.db #0x79	; 121	'y'
	.db #0xfc	; 252
	.db #0x59	; 89	'Y'
	.db #0xab	; 171
	.db #0x78	; 120	'x'
	.db #0x13	; 19
	.db #0x7b	; 123
	.db #0x85	; 133
	.db #0xeb	; 235
	.db #0xec	; 236
	.db #0x8f	; 143
	.db #0xe6	; 230
	.db #0xf9	; 249
	.db #0xfd	; 253
	.db #0x85	; 133
	.db #0x14	; 20
	.db #0x8f	; 143
	.db #0xaa	; 170
	.db #0x99	; 153
	.db #0x9e	; 158
	.db #0xea	; 234
	.db #0xed	; 237
	.db #0xa2	; 162
	.db #0xb8	; 184
	.db #0xa7	; 167
	.db #0x7d	; 125
	.db #0xa0	; 160
	.db #0x66	; 102	'f'
	.db #0x03	; 3
	.db #0xa4	; 164
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x3e	; 62
	.db #0x15	; 21
	.db #0x18	; 24
	.db #0x15	; 21
	.db #0x1b	; 27
	.db #0x1e	; 30
	.db #0x21	; 33
	.db #0x27	; 39
	.db #0x24	; 36
	.db #0x2a	; 42
	.db #0x2d	; 45
	.db #0x30	; 48	'0'
	.db #0x33	; 51	'3'
	.db #0xe8	; 232
	.db #0x0f	; 15
	.db #0x36	; 54	'6'
	.db #0x39	; 57	'9'
	.db #0x3c	; 60
	.db #0x3f	; 63
	.db #0xf8	; 248
	.db #0x81	; 129
	.db #0x6a	; 106	'j'
	.db #0x42	; 66	'B'
	.db #0x45	; 69	'E'
	.db #0x48	; 72	'H'
	.db #0x4b	; 75	'K'
	.db #0x4e	; 78	'N'
	.db #0x51	; 81	'Q'
	.db #0x54	; 84	'T'
	.db #0x57	; 87	'W'
	.db #0x5a	; 90	'Z'
	.db #0x5d	; 93
	.db #0x5a	; 90	'Z'
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0xff	; 255
	.db #0x11	; 17
	.db #0x02	; 2
	.db #0xe4	; 228
	.db #0x01	; 1
	.db #0x2b	; 43
	.db #0xc9	; 201
	.db #0xea	; 234
	.db #0xf5	; 245
	.db #0x07	; 7
	.db #0x1b	; 27
	.db #0x3c	; 60
	.db #0x02	; 2
	.db #0x56	; 86	'V'
	.db #0x02	; 2
	.db #0x75	; 117	'u'
	.db #0xe8	; 232
	.db #0xdd	; 221
	.db #0xe9	; 233
	.db #0x8f	; 143
	.db #0x6a	; 106	'j'
	.db #0xa2	; 162
	.db #0xa4	; 164
	.db #0xc3	; 195
	.db #0x68	; 104	'h'
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x1c	; 28
	.db #0x03	; 3
	.db #0x3e	; 62
	.db #0x03	; 3
	.db #0x89	; 137
	.db #0x03	; 3
	.db #0x97	; 151
	.db #0x03	; 3
	.db #0xaa	; 170
	.db #0x03	; 3
	.db #0xf8	; 248
	.db #0x13	; 19
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x91	; 145
	.db #0x04	; 4
	.db #0xdf	; 223
	.db #0x04	; 4
	.db #0xef	; 239
	.db #0x04	; 4
	.db #0x78	; 120	'x'
	.db #0x05	; 5
	.db #0xc6	; 198
	.db #0x05	; 5
	.db #0xf8	; 248
	.db #0x05	; 5
	.db #0x83	; 131
	.db #0x06	; 6
	.db #0xe6	; 230
	.db #0x06	; 6
	.db #0x88	; 136
	.db #0xdd	; 221
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x22	; 34
	.db #0x92	; 146
	.db #0x07	; 7
	.db #0x20	; 32
	.db #0xf8	; 248
	.db #0xb9	; 185
	.db #0x07	; 7
	.db #0x30	; 48	'0'
	.db #0x07	; 7
	.db #0xb8	; 184
	.db #0xfa	; 250
	.db #0x48	; 72	'H'
	.db #0x08	; 8
	.db #0xf4	; 244
	.db #0xab	; 171
	.db #0xfb	; 251
	.db #0xd0	; 208
	.db #0xd4	; 212
	.db #0x88	; 136
	.db #0xe8	; 232
	.db #0xe5	; 229
	.db #0x17	; 23
	.db #0x09	; 9
	.db #0xa1	; 161
	.db #0xa2	; 162
	.db #0x32	; 50	'2'
	.db #0x09	; 9
	.db #0xbd	; 189
	.db #0x09	; 9
	.db #0xd8	; 216
	.db #0x09	; 9
	.db #0xef	; 239
	.db #0xf8	; 248
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0xfa	; 250
	.db #0x27	; 39
	.db #0x0a	; 10
	.db #0xf4	; 244
	.db #0x45	; 69	'E'
	.db #0x1a	; 26
	.db #0x63	; 99	'c'
	.db #0xe3	; 227
	.db #0xb9	; 185
	.db #0xb0	; 176
	.db #0x0a	; 10
	.db #0x9b	; 155
	.db #0xf5	; 245
	.db #0xbe	; 190
	.db #0x0a	; 10
	.db #0xce	; 206
	.db #0xe9	; 233
	.db #0xe8	; 232
	.db #0xce	; 206
	.db #0xaa	; 170
	.db #0xd7	; 215
	.db #0xe7	; 231
	.db #0xa9	; 169
	.db #0xfa	; 250
	.db #0x48	; 72	'H'
	.db #0x5d	; 93
	.db #0x0b	; 11
	.db #0xc0	; 192
	.db #0x0b	; 11
	.db #0x49	; 73	'I'
	.db #0x0c	; 12
	.db #0x73	; 115	's'
	.db #0x0c	; 12
	.db #0xad	; 173
	.db #0x0c	; 12
	.db #0x36	; 54	'6'
	.db #0x0d	; 13
	.db #0x99	; 153
	.db #0x0d	; 13
	.db #0x84	; 132
	.db #0xe0	; 224
	.db #0xed	; 237
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x3f	; 63
	.db #0x0e	; 14
	.db #0xca	; 202
	.db #0x0e	; 14
	.db #0x18	; 24
	.db #0x0f	; 15
	.db #0xd1	; 209
	.db #0x89	; 137
	.db #0x28	; 40
	.db #0x0f	; 15
	.db #0x76	; 118	'v'
	.db #0x0f	; 15
	.db #0x0d	; 13
	.db #0x86	; 134
	.db #0x0f	; 15
	.db #0xd2	; 210
	.db #0x0f	; 15
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x92	; 146
	.db #0x10	; 16
	.db #0xa1	; 161
	.db #0x10	; 16
	.db #0xb0	; 176
	.db #0x10	; 16
	.db #0xea	; 234
	.db #0x74	; 116	't'
	.db #0x03	; 3
	.db #0x53	; 83	'S'
	.db #0xda	; 218
	.db #0x45	; 69	'E'
	.db #0xcf	; 207
	.db #0xb1	; 177
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0xb1	; 177
	.db #0x03	; 3
	.db #0xd0	; 208
	.db #0xb1	; 177
	.db #0x04	; 4
	.db #0x7c	; 124
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0xe6	; 230
	.db #0xfa	; 250
	.db #0x7e	; 126
	.db #0x7b	; 123
	.db #0x77	; 119	'w'
	.db #0x18	; 24
	.db #0x3a	; 58
	.db #0x00	; 0
	.db #0xb1	; 177
	.db #0x06	; 6
	.db #0xc0	; 192
	.db #0xc5	; 197
	.db #0xc8	; 200
	.db #0x11	; 17
	.db #0x9e	; 158
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x7e	; 126
	.db #0xc3	; 195
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0xe2	; 226
	.db #0xcf	; 207
	.db #0x01	; 1
	.db #0xf3	; 243
	.db #0xf9	; 249
	.db #0x50	; 80	'P'
	.db #0x01	; 1
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xad	; 173
	.db #0x72	; 114	'r'
	.db #0x5e	; 94
	.db #0xb9	; 185
	.db #0x78	; 120	'x'
	.db #0xb1	; 177
	.db #0x1c	; 28
	.db #0x61	; 97	'a'
	.db #0x9f	; 159
	.db #0xa3	; 163
	.db #0x64	; 100	'd'
	.db #0x66	; 102	'f'
	.db #0x18	; 24
	.db #0x68	; 104	'h'
	.db #0x8e	; 142
	.db #0x65	; 101	'e'
	.db #0x08	; 8
	.db #0xd0	; 208
	.db #0xaa	; 170
	.db #0x28	; 40
	.db #0x7c	; 124
	.db #0x67	; 103	'g'
	.db #0x79	; 121	'y'
	.db #0x75	; 117	'u'
	.db #0x7c	; 124
	.db #0xfd	; 253
	.db #0xfa	; 250
	.db #0x1c	; 28
	.db #0x3d	; 61
	.db #0xc4	; 196
	.db #0x7d	; 125
	.db #0x1c	; 28
	.db #0xf9	; 249
	.db #0x6c	; 108	'l'
	.db #0xf8	; 248
	.db #0x10	; 16
	.db #0x64	; 100	'd'
	.db #0xc8	; 200
	.db #0x1d	; 29
	.db #0x79	; 121	'y'
	.db #0x7b	; 123
	.db #0x01	; 1
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0xcf	; 207
	.db #0x64	; 100	'd'
	.db #0x53	; 83	'S'
	.db #0x66	; 102	'f'
	.db #0xa2	; 162
	.db #0xe9	; 233
	.db #0x04	; 4
	.db #0xb9	; 185
	.db #0x50	; 80	'P'
	.db #0x38	; 56	'8'
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x63	; 99	'c'
	.db #0xcf	; 207
	.db #0x6b	; 107	'k'
	.db #0x9e	; 158
	.db #0xa6	; 166
	.db #0xa9	; 169
	.db #0x83	; 131
	.db #0x05	; 5
	.db #0x9e	; 158
	.db #0x5d	; 93
	.db #0x64	; 100	'd'
	.db #0x68	; 104	'h'
	.db #0x6b	; 107	'k'
	.db #0xd3	; 211
	.db #0xda	; 218
	.db #0x6d	; 109	'm'
	.db #0xfd	; 253
	.db #0x6b	; 107	'k'
	.db #0xfe	; 254
	.db #0x9c	; 156
	.db #0x98	; 152
	.db #0x36	; 54	'6'
	.db #0x0c	; 12
	.db #0x1a	; 26
	.db #0x02	; 2
	.db #0xaa	; 170
	.db #0xc8	; 200
	.db #0xcf	; 207
	.db #0xa8	; 168
	.db #0xc8	; 200
	.db #0x7d	; 125
	.db #0xcf	; 207
	.db #0x80	; 128
	.db #0xc8	; 200
	.db #0x79	; 121	'y'
	.db #0xcf	; 207
	.db #0xe8	; 232
	.db #0x3e	; 62
	.db #0xb8	; 184
	.db #0x3f	; 63
	.db #0xd0	; 208
	.db #0xc8	; 200
	.db #0xbb	; 187
	.db #0xe7	; 231
	.db #0xc4	; 196
	.db #0xb6	; 182
	.db #0xc6	; 198
	.db #0xf1	; 241
	.db #0xeb	; 235
	.db #0x06	; 6
	.db #0x24	; 36
	.db #0x74	; 116	't'
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0x39	; 57	'9'
	.db #0xf9	; 249
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0xe2	; 226
	.db #0xcf	; 207
	.db #0xb1	; 177
	.db #0x0c	; 12
	.db #0x61	; 97	'a'
	.db #0xce	; 206
	.db #0x6a	; 106	'j'
	.db #0x04	; 4
	.db #0xd0	; 208
	.db #0xcd	; 205
	.db #0xd0	; 208
	.db #0xcc	; 204
	.db #0xcb	; 203
	.db #0xaa	; 170
	.db #0xca	; 202
	.db #0xc9	; 201
	.db #0xaa	; 170
	.db #0xc8	; 200
	.db #0xc7	; 199
	.db #0xaa	; 170
	.db #0xc6	; 198
	.db #0xc5	; 197
	.db #0xaa	; 170
	.db #0xc4	; 196
	.db #0xc3	; 195
	.db #0xae	; 174
	.db #0xc2	; 194
	.db #0x0a	; 10
	.db #0x05	; 5
	.db #0x7b	; 123
	.db #0x3b	; 59
	.db #0xc0	; 192
	.db #0x96	; 150
	.db #0x0c	; 12
	.db #0xe1	; 225
	.db #0xd4	; 212
	.db #0x0b	; 11
	.db #0x72	; 114	'r'
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x9d	; 157
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0xb1	; 177
	.db #0x38	; 56	'8'
	.db #0x61	; 97	'a'
	.db #0xe2	; 226
	.db #0xb0	; 176
	.db #0xcf	; 207
	.db #0xb2	; 178
	.db #0xa7	; 167
	.db #0x6d	; 109	'm'
	.db #0xb6	; 182
	.db #0x29	; 41
	.db #0x4d	; 77	'M'
	.db #0x7a	; 122	'z'
	.db #0x10	; 16
	.db #0xba	; 186
	.db #0x45	; 69	'E'
	.db #0xb4	; 180
	.db #0x92	; 146
	.db #0x7e	; 126
	.db #0xaa	; 170
	.db #0x7b	; 123
	.db #0x7e	; 126
	.db #0xaa	; 170
	.db #0x77	; 119	'w'
	.db #0x7b	; 123
	.db #0xaf	; 175
	.db #0x7e	; 126
	.db #0x77	; 119	'w'
	.db #0xe8	; 232
	.db #0x59	; 89	'Y'
	.db #0xda	; 218
	.db #0x00	; 0
	.db #0xdc	; 220
	.db #0x41	; 65	'A'
	.db #0x8f	; 143
	.db #0x79	; 121	'y'
	.db #0xab	; 171
	.db #0x1b	; 27
	.db #0x48	; 72	'H'
	.db #0xaa	; 170
	.db #0xf3	; 243
	.db #0x7b	; 123
	.db #0x23	; 35
	.db #0xe2	; 226
	.db #0x02	; 2
	.db #0xa3	; 163
	.db #0x02	; 2
	.db #0xd2	; 210
	.db #0xbd	; 189
	.db #0xdb	; 219
	.db #0x11	; 17
	.db #0xe7	; 231
	.db #0x61	; 97	'a'
	.db #0xb9	; 185
	.db #0xf5	; 245
	.db #0x4e	; 78	'N'
	.db #0xe7	; 231
	.db #0xe3	; 227
	.db #0x6d	; 109	'm'
	.db #0xd4	; 212
	.db #0xb0	; 176
	.db #0xeb	; 235
	.db #0x74	; 116	't'
	.db #0xd7	; 215
	.db #0xba	; 186
	.db #0xe9	; 233
	.db #0xb0	; 176
	.db #0xcf	; 207
	.db #0x5f	; 95
	.db #0x67	; 103	'g'
	.db #0x58	; 88	'X'
	.db #0x6b	; 107	'k'
	.db #0xd7	; 215
	.db #0xea	; 234
	.db #0xd0	; 208
	.db #0x04	; 4
	.db #0xb9	; 185
	.db #0xd3	; 211
	.db #0xc7	; 199
	.db #0xab	; 171
	.db #0x74	; 116	't'
	.db #0xd5	; 213
	.db #0xca	; 202
	.db #0x01	; 1
	.db #0x23	; 35
	.db #0xd5	; 213
	.db #0xd4	; 212
	.db #0xcf	; 207
	.db #0xf9	; 249
	.db #0xb8	; 184
	.db #0xa0	; 160
	.db #0xe8	; 232
	.db #0xb8	; 184
	.db #0xff	; 255
	.db #0x68	; 104	'h'
	.db #0x68	; 104	'h'
	.db #0xc7	; 199
	.db #0x77	; 119	'w'
	.db #0xf0	; 240
	.db #0xee	; 238
	.db #0xf9	; 249
	.db #0x34	; 52	'4'
	.db #0xcc	; 204
	.db #0xfe	; 254
	.db #0x7b	; 123
	.db #0xc6	; 198
	.db #0x8a	; 138
	.db #0x68	; 104	'h'
	.db #0x68	; 104	'h'
	.db #0xee	; 238
	.db #0xde	; 222
	.db #0xe8	; 232
	.db #0x3a	; 58
	.db #0x7f	; 127
	.db #0x68	; 104	'h'
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0xa5	; 165
	.db #0xdb	; 219
	.db #0x90	; 144
	.db #0xd9	; 217
	.db #0x32	; 50	'2'
	.db #0xa4	; 164
	.db #0x7c	; 124
	.db #0xde	; 222
	.db #0x52	; 82	'R'
	.db #0x86	; 134
	.db #0x75	; 117	'u'
	.db #0xf5	; 245
	.db #0x75	; 117	'u'
	.db #0xe8	; 232
	.db #0xd8	; 216
	.db #0x32	; 50	'2'
	.db #0x56	; 86	'V'
	.db #0x8a	; 138
	.db #0x49	; 73	'I'
	.db #0x75	; 117	'u'
	.db #0x10	; 16
	.db #0xa2	; 162
	.db #0x63	; 99	'c'
	.db #0x8a	; 138
	.db #0x69	; 105	'i'
	.db #0x31	; 49	'1'
	.db #0x29	; 41
	.db #0x75	; 117	'u'
	.db #0x39	; 57	'9'
	.db #0xe8	; 232
	.db #0xfb	; 251
	.db #0xce	; 206
	.db #0x69	; 105	'i'
	.db #0xf6	; 246
	.db #0xe8	; 232
	.db #0xb5	; 181
	.db #0x94	; 148
	.db #0x75	; 117	'u'
	.db #0xf4	; 244
	.db #0xb8	; 184
	.db #0xd9	; 217
	.db #0x32	; 50	'2'
	.db #0x88	; 136
	.db #0x58	; 88	'X'
	.db #0x6b	; 107	'k'
	.db #0xa2	; 162
	.db #0x2c	; 44
	.db #0x84	; 132
	.db #0x77	; 119	'w'
	.db #0x4a	; 74	'J'
	.db #0x58	; 88	'X'
	.db #0x3e	; 62
	.db #0x98	; 152
	.db #0xd8	; 216
	.db #0x77	; 119	'w'
	.db #0x32	; 50	'2'
	.db #0x15	; 21
	.db #0xd2	; 210
	.db #0x8c	; 140
	.db #0xed	; 237
	.db #0xc9	; 201
	.db #0xc0	; 192
	.db #0xc6	; 198
	.db #0x32	; 50	'2'
	.db #0xae	; 174
	.db #0x13	; 19
	.db #0x21	; 33
	.db #0xe5	; 229
	.db #0x12	; 18
	.db #0xd0	; 208
	.db #0x22	; 34
	.db #0xd0	; 208
	.db #0x23	; 35
	.db #0xd0	; 208
	.db #0x24	; 36
	.db #0xd0	; 208
	.db #0x25	; 37
	.db #0xd0	; 208
	.db #0x26	; 38
	.db #0x9a	; 154
	.db #0x27	; 39
	.db #0xd0	; 208
	.db #0x28	; 40
	.db #0x6a	; 106	'j'
	.db #0x29	; 41
	.db #0x74	; 116	't'
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0xaa	; 170
	.db #0x2c	; 44
	.db #0x2d	; 45
	.db #0xa9	; 169
	.db #0x2e	; 46
	.db #0xc9	; 201
	.db #0x2f	; 47
	.db #0xc0	; 192
	.db #0x30	; 48	'0'
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xf2	; 242
	.db #0xd5	; 213
	.db #0xea	; 234
	.db #0x29	; 41
	.db #0x02	; 2
	.db #0xd8	; 216
	.db #0x2e	; 46
	.db #0x72	; 114	'r'
	.db #0xe6	; 230
	.db #0x88	; 136
	.db #0x2c	; 44
	.db #0x77	; 119	'w'
	.db #0x52	; 82	'R'
	.db #0x86	; 134
	.db #0x02	; 2
	.db #0xcb	; 203
	.db #0x6b	; 107	'k'
	.db #0x8e	; 142
	.db #0x63	; 99	'c'
	.db #0x87	; 135
	.db #0xdd	; 221
	.db #0x4a	; 74	'J'
	.db #0x0c	; 12
	.db #0x76	; 118	'v'
	.db #0xcc	; 204
	.db #0xd9	; 217
	.db #0x8c	; 140
	.db #0xda	; 218
	.db #0x7b	; 123
	.db #0x39	; 57	'9'
	.db #0xdc	; 220
	.db #0x53	; 83	'S'
	.db #0x8c	; 140
	.db #0xe9	; 233
	.db #0xd5	; 213
	.db #0x79	; 121	'y'
	.db #0x5f	; 95
	.db #0xb4	; 180
	.db #0x68	; 104	'h'
	.db #0x80	; 128
	.db #0xa4	; 164
	.db #0x79	; 121	'y'
	.db #0x9d	; 157
	.db #0x0b	; 11
	.db #0x7e	; 126
	.db #0xb0	; 176
	.db #0xfe	; 254
	.db #0x18	; 24
	.db #0xa6	; 166
	.db #0x93	; 147
	.db #0x77	; 119	'w'
	.db #0xe8	; 232
	.db #0xe5	; 229
	.db #0x7b	; 123
	.db #0x7e	; 126
	.db #0x2a	; 42
	.db #0x7e	; 126
	.db #0x9e	; 158
	.db #0x07	; 7
	.db #0x6e	; 110	'n'
	.db #0xd8	; 216
	.db #0x25	; 37
	.db #0xae	; 174
	.db #0xfe	; 254
	.db #0x1e	; 30
	.db #0x30	; 48	'0'
	.db #0x0a	; 10
	.db #0xb2	; 178
	.db #0xcd	; 205
	.db #0xef	; 239
	.db #0xcb	; 203
	.db #0xcb	; 203
	.db #0xe1	; 225
	.db #0xca	; 202
	.db #0x31	; 49	'1'
	.db #0xd3	; 211
	.db #0x88	; 136
	.db #0x05	; 5
	.db #0xcf	; 207
	.db #0x20	; 32
	.db #0xa0	; 160
	.db #0x17	; 23
	.db #0x63	; 99	'c'
	.db #0xb1	; 177
	.db #0x14	; 20
	.db #0xf2	; 242
	.db #0x9e	; 158
	.db #0x2b	; 43
	.db #0x92	; 146
	.db #0x75	; 117	'u'
	.db #0xac	; 172
	.db #0x80	; 128
	.db #0x75	; 117	'u'
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0xbf	; 191
	.db #0x54	; 84	'T'
	.db #0xfd	; 253
	.db #0xda	; 218
	.db #0x29	; 41
	.db #0x5f	; 95
	.db #0x7c	; 124
	.db #0xa6	; 166
	.db #0x7e	; 126
	.db #0x37	; 55	'7'
	.db #0xfa	; 250
	.db #0x1a	; 26
	.db #0xa6	; 166
	.db #0x50	; 80	'P'
	.db #0xd9	; 217
	.db #0xa8	; 168
	.db #0x5a	; 90	'Z'
	.db #0x85	; 133
	.db #0x1a	; 26
	.db #0x83	; 131
	.db #0x0d	; 13
	.db #0x1a	; 26
	.db #0x25	; 37
	.db #0xd0	; 208
	.db #0x29	; 41
	.db #0x04	; 4
	.db #0xfd	; 253
	.db #0x28	; 40
	.db #0x4a	; 74	'J'
	.db #0x45	; 69	'E'
	.db #0x87	; 135
	.db #0x1a	; 26
	.db #0x8c	; 140
	.db #0x7a	; 122	'z'
	.db #0xe9	; 233
	.db #0x8a	; 138
	.db #0xbd	; 189
	.db #0x1f	; 31
	.db #0xc8	; 200
	.db #0xd7	; 215
	.db #0x7e	; 126
	.db #0x40	; 64
	.db #0x28	; 40
	.db #0xd4	; 212
	.db #0x57	; 87	'W'
	.db #0x9d	; 157
	.db #0xf0	; 240
	.db #0x60	; 96
	.db #0x76	; 118	'v'
	.db #0x12	; 18
	.db #0x86	; 134
	.db #0x83	; 131
	.db #0x95	; 149
	.db #0x87	; 135
	.db #0xa1	; 161
	.db #0x8a	; 138
	.db #0xa7	; 167
	.db #0x88	; 136
	.db #0x5f	; 95
	.db #0xb6	; 182
	.db #0x22	; 34
	.db #0xdc	; 220
	.db #0x97	; 151
	.db #0x88	; 136
	.db #0x5e	; 94
	.db #0xb8	; 184
	.db #0x86	; 134
	.db #0x8a	; 138
	.db #0x82	; 130
	.db #0x83	; 131
	.db #0xaa	; 170
	.db #0x80	; 128
	.db #0x88	; 136
	.db #0xaa	; 170
	.db #0x83	; 131
	.db #0x8a	; 138
	.db #0x93	; 147
	.db #0x88	; 136
	.db #0x3f	; 63
	.db #0x5c	; 92
	.db #0x62	; 98	'b'
	.db #0xde	; 222
	.db #0xfc	; 252
	.db #0x91	; 145
	.db #0x88	; 136
	.db #0xab	; 171
	.db #0x40	; 64
	.db #0x8b	; 139
	.db #0x8f	; 143
	.db #0xc9	; 201
	.db #0x8c	; 140
	.db #0x4a	; 74	'J'
	.db #0x86	; 134
	.db #0xa8	; 168
	.db #0x0f	; 15
	.db #0x26	; 38
	.db #0x40	; 64
	.db #0xb1	; 177
	.db #0x06	; 6
	.db #0x87	; 135
	.db #0xfb	; 251
	.db #0xd0	; 208
	.db #0x2d	; 45
	.db #0xb2	; 178
	.db #0x59	; 89	'Y'
	.db #0xf6	; 246
	.db #0x62	; 98	'b'
	.db #0x85	; 133
	.db #0xc8	; 200
	.db #0x6f	; 111	'o'
	.db #0xf0	; 240
	.db #0x6c	; 108	'l'
	.db #0xfc	; 252
	.db #0xa4	; 164
	.db #0x1b	; 27
	.db #0xd5	; 213
	.db #0x8f	; 143
	.db #0x28	; 40
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0xa0	; 160
	.db #0x20	; 32
	.db #0x11	; 17
	.db #0x70	; 112	'p'
	.db #0xdb	; 219
	.db #0x8d	; 141
	.db #0xc2	; 194
	.db #0xd4	; 212
	.db #0xbf	; 191
	.db #0x8e	; 142
	.db #0xac	; 172
	.db #0xf7	; 247
	.db #0xda	; 218
	.db #0x79	; 121	'y'
	.db #0xac	; 172
	.db #0x8a	; 138
	.db #0x81	; 129
	.db #0x83	; 131
	.db #0x2d	; 45
	.db #0x80	; 128
	.db #0xb1	; 177
	.db #0xaf	; 175
	.db #0x7c	; 124
	.db #0xca	; 202
	.db #0x1c	; 28
	.db #0x75	; 117	'u'
	.db #0x0a	; 10
	.db #0x24	; 36
	.db #0x88	; 136
	.db #0xc9	; 201
	.db #0x22	; 34
	.db #0xa2	; 162
	.db #0x49	; 73	'I'
	.db #0x85	; 133
	.db #0x75	; 117	'u'
	.db #0xfb	; 251
	.db #0x8a	; 138
	.db #0x10	; 16
	.db #0x8c	; 140
	.db #0xa1	; 161
	.db #0x04	; 4
	.db #0x80	; 128
	.db #0x1a	; 26
	.db #0x8d	; 141
	.db #0x81	; 129
	.db #0x6a	; 106	'j'
	.db #0x83	; 131
	.db #0xbb	; 187
	.db #0x81	; 129
	.db #0x79	; 121	'y'
	.db #0x83	; 131
	.db #0xa3	; 163
	.db #0xd8	; 216
	.db #0x7e	; 126
	.db #0x4b	; 75	'K'
	.db #0x06	; 6
	.db #0x5d	; 93
	.db #0x96	; 150
	.db #0x7b	; 123
	.db #0xd4	; 212
	.db #0x7b	; 123
	.db #0xa8	; 168
	.db #0x2e	; 46
	.db #0x7c	; 124
	.db #0x39	; 57	'9'
	.db #0x2c	; 44
	.db #0x1c	; 28
	.db #0xc0	; 192
	.db #0xb9	; 185
	.db #0xba	; 186
	.db #0xc1	; 193
	.db #0x87	; 135
	.db #0x27	; 39
	.db #0x83	; 131
	.db #0xfb	; 251
	.db #0xec	; 236
	.db #0x04	; 4
	.db #0xea	; 234
	.db #0x87	; 135
	.db #0x9b	; 155
	.db #0x85	; 133
	.db #0xaa	; 170
	.db #0x83	; 131
	.db #0x87	; 135
	.db #0xba	; 186
	.db #0x85	; 133
	.db #0xd1	; 209
	.db #0x88	; 136
	.db #0x2f	; 47
	.db #0x87	; 135
	.db #0xd9	; 217
	.db #0xac	; 172
	.db #0xd3	; 211
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x8e	; 142
	.db #0x57	; 87	'W'
	.db #0x84	; 132
	.db #0xb6	; 182
	.db #0x30	; 48	'0'
	.db #0x65	; 101	'e'
	.db #0xb0	; 176
	.db #0xac	; 172
	.db #0x3e	; 62
	.db #0x18	; 24
	.db #0x74	; 116	't'
	.db #0xa1	; 161
	.db #0x7e	; 126
	.db #0x30	; 48	'0'
	.db #0x32	; 50	'2'
	.db #0x92	; 146
	.db #0xe1	; 225
	.db #0x40	; 64
	.db #0xce	; 206
	.db #0xa2	; 162
	.db #0x42	; 66	'B'
	.db #0x84	; 132
	.db #0x7e	; 126
	.db #0xac	; 172
	.db #0x34	; 52	'4'
	.db #0xd7	; 215
	.db #0x17	; 23
	.db #0xf2	; 242
	.db #0xb6	; 182
	.db #0xd4	; 212
	.db #0x97	; 151
	.db #0xad	; 173
	.db #0x74	; 116	't'
	.db #0xfb	; 251
	.db #0x5e	; 94
	.db #0x6c	; 108	'l'
	.db #0x96	; 150
	.db #0x83	; 131
	.db #0x8a	; 138
	.db #0x7f	; 127
	.db #0x83	; 131
	.db #0x2a	; 42
	.db #0x4b	; 75	'K'
	.db #0x9e	; 158
	.db #0x7f	; 127
	.db #0xd5	; 213
	.db #0x95	; 149
	.db #0x7c	; 124
	.db #0xf6	; 246
	.db #0xb4	; 180
	.db #0x8a	; 138
	.db #0x83	; 131
	.db #0x7c	; 124
	.db #0x28	; 40
	.db #0x40	; 64
	.db #0xd4	; 212
	.db #0x88	; 136
	.db #0x13	; 19
	.db #0x81	; 129
	.db #0x4b	; 75	'K'
	.db #0xa1	; 161
	.db #0x7e	; 126
	.db #0xa5	; 165
	.db #0x7a	; 122	'z'
	.db #0xa2	; 162
	.db #0x7e	; 126
	.db #0x8a	; 138
	.db #0x81	; 129
	.db #0x4b	; 75	'K'
	.db #0xa1	; 161
	.db #0x81	; 129
	.db #0xa1	; 161
	.db #0x7f	; 127
	.db #0x22	; 34
	.db #0x77	; 119	'w'
	.db #0xce	; 206
	.db #0x1a	; 26
	.db #0xc9	; 201
	.db #0x4e	; 78	'N'
	.db #0x48	; 72	'H'
	.db #0x2e	; 46
	.db #0x45	; 69	'E'
	.db #0x0c	; 12
	.db #0x77	; 119	'w'
	.db #0xb4	; 180
	.db #0xe9	; 233
	.db #0xe1	; 225
	.db #0x07	; 7
	.db #0x5e	; 94
	.db #0xf1	; 241
	.db #0xe8	; 232
	.db #0x48	; 72	'H'
	.db #0xd3	; 211
	.db #0x7e	; 126
	.db #0x5d	; 93
	.db #0x8e	; 142
	.db #0x9d	; 157
	.db #0x81	; 129
	.db #0xdc	; 220
	.db #0xda	; 218
	.db #0x28	; 40
	.db #0x0b	; 11
	.db #0x1e	; 30
	.db #0xe0	; 224
	.db #0x7c	; 124
	.db #0xf1	; 241
	.db #0x66	; 102	'f'
	.db #0xe4	; 228
	.db #0x9a	; 154
	.db #0x77	; 119	'w'
	.db #0x84	; 132
	.db #0x28	; 40
	.db #0x64	; 100	'd'
	.db #0xa2	; 162
	.db #0x42	; 66	'B'
	.db #0x82	; 130
	.db #0x70	; 112	'p'
	.db #0x9a	; 154
	.db #0x77	; 119	'w'
	.db #0x94	; 148
	.db #0x29	; 41
	.db #0x62	; 98	'b'
	.db #0x89	; 137
	.db #0x4a	; 74	'J'
	.db #0x6e	; 110	'n'
	.db #0xa2	; 162
	.db #0x42	; 66	'B'
	.db #0x82	; 130
	.db #0x70	; 112	'p'
	.db #0x82	; 130
	.db #0x77	; 119	'w'
	.db #0x93	; 147
	.db #0x77	; 119	'w'
	.db #0xe7	; 231
	.db #0xb9	; 185
	.db #0xa0	; 160
	.db #0x06	; 6
	.db #0x6e	; 110	'n'
	.db #0x30	; 48	'0'
	.db #0x69	; 105	'i'
	.db #0x5f	; 95
	.db #0x77	; 119	'w'
	.db #0x0f	; 15
	.db #0xe5	; 229
	.db #0x1d	; 29
	.db #0xec	; 236
	.db #0x31	; 49	'1'
	.db #0xf8	; 248
	.db #0xb0	; 176
	.db #0x7e	; 126
	.db #0x5c	; 92
	.db #0x7f	; 127
	.db #0x8c	; 140
	.db #0x90	; 144
	.db #0xd0	; 208
	.db #0xe2	; 226
	.db #0x7a	; 122	'z'
	.db #0xfb	; 251
	.db #0x1a	; 26
	.db #0x68	; 104	'h'
	.db #0x78	; 120	'x'
	.db #0x2a	; 42
	.db #0x7c	; 124
	.db #0xa9	; 169
	.db #0x83	; 131
	.db #0x78	; 120	'x'
	.db #0xa1	; 161
	.db #0x81	; 129
	.db #0xa0	; 160
	.db #0x7a	; 122	'z'
	.db #0xaa	; 170
	.db #0x7e	; 126
	.db #0x7f	; 127
	.db #0xaa	; 170
	.db #0x7a	; 122	'z'
	.db #0x81	; 129
	.db #0xac	; 172
	.db #0x81	; 129
	.db #0x76	; 118	'v'
	.db #0xeb	; 235
	.db #0x69	; 105	'i'
	.db #0xa9	; 169
	.db #0x78	; 120	'x'
	.db #0x0f	; 15
	.db #0xb2	; 178
	.db #0xcf	; 207
	.db #0xb0	; 176
	.db #0x79	; 121	'y'
	.db #0xde	; 222
	.db #0xb6	; 182
	.db #0x07	; 7
	.db #0x12	; 18
	.db #0x68	; 104	'h'
	.db #0x0f	; 15
	.db #0x68	; 104	'h'
	.db #0x7e	; 126
	.db #0x69	; 105	'i'
	.db #0x7f	; 127
	.db #0x3d	; 61
	.db #0xcd	; 205
	.db #0xd6	; 214
	.db #0x26	; 38
	.db #0x8a	; 138
	.db #0x53	; 83	'S'
	.db #0x6c	; 108	'l'
	.db #0x28	; 40
	.db #0x2a	; 42
	.db #0xa4	; 164
	.db #0x78	; 120	'x'
	.db #0xe7	; 231
	.db #0xe8	; 232
	.db #0xef	; 239
	.db #0xce	; 206
	.db #0x6c	; 108	'l'
	.db #0xe8	; 232
	.db #0xda	; 218
	.db #0xa9	; 169
	.db #0x78	; 120	'x'
	.db #0x53	; 83	'S'
	.db #0xd3	; 211
	.db #0xb8	; 184
	.db #0x66	; 102	'f'
	.db #0x26	; 38
	.db #0x22	; 34
	.db #0x4a	; 74	'J'
	.db #0x6e	; 110	'n'
	.db #0x8a	; 138
	.db #0x25	; 37
	.db #0x7a	; 122	'z'
	.db #0x11	; 17
	.db #0x28	; 40
	.db #0x4a	; 74	'J'
	.db #0xfb	; 251
	.db #0x98	; 152
	.db #0x7a	; 122	'z'
	.db #0x49	; 73	'I'
	.db #0x88	; 136
	.db #0x40	; 64
	.db #0xa1	; 161
	.db #0x88	; 136
	.db #0xa0	; 160
	.db #0x86	; 134
	.db #0xd2	; 210
	.db #0xc8	; 200
	.db #0x1b	; 27
	.db #0xcf	; 207
	.db #0x48	; 72	'H'
	.db #0xa6	; 166
	.db #0x10	; 16
	.db #0xc4	; 196
	.db #0xc6	; 198
	.db #0x4a	; 74	'J'
	.db #0x82	; 130
	.db #0xfb	; 251
	.db #0x86	; 134
	.db #0x8a	; 138
	.db #0xa9	; 169
	.db #0x8f	; 143
	.db #0x83	; 131
	.db #0xaa	; 170
	.db #0x8d	; 141
	.db #0x23	; 35
	.db #0xd5	; 213
	.db #0x22	; 34
	.db #0x72	; 114	'r'
	.db #0x92	; 146
	.db #0x78	; 120	'x'
	.db #0x85	; 133
	.db #0x7e	; 126
	.db #0x29	; 41
	.db #0x77	; 119	'w'
	.db #0x1d	; 29
	.db #0x64	; 100	'd'
	.db #0xdc	; 220
	.db #0x03	; 3
	.db #0xd6	; 214
	.db #0xd5	; 213
	.db #0xd8	; 216
	.db #0x29	; 41
	.db #0x02	; 2
	.db #0xc8	; 200
	.db #0x1c	; 28
	.db #0x75	; 117	'u'
	.db #0xa2	; 162
	.db #0xd4	; 212
	.db #0x25	; 37
	.db #0x7a	; 122	'z'
	.db #0x5a	; 90	'Z'
	.db #0xd4	; 212
	.db #0x52	; 82	'R'
	.db #0x86	; 134
	.db #0x02	; 2
	.db #0xd6	; 214
	.db #0x6e	; 110	'n'
	.db #0x7c	; 124
	.db #0xb5	; 181
	.db #0xc0	; 192
	.db #0x3c	; 60
	.db #0x32	; 50	'2'
	.db #0x4c	; 76	'L'
	.db #0xec	; 236
	.db #0xaa	; 170
	.db #0x7c	; 124
	.db #0x7f	; 127
	.db #0x6a	; 106	'j'
	.db #0x7c	; 124
	.db #0xc6	; 198
	.db #0x7f	; 127
	.db #0xf4	; 244
	.db #0xe0	; 224
	.db #0xe8	; 232
	.db #0x2e	; 46
	.db #0x45	; 69	'E'
	.db #0xb4	; 180
	.db #0xa4	; 164
	.db #0x81	; 129
	.db #0xaa	; 170
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0xac	; 172
	.db #0x7a	; 122	'z'
	.db #0x68	; 104	'h'
	.db #0xcf	; 207
	.db #0x81	; 129
	.db #0xf5	; 245
	.db #0xe8	; 232
	.db #0xc9	; 201
	.db #0x02	; 2
	.db #0xcd	; 205
	.db #0xea	; 234
	.db #0xce	; 206
	.db #0xfb	; 251
	.db #0x44	; 68	'D'
	.db #0x69	; 105	'i'
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x64	; 100	'd'
	.db #0x86	; 134
	.db #0x78	; 120	'x'
	.db #0xf5	; 245
	.db #0x78	; 120	'x'
	.db #0xe8	; 232
	.db #0xe1	; 225
	.db #0x44	; 68	'D'
	.db #0x5c	; 92
	.db #0xf9	; 249
	.db #0x2e	; 46
	.db #0x44	; 68	'D'
	.db #0x05	; 5
	.db #0xb3	; 179
	.db #0xc0	; 192
	.db #0xf1	; 241
	.db #0x16	; 22
	.db #0x2c	; 44
	.db #0xd6	; 214
	.db #0x74	; 116	't'
	.db #0x10	; 16
	.db #0xb5	; 181
	.db #0xce	; 206
	.db #0xa9	; 169
	.db #0x72	; 114	'r'
	.db #0xc0	; 192
	.db #0xa5	; 165
	.db #0xd0	; 208
	.db #0x05	; 5
	.db #0xa4	; 164
	.db #0xd3	; 211
	.db #0x0b	; 11
	.db #0xc8	; 200
	.db #0x33	; 51	'3'
	.db #0xe8	; 232
	.db #0x1a	; 26
	.db #0x93	; 147
	.db #0x1f	; 31
	.db #0xd9	; 217
	.db #0xd7	; 215
	.db #0xd6	; 214
	.db #0xb1	; 177
	.db #0x20	; 32
	.db #0x74	; 116	't'
	.db #0xee	; 238
	.db #0x7e	; 126
	.db #0xe4	; 228
	.db #0xfd	; 253
	.db #0x08	; 8
	.db #0xd3	; 211
	.db #0xe3	; 227
	.db #0x19	; 25
	.db #0x20	; 32
	.db #0x6b	; 107	'k'
	.db #0x1e	; 30
	.db #0x46	; 70	'F'
	.db #0x7e	; 126
	.db #0x2b	; 43
	.db #0x05	; 5
	.db #0x6d	; 109	'm'
	.db #0x29	; 41
	.db #0xc0	; 192
	.db #0x54	; 84	'T'
	.db #0xaa	; 170
	.db #0x95	; 149
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x20	; 32
	.db #0x88	; 136
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0xa6	; 166
	.db #0x01	; 1
	.db #0x8f	; 143
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x8e	; 142
	.db #0x9a	; 154
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x8c	; 140
	.db #0x5a	; 90	'Z'
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x89	; 137
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x86	; 134
	.db #0xc2	; 194
	.db #0x05	; 5
	.db #0xef	; 239
	.db #0x4a	; 74	'J'
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xe0	; 224
	.db #0x90	; 144
	.db #0xb5	; 181
	.db #0x82	; 130
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x15	; 21
	.db #0x1f	; 31
	.db #0xf8	; 248
	.db #0x50	; 80	'P'
	.db #0xf8	; 248
	.db #0x6a	; 106	'j'
	.db #0x01	; 1
	.db #0x15	; 21
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0xe1	; 225
	.db #0xf1	; 241
	.db #0xa6	; 166
	.db #0x1c	; 28
	.db #0x50	; 80	'P'
	.db #0x01	; 1
	.db #0x13	; 19
	.db #0x1a	; 26
	.db #0x02	; 2
	.db #0x13	; 19
	.db #0x19	; 25
	.db #0x9a	; 154
	.db #0x02	; 2
	.db #0x11	; 17
	.db #0x18	; 24
	.db #0x69	; 105	'i'
	.db #0x03	; 3
	.db #0x11	; 17
	.db #0x17	; 23
	.db #0xa6	; 166
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x16	; 22
	.db #0x04	; 4
	.db #0x0f	; 15
	.db #0x15	; 21
	.db #0x9a	; 154
	.db #0x04	; 4
	.db #0x0d	; 13
	.db #0x14	; 20
	.db #0x69	; 105	'i'
	.db #0x05	; 5
	.db #0x0d	; 13
	.db #0x13	; 19
	.db #0xa6	; 166
	.db #0x05	; 5
	.db #0x0b	; 11
	.db #0x12	; 18
	.db #0x06	; 6
	.db #0x0b	; 11
	.db #0x11	; 17
	.db #0x9f	; 159
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x10	; 16
	.db #0x6d	; 109	'm'
	.db #0xa8	; 168
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x07	; 7
	.db #0x56	; 86	'V'
	.db #0x80	; 128
	.db #0x05	; 5
	.db #0xa3	; 163
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x1c	; 28
	.db #0x8f	; 143
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x0d	; 13
	.db #0x1b	; 27
	.db #0xf8	; 248
	.db #0x0a	; 10
	.db #0x1a	; 26
	.db #0x04	; 4
	.db #0xfd	; 253
	.db #0xac	; 172
	.db #0xf5	; 245
	.db #0x75	; 117	'u'
	.db #0xf8	; 248
	.db #0xe6	; 230
	.db #0xd0	; 208
	.db #0x7e	; 126
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0xbd	; 189
	.db #0xe5	; 229
	.db #0x88	; 136
	.db #0x80	; 128
	.db #0x3a	; 58
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x89	; 137
	.db #0x8b	; 139
	.db #0xd8	; 216
	.db #0x9f	; 159
	.db #0x8c	; 140
	.db #0xf0	; 240
	.db #0xa6	; 166
	.db #0x8a	; 138
	.db #0x9a	; 154
	.db #0x89	; 137
	.db #0x88	; 136
	.db #0x69	; 105	'i'
	.db #0x87	; 135
	.db #0xa6	; 166
	.db #0x85	; 133
	.db #0x9a	; 154
	.db #0x83	; 131
	.db #0x82	; 130
	.db #0x7e	; 126
	.db #0x88	; 136
	.db #0xf5	; 245
	.db #0x80	; 128
	.db #0xf8	; 248
	.db #0xe6	; 230
	.db #0x60	; 96
	.db #0x37	; 55	'7'
	.db #0x11	; 17
	.db #0x1e	; 30
	.db #0x09	; 9
	.db #0xe2	; 226
	.db #0xf5	; 245
	.db #0xf8	; 248
	.db #0x96	; 150
	.db #0x8e	; 142
	.db #0x9a	; 154
	.db #0x8d	; 141
	.db #0x8c	; 140
	.db #0x5a	; 90	'Z'
	.db #0x8b	; 139
	.db #0x45	; 69	'E'
	.db #0xa1	; 161
	.db #0x8a	; 138
	.db #0x3e	; 62
	.db #0xb8	; 184
	.db #0x95	; 149
	.db #0x81	; 129
	.db #0x7d	; 125
	.db #0xf8	; 248
	.db #0x63	; 99	'c'
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x84	; 132
	.db #0x0c	; 12
	.db #0x7d	; 125
	.db #0x8c	; 140
	.db #0x2f	; 47
	.db #0x89	; 137
	.db #0xf8	; 248
	.db #0x28	; 40
	.db #0x8a	; 138
	.db #0x09	; 9
	.db #0x9a	; 154
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0xa5	; 165
	.db #0xfc	; 252
	.db #0xa1	; 161
	.db #0xfe	; 254
	.db #0xf7	; 247
	.db #0xb0	; 176
	.db #0xa5	; 165
	.db #0xf9	; 249
	.db #0x02	; 2
	.db #0xa1	; 161
	.db #0x04	; 4
	.db #0xf7	; 247
	.db #0xe0	; 224
	.db #0x88	; 136
	.db #0xf7	; 247
	.db #0x05	; 5
	.db #0x0f	; 15
	.db #0x8f	; 143
	.db #0x0f	; 15
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0xf8	; 248
	.db #0x05	; 5
	.db #0xa5	; 165
	.db #0x02	; 2
	.db #0xa5	; 165
	.db #0x04	; 4
	.db #0xf7	; 247
	.db #0xe0	; 224
	.db #0xdd	; 221
	.db #0xc0	; 192
	.db #0xe6	; 230
	.db #0xe9	; 233
	.db #0xf8	; 248
	.db #0x87	; 135
	.db #0xfc	; 252
	.db #0xdf	; 223
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0x7e	; 126
	.db #0xf7	; 247
	.db #0xf3	; 243
	.db #0x89	; 137
	.db #0x08	; 8
	.db #0x3d	; 61
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0xed	; 237
	.db #0xa9	; 169
	.db #0xd1	; 209
	.db #0x05	; 5
	.db #0x63	; 99	'c'
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0xf0	; 240
	.db #0xf4	; 244
	.db #0x13	; 19
	.db #0xd4	; 212
	.db #0xfc	; 252
	.db #0x68	; 104	'h'
	.db #0x13	; 19
	.db #0x55	; 85	'U'
	.db #0xf5	; 245
	.db #0xfe	; 254
	.db #0x56	; 86	'V'
	.db #0x0c	; 12
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0xec	; 236
	.db #0xdc	; 220
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0xe2	; 226
	.db #0xd8	; 216
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x3b	; 59
	.db #0xed	; 237
	.db #0x02	; 2
	.db #0x2c	; 44
	.db #0xcd	; 205
	.db #0x13	; 19
	.db #0x6f	; 111	'o'
	.db #0x14	; 20
	.db #0xf9	; 249
	.db #0xbc	; 188
	.db #0xef	; 239
	.db #0x13	; 19
	.db #0xbf	; 191
	.db #0x2a	; 42
	.db #0x55	; 85	'U'
	.db #0xf4	; 244
	.db #0x1d	; 29
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x11	; 17
	.db #0x1f	; 31
	.db #0x24	; 36
	.db #0x55	; 85	'U'
	.db #0x56	; 86	'V'
_g_MusicGame_Zx0:
	.db #0x14	; 20
	.db #0x20	; 32
	.db #0x50	; 80	'P'
	.db #0x72	; 114	'r'
	.db #0x6f	; 111	'o'
	.db #0x54	; 84	'T'
	.db #0x72	; 114	'r'
	.db #0x61	; 97	'a'
	.db #0x63	; 99	'c'
	.db #0x6b	; 107	'k'
	.db #0x65	; 101	'e'
	.db #0x72	; 114	'r'
	.db #0x20	; 32
	.db #0x33	; 51	'3'
	.db #0x2e	; 46
	.db #0x36	; 54	'6'
	.db #0x20	; 32
	.db #0x63	; 99	'c'
	.db #0x6f	; 111	'o'
	.db #0x6d	; 109	'm'
	.db #0x70	; 112	'p'
	.db #0x69	; 105	'i'
	.db #0x6c	; 108	'l'
	.db #0x61	; 97	'a'
	.db #0x74	; 116	't'
	.db #0x69	; 105	'i'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x20	; 32
	.db #0x6f	; 111	'o'
	.db #0x66	; 102	'f'
	.db #0x20	; 32
	.db #0x4f	; 79	'O'
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x61	; 97	'a'
	.db #0x67	; 103	'g'
	.db #0x61	; 97	'a'
	.db #0x7a	; 122	'z'
	.db #0x75	; 117	'u'
	.db #0x7a	; 122	'z'
	.db #0x75	; 117	'u'
	.db #0x6c	; 108	'l'
	.db #0x75	; 117	'u'
	.db #0x6d	; 109	'm'
	.db #0x20	; 32
	.db #0x58	; 88	'X'
	.db #0x19	; 25
	.db #0x62	; 98	'b'
	.db #0x79	; 121	'y'
	.db #0x20	; 32
	.db #0x4c	; 76	'L'
	.db #0x61	; 97	'a'
	.db #0x65	; 101	'e'
	.db #0x73	; 115	's'
	.db #0x51	; 81	'Q'
	.db #0x20	; 32
	.db #0x16	; 22
	.db #0x48	; 72	'H'
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0xdf	; 223
	.db #0x00	; 0
	.db #0x9b	; 155
	.db #0x3b	; 59
	.db #0x1d	; 29
	.db #0x00	; 0
	.db #0xd9	; 217
	.db #0xfc	; 252
	.db #0xab	; 171
	.db #0x49	; 73	'I'
	.db #0x1d	; 29
	.db #0x7f	; 127
	.db #0xb5	; 181
	.db #0xa3	; 163
	.db #0xd9	; 217
	.db #0xeb	; 235
	.db #0xd2	; 210
	.db #0xfe	; 254
	.db #0xf4	; 244
	.db #0xf9	; 249
	.db #0xdc	; 220
	.db #0x8e	; 142
	.db #0x0f	; 15
	.db #0x1e	; 30
	.db #0xf0	; 240
	.db #0x69	; 105	'i'
	.db #0x95	; 149
	.db #0x79	; 121	'y'
	.db #0xe9	; 233
	.db #0x9f	; 159
	.db #0x98	; 152
	.db #0x1e	; 30
	.db #0x9d	; 157
	.db #0xfc	; 252
	.db #0x19	; 25
	.db #0x16	; 22
	.db #0xa2	; 162
	.db #0x1e	; 30
	.db #0x0f	; 15
	.db #0x12	; 18
	.db #0x15	; 21
	.db #0x18	; 24
	.db #0x1b	; 27
	.db #0x1e	; 30
	.db #0x09	; 9
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x24	; 36
	.db #0x21	; 33
	.db #0x27	; 39
	.db #0x2a	; 42
	.db #0x2d	; 45
	.db #0x30	; 48	'0'
	.db #0x33	; 51	'3'
	.db #0x3c	; 60
	.db #0x36	; 54	'6'
	.db #0x39	; 57	'9'
	.db #0xff	; 255
	.db #0x59	; 89	'Y'
	.db #0x0b	; 11
	.db #0xf1	; 241
	.db #0x86	; 134
	.db #0x95	; 149
	.db #0x08	; 8
	.db #0x47	; 71	'G'
	.db #0x0c	; 12
	.db #0xee	; 238
	.db #0xe0	; 224
	.db #0xf5	; 245
	.db #0x88	; 136
	.db #0xb3	; 179
	.db #0x0d	; 13
	.db #0x79	; 121	'y'
	.db #0x0e	; 14
	.db #0x22	; 34
	.db #0x30	; 48	'0'
	.db #0x07	; 7
	.db #0xd7	; 215
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0xda	; 218
	.db #0x09	; 9
	.db #0xa0	; 160
	.db #0x0a	; 10
	.db #0x96	; 150
	.db #0x5d	; 93
	.db #0x01	; 1
	.db #0x69	; 105	'i'
	.db #0x01	; 1
	.db #0xf3	; 243
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x82	; 130
	.db #0x0d	; 13
	.db #0x02	; 2
	.db #0x66	; 102	'f'
	.db #0x02	; 2
	.db #0x2a	; 42
	.db #0x74	; 116	't'
	.db #0xa4	; 164
	.db #0xb2	; 178
	.db #0x0f	; 15
	.db #0x37	; 55	'7'
	.db #0x03	; 3
	.db #0x47	; 71	'G'
	.db #0x03	; 3
	.db #0xac	; 172
	.db #0x03	; 3
	.db #0x2c	; 44
	.db #0x04	; 4
	.db #0x7b	; 123
	.db #0x04	; 4
	.db #0x0a	; 10
	.db #0x05	; 5
	.db #0x77	; 119	'w'
	.db #0x05	; 5
	.db #0xfa	; 250
	.db #0x05	; 5
	.db #0xc0	; 192
	.db #0x06	; 6
	.db #0x84	; 132
	.db #0x10	; 16
	.db #0x2b	; 43
	.db #0x11	; 17
	.db #0xd0	; 208
	.db #0x11	; 17
	.db #0xa0	; 160
	.db #0x8e	; 142
	.db #0x41	; 65	'A'
	.db #0x0f	; 15
	.db #0x7d	; 125
	.db #0x0e	; 14
	.db #0xf9	; 249
	.db #0x12	; 18
	.db #0x9a	; 154
	.db #0x13	; 19
	.db #0xad	; 173
	.db #0x08	; 8
	.db #0xae	; 174
	.db #0x14	; 20
	.db #0x05	; 5
	.db #0x15	; 21
	.db #0x90	; 144
	.db #0x3a	; 58
	.db #0x8a	; 138
	.db #0x15	; 21
	.db #0xf1	; 241
	.db #0x15	; 21
	.db #0x71	; 113	'q'
	.db #0x16	; 22
	.db #0xc4	; 196
	.db #0x16	; 22
	.db #0x90	; 144
	.db #0x17	; 23
	.db #0x16	; 22
	.db #0x18	; 24
	.db #0x9d	; 157
	.db #0x18	; 24
	.db #0x64	; 100	'd'
	.db #0x19	; 25
	.db #0xb7	; 183
	.db #0x1a	; 26
	.db #0x5d	; 93
	.db #0x1b	; 27
	.db #0x0a	; 10
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0xfd	; 253
	.db #0x37	; 55	'7'
	.db #0xe2	; 226
	.db #0x29	; 41
	.db #0xee	; 238
	.db #0x19	; 25
	.db #0x24	; 36
	.db #0x7a	; 122	'z'
	.db #0xf5	; 245
	.db #0x0e	; 14
	.db #0xcf	; 207
	.db #0xb1	; 177
	.db #0x20	; 32
	.db #0x85	; 133
	.db #0x46	; 70	'F'
	.db #0x83	; 131
	.db #0xb1	; 177
	.db #0x40	; 64
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xe8	; 232
	.db #0xea	; 234
	.db #0x04	; 4
	.db #0xed	; 237
	.db #0x02	; 2
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0xce	; 206
	.db #0xf0	; 240
	.db #0xa5	; 165
	.db #0xcd	; 205
	.db #0xa5	; 165
	.db #0xcc	; 204
	.db #0xa5	; 165
	.db #0xcb	; 203
	.db #0xa5	; 165
	.db #0xca	; 202
	.db #0xa5	; 165
	.db #0xc9	; 201
	.db #0x84	; 132
	.db #0xa0	; 160
	.db #0xcf	; 207
	.db #0x85	; 133
	.db #0x02	; 2
	.db #0x88	; 136
	.db #0x01	; 1
	.db #0x19	; 25
	.db #0x00	; 0
	.db #0xf4	; 244
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xc8	; 200
	.db #0xb1	; 177
	.db #0x06	; 6
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0x67	; 103	'g'
	.db #0xf0	; 240
	.db #0xf6	; 246
	.db #0xff	; 255
	.db #0x72	; 114	'r'
	.db #0x5b	; 91
	.db #0xc8	; 200
	.db #0xc9	; 201
	.db #0xf0	; 240
	.db #0xda	; 218
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xd4	; 212
	.db #0x36	; 54	'6'
	.db #0x5a	; 90	'Z'
	.db #0x58	; 88	'X'
	.db #0xd7	; 215
	.db #0xb6	; 182
	.db #0x56	; 86	'V'
	.db #0xbe	; 190
	.db #0x0a	; 10
	.db #0x30	; 48	'0'
	.db #0x82	; 130
	.db #0xb1	; 177
	.db #0x10	; 16
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0x8d	; 141
	.db #0x1c	; 28
	.db #0xc0	; 192
	.db #0xae	; 174
	.db #0xb6	; 182
	.db #0x79	; 121	'y'
	.db #0x32	; 50	'2'
	.db #0xaa	; 170
	.db #0x77	; 119	'w'
	.db #0x27	; 39
	.db #0x9e	; 158
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x75	; 117	'u'
	.db #0xe7	; 231
	.db #0x86	; 134
	.db #0x75	; 117	'u'
	.db #0xae	; 174
	.db #0x2b	; 43
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xf6	; 246
	.db #0xe8	; 232
	.db #0x87	; 135
	.db #0xf6	; 246
	.db #0xce	; 206
	.db #0xec	; 236
	.db #0xa3	; 163
	.db #0x79	; 121	'y'
	.db #0xb1	; 177
	.db #0x16	; 22
	.db #0xc0	; 192
	.db #0x96	; 150
	.db #0x1f	; 31
	.db #0xc2	; 194
	.db #0xb8	; 184
	.db #0x08	; 8
	.db #0xc9	; 201
	.db #0xf7	; 247
	.db #0x02	; 2
	.db #0x70	; 112	'p'
	.db #0x1a	; 26
	.db #0xa2	; 162
	.db #0x33	; 51	'3'
	.db #0x56	; 86	'V'
	.db #0xba	; 186
	.db #0x58	; 88	'X'
	.db #0xc4	; 196
	.db #0xa9	; 169
	.db #0x72	; 114	'r'
	.db #0x3a	; 58
	.db #0x9a	; 154
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x77	; 119	'w'
	.db #0xeb	; 235
	.db #0x18	; 24
	.db #0x81	; 129
	.db #0x06	; 6
	.db #0x8b	; 139
	.db #0x61	; 97	'a'
	.db #0x72	; 114	'r'
	.db #0x79	; 121	'y'
	.db #0xea	; 234
	.db #0x95	; 149
	.db #0x7b	; 123
	.db #0x74	; 116	't'
	.db #0x9e	; 158
	.db #0x17	; 23
	.db #0x95	; 149
	.db #0xaf	; 175
	.db #0x72	; 114	'r'
	.db #0x1e	; 30
	.db #0xd6	; 214
	.db #0xe2	; 226
	.db #0x1f	; 31
	.db #0x04	; 4
	.db #0x7c	; 124
	.db #0xaa	; 170
	.db #0xce	; 206
	.db #0xe1	; 225
	.db #0x9a	; 154
	.db #0x7c	; 124
	.db #0x77	; 119	'w'
	.db #0x77	; 119	'w'
	.db #0xaa	; 170
	.db #0x79	; 121	'y'
	.db #0x27	; 39
	.db #0xb8	; 184
	.db #0xfa	; 250
	.db #0x68	; 104	'h'
	.db #0xa8	; 168
	.db #0x02	; 2
	.db #0x3c	; 60
	.db #0xce	; 206
	.db #0xd0	; 208
	.db #0xcf	; 207
	.db #0xd0	; 208
	.db #0xf8	; 248
	.db #0x48	; 72	'H'
	.db #0x8a	; 138
	.db #0x58	; 88	'X'
	.db #0xcd	; 205
	.db #0xd0	; 208
	.db #0x45	; 69	'E'
	.db #0x88	; 136
	.db #0x56	; 86	'V'
	.db #0xcc	; 204
	.db #0xa1	; 161
	.db #0xd0	; 208
	.db #0x16	; 22
	.db #0xf1	; 241
	.db #0x58	; 88	'X'
	.db #0xe0	; 224
	.db #0xcc	; 204
	.db #0x8e	; 142
	.db #0x2a	; 42
	.db #0x08	; 8
	.db #0xda	; 218
	.db #0xc0	; 192
	.db #0x9d	; 157
	.db #0x06	; 6
	.db #0xde	; 222
	.db #0x66	; 102	'f'
	.db #0xb6	; 182
	.db #0x0a	; 10
	.db #0x97	; 151
	.db #0xbd	; 189
	.db #0x7a	; 122	'z'
	.db #0xdd	; 221
	.db #0xa8	; 168
	.db #0xab	; 171
	.db #0x11	; 17
	.db #0xca	; 202
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0xdb	; 219
	.db #0x04	; 4
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0xd9	; 217
	.db #0x3c	; 60
	.db #0x0b	; 11
	.db #0xc8	; 200
	.db #0xd6	; 214
	.db #0xdb	; 219
	.db #0xc9	; 201
	.db #0x10	; 16
	.db #0xf2	; 242
	.db #0x7c	; 124
	.db #0xca	; 202
	.db #0x8d	; 141
	.db #0xcb	; 203
	.db #0x8c	; 140
	.db #0xcc	; 204
	.db #0x8a	; 138
	.db #0xcd	; 205
	.db #0x88	; 136
	.db #0xce	; 206
	.db #0x81	; 129
	.db #0xcf	; 207
	.db #0x80	; 128
	.db #0x7e	; 126
	.db #0x7c	; 124
	.db #0x8d	; 141
	.db #0x8c	; 140
	.db #0x8a	; 138
	.db #0x88	; 136
	.db #0x81	; 129
	.db #0xf0	; 240
	.db #0x4c	; 76	'L'
	.db #0xd7	; 215
	.db #0x91	; 145
	.db #0x02	; 2
	.db #0x94	; 148
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0xaa	; 170
	.db #0x0e	; 14
	.db #0x8d	; 141
	.db #0x76	; 118	'v'
	.db #0x8f	; 143
	.db #0x01	; 1
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x1d	; 29
	.db #0xd5	; 213
	.db #0xac	; 172
	.db #0xf5	; 245
	.db #0xc0	; 192
	.db #0x29	; 41
	.db #0x56	; 86	'V'
	.db #0x02	; 2
	.db #0xe4	; 228
	.db #0xcb	; 203
	.db #0xf8	; 248
	.db #0xa1	; 161
	.db #0xca	; 202
	.db #0x2e	; 46
	.db #0x58	; 88	'X'
	.db #0xf0	; 240
	.db #0x75	; 117	'u'
	.db #0xa4	; 164
	.db #0x6e	; 110	'n'
	.db #0xb6	; 182
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x3b	; 59
	.db #0x28	; 40
	.db #0x4f	; 79	'O'
	.db #0x57	; 87	'W'
	.db #0xe9	; 233
	.db #0x74	; 116	't'
	.db #0xee	; 238
	.db #0xe0	; 224
	.db #0x16	; 22
	.db #0x40	; 64
	.db #0x5a	; 90	'Z'
	.db #0xff	; 255
	.db #0x9e	; 158
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x58	; 88	'X'
	.db #0xf3	; 243
	.db #0x38	; 56	'8'
	.db #0x4e	; 78	'N'
	.db #0x55	; 85	'U'
	.db #0xff	; 255
	.db #0x26	; 38
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x4a	; 74	'J'
	.db #0x56	; 86	'V'
	.db #0xeb	; 235
	.db #0xe4	; 228
	.db #0xd6	; 214
	.db #0x74	; 116	't'
	.db #0xab	; 171
	.db #0xf9	; 249
	.db #0x3b	; 59
	.db #0xdb	; 219
	.db #0xbc	; 188
	.db #0xf6	; 246
	.db #0xb8	; 184
	.db #0x58	; 88	'X'
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xb1	; 177
	.db #0x01	; 1
	.db #0xd0	; 208
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf6	; 246
	.db #0xbe	; 190
	.db #0x01	; 1
	.db #0xe9	; 233
	.db #0xed	; 237
	.db #0x82	; 130
	.db #0xfe	; 254
	.db #0xc3	; 195
	.db #0x02	; 2
	.db #0xb0	; 176
	.db #0xdd	; 221
	.db #0x37	; 55	'7'
	.db #0xaa	; 170
	.db #0x1b	; 27
	.db #0x8a	; 138
	.db #0x12	; 18
	.db #0xb2	; 178
	.db #0x06	; 6
	.db #0x8f	; 143
	.db #0x98	; 152
	.db #0x14	; 20
	.db #0xcb	; 203
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x6e	; 110	'n'
	.db #0x2a	; 42
	.db #0xfb	; 251
	.db #0x2c	; 44
	.db #0xa3	; 163
	.db #0xf8	; 248
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0xc8	; 200
	.db #0xe5	; 229
	.db #0xc4	; 196
	.db #0x2b	; 43
	.db #0x06	; 6
	.db #0x1a	; 26
	.db #0xef	; 239
	.db #0x8f	; 143
	.db #0xaa	; 170
	.db #0x91	; 145
	.db #0x0a	; 10
	.db #0xa7	; 167
	.db #0xf8	; 248
	.db #0xf5	; 245
	.db #0xc7	; 199
	.db #0x8e	; 142
	.db #0x3e	; 62
	.db #0x8c	; 140
	.db #0xa9	; 169
	.db #0x8c	; 140
	.db #0x06	; 6
	.db #0xec	; 236
	.db #0xc6	; 198
	.db #0x80	; 128
	.db #0x44	; 68	'D'
	.db #0xbb	; 187
	.db #0xd8	; 216
	.db #0x10	; 16
	.db #0x7f	; 127
	.db #0xa3	; 163
	.db #0xbd	; 189
	.db #0xfb	; 251
	.db #0x52	; 82	'R'
	.db #0xe5	; 229
	.db #0x2b	; 43
	.db #0x01	; 1
	.db #0x5a	; 90	'Z'
	.db #0x6f	; 111	'o'
	.db #0xad	; 173
	.db #0x79	; 121	'y'
	.db #0x04	; 4
	.db #0xea	; 234
	.db #0x91	; 145
	.db #0xe7	; 231
	.db #0x64	; 100	'd'
	.db #0x92	; 146
	.db #0x58	; 88	'X'
	.db #0xea	; 234
	.db #0x55	; 85	'U'
	.db #0xe9	; 233
	.db #0x61	; 97	'a'
	.db #0x9f	; 159
	.db #0x55	; 85	'U'
	.db #0xed	; 237
	.db #0x1a	; 26
	.db #0x53	; 83	'S'
	.db #0x56	; 86	'V'
	.db #0x37	; 55	'7'
	.db #0x71	; 113	'q'
	.db #0xaf	; 175
	.db #0xbd	; 189
	.db #0x56	; 86	'V'
	.db #0x96	; 150
	.db #0x10	; 16
	.db #0xc9	; 201
	.db #0x6a	; 106	'j'
	.db #0x47	; 71	'G'
	.db #0xcc	; 204
	.db #0x95	; 149
	.db #0x66	; 102	'f'
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xac	; 172
	.db #0xf3	; 243
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xbf	; 191
	.db #0xa3	; 163
	.db #0xcb	; 203
	.db #0x98	; 152
	.db #0x78	; 120	'x'
	.db #0xe8	; 232
	.db #0x7f	; 127
	.db #0x8e	; 142
	.db #0xfb	; 251
	.db #0x7f	; 127
	.db #0xe9	; 233
	.db #0xf6	; 246
	.db #0xd7	; 215
	.db #0xec	; 236
	.db #0xe3	; 227
	.db #0xf8	; 248
	.db #0xec	; 236
	.db #0xbd	; 189
	.db #0xf2	; 242
	.db #0x7f	; 127
	.db #0x0f	; 15
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0xbd	; 189
	.db #0xcb	; 203
	.db #0xee	; 238
	.db #0xa0	; 160
	.db #0xc8	; 200
	.db #0x28	; 40
	.db #0xc4	; 196
	.db #0x0d	; 13
	.db #0x2b	; 43
	.db #0xe0	; 224
	.db #0xcf	; 207
	.db #0x5c	; 92
	.db #0xca	; 202
	.db #0x43	; 67	'C'
	.db #0xd5	; 213
	.db #0x56	; 86	'V'
	.db #0xd6	; 214
	.db #0x92	; 146
	.db #0x14	; 20
	.db #0xba	; 186
	.db #0x01	; 1
	.db #0xd9	; 217
	.db #0x5f	; 95
	.db #0xad	; 173
	.db #0x11	; 17
	.db #0x75	; 117	'u'
	.db #0x95	; 149
	.db #0xc4	; 196
	.db #0x96	; 150
	.db #0x0b	; 11
	.db #0x01	; 1
	.db #0xac	; 172
	.db #0x21	; 33
	.db #0x10	; 16
	.db #0xa6	; 166
	.db #0xc1	; 193
	.db #0x12	; 18
	.db #0x7a	; 122	'z'
	.db #0x7e	; 126
	.db #0xc0	; 192
	.db #0xcb	; 203
	.db #0xfb	; 251
	.db #0xc8	; 200
	.db #0x21	; 33
	.db #0xad	; 173
	.db #0xcf	; 207
	.db #0x81	; 129
	.db #0x80	; 128
	.db #0x7c	; 124
	.db #0xcb	; 203
	.db #0xcf	; 207
	.db #0x0b	; 11
	.db #0x4b	; 75	'K'
	.db #0x80	; 128
	.db #0xbe	; 190
	.db #0xe1	; 225
	.db #0xc6	; 198
	.db #0xf1	; 241
	.db #0xe9	; 233
	.db #0xaa	; 170
	.db #0x7e	; 126
	.db #0x83	; 131
	.db #0xae	; 174
	.db #0x7e	; 126
	.db #0x83	; 131
	.db #0xbb	; 187
	.db #0x2e	; 46
	.db #0x01	; 1
	.db #0x83	; 131
	.db #0xb3	; 179
	.db #0xd0	; 208
	.db #0x83	; 131
	.db #0xc9	; 201
	.db #0x27	; 39
	.db #0x36	; 54	'6'
	.db #0x0f	; 15
	.db #0xec	; 236
	.db #0xa0	; 160
	.db #0xfd	; 253
	.db #0xa0	; 160
	.db #0x03	; 3
	.db #0xa0	; 160
	.db #0xfc	; 252
	.db #0xa0	; 160
	.db #0x04	; 4
	.db #0xa0	; 160
	.db #0xfb	; 251
	.db #0xa0	; 160
	.db #0x05	; 5
	.db #0xa0	; 160
	.db #0xfa	; 250
	.db #0xa0	; 160
	.db #0x06	; 6
	.db #0xa0	; 160
	.db #0xf9	; 249
	.db #0xaf	; 175
	.db #0x07	; 7
	.db #0x67	; 103	'g'
	.db #0xfe	; 254
	.db #0x46	; 70	'F'
	.db #0x10	; 16
	.db #0x3d	; 61
	.db #0xc4	; 196
	.db #0x7c	; 124
	.db #0x0e	; 14
	.db #0x38	; 56	'8'
	.db #0xe7	; 231
	.db #0xd4	; 212
	.db #0x7c	; 124
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0x98	; 152
	.db #0xe7	; 231
	.db #0x75	; 117	'u'
	.db #0x74	; 116	't'
	.db #0x72	; 114	'r'
	.db #0x70	; 112	'p'
	.db #0xf0	; 240
	.db #0xda	; 218
	.db #0xe1	; 225
	.db #0xb3	; 179
	.db #0x10	; 16
	.db #0x0b	; 11
	.db #0xd1	; 209
	.db #0x4e	; 78	'N'
	.db #0xa0	; 160
	.db #0x3a	; 58
	.db #0x66	; 102	'f'
	.db #0xd8	; 216
	.db #0xa6	; 166
	.db #0x6e	; 110	'n'
	.db #0xd1	; 209
	.db #0x58	; 88	'X'
	.db #0xd8	; 216
	.db #0xf9	; 249
	.db #0x7e	; 126
	.db #0x58	; 88	'X'
	.db #0x64	; 100	'd'
	.db #0xd8	; 216
	.db #0xec	; 236
	.db #0xb4	; 180
	.db #0x83	; 131
	.db #0xb6	; 182
	.db #0xa3	; 163
	.db #0xd8	; 216
	.db #0xba	; 186
	.db #0x57	; 87	'W'
	.db #0x75	; 117	'u'
	.db #0xa6	; 166
	.db #0xd8	; 216
	.db #0x92	; 146
	.db #0x5d	; 93
	.db #0x90	; 144
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x67	; 103	'g'
	.db #0x49	; 73	'I'
	.db #0x41	; 65	'A'
	.db #0x95	; 149
	.db #0x18	; 24
	.db #0xb8	; 184
	.db #0x2f	; 47
	.db #0x35	; 53	'5'
	.db #0x78	; 120	'x'
	.db #0x81	; 129
	.db #0x20	; 32
	.db #0xd0	; 208
	.db #0x2d	; 45
	.db #0x80	; 128
	.db #0xf9	; 249
	.db #0x88	; 136
	.db #0x2b	; 43
	.db #0x7e	; 126
	.db #0x88	; 136
	.db #0x29	; 41
	.db #0x7c	; 124
	.db #0x88	; 136
	.db #0x27	; 39
	.db #0x75	; 117	'u'
	.db #0x88	; 136
	.db #0x25	; 37
	.db #0x74	; 116	't'
	.db #0x88	; 136
	.db #0x23	; 35
	.db #0x72	; 114	'r'
	.db #0x8f	; 143
	.db #0x21	; 33
	.db #0x70	; 112	'p'
	.db #0x81	; 129
	.db #0x77	; 119	'w'
	.db #0x84	; 132
	.db #0x0d	; 13
	.db #0xc4	; 196
	.db #0xaa	; 170
	.db #0x02	; 2
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x75	; 117	'u'
	.db #0x9d	; 157
	.db #0x3a	; 58
	.db #0x62	; 98	'b'
	.db #0xbd	; 189
	.db #0x7e	; 126
	.db #0xf8	; 248
	.db #0xfe	; 254
	.db #0xe4	; 228
	.db #0xe4	; 228
	.db #0xda	; 218
	.db #0x1c	; 28
	.db #0x3f	; 63
	.db #0xb6	; 182
	.db #0xec	; 236
	.db #0xc3	; 195
	.db #0xd7	; 215
	.db #0xf7	; 247
	.db #0xd9	; 217
	.db #0xec	; 236
	.db #0xe8	; 232
	.db #0xe4	; 228
	.db #0xe4	; 228
	.db #0x38	; 56	'8'
	.db #0xda	; 218
	.db #0x70	; 112	'p'
	.db #0x9a	; 154
	.db #0xc2	; 194
	.db #0xbd	; 189
	.db #0x7f	; 127
	.db #0xd9	; 217
	.db #0xec	; 236
	.db #0x7e	; 126
	.db #0xe4	; 228
	.db #0x83	; 131
	.db #0xe4	; 228
	.db #0x87	; 135
	.db #0xda	; 218
	.db #0x09	; 9
	.db #0xa0	; 160
	.db #0xa7	; 167
	.db #0xbd	; 189
	.db #0xf7	; 247
	.db #0xd9	; 217
	.db #0xec	; 236
	.db #0xfa	; 250
	.db #0xf8	; 248
	.db #0x64	; 100	'd'
	.db #0x93	; 147
	.db #0x4a	; 74	'J'
	.db #0x8b	; 139
	.db #0x50	; 80	'P'
	.db #0xbb	; 187
	.db #0xcd	; 205
	.db #0x04	; 4
	.db #0xd4	; 212
	.db #0xca	; 202
	.db #0xa0	; 160
	.db #0xbd	; 189
	.db #0x52	; 82	'R'
	.db #0x81	; 129
	.db #0xbd	; 189
	.db #0x4a	; 74	'J'
	.db #0xbd	; 189
	.db #0x44	; 68	'D'
	.db #0xcb	; 203
	.db #0x47	; 71	'G'
	.db #0x74	; 116	't'
	.db #0xa1	; 161
	.db #0x59	; 89	'Y'
	.db #0x00	; 0
	.db #0xcb	; 203
	.db #0x94	; 148
	.db #0x8c	; 140
	.db #0x40	; 64
	.db #0x72	; 114	'r'
	.db #0xac	; 172
	.db #0x7b	; 123
	.db #0x45	; 69	'E'
	.db #0x85	; 133
	.db #0xc0	; 192
	.db #0xc7	; 199
	.db #0x85	; 133
	.db #0x16	; 22
	.db #0x78	; 120	'x'
	.db #0xc6	; 198
	.db #0x53	; 83	'S'
	.db #0x23	; 35
	.db #0x85	; 133
	.db #0x4f	; 79	'O'
	.db #0x5a	; 90	'Z'
	.db #0xd2	; 210
	.db #0x6b	; 107	'k'
	.db #0x46	; 70	'F'
	.db #0x83	; 131
	.db #0x4f	; 79	'O'
	.db #0x46	; 70	'F'
	.db #0xa1	; 161
	.db #0xd9	; 217
	.db #0x83	; 131
	.db #0xa7	; 167
	.db #0x83	; 131
	.db #0xe7	; 231
	.db #0xdc	; 220
	.db #0x83	; 131
	.db #0x45	; 69	'E'
	.db #0x80	; 128
	.db #0xa3	; 163
	.db #0xdb	; 219
	.db #0x80	; 128
	.db #0x31	; 49	'1'
	.db #0x15	; 21
	.db #0x90	; 144
	.db #0x8e	; 142
	.db #0x0f	; 15
	.db #0x42	; 66	'B'
	.db #0xd8	; 216
	.db #0xf2	; 242
	.db #0x57	; 87	'W'
	.db #0x1d	; 29
	.db #0x70	; 112	'p'
	.db #0x3c	; 60
	.db #0xdd	; 221
	.db #0x72	; 114	'r'
	.db #0x6e	; 110	'n'
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0xd9	; 217
	.db #0x9b	; 155
	.db #0x1e	; 30
	.db #0xd8	; 216
	.db #0x1f	; 31
	.db #0x0e	; 14
	.db #0xb8	; 184
	.db #0xe9	; 233
	.db #0x80	; 128
	.db #0xf1	; 241
	.db #0xc2	; 194
	.db #0x7e	; 126
	.db #0xd9	; 217
	.db #0x16	; 22
	.db #0x7e	; 126
	.db #0xed	; 237
	.db #0xe0	; 224
	.db #0xa2	; 162
	.db #0x7e	; 126
	.db #0xb0	; 176
	.db #0x83	; 131
	.db #0xfc	; 252
	.db #0x0e	; 14
	.db #0xf1	; 241
	.db #0x64	; 100	'd'
	.db #0x52	; 82	'R'
	.db #0x13	; 19
	.db #0x9d	; 157
	.db #0x3e	; 62
	.db #0xb0	; 176
	.db #0xf8	; 248
	.db #0xf6	; 246
	.db #0x06	; 6
	.db #0xf6	; 246
	.db #0x13	; 19
	.db #0xd5	; 213
	.db #0xdf	; 223
	.db #0x85	; 133
	.db #0xfc	; 252
	.db #0xce	; 206
	.db #0x02	; 2
	.db #0x36	; 54	'6'
	.db #0x08	; 8
	.db #0x5a	; 90	'Z'
	.db #0xf4	; 244
	.db #0x2b	; 43
	.db #0x91	; 145
	.db #0x8d	; 141
	.db #0xf6	; 246
	.db #0x0b	; 11
	.db #0xd9	; 217
	.db #0x66	; 102	'f'
	.db #0xa5	; 165
	.db #0xdd	; 221
	.db #0x58	; 88	'X'
	.db #0x28	; 40
	.db #0x64	; 100	'd'
	.db #0xa5	; 165
	.db #0x55	; 85	'U'
	.db #0x28	; 40
	.db #0x61	; 97	'a'
	.db #0xa4	; 164
	.db #0x56	; 86	'V'
	.db #0x63	; 99	'c'
	.db #0x02	; 2
	.db #0x62	; 98	'b'
	.db #0x0e	; 14
	.db #0x79	; 121	'y'
	.db #0x6c	; 108	'l'
	.db #0x10	; 16
	.db #0x76	; 118	'v'
	.db #0xd1	; 209
	.db #0xae	; 174
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0xed	; 237
	.db #0x75	; 117	'u'
	.db #0x5a	; 90	'Z'
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x63	; 99	'c'
	.db #0xb0	; 176
	.db #0xc4	; 196
	.db #0xfb	; 251
	.db #0x8a	; 138
	.db #0x68	; 104	'h'
	.db #0x64	; 100	'd'
	.db #0x2f	; 47
	.db #0x55	; 85	'U'
	.db #0xfe	; 254
	.db #0x8a	; 138
	.db #0x61	; 97	'a'
	.db #0x55	; 85	'U'
	.db #0x83	; 131
	.db #0x56	; 86	'V'
	.db #0xaf	; 175
	.db #0xae	; 174
	.db #0x5a	; 90	'Z'
	.db #0xc0	; 192
	.db #0x13	; 19
	.db #0x51	; 81	'Q'
	.db #0x80	; 128
	.db #0xca	; 202
	.db #0xd0	; 208
	.db #0xa1	; 161
	.db #0xd3	; 211
	.db #0x0e	; 14
	.db #0x04	; 4
	.db #0x79	; 121	'y'
	.db #0x10	; 16
	.db #0x1b	; 27
	.db #0xd7	; 215
	.db #0x06	; 6
	.db #0x1c	; 28
	.db #0x15	; 21
	.db #0x5c	; 92
	.db #0xd7	; 215
	.db #0x28	; 40
	.db #0x57	; 87	'W'
	.db #0x4e	; 78	'N'
	.db #0x00	; 0
	.db #0x4d	; 77	'M'
	.db #0x52	; 82	'R'
	.db #0x02	; 2
	.db #0x54	; 84	'T'
	.db #0x7d	; 125
	.db #0x01	; 1
	.db #0xd6	; 214
	.db #0xed	; 237
	.db #0x05	; 5
	.db #0xd4	; 212
	.db #0x4f	; 79	'O'
	.db #0x70	; 112	'p'
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xb0	; 176
	.db #0x10	; 16
	.db #0x61	; 97	'a'
	.db #0xa8	; 168
	.db #0xa0	; 160
	.db #0x18	; 24
	.db #0xb1	; 177
	.db #0x72	; 114	'r'
	.db #0x68	; 104	'h'
	.db #0x10	; 16
	.db #0xc1	; 193
	.db #0x66	; 102	'f'
	.db #0xb9	; 185
	.db #0x81	; 129
	.db #0xac	; 172
	.db #0x56	; 86	'V'
	.db #0x8a	; 138
	.db #0xb9	; 185
	.db #0x72	; 114	'r'
	.db #0x4a	; 74	'J'
	.db #0xb9	; 185
	.db #0x05	; 5
	.db #0x43	; 67	'C'
	.db #0x4b	; 75	'K'
	.db #0x9c	; 156
	.db #0x1d	; 29
	.db #0x5a	; 90	'Z'
	.db #0x43	; 67	'C'
	.db #0x1d	; 29
	.db #0x6e	; 110	'n'
	.db #0xc7	; 199
	.db #0x82	; 130
	.db #0x1a	; 26
	.db #0x06	; 6
	.db #0xef	; 239
	.db #0xb7	; 183
	.db #0x79	; 121	'y'
	.db #0x85	; 133
	.db #0xb5	; 181
	.db #0xaa	; 170
	.db #0x30	; 48	'0'
	.db #0xff	; 255
	.db #0x61	; 97	'a'
	.db #0xea	; 234
	.db #0x10	; 16
	.db #0xd9	; 217
	.db #0xc0	; 192
	.db #0x31	; 49	'1'
	.db #0x28	; 40
	.db #0x2d	; 45
	.db #0x7c	; 124
	.db #0x51	; 81	'Q'
	.db #0xc5	; 197
	.db #0x80	; 128
	.db #0xee	; 238
	.db #0xc6	; 198
	.db #0xe2	; 226
	.db #0x41	; 65	'A'
	.db #0x0f	; 15
	.db #0x04	; 4
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0x7e	; 126
	.db #0x1b	; 27
	.db #0xf8	; 248
	.db #0x57	; 87	'W'
	.db #0x1c	; 28
	.db #0xfa	; 250
	.db #0x7d	; 125
	.db #0xf8	; 248
	.db #0xe1	; 225
	.db #0xdc	; 220
	.db #0x77	; 119	'w'
	.db #0xfc	; 252
	.db #0x7d	; 125
	.db #0xec	; 236
	.db #0x2c	; 44
	.db #0xbd	; 189
	.db #0x46	; 70	'F'
	.db #0x02	; 2
	.db #0x1d	; 29
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x45	; 69	'E'
	.db #0x28	; 40
	.db #0x24	; 36
	.db #0xed	; 237
	.db #0xa7	; 167
	.db #0x7c	; 124
	.db #0x2b	; 43
	.db #0xde	; 222
	.db #0x7c	; 124
	.db #0x5d	; 93
	.db #0x6c	; 108	'l'
	.db #0x75	; 117	'u'
	.db #0x9d	; 157
	.db #0x8e	; 142
	.db #0x4c	; 76	'L'
	.db #0x4a	; 74	'J'
	.db #0x54	; 84	'T'
	.db #0x60	; 96
	.db #0xd5	; 213
	.db #0xd7	; 215
	.db #0xb0	; 176
	.db #0xca	; 202
	.db #0x55	; 85	'U'
	.db #0x4c	; 76	'L'
	.db #0x06	; 6
	.db #0x22	; 34
	.db #0x56	; 86	'V'
	.db #0xcb	; 203
	.db #0x7c	; 124
	.db #0xf8	; 248
	.db #0xa3	; 163
	.db #0x58	; 88	'X'
	.db #0x26	; 38
	.db #0xc1	; 193
	.db #0x04	; 4
	.db #0xd0	; 208
	.db #0x79	; 121	'y'
	.db #0x8a	; 138
	.db #0x08	; 8
	.db #0x77	; 119	'w'
	.db #0xc0	; 192
	.db #0x1c	; 28
	.db #0xaa	; 170
	.db #0x28	; 40
	.db #0x79	; 121	'y'
	.db #0xaa	; 170
	.db #0x7a	; 122	'z'
	.db #0x11	; 17
	.db #0x99	; 153
	.db #0xfa	; 250
	.db #0xd4	; 212
	.db #0x79	; 121	'y'
	.db #0x77	; 119	'w'
	.db #0x77	; 119	'w'
	.db #0x18	; 24
	.db #0xc6	; 198
	.db #0x7e	; 126
	.db #0xdf	; 223
	.db #0xe8	; 232
	.db #0x6a	; 106	'j'
	.db #0x72	; 114	'r'
	.db #0xd5	; 213
	.db #0x4a	; 74	'J'
	.db #0x0e	; 14
	.db #0x0c	; 12
	.db #0x8f	; 143
	.db #0x10	; 16
	.db #0xb1	; 177
	.db #0x23	; 35
	.db #0x5f	; 95
	.db #0x0c	; 12
	.db #0x7e	; 126
	.db #0x9c	; 156
	.db #0xb3	; 179
	.db #0x81	; 129
	.db #0x02	; 2
	.db #0x80	; 128
	.db #0x33	; 51	'3'
	.db #0xa9	; 169
	.db #0x36	; 54	'6'
	.db #0x99	; 153
	.db #0x02	; 2
	.db #0x7e	; 126
	.db #0x7c	; 124
	.db #0xfa	; 250
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0xab	; 171
	.db #0x32	; 50	'2'
	.db #0xf6	; 246
	.db #0x51	; 81	'Q'
	.db #0x21	; 33
	.db #0x5a	; 90	'Z'
	.db #0x26	; 38
	.db #0x5a	; 90	'Z'
	.db #0xcc	; 204
	.db #0x5a	; 90	'Z'
	.db #0xa4	; 164
	.db #0x5a	; 90	'Z'
	.db #0x59	; 89	'Y'
	.db #0xa9	; 169
	.db #0x58	; 88	'X'
	.db #0xcc	; 204
	.db #0x58	; 88	'X'
	.db #0x58	; 88	'X'
	.db #0x16	; 22
	.db #0xaa	; 170
	.db #0x56	; 86	'V'
	.db #0x56	; 86	'V'
	.db #0x95	; 149
	.db #0x56	; 86	'V'
	.db #0xf5	; 245
	.db #0xc0	; 192
	.db #0xa5	; 165
	.db #0x58	; 88	'X'
	.db #0x37	; 55	'7'
	.db #0x48	; 72	'H'
	.db #0xd5	; 213
	.db #0xdf	; 223
	.db #0x33	; 51	'3'
	.db #0xc8	; 200
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x8d	; 141
	.db #0x79	; 121	'y'
	.db #0xc6	; 198
	.db #0x44	; 68	'D'
	.db #0x9b	; 155
	.db #0xee	; 238
	.db #0xc7	; 199
	.db #0x51	; 81	'Q'
	.db #0x26	; 38
	.db #0xdc	; 220
	.db #0xfa	; 250
	.db #0xc8	; 200
	.db #0xed	; 237
	.db #0xee	; 238
	.db #0xd2	; 210
	.db #0x7c	; 124
	.db #0xc8	; 200
	.db #0xdd	; 221
	.db #0x2c	; 44
	.db #0x76	; 118	'v'
	.db #0x2e	; 46
	.db #0xbf	; 191
	.db #0xca	; 202
	.db #0x96	; 150
	.db #0xef	; 239
	.db #0xb0	; 176
	.db #0xcb	; 203
	.db #0xaf	; 175
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0x8a	; 138
	.db #0x6d	; 109	'm'
	.db #0xcd	; 205
	.db #0x44	; 68	'D'
	.db #0x85	; 133
	.db #0x76	; 118	'v'
	.db #0x2a	; 42
	.db #0x5a	; 90	'Z'
	.db #0xa9	; 169
	.db #0x5a	; 90	'Z'
	.db #0x5a	; 90	'Z'
	.db #0x07	; 7
	.db #0x73	; 115	's'
	.db #0x28	; 40
	.db #0x74	; 116	't'
	.db #0x68	; 104	'h'
	.db #0x7d	; 125
	.db #0xf9	; 249
	.db #0x44	; 68	'D'
	.db #0xd2	; 210
	.db #0x76	; 118	'v'
	.db #0x85	; 133
	.db #0x56	; 86	'V'
	.db #0xaa	; 170
	.db #0x56	; 86	'V'
	.db #0x56	; 86	'V'
	.db #0x45	; 69	'E'
	.db #0xb5	; 181
	.db #0xd7	; 215
	.db #0x12	; 18
	.db #0x73	; 115	's'
	.db #0x80	; 128
	.db #0xdb	; 219
	.db #0x1f	; 31
	.db #0xb4	; 180
	.db #0x43	; 67	'C'
	.db #0x54	; 84	'T'
	.db #0x65	; 101	'e'
	.db #0x6c	; 108	'l'
	.db #0x04	; 4
	.db #0xa1	; 161
	.db #0x08	; 8
	.db #0xc4	; 196
	.db #0x8b	; 139
	.db #0x1d	; 29
	.db #0x94	; 148
	.db #0x02	; 2
	.db #0x7b	; 123
	.db #0x9d	; 157
	.db #0xe4	; 228
	.db #0xd4	; 212
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0xf4	; 244
	.db #0x1d	; 29
	.db #0x5a	; 90	'Z'
	.db #0x15	; 21
	.db #0x1d	; 29
	.db #0x35	; 53	'5'
	.db #0xb6	; 182
	.db #0x4c	; 76	'L'
	.db #0x68	; 104	'h'
	.db #0xab	; 171
	.db #0x6f	; 111	'o'
	.db #0xb9	; 185
	.db #0x16	; 22
	.db #0x72	; 114	'r'
	.db #0x63	; 99	'c'
	.db #0x72	; 114	'r'
	.db #0xd8	; 216
	.db #0xd5	; 213
	.db #0xcf	; 207
	.db #0x19	; 25
	.db #0x44	; 68	'D'
	.db #0x07	; 7
	.db #0x57	; 87	'W'
	.db #0xdd	; 221
	.db #0xf1	; 241
	.db #0x7b	; 123
	.db #0x7e	; 126
	.db #0x1d	; 29
	.db #0x70	; 112	'p'
	.db #0xb6	; 182
	.db #0x75	; 117	'u'
	.db #0x07	; 7
	.db #0xbe	; 190
	.db #0x56	; 86	'V'
	.db #0xd4	; 212
	.db #0xd8	; 216
	.db #0x1e	; 30
	.db #0xba	; 186
	.db #0x80	; 128
	.db #0xdb	; 219
	.db #0x05	; 5
	.db #0x35	; 53	'5'
	.db #0x81	; 129
	.db #0x58	; 88	'X'
	.db #0x07	; 7
	.db #0x50	; 80	'P'
	.db #0x77	; 119	'w'
	.db #0x84	; 132
	.db #0x40	; 64
	.db #0x95	; 149
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x10	; 16
	.db #0xd7	; 215
	.db #0xf8	; 248
	.db #0x44	; 68	'D'
	.db #0x90	; 144
	.db #0x9a	; 154
	.db #0x03	; 3
	.db #0xc8	; 200
	.db #0xf1	; 241
	.db #0x22	; 34
	.db #0x45	; 69	'E'
	.db #0x2a	; 42
	.db #0x0c	; 12
	.db #0xed	; 237
	.db #0xd9	; 217
	.db #0x50	; 80	'P'
	.db #0xd7	; 215
	.db #0xa6	; 166
	.db #0x44	; 68	'D'
	.db #0x90	; 144
	.db #0x8c	; 140
	.db #0xd4	; 212
	.db #0x0c	; 12
	.db #0x1a	; 26
	.db #0x51	; 81	'Q'
	.db #0x75	; 117	'u'
	.db #0xb5	; 181
	.db #0xc6	; 198
	.db #0x3b	; 59
	.db #0x3d	; 61
	.db #0xff	; 255
	.db #0xd7	; 215
	.db #0x05	; 5
	.db #0xa0	; 160
	.db #0x6f	; 111	'o'
	.db #0x02	; 2
	.db #0xbd	; 189
	.db #0xce	; 206
	.db #0xe3	; 227
	.db #0x56	; 86	'V'
	.db #0x6c	; 108	'l'
	.db #0xaa	; 170
	.db #0xcc	; 204
	.db #0xcb	; 203
	.db #0xc1	; 193
	.db #0xaa	; 170
	.db #0xa9	; 169
	.db #0xc9	; 201
	.db #0xc8	; 200
	.db #0x2b	; 43
	.db #0x16	; 22
	.db #0x3c	; 60
	.db #0x75	; 117	'u'
	.db #0xcb	; 203
	.db #0xef	; 239
	.db #0xca	; 202
	.db #0xc8	; 200
	.db #0xf6	; 246
	.db #0xa0	; 160
	.db #0xc4	; 196
	.db #0xa0	; 160
	.db #0xc1	; 193
	.db #0xd6	; 214
	.db #0xd0	; 208
	.db #0xa9	; 169
	.db #0x00	; 0
	.db #0xa7	; 167
	.db #0x28	; 40
	.db #0xd0	; 208
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0xcd	; 205
	.db #0x0a	; 10
	.db #0x5a	; 90	'Z'
	.db #0xe2	; 226
	.db #0xce	; 206
	.db #0xf9	; 249
	.db #0x81	; 129
	.db #0x8f	; 143
	.db #0x27	; 39
	.db #0x09	; 9
	.db #0x0d	; 13
	.db #0x01	; 1
	.db #0xb8	; 184
	.db #0xf4	; 244
	.db #0xf8	; 248
	.db #0xa6	; 166
	.db #0x8e	; 142
	.db #0x96	; 150
	.db #0x8d	; 141
	.db #0x95	; 149
	.db #0x8c	; 140
	.db #0xa4	; 164
	.db #0x8b	; 139
	.db #0x7e	; 126
	.db #0x94	; 148
	.db #0x91	; 145
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x9d	; 157
	.db #0xb8	; 184
	.db #0x02	; 2
	.db #0xf8	; 248
	.db #0xa6	; 166
	.db #0x8e	; 142
	.db #0x96	; 150
	.db #0x8d	; 141
	.db #0x95	; 149
	.db #0x8c	; 140
	.db #0xa5	; 165
	.db #0x8b	; 139
	.db #0x37	; 55	'7'
	.db #0xa1	; 161
	.db #0xeb	; 235
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0xf8	; 248
	.db #0x0d	; 13
	.db #0xa9	; 169
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x0f	; 15
	.db #0xc8	; 200
	.db #0x8e	; 142
	.db #0x90	; 144
	.db #0x01	; 1
	.db #0xf9	; 249
	.db #0x22	; 34
	.db #0x58	; 88	'X'
	.db #0x02	; 2
	.db #0x1a	; 26
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0xe8	; 232
	.db #0x1e	; 30
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x32	; 50	'2'
	.db #0x4c	; 76	'L'
	.db #0xae	; 174
	.db #0x64	; 100	'd'
	.db #0xc5	; 197
	.db #0xbf	; 191
	.db #0x96	; 150
	.db #0xbc	; 188
	.db #0xa2	; 162
	.db #0xf9	; 249
	.db #0xfa	; 250
	.db #0x48	; 72	'H'
	.db #0x0e	; 14
	.db #0x2c	; 44
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x1d	; 29
	.db #0x5e	; 94
	.db #0x88	; 136
	.db #0x1c	; 28
	.db #0x90	; 144
	.db #0x89	; 137
	.db #0x1b	; 27
	.db #0x68	; 104	'h'
	.db #0xa2	; 162
	.db #0x90	; 144
	.db #0x26	; 38
	.db #0x1a	; 26
	.db #0xb8	; 184
	.db #0x89	; 137
	.db #0xe0	; 224
	.db #0xa2	; 162
	.db #0x19	; 25
	.db #0x08	; 8
	.db #0x02	; 2
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x68	; 104	'h'
	.db #0x58	; 88	'X'
	.db #0x9a	; 154
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9a	; 154
	.db #0x16	; 22
	.db #0x15	; 21
	.db #0x5a	; 90	'Z'
	.db #0x04	; 4
	.db #0x69	; 105	'i'
	.db #0x03	; 3
	.db #0xa5	; 165
	.db #0x02	; 2
	.db #0xa5	; 165
	.db #0x01	; 1
	.db #0xa4	; 164
	.db #0x00	; 0
	.db #0x5b	; 91
	.db #0x90	; 144
	.db #0x9e	; 158
	.db #0xee	; 238
	.db #0x93	; 147
	.db #0x3e	; 62
	.db #0x05	; 5
	.db #0x08	; 8
	.db #0xf6	; 246
	.db #0xed	; 237
	.db #0x09	; 9
	.db #0xe6	; 230
	.db #0x55	; 85	'U'
	.db #0x56	; 86	'V'
_g_TilesetPat_Zx0:
	.db #0x96	; 150
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xe9	; 233
	.db #0xf8	; 248
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0xcf	; 207
	.db #0xc7	; 199
	.db #0xdb	; 219
	.db #0xd9	; 217
	.db #0xe3	; 227
	.db #0x1f	; 31
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xf3	; 243
	.db #0xe3	; 227
	.db #0xdb	; 219
	.db #0x9b	; 155
	.db #0xc7	; 199
	.db #0xd6	; 214
	.db #0xa5	; 165
	.db #0xfc	; 252
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xae	; 174
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0x3f	; 63
	.db #0xfd	; 253
	.db #0x0e	; 14
	.db #0x7f	; 127
	.db #0xf3	; 243
	.db #0xe1	; 225
	.db #0xdd	; 221
	.db #0xff	; 255
	.db #0x48	; 72	'H'
	.db #0x1f	; 31
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xcf	; 207
	.db #0x87	; 135
	.db #0xbb	; 187
	.db #0x86	; 134
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xea	; 234
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xfa	; 250
	.db #0xe5	; 229
	.db #0xae	; 174
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x82	; 130
	.db #0x7f	; 127
	.db #0xe3	; 227
	.db #0xdd	; 221
	.db #0xeb	; 235
	.db #0x08	; 8
	.db #0x20	; 32
	.db #0xfe	; 254
	.db #0xc7	; 199
	.db #0xbb	; 187
	.db #0xd7	; 215
	.db #0xa8	; 168
	.db #0xf8	; 248
	.db #0x8b	; 139
	.db #0x1f	; 31
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xee	; 238
	.db #0x7d	; 125
	.db #0xc3	; 195
	.db #0x0f	; 15
	.db #0xc0	; 192
	.db #0xa7	; 167
	.db #0x7f	; 127
	.db #0xe9	; 233
	.db #0xff	; 255
	.db #0xc1	; 193
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x80	; 128
	.db #0x43	; 67	'C'
	.db #0xf8	; 248
	.db #0x3d	; 61
	.db #0xc1	; 193
	.db #0x81	; 129
	.db #0xaa	; 170
	.db #0xfe	; 254
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xa2	; 162
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x3f	; 63
	.db #0x26	; 38
	.db #0xe7	; 231
	.db #0xdb	; 219
	.db #0xdd	; 221
	.db #0x88	; 136
	.db #0x0f	; 15
	.db #0xfc	; 252
	.db #0xef	; 239
	.db #0xf1	; 241
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0xa3	; 163
	.db #0xec	; 236
	.db #0xff	; 255
	.db #0xd3	; 211
	.db #0xf3	; 243
	.db #0x7d	; 125
	.db #0xbe	; 190
	.db #0x8e	; 142
	.db #0xf0	; 240
	.db #0x3b	; 59
	.db #0xc2	; 194
	.db #0x82	; 130
	.db #0xda	; 218
	.db #0xcb	; 203
	.db #0x3c	; 60
	.db #0x0f	; 15
	.db #0x0b	; 11
	.db #0xdb	; 219
	.db #0x80	; 128
	.db #0xf1	; 241
	.db #0x88	; 136
	.db #0xe7	; 231
	.db #0xfd	; 253
	.db #0xef	; 239
	.db #0xbe	; 190
	.db #0xef	; 239
	.db #0x77	; 119	'w'
	.db #0x3f	; 63
	.db #0xe1	; 225
	.db #0x39	; 57	'9'
	.db #0x7f	; 127
	.db #0xed	; 237
	.db #0xff	; 255
	.db #0xf6	; 246
	.db #0x3d	; 61
	.db #0x7a	; 122	'z'
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xbd	; 189
	.db #0x5a	; 90	'Z'
	.db #0x5a	; 90	'Z'
	.db #0xbd	; 189
	.db #0x7e	; 126
	.db #0xa2	; 162
	.db #0xda	; 218
	.db #0xef	; 239
	.db #0x61	; 97	'a'
	.db #0xfd	; 253
	.db #0x11	; 17
	.db #0xa1	; 161
	.db #0x7f	; 127
	.db #0xdc	; 220
	.db #0xa0	; 160
	.db #0x82	; 130
	.db #0xf7	; 247
	.db #0xb6	; 182
	.db #0xd5	; 213
	.db #0xe3	; 227
	.db #0x9e	; 158
	.db #0xd5	; 213
	.db #0xb6	; 182
	.db #0xf7	; 247
	.db #0xd5	; 213
	.db #0x19	; 25
	.db #0xbf	; 191
	.db #0x5f	; 95
	.db #0x5f	; 95
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0x93	; 147
	.db #0xfd	; 253
	.db #0xfa	; 250
	.db #0xfa	; 250
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xa3	; 163
	.db #0xe0	; 224
	.db #0x5e	; 94
	.db #0xad	; 173
	.db #0xf8	; 248
	.db #0x71	; 113	'q'
	.db #0xe0	; 224
	.db #0xfe	; 254
	.db #0x7a	; 122	'z'
	.db #0xb5	; 181
	.db #0xf0	; 240
	.db #0x51	; 81	'Q'
	.db #0x3f	; 63
	.db #0xad	; 173
	.db #0x5e	; 94
	.db #0xc1	; 193
	.db #0xf0	; 240
	.db #0x82	; 130
	.db #0xb5	; 181
	.db #0x7a	; 122	'z'
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0x80	; 128
	.db #0x98	; 152
	.db #0xc3	; 195
	.db #0x87	; 135
	.db #0x0f	; 15
	.db #0x1e	; 30
	.db #0x3c	; 60
	.db #0x78	; 120	'x'
	.db #0xff	; 255
	.db #0xe1	; 225
	.db #0x60	; 96
	.db #0xff	; 255
	.db #0xbb	; 187
	.db #0xaa	; 170
	.db #0x6d	; 109	'm'
	.db #0xba	; 186
	.db #0xa8	; 168
	.db #0x66	; 102	'f'
	.db #0x82	; 130
	.db #0xd9	; 217
	.db #0xaa	; 170
	.db #0xa8	; 168
	.db #0x69	; 105	'i'
	.db #0xaa	; 170
	.db #0x65	; 101	'e'
	.db #0xef	; 239
	.db #0xcf	; 207
	.db #0xbb	; 187
	.db #0xaf	; 175
	.db #0xcb	; 203
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x9f	; 159
	.db #0x23	; 35
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0x8a	; 138
	.db #0xee	; 238
	.db #0x2e	; 46
	.db #0x62	; 98	'b'
	.db #0xf5	; 245
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0x48	; 72	'H'
	.db #0xc7	; 199
	.db #0xbc	; 188
	.db #0xcc	; 204
	.db #0xf7	; 247
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0x58	; 88	'X'
	.db #0x2e	; 46
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xf9	; 249
	.db #0xe9	; 233
	.db #0xf0	; 240
	.db #0x4c	; 76	'L'
	.db #0xbe	; 190
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0x95	; 149
	.db #0xed	; 237
	.db #0xdb	; 219
	.db #0xf9	; 249
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xa5	; 165
	.db #0xff	; 255
	.db #0xe9	; 233
	.db #0xa5	; 165
	.db #0x97	; 151
	.db #0x86	; 134
	.db #0xef	; 239
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xe7	; 231
	.db #0x04	; 4
	.db #0xf6	; 246
	.db #0xd3	; 211
	.db #0x23	; 35
	.db #0xe1	; 225
	.db #0xf7	; 247
	.db #0xd0	; 208
	.db #0x3b	; 59
	.db #0xa5	; 165
	.db #0xdf	; 223
	.db #0xab	; 171
	.db #0x38	; 56	'8'
	.db #0xfd	; 253
	.db #0x9a	; 154
	.db #0xf6	; 246
	.db #0xbf	; 191
	.db #0xfc	; 252
	.db #0x87	; 135
	.db #0xfc	; 252
	.db #0xdb	; 219
	.db #0x53	; 83	'S'
	.db #0xfb	; 251
	.db #0xb7	; 183
	.db #0x9b	; 155
	.db #0xdf	; 223
	.db #0x5f	; 95
	.db #0x6e	; 110	'n'
	.db #0x33	; 51	'3'
	.db #0xdf	; 223
	.db #0x89	; 137
	.db #0xdb	; 219
	.db #0xfb	; 251
	.db #0x5e	; 94
	.db #0xca	; 202
	.db #0xfe	; 254
	.db #0xdf	; 223
	.db #0x0e	; 14
	.db #0x96	; 150
	.db #0xcb	; 203
	.db #0x49	; 73	'I'
	.db #0xb7	; 183
	.db #0xfb	; 251
	.db #0xe2	; 226
	.db #0xf1	; 241
	.db #0x7e	; 126
	.db #0xee	; 238
	.db #0xed	; 237
	.db #0xf8	; 248
	.db #0x9d	; 157
	.db #0x07	; 7
	.db #0xc7	; 199
	.db #0xaf	; 175
	.db #0xc7	; 199
	.db #0xeb	; 235
	.db #0xab	; 171
	.db #0xc7	; 199
	.db #0xef	; 239
	.db #0x9b	; 155
	.db #0x97	; 151
	.db #0xa3	; 163
	.db #0x92	; 146
	.db #0xd3	; 211
	.db #0xb3	; 179
	.db #0x64	; 100	'd'
	.db #0x49	; 73	'I'
	.db #0xfe	; 254
	.db #0xb7	; 183
	.db #0xb7	; 183
	.db #0xcf	; 207
	.db #0xab	; 171
	.db #0xb7	; 183
	.db #0xcb	; 203
	.db #0xd1	; 209
	.db #0xe5	; 229
	.db #0xb0	; 176
	.db #0x3f	; 63
	.db #0xd5	; 213
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x23	; 35
	.db #0xfb	; 251
	.db #0xfe	; 254
	.db #0xfa	; 250
	.db #0x41	; 65	'A'
	.db #0xdd	; 221
	.db #0xd7	; 215
	.db #0xbf	; 191
	.db #0xd7	; 215
	.db #0xce	; 206
	.db #0xa3	; 163
	.db #0xd1	; 209
	.db #0x7c	; 124
	.db #0x9f	; 159
	.db #0x48	; 72	'H'
	.db #0xa6	; 166
	.db #0x2b	; 43
	.db #0x7c	; 124
	.db #0x83	; 131
	.db #0xfe	; 254
	.db #0xde	; 222
	.db #0xe3	; 227
	.db #0xf5	; 245
	.db #0x60	; 96
	.db #0xdc	; 220
	.db #0xf1	; 241
	.db #0x83	; 131
	.db #0xd5	; 213
	.db #0xbb	; 187
	.db #0xb3	; 179
	.db #0xab	; 171
	.db #0x9b	; 155
	.db #0x5e	; 94
	.db #0x23	; 35
	.db #0x31	; 49	'1'
	.db #0xbf	; 191
	.db #0xcf	; 207
	.db #0xb5	; 181
	.db #0x9b	; 155
	.db #0xa3	; 163
	.db #0xe0	; 224
	.db #0xfb	; 251
	.db #0xe7	; 231
	.db #0xe6	; 230
	.db #0xd3	; 211
	.db #0xf0	; 240
	.db #0xf9	; 249
	.db #0xfb	; 251
	.db #0xd0	; 208
	.db #0xee	; 238
	.db #0xdf	; 223
	.db #0xb7	; 183
	.db #0x7c	; 124
	.db #0x4e	; 78	'N'
	.db #0x87	; 135
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0x87	; 135
	.db #0xfb	; 251
	.db #0xe0	; 224
	.db #0xef	; 239
	.db #0xd1	; 209
	.db #0xef	; 239
	.db #0xbb	; 187
	.db #0xf1	; 241
	.db #0xfe	; 254
	.db #0xe1	; 225
	.db #0x7e	; 126
	.db #0x3e	; 62
	.db #0xd2	; 210
	.db #0x68	; 104	'h'
	.db #0xff	; 255
	.db #0xfa	; 250
	.db #0xf0	; 240
	.db #0xbf	; 191
	.db #0xc3	; 195
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x48	; 72	'H'
	.db #0xfb	; 251
	.db #0x10	; 16
	.db #0xa1	; 161
	.db #0xef	; 239
	.db #0xdb	; 219
	.db #0x24	; 36
	.db #0x7e	; 126
	.db #0x2e	; 46
	.db #0x02	; 2
	.db #0x29	; 41
	.db #0x7c	; 124
	.db #0xef	; 239
	.db #0xe6	; 230
	.db #0xda	; 218
	.db #0xff	; 255
	.db #0x40	; 64
	.db #0xf3	; 243
	.db #0xf9	; 249
	.db #0xbf	; 191
	.db #0x30	; 48	'0'
	.db #0xbe	; 190
	.db #0xcb	; 203
	.db #0xab	; 171
	.db #0xab	; 171
	.db #0x70	; 112	'p'
	.db #0x8a	; 138
	.db #0x7c	; 124
	.db #0xbb	; 187
	.db #0xef	; 239
	.db #0x46	; 70	'F'
	.db #0xfa	; 250
	.db #0xff	; 255
	.db #0x30	; 48	'0'
	.db #0xff	; 255
	.db #0xa2	; 162
	.db #0x50	; 80	'P'
	.db #0x8f	; 143
	.db #0xb7	; 183
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xb7	; 183
	.db #0x8f	; 143
	.db #0xee	; 238
	.db #0x89	; 137
	.db #0xe5	; 229
	.db #0x8f	; 143
	.db #0xfb	; 251
	.db #0xf3	; 243
	.db #0x7c	; 124
	.db #0xf0	; 240
	.db #0x6e	; 110	'n'
	.db #0x90	; 144
	.db #0xf9	; 249
	.db #0xfa	; 250
	.db #0xb3	; 179
	.db #0xcf	; 207
	.db #0x91	; 145
	.db #0xbb	; 187
	.db #0x4f	; 79	'O'
	.db #0xe1	; 225
	.db #0x22	; 34
	.db #0xf0	; 240
	.db #0xa8	; 168
	.db #0xc7	; 199
	.db #0xc3	; 195
	.db #0x33	; 51	'3'
	.db #0xbb	; 187
	.db #0x86	; 134
	.db #0xd1	; 209
	.db #0xb7	; 183
	.db #0xaf	; 175
	.db #0x9f	; 159
	.db #0xaf	; 175
	.db #0xb7	; 183
	.db #0x3f	; 63
	.db #0xb3	; 179
	.db #0xfe	; 254
	.db #0xb9	; 185
	.db #0x7c	; 124
	.db #0xb1	; 177
	.db #0x9e	; 158
	.db #0x93	; 147
	.db #0xab	; 171
	.db #0xbb	; 187
	.db #0xa1	; 161
	.db #0x19	; 25
	.db #0x9b	; 155
	.db #0x9b	; 155
	.db #0xab	; 171
	.db #0xb3	; 179
	.db #0xb3	; 179
	.db #0xef	; 239
	.db #0xe6	; 230
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x26	; 38
	.db #0x60	; 96
	.db #0xfc	; 252
	.db #0xe0	; 224
	.db #0xbc	; 188
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0xbb	; 187
	.db #0x89	; 137
	.db #0xc7	; 199
	.db #0xfb	; 251
	.db #0xce	; 206
	.db #0x77	; 119	'w'
	.db #0xfe	; 254
	.db #0x3f	; 63
	.db #0x91	; 145
	.db #0xa0	; 160
	.db #0x3e	; 62
	.db #0xf0	; 240
	.db #0x61	; 97	'a'
	.db #0xd7	; 215
	.db #0xd7	; 215
	.db #0xef	; 239
	.db #0x99	; 153
	.db #0xab	; 171
	.db #0xab	; 171
	.db #0xd7	; 215
	.db #0xcb	; 203
	.db #0x20	; 32
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xf0	; 240
	.db #0xb0	; 176
	.db #0xf7	; 247
	.db #0xa1	; 161
	.db #0x44	; 68	'D'
	.db #0xcf	; 207
	.db #0x80	; 128
	.db #0x58	; 88	'X'
	.db #0x5e	; 94
	.db #0xca	; 202
	.db #0x81	; 129
	.db #0xbf	; 191
	.db #0xdb	; 219
	.db #0x1c	; 28
	.db #0x7d	; 125
	.db #0x1b	; 27
	.db #0xe1	; 225
	.db #0x63	; 99	'c'
	.db #0xc0	; 192
	.db #0xec	; 236
	.db #0xe1	; 225
	.db #0xa6	; 166
	.db #0x64	; 100	'd'
	.db #0xfa	; 250
	.db #0xfb	; 251
	.db #0xb1	; 177
	.db #0xc2	; 194
	.db #0xce	; 206
	.db #0xe8	; 232
	.db #0x23	; 35
	.db #0xcd	; 205
	.db #0xc3	; 195
	.db #0x7b	; 123
	.db #0xf7	; 247
	.db #0xa0	; 160
	.db #0xfa	; 250
	.db #0xf7	; 247
	.db #0xe3	; 227
	.db #0xfc	; 252
	.db #0xec	; 236
	.db #0x20	; 32
	.db #0xfa	; 250
	.db #0x17	; 23
	.db #0xd3	; 211
	.db #0xe1	; 225
	.db #0xc3	; 195
	.db #0x1d	; 29
	.db #0xf0	; 240
	.db #0x09	; 9
	.db #0xf1	; 241
	.db #0x8e	; 142
	.db #0x07	; 7
	.db #0xdf	; 223
	.db #0x8f	; 143
	.db #0x4e	; 78	'N'
	.db #0xef	; 239
	.db #0xe0	; 224
	.db #0xd2	; 210
	.db #0xb7	; 183
	.db #0xfb	; 251
	.db #0x88	; 136
	.db #0xd8	; 216
	.db #0xa0	; 160
	.db #0xf7	; 247
	.db #0x75	; 117	'u'
	.db #0xb0	; 176
	.db #0xad	; 173
	.db #0xe7	; 231
	.db #0x72	; 114	'r'
	.db #0xad	; 173
	.db #0xfe	; 254
	.db #0x74	; 116	't'
	.db #0x82	; 130
	.db #0x67	; 103	'g'
	.db #0xdb	; 219
	.db #0xd7	; 215
	.db #0xcf	; 207
	.db #0xd7	; 215
	.db #0xe9	; 233
	.db #0xd1	; 209
	.db #0xef	; 239
	.db #0x38	; 56	'8'
	.db #0xff	; 255
	.db #0x9e	; 158
	.db #0x97	; 151
	.db #0xab	; 171
	.db #0xf0	; 240
	.db #0x8f	; 143
	.db #0xa7	; 167
	.db #0x9b	; 155
	.db #0xa0	; 160
	.db #0xfe	; 254
	.db #0x60	; 96
	.db #0xf3	; 243
	.db #0x8c	; 140
	.db #0xc7	; 199
	.db #0xcf	; 207
	.db #0xfc	; 252
	.db #0x60	; 96
	.db #0x2f	; 47
	.db #0xfb	; 251
	.db #0xc0	; 192
	.db #0xef	; 239
	.db #0x58	; 88	'X'
	.db #0x40	; 64
	.db #0xcb	; 203
	.db #0xfe	; 254
	.db #0x7b	; 123
	.db #0xf1	; 241
	.db #0x71	; 113	'q'
	.db #0x87	; 135
	.db #0xbf	; 191
	.db #0x6a	; 106	'j'
	.db #0x80	; 128
	.db #0xa3	; 163
	.db #0xa2	; 162
	.db #0xb3	; 179
	.db #0xcb	; 203
	.db #0x98	; 152
	.db #0xf0	; 240
	.db #0x93	; 147
	.db #0xd7	; 215
	.db #0xef	; 239
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0xf0	; 240
	.db #0x3f	; 63
	.db #0xfe	; 254
	.db #0xf0	; 240
	.db #0xd8	; 216
	.db #0xe0	; 224
	.db #0xdb	; 219
	.db #0x58	; 88	'X'
	.db #0x2b	; 43
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0x7a	; 122	'z'
	.db #0xb1	; 177
	.db #0x11	; 17
	.db #0xdf	; 223
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0xed	; 237
	.db #0xa1	; 161
	.db #0xcf	; 207
	.db #0xa2	; 162
	.db #0xf1	; 241
	.db #0xf7	; 247
	.db #0x9b	; 155
	.db #0xcf	; 207
	.db #0xeb	; 235
	.db #0xb5	; 181
	.db #0x96	; 150
	.db #0x7f	; 127
	.db #0x62	; 98	'b'
	.db #0x57	; 87	'W'
	.db #0x62	; 98	'b'
	.db #0x69	; 105	'i'
	.db #0xbd	; 189
	.db #0x7e	; 126
	.db #0xd4	; 212
	.db #0x8d	; 141
	.db #0xb5	; 181
	.db #0xc3	; 195
	.db #0xc7	; 199
	.db #0xc2	; 194
	.db #0xa5	; 165
	.db #0x76	; 118	'v'
	.db #0x9b	; 155
	.db #0xc7	; 199
	.db #0x87	; 135
	.db #0xc7	; 199
	.db #0x75	; 117	'u'
	.db #0x85	; 133
	.db #0xc8	; 200
	.db #0x7b	; 123
	.db #0xd9	; 217
	.db #0x97	; 151
	.db #0x7c	; 124
	.db #0xc7	; 199
	.db #0xc2	; 194
	.db #0xc3	; 195
	.db #0x85	; 133
	.db #0x0d	; 13
	.db #0xdd	; 221
	.db #0x9d	; 157
	.db #0xfe	; 254
	.db #0x9f	; 159
	.db #0xfa	; 250
	.db #0x22	; 34
	.db #0xf0	; 240
	.db #0x2f	; 47
	.db #0x9d	; 157
	.db #0xdd	; 221
	.db #0xc0	; 192
	.db #0xfa	; 250
	.db #0x73	; 115	's'
	.db #0xfb	; 251
	.db #0x7c	; 124
	.db #0x7e	; 126
	.db #0xf1	; 241
	.db #0xae	; 174
	.db #0xe8	; 232
	.db #0xa0	; 160
	.db #0xab	; 171
	.db #0xfe	; 254
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xaf	; 175
	.db #0xf8	; 248
	.db #0xfe	; 254
	.db #0x90	; 144
	.db #0xed	; 237
	.db #0x1b	; 27
	.db #0xfc	; 252
	.db #0x5f	; 95
	.db #0x81	; 129
	.db #0x07	; 7
	.db #0x8a	; 138
	.db #0xf1	; 241
	.db #0xcf	; 207
	.db #0x7e	; 126
	.db #0xf8	; 248
	.db #0x7e	; 126
	.db #0x17	; 23
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x9e	; 158
	.db #0xd3	; 211
	.db #0x93	; 147
	.db #0xee	; 238
	.db #0x93	; 147
	.db #0x0c	; 12
	.db #0x3f	; 63
	.db #0x9c	; 156
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xa2	; 162
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xd7	; 215
	.db #0x58	; 88	'X'
	.db #0xf7	; 247
	.db #0xfe	; 254
	.db #0x7e	; 126
	.db #0x61	; 97	'a'
	.db #0xfe	; 254
	.db #0x08	; 8
	.db #0x17	; 23
	.db #0xf7	; 247
	.db #0x17	; 23
	.db #0xd7	; 215
	.db #0xa8	; 168
	.db #0xaf	; 175
	.db #0x23	; 35
	.db #0x5f	; 95
	.db #0xbf	; 191
	.db #0x5f	; 95
	.db #0xaf	; 175
	.db #0xfe	; 254
	.db #0xc0	; 192
	.db #0xd1	; 209
	.db #0xfe	; 254
	.db #0x1a	; 26
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0x78	; 120	'x'
	.db #0x3f	; 63
	.db #0xdf	; 223
	.db #0x2f	; 47
	.db #0xe0	; 224
	.db #0xbe	; 190
	.db #0xf8	; 248
	.db #0xa1	; 161
	.db #0xcc	; 204
	.db #0x26	; 38
	.db #0x2f	; 47
	.db #0xdf	; 223
	.db #0x3f	; 63
	.db #0x7e	; 126
	.db #0x80	; 128
	.db #0xde	; 222
	.db #0xf8	; 248
	.db #0x92	; 146
	.db #0xe6	; 230
	.db #0x77	; 119	'w'
	.db #0xfc	; 252
	.db #0x24	; 36
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x89	; 137
	.db #0xee	; 238
	.db #0xbb	; 187
	.db #0x2f	; 47
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0x5a	; 90	'Z'
	.db #0x7f	; 127
	.db #0x0f	; 15
	.db #0x62	; 98	'b'
	.db #0xfa	; 250
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x28	; 40
	.db #0x1f	; 31
	.db #0x28	; 40
	.db #0xff	; 255
	.db #0xa0	; 160
	.db #0x0f	; 15
	.db #0xa2	; 162
	.db #0xff	; 255
	.db #0x82	; 130
	.db #0xf8	; 248
	.db #0x8a	; 138
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0x0d	; 13
	.db #0xff	; 255
	.db #0x82	; 130
	.db #0xfe	; 254
	.db #0x61	; 97	'a'
	.db #0x80	; 128
	.db #0xf7	; 247
	.db #0xf0	; 240
	.db #0x12	; 18
	.db #0xe9	; 233
	.db #0x42	; 66	'B'
	.db #0xfa	; 250
	.db #0xf6	; 246
	.db #0xee	; 238
	.db #0xde	; 222
	.db #0xbe	; 190
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0xbe	; 190
	.db #0xde	; 222
	.db #0xee	; 238
	.db #0xf6	; 246
	.db #0xfa	; 250
	.db #0x38	; 56	'8'
	.db #0x32	; 50	'2'
	.db #0x5f	; 95
	.db #0xfe	; 254
	.db #0xa5	; 165
	.db #0xfe	; 254
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0x67	; 103	'g'
	.db #0x7d	; 125
	.db #0x6d	; 109	'm'
	.db #0x6d	; 109	'm'
	.db #0xe2	; 226
	.db #0xf0	; 240
	.db #0x5d	; 93
	.db #0xbb	; 187
	.db #0x18	; 24
	.db #0x86	; 134
	.db #0xf2	; 242
	.db #0x7d	; 125
	.db #0x21	; 33
	.db #0x5d	; 93
	.db #0x6d	; 109	'm'
	.db #0xbe	; 190
	.db #0xab	; 171
	.db #0xc3	; 195
	.db #0xe0	; 224
	.db #0x69	; 105	'i'
	.db #0x75	; 117	'u'
	.db #0x3a	; 58
	.db #0xc1	; 193
	.db #0x9e	; 158
	.db #0x4e	; 78	'N'
	.db #0xa1	; 161
	.db #0x9b	; 155
	.db #0x75	; 117	'u'
	.db #0x93	; 147
	.db #0x9d	; 157
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xf1	; 241
	.db #0xfe	; 254
	.db #0xf9	; 249
	.db #0x4a	; 74	'J'
	.db #0xff	; 255
	.db #0x79	; 121	'y'
	.db #0x39	; 57	'9'
	.db #0xe6	; 230
	.db #0xf6	; 246
	.db #0xe6	; 230
	.db #0x69	; 105	'i'
	.db #0x79	; 121	'y'
	.db #0xff	; 255
	.db #0x3d	; 61
	.db #0xa1	; 161
	.db #0xce	; 206
	.db #0xde	; 222
	.db #0xce	; 206
	.db #0xaa	; 170
	.db #0x3d	; 61
	.db #0xff	; 255
	.db #0x77	; 119	'w'
	.db #0x33	; 51	'3'
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0x8a	; 138
	.db #0x77	; 119	'w'
	.db #0xcc	; 204
	.db #0x2a	; 42
	.db #0x77	; 119	'w'
	.db #0xa6	; 166
	.db #0xee	; 238
	.db #0xbf	; 191
	.db #0xfc	; 252
	.db #0xbd	; 189
	.db #0x9a	; 154
	.db #0x7b	; 123
	.db #0x7e	; 126
	.db #0xfb	; 251
	.db #0x1b	; 27
	.db #0xfb	; 251
	.db #0xce	; 206
	.db #0xeb	; 235
	.db #0xdf	; 223
	.db #0xdb	; 219
	.db #0xf5	; 245
	.db #0xf1	; 241
	.db #0xfe	; 254
	.db #0x55	; 85	'U'
	.db #0xd5	; 213
	.db #0x55	; 85	'U'
	.db #0x60	; 96
_g_TilesetCol_Zx0:
	.db #0x96	; 150
	.db #0x11	; 17
	.db #0x2a	; 42
	.db #0x18	; 24
	.db #0x81	; 129
	.db #0x8f	; 143
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x6e	; 110	'n'
	.db #0x88	; 136
	.db #0xff	; 255
	.db #0x22	; 34
	.db #0x86	; 134
	.db #0x81	; 129
	.db #0x7f	; 127
	.db #0x18	; 24
	.db #0x88	; 136
	.db #0x68	; 104	'h'
	.db #0xfd	; 253
	.db #0xf0	; 240
	.db #0x83	; 131
	.db #0x1c	; 28
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xcf	; 207
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xf0	; 240
	.db #0xe2	; 226
	.db #0xfd	; 253
	.db #0xcc	; 204
	.db #0x2c	; 44
	.db #0x3b	; 59
	.db #0xe9	; 233
	.db #0x1c	; 28
	.db #0xbe	; 190
	.db #0xf1	; 241
	.db #0xcc	; 204
	.db #0xf5	; 245
	.db #0xff	; 255
	.db #0x62	; 98	'b'
	.db #0x1c	; 28
	.db #0x15	; 21
	.db #0x51	; 81	'Q'
	.db #0x9f	; 159
	.db #0x5f	; 95
	.db #0xf0	; 240
	.db #0x6e	; 110	'n'
	.db #0x55	; 85	'U'
	.db #0xff	; 255
	.db #0x2a	; 42
	.db #0x54	; 84	'T'
	.db #0x51	; 81	'Q'
	.db #0x15	; 21
	.db #0x8e	; 142
	.db #0x55	; 85	'U'
	.db #0x45	; 69	'E'
	.db #0xf0	; 240
	.db #0x63	; 99	'c'
	.db #0x1a	; 26
	.db #0xa1	; 161
	.db #0xa7	; 167
	.db #0xff	; 255
	.db #0xaf	; 175
	.db #0xd9	; 217
	.db #0xf0	; 240
	.db #0xa0	; 160
	.db #0xaf	; 175
	.db #0xaa	; 170
	.db #0xba	; 186
	.db #0xa2	; 162
	.db #0xba	; 186
	.db #0xa1	; 161
	.db #0x1a	; 26
	.db #0x1a	; 26
	.db #0xab	; 171
	.db #0xab	; 171
	.db #0xa6	; 166
	.db #0xa1	; 161
	.db #0x3a	; 58
	.db #0x1d	; 29
	.db #0xd1	; 209
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0x7d	; 125
	.db #0xf0	; 240
	.db #0xbb	; 187
	.db #0xdd	; 221
	.db #0xff	; 255
	.db #0x6d	; 109	'm'
	.db #0xae	; 174
	.db #0xea	; 234
	.db #0x1d	; 29
	.db #0xf0	; 240
	.db #0xa0	; 160
	.db #0x8d	; 141
	.db #0x8e	; 142
	.db #0x1e	; 30
	.db #0xe1	; 225
	.db #0xfe	; 254
	.db #0x2f	; 47
	.db #0x1e	; 30
	.db #0xf0	; 240
	.db #0x66	; 102	'f'
	.db #0xe1	; 225
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xa0	; 160
	.db #0xef	; 239
	.db #0xeb	; 235
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xa0	; 160
	.db #0xde	; 222
	.db #0xe8	; 232
	.db #0xff	; 255
	.db #0x4f	; 79	'O'
	.db #0xf4	; 244
	.db #0x4f	; 79	'O'
	.db #0xfa	; 250
	.db #0x21	; 33
	.db #0xff	; 255
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x14	; 20
	.db #0xff	; 255
	.db #0xce	; 206
	.db #0xfe	; 254
	.db #0xf6	; 246
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xee	; 238
	.db #0xff	; 255
	.db #0x90	; 144
	.db #0xf6	; 246
	.db #0xf0	; 240
	.db #0xf2	; 242
	.db #0x1f	; 31
	.db #0xfe	; 254
	.db #0x0b	; 11
	.db #0xff	; 255
	.db #0x5f	; 95
	.db #0xe4	; 228
	.db #0x4e	; 78	'N'
	.db #0xb9	; 185
	.db #0xfb	; 251
	.db #0xee	; 238
	.db #0xf0	; 240
	.db #0x69	; 105	'i'
	.db #0xe4	; 228
	.db #0x4f	; 79	'O'
	.db #0xf5	; 245
	.db #0x92	; 146
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0x14	; 20
	.db #0xfe	; 254
	.db #0x41	; 65	'A'
	.db #0xcb	; 203
	.db #0xf6	; 246
	.db #0x41	; 65	'A'
	.db #0xc7	; 199
	.db #0xf0	; 240
	.db #0x92	; 146
	.db #0xc6	; 198
	.db #0xea	; 234
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xf1	; 241
	.db #0x83	; 131
	.db #0x11	; 17
	.db #0x8e	; 142
	.db #0x32	; 50	'2'
	.db #0xf0	; 240
	.db #0x1e	; 30
	.db #0xff	; 255
	.db #0xa8	; 168
	.db #0xff	; 255
	.db #0x11	; 17
	.db #0x7e	; 126
	.db #0xc1	; 193
	.db #0xde	; 222
	.db #0xf5	; 245
	.db #0xf0	; 240
	.db #0xf3	; 243
	.db #0x90	; 144
	.db #0xf4	; 244
	.db #0xa5	; 165
	.db #0xfe	; 254
	.db #0xa8	; 168
	.db #0x1b	; 27
	.db #0x84	; 132
	.db #0x11	; 17
	.db #0x1b	; 27
	.db #0x2a	; 42
	.db #0x17	; 23
	.db #0x21	; 33
	.db #0x11	; 17
	.db #0x17	; 23
	.db #0x0c	; 12
	.db #0xff	; 255
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x33	; 51	'3'
	.db #0xe0	; 224
	.db #0xf7	; 247
	.db #0x61	; 97	'a'
	.db #0xfc	; 252
	.db #0xd2	; 210
	.db #0xfe	; 254
	.db #0x97	; 151
	.db #0x11	; 17
	.db #0xfc	; 252
	.db #0xe8	; 232
	.db #0xc0	; 192
	.db #0xe6	; 230
	.db #0xe0	; 224
	.db #0x8f	; 143
	.db #0xf1	; 241
	.db #0xf9	; 249
	.db #0xd7	; 215
	.db #0xa0	; 160
	.db #0xde	; 222
	.db #0xe0	; 224
	.db #0xb0	; 176
	.db #0x1f	; 31
	.db #0xd0	; 208
	.db #0x4f	; 79	'O'
	.db #0xdf	; 223
	.db #0xdf	; 223
	.db #0xcc	; 204
	.db #0x84	; 132
	.db #0xf7	; 247
	.db #0x44	; 68	'D'
	.db #0x73	; 115	's'
	.db #0x40	; 64
	.db #0xf7	; 247
	.db #0xfb	; 251
	.db #0xfe	; 254
	.db #0xdf	; 223
	.db #0xa0	; 160
	.db #0xf0	; 240
	.db #0x5a	; 90	'Z'
	.db #0xf1	; 241
	.db #0x57	; 87	'W'
	.db #0x8a	; 138
	.db #0xb0	; 176
	.db #0xf1	; 241
	.db #0x0a	; 10
	.db #0xf1	; 241
	.db #0x17	; 23
	.db #0xd3	; 211
	.db #0xe0	; 224
	.db #0xd7	; 215
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0xfa	; 250
	.db #0xf0	; 240
	.db #0xdc	; 220
	.db #0x32	; 50	'2'
	.db #0x3c	; 60
	.db #0x59	; 89	'Y'
	.db #0x93	; 147
	.db #0x50	; 80	'P'
	.db #0x77	; 119	'w'
	.db #0x20	; 32
	.db #0xd7	; 215
	.db #0x30	; 48	'0'
	.db #0xc7	; 199
	.db #0xc0	; 192
	.db #0xd7	; 215
	.db #0x20	; 32
	.db #0xf3	; 243
	.db #0xbb	; 187
	.db #0xf0	; 240
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x37	; 55	'7'
	.db #0x60	; 96
	.db #0x5f	; 95
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xbc	; 188
	.db #0xf1	; 241
	.db #0xa0	; 160
	.db #0x07	; 7
	.db #0xd5	; 213
	.db #0x20	; 32
	.db #0xd6	; 214
	.db #0xf2	; 242
	.db #0x1f	; 31
	.db #0xa5	; 165
	.db #0x93	; 147
	.db #0xe0	; 224
	.db #0xc3	; 195
	.db #0xb0	; 176
	.db #0x90	; 144
	.db #0xe0	; 224
	.db #0xa4	; 164
	.db #0xf1	; 241
	.db #0x74	; 116	't'
	.db #0xc7	; 199
	.db #0xd0	; 208
	.db #0x35	; 53	'5'
	.db #0x5c	; 92
	.db #0xd6	; 214
	.db #0xd0	; 208
	.db #0x07	; 7
	.db #0xd0	; 208
	.db #0xf0	; 240
	.db #0xa1	; 161
	.db #0x1f	; 31
	.db #0x39	; 57	'9'
	.db #0x00	; 0
	.db #0x5e	; 94
	.db #0x70	; 112	'p'
	.db #0x15	; 21
	.db #0xb7	; 183
	.db #0xf1	; 241
	.db #0x00	; 0
	.db #0x43	; 67	'C'
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xf6	; 246
	.db #0x1c	; 28
	.db #0x50	; 80	'P'
	.db #0x4c	; 76	'L'
	.db #0xa0	; 160
	.db #0xd9	; 217
	.db #0xf1	; 241
	.db #0x39	; 57	'9'
	.db #0x70	; 112	'p'
	.db #0xe7	; 231
	.db #0xe2	; 226
	.db #0x9f	; 159
	.db #0xf0	; 240
	.db #0xf2	; 242
	.db #0xfa	; 250
	.db #0xfa	; 250
	.db #0xf1	; 241
	.db #0x78	; 120	'x'
	.db #0xea	; 234
	.db #0xa7	; 167
	.db #0x1f	; 31
	.db #0xfc	; 252
	.db #0x90	; 144
	.db #0xee	; 238
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0x1e	; 30
	.db #0x4e	; 78	'N'
	.db #0x4f	; 79	'O'
	.db #0x0c	; 12
	.db #0x7d	; 125
	.db #0xcf	; 207
	.db #0x5d	; 93
	.db #0x02	; 2
	.db #0xd9	; 217
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0xa1	; 161
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf5	; 245
	.db #0x5e	; 94
	.db #0x93	; 147
	.db #0xd0	; 208
	.db #0x9f	; 159
	.db #0x32	; 50	'2'
	.db #0xf5	; 245
	.db #0xc3	; 195
	.db #0xd0	; 208
	.db #0xbc	; 188
	.db #0xb0	; 176
	.db #0xa0	; 160
	.db #0xe7	; 231
	.db #0xc0	; 192
	.db #0xb8	; 184
	.db #0xf0	; 240
	.db #0xa0	; 160
	.db #0x76	; 118	'v'
	.db #0x40	; 64
	.db #0x7d	; 125
	.db #0xf0	; 240
	.db #0xf1	; 241
	.db #0x64	; 100	'd'
	.db #0xf2	; 242
	.db #0xfe	; 254
	.db #0x97	; 151
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0x77	; 119	'w'
	.db #0xfe	; 254
	.db #0x81	; 129
	.db #0x42	; 66	'B'
	.db #0x38	; 56	'8'
	.db #0x94	; 148
	.db #0xf5	; 245
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0x40	; 64
	.db #0x75	; 117	'u'
	.db #0x24	; 36
	.db #0x40	; 64
	.db #0x74	; 116	't'
	.db #0x77	; 119	'w'
	.db #0x18	; 24
	.db #0x84	; 132
	.db #0xa0	; 160
	.db #0xc3	; 195
	.db #0x60	; 96
	.db #0x53	; 83	'S'
	.db #0x85	; 133
	.db #0xc0	; 192
	.db #0x77	; 119	'w'
	.db #0x52	; 82	'R'
	.db #0x33	; 51	'3'
	.db #0x00	; 0
	.db #0x5f	; 95
	.db #0xf0	; 240
	.db #0xa4	; 164
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xd1	; 209
	.db #0x83	; 131
	.db #0x40	; 64
	.db #0xd5	; 213
	.db #0xfe	; 254
	.db #0x57	; 87	'W'
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0x80	; 128
_g_GameScreen_Zx0:
	.db #0x26	; 38
	.db #0x19	; 25
	.db #0x26	; 38
	.db #0x19	; 25
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x26	; 38
	.db #0x89	; 137
	.db #0x34	; 52	'4'
	.db #0x00	; 0
	.db #0xb8	; 184
	.db #0x33	; 51	'3'
	.db #0xdc	; 220
	.db #0x7a	; 122	'z'
	.db #0xff	; 255
	.db #0x19	; 25
	.db #0xa1	; 161
	.db #0x3b	; 59
	.db #0x79	; 121	'y'
	.db #0xc0	; 192
	.db #0xb9	; 185
	.db #0x3c	; 60
	.db #0xfe	; 254
	.db #0x38	; 56	'8'
	.db #0xc0	; 192
	.db #0x51	; 81	'Q'
	.db #0x8e	; 142
	.db #0x2b	; 43
	.db #0x2e	; 46
	.db #0xfe	; 254
	.db #0xbc	; 188
	.db #0x30	; 48	'0'
	.db #0x40	; 64
	.db #0x19	; 25
	.db #0x94	; 148
	.db #0x35	; 53	'5'
	.db #0x70	; 112	'p'
	.db #0x51	; 81	'Q'
	.db #0x68	; 104	'h'
	.db #0x36	; 54	'6'
	.db #0xf5	; 245
	.db #0xc0	; 192
	.db #0x42	; 66	'B'
	.db #0x95	; 149
	.db #0x37	; 55	'7'
	.db #0x64	; 100	'd'
	.db #0xcd	; 205
	.db #0x31	; 49	'1'
	.db #0x2e	; 46
	.db #0x2c	; 44
	.db #0x2d	; 45
	.db #0x2e	; 46
	.db #0x32	; 50	'2'
	.db #0x80	; 128
	.db #0x09	; 9
	.db #0x95	; 149
	.db #0x70	; 112	'p'
	.db #0x52	; 82	'R'
	.db #0x38	; 56	'8'
	.db #0x6f	; 111	'o'
	.db #0x39	; 57	'9'
	.db #0xc0	; 192
	.db #0x55	; 85	'U'
	.db #0x2d	; 45
	.db #0x3a	; 58
	.db #0x71	; 113	'q'
	.db #0x80	; 128
	.db #0x5d	; 93
	.db #0x77	; 119	'w'
	.db #0x00	; 0
	.db #0xc5	; 197
	.db #0xc0	; 192
	.db #0x19	; 25
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x25	; 37
	.db #0xf8	; 248
	.db #0xee	; 238
	.db #0xed	; 237
	.db #0xe6	; 230
	.db #0xf6	; 246
	.db #0x3f	; 63
	.db #0xe0	; 224
	.db #0xfb	; 251
	.db #0xf8	; 248
	.db #0xe6	; 230
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0x80	; 128
_g_PuyoPat:
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x30	; 48	'0'
	.db #0x38	; 56	'8'
	.db #0x24	; 36
	.db #0x26	; 38
	.db #0x1c	; 28
	.db #0xe0	; 224
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0x0c	; 12
	.db #0x1c	; 28
	.db #0x24	; 36
	.db #0x64	; 100	'd'
	.db #0x38	; 56	'8'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xc0	; 192
	.db #0x07	; 7
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x0c	; 12
	.db #0x1e	; 30
	.db #0x22	; 34
	.db #0x22	; 34
	.db #0x22	; 34
	.db #0xe0	; 224
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x1c	; 28
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x38	; 56	'8'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xc0	; 192
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x1c	; 28
	.db #0x22	; 34
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0xe0	; 224
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x38	; 56	'8'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x1c	; 28
	.db #0x22	; 34
	.db #0x22	; 34
	.db #0x22	; 34
	.db #0xe0	; 224
	.db #0xf8	; 248
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x1c	; 28
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x38	; 56	'8'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x22	; 34
	.db #0x1c	; 28
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0x3b	; 59
	.db #0x7f	; 127
	.db #0xe7	; 231
	.db #0xdb	; 219
	.db #0xda	; 218
	.db #0xcb	; 203
	.db #0xc3	; 195
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xe7	; 231
	.db #0xdb	; 219
	.db #0xdb	; 219
	.db #0xcb	; 203
	.db #0xc3	; 195
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xbe	; 190
	.db #0xff	; 255
	.db #0x77	; 119	'w'
	.db #0x3f	; 63
	.db #0x1e	; 30
	.db #0xe7	; 231
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf6	; 246
	.db #0xfc	; 252
	.db #0xf8	; 248
_g_PuyoCol:
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xfc	; 252
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0x51	; 81	'Q'
	.db #0x51	; 81	'Q'
	.db #0x51	; 81	'Q'
	.db #0x51	; 81	'Q'
	.db #0xf5	; 245
	.db #0xf5	; 245
	.db #0xf5	; 245
	.db #0xf5	; 245
	.db #0x51	; 81	'Q'
	.db #0x51	; 81	'Q'
	.db #0x51	; 81	'Q'
	.db #0x51	; 81	'Q'
	.db #0xf5	; 245
	.db #0xf5	; 245
	.db #0xf5	; 245
	.db #0xf5	; 245
	.db #0x51	; 81	'Q'
	.db #0x51	; 81	'Q'
	.db #0x51	; 81	'Q'
	.db #0x51	; 81	'Q'
	.db #0x51	; 81	'Q'
	.db #0x51	; 81	'Q'
	.db #0x51	; 81	'Q'
	.db #0x51	; 81	'Q'
	.db #0x51	; 81	'Q'
	.db #0x51	; 81	'Q'
	.db #0x51	; 81	'Q'
	.db #0x51	; 81	'Q'
	.db #0x51	; 81	'Q'
	.db #0x51	; 81	'Q'
	.db #0x51	; 81	'Q'
	.db #0x51	; 81	'Q'
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xfa	; 250
	.db #0xfa	; 250
	.db #0xfa	; 250
	.db #0xfa	; 250
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xfa	; 250
	.db #0xfa	; 250
	.db #0xfa	; 250
	.db #0xfa	; 250
	.db #0xfa	; 250
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xfa	; 250
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xd1	; 209
	.db #0xd1	; 209
	.db #0xd1	; 209
	.db #0xd1	; 209
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0xd1	; 209
	.db #0xd1	; 209
	.db #0xd1	; 209
	.db #0xd1	; 209
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0xd1	; 209
	.db #0xd1	; 209
	.db #0xd1	; 209
	.db #0xd1	; 209
	.db #0xd1	; 209
	.db #0xd1	; 209
	.db #0xd1	; 209
	.db #0xd1	; 209
	.db #0xd1	; 209
	.db #0xd1	; 209
	.db #0xd1	; 209
	.db #0xd1	; 209
	.db #0xd1	; 209
	.db #0xd1	; 209
	.db #0xd1	; 209
	.db #0xd1	; 209
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
_g_PupilSprite:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x18	; 24
_g_PatEmptyTile:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_PatWallTile:
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xbd	; 189
	.db #0xa5	; 165
	.db #0xa5	; 165
	.db #0xbd	; 189
	.db #0x81	; 129
	.db #0xff	; 255
_g_PatExplode:
	.db #0x08	; 8
	.db #0x49	; 73	'I'
	.db #0x2a	; 42
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x2a	; 42
	.db #0x49	; 73	'I'
	.db #0x08	; 8
_g_WallColor:
	.db #0xf4	; 244
_g_EmptyColor:
	.db #0x11	; 17
_g_Font_MGL_Sample8:
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0xbf	; 191
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x42	; 66	'B'
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xc9	; 201
	.db #0xc9	; 201
	.db #0xc1	; 193
	.db #0x80	; 128
	.db #0x94	; 148
	.db #0x94	; 148
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x8f	; 143
	.db #0xe3	; 227
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x72	; 114	'r'
	.db #0x22	; 34
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x22	; 34
	.db #0x72	; 114	'r'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x69	; 105	'i'
	.db #0x89	; 137
	.db #0xa9	; 169
	.db #0x6d	; 109	'm'
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x42	; 66	'B'
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x82	; 130
	.db #0x8a	; 138
	.db #0xaa	; 170
	.db #0x92	; 146
	.db #0x82	; 130
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0xba	; 186
	.db #0xa2	; 162
	.db #0xba	; 186
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x12	; 18
	.db #0x31	; 49	'1'
	.db #0xf5	; 245
	.db #0xf5	; 245
	.db #0xf5	; 245
	.db #0x31	; 49	'1'
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0xf5	; 245
	.db #0xf2	; 242
	.db #0xf5	; 245
	.db #0x30	; 48	'0'
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x42	; 66	'B'
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x7e	; 126
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x7e	; 126
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x50	; 80	'P'
	.db #0x38	; 56	'8'
	.db #0x14	; 20
	.db #0x54	; 84	'T'
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x64	; 100	'd'
	.db #0x68	; 104	'h'
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x2c	; 44
	.db #0x4c	; 76	'L'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x30	; 48	'0'
	.db #0x54	; 84	'T'
	.db #0x48	; 72	'H'
	.db #0x34	; 52	'4'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x7c	; 124
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x4c	; 76	'L'
	.db #0x54	; 84	'T'
	.db #0x64	; 100	'd'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0x50	; 80	'P'
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x04	; 4
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x04	; 4
	.db #0x18	; 24
	.db #0x04	; 4
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x48	; 72	'H'
	.db #0x7c	; 124
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x40	; 64
	.db #0x78	; 120	'x'
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x40	; 64
	.db #0x78	; 120	'x'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x3c	; 60
	.db #0x04	; 4
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x04	; 4
	.db #0x34	; 52	'4'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x78	; 120	'x'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x48	; 72	'H'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x48	; 72	'H'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x70	; 112	'p'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x70	; 112	'p'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x4c	; 76	'L'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x48	; 72	'H'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x48	; 72	'H'
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x48	; 72	'H'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x6c	; 108	'l'
	.db #0x54	; 84	'T'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x64	; 100	'd'
	.db #0x64	; 100	'd'
	.db #0x54	; 84	'T'
	.db #0x4c	; 76	'L'
	.db #0x4c	; 76	'L'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x78	; 120	'x'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x54	; 84	'T'
	.db #0x48	; 72	'H'
	.db #0x34	; 52	'4'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x78	; 120	'x'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x40	; 64
	.db #0x38	; 56	'8'
	.db #0x04	; 4
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x04	; 4
	.db #0x3c	; 60
	.db #0x44	; 68	'D'
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x78	; 120	'x'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x40	; 64
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x3c	; 60
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
	.db #0x40	; 64
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x20	; 32
	.db #0x70	; 112	'p'
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x3c	; 60
	.db #0x04	; 4
	.db #0x78	; 120	'x'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x78	; 120	'x'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x48	; 72	'H'
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x24	; 36
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x58	; 88	'X'
	.db #0x64	; 100	'd'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x78	; 120	'x'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x3c	; 60
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x58	; 88	'X'
	.db #0x64	; 100	'd'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x40	; 64
	.db #0x38	; 56	'8'
	.db #0x04	; 4
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x78	; 120	'x'
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x4c	; 76	'L'
	.db #0x34	; 52	'4'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x54	; 84	'T'
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x3c	; 60
	.db #0x04	; 4
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x42	; 66	'B'
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x20	; 32
	.db #0x30	; 48	'0'
	.db #0x38	; 56	'8'
	.db #0x3c	; 60
	.db #0x38	; 56	'8'
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x38	; 56	'8'
	.db #0x78	; 120	'x'
	.db #0x38	; 56	'8'
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x22	; 34
	.db #0x62	; 98	'b'
	.db #0xfe	; 254
	.db #0x60	; 96
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x62	; 98	'b'
	.db #0xfe	; 254
	.db #0x62	; 98	'b'
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x7c	; 124
	.db #0x10	; 16
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x10	; 16
	.db #0x7c	; 124
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x7c	; 124
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0x7e	; 126
	.db #0xfe	; 254
	.db #0x7e	; 126
	.db #0x30	; 48	'0'
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x42	; 66	'B'
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x6c	; 108	'l'
	.db #0xee	; 238
	.db #0x6c	; 108	'l'
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x42	; 66	'B'
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0xef	; 239
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xef	; 239
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0xe8	; 232
	.db #0x08	; 8
	.db #0xe8	; 232
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x5f	; 95
	.db #0x40	; 64
	.db #0x5f	; 95
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0xef	; 239
	.db #0x00	; 0
	.db #0xef	; 239
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x2f	; 47
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xe8	; 232
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x2f	; 47
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0xe8	; 232
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x88	; 136
	.db #0x22	; 34
	.db #0x88	; 136
	.db #0x22	; 34
	.db #0x88	; 136
	.db #0x22	; 34
	.db #0x88	; 136
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0xee	; 238
	.db #0xbb	; 187
	.db #0xee	; 238
	.db #0xbb	; 187
	.db #0xee	; 238
	.db #0xbb	; 187
	.db #0xee	; 238
	.db #0xbb	; 187
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x42	; 66	'B'
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x42	; 66	'B'
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x09	; 9
	.db #0x11	; 17
	.db #0x21	; 33
	.db #0x41	; 65	'A'
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x41	; 65	'A'
	.db #0x21	; 33
	.db #0x11	; 17
	.db #0x09	; 9
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x82	; 130
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x54	; 84	'T'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x82	; 130
	.db #0x92	; 146
	.db #0xa2	; 162
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x82	; 130
	.db #0xf2	; 242
	.db #0x82	; 130
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0xa2	; 162
	.db #0x92	; 146
	.db #0x82	; 130
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x54	; 84	'T'
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x82	; 130
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x8a	; 138
	.db #0x92	; 146
	.db #0x82	; 130
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x82	; 130
	.db #0x9e	; 158
	.db #0x82	; 130
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x82	; 130
	.db #0x92	; 146
	.db #0x8a	; 138
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x6c	; 108	'l'
	.db #0x6c	; 108	'l'
	.db #0x6c	; 108	'l'
	.db #0x6c	; 108	'l'
	.db #0x6c	; 108	'l'
	.db #0x6c	; 108	'l'
	.db #0x6c	; 108	'l'
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x86	; 134
	.db #0xc6	; 198
	.db #0xe6	; 230
	.db #0xf6	; 246
	.db #0xe6	; 230
	.db #0xc6	; 198
	.db #0x86	; 134
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0xc6	; 198
	.db #0xce	; 206
	.db #0xde	; 222
	.db #0xce	; 206
	.db #0xc6	; 198
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0xcc	; 204
	.db #0xee	; 238
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x33	; 51	'3'
	.db #0x77	; 119	'w'
	.db #0xff	; 255
	.db #0x77	; 119	'w'
	.db #0x33	; 51	'3'
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xfc	; 252
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x84	; 132
	.db #0x7e	; 126
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xce	; 206
	.db #0x14	; 20
	.db #0x20	; 32
	.db #0x24	; 36
	.db #0xce	; 206
	.db #0x04	; 4
	.db #0x00	; 0
_Game_GetSatX_dx_65536_605:
	.db #0x00	;  0
	.db #0x01	;  1
	.db #0x00	;  0
	.db #0xff	; -1
;./puyopuyo.c:321: static i8 Game_GetSatY(u8 dir) {
;	---------------------------------
; Function Game_GetSatY
; ---------------------------------
_Game_GetSatY:
	ld	c, a
;./puyopuyo.c:323: return dy[dir];
	ld	hl, #_Game_GetSatY_dy_65536_607
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
;./puyopuyo.c:324: }
	ret
_Game_GetSatY_dy_65536_607:
	.db #0xff	; -1
	.db #0x00	;  0
	.db #0x01	;  1
	.db #0x00	;  0
;./puyopuyo.c:326: static void WaitFrames(u8 count) {
;	---------------------------------
; Function WaitFrames
; ---------------------------------
_WaitFrames:
	ld	c, a
;./puyopuyo.c:327: while (count > 0) { Halt(); count--; }
00101$:
	ld	a, c
	or	a, a
	ret	Z
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/system.h:145: inline void Halt() { __asm__("halt"); }
	halt
;./puyopuyo.c:327: while (count > 0) { Halt(); count--; }
	dec	c
;./puyopuyo.c:328: }
	jp	00101$
;./puyopuyo.c:339: void VDP_InterruptHandler(void) {
;	---------------------------------
; Function VDP_InterruptHandler
; ---------------------------------
_VDP_InterruptHandler::
;./puyopuyo.c:340: PT3_UpdatePSG();
	call	_PT3_UpdatePSG
;./puyopuyo.c:341: PT3_Decode();
;./puyopuyo.c:342: }
	jp	_PT3_Decode
;./puyopuyo.c:344: static void TitleMusic_Start(void) {
;	---------------------------------
; Function TitleMusic_Start
; ---------------------------------
_TitleMusic_Start:
;./puyopuyo.c:345: PT3_Pause();
	call	_PT3_Pause
;./puyopuyo.c:346: PT3_SetNoteTable(PT3_NT2);
	ld	hl, #_PT3_NT2+0
	ld	(_PT3_NoteTable), hl
;./puyopuyo.c:347: PT3_Init();
	call	_PT3_Init
;./puyopuyo.c:348: ZX0_UnpackToRAM(g_MusicTitle_Zx0, g_PT3Buffer);
	ld	de, #_g_PT3Buffer
	ld	hl, #_g_MusicTitle_Zx0
	call	_ZX0_UnpackToRAM
;./puyopuyo.c:349: PT3_InitSong(g_PT3Buffer);
	ld	hl, #_g_PT3Buffer
	call	_PT3_InitSong
;./puyopuyo.c:350: PT3_SetLoop(TRUE);
	ld	a, #0x01
	call	_PT3_SetLoop
;./puyopuyo.c:351: PT3_Resume();
;./puyopuyo.c:352: }
	jp	_PT3_Resume
;./puyopuyo.c:354: static void TitleMusic_Update(void) {
;	---------------------------------
; Function TitleMusic_Update
; ---------------------------------
_TitleMusic_Update:
;./puyopuyo.c:355: }
	ret
;./puyopuyo.c:361: static void Music_Start(void) {
;	---------------------------------
; Function Music_Start
; ---------------------------------
_Music_Start:
;./puyopuyo.c:362: PT3_Pause();
	call	_PT3_Pause
;./puyopuyo.c:363: PT3_SetNoteTable(PT3_NT2);
	ld	hl, #_PT3_NT2+0
	ld	(_PT3_NoteTable), hl
;./puyopuyo.c:364: PT3_Init();
	call	_PT3_Init
;./puyopuyo.c:365: ZX0_UnpackToRAM(g_MusicGame_Zx0, g_PT3Buffer);
	ld	de, #_g_PT3Buffer
	ld	hl, #_g_MusicGame_Zx0
	call	_ZX0_UnpackToRAM
;./puyopuyo.c:366: PT3_InitSong(g_PT3Buffer);
	ld	hl, #_g_PT3Buffer
	call	_PT3_InitSong
;./puyopuyo.c:367: PT3_SetLoop(TRUE);
	ld	a, #0x01
	call	_PT3_SetLoop
;./puyopuyo.c:368: PT3_Resume();
;./puyopuyo.c:369: }
	jp	_PT3_Resume
;./puyopuyo.c:371: static void Music_Stop(void) {
;	---------------------------------
; Function Music_Stop
; ---------------------------------
_Music_Stop:
;./puyopuyo.c:372: PT3_Pause();
	call	_PT3_Pause
;./puyopuyo.c:373: PT3_Silence();
;./puyopuyo.c:374: }
	jp	_PT3_Silence
;./puyopuyo.c:376: static void Music_Update(void) {
;	---------------------------------
; Function Music_Update
; ---------------------------------
_Music_Update:
;./puyopuyo.c:377: }
	ret
;./puyopuyo.c:384: static void SFX_Update(void) {}
;	---------------------------------
; Function SFX_Update
; ---------------------------------
_SFX_Update:
	ret
;./puyopuyo.c:385: static void SFX_Drop(void) {}
;	---------------------------------
; Function SFX_Drop
; ---------------------------------
_SFX_Drop:
	ret
;./puyopuyo.c:386: static void SFX_Clear(void) {}
;	---------------------------------
; Function SFX_Clear
; ---------------------------------
_SFX_Clear:
	ret
;./puyopuyo.c:387: static void SFX_Chain(u8 chain) { chain; }
;	---------------------------------
; Function SFX_Chain
; ---------------------------------
_SFX_Chain:
	ret
;./puyopuyo.c:388: static void SFX_Garbage(void) {}
;	---------------------------------
; Function SFX_Garbage
; ---------------------------------
_SFX_Garbage:
	ret
;./puyopuyo.c:389: static void SFX_GarbageReceive(void) {}
;	---------------------------------
; Function SFX_GarbageReceive
; ---------------------------------
_SFX_GarbageReceive:
	ret
;./puyopuyo.c:390: static void SFX_Victory(void) {
;	---------------------------------
; Function SFX_Victory
; ---------------------------------
_SFX_Victory:
;./puyopuyo.c:391: WaitFrames(30);
	ld	a, #0x1e
;./puyopuyo.c:392: }
	jp	_WaitFrames
;./puyopuyo.c:398: static void VDP_Setup(void) {
;	---------------------------------
; Function VDP_Setup
; ---------------------------------
_VDP_Setup:
;./puyopuyo.c:402: VDP_SetMode(VDP_MODE_GRAPHIC2);
	ld	a, #0x03
	call	_VDP_SetMode
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:721: inline void VDP_SetColor(u8 color) { VDP_RegWrite(7, color); }
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x07
	call	_VDP_RegWrite
;./puyopuyo.c:404: VDP_ClearVRAM();
	call	_VDP_ClearVRAM
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:714: inline void VDP_EnableVBlank(bool enable) { VDP_RegWriteBakMask(1, (u8)~R01_IE0, enable ? R01_IE0 : 0); }
	ld	a, #0x20
	push	af
	inc	sp
	ld	l, #0xdf
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_VDP_RegWriteBakMask
;./puyopuyo.c:406: VDP_DisableSpritesFrom(0);
	xor	a, a
	call	_VDP_DisableSpritesFrom
;./puyopuyo.c:409: Print_SetTextFont(g_Font_MGL_Sample8, 32);
	ld	a, #0x20
	push	af
	inc	sp
	ld	hl, #_g_Font_MGL_Sample8
	call	_Print_SetTextFont
;./puyopuyo.c:410: Print_SetColor(COLOR_WHITE, COLOR_BLACK);
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0f
	call	_Print_SetColor
;./puyopuyo.c:414: ZX0_UnpackToRAM(g_TilesetPat_Zx0, g_PT3Buffer);
	ld	de, #_g_PT3Buffer
	ld	hl, #_g_TilesetPat_Zx0
	call	_ZX0_UnpackToRAM
;./puyopuyo.c:415: for (bank = 0; bank < 3; bank++) {
	ld	c, #0x00
00105$:
;./puyopuyo.c:416: patBase = g_ScreenPatternLow + (bank * 0x800);
	ld	a, c
	add	a, a
	add	a, a
	add	a, a
	ld	d, a
	ld	e, #0x00
	ld	hl, (_g_ScreenPatternLow)
	add	hl, de
;./puyopuyo.c:417: VDP_WriteVRAM_16K(g_PT3Buffer, patBase, 2048);
	push	bc
	ex	de, hl
	ld	hl, #0x0800
	push	hl
	ld	hl, #_g_PT3Buffer
	call	_VDP_WriteVRAM_16K
	pop	bc
;./puyopuyo.c:415: for (bank = 0; bank < 3; bank++) {
	inc	c
	ld	a, c
	sub	a, #0x03
	jr	C, 00105$
;./puyopuyo.c:421: ZX0_UnpackToRAM(g_TilesetCol_Zx0, g_PT3Buffer);
	ld	de, #_g_PT3Buffer
	ld	hl, #_g_TilesetCol_Zx0
	call	_ZX0_UnpackToRAM
;./puyopuyo.c:422: for (bank = 0; bank < 3; bank++) {
	ld	c, #0x00
00107$:
;./puyopuyo.c:423: colBase = g_ScreenColorLow + (bank * 0x800);
	ld	a, c
	add	a, a
	add	a, a
	add	a, a
	ld	d, a
	ld	e, #0x00
	ld	hl, (_g_ScreenColorLow)
	add	hl, de
;./puyopuyo.c:424: VDP_WriteVRAM_16K(g_PT3Buffer, colBase, 2048);
	push	bc
	ex	de, hl
	ld	hl, #0x0800
	push	hl
	ld	hl, #_g_PT3Buffer
	call	_VDP_WriteVRAM_16K
	pop	bc
;./puyopuyo.c:422: for (bank = 0; bank < 3; bank++) {
	inc	c
	ld	a, c
	sub	a, #0x03
	jr	C, 00107$
;./puyopuyo.c:426: }
	ret
;./puyopuyo.c:433: static void DrawPuyo16(u8 tx, u8 ty, u8 color) {
;	---------------------------------
; Function DrawPuyo16
; ---------------------------------
_DrawPuyo16:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-11
	add	iy, sp
	ld	sp, iy
	ld	e, a
;./puyopuyo.c:437: VDP_Poke_GM2(tx,     ty,     g_ScreenLayout[ty * 32 + tx]);
	ld	-11 (ix), l
	ld	-10 (ix), #0x00
	ld	c, e
	ld	b, #0x00
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	iy, (_g_ScreenLayoutLow)
;./puyopuyo.c:438: VDP_Poke_GM2(tx + 1, ty,     g_ScreenLayout[ty * 32 + tx + 1]);
	ld	a, e
;./puyopuyo.c:439: VDP_Poke_GM2(tx,     ty + 1, g_ScreenLayout[(ty + 1) * 32 + tx]);
;./puyopuyo.c:437: VDP_Poke_GM2(tx,     ty,     g_ScreenLayout[ty * 32 + tx]);
	pop	de
	ex	de, hl
	push	hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	-9 (ix), c
	ld	-8 (ix), b
;./puyopuyo.c:438: VDP_Poke_GM2(tx + 1, ty,     g_ScreenLayout[ty * 32 + tx + 1]);
	inc	a
	ld	-7 (ix), a
;./puyopuyo.c:439: VDP_Poke_GM2(tx,     ty + 1, g_ScreenLayout[(ty + 1) * 32 + tx]);
	ld	a, l
	inc	a
	ld	-6 (ix), a
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	-5 (ix), e
	ld	-4 (ix), d
	push	iy
	ld	a, -13 (ix)
	pop	iy
	add	a, -5 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	iy
	ld	a, -12 (ix)
	pop	iy
	adc	a, -4 (ix)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -9 (ix)
	add	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -8 (ix)
	adc	a, h
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	-3 (ix), l
	ld	-2 (ix), h
;./puyopuyo.c:435: if (color == PUYO_EMPTY || color > PUYO_GARBAGE) {
	ld	a, 4 (ix)
	or	a, a
	jr	Z, 00101$
	ld	a, #0x06
	sub	a, 4 (ix)
	jp	NC, 00102$
00101$:
;./puyopuyo.c:437: VDP_Poke_GM2(tx,     ty,     g_ScreenLayout[ty * 32 + tx]);
	ld	l, c
	ld	h, b
	add	hl, de
	ld	a, #<(_g_ScreenLayout)
	add	a, l
	ld	e, a
	ld	a, #>(_g_ScreenLayout)
	adc	a, h
	ld	d, a
	ld	a, (de)
	ld	-1 (ix), a
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	push	hl
	push	bc
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	ld	a, -1 (ix)
	call	_VDP_Poke_16K
	pop	bc
	pop	hl
;./puyopuyo.c:438: VDP_Poke_GM2(tx + 1, ty,     g_ScreenLayout[ty * 32 + tx + 1]);
	inc	hl
	ld	de, #_g_ScreenLayout
	add	hl, de
	ld	l, (hl)
;	spillPairReg hl
	ld	h, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	iy, (_g_ScreenLayoutLow)
	ld	e, -5 (ix)
	ld	d, -4 (ix)
	add	iy, de
	ld	e, h
	ld	d, #0x00
	add	iy, de
	push	iy
	pop	de
	push	bc
	ld	a, l
	call	_VDP_Poke_16K
	pop	bc
;./puyopuyo.c:439: VDP_Poke_GM2(tx,     ty + 1, g_ScreenLayout[(ty + 1) * 32 + tx]);
	pop	hl
	push	hl
	inc	hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_g_ScreenLayout
	add	hl, bc
	ld	a, (hl)
	ld	-1 (ix), a
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, (_g_ScreenLayoutLow)
	add	hl, de
	ld	e, -9 (ix)
	ld	d, -8 (ix)
	add	hl, de
	push	bc
	ex	de, hl
	ld	a, -1 (ix)
	call	_VDP_Poke_16K
	pop	bc
;./puyopuyo.c:440: VDP_Poke_GM2(tx + 1, ty + 1, g_ScreenLayout[(ty + 1) * 32 + tx + 1]);
	inc	bc
	ld	hl, #_g_ScreenLayout
	add	hl, bc
	ld	a, (hl)
	ld	-1 (ix), a
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	c, -7 (ix)
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, (_g_ScreenLayoutLow)
	add	hl, de
	ld	b, #0x00
	add	hl, bc
	ex	de, hl
	ld	a, -1 (ix)
	call	_VDP_Poke_16K
;./puyopuyo.c:440: VDP_Poke_GM2(tx + 1, ty + 1, g_ScreenLayout[(ty + 1) * 32 + tx + 1]);
	jp	00113$
00102$:
;./puyopuyo.c:442: base = PAT_PUYO_BASE + (color - 1) * 4;
	ld	a, 4 (ix)
	dec	a
	add	a, a
	add	a, a
	ld	c, a
	inc	c
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	ld	a, c
	call	_VDP_Poke_16K
;./puyopuyo.c:444: VDP_Poke_GM2(tx + 1, ty,     base + 1);  // TR
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	inc	l
	ld	e, -7 (ix)
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	iy, (_g_ScreenLayoutLow)
	push	bc
	ld	c, -5 (ix)
	ld	b, -4 (ix)
	add	iy, bc
	pop	bc
	ld	d, #0x00
	add	iy, de
	push	iy
	pop	de
	ld	a, l
	call	_VDP_Poke_16K
;./puyopuyo.c:445: VDP_Poke_GM2(tx,     ty + 1, base + 2);  // BL
	ld	b, c
	inc	b
	inc	b
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, (_g_ScreenLayoutLow)
	add	hl, de
	ld	e, -9 (ix)
	ld	d, -8 (ix)
	add	hl, de
	ex	de, hl
	ld	a, b
	call	_VDP_Poke_16K
;./puyopuyo.c:446: VDP_Poke_GM2(tx + 1, ty + 1, base + 3);  // BR
	ld	a, c
	add	a, #0x03
	ld	-1 (ix), a
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	c, -7 (ix)
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, (_g_ScreenLayoutLow)
	add	hl, de
	ld	b, #0x00
	add	hl, bc
	ex	de, hl
	ld	a, -1 (ix)
	call	_VDP_Poke_16K
;./puyopuyo.c:446: VDP_Poke_GM2(tx + 1, ty + 1, base + 3);  // BR
00113$:
;./puyopuyo.c:448: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;./puyopuyo.c:451: static void RestoreTile(u8 tx, u8 ty) {
;	---------------------------------
; Function RestoreTile
; ---------------------------------
_RestoreTile:
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ld	c, a
	ld	e, l
;./puyopuyo.c:452: VDP_Poke_GM2(tx, ty, g_ScreenLayout[ty * 32 + tx]);
	ld	d, #0x00
	ex	de, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	b, #0x00
	ld	l, e
	ld	h, d
	add	hl, bc
	ld	a, #<(_g_ScreenLayout)
	add	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>(_g_ScreenLayout)
	adc	a, h
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (hl)
	ld	-1 (ix), a
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	hl, (_g_ScreenLayoutLow)
	add	hl, de
	add	hl, bc
	ex	de, hl
	ld	a, -1 (ix)
	call	_VDP_Poke_16K
;./puyopuyo.c:452: VDP_Poke_GM2(tx, ty, g_ScreenLayout[ty * 32 + tx]);
;./puyopuyo.c:453: }
	inc	sp
	pop	ix
	ret
;./puyopuyo.c:455: static void Shadow_Invalidate(void) {
;	---------------------------------
; Function Shadow_Invalidate
; ---------------------------------
_Shadow_Invalidate:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;./puyopuyo.c:457: for (p = 0; p < 2; p++) {
	ld	c, #0x00
;./puyopuyo.c:458: for (y = 0; y < BOARD_H; y++)
00114$:
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ex	de, hl
	ld	hl, #_g_Shadow
	add	hl, de
	ex	de, hl
	ld	b, #0x00
;./puyopuyo.c:459: for (x = 0; x < BOARD_W; x++)
00112$:
	push	de
	ld	a, b
	ld	e, a
	add	a, a
	add	a, e
	add	a, a
	pop	de
	add	a, e
	ld	-3 (ix), a
	ld	a, #0x00
	adc	a, d
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
00104$:
;./puyopuyo.c:460: g_Shadow[p][y][x] = 0xFF;
	ld	a, -3 (ix)
	add	a, -1 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -2 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), #0xff
;./puyopuyo.c:459: for (x = 0; x < BOARD_W; x++)
	inc	-1 (ix)
	ld	a, -1 (ix)
	sub	a, #0x06
	jr	C, 00104$
;./puyopuyo.c:458: for (y = 0; y < BOARD_H; y++)
	inc	b
	ld	a, b
	sub	a, #0x0b
	jr	C, 00112$
;./puyopuyo.c:461: g_ShadowNext[p][0] = 0xFF;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	de, #_g_ShadowNext
	add	hl, de
	ld	(hl), #0xff
;./puyopuyo.c:462: g_ShadowNext[p][1] = 0xFF;
	inc	hl
	ld	(hl), #0xff
;./puyopuyo.c:463: g_PrevFallX1[p] = 0xFF; g_PrevFallY1[p] = 0xFF;
	ld	hl, #_g_PrevFallX1
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0xff
	ld	hl, #_g_PrevFallY1
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0xff
;./puyopuyo.c:464: g_PrevFallX2[p] = 0xFF; g_PrevFallY2[p] = 0xFF;
	ld	hl, #_g_PrevFallX2
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0xff
	ld	hl, #_g_PrevFallY2
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0xff
;./puyopuyo.c:465: g_PrevSubY[p] = 0;
	ld	hl, #_g_PrevSubY
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;./puyopuyo.c:457: for (p = 0; p < 2; p++) {
	inc	c
	ld	a, c
	sub	a, #0x02
	jp	C, 00114$
;./puyopuyo.c:467: }
	ld	sp, ix
	pop	ix
	ret
;./puyopuyo.c:470: static void DrawPuyoSub(u8 tx, u8 ty, u8 color) {
;	---------------------------------
; Function DrawPuyoSub
; ---------------------------------
_DrawPuyoSub:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-11
	add	iy, sp
	ld	sp, iy
	ld	-1 (ix), a
	ld	-2 (ix), l
;./puyopuyo.c:472: if (color == PUYO_EMPTY || color > PUYO_GARBAGE) return;
	ld	a, 4 (ix)
	or	a, a
	jp	Z,00108$
	ld	a, #0x06
	sub	a, 4 (ix)
	jp	C,00108$
;./puyopuyo.c:473: base = PAT_PUYO_BASE + (color - 1) * 4;
	ld	a, 4 (ix)
	dec	a
	add	a, a
	add	a, a
	inc	a
;./puyopuyo.c:475: VDP_Poke_GM2(tx,     ty,     base + 2);  // BL at top
	ld	-11 (ix), a
	ld	-10 (ix), a
	add	a, #0x02
	ld	-9 (ix), a
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	a, -2 (ix)
	ld	-4 (ix), a
	ld	-3 (ix), #0x00
	ld	b, #0x05
00115$:
	sla	-4 (ix)
	rl	-3 (ix)
	djnz	00115$
	ld	hl, (_g_ScreenLayoutLow)
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	a, -4 (ix)
	ld	-6 (ix), a
	ld	a, -3 (ix)
	ld	-5 (ix), a
	ld	a, -8 (ix)
	add	a, -6 (ix)
	ld	-4 (ix), a
	ld	a, -7 (ix)
	adc	a, -5 (ix)
	ld	-3 (ix), a
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -4 (ix)
	add	a, l
	ld	e, a
	ld	a, -3 (ix)
	adc	a, h
	ld	d, a
	push	hl
	ld	a, -9 (ix)
	call	_VDP_Poke_16K
	pop	hl
;./puyopuyo.c:476: VDP_Poke_GM2(tx + 1, ty,     base + 3);  // BR at top
	ld	a, -10 (ix)
	add	a, #0x03
	ld	-3 (ix), a
	ld	c, -1 (ix)
	inc	c
	ld	e, c
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	iy, (_g_ScreenLayoutLow)
	push	bc
	ld	c, -6 (ix)
	ld	b, -5 (ix)
	add	iy, bc
	pop	bc
	ld	d, #0x00
	add	iy, de
	push	iy
	pop	de
	push	hl
	ld	a, -3 (ix)
	call	_VDP_Poke_16K
	pop	hl
;./puyopuyo.c:477: VDP_Poke_GM2(tx,     ty + 1, base);      // TL at bottom
	ld	b, -2 (ix)
	inc	b
	ld	e, b
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	d, #0x00
	ex	de, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	iy, (_g_ScreenLayoutLow)
	add	iy, de
	push	iy
	pop	de
	add	hl, de
	push	bc
	ex	de, hl
	ld	a, -11 (ix)
	call	_VDP_Poke_16K
	pop	bc
;./puyopuyo.c:478: VDP_Poke_GM2(tx + 1, ty + 1, base + 1);  // TR at bottom
	ld	a, -10 (ix)
	inc	a
	ld	-3 (ix), a
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, (_g_ScreenLayoutLow)
	add	hl, de
	ld	b, #0x00
	add	hl, bc
	ex	de, hl
	ld	a, -3 (ix)
	call	_VDP_Poke_16K
;./puyopuyo.c:478: VDP_Poke_GM2(tx + 1, ty + 1, base + 1);  // TR at bottom
00108$:
;./puyopuyo.c:479: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;./puyopuyo.c:482: static void Game_DrawBoard(Player* p, u8 playerIdx) {
;	---------------------------------
; Function Game_DrawBoard
; ---------------------------------
_Game_DrawBoard:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-95
	add	iy, sp
	ld	sp, iy
;./puyopuyo.c:484: u8 bx = p->boardX;
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	bc,#85
	add	hl,bc
	ld	a, (hl)
	ld	-29 (ix), a
;./puyopuyo.c:485: u8 by = p->boardY;
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	hl, #86
	add	hl, bc
	ld	a, (hl)
	ld	-28 (ix), a
;./puyopuyo.c:487: u8 hasFalling = (p->alive && p->puyoColor1 != PUYO_EMPTY);
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	hl, #84
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00221$
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	hl, #68
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	NZ, 00222$
00221$:
	xor	a, a
	jp	00223$
00222$:
	ld	a, #0x01
00223$:
	ld	-5 (ix), a
;./puyopuyo.c:490: for (y = 0; y < BOARD_H; y++)
	ld	-4 (ix), #0x00
;./puyopuyo.c:491: for (x = 0; x < BOARD_W; x++)
00229$:
	ld	c, -4 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl, #0
	add	hl, sp
	add	hl, bc
	ex	de, hl
	ld	a, -4 (ix)
	ld	c, a
	add	a, a
	add	a, c
	add	a, a
	add	a, -2 (ix)
	ld	-9 (ix), a
	ld	a, #0x00
	adc	a, -1 (ix)
	ld	-8 (ix), a
	ld	-3 (ix), #0x00
00212$:
;./puyopuyo.c:492: visible[y][x] = p->board[y][x];
	ld	a, e
	add	a, -3 (ix)
	ld	c, a
	ld	a, d
	adc	a, #0x00
	ld	b, a
	ld	a, -9 (ix)
	add	a, -3 (ix)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, (hl)
	ld	(bc), a
;./puyopuyo.c:491: for (x = 0; x < BOARD_W; x++)
	inc	-3 (ix)
	ld	a, -3 (ix)
	sub	a, #0x06
	jr	C, 00212$
;./puyopuyo.c:490: for (y = 0; y < BOARD_H; y++)
	inc	-4 (ix)
	ld	a, -4 (ix)
	sub	a, #0x0b
	jr	C, 00229$
;./puyopuyo.c:495: if (hasFalling && p->subY == 0) {
	ld	a, -5 (ix)
	or	a, a
	jp	Z, 00112$
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	hl, #88
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	NZ, 00112$
;./puyopuyo.c:496: if (p->puyoY < BOARD_H && p->puyoX < BOARD_W) {
	ld	a, -2 (ix)
	add	a, #0x43
	ld	c, a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	e, a
	ld	a, -2 (ix)
	add	a, #0x42
	ld	-4 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	a, e
	sub	a, #0x0b
	jr	NC, 00104$
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	d, (hl)
	ld	a, d
	sub	a, #0x06
	jr	NC, 00104$
;./puyopuyo.c:497: visible[p->puyoY][p->puyoX] = p->puyoColor1;
	push	de
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	pop	de
	ld	e, h
	push	de
	ld	d, e
	ld	e, l
	ld	hl, #2
	add	hl, sp
	add	hl, de
	pop	de
	ld	a, l
	add	a, d
	ld	e, a
	ld	a, h
	adc	a, #0x00
	ld	d, a
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	bc, #0x0044
	add	hl, bc
	pop	bc
	ld	a, (hl)
	ld	(de), a
00104$:
;./puyopuyo.c:500: i8 sxs = (i8)p->puyoX + Game_GetSatX(p->puyoDir);
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	ld	a, -2 (ix)
	add	a, #0x46
	ld	e, a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	de
	ld	a, l
	call	_Game_GetSatX
	pop	de
	pop	bc
	add	a, -3 (ix)
	ld	-3 (ix), a
;./puyopuyo.c:501: i8 sys = (i8)p->puyoY + Game_GetSatY(p->puyoDir);
	ld	a, (bc)
	ld	c, a
	ld	a, (de)
	ld	b, a
	push	bc
	ld	a, b
	call	_Game_GetSatY
	pop	bc
	add	a, c
	ld	c, a
;./puyopuyo.c:502: if (sxs >= 0 && sxs < BOARD_W && sys >= 0 && sys < BOARD_H) {
	bit	7, -3 (ix)
	jr	NZ, 00112$
	ld	a, -3 (ix)
	xor	a, #0x80
	sub	a, #0x86
	jr	NC, 00112$
	bit	7, c
	jr	NZ, 00112$
	ld	a, c
	xor	a, #0x80
	sub	a, #0x8b
	jr	NC, 00112$
;./puyopuyo.c:503: visible[sys][sxs] = p->puyoColor2;
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl, #0
	add	hl, sp
	add	hl, bc
	ex	de, hl
	ld	a, e
	add	a, -3 (ix)
	ld	e, a
	jr	NC, 00572$
	inc	d
00572$:
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	hl, #69
	add	hl, bc
	ld	a, (hl)
	ld	(de), a
00112$:
;./puyopuyo.c:511: u8 skipX1 = 0xFF, skipY1 = 0xFF, skipX2 = 0xFF, skipY2 = 0xFF;
	ld	-21 (ix), #0xff
	ld	-20 (ix), #0xff
	ld	-19 (ix), #0xff
	ld	-18 (ix), #0xff
;./puyopuyo.c:512: if (hasFalling && p->subY != 0) {
	ld	a, -5 (ix)
	or	a, a
	jr	Z, 00253$
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	hl, #88
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00253$
;./puyopuyo.c:513: skipX1 = p->puyoX; skipY1 = p->puyoY;
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	hl, #66
	add	hl, bc
	ld	c, (hl)
	ld	-21 (ix), c
	ld	a, -2 (ix)
	add	a, #0x43
	ld	e, a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	-20 (ix), a
;./puyopuyo.c:515: i8 fsx = (i8)p->puyoX + Game_GetSatX(p->puyoDir);
	ld	-3 (ix), c
	ld	a, -2 (ix)
	add	a, #0x46
	ld	c, a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	de
	ld	a, l
	call	_Game_GetSatX
	pop	de
	pop	bc
	add	a, -3 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;./puyopuyo.c:516: i8 fsy = (i8)p->puyoY + Game_GetSatY(p->puyoDir);
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (bc)
	ld	c, a
	push	hl
	ld	a, c
	call	_Game_GetSatY
	pop	hl
	add	a, h
	ld	c, a
;./puyopuyo.c:517: if (fsx >= 0 && fsx < BOARD_W && fsy >= 0)
	bit	7, l
	jr	NZ, 00253$
	ld	a, l
	xor	a, #0x80
	sub	a, #0x86
	jr	NC, 00253$
	bit	7, c
	jr	NZ, 00253$
;./puyopuyo.c:518: { skipX2 = (u8)fsx; skipY2 = (u8)fsy; }
	ld	-19 (ix), l
	ld	-18 (ix), c
;./puyopuyo.c:521: for (y = 0; y < BOARD_H; y++) {
00253$:
	ld	bc, #_g_Shadow+0
	ld	e, 4 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	-7 (ix), #0x00
;./puyopuyo.c:522: for (x = 0; x < BOARD_W; x++) {
00251$:
	ld	c, -7 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl, #0
	add	hl, sp
	add	hl, bc
	ld	-17 (ix), l
	ld	-16 (ix), h
	ld	a, -17 (ix)
	ld	-15 (ix), a
	ld	a, -16 (ix)
	ld	-14 (ix), a
	ld	a, -7 (ix)
	ld	c, a
	add	a, a
	add	a, c
	add	a, a
	add	a, -4 (ix)
	ld	-13 (ix), a
	ld	a, #0x00
	adc	a, -3 (ix)
	ld	-12 (ix), a
	ld	a, -18 (ix)
	sub	a, -7 (ix)
	ld	a, #0x01
	jr	Z, 00574$
	xor	a, a
00574$:
	ld	-11 (ix), a
	ld	a, -20 (ix)
	sub	a, -7 (ix)
	ld	a, #0x01
	jr	Z, 00576$
	xor	a, a
00576$:
	ld	-10 (ix), a
	ld	-6 (ix), #0x00
00216$:
;./puyopuyo.c:523: if (x == skipX1 && (y == skipY1 || y == skipY1 + 1)) continue;
	ld	a, -21 (ix)
	sub	a, -6 (ix)
	jr	NZ, 00122$
	ld	a, -10 (ix)
	or	a, a
	jp	NZ, 00131$
	ld	a, -20 (ix)
	ld	-9 (ix), a
	ld	-8 (ix), #0x00
	ld	c, a
	ld	b, #0x00
	inc	bc
	ld	l, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	cp	a, a
	sbc	hl, bc
	jr	Z, 00131$
00122$:
;./puyopuyo.c:524: if (x == skipX2 && (y == skipY2 || y == skipY2 + 1)) continue;
	ld	a, -6 (ix)
	sub	a, -19 (ix)
	jr	NZ, 00126$
	ld	a, -11 (ix)
	or	a, a
	jr	NZ, 00131$
	ld	c, -18 (ix)
	ld	b, #0x00
	inc	bc
	ld	l, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	cp	a, a
	sbc	hl, bc
	jr	Z, 00131$
00126$:
;./puyopuyo.c:525: if (visible[y][x] != g_Shadow[playerIdx][y][x]) {
	ld	a, -15 (ix)
	add	a, -6 (ix)
	ld	c, a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	b, a
	ld	a, -13 (ix)
	add	a, -6 (ix)
	ld	e, a
	ld	a, -12 (ix)
	adc	a, #0x00
	ld	d, a
	ld	a, (bc)
	ld	c, a
	ld	a, (de)
	sub	a, c
	jr	Z, 00131$
;./puyopuyo.c:526: g_Shadow[playerIdx][y][x] = visible[y][x];
	ld	a, -17 (ix)
	add	a, -6 (ix)
	ld	c, a
	ld	a, -16 (ix)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	(de), a
;./puyopuyo.c:527: DrawPuyo16(bx + x * 2, by + y * 2, visible[y][x]);
	ld	a, (bc)
	ld	b, a
	ld	a, -7 (ix)
	add	a, a
	ld	c, -28 (ix)
	add	a, c
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -6 (ix)
	add	a, a
	ld	c, -29 (ix)
	add	a, c
	ld	c, a
	push	bc
	inc	sp
	ld	a, c
	call	_DrawPuyo16
00131$:
;./puyopuyo.c:522: for (x = 0; x < BOARD_W; x++) {
	inc	-6 (ix)
	ld	a, -6 (ix)
	sub	a, #0x06
	jp	C, 00216$
;./puyopuyo.c:521: for (y = 0; y < BOARD_H; y++) {
	inc	-7 (ix)
	ld	a, -7 (ix)
	sub	a, #0x0b
	jp	C, 00251$
;./puyopuyo.c:536: u8 prevX1 = g_PrevFallX1[playerIdx], prevY1 = g_PrevFallY1[playerIdx];
	ld	a, #<(_g_PrevFallX1)
	add	a, 4 (ix)
	ld	-27 (ix), a
	ld	a, #>(_g_PrevFallX1)
	adc	a, #0x00
	ld	-26 (ix), a
	ld	l, -27 (ix)
	ld	h, -26 (ix)
	ld	a, (hl)
	ld	-6 (ix), a
	ld	a, #<(_g_PrevFallY1)
	add	a, 4 (ix)
	ld	-25 (ix), a
	ld	a, #>(_g_PrevFallY1)
	adc	a, #0x00
	ld	-24 (ix), a
	ld	l, -25 (ix)
	ld	h, -24 (ix)
	ld	a, (hl)
	ld	-12 (ix), a
;./puyopuyo.c:537: u8 prevX2 = g_PrevFallX2[playerIdx], prevY2 = g_PrevFallY2[playerIdx];
	ld	a, #<(_g_PrevFallX2)
	add	a, 4 (ix)
	ld	-23 (ix), a
	ld	a, #>(_g_PrevFallX2)
	adc	a, #0x00
	ld	-22 (ix), a
	ld	l, -23 (ix)
	ld	h, -22 (ix)
	ld	a, (hl)
	ld	-14 (ix), a
	ld	a, #<(_g_PrevFallY2)
	add	a, 4 (ix)
	ld	-21 (ix), a
	ld	a, #>(_g_PrevFallY2)
	adc	a, #0x00
	ld	-20 (ix), a
	ld	l, -21 (ix)
	ld	h, -20 (ix)
	ld	a, (hl)
	ld	-13 (ix), a
;./puyopuyo.c:538: if (prevX1 != 0xFF) {
	ld	a, -6 (ix)
	inc	a
	jp	Z,00146$
;./puyopuyo.c:540: RestoreTile(prevX1, prevY1);
	ld	l, -12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -6 (ix)
	call	_RestoreTile
;./puyopuyo.c:541: RestoreTile(prevX1 + 1, prevY1);
	ld	a, -6 (ix)
	ld	-7 (ix), a
	inc	a
	ld	-11 (ix), a
	ld	l, -12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -11 (ix)
	call	_RestoreTile
;./puyopuyo.c:542: if (prevY1 + 1 < 24) {
	ld	a, -12 (ix)
	ld	-10 (ix), a
	ld	-9 (ix), #0x00
	ld	a, -10 (ix)
	add	a, #0x01
	ld	-8 (ix), a
	ld	a, -9 (ix)
	adc	a, #0x00
	ld	-7 (ix), a
	ld	a, -8 (ix)
	sub	a, #0x18
	ld	a, -7 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00135$
;./puyopuyo.c:543: RestoreTile(prevX1, prevY1 + 1);
	ld	c, -12 (ix)
	inc	c
	push	bc
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -6 (ix)
	call	_RestoreTile
	pop	bc
;./puyopuyo.c:544: RestoreTile(prevX1 + 1, prevY1 + 1);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -11 (ix)
	call	_RestoreTile
00135$:
;./puyopuyo.c:547: if (prevY1 >= by && prevY1 < by + BOARD_H * 2) {
	ld	a, -12 (ix)
	sub	a, -28 (ix)
	jp	C, 00146$
	ld	c, -28 (ix)
	ld	b, #0x00
	ld	hl, #0x0016
	add	hl, bc
	ex	de, hl
	ld	a, -10 (ix)
	sub	a, e
	ld	a, -9 (ix)
	sbc	a, d
	jp	PO, 00585$
	xor	a, #0x80
00585$:
	jp	P, 00146$
;./puyopuyo.c:548: u8 cy = (prevY1 - by) / 2;
	ld	a, -10 (ix)
	sub	a, c
	ld	-12 (ix), a
	ld	a, -9 (ix)
	sbc	a, b
	ld	-11 (ix), a
	ld	a, -12 (ix)
	ld	-8 (ix), a
	ld	a, -11 (ix)
	ld	-7 (ix), a
	bit	7, -11 (ix)
	jr	Z, 00224$
	ld	a, -12 (ix)
	add	a, #0x01
	ld	-8 (ix), a
	ld	a, -11 (ix)
	adc	a, #0x00
	ld	-7 (ix), a
00224$:
	sra	-7 (ix)
	rr	-8 (ix)
	ld	a, -8 (ix)
	ld	-12 (ix), a
;./puyopuyo.c:549: u8 cx = (prevX1 - bx) / 2;
	ld	a, -6 (ix)
	ld	-7 (ix), a
	ld	-6 (ix), #0x00
	ld	a, -29 (ix)
	ld	-11 (ix), a
	ld	-10 (ix), #0x00
	ld	a, -7 (ix)
	sub	a, -11 (ix)
	ld	-9 (ix), a
	ld	a, -6 (ix)
	sbc	a, -10 (ix)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	ld	-6 (ix), a
	bit	7, -8 (ix)
	jr	Z, 00225$
	ld	a, -9 (ix)
	add	a, #0x01
	ld	-7 (ix), a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
00225$:
	sra	-6 (ix)
	rr	-7 (ix)
	ld	a, -7 (ix)
;./puyopuyo.c:550: if (cx < BOARD_W && cy < BOARD_H) g_Shadow[playerIdx][cy][cx] = 0xFF;
	ld	-11 (ix), a
	sub	a, #0x06
	ld	a, #0x00
	rla
	ld	-10 (ix), a
	or	a, a
	jr	Z, 00137$
	ld	a, -12 (ix)
	sub	a, #0x0b
	jr	NC, 00137$
	ld	a, -12 (ix)
	ld	c, a
	add	a, a
	add	a, c
	add	a, a
	ld	-6 (ix), a
	add	a, -4 (ix)
	ld	-9 (ix), a
	ld	a, #0x00
	adc	a, -3 (ix)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	add	a, -11 (ix)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), #0xff
00137$:
;./puyopuyo.c:551: if (cx < BOARD_W && cy + 1 < BOARD_H) g_Shadow[playerIdx][cy + 1][cx] = 0xFF;
	ld	a, -10 (ix)
	or	a, a
	jr	Z, 00146$
	ld	a, -12 (ix)
	ld	-9 (ix), a
	ld	-8 (ix), #0x00
	ld	a, -9 (ix)
	add	a, #0x01
	ld	-7 (ix), a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	a, -7 (ix)
	sub	a, #0x0b
	ld	a, -6 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00146$
	ld	a, -12 (ix)
	inc	a
	ld	c, a
	add	a, a
	add	a, c
	add	a, a
	add	a, -4 (ix)
	ld	-9 (ix), a
	ld	a, #0x00
	adc	a, -3 (ix)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	add	a, -11 (ix)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), #0xff
00146$:
;./puyopuyo.c:554: if (prevX2 != 0xFF) {
	ld	a, -14 (ix)
	inc	a
	jp	Z,00159$
;./puyopuyo.c:555: RestoreTile(prevX2, prevY2);
	ld	l, -13 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -14 (ix)
	call	_RestoreTile
;./puyopuyo.c:556: RestoreTile(prevX2 + 1, prevY2);
	ld	e, -14 (ix)
	inc	e
	push	de
	ld	l, -13 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	call	_RestoreTile
	pop	de
;./puyopuyo.c:557: if (prevY2 + 1 < 24) {
	ld	c, -13 (ix)
	ld	b, #0x00
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	a, l
	sub	a, #0x18
	ld	a, h
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00148$
;./puyopuyo.c:558: RestoreTile(prevX2, prevY2 + 1);
	ld	d, -13 (ix)
	inc	d
	push	bc
	push	de
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -14 (ix)
	call	_RestoreTile
	pop	de
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	call	_RestoreTile
	pop	bc
00148$:
;./puyopuyo.c:561: if (prevY2 >= by && prevY2 < by + BOARD_H * 2) {
	ld	a, -13 (ix)
	sub	a, -28 (ix)
	jp	C, 00159$
	ld	e, -28 (ix)
	ld	d, #0x00
	ld	hl, #0x0016
	add	hl, de
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jp	PO, 00587$
	xor	a, #0x80
00587$:
	jp	P, 00159$
;./puyopuyo.c:562: u8 cy = (prevY2 - by) / 2;
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	d, a
	ld	c, e
	ld	b, d
	bit	7, d
	jr	Z, 00226$
	ld	c, e
	ld	b, d
	inc	bc
00226$:
	sra	b
	rr	c
;./puyopuyo.c:563: u8 cx = (prevX2 - bx) / 2;
	ld	a, -14 (ix)
	ld	b, #0x00
	ld	e, -29 (ix)
	ld	d, #0x00
	sub	a, e
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	sbc	a, d
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	bit	7, h
	jr	Z, 00227$
	ex	de, hl
	inc	de
00227$:
	sra	d
	rr	e
;./puyopuyo.c:564: if (cx < BOARD_W && cy < BOARD_H) g_Shadow[playerIdx][cy][cx] = 0xFF;
	ld	a, e
	sub	a, #0x06
	ld	a, #0x00
	rla
	ld	-6 (ix), a
	or	a, a
	jr	Z, 00150$
	ld	a,c
	cp	a,#0x0b
	jr	NC, 00150$
	add	a, a
	add	a, c
	add	a, a
	add	a, -4 (ix)
	ld	b, a
	ld	a, #0x00
	adc	a, -3 (ix)
	ld	d, a
	ld	l, b
	ld	h, d
	ld	d, #0x00
	add	hl, de
	ld	(hl), #0xff
00150$:
;./puyopuyo.c:565: if (cx < BOARD_W && cy + 1 < BOARD_H) g_Shadow[playerIdx][cy + 1][cx] = 0xFF;
	ld	a, -6 (ix)
	or	a, a
	jr	Z, 00159$
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	a, l
	sub	a, #0x0b
	ld	a, h
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00159$
	inc	c
	ld	a, c
	add	a, a
	add	a, c
	add	a, a
	add	a, -4 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x00
	adc	a, -3 (ix)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	d, #0x00
	add	hl, de
	ld	(hl), #0xff
00159$:
;./puyopuyo.c:569: g_PrevFallX1[playerIdx] = 0xFF;
	ld	l, -27 (ix)
	ld	h, -26 (ix)
	ld	(hl), #0xff
;./puyopuyo.c:570: g_PrevFallX2[playerIdx] = 0xFF;
	ld	l, -23 (ix)
	ld	h, -22 (ix)
	ld	(hl), #0xff
;./puyopuyo.c:574: if (hasFalling && p->subY == 2) {
	ld	a, -5 (ix)
	or	a, a
	jp	Z, 00165$
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	hl, #88
	add	hl, bc
	ld	a, (hl)
	sub	a, #0x02
	jp	NZ,00165$
;./puyopuyo.c:575: u8 px = p->puyoX;
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	hl, #66
	add	hl, bc
	ld	c, (hl)
;./puyopuyo.c:576: i8 sx2 = (i8)px + Game_GetSatX(p->puyoDir);
	ld	b, c
	ld	a, -2 (ix)
	add	a, #0x46
	ld	e, a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	de
	ld	a, l
	call	_Game_GetSatX
	pop	de
	pop	bc
	add	a, b
	ld	-6 (ix), a
;./puyopuyo.c:577: i8 sy2 = Game_GetSatY(p->puyoDir);
	ld	a, (de)
	ld	b, a
	push	bc
	ld	a, b
	call	_Game_GetSatY
	pop	bc
	ld	-4 (ix), a
;./puyopuyo.c:578: u8 base = PAT_PUYO_BASE + (p->puyoColor1 - 1) * 4;
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	hl, #68
	add	hl, de
	ld	a, (hl)
	dec	a
	add	a, a
	add	a, a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	l
;./puyopuyo.c:579: u8 tx1 = bx + px * 2;
	ld	a, c
	add	a, a
	ld	c, -29 (ix)
	add	a, c
	ld	-3 (ix), a
;./puyopuyo.c:580: VDP_Poke_GM2(tx1,     0, base + 2);
	ld	b, l
	inc	b
	inc	b
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	de, (_g_ScreenLayoutLow)
	ld	a, -3 (ix)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	a, e
	ld	e, a
	ld	a, h
	adc	a, d
	ld	d, a
	push	hl
	ld	a, b
	call	_VDP_Poke_16K
	pop	hl
;./puyopuyo.c:581: VDP_Poke_GM2(tx1 + 1, 0, base + 3);
	inc	l
	inc	l
	inc	l
	ld	a, -3 (ix)
	inc	a
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	de, (_g_ScreenLayoutLow)
	ld	b, #0x00
	add	a, e
	ld	e, a
	ld	a, b
	adc	a, d
	ld	d, a
	ld	a, l
	call	_VDP_Poke_16K
;./puyopuyo.c:582: g_PrevFallX1[playerIdx] = tx1;
	ld	l, -27 (ix)
	ld	h, -26 (ix)
	ld	a, -3 (ix)
	ld	(hl), a
;./puyopuyo.c:583: g_PrevFallY1[playerIdx] = 0;
	ld	l, -25 (ix)
	ld	h, -24 (ix)
	ld	(hl), #0x00
;./puyopuyo.c:584: if (sx2 >= 0 && sx2 < BOARD_W && sy2 == 0) {
	bit	7, -6 (ix)
	jr	NZ, 00165$
	ld	a, -6 (ix)
	xor	a, #0x80
	sub	a, #0x86
	jr	NC, 00165$
	ld	a, -4 (ix)
	or	a, a
	jr	NZ, 00165$
;./puyopuyo.c:585: u8 base2 = PAT_PUYO_BASE + (p->puyoColor2 - 1) * 4;
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	hl, #69
	add	hl, de
	ld	a, (hl)
	dec	a
	add	a, a
	add	a, a
	ld	e, a
	inc	e
;./puyopuyo.c:586: u8 tx2 = bx + (u8)sx2 * 2;
	ld	a, -6 (ix)
	add	a, a
	add	a, c
	ld	c, a
;./puyopuyo.c:587: VDP_Poke_GM2(tx2,     0, base2 + 2);
	ld	b, e
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	inc	l
	inc	l
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	de, (_g_ScreenLayoutLow)
	ld	a, c
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	a, e
	ld	e, a
	ld	a, h
	adc	a, d
	ld	d, a
	push	bc
	ld	a, l
	call	_VDP_Poke_16K
	pop	bc
;./puyopuyo.c:588: VDP_Poke_GM2(tx2 + 1, 0, base2 + 3);
	inc	b
	inc	b
	inc	b
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	inc	l
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	de, (_g_ScreenLayoutLow)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ex	de, hl
	ld	a, b
	call	_VDP_Poke_16K
;./puyopuyo.c:589: g_PrevFallX2[playerIdx] = tx2;
	ld	l, -23 (ix)
	ld	h, -22 (ix)
	ld	(hl), c
;./puyopuyo.c:590: g_PrevFallY2[playerIdx] = 0;
	ld	l, -21 (ix)
	ld	h, -20 (ix)
	ld	(hl), #0x00
00165$:
;./puyopuyo.c:595: if (hasFalling && p->subY == 0 && p->puyoY == 0 && p->puyoDir == DIR_UP) {
	ld	a, -5 (ix)
	or	a, a
	jp	Z, 00168$
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	hl, #88
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	NZ, 00168$
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	hl, #67
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	NZ, 00168$
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	hl, #70
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	NZ, 00168$
;./puyopuyo.c:596: u8 base2 = PAT_PUYO_BASE + (p->puyoColor2 - 1) * 4;
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	hl, #69
	add	hl, bc
	ld	a, (hl)
	dec	a
	add	a, a
	add	a, a
	ld	b, a
	inc	b
;./puyopuyo.c:597: u8 tx2 = bx + p->puyoX * 2;
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	hl, #66
	add	hl, de
	ld	a, (hl)
	add	a, a
	ld	c, -29 (ix)
	add	a, c
	ld	c, a
;./puyopuyo.c:598: VDP_Poke_GM2(tx2,     0, base2 + 2);
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	inc	l
	inc	l
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	de, (_g_ScreenLayoutLow)
	ld	a, c
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	a, e
	ld	e, a
	ld	a, h
	adc	a, d
	ld	d, a
	push	bc
	ld	a, l
	call	_VDP_Poke_16K
	pop	bc
;./puyopuyo.c:599: VDP_Poke_GM2(tx2 + 1, 0, base2 + 3);
	inc	b
	inc	b
	inc	b
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	inc	l
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	de, (_g_ScreenLayoutLow)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ex	de, hl
	ld	a, b
	call	_VDP_Poke_16K
;./puyopuyo.c:600: g_PrevFallX2[playerIdx] = tx2;
	ld	l, -23 (ix)
	ld	h, -22 (ix)
	ld	(hl), c
;./puyopuyo.c:601: g_PrevFallY2[playerIdx] = 0;
	ld	l, -21 (ix)
	ld	h, -20 (ix)
	ld	(hl), #0x00
00168$:
;./puyopuyo.c:605: if (hasFalling && p->subY == 1) {
	ld	a, -5 (ix)
	or	a, a
	jp	Z, 00185$
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	hl, #88
	add	hl, bc
	ld	a, (hl)
	dec	a
	jp	NZ,00185$
;./puyopuyo.c:606: u8 px = p->puyoX, py = p->puyoY;
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	hl, #66
	add	hl, bc
	ld	a, (hl)
	ld	-3 (ix), a
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	hl, #67
	add	hl, bc
	ld	a, (hl)
	ld	-4 (ix), a
;./puyopuyo.c:607: i8 sx = (i8)px + Game_GetSatX(p->puyoDir);
	ld	c, -3 (ix)
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0046
	add	hl, de
	ld	b, (hl)
	push	hl
	push	bc
	ld	a, b
	call	_Game_GetSatX
	pop	bc
	pop	hl
	add	a, c
	ld	-19 (ix), a
;./puyopuyo.c:608: i8 sy = (i8)py + Game_GetSatY(p->puyoDir);
	ld	c, -4 (ix)
	ld	b, (hl)
	push	bc
	ld	a, b
	call	_Game_GetSatY
	pop	bc
	add	a, c
	ld	-18 (ix), a
;./puyopuyo.c:610: if (py < BOARD_H && px < BOARD_W) {
	ld	a, -4 (ix)
	sub	a, #0x0b
	jp	NC, 00173$
	ld	a, -3 (ix)
	sub	a, #0x06
	jp	NC, 00173$
;./puyopuyo.c:611: u8 tyTop = by + py * 2;
	ld	a, -4 (ix)
	add	a, a
	ld	-6 (ix), a
	ld	a, -28 (ix)
	ld	-4 (ix), a
	add	a, -6 (ix)
	ld	-4 (ix), a
	ld	-17 (ix), a
;./puyopuyo.c:612: u8 base = PAT_PUYO_BASE + (p->puyoColor1 - 1) * 4;
	ld	a, -2 (ix)
	ld	-5 (ix), a
	ld	a, -1 (ix)
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	de, #0x0044
	add	hl, de
	ld	a, (hl)
	dec	a
	add	a, a
	add	a, a
	inc	a
	ld	-4 (ix), a
;./puyopuyo.c:613: u8 tx1 = bx + px * 2;
	ld	a, -3 (ix)
	add	a, a
	ld	-5 (ix), a
	ld	a, -29 (ix)
	ld	-3 (ix), a
	add	a, -5 (ix)
	ld	-3 (ix), a
	ld	-16 (ix), a
;./puyopuyo.c:615: RestoreTile(tx1, tyTop);
	ld	l, -17 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -16 (ix)
	call	_RestoreTile
;./puyopuyo.c:616: RestoreTile(tx1 + 1, tyTop);
	ld	a, -16 (ix)
	ld	-3 (ix), a
	inc	a
	ld	-15 (ix), a
	ld	l, -17 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -15 (ix)
	call	_RestoreTile
;./puyopuyo.c:617: VDP_Poke_GM2(tx1,     tyTop + 1, base);
	ld	a, -17 (ix)
	ld	-14 (ix), a
	inc	a
	ld	-3 (ix), a
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	-5 (ix), a
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
	ld	b, #0x05
00592$:
	sla	-6 (ix)
	rl	-5 (ix)
	djnz	00592$
	ld	hl, (_g_ScreenLayoutLow)
	ld	-10 (ix), l
	ld	-9 (ix), h
	ld	a, -6 (ix)
	ld	-8 (ix), a
	ld	a, -5 (ix)
	ld	-7 (ix), a
	ld	a, -10 (ix)
	add	a, -8 (ix)
	ld	-6 (ix), a
	ld	a, -9 (ix)
	adc	a, -7 (ix)
	ld	-5 (ix), a
	ld	c, -16 (ix)
	ld	b, #0x00
	ld	-13 (ix), c
	ld	-12 (ix), b
	ld	a, -6 (ix)
	add	a, -13 (ix)
	ld	e, a
	ld	a, -5 (ix)
	adc	a, -12 (ix)
	ld	d, a
	ld	a, -4 (ix)
	call	_VDP_Poke_16K
;./puyopuyo.c:618: VDP_Poke_GM2(tx1 + 1, tyTop + 1, base + 1);
	ld	a, -4 (ix)
	ld	-11 (ix), a
	inc	a
	ld	-10 (ix), a
	ld	a, -15 (ix)
	ld	-4 (ix), a
	ld	-9 (ix), a
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	a, -3 (ix)
	ld	-4 (ix), a
	ld	-3 (ix), #0x00
	ld	b, #0x05
00593$:
	sla	-4 (ix)
	rl	-3 (ix)
	djnz	00593$
	ld	hl, (_g_ScreenLayoutLow)
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	a, -4 (ix)
	ld	-6 (ix), a
	ld	a, -3 (ix)
	ld	-5 (ix), a
	ld	a, -8 (ix)
	add	a, -6 (ix)
	ld	-4 (ix), a
	ld	a, -7 (ix)
	adc	a, -5 (ix)
	ld	-3 (ix), a
	ld	c, -9 (ix)
	ld	b, #0x00
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	add	hl, bc
	ex	de, hl
	ld	a, -10 (ix)
	call	_VDP_Poke_16K
;./puyopuyo.c:619: VDP_Poke_GM2(tx1,     tyTop + 2, base + 2);
	ld	a, -11 (ix)
	add	a, #0x02
	ld	-4 (ix), a
	ld	a, -14 (ix)
	add	a, #0x02
	ld	-3 (ix), a
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	-5 (ix), a
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
	ld	b, #0x05
00594$:
	sla	-6 (ix)
	rl	-5 (ix)
	djnz	00594$
	ld	hl, (_g_ScreenLayoutLow)
	ld	-10 (ix), l
	ld	-9 (ix), h
	ld	a, -6 (ix)
	ld	-8 (ix), a
	ld	a, -5 (ix)
	ld	-7 (ix), a
	ld	a, -10 (ix)
	add	a, -8 (ix)
	ld	-6 (ix), a
	ld	a, -9 (ix)
	adc	a, -7 (ix)
	ld	-5 (ix), a
	ld	a, -6 (ix)
	add	a, -13 (ix)
	ld	e, a
	ld	a, -5 (ix)
	adc	a, -12 (ix)
	ld	d, a
	ld	a, -4 (ix)
	call	_VDP_Poke_16K
;./puyopuyo.c:620: VDP_Poke_GM2(tx1 + 1, tyTop + 2, base + 3);
	ld	a, -11 (ix)
	add	a, #0x03
	ld	-4 (ix), a
	ld	a, -15 (ix)
	ld	-5 (ix), a
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	a, -3 (ix)
	ld	-7 (ix), a
	ld	-6 (ix), #0x00
	ld	b, #0x05
00595$:
	sla	-7 (ix)
	rl	-6 (ix)
	djnz	00595$
	ld	hl, (_g_ScreenLayoutLow)
	ld	-11 (ix), l
	ld	-10 (ix), h
	ld	a, -7 (ix)
	ld	-9 (ix), a
	ld	a, -6 (ix)
	ld	-8 (ix), a
	ld	a, -11 (ix)
	add	a, -9 (ix)
	ld	-7 (ix), a
	ld	a, -10 (ix)
	adc	a, -8 (ix)
	ld	-6 (ix), a
	ld	c, -5 (ix)
	ld	b, #0x00
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	add	hl, bc
	ex	de, hl
	ld	a, -4 (ix)
	call	_VDP_Poke_16K
;./puyopuyo.c:621: g_PrevFallX1[playerIdx] = tx1;
	ld	l, -27 (ix)
	ld	h, -26 (ix)
	ld	a, -16 (ix)
	ld	(hl), a
;./puyopuyo.c:622: g_PrevFallY1[playerIdx] = tyTop;
	ld	l, -25 (ix)
	ld	h, -24 (ix)
	ld	a, -17 (ix)
	ld	(hl), a
00173$:
;./puyopuyo.c:625: if (sx >= 0 && sx < BOARD_W) {
	bit	7, -19 (ix)
	jp	NZ, 00185$
	ld	a, -19 (ix)
	xor	a, #0x80
	sub	a, #0x86
	jp	NC, 00185$
;./puyopuyo.c:626: u8 tx2 = bx + (u8)sx * 2;
	ld	a, -19 (ix)
	add	a, a
	ld	c, -29 (ix)
	add	a, c
	ld	-3 (ix), a
;./puyopuyo.c:627: if (sy == -1) {
	ld	a, -18 (ix)
	inc	a
	jp	NZ,00179$
;./puyopuyo.c:628: u8 base = PAT_PUYO_BASE + (p->puyoColor2 - 1) * 4;
	ld	a, -2 (ix)
	ld	-5 (ix), a
	ld	a, -1 (ix)
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	de, #0x0045
	add	hl, de
	ld	a, (hl)
	ld	-4 (ix), a
	dec	a
	add	a, a
	add	a, a
	inc	a
	ld	-4 (ix), a
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	hl, (_g_ScreenLayoutLow)
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	a, -3 (ix)
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
	ld	a, -6 (ix)
	ld	-14 (ix), a
	ld	a, -5 (ix)
	ld	-13 (ix), a
	ld	a, -8 (ix)
	add	a, -14 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	adc	a, -13 (ix)
	ld	-5 (ix), a
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	a, -4 (ix)
	call	_VDP_Poke_16K
;./puyopuyo.c:630: VDP_Poke_GM2(tx2 + 1, 0, base + 1);
	ld	a, -4 (ix)
	ld	-12 (ix), a
	inc	a
	ld	-11 (ix), a
	ld	a, -3 (ix)
	inc	a
	ld	-10 (ix), a
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	hl, (_g_ScreenLayoutLow)
	ld	-9 (ix), l
	ld	-8 (ix), h
	ld	-5 (ix), a
	ld	-4 (ix), #0x00
	ld	a, -5 (ix)
	ld	-7 (ix), a
	ld	a, -4 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	add	a, -9 (ix)
	ld	-5 (ix), a
	ld	a, -6 (ix)
	adc	a, -8 (ix)
	ld	-4 (ix), a
	ld	e, -5 (ix)
	ld	d, -4 (ix)
	ld	a, -11 (ix)
	call	_VDP_Poke_16K
;./puyopuyo.c:631: VDP_Poke_GM2(tx2,     1, base + 2);
	ld	a, -12 (ix)
	add	a, #0x02
	ld	-8 (ix), a
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	hl, (_g_ScreenLayoutLow)
	ld	-5 (ix), l
	ld	-4 (ix), h
	ld	a, -5 (ix)
	add	a, #0x20
	ld	-7 (ix), a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	a, -7 (ix)
	add	a, -14 (ix)
	ld	-5 (ix), a
	ld	a, -6 (ix)
	adc	a, -13 (ix)
	ld	-4 (ix), a
	ld	e, -5 (ix)
	ld	d, -4 (ix)
	ld	a, -8 (ix)
	call	_VDP_Poke_16K
;./puyopuyo.c:632: VDP_Poke_GM2(tx2 + 1, 1, base + 3);
	ld	a, -12 (ix)
	add	a, #0x03
	ld	-4 (ix), a
	ld	a, -10 (ix)
	ld	-5 (ix), a
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	hl, (_g_ScreenLayoutLow)
	ld	-10 (ix), l
	ld	-9 (ix), h
	ld	a, -10 (ix)
	add	a, #0x20
	ld	-8 (ix), a
	ld	a, -9 (ix)
	adc	a, #0x00
	ld	-7 (ix), a
	ld	a, -5 (ix)
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
	ld	a, -6 (ix)
	add	a, -8 (ix)
	ld	-10 (ix), a
	ld	a, -5 (ix)
	adc	a, -7 (ix)
	ld	-9 (ix), a
	ld	a, -10 (ix)
	ld	-6 (ix), a
	ld	a, -9 (ix)
	ld	-5 (ix), a
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	a, -4 (ix)
	call	_VDP_Poke_16K
;./puyopuyo.c:633: g_PrevFallX2[playerIdx] = tx2;
	ld	l, -23 (ix)
	ld	h, -22 (ix)
	ld	a, -3 (ix)
	ld	(hl), a
;./puyopuyo.c:634: g_PrevFallY2[playerIdx] = 0;
	ld	l, -21 (ix)
	ld	h, -20 (ix)
	ld	(hl), #0x00
	jp	00185$
00179$:
;./puyopuyo.c:635: } else if (sy >= 0 && sy < BOARD_H) {
	bit	7, -18 (ix)
	jp	NZ, 00185$
	ld	a, -18 (ix)
	xor	a, #0x80
	sub	a, #0x8b
	jp	NC, 00185$
;./puyopuyo.c:636: u8 tyTop = by + (u8)sy * 2;
	ld	a, -18 (ix)
	add	a, a
	ld	c, -28 (ix)
	add	a, c
	ld	-17 (ix), a
;./puyopuyo.c:637: u8 base = PAT_PUYO_BASE + (p->puyoColor2 - 1) * 4;
	ld	a, -2 (ix)
	ld	-5 (ix), a
	ld	a, -1 (ix)
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	de, #0x0045
	add	hl, de
	ld	a, (hl)
	ld	-4 (ix), a
	dec	a
	add	a, a
	add	a, a
	inc	a
	ld	-5 (ix), a
;./puyopuyo.c:638: RestoreTile(tx2, tyTop);
	ld	l, -17 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -3 (ix)
	call	_RestoreTile
;./puyopuyo.c:639: RestoreTile(tx2 + 1, tyTop);
	ld	a, -3 (ix)
	inc	a
	ld	-16 (ix), a
	ld	l, -17 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -16 (ix)
	call	_RestoreTile
;./puyopuyo.c:640: VDP_Poke_GM2(tx2,     tyTop + 1, base);
	ld	a, -17 (ix)
	ld	-15 (ix), a
	inc	a
	ld	-4 (ix), a
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	-7 (ix), a
	ld	-6 (ix), #0x00
	ld	b, #0x05
00598$:
	sla	-7 (ix)
	rl	-6 (ix)
	djnz	00598$
	ld	hl, (_g_ScreenLayoutLow)
	ld	-11 (ix), l
	ld	-10 (ix), h
	ld	a, -7 (ix)
	add	a, -11 (ix)
	ld	-9 (ix), a
	ld	a, -6 (ix)
	adc	a, -10 (ix)
	ld	-8 (ix), a
	ld	a, -3 (ix)
	ld	-7 (ix), a
	ld	-6 (ix), #0x00
	ld	a, -7 (ix)
	ld	-14 (ix), a
	ld	a, -6 (ix)
	ld	-13 (ix), a
	ld	a, -9 (ix)
	add	a, -14 (ix)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	adc	a, -13 (ix)
	ld	-6 (ix), a
	ld	e, -7 (ix)
	ld	d, -6 (ix)
	ld	a, -5 (ix)
	call	_VDP_Poke_16K
;./puyopuyo.c:641: VDP_Poke_GM2(tx2 + 1, tyTop + 1, base + 1);
	ld	a, -5 (ix)
	ld	-12 (ix), a
	inc	a
	ld	-11 (ix), a
	ld	a, -16 (ix)
	ld	-10 (ix), a
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	a, -4 (ix)
	ld	-5 (ix), a
	ld	-4 (ix), #0x00
	ld	b, #0x05
00599$:
	sla	-5 (ix)
	rl	-4 (ix)
	djnz	00599$
	ld	hl, (_g_ScreenLayoutLow)
	ld	-9 (ix), l
	ld	-8 (ix), h
	ld	a, -5 (ix)
	ld	-7 (ix), a
	ld	a, -4 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	add	a, -9 (ix)
	ld	-5 (ix), a
	ld	a, -6 (ix)
	adc	a, -8 (ix)
	ld	-4 (ix), a
	ld	a, -10 (ix)
	ld	-7 (ix), a
	ld	-6 (ix), #0x00
	ld	a, -7 (ix)
	add	a, -5 (ix)
	ld	-9 (ix), a
	ld	a, -6 (ix)
	adc	a, -4 (ix)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	ld	-5 (ix), a
	ld	a, -8 (ix)
	ld	-4 (ix), a
	ld	e, -5 (ix)
	ld	d, -4 (ix)
	ld	a, -11 (ix)
	call	_VDP_Poke_16K
;./puyopuyo.c:642: VDP_Poke_GM2(tx2,     tyTop + 2, base + 2);
	ld	a, -12 (ix)
	add	a, #0x02
	ld	-5 (ix), a
	ld	a, -15 (ix)
	add	a, #0x02
	ld	-4 (ix), a
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	-7 (ix), a
	ld	-6 (ix), #0x00
	ld	b, #0x05
00600$:
	sla	-7 (ix)
	rl	-6 (ix)
	djnz	00600$
	ld	hl, (_g_ScreenLayoutLow)
	ld	-11 (ix), l
	ld	-10 (ix), h
	ld	a, -7 (ix)
	ld	-9 (ix), a
	ld	a, -6 (ix)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	add	a, -11 (ix)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	adc	a, -10 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	add	a, -14 (ix)
	ld	-9 (ix), a
	ld	a, -6 (ix)
	adc	a, -13 (ix)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	ld	-6 (ix), a
	ld	e, -7 (ix)
	ld	d, -6 (ix)
	ld	a, -5 (ix)
	call	_VDP_Poke_16K
;./puyopuyo.c:643: VDP_Poke_GM2(tx2 + 1, tyTop + 2, base + 3);
	ld	a, -12 (ix)
	add	a, #0x03
	ld	-5 (ix), a
	ld	a, -16 (ix)
	ld	-6 (ix), a
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	a, -4 (ix)
	ld	-8 (ix), a
	ld	-7 (ix), #0x00
	ld	b, #0x05
00601$:
	sla	-8 (ix)
	rl	-7 (ix)
	djnz	00601$
	ld	hl, (_g_ScreenLayoutLow)
	ld	-12 (ix), l
	ld	-11 (ix), h
	ld	a, -8 (ix)
	ld	-10 (ix), a
	ld	a, -7 (ix)
	ld	-9 (ix), a
	ld	a, -10 (ix)
	add	a, -12 (ix)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	adc	a, -11 (ix)
	ld	-7 (ix), a
	ld	a, -6 (ix)
	ld	-10 (ix), a
	ld	-9 (ix), #0x00
	ld	a, -10 (ix)
	add	a, -8 (ix)
	ld	-12 (ix), a
	ld	a, -9 (ix)
	adc	a, -7 (ix)
	ld	-11 (ix), a
	ld	a, -12 (ix)
	ld	-7 (ix), a
	ld	a, -11 (ix)
	ld	-6 (ix), a
	ld	e, -7 (ix)
	ld	d, -6 (ix)
	ld	a, -5 (ix)
	call	_VDP_Poke_16K
;./puyopuyo.c:644: g_PrevFallX2[playerIdx] = tx2;
	ld	l, -23 (ix)
	ld	h, -22 (ix)
	ld	a, -3 (ix)
	ld	(hl), a
;./puyopuyo.c:645: g_PrevFallY2[playerIdx] = tyTop;
	ld	l, -21 (ix)
	ld	h, -20 (ix)
	ld	a, -17 (ix)
	ld	(hl), a
00185$:
;./puyopuyo.c:655: if (playerIdx == 0) {
	ld	a, 4 (ix)
	or	a, a
	jr	NZ, 00188$
;./puyopuyo.c:656: nx = 16; ny = 7;
	ld	-11 (ix), #0x10
	ld	-10 (ix), #0x07
	jp	00189$
00188$:
;./puyopuyo.c:658: nx = 16; ny = 14;
	ld	-11 (ix), #0x10
	ld	-10 (ix), #0x0e
00189$:
;./puyopuyo.c:660: if (p->nextColor1 != g_ShadowNext[playerIdx][0]) {
	ld	a, -2 (ix)
	add	a, #0x47
	ld	-5 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	ld	bc, #_g_ShadowNext+0
	ld	l, 4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, bc
	ld	-9 (ix), l
	ld	-8 (ix), h
	ld	a,-3 (ix)
	sub	a,(hl)
	jr	Z, 00191$
;./puyopuyo.c:661: g_ShadowNext[playerIdx][0] = p->nextColor1;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	a, -3 (ix)
	ld	(hl), a
;./puyopuyo.c:662: DrawPuyo16(nx, ny, p->nextColor1);
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	push	af
	inc	sp
	ld	l, -10 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -11 (ix)
	call	_DrawPuyo16
00191$:
;./puyopuyo.c:664: if (p->nextColor2 != g_ShadowNext[playerIdx][1]) {
	ld	a, -2 (ix)
	add	a, #0x48
	ld	-7 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, (hl)
	ld	-5 (ix), a
	ld	a, -9 (ix)
	add	a, #0x01
	ld	-4 (ix), a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	c, (hl)
	ld	a, -5 (ix)
	sub	a, c
	jr	Z, 00219$
;./puyopuyo.c:665: g_ShadowNext[playerIdx][1] = p->nextColor2;
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, -5 (ix)
	ld	(hl), a
;./puyopuyo.c:666: DrawPuyo16(nx, ny + 2, p->nextColor2);
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	ld	a, -10 (ix)
	add	a, #0x02
	ld	-4 (ix), a
	ld	a, -3 (ix)
	push	af
	inc	sp
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -11 (ix)
	call	_DrawPuyo16
00219$:
;./puyopuyo.c:669: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;./puyopuyo.c:672: static void Game_DrawConnections(Player* p) {
;	---------------------------------
; Function Game_DrawConnections
; ---------------------------------
_Game_DrawConnections:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-53
	add	iy, sp
	ld	sp, iy
;./puyopuyo.c:675: bx = p->boardX;
	ld	-5 (ix), l
	ld	-4 (ix), h
	ld	bc,#85
	add	hl,bc
	ld	a, (hl)
	ld	-45 (ix), a
;./puyopuyo.c:676: by = p->boardY;
	ld	c, -5 (ix)
	ld	b, -4 (ix)
	ld	hl, #86
	add	hl, bc
	ld	a, (hl)
	ld	-44 (ix), a
;./puyopuyo.c:678: for (y = 0; y < BOARD_H; y++) {
	ld	a, -5 (ix)
	ld	-43 (ix), a
	ld	a, -4 (ix)
	ld	-42 (ix), a
	ld	a, -5 (ix)
	add	a, #0x46
	ld	-41 (ix), a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	-40 (ix), a
	ld	a, -5 (ix)
	add	a, #0x43
	ld	-39 (ix), a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	-38 (ix), a
	ld	a, -5 (ix)
	ld	-37 (ix), a
	ld	a, -4 (ix)
	ld	-36 (ix), a
	ld	a, -5 (ix)
	ld	-35 (ix), a
	ld	a, -4 (ix)
	ld	-34 (ix), a
	ld	a, -39 (ix)
	ld	-33 (ix), a
	ld	a, -38 (ix)
	ld	-32 (ix), a
	ld	-3 (ix), #0x00
;./puyopuyo.c:679: for (x = 0; x < BOARD_W; x++) {
00215$:
	ld	a, -3 (ix)
	ld	c, a
	add	a, a
	add	a, c
	add	a, a
	add	a, -5 (ix)
	ld	-31 (ix), a
	ld	a, #0x00
	adc	a, -4 (ix)
	ld	-30 (ix), a
	ld	a, -31 (ix)
	ld	-29 (ix), a
	ld	a, -30 (ix)
	ld	-28 (ix), a
	ld	a, -31 (ix)
	ld	-27 (ix), a
	ld	a, -30 (ix)
	ld	-26 (ix), a
	ld	-2 (ix), #0x00
00157$:
;./puyopuyo.c:680: color = p->board[y][x];
	ld	a, -2 (ix)
	add	a, -27 (ix)
	ld	-7 (ix), a
	ld	a, #0x00
	adc	a, -26 (ix)
	ld	-6 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, (hl)
;./puyopuyo.c:681: if (color < 1 || color > PUYO_COUNT) continue;
	ld	-1 (ix), a
	sub	a, #0x01
	jp	C, 00150$
	ld	a, #0x05
	sub	a, -1 (ix)
	jp	C, 00150$
;./puyopuyo.c:684: if (p->alive && p->puyoColor1 != PUYO_EMPTY) {
	ld	l, -35 (ix)
	ld	h, -34 (ix)
	ld	de, #0x0054
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00111$
	ld	l, -37 (ix)
	ld	h, -36 (ix)
	ld	de, #0x0044
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00111$
;./puyopuyo.c:685: if (p->puyoX == x && p->puyoY == y) continue;
	ld	l, -43 (ix)
	ld	h, -42 (ix)
	ld	de, #0x0042
	add	hl, de
	ld	c, (hl)
	ld	a, -2 (ix)
	sub	a, c
	jr	NZ, 00105$
	ld	l, -33 (ix)
	ld	h, -32 (ix)
	ld	a,-3 (ix)
	sub	a,(hl)
	jp	Z,00150$
00105$:
;./puyopuyo.c:687: i8 sx2 = (i8)p->puyoX + Game_GetSatX(p->puyoDir);
	ld	-8 (ix), c
	ld	l, -41 (ix)
	ld	h, -40 (ix)
	ld	a, (hl)
	call	_Game_GetSatX
	ld	-6 (ix), a
	add	a, -8 (ix)
	ld	-6 (ix), a
	ld	-7 (ix), a
;./puyopuyo.c:688: i8 sy2 = (i8)p->puyoY + Game_GetSatY(p->puyoDir);
	ld	l, -39 (ix)
	ld	h, -38 (ix)
	ld	a, (hl)
	ld	-6 (ix), a
	ld	-8 (ix), a
	ld	l, -41 (ix)
	ld	h, -40 (ix)
	ld	a, (hl)
	call	_Game_GetSatY
	ld	-6 (ix), a
	add	a, -8 (ix)
	ld	-6 (ix), a
	ld	c, a
;./puyopuyo.c:689: if ((u8)sx2 == x && (u8)sy2 == y) continue;
	ld	b, -7 (ix)
	ld	a, -2 (ix)
	sub	a, b
	jr	NZ, 00111$
	ld	a, -3 (ix)
	sub	a, c
	jp	Z,00150$
00111$:
;./puyopuyo.c:693: ci = color - 1;
	ld	a, -1 (ix)
	dec	a
	ld	-25 (ix), a
;./puyopuyo.c:695: u8 cU = (y > 0 && p->board[y-1][x] == color) ? 1 : 0;
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00162$
	ld	a, -3 (ix)
	dec	a
	ld	c, a
	add	a, a
	add	a, c
	add	a, a
	add	a, -5 (ix)
	ld	c, a
	ld	a, #0x00
	adc	a, -4 (ix)
	ld	b, a
	ld	l, -2 (ix)
	ld	h, #0x00
	add	hl, bc
	ld	a,-1 (ix)
	sub	a,(hl)
	jr	NZ, 00162$
	ld	bc, #0x0001
	jp	00163$
00162$:
	ld	bc, #0x0000
00163$:
	ld	-24 (ix), c
;./puyopuyo.c:696: u8 cD = (y+1 < BOARD_H && p->board[y+1][x] == color) ? 1 : 0;
	ld	a, -3 (ix)
	ld	-9 (ix), a
	ld	-8 (ix), #0x00
	ld	a, -9 (ix)
	add	a, #0x01
	ld	-7 (ix), a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	a, -7 (ix)
	sub	a, #0x0b
	ld	a, -6 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00167$
	ld	a, -3 (ix)
	ld	-6 (ix), a
	inc	-6 (ix)
	ld	a, -6 (ix)
	ld	c, a
	add	a, a
	add	a, c
	add	a, a
	ld	-6 (ix), a
	add	a, -5 (ix)
	ld	-9 (ix), a
	ld	a, #0x00
	adc	a, -4 (ix)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	add	a, -2 (ix)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a,-1 (ix)
	sub	a,(hl)
	jr	NZ, 00167$
	ld	bc, #0x0001
	jp	00168$
00167$:
	ld	bc, #0x0000
00168$:
	ld	-23 (ix), c
;./puyopuyo.c:697: u8 cL = (x > 0 && p->board[y][x-1] == color) ? 1 : 0;
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00172$
	ld	a, -2 (ix)
	ld	-6 (ix), a
	dec	-6 (ix)
	ld	a, -6 (ix)
	add	a, -31 (ix)
	ld	-7 (ix), a
	ld	a, #0x00
	adc	a, -30 (ix)
	ld	-6 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a,-1 (ix)
	sub	a,(hl)
	jr	NZ, 00172$
	ld	bc, #0x0001
	jp	00173$
00172$:
	ld	bc, #0x0000
00173$:
	ld	-22 (ix), c
;./puyopuyo.c:698: u8 cR = (x+1 < BOARD_W && p->board[y][x+1] == color) ? 1 : 0;
	ld	c, -2 (ix)
	ld	b, #0x00
	inc	bc
	ld	a, c
	sub	a, #0x06
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00177$
	ld	c, -2 (ix)
	inc	c
	ld	l, -29 (ix)
	ld	h, -28 (ix)
	ld	b, #0x00
	add	hl, bc
	ld	a,-1 (ix)
	sub	a,(hl)
	jr	NZ, 00177$
	ld	bc, #0x0001
	jp	00178$
00177$:
	ld	bc, #0x0000
00178$:
	ld	-21 (ix), c
;./puyopuyo.c:700: if (!cU && !cD && !cL && !cR) continue;
	ld	a, -24 (ix)
	or	a, a
	jr	NZ, 00214$
	ld	a, -23 (ix)
	or	a, a
	jr	NZ, 00214$
	ld	a, -22 (ix)
	or	a, a
	jr	NZ, 00214$
	ld	a, -21 (ix)
	or	a, a
	jp	Z, 00150$
;./puyopuyo.c:702: for (q = 0; q < 4; q++) {
00214$:
	ld	-1 (ix), #0x00
00156$:
;./puyopuyo.c:703: u8 needFill = 0;
	ld	-6 (ix), #0x00
;./puyopuyo.c:706: if (q == 0 && (cU || cL)) needFill = 1;
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00119$
	ld	a, -24 (ix)
	or	a, a
	jr	NZ, 00118$
	ld	a, -22 (ix)
	or	a, a
	jr	Z, 00119$
00118$:
	ld	-6 (ix), #0x01
00119$:
;./puyopuyo.c:707: if (q == 1 && (cU || cR)) needFill = 1;
	ld	a, -1 (ix)
	dec	a
	jr	NZ, 00123$
	ld	a, -24 (ix)
	or	a, a
	jr	NZ, 00122$
	ld	a, -21 (ix)
	or	a, a
	jr	Z, 00123$
00122$:
	ld	-6 (ix), #0x01
00123$:
;./puyopuyo.c:708: if (q == 2 && (cD || cL)) needFill = 1;
	ld	a, -1 (ix)
	sub	a, #0x02
	jr	NZ, 00127$
	ld	a, -23 (ix)
	or	a, a
	jr	NZ, 00126$
	ld	a, -22 (ix)
	or	a, a
	jr	Z, 00127$
00126$:
	ld	-6 (ix), #0x01
00127$:
;./puyopuyo.c:709: if (q == 3 && (cD || cR)) needFill = 1;
	ld	a, -1 (ix)
	sub	a, #0x03
	jr	NZ, 00131$
	ld	a, -23 (ix)
	or	a, a
	jr	NZ, 00130$
	ld	a, -21 (ix)
	or	a, a
	jr	Z, 00131$
00130$:
	ld	-6 (ix), #0x01
00131$:
;./puyopuyo.c:711: if (!needFill) continue;
	ld	a, -6 (ix)
	or	a, a
	jp	Z, 00148$
;./puyopuyo.c:712: if (g_ConnPool >= 255) continue;
	ld	a, (_g_ConnPool+0)
	sub	a, #0xff
	jp	NC, 00148$
;./puyopuyo.c:714: for (i = 0; i < 8; i++) patBuf[i] = g_PuyoPat[ci][q][i];
	ld	a, -1 (ix)
	add	a, a
	add	a, a
	add	a, a
	ld	-20 (ix), a
	ld	c, #0x00
00154$:
	ld	e, c
	ld	d, #0x00
	ld	hl, #0
	add	hl, sp
	add	hl, de
	ex	de, hl
	ld	l, -25 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	-19 (ix), l
	ld	-18 (ix), h
	ld	a, #<(_g_PuyoPat)
	add	a, -19 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>(_g_PuyoPat)
	adc	a, -18 (ix)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, l
	add	a, -20 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	jr	NC, 00398$
	inc	h
00398$:
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ld	(de), a
	inc	c
	ld	a, c
	sub	a, #0x08
	jr	C, 00154$
;./puyopuyo.c:716: if (q < 2) {
	ld	a, -1 (ix)
	sub	a, #0x02
	jr	NC, 00146$
;./puyopuyo.c:717: patBuf[0] = 0xFF; patBuf[1] = 0xFF; patBuf[2] = 0xFF;
	ld	-53 (ix), #0xff
	ld	-52 (ix), #0xff
	ld	-51 (ix), #0xff
	jp	00147$
00146$:
;./puyopuyo.c:719: patBuf[5] = 0xFF; patBuf[6] = 0xFF; patBuf[7] = 0xFF;
	ld	-48 (ix), #0xff
	ld	-47 (ix), #0xff
	ld	-46 (ix), #0xff
;./puyopuyo.c:720: if (q == 2 && cL) { patBuf[3] |= 0x80; patBuf[4] |= 0x80; }
	ld	a, -1 (ix)
	sub	a, #0x02
	jr	NZ, 00140$
	ld	a, -22 (ix)
	or	a, a
	jr	Z, 00140$
	set	7, -50 (ix)
	set	7, -49 (ix)
00140$:
;./puyopuyo.c:721: if (q == 3 && cR) { patBuf[3] |= 0x01; patBuf[4] |= 0x01; }
	ld	a, -1 (ix)
	sub	a, #0x03
	jr	NZ, 00147$
	ld	a, -21 (ix)
	or	a, a
	jr	Z, 00147$
	set	0, -50 (ix)
	set	0, -49 (ix)
00147$:
;./puyopuyo.c:724: tx = bx + x * 2 + (q & 1);
	ld	a, -2 (ix)
	add	a, a
	ld	c, -45 (ix)
	add	a, c
	ld	c, a
	ld	a, -1 (ix)
	and	a, #0x01
	add	a, c
	ld	-17 (ix), a
;./puyopuyo.c:725: ty2 = by + y * 2 + (q >> 1);
	ld	a, -3 (ix)
	ld	-6 (ix), a
	add	a, a
	ld	-7 (ix), a
	ld	a, -44 (ix)
	ld	-6 (ix), a
	add	a, -7 (ix)
	ld	-8 (ix), a
	ld	a, -1 (ix)
	srl	a
	ld	-6 (ix), a
	add	a, -8 (ix)
;./puyopuyo.c:726: bank = ty2 / 8;
	ld	-6 (ix), a
	ld	-16 (ix), a
	ld	-15 (ix), #0x00
	ld	a, -16 (ix)
	ld	-7 (ix), a
	ld	a, -15 (ix)
	ld	-6 (ix), a
	bit	7, -15 (ix)
	jr	Z, 00182$
	ld	a, -16 (ix)
	add	a, #0x07
	ld	-7 (ix), a
	ld	a, -15 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
00182$:
	ld	c, -7 (ix)
	ld	b, -6 (ix)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
;./puyopuyo.c:727: idx = g_ConnPool++;
	ld	a, (_g_ConnPool+0)
	ld	b, a
	ld	hl, #_g_ConnPool
	inc	(hl)
	ld	-14 (ix), b
;./puyopuyo.c:729: VDP_WriteVRAM_16K(patBuf, g_ScreenPatternLow + (u16)bank * 0x800 + (u16)idx * 8, 8);
	ld	a, c
	add	a, a
	add	a, a
	add	a, a
	ld	-12 (ix), a
	ld	-13 (ix), #0x00
	ld	hl, (_g_ScreenPatternLow)
	ld	-7 (ix), l
	ld	-6 (ix), h
	ld	a, -7 (ix)
	add	a, -13 (ix)
	ld	-9 (ix), a
	ld	a, -6 (ix)
	adc	a, -12 (ix)
	ld	-8 (ix), a
	ld	a, -14 (ix)
	ld	-7 (ix), a
	ld	-6 (ix), #0x00
	ld	a, -7 (ix)
	ld	-11 (ix), a
	ld	a, -6 (ix)
	ld	-10 (ix), a
	ld	b, #0x03
00403$:
	sla	-11 (ix)
	rl	-10 (ix)
	djnz	00403$
	ld	a, -9 (ix)
	add	a, -11 (ix)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	adc	a, -10 (ix)
	ld	-6 (ix), a
	ld	hl, #0x0008
	push	hl
	ld	e, -7 (ix)
	ld	d, -6 (ix)
	ld	hl, #2
	add	hl, sp
	call	_VDP_WriteVRAM_16K
;./puyopuyo.c:730: VDP_WriteVRAM_16K(g_PuyoCol[ci][q], g_ScreenColorLow + (u16)bank * 0x800 + (u16)idx * 8, 8);
	ld	hl, (_g_ScreenColorLow)
	ld	-9 (ix), l
	ld	-8 (ix), h
	ld	a, -9 (ix)
	add	a, -13 (ix)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	adc	a, -12 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	add	a, -11 (ix)
	ld	-9 (ix), a
	ld	a, -6 (ix)
	adc	a, -10 (ix)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	ld	-6 (ix), a
	ld	a, -19 (ix)
	add	a, #<(_g_PuyoCol)
	ld	-9 (ix), a
	ld	a, -18 (ix)
	adc	a, #>(_g_PuyoCol)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	add	a, -20 (ix)
	ld	-11 (ix), a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	-10 (ix), a
	ld	a, -11 (ix)
	ld	-9 (ix), a
	ld	a, -10 (ix)
	ld	-8 (ix), a
	ld	hl, #0x0008
	push	hl
	ld	e, -7 (ix)
	ld	d, -6 (ix)
	ld	l, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_VDP_WriteVRAM_16K
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	a, -16 (ix)
	ld	-7 (ix), a
	ld	a, -15 (ix)
	ld	-6 (ix), a
	ld	b, #0x05
00404$:
	sla	-7 (ix)
	rl	-6 (ix)
	djnz	00404$
	ld	hl, (_g_ScreenLayoutLow)
	ld	-9 (ix), l
	ld	-8 (ix), h
	ld	a, -9 (ix)
	add	a, -7 (ix)
	ld	-11 (ix), a
	ld	a, -8 (ix)
	adc	a, -6 (ix)
	ld	-10 (ix), a
	ld	a, -17 (ix)
	ld	-7 (ix), a
	ld	-6 (ix), #0x00
	ld	a, -7 (ix)
	add	a, -11 (ix)
	ld	-9 (ix), a
	ld	a, -6 (ix)
	adc	a, -10 (ix)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	ld	-6 (ix), a
	ld	e, -7 (ix)
	ld	d, -6 (ix)
	ld	a, -14 (ix)
	call	_VDP_Poke_16K
;./puyopuyo.c:731: VDP_Poke_GM2(tx, ty2, idx);
00148$:
;./puyopuyo.c:702: for (q = 0; q < 4; q++) {
	inc	-1 (ix)
	ld	a, -1 (ix)
	sub	a, #0x04
	jp	C, 00156$
00150$:
;./puyopuyo.c:679: for (x = 0; x < BOARD_W; x++) {
	inc	-2 (ix)
	ld	a, -2 (ix)
	sub	a, #0x06
	jp	C, 00157$
;./puyopuyo.c:678: for (y = 0; y < BOARD_H; y++) {
	inc	-3 (ix)
	ld	a, -3 (ix)
	sub	a, #0x0b
	jp	C, 00215$
;./puyopuyo.c:736: }
	ld	sp, ix
	pop	ix
	ret
;./puyopuyo.c:738: static void Game_DrawScore(Player* p) {
;	---------------------------------
; Function Game_DrawScore
; ---------------------------------
_Game_DrawScore:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-12
	add	iy, sp
	ld	sp, iy
	ld	-2 (ix), l
	ld	-1 (ix), h
;./puyopuyo.c:741: if (p->score == p->prevScore && p->pendingGarbage == p->prevGarbage) return;
	ld	a, -2 (ix)
	add	a, #0x4d
	ld	-12 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-11 (ix), a
	pop	hl
	push	hl
	ld	a, (hl)
	ld	-10 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-9 (ix), a
	ld	a, -2 (ix)
	add	a, #0x4f
	ld	-8 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-7 (ix), a
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, -2 (ix)
	add	a, #0x52
	ld	-6 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
	ld	a, -2 (ix)
	add	a, #0x53
	ld	-4 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	pop	de
	pop	hl
	push	hl
	push	de
	cp	a, a
	sbc	hl, bc
	jr	NZ, 00102$
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, (hl)
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	c, (hl)
	sub	a, c
	jp	Z,00113$
	jp	00102$
00102$:
;./puyopuyo.c:742: p->prevScore = p->score;
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	a, -10 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -9 (ix)
	ld	(hl), a
;./puyopuyo.c:743: p->prevGarbage = p->pendingGarbage;
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, (hl)
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), a
;./puyopuyo.c:745: if (p == &g_Player[0]) {
	ld	bc, #_g_Player
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	cp	a, a
	sbc	hl, bc
	jr	NZ, 00105$
;./puyopuyo.c:746: sx = CENTER_X; sy = 6;
	ld	e, #0x0e
	ld	c, #0x06
	jp	00106$
00105$:
;./puyopuyo.c:748: sx = CENTER_X; sy = 13;
	ld	e, #0x0e
	ld	c, #0x0d
00106$:
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), e
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), c
;./puyopuyo.c:752: Print_DrawChar('0' + (p->score / 10000) % 10);
	pop	hl
	push	hl
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	de, #0x2710
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	__divuint
	ex	de, hl
	ld	de, #0x000a
	call	__moduint
	ld	a, e
	add	a, #0x30
	call	_Print_DrawChar
;./puyopuyo.c:753: Print_DrawChar('0' + (p->score / 1000) % 10);
	pop	hl
	push	hl
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	de, #0x03e8
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	__divuint
	ex	de, hl
	ld	de, #0x000a
	call	__moduint
	ld	a, e
	add	a, #0x30
	call	_Print_DrawChar
;./puyopuyo.c:754: Print_DrawChar('0' + (p->score / 100) % 10);
	pop	hl
	push	hl
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	de, #0x0064
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	__divuint
	ex	de, hl
	ld	de, #0x000a
	call	__moduint
	ld	a, e
	add	a, #0x30
	call	_Print_DrawChar
;./puyopuyo.c:755: Print_DrawChar('0' + (p->score / 10) % 10);
	pop	hl
	push	hl
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	de, #0x000a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	__divuint
	ex	de, hl
	ld	de, #0x000a
	call	__moduint
	ld	a, e
	add	a, #0x30
	call	_Print_DrawChar
;./puyopuyo.c:758: u8 gy = (p == &g_Player[0]) ? 19 : 20;
	ld	bc, #_g_Player
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	cp	a, a
	sbc	hl, bc
	jr	NZ, 00115$
	ld	-4 (ix), #0x13
	ld	-3 (ix), #0
	jp	00116$
00115$:
	ld	-4 (ix), #0x14
	ld	-3 (ix), #0
00116$:
	ld	c, -4 (ix)
;./puyopuyo.c:759: if (p->pendingGarbage > 0) {
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, (hl)
	or	a, a
	jr	Z, 00108$
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x0e
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), c
;./puyopuyo.c:761: Print_DrawChar('G');
	ld	a, #0x47
	call	_Print_DrawChar
;./puyopuyo.c:762: Print_DrawChar('0' + (p->pendingGarbage / 10) % 10);
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	l, (hl)
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	de, #0x000a
	call	__divsint
	ex	de, hl
	ld	de, #0x000a
	call	__modsint
	ld	a, e
	add	a, #0x30
	call	_Print_DrawChar
;./puyopuyo.c:763: Print_DrawChar('0' + p->pendingGarbage % 10);
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	l, (hl)
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	de, #0x000a
	call	__modsint
	ld	a, e
	add	a, #0x30
	call	_Print_DrawChar
	jp	00113$
00108$:
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x0e
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), c
;./puyopuyo.c:766: RestoreTile(CENTER_X, gy);
	push	bc
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0e
	call	_RestoreTile
	pop	bc
;./puyopuyo.c:767: RestoreTile(CENTER_X + 1, gy);
	push	bc
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0f
	call	_RestoreTile
	pop	bc
;./puyopuyo.c:768: RestoreTile(CENTER_X + 2, gy);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x10
	call	_RestoreTile
00113$:
;./puyopuyo.c:771: }
	ld	sp, ix
	pop	ix
	ret
;./puyopuyo.c:775: static void DrawPuyoLetter(u8 tx, u8 ty, const u8* data, u8 color) {
;	---------------------------------
; Function DrawPuyoLetter
; ---------------------------------
_DrawPuyoLetter:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
	ld	-2 (ix), a
	ld	-3 (ix), l
;./puyopuyo.c:777: for (r = 0; r < 4; r++) {
	ld	c, #0x00
;./puyopuyo.c:778: for (c = 0; c < 3; c++) {
00112$:
	ld	a, c
	add	a, 4 (ix)
	ld	e, a
	ld	a, #0x00
	adc	a, 5 (ix)
	ld	d, a
	ld	-1 (ix), #0x00
00105$:
;./puyopuyo.c:779: if (data[r] & (4 >> c)) {
	ld	a, (de)
	ld	b, a
	ld	a, -1 (ix)
	push	af
	ld	hl, #0x0004
	pop	af
	inc	a
	jp	00134$
00133$:
	sra	h
	rr	l
00134$:
	dec	a
	jr	NZ, 00133$
	ld	a, b
	ld	b, #0x00
	and	a, l
	ld	-5 (ix), a
	ld	a, b
	and	a, h
	ld	-4 (ix), a
	or	a, -5 (ix)
	jr	Z, 00106$
;./puyopuyo.c:780: DrawPuyo16(tx + c * 2, ty + r * 2, color);
	ld	a, c
	add	a, a
	ld	b, -3 (ix)
	add	a, b
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -1 (ix)
	add	a, a
	ld	b, -2 (ix)
	add	a, b
	ld	b, a
	push	bc
	push	de
	ld	a, 6 (ix)
	push	af
	inc	sp
	ld	a, b
	call	_DrawPuyo16
	pop	de
	pop	bc
00106$:
;./puyopuyo.c:778: for (c = 0; c < 3; c++) {
	inc	-1 (ix)
	ld	a, -1 (ix)
	sub	a, #0x03
	jr	C, 00105$
;./puyopuyo.c:777: for (r = 0; r < 4; r++) {
	inc	c
	ld	a, c
	sub	a, #0x04
	jr	C, 00112$
;./puyopuyo.c:784: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	inc	sp
	jp	(hl)
;./puyopuyo.c:786: static void Game_DrawTitle(void) {
;	---------------------------------
; Function Game_DrawTitle
; ---------------------------------
_Game_DrawTitle:
;./puyopuyo.c:796: *((u8*)0xF3DB) = 0;
	ld	hl, #0xf3db
	ld	(hl), #0x00
;./puyopuyo.c:798: VDP_Setup();
	call	_VDP_Setup
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1385: inline void VDP_FillScreen_GM2(u8 value) { VDP_FillVRAM(value, g_ScreenLayoutLow, g_ScreenLayoutHigh, 32*24); }
	ld	hl, #0x0300
	push	hl
	ld	de, (_g_ScreenLayoutLow)
	xor	a, a
	call	_VDP_FillVRAM_16K
;./puyopuyo.c:802: DrawPuyoLetter(1,  1, letP, PUYO_RED);
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, #_Game_DrawTitle_letP_65536_852
	push	hl
;	spillPairReg hl
;	spillPairReg hl
	ld	a,#0x01
	ld	l,a
	call	_DrawPuyoLetter
;./puyopuyo.c:803: DrawPuyoLetter(9,  1, letU, PUYO_GREEN);
	ld	a, #0x02
	push	af
	inc	sp
	ld	hl, #_Game_DrawTitle_letU_65536_852
	push	hl
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x09
	call	_DrawPuyoLetter
;./puyopuyo.c:804: DrawPuyoLetter(17, 1, letY, PUYO_BLUE);
	ld	a, #0x03
	push	af
	inc	sp
	ld	hl, #_Game_DrawTitle_letY_65536_852
	push	hl
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x11
	call	_DrawPuyoLetter
;./puyopuyo.c:805: DrawPuyoLetter(25, 1, letO, PUYO_YELLOW);
	ld	a, #0x04
	push	af
	inc	sp
	ld	hl, #_Game_DrawTitle_letO_65536_852
	push	hl
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x19
	call	_DrawPuyoLetter
;./puyopuyo.c:808: DrawPuyoLetter(1,  10, letP, PUYO_PURPLE);
	ld	a, #0x05
	push	af
	inc	sp
	ld	hl, #_Game_DrawTitle_letP_65536_852
	push	hl
	ld	l, #0x0a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_DrawPuyoLetter
;./puyopuyo.c:809: DrawPuyoLetter(9,  10, letU, PUYO_RED);
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, #_Game_DrawTitle_letU_65536_852
	push	hl
	ld	l, #0x0a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x09
	call	_DrawPuyoLetter
;./puyopuyo.c:810: DrawPuyoLetter(17, 10, letY, PUYO_GREEN);
	ld	a, #0x02
	push	af
	inc	sp
	ld	hl, #_Game_DrawTitle_letY_65536_852
	push	hl
	ld	l, #0x0a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x11
	call	_DrawPuyoLetter
;./puyopuyo.c:811: DrawPuyoLetter(25, 10, letO, PUYO_BLUE);
	ld	a, #0x03
	push	af
	inc	sp
	ld	hl, #_Game_DrawTitle_letO_65536_852
	push	hl
	ld	l, #0x0a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x19
	call	_DrawPuyoLetter
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x0b
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x15
;./puyopuyo.c:817: Print_DrawText("PUSH START");
	ld	hl, #___str_0
;./puyopuyo.c:818: }
	jp	_Print_DrawText
_Game_DrawTitle_letP_65536_852:
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x04	; 4
_Game_DrawTitle_letU_65536_852:
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x07	; 7
_Game_DrawTitle_letY_65536_852:
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
_Game_DrawTitle_letO_65536_852:
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x07	; 7
_Game_DrawTitle_letV_65536_852:
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x02	; 2
_Game_DrawTitle_letS_65536_852:
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x01	; 1
___str_0:
	.ascii "PUSH START"
	.db 0x00
;./puyopuyo.c:822: static void Game_AnimateGameOver(void) {
;	---------------------------------
; Function Game_AnimateGameOver
; ---------------------------------
_Game_AnimateGameOver:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-8
	add	hl, sp
	ld	sp, hl
;./puyopuyo.c:826: if (!g_Player[0].alive) loserIdx = 0;
	ld	bc, #_g_Player+0
	ld	a, (#_g_Player + 84)
	or	a,a
	jr	NZ, 00102$
	ld	e,a
	jp	00103$
00102$:
;./puyopuyo.c:827: else loserIdx = 1;
	ld	e, #0x01
00103$:
;./puyopuyo.c:828: loser = &g_Player[loserIdx];
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ex	de, hl
;./puyopuyo.c:829: bx = loser->boardX;
	push	de
	pop	iy
	ld	a, 85 (iy)
	ld	-7 (ix), a
;./puyopuyo.c:830: by = loser->boardY;
	push	de
	pop	iy
	ld	a, 86 (iy)
	ld	-6 (ix), a
;./puyopuyo.c:832: for (y = 0; y < BOARD_H; y++) {
	ld	c, #0x00
;./puyopuyo.c:833: for (x = 0; x < BOARD_W; x++) {
00122$:
	ld	a, c
	add	a, a
	add	a, c
	add	a, a
	add	a, e
	ld	-5 (ix), a
	ld	a, #0x00
	adc	a, d
	ld	-4 (ix), a
	ld	b, #0x00
00114$:
;./puyopuyo.c:834: if (loser->board[y][x] != PUYO_EMPTY) {
	ld	a, -5 (ix)
	add	a, b
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, (hl)
	ld	-1 (ix), a
	or	a, a
	jp	Z, 00115$
;./puyopuyo.c:836: VDP_Poke_GM2(bx + x * 2,     by + y * 2,     PAT_GRAY_BASE);
	ld	a, c
	add	a, a
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	a, l
	ld	-2 (ix), a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	add	a, a
	ld	h, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	a, h
	ld	-1 (ix), a
	ld	-3 (ix), a
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	iy, (_g_ScreenLayoutLow)
	push	bc
	ld	c, l
	ld	b, h
	add	iy, bc
	pop	bc
	ld	a, -3 (ix)
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	c, a
	ld	b, l
	add	iy, bc
	push	de
	push	iy
	pop	de
	ld	a, #0x1b
	call	_VDP_Poke_16K
	pop	de
	pop	bc
;./puyopuyo.c:837: VDP_Poke_GM2(bx + x * 2 + 1, by + y * 2,     PAT_GRAY_BASE + 1);
	ld	a, -1 (ix)
	inc	a
	ld	-3 (ix), a
	ld	-8 (ix), a
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	iy, (_g_ScreenLayoutLow)
	push	bc
	ld	c, l
	ld	b, h
	add	iy, bc
	pop	bc
	ld	a, -8 (ix)
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	c, a
	ld	b, l
	add	iy, bc
	push	de
	push	iy
	pop	de
	ld	a, #0x1c
	call	_VDP_Poke_16K
	pop	de
	pop	bc
;./puyopuyo.c:838: VDP_Poke_GM2(bx + x * 2,     by + y * 2 + 1, PAT_GRAY_BASE + 2);
	inc	-2 (ix)
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	iy, (_g_ScreenLayoutLow)
	push	bc
	ld	c, l
	ld	b, h
	add	iy, bc
	pop	bc
	ld	a, -1 (ix)
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	c, a
	ld	b, l
	add	iy, bc
	push	de
	push	iy
	pop	de
	ld	a, #0x1d
	call	_VDP_Poke_16K
	pop	de
	pop	bc
;./puyopuyo.c:839: VDP_Poke_GM2(bx + x * 2 + 1, by + y * 2 + 1, PAT_GRAY_BASE + 3);
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -3 (ix)
	ld	-1 (ix), a
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	iy, (_g_ScreenLayoutLow)
	push	bc
	ld	c, l
	ld	b, h
	add	iy, bc
	pop	bc
	ld	a, -1 (ix)
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	c, a
	ld	b, l
	add	iy, bc
	push	de
	push	iy
	pop	de
	ld	a, #0x1e
	call	_VDP_Poke_16K
	pop	de
	pop	bc
;./puyopuyo.c:839: VDP_Poke_GM2(bx + x * 2 + 1, by + y * 2 + 1, PAT_GRAY_BASE + 3);
00115$:
;./puyopuyo.c:833: for (x = 0; x < BOARD_W; x++) {
	inc	b
	ld	a, b
	sub	a, #0x06
	jp	C, 00114$
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/system.h:145: inline void Halt() { __asm__("halt"); }
	halt
	halt
;./puyopuyo.c:832: for (y = 0; y < BOARD_H; y++) {
	inc	c
	ld	a, c
	sub	a, #0x0b
	jp	C, 00122$
;./puyopuyo.c:844: }
	ld	sp, ix
	pop	ix
	ret
;./puyopuyo.c:846: static void Game_DrawGameOver(void) {
;	---------------------------------
; Function Game_DrawGameOver
; ---------------------------------
_Game_DrawGameOver:
;./puyopuyo.c:848: if (g_Player[0].alive || g_Player[1].alive) {
	ld	a, (#(_g_Player + 84) + 0)
	or	a, a
	jr	NZ, 00101$
	ld	a, (#_g_Player + 178)
	or	a, a
	jr	Z, 00102$
00101$:
;./puyopuyo.c:849: Game_AnimateGameOver();
	call	_Game_AnimateGameOver
00102$:
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x0e
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x0a
;./puyopuyo.c:854: if (!g_Player[0].alive && !g_Player[1].alive) {
	ld	hl, #(_g_Player + 84)
	ld	c, (hl)
	ld	a, c
	or	a, a
	jr	NZ, 00108$
	ld	a, (#_g_Player + 178)
	or	a, a
	jr	NZ, 00108$
;./puyopuyo.c:855: Print_DrawText("DRAW");
	ld	hl, #___str_1
	jp	_Print_DrawText
00108$:
;./puyopuyo.c:856: } else if (!g_Player[0].alive) {
	ld	a, c
	or	a, a
	jr	NZ, 00105$
;./puyopuyo.c:857: Print_DrawText("P2 W");
	ld	hl, #___str_2
	jp	_Print_DrawText
00105$:
;./puyopuyo.c:859: Print_DrawText("P1 W");
	ld	hl, #___str_3
;./puyopuyo.c:861: }
	jp	_Print_DrawText
___str_1:
	.ascii "DRAW"
	.db 0x00
___str_2:
	.ascii "P2 W"
	.db 0x00
___str_3:
	.ascii "P1 W"
	.db 0x00
;./puyopuyo.c:864: static void Game_DrawStatsScreen(void) {
;	---------------------------------
; Function Game_DrawStatsScreen
; ---------------------------------
_Game_DrawStatsScreen:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-5
	add	hl, sp
	ld	sp, hl
;./puyopuyo.c:869: VDP_Setup();
	call	_VDP_Setup
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1385: inline void VDP_FillScreen_GM2(u8 value) { VDP_FillVRAM(value, g_ScreenLayoutLow, g_ScreenLayoutHigh, 32*24); }
	ld	hl, #0x0300
	push	hl
	ld	de, (_g_ScreenLayoutLow)
	xor	a, a
	call	_VDP_FillVRAM_16K
;./puyopuyo.c:873: DrawPuyo16(2,  1, PUYO_RED);
	ld	a, #0x01
	push	af
	inc	sp
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x02
	call	_DrawPuyo16
;./puyopuyo.c:874: DrawPuyo16(6,  1, PUYO_GREEN);
	ld	a, #0x02
	push	af
	inc	sp
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x06
	call	_DrawPuyo16
;./puyopuyo.c:875: DrawPuyo16(10, 1, PUYO_BLUE);
	ld	a, #0x03
	push	af
	inc	sp
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_DrawPuyo16
;./puyopuyo.c:876: DrawPuyo16(14, 1, PUYO_YELLOW);
	ld	a, #0x04
	push	af
	inc	sp
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0e
	call	_DrawPuyo16
;./puyopuyo.c:877: DrawPuyo16(18, 1, PUYO_RED);
	ld	a, #0x01
	push	af
	inc	sp
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x12
	call	_DrawPuyo16
;./puyopuyo.c:878: DrawPuyo16(22, 1, PUYO_GREEN);
	ld	a, #0x02
	push	af
	inc	sp
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x16
	call	_DrawPuyo16
;./puyopuyo.c:879: DrawPuyo16(26, 1, PUYO_BLUE);
	ld	a, #0x03
	push	af
	inc	sp
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x1a
	call	_DrawPuyo16
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x0b
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x04
;./puyopuyo.c:883: Print_DrawText("- STATS -");
	ld	hl, #___str_4
	call	_Print_DrawText
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x0b
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x09
;./puyopuyo.c:887: if (!g_Player[0].alive && !g_Player[1].alive) {
	ld	hl, #_g_Player + 84
	ld	c, (hl)
	ld	a, c
	or	a, a
	jr	NZ, 00105$
	ld	a, (#_g_Player + 178)
	or	a, a
	jr	NZ, 00105$
;./puyopuyo.c:888: Print_DrawText("DRAW GAME!");
	ld	hl, #___str_5
	call	_Print_DrawText
	jp	00133$
00105$:
;./puyopuyo.c:889: } else if (!g_Player[0].alive) {
	ld	a, c
	or	a, a
	jr	NZ, 00102$
;./puyopuyo.c:890: Print_DrawText("P2  WINS!");
	ld	hl, #___str_6
	call	_Print_DrawText
	jp	00133$
00102$:
;./puyopuyo.c:892: Print_DrawText("P1  WINS!");
	ld	hl, #___str_7
	call	_Print_DrawText
;./puyopuyo.c:896: for (p = 0; p < 2; p++) {
00133$:
	ld	-1 (ix), #0x00
00122$:
;./puyopuyo.c:897: pw = &g_Player[p];
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	de, #_g_Player
	add	hl, de
	ex	(sp), hl
;./puyopuyo.c:898: sx = (p == 0) ? 3 : 19;
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00126$
	ld	-3 (ix), #0x03
	ld	-2 (ix), #0
	jp	00127$
00126$:
	ld	-3 (ix), #0x13
	ld	-2 (ix), #0
00127$:
	ld	c, -3 (ix)
;./puyopuyo.c:901: Print_SetPosition(sx + 1, sy);
	ld	b, c
	ld	e, b
	inc	e
	ld	a, e
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	(#(_g_PrintData + 5)),a
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x0c
;./puyopuyo.c:902: if (p == 0) Print_DrawText("PLAYER 1");
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00109$
	push	bc
	push	de
	ld	hl, #___str_8
	call	_Print_DrawText
	pop	de
	pop	bc
	jp	00110$
00109$:
;./puyopuyo.c:903: else        Print_DrawText("PLAYER 2");
	push	bc
	push	de
	ld	hl, #___str_9
	call	_Print_DrawText
	pop	de
	pop	bc
00110$:
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), c
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x0e
;./puyopuyo.c:906: Print_DrawText("SCORE");
	push	bc
	push	de
	ld	hl, #___str_10
	call	_Print_DrawText
	pop	de
	pop	bc
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), e
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x0f
;./puyopuyo.c:908: Print_DrawChar('0' + (pw->score / 10000) % 10);
	ld	a, -5 (ix)
	add	a, #0x4d
	ld	-3 (ix), a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ex	de, hl
	ld	de, #0x2710
	call	__divuint
	ex	de, hl
	ld	de, #0x000a
	call	__moduint
	pop	bc
	ld	a, e
	add	a, #0x30
	ld	e, a
	push	bc
	ld	a, e
	call	_Print_DrawChar
	pop	bc
;./puyopuyo.c:909: Print_DrawChar('0' + (pw->score / 1000) % 10);
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ex	de, hl
	ld	de, #0x03e8
	call	__divuint
	ex	de, hl
	ld	de, #0x000a
	call	__moduint
	pop	bc
	ld	a, e
	add	a, #0x30
	ld	e, a
	push	bc
	ld	a, e
	call	_Print_DrawChar
	pop	bc
;./puyopuyo.c:910: Print_DrawChar('0' + (pw->score / 100) % 10);
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ex	de, hl
	ld	de, #0x0064
	call	__divuint
	ex	de, hl
	ld	de, #0x000a
	call	__moduint
	pop	bc
	ld	a, e
	add	a, #0x30
	ld	e, a
	push	bc
	ld	a, e
	call	_Print_DrawChar
	pop	bc
;./puyopuyo.c:911: Print_DrawChar('0' + (pw->score / 10) % 10);
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ex	de, hl
	ld	de, #0x000a
	call	__divuint
	ex	de, hl
	ld	de, #0x000a
	call	__moduint
	pop	bc
	ld	a, e
	add	a, #0x30
	ld	e, a
	push	bc
	ld	a, e
	call	_Print_DrawChar
	pop	bc
;./puyopuyo.c:912: Print_DrawChar('0' + pw->score % 10);
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ex	de, hl
	ld	de, #0x000a
	call	__moduint
	pop	bc
	ld	a, e
	add	a, #0x30
	ld	e, a
	push	bc
	ld	a, e
	call	_Print_DrawChar
	pop	bc
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), c
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x11
;./puyopuyo.c:915: Print_DrawText("CHAIN");
	push	bc
	ld	hl, #___str_11
	call	_Print_DrawText
	pop	bc
;./puyopuyo.c:916: Print_SetPosition(sx + 3, sy + 6);
	ld	a, b
	inc	a
	inc	a
	inc	a
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	(#(_g_PrintData + 5)),a
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x12
;./puyopuyo.c:917: Print_DrawChar('0' + pw->maxChain);
	pop	de
	push	de
	ld	hl, #91
	add	hl, de
	ld	a, (hl)
	add	a, #0x30
	ld	e, a
	push	bc
	ld	a, e
	call	_Print_DrawChar
	pop	bc
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), c
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x14
;./puyopuyo.c:920: Print_DrawText("CLEAR");
	push	bc
	ld	hl, #___str_12
	call	_Print_DrawText
	pop	bc
;./puyopuyo.c:921: Print_SetPosition(sx + 2, sy + 9);
	inc	b
	inc	b
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), b
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x15
;./puyopuyo.c:922: Print_DrawChar('0' + (pw->totalCleared / 100) % 10);
	ld	a, -5 (ix)
	add	a, #0x5c
	ld	c, a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	b, a
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ex	de, hl
	ld	de, #0x0064
	call	__divuint
	ex	de, hl
	ld	de, #0x000a
	call	__moduint
	pop	bc
	ld	a, e
	add	a, #0x30
	ld	e, a
	push	bc
	ld	a, e
	call	_Print_DrawChar
	pop	bc
;./puyopuyo.c:923: Print_DrawChar('0' + (pw->totalCleared / 10) % 10);
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ex	de, hl
	ld	de, #0x000a
	call	__divuint
	ex	de, hl
	ld	de, #0x000a
	call	__moduint
	pop	bc
	ld	a, e
	add	a, #0x30
	ld	e, a
	push	bc
	ld	a, e
	call	_Print_DrawChar
;./puyopuyo.c:924: Print_DrawChar('0' + pw->totalCleared % 10);
	pop	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ex	de, hl
	ld	de, #0x000a
	call	__moduint
	ld	a, e
	add	a, #0x30
	call	_Print_DrawChar
;./puyopuyo.c:896: for (p = 0; p < 2; p++) {
	inc	-1 (ix)
	ld	a, -1 (ix)
	sub	a, #0x02
	jp	C, 00122$
;./puyopuyo.c:926: }
	ld	sp, ix
	pop	ix
	ret
___str_4:
	.ascii "- STATS -"
	.db 0x00
___str_5:
	.ascii "DRAW GAME!"
	.db 0x00
___str_6:
	.ascii "P2  WINS!"
	.db 0x00
___str_7:
	.ascii "P1  WINS!"
	.db 0x00
___str_8:
	.ascii "PLAYER 1"
	.db 0x00
___str_9:
	.ascii "PLAYER 2"
	.db 0x00
___str_10:
	.ascii "SCORE"
	.db 0x00
___str_11:
	.ascii "CHAIN"
	.db 0x00
___str_12:
	.ascii "CLEAR"
	.db 0x00
;./puyopuyo.c:932: static void Game_InitPlayer(Player* p, u8 bx, u8 by) {
;	---------------------------------
; Function Game_InitPlayer
; ---------------------------------
_Game_InitPlayer:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-7
	add	iy, sp
	ld	sp, iy
	ld	-2 (ix), l
	ld	-1 (ix), h
;./puyopuyo.c:934: for (y = 0; y < BOARD_H; y++)
	ld	c, #0x00
;./puyopuyo.c:935: for (x = 0; x < BOARD_W; x++)
00109$:
	ld	a, c
	add	a, a
	add	a, c
	add	a, a
	add	a, -2 (ix)
	ld	e, a
	ld	a, #0x00
	adc	a, -1 (ix)
	ld	d, a
	ld	b, #0x00
00103$:
;./puyopuyo.c:936: p->board[y][x] = PUYO_EMPTY;
	ld	l, b
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x00
;./puyopuyo.c:935: for (x = 0; x < BOARD_W; x++)
	inc	b
	ld	a, b
	sub	a, #0x06
	jr	C, 00103$
;./puyopuyo.c:934: for (y = 0; y < BOARD_H; y++)
	inc	c
	ld	a, c
	sub	a, #0x0b
	jr	C, 00109$
;./puyopuyo.c:938: p->boardX = bx;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0055
	add	hl, de
	ld	a, 4 (ix)
	ld	(hl), a
;./puyopuyo.c:939: p->boardY = by;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0056
	add	hl, de
	ld	a, 5 (ix)
	ld	(hl), a
;./puyopuyo.c:940: p->score = 0;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x004d
	add	hl, de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;./puyopuyo.c:941: p->prevScore = 0xFFFF;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x004f
	add	hl, de
	ld	(hl), #0xff
	inc	hl
	ld	(hl), #0xff
;./puyopuyo.c:942: p->chainCount = 0;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0051
	add	hl, de
	ld	(hl), #0x00
;./puyopuyo.c:943: p->pendingGarbage = 0;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0052
	add	hl, de
	ld	(hl), #0x00
;./puyopuyo.c:944: p->prevGarbage = 0xFF;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0053
	add	hl, de
	ld	(hl), #0xff
;./puyopuyo.c:945: p->alive = TRUE;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0054
	add	hl, de
	ld	(hl), #0x01
;./puyopuyo.c:946: p->dropSpeed = DROP_SPEED_INIT;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x004a
	add	hl, de
	ld	(hl), #0x10
;./puyopuyo.c:947: p->dropTimer = 0;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0049
	add	hl, de
	ld	(hl), #0x00
;./puyopuyo.c:948: p->lockTimer = 0;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x004b
	add	hl, de
	ld	(hl), #0x00
;./puyopuyo.c:949: p->inputDelay = 0;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x004c
	add	hl, de
	ld	(hl), #0x00
;./puyopuyo.c:950: p->rotateDelay = 0;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0057
	add	hl, de
	ld	(hl), #0x00
;./puyopuyo.c:951: p->subY = 0;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0058
	add	hl, de
	ld	(hl), #0x00
;./puyopuyo.c:952: p->garbageFalling = 0;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0059
	add	hl, de
	ld	(hl), #0x00
;./puyopuyo.c:953: p->piecesPlaced = 0;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x005a
	add	hl, de
	ld	(hl), #0x00
;./puyopuyo.c:954: p->maxChain = 0;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x005b
	add	hl, de
	ld	(hl), #0x00
;./puyopuyo.c:955: p->totalCleared = 0;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x005c
	add	hl, de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;./puyopuyo.c:956: p->puyoColor1 = PUYO_EMPTY;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0044
	add	hl, de
	ld	(hl), #0x00
;./puyopuyo.c:957: p->puyoColor2 = PUYO_EMPTY;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0045
	add	hl, de
	ld	(hl), #0x00
;./puyopuyo.c:959: p->nextColor1 = (Math_GetRandom8() % PUYO_COUNT) + 1;
	ld	a, -2 (ix)
	add	a, #0x47
	ld	-5 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
	call	_Math_GetRandom8
	ld	-7 (ix), a
	ld	-6 (ix), #0x00
	ld	de, #0x0005
	pop	hl
	push	hl
	call	__modsint
	inc	sp
	inc	sp
	push	de
	ld	a, -7 (ix)
	ld	-3 (ix), a
	inc	-3 (ix)
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	a, -3 (ix)
	ld	(hl), a
;./puyopuyo.c:960: p->nextColor2 = (Math_GetRandom8() % PUYO_COUNT) + 1;
	ld	a, -2 (ix)
	add	a, #0x48
	ld	-4 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	call	_Math_GetRandom8
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	de, #0x0005
	call	__modsint
	inc	e
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), e
;./puyopuyo.c:961: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;./puyopuyo.c:963: static void Game_SpawnPair(Player* p) {
;	---------------------------------
; Function Game_SpawnPair
; ---------------------------------
_Game_SpawnPair:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	ld	c, l
	ld	b, h
;./puyopuyo.c:964: p->puyoX = 2;
	ld	hl, #0x0042
	add	hl, bc
	ld	(hl), #0x02
;./puyopuyo.c:965: p->puyoY = 0;
	ld	hl, #0x0043
	add	hl, bc
	ld	(hl), #0x00
;./puyopuyo.c:966: p->puyoDir = DIR_UP;
	ld	hl, #0x0046
	add	hl, bc
	ld	(hl), #0x00
;./puyopuyo.c:967: p->subY = 2;  // 2 = emerging from top (show bottom half only at row 0)
	ld	hl, #0x0058
	add	hl, bc
	ld	(hl), #0x02
;./puyopuyo.c:968: p->puyoColor1 = p->nextColor1;
	ld	hl, #0x0044
	add	hl, bc
	ex	de, hl
	ld	hl, #0x0047
	add	hl, bc
	ex	(sp), hl
	pop	hl
	push	hl
	ld	a, (hl)
	ld	(de), a
;./puyopuyo.c:969: p->puyoColor2 = p->nextColor2;
	ld	hl, #0x0045
	add	hl, bc
	ex	de, hl
	ld	hl, #0x0048
	add	hl, bc
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	a, (hl)
	ld	(de), a
;./puyopuyo.c:970: p->nextColor1 = (Math_GetRandom8() % PUYO_COUNT) + 1;
	push	bc
	call	_Math_GetRandom8
	pop	bc
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	de, #0x0005
	call	__modsint
	pop	bc
	inc	e
	pop	hl
	push	hl
	ld	(hl), e
;./puyopuyo.c:971: p->nextColor2 = (Math_GetRandom8() % PUYO_COUNT) + 1;
	push	bc
	call	_Math_GetRandom8
	pop	bc
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	de, #0x0005
	call	__modsint
	pop	bc
	inc	e
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), e
;./puyopuyo.c:972: p->dropTimer = 0;
	ld	hl, #0x0049
	add	hl, bc
	ld	(hl), #0x00
;./puyopuyo.c:973: p->lockTimer = 0;
	ld	hl, #0x004b
	add	hl, bc
	ld	(hl), #0x00
;./puyopuyo.c:974: if (p->board[0][2] != PUYO_EMPTY || p->board[0][3] != PUYO_EMPTY) {
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a, (de)
	or	a, a
	jr	NZ, 00101$
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00104$
00101$:
;./puyopuyo.c:975: p->alive = FALSE;
	ld	hl, #0x0054
	add	hl, bc
	ld	(hl), #0x00
00104$:
;./puyopuyo.c:977: }
	ld	sp, ix
	pop	ix
	ret
;./puyopuyo.c:979: static bool Game_CanPlace(Player* p, u8 x, u8 y) {
;	---------------------------------
; Function Game_CanPlace
; ---------------------------------
_Game_CanPlace:
	ex	de, hl
;./puyopuyo.c:980: if (x >= BOARD_W || y >= BOARD_H) return FALSE;
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x06
	jr	NC, 00101$
	ld	a, 1 (iy)
	inc	iy
	sub	a, #0x0b
	jr	C, 00102$
00101$:
	xor	a, a
	jp	00104$
00102$:
;./puyopuyo.c:981: return (p->board[y][x] == PUYO_EMPTY);
	ld	iy, #3
	add	iy, sp
	ld	l, 0 (iy)
;	spillPairReg hl
;	spillPairReg hl
	ld	c, l
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	e, -1 (iy)
	dec	iy
	pop	hl
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	ld	a, #0x01
	jr	Z, 00112$
	xor	a, a
00112$:
00104$:
;./puyopuyo.c:982: }
	pop	hl
	pop	bc
	jp	(hl)
;./puyopuyo.c:984: static bool Game_CanMovePair(Player* p, i8 dx, i8 dy) {
;	---------------------------------
; Function Game_CanMovePair
; ---------------------------------
_Game_CanMovePair:
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ex	de, hl
;./puyopuyo.c:985: i8 nx = (i8)p->puyoX + dx;
	push	de
	pop	iy
	ld	a, 66 (iy)
	add	a, 4 (ix)
	ld	c, a
;./puyopuyo.c:986: i8 ny = (i8)p->puyoY + dy;
	push	de
	pop	iy
	ld	a, 67 (iy)
	add	a, 5 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;./puyopuyo.c:987: i8 sx = nx + Game_GetSatX(p->puyoDir);
	ld	iy, #0x0046
	add	iy, de
	ld	b, 0 (iy)
	push	hl
	push	bc
	push	de
	push	iy
	ld	a, b
	call	_Game_GetSatX
	pop	iy
	pop	de
	pop	bc
	pop	hl
	add	a, c
	ld	b, a
;./puyopuyo.c:988: i8 sy = ny + Game_GetSatY(p->puyoDir);
	ld	h, 0 (iy)
;	spillPairReg hl
	push	hl
	push	bc
	push	de
	ld	a, h
	call	_Game_GetSatY
	pop	de
	pop	bc
	pop	hl
	add	a, l
	ld	-1 (ix), a
;./puyopuyo.c:989: if (nx < 0 || nx >= BOARD_W || ny < 0 || ny >= BOARD_H) return FALSE;
	bit	7, c
	jr	NZ, 00101$
	ld	a, c
	xor	a, #0x80
	sub	a, #0x86
	jr	NC, 00101$
	bit	7, l
	jr	NZ, 00101$
	ld	a, l
	xor	a, #0x80
	sub	a, #0x8b
	jr	C, 00102$
00101$:
	xor	a, a
	jp	00117$
00102$:
;./puyopuyo.c:990: if (p->board[ny][nx] != PUYO_EMPTY) return FALSE;
	push	de
	ld	e, l
	add	hl, hl
	add	hl, de
	add	hl, hl
	pop	de
	ld	h, #0x00
	add	hl, de
	ld	a, c
	add	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x00
	adc	a, h
	ld	h, a
	ld	a, (hl)
	or	a, a
	jr	Z, 00107$
	xor	a, a
	jp	00117$
00107$:
;./puyopuyo.c:991: if (sx < 0 || sx >= BOARD_W) return FALSE;
	bit	7, b
	jr	NZ, 00108$
	ld	a, b
	xor	a, #0x80
	sub	a, #0x86
	jr	C, 00109$
00108$:
	xor	a, a
	jp	00117$
00109$:
;./puyopuyo.c:992: if (sy >= 0 && sy < BOARD_H && p->board[sy][sx] != PUYO_EMPTY) return FALSE;
	ld	a, -1 (ix)
	xor	a, #0x80
	sub	a, #0x8b
	ld	a, #0x00
	rla
	ld	c, a
	bit	7, -1 (ix)
	jr	NZ, 00112$
	ld	a, c
	or	a, a
	jr	Z, 00112$
	push	de
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	add	hl, hl
	add	hl, de
	add	hl, hl
	pop	de
	ld	h, #0x00
	add	hl, de
	ld	e, b
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00112$
	xor	a, a
	jp	00117$
00112$:
;./puyopuyo.c:993: if (sy >= BOARD_H) return FALSE;
	bit	0, c
	jr	NZ, 00116$
	xor	a, a
	jp	00117$
00116$:
;./puyopuyo.c:994: return TRUE;
	ld	a, #0x01
00117$:
;./puyopuyo.c:995: }
	inc	sp
	pop	ix
	pop	hl
	pop	bc
	jp	(hl)
;./puyopuyo.c:997: static void Game_RotatePair(Player* p, i8 direction) {
;	---------------------------------
; Function Game_RotatePair
; ---------------------------------
_Game_RotatePair:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-8
	add	iy, sp
	ld	sp, iy
	ld	c, l
	ld	b, h
;./puyopuyo.c:998: u8 newDir = (p->puyoDir + direction + 4) % 4;
	ld	hl, #0x0046
	add	hl, bc
	ex	(sp), hl
	pop	hl
	push	hl
	ld	e, (hl)
	ld	d, #0x00
	ld	a, 4 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ld	de, #0x0004
	add	hl, de
	push	bc
	ld	de, #0x0004
	call	__modsint
	pop	bc
;./puyopuyo.c:999: i8 sx = (i8)p->puyoX + Game_GetSatX(newDir);
	ld	hl, #0x0042
	add	hl, bc
	ld	-6 (ix), l
	ld	-5 (ix), h
	ld	l, (hl)
;	spillPairReg hl
	push	hl
	push	bc
	push	de
	ld	a, e
	call	_Game_GetSatX
	pop	de
	pop	bc
	pop	hl
	add	a, l
	ld	-2 (ix), a
;./puyopuyo.c:1000: i8 sy = (i8)p->puyoY + Game_GetSatY(newDir);
	ld	hl, #0x0043
	add	hl, bc
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	l, (hl)
;	spillPairReg hl
	push	hl
	push	bc
	push	de
	ld	a, e
	call	_Game_GetSatY
	pop	de
	pop	bc
	pop	hl
	add	a, l
	ld	d, a
;./puyopuyo.c:1002: if (sx >= 0 && sx < BOARD_W && sy >= 0 && sy < BOARD_H) {
	ld	a, -2 (ix)
	rlca
	and	a,#0x01
	ld	-1 (ix), a
	bit	0, -1 (ix)
	jr	NZ, 00104$
	ld	a, -2 (ix)
	xor	a, #0x80
	sub	a, #0x86
	jr	NC, 00104$
	bit	7, d
	jr	NZ, 00104$
	ld	a, d
	xor	a, #0x80
	sub	a, #0x8b
	jr	NC, 00104$
;./puyopuyo.c:1003: if (p->board[sy][sx] == PUYO_EMPTY) { p->puyoDir = newDir; return; }
	push	de
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	add	hl, hl
	add	hl, de
	add	hl, hl
	pop	de
	ld	h, #0x00
	add	hl, bc
	ld	a, l
	add	a, -2 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	jr	NC, 00217$
	inc	h
00217$:
	ld	a, (hl)
	or	a, a
	jr	NZ, 00104$
	pop	hl
	push	hl
	ld	(hl), e
	jp	00125$
00104$:
;./puyopuyo.c:1005: if (sx >= 0 && sx < BOARD_W && sy < 0) { p->puyoDir = newDir; return; }
	bit	0, -1 (ix)
	jr	NZ, 00109$
	ld	a, -2 (ix)
	xor	a, #0x80
	sub	a, #0x86
	jr	NC, 00109$
	bit	7, d
	jr	Z, 00109$
	pop	hl
	push	hl
	ld	(hl), e
	jp	00125$
00109$:
;./puyopuyo.c:1006: kickX = -Game_GetSatX(newDir);
	push	bc
	push	de
	ld	a, e
	call	_Game_GetSatX
	pop	de
	pop	bc
	neg
	ld	d, a
;./puyopuyo.c:1007: kickY = -Game_GetSatY(newDir);
	push	bc
	push	de
	ld	a, e
	call	_Game_GetSatY
	pop	de
	pop	bc
	neg
	ld	-1 (ix), a
;./puyopuyo.c:1008: px = (i8)p->puyoX + kickX;
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, (hl)
	add	a, d
	ld	d, a
;./puyopuyo.c:1009: py = (i8)p->puyoY + kickY;
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, (hl)
	add	a, -1 (ix)
	ld	-2 (ix), a
;./puyopuyo.c:1010: if (px >= 0 && px < BOARD_W && py >= 0 && py < BOARD_H) {
	bit	7, d
	jp	NZ, 00125$
	ld	a, d
	xor	a, #0x80
	sub	a, #0x86
	jr	NC, 00125$
	bit	7, -2 (ix)
	jr	NZ, 00125$
	ld	a, -2 (ix)
	xor	a, #0x80
	sub	a, #0x8b
	jr	NC, 00125$
;./puyopuyo.c:1011: if (p->board[py][px] == PUYO_EMPTY) {
	push	de
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	add	hl, hl
	add	hl, de
	add	hl, hl
	pop	de
	ld	h, #0x00
	add	hl, bc
	ld	a, l
	add	a, d
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	jr	NC, 00218$
	inc	h
00218$:
	ld	a, (hl)
	or	a, a
	jr	NZ, 00125$
;./puyopuyo.c:1012: sx = px + Game_GetSatX(newDir);
	push	bc
	push	de
	ld	a, e
	call	_Game_GetSatX
	pop	de
	pop	bc
	add	a, d
	ld	-1 (ix), a
;./puyopuyo.c:1013: sy = py + Game_GetSatY(newDir);
	push	bc
	push	de
	ld	a, e
	call	_Game_GetSatY
	pop	de
	pop	bc
	add	a, -2 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;./puyopuyo.c:1014: if (sx >= 0 && sx < BOARD_W && sy >= 0 && sy < BOARD_H && p->board[sy][sx] == PUYO_EMPTY) {
	bit	7, -1 (ix)
	jr	NZ, 00125$
	ld	a, -1 (ix)
	xor	a, #0x80
	sub	a, #0x86
	jr	NC, 00125$
	bit	7, l
	jr	NZ, 00125$
	ld	a, l
	xor	a, #0x80
	sub	a, #0x8b
	jr	NC, 00125$
	push	de
	ld	e, l
	add	hl, hl
	add	hl, de
	add	hl, hl
	pop	de
	ld	h, #0x00
	add	hl, bc
	ld	c, -1 (ix)
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	NZ, 00125$
;./puyopuyo.c:1015: p->puyoX = px; p->puyoY = py; p->puyoDir = newDir; return;
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	(hl), d
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	pop	hl
	push	hl
	ld	(hl), e
00125$:
;./puyopuyo.c:1019: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;./puyopuyo.c:1021: static void Game_LockPair(Player* p) {
;	---------------------------------
; Function Game_LockPair
; ---------------------------------
_Game_LockPair:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
	ld	c, l
	ld	b, h
;./puyopuyo.c:1023: if (p->puyoY < BOARD_H && p->puyoX < BOARD_W)
	ld	iy, #0x0043
	add	iy, bc
	ld	e, 0 (iy)
	ld	hl, #0x0042
	add	hl, bc
	ex	(sp), hl
;./puyopuyo.c:1024: p->board[p->puyoY][p->puyoX] = p->puyoColor1;
	ld	hl, #0x0044
	add	hl, bc
	ld	-3 (ix), l
	ld	-2 (ix), h
;./puyopuyo.c:1023: if (p->puyoY < BOARD_H && p->puyoX < BOARD_W)
	ld	a, e
	sub	a, #0x0b
	jr	NC, 00102$
	pop	hl
	push	hl
	ld	d, (hl)
	ld	a, d
	sub	a, #0x06
	jr	NC, 00102$
;./puyopuyo.c:1024: p->board[p->puyoY][p->puyoX] = p->puyoColor1;
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	h, #0x00
	add	hl, bc
	ld	a, l
	add	a, d
	ld	e, a
	ld	a, h
	adc	a, #0x00
	ld	d, a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	a, (hl)
	ld	(de), a
00102$:
;./puyopuyo.c:1025: sx = p->puyoX + Game_GetSatX(p->puyoDir);
	pop	hl
	push	hl
	ld	e, (hl)
	ld	hl, #0x0046
	add	hl, bc
	ld	d, (hl)
	push	hl
	push	bc
	push	de
	push	iy
	ld	a, d
	call	_Game_GetSatX
	pop	iy
	pop	de
	pop	bc
	pop	hl
	add	a, e
	ld	-1 (ix), a
;./puyopuyo.c:1026: sy = p->puyoY + Game_GetSatY(p->puyoDir);
	ld	e, 0 (iy)
	ld	d, (hl)
	push	bc
	push	de
	ld	a, d
	call	_Game_GetSatY
	pop	de
	pop	bc
	add	a, e
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;./puyopuyo.c:1028: p->board[sy][sx] = p->puyoColor2;
	ld	a, c
	add	a, #0x45
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
;./puyopuyo.c:1027: if (sy < BOARD_H && sx < BOARD_W)
	ld	a, l
	sub	a, #0x0b
	jr	NC, 00105$
	ld	a, -1 (ix)
	sub	a, #0x06
	jr	NC, 00105$
;./puyopuyo.c:1028: p->board[sy][sx] = p->puyoColor2;
	push	de
	ld	e, l
	add	hl, hl
	add	hl, de
	add	hl, hl
	pop	de
	ld	h, #0x00
	add	hl, bc
	ld	a, -1 (ix)
	add	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x00
	adc	a, h
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (de)
	ld	(hl), a
00105$:
;./puyopuyo.c:1029: p->puyoColor1 = PUYO_EMPTY;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), #0x00
;./puyopuyo.c:1030: p->puyoColor2 = PUYO_EMPTY;
	xor	a, a
	ld	(de), a
;./puyopuyo.c:1031: p->subY = 0;
	ld	hl, #0x0058
	add	hl, bc
	ld	(hl), #0x00
;./puyopuyo.c:1032: SFX_Drop();
	push	bc
	call	_SFX_Drop
	pop	bc
;./puyopuyo.c:1033: g_BoardDirty[0] = TRUE; g_BoardDirty[1] = TRUE;
	ld	hl, #_g_BoardDirty+0
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x01
;./puyopuyo.c:1036: p->piecesPlaced++;
	ld	hl, #0x005a
	add	hl, bc
	inc	(hl)
;./puyopuyo.c:1037: if (p->piecesPlaced % 10 == 0 && p->dropSpeed > DROP_SPEED_MIN * 2) {
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	de, #0x000a
	call	__modsint
	pop	bc
	ld	a, d
	or	a, e
	jr	NZ, 00110$
	ld	hl, #0x004a
	add	hl, bc
	ld	c, (hl)
	ld	a, #0x06
	sub	a, c
	jr	NC, 00110$
;./puyopuyo.c:1038: p->dropSpeed -= 2;
	dec	c
	dec	c
	ld	(hl), c
00110$:
;./puyopuyo.c:1040: }
	ld	sp, ix
	pop	ix
	ret
;./puyopuyo.c:1043: static bool Game_GravityStep(Player* p) {
;	---------------------------------
; Function Game_GravityStep
; ---------------------------------
_Game_GravityStep:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
	ex	de, hl
;./puyopuyo.c:1044: bool moved = FALSE;
	ld	-5 (ix), #0x00
;./puyopuyo.c:1048: for (x = 0; x < BOARD_W; x++) {
	ld	c, #0x00
;./puyopuyo.c:1049: for (iy = BOARD_H - 2; iy >= 0; iy--) {
00114$:
	ld	-1 (ix), #0x09
00106$:
;./puyopuyo.c:1050: u8 y = (u8)iy;
	ld	a, -1 (ix)
;./puyopuyo.c:1051: if (p->board[y][x] != PUYO_EMPTY && p->board[y + 1][x] == PUYO_EMPTY) {
	ld	-4 (ix), a
	push	de
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	add	hl, hl
	add	hl, de
	add	hl, hl
	pop	de
	ld	h, #0x00
	add	hl, de
	ld	a, l
	add	a, c
	ld	-3 (ix), a
	ld	a, h
	adc	a, #0x00
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	b, (hl)
	ld	a, b
	or	a, a
	jr	Z, 00107$
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	l
	push	de
	ld	e, l
	add	hl, hl
	add	hl, de
	add	hl, hl
	pop	de
	ld	h, #0x00
	add	hl, de
	ld	a, l
	add	a, c
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	jr	NC, 00144$
	inc	h
00144$:
	ld	a, (hl)
	or	a, a
	jr	NZ, 00107$
;./puyopuyo.c:1052: p->board[y + 1][x] = p->board[y][x];
	ld	(hl), b
;./puyopuyo.c:1053: p->board[y][x] = PUYO_EMPTY;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), #0x00
;./puyopuyo.c:1054: moved = TRUE;
	ld	-5 (ix), #0x01
00107$:
;./puyopuyo.c:1049: for (iy = BOARD_H - 2; iy >= 0; iy--) {
	dec	-1 (ix)
	bit	7, -1 (ix)
	jr	Z, 00106$
;./puyopuyo.c:1048: for (x = 0; x < BOARD_W; x++) {
	inc	c
	ld	a, c
	sub	a, #0x06
	jr	C, 00114$
;./puyopuyo.c:1058: return moved;
	ld	a, -5 (ix)
;./puyopuyo.c:1059: }
	ld	sp, ix
	pop	ix
	ret
;./puyopuyo.c:1062: static void Game_AnimateGravity(Player* p, u8 playerIdx) {
;	---------------------------------
; Function Game_AnimateGravity
; ---------------------------------
_Game_AnimateGravity:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-11
	add	iy, sp
	ld	sp, iy
;./puyopuyo.c:1065: bx = p->boardX;
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	bc,#85
	add	hl,bc
	ld	a, (hl)
	ld	-11 (ix), a
;./puyopuyo.c:1066: by = p->boardY;
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	hl, #86
	add	hl, bc
	ld	a, (hl)
	ld	-10 (ix), a
;./puyopuyo.c:1068: while (TRUE) {
00116$:
;./puyopuyo.c:1070: bool willFall = FALSE;
	ld	-9 (ix), #0x00
;./puyopuyo.c:1071: for (x = 0; x < BOARD_W; x++) {
	ld	-4 (ix), #0x00
;./puyopuyo.c:1072: for (iy = BOARD_H - 2; iy >= 0; iy--) {
00136$:
	ld	-3 (ix), #0x09
00124$:
;./puyopuyo.c:1073: if (p->board[(u8)iy][x] != PUYO_EMPTY && p->board[(u8)iy + 1][x] == PUYO_EMPTY) {
	ld	a, -3 (ix)
	ld	-5 (ix), a
	ld	c, a
	add	a, a
	add	a, c
	add	a, a
	add	a, -2 (ix)
	ld	c, a
	ld	a, #0x00
	adc	a, -1 (ix)
	ld	b, a
	ld	l, -4 (ix)
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	ld	-6 (ix), a
	or	a, a
	jr	Z, 00125$
	inc	-5 (ix)
	ld	a, -5 (ix)
	ld	c, a
	add	a, a
	add	a, c
	add	a, a
	ld	-5 (ix), a
	add	a, -2 (ix)
	ld	-8 (ix), a
	ld	a, #0x00
	adc	a, -1 (ix)
	ld	-7 (ix), a
	ld	a, -4 (ix)
	add	a, -8 (ix)
	ld	-6 (ix), a
	ld	a, #0x00
	adc	a, -7 (ix)
	ld	-5 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, (hl)
	or	a, a
	jr	NZ, 00125$
;./puyopuyo.c:1074: willFall = TRUE;
	ld	-9 (ix), #0x01
;./puyopuyo.c:1075: break;
	jp	00104$
00125$:
;./puyopuyo.c:1072: for (iy = BOARD_H - 2; iy >= 0; iy--) {
	dec	-3 (ix)
	bit	7, -3 (ix)
	jr	Z, 00124$
00104$:
;./puyopuyo.c:1078: if (willFall) break;
	ld	a, -9 (ix)
	or	a, a
	jr	NZ, 00107$
;./puyopuyo.c:1071: for (x = 0; x < BOARD_W; x++) {
	inc	-4 (ix)
	ld	a, -4 (ix)
	sub	a, #0x06
	jr	C, 00136$
00107$:
;./puyopuyo.c:1080: if (!willFall) break;
	ld	a, -9 (ix)
	or	a, a
	jp	Z, 00132$
;./puyopuyo.c:1083: for (x = 0; x < BOARD_W; x++) {
	ld	c, #0x00
;./puyopuyo.c:1084: for (iy = BOARD_H - 2; iy >= 0; iy--) {
00142$:
	ld	b, #0x09
00128$:
;./puyopuyo.c:1085: u8 y = (u8)iy;
;./puyopuyo.c:1086: if (p->board[y][x] != PUYO_EMPTY && p->board[y + 1][x] == PUYO_EMPTY) {
	ld	-4 (ix), b
	ld	a, b
	ld	e, a
	add	a, a
	add	a, e
	add	a, a
	add	a, -2 (ix)
	ld	e, a
	ld	a, #0x00
	adc	a, -1 (ix)
	ld	d, a
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ld	e, (hl)
	ld	a, e
	or	a, a
	jp	Z, 00129$
	ld	a, -4 (ix)
	inc	a
	push	de
	ld	e, a
	add	a, a
	add	a, e
	add	a, a
	pop	de
	add	a, -2 (ix)
	ld	d, a
	ld	a, #0x00
	adc	a, -1 (ix)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, d
	add	a, c
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	jr	NC, 00202$
	inc	h
00202$:
	ld	a, (hl)
	or	a, a
	jp	NZ, 00129$
;./puyopuyo.c:1087: u8 base = PAT_PUYO_BASE + (p->board[y][x] - 1) * 4;
	ld	a, e
	dec	a
	add	a, a
	add	a, a
	inc	a
	ld	-3 (ix), a
;./puyopuyo.c:1088: u8 ty = by + y * 2 + 1; // offset by 1 tile (8px)
	ld	a, -4 (ix)
	add	a, a
	ld	e, -10 (ix)
	add	a, e
	ld	e, a
	inc	a
	ld	-9 (ix), a
;./puyopuyo.c:1090: RestoreTile(bx + x * 2, by + y * 2);
	ld	a, c
	add	a, a
	ld	d, -11 (ix)
	add	a, d
	ld	-8 (ix), a
	push	bc
	push	de
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -8 (ix)
	call	_RestoreTile
	pop	de
	pop	bc
;./puyopuyo.c:1091: RestoreTile(bx + x * 2 + 1, by + y * 2);
	ld	a, -8 (ix)
	inc	a
	ld	-7 (ix), a
	push	bc
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -7 (ix)
	call	_RestoreTile
	pop	bc
;./puyopuyo.c:1093: VDP_Poke_GM2(bx + x * 2,     ty,     base);
	ld	e, -8 (ix)
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	l, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	ld	d, h
	ld	hl, (_g_ScreenLayoutLow)
	ld	-6 (ix), a
	ld	-5 (ix), d
	ld	a, l
	add	a, -6 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, -5 (ix)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	d, #0x00
	add	hl, de
	push	bc
	ex	de, hl
	ld	a, -3 (ix)
	call	_VDP_Poke_16K
	pop	bc
;./puyopuyo.c:1094: VDP_Poke_GM2(bx + x * 2 + 1, ty,     base + 1);
	ld	a, -3 (ix)
	ld	-4 (ix), a
	inc	a
	ld	-3 (ix), a
	ld	e, -7 (ix)
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	hl, (_g_ScreenLayoutLow)
	ld	a, l
	add	a, -6 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, -5 (ix)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	d, #0x00
	add	hl, de
	push	bc
	ex	de, hl
	ld	a, -3 (ix)
	call	_VDP_Poke_16K
	pop	bc
;./puyopuyo.c:1095: VDP_Poke_GM2(bx + x * 2,     ty + 1, base + 2);
	ld	a, -4 (ix)
	add	a, #0x02
	ld	-3 (ix), a
	ld	a, -9 (ix)
	inc	a
	ld	-5 (ix), a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -8 (ix)
	ld	-6 (ix), a
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, (_g_ScreenLayoutLow)
	add	hl, de
	ld	e, -6 (ix)
	ld	d, #0x00
	add	hl, de
	push	bc
	ex	de, hl
	ld	a, -3 (ix)
	call	_VDP_Poke_16K
	pop	bc
;./puyopuyo.c:1096: VDP_Poke_GM2(bx + x * 2 + 1, ty + 1, base + 3);
	ld	a, -4 (ix)
	add	a, #0x03
	ld	-3 (ix), a
	ld	a, -7 (ix)
	ld	-4 (ix), a
	ld	l, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, (_g_ScreenLayoutLow)
	add	hl, de
	ld	e, -4 (ix)
	ld	d, #0x00
	add	hl, de
	push	bc
	ex	de, hl
	ld	a, -3 (ix)
	call	_VDP_Poke_16K
	pop	bc
;./puyopuyo.c:1096: VDP_Poke_GM2(bx + x * 2 + 1, ty + 1, base + 3);
00129$:
;./puyopuyo.c:1084: for (iy = BOARD_H - 2; iy >= 0; iy--) {
	dec	b
	bit	7, b
	jp	Z, 00128$
;./puyopuyo.c:1083: for (x = 0; x < BOARD_W; x++) {
	inc	c
	ld	a, c
	sub	a, #0x06
	jp	C, 00142$
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/system.h:145: inline void Halt() { __asm__("halt"); }
	halt
;./puyopuyo.c:1103: Game_GravityStep(p);
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Game_GravityStep
;./puyopuyo.c:1106: Shadow_Invalidate();
	call	_Shadow_Invalidate
;./puyopuyo.c:1107: g_BoardDirty[0] = TRUE; g_BoardDirty[1] = TRUE;
	ld	hl, #_g_BoardDirty+0
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x01
;./puyopuyo.c:1108: Game_DrawBoard(p, playerIdx);
	ld	a, 4 (ix)
	push	af
	inc	sp
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Game_DrawBoard
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/system.h:145: inline void Halt() { __asm__("halt"); }
	halt
;./puyopuyo.c:1109: Halt(); // 1 frame at full position
	jp	00116$
00132$:
;./puyopuyo.c:1111: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;./puyopuyo.c:1118: static void Game_FloodFill(Player* p, u8 x, u8 y, u8 color) {
;	---------------------------------
; Function Game_FloodFill
; ---------------------------------
_Game_FloodFill:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	ld	c, l
	ld	b, h
;./puyopuyo.c:1119: if (x >= BOARD_W || y >= BOARD_H) return;
	ld	a, 4 (ix)
	sub	a, #0x06
	jp	NC,00116$
	ld	a, 5 (ix)
	sub	a, #0x0b
	jp	NC,00116$
;./puyopuyo.c:1120: if (g_Visited[y][x]) return;
	ld	e, 5 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	de, #_g_Visited
	add	hl, de
	ld	e, 4 (ix)
	ld	a, e
	add	a, l
	ld	-2 (ix), a
	ld	a, #0x00
	adc	a, h
	ld	-1 (ix), a
	pop	hl
	push	hl
	ld	a, (hl)
	or	a, a
	jp	NZ,00116$
;./puyopuyo.c:1121: if (p->board[y][x] != color) return;
	push	de
	ld	l, 5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	add	hl, hl
	add	hl, de
	add	hl, hl
	pop	de
	ld	h, #0x00
	add	hl, bc
	ld	d, #0x00
	add	hl, de
	ld	d, (hl)
	ld	a, 6 (ix)
	sub	a, d
	jp	NZ,00116$
;./puyopuyo.c:1122: g_Visited[y][x] = 1;
	pop	hl
	push	hl
	ld	(hl), #0x01
;./puyopuyo.c:1123: g_GroupX[g_GroupSize] = x;
	ld	a, (_g_GroupSize+0)
	add	a, #<(_g_GroupX)
	ld	-2 (ix), a
	ld	a, #0x00
	adc	a, #>(_g_GroupX)
	ld	-1 (ix), a
	pop	hl
	push	hl
	ld	(hl), e
;./puyopuyo.c:1124: g_GroupY[g_GroupSize] = y;
	ld	a, (_g_GroupSize+0)
	add	a, #<(_g_GroupY)
	ld	-2 (ix), a
	ld	a, #0x00
	adc	a, #>(_g_GroupY)
	ld	-1 (ix), a
	pop	hl
	push	hl
	ld	a, 5 (ix)
	ld	(hl), a
;./puyopuyo.c:1125: g_GroupSize++;
	ld	iy, #_g_GroupSize
	inc	0 (iy)
;./puyopuyo.c:1126: if (x > 0) Game_FloodFill(p, x - 1, y, color);
	ld	a, e
	or	a, a
	jr	Z, 00109$
	ld	a, e
	dec	a
	push	bc
	push	de
	ld	h, 6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, 5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_Game_FloodFill
	pop	de
	pop	bc
00109$:
;./puyopuyo.c:1127: if (x < BOARD_W - 1) Game_FloodFill(p, x + 1, y, color);
	ld	a,e
	cp	a,#0x05
	jr	NC, 00111$
	inc	a
	push	bc
	push	de
	ld	h, 6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, 5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_Game_FloodFill
	pop	de
	pop	bc
00111$:
;./puyopuyo.c:1128: if (y > 0) Game_FloodFill(p, x, y - 1, color);
	ld	a, 5 (ix)
	or	a, a
	jr	Z, 00113$
	ld	a, 5 (ix)
	dec	a
	push	bc
	push	de
	ld	h, 6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	d,a
	push	de
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_Game_FloodFill
	pop	de
	pop	bc
00113$:
;./puyopuyo.c:1129: if (y < BOARD_H - 1) Game_FloodFill(p, x, y + 1, color);
	ld	a, 5 (ix)
	sub	a, #0x0a
	jr	NC, 00116$
	ld	a, 5 (ix)
	inc	a
	ld	h, 6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	d,a
	push	de
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_Game_FloodFill
00116$:
;./puyopuyo.c:1130: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	inc	sp
	jp	(hl)
;./puyopuyo.c:1132: static u8 Game_ClearGroups(Player* p) {
;	---------------------------------
; Function Game_ClearGroups
; ---------------------------------
_Game_ClearGroups:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-16
	add	iy, sp
	ld	sp, iy
	ld	-6 (ix), l
	ld	-5 (ix), h
;./puyopuyo.c:1133: u8 x, y, i, totalCleared = 0, color;
	ld	-4 (ix), #0x00
;./puyopuyo.c:1134: for (y = 0; y < BOARD_H; y++)
	ld	-1 (ix), #0x00
;./puyopuyo.c:1135: for (x = 0; x < BOARD_W; x++)
00141$:
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ex	de, hl
	ld	hl, #_g_Visited
	add	hl, de
	ex	de, hl
	ld	c, #0x00
00125$:
;./puyopuyo.c:1136: g_Visited[y][x] = 0;
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x00
;./puyopuyo.c:1135: for (x = 0; x < BOARD_W; x++)
	inc	c
	ld	a, c
	sub	a, #0x06
	jr	C, 00125$
;./puyopuyo.c:1134: for (y = 0; y < BOARD_H; y++)
	inc	-1 (ix)
	ld	a, -1 (ix)
	sub	a, #0x0b
	jr	C, 00141$
;./puyopuyo.c:1137: for (y = 0; y < BOARD_H; y++) {
	ld	-3 (ix), #0x00
;./puyopuyo.c:1138: for (x = 0; x < BOARD_W; x++) {
00161$:
	ld	c, -3 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ex	de, hl
	ld	hl, #_g_Visited
	add	hl, de
	ex	(sp), hl
	ld	a, -3 (ix)
	ld	c, a
	add	a, a
	add	a, c
	add	a, a
	add	a, -6 (ix)
	ld	-14 (ix), a
	ld	a, #0x00
	adc	a, -5 (ix)
	ld	-13 (ix), a
	ld	-2 (ix), #0x00
00135$:
;./puyopuyo.c:1139: color = p->board[y][x];
	ld	a, -2 (ix)
	add	a, -14 (ix)
	ld	-8 (ix), a
	ld	a, #0x00
	adc	a, -13 (ix)
	ld	-7 (ix), a
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	a, (hl)
;./puyopuyo.c:1140: if (color >= 1 && color <= PUYO_COUNT && !g_Visited[y][x]) {
	ld	-1 (ix), a
	sub	a, #0x01
	jp	C, 00136$
	ld	a, #0x05
	sub	a, -1 (ix)
	jp	C, 00136$
	ld	a, -2 (ix)
	add	a, -16 (ix)
	ld	-8 (ix), a
	ld	a, #0x00
	adc	a, -15 (ix)
	ld	-7 (ix), a
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	a, (hl)
	or	a, a
	jp	NZ, 00136$
;./puyopuyo.c:1141: g_GroupSize = 0;
	ld	hl, #_g_GroupSize
	ld	(hl), #0x00
;./puyopuyo.c:1142: Game_FloodFill(p, x, y, color);
	ld	h, -1 (ix)
	ld	l, -3 (ix)
	push	hl
	ld	a, -2 (ix)
	push	af
	inc	sp
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Game_FloodFill
;./puyopuyo.c:1143: if (g_GroupSize >= 4) {
	ld	a, (_g_GroupSize+0)
	sub	a, #0x04
	jp	C, 00136$
;./puyopuyo.c:1145: for (i = 0; i < g_GroupSize; i++)
	ld	-1 (ix), #0x00
00130$:
	ld	hl, #_g_GroupSize
	ld	a, -1 (ix)
	sub	a, (hl)
	jr	NC, 00103$
;./puyopuyo.c:1146: p->board[g_GroupY[i]][g_GroupX[i]] = PUYO_EMPTY;
	ld	a, #<(_g_GroupY)
	add	a, -1 (ix)
	ld	-8 (ix), a
	ld	a, #>(_g_GroupY)
	adc	a, #0x00
	ld	-7 (ix), a
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	a, (hl)
	ld	c, a
	add	a, a
	add	a, c
	add	a, a
	add	a, -6 (ix)
	ld	c, a
	ld	a, #0x00
	adc	a, -5 (ix)
	ld	b, a
	ld	a, #<(_g_GroupX)
	add	a, -1 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>(_g_GroupX)
	adc	a, #0x00
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	l, (hl)
;	spillPairReg hl
	ld	h, #0x00
	add	hl, bc
	ld	(hl), #0x00
;./puyopuyo.c:1145: for (i = 0; i < g_GroupSize; i++)
	inc	-1 (ix)
	jp	00130$
00103$:
;./puyopuyo.c:1147: totalCleared += g_GroupSize;
	ld	hl, #_g_GroupSize
	ld	a, -4 (ix)
	add	a, (hl)
	ld	-4 (ix), a
;./puyopuyo.c:1149: for (i = 0; i < g_GroupSize; i++) {
	ld	-1 (ix), #0x00
00133$:
	ld	hl, #_g_GroupSize
	ld	a, -1 (ix)
	sub	a, (hl)
	jp	NC, 00136$
;./puyopuyo.c:1150: u8 gx = g_GroupX[i], gy = g_GroupY[i];
	ld	a, #<(_g_GroupX)
	add	a, -1 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>(_g_GroupX)
	adc	a, #0x00
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (hl)
	ld	-12 (ix), a
	ld	a, #<(_g_GroupY)
	add	a, -1 (ix)
	ld	e, a
	ld	a, #>(_g_GroupY)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	-11 (ix), a
;./puyopuyo.c:1151: if (gx > 0 && p->board[gy][gx-1] == PUYO_GARBAGE)
	ld	a, -12 (ix)
	or	a, a
	jr	Z, 00105$
	ld	a, -11 (ix)
	ld	c, a
	add	a, a
	add	a, c
	add	a, a
	ld	-7 (ix), a
	add	a, -6 (ix)
	ld	-10 (ix), a
	ld	a, #0x00
	adc	a, -5 (ix)
	ld	-9 (ix), a
	ld	a, -12 (ix)
	ld	-7 (ix), a
	dec	-7 (ix)
	ld	a, -7 (ix)
	add	a, -10 (ix)
	ld	-8 (ix), a
	ld	a, #0x00
	adc	a, -9 (ix)
	ld	-7 (ix), a
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	a, (hl)
	sub	a, #0x06
	jr	NZ, 00105$
;./puyopuyo.c:1152: p->board[gy][gx-1] = (Math_GetRandom8() % PUYO_COUNT) + 1;
	call	_Math_GetRandom8
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	de, #0x0005
	call	__modsint
	inc	e
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	(hl), e
00105$:
;./puyopuyo.c:1153: if (gx < BOARD_W-1 && p->board[gy][gx+1] == PUYO_GARBAGE)
	ld	a, -12 (ix)
	sub	a, #0x05
	jr	NC, 00108$
	ld	a, -11 (ix)
	ld	c, a
	add	a, a
	add	a, c
	add	a, a
	add	a, -6 (ix)
	ld	c, a
	ld	a, #0x00
	adc	a, -5 (ix)
	ld	b, a
	ld	l, -12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	l
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	sub	a, #0x06
	jr	NZ, 00108$
;./puyopuyo.c:1154: p->board[gy][gx+1] = (Math_GetRandom8() % PUYO_COUNT) + 1;
	push	hl
	call	_Math_GetRandom8
	pop	hl
	ld	c, a
	ld	b, #0x00
	push	hl
	ld	de, #0x0005
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	__modsint
	pop	hl
	inc	e
	ld	(hl), e
00108$:
;./puyopuyo.c:1155: if (gy > 0 && p->board[gy-1][gx] == PUYO_GARBAGE)
	ld	a, -11 (ix)
	or	a, a
	jr	Z, 00111$
	ld	a, -11 (ix)
	dec	a
	ld	c, a
	add	a, a
	add	a, c
	add	a, a
	add	a, -6 (ix)
	ld	c, a
	ld	a, #0x00
	adc	a, -5 (ix)
	ld	b, a
	ld	a, -12 (ix)
	add	a, c
	ld	c, a
	ld	a, #0x00
	adc	a, b
	ld	b, a
	ld	a, (bc)
	sub	a, #0x06
	jr	NZ, 00111$
;./puyopuyo.c:1156: p->board[gy-1][gx] = (Math_GetRandom8() % PUYO_COUNT) + 1;
	push	bc
	call	_Math_GetRandom8
	pop	bc
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	de, #0x0005
	call	__modsint
	pop	bc
	ld	a, e
	inc	a
	ld	(bc), a
00111$:
;./puyopuyo.c:1157: if (gy < BOARD_H-1 && p->board[gy+1][gx] == PUYO_GARBAGE)
	ld	a, -11 (ix)
	sub	a, #0x0a
	jr	NC, 00134$
	ld	a, -11 (ix)
	ld	-7 (ix), a
	inc	-7 (ix)
	ld	a, -7 (ix)
	ld	c, a
	add	a, a
	add	a, c
	add	a, a
	ld	-7 (ix), a
	add	a, -6 (ix)
	ld	-8 (ix), a
	ld	a, #0x00
	adc	a, -5 (ix)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	add	a, -12 (ix)
	ld	-10 (ix), a
	ld	a, -7 (ix)
	adc	a, #0x00
	ld	-9 (ix), a
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	a, (hl)
	sub	a, #0x06
	jr	NZ, 00134$
;./puyopuyo.c:1158: p->board[gy+1][gx] = (Math_GetRandom8() % PUYO_COUNT) + 1;
	call	_Math_GetRandom8
	ld	-8 (ix), a
	ld	-7 (ix), #0x00
	ld	de, #0x0005
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__modsint
	ld	-8 (ix), e
	ld	-7 (ix), d
	ld	a, -8 (ix)
	ld	-7 (ix), a
	inc	a
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	(hl), a
00134$:
;./puyopuyo.c:1149: for (i = 0; i < g_GroupSize; i++) {
	inc	-1 (ix)
	jp	00133$
00136$:
;./puyopuyo.c:1138: for (x = 0; x < BOARD_W; x++) {
	inc	-2 (ix)
	ld	a, -2 (ix)
	sub	a, #0x06
	jp	C, 00135$
;./puyopuyo.c:1137: for (y = 0; y < BOARD_H; y++) {
	inc	-3 (ix)
	ld	a, -3 (ix)
	sub	a, #0x0b
	jp	C, 00161$
;./puyopuyo.c:1164: return totalCleared;
	ld	a, -4 (ix)
;./puyopuyo.c:1165: }
	ld	sp, ix
	pop	ix
	ret
;./puyopuyo.c:1168: static void Game_FlashCleared(Player* p, u8 playerIdx) {
;	---------------------------------
; Function Game_FlashCleared
; ---------------------------------
_Game_FlashCleared:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-10
	add	iy, sp
	ld	sp, iy
	ex	de, hl
;./puyopuyo.c:1170: bx = p->boardX;
	push	de
	pop	iy
	ld	a, 85 (iy)
	ld	-10 (ix), a
;./puyopuyo.c:1171: by = p->boardY;
	ld	hl, #86
	add	hl, de
	ld	a, (hl)
	ld	-9 (ix), a
;./puyopuyo.c:1172: for (i = 0; i < g_GroupSize; i++) {
	ld	bc, #_g_Shadow+0
	ld	e, 4 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ex	de, hl
	ld	-1 (ix), #0x00
00107$:
	ld	hl, #_g_GroupSize
	ld	a, -1 (ix)
	sub	a, (hl)
	jp	NC, 00109$
;./puyopuyo.c:1173: x = g_GroupX[i]; y = g_GroupY[i];
	ld	a, #<(_g_GroupX)
	add	a, -1 (ix)
	ld	c, a
	ld	a, #>(_g_GroupX)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	-8 (ix), a
	ld	a, #<(_g_GroupY)
	add	a, -1 (ix)
	ld	c, a
	ld	a, #>(_g_GroupY)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	-7 (ix), a
;./puyopuyo.c:1174: tx = bx + x * 2; ty = by + y * 2;
	ld	a, -8 (ix)
	add	a, a
	ld	c, -10 (ix)
	add	a, c
	ld	-2 (ix), a
	ld	a, -7 (ix)
	add	a, a
	ld	c, -9 (ix)
	add	a, c
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	-6 (ix), a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	iy, (_g_ScreenLayoutLow)
	ld	c, l
	ld	b, h
	add	iy, bc
	ld	c, -2 (ix)
	ld	b, #0x00
	ld	-5 (ix), c
	ld	-4 (ix), b
	add	iy, bc
	push	hl
	push	de
	push	iy
	pop	de
	ld	a, #0x1f
	call	_VDP_Poke_16K
	pop	de
	pop	hl
;./puyopuyo.c:1177: VDP_Poke_GM2(tx + 1, ty,     PAT_EXPLODE);
	ld	a, -2 (ix)
	inc	a
	ld	-3 (ix), a
	ld	-2 (ix), a
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	bc, (_g_ScreenLayoutLow)
	add	hl, bc
	ld	c, -2 (ix)
	ld	b, #0x00
	add	hl, bc
	ex	de, hl
	push	hl
	ld	a, #0x1f
	call	_VDP_Poke_16K
	pop	de
;./puyopuyo.c:1178: VDP_Poke_GM2(tx,     ty + 1, PAT_EXPLODE);
	ld	a, -6 (ix)
	inc	a
	ld	-2 (ix), a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc, (_g_ScreenLayoutLow)
	add	hl, bc
	ld	c, -5 (ix)
	ld	b, -4 (ix)
	add	hl, bc
	ex	de, hl
	push	hl
	ld	a, #0x1f
	call	_VDP_Poke_16K
	pop	de
;./puyopuyo.c:1179: VDP_Poke_GM2(tx + 1, ty + 1, PAT_EXPLODE);
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	c, -3 (ix)
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:1389: inline void VDP_Poke_GM2(u8 x, u8 y, u8 value) { VDP_Poke(value, g_ScreenLayoutLow + (y * 32) + x, g_ScreenLayoutHigh); }
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	ld	b, h
	ld	hl, (_g_ScreenLayoutLow)
	add	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	adc	a, h
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	b, #0x00
	add	hl, bc
	ex	de, hl
	push	hl
	ld	a, #0x1f
	call	_VDP_Poke_16K
	pop	de
;./puyopuyo.c:1180: g_Shadow[playerIdx][y][x] = 0xFF; // force redraw next frame
	ld	l, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	c, l
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	h, #0x00
	add	hl, de
	ld	c, -8 (ix)
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0xff
;./puyopuyo.c:1172: for (i = 0; i < g_GroupSize; i++) {
	inc	-1 (ix)
	jp	00107$
00109$:
;./puyopuyo.c:1182: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;./puyopuyo.c:1185: static void Game_ShowChain(u8 chainCount) {
;	---------------------------------
; Function Game_ShowChain
; ---------------------------------
_Game_ShowChain:
	ld	c, a
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x0e
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x0a
;./puyopuyo.c:1187: Print_DrawChar('0' + chainCount);
	ld	a, c
	add	a, #0x30
	call	_Print_DrawChar
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x0e
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x0b
;./puyopuyo.c:1189: Print_DrawChar('C');
	ld	a, #0x43
;./puyopuyo.c:1190: }
	jp	_Print_DrawChar
;./puyopuyo.c:1193: static void Game_ClearChainText(void) {
;	---------------------------------
; Function Game_ClearChainText
; ---------------------------------
_Game_ClearChainText:
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x0e
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x0a
;./puyopuyo.c:1195: Print_DrawChar(' ');
	ld	a, #0x20
	call	_Print_DrawChar
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x0e
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x0b
;./puyopuyo.c:1197: Print_DrawChar(' ');
	ld	a, #0x20
;./puyopuyo.c:1198: }
	jp	_Print_DrawChar
;./puyopuyo.c:1203: static bool Game_IsInDanger(Player* p) {
;	---------------------------------
; Function Game_IsInDanger
; ---------------------------------
_Game_IsInDanger:
	ex	de, hl
;./puyopuyo.c:1205: for (x = 0; x < BOARD_W; x++) {
	ld	iy, #0x0006
	add	iy, de
	ld	c, #0x00
00105$:
;./puyopuyo.c:1206: if (p->board[0][x] != PUYO_EMPTY || p->board[1][x] != PUYO_EMPTY)
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	NZ, 00101$
	push	iy
	pop	hl
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00106$
00101$:
;./puyopuyo.c:1207: return TRUE;
	ld	a, #0x01
	ret
00106$:
;./puyopuyo.c:1205: for (x = 0; x < BOARD_W; x++) {
	inc	c
	ld	a, c
	sub	a, #0x06
	jr	C, 00105$
;./puyopuyo.c:1209: return FALSE;
	xor	a, a
;./puyopuyo.c:1210: }
	ret
;./puyopuyo.c:1212: static void Game_ChainLoop(Player* p, Player* opponent) {
;	---------------------------------
; Function Game_ChainLoop
; ---------------------------------
_Game_ChainLoop:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-19
	add	iy, sp
	ld	sp, iy
	ld	-6 (ix), l
	ld	-5 (ix), h
	ld	-8 (ix), e
	ld	-7 (ix), d
;./puyopuyo.c:1213: u8 chainCount = 0, totalGarbage = 0, cleared;
	ld	-4 (ix), #0x00
;./puyopuyo.c:1214: u8 playerIdx = (p == &g_Player[0]) ? 0 : 1;
	ld	a, #<(_g_Player)
	sub	a, -6 (ix)
	jr	NZ, 00168$
	ld	a, #>(_g_Player)
	sub	a, -5 (ix)
	jr	NZ, 00168$
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
	jp	00169$
00168$:
	ld	-2 (ix), #0x01
	ld	-1 (ix), #0
00169$:
	ld	a, -2 (ix)
	ld	-14 (ix), a
;./puyopuyo.c:1217: while (TRUE) {
	ld	-3 (ix), #0x00
00130$:
;./puyopuyo.c:1218: Game_AnimateGravity(p, playerIdx);
	ld	a, -14 (ix)
	push	af
	inc	sp
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Game_AnimateGravity
;./puyopuyo.c:1223: u8 groupsFound = 0;
	ld	-13 (ix), #0x00
;./puyopuyo.c:1224: for (y = 0; y < BOARD_H; y++)
	ld	-2 (ix), #0x00
;./puyopuyo.c:1225: for (x = 0; x < BOARD_W; x++)
00178$:
	ld	c, -2 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	-10 (ix), l
	ld	-9 (ix), h
	ld	a, -10 (ix)
	add	a, #<(_g_Visited)
	ld	-12 (ix), a
	ld	a, -9 (ix)
	adc	a, #>(_g_Visited)
	ld	-11 (ix), a
	ld	-1 (ix), #0x00
00158$:
;./puyopuyo.c:1226: g_Visited[y][x] = 0;
	ld	a, -12 (ix)
	add	a, -1 (ix)
	ld	-10 (ix), a
	ld	a, -11 (ix)
	adc	a, #0x00
	ld	-9 (ix), a
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	(hl), #0x00
;./puyopuyo.c:1225: for (x = 0; x < BOARD_W; x++)
	inc	-1 (ix)
	ld	a, -1 (ix)
	sub	a, #0x06
	jr	C, 00158$
;./puyopuyo.c:1224: for (y = 0; y < BOARD_H; y++)
	inc	-2 (ix)
	ld	a, -2 (ix)
	sub	a, #0x0b
	jr	C, 00178$
;./puyopuyo.c:1228: for (y = 0; y < BOARD_H; y++) {
	ld	c, #0x00
;./puyopuyo.c:1229: for (x = 0; x < BOARD_W; x++) {
00186$:
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ex	de, hl
	ld	hl, #_g_Visited
	add	hl, de
	ex	de, hl
	ld	a, c
	add	a, a
	add	a, c
	add	a, a
	add	a, -6 (ix)
	ld	-10 (ix), a
	ld	a, #0x00
	adc	a, -5 (ix)
	ld	-9 (ix), a
	ld	b, #0x00
00162$:
;./puyopuyo.c:1230: color = p->board[y][x];
	ld	a, -10 (ix)
	add	a, b
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -9 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, (hl)
;./puyopuyo.c:1231: if (color >= 1 && color <= PUYO_COUNT && !g_Visited[y][x]) {
	ld	-1 (ix), a
	sub	a, #0x01
	jr	C, 00163$
	ld	a, #0x05
	sub	a, -1 (ix)
	jr	C, 00163$
	ld	l, b
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	NZ, 00163$
;./puyopuyo.c:1232: g_GroupSize = 0;
	ld	hl, #_g_GroupSize
	ld	(hl), #0x00
;./puyopuyo.c:1233: Game_FloodFill(p, x, y, color);
	push	bc
	push	de
	ld	a, -1 (ix)
	push	af
	inc	sp
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Game_FloodFill
	pop	de
	pop	bc
;./puyopuyo.c:1234: if (g_GroupSize >= 4) {
	ld	a, (_g_GroupSize+0)
	sub	a, #0x04
	jr	C, 00163$
;./puyopuyo.c:1236: Game_FlashCleared(p, playerIdx);
	push	bc
	push	de
	ld	a, -14 (ix)
	push	af
	inc	sp
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Game_FlashCleared
	pop	de
	pop	bc
;./puyopuyo.c:1237: groupsFound = 1;
	ld	-13 (ix), #0x01
00163$:
;./puyopuyo.c:1229: for (x = 0; x < BOARD_W; x++) {
	inc	b
	ld	a, b
	sub	a, #0x06
	jr	C, 00162$
;./puyopuyo.c:1228: for (y = 0; y < BOARD_H; y++) {
	inc	c
	ld	a, c
	sub	a, #0x0b
	jp	C, 00186$
;./puyopuyo.c:1243: if (groupsFound) {
	ld	a, -13 (ix)
	or	a, a
	jr	Z, 00112$
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/system.h:145: inline void Halt() { __asm__("halt"); }
	halt
	halt
	halt
;./puyopuyo.c:1245: Halt(); Halt(); Halt();
00112$:
;./puyopuyo.c:1250: cleared = Game_ClearGroups(p);
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Game_ClearGroups
	ld	c, a
	ld	-1 (ix), c
;./puyopuyo.c:1251: if (cleared == 0) break;
	ld	a, c
	or	a, a
	jp	Z, 00131$
;./puyopuyo.c:1253: chainCount++;
	inc	-3 (ix)
;./puyopuyo.c:1254: p->score += cleared * 10 * chainCount;
	ld	a, -6 (ix)
	add	a, #0x4d
	ld	-12 (ix), a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	-11 (ix), a
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	a, (hl)
	ld	-10 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-9 (ix), a
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	a, -3 (ix)
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
	push	bc
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	call	__mulint
	pop	bc
	ld	l, -10 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ex	de, hl
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;./puyopuyo.c:1255: p->totalCleared += cleared;
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	de, #0x005c
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	ld	a, e
	add	a, c
	ld	c, a
	ld	a, d
	adc	a, b
	ld	b, a
	ld	(hl), c
	inc	hl
	ld	(hl), b
;./puyopuyo.c:1258: SFX_Clear();
	call	_SFX_Clear
;./puyopuyo.c:1259: if (chainCount > 1) SFX_Chain(chainCount);
	ld	a, #0x01
	sub	a, -3 (ix)
	ld	a, #0x00
	rla
	ld	c, a
	or	a, a
	jr	Z, 00116$
	push	bc
	ld	a, -3 (ix)
	call	_SFX_Chain
	pop	bc
00116$:
;./puyopuyo.c:1263: u8 borderColors[] = { COLOR_LIGHT_GREEN, COLOR_LIGHT_YELLOW, COLOR_LIGHT_RED, COLOR_MAGENTA, COLOR_WHITE };
	ld	-19 (ix), #0x03
	ld	-18 (ix), #0x0b
	ld	-17 (ix), #0x09
	ld	-16 (ix), #0x0d
	ld	-15 (ix), #0x0f
;./puyopuyo.c:1264: u8 ci = chainCount - 1;
	ld	e, -3 (ix)
	dec	e
;./puyopuyo.c:1266: if (ci > 4) ci = 4;
	ld	a, #0x04
	sub	a, e
	jr	NC, 00118$
	ld	e, #0x04
00118$:
;./puyopuyo.c:1267: VDP_SetColor(borderColors[ci]);
	ld	d, #0x00
	ld	hl, #0
	add	hl, sp
	add	hl, de
	ld	-12 (ix), l
	ld	-11 (ix), h
	ld	l, (hl)
;	spillPairReg hl
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:721: inline void VDP_SetColor(u8 color) { VDP_RegWrite(7, color); }
	ld	a, #0x07
	call	_VDP_RegWrite
;./puyopuyo.c:1270: if (chainCount > 1) {
	ld	a, c
	or	a, a
	jr	Z, 00120$
;./puyopuyo.c:1271: Game_ShowChain(chainCount);
	ld	a, -3 (ix)
	call	_Game_ShowChain
00120$:
;./puyopuyo.c:1274: totalGarbage += CHAIN_GARBAGE_BASE * chainCount;
	ld	a, -3 (ix)
	ld	c, -4 (ix)
	add	a, c
	ld	-4 (ix), a
;./puyopuyo.c:1276: Game_DrawBoard(p, playerIdx);
	ld	a, -14 (ix)
	push	af
	inc	sp
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Game_DrawBoard
;./puyopuyo.c:1277: Game_DrawScore(p);
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Game_DrawScore
;./puyopuyo.c:1280: flashFrames = 4 + (chainCount > 2 ? chainCount * 2 : 0);
	ld	a, #0x02
	sub	a, -3 (ix)
	jr	NC, 00172$
	sla	-2 (ix)
	rl	-1 (ix)
	jp	00173$
00172$:
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
00173$:
	ld	a, -2 (ix)
	add	a, #0x04
	ld	c, a
;./puyopuyo.c:1281: if (flashFrames > 16) flashFrames = 16;
	ld	a, #0x10
	sub	a, c
	jr	NC, 00201$
	ld	c, #0x10
;./puyopuyo.c:1282: while (flashFrames > 0) {
00201$:
	ld	a, -3 (ix)
	sub	a, #0x03
	ld	a, #0x00
	rla
	ld	-2 (ix), a
	ld	-1 (ix), c
00126$:
	ld	a, -1 (ix)
	or	a, a
	jr	Z, 00128$
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/system.h:145: inline void Halt() { __asm__("halt"); }
	halt
;./puyopuyo.c:1285: if (chainCount >= 3 && (flashFrames & 3) == 0) {
	bit	0, -2 (ix)
	jr	NZ, 00124$
	ld	a, -1 (ix)
	and	a, #0x03
	jr	NZ, 00124$
;./puyopuyo.c:1286: VDP_SetColor((flashFrames & 4) ? borderColors[ci] : COLOR_BLACK);
	bit	2, -1 (ix)
	jr	Z, 00174$
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	a, (hl)
	ld	-10 (ix), a
	ld	-9 (ix), #0x00
	jp	00175$
00174$:
	ld	-10 (ix), #0x01
	ld	-9 (ix), #0
00175$:
	ld	l, -10 (ix)
;	spillPairReg hl
;	spillPairReg hl
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:721: inline void VDP_SetColor(u8 color) { VDP_RegWrite(7, color); }
	ld	a, #0x07
	call	_VDP_RegWrite
;./puyopuyo.c:1286: VDP_SetColor((flashFrames & 4) ? borderColors[ci] : COLOR_BLACK);
00124$:
;./puyopuyo.c:1288: flashFrames--;
	dec	-1 (ix)
	jp	00126$
00128$:
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/vdp.h:721: inline void VDP_SetColor(u8 color) { VDP_RegWrite(7, color); }
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x07
	call	_VDP_RegWrite
;./puyopuyo.c:1294: Game_ClearChainText();
	call	_Game_ClearChainText
	jp	00130$
00131$:
;./puyopuyo.c:1297: p->chainCount = chainCount;
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	de, #0x0051
	add	hl, de
	ld	a, -3 (ix)
	ld	(hl), a
;./puyopuyo.c:1298: if (chainCount > p->maxChain) p->maxChain = chainCount;
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	de, #0x005b
	add	hl, de
	ld	a, (hl)
	sub	a, -3 (ix)
	jr	NC, 00133$
	ld	a, -3 (ix)
	ld	(hl), a
00133$:
;./puyopuyo.c:1300: if (totalGarbage > 0) {
	ld	a, -4 (ix)
	or	a, a
	jp	Z, 00166$
;./puyopuyo.c:1301: if (p->pendingGarbage > 0) {
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	de, #0x0052
	add	hl, de
	ld	c, (hl)
	ld	a, c
	or	a, a
	jr	Z, 00138$
;./puyopuyo.c:1302: if (totalGarbage >= p->pendingGarbage) {
	ld	a, -4 (ix)
	sub	a, c
	jr	C, 00135$
;./puyopuyo.c:1303: totalGarbage -= p->pendingGarbage; p->pendingGarbage = 0;
	ld	a, -4 (ix)
	sub	a, c
	ld	-4 (ix), a
	ld	(hl), #0x00
	jp	00138$
00135$:
;./puyopuyo.c:1305: p->pendingGarbage -= totalGarbage; totalGarbage = 0;
	ld	a, c
	sub	a, -4 (ix)
	ld	(hl), a
	ld	-4 (ix), #0x00
00138$:
;./puyopuyo.c:1308: if (totalGarbage > 0) {
	ld	a, -4 (ix)
	or	a, a
	jp	Z, 00166$
;./puyopuyo.c:1309: opponent->pendingGarbage += totalGarbage;
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	de, #0x0052
	add	hl, de
	ld	a, (hl)
	add	a, -4 (ix)
	ld	(hl), a
;./puyopuyo.c:1310: SFX_Garbage();
	call	_SFX_Garbage
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x0e
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x0a
;./puyopuyo.c:1313: Print_DrawChar('+');
	ld	a, #0x2b
	call	_Print_DrawChar
;./puyopuyo.c:1314: Print_DrawChar('0' + (totalGarbage / 10) % 10);
	ld	a, -4 (ix)
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
	ld	de, #0x000a
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divsint
	ld	-4 (ix), e
	ld	-3 (ix), d
	ld	de, #0x000a
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__modsint
	ld	-4 (ix), e
	ld	-3 (ix), d
	ld	a, -4 (ix)
	ld	-3 (ix), a
	add	a, #0x30
	ld	-3 (ix), a
	call	_Print_DrawChar
;./puyopuyo.c:1315: Print_DrawChar('0' + totalGarbage % 10);
	ld	de, #0x000a
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__modsint
	ld	-2 (ix), e
	ld	-1 (ix), d
	ld	a, -2 (ix)
	ld	-1 (ix), a
	add	a, #0x30
	ld	-1 (ix), a
	call	_Print_DrawChar
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/system.h:145: inline void Halt() { __asm__("halt"); }
	halt
	halt
	halt
	halt
	halt
	halt
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x0e
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x0a
;./puyopuyo.c:1318: Print_DrawChar(' ');
	ld	a, #0x20
	call	_Print_DrawChar
;./puyopuyo.c:1319: Print_DrawChar(' ');
	ld	a, #0x20
	call	_Print_DrawChar
;./puyopuyo.c:1320: Print_DrawChar(' ');
	ld	a, #0x20
	call	_Print_DrawChar
00166$:
;./puyopuyo.c:1324: }
	ld	sp, ix
	pop	ix
	ret
;./puyopuyo.c:1326: static void Game_AddGarbage(Player* p) {
;	---------------------------------
; Function Game_AddGarbage
; ---------------------------------
_Game_AddGarbage:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-8
	add	iy, sp
	ld	sp, iy
	ld	-3 (ix), l
	ld	-2 (ix), h
;./puyopuyo.c:1328: if (p->pendingGarbage == 0) return;
	ld	a, -3 (ix)
	add	a, #0x52
	ld	-5 (ix), a
	ld	a, -2 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	or	a, a
	jp	Z,00119$
;./puyopuyo.c:1329: SFX_GarbageReceive();
	call	_SFX_GarbageReceive
;./puyopuyo.c:1330: count = p->pendingGarbage;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	e, (hl)
	ld	c, e
;./puyopuyo.c:1331: if (count > BOARD_W * 2) count = BOARD_W * 2;
	ld	a, #0x0c
	sub	a, c
	jr	NC, 00104$
	ld	c, #0x0c
00104$:
;./puyopuyo.c:1332: p->pendingGarbage -= count;
	ld	a, e
	sub	a, c
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), a
;./puyopuyo.c:1333: rows = (count + BOARD_W - 1) / BOARD_W;
	ld	e, c
	ld	d, #0x00
	ld	hl, #0x0005
	add	hl, de
	push	bc
	ld	de, #0x0006
	call	__divsint
	pop	bc
	ld	-8 (ix), e
;./puyopuyo.c:1336: remaining = count;
	ld	e, c
;./puyopuyo.c:1337: for (y = 0; y < rows && remaining > 0; y++)
	ld	c, #0x00
00117$:
	ld	a, c
	sub	a, -8 (ix)
	jr	NC, 00119$
	ld	a, e
	or	a, a
	jr	Z, 00119$
;./puyopuyo.c:1338: for (x = 0; x < BOARD_W && remaining > 0; x++) {
	ld	a, c
	add	a, a
	add	a, c
	add	a, a
	add	a, -3 (ix)
	ld	-7 (ix), a
	ld	a, #0x00
	adc	a, -2 (ix)
	ld	-6 (ix), a
	ld	b, e
	ld	-1 (ix), #0x00
00113$:
	ld	a, -1 (ix)
	sub	a, #0x06
	jr	NC, 00131$
	ld	a, b
	or	a, a
	jr	Z, 00131$
;./puyopuyo.c:1339: if (p->board[y][x] == PUYO_EMPTY) {
	ld	a, -1 (ix)
	add	a, -7 (ix)
	ld	-5 (ix), a
	ld	a, #0x00
	adc	a, -6 (ix)
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	or	a, a
	jr	NZ, 00114$
;./puyopuyo.c:1340: if (Math_GetRandom8() % 6 != 0) {
	push	bc
	call	_Math_GetRandom8
	pop	bc
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	de, #0x0006
	call	__modsint
	pop	bc
	ld	a, d
	or	a, e
	jr	Z, 00114$
;./puyopuyo.c:1341: p->board[y][x] = PUYO_GARBAGE;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), #0x06
;./puyopuyo.c:1342: remaining--;
	dec	b
00114$:
;./puyopuyo.c:1338: for (x = 0; x < BOARD_W && remaining > 0; x++) {
	inc	-1 (ix)
	jp	00113$
00131$:
	ld	e, b
;./puyopuyo.c:1337: for (y = 0; y < rows && remaining > 0; y++)
	inc	c
	jp	00117$
00119$:
;./puyopuyo.c:1346: }
	ld	sp, ix
	pop	ix
	ret
;./puyopuyo.c:1375: static u8 CPU_TopColor(Player* p, u8 x) {
;	---------------------------------
; Function CPU_TopColor
; ---------------------------------
_CPU_TopColor:
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ld	c, l
	ld	b, h
;./puyopuyo.c:1377: for (y = 0; y < BOARD_H; y++) {
	ld	a, 4 (ix)
	ld	-1 (ix), a
	ld	e, #0x00
00104$:
;./puyopuyo.c:1378: if (p->board[y][x] != PUYO_EMPTY)
	push	de
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	pop	de
	ld	h, #0x00
	add	hl, bc
	ld	a, l
	add	a, -1 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	jr	NC, 00123$
	inc	h
00123$:
	ld	a, (hl)
	or	a, a
;./puyopuyo.c:1379: return p->board[y][x];
	jr	NZ, 00106$
;./puyopuyo.c:1377: for (y = 0; y < BOARD_H; y++) {
	inc	e
	ld	a, e
	xor	a, #0x80
	sub	a, #0x8b
	jr	C, 00104$
;./puyopuyo.c:1381: return PUYO_EMPTY;
	xor	a, a
00106$:
;./puyopuyo.c:1382: }
	inc	sp
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
_g_CpuParams:
	.db #0x08	; 8
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x01	; 1
;./puyopuyo.c:1385: static u8 CPU_ScoreColumn(Player* p, u8 x, u8 color) {
;	---------------------------------
; Function CPU_ScoreColumn
; ---------------------------------
_CPU_ScoreColumn:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-9
	add	iy, sp
	ld	sp, iy
	ld	-2 (ix), l
	ld	-1 (ix), h
;./puyopuyo.c:1386: u8 score = 0;
	ld	-9 (ix), #0x00
;./puyopuyo.c:1389: for (y = BOARD_H - 1; y >= 0; y--) {
	ld	a, 4 (ix)
	ld	-8 (ix), a
	ld	-3 (ix), #0x0a
00118$:
;./puyopuyo.c:1390: if (p->board[y][x] == PUYO_EMPTY) break;
	ld	a, -3 (ix)
	ld	c, a
	add	a, a
	add	a, c
	add	a, a
	ld	-4 (ix), a
	add	a, -2 (ix)
	ld	-7 (ix), a
	ld	a, #0x00
	adc	a, -1 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	add	a, -8 (ix)
	ld	-5 (ix), a
	ld	a, -6 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	or	a, a
	jr	Z, 00133$
;./puyopuyo.c:1389: for (y = BOARD_H - 1; y >= 0; y--) {
	dec	-3 (ix)
	bit	7, -3 (ix)
	jr	Z, 00118$
00133$:
	ld	a, -3 (ix)
	ld	-7 (ix), a
;./puyopuyo.c:1392: if (y < 0) return 0; // column full
	bit	7, -3 (ix)
	jr	Z, 00105$
	xor	a, a
	jp	00120$
00105$:
;./puyopuyo.c:1394: if (x > 0 && p->board[y][x-1] == color) score += 2;
	ld	a, -8 (ix)
	or	a, a
	jr	Z, 00107$
	ld	a, -3 (ix)
	ld	c, a
	add	a, a
	add	a, c
	add	a, a
	ld	-3 (ix), a
	add	a, -2 (ix)
	ld	-6 (ix), a
	ld	a, #0x00
	adc	a, -1 (ix)
	ld	-5 (ix), a
	ld	a, -8 (ix)
	ld	-3 (ix), a
	dec	-3 (ix)
	ld	a, -3 (ix)
	add	a, -6 (ix)
	ld	-4 (ix), a
	ld	a, #0x00
	adc	a, -5 (ix)
	ld	-3 (ix), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a,5 (ix)
	sub	a,(hl)
	jr	NZ, 00107$
	ld	-9 (ix), #0x02
00107$:
;./puyopuyo.c:1395: if (x < BOARD_W-1 && p->board[y][x+1] == color) score += 2;
	ld	a, -8 (ix)
	sub	a, #0x05
	jr	NC, 00110$
	ld	a, -7 (ix)
	ld	c, a
	add	a, a
	add	a, c
	add	a, a
	add	a, -2 (ix)
	ld	c, a
	ld	a, #0x00
	adc	a, -1 (ix)
	ld	b, a
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	l
	ld	h, #0x00
	add	hl, bc
	ld	a,5 (ix)
	sub	a,(hl)
	jr	NZ, 00110$
	ld	a, -9 (ix)
	add	a, #0x02
	ld	-9 (ix), a
00110$:
;./puyopuyo.c:1396: if (y < BOARD_H-1 && p->board[y+1][x] == color) score += 3;
	ld	a, -7 (ix)
	xor	a, #0x80
	sub	a, #0x8a
	jr	NC, 00113$
	ld	a, -7 (ix)
	inc	a
	ld	-3 (ix), a
	ld	c, a
	add	a, a
	add	a, c
	add	a, a
	ld	-3 (ix), a
	add	a, -2 (ix)
	ld	-6 (ix), a
	ld	a, #0x00
	adc	a, -1 (ix)
	ld	-5 (ix), a
	ld	a, -6 (ix)
	add	a, -8 (ix)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a,5 (ix)
	sub	a,(hl)
	jr	NZ, 00113$
	ld	a, -9 (ix)
	add	a, #0x03
	ld	-9 (ix), a
00113$:
;./puyopuyo.c:1398: if (y + 1 < BOARD_H && p->board[y+1][x] == color) score += 2;
	ld	a, -7 (ix)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	inc	bc
	ld	a, c
	sub	a, #0x0b
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00116$
	ld	a, -7 (ix)
	inc	a
	ld	-3 (ix), a
	ld	c, a
	add	a, a
	add	a, c
	add	a, a
	ld	-3 (ix), a
	add	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, #0x00
	adc	a, -1 (ix)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	add	a, -8 (ix)
	ld	-6 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a,5 (ix)
	sub	a,(hl)
	jr	NZ, 00116$
	ld	a, -9 (ix)
	add	a, #0x02
	ld	-9 (ix), a
00116$:
;./puyopuyo.c:1399: return score;
	ld	a, -9 (ix)
00120$:
;./puyopuyo.c:1400: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	bc
	jp	(hl)
;./puyopuyo.c:1402: static void CPU_DecideMove(Player* p) {
;	---------------------------------
; Function CPU_DecideMove
; ---------------------------------
_CPU_DecideMove:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-13
	add	iy, sp
	ld	sp, iy
	ld	-3 (ix), l
	ld	-2 (ix), h
;./puyopuyo.c:1403: u8 x, score, bestScore = 0;
	ld	-13 (ix), #0x00
;./puyopuyo.c:1404: u8 bestX = 2;
	ld	-12 (ix), #0x02
;./puyopuyo.c:1405: u8 bestDir = DIR_UP;
	ld	-11 (ix), #0x00
;./puyopuyo.c:1406: u8 c1 = p->puyoColor1;
	ld	c, -3 (ix)
	ld	b, -2 (ix)
	ld	hl, #68
	add	hl, bc
	ld	a, (hl)
	ld	-10 (ix), a
;./puyopuyo.c:1407: u8 c2 = p->puyoColor2;
	ld	c, -3 (ix)
	ld	b, -2 (ix)
	ld	hl, #69
	add	hl, bc
	ld	a, (hl)
	ld	-9 (ix), a
;./puyopuyo.c:1408: u8 lvl = g_CpuLevel;
	ld	a, (_g_CpuLevel+0)
	ld	-8 (ix), a
;./puyopuyo.c:1409: u8 maxCols = g_CpuParams[lvl][1];
	ld	bc, #_g_CpuParams+0
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ex	de, hl
	ld	c, e
	ld	b, d
	inc	bc
	ld	a, (bc)
	ld	-1 (ix), a
;./puyopuyo.c:1410: u8 canRotate = g_CpuParams[lvl][2];
	inc	de
	inc	de
	ld	a, (de)
	ld	-7 (ix), a
;./puyopuyo.c:1414: if (maxCols >= BOARD_W) {
	ld	a, -1 (ix)
	sub	a, #0x06
	jr	C, 00102$
;./puyopuyo.c:1415: startX = 0; endX = BOARD_W;
	ld	-6 (ix), #0x00
	ld	-5 (ix), #0x06
	jp	00103$
00102$:
;./puyopuyo.c:1417: startX = (BOARD_W - maxCols) / 2;
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	a, #0x06
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
	ld	e, c
	ld	d, b
	bit	7, b
	jr	Z, 00143$
	ld	e, c
	ld	d, b
	inc	de
00143$:
	sra	d
	rr	e
;./puyopuyo.c:1418: endX = startX + maxCols;
	ld	-6 (ix), e
	ld	a, e
	add	a, -1 (ix)
	ld	-5 (ix), a
00103$:
;./puyopuyo.c:1422: if (lvl < 2 && (Math_GetRandom8() & 3) == 0) {
	ld	a, -8 (ix)
	sub	a, #0x02
	jr	NC, 00154$
	call	_Math_GetRandom8
	and	a, #0x03
	jr	NZ, 00154$
;./puyopuyo.c:1423: g_CpuTargetX = Math_GetRandom8() % BOARD_W;
	call	_Math_GetRandom8
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	de, #0x0006
	call	__modsint
	ld	hl, #_g_CpuTargetX
	ld	(hl), e
;./puyopuyo.c:1424: g_CpuTargetDir = DIR_UP;
	ld	hl, #_g_CpuTargetDir
	ld	(hl), #0x00
;./puyopuyo.c:1425: g_CpuDelay = 0;
	ld	hl, #_g_CpuDelay
	ld	(hl), #0x00
;./puyopuyo.c:1426: return;
	jp	00141$
;./puyopuyo.c:1430: for (x = startX; x < endX; x++) {
00154$:
	ld	a, -6 (ix)
	ld	-1 (ix), a
00131$:
	ld	a, -1 (ix)
	sub	a, -5 (ix)
	jr	NC, 00113$
;./puyopuyo.c:1431: score = CPU_ScoreColumn(p, x, c1);
	ld	a, -10 (ix)
	push	af
	inc	sp
	ld	a, -1 (ix)
	push	af
	inc	sp
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_CPU_ScoreColumn
	ld	-4 (ix), a
;./puyopuyo.c:1432: if (score > bestScore) {
	ld	a, -13 (ix)
	sub	a, -4 (ix)
	jr	NC, 00108$
;./puyopuyo.c:1433: bestScore = score; bestX = x; bestDir = DIR_UP;
	ld	a, -4 (ix)
	ld	-13 (ix), a
	ld	a, -1 (ix)
	ld	-12 (ix), a
	ld	-11 (ix), #0x00
00108$:
;./puyopuyo.c:1435: if (canRotate) {
	ld	a, -7 (ix)
	or	a, a
	jr	Z, 00132$
;./puyopuyo.c:1436: score = CPU_ScoreColumn(p, x, c2);
	ld	a, -9 (ix)
	push	af
	inc	sp
	ld	a, -1 (ix)
	push	af
	inc	sp
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_CPU_ScoreColumn
	ld	c, a
;./puyopuyo.c:1437: if (score > bestScore) {
	ld	a, -13 (ix)
	sub	a, c
	jr	NC, 00132$
;./puyopuyo.c:1438: bestScore = score; bestX = x; bestDir = DIR_DOWN;
	ld	-13 (ix), c
	ld	a, -1 (ix)
	ld	-12 (ix), a
	ld	-11 (ix), #0x02
00132$:
;./puyopuyo.c:1430: for (x = startX; x < endX; x++) {
	inc	-1 (ix)
	jp	00131$
00113$:
;./puyopuyo.c:1444: if (canRotate && lvl >= 4) {
	ld	a, -7 (ix)
	or	a, a
	jp	Z, 00120$
	ld	a, -8 (ix)
	sub	a, #0x04
	jp	C, 00120$
;./puyopuyo.c:1445: for (x = startX; x < endX && x < BOARD_W - 1; x++) {
	ld	c, -6 (ix)
00135$:
	ld	a, c
	sub	a, -5 (ix)
	jp	NC, 00120$
	ld	a, c
	sub	a, #0x05
	jr	NC, 00120$
;./puyopuyo.c:1446: score = CPU_ScoreColumn(p, x, c1) + CPU_ScoreColumn(p, x + 1, c2);
	push	bc
	ld	a, -10 (ix)
	push	af
	inc	sp
	ld	a, c
	push	af
	inc	sp
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_CPU_ScoreColumn
	ld	e, a
	pop	bc
	ld	b, c
	inc	b
	push	bc
	push	de
	ld	a, -9 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_CPU_ScoreColumn
	pop	de
	pop	bc
	add	a, e
	ld	e, a
;./puyopuyo.c:1447: if (score > bestScore) {
	ld	a, -13 (ix)
	sub	a, e
	jr	NC, 00115$
;./puyopuyo.c:1448: bestScore = score; bestX = x; bestDir = DIR_RIGHT;
	ld	-13 (ix), e
	ld	-12 (ix), c
	ld	-11 (ix), #0x01
00115$:
;./puyopuyo.c:1450: score = CPU_ScoreColumn(p, x, c2) + CPU_ScoreColumn(p, x + 1, c1);
	push	bc
	ld	a, -9 (ix)
	push	af
	inc	sp
	ld	a, c
	push	af
	inc	sp
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_CPU_ScoreColumn
	ld	e, a
	pop	bc
	push	bc
	push	de
	ld	a, -10 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_CPU_ScoreColumn
	pop	de
	pop	bc
	add	a, e
	ld	b, a
;./puyopuyo.c:1451: if (score > bestScore) {
	ld	a, -13 (ix)
	sub	a, b
	jr	NC, 00136$
;./puyopuyo.c:1452: bestScore = score; bestX = x; bestDir = DIR_LEFT;
	ld	-13 (ix), b
	ld	-12 (ix), c
	ld	-11 (ix), #0x03
00136$:
;./puyopuyo.c:1445: for (x = startX; x < endX && x < BOARD_W - 1; x++) {
	inc	c
	jp	00135$
00120$:
;./puyopuyo.c:1458: if (bestScore == 0) {
	ld	a, -13 (ix)
	or	a, a
	jr	NZ, 00129$
;./puyopuyo.c:1459: u8 minH = BOARD_H;
	ld	c, #0x0b
;./puyopuyo.c:1460: for (x = 0; x < BOARD_W; x++) {
	ld	e, #0x00
00139$:
;./puyopuyo.c:1461: u8 h = 0;
	ld	-4 (ix), #0x00
;./puyopuyo.c:1463: for (y = 0; y < BOARD_H; y++) {
	ld	-1 (ix), #0x00
	ld	b, #0x00
00137$:
;./puyopuyo.c:1464: if (p->board[y][x] != PUYO_EMPTY) { h = BOARD_H - y; break; }
	push	de
	ld	a, b
	ld	e, a
	add	a, a
	add	a, e
	add	a, a
	pop	de
	add	a, -3 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x00
	adc	a, -2 (ix)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00138$
	ld	a, #0x0b
	sub	a, -1 (ix)
	ld	-4 (ix), a
	jp	00124$
00138$:
;./puyopuyo.c:1463: for (y = 0; y < BOARD_H; y++) {
	inc	b
	ld	-1 (ix), b
	ld	a, b
	xor	a, #0x80
	sub	a, #0x8b
	jr	C, 00137$
00124$:
;./puyopuyo.c:1466: if (h < minH) { minH = h; bestX = x; }
	ld	a, -4 (ix)
	sub	a, c
	jr	NC, 00140$
	ld	c, -4 (ix)
	ld	-12 (ix), e
00140$:
;./puyopuyo.c:1460: for (x = 0; x < BOARD_W; x++) {
	inc	e
	ld	a, e
	sub	a, #0x06
	jr	C, 00139$
00129$:
;./puyopuyo.c:1470: g_CpuTargetX = bestX;
	ld	a, -12 (ix)
	ld	(_g_CpuTargetX+0), a
;./puyopuyo.c:1471: g_CpuTargetDir = canRotate ? bestDir : DIR_UP;
	ld	a, -7 (ix)
	or	a, a
	jr	Z, 00144$
	ld	c, -11 (ix)
	jp	00145$
00144$:
	ld	bc, #0x0000
00145$:
	ld	hl, #_g_CpuTargetDir
	ld	(hl), c
;./puyopuyo.c:1472: g_CpuDelay = 0;
	ld	hl, #_g_CpuDelay
	ld	(hl), #0x00
00141$:
;./puyopuyo.c:1473: }
	ld	sp, ix
	pop	ix
	ret
;./puyopuyo.c:1479: static void Game_UpdatePlayer(Player* p, u8 joyPort) {
;	---------------------------------
; Function Game_UpdatePlayer
; ---------------------------------
_Game_UpdatePlayer:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-14
	add	iy, sp
	ld	sp, iy
	ld	-3 (ix), l
	ld	-2 (ix), h
;./puyopuyo.c:1483: if (!p->alive) return;
	ld	a, -3 (ix)
	add	a, #0x54
	ld	-12 (ix), a
	ld	a, -2 (ix)
	adc	a, #0x00
	ld	-11 (ix), a
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	a, (hl)
	ld	-1 (ix), a
	or	a, a
	jp	Z,00197$
;./puyopuyo.c:1484: joy = Joystick_Read(joyPort);
	ld	l, 4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Joystick_Read
	ld	-1 (ix), l
	ld	a, l
;./puyopuyo.c:1485: dir = JOY_GET_DIR(joy);
	ld	-4 (ix), a
	cpl
	ld	-1 (ix), a
	and	a, #0x0f
	ld	-1 (ix), a
;./puyopuyo.c:1486: btnA = JOY_GET_A(joy);
	ld	a, -4 (ix)
	and	a, #0x10
	ld	-5 (ix), a
	or	a, a
	ld	a, #0x01
	jr	Z, 00443$
	xor	a, a
00443$:
	ld	-10 (ix), a
;./puyopuyo.c:1487: btnB = JOY_GET_B(joy);
	ld	a, -4 (ix)
	and	a, #0x20
	ld	-4 (ix), a
	or	a, a
	ld	a, #0x01
	jr	Z, 00445$
	xor	a, a
00445$:
	ld	-9 (ix), a
;./puyopuyo.c:1488: btnUp = FALSE;
	ld	-8 (ix), #0x00
;./puyopuyo.c:1489: if (joyPort == JOY_PORT_1) {
	ld	a, 4 (ix)
	sub	a, #0x0f
	jr	NZ, 00118$
;./puyopuyo.c:1490: if (Keyboard_IsKeyPressed(KEY_LEFT))  dir |= JOY_INPUT_DIR_LEFT;
	ld	a, #0x48
	call	_Keyboard_IsKeyPressed
	or	a, a
	jr	Z, 00104$
	ld	a, -1 (ix)
	or	a, #0x04
	ld	-1 (ix), a
00104$:
;./puyopuyo.c:1491: if (Keyboard_IsKeyPressed(KEY_RIGHT)) dir |= JOY_INPUT_DIR_RIGHT;
	ld	a, #0x78
	call	_Keyboard_IsKeyPressed
	or	a, a
	jr	Z, 00106$
	ld	a, -1 (ix)
	or	a, #0x08
	ld	-1 (ix), a
00106$:
;./puyopuyo.c:1492: if (Keyboard_IsKeyPressed(KEY_DOWN))  dir |= JOY_INPUT_DIR_DOWN;
	ld	a, #0x68
	call	_Keyboard_IsKeyPressed
	or	a, a
	jr	Z, 00108$
	ld	a, -1 (ix)
	or	a, #0x02
	ld	-1 (ix), a
00108$:
;./puyopuyo.c:1493: if (Keyboard_IsKeyPressed(KEY_UP))    btnUp = TRUE;
	ld	a, #0x58
	call	_Keyboard_IsKeyPressed
	or	a, a
	jr	Z, 00110$
	ld	-8 (ix), #0x01
00110$:
;./puyopuyo.c:1494: if (Keyboard_IsKeyPressed(KEY_Z))     btnA = TRUE;
	ld	a, #0x75
	call	_Keyboard_IsKeyPressed
	or	a, a
	jr	Z, 00112$
	ld	-10 (ix), #0x01
00112$:
;./puyopuyo.c:1495: if (Keyboard_IsKeyPressed(KEY_X))     btnB = TRUE;
	ld	a, #0x55
	call	_Keyboard_IsKeyPressed
	or	a, a
	jr	Z, 00114$
	ld	-9 (ix), #0x01
00114$:
;./puyopuyo.c:1496: if (Keyboard_IsKeyPressed(KEY_SPACE)) btnA = TRUE;
	ld	a, #0x08
	call	_Keyboard_IsKeyPressed
	or	a, a
	jr	Z, 00118$
	ld	-10 (ix), #0x01
00118$:
;./puyopuyo.c:1498: if (dir & JOY_INPUT_DIR_UP) { btnUp = TRUE; dir &= ~JOY_INPUT_DIR_UP; }
	bit	0, -1 (ix)
	jr	Z, 00120$
	ld	-8 (ix), #0x01
	ld	a, -1 (ix)
	and	a, #0xfe
	ld	-1 (ix), a
00120$:
;./puyopuyo.c:1501: if (joyPort == JOY_PORT_2 && dir == 0 && !btnA && !btnB && p->puyoColor1 != PUYO_EMPTY) {
	ld	a, 4 (ix)
	sub	a, #0x4f
	ld	a, #0x01
	jr	Z, 00450$
	xor	a, a
00450$:
	ld	-7 (ix), a
	or	a, a
	jp	Z, 00135$
	ld	a, -1 (ix)
	or	a, a
	jp	NZ, 00135$
	ld	a, -10 (ix)
	or	a, a
	jp	NZ, 00135$
	ld	a, -9 (ix)
	or	a, a
	jp	NZ, 00135$
	ld	a, -3 (ix)
	ld	-5 (ix), a
	ld	a, -2 (ix)
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	de, #0x0044
	add	hl, de
	ld	a, (hl)
	or	a, a
	jp	Z, 00135$
;./puyopuyo.c:1502: u8 speed = g_CpuParams[g_CpuLevel][0];
	ld	a, (_g_CpuLevel+0)
	ld	-5 (ix), a
	ld	-4 (ix), #0x00
	ld	a, -5 (ix)
	ld	-14 (ix), a
	ld	a, -4 (ix)
	ld	-13 (ix), a
	ld	b, #0x02
00451$:
	sla	-14 (ix)
	rl	-13 (ix)
	djnz	00451$
	ld	a, #<(_g_CpuParams)
	add	a, -14 (ix)
	ld	-5 (ix), a
	ld	a, #>(_g_CpuParams)
	adc	a, -13 (ix)
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	ld	-6 (ix), a
;./puyopuyo.c:1503: u8 fastDrop = g_CpuParams[g_CpuLevel][3];
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	c, (hl)
;./puyopuyo.c:1504: g_CpuDelay++;
	ld	iy, #_g_CpuDelay
	inc	0 (iy)
;./puyopuyo.c:1505: if (g_CpuDelay >= speed) {
	ld	a, (_g_CpuDelay+0)
	sub	a, -6 (ix)
	jr	C, 00135$
;./puyopuyo.c:1506: g_CpuDelay = 0;
	ld	0 (iy), #0x00
;./puyopuyo.c:1507: if (p->puyoDir != g_CpuTargetDir) {
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	ld	hl, #70
	add	hl, de
	ld	b, (hl)
	ld	a, (_g_CpuTargetDir+0)
	sub	a, b
	jr	Z, 00130$
;./puyopuyo.c:1508: btnA = TRUE;
	ld	-10 (ix), #0x01
	jp	00135$
00130$:
;./puyopuyo.c:1509: } else if (p->puyoX < g_CpuTargetX) {
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	ld	hl, #66
	add	hl, de
	ld	b, (hl)
	ld	hl, #_g_CpuTargetX
	ld	a, b
	sub	a, (hl)
	jr	NC, 00127$
;./puyopuyo.c:1510: dir = JOY_INPUT_DIR_RIGHT;
	ld	-1 (ix), #0x08
	jp	00135$
00127$:
;./puyopuyo.c:1511: } else if (p->puyoX > g_CpuTargetX) {
	ld	a, (#_g_CpuTargetX)
	sub	a, b
	jr	NC, 00124$
;./puyopuyo.c:1512: dir = JOY_INPUT_DIR_LEFT;
	ld	-1 (ix), #0x04
	jp	00135$
00124$:
;./puyopuyo.c:1513: } else if (fastDrop) {
	ld	a, c
	or	a, a
	jr	Z, 00135$
;./puyopuyo.c:1514: dir = JOY_INPUT_DIR_DOWN;
	ld	-1 (ix), #0x02
00135$:
;./puyopuyo.c:1519: if (p->garbageFalling) {
	ld	a, -3 (ix)
	add	a, #0x59
	ld	c, a
	ld	a, -2 (ix)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	or	a, a
	jr	Z, 00144$
;./puyopuyo.c:1520: if (Game_GravityStep(p)) {
	push	bc
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Game_GravityStep
	pop	bc
	or	a, a
	jr	Z, 00141$
;./puyopuyo.c:1521: g_BoardDirty[0] = TRUE; g_BoardDirty[1] = TRUE;
	ld	hl, #_g_BoardDirty+0
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x01
	jp	00197$
00141$:
;./puyopuyo.c:1523: p->garbageFalling = 0;
	xor	a, a
	ld	(bc), a
;./puyopuyo.c:1524: g_BoardDirty[0] = TRUE; g_BoardDirty[1] = TRUE;
	ld	hl, #_g_BoardDirty+0
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x01
;./puyopuyo.c:1526: return;
	jp	00197$
00144$:
;./puyopuyo.c:1529: if (p->puyoColor1 == PUYO_EMPTY) {
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	ld	hl, #68
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	NZ, 00152$
;./puyopuyo.c:1530: if (p->pendingGarbage > 0) {
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	ld	hl, #82
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00146$
;./puyopuyo.c:1531: Game_AddGarbage(p);
	push	bc
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Game_AddGarbage
	pop	bc
;./puyopuyo.c:1532: p->garbageFalling = 1;
	ld	a, #0x01
	ld	(bc), a
;./puyopuyo.c:1533: g_BoardDirty[0] = TRUE; g_BoardDirty[1] = TRUE;
	ld	hl, #_g_BoardDirty+0
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x01
;./puyopuyo.c:1534: return;
	jp	00197$
00146$:
;./puyopuyo.c:1536: Game_SpawnPair(p);
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Game_SpawnPair
;./puyopuyo.c:1537: if (!p->alive) return;
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	a, (hl)
	or	a, a
	jp	Z,00197$
;./puyopuyo.c:1538: p->inputDelay = 3;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	de, #0x004c
	add	hl, de
	ld	(hl), #0x03
;./puyopuyo.c:1540: if (joyPort == JOY_PORT_2) CPU_DecideMove(p);
	ld	a, -7 (ix)
	or	a, a
	jp	Z,00197$
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_CPU_DecideMove
;./puyopuyo.c:1541: return;
	jp	00197$
00152$:
;./puyopuyo.c:1538: p->inputDelay = 3;
	ld	a, -3 (ix)
	add	a, #0x4c
	ld	c, a
	ld	a, -2 (ix)
	adc	a, #0x00
	ld	b, a
;./puyopuyo.c:1543: if (p->inputDelay > 0) p->inputDelay--;
	ld	a, (bc)
	or	a, a
	jr	Z, 00154$
	dec	a
	ld	(bc), a
00154$:
;./puyopuyo.c:1544: if (p->inputDelay == 0) {
	ld	a, (bc)
	or	a, a
	jr	NZ, 00165$
;./puyopuyo.c:1545: if (dir & JOY_INPUT_DIR_LEFT) {
	bit	2, -1 (ix)
	jr	Z, 00162$
;./puyopuyo.c:1546: if (Game_CanMovePair(p, -1, 0)) { p->puyoX--; p->inputDelay = 5; }
	push	bc
	xor	a, a
	push	af
	inc	sp
	ld	a, #0xff
	push	af
	inc	sp
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Game_CanMovePair
	pop	bc
	or	a, a
	jr	Z, 00165$
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	de, #0x0042
	add	hl, de
	dec	(hl)
	ld	a, #0x05
	ld	(bc), a
	jp	00165$
00162$:
;./puyopuyo.c:1547: } else if (dir & JOY_INPUT_DIR_RIGHT) {
	bit	3, -1 (ix)
	jr	Z, 00165$
;./puyopuyo.c:1548: if (Game_CanMovePair(p, 1, 0)) { p->puyoX++; p->inputDelay = 5; }
	push	bc
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Game_CanMovePair
	pop	bc
	or	a, a
	jr	Z, 00165$
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	de, #0x0042
	add	hl, de
	inc	(hl)
	ld	a, #0x05
	ld	(bc), a
00165$:
;./puyopuyo.c:1551: if (p->rotateDelay > 0) {
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	de, #0x0057
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00171$
;./puyopuyo.c:1552: p->rotateDelay--;
	dec	a
	ld	(hl), a
;./puyopuyo.c:1553: if (!btnA && !btnB && !btnUp) p->rotateDelay = 0;
	ld	a, -10 (ix)
	or	a, a
	jr	NZ, 00171$
	ld	a, -9 (ix)
	or	a, a
	jr	NZ, 00171$
	ld	a, -8 (ix)
	or	a,a
	jr	NZ, 00171$
	ld	(hl),a
00171$:
;./puyopuyo.c:1555: if (p->rotateDelay == 0) {
	ld	a, (hl)
	or	a, a
	jr	NZ, 00179$
;./puyopuyo.c:1556: if (btnUp || btnA) { Game_RotatePair(p, 1); p->rotateDelay = 8; }
	ld	a, -8 (ix)
	or	a, a
	jr	NZ, 00174$
	ld	a, -10 (ix)
	or	a, a
	jr	Z, 00175$
00174$:
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Game_RotatePair
	pop	hl
	ld	(hl), #0x08
	jp	00179$
00175$:
;./puyopuyo.c:1557: else if (btnB) { Game_RotatePair(p, -1); p->rotateDelay = 8; }
	ld	a, -9 (ix)
	or	a, a
	jr	Z, 00179$
	push	hl
	ld	a, #0xff
	push	af
	inc	sp
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Game_RotatePair
	pop	hl
	ld	(hl), #0x08
00179$:
;./puyopuyo.c:1559: currentSpeed = p->dropSpeed / 2;
	ld	c, -3 (ix)
	ld	b, -2 (ix)
	ld	hl, #74
	add	hl, bc
	ld	e, (hl)
	ld	d, #0x00
	ld	c, e
	ld	b, d
	bit	7, d
	jr	Z, 00199$
	ld	c, e
	ld	b, d
	inc	bc
00199$:
	sra	b
	rr	c
;./puyopuyo.c:1560: if (currentSpeed < 1) currentSpeed = 1;
	ld	a, c
	sub	a, #0x01
	jr	NC, 00181$
	ld	c, #0x01
00181$:
;./puyopuyo.c:1561: if (dir & JOY_INPUT_DIR_DOWN) currentSpeed = DROP_SPEED_SOFT;
	bit	1, -1 (ix)
	jr	Z, 00183$
	ld	c, #0x01
00183$:
;./puyopuyo.c:1562: p->dropTimer++;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	de, #0x0049
	add	hl, de
	inc	(hl)
	ld	a, (hl)
;./puyopuyo.c:1563: if (p->dropTimer >= currentSpeed) {
	sub	a, c
	jp	C, 00197$
;./puyopuyo.c:1564: p->dropTimer = 0;
	ld	(hl), #0x00
;./puyopuyo.c:1565: if (p->subY == 2) {
	ld	a, -3 (ix)
	add	a, #0x58
	ld	-7 (ix), a
	ld	a, -2 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	c, (hl)
	ld	a, c
	sub	a, #0x02
	jr	NZ, 00193$
;./puyopuyo.c:1567: p->subY = 0;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), #0x00
	jp	00197$
00193$:
;./puyopuyo.c:1572: p->lockTimer = 0;
	ld	a, -3 (ix)
	add	a, #0x4b
	ld	-5 (ix), a
	ld	a, -2 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
;./puyopuyo.c:1568: } else if (p->subY == 0) {
	ld	a, c
	or	a, a
	jr	NZ, 00190$
;./puyopuyo.c:1570: if (Game_CanMovePair(p, 0, 1)) {
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Game_CanMovePair
	or	a, a
	jr	Z, 00187$
;./puyopuyo.c:1571: p->subY = 1;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), #0x01
;./puyopuyo.c:1572: p->lockTimer = 0;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), #0x00
	jp	00197$
00187$:
;./puyopuyo.c:1575: p->lockTimer++;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	inc	a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), a
;./puyopuyo.c:1576: if (p->lockTimer >= LOCK_DELAY) {
	sub	a, #0x08
	jr	C, 00197$
;./puyopuyo.c:1577: Game_LockPair(p);
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Game_LockPair
;./puyopuyo.c:1578: Game_ChainLoop(p, (p == &g_Player[0]) ? &g_Player[1] : &g_Player[0]);
	ld	bc, #_g_Player
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	cp	a, a
	sbc	hl, bc
	jr	NZ, 00200$
	ld	bc, #_g_Player + 94
	jp	00201$
00200$:
	ld	bc, #_g_Player
00201$:
	ld	e, c
	ld	d, b
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Game_ChainLoop
	jp	00197$
00190$:
;./puyopuyo.c:1583: p->subY = 0;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), #0x00
;./puyopuyo.c:1584: p->puyoY++;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	de, #0x0043
	add	hl, de
	inc	(hl)
	ld	a, (hl)
;./puyopuyo.c:1585: p->lockTimer = 0;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), #0x00
00197$:
;./puyopuyo.c:1588: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;./puyopuyo.c:1594: static void Game_Init(void) {
;	---------------------------------
; Function Game_Init
; ---------------------------------
_Game_Init:
;./puyopuyo.c:1595: Game_InitPlayer(&g_Player[0], P1_BOARD_X, P1_BOARD_Y);
	ld	hl, #0x101
	push	hl
	ld	hl, #_g_Player
	call	_Game_InitPlayer
;./puyopuyo.c:1596: Game_InitPlayer(&g_Player[1], P2_BOARD_X, P2_BOARD_Y);
	ld	a, #0x01
	push	af
	inc	sp
	ld	a, #0x13
	push	af
	inc	sp
	ld	hl, #(_g_Player + 94)
	call	_Game_InitPlayer
;./puyopuyo.c:1597: g_CpuLevel = 2; // Level 3 (0-indexed)
	ld	hl, #_g_CpuLevel
	ld	(hl), #0x02
;./puyopuyo.c:1599: ZX0_UnpackToRAM(g_GameScreen_Zx0, g_ScreenLayout);
	ld	de, #_g_ScreenLayout
	ld	hl, #_g_GameScreen_Zx0
	call	_ZX0_UnpackToRAM
;./puyopuyo.c:1600: VDP_WriteVRAM_16K(g_ScreenLayout, g_ScreenLayoutLow, 768);
	ld	hl, #0x0300
	push	hl
	ld	de, (_g_ScreenLayoutLow)
	ld	hl, #_g_ScreenLayout
	call	_VDP_WriteVRAM_16K
;./puyopuyo.c:1601: Game_InitBgScroll();
	call	_Game_InitBgScroll
;./puyopuyo.c:1602: Shadow_Invalidate();
	call	_Shadow_Invalidate
;./puyopuyo.c:1603: g_BoardDirty[0] = TRUE; g_BoardDirty[1] = TRUE;
	ld	hl, #_g_BoardDirty+0
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x01
;./puyopuyo.c:1604: Game_DrawBoard(&g_Player[0], 0);
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_g_Player
	call	_Game_DrawBoard
;./puyopuyo.c:1605: Game_DrawBoard(&g_Player[1], 1);
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, #(_g_Player + 94)
	call	_Game_DrawBoard
;./puyopuyo.c:1606: Game_DrawScore(&g_Player[0]);
	ld	hl, #_g_Player
	call	_Game_DrawScore
;./puyopuyo.c:1607: Game_DrawScore(&g_Player[1]);
	ld	hl, #(_g_Player + 94)
	call	_Game_DrawScore
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/system.h:145: inline void Halt() { __asm__("halt"); }
	halt
	halt
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x0e
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x01
;./puyopuyo.c:1614: Print_DrawChar('3');
	ld	a, #0x33
	call	_Print_DrawChar
;./puyopuyo.c:1615: WaitFrames(30);
	ld	a, #0x1e
	call	_WaitFrames
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x0e
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x01
;./puyopuyo.c:1617: Print_DrawChar('2');
	ld	a, #0x32
	call	_Print_DrawChar
;./puyopuyo.c:1618: WaitFrames(30);
	ld	a, #0x1e
	call	_WaitFrames
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x0e
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x01
;./puyopuyo.c:1620: Print_DrawChar('1');
	ld	a, #0x31
	call	_Print_DrawChar
;./puyopuyo.c:1621: WaitFrames(30);
	ld	a, #0x1e
	call	_WaitFrames
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x0e
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x01
;./puyopuyo.c:1623: Print_DrawText("GO!");
	ld	hl, #___str_13
	call	_Print_DrawText
;./puyopuyo.c:1624: WaitFrames(20);
	ld	a, #0x14
	call	_WaitFrames
;./puyopuyo.c:1626: RestoreTile(14, 1);
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0e
	call	_RestoreTile
;./puyopuyo.c:1627: RestoreTile(15, 1);
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0f
	call	_RestoreTile
;./puyopuyo.c:1628: RestoreTile(16, 1);
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x10
;./puyopuyo.c:1629: }
	jp	_RestoreTile
___str_13:
	.ascii "GO!"
	.db 0x00
;./puyopuyo.c:1640: static void Game_InitBgScroll(void) {
;	---------------------------------
; Function Game_InitBgScroll
; ---------------------------------
_Game_InitBgScroll:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-9
	add	hl, sp
	ld	sp, hl
;./puyopuyo.c:1644: ZX0_UnpackToRAM(g_TilesetPat_Zx0, g_PT3Buffer);
	ld	de, #_g_PT3Buffer
	ld	hl, #_g_TilesetPat_Zx0
	call	_ZX0_UnpackToRAM
;./puyopuyo.c:1645: for (i = 0; i < 8; i++) {
	ld	c, #0x00
00104$:
;./puyopuyo.c:1646: g_BgOrigP1[i] = g_PT3Buffer[PAT_BG_P1 * 8 + i];
	ld	hl, #_g_BgOrigP1
	ld	b, #0x00
	add	hl, bc
	ld	e, c
	ld	d, #0x00
	ld	iy, #0x01d8
	add	iy, de
	push	bc
	ld	bc, #_g_PT3Buffer
	add	iy, bc
	pop	bc
	ld	a, 0 (iy)
	ld	(hl), a
;./puyopuyo.c:1647: g_BgOrigP2[i] = g_PT3Buffer[PAT_BG_P2 * 8 + i];
	ld	hl, #_g_BgOrigP2
	ld	b, #0x00
	add	hl, bc
	ld	iy, #0x01e0
	add	iy, de
	ld	de, #_g_PT3Buffer
	add	iy, de
	ld	a, 0 (iy)
	ld	(hl), a
;./puyopuyo.c:1645: for (i = 0; i < 8; i++) {
	inc	c
	ld	a, c
	sub	a, #0x08
	jr	C, 00104$
;./puyopuyo.c:1654: for (i = 0; i < 8; i++) colBuf[i] = uniformCol;
	ld	c, #0x00
00106$:
	ld	e, c
	ld	d, #0x00
	ld	hl, #0
	add	hl, sp
	add	hl, de
	ld	(hl), #0x14
	inc	c
	ld	a, c
	sub	a, #0x08
	jr	C, 00106$
;./puyopuyo.c:1655: for (bank = 0; bank < 3; bank++) {
	ld	-1 (ix), #0x00
00108$:
;./puyopuyo.c:1656: u16 colBase = g_ScreenColorLow + (u16)bank * 0x800;
	ld	a, -1 (ix)
	add	a, a
	add	a, a
	add	a, a
	ld	b, a
	ld	c, #0x00
	ld	hl, (_g_ScreenColorLow)
	add	hl, bc
	ld	c, l
	ld	b, h
;./puyopuyo.c:1657: VDP_WriteVRAM_16K(colBuf, colBase + PAT_BG_P1 * 8, 8);
	ld	hl, #0x01d8
	add	hl, bc
	push	bc
	ex	de, hl
	ld	hl, #0x0008
	push	hl
	ld	hl, #4
	add	hl, sp
	call	_VDP_WriteVRAM_16K
	pop	bc
;./puyopuyo.c:1658: VDP_WriteVRAM_16K(colBuf, colBase + PAT_BG_P2 * 8, 8);
	ld	hl, #0x01e0
	add	hl, bc
	ex	de, hl
	ld	hl, #0x0008
	push	hl
	ld	hl, #2
	add	hl, sp
	call	_VDP_WriteVRAM_16K
;./puyopuyo.c:1655: for (bank = 0; bank < 3; bank++) {
	inc	-1 (ix)
	ld	a, -1 (ix)
	sub	a, #0x03
	jr	C, 00108$
;./puyopuyo.c:1661: g_BgStep = 0;
	ld	hl, #_g_BgStep
	ld	(hl), #0x00
;./puyopuyo.c:1662: }
	ld	sp, ix
	pop	ix
	ret
;./puyopuyo.c:1664: static void Game_UpdateBackground(void) {
;	---------------------------------
; Function Game_UpdateBackground
; ---------------------------------
_Game_UpdateBackground:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;./puyopuyo.c:1668: frameDiv++;
	ld	hl, #_Game_UpdateBackground_frameDiv_65536_1205
	inc	(hl)
;./puyopuyo.c:1669: if ((frameDiv & 7) != 0) return; // update every 8 frames
	ld	a, (_Game_UpdateBackground_frameDiv_65536_1205+0)
	and	a, #0x07
	jp	NZ,00118$
;./puyopuyo.c:1671: g_BgStep++;
	ld	hl, #_g_BgStep
	inc	(hl)
;./puyopuyo.c:1674: u8 step = g_BgStep & 7;
	ld	a, (_g_BgStep+0)
	and	a, #0x07
	ld	c, a
;./puyopuyo.c:1677: for (i = 0; i < 8; i++) {
	ld	de, #_g_BgPatP1+0
	ld	-1 (ix), #0x00
00112$:
;./puyopuyo.c:1678: u8 row = g_BgOrigP1[(i - step) & 7];
	ld	a, -1 (ix)
	sub	a, c
	and	a, #0x07
	ld	b, #0x00
	add	a, #<(_g_BgOrigP1)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	adc	a, #>(_g_BgOrigP1)
	ld	h, a
	ld	a, (hl)
	ld	-4 (ix), a
;./puyopuyo.c:1679: if (step > 0)
	ld	a, c
	or	a, a
	jr	Z, 00104$
;./puyopuyo.c:1680: g_BgPatP1[i] = (row >> step) | (row << (8 - step));
	ld	a, #<(_g_BgPatP1)
	add	a, -1 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>(_g_BgPatP1)
	adc	a, #0x00
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	b, c
	ld	a, -4 (ix)
	ld	-2 (ix), a
	inc	b
	jp	00165$
00164$:
	srl	-2 (ix)
00165$:
	djnz	00164$
	ld	b, c
	ld	a, #0x08
	sub	a, b
	ld	b, a
	ld	a, -4 (ix)
	inc	b
	jp	00167$
00166$:
	add	a, a
00167$:
	djnz	00166$
	or	a, -2 (ix)
	ld	(hl), a
	jp	00113$
00104$:
;./puyopuyo.c:1682: g_BgPatP1[i] = row;
	ld	a, e
	add	a, -1 (ix)
	ld	-3 (ix), a
	ld	a, d
	adc	a, #0x00
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	a, -4 (ix)
	ld	(hl), a
00113$:
;./puyopuyo.c:1677: for (i = 0; i < 8; i++) {
	inc	-1 (ix)
	ld	a, -1 (ix)
	sub	a, #0x08
	jr	C, 00112$
;./puyopuyo.c:1686: for (i = 0; i < 8; i++) {
	ld	a, #0x08
	sub	a, c
	ld	-4 (ix), a
	ld	b, #0x00
00114$:
;./puyopuyo.c:1687: u8 row = g_BgOrigP2[(i - step) & 7];
	ld	a, b
	sub	a, c
;	spillPairReg hl
;	spillPairReg hl
	and	a, #0x07
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	a, #<(_g_BgOrigP2)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, #>(_g_BgOrigP2)
	ld	h, a
	ld	a, (hl)
	ld	-3 (ix), a
;./puyopuyo.c:1688: if (step > 0)
	ld	a, c
	or	a, a
	jr	Z, 00108$
;./puyopuyo.c:1689: g_BgPatP2[i] = (row << step) | (row >> (8 - step));
	ld	a, #<(_g_BgPatP2)
	add	a, b
	ld	-2 (ix), a
	ld	a, #>(_g_BgPatP2)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	a, c
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	a
	jp	00169$
00168$:
	sla	l
00169$:
	dec	a
	jr	NZ,00168$
	ld	a, -4 (ix)
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	a
	jp	00171$
00170$:
	srl	h
00171$:
	dec	a
	jr	NZ, 00170$
	ld	a, l
	or	a, h
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), a
	jp	00115$
00108$:
;./puyopuyo.c:1691: g_BgPatP2[i] = row;
	ld	a, #<(_g_BgPatP2)
	add	a, b
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>(_g_BgPatP2)
	adc	a, #0x00
	ld	h, a
	ld	a, -3 (ix)
	ld	(hl), a
00115$:
;./puyopuyo.c:1686: for (i = 0; i < 8; i++) {
	inc	b
	ld	a, b
	sub	a, #0x08
	jr	C, 00114$
;./puyopuyo.c:1696: for (bank = 0; bank < 3; bank++) {
	ld	-1 (ix), #0x00
00116$:
;./puyopuyo.c:1697: u16 patBase = g_ScreenPatternLow + (u16)bank * 0x800;
	ld	a, -1 (ix)
	add	a, a
	add	a, a
	add	a, a
	ld	b, a
	ld	c, #0x00
	ld	hl, (_g_ScreenPatternLow)
	add	hl, bc
	ld	c, l
	ld	b, h
;./puyopuyo.c:1698: VDP_WriteVRAM_16K(g_BgPatP1, patBase + PAT_BG_P1 * 8, 8);
	ld	hl, #0x01d8
	add	hl, bc
	push	bc
	ex	de, hl
	ld	hl, #0x0008
	push	hl
	ld	hl, #_g_BgPatP1
	call	_VDP_WriteVRAM_16K
	pop	bc
;./puyopuyo.c:1699: VDP_WriteVRAM_16K(g_BgPatP2, patBase + PAT_BG_P2 * 8, 8);
	ld	hl, #0x01e0
	add	hl, bc
	ex	de, hl
	ld	hl, #0x0008
	push	hl
	ld	hl, #_g_BgPatP2
	call	_VDP_WriteVRAM_16K
;./puyopuyo.c:1696: for (bank = 0; bank < 3; bank++) {
	inc	-1 (ix)
	ld	a, -1 (ix)
	sub	a, #0x03
	jr	C, 00116$
00118$:
;./puyopuyo.c:1701: }
	ld	sp, ix
	pop	ix
	ret
;./puyopuyo.c:1703: static void Game_Update(void) {
;	---------------------------------
; Function Game_Update
; ---------------------------------
_Game_Update:
;./puyopuyo.c:1705: Game_UpdatePlayer(&g_Player[0], JOY_PORT_1);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	hl, #_g_Player
	call	_Game_UpdatePlayer
;./puyopuyo.c:1706: Game_UpdatePlayer(&g_Player[1], JOY_PORT_2);
	ld	a, #0x4f
	push	af
	inc	sp
	ld	hl, #(_g_Player + 94)
	call	_Game_UpdatePlayer
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/system.h:145: inline void Halt() { __asm__("halt"); }
	halt
;./puyopuyo.c:1712: Game_UpdateBackground();
	call	_Game_UpdateBackground
;./puyopuyo.c:1713: Game_DrawBoard(&g_Player[0], 0);
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_g_Player
	call	_Game_DrawBoard
;./puyopuyo.c:1714: Game_DrawBoard(&g_Player[1], 1);
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, #(_g_Player + 94)
	call	_Game_DrawBoard
;./puyopuyo.c:1715: if (g_BoardDirty[0] || g_BoardDirty[1]) {
	ld	a, (#_g_BoardDirty + 0)
	or	a, a
	jr	NZ, 00105$
	ld	a, (#(_g_BoardDirty + 1) + 0)
	or	a, a
	jr	Z, 00106$
00105$:
;./puyopuyo.c:1716: g_ConnPool = 128;
	ld	hl, #_g_ConnPool
	ld	(hl), #0x80
;./puyopuyo.c:1717: if (g_BoardDirty[0]) Game_DrawConnections(&g_Player[0]);
	ld	a, (#_g_BoardDirty + 0)
	or	a, a
	jr	Z, 00102$
	ld	hl, #_g_Player
	call	_Game_DrawConnections
00102$:
;./puyopuyo.c:1718: if (g_BoardDirty[1]) Game_DrawConnections(&g_Player[1]);
	ld	a, (#(_g_BoardDirty + 1) + 0)
	or	a, a
	jr	Z, 00104$
	ld	hl, #(_g_Player + 94)
	call	_Game_DrawConnections
00104$:
;./puyopuyo.c:1719: g_BoardDirty[0] = FALSE;
	ld	hl, #_g_BoardDirty
	ld	(hl), #0x00
;./puyopuyo.c:1720: g_BoardDirty[1] = FALSE;
	ld	hl, #(_g_BoardDirty + 1)
	ld	(hl), #0x00
00106$:
;./puyopuyo.c:1722: Game_DrawScore(&g_Player[0]);
	ld	hl, #_g_Player
	call	_Game_DrawScore
;./puyopuyo.c:1723: Game_DrawScore(&g_Player[1]);
	ld	hl, #(_g_Player + 94)
;./puyopuyo.c:1724: }
	jp	_Game_DrawScore
;./puyopuyo.c:1730: static void WaitButton(void) {
;	---------------------------------
; Function WaitButton
; ---------------------------------
_WaitButton:
;./puyopuyo.c:1732: while (1) {
00107$:
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/system.h:145: inline void Halt() { __asm__("halt"); }
	halt
;./puyopuyo.c:1734: joy1 = Joystick_Read(JOY_PORT_1);
	ld	l, #0x0f
;	spillPairReg hl
;	spillPairReg hl
	call	_Joystick_Read
	ld	c, l
;./puyopuyo.c:1735: joy2 = Joystick_Read(JOY_PORT_2);
	ld	l, #0x4f
;	spillPairReg hl
;	spillPairReg hl
	call	_Joystick_Read
;./puyopuyo.c:1736: if (JOY_GET_A(joy1) || JOY_GET_A(joy2)) break;
	bit	4, c
	ret	Z
	bit	4, l
	ret	Z
;./puyopuyo.c:1737: if (Keyboard_IsKeyPressed(KEY_SPACE)) break;
	ld	a, #0x08
	call	_Keyboard_IsKeyPressed
	or	a, a
	jr	Z, 00107$
;./puyopuyo.c:1739: }
	ret
;./puyopuyo.c:1741: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;./puyopuyo.c:1742: VDP_Setup();
	call	_VDP_Setup
;./puyopuyo.c:1743: g_GameState = STATE_TITLE;
	xor	a, a
	ld	(#_g_GameState), a
;./puyopuyo.c:1744: g_FrameCount = 0;
	ld	iy, #_g_FrameCount
	ld	0 (iy), #0x00
;./puyopuyo.c:1746: while (1) {
00124$:
;./puyopuyo.c:1747: if (g_GameState == STATE_TITLE) {
	ld	a, (_g_GameState+0)
	or	a, a
	jr	NZ, 00121$
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/system.h:145: inline void Halt() { __asm__("halt"); }
	halt
;./puyopuyo.c:1749: Game_DrawTitle();
	call	_Game_DrawTitle
;./puyopuyo.c:1750: TitleMusic_Start();
	call	_TitleMusic_Start
;./puyopuyo.c:1754: while (1) {
00110$:
;C:/Users/Antxiko/Documents/PuyoPuyoVS/MSXgl/engine/src/system.h:145: inline void Halt() { __asm__("halt"); }
	halt
;./puyopuyo.c:1756: TitleMusic_Update();
	call	_TitleMusic_Update
;./puyopuyo.c:1757: joy1 = Joystick_Read(JOY_PORT_1);
	ld	l, #0x0f
;	spillPairReg hl
;	spillPairReg hl
	call	_Joystick_Read
	ld	c, l
;./puyopuyo.c:1758: joy2 = Joystick_Read(JOY_PORT_2);
	ld	l, #0x4f
;	spillPairReg hl
;	spillPairReg hl
	call	_Joystick_Read
;./puyopuyo.c:1759: if (JOY_GET_A(joy1) || JOY_GET_A(joy2)) break;
	bit	4, c
	jr	Z, 00111$
	bit	4, l
	jr	Z, 00111$
;./puyopuyo.c:1760: if (JOY_GET_B(joy1) || JOY_GET_B(joy2)) break;
	bit	5, c
	jr	Z, 00111$
	bit	5, l
	jr	Z, 00111$
;./puyopuyo.c:1761: if (Keyboard_IsKeyPressed(KEY_SPACE)) break;
	ld	a, #0x08
	call	_Keyboard_IsKeyPressed
	or	a, a
	jr	Z, 00110$
00111$:
;./puyopuyo.c:1764: Music_Stop();
	call	_Music_Stop
;./puyopuyo.c:1765: WaitFrames(10);
	ld	a, #0x0a
	call	_WaitFrames
;./puyopuyo.c:1766: g_GameState = STATE_PLAYING;
	ld	hl, #_g_GameState
	ld	(hl), #0x01
;./puyopuyo.c:1767: VDP_Setup();
	call	_VDP_Setup
;./puyopuyo.c:1768: Game_Init();
	call	_Game_Init
;./puyopuyo.c:1769: Music_Start();
	call	_Music_Start
	jp	00124$
00121$:
;./puyopuyo.c:1771: else if (g_GameState == STATE_PLAYING) {
	ld	a, (_g_GameState+0)
	dec	a
	jr	NZ, 00118$
;./puyopuyo.c:1772: Game_Update();
	call	_Game_Update
;./puyopuyo.c:1773: if (!g_Player[0].alive || !g_Player[1].alive) {
	ld	a, (#_g_Player + 84)
	or	a, a
	jr	Z, 00112$
	ld	a, (#_g_Player + 178)
	or	a, a
	jr	NZ, 00124$
00112$:
;./puyopuyo.c:1774: Music_Stop();
	call	_Music_Stop
;./puyopuyo.c:1775: g_GameState = STATE_GAMEOVER;
	ld	iy, #_g_GameState
	ld	0 (iy), #0x02
	jp	00124$
00118$:
;./puyopuyo.c:1778: else if (g_GameState == STATE_GAMEOVER) {
	ld	a, (_g_GameState+0)
	sub	a, #0x02
	jr	NZ, 00124$
;./puyopuyo.c:1779: Game_DrawGameOver();
	call	_Game_DrawGameOver
;./puyopuyo.c:1780: SFX_Victory();
	call	_SFX_Victory
;./puyopuyo.c:1781: WaitFrames(60);
	ld	a, #0x3c
	call	_WaitFrames
;./puyopuyo.c:1782: WaitButton();
	call	_WaitButton
;./puyopuyo.c:1784: PT3_Silence();
	call	_PT3_Silence
;./puyopuyo.c:1785: Game_DrawStatsScreen();
	call	_Game_DrawStatsScreen
;./puyopuyo.c:1786: WaitButton();
	call	_WaitButton
;./puyopuyo.c:1787: g_GameState = STATE_TITLE;
	ld	hl, #_g_GameState
	ld	(hl), #0x00
;./puyopuyo.c:1788: VDP_Setup();
	call	_VDP_Setup
;./puyopuyo.c:1791: }
	jp	00124$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
