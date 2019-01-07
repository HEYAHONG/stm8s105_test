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
      009969                         78 _UART2_DeInit:
                                     79 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 57: (void) UART2->SR;
      009969 C6 52 40         [ 1]   80 	ld	a, 0x5240
                                     81 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 58: (void)UART2->DR;
      00996C C6 52 41         [ 1]   82 	ld	a, 0x5241
                                     83 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 60: UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*  Set UART2_BRR2 to reset value 0x00 */
      00996F 35 00 52 43      [ 1]   84 	mov	0x5243+0, #0x00
                                     85 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 61: UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*  Set UART2_BRR1 to reset value 0x00 */
      009973 35 00 52 42      [ 1]   86 	mov	0x5242+0, #0x00
                                     87 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 63: UART2->CR1 = UART2_CR1_RESET_VALUE; /*  Set UART2_CR1 to reset value 0x00  */
      009977 35 00 52 44      [ 1]   88 	mov	0x5244+0, #0x00
                                     89 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 64: UART2->CR2 = UART2_CR2_RESET_VALUE; /*  Set UART2_CR2 to reset value 0x00  */
      00997B 35 00 52 45      [ 1]   90 	mov	0x5245+0, #0x00
                                     91 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 65: UART2->CR3 = UART2_CR3_RESET_VALUE; /*  Set UART2_CR3 to reset value 0x00  */
      00997F 35 00 52 46      [ 1]   92 	mov	0x5246+0, #0x00
                                     93 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 66: UART2->CR4 = UART2_CR4_RESET_VALUE; /*  Set UART2_CR4 to reset value 0x00  */
      009983 35 00 52 47      [ 1]   94 	mov	0x5247+0, #0x00
                                     95 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 67: UART2->CR5 = UART2_CR5_RESET_VALUE; /*  Set UART2_CR5 to reset value 0x00  */
      009987 35 00 52 48      [ 1]   96 	mov	0x5248+0, #0x00
                                     97 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 68: UART2->CR6 = UART2_CR6_RESET_VALUE; /*  Set UART2_CR6 to reset value 0x00  */
      00998B 35 00 52 49      [ 1]   98 	mov	0x5249+0, #0x00
                                     99 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 69: }
      00998F 81               [ 4]  100 	ret
                                    101 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 85: void UART2_Init(uint32_t BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
                                    102 ;	-----------------------------------------
                                    103 ;	 function UART2_Init
                                    104 ;	-----------------------------------------
      009990                        105 _UART2_Init:
      009990 52 23            [ 2]  106 	sub	sp, #35
                                    107 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 99: UART2->CR1 &= (uint8_t)(~UART2_CR1_M);
      009992 72 19 52 44      [ 1]  108 	bres	21060, #4
                                    109 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 101: UART2->CR1 |= (uint8_t)WordLength; 
      009996 C6 52 44         [ 1]  110 	ld	a, 0x5244
      009999 1A 2A            [ 1]  111 	or	a, (0x2a, sp)
      00999B C7 52 44         [ 1]  112 	ld	0x5244, a
                                    113 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 104: UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
      00999E C6 52 46         [ 1]  114 	ld	a, 0x5246
      0099A1 A4 CF            [ 1]  115 	and	a, #0xcf
      0099A3 C7 52 46         [ 1]  116 	ld	0x5246, a
                                    117 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 106: UART2->CR3 |= (uint8_t)StopBits; 
      0099A6 C6 52 46         [ 1]  118 	ld	a, 0x5246
      0099A9 1A 2B            [ 1]  119 	or	a, (0x2b, sp)
      0099AB C7 52 46         [ 1]  120 	ld	0x5246, a
                                    121 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 109: UART2->CR1 &= (uint8_t)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));
      0099AE C6 52 44         [ 1]  122 	ld	a, 0x5244
      0099B1 A4 F9            [ 1]  123 	and	a, #0xf9
      0099B3 C7 52 44         [ 1]  124 	ld	0x5244, a
                                    125 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 111: UART2->CR1 |= (uint8_t)Parity;
      0099B6 C6 52 44         [ 1]  126 	ld	a, 0x5244
      0099B9 1A 2C            [ 1]  127 	or	a, (0x2c, sp)
      0099BB C7 52 44         [ 1]  128 	ld	0x5244, a
                                    129 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 114: UART2->BRR1 &= (uint8_t)(~UART2_BRR1_DIVM);
      0099BE C6 52 42         [ 1]  130 	ld	a, 0x5242
      0099C1 35 00 52 42      [ 1]  131 	mov	0x5242+0, #0x00
                                    132 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 116: UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVM);
      0099C5 C6 52 43         [ 1]  133 	ld	a, 0x5243
      0099C8 A4 0F            [ 1]  134 	and	a, #0x0f
      0099CA C7 52 43         [ 1]  135 	ld	0x5243, a
                                    136 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 118: UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVF);
      0099CD C6 52 43         [ 1]  137 	ld	a, 0x5243
      0099D0 A4 F0            [ 1]  138 	and	a, #0xf0
      0099D2 C7 52 43         [ 1]  139 	ld	0x5243, a
                                    140 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 121: BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
      0099D5 CD A0 8E         [ 4]  141 	call	_CLK_GetClockFreq
      0099D8 1F 19            [ 2]  142 	ldw	(0x19, sp), x
      0099DA 1E 26            [ 2]  143 	ldw	x, (0x26, sp)
      0099DC 1F 13            [ 2]  144 	ldw	(0x13, sp), x
      0099DE 1E 28            [ 2]  145 	ldw	x, (0x28, sp)
      0099E0 A6 04            [ 1]  146 	ld	a, #0x04
      0099E2                        147 00127$:
      0099E2 58               [ 2]  148 	sllw	x
      0099E3 09 14            [ 1]  149 	rlc	(0x14, sp)
      0099E5 09 13            [ 1]  150 	rlc	(0x13, sp)
      0099E7 4A               [ 1]  151 	dec	a
      0099E8 26 F8            [ 1]  152 	jrne	00127$
      0099EA 1F 15            [ 2]  153 	ldw	(0x15, sp), x
      0099EC 89               [ 2]  154 	pushw	x
      0099ED 1E 15            [ 2]  155 	ldw	x, (0x15, sp)
      0099EF 89               [ 2]  156 	pushw	x
      0099F0 1E 1D            [ 2]  157 	ldw	x, (0x1d, sp)
      0099F2 89               [ 2]  158 	pushw	x
      0099F3 90 89            [ 2]  159 	pushw	y
      0099F5 CD A2 20         [ 4]  160 	call	__divulong
      0099F8 5B 08            [ 2]  161 	addw	sp, #8
      0099FA 1F 21            [ 2]  162 	ldw	(0x21, sp), x
      0099FC 17 1F            [ 2]  163 	ldw	(0x1f, sp), y
      0099FE 16 20            [ 2]  164 	ldw	y, (0x20, sp)
      009A00 17 20            [ 2]  165 	ldw	(0x20, sp), y
                                    166 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 122: BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
      009A02 CD A0 8E         [ 4]  167 	call	_CLK_GetClockFreq
      009A05 1F 11            [ 2]  168 	ldw	(0x11, sp), x
      009A07 17 0F            [ 2]  169 	ldw	(0x0f, sp), y
      009A09 1E 11            [ 2]  170 	ldw	x, (0x11, sp)
      009A0B 89               [ 2]  171 	pushw	x
      009A0C 1E 11            [ 2]  172 	ldw	x, (0x11, sp)
      009A0E 89               [ 2]  173 	pushw	x
      009A0F 4B 64            [ 1]  174 	push	#0x64
      009A11 5F               [ 1]  175 	clrw	x
      009A12 89               [ 2]  176 	pushw	x
      009A13 4B 00            [ 1]  177 	push	#0x00
      009A15 CD A2 D1         [ 4]  178 	call	__mullong
      009A18 5B 08            [ 2]  179 	addw	sp, #8
      009A1A 1F 0D            [ 2]  180 	ldw	(0x0d, sp), x
      009A1C 1E 15            [ 2]  181 	ldw	x, (0x15, sp)
      009A1E 89               [ 2]  182 	pushw	x
      009A1F 1E 15            [ 2]  183 	ldw	x, (0x15, sp)
      009A21 89               [ 2]  184 	pushw	x
      009A22 1E 11            [ 2]  185 	ldw	x, (0x11, sp)
      009A24 89               [ 2]  186 	pushw	x
      009A25 90 89            [ 2]  187 	pushw	y
      009A27 CD A2 20         [ 4]  188 	call	__divulong
      009A2A 5B 08            [ 2]  189 	addw	sp, #8
      009A2C 1F 1D            [ 2]  190 	ldw	(0x1d, sp), x
      009A2E 17 1B            [ 2]  191 	ldw	(0x1b, sp), y
                                    192 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 126: BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
      009A30 1E 21            [ 2]  193 	ldw	x, (0x21, sp)
      009A32 89               [ 2]  194 	pushw	x
      009A33 1E 21            [ 2]  195 	ldw	x, (0x21, sp)
      009A35 89               [ 2]  196 	pushw	x
      009A36 4B 64            [ 1]  197 	push	#0x64
      009A38 5F               [ 1]  198 	clrw	x
      009A39 89               [ 2]  199 	pushw	x
      009A3A 4B 00            [ 1]  200 	push	#0x00
      009A3C CD A2 D1         [ 4]  201 	call	__mullong
      009A3F 5B 08            [ 2]  202 	addw	sp, #8
      009A41 1F 09            [ 2]  203 	ldw	(0x09, sp), x
      009A43 17 07            [ 2]  204 	ldw	(0x07, sp), y
      009A45 1E 1D            [ 2]  205 	ldw	x, (0x1d, sp)
      009A47 72 F0 09         [ 2]  206 	subw	x, (0x09, sp)
      009A4A 1F 05            [ 2]  207 	ldw	(0x05, sp), x
      009A4C 7B 1C            [ 1]  208 	ld	a, (0x1c, sp)
      009A4E 12 08            [ 1]  209 	sbc	a, (0x08, sp)
      009A50 6B 04            [ 1]  210 	ld	(0x04, sp), a
      009A52 7B 1B            [ 1]  211 	ld	a, (0x1b, sp)
      009A54 12 07            [ 1]  212 	sbc	a, (0x07, sp)
      009A56 6B 03            [ 1]  213 	ld	(0x03, sp), a
      009A58 1E 05            [ 2]  214 	ldw	x, (0x05, sp)
      009A5A 16 03            [ 2]  215 	ldw	y, (0x03, sp)
      009A5C A6 04            [ 1]  216 	ld	a, #0x04
      009A5E                        217 00129$:
      009A5E 58               [ 2]  218 	sllw	x
      009A5F 90 59            [ 2]  219 	rlcw	y
      009A61 4A               [ 1]  220 	dec	a
      009A62 26 FA            [ 1]  221 	jrne	00129$
      009A64 4B 64            [ 1]  222 	push	#0x64
      009A66 4B 00            [ 1]  223 	push	#0x00
      009A68 4B 00            [ 1]  224 	push	#0x00
      009A6A 4B 00            [ 1]  225 	push	#0x00
      009A6C 89               [ 2]  226 	pushw	x
      009A6D 90 89            [ 2]  227 	pushw	y
      009A6F CD A2 20         [ 4]  228 	call	__divulong
      009A72 5B 08            [ 2]  229 	addw	sp, #8
      009A74 9F               [ 1]  230 	ld	a, xl
      009A75 A4 0F            [ 1]  231 	and	a, #0x0f
      009A77 6B 23            [ 1]  232 	ld	(0x23, sp), a
                                    233 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 128: BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
      009A79 1E 21            [ 2]  234 	ldw	x, (0x21, sp)
      009A7B A6 10            [ 1]  235 	ld	a, #0x10
      009A7D 62               [ 2]  236 	div	x, a
      009A7E 9F               [ 1]  237 	ld	a, xl
      009A7F A4 F0            [ 1]  238 	and	a, #0xf0
                                    239 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 130: UART2->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
      009A81 1A 23            [ 1]  240 	or	a, (0x23, sp)
      009A83 C7 52 43         [ 1]  241 	ld	0x5243, a
                                    242 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 132: UART2->BRR1 = (uint8_t)BaudRate_Mantissa;           
      009A86 7B 22            [ 1]  243 	ld	a, (0x22, sp)
      009A88 C7 52 42         [ 1]  244 	ld	0x5242, a
                                    245 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 135: UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
      009A8B C6 52 45         [ 1]  246 	ld	a, 0x5245
      009A8E A4 F3            [ 1]  247 	and	a, #0xf3
      009A90 C7 52 45         [ 1]  248 	ld	0x5245, a
                                    249 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 137: UART2->CR3 &= (uint8_t)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL);
      009A93 C6 52 46         [ 1]  250 	ld	a, 0x5246
      009A96 A4 F8            [ 1]  251 	and	a, #0xf8
      009A98 C7 52 46         [ 1]  252 	ld	0x5246, a
                                    253 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 139: UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART2_CR3_CPOL | \
      009A9B C6 52 46         [ 1]  254 	ld	a, 0x5246
      009A9E 6B 02            [ 1]  255 	ld	(0x02, sp), a
      009AA0 7B 2D            [ 1]  256 	ld	a, (0x2d, sp)
      009AA2 A4 07            [ 1]  257 	and	a, #0x07
      009AA4 1A 02            [ 1]  258 	or	a, (0x02, sp)
      009AA6 C7 52 46         [ 1]  259 	ld	0x5246, a
                                    260 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 135: UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
      009AA9 C6 52 45         [ 1]  261 	ld	a, 0x5245
                                    262 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 142: if ((uint8_t)(Mode & UART2_MODE_TX_ENABLE))
      009AAC 88               [ 1]  263 	push	a
      009AAD 7B 2F            [ 1]  264 	ld	a, (0x2f, sp)
      009AAF A5 04            [ 1]  265 	bcp	a, #0x04
      009AB1 84               [ 1]  266 	pop	a
      009AB2 27 07            [ 1]  267 	jreq	00102$
                                    268 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 145: UART2->CR2 |= (uint8_t)UART2_CR2_TEN;
      009AB4 AA 08            [ 1]  269 	or	a, #0x08
      009AB6 C7 52 45         [ 1]  270 	ld	0x5245, a
      009AB9 20 05            [ 2]  271 	jra	00103$
      009ABB                        272 00102$:
                                    273 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 150: UART2->CR2 &= (uint8_t)(~UART2_CR2_TEN);
      009ABB A4 F7            [ 1]  274 	and	a, #0xf7
      009ABD C7 52 45         [ 1]  275 	ld	0x5245, a
      009AC0                        276 00103$:
                                    277 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 135: UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
      009AC0 C6 52 45         [ 1]  278 	ld	a, 0x5245
                                    279 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 152: if ((uint8_t)(Mode & UART2_MODE_RX_ENABLE))
      009AC3 88               [ 1]  280 	push	a
      009AC4 7B 2F            [ 1]  281 	ld	a, (0x2f, sp)
      009AC6 A5 08            [ 1]  282 	bcp	a, #0x08
      009AC8 84               [ 1]  283 	pop	a
      009AC9 27 07            [ 1]  284 	jreq	00105$
                                    285 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 155: UART2->CR2 |= (uint8_t)UART2_CR2_REN;
      009ACB AA 04            [ 1]  286 	or	a, #0x04
      009ACD C7 52 45         [ 1]  287 	ld	0x5245, a
      009AD0 20 05            [ 2]  288 	jra	00106$
      009AD2                        289 00105$:
                                    290 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 160: UART2->CR2 &= (uint8_t)(~UART2_CR2_REN);
      009AD2 A4 FB            [ 1]  291 	and	a, #0xfb
      009AD4 C7 52 45         [ 1]  292 	ld	0x5245, a
      009AD7                        293 00106$:
                                    294 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 104: UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
      009AD7 C6 52 46         [ 1]  295 	ld	a, 0x5246
                                    296 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 164: if ((uint8_t)(SyncMode & UART2_SYNCMODE_CLOCK_DISABLE))
      009ADA 0D 2D            [ 1]  297 	tnz	(0x2d, sp)
      009ADC 2A 07            [ 1]  298 	jrpl	00108$
                                    299 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 167: UART2->CR3 &= (uint8_t)(~UART2_CR3_CKEN); 
      009ADE A4 F7            [ 1]  300 	and	a, #0xf7
      009AE0 C7 52 46         [ 1]  301 	ld	0x5246, a
      009AE3 20 0D            [ 2]  302 	jra	00110$
      009AE5                        303 00108$:
                                    304 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 171: UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & UART2_CR3_CKEN);
      009AE5 88               [ 1]  305 	push	a
      009AE6 7B 2E            [ 1]  306 	ld	a, (0x2e, sp)
      009AE8 A4 08            [ 1]  307 	and	a, #0x08
      009AEA 6B 02            [ 1]  308 	ld	(0x02, sp), a
      009AEC 84               [ 1]  309 	pop	a
      009AED 1A 01            [ 1]  310 	or	a, (0x01, sp)
      009AEF C7 52 46         [ 1]  311 	ld	0x5246, a
      009AF2                        312 00110$:
                                    313 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 173: }
      009AF2 5B 23            [ 2]  314 	addw	sp, #35
      009AF4 81               [ 4]  315 	ret
                                    316 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 181: void UART2_Cmd(FunctionalState NewState)
                                    317 ;	-----------------------------------------
                                    318 ;	 function UART2_Cmd
                                    319 ;	-----------------------------------------
      009AF5                        320 _UART2_Cmd:
                                    321 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 186: UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
      009AF5 C6 52 44         [ 1]  322 	ld	a, 0x5244
                                    323 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 183: if (NewState != DISABLE)
      009AF8 0D 03            [ 1]  324 	tnz	(0x03, sp)
      009AFA 27 06            [ 1]  325 	jreq	00102$
                                    326 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 186: UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
      009AFC A4 DF            [ 1]  327 	and	a, #0xdf
      009AFE C7 52 44         [ 1]  328 	ld	0x5244, a
      009B01 81               [ 4]  329 	ret
      009B02                        330 00102$:
                                    331 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 191: UART2->CR1 |= UART2_CR1_UARTD; 
      009B02 AA 20            [ 1]  332 	or	a, #0x20
      009B04 C7 52 44         [ 1]  333 	ld	0x5244, a
                                    334 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 193: }
      009B07 81               [ 4]  335 	ret
                                    336 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 210: void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)
                                    337 ;	-----------------------------------------
                                    338 ;	 function UART2_ITConfig
                                    339 ;	-----------------------------------------
      009B08                        340 _UART2_ITConfig:
      009B08 52 04            [ 2]  341 	sub	sp, #4
                                    342 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 219: uartreg = (uint8_t)((uint16_t)UART2_IT >> 0x08);
      009B0A 7B 07            [ 1]  343 	ld	a, (0x07, sp)
      009B0C 97               [ 1]  344 	ld	xl, a
                                    345 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 222: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
      009B0D 7B 08            [ 1]  346 	ld	a, (0x08, sp)
      009B0F A4 0F            [ 1]  347 	and	a, #0x0f
      009B11 88               [ 1]  348 	push	a
      009B12 A6 01            [ 1]  349 	ld	a, #0x01
      009B14 6B 05            [ 1]  350 	ld	(0x05, sp), a
      009B16 84               [ 1]  351 	pop	a
      009B17 4D               [ 1]  352 	tnz	a
      009B18 27 05            [ 1]  353 	jreq	00160$
      009B1A                        354 00159$:
      009B1A 08 04            [ 1]  355 	sll	(0x04, sp)
      009B1C 4A               [ 1]  356 	dec	a
      009B1D 26 FB            [ 1]  357 	jrne	00159$
      009B1F                        358 00160$:
                                    359 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 227: if (uartreg == 0x01)
      009B1F 9F               [ 1]  360 	ld	a, xl
      009B20 4A               [ 1]  361 	dec	a
      009B21 26 05            [ 1]  362 	jrne	00162$
      009B23 A6 01            [ 1]  363 	ld	a, #0x01
      009B25 6B 03            [ 1]  364 	ld	(0x03, sp), a
      009B27 C1                     365 	.byte 0xc1
      009B28                        366 00162$:
      009B28 0F 03            [ 1]  367 	clr	(0x03, sp)
      009B2A                        368 00163$:
                                    369 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 231: else if (uartreg == 0x02)
      009B2A 9F               [ 1]  370 	ld	a, xl
      009B2B A0 02            [ 1]  371 	sub	a, #0x02
      009B2D 26 04            [ 1]  372 	jrne	00165$
      009B2F 4C               [ 1]  373 	inc	a
      009B30 6B 02            [ 1]  374 	ld	(0x02, sp), a
      009B32 C1                     375 	.byte 0xc1
      009B33                        376 00165$:
      009B33 0F 02            [ 1]  377 	clr	(0x02, sp)
      009B35                        378 00166$:
                                    379 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 235: else if (uartreg == 0x03)
      009B35 9F               [ 1]  380 	ld	a, xl
      009B36 A0 03            [ 1]  381 	sub	a, #0x03
      009B38 26 02            [ 1]  382 	jrne	00168$
      009B3A 4C               [ 1]  383 	inc	a
      009B3B 21                     384 	.byte 0x21
      009B3C                        385 00168$:
      009B3C 4F               [ 1]  386 	clr	a
      009B3D                        387 00169$:
                                    388 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 224: if (NewState != DISABLE)
      009B3D 0D 09            [ 1]  389 	tnz	(0x09, sp)
      009B3F 27 33            [ 1]  390 	jreq	00120$
                                    391 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 227: if (uartreg == 0x01)
      009B41 0D 03            [ 1]  392 	tnz	(0x03, sp)
      009B43 27 0A            [ 1]  393 	jreq	00108$
                                    394 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 229: UART2->CR1 |= itpos;
      009B45 C6 52 44         [ 1]  395 	ld	a, 0x5244
      009B48 1A 04            [ 1]  396 	or	a, (0x04, sp)
      009B4A C7 52 44         [ 1]  397 	ld	0x5244, a
      009B4D 20 5D            [ 2]  398 	jra	00122$
      009B4F                        399 00108$:
                                    400 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 231: else if (uartreg == 0x02)
      009B4F 0D 02            [ 1]  401 	tnz	(0x02, sp)
      009B51 27 0A            [ 1]  402 	jreq	00105$
                                    403 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 233: UART2->CR2 |= itpos;
      009B53 C6 52 45         [ 1]  404 	ld	a, 0x5245
      009B56 1A 04            [ 1]  405 	or	a, (0x04, sp)
      009B58 C7 52 45         [ 1]  406 	ld	0x5245, a
      009B5B 20 4F            [ 2]  407 	jra	00122$
      009B5D                        408 00105$:
                                    409 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 235: else if (uartreg == 0x03)
      009B5D 4D               [ 1]  410 	tnz	a
      009B5E 27 0A            [ 1]  411 	jreq	00102$
                                    412 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 237: UART2->CR4 |= itpos;
      009B60 C6 52 47         [ 1]  413 	ld	a, 0x5247
      009B63 1A 04            [ 1]  414 	or	a, (0x04, sp)
      009B65 C7 52 47         [ 1]  415 	ld	0x5247, a
      009B68 20 42            [ 2]  416 	jra	00122$
      009B6A                        417 00102$:
                                    418 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 241: UART2->CR6 |= itpos;
      009B6A C6 52 49         [ 1]  419 	ld	a, 0x5249
      009B6D 1A 04            [ 1]  420 	or	a, (0x04, sp)
      009B6F C7 52 49         [ 1]  421 	ld	0x5249, a
      009B72 20 38            [ 2]  422 	jra	00122$
      009B74                        423 00120$:
                                    424 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 249: UART2->CR1 &= (uint8_t)(~itpos);
      009B74 88               [ 1]  425 	push	a
      009B75 7B 05            [ 1]  426 	ld	a, (0x05, sp)
      009B77 43               [ 1]  427 	cpl	a
      009B78 6B 02            [ 1]  428 	ld	(0x02, sp), a
      009B7A 84               [ 1]  429 	pop	a
                                    430 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 247: if (uartreg == 0x01)
      009B7B 0D 03            [ 1]  431 	tnz	(0x03, sp)
      009B7D 27 0A            [ 1]  432 	jreq	00117$
                                    433 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 249: UART2->CR1 &= (uint8_t)(~itpos);
      009B7F C6 52 44         [ 1]  434 	ld	a, 0x5244
      009B82 14 01            [ 1]  435 	and	a, (0x01, sp)
      009B84 C7 52 44         [ 1]  436 	ld	0x5244, a
      009B87 20 23            [ 2]  437 	jra	00122$
      009B89                        438 00117$:
                                    439 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 251: else if (uartreg == 0x02)
      009B89 0D 02            [ 1]  440 	tnz	(0x02, sp)
      009B8B 27 0A            [ 1]  441 	jreq	00114$
                                    442 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 253: UART2->CR2 &= (uint8_t)(~itpos);
      009B8D C6 52 45         [ 1]  443 	ld	a, 0x5245
      009B90 14 01            [ 1]  444 	and	a, (0x01, sp)
      009B92 C7 52 45         [ 1]  445 	ld	0x5245, a
      009B95 20 15            [ 2]  446 	jra	00122$
      009B97                        447 00114$:
                                    448 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 255: else if (uartreg == 0x03)
      009B97 4D               [ 1]  449 	tnz	a
      009B98 27 0A            [ 1]  450 	jreq	00111$
                                    451 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 257: UART2->CR4 &= (uint8_t)(~itpos);
      009B9A C6 52 47         [ 1]  452 	ld	a, 0x5247
      009B9D 14 01            [ 1]  453 	and	a, (0x01, sp)
      009B9F C7 52 47         [ 1]  454 	ld	0x5247, a
      009BA2 20 08            [ 2]  455 	jra	00122$
      009BA4                        456 00111$:
                                    457 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 261: UART2->CR6 &= (uint8_t)(~itpos);
      009BA4 C6 52 49         [ 1]  458 	ld	a, 0x5249
      009BA7 14 01            [ 1]  459 	and	a, (0x01, sp)
      009BA9 C7 52 49         [ 1]  460 	ld	0x5249, a
      009BAC                        461 00122$:
                                    462 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 264: }
      009BAC 5B 04            [ 2]  463 	addw	sp, #4
      009BAE 81               [ 4]  464 	ret
                                    465 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 272: void UART2_IrDAConfig(UART2_IrDAMode_TypeDef UART2_IrDAMode)
                                    466 ;	-----------------------------------------
                                    467 ;	 function UART2_IrDAConfig
                                    468 ;	-----------------------------------------
      009BAF                        469 _UART2_IrDAConfig:
                                    470 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 278: UART2->CR5 |= UART2_CR5_IRLP;
      009BAF C6 52 48         [ 1]  471 	ld	a, 0x5248
                                    472 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 276: if (UART2_IrDAMode != UART2_IRDAMODE_NORMAL)
      009BB2 0D 03            [ 1]  473 	tnz	(0x03, sp)
      009BB4 27 06            [ 1]  474 	jreq	00102$
                                    475 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 278: UART2->CR5 |= UART2_CR5_IRLP;
      009BB6 AA 04            [ 1]  476 	or	a, #0x04
      009BB8 C7 52 48         [ 1]  477 	ld	0x5248, a
      009BBB 81               [ 4]  478 	ret
      009BBC                        479 00102$:
                                    480 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 282: UART2->CR5 &= ((uint8_t)~UART2_CR5_IRLP);
      009BBC A4 FB            [ 1]  481 	and	a, #0xfb
      009BBE C7 52 48         [ 1]  482 	ld	0x5248, a
                                    483 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 284: }
      009BC1 81               [ 4]  484 	ret
                                    485 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 292: void UART2_IrDACmd(FunctionalState NewState)
                                    486 ;	-----------------------------------------
                                    487 ;	 function UART2_IrDACmd
                                    488 ;	-----------------------------------------
      009BC2                        489 _UART2_IrDACmd:
                                    490 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 300: UART2->CR5 |= UART2_CR5_IREN;
      009BC2 C6 52 48         [ 1]  491 	ld	a, 0x5248
                                    492 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 297: if (NewState != DISABLE)
      009BC5 0D 03            [ 1]  493 	tnz	(0x03, sp)
      009BC7 27 06            [ 1]  494 	jreq	00102$
                                    495 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 300: UART2->CR5 |= UART2_CR5_IREN;
      009BC9 AA 02            [ 1]  496 	or	a, #0x02
      009BCB C7 52 48         [ 1]  497 	ld	0x5248, a
      009BCE 81               [ 4]  498 	ret
      009BCF                        499 00102$:
                                    500 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 305: UART2->CR5 &= ((uint8_t)~UART2_CR5_IREN);
      009BCF A4 FD            [ 1]  501 	and	a, #0xfd
      009BD1 C7 52 48         [ 1]  502 	ld	0x5248, a
                                    503 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 307: }
      009BD4 81               [ 4]  504 	ret
                                    505 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 316: void UART2_LINBreakDetectionConfig(UART2_LINBreakDetectionLength_TypeDef UART2_LINBreakDetectionLength)
                                    506 ;	-----------------------------------------
                                    507 ;	 function UART2_LINBreakDetectionConfig
                                    508 ;	-----------------------------------------
      009BD5                        509 _UART2_LINBreakDetectionConfig:
                                    510 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 323: UART2->CR4 |= UART2_CR4_LBDL;
      009BD5 C6 52 47         [ 1]  511 	ld	a, 0x5247
                                    512 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 321: if (UART2_LINBreakDetectionLength != UART2_LINBREAKDETECTIONLENGTH_10BITS)
      009BD8 0D 03            [ 1]  513 	tnz	(0x03, sp)
      009BDA 27 06            [ 1]  514 	jreq	00102$
                                    515 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 323: UART2->CR4 |= UART2_CR4_LBDL;
      009BDC AA 20            [ 1]  516 	or	a, #0x20
      009BDE C7 52 47         [ 1]  517 	ld	0x5247, a
      009BE1 81               [ 4]  518 	ret
      009BE2                        519 00102$:
                                    520 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 327: UART2->CR4 &= ((uint8_t)~UART2_CR4_LBDL);
      009BE2 A4 DF            [ 1]  521 	and	a, #0xdf
      009BE4 C7 52 47         [ 1]  522 	ld	0x5247, a
                                    523 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 329: }
      009BE7 81               [ 4]  524 	ret
                                    525 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 341: void UART2_LINConfig(UART2_LinMode_TypeDef UART2_Mode, 
                                    526 ;	-----------------------------------------
                                    527 ;	 function UART2_LINConfig
                                    528 ;	-----------------------------------------
      009BE8                        529 _UART2_LINConfig:
                                    530 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 352: UART2->CR6 |=  UART2_CR6_LSLV;
      009BE8 C6 52 49         [ 1]  531 	ld	a, 0x5249
                                    532 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 350: if (UART2_Mode != UART2_LIN_MODE_MASTER)
      009BEB 0D 03            [ 1]  533 	tnz	(0x03, sp)
      009BED 27 07            [ 1]  534 	jreq	00102$
                                    535 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 352: UART2->CR6 |=  UART2_CR6_LSLV;
      009BEF AA 20            [ 1]  536 	or	a, #0x20
      009BF1 C7 52 49         [ 1]  537 	ld	0x5249, a
      009BF4 20 05            [ 2]  538 	jra	00103$
      009BF6                        539 00102$:
                                    540 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 356: UART2->CR6 &= ((uint8_t)~UART2_CR6_LSLV);
      009BF6 A4 DF            [ 1]  541 	and	a, #0xdf
      009BF8 C7 52 49         [ 1]  542 	ld	0x5249, a
      009BFB                        543 00103$:
                                    544 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 352: UART2->CR6 |=  UART2_CR6_LSLV;
      009BFB C6 52 49         [ 1]  545 	ld	a, 0x5249
                                    546 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 359: if (UART2_Autosync != UART2_LIN_AUTOSYNC_DISABLE)
      009BFE 0D 04            [ 1]  547 	tnz	(0x04, sp)
      009C00 27 07            [ 1]  548 	jreq	00105$
                                    549 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 361: UART2->CR6 |=  UART2_CR6_LASE ;
      009C02 AA 10            [ 1]  550 	or	a, #0x10
      009C04 C7 52 49         [ 1]  551 	ld	0x5249, a
      009C07 20 05            [ 2]  552 	jra	00106$
      009C09                        553 00105$:
                                    554 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 365: UART2->CR6 &= ((uint8_t)~ UART2_CR6_LASE );
      009C09 A4 EF            [ 1]  555 	and	a, #0xef
      009C0B C7 52 49         [ 1]  556 	ld	0x5249, a
      009C0E                        557 00106$:
                                    558 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 352: UART2->CR6 |=  UART2_CR6_LSLV;
      009C0E C6 52 49         [ 1]  559 	ld	a, 0x5249
                                    560 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 368: if (UART2_DivUp != UART2_LIN_DIVUP_LBRR1)
      009C11 0D 05            [ 1]  561 	tnz	(0x05, sp)
      009C13 27 06            [ 1]  562 	jreq	00108$
                                    563 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 370: UART2->CR6 |=  UART2_CR6_LDUM;
      009C15 AA 80            [ 1]  564 	or	a, #0x80
      009C17 C7 52 49         [ 1]  565 	ld	0x5249, a
      009C1A 81               [ 4]  566 	ret
      009C1B                        567 00108$:
                                    568 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 374: UART2->CR6 &= ((uint8_t)~ UART2_CR6_LDUM);
      009C1B A4 7F            [ 1]  569 	and	a, #0x7f
      009C1D C7 52 49         [ 1]  570 	ld	0x5249, a
                                    571 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 376: }
      009C20 81               [ 4]  572 	ret
                                    573 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 384: void UART2_LINCmd(FunctionalState NewState)
                                    574 ;	-----------------------------------------
                                    575 ;	 function UART2_LINCmd
                                    576 ;	-----------------------------------------
      009C21                        577 _UART2_LINCmd:
                                    578 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 391: UART2->CR3 |= UART2_CR3_LINEN;
      009C21 C6 52 46         [ 1]  579 	ld	a, 0x5246
                                    580 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 388: if (NewState != DISABLE)
      009C24 0D 03            [ 1]  581 	tnz	(0x03, sp)
      009C26 27 06            [ 1]  582 	jreq	00102$
                                    583 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 391: UART2->CR3 |= UART2_CR3_LINEN;
      009C28 AA 40            [ 1]  584 	or	a, #0x40
      009C2A C7 52 46         [ 1]  585 	ld	0x5246, a
      009C2D 81               [ 4]  586 	ret
      009C2E                        587 00102$:
                                    588 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 396: UART2->CR3 &= ((uint8_t)~UART2_CR3_LINEN);
      009C2E A4 BF            [ 1]  589 	and	a, #0xbf
      009C30 C7 52 46         [ 1]  590 	ld	0x5246, a
                                    591 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 398: }
      009C33 81               [ 4]  592 	ret
                                    593 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 406: void UART2_SmartCardCmd(FunctionalState NewState)
                                    594 ;	-----------------------------------------
                                    595 ;	 function UART2_SmartCardCmd
                                    596 ;	-----------------------------------------
      009C34                        597 _UART2_SmartCardCmd:
                                    598 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 414: UART2->CR5 |= UART2_CR5_SCEN;
      009C34 C6 52 48         [ 1]  599 	ld	a, 0x5248
                                    600 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 411: if (NewState != DISABLE)
      009C37 0D 03            [ 1]  601 	tnz	(0x03, sp)
      009C39 27 06            [ 1]  602 	jreq	00102$
                                    603 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 414: UART2->CR5 |= UART2_CR5_SCEN;
      009C3B AA 20            [ 1]  604 	or	a, #0x20
      009C3D C7 52 48         [ 1]  605 	ld	0x5248, a
      009C40 81               [ 4]  606 	ret
      009C41                        607 00102$:
                                    608 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 419: UART2->CR5 &= ((uint8_t)(~UART2_CR5_SCEN));
      009C41 A4 DF            [ 1]  609 	and	a, #0xdf
      009C43 C7 52 48         [ 1]  610 	ld	0x5248, a
                                    611 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 421: }
      009C46 81               [ 4]  612 	ret
                                    613 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 429: void UART2_SmartCardNACKCmd(FunctionalState NewState)
                                    614 ;	-----------------------------------------
                                    615 ;	 function UART2_SmartCardNACKCmd
                                    616 ;	-----------------------------------------
      009C47                        617 _UART2_SmartCardNACKCmd:
                                    618 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 437: UART2->CR5 |= UART2_CR5_NACK;
      009C47 C6 52 48         [ 1]  619 	ld	a, 0x5248
                                    620 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 434: if (NewState != DISABLE)
      009C4A 0D 03            [ 1]  621 	tnz	(0x03, sp)
      009C4C 27 06            [ 1]  622 	jreq	00102$
                                    623 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 437: UART2->CR5 |= UART2_CR5_NACK;
      009C4E AA 10            [ 1]  624 	or	a, #0x10
      009C50 C7 52 48         [ 1]  625 	ld	0x5248, a
      009C53 81               [ 4]  626 	ret
      009C54                        627 00102$:
                                    628 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 442: UART2->CR5 &= ((uint8_t)~(UART2_CR5_NACK));
      009C54 A4 EF            [ 1]  629 	and	a, #0xef
      009C56 C7 52 48         [ 1]  630 	ld	0x5248, a
                                    631 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 444: }
      009C59 81               [ 4]  632 	ret
                                    633 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 452: void UART2_WakeUpConfig(UART2_WakeUp_TypeDef UART2_WakeUp)
                                    634 ;	-----------------------------------------
                                    635 ;	 function UART2_WakeUpConfig
                                    636 ;	-----------------------------------------
      009C5A                        637 _UART2_WakeUpConfig:
                                    638 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 456: UART2->CR1 &= ((uint8_t)~UART2_CR1_WAKE);
      009C5A 72 17 52 44      [ 1]  639 	bres	21060, #3
                                    640 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 457: UART2->CR1 |= (uint8_t)UART2_WakeUp;
      009C5E C6 52 44         [ 1]  641 	ld	a, 0x5244
      009C61 1A 03            [ 1]  642 	or	a, (0x03, sp)
      009C63 C7 52 44         [ 1]  643 	ld	0x5244, a
                                    644 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 458: }
      009C66 81               [ 4]  645 	ret
                                    646 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 466: void UART2_ReceiverWakeUpCmd(FunctionalState NewState)
                                    647 ;	-----------------------------------------
                                    648 ;	 function UART2_ReceiverWakeUpCmd
                                    649 ;	-----------------------------------------
      009C67                        650 _UART2_ReceiverWakeUpCmd:
                                    651 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 473: UART2->CR2 |= UART2_CR2_RWU;
      009C67 C6 52 45         [ 1]  652 	ld	a, 0x5245
                                    653 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 470: if (NewState != DISABLE)
      009C6A 0D 03            [ 1]  654 	tnz	(0x03, sp)
      009C6C 27 06            [ 1]  655 	jreq	00102$
                                    656 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 473: UART2->CR2 |= UART2_CR2_RWU;
      009C6E AA 02            [ 1]  657 	or	a, #0x02
      009C70 C7 52 45         [ 1]  658 	ld	0x5245, a
      009C73 81               [ 4]  659 	ret
      009C74                        660 00102$:
                                    661 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 478: UART2->CR2 &= ((uint8_t)~UART2_CR2_RWU);
      009C74 A4 FD            [ 1]  662 	and	a, #0xfd
      009C76 C7 52 45         [ 1]  663 	ld	0x5245, a
                                    664 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 480: }
      009C79 81               [ 4]  665 	ret
                                    666 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 487: uint8_t UART2_ReceiveData8(void)
                                    667 ;	-----------------------------------------
                                    668 ;	 function UART2_ReceiveData8
                                    669 ;	-----------------------------------------
      009C7A                        670 _UART2_ReceiveData8:
                                    671 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 489: return ((uint8_t)UART2->DR);
      009C7A C6 52 41         [ 1]  672 	ld	a, 0x5241
                                    673 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 490: }
      009C7D 81               [ 4]  674 	ret
                                    675 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 497: uint16_t UART2_ReceiveData9(void)
                                    676 ;	-----------------------------------------
                                    677 ;	 function UART2_ReceiveData9
                                    678 ;	-----------------------------------------
      009C7E                        679 _UART2_ReceiveData9:
      009C7E 52 02            [ 2]  680 	sub	sp, #2
                                    681 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 501: temp = ((uint16_t)(((uint16_t)((uint16_t)UART2->CR1 & (uint16_t)UART2_CR1_R8)) << 1));
      009C80 C6 52 44         [ 1]  682 	ld	a, 0x5244
      009C83 A4 80            [ 1]  683 	and	a, #0x80
      009C85 97               [ 1]  684 	ld	xl, a
      009C86 4F               [ 1]  685 	clr	a
      009C87 95               [ 1]  686 	ld	xh, a
      009C88 58               [ 2]  687 	sllw	x
                                    688 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 503: return (uint16_t)((((uint16_t)UART2->DR) | temp) & ((uint16_t)0x01FF));
      009C89 C6 52 41         [ 1]  689 	ld	a, 0x5241
      009C8C 6B 02            [ 1]  690 	ld	(0x02, sp), a
      009C8E 0F 01            [ 1]  691 	clr	(0x01, sp)
      009C90 9F               [ 1]  692 	ld	a, xl
      009C91 1A 02            [ 1]  693 	or	a, (0x02, sp)
      009C93 02               [ 1]  694 	rlwa	x
      009C94 1A 01            [ 1]  695 	or	a, (0x01, sp)
      009C96 A4 01            [ 1]  696 	and	a, #0x01
      009C98 95               [ 1]  697 	ld	xh, a
                                    698 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 504: }
      009C99 5B 02            [ 2]  699 	addw	sp, #2
      009C9B 81               [ 4]  700 	ret
                                    701 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 511: void UART2_SendData8(uint8_t Data)
                                    702 ;	-----------------------------------------
                                    703 ;	 function UART2_SendData8
                                    704 ;	-----------------------------------------
      009C9C                        705 _UART2_SendData8:
                                    706 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 514: UART2->DR = Data;
      009C9C AE 52 41         [ 2]  707 	ldw	x, #0x5241
      009C9F 7B 03            [ 1]  708 	ld	a, (0x03, sp)
      009CA1 F7               [ 1]  709 	ld	(x), a
                                    710 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 515: }
      009CA2 81               [ 4]  711 	ret
                                    712 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 522: void UART2_SendData9(uint16_t Data)
                                    713 ;	-----------------------------------------
                                    714 ;	 function UART2_SendData9
                                    715 ;	-----------------------------------------
      009CA3                        716 _UART2_SendData9:
      009CA3 88               [ 1]  717 	push	a
                                    718 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 525: UART2->CR1 &= ((uint8_t)~UART2_CR1_T8);                  
      009CA4 72 1D 52 44      [ 1]  719 	bres	21060, #6
                                    720 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 528: UART2->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART2_CR1_T8); 
      009CA8 C6 52 44         [ 1]  721 	ld	a, 0x5244
      009CAB 6B 01            [ 1]  722 	ld	(0x01, sp), a
      009CAD 1E 04            [ 2]  723 	ldw	x, (0x04, sp)
      009CAF 54               [ 2]  724 	srlw	x
      009CB0 54               [ 2]  725 	srlw	x
      009CB1 9F               [ 1]  726 	ld	a, xl
      009CB2 A4 40            [ 1]  727 	and	a, #0x40
      009CB4 1A 01            [ 1]  728 	or	a, (0x01, sp)
      009CB6 C7 52 44         [ 1]  729 	ld	0x5244, a
                                    730 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 531: UART2->DR   = (uint8_t)(Data);                    
      009CB9 7B 05            [ 1]  731 	ld	a, (0x05, sp)
      009CBB C7 52 41         [ 1]  732 	ld	0x5241, a
                                    733 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 532: }
      009CBE 84               [ 1]  734 	pop	a
      009CBF 81               [ 4]  735 	ret
                                    736 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 539: void UART2_SendBreak(void)
                                    737 ;	-----------------------------------------
                                    738 ;	 function UART2_SendBreak
                                    739 ;	-----------------------------------------
      009CC0                        740 _UART2_SendBreak:
                                    741 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 541: UART2->CR2 |= UART2_CR2_SBK;
      009CC0 72 10 52 45      [ 1]  742 	bset	21061, #0
                                    743 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 542: }
      009CC4 81               [ 4]  744 	ret
                                    745 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 549: void UART2_SetAddress(uint8_t UART2_Address)
                                    746 ;	-----------------------------------------
                                    747 ;	 function UART2_SetAddress
                                    748 ;	-----------------------------------------
      009CC5                        749 _UART2_SetAddress:
                                    750 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 555: UART2->CR4 &= ((uint8_t)~UART2_CR4_ADD);
      009CC5 C6 52 47         [ 1]  751 	ld	a, 0x5247
      009CC8 A4 F0            [ 1]  752 	and	a, #0xf0
      009CCA C7 52 47         [ 1]  753 	ld	0x5247, a
                                    754 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 557: UART2->CR4 |= UART2_Address;
      009CCD C6 52 47         [ 1]  755 	ld	a, 0x5247
      009CD0 1A 03            [ 1]  756 	or	a, (0x03, sp)
      009CD2 C7 52 47         [ 1]  757 	ld	0x5247, a
                                    758 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 558: }
      009CD5 81               [ 4]  759 	ret
                                    760 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 566: void UART2_SetGuardTime(uint8_t UART2_GuardTime)
                                    761 ;	-----------------------------------------
                                    762 ;	 function UART2_SetGuardTime
                                    763 ;	-----------------------------------------
      009CD6                        764 _UART2_SetGuardTime:
                                    765 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 569: UART2->GTR = UART2_GuardTime;
      009CD6 AE 52 4A         [ 2]  766 	ldw	x, #0x524a
      009CD9 7B 03            [ 1]  767 	ld	a, (0x03, sp)
      009CDB F7               [ 1]  768 	ld	(x), a
                                    769 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 570: }
      009CDC 81               [ 4]  770 	ret
                                    771 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 594: void UART2_SetPrescaler(uint8_t UART2_Prescaler)
                                    772 ;	-----------------------------------------
                                    773 ;	 function UART2_SetPrescaler
                                    774 ;	-----------------------------------------
      009CDD                        775 _UART2_SetPrescaler:
                                    776 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 597: UART2->PSCR = UART2_Prescaler;
      009CDD AE 52 4B         [ 2]  777 	ldw	x, #0x524b
      009CE0 7B 03            [ 1]  778 	ld	a, (0x03, sp)
      009CE2 F7               [ 1]  779 	ld	(x), a
                                    780 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 598: }
      009CE3 81               [ 4]  781 	ret
                                    782 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 606: FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
                                    783 ;	-----------------------------------------
                                    784 ;	 function UART2_GetFlagStatus
                                    785 ;	-----------------------------------------
      009CE4                        786 _UART2_GetFlagStatus:
      009CE4 88               [ 1]  787 	push	a
                                    788 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 616: if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
      009CE5 7B 05            [ 1]  789 	ld	a, (0x05, sp)
      009CE7 6B 01            [ 1]  790 	ld	(0x01, sp), a
                                    791 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 614: if (UART2_FLAG == UART2_FLAG_LBDF)
      009CE9 1E 04            [ 2]  792 	ldw	x, (0x04, sp)
      009CEB A3 02 10         [ 2]  793 	cpw	x, #0x0210
      009CEE 26 0E            [ 1]  794 	jrne	00121$
                                    795 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 616: if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
      009CF0 C6 52 47         [ 1]  796 	ld	a, 0x5247
      009CF3 14 01            [ 1]  797 	and	a, (0x01, sp)
      009CF5 27 04            [ 1]  798 	jreq	00102$
                                    799 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 619: status = SET;
      009CF7 A6 01            [ 1]  800 	ld	a, #0x01
      009CF9 20 3F            [ 2]  801 	jra	00122$
      009CFB                        802 00102$:
                                    803 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 624: status = RESET;
      009CFB 4F               [ 1]  804 	clr	a
      009CFC 20 3C            [ 2]  805 	jra	00122$
      009CFE                        806 00121$:
                                    807 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 627: else if (UART2_FLAG == UART2_FLAG_SBK)
      009CFE 1E 04            [ 2]  808 	ldw	x, (0x04, sp)
      009D00 A3 01 01         [ 2]  809 	cpw	x, #0x0101
      009D03 26 0E            [ 1]  810 	jrne	00118$
                                    811 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 629: if ((UART2->CR2 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
      009D05 C6 52 45         [ 1]  812 	ld	a, 0x5245
      009D08 14 01            [ 1]  813 	and	a, (0x01, sp)
      009D0A 27 04            [ 1]  814 	jreq	00105$
                                    815 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 632: status = SET;
      009D0C A6 01            [ 1]  816 	ld	a, #0x01
      009D0E 20 2A            [ 2]  817 	jra	00122$
      009D10                        818 00105$:
                                    819 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 637: status = RESET;
      009D10 4F               [ 1]  820 	clr	a
      009D11 20 27            [ 2]  821 	jra	00122$
      009D13                        822 00118$:
                                    823 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 640: else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
      009D13 1E 04            [ 2]  824 	ldw	x, (0x04, sp)
      009D15 A3 03 02         [ 2]  825 	cpw	x, #0x0302
      009D18 27 07            [ 1]  826 	jreq	00113$
      009D1A 1E 04            [ 2]  827 	ldw	x, (0x04, sp)
      009D1C A3 03 01         [ 2]  828 	cpw	x, #0x0301
      009D1F 26 0E            [ 1]  829 	jrne	00114$
      009D21                        830 00113$:
                                    831 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 642: if ((UART2->CR6 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
      009D21 C6 52 49         [ 1]  832 	ld	a, 0x5249
      009D24 14 01            [ 1]  833 	and	a, (0x01, sp)
      009D26 27 04            [ 1]  834 	jreq	00108$
                                    835 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 645: status = SET;
      009D28 A6 01            [ 1]  836 	ld	a, #0x01
      009D2A 20 0E            [ 2]  837 	jra	00122$
      009D2C                        838 00108$:
                                    839 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 650: status = RESET;
      009D2C 4F               [ 1]  840 	clr	a
      009D2D 20 0B            [ 2]  841 	jra	00122$
      009D2F                        842 00114$:
                                    843 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 655: if ((UART2->SR & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
      009D2F C6 52 40         [ 1]  844 	ld	a, 0x5240
      009D32 14 01            [ 1]  845 	and	a, (0x01, sp)
      009D34 27 03            [ 1]  846 	jreq	00111$
                                    847 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 658: status = SET;
      009D36 A6 01            [ 1]  848 	ld	a, #0x01
                                    849 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 663: status = RESET;
      009D38 21                     850 	.byte 0x21
      009D39                        851 00111$:
      009D39 4F               [ 1]  852 	clr	a
      009D3A                        853 00122$:
                                    854 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 668: return  status;
                                    855 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 669: }
      009D3A 5B 01            [ 2]  856 	addw	sp, #1
      009D3C 81               [ 4]  857 	ret
                                    858 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 699: void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)
                                    859 ;	-----------------------------------------
                                    860 ;	 function UART2_ClearFlag
                                    861 ;	-----------------------------------------
      009D3D                        862 _UART2_ClearFlag:
                                    863 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 704: if (UART2_FLAG == UART2_FLAG_RXNE)
      009D3D 1E 03            [ 2]  864 	ldw	x, (0x03, sp)
      009D3F A3 00 20         [ 2]  865 	cpw	x, #0x0020
      009D42 26 05            [ 1]  866 	jrne	00108$
                                    867 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 706: UART2->SR = (uint8_t)~(UART2_SR_RXNE);
      009D44 35 DF 52 40      [ 1]  868 	mov	0x5240+0, #0xdf
      009D48 81               [ 4]  869 	ret
      009D49                        870 00108$:
                                    871 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 709: else if (UART2_FLAG == UART2_FLAG_LBDF)
      009D49 1E 03            [ 2]  872 	ldw	x, (0x03, sp)
      009D4B A3 02 10         [ 2]  873 	cpw	x, #0x0210
      009D4E 26 05            [ 1]  874 	jrne	00105$
                                    875 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 711: UART2->CR4 &= (uint8_t)(~UART2_CR4_LBDF);
      009D50 72 19 52 47      [ 1]  876 	bres	21063, #4
      009D54 81               [ 4]  877 	ret
      009D55                        878 00105$:
                                    879 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 716: UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
      009D55 C6 52 49         [ 1]  880 	ld	a, 0x5249
                                    881 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 714: else if (UART2_FLAG == UART2_FLAG_LHDF)
      009D58 1E 03            [ 2]  882 	ldw	x, (0x03, sp)
      009D5A A3 03 02         [ 2]  883 	cpw	x, #0x0302
      009D5D 26 06            [ 1]  884 	jrne	00102$
                                    885 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 716: UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
      009D5F A4 FD            [ 1]  886 	and	a, #0xfd
      009D61 C7 52 49         [ 1]  887 	ld	0x5249, a
      009D64 81               [ 4]  888 	ret
      009D65                        889 00102$:
                                    890 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 721: UART2->CR6 &= (uint8_t)(~UART2_CR6_LSF);
      009D65 A4 FE            [ 1]  891 	and	a, #0xfe
      009D67 C7 52 49         [ 1]  892 	ld	0x5249, a
                                    893 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 723: }
      009D6A 81               [ 4]  894 	ret
                                    895 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 738: ITStatus UART2_GetITStatus(UART2_IT_TypeDef UART2_IT)
                                    896 ;	-----------------------------------------
                                    897 ;	 function UART2_GetITStatus
                                    898 ;	-----------------------------------------
      009D6B                        899 _UART2_GetITStatus:
      009D6B 52 02            [ 2]  900 	sub	sp, #2
                                    901 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 750: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
      009D6D 7B 06            [ 1]  902 	ld	a, (0x06, sp)
      009D6F 97               [ 1]  903 	ld	xl, a
      009D70 A4 0F            [ 1]  904 	and	a, #0x0f
      009D72 88               [ 1]  905 	push	a
      009D73 A6 01            [ 1]  906 	ld	a, #0x01
      009D75 6B 03            [ 1]  907 	ld	(0x03, sp), a
      009D77 84               [ 1]  908 	pop	a
      009D78 4D               [ 1]  909 	tnz	a
      009D79 27 05            [ 1]  910 	jreq	00184$
      009D7B                        911 00183$:
      009D7B 08 02            [ 1]  912 	sll	(0x02, sp)
      009D7D 4A               [ 1]  913 	dec	a
      009D7E 26 FB            [ 1]  914 	jrne	00183$
      009D80                        915 00184$:
                                    916 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 752: itmask1 = (uint8_t)((uint8_t)UART2_IT >> (uint8_t)4);
      009D80 9F               [ 1]  917 	ld	a, xl
      009D81 4E               [ 1]  918 	swap	a
      009D82 A4 0F            [ 1]  919 	and	a, #0x0f
                                    920 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 754: itmask2 = (uint8_t)((uint8_t)1 << itmask1);
      009D84 88               [ 1]  921 	push	a
      009D85 A6 01            [ 1]  922 	ld	a, #0x01
      009D87 6B 02            [ 1]  923 	ld	(0x02, sp), a
      009D89 84               [ 1]  924 	pop	a
      009D8A 4D               [ 1]  925 	tnz	a
      009D8B 27 05            [ 1]  926 	jreq	00186$
      009D8D                        927 00185$:
      009D8D 08 01            [ 1]  928 	sll	(0x01, sp)
      009D8F 4A               [ 1]  929 	dec	a
      009D90 26 FB            [ 1]  930 	jrne	00185$
      009D92                        931 00186$:
                                    932 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 757: if (UART2_IT == UART2_IT_PE)
      009D92 1E 05            [ 2]  933 	ldw	x, (0x05, sp)
      009D94 A3 01 00         [ 2]  934 	cpw	x, #0x0100
      009D97 26 18            [ 1]  935 	jrne	00124$
                                    936 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 760: enablestatus = (uint8_t)((uint8_t)UART2->CR1 & itmask2);
      009D99 C6 52 44         [ 1]  937 	ld	a, 0x5244
      009D9C 14 01            [ 1]  938 	and	a, (0x01, sp)
      009D9E 97               [ 1]  939 	ld	xl, a
                                    940 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 763: if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
      009D9F C6 52 40         [ 1]  941 	ld	a, 0x5240
      009DA2 14 02            [ 1]  942 	and	a, (0x02, sp)
      009DA4 27 08            [ 1]  943 	jreq	00102$
      009DA6 9F               [ 1]  944 	ld	a, xl
      009DA7 4D               [ 1]  945 	tnz	a
      009DA8 27 04            [ 1]  946 	jreq	00102$
                                    947 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 766: pendingbitstatus = SET;
      009DAA A6 01            [ 1]  948 	ld	a, #0x01
      009DAC 20 56            [ 2]  949 	jra	00125$
      009DAE                        950 00102$:
                                    951 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 771: pendingbitstatus = RESET;
      009DAE 4F               [ 1]  952 	clr	a
      009DAF 20 53            [ 2]  953 	jra	00125$
      009DB1                        954 00124$:
                                    955 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 774: else if (UART2_IT == UART2_IT_LBDF)
      009DB1 1E 05            [ 2]  956 	ldw	x, (0x05, sp)
      009DB3 A3 03 46         [ 2]  957 	cpw	x, #0x0346
      009DB6 26 18            [ 1]  958 	jrne	00121$
                                    959 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 777: enablestatus = (uint8_t)((uint8_t)UART2->CR4 & itmask2);
      009DB8 C6 52 47         [ 1]  960 	ld	a, 0x5247
      009DBB 14 01            [ 1]  961 	and	a, (0x01, sp)
      009DBD 97               [ 1]  962 	ld	xl, a
                                    963 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 779: if (((UART2->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
      009DBE C6 52 47         [ 1]  964 	ld	a, 0x5247
      009DC1 14 02            [ 1]  965 	and	a, (0x02, sp)
      009DC3 27 08            [ 1]  966 	jreq	00106$
      009DC5 9F               [ 1]  967 	ld	a, xl
      009DC6 4D               [ 1]  968 	tnz	a
      009DC7 27 04            [ 1]  969 	jreq	00106$
                                    970 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 782: pendingbitstatus = SET;
      009DC9 A6 01            [ 1]  971 	ld	a, #0x01
      009DCB 20 37            [ 2]  972 	jra	00125$
      009DCD                        973 00106$:
                                    974 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 787: pendingbitstatus = RESET;
      009DCD 4F               [ 1]  975 	clr	a
      009DCE 20 34            [ 2]  976 	jra	00125$
      009DD0                        977 00121$:
                                    978 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 790: else if (UART2_IT == UART2_IT_LHDF)
      009DD0 1E 05            [ 2]  979 	ldw	x, (0x05, sp)
      009DD2 A3 04 12         [ 2]  980 	cpw	x, #0x0412
      009DD5 26 18            [ 1]  981 	jrne	00118$
                                    982 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 793: enablestatus = (uint8_t)((uint8_t)UART2->CR6 & itmask2);
      009DD7 C6 52 49         [ 1]  983 	ld	a, 0x5249
      009DDA 14 01            [ 1]  984 	and	a, (0x01, sp)
      009DDC 97               [ 1]  985 	ld	xl, a
                                    986 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 795: if (((UART2->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
      009DDD C6 52 49         [ 1]  987 	ld	a, 0x5249
      009DE0 14 02            [ 1]  988 	and	a, (0x02, sp)
      009DE2 27 08            [ 1]  989 	jreq	00110$
      009DE4 9F               [ 1]  990 	ld	a, xl
      009DE5 4D               [ 1]  991 	tnz	a
      009DE6 27 04            [ 1]  992 	jreq	00110$
                                    993 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 798: pendingbitstatus = SET;
      009DE8 A6 01            [ 1]  994 	ld	a, #0x01
      009DEA 20 18            [ 2]  995 	jra	00125$
      009DEC                        996 00110$:
                                    997 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 803: pendingbitstatus = RESET;
      009DEC 4F               [ 1]  998 	clr	a
      009DED 20 15            [ 2]  999 	jra	00125$
      009DEF                       1000 00118$:
                                   1001 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 809: enablestatus = (uint8_t)((uint8_t)UART2->CR2 & itmask2);
      009DEF C6 52 45         [ 1] 1002 	ld	a, 0x5245
      009DF2 14 01            [ 1] 1003 	and	a, (0x01, sp)
      009DF4 97               [ 1] 1004 	ld	xl, a
                                   1005 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 811: if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
      009DF5 C6 52 40         [ 1] 1006 	ld	a, 0x5240
      009DF8 14 02            [ 1] 1007 	and	a, (0x02, sp)
      009DFA 27 07            [ 1] 1008 	jreq	00114$
      009DFC 9F               [ 1] 1009 	ld	a, xl
      009DFD 4D               [ 1] 1010 	tnz	a
      009DFE 27 03            [ 1] 1011 	jreq	00114$
                                   1012 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 814: pendingbitstatus = SET;
      009E00 A6 01            [ 1] 1013 	ld	a, #0x01
                                   1014 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 819: pendingbitstatus = RESET;
      009E02 21                    1015 	.byte 0x21
      009E03                       1016 00114$:
      009E03 4F               [ 1] 1017 	clr	a
      009E04                       1018 00125$:
                                   1019 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 823: return  pendingbitstatus;
                                   1020 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 824: }
      009E04 5B 02            [ 2] 1021 	addw	sp, #2
      009E06 81               [ 4] 1022 	ret
                                   1023 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 852: void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)
                                   1024 ;	-----------------------------------------
                                   1025 ;	 function UART2_ClearITPendingBit
                                   1026 ;	-----------------------------------------
      009E07                       1027 _UART2_ClearITPendingBit:
                                   1028 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 857: if (UART2_IT == UART2_IT_RXNE)
      009E07 1E 03            [ 2] 1029 	ldw	x, (0x03, sp)
      009E09 A3 02 55         [ 2] 1030 	cpw	x, #0x0255
      009E0C 26 05            [ 1] 1031 	jrne	00105$
                                   1032 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 859: UART2->SR = (uint8_t)~(UART2_SR_RXNE);
      009E0E 35 DF 52 40      [ 1] 1033 	mov	0x5240+0, #0xdf
      009E12 81               [ 4] 1034 	ret
      009E13                       1035 00105$:
                                   1036 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 862: else if (UART2_IT == UART2_IT_LBDF)
      009E13 1E 03            [ 2] 1037 	ldw	x, (0x03, sp)
      009E15 A3 03 46         [ 2] 1038 	cpw	x, #0x0346
      009E18 26 05            [ 1] 1039 	jrne	00102$
                                   1040 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 864: UART2->CR4 &= (uint8_t)~(UART2_CR4_LBDF);
      009E1A 72 19 52 47      [ 1] 1041 	bres	21063, #4
      009E1E 81               [ 4] 1042 	ret
      009E1F                       1043 00102$:
                                   1044 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 869: UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
      009E1F 72 13 52 49      [ 1] 1045 	bres	21065, #1
                                   1046 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 871: }
      009E23 81               [ 4] 1047 	ret
                                   1048 	.area CODE
                                   1049 	.area CONST
                                   1050 	.area INITIALIZER
                                   1051 	.area CABS (ABS)
