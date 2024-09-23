;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.6 #14545 (Mac OS X x86_64)
;--------------------------------------------------------
	.module preemptive
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _myTimer0Handler
	.globl _Bootstrap
	.globl _main
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _Next_ID
	.globl _New_ID
	.globl _SP_new
	.globl _SP_old
	.globl _Cur_ID
	.globl _Map
	.globl _SP3
	.globl _SP2
	.globl _SP1
	.globl _SP0
	.globl _ThreadCreate
	.globl _ThreadYield
	.globl _ThreadExit
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_SP0	=	0x0020
_SP1	=	0x0021
_SP2	=	0x0022
_SP3	=	0x0023
_Map	=	0x0024
_Cur_ID	=	0x0025
_SP_old	=	0x0030
_SP_new	=	0x0031
_New_ID	=	0x0032
_Next_ID	=	0x0033
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; uninitialized external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; initialized external ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'Bootstrap'
;------------------------------------------------------------
;	preemptive.c:116: void Bootstrap(void) {
;	-----------------------------------------
;	 function Bootstrap
;	-----------------------------------------
_Bootstrap:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	preemptive.c:130: Map = 0x00; // Clear thread bitmap indicating no threads are running
	clr	a
	mov	_Map,a
	mov	(_Map + 1),a
;	preemptive.c:131: SP0 = 0x3F; // Initialize stack pointer
	mov	_SP0,#0x3f
	mov	(_SP0 + 1),a
;	preemptive.c:132: SP1 = 0x4F;
	mov	_SP1,#0x4f
	mov	(_SP1 + 1),a
;	preemptive.c:133: SP2 = 0x5F;
	mov	_SP2,#0x5f
	mov	(_SP2 + 1),a
;	preemptive.c:134: SP3 = 0x6F;
	mov	_SP3,#0x6f
	mov	(_SP3 + 1),a
;	preemptive.c:137: TMOD = 0;  // timer 0 mode 0
	mov	_TMOD,a
;	preemptive.c:138: IE = 0x82;  // enable timer 0 interrupt; keep consumer polling
	mov	_IE,#0x82
;	preemptive.c:140: TR0 = 1; // set bit TR0 to start running timer 0
;	assignBit
	setb	_TR0
;	preemptive.c:144: Next_ID = '1';
	mov	_Next_ID,#0x31
;	preemptive.c:146: Cur_ID = ThreadCreate(main);
	mov	dptr,#_main
	lcall	_ThreadCreate
	mov	_Cur_ID,dpl
;	preemptive.c:147: RESTORESTATE; //restore the state of new create main thread
	mov	a,#0x30
	cjne	a,_Cur_ID,00110$
	MOV SP, 0x20 
	sjmp	00111$
00110$:
	mov	a,#0x31
	cjne	a,_Cur_ID,00107$
	MOV SP, 0x21 
	sjmp	00111$
00107$:
	mov	a,#0x32
	cjne	a,_Cur_ID,00104$
	MOV SP, 0x22 
	sjmp	00111$
00104$:
	mov	a,#0x33
	cjne	a,_Cur_ID,00111$
	MOV SP, 0x23 
00111$:
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:148: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'myTimer0Handler'
;------------------------------------------------------------
;	preemptive.c:151: void myTimer0Handler(void) {
;	-----------------------------------------
;	 function myTimer0Handler
;	-----------------------------------------
_myTimer0Handler:
;	preemptive.c:152: EA = 0; // Disable interrupts
;	assignBit
	clr	_EA
;	preemptive.c:153: SAVESTATE; // Save current thread state
	PUSH ACC 
	PUSH B 
	PUSH DPL 
	PUSH DPH 
	PUSH PSW 
	mov	a,#0x30
	cjne	a,_Cur_ID,00110$
	MOV 0x20, SP 
	sjmp	00111$
00110$:
	mov	a,#0x31
	cjne	a,_Cur_ID,00107$
	MOV 0x21, SP 
	sjmp	00111$
00107$:
	mov	a,#0x32
	cjne	a,_Cur_ID,00104$
	MOV 0x22, SP 
	sjmp	00111$
00104$:
	mov	a,#0x33
	cjne	a,_Cur_ID,00111$
	MOV 0x23, SP 
00111$:
;	preemptive.c:154: if (Cur_ID != '0') {
	mov	a,#0x30
	cjne	a,_Cur_ID,00199$
	sjmp	00116$
00199$:
;	preemptive.c:158: Cur_ID = '0';
	mov	_Cur_ID,#0x30
	sjmp	00117$
00116$:
;	preemptive.c:163: Cur_ID = Next_ID;
	mov	_Cur_ID,_Next_ID
;	preemptive.c:166: if(Next_ID == '1') Next_ID = '2';
	mov	a,#0x31
	cjne	a,_Next_ID,00113$
	mov	_Next_ID,#0x32
	sjmp	00117$
00113$:
;	preemptive.c:167: else Next_ID = '1';
	mov	_Next_ID,#0x31
00117$:
;	preemptive.c:169: RESTORESTATE; // Restore the state of the next thread
	mov	a,#0x30
	cjne	a,_Cur_ID,00127$
	MOV SP, 0x20 
	sjmp	00128$
00127$:
	mov	a,#0x31
	cjne	a,_Cur_ID,00124$
	MOV SP, 0x21 
	sjmp	00128$
00124$:
	mov	a,#0x32
	cjne	a,_Cur_ID,00121$
	MOV SP, 0x22 
	sjmp	00128$
00121$:
	mov	a,#0x33
	cjne	a,_Cur_ID,00128$
	MOV SP, 0x23 
00128$:
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:170: EA = 1; // Re-enable interrupts
;	assignBit
	setb	_EA
;	preemptive.c:174: __endasm;
	RETI
;	preemptive.c:175: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadCreate'
;------------------------------------------------------------
;fp                        Allocated to registers 
;------------------------------------------------------------
;	preemptive.c:183: ThreadID ThreadCreate(FunctionPtr fp) {
;	-----------------------------------------
;	 function ThreadCreate
;	-----------------------------------------
_ThreadCreate:
;	preemptive.c:190: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:192: if ((Map & 0xFF) == 0xFF) return -1; // Return -1 if no available thread IDs
	mov	r6,_Map
	mov	a,(_Map + 1)
	mov	r7,#0x00
	cjne	r6,#0xff,00102$
	cjne	r7,#0x00,00102$
	mov	dpl, #0xff
	ret
00102$:
;	preemptive.c:235: New_ID = 'x';
	mov	_New_ID,#0x78
;	preemptive.c:240: if ((Map & 0x01) == 0x00) {
	mov	a,_Map
	jb	acc.0,00112$
;	preemptive.c:249: __endasm;
	MOV	0x32, #48
	ORL	0x24, #01
	MOV	0x31, 0x20
	sjmp	00113$
00112$:
;	preemptive.c:250: } else if ((Map & 0x02) == 0x00) {
	mov	a,_Map
	jb	acc.1,00109$
;	preemptive.c:255: __endasm;
	MOV	0x32, #49
	ORL	0x24, #02
	MOV	0x31, 0x21
	sjmp	00113$
00109$:
;	preemptive.c:256: } else if ((Map & 0x04) == 0x00) {
	mov	a,_Map
	jb	acc.2,00106$
;	preemptive.c:261: __endasm;
	MOV	0x32, #50
	ORL	0x24, #04
	MOV	0x31, 0x22
	sjmp	00113$
00106$:
;	preemptive.c:262: } else if ((Map & 0x08) == 0x00) {
	mov	a,_Map
	jb	acc.3,00113$
;	preemptive.c:267: __endasm;
	MOV	0x32, #51
	ORL	0x24, #08
	MOV	0x31, 0x23
00113$:
;	preemptive.c:275: __endasm;
	MOV	0x30, sp
	MOV	sp, 0x31
;	preemptive.c:281: __endasm;
	PUSH	DPL
	PUSH	DPH
;	preemptive.c:290: __endasm;
	MOV	A, 0x00
	PUSH	ACC
	PUSH	ACC
	PUSH	ACC
	PUSH	ACC
;	preemptive.c:294: if (New_ID == '0') {
	mov	a,#0x30
	cjne	a,_New_ID,00123$
;	preemptive.c:299: __endasm;
	MOV	PSW, #0x00
	PUSH	PSW
	MOV	0x20, SP
	sjmp	00124$
00123$:
;	preemptive.c:300: } else if (New_ID == '1') {
	mov	a,#0x31
	cjne	a,_New_ID,00120$
;	preemptive.c:305: __endasm;
	MOV	PSW, #0x08
	PUSH	PSW
	MOV	0x21, SP
	sjmp	00124$
00120$:
;	preemptive.c:306: } else if (New_ID == '2') {
	mov	a,#0x32
	cjne	a,_New_ID,00117$
;	preemptive.c:311: __endasm;
	MOV	PSW, #0x10
	PUSH	PSW
	MOV	0x22, SP
	sjmp	00124$
00117$:
;	preemptive.c:312: } else if (New_ID == '3') {
	mov	a,#0x33
	cjne	a,_New_ID,00124$
;	preemptive.c:317: __endasm;
	MOV	PSW, #0x18
	PUSH	PSW
	MOV	0x23, SP
00124$:
;	preemptive.c:323: __endasm;
	MOV	sp, 0x30
;	preemptive.c:325: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:326: return New_ID;
	mov	dpl, _New_ID
;	preemptive.c:327: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadYield'
;------------------------------------------------------------
;	preemptive.c:336: void ThreadYield(void) {
;	-----------------------------------------
;	 function ThreadYield
;	-----------------------------------------
_ThreadYield:
;	preemptive.c:337: SAVESTATE;
	PUSH ACC 
	PUSH B 
	PUSH DPL 
	PUSH DPH 
	PUSH PSW 
	mov	a,#0x30
	cjne	a,_Cur_ID,00110$
	MOV 0x20, SP 
	sjmp	00130$
00110$:
	mov	a,#0x31
	cjne	a,_Cur_ID,00107$
	MOV 0x21, SP 
	sjmp	00130$
00107$:
	mov	a,#0x32
	cjne	a,_Cur_ID,00104$
	MOV 0x22, SP 
	sjmp	00130$
00104$:
	mov	a,#0x33
	cjne	a,_Cur_ID,00130$
	MOV 0x23, SP 
;	preemptive.c:338: do {
00130$:
;	preemptive.c:350: if (Cur_ID == '0') Cur_ID = '1';
	mov	a,#0x30
	cjne	a,_Cur_ID,00119$
	mov	_Cur_ID,#0x31
	sjmp	00120$
00119$:
;	preemptive.c:351: else if (Cur_ID == '1') Cur_ID = '2';
	mov	a,#0x31
	cjne	a,_Cur_ID,00116$
	mov	_Cur_ID,#0x32
	sjmp	00120$
00116$:
;	preemptive.c:352: else if (Cur_ID == '2') Cur_ID = '3';
	mov	a,#0x32
	cjne	a,_Cur_ID,00113$
	mov	_Cur_ID,#0x33
	sjmp	00120$
00113$:
;	preemptive.c:353: else Cur_ID = '0';
	mov	_Cur_ID,#0x30
00120$:
;	preemptive.c:356: if (((Cur_ID == '0') && ((Map & 0x01) == 0x01)) ||
	mov	a,#0x30
	cjne	a,_Cur_ID,00125$
	mov	a,#0x01
	anl	a,_Map
	mov	r6,a
	mov	a,(_Map + 1)
	mov	r7,#0x00
	cjne	r6,#0x01,00258$
	cjne	r7,#0x00,00258$
	sjmp	00132$
00258$:
00125$:
;	preemptive.c:357: ((Cur_ID == '1') && ((Map & 0x02) == 0x02)) ||
	mov	a,#0x31
	cjne	a,_Cur_ID,00127$
	mov	a,#0x02
	anl	a,_Map
	mov	r6,a
	mov	a,(_Map + 1)
	mov	r7,#0x00
	cjne	r6,#0x02,00261$
	cjne	r7,#0x00,00261$
	sjmp	00132$
00261$:
00127$:
;	preemptive.c:358: ((Cur_ID == '2') && ((Map & 0x04) == 0x04)) ||
	mov	a,#0x32
	cjne	a,_Cur_ID,00129$
	mov	a,#0x04
	anl	a,_Map
	mov	r6,a
	mov	a,(_Map + 1)
	mov	r7,#0x00
	cjne	r6,#0x04,00264$
	cjne	r7,#0x00,00264$
	sjmp	00132$
00264$:
00129$:
;	preemptive.c:359: ((Cur_ID == '3') && ((Map & 0x08) == 0x08))) {
	mov	a,#0x33
	cjne	a,_Cur_ID,00265$
	sjmp	00266$
00265$:
	ljmp	00130$
00266$:
	mov	a,#0x08
	anl	a,_Map
	mov	r6,a
	mov	a,(_Map + 1)
	mov	r7,#0x00
	cjne	r6,#0x08,00267$
	cjne	r7,#0x00,00267$
	sjmp	00268$
00267$:
	ljmp	00130$
00268$:
;	preemptive.c:362: } while (1);
00132$:
;	preemptive.c:363: RESTORESTATE;
	mov	a,#0x30
	cjne	a,_Cur_ID,00142$
	MOV SP, 0x20 
	sjmp	00143$
00142$:
	mov	a,#0x31
	cjne	a,_Cur_ID,00139$
	MOV SP, 0x21 
	sjmp	00143$
00139$:
	mov	a,#0x32
	cjne	a,_Cur_ID,00136$
	MOV SP, 0x22 
	sjmp	00143$
00136$:
	mov	a,#0x33
	cjne	a,_Cur_ID,00143$
	MOV SP, 0x23 
00143$:
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:364: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadExit'
;------------------------------------------------------------
;	preemptive.c:372: void ThreadExit(void) {
;	-----------------------------------------
;	 function ThreadExit
;	-----------------------------------------
_ThreadExit:
;	preemptive.c:381: if (Cur_ID == '0') {
	mov	a,#0x30
	cjne	a,_Cur_ID,00110$
;	preemptive.c:384: __endasm;
	ANL	0x24, #11111110
	sjmp	00130$
00110$:
;	preemptive.c:385: } else if (Cur_ID == '1') {
	mov	a,#0x31
	cjne	a,_Cur_ID,00107$
;	preemptive.c:388: __endasm;
	ANL	0x24, #11111101
	sjmp	00130$
00107$:
;	preemptive.c:389: } else if (Cur_ID == '2') {
	mov	a,#0x32
	cjne	a,_Cur_ID,00104$
;	preemptive.c:392: __endasm;
	ANL	0x24, #11111011
	sjmp	00130$
00104$:
;	preemptive.c:393: } else if (Cur_ID == '3') {
	mov	a,#0x33
	cjne	a,_Cur_ID,00130$
;	preemptive.c:396: __endasm;
	ANL	0x24, #11110111
;	preemptive.c:398: do {
00130$:
;	preemptive.c:400: if (Cur_ID == '0') Cur_ID = '1';
	mov	a,#0x30
	cjne	a,_Cur_ID,00119$
	mov	_Cur_ID,#0x31
	sjmp	00120$
00119$:
;	preemptive.c:401: else if (Cur_ID == '1') Cur_ID = '2';
	mov	a,#0x31
	cjne	a,_Cur_ID,00116$
	mov	_Cur_ID,#0x32
	sjmp	00120$
00116$:
;	preemptive.c:402: else if (Cur_ID == '2') Cur_ID = '3';
	mov	a,#0x32
	cjne	a,_Cur_ID,00113$
	mov	_Cur_ID,#0x33
	sjmp	00120$
00113$:
;	preemptive.c:403: else Cur_ID = '0';
	mov	_Cur_ID,#0x30
00120$:
;	preemptive.c:406: if (((Cur_ID == '0') && ((Map & 0x01) == 0x01)) ||
	mov	a,#0x30
	cjne	a,_Cur_ID,00125$
	mov	a,#0x01
	anl	a,_Map
	mov	r6,a
	mov	a,(_Map + 1)
	mov	r7,#0x00
	cjne	r6,#0x01,00258$
	cjne	r7,#0x00,00258$
	sjmp	00132$
00258$:
00125$:
;	preemptive.c:407: ((Cur_ID == '1') && ((Map & 0x02) == 0x02)) ||
	mov	a,#0x31
	cjne	a,_Cur_ID,00127$
	mov	a,#0x02
	anl	a,_Map
	mov	r6,a
	mov	a,(_Map + 1)
	mov	r7,#0x00
	cjne	r6,#0x02,00261$
	cjne	r7,#0x00,00261$
	sjmp	00132$
00261$:
00127$:
;	preemptive.c:408: ((Cur_ID == '2') && ((Map & 0x04) == 0x04)) ||
	mov	a,#0x32
	cjne	a,_Cur_ID,00129$
	mov	a,#0x04
	anl	a,_Map
	mov	r6,a
	mov	a,(_Map + 1)
	mov	r7,#0x00
	cjne	r6,#0x04,00264$
	cjne	r7,#0x00,00264$
	sjmp	00132$
00264$:
00129$:
;	preemptive.c:409: ((Cur_ID == '3') && ((Map & 0x08) == 0x08))) {
	mov	a,#0x33
	cjne	a,_Cur_ID,00265$
	sjmp	00266$
00265$:
	ljmp	00130$
00266$:
	mov	a,#0x08
	anl	a,_Map
	mov	r6,a
	mov	a,(_Map + 1)
	mov	r7,#0x00
	cjne	r6,#0x08,00267$
	cjne	r7,#0x00,00267$
	sjmp	00268$
00267$:
	ljmp	00130$
00268$:
;	preemptive.c:412: } while (1);
00132$:
;	preemptive.c:413: RESTORESTATE;
	mov	a,#0x30
	cjne	a,_Cur_ID,00142$
	MOV SP, 0x20 
	sjmp	00143$
00142$:
	mov	a,#0x31
	cjne	a,_Cur_ID,00139$
	MOV SP, 0x21 
	sjmp	00143$
00139$:
	mov	a,#0x32
	cjne	a,_Cur_ID,00136$
	MOV SP, 0x22 
	sjmp	00143$
00136$:
	mov	a,#0x33
	cjne	a,_Cur_ID,00143$
	MOV SP, 0x23 
00143$:
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:414: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
