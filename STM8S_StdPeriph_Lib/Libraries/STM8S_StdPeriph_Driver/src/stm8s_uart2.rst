                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_uart2
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _CLK_GetClockFreq
                                     12 	.globl _UART2_DeInit
                                     13 	.globl _UART2_Init
                                     14 	.globl _UART2_Cmd
                                     15 	.globl _UART2_ITConfig
                                     16 	.globl _UART2_IrDAConfig
                                     17 	.globl _UART2_IrDACmd
                                     18 	.globl _UART2_LINBreakDetectionConfig
                                     19 	.globl _UART2_LINConfig
                                     20 	.globl _UART2_LINCmd
                                     21 	.globl _UART2_SmartCardCmd
                                     22 	.globl _UART2_SmartCardNACKCmd
                                     23 	.globl _UART2_WakeUpConfig
                                     24 	.globl _UART2_ReceiverWakeUpCmd
                                     25 	.globl _UART2_ReceiveData8
                                     26 	.globl _UART2_ReceiveData9
                                     27 	.globl _UART2_SendData8
                                     28 	.globl _UART2_SendData9
                                     29 	.globl _UART2_SendBreak
                                     30 	.globl _UART2_SetAddress
                                     31 	.globl _UART2_SetGuardTime
                                     32 	.globl _UART2_SetPrescaler
                                     33 	.globl _UART2_GetFlagStatus
                                     34 	.globl _UART2_ClearFlag
                                     35 	.globl _UART2_GetITStatus
                                     36 	.globl _UART2_ClearITPendingBit
                                     37 ;--------------------------------------------------------
                                     38 ; ram data
                                     39 ;--------------------------------------------------------
                                     40 	.area DATA
                                     41 ;--------------------------------------------------------
                                     42 ; ram data
                                     43 ;--------------------------------------------------------
                                     44 	.area INITIALIZED
                                     45 ;--------------------------------------------------------
                                     46 ; absolute external ram data
                                     47 ;--------------------------------------------------------
                                     48 	.area DABS (ABS)
                                     49 
                                     50 ; default segment ordering for linker
                                     51 	.area HOME
                                     52 	.area GSINIT
                                     53 	.area GSFINAL
                                     54 	.area CONST
                                     55 	.area INITIALIZER
                                     56 	.area CODE
                                     57 
                                     58 ;--------------------------------------------------------
                                     59 ; global & static initialisations
                                     60 ;--------------------------------------------------------
                                     61 	.area HOME
                                     62 	.area GSINIT
                                     63 	.area GSFINAL
                                     64 	.area GSINIT
                                     65 ;--------------------------------------------------------
                                     66 ; Home
                                     67 ;--------------------------------------------------------
                                     68 	.area HOME
                                     69 	.area HOME
                                     70 ;--------------------------------------------------------
                                     71 ; code
                                     72 ;--------------------------------------------------------
                                     73 	.area CODE
                                     74 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 53: void UART2_DeInit(void)
                                     75 ;	-----------------------------------------
                                     76 ;	 function UART2_DeInit
                                     77 ;	-----------------------------------------
      009173                         78 _UART2_DeInit:
                                     79 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 57: (void) UART2->SR;
      009173 C6 52 40         [ 1]   80 	ld	a, 0x5240
                                     81 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 58: (void)UART2->DR;
      009176 C6 52 41         [ 1]   82 	ld	a, 0x5241
                                     83 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 60: UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*  Set UART2_BRR2 to reset value 0x00 */
      009179 35 00 52 43      [ 1]   84 	mov	0x5243+0, #0x00
                                     85 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 61: UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*  Set UART2_BRR1 to reset value 0x00 */
      00917D 35 00 52 42      [ 1]   86 	mov	0x5242+0, #0x00
                                     87 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 63: UART2->CR1 = UART2_CR1_RESET_VALUE; /*  Set UART2_CR1 to reset value 0x00  */
      009181 35 00 52 44      [ 1]   88 	mov	0x5244+0, #0x00
                                     89 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 64: UART2->CR2 = UART2_CR2_RESET_VALUE; /*  Set UART2_CR2 to reset value 0x00  */
      009185 35 00 52 45      [ 1]   90 	mov	0x5245+0, #0x00
                                     91 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 65: UART2->CR3 = UART2_CR3_RESET_VALUE; /*  Set UART2_CR3 to reset value 0x00  */
      009189 35 00 52 46      [ 1]   92 	mov	0x5246+0, #0x00
                                     93 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 66: UART2->CR4 = UART2_CR4_RESET_VALUE; /*  Set UART2_CR4 to reset value 0x00  */
      00918D 35 00 52 47      [ 1]   94 	mov	0x5247+0, #0x00
                                     95 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 67: UART2->CR5 = UART2_CR5_RESET_VALUE; /*  Set UART2_CR5 to reset value 0x00  */
      009191 35 00 52 48      [ 1]   96 	mov	0x5248+0, #0x00
                                     97 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 68: UART2->CR6 = UART2_CR6_RESET_VALUE; /*  Set UART2_CR6 to reset value 0x00  */
      009195 35 00 52 49      [ 1]   98 	mov	0x5249+0, #0x00
                                     99 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 69: }
      009199 81               [ 4]  100 	ret
                                    101 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 85: void UART2_Init(uint32_t BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
                                    102 ;	-----------------------------------------
                                    103 ;	 function UART2_Init
                                    104 ;	-----------------------------------------
      00919A                        105 _UART2_Init:
      00919A 52 23            [ 2]  106 	sub	sp, #35
                                    107 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 99: UART2->CR1 &= (uint8_t)(~UART2_CR1_M);
      00919C 72 19 52 44      [ 1]  108 	bres	21060, #4
                                    109 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 101: UART2->CR1 |= (uint8_t)WordLength; 
      0091A0 C6 52 44         [ 1]  110 	ld	a, 0x5244
      0091A3 1A 2A            [ 1]  111 	or	a, (0x2a, sp)
      0091A5 C7 52 44         [ 1]  112 	ld	0x5244, a
                                    113 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 104: UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
      0091A8 C6 52 46         [ 1]  114 	ld	a, 0x5246
      0091AB A4 CF            [ 1]  115 	and	a, #0xcf
      0091AD C7 52 46         [ 1]  116 	ld	0x5246, a
                                    117 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 106: UART2->CR3 |= (uint8_t)StopBits; 
      0091B0 C6 52 46         [ 1]  118 	ld	a, 0x5246
      0091B3 1A 2B            [ 1]  119 	or	a, (0x2b, sp)
      0091B5 C7 52 46         [ 1]  120 	ld	0x5246, a
                                    121 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 109: UART2->CR1 &= (uint8_t)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));
      0091B8 C6 52 44         [ 1]  122 	ld	a, 0x5244
      0091BB A4 F9            [ 1]  123 	and	a, #0xf9
      0091BD C7 52 44         [ 1]  124 	ld	0x5244, a
                                    125 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 111: UART2->CR1 |= (uint8_t)Parity;
      0091C0 C6 52 44         [ 1]  126 	ld	a, 0x5244
      0091C3 1A 2C            [ 1]  127 	or	a, (0x2c, sp)
      0091C5 C7 52 44         [ 1]  128 	ld	0x5244, a
                                    129 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 114: UART2->BRR1 &= (uint8_t)(~UART2_BRR1_DIVM);
      0091C8 C6 52 42         [ 1]  130 	ld	a, 0x5242
      0091CB 35 00 52 42      [ 1]  131 	mov	0x5242+0, #0x00
                                    132 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 116: UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVM);
      0091CF C6 52 43         [ 1]  133 	ld	a, 0x5243
      0091D2 A4 0F            [ 1]  134 	and	a, #0x0f
      0091D4 C7 52 43         [ 1]  135 	ld	0x5243, a
                                    136 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 118: UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVF);
      0091D7 C6 52 43         [ 1]  137 	ld	a, 0x5243
      0091DA A4 F0            [ 1]  138 	and	a, #0xf0
      0091DC C7 52 43         [ 1]  139 	ld	0x5243, a
                                    140 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 121: BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
      0091DF CD 98 98         [ 4]  141 	call	_CLK_GetClockFreq
      0091E2 1F 19            [ 2]  142 	ldw	(0x19, sp), x
      0091E4 1E 26            [ 2]  143 	ldw	x, (0x26, sp)
      0091E6 1F 13            [ 2]  144 	ldw	(0x13, sp), x
      0091E8 1E 28            [ 2]  145 	ldw	x, (0x28, sp)
      0091EA A6 04            [ 1]  146 	ld	a, #0x04
      0091EC                        147 00127$:
      0091EC 58               [ 2]  148 	sllw	x
      0091ED 09 14            [ 1]  149 	rlc	(0x14, sp)
      0091EF 09 13            [ 1]  150 	rlc	(0x13, sp)
      0091F1 4A               [ 1]  151 	dec	a
      0091F2 26 F8            [ 1]  152 	jrne	00127$
      0091F4 1F 15            [ 2]  153 	ldw	(0x15, sp), x
      0091F6 89               [ 2]  154 	pushw	x
      0091F7 1E 15            [ 2]  155 	ldw	x, (0x15, sp)
      0091F9 89               [ 2]  156 	pushw	x
      0091FA 1E 1D            [ 2]  157 	ldw	x, (0x1d, sp)
      0091FC 89               [ 2]  158 	pushw	x
      0091FD 90 89            [ 2]  159 	pushw	y
      0091FF CD 9A 2A         [ 4]  160 	call	__divulong
      009202 5B 08            [ 2]  161 	addw	sp, #8
      009204 1F 21            [ 2]  162 	ldw	(0x21, sp), x
      009206 17 1F            [ 2]  163 	ldw	(0x1f, sp), y
      009208 16 20            [ 2]  164 	ldw	y, (0x20, sp)
      00920A 17 20            [ 2]  165 	ldw	(0x20, sp), y
                                    166 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 122: BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
      00920C CD 98 98         [ 4]  167 	call	_CLK_GetClockFreq
      00920F 1F 11            [ 2]  168 	ldw	(0x11, sp), x
      009211 17 0F            [ 2]  169 	ldw	(0x0f, sp), y
      009213 1E 11            [ 2]  170 	ldw	x, (0x11, sp)
      009215 89               [ 2]  171 	pushw	x
      009216 1E 11            [ 2]  172 	ldw	x, (0x11, sp)
      009218 89               [ 2]  173 	pushw	x
      009219 4B 64            [ 1]  174 	push	#0x64
      00921B 5F               [ 1]  175 	clrw	x
      00921C 89               [ 2]  176 	pushw	x
      00921D 4B 00            [ 1]  177 	push	#0x00
      00921F CD 9A DB         [ 4]  178 	call	__mullong
      009222 5B 08            [ 2]  179 	addw	sp, #8
      009224 1F 0D            [ 2]  180 	ldw	(0x0d, sp), x
      009226 1E 15            [ 2]  181 	ldw	x, (0x15, sp)
      009228 89               [ 2]  182 	pushw	x
      009229 1E 15            [ 2]  183 	ldw	x, (0x15, sp)
      00922B 89               [ 2]  184 	pushw	x
      00922C 1E 11            [ 2]  185 	ldw	x, (0x11, sp)
      00922E 89               [ 2]  186 	pushw	x
      00922F 90 89            [ 2]  187 	pushw	y
      009231 CD 9A 2A         [ 4]  188 	call	__divulong
      009234 5B 08            [ 2]  189 	addw	sp, #8
      009236 1F 1D            [ 2]  190 	ldw	(0x1d, sp), x
      009238 17 1B            [ 2]  191 	ldw	(0x1b, sp), y
                                    192 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 126: BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
      00923A 1E 21            [ 2]  193 	ldw	x, (0x21, sp)
      00923C 89               [ 2]  194 	pushw	x
      00923D 1E 21            [ 2]  195 	ldw	x, (0x21, sp)
      00923F 89               [ 2]  196 	pushw	x
      009240 4B 64            [ 1]  197 	push	#0x64
      009242 5F               [ 1]  198 	clrw	x
      009243 89               [ 2]  199 	pushw	x
      009244 4B 00            [ 1]  200 	push	#0x00
      009246 CD 9A DB         [ 4]  201 	call	__mullong
      009249 5B 08            [ 2]  202 	addw	sp, #8
      00924B 1F 09            [ 2]  203 	ldw	(0x09, sp), x
      00924D 17 07            [ 2]  204 	ldw	(0x07, sp), y
      00924F 1E 1D            [ 2]  205 	ldw	x, (0x1d, sp)
      009251 72 F0 09         [ 2]  206 	subw	x, (0x09, sp)
      009254 1F 05            [ 2]  207 	ldw	(0x05, sp), x
      009256 7B 1C            [ 1]  208 	ld	a, (0x1c, sp)
      009258 12 08            [ 1]  209 	sbc	a, (0x08, sp)
      00925A 6B 04            [ 1]  210 	ld	(0x04, sp), a
      00925C 7B 1B            [ 1]  211 	ld	a, (0x1b, sp)
      00925E 12 07            [ 1]  212 	sbc	a, (0x07, sp)
      009260 6B 03            [ 1]  213 	ld	(0x03, sp), a
      009262 1E 05            [ 2]  214 	ldw	x, (0x05, sp)
      009264 16 03            [ 2]  215 	ldw	y, (0x03, sp)
      009266 A6 04            [ 1]  216 	ld	a, #0x04
      009268                        217 00129$:
      009268 58               [ 2]  218 	sllw	x
      009269 90 59            [ 2]  219 	rlcw	y
      00926B 4A               [ 1]  220 	dec	a
      00926C 26 FA            [ 1]  221 	jrne	00129$
      00926E 4B 64            [ 1]  222 	push	#0x64
      009270 4B 00            [ 1]  223 	push	#0x00
      009272 4B 00            [ 1]  224 	push	#0x00
      009274 4B 00            [ 1]  225 	push	#0x00
      009276 89               [ 2]  226 	pushw	x
      009277 90 89            [ 2]  227 	pushw	y
      009279 CD 9A 2A         [ 4]  228 	call	__divulong
      00927C 5B 08            [ 2]  229 	addw	sp, #8
      00927E 9F               [ 1]  230 	ld	a, xl
      00927F A4 0F            [ 1]  231 	and	a, #0x0f
      009281 6B 23            [ 1]  232 	ld	(0x23, sp), a
                                    233 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 128: BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
      009283 1E 21            [ 2]  234 	ldw	x, (0x21, sp)
      009285 A6 10            [ 1]  235 	ld	a, #0x10
      009287 62               [ 2]  236 	div	x, a
      009288 9F               [ 1]  237 	ld	a, xl
      009289 A4 F0            [ 1]  238 	and	a, #0xf0
                                    239 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 130: UART2->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
      00928B 1A 23            [ 1]  240 	or	a, (0x23, sp)
      00928D C7 52 43         [ 1]  241 	ld	0x5243, a
                                    242 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 132: UART2->BRR1 = (uint8_t)BaudRate_Mantissa;           
      009290 7B 22            [ 1]  243 	ld	a, (0x22, sp)
      009292 C7 52 42         [ 1]  244 	ld	0x5242, a
                                    245 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 135: UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
      009295 C6 52 45         [ 1]  246 	ld	a, 0x5245
      009298 A4 F3            [ 1]  247 	and	a, #0xf3
      00929A C7 52 45         [ 1]  248 	ld	0x5245, a
                                    249 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 137: UART2->CR3 &= (uint8_t)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL);
      00929D C6 52 46         [ 1]  250 	ld	a, 0x5246
      0092A0 A4 F8            [ 1]  251 	and	a, #0xf8
      0092A2 C7 52 46         [ 1]  252 	ld	0x5246, a
                                    253 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 139: UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART2_CR3_CPOL | \
      0092A5 C6 52 46         [ 1]  254 	ld	a, 0x5246
      0092A8 6B 02            [ 1]  255 	ld	(0x02, sp), a
      0092AA 7B 2D            [ 1]  256 	ld	a, (0x2d, sp)
      0092AC A4 07            [ 1]  257 	and	a, #0x07
      0092AE 1A 02            [ 1]  258 	or	a, (0x02, sp)
      0092B0 C7 52 46         [ 1]  259 	ld	0x5246, a
                                    260 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 135: UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
      0092B3 C6 52 45         [ 1]  261 	ld	a, 0x5245
                                    262 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 142: if ((uint8_t)(Mode & UART2_MODE_TX_ENABLE))
      0092B6 88               [ 1]  263 	push	a
      0092B7 7B 2F            [ 1]  264 	ld	a, (0x2f, sp)
      0092B9 A5 04            [ 1]  265 	bcp	a, #0x04
      0092BB 84               [ 1]  266 	pop	a
      0092BC 27 07            [ 1]  267 	jreq	00102$
                                    268 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 145: UART2->CR2 |= (uint8_t)UART2_CR2_TEN;
      0092BE AA 08            [ 1]  269 	or	a, #0x08
      0092C0 C7 52 45         [ 1]  270 	ld	0x5245, a
      0092C3 20 05            [ 2]  271 	jra	00103$
      0092C5                        272 00102$:
                                    273 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 150: UART2->CR2 &= (uint8_t)(~UART2_CR2_TEN);
      0092C5 A4 F7            [ 1]  274 	and	a, #0xf7
      0092C7 C7 52 45         [ 1]  275 	ld	0x5245, a
      0092CA                        276 00103$:
                                    277 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 135: UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
      0092CA C6 52 45         [ 1]  278 	ld	a, 0x5245
                                    279 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 152: if ((uint8_t)(Mode & UART2_MODE_RX_ENABLE))
      0092CD 88               [ 1]  280 	push	a
      0092CE 7B 2F            [ 1]  281 	ld	a, (0x2f, sp)
      0092D0 A5 08            [ 1]  282 	bcp	a, #0x08
      0092D2 84               [ 1]  283 	pop	a
      0092D3 27 07            [ 1]  284 	jreq	00105$
                                    285 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 155: UART2->CR2 |= (uint8_t)UART2_CR2_REN;
      0092D5 AA 04            [ 1]  286 	or	a, #0x04
      0092D7 C7 52 45         [ 1]  287 	ld	0x5245, a
      0092DA 20 05            [ 2]  288 	jra	00106$
      0092DC                        289 00105$:
                                    290 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 160: UART2->CR2 &= (uint8_t)(~UART2_CR2_REN);
      0092DC A4 FB            [ 1]  291 	and	a, #0xfb
      0092DE C7 52 45         [ 1]  292 	ld	0x5245, a
      0092E1                        293 00106$:
                                    294 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 104: UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
      0092E1 C6 52 46         [ 1]  295 	ld	a, 0x5246
                                    296 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 164: if ((uint8_t)(SyncMode & UART2_SYNCMODE_CLOCK_DISABLE))
      0092E4 0D 2D            [ 1]  297 	tnz	(0x2d, sp)
      0092E6 2A 07            [ 1]  298 	jrpl	00108$
                                    299 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 167: UART2->CR3 &= (uint8_t)(~UART2_CR3_CKEN); 
      0092E8 A4 F7            [ 1]  300 	and	a, #0xf7
      0092EA C7 52 46         [ 1]  301 	ld	0x5246, a
      0092ED 20 0D            [ 2]  302 	jra	00110$
      0092EF                        303 00108$:
                                    304 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 171: UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & UART2_CR3_CKEN);
      0092EF 88               [ 1]  305 	push	a
      0092F0 7B 2E            [ 1]  306 	ld	a, (0x2e, sp)
      0092F2 A4 08            [ 1]  307 	and	a, #0x08
      0092F4 6B 02            [ 1]  308 	ld	(0x02, sp), a
      0092F6 84               [ 1]  309 	pop	a
      0092F7 1A 01            [ 1]  310 	or	a, (0x01, sp)
      0092F9 C7 52 46         [ 1]  311 	ld	0x5246, a
      0092FC                        312 00110$:
                                    313 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 173: }
      0092FC 5B 23            [ 2]  314 	addw	sp, #35
      0092FE 81               [ 4]  315 	ret
                                    316 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 181: void UART2_Cmd(FunctionalState NewState)
                                    317 ;	-----------------------------------------
                                    318 ;	 function UART2_Cmd
                                    319 ;	-----------------------------------------
      0092FF                        320 _UART2_Cmd:
                                    321 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 186: UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
      0092FF C6 52 44         [ 1]  322 	ld	a, 0x5244
                                    323 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 183: if (NewState != DISABLE)
      009302 0D 03            [ 1]  324 	tnz	(0x03, sp)
      009304 27 06            [ 1]  325 	jreq	00102$
                                    326 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 186: UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
      009306 A4 DF            [ 1]  327 	and	a, #0xdf
      009308 C7 52 44         [ 1]  328 	ld	0x5244, a
      00930B 81               [ 4]  329 	ret
      00930C                        330 00102$:
                                    331 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 191: UART2->CR1 |= UART2_CR1_UARTD; 
      00930C AA 20            [ 1]  332 	or	a, #0x20
      00930E C7 52 44         [ 1]  333 	ld	0x5244, a
                                    334 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 193: }
      009311 81               [ 4]  335 	ret
                                    336 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 210: void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)
                                    337 ;	-----------------------------------------
                                    338 ;	 function UART2_ITConfig
                                    339 ;	-----------------------------------------
      009312                        340 _UART2_ITConfig:
      009312 52 04            [ 2]  341 	sub	sp, #4
                                    342 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 219: uartreg = (uint8_t)((uint16_t)UART2_IT >> 0x08);
      009314 7B 07            [ 1]  343 	ld	a, (0x07, sp)
      009316 97               [ 1]  344 	ld	xl, a
                                    345 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 222: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
      009317 7B 08            [ 1]  346 	ld	a, (0x08, sp)
      009319 A4 0F            [ 1]  347 	and	a, #0x0f
      00931B 88               [ 1]  348 	push	a
      00931C A6 01            [ 1]  349 	ld	a, #0x01
      00931E 6B 05            [ 1]  350 	ld	(0x05, sp), a
      009320 84               [ 1]  351 	pop	a
      009321 4D               [ 1]  352 	tnz	a
      009322 27 05            [ 1]  353 	jreq	00160$
      009324                        354 00159$:
      009324 08 04            [ 1]  355 	sll	(0x04, sp)
      009326 4A               [ 1]  356 	dec	a
      009327 26 FB            [ 1]  357 	jrne	00159$
      009329                        358 00160$:
                                    359 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 227: if (uartreg == 0x01)
      009329 9F               [ 1]  360 	ld	a, xl
      00932A 4A               [ 1]  361 	dec	a
      00932B 26 05            [ 1]  362 	jrne	00162$
      00932D A6 01            [ 1]  363 	ld	a, #0x01
      00932F 6B 03            [ 1]  364 	ld	(0x03, sp), a
      009331 C1                     365 	.byte 0xc1
      009332                        366 00162$:
      009332 0F 03            [ 1]  367 	clr	(0x03, sp)
      009334                        368 00163$:
                                    369 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 231: else if (uartreg == 0x02)
      009334 9F               [ 1]  370 	ld	a, xl
      009335 A0 02            [ 1]  371 	sub	a, #0x02
      009337 26 04            [ 1]  372 	jrne	00165$
      009339 4C               [ 1]  373 	inc	a
      00933A 6B 02            [ 1]  374 	ld	(0x02, sp), a
      00933C C1                     375 	.byte 0xc1
      00933D                        376 00165$:
      00933D 0F 02            [ 1]  377 	clr	(0x02, sp)
      00933F                        378 00166$:
                                    379 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 235: else if (uartreg == 0x03)
      00933F 9F               [ 1]  380 	ld	a, xl
      009340 A0 03            [ 1]  381 	sub	a, #0x03
      009342 26 02            [ 1]  382 	jrne	00168$
      009344 4C               [ 1]  383 	inc	a
      009345 21                     384 	.byte 0x21
      009346                        385 00168$:
      009346 4F               [ 1]  386 	clr	a
      009347                        387 00169$:
                                    388 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 224: if (NewState != DISABLE)
      009347 0D 09            [ 1]  389 	tnz	(0x09, sp)
      009349 27 33            [ 1]  390 	jreq	00120$
                                    391 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 227: if (uartreg == 0x01)
      00934B 0D 03            [ 1]  392 	tnz	(0x03, sp)
      00934D 27 0A            [ 1]  393 	jreq	00108$
                                    394 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 229: UART2->CR1 |= itpos;
      00934F C6 52 44         [ 1]  395 	ld	a, 0x5244
      009352 1A 04            [ 1]  396 	or	a, (0x04, sp)
      009354 C7 52 44         [ 1]  397 	ld	0x5244, a
      009357 20 5D            [ 2]  398 	jra	00122$
      009359                        399 00108$:
                                    400 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 231: else if (uartreg == 0x02)
      009359 0D 02            [ 1]  401 	tnz	(0x02, sp)
      00935B 27 0A            [ 1]  402 	jreq	00105$
                                    403 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 233: UART2->CR2 |= itpos;
      00935D C6 52 45         [ 1]  404 	ld	a, 0x5245
      009360 1A 04            [ 1]  405 	or	a, (0x04, sp)
      009362 C7 52 45         [ 1]  406 	ld	0x5245, a
      009365 20 4F            [ 2]  407 	jra	00122$
      009367                        408 00105$:
                                    409 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 235: else if (uartreg == 0x03)
      009367 4D               [ 1]  410 	tnz	a
      009368 27 0A            [ 1]  411 	jreq	00102$
                                    412 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 237: UART2->CR4 |= itpos;
      00936A C6 52 47         [ 1]  413 	ld	a, 0x5247
      00936D 1A 04            [ 1]  414 	or	a, (0x04, sp)
      00936F C7 52 47         [ 1]  415 	ld	0x5247, a
      009372 20 42            [ 2]  416 	jra	00122$
      009374                        417 00102$:
                                    418 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 241: UART2->CR6 |= itpos;
      009374 C6 52 49         [ 1]  419 	ld	a, 0x5249
      009377 1A 04            [ 1]  420 	or	a, (0x04, sp)
      009379 C7 52 49         [ 1]  421 	ld	0x5249, a
      00937C 20 38            [ 2]  422 	jra	00122$
      00937E                        423 00120$:
                                    424 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 249: UART2->CR1 &= (uint8_t)(~itpos);
      00937E 88               [ 1]  425 	push	a
      00937F 7B 05            [ 1]  426 	ld	a, (0x05, sp)
      009381 43               [ 1]  427 	cpl	a
      009382 6B 02            [ 1]  428 	ld	(0x02, sp), a
      009384 84               [ 1]  429 	pop	a
                                    430 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 247: if (uartreg == 0x01)
      009385 0D 03            [ 1]  431 	tnz	(0x03, sp)
      009387 27 0A            [ 1]  432 	jreq	00117$
                                    433 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 249: UART2->CR1 &= (uint8_t)(~itpos);
      009389 C6 52 44         [ 1]  434 	ld	a, 0x5244
      00938C 14 01            [ 1]  435 	and	a, (0x01, sp)
      00938E C7 52 44         [ 1]  436 	ld	0x5244, a
      009391 20 23            [ 2]  437 	jra	00122$
      009393                        438 00117$:
                                    439 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 251: else if (uartreg == 0x02)
      009393 0D 02            [ 1]  440 	tnz	(0x02, sp)
      009395 27 0A            [ 1]  441 	jreq	00114$
                                    442 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 253: UART2->CR2 &= (uint8_t)(~itpos);
      009397 C6 52 45         [ 1]  443 	ld	a, 0x5245
      00939A 14 01            [ 1]  444 	and	a, (0x01, sp)
      00939C C7 52 45         [ 1]  445 	ld	0x5245, a
      00939F 20 15            [ 2]  446 	jra	00122$
      0093A1                        447 00114$:
                                    448 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 255: else if (uartreg == 0x03)
      0093A1 4D               [ 1]  449 	tnz	a
      0093A2 27 0A            [ 1]  450 	jreq	00111$
                                    451 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 257: UART2->CR4 &= (uint8_t)(~itpos);
      0093A4 C6 52 47         [ 1]  452 	ld	a, 0x5247
      0093A7 14 01            [ 1]  453 	and	a, (0x01, sp)
      0093A9 C7 52 47         [ 1]  454 	ld	0x5247, a
      0093AC 20 08            [ 2]  455 	jra	00122$
      0093AE                        456 00111$:
                                    457 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 261: UART2->CR6 &= (uint8_t)(~itpos);
      0093AE C6 52 49         [ 1]  458 	ld	a, 0x5249
      0093B1 14 01            [ 1]  459 	and	a, (0x01, sp)
      0093B3 C7 52 49         [ 1]  460 	ld	0x5249, a
      0093B6                        461 00122$:
                                    462 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 264: }
      0093B6 5B 04            [ 2]  463 	addw	sp, #4
      0093B8 81               [ 4]  464 	ret
                                    465 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 272: void UART2_IrDAConfig(UART2_IrDAMode_TypeDef UART2_IrDAMode)
                                    466 ;	-----------------------------------------
                                    467 ;	 function UART2_IrDAConfig
                                    468 ;	-----------------------------------------
      0093B9                        469 _UART2_IrDAConfig:
                                    470 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 278: UART2->CR5 |= UART2_CR5_IRLP;
      0093B9 C6 52 48         [ 1]  471 	ld	a, 0x5248
                                    472 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 276: if (UART2_IrDAMode != UART2_IRDAMODE_NORMAL)
      0093BC 0D 03            [ 1]  473 	tnz	(0x03, sp)
      0093BE 27 06            [ 1]  474 	jreq	00102$
                                    475 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 278: UART2->CR5 |= UART2_CR5_IRLP;
      0093C0 AA 04            [ 1]  476 	or	a, #0x04
      0093C2 C7 52 48         [ 1]  477 	ld	0x5248, a
      0093C5 81               [ 4]  478 	ret
      0093C6                        479 00102$:
                                    480 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 282: UART2->CR5 &= ((uint8_t)~UART2_CR5_IRLP);
      0093C6 A4 FB            [ 1]  481 	and	a, #0xfb
      0093C8 C7 52 48         [ 1]  482 	ld	0x5248, a
                                    483 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 284: }
      0093CB 81               [ 4]  484 	ret
                                    485 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 292: void UART2_IrDACmd(FunctionalState NewState)
                                    486 ;	-----------------------------------------
                                    487 ;	 function UART2_IrDACmd
                                    488 ;	-----------------------------------------
      0093CC                        489 _UART2_IrDACmd:
                                    490 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 300: UART2->CR5 |= UART2_CR5_IREN;
      0093CC C6 52 48         [ 1]  491 	ld	a, 0x5248
                                    492 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 297: if (NewState != DISABLE)
      0093CF 0D 03            [ 1]  493 	tnz	(0x03, sp)
      0093D1 27 06            [ 1]  494 	jreq	00102$
                                    495 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 300: UART2->CR5 |= UART2_CR5_IREN;
      0093D3 AA 02            [ 1]  496 	or	a, #0x02
      0093D5 C7 52 48         [ 1]  497 	ld	0x5248, a
      0093D8 81               [ 4]  498 	ret
      0093D9                        499 00102$:
                                    500 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 305: UART2->CR5 &= ((uint8_t)~UART2_CR5_IREN);
      0093D9 A4 FD            [ 1]  501 	and	a, #0xfd
      0093DB C7 52 48         [ 1]  502 	ld	0x5248, a
                                    503 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 307: }
      0093DE 81               [ 4]  504 	ret
                                    505 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 316: void UART2_LINBreakDetectionConfig(UART2_LINBreakDetectionLength_TypeDef UART2_LINBreakDetectionLength)
                                    506 ;	-----------------------------------------
                                    507 ;	 function UART2_LINBreakDetectionConfig
                                    508 ;	-----------------------------------------
      0093DF                        509 _UART2_LINBreakDetectionConfig:
                                    510 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 323: UART2->CR4 |= UART2_CR4_LBDL;
      0093DF C6 52 47         [ 1]  511 	ld	a, 0x5247
                                    512 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 321: if (UART2_LINBreakDetectionLength != UART2_LINBREAKDETECTIONLENGTH_10BITS)
      0093E2 0D 03            [ 1]  513 	tnz	(0x03, sp)
      0093E4 27 06            [ 1]  514 	jreq	00102$
                                    515 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 323: UART2->CR4 |= UART2_CR4_LBDL;
      0093E6 AA 20            [ 1]  516 	or	a, #0x20
      0093E8 C7 52 47         [ 1]  517 	ld	0x5247, a
      0093EB 81               [ 4]  518 	ret
      0093EC                        519 00102$:
                                    520 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 327: UART2->CR4 &= ((uint8_t)~UART2_CR4_LBDL);
      0093EC A4 DF            [ 1]  521 	and	a, #0xdf
      0093EE C7 52 47         [ 1]  522 	ld	0x5247, a
                                    523 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 329: }
      0093F1 81               [ 4]  524 	ret
                                    525 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 341: void UART2_LINConfig(UART2_LinMode_TypeDef UART2_Mode, 
                                    526 ;	-----------------------------------------
                                    527 ;	 function UART2_LINConfig
                                    528 ;	-----------------------------------------
      0093F2                        529 _UART2_LINConfig:
                                    530 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 352: UART2->CR6 |=  UART2_CR6_LSLV;
      0093F2 C6 52 49         [ 1]  531 	ld	a, 0x5249
                                    532 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 350: if (UART2_Mode != UART2_LIN_MODE_MASTER)
      0093F5 0D 03            [ 1]  533 	tnz	(0x03, sp)
      0093F7 27 07            [ 1]  534 	jreq	00102$
                                    535 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 352: UART2->CR6 |=  UART2_CR6_LSLV;
      0093F9 AA 20            [ 1]  536 	or	a, #0x20
      0093FB C7 52 49         [ 1]  537 	ld	0x5249, a
      0093FE 20 05            [ 2]  538 	jra	00103$
      009400                        539 00102$:
                                    540 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 356: UART2->CR6 &= ((uint8_t)~UART2_CR6_LSLV);
      009400 A4 DF            [ 1]  541 	and	a, #0xdf
      009402 C7 52 49         [ 1]  542 	ld	0x5249, a
      009405                        543 00103$:
                                    544 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 352: UART2->CR6 |=  UART2_CR6_LSLV;
      009405 C6 52 49         [ 1]  545 	ld	a, 0x5249
                                    546 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 359: if (UART2_Autosync != UART2_LIN_AUTOSYNC_DISABLE)
      009408 0D 04            [ 1]  547 	tnz	(0x04, sp)
      00940A 27 07            [ 1]  548 	jreq	00105$
                                    549 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 361: UART2->CR6 |=  UART2_CR6_LASE ;
      00940C AA 10            [ 1]  550 	or	a, #0x10
      00940E C7 52 49         [ 1]  551 	ld	0x5249, a
      009411 20 05            [ 2]  552 	jra	00106$
      009413                        553 00105$:
                                    554 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 365: UART2->CR6 &= ((uint8_t)~ UART2_CR6_LASE );
      009413 A4 EF            [ 1]  555 	and	a, #0xef
      009415 C7 52 49         [ 1]  556 	ld	0x5249, a
      009418                        557 00106$:
                                    558 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 352: UART2->CR6 |=  UART2_CR6_LSLV;
      009418 C6 52 49         [ 1]  559 	ld	a, 0x5249
                                    560 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 368: if (UART2_DivUp != UART2_LIN_DIVUP_LBRR1)
      00941B 0D 05            [ 1]  561 	tnz	(0x05, sp)
      00941D 27 06            [ 1]  562 	jreq	00108$
                                    563 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 370: UART2->CR6 |=  UART2_CR6_LDUM;
      00941F AA 80            [ 1]  564 	or	a, #0x80
      009421 C7 52 49         [ 1]  565 	ld	0x5249, a
      009424 81               [ 4]  566 	ret
      009425                        567 00108$:
                                    568 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 374: UART2->CR6 &= ((uint8_t)~ UART2_CR6_LDUM);
      009425 A4 7F            [ 1]  569 	and	a, #0x7f
      009427 C7 52 49         [ 1]  570 	ld	0x5249, a
                                    571 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 376: }
      00942A 81               [ 4]  572 	ret
                                    573 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 384: void UART2_LINCmd(FunctionalState NewState)
                                    574 ;	-----------------------------------------
                                    575 ;	 function UART2_LINCmd
                                    576 ;	-----------------------------------------
      00942B                        577 _UART2_LINCmd:
                                    578 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 391: UART2->CR3 |= UART2_CR3_LINEN;
      00942B C6 52 46         [ 1]  579 	ld	a, 0x5246
                                    580 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 388: if (NewState != DISABLE)
      00942E 0D 03            [ 1]  581 	tnz	(0x03, sp)
      009430 27 06            [ 1]  582 	jreq	00102$
                                    583 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 391: UART2->CR3 |= UART2_CR3_LINEN;
      009432 AA 40            [ 1]  584 	or	a, #0x40
      009434 C7 52 46         [ 1]  585 	ld	0x5246, a
      009437 81               [ 4]  586 	ret
      009438                        587 00102$:
                                    588 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 396: UART2->CR3 &= ((uint8_t)~UART2_CR3_LINEN);
      009438 A4 BF            [ 1]  589 	and	a, #0xbf
      00943A C7 52 46         [ 1]  590 	ld	0x5246, a
                                    591 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 398: }
      00943D 81               [ 4]  592 	ret
                                    593 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 406: void UART2_SmartCardCmd(FunctionalState NewState)
                                    594 ;	-----------------------------------------
                                    595 ;	 function UART2_SmartCardCmd
                                    596 ;	-----------------------------------------
      00943E                        597 _UART2_SmartCardCmd:
                                    598 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 414: UART2->CR5 |= UART2_CR5_SCEN;
      00943E C6 52 48         [ 1]  599 	ld	a, 0x5248
                                    600 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 411: if (NewState != DISABLE)
      009441 0D 03            [ 1]  601 	tnz	(0x03, sp)
      009443 27 06            [ 1]  602 	jreq	00102$
                                    603 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 414: UART2->CR5 |= UART2_CR5_SCEN;
      009445 AA 20            [ 1]  604 	or	a, #0x20
      009447 C7 52 48         [ 1]  605 	ld	0x5248, a
      00944A 81               [ 4]  606 	ret
      00944B                        607 00102$:
                                    608 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 419: UART2->CR5 &= ((uint8_t)(~UART2_CR5_SCEN));
      00944B A4 DF            [ 1]  609 	and	a, #0xdf
      00944D C7 52 48         [ 1]  610 	ld	0x5248, a
                                    611 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 421: }
      009450 81               [ 4]  612 	ret
                                    613 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 429: void UART2_SmartCardNACKCmd(FunctionalState NewState)
                                    614 ;	-----------------------------------------
                                    615 ;	 function UART2_SmartCardNACKCmd
                                    616 ;	-----------------------------------------
      009451                        617 _UART2_SmartCardNACKCmd:
                                    618 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 437: UART2->CR5 |= UART2_CR5_NACK;
      009451 C6 52 48         [ 1]  619 	ld	a, 0x5248
                                    620 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 434: if (NewState != DISABLE)
      009454 0D 03            [ 1]  621 	tnz	(0x03, sp)
      009456 27 06            [ 1]  622 	jreq	00102$
                                    623 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 437: UART2->CR5 |= UART2_CR5_NACK;
      009458 AA 10            [ 1]  624 	or	a, #0x10
      00945A C7 52 48         [ 1]  625 	ld	0x5248, a
      00945D 81               [ 4]  626 	ret
      00945E                        627 00102$:
                                    628 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 442: UART2->CR5 &= ((uint8_t)~(UART2_CR5_NACK));
      00945E A4 EF            [ 1]  629 	and	a, #0xef
      009460 C7 52 48         [ 1]  630 	ld	0x5248, a
                                    631 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 444: }
      009463 81               [ 4]  632 	ret
                                    633 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 452: void UART2_WakeUpConfig(UART2_WakeUp_TypeDef UART2_WakeUp)
                                    634 ;	-----------------------------------------
                                    635 ;	 function UART2_WakeUpConfig
                                    636 ;	-----------------------------------------
      009464                        637 _UART2_WakeUpConfig:
                                    638 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 456: UART2->CR1 &= ((uint8_t)~UART2_CR1_WAKE);
      009464 72 17 52 44      [ 1]  639 	bres	21060, #3
                                    640 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 457: UART2->CR1 |= (uint8_t)UART2_WakeUp;
      009468 C6 52 44         [ 1]  641 	ld	a, 0x5244
      00946B 1A 03            [ 1]  642 	or	a, (0x03, sp)
      00946D C7 52 44         [ 1]  643 	ld	0x5244, a
                                    644 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 458: }
      009470 81               [ 4]  645 	ret
                                    646 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 466: void UART2_ReceiverWakeUpCmd(FunctionalState NewState)
                                    647 ;	-----------------------------------------
                                    648 ;	 function UART2_ReceiverWakeUpCmd
                                    649 ;	-----------------------------------------
      009471                        650 _UART2_ReceiverWakeUpCmd:
                                    651 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 473: UART2->CR2 |= UART2_CR2_RWU;
      009471 C6 52 45         [ 1]  652 	ld	a, 0x5245
                                    653 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 470: if (NewState != DISABLE)
      009474 0D 03            [ 1]  654 	tnz	(0x03, sp)
      009476 27 06            [ 1]  655 	jreq	00102$
                                    656 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 473: UART2->CR2 |= UART2_CR2_RWU;
      009478 AA 02            [ 1]  657 	or	a, #0x02
      00947A C7 52 45         [ 1]  658 	ld	0x5245, a
      00947D 81               [ 4]  659 	ret
      00947E                        660 00102$:
                                    661 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 478: UART2->CR2 &= ((uint8_t)~UART2_CR2_RWU);
      00947E A4 FD            [ 1]  662 	and	a, #0xfd
      009480 C7 52 45         [ 1]  663 	ld	0x5245, a
                                    664 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 480: }
      009483 81               [ 4]  665 	ret
                                    666 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 487: uint8_t UART2_ReceiveData8(void)
                                    667 ;	-----------------------------------------
                                    668 ;	 function UART2_ReceiveData8
                                    669 ;	-----------------------------------------
      009484                        670 _UART2_ReceiveData8:
                                    671 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 489: return ((uint8_t)UART2->DR);
      009484 C6 52 41         [ 1]  672 	ld	a, 0x5241
                                    673 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 490: }
      009487 81               [ 4]  674 	ret
                                    675 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 497: uint16_t UART2_ReceiveData9(void)
                                    676 ;	-----------------------------------------
                                    677 ;	 function UART2_ReceiveData9
                                    678 ;	-----------------------------------------
      009488                        679 _UART2_ReceiveData9:
      009488 52 02            [ 2]  680 	sub	sp, #2
                                    681 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 501: temp = ((uint16_t)(((uint16_t)((uint16_t)UART2->CR1 & (uint16_t)UART2_CR1_R8)) << 1));
      00948A C6 52 44         [ 1]  682 	ld	a, 0x5244
      00948D A4 80            [ 1]  683 	and	a, #0x80
      00948F 97               [ 1]  684 	ld	xl, a
      009490 4F               [ 1]  685 	clr	a
      009491 95               [ 1]  686 	ld	xh, a
      009492 58               [ 2]  687 	sllw	x
                                    688 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 503: return (uint16_t)((((uint16_t)UART2->DR) | temp) & ((uint16_t)0x01FF));
      009493 C6 52 41         [ 1]  689 	ld	a, 0x5241
      009496 6B 02            [ 1]  690 	ld	(0x02, sp), a
      009498 0F 01            [ 1]  691 	clr	(0x01, sp)
      00949A 9F               [ 1]  692 	ld	a, xl
      00949B 1A 02            [ 1]  693 	or	a, (0x02, sp)
      00949D 02               [ 1]  694 	rlwa	x
      00949E 1A 01            [ 1]  695 	or	a, (0x01, sp)
      0094A0 A4 01            [ 1]  696 	and	a, #0x01
      0094A2 95               [ 1]  697 	ld	xh, a
                                    698 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 504: }
      0094A3 5B 02            [ 2]  699 	addw	sp, #2
      0094A5 81               [ 4]  700 	ret
                                    701 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 511: void UART2_SendData8(uint8_t Data)
                                    702 ;	-----------------------------------------
                                    703 ;	 function UART2_SendData8
                                    704 ;	-----------------------------------------
      0094A6                        705 _UART2_SendData8:
                                    706 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 514: UART2->DR = Data;
      0094A6 AE 52 41         [ 2]  707 	ldw	x, #0x5241
      0094A9 7B 03            [ 1]  708 	ld	a, (0x03, sp)
      0094AB F7               [ 1]  709 	ld	(x), a
                                    710 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 515: }
      0094AC 81               [ 4]  711 	ret
                                    712 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 522: void UART2_SendData9(uint16_t Data)
                                    713 ;	-----------------------------------------
                                    714 ;	 function UART2_SendData9
                                    715 ;	-----------------------------------------
      0094AD                        716 _UART2_SendData9:
      0094AD 88               [ 1]  717 	push	a
                                    718 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 525: UART2->CR1 &= ((uint8_t)~UART2_CR1_T8);                  
      0094AE 72 1D 52 44      [ 1]  719 	bres	21060, #6
                                    720 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 528: UART2->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART2_CR1_T8); 
      0094B2 C6 52 44         [ 1]  721 	ld	a, 0x5244
      0094B5 6B 01            [ 1]  722 	ld	(0x01, sp), a
      0094B7 1E 04            [ 2]  723 	ldw	x, (0x04, sp)
      0094B9 54               [ 2]  724 	srlw	x
      0094BA 54               [ 2]  725 	srlw	x
      0094BB 9F               [ 1]  726 	ld	a, xl
      0094BC A4 40            [ 1]  727 	and	a, #0x40
      0094BE 1A 01            [ 1]  728 	or	a, (0x01, sp)
      0094C0 C7 52 44         [ 1]  729 	ld	0x5244, a
                                    730 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 531: UART2->DR   = (uint8_t)(Data);                    
      0094C3 7B 05            [ 1]  731 	ld	a, (0x05, sp)
      0094C5 C7 52 41         [ 1]  732 	ld	0x5241, a
                                    733 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 532: }
      0094C8 84               [ 1]  734 	pop	a
      0094C9 81               [ 4]  735 	ret
                                    736 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 539: void UART2_SendBreak(void)
                                    737 ;	-----------------------------------------
                                    738 ;	 function UART2_SendBreak
                                    739 ;	-----------------------------------------
      0094CA                        740 _UART2_SendBreak:
                                    741 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 541: UART2->CR2 |= UART2_CR2_SBK;
      0094CA 72 10 52 45      [ 1]  742 	bset	21061, #0
                                    743 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 542: }
      0094CE 81               [ 4]  744 	ret
                                    745 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 549: void UART2_SetAddress(uint8_t UART2_Address)
                                    746 ;	-----------------------------------------
                                    747 ;	 function UART2_SetAddress
                                    748 ;	-----------------------------------------
      0094CF                        749 _UART2_SetAddress:
                                    750 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 555: UART2->CR4 &= ((uint8_t)~UART2_CR4_ADD);
      0094CF C6 52 47         [ 1]  751 	ld	a, 0x5247
      0094D2 A4 F0            [ 1]  752 	and	a, #0xf0
      0094D4 C7 52 47         [ 1]  753 	ld	0x5247, a
                                    754 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 557: UART2->CR4 |= UART2_Address;
      0094D7 C6 52 47         [ 1]  755 	ld	a, 0x5247
      0094DA 1A 03            [ 1]  756 	or	a, (0x03, sp)
      0094DC C7 52 47         [ 1]  757 	ld	0x5247, a
                                    758 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 558: }
      0094DF 81               [ 4]  759 	ret
                                    760 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 566: void UART2_SetGuardTime(uint8_t UART2_GuardTime)
                                    761 ;	-----------------------------------------
                                    762 ;	 function UART2_SetGuardTime
                                    763 ;	-----------------------------------------
      0094E0                        764 _UART2_SetGuardTime:
                                    765 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 569: UART2->GTR = UART2_GuardTime;
      0094E0 AE 52 4A         [ 2]  766 	ldw	x, #0x524a
      0094E3 7B 03            [ 1]  767 	ld	a, (0x03, sp)
      0094E5 F7               [ 1]  768 	ld	(x), a
                                    769 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 570: }
      0094E6 81               [ 4]  770 	ret
                                    771 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 594: void UART2_SetPrescaler(uint8_t UART2_Prescaler)
                                    772 ;	-----------------------------------------
                                    773 ;	 function UART2_SetPrescaler
                                    774 ;	-----------------------------------------
      0094E7                        775 _UART2_SetPrescaler:
                                    776 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 597: UART2->PSCR = UART2_Prescaler;
      0094E7 AE 52 4B         [ 2]  777 	ldw	x, #0x524b
      0094EA 7B 03            [ 1]  778 	ld	a, (0x03, sp)
      0094EC F7               [ 1]  779 	ld	(x), a
                                    780 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 598: }
      0094ED 81               [ 4]  781 	ret
                                    782 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 606: FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
                                    783 ;	-----------------------------------------
                                    784 ;	 function UART2_GetFlagStatus
                                    785 ;	-----------------------------------------
      0094EE                        786 _UART2_GetFlagStatus:
      0094EE 88               [ 1]  787 	push	a
                                    788 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 616: if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
      0094EF 7B 05            [ 1]  789 	ld	a, (0x05, sp)
      0094F1 6B 01            [ 1]  790 	ld	(0x01, sp), a
                                    791 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 614: if (UART2_FLAG == UART2_FLAG_LBDF)
      0094F3 1E 04            [ 2]  792 	ldw	x, (0x04, sp)
      0094F5 A3 02 10         [ 2]  793 	cpw	x, #0x0210
      0094F8 26 0E            [ 1]  794 	jrne	00121$
                                    795 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 616: if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
      0094FA C6 52 47         [ 1]  796 	ld	a, 0x5247
      0094FD 14 01            [ 1]  797 	and	a, (0x01, sp)
      0094FF 27 04            [ 1]  798 	jreq	00102$
                                    799 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 619: status = SET;
      009501 A6 01            [ 1]  800 	ld	a, #0x01
      009503 20 3F            [ 2]  801 	jra	00122$
      009505                        802 00102$:
                                    803 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 624: status = RESET;
      009505 4F               [ 1]  804 	clr	a
      009506 20 3C            [ 2]  805 	jra	00122$
      009508                        806 00121$:
                                    807 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 627: else if (UART2_FLAG == UART2_FLAG_SBK)
      009508 1E 04            [ 2]  808 	ldw	x, (0x04, sp)
      00950A A3 01 01         [ 2]  809 	cpw	x, #0x0101
      00950D 26 0E            [ 1]  810 	jrne	00118$
                                    811 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 629: if ((UART2->CR2 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
      00950F C6 52 45         [ 1]  812 	ld	a, 0x5245
      009512 14 01            [ 1]  813 	and	a, (0x01, sp)
      009514 27 04            [ 1]  814 	jreq	00105$
                                    815 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 632: status = SET;
      009516 A6 01            [ 1]  816 	ld	a, #0x01
      009518 20 2A            [ 2]  817 	jra	00122$
      00951A                        818 00105$:
                                    819 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 637: status = RESET;
      00951A 4F               [ 1]  820 	clr	a
      00951B 20 27            [ 2]  821 	jra	00122$
      00951D                        822 00118$:
                                    823 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 640: else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
      00951D 1E 04            [ 2]  824 	ldw	x, (0x04, sp)
      00951F A3 03 02         [ 2]  825 	cpw	x, #0x0302
      009522 27 07            [ 1]  826 	jreq	00113$
      009524 1E 04            [ 2]  827 	ldw	x, (0x04, sp)
      009526 A3 03 01         [ 2]  828 	cpw	x, #0x0301
      009529 26 0E            [ 1]  829 	jrne	00114$
      00952B                        830 00113$:
                                    831 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 642: if ((UART2->CR6 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
      00952B C6 52 49         [ 1]  832 	ld	a, 0x5249
      00952E 14 01            [ 1]  833 	and	a, (0x01, sp)
      009530 27 04            [ 1]  834 	jreq	00108$
                                    835 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 645: status = SET;
      009532 A6 01            [ 1]  836 	ld	a, #0x01
      009534 20 0E            [ 2]  837 	jra	00122$
      009536                        838 00108$:
                                    839 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 650: status = RESET;
      009536 4F               [ 1]  840 	clr	a
      009537 20 0B            [ 2]  841 	jra	00122$
      009539                        842 00114$:
                                    843 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 655: if ((UART2->SR & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
      009539 C6 52 40         [ 1]  844 	ld	a, 0x5240
      00953C 14 01            [ 1]  845 	and	a, (0x01, sp)
      00953E 27 03            [ 1]  846 	jreq	00111$
                                    847 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 658: status = SET;
      009540 A6 01            [ 1]  848 	ld	a, #0x01
                                    849 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 663: status = RESET;
      009542 21                     850 	.byte 0x21
      009543                        851 00111$:
      009543 4F               [ 1]  852 	clr	a
      009544                        853 00122$:
                                    854 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 668: return  status;
                                    855 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 669: }
      009544 5B 01            [ 2]  856 	addw	sp, #1
      009546 81               [ 4]  857 	ret
                                    858 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 699: void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)
                                    859 ;	-----------------------------------------
                                    860 ;	 function UART2_ClearFlag
                                    861 ;	-----------------------------------------
      009547                        862 _UART2_ClearFlag:
                                    863 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 704: if (UART2_FLAG == UART2_FLAG_RXNE)
      009547 1E 03            [ 2]  864 	ldw	x, (0x03, sp)
      009549 A3 00 20         [ 2]  865 	cpw	x, #0x0020
      00954C 26 05            [ 1]  866 	jrne	00108$
                                    867 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 706: UART2->SR = (uint8_t)~(UART2_SR_RXNE);
      00954E 35 DF 52 40      [ 1]  868 	mov	0x5240+0, #0xdf
      009552 81               [ 4]  869 	ret
      009553                        870 00108$:
                                    871 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 709: else if (UART2_FLAG == UART2_FLAG_LBDF)
      009553 1E 03            [ 2]  872 	ldw	x, (0x03, sp)
      009555 A3 02 10         [ 2]  873 	cpw	x, #0x0210
      009558 26 05            [ 1]  874 	jrne	00105$
                                    875 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 711: UART2->CR4 &= (uint8_t)(~UART2_CR4_LBDF);
      00955A 72 19 52 47      [ 1]  876 	bres	21063, #4
      00955E 81               [ 4]  877 	ret
      00955F                        878 00105$:
                                    879 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 716: UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
      00955F C6 52 49         [ 1]  880 	ld	a, 0x5249
                                    881 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 714: else if (UART2_FLAG == UART2_FLAG_LHDF)
      009562 1E 03            [ 2]  882 	ldw	x, (0x03, sp)
      009564 A3 03 02         [ 2]  883 	cpw	x, #0x0302
      009567 26 06            [ 1]  884 	jrne	00102$
                                    885 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 716: UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
      009569 A4 FD            [ 1]  886 	and	a, #0xfd
      00956B C7 52 49         [ 1]  887 	ld	0x5249, a
      00956E 81               [ 4]  888 	ret
      00956F                        889 00102$:
                                    890 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 721: UART2->CR6 &= (uint8_t)(~UART2_CR6_LSF);
      00956F A4 FE            [ 1]  891 	and	a, #0xfe
      009571 C7 52 49         [ 1]  892 	ld	0x5249, a
                                    893 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 723: }
      009574 81               [ 4]  894 	ret
                                    895 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 738: ITStatus UART2_GetITStatus(UART2_IT_TypeDef UART2_IT)
                                    896 ;	-----------------------------------------
                                    897 ;	 function UART2_GetITStatus
                                    898 ;	-----------------------------------------
      009575                        899 _UART2_GetITStatus:
      009575 52 02            [ 2]  900 	sub	sp, #2
                                    901 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 750: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
      009577 7B 06            [ 1]  902 	ld	a, (0x06, sp)
      009579 97               [ 1]  903 	ld	xl, a
      00957A A4 0F            [ 1]  904 	and	a, #0x0f
      00957C 88               [ 1]  905 	push	a
      00957D A6 01            [ 1]  906 	ld	a, #0x01
      00957F 6B 03            [ 1]  907 	ld	(0x03, sp), a
      009581 84               [ 1]  908 	pop	a
      009582 4D               [ 1]  909 	tnz	a
      009583 27 05            [ 1]  910 	jreq	00184$
      009585                        911 00183$:
      009585 08 02            [ 1]  912 	sll	(0x02, sp)
      009587 4A               [ 1]  913 	dec	a
      009588 26 FB            [ 1]  914 	jrne	00183$
      00958A                        915 00184$:
                                    916 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 752: itmask1 = (uint8_t)((uint8_t)UART2_IT >> (uint8_t)4);
      00958A 9F               [ 1]  917 	ld	a, xl
      00958B 4E               [ 1]  918 	swap	a
      00958C A4 0F            [ 1]  919 	and	a, #0x0f
                                    920 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 754: itmask2 = (uint8_t)((uint8_t)1 << itmask1);
      00958E 88               [ 1]  921 	push	a
      00958F A6 01            [ 1]  922 	ld	a, #0x01
      009591 6B 02            [ 1]  923 	ld	(0x02, sp), a
      009593 84               [ 1]  924 	pop	a
      009594 4D               [ 1]  925 	tnz	a
      009595 27 05            [ 1]  926 	jreq	00186$
      009597                        927 00185$:
      009597 08 01            [ 1]  928 	sll	(0x01, sp)
      009599 4A               [ 1]  929 	dec	a
      00959A 26 FB            [ 1]  930 	jrne	00185$
      00959C                        931 00186$:
                                    932 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 757: if (UART2_IT == UART2_IT_PE)
      00959C 1E 05            [ 2]  933 	ldw	x, (0x05, sp)
      00959E A3 01 00         [ 2]  934 	cpw	x, #0x0100
      0095A1 26 18            [ 1]  935 	jrne	00124$
                                    936 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 760: enablestatus = (uint8_t)((uint8_t)UART2->CR1 & itmask2);
      0095A3 C6 52 44         [ 1]  937 	ld	a, 0x5244
      0095A6 14 01            [ 1]  938 	and	a, (0x01, sp)
      0095A8 97               [ 1]  939 	ld	xl, a
                                    940 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 763: if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
      0095A9 C6 52 40         [ 1]  941 	ld	a, 0x5240
      0095AC 14 02            [ 1]  942 	and	a, (0x02, sp)
      0095AE 27 08            [ 1]  943 	jreq	00102$
      0095B0 9F               [ 1]  944 	ld	a, xl
      0095B1 4D               [ 1]  945 	tnz	a
      0095B2 27 04            [ 1]  946 	jreq	00102$
                                    947 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 766: pendingbitstatus = SET;
      0095B4 A6 01            [ 1]  948 	ld	a, #0x01
      0095B6 20 56            [ 2]  949 	jra	00125$
      0095B8                        950 00102$:
                                    951 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 771: pendingbitstatus = RESET;
      0095B8 4F               [ 1]  952 	clr	a
      0095B9 20 53            [ 2]  953 	jra	00125$
      0095BB                        954 00124$:
                                    955 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 774: else if (UART2_IT == UART2_IT_LBDF)
      0095BB 1E 05            [ 2]  956 	ldw	x, (0x05, sp)
      0095BD A3 03 46         [ 2]  957 	cpw	x, #0x0346
      0095C0 26 18            [ 1]  958 	jrne	00121$
                                    959 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 777: enablestatus = (uint8_t)((uint8_t)UART2->CR4 & itmask2);
      0095C2 C6 52 47         [ 1]  960 	ld	a, 0x5247
      0095C5 14 01            [ 1]  961 	and	a, (0x01, sp)
      0095C7 97               [ 1]  962 	ld	xl, a
                                    963 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 779: if (((UART2->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
      0095C8 C6 52 47         [ 1]  964 	ld	a, 0x5247
      0095CB 14 02            [ 1]  965 	and	a, (0x02, sp)
      0095CD 27 08            [ 1]  966 	jreq	00106$
      0095CF 9F               [ 1]  967 	ld	a, xl
      0095D0 4D               [ 1]  968 	tnz	a
      0095D1 27 04            [ 1]  969 	jreq	00106$
                                    970 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 782: pendingbitstatus = SET;
      0095D3 A6 01            [ 1]  971 	ld	a, #0x01
      0095D5 20 37            [ 2]  972 	jra	00125$
      0095D7                        973 00106$:
                                    974 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 787: pendingbitstatus = RESET;
      0095D7 4F               [ 1]  975 	clr	a
      0095D8 20 34            [ 2]  976 	jra	00125$
      0095DA                        977 00121$:
                                    978 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 790: else if (UART2_IT == UART2_IT_LHDF)
      0095DA 1E 05            [ 2]  979 	ldw	x, (0x05, sp)
      0095DC A3 04 12         [ 2]  980 	cpw	x, #0x0412
      0095DF 26 18            [ 1]  981 	jrne	00118$
                                    982 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 793: enablestatus = (uint8_t)((uint8_t)UART2->CR6 & itmask2);
      0095E1 C6 52 49         [ 1]  983 	ld	a, 0x5249
      0095E4 14 01            [ 1]  984 	and	a, (0x01, sp)
      0095E6 97               [ 1]  985 	ld	xl, a
                                    986 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 795: if (((UART2->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
      0095E7 C6 52 49         [ 1]  987 	ld	a, 0x5249
      0095EA 14 02            [ 1]  988 	and	a, (0x02, sp)
      0095EC 27 08            [ 1]  989 	jreq	00110$
      0095EE 9F               [ 1]  990 	ld	a, xl
      0095EF 4D               [ 1]  991 	tnz	a
      0095F0 27 04            [ 1]  992 	jreq	00110$
                                    993 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 798: pendingbitstatus = SET;
      0095F2 A6 01            [ 1]  994 	ld	a, #0x01
      0095F4 20 18            [ 2]  995 	jra	00125$
      0095F6                        996 00110$:
                                    997 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 803: pendingbitstatus = RESET;
      0095F6 4F               [ 1]  998 	clr	a
      0095F7 20 15            [ 2]  999 	jra	00125$
      0095F9                       1000 00118$:
                                   1001 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 809: enablestatus = (uint8_t)((uint8_t)UART2->CR2 & itmask2);
      0095F9 C6 52 45         [ 1] 1002 	ld	a, 0x5245
      0095FC 14 01            [ 1] 1003 	and	a, (0x01, sp)
      0095FE 97               [ 1] 1004 	ld	xl, a
                                   1005 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 811: if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
      0095FF C6 52 40         [ 1] 1006 	ld	a, 0x5240
      009602 14 02            [ 1] 1007 	and	a, (0x02, sp)
      009604 27 07            [ 1] 1008 	jreq	00114$
      009606 9F               [ 1] 1009 	ld	a, xl
      009607 4D               [ 1] 1010 	tnz	a
      009608 27 03            [ 1] 1011 	jreq	00114$
                                   1012 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 814: pendingbitstatus = SET;
      00960A A6 01            [ 1] 1013 	ld	a, #0x01
                                   1014 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 819: pendingbitstatus = RESET;
      00960C 21                    1015 	.byte 0x21
      00960D                       1016 00114$:
      00960D 4F               [ 1] 1017 	clr	a
      00960E                       1018 00125$:
                                   1019 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 823: return  pendingbitstatus;
                                   1020 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 824: }
      00960E 5B 02            [ 2] 1021 	addw	sp, #2
      009610 81               [ 4] 1022 	ret
                                   1023 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 852: void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)
                                   1024 ;	-----------------------------------------
                                   1025 ;	 function UART2_ClearITPendingBit
                                   1026 ;	-----------------------------------------
      009611                       1027 _UART2_ClearITPendingBit:
                                   1028 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 857: if (UART2_IT == UART2_IT_RXNE)
      009611 1E 03            [ 2] 1029 	ldw	x, (0x03, sp)
      009613 A3 02 55         [ 2] 1030 	cpw	x, #0x0255
      009616 26 05            [ 1] 1031 	jrne	00105$
                                   1032 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 859: UART2->SR = (uint8_t)~(UART2_SR_RXNE);
      009618 35 DF 52 40      [ 1] 1033 	mov	0x5240+0, #0xdf
      00961C 81               [ 4] 1034 	ret
      00961D                       1035 00105$:
                                   1036 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 862: else if (UART2_IT == UART2_IT_LBDF)
      00961D 1E 03            [ 2] 1037 	ldw	x, (0x03, sp)
      00961F A3 03 46         [ 2] 1038 	cpw	x, #0x0346
      009622 26 05            [ 1] 1039 	jrne	00102$
                                   1040 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 864: UART2->CR4 &= (uint8_t)~(UART2_CR4_LBDF);
      009624 72 19 52 47      [ 1] 1041 	bres	21063, #4
      009628 81               [ 4] 1042 	ret
      009629                       1043 00102$:
                                   1044 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 869: UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
      009629 72 13 52 49      [ 1] 1045 	bres	21065, #1
                                   1046 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 871: }
      00962D 81               [ 4] 1047 	ret
                                   1048 	.area CODE
                                   1049 	.area CONST
                                   1050 	.area INITIALIZER
                                   1051 	.area CABS (ABS)
