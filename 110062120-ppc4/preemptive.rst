                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.3.6 #14545 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module preemptive
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _myTimer0Handler
                                     12 	.globl _Bootstrap
                                     13 	.globl _main
                                     14 	.globl _CY
                                     15 	.globl _AC
                                     16 	.globl _F0
                                     17 	.globl _RS1
                                     18 	.globl _RS0
                                     19 	.globl _OV
                                     20 	.globl _F1
                                     21 	.globl _P
                                     22 	.globl _PS
                                     23 	.globl _PT1
                                     24 	.globl _PX1
                                     25 	.globl _PT0
                                     26 	.globl _PX0
                                     27 	.globl _RD
                                     28 	.globl _WR
                                     29 	.globl _T1
                                     30 	.globl _T0
                                     31 	.globl _INT1
                                     32 	.globl _INT0
                                     33 	.globl _TXD
                                     34 	.globl _RXD
                                     35 	.globl _P3_7
                                     36 	.globl _P3_6
                                     37 	.globl _P3_5
                                     38 	.globl _P3_4
                                     39 	.globl _P3_3
                                     40 	.globl _P3_2
                                     41 	.globl _P3_1
                                     42 	.globl _P3_0
                                     43 	.globl _EA
                                     44 	.globl _ES
                                     45 	.globl _ET1
                                     46 	.globl _EX1
                                     47 	.globl _ET0
                                     48 	.globl _EX0
                                     49 	.globl _P2_7
                                     50 	.globl _P2_6
                                     51 	.globl _P2_5
                                     52 	.globl _P2_4
                                     53 	.globl _P2_3
                                     54 	.globl _P2_2
                                     55 	.globl _P2_1
                                     56 	.globl _P2_0
                                     57 	.globl _SM0
                                     58 	.globl _SM1
                                     59 	.globl _SM2
                                     60 	.globl _REN
                                     61 	.globl _TB8
                                     62 	.globl _RB8
                                     63 	.globl _TI
                                     64 	.globl _RI
                                     65 	.globl _P1_7
                                     66 	.globl _P1_6
                                     67 	.globl _P1_5
                                     68 	.globl _P1_4
                                     69 	.globl _P1_3
                                     70 	.globl _P1_2
                                     71 	.globl _P1_1
                                     72 	.globl _P1_0
                                     73 	.globl _TF1
                                     74 	.globl _TR1
                                     75 	.globl _TF0
                                     76 	.globl _TR0
                                     77 	.globl _IE1
                                     78 	.globl _IT1
                                     79 	.globl _IE0
                                     80 	.globl _IT0
                                     81 	.globl _P0_7
                                     82 	.globl _P0_6
                                     83 	.globl _P0_5
                                     84 	.globl _P0_4
                                     85 	.globl _P0_3
                                     86 	.globl _P0_2
                                     87 	.globl _P0_1
                                     88 	.globl _P0_0
                                     89 	.globl _B
                                     90 	.globl _ACC
                                     91 	.globl _PSW
                                     92 	.globl _IP
                                     93 	.globl _P3
                                     94 	.globl _IE
                                     95 	.globl _P2
                                     96 	.globl _SBUF
                                     97 	.globl _SCON
                                     98 	.globl _P1
                                     99 	.globl _TH1
                                    100 	.globl _TH0
                                    101 	.globl _TL1
                                    102 	.globl _TL0
                                    103 	.globl _TMOD
                                    104 	.globl _TCON
                                    105 	.globl _PCON
                                    106 	.globl _DPH
                                    107 	.globl _DPL
                                    108 	.globl _SP
                                    109 	.globl _P0
                                    110 	.globl _Next_ID
                                    111 	.globl _New_ID
                                    112 	.globl _SP_new
                                    113 	.globl _SP_old
                                    114 	.globl _Cur_ID
                                    115 	.globl _Map
                                    116 	.globl _SP3
                                    117 	.globl _SP2
                                    118 	.globl _SP1
                                    119 	.globl _SP0
                                    120 	.globl _ThreadCreate
                                    121 	.globl _ThreadYield
                                    122 	.globl _ThreadExit
                                    123 ;--------------------------------------------------------
                                    124 ; special function registers
                                    125 ;--------------------------------------------------------
                                    126 	.area RSEG    (ABS,DATA)
      000000                        127 	.org 0x0000
                           000080   128 _P0	=	0x0080
                           000081   129 _SP	=	0x0081
                           000082   130 _DPL	=	0x0082
                           000083   131 _DPH	=	0x0083
                           000087   132 _PCON	=	0x0087
                           000088   133 _TCON	=	0x0088
                           000089   134 _TMOD	=	0x0089
                           00008A   135 _TL0	=	0x008a
                           00008B   136 _TL1	=	0x008b
                           00008C   137 _TH0	=	0x008c
                           00008D   138 _TH1	=	0x008d
                           000090   139 _P1	=	0x0090
                           000098   140 _SCON	=	0x0098
                           000099   141 _SBUF	=	0x0099
                           0000A0   142 _P2	=	0x00a0
                           0000A8   143 _IE	=	0x00a8
                           0000B0   144 _P3	=	0x00b0
                           0000B8   145 _IP	=	0x00b8
                           0000D0   146 _PSW	=	0x00d0
                           0000E0   147 _ACC	=	0x00e0
                           0000F0   148 _B	=	0x00f0
                                    149 ;--------------------------------------------------------
                                    150 ; special function bits
                                    151 ;--------------------------------------------------------
                                    152 	.area RSEG    (ABS,DATA)
      000000                        153 	.org 0x0000
                           000080   154 _P0_0	=	0x0080
                           000081   155 _P0_1	=	0x0081
                           000082   156 _P0_2	=	0x0082
                           000083   157 _P0_3	=	0x0083
                           000084   158 _P0_4	=	0x0084
                           000085   159 _P0_5	=	0x0085
                           000086   160 _P0_6	=	0x0086
                           000087   161 _P0_7	=	0x0087
                           000088   162 _IT0	=	0x0088
                           000089   163 _IE0	=	0x0089
                           00008A   164 _IT1	=	0x008a
                           00008B   165 _IE1	=	0x008b
                           00008C   166 _TR0	=	0x008c
                           00008D   167 _TF0	=	0x008d
                           00008E   168 _TR1	=	0x008e
                           00008F   169 _TF1	=	0x008f
                           000090   170 _P1_0	=	0x0090
                           000091   171 _P1_1	=	0x0091
                           000092   172 _P1_2	=	0x0092
                           000093   173 _P1_3	=	0x0093
                           000094   174 _P1_4	=	0x0094
                           000095   175 _P1_5	=	0x0095
                           000096   176 _P1_6	=	0x0096
                           000097   177 _P1_7	=	0x0097
                           000098   178 _RI	=	0x0098
                           000099   179 _TI	=	0x0099
                           00009A   180 _RB8	=	0x009a
                           00009B   181 _TB8	=	0x009b
                           00009C   182 _REN	=	0x009c
                           00009D   183 _SM2	=	0x009d
                           00009E   184 _SM1	=	0x009e
                           00009F   185 _SM0	=	0x009f
                           0000A0   186 _P2_0	=	0x00a0
                           0000A1   187 _P2_1	=	0x00a1
                           0000A2   188 _P2_2	=	0x00a2
                           0000A3   189 _P2_3	=	0x00a3
                           0000A4   190 _P2_4	=	0x00a4
                           0000A5   191 _P2_5	=	0x00a5
                           0000A6   192 _P2_6	=	0x00a6
                           0000A7   193 _P2_7	=	0x00a7
                           0000A8   194 _EX0	=	0x00a8
                           0000A9   195 _ET0	=	0x00a9
                           0000AA   196 _EX1	=	0x00aa
                           0000AB   197 _ET1	=	0x00ab
                           0000AC   198 _ES	=	0x00ac
                           0000AF   199 _EA	=	0x00af
                           0000B0   200 _P3_0	=	0x00b0
                           0000B1   201 _P3_1	=	0x00b1
                           0000B2   202 _P3_2	=	0x00b2
                           0000B3   203 _P3_3	=	0x00b3
                           0000B4   204 _P3_4	=	0x00b4
                           0000B5   205 _P3_5	=	0x00b5
                           0000B6   206 _P3_6	=	0x00b6
                           0000B7   207 _P3_7	=	0x00b7
                           0000B0   208 _RXD	=	0x00b0
                           0000B1   209 _TXD	=	0x00b1
                           0000B2   210 _INT0	=	0x00b2
                           0000B3   211 _INT1	=	0x00b3
                           0000B4   212 _T0	=	0x00b4
                           0000B5   213 _T1	=	0x00b5
                           0000B6   214 _WR	=	0x00b6
                           0000B7   215 _RD	=	0x00b7
                           0000B8   216 _PX0	=	0x00b8
                           0000B9   217 _PT0	=	0x00b9
                           0000BA   218 _PX1	=	0x00ba
                           0000BB   219 _PT1	=	0x00bb
                           0000BC   220 _PS	=	0x00bc
                           0000D0   221 _P	=	0x00d0
                           0000D1   222 _F1	=	0x00d1
                           0000D2   223 _OV	=	0x00d2
                           0000D3   224 _RS0	=	0x00d3
                           0000D4   225 _RS1	=	0x00d4
                           0000D5   226 _F0	=	0x00d5
                           0000D6   227 _AC	=	0x00d6
                           0000D7   228 _CY	=	0x00d7
                                    229 ;--------------------------------------------------------
                                    230 ; overlayable register banks
                                    231 ;--------------------------------------------------------
                                    232 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        233 	.ds 8
                                    234 ;--------------------------------------------------------
                                    235 ; internal ram data
                                    236 ;--------------------------------------------------------
                                    237 	.area DSEG    (DATA)
                           000020   238 _SP0	=	0x0020
                           000021   239 _SP1	=	0x0021
                           000022   240 _SP2	=	0x0022
                           000023   241 _SP3	=	0x0023
                           000024   242 _Map	=	0x0024
                           000025   243 _Cur_ID	=	0x0025
                           000030   244 _SP_old	=	0x0030
                           000031   245 _SP_new	=	0x0031
                           000032   246 _New_ID	=	0x0032
                           000033   247 _Next_ID	=	0x0033
                                    248 ;--------------------------------------------------------
                                    249 ; overlayable items in internal ram
                                    250 ;--------------------------------------------------------
                                    251 	.area	OSEG    (OVR,DATA)
                                    252 ;--------------------------------------------------------
                                    253 ; indirectly addressable internal ram data
                                    254 ;--------------------------------------------------------
                                    255 	.area ISEG    (DATA)
                                    256 ;--------------------------------------------------------
                                    257 ; absolute internal ram data
                                    258 ;--------------------------------------------------------
                                    259 	.area IABS    (ABS,DATA)
                                    260 	.area IABS    (ABS,DATA)
                                    261 ;--------------------------------------------------------
                                    262 ; bit data
                                    263 ;--------------------------------------------------------
                                    264 	.area BSEG    (BIT)
                                    265 ;--------------------------------------------------------
                                    266 ; paged external ram data
                                    267 ;--------------------------------------------------------
                                    268 	.area PSEG    (PAG,XDATA)
                                    269 ;--------------------------------------------------------
                                    270 ; uninitialized external ram data
                                    271 ;--------------------------------------------------------
                                    272 	.area XSEG    (XDATA)
                                    273 ;--------------------------------------------------------
                                    274 ; absolute external ram data
                                    275 ;--------------------------------------------------------
                                    276 	.area XABS    (ABS,XDATA)
                                    277 ;--------------------------------------------------------
                                    278 ; initialized external ram data
                                    279 ;--------------------------------------------------------
                                    280 	.area XISEG   (XDATA)
                                    281 	.area HOME    (CODE)
                                    282 	.area GSINIT0 (CODE)
                                    283 	.area GSINIT1 (CODE)
                                    284 	.area GSINIT2 (CODE)
                                    285 	.area GSINIT3 (CODE)
                                    286 	.area GSINIT4 (CODE)
                                    287 	.area GSINIT5 (CODE)
                                    288 	.area GSINIT  (CODE)
                                    289 	.area GSFINAL (CODE)
                                    290 	.area CSEG    (CODE)
                                    291 ;--------------------------------------------------------
                                    292 ; global & static initialisations
                                    293 ;--------------------------------------------------------
                                    294 	.area HOME    (CODE)
                                    295 	.area GSINIT  (CODE)
                                    296 	.area GSFINAL (CODE)
                                    297 	.area GSINIT  (CODE)
                                    298 ;--------------------------------------------------------
                                    299 ; Home
                                    300 ;--------------------------------------------------------
                                    301 	.area HOME    (CODE)
                                    302 	.area HOME    (CODE)
                                    303 ;--------------------------------------------------------
                                    304 ; code
                                    305 ;--------------------------------------------------------
                                    306 	.area CSEG    (CODE)
                                    307 ;------------------------------------------------------------
                                    308 ;Allocation info for local variables in function 'Bootstrap'
                                    309 ;------------------------------------------------------------
                                    310 ;	preemptive.c:116: void Bootstrap(void) {
                                    311 ;	-----------------------------------------
                                    312 ;	 function Bootstrap
                                    313 ;	-----------------------------------------
      000138                        314 _Bootstrap:
                           000007   315 	ar7 = 0x07
                           000006   316 	ar6 = 0x06
                           000005   317 	ar5 = 0x05
                           000004   318 	ar4 = 0x04
                           000003   319 	ar3 = 0x03
                           000002   320 	ar2 = 0x02
                           000001   321 	ar1 = 0x01
                           000000   322 	ar0 = 0x00
                                    323 ;	preemptive.c:130: Map = 0x00; // Clear thread bitmap indicating no threads are running
      000138 E4               [12]  324 	clr	a
      000139 F5 24            [12]  325 	mov	_Map,a
      00013B F5 25            [12]  326 	mov	(_Map + 1),a
                                    327 ;	preemptive.c:131: SP0 = 0x3F; // Initialize stack pointer
      00013D 75 20 3F         [24]  328 	mov	_SP0,#0x3f
      000140 F5 21            [12]  329 	mov	(_SP0 + 1),a
                                    330 ;	preemptive.c:132: SP1 = 0x4F;
      000142 75 21 4F         [24]  331 	mov	_SP1,#0x4f
      000145 F5 22            [12]  332 	mov	(_SP1 + 1),a
                                    333 ;	preemptive.c:133: SP2 = 0x5F;
      000147 75 22 5F         [24]  334 	mov	_SP2,#0x5f
      00014A F5 23            [12]  335 	mov	(_SP2 + 1),a
                                    336 ;	preemptive.c:134: SP3 = 0x6F;
      00014C 75 23 6F         [24]  337 	mov	_SP3,#0x6f
      00014F F5 24            [12]  338 	mov	(_SP3 + 1),a
                                    339 ;	preemptive.c:137: TMOD = 0;  // timer 0 mode 0
      000151 F5 89            [12]  340 	mov	_TMOD,a
                                    341 ;	preemptive.c:138: IE = 0x82;  // enable timer 0 interrupt; keep consumer polling
      000153 75 A8 82         [24]  342 	mov	_IE,#0x82
                                    343 ;	preemptive.c:140: TR0 = 1; // set bit TR0 to start running timer 0
                                    344 ;	assignBit
      000156 D2 8C            [12]  345 	setb	_TR0
                                    346 ;	preemptive.c:144: Next_ID = '1';
      000158 75 33 31         [24]  347 	mov	_Next_ID,#0x31
                                    348 ;	preemptive.c:146: Cur_ID = ThreadCreate(main);
      00015B 90 00 E8         [24]  349 	mov	dptr,#_main
      00015E 12 02 17         [24]  350 	lcall	_ThreadCreate
      000161 85 82 25         [24]  351 	mov	_Cur_ID,dpl
                                    352 ;	preemptive.c:147: RESTORESTATE; //restore the state of new create main thread
      000164 74 30            [12]  353 	mov	a,#0x30
      000166 B5 25 05         [24]  354 	cjne	a,_Cur_ID,00110$
      000169 85 20 81         [24]  355 	MOV SP, 0x20 
      00016C 80 1C            [24]  356 	sjmp	00111$
      00016E                        357 00110$:
      00016E 74 31            [12]  358 	mov	a,#0x31
      000170 B5 25 05         [24]  359 	cjne	a,_Cur_ID,00107$
      000173 85 21 81         [24]  360 	MOV SP, 0x21 
      000176 80 12            [24]  361 	sjmp	00111$
      000178                        362 00107$:
      000178 74 32            [12]  363 	mov	a,#0x32
      00017A B5 25 05         [24]  364 	cjne	a,_Cur_ID,00104$
      00017D 85 22 81         [24]  365 	MOV SP, 0x22 
      000180 80 08            [24]  366 	sjmp	00111$
      000182                        367 00104$:
      000182 74 33            [12]  368 	mov	a,#0x33
      000184 B5 25 03         [24]  369 	cjne	a,_Cur_ID,00111$
      000187 85 23 81         [24]  370 	MOV SP, 0x23 
      00018A                        371 00111$:
      00018A D0 D0            [24]  372 	POP PSW 
      00018C D0 83            [24]  373 	POP DPH 
      00018E D0 82            [24]  374 	POP DPL 
      000190 D0 F0            [24]  375 	POP B 
      000192 D0 E0            [24]  376 	POP ACC 
                                    377 ;	preemptive.c:148: }
      000194 22               [24]  378 	ret
                                    379 ;------------------------------------------------------------
                                    380 ;Allocation info for local variables in function 'myTimer0Handler'
                                    381 ;------------------------------------------------------------
                                    382 ;	preemptive.c:151: void myTimer0Handler(void) {
                                    383 ;	-----------------------------------------
                                    384 ;	 function myTimer0Handler
                                    385 ;	-----------------------------------------
      000195                        386 _myTimer0Handler:
                                    387 ;	preemptive.c:152: EA = 0; // Disable interrupts
                                    388 ;	assignBit
      000195 C2 AF            [12]  389 	clr	_EA
                                    390 ;	preemptive.c:153: SAVESTATE; // Save current thread state
      000197 C0 E0            [24]  391 	PUSH ACC 
      000199 C0 F0            [24]  392 	PUSH B 
      00019B C0 82            [24]  393 	PUSH DPL 
      00019D C0 83            [24]  394 	PUSH DPH 
      00019F C0 D0            [24]  395 	PUSH PSW 
      0001A1 74 30            [12]  396 	mov	a,#0x30
      0001A3 B5 25 05         [24]  397 	cjne	a,_Cur_ID,00110$
      0001A6 85 81 20         [24]  398 	MOV 0x20, SP 
      0001A9 80 1C            [24]  399 	sjmp	00111$
      0001AB                        400 00110$:
      0001AB 74 31            [12]  401 	mov	a,#0x31
      0001AD B5 25 05         [24]  402 	cjne	a,_Cur_ID,00107$
      0001B0 85 81 21         [24]  403 	MOV 0x21, SP 
      0001B3 80 12            [24]  404 	sjmp	00111$
      0001B5                        405 00107$:
      0001B5 74 32            [12]  406 	mov	a,#0x32
      0001B7 B5 25 05         [24]  407 	cjne	a,_Cur_ID,00104$
      0001BA 85 81 22         [24]  408 	MOV 0x22, SP 
      0001BD 80 08            [24]  409 	sjmp	00111$
      0001BF                        410 00104$:
      0001BF 74 33            [12]  411 	mov	a,#0x33
      0001C1 B5 25 03         [24]  412 	cjne	a,_Cur_ID,00111$
      0001C4 85 81 23         [24]  413 	MOV 0x23, SP 
      0001C7                        414 00111$:
                                    415 ;	preemptive.c:154: if (Cur_ID != '0') {
      0001C7 74 30            [12]  416 	mov	a,#0x30
      0001C9 B5 25 02         [24]  417 	cjne	a,_Cur_ID,00199$
      0001CC 80 05            [24]  418 	sjmp	00116$
      0001CE                        419 00199$:
                                    420 ;	preemptive.c:158: Cur_ID = '0';
      0001CE 75 25 30         [24]  421 	mov	_Cur_ID,#0x30
      0001D1 80 10            [24]  422 	sjmp	00117$
      0001D3                        423 00116$:
                                    424 ;	preemptive.c:163: Cur_ID = Next_ID;
      0001D3 85 33 25         [24]  425 	mov	_Cur_ID,_Next_ID
                                    426 ;	preemptive.c:166: if(Next_ID == '1') Next_ID = '2';
      0001D6 74 31            [12]  427 	mov	a,#0x31
      0001D8 B5 33 05         [24]  428 	cjne	a,_Next_ID,00113$
      0001DB 75 33 32         [24]  429 	mov	_Next_ID,#0x32
      0001DE 80 03            [24]  430 	sjmp	00117$
      0001E0                        431 00113$:
                                    432 ;	preemptive.c:167: else Next_ID = '1';
      0001E0 75 33 31         [24]  433 	mov	_Next_ID,#0x31
      0001E3                        434 00117$:
                                    435 ;	preemptive.c:169: RESTORESTATE; // Restore the state of the next thread
      0001E3 74 30            [12]  436 	mov	a,#0x30
      0001E5 B5 25 05         [24]  437 	cjne	a,_Cur_ID,00127$
      0001E8 85 20 81         [24]  438 	MOV SP, 0x20 
      0001EB 80 1C            [24]  439 	sjmp	00128$
      0001ED                        440 00127$:
      0001ED 74 31            [12]  441 	mov	a,#0x31
      0001EF B5 25 05         [24]  442 	cjne	a,_Cur_ID,00124$
      0001F2 85 21 81         [24]  443 	MOV SP, 0x21 
      0001F5 80 12            [24]  444 	sjmp	00128$
      0001F7                        445 00124$:
      0001F7 74 32            [12]  446 	mov	a,#0x32
      0001F9 B5 25 05         [24]  447 	cjne	a,_Cur_ID,00121$
      0001FC 85 22 81         [24]  448 	MOV SP, 0x22 
      0001FF 80 08            [24]  449 	sjmp	00128$
      000201                        450 00121$:
      000201 74 33            [12]  451 	mov	a,#0x33
      000203 B5 25 03         [24]  452 	cjne	a,_Cur_ID,00128$
      000206 85 23 81         [24]  453 	MOV SP, 0x23 
      000209                        454 00128$:
      000209 D0 D0            [24]  455 	POP PSW 
      00020B D0 83            [24]  456 	POP DPH 
      00020D D0 82            [24]  457 	POP DPL 
      00020F D0 F0            [24]  458 	POP B 
      000211 D0 E0            [24]  459 	POP ACC 
                                    460 ;	preemptive.c:170: EA = 1; // Re-enable interrupts
                                    461 ;	assignBit
      000213 D2 AF            [12]  462 	setb	_EA
                                    463 ;	preemptive.c:174: __endasm;
      000215 32               [24]  464 	RETI
                                    465 ;	preemptive.c:175: }
      000216 22               [24]  466 	ret
                                    467 ;------------------------------------------------------------
                                    468 ;Allocation info for local variables in function 'ThreadCreate'
                                    469 ;------------------------------------------------------------
                                    470 ;fp                        Allocated to registers 
                                    471 ;------------------------------------------------------------
                                    472 ;	preemptive.c:183: ThreadID ThreadCreate(FunctionPtr fp) {
                                    473 ;	-----------------------------------------
                                    474 ;	 function ThreadCreate
                                    475 ;	-----------------------------------------
      000217                        476 _ThreadCreate:
                                    477 ;	preemptive.c:190: EA = 0;
                                    478 ;	assignBit
      000217 C2 AF            [12]  479 	clr	_EA
                                    480 ;	preemptive.c:192: if ((Map & 0xFF) == 0xFF) return -1; // Return -1 if no available thread IDs
      000219 AE 24            [24]  481 	mov	r6,_Map
      00021B E5 25            [12]  482 	mov	a,(_Map + 1)
      00021D 7F 00            [12]  483 	mov	r7,#0x00
      00021F BE FF 07         [24]  484 	cjne	r6,#0xff,00102$
      000222 BF 00 04         [24]  485 	cjne	r7,#0x00,00102$
      000225 75 82 FF         [24]  486 	mov	dpl, #0xff
      000228 22               [24]  487 	ret
      000229                        488 00102$:
                                    489 ;	preemptive.c:235: New_ID = 'x';
      000229 75 32 78         [24]  490 	mov	_New_ID,#0x78
                                    491 ;	preemptive.c:240: if ((Map & 0x01) == 0x00) {
      00022C E5 24            [12]  492 	mov	a,_Map
      00022E 20 E0 0B         [24]  493 	jb	acc.0,00112$
                                    494 ;	preemptive.c:249: __endasm;
      000231 75 32 30         [24]  495 	MOV	0x32, #48
      000234 43 24 01         [24]  496 	ORL	0x24, #01
      000237 85 20 31         [24]  497 	MOV	0x31, 0x20
      00023A 80 2E            [24]  498 	sjmp	00113$
      00023C                        499 00112$:
                                    500 ;	preemptive.c:250: } else if ((Map & 0x02) == 0x00) {
      00023C E5 24            [12]  501 	mov	a,_Map
      00023E 20 E1 0B         [24]  502 	jb	acc.1,00109$
                                    503 ;	preemptive.c:255: __endasm;
      000241 75 32 31         [24]  504 	MOV	0x32, #49
      000244 43 24 02         [24]  505 	ORL	0x24, #02
      000247 85 21 31         [24]  506 	MOV	0x31, 0x21
      00024A 80 1E            [24]  507 	sjmp	00113$
      00024C                        508 00109$:
                                    509 ;	preemptive.c:256: } else if ((Map & 0x04) == 0x00) {
      00024C E5 24            [12]  510 	mov	a,_Map
      00024E 20 E2 0B         [24]  511 	jb	acc.2,00106$
                                    512 ;	preemptive.c:261: __endasm;
      000251 75 32 32         [24]  513 	MOV	0x32, #50
      000254 43 24 04         [24]  514 	ORL	0x24, #04
      000257 85 22 31         [24]  515 	MOV	0x31, 0x22
      00025A 80 0E            [24]  516 	sjmp	00113$
      00025C                        517 00106$:
                                    518 ;	preemptive.c:262: } else if ((Map & 0x08) == 0x00) {
      00025C E5 24            [12]  519 	mov	a,_Map
      00025E 20 E3 09         [24]  520 	jb	acc.3,00113$
                                    521 ;	preemptive.c:267: __endasm;
      000261 75 32 33         [24]  522 	MOV	0x32, #51
      000264 43 24 08         [24]  523 	ORL	0x24, #08
      000267 85 23 31         [24]  524 	MOV	0x31, 0x23
      00026A                        525 00113$:
                                    526 ;	preemptive.c:275: __endasm;
      00026A 85 81 30         [24]  527 	MOV	0x30, sp
      00026D 85 31 81         [24]  528 	MOV	sp, 0x31
                                    529 ;	preemptive.c:281: __endasm;
      000270 C0 82            [24]  530 	PUSH	DPL
      000272 C0 83            [24]  531 	PUSH	DPH
                                    532 ;	preemptive.c:290: __endasm;
      000274 E5 00            [12]  533 	MOV	A, 0x00
      000276 C0 E0            [24]  534 	PUSH	ACC
      000278 C0 E0            [24]  535 	PUSH	ACC
      00027A C0 E0            [24]  536 	PUSH	ACC
      00027C C0 E0            [24]  537 	PUSH	ACC
                                    538 ;	preemptive.c:294: if (New_ID == '0') {
      00027E 74 30            [12]  539 	mov	a,#0x30
      000280 B5 32 0A         [24]  540 	cjne	a,_New_ID,00123$
                                    541 ;	preemptive.c:299: __endasm;
      000283 75 D0 00         [24]  542 	MOV	PSW, #0x00
      000286 C0 D0            [24]  543 	PUSH	PSW
      000288 85 81 20         [24]  544 	MOV	0x20, SP
      00028B 80 2B            [24]  545 	sjmp	00124$
      00028D                        546 00123$:
                                    547 ;	preemptive.c:300: } else if (New_ID == '1') {
      00028D 74 31            [12]  548 	mov	a,#0x31
      00028F B5 32 0A         [24]  549 	cjne	a,_New_ID,00120$
                                    550 ;	preemptive.c:305: __endasm;
      000292 75 D0 08         [24]  551 	MOV	PSW, #0x08
      000295 C0 D0            [24]  552 	PUSH	PSW
      000297 85 81 21         [24]  553 	MOV	0x21, SP
      00029A 80 1C            [24]  554 	sjmp	00124$
      00029C                        555 00120$:
                                    556 ;	preemptive.c:306: } else if (New_ID == '2') {
      00029C 74 32            [12]  557 	mov	a,#0x32
      00029E B5 32 0A         [24]  558 	cjne	a,_New_ID,00117$
                                    559 ;	preemptive.c:311: __endasm;
      0002A1 75 D0 10         [24]  560 	MOV	PSW, #0x10
      0002A4 C0 D0            [24]  561 	PUSH	PSW
      0002A6 85 81 22         [24]  562 	MOV	0x22, SP
      0002A9 80 0D            [24]  563 	sjmp	00124$
      0002AB                        564 00117$:
                                    565 ;	preemptive.c:312: } else if (New_ID == '3') {
      0002AB 74 33            [12]  566 	mov	a,#0x33
      0002AD B5 32 08         [24]  567 	cjne	a,_New_ID,00124$
                                    568 ;	preemptive.c:317: __endasm;
      0002B0 75 D0 18         [24]  569 	MOV	PSW, #0x18
      0002B3 C0 D0            [24]  570 	PUSH	PSW
      0002B5 85 81 23         [24]  571 	MOV	0x23, SP
      0002B8                        572 00124$:
                                    573 ;	preemptive.c:323: __endasm;
      0002B8 85 30 81         [24]  574 	MOV	sp, 0x30
                                    575 ;	preemptive.c:325: EA = 1;
                                    576 ;	assignBit
      0002BB D2 AF            [12]  577 	setb	_EA
                                    578 ;	preemptive.c:326: return New_ID;
      0002BD 85 32 82         [24]  579 	mov	dpl, _New_ID
                                    580 ;	preemptive.c:327: }
      0002C0 22               [24]  581 	ret
                                    582 ;------------------------------------------------------------
                                    583 ;Allocation info for local variables in function 'ThreadYield'
                                    584 ;------------------------------------------------------------
                                    585 ;	preemptive.c:336: void ThreadYield(void) {
                                    586 ;	-----------------------------------------
                                    587 ;	 function ThreadYield
                                    588 ;	-----------------------------------------
      0002C1                        589 _ThreadYield:
                                    590 ;	preemptive.c:337: SAVESTATE;
      0002C1 C0 E0            [24]  591 	PUSH ACC 
      0002C3 C0 F0            [24]  592 	PUSH B 
      0002C5 C0 82            [24]  593 	PUSH DPL 
      0002C7 C0 83            [24]  594 	PUSH DPH 
      0002C9 C0 D0            [24]  595 	PUSH PSW 
      0002CB 74 30            [12]  596 	mov	a,#0x30
      0002CD B5 25 05         [24]  597 	cjne	a,_Cur_ID,00110$
      0002D0 85 81 20         [24]  598 	MOV 0x20, SP 
      0002D3 80 1C            [24]  599 	sjmp	00130$
      0002D5                        600 00110$:
      0002D5 74 31            [12]  601 	mov	a,#0x31
      0002D7 B5 25 05         [24]  602 	cjne	a,_Cur_ID,00107$
      0002DA 85 81 21         [24]  603 	MOV 0x21, SP 
      0002DD 80 12            [24]  604 	sjmp	00130$
      0002DF                        605 00107$:
      0002DF 74 32            [12]  606 	mov	a,#0x32
      0002E1 B5 25 05         [24]  607 	cjne	a,_Cur_ID,00104$
      0002E4 85 81 22         [24]  608 	MOV 0x22, SP 
      0002E7 80 08            [24]  609 	sjmp	00130$
      0002E9                        610 00104$:
      0002E9 74 33            [12]  611 	mov	a,#0x33
      0002EB B5 25 03         [24]  612 	cjne	a,_Cur_ID,00130$
      0002EE 85 81 23         [24]  613 	MOV 0x23, SP 
                                    614 ;	preemptive.c:338: do {
      0002F1                        615 00130$:
                                    616 ;	preemptive.c:350: if (Cur_ID == '0') Cur_ID = '1';
      0002F1 74 30            [12]  617 	mov	a,#0x30
      0002F3 B5 25 05         [24]  618 	cjne	a,_Cur_ID,00119$
      0002F6 75 25 31         [24]  619 	mov	_Cur_ID,#0x31
      0002F9 80 17            [24]  620 	sjmp	00120$
      0002FB                        621 00119$:
                                    622 ;	preemptive.c:351: else if (Cur_ID == '1') Cur_ID = '2';
      0002FB 74 31            [12]  623 	mov	a,#0x31
      0002FD B5 25 05         [24]  624 	cjne	a,_Cur_ID,00116$
      000300 75 25 32         [24]  625 	mov	_Cur_ID,#0x32
      000303 80 0D            [24]  626 	sjmp	00120$
      000305                        627 00116$:
                                    628 ;	preemptive.c:352: else if (Cur_ID == '2') Cur_ID = '3';
      000305 74 32            [12]  629 	mov	a,#0x32
      000307 B5 25 05         [24]  630 	cjne	a,_Cur_ID,00113$
      00030A 75 25 33         [24]  631 	mov	_Cur_ID,#0x33
      00030D 80 03            [24]  632 	sjmp	00120$
      00030F                        633 00113$:
                                    634 ;	preemptive.c:353: else Cur_ID = '0';
      00030F 75 25 30         [24]  635 	mov	_Cur_ID,#0x30
      000312                        636 00120$:
                                    637 ;	preemptive.c:356: if (((Cur_ID == '0') && ((Map & 0x01) == 0x01)) ||
      000312 74 30            [12]  638 	mov	a,#0x30
      000314 B5 25 11         [24]  639 	cjne	a,_Cur_ID,00125$
      000317 74 01            [12]  640 	mov	a,#0x01
      000319 55 24            [12]  641 	anl	a,_Map
      00031B FE               [12]  642 	mov	r6,a
      00031C E5 25            [12]  643 	mov	a,(_Map + 1)
      00031E 7F 00            [12]  644 	mov	r7,#0x00
      000320 BE 01 05         [24]  645 	cjne	r6,#0x01,00258$
      000323 BF 00 02         [24]  646 	cjne	r7,#0x00,00258$
      000326 80 4A            [24]  647 	sjmp	00132$
      000328                        648 00258$:
      000328                        649 00125$:
                                    650 ;	preemptive.c:357: ((Cur_ID == '1') && ((Map & 0x02) == 0x02)) ||
      000328 74 31            [12]  651 	mov	a,#0x31
      00032A B5 25 11         [24]  652 	cjne	a,_Cur_ID,00127$
      00032D 74 02            [12]  653 	mov	a,#0x02
      00032F 55 24            [12]  654 	anl	a,_Map
      000331 FE               [12]  655 	mov	r6,a
      000332 E5 25            [12]  656 	mov	a,(_Map + 1)
      000334 7F 00            [12]  657 	mov	r7,#0x00
      000336 BE 02 05         [24]  658 	cjne	r6,#0x02,00261$
      000339 BF 00 02         [24]  659 	cjne	r7,#0x00,00261$
      00033C 80 34            [24]  660 	sjmp	00132$
      00033E                        661 00261$:
      00033E                        662 00127$:
                                    663 ;	preemptive.c:358: ((Cur_ID == '2') && ((Map & 0x04) == 0x04)) ||
      00033E 74 32            [12]  664 	mov	a,#0x32
      000340 B5 25 11         [24]  665 	cjne	a,_Cur_ID,00129$
      000343 74 04            [12]  666 	mov	a,#0x04
      000345 55 24            [12]  667 	anl	a,_Map
      000347 FE               [12]  668 	mov	r6,a
      000348 E5 25            [12]  669 	mov	a,(_Map + 1)
      00034A 7F 00            [12]  670 	mov	r7,#0x00
      00034C BE 04 05         [24]  671 	cjne	r6,#0x04,00264$
      00034F BF 00 02         [24]  672 	cjne	r7,#0x00,00264$
      000352 80 1E            [24]  673 	sjmp	00132$
      000354                        674 00264$:
      000354                        675 00129$:
                                    676 ;	preemptive.c:359: ((Cur_ID == '3') && ((Map & 0x08) == 0x08))) {
      000354 74 33            [12]  677 	mov	a,#0x33
      000356 B5 25 02         [24]  678 	cjne	a,_Cur_ID,00265$
      000359 80 03            [24]  679 	sjmp	00266$
      00035B                        680 00265$:
      00035B 02 02 F1         [24]  681 	ljmp	00130$
      00035E                        682 00266$:
      00035E 74 08            [12]  683 	mov	a,#0x08
      000360 55 24            [12]  684 	anl	a,_Map
      000362 FE               [12]  685 	mov	r6,a
      000363 E5 25            [12]  686 	mov	a,(_Map + 1)
      000365 7F 00            [12]  687 	mov	r7,#0x00
      000367 BE 08 05         [24]  688 	cjne	r6,#0x08,00267$
      00036A BF 00 02         [24]  689 	cjne	r7,#0x00,00267$
      00036D 80 03            [24]  690 	sjmp	00268$
      00036F                        691 00267$:
      00036F 02 02 F1         [24]  692 	ljmp	00130$
      000372                        693 00268$:
                                    694 ;	preemptive.c:362: } while (1);
      000372                        695 00132$:
                                    696 ;	preemptive.c:363: RESTORESTATE;
      000372 74 30            [12]  697 	mov	a,#0x30
      000374 B5 25 05         [24]  698 	cjne	a,_Cur_ID,00142$
      000377 85 20 81         [24]  699 	MOV SP, 0x20 
      00037A 80 1C            [24]  700 	sjmp	00143$
      00037C                        701 00142$:
      00037C 74 31            [12]  702 	mov	a,#0x31
      00037E B5 25 05         [24]  703 	cjne	a,_Cur_ID,00139$
      000381 85 21 81         [24]  704 	MOV SP, 0x21 
      000384 80 12            [24]  705 	sjmp	00143$
      000386                        706 00139$:
      000386 74 32            [12]  707 	mov	a,#0x32
      000388 B5 25 05         [24]  708 	cjne	a,_Cur_ID,00136$
      00038B 85 22 81         [24]  709 	MOV SP, 0x22 
      00038E 80 08            [24]  710 	sjmp	00143$
      000390                        711 00136$:
      000390 74 33            [12]  712 	mov	a,#0x33
      000392 B5 25 03         [24]  713 	cjne	a,_Cur_ID,00143$
      000395 85 23 81         [24]  714 	MOV SP, 0x23 
      000398                        715 00143$:
      000398 D0 D0            [24]  716 	POP PSW 
      00039A D0 83            [24]  717 	POP DPH 
      00039C D0 82            [24]  718 	POP DPL 
      00039E D0 F0            [24]  719 	POP B 
      0003A0 D0 E0            [24]  720 	POP ACC 
                                    721 ;	preemptive.c:364: }
      0003A2 22               [24]  722 	ret
                                    723 ;------------------------------------------------------------
                                    724 ;Allocation info for local variables in function 'ThreadExit'
                                    725 ;------------------------------------------------------------
                                    726 ;	preemptive.c:372: void ThreadExit(void) {
                                    727 ;	-----------------------------------------
                                    728 ;	 function ThreadExit
                                    729 ;	-----------------------------------------
      0003A3                        730 _ThreadExit:
                                    731 ;	preemptive.c:381: if (Cur_ID == '0') {
      0003A3 74 30            [12]  732 	mov	a,#0x30
      0003A5 B5 25 05         [24]  733 	cjne	a,_Cur_ID,00110$
                                    734 ;	preemptive.c:384: __endasm;
      0003A8 53 24 C6         [24]  735 	ANL	0x24, #11111110
      0003AB 80 1C            [24]  736 	sjmp	00130$
      0003AD                        737 00110$:
                                    738 ;	preemptive.c:385: } else if (Cur_ID == '1') {
      0003AD 74 31            [12]  739 	mov	a,#0x31
      0003AF B5 25 05         [24]  740 	cjne	a,_Cur_ID,00107$
                                    741 ;	preemptive.c:388: __endasm;
      0003B2 53 24 BD         [24]  742 	ANL	0x24, #11111101
      0003B5 80 12            [24]  743 	sjmp	00130$
      0003B7                        744 00107$:
                                    745 ;	preemptive.c:389: } else if (Cur_ID == '2') {
      0003B7 74 32            [12]  746 	mov	a,#0x32
      0003B9 B5 25 05         [24]  747 	cjne	a,_Cur_ID,00104$
                                    748 ;	preemptive.c:392: __endasm;
      0003BC 53 24 63         [24]  749 	ANL	0x24, #11111011
      0003BF 80 08            [24]  750 	sjmp	00130$
      0003C1                        751 00104$:
                                    752 ;	preemptive.c:393: } else if (Cur_ID == '3') {
      0003C1 74 33            [12]  753 	mov	a,#0x33
      0003C3 B5 25 03         [24]  754 	cjne	a,_Cur_ID,00130$
                                    755 ;	preemptive.c:396: __endasm;
      0003C6 53 24 DF         [24]  756 	ANL	0x24, #11110111
                                    757 ;	preemptive.c:398: do {
      0003C9                        758 00130$:
                                    759 ;	preemptive.c:400: if (Cur_ID == '0') Cur_ID = '1';
      0003C9 74 30            [12]  760 	mov	a,#0x30
      0003CB B5 25 05         [24]  761 	cjne	a,_Cur_ID,00119$
      0003CE 75 25 31         [24]  762 	mov	_Cur_ID,#0x31
      0003D1 80 17            [24]  763 	sjmp	00120$
      0003D3                        764 00119$:
                                    765 ;	preemptive.c:401: else if (Cur_ID == '1') Cur_ID = '2';
      0003D3 74 31            [12]  766 	mov	a,#0x31
      0003D5 B5 25 05         [24]  767 	cjne	a,_Cur_ID,00116$
      0003D8 75 25 32         [24]  768 	mov	_Cur_ID,#0x32
      0003DB 80 0D            [24]  769 	sjmp	00120$
      0003DD                        770 00116$:
                                    771 ;	preemptive.c:402: else if (Cur_ID == '2') Cur_ID = '3';
      0003DD 74 32            [12]  772 	mov	a,#0x32
      0003DF B5 25 05         [24]  773 	cjne	a,_Cur_ID,00113$
      0003E2 75 25 33         [24]  774 	mov	_Cur_ID,#0x33
      0003E5 80 03            [24]  775 	sjmp	00120$
      0003E7                        776 00113$:
                                    777 ;	preemptive.c:403: else Cur_ID = '0';
      0003E7 75 25 30         [24]  778 	mov	_Cur_ID,#0x30
      0003EA                        779 00120$:
                                    780 ;	preemptive.c:406: if (((Cur_ID == '0') && ((Map & 0x01) == 0x01)) ||
      0003EA 74 30            [12]  781 	mov	a,#0x30
      0003EC B5 25 11         [24]  782 	cjne	a,_Cur_ID,00125$
      0003EF 74 01            [12]  783 	mov	a,#0x01
      0003F1 55 24            [12]  784 	anl	a,_Map
      0003F3 FE               [12]  785 	mov	r6,a
      0003F4 E5 25            [12]  786 	mov	a,(_Map + 1)
      0003F6 7F 00            [12]  787 	mov	r7,#0x00
      0003F8 BE 01 05         [24]  788 	cjne	r6,#0x01,00258$
      0003FB BF 00 02         [24]  789 	cjne	r7,#0x00,00258$
      0003FE 80 4A            [24]  790 	sjmp	00132$
      000400                        791 00258$:
      000400                        792 00125$:
                                    793 ;	preemptive.c:407: ((Cur_ID == '1') && ((Map & 0x02) == 0x02)) ||
      000400 74 31            [12]  794 	mov	a,#0x31
      000402 B5 25 11         [24]  795 	cjne	a,_Cur_ID,00127$
      000405 74 02            [12]  796 	mov	a,#0x02
      000407 55 24            [12]  797 	anl	a,_Map
      000409 FE               [12]  798 	mov	r6,a
      00040A E5 25            [12]  799 	mov	a,(_Map + 1)
      00040C 7F 00            [12]  800 	mov	r7,#0x00
      00040E BE 02 05         [24]  801 	cjne	r6,#0x02,00261$
      000411 BF 00 02         [24]  802 	cjne	r7,#0x00,00261$
      000414 80 34            [24]  803 	sjmp	00132$
      000416                        804 00261$:
      000416                        805 00127$:
                                    806 ;	preemptive.c:408: ((Cur_ID == '2') && ((Map & 0x04) == 0x04)) ||
      000416 74 32            [12]  807 	mov	a,#0x32
      000418 B5 25 11         [24]  808 	cjne	a,_Cur_ID,00129$
      00041B 74 04            [12]  809 	mov	a,#0x04
      00041D 55 24            [12]  810 	anl	a,_Map
      00041F FE               [12]  811 	mov	r6,a
      000420 E5 25            [12]  812 	mov	a,(_Map + 1)
      000422 7F 00            [12]  813 	mov	r7,#0x00
      000424 BE 04 05         [24]  814 	cjne	r6,#0x04,00264$
      000427 BF 00 02         [24]  815 	cjne	r7,#0x00,00264$
      00042A 80 1E            [24]  816 	sjmp	00132$
      00042C                        817 00264$:
      00042C                        818 00129$:
                                    819 ;	preemptive.c:409: ((Cur_ID == '3') && ((Map & 0x08) == 0x08))) {
      00042C 74 33            [12]  820 	mov	a,#0x33
      00042E B5 25 02         [24]  821 	cjne	a,_Cur_ID,00265$
      000431 80 03            [24]  822 	sjmp	00266$
      000433                        823 00265$:
      000433 02 03 C9         [24]  824 	ljmp	00130$
      000436                        825 00266$:
      000436 74 08            [12]  826 	mov	a,#0x08
      000438 55 24            [12]  827 	anl	a,_Map
      00043A FE               [12]  828 	mov	r6,a
      00043B E5 25            [12]  829 	mov	a,(_Map + 1)
      00043D 7F 00            [12]  830 	mov	r7,#0x00
      00043F BE 08 05         [24]  831 	cjne	r6,#0x08,00267$
      000442 BF 00 02         [24]  832 	cjne	r7,#0x00,00267$
      000445 80 03            [24]  833 	sjmp	00268$
      000447                        834 00267$:
      000447 02 03 C9         [24]  835 	ljmp	00130$
      00044A                        836 00268$:
                                    837 ;	preemptive.c:412: } while (1);
      00044A                        838 00132$:
                                    839 ;	preemptive.c:413: RESTORESTATE;
      00044A 74 30            [12]  840 	mov	a,#0x30
      00044C B5 25 05         [24]  841 	cjne	a,_Cur_ID,00142$
      00044F 85 20 81         [24]  842 	MOV SP, 0x20 
      000452 80 1C            [24]  843 	sjmp	00143$
      000454                        844 00142$:
      000454 74 31            [12]  845 	mov	a,#0x31
      000456 B5 25 05         [24]  846 	cjne	a,_Cur_ID,00139$
      000459 85 21 81         [24]  847 	MOV SP, 0x21 
      00045C 80 12            [24]  848 	sjmp	00143$
      00045E                        849 00139$:
      00045E 74 32            [12]  850 	mov	a,#0x32
      000460 B5 25 05         [24]  851 	cjne	a,_Cur_ID,00136$
      000463 85 22 81         [24]  852 	MOV SP, 0x22 
      000466 80 08            [24]  853 	sjmp	00143$
      000468                        854 00136$:
      000468 74 33            [12]  855 	mov	a,#0x33
      00046A B5 25 03         [24]  856 	cjne	a,_Cur_ID,00143$
      00046D 85 23 81         [24]  857 	MOV SP, 0x23 
      000470                        858 00143$:
      000470 D0 D0            [24]  859 	POP PSW 
      000472 D0 83            [24]  860 	POP DPH 
      000474 D0 82            [24]  861 	POP DPL 
      000476 D0 F0            [24]  862 	POP B 
      000478 D0 E0            [24]  863 	POP ACC 
                                    864 ;	preemptive.c:414: }
      00047A 22               [24]  865 	ret
                                    866 	.area CSEG    (CODE)
                                    867 	.area CONST   (CODE)
                                    868 	.area XINIT   (CODE)
                                    869 	.area CABS    (ABS,CODE)
