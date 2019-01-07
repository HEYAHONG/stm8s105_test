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
      009A17                         78 _UART2_DeInit:
                                     79 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 57: (void) UART2->SR;
      009A17 C6 52 40         [ 1]   80 	ld	a, 0x5240
                                     81 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 58: (void)UART2->DR;
      009A1A C6 52 41         [ 1]   82 	ld	a, 0x5241
                                     83 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 60: UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*  Set UART2_BRR2 to reset value 0x00 */
      009A1D 35 00 52 43      [ 1]   84 	mov	0x5243+0, #0x00
                                     85 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 61: UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*  Set UART2_BRR1 to reset value 0x00 */
      009A21 35 00 52 42      [ 1]   86 	mov	0x5242+0, #0x00
                                     87 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 63: UART2->CR1 = UART2_CR1_RESET_VALUE; /*  Set UART2_CR1 to reset value 0x00  */
      009A25 35 00 52 44      [ 1]   88 	mov	0x5244+0, #0x00
                                     89 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 64: UART2->CR2 = UART2_CR2_RESET_VALUE; /*  Set UART2_CR2 to reset value 0x00  */
      009A29 35 00 52 45      [ 1]   90 	mov	0x5245+0, #0x00
                                     91 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 65: UART2->CR3 = UART2_CR3_RESET_VALUE; /*  Set UART2_CR3 to reset value 0x00  */
      009A2D 35 00 52 46      [ 1]   92 	mov	0x5246+0, #0x00
                                     93 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 66: UART2->CR4 = UART2_CR4_RESET_VALUE; /*  Set UART2_CR4 to reset value 0x00  */
      009A31 35 00 52 47      [ 1]   94 	mov	0x5247+0, #0x00
                                     95 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 67: UART2->CR5 = UART2_CR5_RESET_VALUE; /*  Set UART2_CR5 to reset value 0x00  */
      009A35 35 00 52 48      [ 1]   96 	mov	0x5248+0, #0x00
                                     97 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 68: UART2->CR6 = UART2_CR6_RESET_VALUE; /*  Set UART2_CR6 to reset value 0x00  */
      009A39 35 00 52 49      [ 1]   98 	mov	0x5249+0, #0x00
                                     99 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 69: }
      009A3D 81               [ 4]  100 	ret
                                    101 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 85: void UART2_Init(uint32_t BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
                                    102 ;	-----------------------------------------
                                    103 ;	 function UART2_Init
                                    104 ;	-----------------------------------------
      009A3E                        105 _UART2_Init:
      009A3E 52 23            [ 2]  106 	sub	sp, #35
                                    107 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 99: UART2->CR1 &= (uint8_t)(~UART2_CR1_M);
      009A40 72 19 52 44      [ 1]  108 	bres	21060, #4
                                    109 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 101: UART2->CR1 |= (uint8_t)WordLength; 
      009A44 C6 52 44         [ 1]  110 	ld	a, 0x5244
      009A47 1A 2A            [ 1]  111 	or	a, (0x2a, sp)
      009A49 C7 52 44         [ 1]  112 	ld	0x5244, a
                                    113 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 104: UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
      009A4C C6 52 46         [ 1]  114 	ld	a, 0x5246
      009A4F A4 CF            [ 1]  115 	and	a, #0xcf
      009A51 C7 52 46         [ 1]  116 	ld	0x5246, a
                                    117 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 106: UART2->CR3 |= (uint8_t)StopBits; 
      009A54 C6 52 46         [ 1]  118 	ld	a, 0x5246
      009A57 1A 2B            [ 1]  119 	or	a, (0x2b, sp)
      009A59 C7 52 46         [ 1]  120 	ld	0x5246, a
                                    121 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 109: UART2->CR1 &= (uint8_t)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));
      009A5C C6 52 44         [ 1]  122 	ld	a, 0x5244
      009A5F A4 F9            [ 1]  123 	and	a, #0xf9
      009A61 C7 52 44         [ 1]  124 	ld	0x5244, a
                                    125 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 111: UART2->CR1 |= (uint8_t)Parity;
      009A64 C6 52 44         [ 1]  126 	ld	a, 0x5244
      009A67 1A 2C            [ 1]  127 	or	a, (0x2c, sp)
      009A69 C7 52 44         [ 1]  128 	ld	0x5244, a
                                    129 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 114: UART2->BRR1 &= (uint8_t)(~UART2_BRR1_DIVM);
      009A6C C6 52 42         [ 1]  130 	ld	a, 0x5242
      009A6F 35 00 52 42      [ 1]  131 	mov	0x5242+0, #0x00
                                    132 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 116: UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVM);
      009A73 C6 52 43         [ 1]  133 	ld	a, 0x5243
      009A76 A4 0F            [ 1]  134 	and	a, #0x0f
      009A78 C7 52 43         [ 1]  135 	ld	0x5243, a
                                    136 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 118: UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVF);
      009A7B C6 52 43         [ 1]  137 	ld	a, 0x5243
      009A7E A4 F0            [ 1]  138 	and	a, #0xf0
      009A80 C7 52 43         [ 1]  139 	ld	0x5243, a
                                    140 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 121: BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
      009A83 CD A1 3C         [ 4]  141 	call	_CLK_GetClockFreq
      009A86 1F 15            [ 2]  142 	ldw	(0x15, sp), x
      009A88 1E 26            [ 2]  143 	ldw	x, (0x26, sp)
      009A8A 1F 03            [ 2]  144 	ldw	(0x03, sp), x
      009A8C 1E 28            [ 2]  145 	ldw	x, (0x28, sp)
      009A8E A6 04            [ 1]  146 	ld	a, #0x04
      009A90                        147 00127$:
      009A90 58               [ 2]  148 	sllw	x
      009A91 09 04            [ 1]  149 	rlc	(0x04, sp)
      009A93 09 03            [ 1]  150 	rlc	(0x03, sp)
      009A95 4A               [ 1]  151 	dec	a
      009A96 26 F8            [ 1]  152 	jrne	00127$
      009A98 1F 05            [ 2]  153 	ldw	(0x05, sp), x
      009A9A 89               [ 2]  154 	pushw	x
      009A9B 1E 05            [ 2]  155 	ldw	x, (0x05, sp)
      009A9D 89               [ 2]  156 	pushw	x
      009A9E 1E 19            [ 2]  157 	ldw	x, (0x19, sp)
      009AA0 89               [ 2]  158 	pushw	x
      009AA1 90 89            [ 2]  159 	pushw	y
      009AA3 CD A2 CE         [ 4]  160 	call	__divulong
      009AA6 5B 08            [ 2]  161 	addw	sp, #8
      009AA8 1F 21            [ 2]  162 	ldw	(0x21, sp), x
      009AAA 17 1F            [ 2]  163 	ldw	(0x1f, sp), y
      009AAC 16 20            [ 2]  164 	ldw	y, (0x20, sp)
      009AAE 17 20            [ 2]  165 	ldw	(0x20, sp), y
                                    166 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 122: BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
      009AB0 CD A1 3C         [ 4]  167 	call	_CLK_GetClockFreq
      009AB3 1F 0D            [ 2]  168 	ldw	(0x0d, sp), x
      009AB5 17 0B            [ 2]  169 	ldw	(0x0b, sp), y
      009AB7 1E 0D            [ 2]  170 	ldw	x, (0x0d, sp)
      009AB9 89               [ 2]  171 	pushw	x
      009ABA 1E 0D            [ 2]  172 	ldw	x, (0x0d, sp)
      009ABC 89               [ 2]  173 	pushw	x
      009ABD 4B 64            [ 1]  174 	push	#0x64
      009ABF 5F               [ 1]  175 	clrw	x
      009AC0 89               [ 2]  176 	pushw	x
      009AC1 4B 00            [ 1]  177 	push	#0x00
      009AC3 CD A3 7F         [ 4]  178 	call	__mullong
      009AC6 5B 08            [ 2]  179 	addw	sp, #8
      009AC8 1F 19            [ 2]  180 	ldw	(0x19, sp), x
      009ACA 1E 05            [ 2]  181 	ldw	x, (0x05, sp)
      009ACC 89               [ 2]  182 	pushw	x
      009ACD 1E 05            [ 2]  183 	ldw	x, (0x05, sp)
      009ACF 89               [ 2]  184 	pushw	x
      009AD0 1E 1D            [ 2]  185 	ldw	x, (0x1d, sp)
      009AD2 89               [ 2]  186 	pushw	x
      009AD3 90 89            [ 2]  187 	pushw	y
      009AD5 CD A2 CE         [ 4]  188 	call	__divulong
      009AD8 5B 08            [ 2]  189 	addw	sp, #8
      009ADA 1F 1D            [ 2]  190 	ldw	(0x1d, sp), x
      009ADC 17 1B            [ 2]  191 	ldw	(0x1b, sp), y
                                    192 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 126: BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
      009ADE 1E 21            [ 2]  193 	ldw	x, (0x21, sp)
      009AE0 89               [ 2]  194 	pushw	x
      009AE1 1E 21            [ 2]  195 	ldw	x, (0x21, sp)
      009AE3 89               [ 2]  196 	pushw	x
      009AE4 4B 64            [ 1]  197 	push	#0x64
      009AE6 5F               [ 1]  198 	clrw	x
      009AE7 89               [ 2]  199 	pushw	x
      009AE8 4B 00            [ 1]  200 	push	#0x00
      009AEA CD A3 7F         [ 4]  201 	call	__mullong
      009AED 5B 08            [ 2]  202 	addw	sp, #8
      009AEF 1F 11            [ 2]  203 	ldw	(0x11, sp), x
      009AF1 17 0F            [ 2]  204 	ldw	(0x0f, sp), y
      009AF3 1E 1D            [ 2]  205 	ldw	x, (0x1d, sp)
      009AF5 72 F0 11         [ 2]  206 	subw	x, (0x11, sp)
      009AF8 1F 09            [ 2]  207 	ldw	(0x09, sp), x
      009AFA 7B 1C            [ 1]  208 	ld	a, (0x1c, sp)
      009AFC 12 10            [ 1]  209 	sbc	a, (0x10, sp)
      009AFE 6B 08            [ 1]  210 	ld	(0x08, sp), a
      009B00 7B 1B            [ 1]  211 	ld	a, (0x1b, sp)
      009B02 12 0F            [ 1]  212 	sbc	a, (0x0f, sp)
      009B04 6B 07            [ 1]  213 	ld	(0x07, sp), a
      009B06 1E 09            [ 2]  214 	ldw	x, (0x09, sp)
      009B08 16 07            [ 2]  215 	ldw	y, (0x07, sp)
      009B0A A6 04            [ 1]  216 	ld	a, #0x04
      009B0C                        217 00129$:
      009B0C 58               [ 2]  218 	sllw	x
      009B0D 90 59            [ 2]  219 	rlcw	y
      009B0F 4A               [ 1]  220 	dec	a
      009B10 26 FA            [ 1]  221 	jrne	00129$
      009B12 4B 64            [ 1]  222 	push	#0x64
      009B14 4B 00            [ 1]  223 	push	#0x00
      009B16 4B 00            [ 1]  224 	push	#0x00
      009B18 4B 00            [ 1]  225 	push	#0x00
      009B1A 89               [ 2]  226 	pushw	x
      009B1B 90 89            [ 2]  227 	pushw	y
      009B1D CD A2 CE         [ 4]  228 	call	__divulong
      009B20 5B 08            [ 2]  229 	addw	sp, #8
      009B22 9F               [ 1]  230 	ld	a, xl
      009B23 A4 0F            [ 1]  231 	and	a, #0x0f
      009B25 6B 23            [ 1]  232 	ld	(0x23, sp), a
                                    233 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 128: BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
      009B27 1E 21            [ 2]  234 	ldw	x, (0x21, sp)
      009B29 A6 10            [ 1]  235 	ld	a, #0x10
      009B2B 62               [ 2]  236 	div	x, a
      009B2C 9F               [ 1]  237 	ld	a, xl
      009B2D A4 F0            [ 1]  238 	and	a, #0xf0
                                    239 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 130: UART2->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
      009B2F 1A 23            [ 1]  240 	or	a, (0x23, sp)
      009B31 C7 52 43         [ 1]  241 	ld	0x5243, a
                                    242 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 132: UART2->BRR1 = (uint8_t)BaudRate_Mantissa;           
      009B34 7B 22            [ 1]  243 	ld	a, (0x22, sp)
      009B36 C7 52 42         [ 1]  244 	ld	0x5242, a
                                    245 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 135: UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
      009B39 C6 52 45         [ 1]  246 	ld	a, 0x5245
      009B3C A4 F3            [ 1]  247 	and	a, #0xf3
      009B3E C7 52 45         [ 1]  248 	ld	0x5245, a
                                    249 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 137: UART2->CR3 &= (uint8_t)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL);
      009B41 C6 52 46         [ 1]  250 	ld	a, 0x5246
      009B44 A4 F8            [ 1]  251 	and	a, #0xf8
      009B46 C7 52 46         [ 1]  252 	ld	0x5246, a
                                    253 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 139: UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART2_CR3_CPOL | \
      009B49 C6 52 46         [ 1]  254 	ld	a, 0x5246
      009B4C 6B 02            [ 1]  255 	ld	(0x02, sp), a
      009B4E 7B 2D            [ 1]  256 	ld	a, (0x2d, sp)
      009B50 A4 07            [ 1]  257 	and	a, #0x07
      009B52 1A 02            [ 1]  258 	or	a, (0x02, sp)
      009B54 C7 52 46         [ 1]  259 	ld	0x5246, a
                                    260 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 135: UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
      009B57 C6 52 45         [ 1]  261 	ld	a, 0x5245
                                    262 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 142: if ((uint8_t)(Mode & UART2_MODE_TX_ENABLE))
      009B5A 88               [ 1]  263 	push	a
      009B5B 7B 2F            [ 1]  264 	ld	a, (0x2f, sp)
      009B5D A5 04            [ 1]  265 	bcp	a, #0x04
      009B5F 84               [ 1]  266 	pop	a
      009B60 27 07            [ 1]  267 	jreq	00102$
                                    268 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 145: UART2->CR2 |= (uint8_t)UART2_CR2_TEN;
      009B62 AA 08            [ 1]  269 	or	a, #0x08
      009B64 C7 52 45         [ 1]  270 	ld	0x5245, a
      009B67 20 05            [ 2]  271 	jra	00103$
      009B69                        272 00102$:
                                    273 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 150: UART2->CR2 &= (uint8_t)(~UART2_CR2_TEN);
      009B69 A4 F7            [ 1]  274 	and	a, #0xf7
      009B6B C7 52 45         [ 1]  275 	ld	0x5245, a
      009B6E                        276 00103$:
                                    277 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 135: UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
      009B6E C6 52 45         [ 1]  278 	ld	a, 0x5245
                                    279 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 152: if ((uint8_t)(Mode & UART2_MODE_RX_ENABLE))
      009B71 88               [ 1]  280 	push	a
      009B72 7B 2F            [ 1]  281 	ld	a, (0x2f, sp)
      009B74 A5 08            [ 1]  282 	bcp	a, #0x08
      009B76 84               [ 1]  283 	pop	a
      009B77 27 07            [ 1]  284 	jreq	00105$
                                    285 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 155: UART2->CR2 |= (uint8_t)UART2_CR2_REN;
      009B79 AA 04            [ 1]  286 	or	a, #0x04
      009B7B C7 52 45         [ 1]  287 	ld	0x5245, a
      009B7E 20 05            [ 2]  288 	jra	00106$
      009B80                        289 00105$:
                                    290 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 160: UART2->CR2 &= (uint8_t)(~UART2_CR2_REN);
      009B80 A4 FB            [ 1]  291 	and	a, #0xfb
      009B82 C7 52 45         [ 1]  292 	ld	0x5245, a
      009B85                        293 00106$:
                                    294 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 104: UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
      009B85 C6 52 46         [ 1]  295 	ld	a, 0x5246
                                    296 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 164: if ((uint8_t)(SyncMode & UART2_SYNCMODE_CLOCK_DISABLE))
      009B88 0D 2D            [ 1]  297 	tnz	(0x2d, sp)
      009B8A 2A 07            [ 1]  298 	jrpl	00108$
                                    299 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 167: UART2->CR3 &= (uint8_t)(~UART2_CR3_CKEN); 
      009B8C A4 F7            [ 1]  300 	and	a, #0xf7
      009B8E C7 52 46         [ 1]  301 	ld	0x5246, a
      009B91 20 0D            [ 2]  302 	jra	00110$
      009B93                        303 00108$:
                                    304 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 171: UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & UART2_CR3_CKEN);
      009B93 88               [ 1]  305 	push	a
      009B94 7B 2E            [ 1]  306 	ld	a, (0x2e, sp)
      009B96 A4 08            [ 1]  307 	and	a, #0x08
      009B98 6B 02            [ 1]  308 	ld	(0x02, sp), a
      009B9A 84               [ 1]  309 	pop	a
      009B9B 1A 01            [ 1]  310 	or	a, (0x01, sp)
      009B9D C7 52 46         [ 1]  311 	ld	0x5246, a
      009BA0                        312 00110$:
                                    313 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 173: }
      009BA0 5B 23            [ 2]  314 	addw	sp, #35
      009BA2 81               [ 4]  315 	ret
                                    316 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 181: void UART2_Cmd(FunctionalState NewState)
                                    317 ;	-----------------------------------------
                                    318 ;	 function UART2_Cmd
                                    319 ;	-----------------------------------------
      009BA3                        320 _UART2_Cmd:
                                    321 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 186: UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
      009BA3 C6 52 44         [ 1]  322 	ld	a, 0x5244
                                    323 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 183: if (NewState != DISABLE)
      009BA6 0D 03            [ 1]  324 	tnz	(0x03, sp)
      009BA8 27 06            [ 1]  325 	jreq	00102$
                                    326 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 186: UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
      009BAA A4 DF            [ 1]  327 	and	a, #0xdf
      009BAC C7 52 44         [ 1]  328 	ld	0x5244, a
      009BAF 81               [ 4]  329 	ret
      009BB0                        330 00102$:
                                    331 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 191: UART2->CR1 |= UART2_CR1_UARTD; 
      009BB0 AA 20            [ 1]  332 	or	a, #0x20
      009BB2 C7 52 44         [ 1]  333 	ld	0x5244, a
                                    334 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 193: }
      009BB5 81               [ 4]  335 	ret
                                    336 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 210: void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)
                                    337 ;	-----------------------------------------
                                    338 ;	 function UART2_ITConfig
                                    339 ;	-----------------------------------------
      009BB6                        340 _UART2_ITConfig:
      009BB6 52 04            [ 2]  341 	sub	sp, #4
                                    342 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 219: uartreg = (uint8_t)((uint16_t)UART2_IT >> 0x08);
      009BB8 7B 07            [ 1]  343 	ld	a, (0x07, sp)
      009BBA 97               [ 1]  344 	ld	xl, a
                                    345 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 222: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
      009BBB 7B 08            [ 1]  346 	ld	a, (0x08, sp)
      009BBD A4 0F            [ 1]  347 	and	a, #0x0f
      009BBF 88               [ 1]  348 	push	a
      009BC0 A6 01            [ 1]  349 	ld	a, #0x01
      009BC2 6B 03            [ 1]  350 	ld	(0x03, sp), a
      009BC4 84               [ 1]  351 	pop	a
      009BC5 4D               [ 1]  352 	tnz	a
      009BC6 27 05            [ 1]  353 	jreq	00160$
      009BC8                        354 00159$:
      009BC8 08 02            [ 1]  355 	sll	(0x02, sp)
      009BCA 4A               [ 1]  356 	dec	a
      009BCB 26 FB            [ 1]  357 	jrne	00159$
      009BCD                        358 00160$:
                                    359 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 227: if (uartreg == 0x01)
      009BCD 9F               [ 1]  360 	ld	a, xl
      009BCE 4A               [ 1]  361 	dec	a
      009BCF 26 05            [ 1]  362 	jrne	00162$
      009BD1 A6 01            [ 1]  363 	ld	a, #0x01
      009BD3 6B 01            [ 1]  364 	ld	(0x01, sp), a
      009BD5 C1                     365 	.byte 0xc1
      009BD6                        366 00162$:
      009BD6 0F 01            [ 1]  367 	clr	(0x01, sp)
      009BD8                        368 00163$:
                                    369 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 231: else if (uartreg == 0x02)
      009BD8 9F               [ 1]  370 	ld	a, xl
      009BD9 A0 02            [ 1]  371 	sub	a, #0x02
      009BDB 26 04            [ 1]  372 	jrne	00165$
      009BDD 4C               [ 1]  373 	inc	a
      009BDE 6B 04            [ 1]  374 	ld	(0x04, sp), a
      009BE0 C1                     375 	.byte 0xc1
      009BE1                        376 00165$:
      009BE1 0F 04            [ 1]  377 	clr	(0x04, sp)
      009BE3                        378 00166$:
                                    379 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 235: else if (uartreg == 0x03)
      009BE3 9F               [ 1]  380 	ld	a, xl
      009BE4 A0 03            [ 1]  381 	sub	a, #0x03
      009BE6 26 02            [ 1]  382 	jrne	00168$
      009BE8 4C               [ 1]  383 	inc	a
      009BE9 21                     384 	.byte 0x21
      009BEA                        385 00168$:
      009BEA 4F               [ 1]  386 	clr	a
      009BEB                        387 00169$:
                                    388 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 224: if (NewState != DISABLE)
      009BEB 0D 09            [ 1]  389 	tnz	(0x09, sp)
      009BED 27 33            [ 1]  390 	jreq	00120$
                                    391 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 227: if (uartreg == 0x01)
      009BEF 0D 01            [ 1]  392 	tnz	(0x01, sp)
      009BF1 27 0A            [ 1]  393 	jreq	00108$
                                    394 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 229: UART2->CR1 |= itpos;
      009BF3 C6 52 44         [ 1]  395 	ld	a, 0x5244
      009BF6 1A 02            [ 1]  396 	or	a, (0x02, sp)
      009BF8 C7 52 44         [ 1]  397 	ld	0x5244, a
      009BFB 20 5D            [ 2]  398 	jra	00122$
      009BFD                        399 00108$:
                                    400 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 231: else if (uartreg == 0x02)
      009BFD 0D 04            [ 1]  401 	tnz	(0x04, sp)
      009BFF 27 0A            [ 1]  402 	jreq	00105$
                                    403 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 233: UART2->CR2 |= itpos;
      009C01 C6 52 45         [ 1]  404 	ld	a, 0x5245
      009C04 1A 02            [ 1]  405 	or	a, (0x02, sp)
      009C06 C7 52 45         [ 1]  406 	ld	0x5245, a
      009C09 20 4F            [ 2]  407 	jra	00122$
      009C0B                        408 00105$:
                                    409 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 235: else if (uartreg == 0x03)
      009C0B 4D               [ 1]  410 	tnz	a
      009C0C 27 0A            [ 1]  411 	jreq	00102$
                                    412 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 237: UART2->CR4 |= itpos;
      009C0E C6 52 47         [ 1]  413 	ld	a, 0x5247
      009C11 1A 02            [ 1]  414 	or	a, (0x02, sp)
      009C13 C7 52 47         [ 1]  415 	ld	0x5247, a
      009C16 20 42            [ 2]  416 	jra	00122$
      009C18                        417 00102$:
                                    418 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 241: UART2->CR6 |= itpos;
      009C18 C6 52 49         [ 1]  419 	ld	a, 0x5249
      009C1B 1A 02            [ 1]  420 	or	a, (0x02, sp)
      009C1D C7 52 49         [ 1]  421 	ld	0x5249, a
      009C20 20 38            [ 2]  422 	jra	00122$
      009C22                        423 00120$:
                                    424 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 249: UART2->CR1 &= (uint8_t)(~itpos);
      009C22 88               [ 1]  425 	push	a
      009C23 7B 03            [ 1]  426 	ld	a, (0x03, sp)
      009C25 43               [ 1]  427 	cpl	a
      009C26 6B 04            [ 1]  428 	ld	(0x04, sp), a
      009C28 84               [ 1]  429 	pop	a
                                    430 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 247: if (uartreg == 0x01)
      009C29 0D 01            [ 1]  431 	tnz	(0x01, sp)
      009C2B 27 0A            [ 1]  432 	jreq	00117$
                                    433 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 249: UART2->CR1 &= (uint8_t)(~itpos);
      009C2D C6 52 44         [ 1]  434 	ld	a, 0x5244
      009C30 14 03            [ 1]  435 	and	a, (0x03, sp)
      009C32 C7 52 44         [ 1]  436 	ld	0x5244, a
      009C35 20 23            [ 2]  437 	jra	00122$
      009C37                        438 00117$:
                                    439 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 251: else if (uartreg == 0x02)
      009C37 0D 04            [ 1]  440 	tnz	(0x04, sp)
      009C39 27 0A            [ 1]  441 	jreq	00114$
                                    442 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 253: UART2->CR2 &= (uint8_t)(~itpos);
      009C3B C6 52 45         [ 1]  443 	ld	a, 0x5245
      009C3E 14 03            [ 1]  444 	and	a, (0x03, sp)
      009C40 C7 52 45         [ 1]  445 	ld	0x5245, a
      009C43 20 15            [ 2]  446 	jra	00122$
      009C45                        447 00114$:
                                    448 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 255: else if (uartreg == 0x03)
      009C45 4D               [ 1]  449 	tnz	a
      009C46 27 0A            [ 1]  450 	jreq	00111$
                                    451 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 257: UART2->CR4 &= (uint8_t)(~itpos);
      009C48 C6 52 47         [ 1]  452 	ld	a, 0x5247
      009C4B 14 03            [ 1]  453 	and	a, (0x03, sp)
      009C4D C7 52 47         [ 1]  454 	ld	0x5247, a
      009C50 20 08            [ 2]  455 	jra	00122$
      009C52                        456 00111$:
                                    457 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 261: UART2->CR6 &= (uint8_t)(~itpos);
      009C52 C6 52 49         [ 1]  458 	ld	a, 0x5249
      009C55 14 03            [ 1]  459 	and	a, (0x03, sp)
      009C57 C7 52 49         [ 1]  460 	ld	0x5249, a
      009C5A                        461 00122$:
                                    462 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 264: }
      009C5A 5B 04            [ 2]  463 	addw	sp, #4
      009C5C 81               [ 4]  464 	ret
                                    465 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 272: void UART2_IrDAConfig(UART2_IrDAMode_TypeDef UART2_IrDAMode)
                                    466 ;	-----------------------------------------
                                    467 ;	 function UART2_IrDAConfig
                                    468 ;	-----------------------------------------
      009C5D                        469 _UART2_IrDAConfig:
                                    470 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 278: UART2->CR5 |= UART2_CR5_IRLP;
      009C5D C6 52 48         [ 1]  471 	ld	a, 0x5248
                                    472 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 276: if (UART2_IrDAMode != UART2_IRDAMODE_NORMAL)
      009C60 0D 03            [ 1]  473 	tnz	(0x03, sp)
      009C62 27 06            [ 1]  474 	jreq	00102$
                                    475 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 278: UART2->CR5 |= UART2_CR5_IRLP;
      009C64 AA 04            [ 1]  476 	or	a, #0x04
      009C66 C7 52 48         [ 1]  477 	ld	0x5248, a
      009C69 81               [ 4]  478 	ret
      009C6A                        479 00102$:
                                    480 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 282: UART2->CR5 &= ((uint8_t)~UART2_CR5_IRLP);
      009C6A A4 FB            [ 1]  481 	and	a, #0xfb
      009C6C C7 52 48         [ 1]  482 	ld	0x5248, a
                                    483 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 284: }
      009C6F 81               [ 4]  484 	ret
                                    485 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 292: void UART2_IrDACmd(FunctionalState NewState)
                                    486 ;	-----------------------------------------
                                    487 ;	 function UART2_IrDACmd
                                    488 ;	-----------------------------------------
      009C70                        489 _UART2_IrDACmd:
                                    490 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 300: UART2->CR5 |= UART2_CR5_IREN;
      009C70 C6 52 48         [ 1]  491 	ld	a, 0x5248
                                    492 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 297: if (NewState != DISABLE)
      009C73 0D 03            [ 1]  493 	tnz	(0x03, sp)
      009C75 27 06            [ 1]  494 	jreq	00102$
                                    495 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 300: UART2->CR5 |= UART2_CR5_IREN;
      009C77 AA 02            [ 1]  496 	or	a, #0x02
      009C79 C7 52 48         [ 1]  497 	ld	0x5248, a
      009C7C 81               [ 4]  498 	ret
      009C7D                        499 00102$:
                                    500 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 305: UART2->CR5 &= ((uint8_t)~UART2_CR5_IREN);
      009C7D A4 FD            [ 1]  501 	and	a, #0xfd
      009C7F C7 52 48         [ 1]  502 	ld	0x5248, a
                                    503 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 307: }
      009C82 81               [ 4]  504 	ret
                                    505 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 316: void UART2_LINBreakDetectionConfig(UART2_LINBreakDetectionLength_TypeDef UART2_LINBreakDetectionLength)
                                    506 ;	-----------------------------------------
                                    507 ;	 function UART2_LINBreakDetectionConfig
                                    508 ;	-----------------------------------------
      009C83                        509 _UART2_LINBreakDetectionConfig:
                                    510 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 323: UART2->CR4 |= UART2_CR4_LBDL;
      009C83 C6 52 47         [ 1]  511 	ld	a, 0x5247
                                    512 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 321: if (UART2_LINBreakDetectionLength != UART2_LINBREAKDETECTIONLENGTH_10BITS)
      009C86 0D 03            [ 1]  513 	tnz	(0x03, sp)
      009C88 27 06            [ 1]  514 	jreq	00102$
                                    515 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 323: UART2->CR4 |= UART2_CR4_LBDL;
      009C8A AA 20            [ 1]  516 	or	a, #0x20
      009C8C C7 52 47         [ 1]  517 	ld	0x5247, a
      009C8F 81               [ 4]  518 	ret
      009C90                        519 00102$:
                                    520 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 327: UART2->CR4 &= ((uint8_t)~UART2_CR4_LBDL);
      009C90 A4 DF            [ 1]  521 	and	a, #0xdf
      009C92 C7 52 47         [ 1]  522 	ld	0x5247, a
                                    523 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 329: }
      009C95 81               [ 4]  524 	ret
                                    525 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 341: void UART2_LINConfig(UART2_LinMode_TypeDef UART2_Mode, 
                                    526 ;	-----------------------------------------
                                    527 ;	 function UART2_LINConfig
                                    528 ;	-----------------------------------------
      009C96                        529 _UART2_LINConfig:
                                    530 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 352: UART2->CR6 |=  UART2_CR6_LSLV;
      009C96 C6 52 49         [ 1]  531 	ld	a, 0x5249
                                    532 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 350: if (UART2_Mode != UART2_LIN_MODE_MASTER)
      009C99 0D 03            [ 1]  533 	tnz	(0x03, sp)
      009C9B 27 07            [ 1]  534 	jreq	00102$
                                    535 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 352: UART2->CR6 |=  UART2_CR6_LSLV;
      009C9D AA 20            [ 1]  536 	or	a, #0x20
      009C9F C7 52 49         [ 1]  537 	ld	0x5249, a
      009CA2 20 05            [ 2]  538 	jra	00103$
      009CA4                        539 00102$:
                                    540 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 356: UART2->CR6 &= ((uint8_t)~UART2_CR6_LSLV);
      009CA4 A4 DF            [ 1]  541 	and	a, #0xdf
      009CA6 C7 52 49         [ 1]  542 	ld	0x5249, a
      009CA9                        543 00103$:
                                    544 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 352: UART2->CR6 |=  UART2_CR6_LSLV;
      009CA9 C6 52 49         [ 1]  545 	ld	a, 0x5249
                                    546 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 359: if (UART2_Autosync != UART2_LIN_AUTOSYNC_DISABLE)
      009CAC 0D 04            [ 1]  547 	tnz	(0x04, sp)
      009CAE 27 07            [ 1]  548 	jreq	00105$
                                    549 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 361: UART2->CR6 |=  UART2_CR6_LASE ;
      009CB0 AA 10            [ 1]  550 	or	a, #0x10
      009CB2 C7 52 49         [ 1]  551 	ld	0x5249, a
      009CB5 20 05            [ 2]  552 	jra	00106$
      009CB7                        553 00105$:
                                    554 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 365: UART2->CR6 &= ((uint8_t)~ UART2_CR6_LASE );
      009CB7 A4 EF            [ 1]  555 	and	a, #0xef
      009CB9 C7 52 49         [ 1]  556 	ld	0x5249, a
      009CBC                        557 00106$:
                                    558 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 352: UART2->CR6 |=  UART2_CR6_LSLV;
      009CBC C6 52 49         [ 1]  559 	ld	a, 0x5249
                                    560 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 368: if (UART2_DivUp != UART2_LIN_DIVUP_LBRR1)
      009CBF 0D 05            [ 1]  561 	tnz	(0x05, sp)
      009CC1 27 06            [ 1]  562 	jreq	00108$
                                    563 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 370: UART2->CR6 |=  UART2_CR6_LDUM;
      009CC3 AA 80            [ 1]  564 	or	a, #0x80
      009CC5 C7 52 49         [ 1]  565 	ld	0x5249, a
      009CC8 81               [ 4]  566 	ret
      009CC9                        567 00108$:
                                    568 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 374: UART2->CR6 &= ((uint8_t)~ UART2_CR6_LDUM);
      009CC9 A4 7F            [ 1]  569 	and	a, #0x7f
      009CCB C7 52 49         [ 1]  570 	ld	0x5249, a
                                    571 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 376: }
      009CCE 81               [ 4]  572 	ret
                                    573 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 384: void UART2_LINCmd(FunctionalState NewState)
                                    574 ;	-----------------------------------------
                                    575 ;	 function UART2_LINCmd
                                    576 ;	-----------------------------------------
      009CCF                        577 _UART2_LINCmd:
                                    578 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 391: UART2->CR3 |= UART2_CR3_LINEN;
      009CCF C6 52 46         [ 1]  579 	ld	a, 0x5246
                                    580 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 388: if (NewState != DISABLE)
      009CD2 0D 03            [ 1]  581 	tnz	(0x03, sp)
      009CD4 27 06            [ 1]  582 	jreq	00102$
                                    583 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 391: UART2->CR3 |= UART2_CR3_LINEN;
      009CD6 AA 40            [ 1]  584 	or	a, #0x40
      009CD8 C7 52 46         [ 1]  585 	ld	0x5246, a
      009CDB 81               [ 4]  586 	ret
      009CDC                        587 00102$:
                                    588 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 396: UART2->CR3 &= ((uint8_t)~UART2_CR3_LINEN);
      009CDC A4 BF            [ 1]  589 	and	a, #0xbf
      009CDE C7 52 46         [ 1]  590 	ld	0x5246, a
                                    591 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 398: }
      009CE1 81               [ 4]  592 	ret
                                    593 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 406: void UART2_SmartCardCmd(FunctionalState NewState)
                                    594 ;	-----------------------------------------
                                    595 ;	 function UART2_SmartCardCmd
                                    596 ;	-----------------------------------------
      009CE2                        597 _UART2_SmartCardCmd:
                                    598 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 414: UART2->CR5 |= UART2_CR5_SCEN;
      009CE2 C6 52 48         [ 1]  599 	ld	a, 0x5248
                                    600 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 411: if (NewState != DISABLE)
      009CE5 0D 03            [ 1]  601 	tnz	(0x03, sp)
      009CE7 27 06            [ 1]  602 	jreq	00102$
                                    603 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 414: UART2->CR5 |= UART2_CR5_SCEN;
      009CE9 AA 20            [ 1]  604 	or	a, #0x20
      009CEB C7 52 48         [ 1]  605 	ld	0x5248, a
      009CEE 81               [ 4]  606 	ret
      009CEF                        607 00102$:
                                    608 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 419: UART2->CR5 &= ((uint8_t)(~UART2_CR5_SCEN));
      009CEF A4 DF            [ 1]  609 	and	a, #0xdf
      009CF1 C7 52 48         [ 1]  610 	ld	0x5248, a
                                    611 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 421: }
      009CF4 81               [ 4]  612 	ret
                                    613 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 429: void UART2_SmartCardNACKCmd(FunctionalState NewState)
                                    614 ;	-----------------------------------------
                                    615 ;	 function UART2_SmartCardNACKCmd
                                    616 ;	-----------------------------------------
      009CF5                        617 _UART2_SmartCardNACKCmd:
                                    618 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 437: UART2->CR5 |= UART2_CR5_NACK;
      009CF5 C6 52 48         [ 1]  619 	ld	a, 0x5248
                                    620 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 434: if (NewState != DISABLE)
      009CF8 0D 03            [ 1]  621 	tnz	(0x03, sp)
      009CFA 27 06            [ 1]  622 	jreq	00102$
                                    623 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 437: UART2->CR5 |= UART2_CR5_NACK;
      009CFC AA 10            [ 1]  624 	or	a, #0x10
      009CFE C7 52 48         [ 1]  625 	ld	0x5248, a
      009D01 81               [ 4]  626 	ret
      009D02                        627 00102$:
                                    628 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 442: UART2->CR5 &= ((uint8_t)~(UART2_CR5_NACK));
      009D02 A4 EF            [ 1]  629 	and	a, #0xef
      009D04 C7 52 48         [ 1]  630 	ld	0x5248, a
                                    631 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 444: }
      009D07 81               [ 4]  632 	ret
                                    633 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 452: void UART2_WakeUpConfig(UART2_WakeUp_TypeDef UART2_WakeUp)
                                    634 ;	-----------------------------------------
                                    635 ;	 function UART2_WakeUpConfig
                                    636 ;	-----------------------------------------
      009D08                        637 _UART2_WakeUpConfig:
                                    638 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 456: UART2->CR1 &= ((uint8_t)~UART2_CR1_WAKE);
      009D08 72 17 52 44      [ 1]  639 	bres	21060, #3
                                    640 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 457: UART2->CR1 |= (uint8_t)UART2_WakeUp;
      009D0C C6 52 44         [ 1]  641 	ld	a, 0x5244
      009D0F 1A 03            [ 1]  642 	or	a, (0x03, sp)
      009D11 C7 52 44         [ 1]  643 	ld	0x5244, a
                                    644 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 458: }
      009D14 81               [ 4]  645 	ret
                                    646 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 466: void UART2_ReceiverWakeUpCmd(FunctionalState NewState)
                                    647 ;	-----------------------------------------
                                    648 ;	 function UART2_ReceiverWakeUpCmd
                                    649 ;	-----------------------------------------
      009D15                        650 _UART2_ReceiverWakeUpCmd:
                                    651 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 473: UART2->CR2 |= UART2_CR2_RWU;
      009D15 C6 52 45         [ 1]  652 	ld	a, 0x5245
                                    653 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 470: if (NewState != DISABLE)
      009D18 0D 03            [ 1]  654 	tnz	(0x03, sp)
      009D1A 27 06            [ 1]  655 	jreq	00102$
                                    656 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 473: UART2->CR2 |= UART2_CR2_RWU;
      009D1C AA 02            [ 1]  657 	or	a, #0x02
      009D1E C7 52 45         [ 1]  658 	ld	0x5245, a
      009D21 81               [ 4]  659 	ret
      009D22                        660 00102$:
                                    661 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 478: UART2->CR2 &= ((uint8_t)~UART2_CR2_RWU);
      009D22 A4 FD            [ 1]  662 	and	a, #0xfd
      009D24 C7 52 45         [ 1]  663 	ld	0x5245, a
                                    664 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 480: }
      009D27 81               [ 4]  665 	ret
                                    666 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 487: uint8_t UART2_ReceiveData8(void)
                                    667 ;	-----------------------------------------
                                    668 ;	 function UART2_ReceiveData8
                                    669 ;	-----------------------------------------
      009D28                        670 _UART2_ReceiveData8:
                                    671 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 489: return ((uint8_t)UART2->DR);
      009D28 C6 52 41         [ 1]  672 	ld	a, 0x5241
                                    673 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 490: }
      009D2B 81               [ 4]  674 	ret
                                    675 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 497: uint16_t UART2_ReceiveData9(void)
                                    676 ;	-----------------------------------------
                                    677 ;	 function UART2_ReceiveData9
                                    678 ;	-----------------------------------------
      009D2C                        679 _UART2_ReceiveData9:
      009D2C 52 02            [ 2]  680 	sub	sp, #2
                                    681 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 501: temp = ((uint16_t)(((uint16_t)((uint16_t)UART2->CR1 & (uint16_t)UART2_CR1_R8)) << 1));
      009D2E C6 52 44         [ 1]  682 	ld	a, 0x5244
      009D31 A4 80            [ 1]  683 	and	a, #0x80
      009D33 97               [ 1]  684 	ld	xl, a
      009D34 4F               [ 1]  685 	clr	a
      009D35 95               [ 1]  686 	ld	xh, a
      009D36 58               [ 2]  687 	sllw	x
                                    688 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 503: return (uint16_t)((((uint16_t)UART2->DR) | temp) & ((uint16_t)0x01FF));
      009D37 C6 52 41         [ 1]  689 	ld	a, 0x5241
      009D3A 6B 02            [ 1]  690 	ld	(0x02, sp), a
      009D3C 0F 01            [ 1]  691 	clr	(0x01, sp)
      009D3E 9F               [ 1]  692 	ld	a, xl
      009D3F 1A 02            [ 1]  693 	or	a, (0x02, sp)
      009D41 02               [ 1]  694 	rlwa	x
      009D42 1A 01            [ 1]  695 	or	a, (0x01, sp)
      009D44 A4 01            [ 1]  696 	and	a, #0x01
      009D46 95               [ 1]  697 	ld	xh, a
                                    698 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 504: }
      009D47 5B 02            [ 2]  699 	addw	sp, #2
      009D49 81               [ 4]  700 	ret
                                    701 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 511: void UART2_SendData8(uint8_t Data)
                                    702 ;	-----------------------------------------
                                    703 ;	 function UART2_SendData8
                                    704 ;	-----------------------------------------
      009D4A                        705 _UART2_SendData8:
                                    706 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 514: UART2->DR = Data;
      009D4A AE 52 41         [ 2]  707 	ldw	x, #0x5241
      009D4D 7B 03            [ 1]  708 	ld	a, (0x03, sp)
      009D4F F7               [ 1]  709 	ld	(x), a
                                    710 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 515: }
      009D50 81               [ 4]  711 	ret
                                    712 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 522: void UART2_SendData9(uint16_t Data)
                                    713 ;	-----------------------------------------
                                    714 ;	 function UART2_SendData9
                                    715 ;	-----------------------------------------
      009D51                        716 _UART2_SendData9:
      009D51 88               [ 1]  717 	push	a
                                    718 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 525: UART2->CR1 &= ((uint8_t)~UART2_CR1_T8);                  
      009D52 72 1D 52 44      [ 1]  719 	bres	21060, #6
                                    720 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 528: UART2->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART2_CR1_T8); 
      009D56 C6 52 44         [ 1]  721 	ld	a, 0x5244
      009D59 6B 01            [ 1]  722 	ld	(0x01, sp), a
      009D5B 1E 04            [ 2]  723 	ldw	x, (0x04, sp)
      009D5D 54               [ 2]  724 	srlw	x
      009D5E 54               [ 2]  725 	srlw	x
      009D5F 9F               [ 1]  726 	ld	a, xl
      009D60 A4 40            [ 1]  727 	and	a, #0x40
      009D62 1A 01            [ 1]  728 	or	a, (0x01, sp)
      009D64 C7 52 44         [ 1]  729 	ld	0x5244, a
                                    730 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 531: UART2->DR   = (uint8_t)(Data);                    
      009D67 7B 05            [ 1]  731 	ld	a, (0x05, sp)
      009D69 C7 52 41         [ 1]  732 	ld	0x5241, a
                                    733 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 532: }
      009D6C 84               [ 1]  734 	pop	a
      009D6D 81               [ 4]  735 	ret
                                    736 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 539: void UART2_SendBreak(void)
                                    737 ;	-----------------------------------------
                                    738 ;	 function UART2_SendBreak
                                    739 ;	-----------------------------------------
      009D6E                        740 _UART2_SendBreak:
                                    741 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 541: UART2->CR2 |= UART2_CR2_SBK;
      009D6E 72 10 52 45      [ 1]  742 	bset	21061, #0
                                    743 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 542: }
      009D72 81               [ 4]  744 	ret
                                    745 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 549: void UART2_SetAddress(uint8_t UART2_Address)
                                    746 ;	-----------------------------------------
                                    747 ;	 function UART2_SetAddress
                                    748 ;	-----------------------------------------
      009D73                        749 _UART2_SetAddress:
                                    750 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 555: UART2->CR4 &= ((uint8_t)~UART2_CR4_ADD);
      009D73 C6 52 47         [ 1]  751 	ld	a, 0x5247
      009D76 A4 F0            [ 1]  752 	and	a, #0xf0
      009D78 C7 52 47         [ 1]  753 	ld	0x5247, a
                                    754 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 557: UART2->CR4 |= UART2_Address;
      009D7B C6 52 47         [ 1]  755 	ld	a, 0x5247
      009D7E 1A 03            [ 1]  756 	or	a, (0x03, sp)
      009D80 C7 52 47         [ 1]  757 	ld	0x5247, a
                                    758 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 558: }
      009D83 81               [ 4]  759 	ret
                                    760 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 566: void UART2_SetGuardTime(uint8_t UART2_GuardTime)
                                    761 ;	-----------------------------------------
                                    762 ;	 function UART2_SetGuardTime
                                    763 ;	-----------------------------------------
      009D84                        764 _UART2_SetGuardTime:
                                    765 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 569: UART2->GTR = UART2_GuardTime;
      009D84 AE 52 4A         [ 2]  766 	ldw	x, #0x524a
      009D87 7B 03            [ 1]  767 	ld	a, (0x03, sp)
      009D89 F7               [ 1]  768 	ld	(x), a
                                    769 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 570: }
      009D8A 81               [ 4]  770 	ret
                                    771 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 594: void UART2_SetPrescaler(uint8_t UART2_Prescaler)
                                    772 ;	-----------------------------------------
                                    773 ;	 function UART2_SetPrescaler
                                    774 ;	-----------------------------------------
      009D8B                        775 _UART2_SetPrescaler:
                                    776 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 597: UART2->PSCR = UART2_Prescaler;
      009D8B AE 52 4B         [ 2]  777 	ldw	x, #0x524b
      009D8E 7B 03            [ 1]  778 	ld	a, (0x03, sp)
      009D90 F7               [ 1]  779 	ld	(x), a
                                    780 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 598: }
      009D91 81               [ 4]  781 	ret
                                    782 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 606: FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
                                    783 ;	-----------------------------------------
                                    784 ;	 function UART2_GetFlagStatus
                                    785 ;	-----------------------------------------
      009D92                        786 _UART2_GetFlagStatus:
      009D92 88               [ 1]  787 	push	a
                                    788 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 616: if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
      009D93 7B 05            [ 1]  789 	ld	a, (0x05, sp)
      009D95 6B 01            [ 1]  790 	ld	(0x01, sp), a
                                    791 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 614: if (UART2_FLAG == UART2_FLAG_LBDF)
      009D97 1E 04            [ 2]  792 	ldw	x, (0x04, sp)
      009D99 A3 02 10         [ 2]  793 	cpw	x, #0x0210
      009D9C 26 0E            [ 1]  794 	jrne	00121$
                                    795 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 616: if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
      009D9E C6 52 47         [ 1]  796 	ld	a, 0x5247
      009DA1 14 01            [ 1]  797 	and	a, (0x01, sp)
      009DA3 27 04            [ 1]  798 	jreq	00102$
                                    799 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 619: status = SET;
      009DA5 A6 01            [ 1]  800 	ld	a, #0x01
      009DA7 20 3F            [ 2]  801 	jra	00122$
      009DA9                        802 00102$:
                                    803 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 624: status = RESET;
      009DA9 4F               [ 1]  804 	clr	a
      009DAA 20 3C            [ 2]  805 	jra	00122$
      009DAC                        806 00121$:
                                    807 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 627: else if (UART2_FLAG == UART2_FLAG_SBK)
      009DAC 1E 04            [ 2]  808 	ldw	x, (0x04, sp)
      009DAE A3 01 01         [ 2]  809 	cpw	x, #0x0101
      009DB1 26 0E            [ 1]  810 	jrne	00118$
                                    811 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 629: if ((UART2->CR2 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
      009DB3 C6 52 45         [ 1]  812 	ld	a, 0x5245
      009DB6 14 01            [ 1]  813 	and	a, (0x01, sp)
      009DB8 27 04            [ 1]  814 	jreq	00105$
                                    815 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 632: status = SET;
      009DBA A6 01            [ 1]  816 	ld	a, #0x01
      009DBC 20 2A            [ 2]  817 	jra	00122$
      009DBE                        818 00105$:
                                    819 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 637: status = RESET;
      009DBE 4F               [ 1]  820 	clr	a
      009DBF 20 27            [ 2]  821 	jra	00122$
      009DC1                        822 00118$:
                                    823 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 640: else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
      009DC1 1E 04            [ 2]  824 	ldw	x, (0x04, sp)
      009DC3 A3 03 02         [ 2]  825 	cpw	x, #0x0302
      009DC6 27 07            [ 1]  826 	jreq	00113$
      009DC8 1E 04            [ 2]  827 	ldw	x, (0x04, sp)
      009DCA A3 03 01         [ 2]  828 	cpw	x, #0x0301
      009DCD 26 0E            [ 1]  829 	jrne	00114$
      009DCF                        830 00113$:
                                    831 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 642: if ((UART2->CR6 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
      009DCF C6 52 49         [ 1]  832 	ld	a, 0x5249
      009DD2 14 01            [ 1]  833 	and	a, (0x01, sp)
      009DD4 27 04            [ 1]  834 	jreq	00108$
                                    835 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 645: status = SET;
      009DD6 A6 01            [ 1]  836 	ld	a, #0x01
      009DD8 20 0E            [ 2]  837 	jra	00122$
      009DDA                        838 00108$:
                                    839 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 650: status = RESET;
      009DDA 4F               [ 1]  840 	clr	a
      009DDB 20 0B            [ 2]  841 	jra	00122$
      009DDD                        842 00114$:
                                    843 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 655: if ((UART2->SR & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
      009DDD C6 52 40         [ 1]  844 	ld	a, 0x5240
      009DE0 14 01            [ 1]  845 	and	a, (0x01, sp)
      009DE2 27 03            [ 1]  846 	jreq	00111$
                                    847 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 658: status = SET;
      009DE4 A6 01            [ 1]  848 	ld	a, #0x01
                                    849 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 663: status = RESET;
      009DE6 21                     850 	.byte 0x21
      009DE7                        851 00111$:
      009DE7 4F               [ 1]  852 	clr	a
      009DE8                        853 00122$:
                                    854 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 668: return  status;
                                    855 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 669: }
      009DE8 5B 01            [ 2]  856 	addw	sp, #1
      009DEA 81               [ 4]  857 	ret
                                    858 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 699: void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)
                                    859 ;	-----------------------------------------
                                    860 ;	 function UART2_ClearFlag
                                    861 ;	-----------------------------------------
      009DEB                        862 _UART2_ClearFlag:
                                    863 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 704: if (UART2_FLAG == UART2_FLAG_RXNE)
      009DEB 1E 03            [ 2]  864 	ldw	x, (0x03, sp)
      009DED A3 00 20         [ 2]  865 	cpw	x, #0x0020
      009DF0 26 05            [ 1]  866 	jrne	00108$
                                    867 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 706: UART2->SR = (uint8_t)~(UART2_SR_RXNE);
      009DF2 35 DF 52 40      [ 1]  868 	mov	0x5240+0, #0xdf
      009DF6 81               [ 4]  869 	ret
      009DF7                        870 00108$:
                                    871 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 709: else if (UART2_FLAG == UART2_FLAG_LBDF)
      009DF7 1E 03            [ 2]  872 	ldw	x, (0x03, sp)
      009DF9 A3 02 10         [ 2]  873 	cpw	x, #0x0210
      009DFC 26 05            [ 1]  874 	jrne	00105$
                                    875 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 711: UART2->CR4 &= (uint8_t)(~UART2_CR4_LBDF);
      009DFE 72 19 52 47      [ 1]  876 	bres	21063, #4
      009E02 81               [ 4]  877 	ret
      009E03                        878 00105$:
                                    879 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 716: UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
      009E03 C6 52 49         [ 1]  880 	ld	a, 0x5249
                                    881 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 714: else if (UART2_FLAG == UART2_FLAG_LHDF)
      009E06 1E 03            [ 2]  882 	ldw	x, (0x03, sp)
      009E08 A3 03 02         [ 2]  883 	cpw	x, #0x0302
      009E0B 26 06            [ 1]  884 	jrne	00102$
                                    885 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 716: UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
      009E0D A4 FD            [ 1]  886 	and	a, #0xfd
      009E0F C7 52 49         [ 1]  887 	ld	0x5249, a
      009E12 81               [ 4]  888 	ret
      009E13                        889 00102$:
                                    890 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 721: UART2->CR6 &= (uint8_t)(~UART2_CR6_LSF);
      009E13 A4 FE            [ 1]  891 	and	a, #0xfe
      009E15 C7 52 49         [ 1]  892 	ld	0x5249, a
                                    893 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 723: }
      009E18 81               [ 4]  894 	ret
                                    895 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 738: ITStatus UART2_GetITStatus(UART2_IT_TypeDef UART2_IT)
                                    896 ;	-----------------------------------------
                                    897 ;	 function UART2_GetITStatus
                                    898 ;	-----------------------------------------
      009E19                        899 _UART2_GetITStatus:
      009E19 52 02            [ 2]  900 	sub	sp, #2
                                    901 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 750: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
      009E1B 7B 06            [ 1]  902 	ld	a, (0x06, sp)
      009E1D 97               [ 1]  903 	ld	xl, a
      009E1E A4 0F            [ 1]  904 	and	a, #0x0f
      009E20 88               [ 1]  905 	push	a
      009E21 A6 01            [ 1]  906 	ld	a, #0x01
      009E23 6B 03            [ 1]  907 	ld	(0x03, sp), a
      009E25 84               [ 1]  908 	pop	a
      009E26 4D               [ 1]  909 	tnz	a
      009E27 27 05            [ 1]  910 	jreq	00184$
      009E29                        911 00183$:
      009E29 08 02            [ 1]  912 	sll	(0x02, sp)
      009E2B 4A               [ 1]  913 	dec	a
      009E2C 26 FB            [ 1]  914 	jrne	00183$
      009E2E                        915 00184$:
                                    916 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 752: itmask1 = (uint8_t)((uint8_t)UART2_IT >> (uint8_t)4);
      009E2E 9F               [ 1]  917 	ld	a, xl
      009E2F 4E               [ 1]  918 	swap	a
      009E30 A4 0F            [ 1]  919 	and	a, #0x0f
                                    920 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 754: itmask2 = (uint8_t)((uint8_t)1 << itmask1);
      009E32 88               [ 1]  921 	push	a
      009E33 A6 01            [ 1]  922 	ld	a, #0x01
      009E35 6B 02            [ 1]  923 	ld	(0x02, sp), a
      009E37 84               [ 1]  924 	pop	a
      009E38 4D               [ 1]  925 	tnz	a
      009E39 27 05            [ 1]  926 	jreq	00186$
      009E3B                        927 00185$:
      009E3B 08 01            [ 1]  928 	sll	(0x01, sp)
      009E3D 4A               [ 1]  929 	dec	a
      009E3E 26 FB            [ 1]  930 	jrne	00185$
      009E40                        931 00186$:
                                    932 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 757: if (UART2_IT == UART2_IT_PE)
      009E40 1E 05            [ 2]  933 	ldw	x, (0x05, sp)
      009E42 A3 01 00         [ 2]  934 	cpw	x, #0x0100
      009E45 26 18            [ 1]  935 	jrne	00124$
                                    936 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 760: enablestatus = (uint8_t)((uint8_t)UART2->CR1 & itmask2);
      009E47 C6 52 44         [ 1]  937 	ld	a, 0x5244
      009E4A 14 01            [ 1]  938 	and	a, (0x01, sp)
      009E4C 97               [ 1]  939 	ld	xl, a
                                    940 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 763: if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
      009E4D C6 52 40         [ 1]  941 	ld	a, 0x5240
      009E50 14 02            [ 1]  942 	and	a, (0x02, sp)
      009E52 27 08            [ 1]  943 	jreq	00102$
      009E54 9F               [ 1]  944 	ld	a, xl
      009E55 4D               [ 1]  945 	tnz	a
      009E56 27 04            [ 1]  946 	jreq	00102$
                                    947 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 766: pendingbitstatus = SET;
      009E58 A6 01            [ 1]  948 	ld	a, #0x01
      009E5A 20 56            [ 2]  949 	jra	00125$
      009E5C                        950 00102$:
                                    951 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 771: pendingbitstatus = RESET;
      009E5C 4F               [ 1]  952 	clr	a
      009E5D 20 53            [ 2]  953 	jra	00125$
      009E5F                        954 00124$:
                                    955 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 774: else if (UART2_IT == UART2_IT_LBDF)
      009E5F 1E 05            [ 2]  956 	ldw	x, (0x05, sp)
      009E61 A3 03 46         [ 2]  957 	cpw	x, #0x0346
      009E64 26 18            [ 1]  958 	jrne	00121$
                                    959 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 777: enablestatus = (uint8_t)((uint8_t)UART2->CR4 & itmask2);
      009E66 C6 52 47         [ 1]  960 	ld	a, 0x5247
      009E69 14 01            [ 1]  961 	and	a, (0x01, sp)
      009E6B 97               [ 1]  962 	ld	xl, a
                                    963 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 779: if (((UART2->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
      009E6C C6 52 47         [ 1]  964 	ld	a, 0x5247
      009E6F 14 02            [ 1]  965 	and	a, (0x02, sp)
      009E71 27 08            [ 1]  966 	jreq	00106$
      009E73 9F               [ 1]  967 	ld	a, xl
      009E74 4D               [ 1]  968 	tnz	a
      009E75 27 04            [ 1]  969 	jreq	00106$
                                    970 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 782: pendingbitstatus = SET;
      009E77 A6 01            [ 1]  971 	ld	a, #0x01
      009E79 20 37            [ 2]  972 	jra	00125$
      009E7B                        973 00106$:
                                    974 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 787: pendingbitstatus = RESET;
      009E7B 4F               [ 1]  975 	clr	a
      009E7C 20 34            [ 2]  976 	jra	00125$
      009E7E                        977 00121$:
                                    978 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 790: else if (UART2_IT == UART2_IT_LHDF)
      009E7E 1E 05            [ 2]  979 	ldw	x, (0x05, sp)
      009E80 A3 04 12         [ 2]  980 	cpw	x, #0x0412
      009E83 26 18            [ 1]  981 	jrne	00118$
                                    982 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 793: enablestatus = (uint8_t)((uint8_t)UART2->CR6 & itmask2);
      009E85 C6 52 49         [ 1]  983 	ld	a, 0x5249
      009E88 14 01            [ 1]  984 	and	a, (0x01, sp)
      009E8A 97               [ 1]  985 	ld	xl, a
                                    986 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 795: if (((UART2->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
      009E8B C6 52 49         [ 1]  987 	ld	a, 0x5249
      009E8E 14 02            [ 1]  988 	and	a, (0x02, sp)
      009E90 27 08            [ 1]  989 	jreq	00110$
      009E92 9F               [ 1]  990 	ld	a, xl
      009E93 4D               [ 1]  991 	tnz	a
      009E94 27 04            [ 1]  992 	jreq	00110$
                                    993 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 798: pendingbitstatus = SET;
      009E96 A6 01            [ 1]  994 	ld	a, #0x01
      009E98 20 18            [ 2]  995 	jra	00125$
      009E9A                        996 00110$:
                                    997 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 803: pendingbitstatus = RESET;
      009E9A 4F               [ 1]  998 	clr	a
      009E9B 20 15            [ 2]  999 	jra	00125$
      009E9D                       1000 00118$:
                                   1001 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 809: enablestatus = (uint8_t)((uint8_t)UART2->CR2 & itmask2);
      009E9D C6 52 45         [ 1] 1002 	ld	a, 0x5245
      009EA0 14 01            [ 1] 1003 	and	a, (0x01, sp)
      009EA2 97               [ 1] 1004 	ld	xl, a
                                   1005 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 811: if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
      009EA3 C6 52 40         [ 1] 1006 	ld	a, 0x5240
      009EA6 14 02            [ 1] 1007 	and	a, (0x02, sp)
      009EA8 27 07            [ 1] 1008 	jreq	00114$
      009EAA 9F               [ 1] 1009 	ld	a, xl
      009EAB 4D               [ 1] 1010 	tnz	a
      009EAC 27 03            [ 1] 1011 	jreq	00114$
                                   1012 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 814: pendingbitstatus = SET;
      009EAE A6 01            [ 1] 1013 	ld	a, #0x01
                                   1014 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 819: pendingbitstatus = RESET;
      009EB0 21                    1015 	.byte 0x21
      009EB1                       1016 00114$:
      009EB1 4F               [ 1] 1017 	clr	a
      009EB2                       1018 00125$:
                                   1019 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 823: return  pendingbitstatus;
                                   1020 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 824: }
      009EB2 5B 02            [ 2] 1021 	addw	sp, #2
      009EB4 81               [ 4] 1022 	ret
                                   1023 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 852: void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)
                                   1024 ;	-----------------------------------------
                                   1025 ;	 function UART2_ClearITPendingBit
                                   1026 ;	-----------------------------------------
      009EB5                       1027 _UART2_ClearITPendingBit:
                                   1028 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 857: if (UART2_IT == UART2_IT_RXNE)
      009EB5 1E 03            [ 2] 1029 	ldw	x, (0x03, sp)
      009EB7 A3 02 55         [ 2] 1030 	cpw	x, #0x0255
      009EBA 26 05            [ 1] 1031 	jrne	00105$
                                   1032 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 859: UART2->SR = (uint8_t)~(UART2_SR_RXNE);
      009EBC 35 DF 52 40      [ 1] 1033 	mov	0x5240+0, #0xdf
      009EC0 81               [ 4] 1034 	ret
      009EC1                       1035 00105$:
                                   1036 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 862: else if (UART2_IT == UART2_IT_LBDF)
      009EC1 1E 03            [ 2] 1037 	ldw	x, (0x03, sp)
      009EC3 A3 03 46         [ 2] 1038 	cpw	x, #0x0346
      009EC6 26 05            [ 1] 1039 	jrne	00102$
                                   1040 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 864: UART2->CR4 &= (uint8_t)~(UART2_CR4_LBDF);
      009EC8 72 19 52 47      [ 1] 1041 	bres	21063, #4
      009ECC 81               [ 4] 1042 	ret
      009ECD                       1043 00102$:
                                   1044 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 869: UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
      009ECD 72 13 52 49      [ 1] 1045 	bres	21065, #1
                                   1046 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 871: }
      009ED1 81               [ 4] 1047 	ret
                                   1048 	.area CODE
                                   1049 	.area CONST
                                   1050 	.area INITIALIZER
                                   1051 	.area CABS (ABS)
