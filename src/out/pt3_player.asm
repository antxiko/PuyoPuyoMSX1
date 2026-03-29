;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module pt3_player
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _PT3_Finish
	.globl _PT3_SrtCrPsPtr
	.globl _PT3_NoteTable
	.globl _PT3_ESldAdd
	.globl _PT3_Env_Del
	.globl _PT3_AddToEn
	.globl _PT3_Delay
	.globl _PT3_PatsPtr
	.globl _PT3_LPosPtr
	.globl _PT3_AdInPtC
	.globl _PT3_AdInPtB
	.globl _PT3_AdInPtA
	.globl _PT3_PrSlide
	.globl _PT3_PrNote
	.globl _PT3_PSP
	.globl _PT3_CSP
	.globl _PT3_PDSP
	.globl _PT3_OrnPtrs
	.globl _PT3_SamPtrs
	.globl _PT3_CrPsPtr
	.globl _PT3_ModAddr
	.globl _PT3_State
	.globl _VAR0END
	.globl _EnvBase
	.globl _PT3_Regs
	.globl _AddToNs
	.globl _Ns_Base
	.globl _CurEDel
	.globl _CurESld
	.globl _DelyCnt
	.globl _ChanC
	.globl _ChanB
	.globl _ChanA
	.globl _EmptyCB
	.globl _PT3_Init
	.globl _PT3_InitSong
	.globl _PT3_Pause
	.globl _PT3_Resume
	.globl _PT3_SetLoop
	.globl _PT3_Silence
	.globl _PT3_UpdatePSG
	.globl _PT3_Decode
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
_ChanA::
	.ds 29
_ChanB::
	.ds 29
_ChanC::
	.ds 29
_DelyCnt::
	.ds 1
_CurESld::
	.ds 2
_CurEDel::
	.ds 1
_Ns_Base::
	.ds 1
_AddToNs::
	.ds 1
_PT3_Regs::
	.ds 14
_EnvBase::
	.ds 2
_VAR0END::
	.ds 240
_PT3_State::
	.ds 1
_PT3_ModAddr::
	.ds 2
_PT3_CrPsPtr::
	.ds 2
_PT3_SamPtrs::
	.ds 2
_PT3_OrnPtrs::
	.ds 2
_PT3_PDSP::
	.ds 2
_PT3_CSP::
	.ds 2
_PT3_PSP::
	.ds 2
_PT3_PrNote::
	.ds 1
_PT3_PrSlide::
	.ds 2
_PT3_AdInPtA::
	.ds 2
_PT3_AdInPtB::
	.ds 2
_PT3_AdInPtC::
	.ds 2
_PT3_LPosPtr::
	.ds 2
_PT3_PatsPtr::
	.ds 2
_PT3_Delay::
	.ds 1
_PT3_AddToEn::
	.ds 1
_PT3_Env_Del::
	.ds 1
_PT3_ESldAdd::
	.ds 2
_PT3_NoteTable::
	.ds 2
