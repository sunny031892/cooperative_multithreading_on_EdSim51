;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.6 #14545 (Mac OS X x86_64)
;--------------------------------------------------------
	.module test3thread
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SemaphoreCreate_PARM_2
	.globl _timer0_ISR
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genXINIT
	.globl __mcs51_genRAMCLEAR
	.globl __sdcc_gsinit_startup
	.globl _main
	.globl _Consumer
	.globl _Producer2
	.globl _Producer1
	.globl _SemaphoreCreate
	.globl _ThreadCreate
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
	.globl _Buffer
	.globl _Tail
	.globl _Head
	.globl _Word2
	.globl _Word1
	.globl _Empty
	.globl _Full
	.globl _Mutex
	.globl _Cur_ID
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
_Cur_ID	=	0x0025
_Mutex	=	0x0036
_Full	=	0x0037
_Empty	=	0x0038
_Word1	=	0x0039
_Word2	=	0x003a
_Head	=	0x003b
_Tail	=	0x003c
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
_SemaphoreCreate_PARM_2:
	.ds 1
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.org 0x003D
_Buffer::
	.ds 3
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
_SemaphoreCreate_sloc0_1_0:
	.ds 1
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
; interrupt vector
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	ljmp	_timer0_ISR
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
;	test3thread.c:31: __data __at (0x3D) char Buffer[3] = {' ', ' ', ' '}; // Circular buffer
	mov	_Buffer,#0x20
	mov	(_Buffer + 0x0001),#0x20
	mov	(_Buffer + 0x0002),#0x20
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'SemaphoreCreate'
;------------------------------------------------------------
;n                         Allocated with name '_SemaphoreCreate_PARM_2'
;s                         Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	test3thread.c:5: void SemaphoreCreate(char *s, char n) {
;	-----------------------------------------
;	 function SemaphoreCreate
;	-----------------------------------------
_SemaphoreCreate:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r5, dpl
	mov	r6, dph
	mov	r7, b
;	test3thread.c:8: }
	setb	_SemaphoreCreate_sloc0_1_0
	jbc	ea,00103$
	clr	_SemaphoreCreate_sloc0_1_0
00103$:
;	test3thread.c:7: *s = n;
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,_SemaphoreCreate_PARM_2
	lcall	__gptrput
	mov	c,_SemaphoreCreate_sloc0_1_0
	mov	ea,c
