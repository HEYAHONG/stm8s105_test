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
      00911B                         78 _UART2_DeInit:
                                     79 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 57: (void) UART2->SR;
      00911B C6 52 40         [ 1]   80 	ld	a, 0x5240
                                     81 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 58: (void)UART2->DR;
      00911E C6 52 41         [ 1]   82 	ld	a, 0x5241
                                     83 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 60: UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*  Set UART2_BRR2 to reset value 0x00 */
      009121 35 00 52 43      [ 1]   84 	mov	0x5243+0, #0x00
                                     85 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 61: UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*  Set UART2_BRR1 to reset value 0x00 */
      009125 35 00 52 42      [ 1]   86 	mov	0x5242+0, #0x00
                                     87 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 63: UART2->CR1 = UART2_CR1_RESET_VALUE; /*  Set UART2_CR1 to reset value 0x00  */
      009129 35 00 52 44      [ 1]   88 	mov	0x5244+0, #0x00
                                     89 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 64: UART2->CR2 = UART2_CR2_RESET_VALUE; /*  Set UART2_CR2 to reset value 0x00  */
      00912D 35 00 52 45      [ 1]   90 	mov	0x5245+0, #0x00
                                     91 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 65: UART2->CR3 = UART2_CR3_RESET_VALUE; /*  Set UART2_CR3 to reset value 0x00  */
      009131 35 00 52 46      [ 1]   92 	mov	0x5246+0, #0x00
                                     93 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 66: UART2->CR4 = UART2_CR4_RESET_VALUE; /*  Set UART2_CR4 to reset value 0x00  */
      009135 35 00 52 47      [ 1]   94 	mov	0x5247+0, #0x00
                                     95 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 67: UART2->CR5 = UART2_CR5_RESET_VALUE; /*  Set UART2_CR5 to reset value 0x00  */
      009139 35 00 52 48      [ 1]   96 	mov	0x5248+0, #0x00
                                     97 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 68: UART2->CR6 = UART2_CR6_RESET_VALUE; /*  Set UART2_CR6 to reset value 0x00  */
      00913D 35 00 52 49      [ 1]   98 	mov	0x5249+0, #0x00
                                     99 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 69: }
      009141 81               [ 4]  100 	ret
                                    101 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 85: void UART2_Init(uint32_t BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
                                    102 ;	-----------------------------------------
                                    103 ;	 function UART2_Init
                                    104 ;	-----------------------------------------
      009142                        105 _UART2_Init:
      009142 52 23            [ 2]  106 	sub	sp, #35
                                    107 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 99: UART2->CR1 &= (uint8_t)(~UART2_CR1_M);
      009144 72 19 52 44      [ 1]  108 	bres	21060, #4
                                    109 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 101: UART2->CR1 |= (uint8_t)WordLength; 
      009148 C6 52 44         [ 1]  110 	ld	a, 0x5244
      00914B 1A 2A            [ 1]  111 	or	a, (0x2a, sp)
      00914D C7 52 44         [ 1]  112 	ld	0x5244, a
                                    113 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 104: UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
      009150 C6 52 46         [ 1]  114 	ld	a, 0x5246
      009153 A4 CF            [ 1]  115 	and	a, #0xcf
      009155 C7 52 46         [ 1]  116 	ld	0x5246, a
                                    117 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 106: UART2->CR3 |= (uint8_t)StopBits; 
      009158 C6 52 46         [ 1]  118 	ld	a, 0x5246
      00915B 1A 2B            [ 1]  119 	or	a, (0x2b, sp)
      00915D C7 52 46         [ 1]  120 	ld	0x5246, a
                                    121 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 109: UART2->CR1 &= (uint8_t)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));
      009160 C6 52 44         [ 1]  122 	ld	a, 0x5244
      009163 A4 F9            [ 1]  123 	and	a, #0xf9
      009165 C7 52 44         [ 1]  124 	ld	0x5244, a
                                    125 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 111: UART2->CR1 |= (uint8_t)Parity;
      009168 C6 52 44         [ 1]  126 	ld	a, 0x5244
      00916B 1A 2C            [ 1]  127 	or	a, (0x2c, sp)
      00916D C7 52 44         [ 1]  128 	ld	0x5244, a
                                    129 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 114: UART2->BRR1 &= (uint8_t)(~UART2_BRR1_DIVM);
      009170 C6 52 42         [ 1]  130 	ld	a, 0x5242
      009173 35 00 52 42      [ 1]  131 	mov	0x5242+0, #0x00
                                    132 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 116: UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVM);
      009177 C6 52 43         [ 1]  133 	ld	a, 0x5243
      00917A A4 0F            [ 1]  134 	and	a, #0x0f
      00917C C7 52 43         [ 1]  135 	ld	0x5243, a
                                    136 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 118: UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVF);
      00917F C6 52 43         [ 1]  137 	ld	a, 0x5243
      009182 A4 F0            [ 1]  138 	and	a, #0xf0
      009184 C7 52 43         [ 1]  139 	ld	0x5243, a
                                    140 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 121: BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
      009187 CD 98 40         [ 4]  141 	call	_CLK_GetClockFreq
      00918A 1F 19            [ 2]  142 	ldw	(0x19, sp), x
      00918C 1E 26            [ 2]  143 	ldw	x, (0x26, sp)
      00918E 1F 13            [ 2]  144 	ldw	(0x13, sp), x
      009190 1E 28            [ 2]  145 	ldw	x, (0x28, sp)
      009192 A6 04            [ 1]  146 	ld	a, #0x04
      009194                        147 00127$:
      009194 58               [ 2]  148 	sllw	x
      009195 09 14            [ 1]  149 	rlc	(0x14, sp)
      009197 09 13            [ 1]  150 	rlc	(0x13, sp)
      009199 4A               [ 1]  151 	dec	a
      00919A 26 F8            [ 1]  152 	jrne	00127$
      00919C 1F 15            [ 2]  153 	ldw	(0x15, sp), x
      00919E 89               [ 2]  154 	pushw	x
      00919F 1E 15            [ 2]  155 	ldw	x, (0x15, sp)
      0091A1 89               [ 2]  156 	pushw	x
      0091A2 1E 1D            [ 2]  157 	ldw	x, (0x1d, sp)
      0091A4 89               [ 2]  158 	pushw	x
      0091A5 90 89            [ 2]  159 	pushw	y
      0091A7 CD 99 D2         [ 4]  160 	call	__divulong
      0091AA 5B 08            [ 2]  161 	addw	sp, #8
      0091AC 1F 21            [ 2]  162 	ldw	(0x21, sp), x
      0091AE 17 1F            [ 2]  163 	ldw	(0x1f, sp), y
      0091B0 16 20            [ 2]  164 	ldw	y, (0x20, sp)
      0091B2 17 20            [ 2]  165 	ldw	(0x20, sp), y
                                    166 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 122: BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
      0091B4 CD 98 40         [ 4]  167 	call	_CLK_GetClockFreq
      0091B7 1F 11            [ 2]  168 	ldw	(0x11, sp), x
      0091B9 17 0F            [ 2]  169 	ldw	(0x0f, sp), y
      0091BB 1E 11            [ 2]  170 	ldw	x, (0x11, sp)
      0091BD 89               [ 2]  171 	pushw	x
      0091BE 1E 11            [ 2]  172 	ldw	x, (0x11, sp)
      0091C0 89               [ 2]  173 	pushw	x
      0091C1 4B 64            [ 1]  174 	push	#0x64
      0091C3 5F               [ 1]  175 	clrw	x
      0091C4 89               [ 2]  176 	pushw	x
      0091C5 4B 00            [ 1]  177 	push	#0x00
      0091C7 CD 9A 83         [ 4]  178 	call	__mullong
      0091CA 5B 08            [ 2]  179 	addw	sp, #8
      0091CC 1F 0D            [ 2]  180 	ldw	(0x0d, sp), x
      0091CE 1E 15            [ 2]  181 	ldw	x, (0x15, sp)
      0091D0 89               [ 2]  182 	pushw	x
      0091D1 1E 15            [ 2]  183 	ldw	x, (0x15, sp)
      0091D3 89               [ 2]  184 	pushw	x
      0091D4 1E 11            [ 2]  185 	ldw	x, (0x11, sp)
      0091D6 89               [ 2]  186 	pushw	x
      0091D7 90 89            [ 2]  187 	pushw	y
      0091D9 CD 99 D2         [ 4]  188 	call	__divulong
      0091DC 5B 08            [ 2]  189 	addw	sp, #8
      0091DE 1F 1D            [ 2]  190 	ldw	(0x1d, sp), x
      0091E0 17 1B            [ 2]  191 	ldw	(0x1b, sp), y
                                    192 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 126: BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
      0091E2 1E 21            [ 2]  193 	ldw	x, (0x21, sp)
      0091E4 89               [ 2]  194 	pushw	x
      0091E5 1E 21            [ 2]  195 	ldw	x, (0x21, sp)
      0091E7 89               [ 2]  196 	pushw	x
      0091E8 4B 64            [ 1]  197 	push	#0x64
      0091EA 5F               [ 1]  198 	clrw	x
      0091EB 89               [ 2]  199 	pushw	x
      0091EC 4B 00            [ 1]  200 	push	#0x00
      0091EE CD 9A 83         [ 4]  201 	call	__mullong
      0091F1 5B 08            [ 2]  202 	addw	sp, #8
      0091F3 1F 09            [ 2]  203 	ldw	(0x09, sp), x
      0091F5 17 07            [ 2]  204 	ldw	(0x07, sp), y
      0091F7 1E 1D            [ 2]  205 	ldw	x, (0x1d, sp)
      0091F9 72 F0 09         [ 2]  206 	subw	x, (0x09, sp)
      0091FC 1F 05            [ 2]  207 	ldw	(0x05, sp), x
      0091FE 7B 1C            [ 1]  208 	ld	a, (0x1c, sp)
      009200 12 08            [ 1]  209 	sbc	a, (0x08, sp)
      009202 6B 04            [ 1]  210 	ld	(0x04, sp), a
      009204 7B 1B            [ 1]  211 	ld	a, (0x1b, sp)
      009206 12 07            [ 1]  212 	sbc	a, (0x07, sp)
      009208 6B 03            [ 1]  213 	ld	(0x03, sp), a
      00920A 1E 05            [ 2]  214 	ldw	x, (0x05, sp)
      00920C 16 03            [ 2]  215 	ldw	y, (0x03, sp)
      00920E A6 04            [ 1]  216 	ld	a, #0x04
      009210                        217 00129$:
      009210 58               [ 2]  218 	sllw	x
      009211 90 59            [ 2]  219 	rlcw	y
      009213 4A               [ 1]  220 	dec	a
      009214 26 FA            [ 1]  221 	jrne	00129$
      009216 4B 64            [ 1]  222 	push	#0x64
      009218 4B 00            [ 1]  223 	push	#0x00
      00921A 4B 00            [ 1]  224 	push	#0x00
      00921C 4B 00            [ 1]  225 	push	#0x00
      00921E 89               [ 2]  226 	pushw	x
      00921F 90 89            [ 2]  227 	pushw	y
      009221 CD 99 D2         [ 4]  228 	call	__divulong
      009224 5B 08            [ 2]  229 	addw	sp, #8
      009226 9F               [ 1]  230 	ld	a, xl
      009227 A4 0F            [ 1]  231 	and	a, #0x0f
      009229 6B 23            [ 1]  232 	ld	(0x23, sp), a
                                    233 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 128: BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
      00922B 1E 21            [ 2]  234 	ldw	x, (0x21, sp)
      00922D A6 10            [ 1]  235 	ld	a, #0x10
      00922F 62               [ 2]  236 	div	x, a
      009230 9F               [ 1]  237 	ld	a, xl
      009231 A4 F0            [ 1]  238 	and	a, #0xf0
                                    239 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 130: UART2->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
      009233 1A 23            [ 1]  240 	or	a, (0x23, sp)
      009235 C7 52 43         [ 1]  241 	ld	0x5243, a
                                    242 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 132: UART2->BRR1 = (uint8_t)BaudRate_Mantissa;           
      009238 7B 22            [ 1]  243 	ld	a, (0x22, sp)
      00923A C7 52 42         [ 1]  244 	ld	0x5242, a
                                    245 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 135: UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
      00923D C6 52 45         [ 1]  246 	ld	a, 0x5245
      009240 A4 F3            [ 1]  247 	and	a, #0xf3
      009242 C7 52 45         [ 1]  248 	ld	0x5245, a
                                    249 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 137: UART2->CR3 &= (uint8_t)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL);
      009245 C6 52 46         [ 1]  250 	ld	a, 0x5246
      009248 A4 F8            [ 1]  251 	and	a, #0xf8
      00924A C7 52 46         [ 1]  252 	ld	0x5246, a
                                    253 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 139: UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART2_CR3_CPOL | \
      00924D C6 52 46         [ 1]  254 	ld	a, 0x5246
      009250 6B 02            [ 1]  255 	ld	(0x02, sp), a
      009252 7B 2D            [ 1]  256 	ld	a, (0x2d, sp)
      009254 A4 07            [ 1]  257 	and	a, #0x07
      009256 1A 02            [ 1]  258 	or	a, (0x02, sp)
      009258 C7 52 46         [ 1]  259 	ld	0x5246, a
                                    260 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 135: UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
      00925B C6 52 45         [ 1]  261 	ld	a, 0x5245
                                    262 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 142: if ((uint8_t)(Mode & UART2_MODE_TX_ENABLE))
      00925E 88               [ 1]  263 	push	a
      00925F 7B 2F            [ 1]  264 	ld	a, (0x2f, sp)
      009261 A5 04            [ 1]  265 	bcp	a, #0x04
      009263 84               [ 1]  266 	pop	a
      009264 27 07            [ 1]  267 	jreq	00102$
                                    268 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 145: UART2->CR2 |= (uint8_t)UART2_CR2_TEN;
      009266 AA 08            [ 1]  269 	or	a, #0x08
      009268 C7 52 45         [ 1]  270 	ld	0x5245, a
      00926B 20 05            [ 2]  271 	jra	00103$
      00926D                        272 00102$:
                                    273 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 150: UART2->CR2 &= (uint8_t)(~UART2_CR2_TEN);
      00926D A4 F7            [ 1]  274 	and	a, #0xf7
      00926F C7 52 45         [ 1]  275 	ld	0x5245, a
      009272                        276 00103$:
                                    277 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 135: UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
      009272 C6 52 45         [ 1]  278 	ld	a, 0x5245
                                    279 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 152: if ((uint8_t)(Mode & UART2_MODE_RX_ENABLE))
      009275 88               [ 1]  280 	push	a
      009276 7B 2F            [ 1]  281 	ld	a, (0x2f, sp)
      009278 A5 08            [ 1]  282 	bcp	a, #0x08
      00927A 84               [ 1]  283 	pop	a
      00927B 27 07            [ 1]  284 	jreq	00105$
                                    285 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 155: UART2->CR2 |= (uint8_t)UART2_CR2_REN;
      00927D AA 04            [ 1]  286 	or	a, #0x04
      00927F C7 52 45         [ 1]  287 	ld	0x5245, a
      009282 20 05            [ 2]  288 	jra	00106$
      009284                        289 00105$:
                                    290 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 160: UART2->CR2 &= (uint8_t)(~UART2_CR2_REN);
      009284 A4 FB            [ 1]  291 	and	a, #0xfb
      009286 C7 52 45         [ 1]  292 	ld	0x5245, a
      009289                        293 00106$:
                                    294 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 104: UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
      009289 C6 52 46         [ 1]  295 	ld	a, 0x5246
                                    296 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 164: if ((uint8_t)(SyncMode & UART2_SYNCMODE_CLOCK_DISABLE))
      00928C 0D 2D            [ 1]  297 	tnz	(0x2d, sp)
      00928E 2A 07            [ 1]  298 	jrpl	00108$
                                    299 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 167: UART2->CR3 &= (uint8_t)(~UART2_CR3_CKEN); 
      009290 A4 F7            [ 1]  300 	and	a, #0xf7
      009292 C7 52 46         [ 1]  301 	ld	0x5246, a
      009295 20 0D            [ 2]  302 	jra	00110$
      009297                        303 00108$:
                                    304 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 171: UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & UART2_CR3_CKEN);
      009297 88               [ 1]  305 	push	a
      009298 7B 2E            [ 1]  306 	ld	a, (0x2e, sp)
      00929A A4 08            [ 1]  307 	and	a, #0x08
      00929C 6B 02            [ 1]  308 	ld	(0x02, sp), a
      00929E 84               [ 1]  309 	pop	a
      00929F 1A 01            [ 1]  310 	or	a, (0x01, sp)
      0092A1 C7 52 46         [ 1]  311 	ld	0x5246, a
      0092A4                        312 00110$:
                                    313 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 173: }
      0092A4 5B 23            [ 2]  314 	addw	sp, #35
      0092A6 81               [ 4]  315 	ret
                                    316 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 181: void UART2_Cmd(FunctionalState NewState)
                                    317 ;	-----------------------------------------
                                    318 ;	 function UART2_Cmd
                                    319 ;	-----------------------------------------
      0092A7                        320 _UART2_Cmd:
                                    321 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 186: UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
      0092A7 C6 52 44         [ 1]  322 	ld	a, 0x5244
                                    323 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 183: if (NewState != DISABLE)
      0092AA 0D 03            [ 1]  324 	tnz	(0x03, sp)
      0092AC 27 06            [ 1]  325 	jreq	00102$
                                    326 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 186: UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
      0092AE A4 DF            [ 1]  327 	and	a, #0xdf
      0092B0 C7 52 44         [ 1]  328 	ld	0x5244, a
      0092B3 81               [ 4]  329 	ret
      0092B4                        330 00102$:
                                    331 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 191: UART2->CR1 |= UART2_CR1_UARTD; 
      0092B4 AA 20            [ 1]  332 	or	a, #0x20
      0092B6 C7 52 44         [ 1]  333 	ld	0x5244, a
                                    334 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 193: }
      0092B9 81               [ 4]  335 	ret
                                    336 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 210: void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)
                                    337 ;	-----------------------------------------
                                    338 ;	 function UART2_ITConfig
                                    339 ;	-----------------------------------------
      0092BA                        340 _UART2_ITConfig:
      0092BA 52 04            [ 2]  341 	sub	sp, #4
                                    342 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 219: uartreg = (uint8_t)((uint16_t)UART2_IT >> 0x08);
      0092BC 7B 07            [ 1]  343 	ld	a, (0x07, sp)
      0092BE 97               [ 1]  344 	ld	xl, a
                                    345 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 222: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
      0092BF 7B 08            [ 1]  346 	ld	a, (0x08, sp)
      0092C1 A4 0F            [ 1]  347 	and	a, #0x0f
      0092C3 88               [ 1]  348 	push	a
      0092C4 A6 01            [ 1]  349 	ld	a, #0x01
      0092C6 6B 05            [ 1]  350 	ld	(0x05, sp), a
      0092C8 84               [ 1]  351 	pop	a
      0092C9 4D               [ 1]  352 	tnz	a
      0092CA 27 05            [ 1]  353 	jreq	00160$
      0092CC                        354 00159$:
      0092CC 08 04            [ 1]  355 	sll	(0x04, sp)
      0092CE 4A               [ 1]  356 	dec	a
      0092CF 26 FB            [ 1]  357 	jrne	00159$
      0092D1                        358 00160$:
                                    359 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 227: if (uartreg == 0x01)
      0092D1 9F               [ 1]  360 	ld	a, xl
      0092D2 4A               [ 1]  361 	dec	a
      0092D3 26 05            [ 1]  362 	jrne	00162$
      0092D5 A6 01            [ 1]  363 	ld	a, #0x01
      0092D7 6B 03            [ 1]  364 	ld	(0x03, sp), a
      0092D9 C1                     365 	.byte 0xc1
      0092DA                        366 00162$:
      0092DA 0F 03            [ 1]  367 	clr	(0x03, sp)
      0092DC                        368 00163$:
                                    369 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 231: else if (uartreg == 0x02)
      0092DC 9F               [ 1]  370 	ld	a, xl
      0092DD A0 02            [ 1]  371 	sub	a, #0x02
      0092DF 26 04            [ 1]  372 	jrne	00165$
      0092E1 4C               [ 1]  373 	inc	a
      0092E2 6B 02            [ 1]  374 	ld	(0x02, sp), a
      0092E4 C1                     375 	.byte 0xc1
      0092E5                        376 00165$:
      0092E5 0F 02            [ 1]  377 	clr	(0x02, sp)
      0092E7                        378 00166$:
                                    379 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 235: else if (uartreg == 0x03)
      0092E7 9F               [ 1]  380 	ld	a, xl
      0092E8 A0 03            [ 1]  381 	sub	a, #0x03
      0092EA 26 02            [ 1]  382 	jrne	00168$
      0092EC 4C               [ 1]  383 	inc	a
      0092ED 21                     384 	.byte 0x21
      0092EE                        385 00168$:
      0092EE 4F               [ 1]  386 	clr	a
      0092EF                        387 00169$:
                                    388 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 224: if (NewState != DISABLE)
      0092EF 0D 09            [ 1]  389 	tnz	(0x09, sp)
      0092F1 27 33            [ 1]  390 	jreq	00120$
                                    391 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 227: if (uartreg == 0x01)
      0092F3 0D 03            [ 1]  392 	tnz	(0x03, sp)
      0092F5 27 0A            [ 1]  393 	jreq	00108$
                                    394 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 229: UART2->CR1 |= itpos;
      0092F7 C6 52 44         [ 1]  395 	ld	a, 0x5244
      0092FA 1A 04            [ 1]  396 	or	a, (0x04, sp)
      0092FC C7 52 44         [ 1]  397 	ld	0x5244, a
      0092FF 20 5D            [ 2]  398 	jra	00122$
      009301                        399 00108$:
                                    400 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 231: else if (uartreg == 0x02)
      009301 0D 02            [ 1]  401 	tnz	(0x02, sp)
      009303 27 0A            [ 1]  402 	jreq	00105$
                                    403 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 233: UART2->CR2 |= itpos;
      009305 C6 52 45         [ 1]  404 	ld	a, 0x5245
      009308 1A 04            [ 1]  405 	or	a, (0x04, sp)
      00930A C7 52 45         [ 1]  406 	ld	0x5245, a
      00930D 20 4F            [ 2]  407 	jra	00122$
      00930F                        408 00105$:
                                    409 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 235: else if (uartreg == 0x03)
      00930F 4D               [ 1]  410 	tnz	a
      009310 27 0A            [ 1]  411 	jreq	00102$
                                    412 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 237: UART2->CR4 |= itpos;
      009312 C6 52 47         [ 1]  413 	ld	a, 0x5247
      009315 1A 04            [ 1]  414 	or	a, (0x04, sp)
      009317 C7 52 47         [ 1]  415 	ld	0x5247, a
      00931A 20 42            [ 2]  416 	jra	00122$
      00931C                        417 00102$:
                                    418 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 241: UART2->CR6 |= itpos;
      00931C C6 52 49         [ 1]  419 	ld	a, 0x5249
      00931F 1A 04            [ 1]  420 	or	a, (0x04, sp)
      009321 C7 52 49         [ 1]  421 	ld	0x5249, a
      009324 20 38            [ 2]  422 	jra	00122$
      009326                        423 00120$:
                                    424 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 249: UART2->CR1 &= (uint8_t)(~itpos);
      009326 88               [ 1]  425 	push	a
      009327 7B 05            [ 1]  426 	ld	a, (0x05, sp)
      009329 43               [ 1]  427 	cpl	a
      00932A 6B 02            [ 1]  428 	ld	(0x02, sp), a
      00932C 84               [ 1]  429 	pop	a
                                    430 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 247: if (uartreg == 0x01)
      00932D 0D 03            [ 1]  431 	tnz	(0x03, sp)
      00932F 27 0A            [ 1]  432 	jreq	00117$
                                    433 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 249: UART2->CR1 &= (uint8_t)(~itpos);
      009331 C6 52 44         [ 1]  434 	ld	a, 0x5244
      009334 14 01            [ 1]  435 	and	a, (0x01, sp)
      009336 C7 52 44         [ 1]  436 	ld	0x5244, a
      009339 20 23            [ 2]  437 	jra	00122$
      00933B                        438 00117$:
                                    439 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 251: else if (uartreg == 0x02)
      00933B 0D 02            [ 1]  440 	tnz	(0x02, sp)
      00933D 27 0A            [ 1]  441 	jreq	00114$
                                    442 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 253: UART2->CR2 &= (uint8_t)(~itpos);
      00933F C6 52 45         [ 1]  443 	ld	a, 0x5245
      009342 14 01            [ 1]  444 	and	a, (0x01, sp)
      009344 C7 52 45         [ 1]  445 	ld	0x5245, a
      009347 20 15            [ 2]  446 	jra	00122$
      009349                        447 00114$:
                                    448 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 255: else if (uartreg == 0x03)
      009349 4D               [ 1]  449 	tnz	a
      00934A 27 0A            [ 1]  450 	jreq	00111$
                                    451 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 257: UART2->CR4 &= (uint8_t)(~itpos);
      00934C C6 52 47         [ 1]  452 	ld	a, 0x5247
      00934F 14 01            [ 1]  453 	and	a, (0x01, sp)
      009351 C7 52 47         [ 1]  454 	ld	0x5247, a
      009354 20 08            [ 2]  455 	jra	00122$
      009356                        456 00111$:
                                    457 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 261: UART2->CR6 &= (uint8_t)(~itpos);
      009356 C6 52 49         [ 1]  458 	ld	a, 0x5249
      009359 14 01            [ 1]  459 	and	a, (0x01, sp)
      00935B C7 52 49         [ 1]  460 	ld	0x5249, a
      00935E                        461 00122$:
                                    462 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 264: }
      00935E 5B 04            [ 2]  463 	addw	sp, #4
      009360 81               [ 4]  464 	ret
                                    465 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 272: void UART2_IrDAConfig(UART2_IrDAMode_TypeDef UART2_IrDAMode)
                                    466 ;	-----------------------------------------
                                    467 ;	 function UART2_IrDAConfig
                                    468 ;	-----------------------------------------
      009361                        469 _UART2_IrDAConfig:
                                    470 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 278: UART2->CR5 |= UART2_CR5_IRLP;
      009361 C6 52 48         [ 1]  471 	ld	a, 0x5248
                                    472 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 276: if (UART2_IrDAMode != UART2_IRDAMODE_NORMAL)
      009364 0D 03            [ 1]  473 	tnz	(0x03, sp)
      009366 27 06            [ 1]  474 	jreq	00102$
                                    475 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 278: UART2->CR5 |= UART2_CR5_IRLP;
      009368 AA 04            [ 1]  476 	or	a, #0x04
      00936A C7 52 48         [ 1]  477 	ld	0x5248, a
      00936D 81               [ 4]  478 	ret
      00936E                        479 00102$:
                                    480 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 282: UART2->CR5 &= ((uint8_t)~UART2_CR5_IRLP);
      00936E A4 FB            [ 1]  481 	and	a, #0xfb
      009370 C7 52 48         [ 1]  482 	ld	0x5248, a
                                    483 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 284: }
      009373 81               [ 4]  484 	ret
                                    485 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 292: void UART2_IrDACmd(FunctionalState NewState)
                                    486 ;	-----------------------------------------
                                    487 ;	 function UART2_IrDACmd
                                    488 ;	-----------------------------------------
      009374                        489 _UART2_IrDACmd:
                                    490 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 300: UART2->CR5 |= UART2_CR5_IREN;
      009374 C6 52 48         [ 1]  491 	ld	a, 0x5248
                                    492 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 297: if (NewState != DISABLE)
      009377 0D 03            [ 1]  493 	tnz	(0x03, sp)
      009379 27 06            [ 1]  494 	jreq	00102$
                                    495 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 300: UART2->CR5 |= UART2_CR5_IREN;
      00937B AA 02            [ 1]  496 	or	a, #0x02
      00937D C7 52 48         [ 1]  497 	ld	0x5248, a
      009380 81               [ 4]  498 	ret
      009381                        499 00102$:
                                    500 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 305: UART2->CR5 &= ((uint8_t)~UART2_CR5_IREN);
      009381 A4 FD            [ 1]  501 	and	a, #0xfd
      009383 C7 52 48         [ 1]  502 	ld	0x5248, a
                                    503 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 307: }
      009386 81               [ 4]  504 	ret
                                    505 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 316: void UART2_LINBreakDetectionConfig(UART2_LINBreakDetectionLength_TypeDef UART2_LINBreakDetectionLength)
                                    506 ;	-----------------------------------------
                                    507 ;	 function UART2_LINBreakDetectionConfig
                                    508 ;	-----------------------------------------
      009387                        509 _UART2_LINBreakDetectionConfig:
                                    510 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 323: UART2->CR4 |= UART2_CR4_LBDL;
      009387 C6 52 47         [ 1]  511 	ld	a, 0x5247
                                    512 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 321: if (UART2_LINBreakDetectionLength != UART2_LINBREAKDETECTIONLENGTH_10BITS)
      00938A 0D 03            [ 1]  513 	tnz	(0x03, sp)
      00938C 27 06            [ 1]  514 	jreq	00102$
                                    515 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 323: UART2->CR4 |= UART2_CR4_LBDL;
      00938E AA 20            [ 1]  516 	or	a, #0x20
      009390 C7 52 47         [ 1]  517 	ld	0x5247, a
      009393 81               [ 4]  518 	ret
      009394                        519 00102$:
                                    520 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 327: UART2->CR4 &= ((uint8_t)~UART2_CR4_LBDL);
      009394 A4 DF            [ 1]  521 	and	a, #0xdf
      009396 C7 52 47         [ 1]  522 	ld	0x5247, a
                                    523 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 329: }
      009399 81               [ 4]  524 	ret
                                    525 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 341: void UART2_LINConfig(UART2_LinMode_TypeDef UART2_Mode, 
                                    526 ;	-----------------------------------------
                                    527 ;	 function UART2_LINConfig
                                    528 ;	-----------------------------------------
      00939A                        529 _UART2_LINConfig:
                                    530 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 352: UART2->CR6 |=  UART2_CR6_LSLV;
      00939A C6 52 49         [ 1]  531 	ld	a, 0x5249
                                    532 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 350: if (UART2_Mode != UART2_LIN_MODE_MASTER)
      00939D 0D 03            [ 1]  533 	tnz	(0x03, sp)
      00939F 27 07            [ 1]  534 	jreq	00102$
                                    535 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 352: UART2->CR6 |=  UART2_CR6_LSLV;
      0093A1 AA 20            [ 1]  536 	or	a, #0x20
      0093A3 C7 52 49         [ 1]  537 	ld	0x5249, a
      0093A6 20 05            [ 2]  538 	jra	00103$
      0093A8                        539 00102$:
                                    540 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 356: UART2->CR6 &= ((uint8_t)~UART2_CR6_LSLV);
      0093A8 A4 DF            [ 1]  541 	and	a, #0xdf
      0093AA C7 52 49         [ 1]  542 	ld	0x5249, a
      0093AD                        543 00103$:
                                    544 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 352: UART2->CR6 |=  UART2_CR6_LSLV;
      0093AD C6 52 49         [ 1]  545 	ld	a, 0x5249
                                    546 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 359: if (UART2_Autosync != UART2_LIN_AUTOSYNC_DISABLE)
      0093B0 0D 04            [ 1]  547 	tnz	(0x04, sp)
      0093B2 27 07            [ 1]  548 	jreq	00105$
                                    549 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 361: UART2->CR6 |=  UART2_CR6_LASE ;
      0093B4 AA 10            [ 1]  550 	or	a, #0x10
      0093B6 C7 52 49         [ 1]  551 	ld	0x5249, a
      0093B9 20 05            [ 2]  552 	jra	00106$
      0093BB                        553 00105$:
                                    554 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 365: UART2->CR6 &= ((uint8_t)~ UART2_CR6_LASE );
      0093BB A4 EF            [ 1]  555 	and	a, #0xef
      0093BD C7 52 49         [ 1]  556 	ld	0x5249, a
      0093C0                        557 00106$:
                                    558 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 352: UART2->CR6 |=  UART2_CR6_LSLV;
      0093C0 C6 52 49         [ 1]  559 	ld	a, 0x5249
                                    560 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 368: if (UART2_DivUp != UART2_LIN_DIVUP_LBRR1)
      0093C3 0D 05            [ 1]  561 	tnz	(0x05, sp)
      0093C5 27 06            [ 1]  562 	jreq	00108$
                                    563 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 370: UART2->CR6 |=  UART2_CR6_LDUM;
      0093C7 AA 80            [ 1]  564 	or	a, #0x80
      0093C9 C7 52 49         [ 1]  565 	ld	0x5249, a
      0093CC 81               [ 4]  566 	ret
      0093CD                        567 00108$:
                                    568 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 374: UART2->CR6 &= ((uint8_t)~ UART2_CR6_LDUM);
      0093CD A4 7F            [ 1]  569 	and	a, #0x7f
      0093CF C7 52 49         [ 1]  570 	ld	0x5249, a
                                    571 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 376: }
      0093D2 81               [ 4]  572 	ret
                                    573 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 384: void UART2_LINCmd(FunctionalState NewState)
                                    574 ;	-----------------------------------------
                                    575 ;	 function UART2_LINCmd
                                    576 ;	-----------------------------------------
      0093D3                        577 _UART2_LINCmd:
                                    578 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 391: UART2->CR3 |= UART2_CR3_LINEN;
      0093D3 C6 52 46         [ 1]  579 	ld	a, 0x5246
                                    580 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 388: if (NewState != DISABLE)
      0093D6 0D 03            [ 1]  581 	tnz	(0x03, sp)
      0093D8 27 06            [ 1]  582 	jreq	00102$
                                    583 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 391: UART2->CR3 |= UART2_CR3_LINEN;
      0093DA AA 40            [ 1]  584 	or	a, #0x40
      0093DC C7 52 46         [ 1]  585 	ld	0x5246, a
      0093DF 81               [ 4]  586 	ret
      0093E0                        587 00102$:
                                    588 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 396: UART2->CR3 &= ((uint8_t)~UART2_CR3_LINEN);
      0093E0 A4 BF            [ 1]  589 	and	a, #0xbf
      0093E2 C7 52 46         [ 1]  590 	ld	0x5246, a
                                    591 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 398: }
      0093E5 81               [ 4]  592 	ret
                                    593 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 406: void UART2_SmartCardCmd(FunctionalState NewState)
                                    594 ;	-----------------------------------------
                                    595 ;	 function UART2_SmartCardCmd
                                    596 ;	-----------------------------------------
      0093E6                        597 _UART2_SmartCardCmd:
                                    598 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 414: UART2->CR5 |= UART2_CR5_SCEN;
      0093E6 C6 52 48         [ 1]  599 	ld	a, 0x5248
                                    600 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 411: if (NewState != DISABLE)
      0093E9 0D 03            [ 1]  601 	tnz	(0x03, sp)
      0093EB 27 06            [ 1]  602 	jreq	00102$
                                    603 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 414: UART2->CR5 |= UART2_CR5_SCEN;
      0093ED AA 20            [ 1]  604 	or	a, #0x20
      0093EF C7 52 48         [ 1]  605 	ld	0x5248, a
      0093F2 81               [ 4]  606 	ret
      0093F3                        607 00102$:
                                    608 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 419: UART2->CR5 &= ((uint8_t)(~UART2_CR5_SCEN));
      0093F3 A4 DF            [ 1]  609 	and	a, #0xdf
      0093F5 C7 52 48         [ 1]  610 	ld	0x5248, a
                                    611 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 421: }
      0093F8 81               [ 4]  612 	ret
                                    613 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 429: void UART2_SmartCardNACKCmd(FunctionalState NewState)
                                    614 ;	-----------------------------------------
                                    615 ;	 function UART2_SmartCardNACKCmd
                                    616 ;	-----------------------------------------
      0093F9                        617 _UART2_SmartCardNACKCmd:
                                    618 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 437: UART2->CR5 |= UART2_CR5_NACK;
      0093F9 C6 52 48         [ 1]  619 	ld	a, 0x5248
                                    620 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 434: if (NewState != DISABLE)
      0093FC 0D 03            [ 1]  621 	tnz	(0x03, sp)
      0093FE 27 06            [ 1]  622 	jreq	00102$
                                    623 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 437: UART2->CR5 |= UART2_CR5_NACK;
      009400 AA 10            [ 1]  624 	or	a, #0x10
      009402 C7 52 48         [ 1]  625 	ld	0x5248, a
      009405 81               [ 4]  626 	ret
      009406                        627 00102$:
                                    628 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 442: UART2->CR5 &= ((uint8_t)~(UART2_CR5_NACK));
      009406 A4 EF            [ 1]  629 	and	a, #0xef
      009408 C7 52 48         [ 1]  630 	ld	0x5248, a
                                    631 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 444: }
      00940B 81               [ 4]  632 	ret
                                    633 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 452: void UART2_WakeUpConfig(UART2_WakeUp_TypeDef UART2_WakeUp)
                                    634 ;	-----------------------------------------
                                    635 ;	 function UART2_WakeUpConfig
                                    636 ;	-----------------------------------------
      00940C                        637 _UART2_WakeUpConfig:
                                    638 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 456: UART2->CR1 &= ((uint8_t)~UART2_CR1_WAKE);
      00940C 72 17 52 44      [ 1]  639 	bres	21060, #3
                                    640 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 457: UART2->CR1 |= (uint8_t)UART2_WakeUp;
      009410 C6 52 44         [ 1]  641 	ld	a, 0x5244
      009413 1A 03            [ 1]  642 	or	a, (0x03, sp)
      009415 C7 52 44         [ 1]  643 	ld	0x5244, a
                                    644 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 458: }
      009418 81               [ 4]  645 	ret
                                    646 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 466: void UART2_ReceiverWakeUpCmd(FunctionalState NewState)
                                    647 ;	-----------------------------------------
                                    648 ;	 function UART2_ReceiverWakeUpCmd
                                    649 ;	-----------------------------------------
      009419                        650 _UART2_ReceiverWakeUpCmd:
                                    651 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 473: UART2->CR2 |= UART2_CR2_RWU;
      009419 C6 52 45         [ 1]  652 	ld	a, 0x5245
                                    653 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 470: if (NewState != DISABLE)
      00941C 0D 03            [ 1]  654 	tnz	(0x03, sp)
      00941E 27 06            [ 1]  655 	jreq	00102$
                                    656 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 473: UART2->CR2 |= UART2_CR2_RWU;
      009420 AA 02            [ 1]  657 	or	a, #0x02
      009422 C7 52 45         [ 1]  658 	ld	0x5245, a
      009425 81               [ 4]  659 	ret
      009426                        660 00102$:
                                    661 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 478: UART2->CR2 &= ((uint8_t)~UART2_CR2_RWU);
      009426 A4 FD            [ 1]  662 	and	a, #0xfd
      009428 C7 52 45         [ 1]  663 	ld	0x5245, a
                                    664 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 480: }
      00942B 81               [ 4]  665 	ret
                                    666 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 487: uint8_t UART2_ReceiveData8(void)
                                    667 ;	-----------------------------------------
                                    668 ;	 function UART2_ReceiveData8
                                    669 ;	-----------------------------------------
      00942C                        670 _UART2_ReceiveData8:
                                    671 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 489: return ((uint8_t)UART2->DR);
      00942C C6 52 41         [ 1]  672 	ld	a, 0x5241
                                    673 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 490: }
      00942F 81               [ 4]  674 	ret
                                    675 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 497: uint16_t UART2_ReceiveData9(void)
                                    676 ;	-----------------------------------------
                                    677 ;	 function UART2_ReceiveData9
                                    678 ;	-----------------------------------------
      009430                        679 _UART2_ReceiveData9:
      009430 52 02            [ 2]  680 	sub	sp, #2
                                    681 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 501: temp = ((uint16_t)(((uint16_t)((uint16_t)UART2->CR1 & (uint16_t)UART2_CR1_R8)) << 1));
      009432 C6 52 44         [ 1]  682 	ld	a, 0x5244
      009435 A4 80            [ 1]  683 	and	a, #0x80
      009437 97               [ 1]  684 	ld	xl, a
      009438 4F               [ 1]  685 	clr	a
      009439 95               [ 1]  686 	ld	xh, a
      00943A 58               [ 2]  687 	sllw	x
                                    688 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 503: return (uint16_t)((((uint16_t)UART2->DR) | temp) & ((uint16_t)0x01FF));
      00943B C6 52 41         [ 1]  689 	ld	a, 0x5241
      00943E 6B 02            [ 1]  690 	ld	(0x02, sp), a
      009440 0F 01            [ 1]  691 	clr	(0x01, sp)
      009442 9F               [ 1]  692 	ld	a, xl
      009443 1A 02            [ 1]  693 	or	a, (0x02, sp)
      009445 02               [ 1]  694 	rlwa	x
      009446 1A 01            [ 1]  695 	or	a, (0x01, sp)
      009448 A4 01            [ 1]  696 	and	a, #0x01
      00944A 95               [ 1]  697 	ld	xh, a
                                    698 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 504: }
      00944B 5B 02            [ 2]  699 	addw	sp, #2
      00944D 81               [ 4]  700 	ret
                                    701 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 511: void UART2_SendData8(uint8_t Data)
                                    702 ;	-----------------------------------------
                                    703 ;	 function UART2_SendData8
                                    704 ;	-----------------------------------------
      00944E                        705 _UART2_SendData8:
                                    706 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 514: UART2->DR = Data;
      00944E AE 52 41         [ 2]  707 	ldw	x, #0x5241
      009451 7B 03            [ 1]  708 	ld	a, (0x03, sp)
      009453 F7               [ 1]  709 	ld	(x), a
                                    710 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 515: }
      009454 81               [ 4]  711 	ret
                                    712 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 522: void UART2_SendData9(uint16_t Data)
                                    713 ;	-----------------------------------------
                                    714 ;	 function UART2_SendData9
                                    715 ;	-----------------------------------------
      009455                        716 _UART2_SendData9:
      009455 88               [ 1]  717 	push	a
                                    718 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 525: UART2->CR1 &= ((uint8_t)~UART2_CR1_T8);                  
      009456 72 1D 52 44      [ 1]  719 	bres	21060, #6
                                    720 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 528: UART2->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART2_CR1_T8); 
      00945A C6 52 44         [ 1]  721 	ld	a, 0x5244
      00945D 6B 01            [ 1]  722 	ld	(0x01, sp), a
      00945F 1E 04            [ 2]  723 	ldw	x, (0x04, sp)
      009461 54               [ 2]  724 	srlw	x
      009462 54               [ 2]  725 	srlw	x
      009463 9F               [ 1]  726 	ld	a, xl
      009464 A4 40            [ 1]  727 	and	a, #0x40
      009466 1A 01            [ 1]  728 	or	a, (0x01, sp)
      009468 C7 52 44         [ 1]  729 	ld	0x5244, a
                                    730 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 531: UART2->DR   = (uint8_t)(Data);                    
      00946B 7B 05            [ 1]  731 	ld	a, (0x05, sp)
      00946D C7 52 41         [ 1]  732 	ld	0x5241, a
                                    733 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 532: }
      009470 84               [ 1]  734 	pop	a
      009471 81               [ 4]  735 	ret
                                    736 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 539: void UART2_SendBreak(void)
                                    737 ;	-----------------------------------------
                                    738 ;	 function UART2_SendBreak
                                    739 ;	-----------------------------------------
      009472                        740 _UART2_SendBreak:
                                    741 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 541: UART2->CR2 |= UART2_CR2_SBK;
      009472 72 10 52 45      [ 1]  742 	bset	21061, #0
                                    743 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 542: }
      009476 81               [ 4]  744 	ret
                                    745 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 549: void UART2_SetAddress(uint8_t UART2_Address)
                                    746 ;	-----------------------------------------
                                    747 ;	 function UART2_SetAddress
                                    748 ;	-----------------------------------------
      009477                        749 _UART2_SetAddress:
                                    750 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 555: UART2->CR4 &= ((uint8_t)~UART2_CR4_ADD);
      009477 C6 52 47         [ 1]  751 	ld	a, 0x5247
      00947A A4 F0            [ 1]  752 	and	a, #0xf0
      00947C C7 52 47         [ 1]  753 	ld	0x5247, a
                                    754 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 557: UART2->CR4 |= UART2_Address;
      00947F C6 52 47         [ 1]  755 	ld	a, 0x5247
      009482 1A 03            [ 1]  756 	or	a, (0x03, sp)
      009484 C7 52 47         [ 1]  757 	ld	0x5247, a
                                    758 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 558: }
      009487 81               [ 4]  759 	ret
                                    760 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 566: void UART2_SetGuardTime(uint8_t UART2_GuardTime)
                                    761 ;	-----------------------------------------
                                    762 ;	 function UART2_SetGuardTime
                                    763 ;	-----------------------------------------
      009488                        764 _UART2_SetGuardTime:
                                    765 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 569: UART2->GTR = UART2_GuardTime;
      009488 AE 52 4A         [ 2]  766 	ldw	x, #0x524a
      00948B 7B 03            [ 1]  767 	ld	a, (0x03, sp)
      00948D F7               [ 1]  768 	ld	(x), a
                                    769 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 570: }
      00948E 81               [ 4]  770 	ret
                                    771 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 594: void UART2_SetPrescaler(uint8_t UART2_Prescaler)
                                    772 ;	-----------------------------------------
                                    773 ;	 function UART2_SetPrescaler
                                    774 ;	-----------------------------------------
      00948F                        775 _UART2_SetPrescaler:
                                    776 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 597: UART2->PSCR = UART2_Prescaler;
      00948F AE 52 4B         [ 2]  777 	ldw	x, #0x524b
      009492 7B 03            [ 1]  778 	ld	a, (0x03, sp)
      009494 F7               [ 1]  779 	ld	(x), a
                                    780 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 598: }
      009495 81               [ 4]  781 	ret
                                    782 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 606: FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
                                    783 ;	-----------------------------------------
                                    784 ;	 function UART2_GetFlagStatus
                                    785 ;	-----------------------------------------
      009496                        786 _UART2_GetFlagStatus:
      009496 88               [ 1]  787 	push	a
                                    788 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 616: if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
      009497 7B 05            [ 1]  789 	ld	a, (0x05, sp)
      009499 6B 01            [ 1]  790 	ld	(0x01, sp), a
                                    791 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 614: if (UART2_FLAG == UART2_FLAG_LBDF)
      00949B 1E 04            [ 2]  792 	ldw	x, (0x04, sp)
      00949D A3 02 10         [ 2]  793 	cpw	x, #0x0210
      0094A0 26 0E            [ 1]  794 	jrne	00121$
                                    795 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 616: if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
      0094A2 C6 52 47         [ 1]  796 	ld	a, 0x5247
      0094A5 14 01            [ 1]  797 	and	a, (0x01, sp)
      0094A7 27 04            [ 1]  798 	jreq	00102$
                                    799 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 619: status = SET;
      0094A9 A6 01            [ 1]  800 	ld	a, #0x01
      0094AB 20 3F            [ 2]  801 	jra	00122$
      0094AD                        802 00102$:
                                    803 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 624: status = RESET;
      0094AD 4F               [ 1]  804 	clr	a
      0094AE 20 3C            [ 2]  805 	jra	00122$
      0094B0                        806 00121$:
                                    807 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 627: else if (UART2_FLAG == UART2_FLAG_SBK)
      0094B0 1E 04            [ 2]  808 	ldw	x, (0x04, sp)
      0094B2 A3 01 01         [ 2]  809 	cpw	x, #0x0101
      0094B5 26 0E            [ 1]  810 	jrne	00118$
                                    811 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 629: if ((UART2->CR2 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
      0094B7 C6 52 45         [ 1]  812 	ld	a, 0x5245
      0094BA 14 01            [ 1]  813 	and	a, (0x01, sp)
      0094BC 27 04            [ 1]  814 	jreq	00105$
                                    815 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 632: status = SET;
      0094BE A6 01            [ 1]  816 	ld	a, #0x01
      0094C0 20 2A            [ 2]  817 	jra	00122$
      0094C2                        818 00105$:
                                    819 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 637: status = RESET;
      0094C2 4F               [ 1]  820 	clr	a
      0094C3 20 27            [ 2]  821 	jra	00122$
      0094C5                        822 00118$:
                                    823 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 640: else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
      0094C5 1E 04            [ 2]  824 	ldw	x, (0x04, sp)
      0094C7 A3 03 02         [ 2]  825 	cpw	x, #0x0302
      0094CA 27 07            [ 1]  826 	jreq	00113$
      0094CC 1E 04            [ 2]  827 	ldw	x, (0x04, sp)
      0094CE A3 03 01         [ 2]  828 	cpw	x, #0x0301
      0094D1 26 0E            [ 1]  829 	jrne	00114$
      0094D3                        830 00113$:
                                    831 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 642: if ((UART2->CR6 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
      0094D3 C6 52 49         [ 1]  832 	ld	a, 0x5249
      0094D6 14 01            [ 1]  833 	and	a, (0x01, sp)
      0094D8 27 04            [ 1]  834 	jreq	00108$
                                    835 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 645: status = SET;
      0094DA A6 01            [ 1]  836 	ld	a, #0x01
      0094DC 20 0E            [ 2]  837 	jra	00122$
      0094DE                        838 00108$:
                                    839 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 650: status = RESET;
      0094DE 4F               [ 1]  840 	clr	a
      0094DF 20 0B            [ 2]  841 	jra	00122$
      0094E1                        842 00114$:
                                    843 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 655: if ((UART2->SR & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
      0094E1 C6 52 40         [ 1]  844 	ld	a, 0x5240
      0094E4 14 01            [ 1]  845 	and	a, (0x01, sp)
      0094E6 27 03            [ 1]  846 	jreq	00111$
                                    847 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 658: status = SET;
      0094E8 A6 01            [ 1]  848 	ld	a, #0x01
                                    849 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 663: status = RESET;
      0094EA 21                     850 	.byte 0x21
      0094EB                        851 00111$:
      0094EB 4F               [ 1]  852 	clr	a
      0094EC                        853 00122$:
                                    854 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 668: return  status;
                                    855 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 669: }
      0094EC 5B 01            [ 2]  856 	addw	sp, #1
      0094EE 81               [ 4]  857 	ret
                                    858 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 699: void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)
                                    859 ;	-----------------------------------------
                                    860 ;	 function UART2_ClearFlag
                                    861 ;	-----------------------------------------
      0094EF                        862 _UART2_ClearFlag:
                                    863 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 704: if (UART2_FLAG == UART2_FLAG_RXNE)
      0094EF 1E 03            [ 2]  864 	ldw	x, (0x03, sp)
      0094F1 A3 00 20         [ 2]  865 	cpw	x, #0x0020
      0094F4 26 05            [ 1]  866 	jrne	00108$
                                    867 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 706: UART2->SR = (uint8_t)~(UART2_SR_RXNE);
      0094F6 35 DF 52 40      [ 1]  868 	mov	0x5240+0, #0xdf
      0094FA 81               [ 4]  869 	ret
      0094FB                        870 00108$:
                                    871 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 709: else if (UART2_FLAG == UART2_FLAG_LBDF)
      0094FB 1E 03            [ 2]  872 	ldw	x, (0x03, sp)
      0094FD A3 02 10         [ 2]  873 	cpw	x, #0x0210
      009500 26 05            [ 1]  874 	jrne	00105$
                                    875 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 711: UART2->CR4 &= (uint8_t)(~UART2_CR4_LBDF);
      009502 72 19 52 47      [ 1]  876 	bres	21063, #4
      009506 81               [ 4]  877 	ret
      009507                        878 00105$:
                                    879 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 716: UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
      009507 C6 52 49         [ 1]  880 	ld	a, 0x5249
                                    881 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 714: else if (UART2_FLAG == UART2_FLAG_LHDF)
      00950A 1E 03            [ 2]  882 	ldw	x, (0x03, sp)
      00950C A3 03 02         [ 2]  883 	cpw	x, #0x0302
      00950F 26 06            [ 1]  884 	jrne	00102$
                                    885 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 716: UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
      009511 A4 FD            [ 1]  886 	and	a, #0xfd
      009513 C7 52 49         [ 1]  887 	ld	0x5249, a
      009516 81               [ 4]  888 	ret
      009517                        889 00102$:
                                    890 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 721: UART2->CR6 &= (uint8_t)(~UART2_CR6_LSF);
      009517 A4 FE            [ 1]  891 	and	a, #0xfe
      009519 C7 52 49         [ 1]  892 	ld	0x5249, a
                                    893 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 723: }
      00951C 81               [ 4]  894 	ret
                                    895 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 738: ITStatus UART2_GetITStatus(UART2_IT_TypeDef UART2_IT)
                                    896 ;	-----------------------------------------
                                    897 ;	 function UART2_GetITStatus
                                    898 ;	-----------------------------------------
      00951D                        899 _UART2_GetITStatus:
      00951D 52 02            [ 2]  900 	sub	sp, #2
                                    901 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 750: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
      00951F 7B 06            [ 1]  902 	ld	a, (0x06, sp)
      009521 97               [ 1]  903 	ld	xl, a
      009522 A4 0F            [ 1]  904 	and	a, #0x0f
      009524 88               [ 1]  905 	push	a
      009525 A6 01            [ 1]  906 	ld	a, #0x01
      009527 6B 03            [ 1]  907 	ld	(0x03, sp), a
      009529 84               [ 1]  908 	pop	a
      00952A 4D               [ 1]  909 	tnz	a
      00952B 27 05            [ 1]  910 	jreq	00184$
      00952D                        911 00183$:
      00952D 08 02            [ 1]  912 	sll	(0x02, sp)
      00952F 4A               [ 1]  913 	dec	a
      009530 26 FB            [ 1]  914 	jrne	00183$
      009532                        915 00184$:
                                    916 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 752: itmask1 = (uint8_t)((uint8_t)UART2_IT >> (uint8_t)4);
      009532 9F               [ 1]  917 	ld	a, xl
      009533 4E               [ 1]  918 	swap	a
      009534 A4 0F            [ 1]  919 	and	a, #0x0f
                                    920 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 754: itmask2 = (uint8_t)((uint8_t)1 << itmask1);
      009536 88               [ 1]  921 	push	a
      009537 A6 01            [ 1]  922 	ld	a, #0x01
      009539 6B 02            [ 1]  923 	ld	(0x02, sp), a
      00953B 84               [ 1]  924 	pop	a
      00953C 4D               [ 1]  925 	tnz	a
      00953D 27 05            [ 1]  926 	jreq	00186$
      00953F                        927 00185$:
      00953F 08 01            [ 1]  928 	sll	(0x01, sp)
      009541 4A               [ 1]  929 	dec	a
      009542 26 FB            [ 1]  930 	jrne	00185$
      009544                        931 00186$:
                                    932 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 757: if (UART2_IT == UART2_IT_PE)
      009544 1E 05            [ 2]  933 	ldw	x, (0x05, sp)
      009546 A3 01 00         [ 2]  934 	cpw	x, #0x0100
      009549 26 18            [ 1]  935 	jrne	00124$
                                    936 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 760: enablestatus = (uint8_t)((uint8_t)UART2->CR1 & itmask2);
      00954B C6 52 44         [ 1]  937 	ld	a, 0x5244
      00954E 14 01            [ 1]  938 	and	a, (0x01, sp)
      009550 97               [ 1]  939 	ld	xl, a
                                    940 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 763: if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
      009551 C6 52 40         [ 1]  941 	ld	a, 0x5240
      009554 14 02            [ 1]  942 	and	a, (0x02, sp)
      009556 27 08            [ 1]  943 	jreq	00102$
      009558 9F               [ 1]  944 	ld	a, xl
      009559 4D               [ 1]  945 	tnz	a
      00955A 27 04            [ 1]  946 	jreq	00102$
                                    947 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 766: pendingbitstatus = SET;
      00955C A6 01            [ 1]  948 	ld	a, #0x01
      00955E 20 56            [ 2]  949 	jra	00125$
      009560                        950 00102$:
                                    951 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 771: pendingbitstatus = RESET;
      009560 4F               [ 1]  952 	clr	a
      009561 20 53            [ 2]  953 	jra	00125$
      009563                        954 00124$:
                                    955 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 774: else if (UART2_IT == UART2_IT_LBDF)
      009563 1E 05            [ 2]  956 	ldw	x, (0x05, sp)
      009565 A3 03 46         [ 2]  957 	cpw	x, #0x0346
      009568 26 18            [ 1]  958 	jrne	00121$
                                    959 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 777: enablestatus = (uint8_t)((uint8_t)UART2->CR4 & itmask2);
      00956A C6 52 47         [ 1]  960 	ld	a, 0x5247
      00956D 14 01            [ 1]  961 	and	a, (0x01, sp)
      00956F 97               [ 1]  962 	ld	xl, a
                                    963 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 779: if (((UART2->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
      009570 C6 52 47         [ 1]  964 	ld	a, 0x5247
      009573 14 02            [ 1]  965 	and	a, (0x02, sp)
      009575 27 08            [ 1]  966 	jreq	00106$
      009577 9F               [ 1]  967 	ld	a, xl
      009578 4D               [ 1]  968 	tnz	a
      009579 27 04            [ 1]  969 	jreq	00106$
                                    970 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 782: pendingbitstatus = SET;
      00957B A6 01            [ 1]  971 	ld	a, #0x01
      00957D 20 37            [ 2]  972 	jra	00125$
      00957F                        973 00106$:
                                    974 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 787: pendingbitstatus = RESET;
      00957F 4F               [ 1]  975 	clr	a
      009580 20 34            [ 2]  976 	jra	00125$
      009582                        977 00121$:
                                    978 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 790: else if (UART2_IT == UART2_IT_LHDF)
      009582 1E 05            [ 2]  979 	ldw	x, (0x05, sp)
      009584 A3 04 12         [ 2]  980 	cpw	x, #0x0412
      009587 26 18            [ 1]  981 	jrne	00118$
                                    982 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 793: enablestatus = (uint8_t)((uint8_t)UART2->CR6 & itmask2);
      009589 C6 52 49         [ 1]  983 	ld	a, 0x5249
      00958C 14 01            [ 1]  984 	and	a, (0x01, sp)
      00958E 97               [ 1]  985 	ld	xl, a
                                    986 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 795: if (((UART2->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
      00958F C6 52 49         [ 1]  987 	ld	a, 0x5249
      009592 14 02            [ 1]  988 	and	a, (0x02, sp)
      009594 27 08            [ 1]  989 	jreq	00110$
      009596 9F               [ 1]  990 	ld	a, xl
      009597 4D               [ 1]  991 	tnz	a
      009598 27 04            [ 1]  992 	jreq	00110$
                                    993 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 798: pendingbitstatus = SET;
      00959A A6 01            [ 1]  994 	ld	a, #0x01
      00959C 20 18            [ 2]  995 	jra	00125$
      00959E                        996 00110$:
                                    997 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 803: pendingbitstatus = RESET;
      00959E 4F               [ 1]  998 	clr	a
      00959F 20 15            [ 2]  999 	jra	00125$
      0095A1                       1000 00118$:
                                   1001 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 809: enablestatus = (uint8_t)((uint8_t)UART2->CR2 & itmask2);
      0095A1 C6 52 45         [ 1] 1002 	ld	a, 0x5245
      0095A4 14 01            [ 1] 1003 	and	a, (0x01, sp)
      0095A6 97               [ 1] 1004 	ld	xl, a
                                   1005 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 811: if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
      0095A7 C6 52 40         [ 1] 1006 	ld	a, 0x5240
      0095AA 14 02            [ 1] 1007 	and	a, (0x02, sp)
      0095AC 27 07            [ 1] 1008 	jreq	00114$
      0095AE 9F               [ 1] 1009 	ld	a, xl
      0095AF 4D               [ 1] 1010 	tnz	a
      0095B0 27 03            [ 1] 1011 	jreq	00114$
                                   1012 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 814: pendingbitstatus = SET;
      0095B2 A6 01            [ 1] 1013 	ld	a, #0x01
                                   1014 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 819: pendingbitstatus = RESET;
      0095B4 21                    1015 	.byte 0x21
      0095B5                       1016 00114$:
      0095B5 4F               [ 1] 1017 	clr	a
      0095B6                       1018 00125$:
                                   1019 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 823: return  pendingbitstatus;
                                   1020 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 824: }
      0095B6 5B 02            [ 2] 1021 	addw	sp, #2
      0095B8 81               [ 4] 1022 	ret
                                   1023 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 852: void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)
                                   1024 ;	-----------------------------------------
                                   1025 ;	 function UART2_ClearITPendingBit
                                   1026 ;	-----------------------------------------
      0095B9                       1027 _UART2_ClearITPendingBit:
                                   1028 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 857: if (UART2_IT == UART2_IT_RXNE)
      0095B9 1E 03            [ 2] 1029 	ldw	x, (0x03, sp)
      0095BB A3 02 55         [ 2] 1030 	cpw	x, #0x0255
      0095BE 26 05            [ 1] 1031 	jrne	00105$
                                   1032 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 859: UART2->SR = (uint8_t)~(UART2_SR_RXNE);
      0095C0 35 DF 52 40      [ 1] 1033 	mov	0x5240+0, #0xdf
      0095C4 81               [ 4] 1034 	ret
      0095C5                       1035 00105$:
                                   1036 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 862: else if (UART2_IT == UART2_IT_LBDF)
      0095C5 1E 03            [ 2] 1037 	ldw	x, (0x03, sp)
      0095C7 A3 03 46         [ 2] 1038 	cpw	x, #0x0346
      0095CA 26 05            [ 1] 1039 	jrne	00102$
                                   1040 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 864: UART2->CR4 &= (uint8_t)~(UART2_CR4_LBDF);
      0095CC 72 19 52 47      [ 1] 1041 	bres	21063, #4
      0095D0 81               [ 4] 1042 	ret
      0095D1                       1043 00102$:
                                   1044 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 869: UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
      0095D1 72 13 52 49      [ 1] 1045 	bres	21065, #1
                                   1046 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 871: }
      0095D5 81               [ 4] 1047 	ret
                                   1048 	.area CODE
                                   1049 	.area CONST
                                   1050 	.area INITIALIZER
                                   1051 	.area CABS (ABS)