_PT3_SrtCrPsPtr::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_PT3_Finish::
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
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/pt3/pt3_player.c:117: void EmptyCB() {}
;	---------------------------------
; Function EmptyCB
; ---------------------------------
_EmptyCB::
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/pt3/pt3_player.c:134: void PT3_Init()
;	---------------------------------
; Function PT3_Init
; ---------------------------------
_PT3_Init::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/pt3/pt3_player.c:178: __endasm;
	ld	HL, #0x11
	ld	D, H
	ld	E, H
	ld	IY, #_VAR0END
	ld	B, #15
	INITV1:
	push	HL
	add	HL, DE
	ex	DE, HL
	sbc	HL, HL
	ld	C, B
	ld	B, #16
	INITV2:
	ld	A, L
	rla
	ld	A, H
	adc	A, #0
	ld	(IY), A
	inc	IY
	add	HL, DE
	djnz	INITV2
	pop	HL
	ld	A, E
	cp	#0x77
	jr	NZ, INITV3
	inc	E
	INITV3:
	ld	B, C
	djnz	INITV1
	InitClearRegs:
	xor	A
	ld	(#_PT3_State), A
	ld	HL, #_PT3_Regs
	ld	DE, #_PT3_Regs + 1
	ld	BC, #13
	ld	(HL), A
	ldir
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/pt3/pt3_player.c:179: }
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/pt3/pt3_player.c:185: void PT3_InitSong(const void* songAddr)
;	---------------------------------
; Function PT3_InitSong
; ---------------------------------
_PT3_InitSong::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/pt3/pt3_player.c:268: __endasm;
	ld	(#_PT3_ModAddr), HL
	ex	DE, HL
	ld	HL, #100
	add	HL, DE
	ld	A, (HL)
	ld	(#_PT3_Delay), A
	ld	HL, #105
	add	HL, DE
	ld	(#_PT3_SamPtrs), HL
	ld	HL, #169
	add	HL, DE
	ld	(#_PT3_OrnPtrs), HL
	ld	HL, #200
	add	HL, DE
	ld	(#_PT3_CrPsPtr), HL
	ld	(#_PT3_SrtCrPsPtr), HL
	ld	IY, (#_PT3_ModAddr)
	ld	B, #0
	ld	C, 102(IY)
	ld	HL, #201
	add	HL, DE
	add	HL, BC
	ld	(#_PT3_LPosPtr), HL
	ld	B, 104(IY)
	ld	C, 103(IY)
	ex	DE, HL
	add	HL, BC
	ld	(#_PT3_PatsPtr), HL
	xor	A
	ld	HL, #_ChanA
	ld	(HL), A
	ld	DE, #_ChanA + 1
	ld	BC, #_VAR0END - _ChanA -1
	ldir
	inc	A
	ld	(#_DelyCnt), A
	ld	HL, #0xF001
	ld	(#_ChanA + 27), HL
	ld	(#_ChanB + 27), HL
	ld	(#_ChanC + 27), HL
	ld	HL, #EMPTYSAMORN
	ld	(#_PT3_AdInPtA), HL
	ld	(#_ChanA + 13), HL
	ld	(#_ChanB + 13), HL
	ld	(#_ChanC + 13), HL
	ld	(#_ChanA + 15), HL
	ld	(#_ChanB + 15), HL
	ld	(#_ChanC + 15), HL
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/pt3/pt3_player.c:269: }
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/pt3/pt3_player.c:273: void PT3_Pause() __NAKED
;	---------------------------------
; Function PT3_Pause
; ---------------------------------
_PT3_Pause::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/pt3/pt3_player.c:280: __endasm;
	ld	HL, #_PT3_State
	res	0, (HL)
	jp	_PT3_Silence
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/pt3/pt3_player.c:281: }
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/pt3/pt3_player.c:285: void PT3_Resume()
;	---------------------------------
; Function PT3_Resume
; ---------------------------------
_PT3_Resume::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/pt3/pt3_player.c:290: __endasm;
	ld	HL, #_PT3_State
	set	0, (HL)
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/pt3/pt3_player.c:291: }
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/pt3/pt3_player.c:296: void PT3_SetLoop(u8 loop)
;	---------------------------------
; Function PT3_SetLoop
; ---------------------------------
_PT3_SetLoop::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/pt3/pt3_player.c:310: __endasm;
	ld	HL, #_PT3_State
	or	A
	jr	NZ, LoopON
	res	4, (HL)
	ret
	LoopON:
	set	4, (HL)
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/pt3/pt3_player.c:311: }
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/pt3/pt3_player.c:315: void PT3_Silence() __NAKED
;	---------------------------------
; Function PT3_Silence
; ---------------------------------
_PT3_Silence::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/pt3/pt3_player.c:324: __endasm;
	xor	A
	ld	(#_PT3_Regs + 8), A
	ld	(#_PT3_Regs + 9), A
	ld	(#_PT3_Regs + 10), A
	jp	_PT3_UpdatePSG
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/pt3/pt3_player.c:325: }
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/pt3/pt3_player.c:330: void PT3_UpdatePSG()
;	---------------------------------
; Function PT3_UpdatePSG
; ---------------------------------
_PT3_UpdatePSG::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/pt3/pt3_player.c:387: __endasm;
	ld	HL, #_PT3_State
	xor	A
	UpdatePSGMuteA:
	bit	1, (HL)
	jp	z, UpdatePSGMuteB
	ld	(#_PT3_Regs + 8), A
	UpdatePSGMuteB:
	bit	2, (HL)
	jp	z, UpdatePSGMuteC
	ld	(#_PT3_Regs + 9), A
	UpdatePSGMuteC:
	bit	3, (HL)
	jp	z, UpdatePSGMuteEnd
	ld	(#_PT3_Regs + 10), A
	UpdatePSGMuteEnd:
	ld	A, (#_PT3_Regs + 7)
	and	#0b00111111
	ld	B, A
	ld	A, #7
	out	(#0xA0), A
	in	A, (#0xA2)
	and	#0b11000000
	or	B
	ld	(#_PT3_Regs + 7), A
	ld	HL, #_PT3_Regs
	ld	C, #0xA1
	xor	A
	.rept	13
	out	(0xA0), A
	outi
	inc	A
	.endm
	out	(0xA0), A
	ld	A, (HL)
	and	A
	ret	M
	out	(0xA1), A
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/pt3/pt3_player.c:388: }
	ret
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/pt3/pt3_player.c:392: void PT3_Decode() __NAKED
;	---------------------------------
; Function PT3_Decode
; ---------------------------------
_PT3_Decode::
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/pt3/pt3_player.c:1093: __endasm;
	di
	call	decode_start
	ei
	ret
	 decode_start:
	ld	HL, #_PT3_State
	bit	0, (HL)
	ret	Z
	xor	A
	ld	(#_PT3_AddToEn), A
	ld	(#_PT3_Regs + 7), A
	dec	A
	ld	(#_PT3_Regs + 13), A
	LD	HL,#_DelyCnt
	DEC	(HL)
	JP	NZ,PL2
	LD	HL,#_ChanA + 27
	DEC	(HL)
	JR	NZ,PL1B
	ld	BC,(#_PT3_AdInPtA)
	LD	A,(BC)
	AND	A
	JR	NZ,PL1A
	LD	D,A
	LD	(#_Ns_Base),A
	LD	HL,(#_PT3_CrPsPtr)
	INC	HL
	LD	A,(HL)
	INC	A
	JR	NZ,PLNLP
	CALL	DecodeCheckLoop
	ld	HL,(#_PT3_LPosPtr)
	LD	A,(HL)
	INC	A
	PLNLP:
	LD	(#_PT3_CrPsPtr),HL
	DEC	A
	ADD	A,A
	LD	E,A
	RL	D
	ld	HL,(#_PT3_PatsPtr)
	ADD	HL,DE
	LD	DE,(#_PT3_ModAddr)
	ld	(#_PT3_PSP),SP
	LD	SP,HL
	POP	HL
	ADD	HL,DE
	LD	B,H
	LD	C,L
	POP	HL
	ADD	HL,DE
	LD	(#_PT3_AdInPtB),HL
	POP	HL
	ADD	HL,DE
	LD	(#_PT3_AdInPtC),HL
	ld	SP,(#_PT3_PSP)
	PL1A:
	LD	IY,#_ChanA + 12
	CALL	PTDECOD
	LD	(#_PT3_AdInPtA),BC
	PL1B:
	LD	HL,#_ChanB + 27
	DEC	(HL)
	JR	NZ,PL1C
	LD	IY,#_ChanB + 12
	ld	BC,(#_PT3_AdInPtB)
	CALL	PTDECOD
	LD	(#_PT3_AdInPtB),BC
	PL1C:
	LD	HL,#_ChanC + 27
	DEC	(HL)
	JR	NZ,PL1D
	LD	IY,#_ChanC + 12
	ld	BC,(#_PT3_AdInPtC)
	CALL	PTDECOD
	LD	(#_PT3_AdInPtC),BC
	PL1D:
	ld	A,(#_PT3_Delay)
	ld	(#_DelyCnt),A
	PL2:
	LD	IY,#_ChanA
	LD	HL,(#_PT3_Regs + 0)
	CALL	CHREGS
	LD	(#_PT3_Regs + 0),HL
	LD	A,(#_PT3_Regs + 10)
	LD	(#_PT3_Regs + 8),A
	LD	IY,#_ChanB
	LD	HL,(#_PT3_Regs + 2)
	CALL	CHREGS
	LD	(#_PT3_Regs + 2),HL
	LD	A,(#_PT3_Regs + 10)
	LD	(#_PT3_Regs + 9),A
	LD	IY,#_ChanC
	LD	HL,(#_PT3_Regs + 4)
	CALL	CHREGS
	LD	(#_PT3_Regs + 4),HL
	LD	HL,(#_Ns_Base)
	LD	A,H
	ADD	A,L
	LD	(#_PT3_Regs + 6),A
	ld	A,(#_PT3_AddToEn)
	LD	E,A
	ADD	A,A
	SBC	A,A
	LD	D,A
	LD	HL,(#_EnvBase)
	ADD	HL,DE
	LD	DE,(#_CurESld)
	ADD	HL,DE
	LD	(#_PT3_Regs + 11),HL
	XOR	A
	LD	HL,#_CurEDel
	OR	(HL)
	RET	Z
	DEC	(HL)
	RET	NZ
	LD	A,(#_PT3_Env_Del)
	LD	(HL),A
	LD	HL,(#_PT3_ESldAdd)
	ADD	HL,DE
	LD	(#_CurESld),HL
	RET
	DecodeCheckLoop:
	ld	HL, (_PT3_Finish)
	call	PT3_CALL_HL
	ld	HL, #_PT3_State
	set	5, (HL)
	bit	4, (HL)
	ret	NZ
	POP	HL
	LD	HL,#_DelyCnt
	INC	(HL)
	LD	HL,#_ChanA + 27
	INC	(HL)
	jp	_PT3_Pause
	PD_OrSm:
	LD	-12 + 20(IY),#0
	CALL	SETORN
	LD	A,(BC)
	INC	BC
	RRCA
	PD_SAM:
	ADD	A,A
	PD_SAM_:
	LD	E,A
	LD	D,#0
	ld	HL,(#_PT3_SamPtrs)
	ADD	HL,DE
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	ld	HL,(#_PT3_ModAddr)
	ADD	HL,DE
	LD	-12 + 15(IY),L
	LD	-12 + 15 + 1(IY),H
	JR	PD_LOOP
	PD_VOL:
	RLCA
	RLCA
	RLCA
	RLCA
	LD	-12 + 28(IY),A
	JR	PD_LP2
	PD_EOff:
	LD	-12 + 20(IY),A
	LD	-12 + 0(IY),A
	JR	PD_LP2
	PD_SorE:
	DEC	A
	JR	NZ,PD_ENV
	LD	A,(BC)
	INC	BC
	LD	-12 + 17(IY),A
	JR	PD_LP2
	PD_ENV:
	CALL	SETENV
	JR	PD_LP2
	PD_ORN:
	CALL	SETORN
	JR	PD_LOOP
	PD_ESAM:
	LD	-12 + 20(IY),A
	LD	-12 + 0(IY),A
	CALL	NZ,SETENV
	LD	A,(BC)
	INC	BC
	JR	PD_SAM_
	PTDECOD:
	LD	A,-12 + 18(IY)
	LD	(#_PT3_PrNote),A
	LD	L,6 -12(IY)
	LD	H,6 + 1-12(IY)
	LD	(#_PT3_PrSlide),HL
	PD_LOOP:
	ld	DE,#0x2010
	PD_LP2:
	ld	A,(BC)
	inc	BC
	ADD	A,E
	JR	C,PD_OrSm
	ADD	A,D
	JR	Z,PD_FIN
	JR	C,PD_SAM
	ADD	A,E
	JR	Z,PD_REL
	JR	C,PD_VOL
	ADD	A,E
	JR	Z,PD_EOff
	JR	C,PD_SorE
	ADD	A,#96
	JR	C,PD_NOTE
	ADD	A,E
	JR	C,PD_ORN
	ADD	A,D
	JR	C,PD_NOIS
	ADD	A,E
	JR	C,PD_ESAM
	ADD	A,A
	LD	E,A
	LD	HL,#(SPCCOMS + 0xDF20)
	ADD	HL,DE
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	PUSH	DE
	JR	PD_LOOP
	PD_NOIS:
	LD	(#_Ns_Base),A
	JR	PD_LP2
	PD_REL:
	RES	0,-12 + 21(IY)
	JR	PD_RES
	PD_NOTE:
	ld	-12 + 18(IY),A
	SET	0,-12 + 21(IY)
	XOR	A
	PD_RES:
	LD	(#_PT3_PDSP),SP
	LD	SP,IY
	LD	H,A
	LD	L,A
	PUSH	HL
	PUSH	HL
	PUSH	HL
	PUSH	HL
	PUSH	HL
	PUSH	HL
	LD	SP,(#_PT3_PDSP)
	PD_FIN:
	ld	A,-12 + 17(IY)
	ld	-12 + 27(IY),A
	ret
	C_PORTM:
	RES	2,-12 + 21(IY)
	LD	A,(BC)
	INC	BC
	INC	BC
	INC	BC
	LD	-12 + 22(IY),A
	LD	-12 + 5(IY),A
	LD	DE,(#_PT3_NoteTable)
	LD	A,-12 + 18(IY)
	LD	-12 + 19(IY),A
	ADD	A,A
	LD	L,A
	LD	H,#0
	ADD	HL,DE
	LD	A,(HL)
	INC	HL
	LD	H,(HL)
	LD	L,A
	PUSH	HL
	LD	A,(#_PT3_PrNote)
	LD	-12 + 18(IY),A
	ADD	A,A
	LD	L,A
	LD	H,#0
	ADD	HL,DE
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	POP	HL
	SBC	HL,DE
	LD	-12 + 25(IY),L
	LD	-12 + 25 + 1(IY),H
	LD	DE,(#_PT3_PrSlide)
	LD	-12 + 6(IY),E
	LD	-12 + 6 + 1(IY),D
	LD	A,(BC)
	INC	BC
	EX	AF,AF
	LD	A,(BC)
	INC	BC
	AND	A
	JR	Z,NOSIG
	EX	DE,HL
	NOSIG:
	SBC	HL,DE
	JP	P,SET_STP
	CPL
	EX	AF,AF
	NEG
	EX	AF,AF
	SET_STP:
	LD	-12 + 23 + 1(IY),A
	EX	AF,AF
	ld	-12 + 23(IY),A
	ld	-12 + 10(IY),#0
	ret
	C_GLISS:
	SET	2,-12 + 21(IY)
	LD	A,(BC)
	INC	BC
	LD	-12 + 22(IY),A
	LD	-12 + 5(IY),A
	LD	A,(BC)
	INC	BC
	EX	AF,AF
	LD	A,(BC)
	INC	BC
	JR	SET_STP
	C_SMPOS:
	LD	A,(BC)
	INC	BC
	LD	-12 + 1(IY),A
	RET
	C_ORPOS:
	LD	A,(BC)
	INC	BC
	LD	-12 + 0(IY),A
	RET
	C_VIBRT:
	LD	A,(BC)
	INC	BC
	LD	-12 + 11(IY),A
	LD	-12 + 10(IY),A
	LD	A,(BC)
	INC	BC
	LD	-12 + 12(IY),A
	XOR	A
	LD	-12 + 5(IY),A
	LD	-12 + 6(IY),A
	LD	-12 + 6 + 1(IY),A
	RET
	C_ENGLS:
	LD	A,(BC)
	INC	BC
	LD	(#_PT3_Env_Del),A
	LD	(#_CurEDel),A
	LD	A,(BC)
	INC	BC
	LD	L,A
	LD	A,(BC)
	INC	BC
	LD	H,A
	LD	(#_PT3_ESldAdd),HL
	RET
	C_DELAY:
	LD	A,(BC)
	INC	BC
	LD	(#_PT3_Delay),A
	RET
	SETENV:
	LD	-12 + 20(IY),E
	LD	(#_PT3_Regs + 13),A
	LD	A,(BC)
	INC	BC
	LD	H,A
	LD	A,(BC)
	INC	BC
	LD	L,A
	LD	(#_EnvBase),HL
	XOR	A
	LD	-12 + 0(IY),A
	LD	(#_CurEDel),A
	LD	H,A
	LD	L,A
	LD	(#_CurESld),HL
	C_NOP:
	RET
	SETORN:
	ADD	A,A
	LD	E,A
	LD	D,#0
	LD	-12 + 0(IY),D
	ld	HL,(#_PT3_OrnPtrs)
	ADD	HL,DE
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	ld	HL,(#_PT3_ModAddr)
	ADD	HL,DE
	LD	-12 + 13(IY),L
	LD	-12 + 13 + 1(IY),H
	RET
	SPCCOMS:
	.dw	C_NOP
	.dw	C_GLISS
	.dw	C_PORTM
	.dw	C_SMPOS
	.dw	C_ORPOS
	.dw	C_VIBRT
	.dw	C_NOP
	.dw	C_NOP
	.dw	C_ENGLS
	.dw	C_DELAY
	.dw	C_NOP
	.dw	C_NOP
	.dw	C_NOP
	.dw	C_NOP
	.dw	C_NOP
	.dw	C_NOP
	CHREGS:
	XOR	A
	LD	(#_PT3_Regs + 10),A
	BIT	0,21(IY)
	PUSH	HL
	JP	Z,CH_EXIT
	ld	(#_PT3_CSP),sp
	LD	L,13(IY)
	LD	H,13 + 1(IY)
	LD	SP,HL
	POP	DE
	LD	H,A
	LD	A,0(IY)
	LD	L,A
	ADD	HL,SP
	INC	A
	CP	D
	JR	C,CH_ORPS
	LD	A,E
	CH_ORPS:
	LD	0(IY),A
	LD	A,18(IY)
	ADD	A,(HL)
	JP	P,CH_NTP
	XOR	A
	CH_NTP:
	CP	#96
	JR	C,CH_NOK
	LD	A,#95
	CH_NOK:
	ADD	A,A
	EX	AF,AF
	LD	L,15(IY)
	LD	H,15 + 1(IY)
	LD	SP,HL
	POP	DE
	LD	H,#0
	LD	A,1(IY)
	LD	B,A
	ADD	A,A
	ADD	A,A
	LD	L,A
	ADD	HL,SP
	LD	SP,HL
	LD	A,B
	INC	A
	CP	D
	JR	C,CH_SMPS
	LD	A,E
	CH_SMPS:
	LD	1(IY),A
	POP	BC
	POP	HL
	LD	E,8(IY)
	LD	D,8 + 1(IY)
	ADD	HL,DE
	BIT	6,B
	JR	Z,CH_NOAC
	LD	8(IY),L
	LD	8 + 1(IY),H
	CH_NOAC:
	EX	DE,HL
	EX	AF,AF
	LD	L,A
	LD	H,#0
	LD	SP,(#_PT3_NoteTable)
	ADD	HL,SP
	LD	SP,HL
	POP	HL
	ADD	HL,DE
	LD	E,6(IY)
	LD	D,6 + 1(IY)
	ADD	HL,DE
	ld	SP,(#_PT3_CSP)
	EX	(SP),HL
	XOR	A
	OR	5(IY)
	JR	Z,CH_AMP
	DEC	5(IY)
	JR	NZ,CH_AMP
	LD	A,22(IY)
	LD	5(IY),A
	LD	L,23(IY)
	LD	H,23 + 1(IY)
	LD	A,H
	ADD	HL,DE
	LD	6(IY),L
	LD	6 + 1(IY),H
	BIT	2,21(IY)
	JR	NZ,CH_AMP
	LD	E,25(IY)
	LD	D,25 + 1(IY)
	AND	A
	JR	Z,CH_STPP
	EX	DE,HL
	CH_STPP:
	SBC	HL,DE
	JP	M,CH_AMP
	LD	A,19(IY)
	LD	18(IY),A
	XOR	A
	LD	5(IY),A
	LD	6(IY),A
	LD	6 + 1(IY),A
	CH_AMP:
	LD	A,2(IY)
	BIT	7,C
	JR	Z,CH_NOAM
	BIT	6,C
	JR	Z,CH_AMIN
	CP	#15
	JR	Z,CH_NOAM
	INC	A
	JR	CH_SVAM
	CH_AMIN:
	CP	#-15
	JR	Z,CH_NOAM
	DEC	A
	CH_SVAM:
	LD	2(IY),A
	CH_NOAM:
	LD	L,A
	LD	A,B
	AND	#15
	ADD	A,L
	JP	P,CH_APOS
	XOR	A
	CH_APOS:
	CP	#16
	JR	C,CH_VOL
	LD	A,#15
	CH_VOL:
	OR	28(IY)
	LD	L,A
	LD	H,#0
	LD	DE,#_PT3_Regs
	ADD	HL,DE
	LD	A,(HL)
	CH_ENV:
	BIT	0,C
	JR	NZ,CH_NOEN
	OR	20(IY)
	CH_NOEN:
	LD	(#_PT3_Regs + 10),A
	BIT	7,B
	LD	A,C
	JR	Z,NO_ENSL
	RLA
	RLA
	SRA	A
	SRA	A
	SRA	A
	ADD	A,4(IY)
	BIT	5,B
	JR	Z,NO_ENAC
	LD	4(IY),A
	NO_ENAC:
	ld	HL,#_PT3_AddToEn
	ADD	A,(HL)
	LD	(HL),A
	JR	CH_MIX
	NO_ENSL:
	RRA
	ADD	A,3(IY)
	LD	(#_AddToNs),A
	BIT	5,B
	JR	Z,CH_MIX
	LD	3(IY),A
	CH_MIX:
	LD	A,B
	RRA
	AND	#0x48
	CH_EXIT:
	LD	HL,#_PT3_Regs + 7
	OR	(HL)
	RRCA
	LD	(HL),A
	POP	HL
	XOR	A
	OR	10(IY)
	RET	Z
	DEC	10(IY)
	RET	NZ
	XOR	21(IY)
	LD	21(IY),A
	RRA
	LD	A,11(IY)
	JR	C,CH_ONDL
	LD	A,12(IY)
	CH_ONDL:
	LD	10(IY),A
	RET
	PT3_CALL_HL:
	jp	(hl)
	EMPTYSAMORN:
	.db	0,1,0,0x90
;C:\Users\Antxiko\Documents\PuyoPuyoVS\MSXgl\engine/src/pt3/pt3_player.c:1094: }
	.area _CODE
	.area _INITIALIZER
__xinit__PT3_Finish:
	.dw _EmptyCB
	.area _CABS (ABS)