;	test3thread.c:9: return;
;	test3thread.c:10: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Producer1'
;------------------------------------------------------------
;	test3thread.c:39: void Producer1(void) {
;	-----------------------------------------
;	 function Producer1
;	-----------------------------------------
_Producer1:
;	test3thread.c:50: Word1 = 'A';
	mov	_Word1,#0x41
;	test3thread.c:51: while (1) {
00107$:
;	test3thread.c:52: SemaphoreWait(Empty); // Wait until buffer has empty space
0$:
	MOV ACC, _Empty 
	JZ 0$ 
	DEC _Empty 
;	test3thread.c:53: SemaphoreWait(Mutex); // Enter critical section
1$:
	MOV ACC, _Mutex 
	JZ 1$ 
	DEC _Mutex 
;	test3thread.c:54: Buffer[Tail] = Word1; // Add new character to buffer
	mov	a,_Tail
	add	a, #_Buffer
	mov	r0,a
	mov	@r0,_Word1
;	test3thread.c:55: Tail++; // Update tail index
	mov	a,_Tail
	inc	a
	mov	_Tail,a
;	test3thread.c:56: if (Tail == 3) Tail = 0;
	mov	a,#0x03
	cjne	a,_Tail,00102$
	mov	_Tail,#0x00
00102$:
;	test3thread.c:57: if (Word1 == 'Z') Word1 = 'A'; // Update character
	mov	a,#0x5a
	cjne	a,_Word1,00104$
	mov	_Word1,#0x41
	sjmp	00105$
00104$:
;	test3thread.c:58: else Word1++;
	mov	a,_Word1
	inc	a
	mov	_Word1,a
00105$:
;	test3thread.c:59: SemaphoreSignal(Mutex); // Leave critical section
	INC _Mutex 
;	test3thread.c:60: SemaphoreSignal(Full); // Signal buffer is full
	INC _Full 
;	test3thread.c:62: }
	sjmp	00107$
;------------------------------------------------------------
;Allocation info for local variables in function 'Producer2'
;------------------------------------------------------------
;	test3thread.c:64: void Producer2(void) {
;	-----------------------------------------
;	 function Producer2
;	-----------------------------------------
_Producer2:
;	test3thread.c:75: Word2 = '0';
	mov	_Word2,#0x30
;	test3thread.c:76: while (1) {
00107$:
;	test3thread.c:77: SemaphoreWait(Empty); // Wait until buffer has empty space
2$:
	MOV ACC, _Empty 
	JZ 2$ 
	DEC _Empty 
;	test3thread.c:78: SemaphoreWait(Mutex); // Enter critical section
3$:
	MOV ACC, _Mutex 
	JZ 3$ 
	DEC _Mutex 
;	test3thread.c:79: Buffer[Tail] = Word2; // Add new character to buffer
	mov	a,_Tail
	add	a, #_Buffer
	mov	r0,a
	mov	@r0,_Word2
;	test3thread.c:80: Tail++; // Update tail index
	mov	a,_Tail
	inc	a
	mov	_Tail,a
;	test3thread.c:81: if (Tail == 3) Tail = 0;
	mov	a,#0x03
	cjne	a,_Tail,00102$
	mov	_Tail,#0x00
00102$:
;	test3thread.c:82: if (Word2 == '9') Word2 = '0'; // Update character
	mov	a,#0x39
	cjne	a,_Word2,00104$
	mov	_Word2,#0x30
	sjmp	00105$
00104$:
;	test3thread.c:83: else Word2++;
	mov	a,_Word2
	inc	a
	mov	_Word2,a
00105$:
;	test3thread.c:84: SemaphoreSignal(Mutex); // Leave critical section
	INC _Mutex 
;	test3thread.c:85: SemaphoreSignal(Full); // Signal buffer is full
	INC _Full 
;	test3thread.c:87: }
	sjmp	00107$
;------------------------------------------------------------
;Allocation info for local variables in function 'Consumer'
;------------------------------------------------------------
;	test3thread.c:94: void Consumer(void) {
;	-----------------------------------------
;	 function Consumer
;	-----------------------------------------
_Consumer:
;	test3thread.c:103: TMOD |= 0x20;
	orl	_TMOD,#0x20
;	test3thread.c:104: TH1 = (char)-6;
	mov	_TH1,#0xfa
;	test3thread.c:105: SCON = 0x50;
	mov	_SCON,#0x50
;	test3thread.c:106: TR1 = 1;
;	assignBit
	setb	_TR1
;	test3thread.c:107: TI = 1;
;	assignBit
	setb	_TI
;	test3thread.c:108: while (1) {
00107$:
;	test3thread.c:109: SemaphoreWait(Full); // Wait for data in buffer
4$:
	MOV ACC, _Full 
	JZ 4$ 
	DEC _Full 
;	test3thread.c:110: SemaphoreWait(Mutex); // Enter critical section
5$:
	MOV ACC, _Mutex 
	JZ 5$ 
	DEC _Mutex 
;	test3thread.c:111: while (!TI); // Wait for Tx to be ready
00101$:
	jnb	_TI,00101$
;	test3thread.c:112: SBUF = Buffer[Head]; // Send character from buffer
	mov	a,_Head
	add	a, #_Buffer
	mov	r1,a
	mov	_SBUF,@r1
;	test3thread.c:113: TI = 0; // Clear Tx interrupt flag
;	assignBit
	clr	_TI
;	test3thread.c:114: Head++;
	mov	a,_Head
	inc	a
	mov	_Head,a
;	test3thread.c:115: if (Head == 3) Head = 0; // Circular increment of head;
	mov	a,#0x03
	cjne	a,_Head,00105$
	mov	_Head,#0x00
00105$:
;	test3thread.c:116: SemaphoreSignal(Mutex); // Exit critical section
	INC _Mutex 
;	test3thread.c:117: SemaphoreSignal(Empty); // Signal buffer is empty
	INC _Empty 
;	test3thread.c:119: }
	sjmp	00107$
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	test3thread.c:126: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	test3thread.c:133: SemaphoreCreate(&Mutex, 1); // Create mutex semaphore
	mov	_SemaphoreCreate_PARM_2,#0x01
	mov	dptr,#_Mutex
	mov	b, #0x40
	lcall	_SemaphoreCreate
;	test3thread.c:134: SemaphoreCreate(&Full, 0); // Create full semaphore
	mov	_SemaphoreCreate_PARM_2,#0x00
	mov	dptr,#_Full
	mov	b, #0x40
	lcall	_SemaphoreCreate
;	test3thread.c:135: SemaphoreCreate(&Empty, 3); // Create empty semaphore
	mov	_SemaphoreCreate_PARM_2,#0x03
	mov	dptr,#_Empty
	mov	b, #0x40
	lcall	_SemaphoreCreate
;	test3thread.c:136: Head = 0; // Initialize head index
	mov	_Head,#0x00
;	test3thread.c:137: Tail = 0; // Initialize tail index
	mov	_Tail,#0x00
;	test3thread.c:139: Cur_ID = ThreadCreate(Producer1); // Create producer thread
	mov	dptr,#_Producer1
	lcall	_ThreadCreate
	mov	_Cur_ID,dpl
;	test3thread.c:140: Cur_ID = ThreadCreate(Producer2);
	mov	dptr,#_Producer2
	lcall	_ThreadCreate
	mov	_Cur_ID,dpl
;	test3thread.c:145: __endasm;
	MOV	0x25, #48
	MOV	sp, 0x20
;	test3thread.c:146: Consumer();
;	test3thread.c:147: }
	ljmp	_Consumer
;------------------------------------------------------------
;Allocation info for local variables in function '_sdcc_gsinit_startup'
;------------------------------------------------------------
;	test3thread.c:149: void _sdcc_gsinit_startup(void) {
;	-----------------------------------------
;	 function _sdcc_gsinit_startup
;	-----------------------------------------
__sdcc_gsinit_startup:
;	test3thread.c:152: __endasm;
	ljmp	_Bootstrap
;	test3thread.c:153: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
;------------------------------------------------------------
;	test3thread.c:154: void _mcs51_genRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genRAMCLEAR
;	-----------------------------------------
__mcs51_genRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXINIT'
;------------------------------------------------------------
;	test3thread.c:155: void _mcs51_genXINIT(void) {}
;	-----------------------------------------
;	 function _mcs51_genXINIT
;	-----------------------------------------
__mcs51_genXINIT:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
;------------------------------------------------------------
;	test3thread.c:156: void _mcs51_genXRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genXRAMCLEAR
;	-----------------------------------------
__mcs51_genXRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0_ISR'
;------------------------------------------------------------
;	test3thread.c:158: void timer0_ISR(void) __interrupt(1) {
;	-----------------------------------------
;	 function timer0_ISR
;	-----------------------------------------
_timer0_ISR:
;	test3thread.c:161: __endasm;
	ljmp	_myTimer0Handler
;	test3thread.c:162: }
	reti
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop not_psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
