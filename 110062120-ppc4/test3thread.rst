                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.3.6 #14545 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module test3thread
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _SemaphoreCreate_PARM_2
                                     12 	.globl _timer0_ISR
                                     13 	.globl __mcs51_genXRAMCLEAR
                                     14 	.globl __mcs51_genXINIT
                                     15 	.globl __mcs51_genRAMCLEAR
                                     16 	.globl __sdcc_gsinit_startup
                                     17 	.globl _main
                                     18 	.globl _Consumer
                                     19 	.globl _Producer2
                                     20 	.globl _Producer1
                                     21 	.globl _SemaphoreCreate
                                     22 	.globl _ThreadCreate
                                     23 	.globl _CY
                                     24 	.globl _AC
                                     25 	.globl _F0
                                     26 	.globl _RS1
                                     27 	.globl _RS0
                                     28 	.globl _OV
                                     29 	.globl _F1
                                     30 	.globl _P
                                     31 	.globl _PS
                                     32 	.globl _PT1
                                     33 	.globl _PX1
                                     34 	.globl _PT0
                                     35 	.globl _PX0
                                     36 	.globl _RD
                                     37 	.globl _WR
                                     38 	.globl _T1
                                     39 	.globl _T0
                                     40 	.globl _INT1
                                     41 	.globl _INT0
                                     42 	.globl _TXD
                                     43 	.globl _RXD
                                     44 	.globl _P3_7
                                     45 	.globl _P3_6
                                     46 	.globl _P3_5
                                     47 	.globl _P3_4
                                     48 	.globl _P3_3
                                     49 	.globl _P3_2
                                     50 	.globl _P3_1
                                     51 	.globl _P3_0
                                     52 	.globl _EA
                                     53 	.globl _ES
                                     54 	.globl _ET1
                                     55 	.globl _EX1
                                     56 	.globl _ET0
                                     57 	.globl _EX0
                                     58 	.globl _P2_7
                                     59 	.globl _P2_6
                                     60 	.globl _P2_5
                                     61 	.globl _P2_4
                                     62 	.globl _P2_3
                                     63 	.globl _P2_2
                                     64 	.globl _P2_1
                                     65 	.globl _P2_0
                                     66 	.globl _SM0
                                     67 	.globl _SM1
                                     68 	.globl _SM2
                                     69 	.globl _REN
                                     70 	.globl _TB8
                                     71 	.globl _RB8
                                     72 	.globl _TI
                                     73 	.globl _RI
                                     74 	.globl _P1_7
                                     75 	.globl _P1_6
                                     76 	.globl _P1_5
                                     77 	.globl _P1_4
                                     78 	.globl _P1_3
                                     79 	.globl _P1_2
                                     80 	.globl _P1_1
                                     81 	.globl _P1_0
                                     82 	.globl _TF1
                                     83 	.globl _TR1
                                     84 	.globl _TF0
                                     85 	.globl _TR0
                                     86 	.globl _IE1
                                     87 	.globl _IT1
                                     88 	.globl _IE0
                                     89 	.globl _IT0
                                     90 	.globl _P0_7
                                     91 	.globl _P0_6
                                     92 	.globl _P0_5
                                     93 	.globl _P0_4
                                     94 	.globl _P0_3
                                     95 	.globl _P0_2
                                     96 	.globl _P0_1
                                     97 	.globl _P0_0
                                     98 	.globl _B
                                     99 	.globl _ACC
                                    100 	.globl _PSW
                                    101 	.globl _IP
                                    102 	.globl _P3
                                    103 	.globl _IE
                                    104 	.globl _P2
                                    105 	.globl _SBUF
                                    106 	.globl _SCON
                                    107 	.globl _P1
                                    108 	.globl _TH1
                                    109 	.globl _TH0
                                    110 	.globl _TL1
                                    111 	.globl _TL0
                                    112 	.globl _TMOD
                                    113 	.globl _TCON
                                    114 	.globl _PCON
                                    115 	.globl _DPH
                                    116 	.globl _DPL
                                    117 	.globl _SP
                                    118 	.globl _P0
                                    119 	.globl _Buffer
                                    120 	.globl _Tail
                                    121 	.globl _Head
                                    122 	.globl _Word2
                                    123 	.globl _Word1
                                    124 	.globl _Empty
                                    125 	.globl _Full
                                    126 	.globl _Mutex
                                    127 	.globl _Cur_ID
                                    128 ;--------------------------------------------------------
                                    129 ; special function registers
                                    130 ;--------------------------------------------------------
                                    131 	.area RSEG    (ABS,DATA)
      000000                        132 	.org 0x0000
                           000080   133 _P0	=	0x0080
                           000081   134 _SP	=	0x0081
                           000082   135 _DPL	=	0x0082
                           000083   136 _DPH	=	0x0083
                           000087   137 _PCON	=	0x0087
                           000088   138 _TCON	=	0x0088
                           000089   139 _TMOD	=	0x0089
                           00008A   140 _TL0	=	0x008a
                           00008B   141 _TL1	=	0x008b
                           00008C   142 _TH0	=	0x008c
                           00008D   143 _TH1	=	0x008d
                           000090   144 _P1	=	0x0090
                           000098   145 _SCON	=	0x0098
                           000099   146 _SBUF	=	0x0099
                           0000A0   147 _P2	=	0x00a0
                           0000A8   148 _IE	=	0x00a8
                           0000B0   149 _P3	=	0x00b0
                           0000B8   150 _IP	=	0x00b8
                           0000D0   151 _PSW	=	0x00d0
                           0000E0   152 _ACC	=	0x00e0
                           0000F0   153 _B	=	0x00f0
                                    154 ;--------------------------------------------------------
                                    155 ; special function bits
                                    156 ;--------------------------------------------------------
                                    157 	.area RSEG    (ABS,DATA)
      000000                        158 	.org 0x0000
                           000080   159 _P0_0	=	0x0080
                           000081   160 _P0_1	=	0x0081
                           000082   161 _P0_2	=	0x0082
                           000083   162 _P0_3	=	0x0083
                           000084   163 _P0_4	=	0x0084
                           000085   164 _P0_5	=	0x0085
                           000086   165 _P0_6	=	0x0086
                           000087   166 _P0_7	=	0x0087
                           000088   167 _IT0	=	0x0088
                           000089   168 _IE0	=	0x0089
                           00008A   169 _IT1	=	0x008a
                           00008B   170 _IE1	=	0x008b
                           00008C   171 _TR0	=	0x008c
                           00008D   172 _TF0	=	0x008d
                           00008E   173 _TR1	=	0x008e
                           00008F   174 _TF1	=	0x008f
                           000090   175 _P1_0	=	0x0090
                           000091   176 _P1_1	=	0x0091
                           000092   177 _P1_2	=	0x0092
                           000093   178 _P1_3	=	0x0093
                           000094   179 _P1_4	=	0x0094
                           000095   180 _P1_5	=	0x0095
                           000096   181 _P1_6	=	0x0096
                           000097   182 _P1_7	=	0x0097
                           000098   183 _RI	=	0x0098
                           000099   184 _TI	=	0x0099
                           00009A   185 _RB8	=	0x009a
                           00009B   186 _TB8	=	0x009b
                           00009C   187 _REN	=	0x009c
                           00009D   188 _SM2	=	0x009d
                           00009E   189 _SM1	=	0x009e
                           00009F   190 _SM0	=	0x009f
                           0000A0   191 _P2_0	=	0x00a0
                           0000A1   192 _P2_1	=	0x00a1
                           0000A2   193 _P2_2	=	0x00a2
                           0000A3   194 _P2_3	=	0x00a3
                           0000A4   195 _P2_4	=	0x00a4
                           0000A5   196 _P2_5	=	0x00a5
                           0000A6   197 _P2_6	=	0x00a6
                           0000A7   198 _P2_7	=	0x00a7
                           0000A8   199 _EX0	=	0x00a8
                           0000A9   200 _ET0	=	0x00a9
                           0000AA   201 _EX1	=	0x00aa
                           0000AB   202 _ET1	=	0x00ab
                           0000AC   203 _ES	=	0x00ac
                           0000AF   204 _EA	=	0x00af
                           0000B0   205 _P3_0	=	0x00b0
                           0000B1   206 _P3_1	=	0x00b1
                           0000B2   207 _P3_2	=	0x00b2
                           0000B3   208 _P3_3	=	0x00b3
                           0000B4   209 _P3_4	=	0x00b4
                           0000B5   210 _P3_5	=	0x00b5
                           0000B6   211 _P3_6	=	0x00b6
                           0000B7   212 _P3_7	=	0x00b7
                           0000B0   213 _RXD	=	0x00b0
                           0000B1   214 _TXD	=	0x00b1
                           0000B2   215 _INT0	=	0x00b2
                           0000B3   216 _INT1	=	0x00b3
                           0000B4   217 _T0	=	0x00b4
                           0000B5   218 _T1	=	0x00b5
                           0000B6   219 _WR	=	0x00b6
                           0000B7   220 _RD	=	0x00b7
                           0000B8   221 _PX0	=	0x00b8
                           0000B9   222 _PT0	=	0x00b9
                           0000BA   223 _PX1	=	0x00ba
                           0000BB   224 _PT1	=	0x00bb
                           0000BC   225 _PS	=	0x00bc
                           0000D0   226 _P	=	0x00d0
                           0000D1   227 _F1	=	0x00d1
                           0000D2   228 _OV	=	0x00d2
                           0000D3   229 _RS0	=	0x00d3
                           0000D4   230 _RS1	=	0x00d4
                           0000D5   231 _F0	=	0x00d5
                           0000D6   232 _AC	=	0x00d6
                           0000D7   233 _CY	=	0x00d7
                                    234 ;--------------------------------------------------------
                                    235 ; overlayable register banks
                                    236 ;--------------------------------------------------------
                                    237 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        238 	.ds 8
                                    239 ;--------------------------------------------------------
                                    240 ; internal ram data
                                    241 ;--------------------------------------------------------
                                    242 	.area DSEG    (DATA)
                           000025   243 _Cur_ID	=	0x0025
                           000036   244 _Mutex	=	0x0036
                           000037   245 _Full	=	0x0037
                           000038   246 _Empty	=	0x0038
                           000039   247 _Word1	=	0x0039
                           00003A   248 _Word2	=	0x003a
                           00003B   249 _Head	=	0x003b
                           00003C   250 _Tail	=	0x003c
                                    251 ;--------------------------------------------------------
                                    252 ; overlayable items in internal ram
                                    253 ;--------------------------------------------------------
                                    254 	.area	OSEG    (OVR,DATA)
      000008                        255 _SemaphoreCreate_PARM_2:
      000008                        256 	.ds 1
                                    257 ;--------------------------------------------------------
                                    258 ; Stack segment in internal ram
                                    259 ;--------------------------------------------------------
                                    260 	.area SSEG
      000040                        261 __start__stack:
      000040                        262 	.ds	1
                                    263 
                                    264 ;--------------------------------------------------------
                                    265 ; indirectly addressable internal ram data
                                    266 ;--------------------------------------------------------
                                    267 	.area ISEG    (DATA)
                                    268 ;--------------------------------------------------------
                                    269 ; absolute internal ram data
                                    270 ;--------------------------------------------------------
                                    271 	.area IABS    (ABS,DATA)
      00003D                        272 	.org 0x003D
      00003D                        273 _Buffer::
      00003D                        274 	.ds 3
                                    275 	.area IABS    (ABS,DATA)
                                    276 ;--------------------------------------------------------
                                    277 ; bit data
                                    278 ;--------------------------------------------------------
                                    279 	.area BSEG    (BIT)
      000000                        280 _SemaphoreCreate_sloc0_1_0:
      000000                        281 	.ds 1
                                    282 ;--------------------------------------------------------
                                    283 ; paged external ram data
                                    284 ;--------------------------------------------------------
                                    285 	.area PSEG    (PAG,XDATA)
                                    286 ;--------------------------------------------------------
                                    287 ; uninitialized external ram data
                                    288 ;--------------------------------------------------------
                                    289 	.area XSEG    (XDATA)
                                    290 ;--------------------------------------------------------
                                    291 ; absolute external ram data
                                    292 ;--------------------------------------------------------
                                    293 	.area XABS    (ABS,XDATA)
                                    294 ;--------------------------------------------------------
                                    295 ; initialized external ram data
                                    296 ;--------------------------------------------------------
                                    297 	.area XISEG   (XDATA)
                                    298 	.area HOME    (CODE)
                                    299 	.area GSINIT0 (CODE)
                                    300 	.area GSINIT1 (CODE)
                                    301 	.area GSINIT2 (CODE)
                                    302 	.area GSINIT3 (CODE)
                                    303 	.area GSINIT4 (CODE)
                                    304 	.area GSINIT5 (CODE)
                                    305 	.area GSINIT  (CODE)
                                    306 	.area GSFINAL (CODE)
                                    307 	.area CSEG    (CODE)
                                    308 ;--------------------------------------------------------
                                    309 ; interrupt vector
                                    310 ;--------------------------------------------------------
                                    311 	.area HOME    (CODE)
      000000                        312 __interrupt_vect:
      000000 02 01 2D         [24]  313 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  314 	reti
      000004                        315 	.ds	7
      00000B 02 01 34         [24]  316 	ljmp	_timer0_ISR
                                    317 ;--------------------------------------------------------
                                    318 ; global & static initialisations
                                    319 ;--------------------------------------------------------
                                    320 	.area HOME    (CODE)
                                    321 	.area GSINIT  (CODE)
                                    322 	.area GSFINAL (CODE)
                                    323 	.area GSINIT  (CODE)
                                    324 	.globl __sdcc_gsinit_startup
                                    325 	.globl __sdcc_program_startup
                                    326 	.globl __start__stack
                                    327 	.globl __mcs51_genXINIT
                                    328 	.globl __mcs51_genXRAMCLEAR
                                    329 	.globl __mcs51_genRAMCLEAR
                                    330 ;	test3thread.c:31: __data __at (0x3D) char Buffer[3] = {' ', ' ', ' '}; // Circular buffer
      000011 75 3D 20         [24]  331 	mov	_Buffer,#0x20
      000014 75 3E 20         [24]  332 	mov	(_Buffer + 0x0001),#0x20
      000017 75 3F 20         [24]  333 	mov	(_Buffer + 0x0002),#0x20
                                    334 	.area GSFINAL (CODE)
      00001A 02 00 0E         [24]  335 	ljmp	__sdcc_program_startup
                                    336 ;--------------------------------------------------------
                                    337 ; Home
                                    338 ;--------------------------------------------------------
                                    339 	.area HOME    (CODE)
                                    340 	.area HOME    (CODE)
      00000E                        341 __sdcc_program_startup:
      00000E 02 00 E8         [24]  342 	ljmp	_main
                                    343 ;	return from main will return to caller
                                    344 ;--------------------------------------------------------
                                    345 ; code
                                    346 ;--------------------------------------------------------
                                    347 	.area CSEG    (CODE)
                                    348 ;------------------------------------------------------------
                                    349 ;Allocation info for local variables in function 'SemaphoreCreate'
                                    350 ;------------------------------------------------------------
                                    351 ;n                         Allocated with name '_SemaphoreCreate_PARM_2'
                                    352 ;s                         Allocated to registers r5 r6 r7 
                                    353 ;------------------------------------------------------------
                                    354 ;	test3thread.c:5: void SemaphoreCreate(char *s, char n) {
                                    355 ;	-----------------------------------------
                                    356 ;	 function SemaphoreCreate
                                    357 ;	-----------------------------------------
      00001D                        358 _SemaphoreCreate:
                           000007   359 	ar7 = 0x07
                           000006   360 	ar6 = 0x06
                           000005   361 	ar5 = 0x05
                           000004   362 	ar4 = 0x04
                           000003   363 	ar3 = 0x03
                           000002   364 	ar2 = 0x02
                           000001   365 	ar1 = 0x01
                           000000   366 	ar0 = 0x00
      00001D AD 82            [24]  367 	mov	r5, dpl
      00001F AE 83            [24]  368 	mov	r6, dph
      000021 AF F0            [24]  369 	mov	r7, b
                                    370 ;	test3thread.c:8: }
      000023 D2 00            [12]  371 	setb	_SemaphoreCreate_sloc0_1_0
      000025 10 AF 02         [24]  372 	jbc	ea,00103$
      000028 C2 00            [12]  373 	clr	_SemaphoreCreate_sloc0_1_0
      00002A                        374 00103$:
                                    375 ;	test3thread.c:7: *s = n;
      00002A 8D 82            [24]  376 	mov	dpl,r5
      00002C 8E 83            [24]  377 	mov	dph,r6
      00002E 8F F0            [24]  378 	mov	b,r7
      000030 E5 08            [12]  379 	mov	a,_SemaphoreCreate_PARM_2
      000032 12 04 7B         [24]  380 	lcall	__gptrput
      000035 A2 00            [12]  381 	mov	c,_SemaphoreCreate_sloc0_1_0
      000037 92 AF            [24]  382 	mov	ea,c
                                    383 ;	test3thread.c:9: return;
                                    384 ;	test3thread.c:10: }
      000039 22               [24]  385 	ret
                                    386 ;------------------------------------------------------------
                                    387 ;Allocation info for local variables in function 'Producer1'
                                    388 ;------------------------------------------------------------
                                    389 ;	test3thread.c:39: void Producer1(void) {
                                    390 ;	-----------------------------------------
                                    391 ;	 function Producer1
                                    392 ;	-----------------------------------------
      00003A                        393 _Producer1:
                                    394 ;	test3thread.c:50: Word1 = 'A';
      00003A 75 39 41         [24]  395 	mov	_Word1,#0x41
                                    396 ;	test3thread.c:51: while (1) {
      00003D                        397 00107$:
                                    398 ;	test3thread.c:52: SemaphoreWait(Empty); // Wait until buffer has empty space
      00003D                        399 0$:
      00003D 85 38 E0         [24]  400 	MOV ACC, _Empty 
      000040 60 FB            [24]  401 	JZ 0$ 
      000042 15 38            [12]  402 	DEC _Empty 
                                    403 ;	test3thread.c:53: SemaphoreWait(Mutex); // Enter critical section
      000044                        404 1$:
      000044 85 36 E0         [24]  405 	MOV ACC, _Mutex 
      000047 60 FB            [24]  406 	JZ 1$ 
      000049 15 36            [12]  407 	DEC _Mutex 
                                    408 ;	test3thread.c:54: Buffer[Tail] = Word1; // Add new character to buffer
      00004B E5 3C            [12]  409 	mov	a,_Tail
      00004D 24 3D            [12]  410 	add	a, #_Buffer
      00004F F8               [12]  411 	mov	r0,a
      000050 A6 39            [24]  412 	mov	@r0,_Word1
                                    413 ;	test3thread.c:55: Tail++; // Update tail index
      000052 E5 3C            [12]  414 	mov	a,_Tail
      000054 04               [12]  415 	inc	a
      000055 F5 3C            [12]  416 	mov	_Tail,a
                                    417 ;	test3thread.c:56: if (Tail == 3) Tail = 0;
      000057 74 03            [12]  418 	mov	a,#0x03
      000059 B5 3C 03         [24]  419 	cjne	a,_Tail,00102$
      00005C 75 3C 00         [24]  420 	mov	_Tail,#0x00
      00005F                        421 00102$:
                                    422 ;	test3thread.c:57: if (Word1 == 'Z') Word1 = 'A'; // Update character
      00005F 74 5A            [12]  423 	mov	a,#0x5a
      000061 B5 39 05         [24]  424 	cjne	a,_Word1,00104$
      000064 75 39 41         [24]  425 	mov	_Word1,#0x41
      000067 80 05            [24]  426 	sjmp	00105$
      000069                        427 00104$:
                                    428 ;	test3thread.c:58: else Word1++;
      000069 E5 39            [12]  429 	mov	a,_Word1
      00006B 04               [12]  430 	inc	a
      00006C F5 39            [12]  431 	mov	_Word1,a
      00006E                        432 00105$:
                                    433 ;	test3thread.c:59: SemaphoreSignal(Mutex); // Leave critical section
      00006E 05 36            [12]  434 	INC _Mutex 
                                    435 ;	test3thread.c:60: SemaphoreSignal(Full); // Signal buffer is full
      000070 05 37            [12]  436 	INC _Full 
                                    437 ;	test3thread.c:62: }
      000072 80 C9            [24]  438 	sjmp	00107$
                                    439 ;------------------------------------------------------------
                                    440 ;Allocation info for local variables in function 'Producer2'
                                    441 ;------------------------------------------------------------
                                    442 ;	test3thread.c:64: void Producer2(void) {
                                    443 ;	-----------------------------------------
                                    444 ;	 function Producer2
                                    445 ;	-----------------------------------------
      000074                        446 _Producer2:
                                    447 ;	test3thread.c:75: Word2 = '0';
      000074 75 3A 30         [24]  448 	mov	_Word2,#0x30
                                    449 ;	test3thread.c:76: while (1) {
      000077                        450 00107$:
                                    451 ;	test3thread.c:77: SemaphoreWait(Empty); // Wait until buffer has empty space
      000077                        452 2$:
      000077 85 38 E0         [24]  453 	MOV ACC, _Empty 
      00007A 60 FB            [24]  454 	JZ 2$ 
      00007C 15 38            [12]  455 	DEC _Empty 
                                    456 ;	test3thread.c:78: SemaphoreWait(Mutex); // Enter critical section
      00007E                        457 3$:
      00007E 85 36 E0         [24]  458 	MOV ACC, _Mutex 
      000081 60 FB            [24]  459 	JZ 3$ 
      000083 15 36            [12]  460 	DEC _Mutex 
                                    461 ;	test3thread.c:79: Buffer[Tail] = Word2; // Add new character to buffer
      000085 E5 3C            [12]  462 	mov	a,_Tail
      000087 24 3D            [12]  463 	add	a, #_Buffer
      000089 F8               [12]  464 	mov	r0,a
      00008A A6 3A            [24]  465 	mov	@r0,_Word2
                                    466 ;	test3thread.c:80: Tail++; // Update tail index
      00008C E5 3C            [12]  467 	mov	a,_Tail
      00008E 04               [12]  468 	inc	a
      00008F F5 3C            [12]  469 	mov	_Tail,a
                                    470 ;	test3thread.c:81: if (Tail == 3) Tail = 0;
      000091 74 03            [12]  471 	mov	a,#0x03
      000093 B5 3C 03         [24]  472 	cjne	a,_Tail,00102$
      000096 75 3C 00         [24]  473 	mov	_Tail,#0x00
      000099                        474 00102$:
                                    475 ;	test3thread.c:82: if (Word2 == '9') Word2 = '0'; // Update character
      000099 74 39            [12]  476 	mov	a,#0x39
      00009B B5 3A 05         [24]  477 	cjne	a,_Word2,00104$
      00009E 75 3A 30         [24]  478 	mov	_Word2,#0x30
      0000A1 80 05            [24]  479 	sjmp	00105$
      0000A3                        480 00104$:
                                    481 ;	test3thread.c:83: else Word2++;
      0000A3 E5 3A            [12]  482 	mov	a,_Word2
      0000A5 04               [12]  483 	inc	a
      0000A6 F5 3A            [12]  484 	mov	_Word2,a
      0000A8                        485 00105$:
                                    486 ;	test3thread.c:84: SemaphoreSignal(Mutex); // Leave critical section
      0000A8 05 36            [12]  487 	INC _Mutex 
                                    488 ;	test3thread.c:85: SemaphoreSignal(Full); // Signal buffer is full
      0000AA 05 37            [12]  489 	INC _Full 
                                    490 ;	test3thread.c:87: }
      0000AC 80 C9            [24]  491 	sjmp	00107$
                                    492 ;------------------------------------------------------------
                                    493 ;Allocation info for local variables in function 'Consumer'
                                    494 ;------------------------------------------------------------
                                    495 ;	test3thread.c:94: void Consumer(void) {
                                    496 ;	-----------------------------------------
                                    497 ;	 function Consumer
                                    498 ;	-----------------------------------------
      0000AE                        499 _Consumer:
                                    500 ;	test3thread.c:103: TMOD |= 0x20;
      0000AE 43 89 20         [24]  501 	orl	_TMOD,#0x20
                                    502 ;	test3thread.c:104: TH1 = (char)-6;
      0000B1 75 8D FA         [24]  503 	mov	_TH1,#0xfa
                                    504 ;	test3thread.c:105: SCON = 0x50;
      0000B4 75 98 50         [24]  505 	mov	_SCON,#0x50
                                    506 ;	test3thread.c:106: TR1 = 1;
                                    507 ;	assignBit
      0000B7 D2 8E            [12]  508 	setb	_TR1
                                    509 ;	test3thread.c:107: TI = 1;
                                    510 ;	assignBit
      0000B9 D2 99            [12]  511 	setb	_TI
                                    512 ;	test3thread.c:108: while (1) {
      0000BB                        513 00107$:
                                    514 ;	test3thread.c:109: SemaphoreWait(Full); // Wait for data in buffer
      0000BB                        515 4$:
      0000BB 85 37 E0         [24]  516 	MOV ACC, _Full 
      0000BE 60 FB            [24]  517 	JZ 4$ 
      0000C0 15 37            [12]  518 	DEC _Full 
                                    519 ;	test3thread.c:110: SemaphoreWait(Mutex); // Enter critical section
      0000C2                        520 5$:
      0000C2 85 36 E0         [24]  521 	MOV ACC, _Mutex 
      0000C5 60 FB            [24]  522 	JZ 5$ 
      0000C7 15 36            [12]  523 	DEC _Mutex 
                                    524 ;	test3thread.c:111: while (!TI); // Wait for Tx to be ready
      0000C9                        525 00101$:
      0000C9 30 99 FD         [24]  526 	jnb	_TI,00101$
                                    527 ;	test3thread.c:112: SBUF = Buffer[Head]; // Send character from buffer
      0000CC E5 3B            [12]  528 	mov	a,_Head
      0000CE 24 3D            [12]  529 	add	a, #_Buffer
      0000D0 F9               [12]  530 	mov	r1,a
      0000D1 87 99            [24]  531 	mov	_SBUF,@r1
                                    532 ;	test3thread.c:113: TI = 0; // Clear Tx interrupt flag
                                    533 ;	assignBit
      0000D3 C2 99            [12]  534 	clr	_TI
                                    535 ;	test3thread.c:114: Head++;
      0000D5 E5 3B            [12]  536 	mov	a,_Head
      0000D7 04               [12]  537 	inc	a
      0000D8 F5 3B            [12]  538 	mov	_Head,a
                                    539 ;	test3thread.c:115: if (Head == 3) Head = 0; // Circular increment of head;
      0000DA 74 03            [12]  540 	mov	a,#0x03
      0000DC B5 3B 03         [24]  541 	cjne	a,_Head,00105$
      0000DF 75 3B 00         [24]  542 	mov	_Head,#0x00
      0000E2                        543 00105$:
                                    544 ;	test3thread.c:116: SemaphoreSignal(Mutex); // Exit critical section
      0000E2 05 36            [12]  545 	INC _Mutex 
                                    546 ;	test3thread.c:117: SemaphoreSignal(Empty); // Signal buffer is empty
      0000E4 05 38            [12]  547 	INC _Empty 
                                    548 ;	test3thread.c:119: }
      0000E6 80 D3            [24]  549 	sjmp	00107$
                                    550 ;------------------------------------------------------------
                                    551 ;Allocation info for local variables in function 'main'
                                    552 ;------------------------------------------------------------
                                    553 ;	test3thread.c:126: void main(void) {
                                    554 ;	-----------------------------------------
                                    555 ;	 function main
                                    556 ;	-----------------------------------------
      0000E8                        557 _main:
                                    558 ;	test3thread.c:133: SemaphoreCreate(&Mutex, 1); // Create mutex semaphore
      0000E8 75 08 01         [24]  559 	mov	_SemaphoreCreate_PARM_2,#0x01
      0000EB 90 00 36         [24]  560 	mov	dptr,#_Mutex
      0000EE 75 F0 40         [24]  561 	mov	b, #0x40
      0000F1 12 00 1D         [24]  562 	lcall	_SemaphoreCreate
                                    563 ;	test3thread.c:134: SemaphoreCreate(&Full, 0); // Create full semaphore
      0000F4 75 08 00         [24]  564 	mov	_SemaphoreCreate_PARM_2,#0x00
      0000F7 90 00 37         [24]  565 	mov	dptr,#_Full
      0000FA 75 F0 40         [24]  566 	mov	b, #0x40
      0000FD 12 00 1D         [24]  567 	lcall	_SemaphoreCreate
                                    568 ;	test3thread.c:135: SemaphoreCreate(&Empty, 3); // Create empty semaphore
      000100 75 08 03         [24]  569 	mov	_SemaphoreCreate_PARM_2,#0x03
      000103 90 00 38         [24]  570 	mov	dptr,#_Empty
      000106 75 F0 40         [24]  571 	mov	b, #0x40
      000109 12 00 1D         [24]  572 	lcall	_SemaphoreCreate
                                    573 ;	test3thread.c:136: Head = 0; // Initialize head index
      00010C 75 3B 00         [24]  574 	mov	_Head,#0x00
                                    575 ;	test3thread.c:137: Tail = 0; // Initialize tail index
      00010F 75 3C 00         [24]  576 	mov	_Tail,#0x00
                                    577 ;	test3thread.c:139: Cur_ID = ThreadCreate(Producer1); // Create producer thread
      000112 90 00 3A         [24]  578 	mov	dptr,#_Producer1
      000115 12 02 17         [24]  579 	lcall	_ThreadCreate
      000118 85 82 25         [24]  580 	mov	_Cur_ID,dpl
                                    581 ;	test3thread.c:140: Cur_ID = ThreadCreate(Producer2);
      00011B 90 00 74         [24]  582 	mov	dptr,#_Producer2
      00011E 12 02 17         [24]  583 	lcall	_ThreadCreate
      000121 85 82 25         [24]  584 	mov	_Cur_ID,dpl
                                    585 ;	test3thread.c:145: __endasm;
      000124 75 25 30         [24]  586 	MOV	0x25, #48
      000127 85 20 81         [24]  587 	MOV	sp, 0x20
                                    588 ;	test3thread.c:146: Consumer();
                                    589 ;	test3thread.c:147: }
      00012A 02 00 AE         [24]  590 	ljmp	_Consumer
                                    591 ;------------------------------------------------------------
                                    592 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    593 ;------------------------------------------------------------
                                    594 ;	test3thread.c:149: void _sdcc_gsinit_startup(void) {
                                    595 ;	-----------------------------------------
                                    596 ;	 function _sdcc_gsinit_startup
                                    597 ;	-----------------------------------------
      00012D                        598 __sdcc_gsinit_startup:
                                    599 ;	test3thread.c:152: __endasm;
      00012D 02 01 38         [24]  600 	ljmp	_Bootstrap
                                    601 ;	test3thread.c:153: }
      000130 22               [24]  602 	ret
                                    603 ;------------------------------------------------------------
                                    604 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    605 ;------------------------------------------------------------
                                    606 ;	test3thread.c:154: void _mcs51_genRAMCLEAR(void) {}
                                    607 ;	-----------------------------------------
                                    608 ;	 function _mcs51_genRAMCLEAR
                                    609 ;	-----------------------------------------
      000131                        610 __mcs51_genRAMCLEAR:
      000131 22               [24]  611 	ret
                                    612 ;------------------------------------------------------------
                                    613 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    614 ;------------------------------------------------------------
                                    615 ;	test3thread.c:155: void _mcs51_genXINIT(void) {}
                                    616 ;	-----------------------------------------
                                    617 ;	 function _mcs51_genXINIT
                                    618 ;	-----------------------------------------
      000132                        619 __mcs51_genXINIT:
      000132 22               [24]  620 	ret
                                    621 ;------------------------------------------------------------
                                    622 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    623 ;------------------------------------------------------------
                                    624 ;	test3thread.c:156: void _mcs51_genXRAMCLEAR(void) {}
                                    625 ;	-----------------------------------------
                                    626 ;	 function _mcs51_genXRAMCLEAR
                                    627 ;	-----------------------------------------
      000133                        628 __mcs51_genXRAMCLEAR:
      000133 22               [24]  629 	ret
                                    630 ;------------------------------------------------------------
                                    631 ;Allocation info for local variables in function 'timer0_ISR'
                                    632 ;------------------------------------------------------------
                                    633 ;	test3thread.c:158: void timer0_ISR(void) __interrupt(1) {
                                    634 ;	-----------------------------------------
                                    635 ;	 function timer0_ISR
                                    636 ;	-----------------------------------------
      000134                        637 _timer0_ISR:
                                    638 ;	test3thread.c:161: __endasm;
      000134 02 01 95         [24]  639 	ljmp	_myTimer0Handler
                                    640 ;	test3thread.c:162: }
      000137 32               [24]  641 	reti
                                    642 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    643 ;	eliminated unneeded push/pop not_psw
                                    644 ;	eliminated unneeded push/pop dpl
                                    645 ;	eliminated unneeded push/pop dph
                                    646 ;	eliminated unneeded push/pop b
                                    647 ;	eliminated unneeded push/pop acc
                                    648 	.area CSEG    (CODE)
                                    649 	.area CONST   (CODE)
                                    650 	.area XINIT   (CODE)
                                    651 	.area CABS    (ABS,CODE)
