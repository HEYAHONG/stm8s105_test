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
      009F0E                         78 _UART2_DeInit:
                                     79 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 57: (void) UART2->SR;
      009F0E C6 52 40         [ 1]   80 	ld	a, 0x5240
                                     81 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 58: (void)UART2->DR;
      009F11 C6 52 41         [ 1]   82 	ld	a, 0x5241
                                     83 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 60: UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*  Set UART2_BRR2 to reset value 0x00 */
      009F14 35 00 52 43      [ 1]   84 	mov	0x5243+0, #0x00
                                     85 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 61: UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*  Set UART2_BRR1 to reset value 0x00 */
      009F18 35 00 52 42      [ 1]   86 	mov	0x5242+0, #0x00
                                     87 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 63: UART2->CR1 = UART2_CR1_RESET_VALUE; /*  Set UART2_CR1 to reset value 0x00  */
      009F1C 35 00 52 44      [ 1]   88 	mov	0x5244+0, #0x00
                                     89 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 64: UART2->CR2 = UART2_CR2_RESET_VALUE; /*  Set UART2_CR2 to reset value 0x00  */
      009F20 35 00 52 45      [ 1]   90 	mov	0x5245+0, #0x00
                                     91 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 65: UART2->CR3 = UART2_CR3_RESET_VALUE; /*  Set UART2_CR3 to reset value 0x00  */
      009F24 35 00 52 46      [ 1]   92 	mov	0x5246+0, #0x00
                                     93 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 66: UART2->CR4 = UART2_CR4_RESET_VALUE; /*  Set UART2_CR4 to reset value 0x00  */
      009F28 35 00 52 47      [ 1]   94 	mov	0x5247+0, #0x00
                                     95 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 67: UART2->CR5 = UART2_CR5_RESET_VALUE; /*  Set UART2_CR5 to reset value 0x00  */
      009F2C 35 00 52 48      [ 1]   96 	mov	0x5248+0, #0x00
                                     97 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 68: UART2->CR6 = UART2_CR6_RESET_VALUE; /*  Set UART2_CR6 to reset value 0x00  */
      009F30 35 00 52 49      [ 1]   98 	mov	0x5249+0, #0x00
                                     99 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 69: }
      009F34 81               [ 4]  100 	ret
                                    101 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 85: void UART2_Init(uint32_t BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
                                    102 ;	-----------------------------------------
                                    103 ;	 function UART2_Init
                                    104 ;	-----------------------------------------
      009F35                        105 _UART2_Init:
      009F35 52 23            [ 2]  106 	sub	sp, #35
                                    107 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 99: UART2->CR1 &= (uint8_t)(~UART2_CR1_M);
      009F37 72 19 52 44      [ 1]  108 	bres	21060, #4
                                    109 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 101: UART2->CR1 |= (uint8_t)WordLength; 
      009F3B C6 52 44         [ 1]  110 	ld	a, 0x5244
      009F3E 1A 2A            [ 1]  111 	or	a, (0x2a, sp)
      009F40 C7 52 44         [ 1]  112 	ld	0x5244, a
                                    113 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 104: UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
      009F43 C6 52 46         [ 1]  114 	ld	a, 0x5246
      009F46 A4 CF            [ 1]  115 	and	a, #0xcf
      009F48 C7 52 46         [ 1]  116 	ld	0x5246, a
                                    117 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 106: UART2->CR3 |= (uint8_t)StopBits; 
      009F4B C6 52 46         [ 1]  118 	ld	a, 0x5246
      009F4E 1A 2B            [ 1]  119 	or	a, (0x2b, sp)
      009F50 C7 52 46         [ 1]  120 	ld	0x5246, a
                                    121 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 109: UART2->CR1 &= (uint8_t)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));
      009F53 C6 52 44         [ 1]  122 	ld	a, 0x5244
      009F56 A4 F9            [ 1]  123 	and	a, #0xf9
      009F58 C7 52 44         [ 1]  124 	ld	0x5244, a
                                    125 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 111: UART2->CR1 |= (uint8_t)Parity;
      009F5B C6 52 44         [ 1]  126 	ld	a, 0x5244
      009F5E 1A 2C            [ 1]  127 	or	a, (0x2c, sp)
      009F60 C7 52 44         [ 1]  128 	ld	0x5244, a
                                    129 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 114: UART2->BRR1 &= (uint8_t)(~UART2_BRR1_DIVM);
      009F63 C6 52 42         [ 1]  130 	ld	a, 0x5242
      009F66 35 00 52 42      [ 1]  131 	mov	0x5242+0, #0x00
                                    132 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 116: UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVM);
      009F6A C6 52 43         [ 1]  133 	ld	a, 0x5243
      009F6D A4 0F            [ 1]  134 	and	a, #0x0f
      009F6F C7 52 43         [ 1]  135 	ld	0x5243, a
                                    136 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 118: UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVF);
      009F72 C6 52 43         [ 1]  137 	ld	a, 0x5243
      009F75 A4 F0            [ 1]  138 	and	a, #0xf0
      009F77 C7 52 43         [ 1]  139 	ld	0x5243, a
                                    140 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 121: BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
      009F7A CD A6 33         [ 4]  141 	call	_CLK_GetClockFreq
      009F7D 1F 15            [ 2]  142 	ldw	(0x15, sp), x
      009F7F 1E 26            [ 2]  143 	ldw	x, (0x26, sp)
      009F81 1F 03            [ 2]  144 	ldw	(0x03, sp), x
      009F83 1E 28            [ 2]  145 	ldw	x, (0x28, sp)
      009F85 A6 04            [ 1]  146 	ld	a, #0x04
      009F87                        147 00127$:
      009F87 58               [ 2]  148 	sllw	x
      009F88 09 04            [ 1]  149 	rlc	(0x04, sp)
      009F8A 09 03            [ 1]  150 	rlc	(0x03, sp)
      009F8C 4A               [ 1]  151 	dec	a
      009F8D 26 F8            [ 1]  152 	jrne	00127$
      009F8F 1F 05            [ 2]  153 	ldw	(0x05, sp), x
      009F91 89               [ 2]  154 	pushw	x
      009F92 1E 05            [ 2]  155 	ldw	x, (0x05, sp)
      009F94 89               [ 2]  156 	pushw	x
      009F95 1E 19            [ 2]  157 	ldw	x, (0x19, sp)
      009F97 89               [ 2]  158 	pushw	x
      009F98 90 89            [ 2]  159 	pushw	y
      009F9A CD A7 C5         [ 4]  160 	call	__divulong
      009F9D 5B 08            [ 2]  161 	addw	sp, #8
      009F9F 1F 21            [ 2]  162 	ldw	(0x21, sp), x
      009FA1 17 1F            [ 2]  163 	ldw	(0x1f, sp), y
      009FA3 16 20            [ 2]  164 	ldw	y, (0x20, sp)
      009FA5 17 20            [ 2]  165 	ldw	(0x20, sp), y
                                    166 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 122: BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
      009FA7 CD A6 33         [ 4]  167 	call	_CLK_GetClockFreq
      009FAA 1F 0D            [ 2]  168 	ldw	(0x0d, sp), x
      009FAC 17 0B            [ 2]  169 	ldw	(0x0b, sp), y
      009FAE 1E 0D            [ 2]  170 	ldw	x, (0x0d, sp)
      009FB0 89               [ 2]  171 	pushw	x
      009FB1 1E 0D            [ 2]  172 	ldw	x, (0x0d, sp)
      009FB3 89               [ 2]  173 	pushw	x
      009FB4 4B 64            [ 1]  174 	push	#0x64
      009FB6 5F               [ 1]  175 	clrw	x
      009FB7 89               [ 2]  176 	pushw	x
      009FB8 4B 00            [ 1]  177 	push	#0x00
      009FBA CD A8 76         [ 4]  178 	call	__mullong
      009FBD 5B 08            [ 2]  179 	addw	sp, #8
      009FBF 1F 19            [ 2]  180 	ldw	(0x19, sp), x
      009FC1 1E 05            [ 2]  181 	ldw	x, (0x05, sp)
      009FC3 89               [ 2]  182 	pushw	x
      009FC4 1E 05            [ 2]  183 	ldw	x, (0x05, sp)
      009FC6 89               [ 2]  184 	pushw	x
      009FC7 1E 1D            [ 2]  185 	ldw	x, (0x1d, sp)
      009FC9 89               [ 2]  186 	pushw	x
      009FCA 90 89            [ 2]  187 	pushw	y
      009FCC CD A7 C5         [ 4]  188 	call	__divulong
      009FCF 5B 08            [ 2]  189 	addw	sp, #8
      009FD1 1F 1D            [ 2]  190 	ldw	(0x1d, sp), x
      009FD3 17 1B            [ 2]  191 	ldw	(0x1b, sp), y
                                    192 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 126: BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
      009FD5 1E 21            [ 2]  193 	ldw	x, (0x21, sp)
      009FD7 89               [ 2]  194 	pushw	x
      009FD8 1E 21            [ 2]  195 	ldw	x, (0x21, sp)
      009FDA 89               [ 2]  196 	pushw	x
      009FDB 4B 64            [ 1]  197 	push	#0x64
      009FDD 5F               [ 1]  198 	clrw	x
      009FDE 89               [ 2]  199 	pushw	x
      009FDF 4B 00            [ 1]  200 	push	#0x00
      009FE1 CD A8 76         [ 4]  201 	call	__mullong
      009FE4 5B 08            [ 2]  202 	addw	sp, #8
      009FE6 1F 11            [ 2]  203 	ldw	(0x11, sp), x
      009FE8 17 0F            [ 2]  204 	ldw	(0x0f, sp), y
      009FEA 1E 1D            [ 2]  205 	ldw	x, (0x1d, sp)
      009FEC 72 F0 11         [ 2]  206 	subw	x, (0x11, sp)
      009FEF 1F 09            [ 2]  207 	ldw	(0x09, sp), x
      009FF1 7B 1C            [ 1]  208 	ld	a, (0x1c, sp)
      009FF3 12 10            [ 1]  209 	sbc	a, (0x10, sp)
      009FF5 6B 08            [ 1]  210 	ld	(0x08, sp), a
      009FF7 7B 1B            [ 1]  211 	ld	a, (0x1b, sp)
      009FF9 12 0F            [ 1]  212 	sbc	a, (0x0f, sp)
      009FFB 6B 07            [ 1]  213 	ld	(0x07, sp), a
      009FFD 1E 09            [ 2]  214 	ldw	x, (0x09, sp)
      009FFF 16 07            [ 2]  215 	ldw	y, (0x07, sp)
      00A001 A6 04            [ 1]  216 	ld	a, #0x04
      00A003                        217 00129$:
      00A003 58               [ 2]  218 	sllw	x
      00A004 90 59            [ 2]  219 	rlcw	y
      00A006 4A               [ 1]  220 	dec	a
      00A007 26 FA            [ 1]  221 	jrne	00129$
      00A009 4B 64            [ 1]  222 	push	#0x64
      00A00B 4B 00            [ 1]  223 	push	#0x00
      00A00D 4B 00            [ 1]  224 	push	#0x00
      00A00F 4B 00            [ 1]  225 	push	#0x00
      00A011 89               [ 2]  226 	pushw	x
      00A012 90 89            [ 2]  227 	pushw	y
      00A014 CD A7 C5         [ 4]  228 	call	__divulong
      00A017 5B 08            [ 2]  229 	addw	sp, #8
      00A019 9F               [ 1]  230 	ld	a, xl
      00A01A A4 0F            [ 1]  231 	and	a, #0x0f
      00A01C 6B 23            [ 1]  232 	ld	(0x23, sp), a
                                    233 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 128: BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
      00A01E 1E 21            [ 2]  234 	ldw	x, (0x21, sp)
      00A020 A6 10            [ 1]  235 	ld	a, #0x10
      00A022 62               [ 2]  236 	div	x, a
      00A023 9F               [ 1]  237 	ld	a, xl
      00A024 A4 F0            [ 1]  238 	and	a, #0xf0
                                    239 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 130: UART2->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
      00A026 1A 23            [ 1]  240 	or	a, (0x23, sp)
      00A028 C7 52 43         [ 1]  241 	ld	0x5243, a
                                    242 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 132: UART2->BRR1 = (uint8_t)BaudRate_Mantissa;           
      00A02B 7B 22            [ 1]  243 	ld	a, (0x22, sp)
      00A02D C7 52 42         [ 1]  244 	ld	0x5242, a
                                    245 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 135: UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
      00A030 C6 52 45         [ 1]  246 	ld	a, 0x5245
      00A033 A4 F3            [ 1]  247 	and	a, #0xf3
      00A035 C7 52 45         [ 1]  248 	ld	0x5245, a
                                    249 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 137: UART2->CR3 &= (uint8_t)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL);
      00A038 C6 52 46         [ 1]  250 	ld	a, 0x5246
      00A03B A4 F8            [ 1]  251 	and	a, #0xf8
      00A03D C7 52 46         [ 1]  252 	ld	0x5246, a
                                    253 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 139: UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART2_CR3_CPOL | \
      00A040 C6 52 46         [ 1]  254 	ld	a, 0x5246
      00A043 6B 02            [ 1]  255 	ld	(0x02, sp), a
      00A045 7B 2D            [ 1]  256 	ld	a, (0x2d, sp)
      00A047 A4 07            [ 1]  257 	and	a, #0x07
      00A049 1A 02            [ 1]  258 	or	a, (0x02, sp)
      00A04B C7 52 46         [ 1]  259 	ld	0x5246, a
                                    260 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 135: UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
      00A04E C6 52 45         [ 1]  261 	ld	a, 0x5245
                                    262 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 142: if ((uint8_t)(Mode & UART2_MODE_TX_ENABLE))
      00A051 88               [ 1]  263 	push	a
      00A052 7B 2F            [ 1]  264 	ld	a, (0x2f, sp)
      00A054 A5 04            [ 1]  265 	bcp	a, #0x04
      00A056 84               [ 1]  266 	pop	a
      00A057 27 07            [ 1]  267 	jreq	00102$
                                    268 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 145: UART2->CR2 |= (uint8_t)UART2_CR2_TEN;
      00A059 AA 08            [ 1]  269 	or	a, #0x08
      00A05B C7 52 45         [ 1]  270 	ld	0x5245, a
      00A05E 20 05            [ 2]  271 	jra	00103$
      00A060                        272 00102$:
                                    273 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 150: UART2->CR2 &= (uint8_t)(~UART2_CR2_TEN);
      00A060 A4 F7            [ 1]  274 	and	a, #0xf7
      00A062 C7 52 45         [ 1]  275 	ld	0x5245, a
      00A065                        276 00103$:
                                    277 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 135: UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
      00A065 C6 52 45         [ 1]  278 	ld	a, 0x5245
                                    279 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 152: if ((uint8_t)(Mode & UART2_MODE_RX_ENABLE))
      00A068 88               [ 1]  280 	push	a
      00A069 7B 2F            [ 1]  281 	ld	a, (0x2f, sp)
      00A06B A5 08            [ 1]  282 	bcp	a, #0x08
      00A06D 84               [ 1]  283 	pop	a
      00A06E 27 07            [ 1]  284 	jreq	00105$
                                    285 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 155: UART2->CR2 |= (uint8_t)UART2_CR2_REN;
      00A070 AA 04            [ 1]  286 	or	a, #0x04
      00A072 C7 52 45         [ 1]  287 	ld	0x5245, a
      00A075 20 05            [ 2]  288 	jra	00106$
      00A077                        289 00105$:
                                    290 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 160: UART2->CR2 &= (uint8_t)(~UART2_CR2_REN);
      00A077 A4 FB            [ 1]  291 	and	a, #0xfb
      00A079 C7 52 45         [ 1]  292 	ld	0x5245, a
      00A07C                        293 00106$:
                                    294 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 104: UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
      00A07C C6 52 46         [ 1]  295 	ld	a, 0x5246
                                    296 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 164: if ((uint8_t)(SyncMode & UART2_SYNCMODE_CLOCK_DISABLE))
      00A07F 0D 2D            [ 1]  297 	tnz	(0x2d, sp)
      00A081 2A 07            [ 1]  298 	jrpl	00108$
                                    299 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 167: UART2->CR3 &= (uint8_t)(~UART2_CR3_CKEN); 
      00A083 A4 F7            [ 1]  300 	and	a, #0xf7
      00A085 C7 52 46         [ 1]  301 	ld	0x5246, a
      00A088 20 0D            [ 2]  302 	jra	00110$
      00A08A                        303 00108$:
                                    304 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 171: UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & UART2_CR3_CKEN);
      00A08A 88               [ 1]  305 	push	a
      00A08B 7B 2E            [ 1]  306 	ld	a, (0x2e, sp)
      00A08D A4 08            [ 1]  307 	and	a, #0x08
      00A08F 6B 02            [ 1]  308 	ld	(0x02, sp), a
      00A091 84               [ 1]  309 	pop	a
      00A092 1A 01            [ 1]  310 	or	a, (0x01, sp)
      00A094 C7 52 46         [ 1]  311 	ld	0x5246, a
      00A097                        312 00110$:
                                    313 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 173: }
      00A097 5B 23            [ 2]  314 	addw	sp, #35
      00A099 81               [ 4]  315 	ret
                                    316 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 181: void UART2_Cmd(FunctionalState NewState)
                                    317 ;	-----------------------------------------
                                    318 ;	 function UART2_Cmd
                                    319 ;	-----------------------------------------
      00A09A                        320 _UART2_Cmd:
                                    321 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 186: UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
      00A09A C6 52 44         [ 1]  322 	ld	a, 0x5244
                                    323 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 183: if (NewState != DISABLE)
      00A09D 0D 03            [ 1]  324 	tnz	(0x03, sp)
      00A09F 27 06            [ 1]  325 	jreq	00102$
                                    326 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 186: UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
      00A0A1 A4 DF            [ 1]  327 	and	a, #0xdf
      00A0A3 C7 52 44         [ 1]  328 	ld	0x5244, a
      00A0A6 81               [ 4]  329 	ret
      00A0A7                        330 00102$:
                                    331 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 191: UART2->CR1 |= UART2_CR1_UARTD; 
      00A0A7 AA 20            [ 1]  332 	or	a, #0x20
      00A0A9 C7 52 44         [ 1]  333 	ld	0x5244, a
                                    334 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 193: }
      00A0AC 81               [ 4]  335 	ret
                                    336 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 210: void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)
                                    337 ;	-----------------------------------------
                                    338 ;	 function UART2_ITConfig
                                    339 ;	-----------------------------------------
      00A0AD                        340 _UART2_ITConfig:
      00A0AD 52 04            [ 2]  341 	sub	sp, #4
                                    342 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 219: uartreg = (uint8_t)((uint16_t)UART2_IT >> 0x08);
      00A0AF 7B 07            [ 1]  343 	ld	a, (0x07, sp)
      00A0B1 97               [ 1]  344 	ld	xl, a
                                    345 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 222: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
      00A0B2 7B 08            [ 1]  346 	ld	a, (0x08, sp)
      00A0B4 A4 0F            [ 1]  347 	and	a, #0x0f
      00A0B6 88               [ 1]  348 	push	a
      00A0B7 A6 01            [ 1]  349 	ld	a, #0x01
      00A0B9 6B 03            [ 1]  350 	ld	(0x03, sp), a
      00A0BB 84               [ 1]  351 	pop	a
      00A0BC 4D               [ 1]  352 	tnz	a
      00A0BD 27 05            [ 1]  353 	jreq	00160$
      00A0BF                        354 00159$:
      00A0BF 08 02            [ 1]  355 	sll	(0x02, sp)
      00A0C1 4A               [ 1]  356 	dec	a
      00A0C2 26 FB            [ 1]  357 	jrne	00159$
      00A0C4                        358 00160$:
                                    359 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 227: if (uartreg == 0x01)
      00A0C4 9F               [ 1]  360 	ld	a, xl
      00A0C5 4A               [ 1]  361 	dec	a
      00A0C6 26 05            [ 1]  362 	jrne	00162$
      00A0C8 A6 01            [ 1]  363 	ld	a, #0x01
      00A0CA 6B 01            [ 1]  364 	ld	(0x01, sp), a
      00A0CC C1                     365 	.byte 0xc1
      00A0CD                        366 00162$:
      00A0CD 0F 01            [ 1]  367 	clr	(0x01, sp)
      00A0CF                        368 00163$:
                                    369 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 231: else if (uartreg == 0x02)
      00A0CF 9F               [ 1]  370 	ld	a, xl
      00A0D0 A0 02            [ 1]  371 	sub	a, #0x02
      00A0D2 26 04            [ 1]  372 	jrne	00165$
      00A0D4 4C               [ 1]  373 	inc	a
      00A0D5 6B 04            [ 1]  374 	ld	(0x04, sp), a
      00A0D7 C1                     375 	.byte 0xc1
      00A0D8                        376 00165$:
      00A0D8 0F 04            [ 1]  377 	clr	(0x04, sp)
      00A0DA                        378 00166$:
                                    379 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 235: else if (uartreg == 0x03)
      00A0DA 9F               [ 1]  380 	ld	a, xl
      00A0DB A0 03            [ 1]  381 	sub	a, #0x03
      00A0DD 26 02            [ 1]  382 	jrne	00168$
      00A0DF 4C               [ 1]  383 	inc	a
      00A0E0 21                     384 	.byte 0x21
      00A0E1                        385 00168$:
      00A0E1 4F               [ 1]  386 	clr	a
      00A0E2                        387 00169$:
                                    388 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 224: if (NewState != DISABLE)
      00A0E2 0D 09            [ 1]  389 	tnz	(0x09, sp)
      00A0E4 27 33            [ 1]  390 	jreq	00120$
                                    391 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 227: if (uartreg == 0x01)
      00A0E6 0D 01            [ 1]  392 	tnz	(0x01, sp)
      00A0E8 27 0A            [ 1]  393 	jreq	00108$
                                    394 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 229: UART2->CR1 |= itpos;
      00A0EA C6 52 44         [ 1]  395 	ld	a, 0x5244
      00A0ED 1A 02            [ 1]  396 	or	a, (0x02, sp)
      00A0EF C7 52 44         [ 1]  397 	ld	0x5244, a
      00A0F2 20 5D            [ 2]  398 	jra	00122$
      00A0F4                        399 00108$:
                                    400 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 231: else if (uartreg == 0x02)
      00A0F4 0D 04            [ 1]  401 	tnz	(0x04, sp)
      00A0F6 27 0A            [ 1]  402 	jreq	00105$
                                    403 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 233: UART2->CR2 |= itpos;
      00A0F8 C6 52 45         [ 1]  404 	ld	a, 0x5245
      00A0FB 1A 02            [ 1]  405 	or	a, (0x02, sp)
      00A0FD C7 52 45         [ 1]  406 	ld	0x5245, a
      00A100 20 4F            [ 2]  407 	jra	00122$
      00A102                        408 00105$:
                                    409 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 235: else if (uartreg == 0x03)
      00A102 4D               [ 1]  410 	tnz	a
      00A103 27 0A            [ 1]  411 	jreq	00102$
                                    412 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 237: UART2->CR4 |= itpos;
      00A105 C6 52 47         [ 1]  413 	ld	a, 0x5247
      00A108 1A 02            [ 1]  414 	or	a, (0x02, sp)
      00A10A C7 52 47         [ 1]  415 	ld	0x5247, a
      00A10D 20 42            [ 2]  416 	jra	00122$
      00A10F                        417 00102$:
                                    418 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 241: UART2->CR6 |= itpos;
      00A10F C6 52 49         [ 1]  419 	ld	a, 0x5249
      00A112 1A 02            [ 1]  420 	or	a, (0x02, sp)
      00A114 C7 52 49         [ 1]  421 	ld	0x5249, a
      00A117 20 38            [ 2]  422 	jra	00122$
      00A119                        423 00120$:
                                    424 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 249: UART2->CR1 &= (uint8_t)(~itpos);
      00A119 88               [ 1]  425 	push	a
      00A11A 7B 03            [ 1]  426 	ld	a, (0x03, sp)
      00A11C 43               [ 1]  427 	cpl	a
      00A11D 6B 04            [ 1]  428 	ld	(0x04, sp), a
      00A11F 84               [ 1]  429 	pop	a
                                    430 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 247: if (uartreg == 0x01)
      00A120 0D 01            [ 1]  431 	tnz	(0x01, sp)
      00A122 27 0A            [ 1]  432 	jreq	00117$
                                    433 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 249: UART2->CR1 &= (uint8_t)(~itpos);
      00A124 C6 52 44         [ 1]  434 	ld	a, 0x5244
      00A127 14 03            [ 1]  435 	and	a, (0x03, sp)
      00A129 C7 52 44         [ 1]  436 	ld	0x5244, a
      00A12C 20 23            [ 2]  437 	jra	00122$
      00A12E                        438 00117$:
                                    439 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 251: else if (uartreg == 0x02)
      00A12E 0D 04            [ 1]  440 	tnz	(0x04, sp)
      00A130 27 0A            [ 1]  441 	jreq	00114$
                                    442 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 253: UART2->CR2 &= (uint8_t)(~itpos);
      00A132 C6 52 45         [ 1]  443 	ld	a, 0x5245
      00A135 14 03            [ 1]  444 	and	a, (0x03, sp)
      00A137 C7 52 45         [ 1]  445 	ld	0x5245, a
      00A13A 20 15            [ 2]  446 	jra	00122$
      00A13C                        447 00114$:
                                    448 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 255: else if (uartreg == 0x03)
      00A13C 4D               [ 1]  449 	tnz	a
      00A13D 27 0A            [ 1]  450 	jreq	00111$
                                    451 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 257: UART2->CR4 &= (uint8_t)(~itpos);
      00A13F C6 52 47         [ 1]  452 	ld	a, 0x5247
      00A142 14 03            [ 1]  453 	and	a, (0x03, sp)
      00A144 C7 52 47         [ 1]  454 	ld	0x5247, a
      00A147 20 08            [ 2]  455 	jra	00122$
      00A149                        456 00111$:
                                    457 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 261: UART2->CR6 &= (uint8_t)(~itpos);
      00A149 C6 52 49         [ 1]  458 	ld	a, 0x5249
      00A14C 14 03            [ 1]  459 	and	a, (0x03, sp)
      00A14E C7 52 49         [ 1]  460 	ld	0x5249, a
      00A151                        461 00122$:
                                    462 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 264: }
      00A151 5B 04            [ 2]  463 	addw	sp, #4
      00A153 81               [ 4]  464 	ret
                                    465 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 272: void UART2_IrDAConfig(UART2_IrDAMode_TypeDef UART2_IrDAMode)
                                    466 ;	-----------------------------------------
                                    467 ;	 function UART2_IrDAConfig
                                    468 ;	-----------------------------------------
      00A154                        469 _UART2_IrDAConfig:
                                    470 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 278: UART2->CR5 |= UART2_CR5_IRLP;
      00A154 C6 52 48         [ 1]  471 	ld	a, 0x5248
                                    472 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 276: if (UART2_IrDAMode != UART2_IRDAMODE_NORMAL)
      00A157 0D 03            [ 1]  473 	tnz	(0x03, sp)
      00A159 27 06            [ 1]  474 	jreq	00102$
                                    475 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 278: UART2->CR5 |= UART2_CR5_IRLP;
      00A15B AA 04            [ 1]  476 	or	a, #0x04
      00A15D C7 52 48         [ 1]  477 	ld	0x5248, a
      00A160 81               [ 4]  478 	ret
      00A161                        479 00102$:
                                    480 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 282: UART2->CR5 &= ((uint8_t)~UART2_CR5_IRLP);
      00A161 A4 FB            [ 1]  481 	and	a, #0xfb
      00A163 C7 52 48         [ 1]  482 	ld	0x5248, a
                                    483 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 284: }
      00A166 81               [ 4]  484 	ret
                                    485 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 292: void UART2_IrDACmd(FunctionalState NewState)
                                    486 ;	-----------------------------------------
                                    487 ;	 function UART2_IrDACmd
                                    488 ;	-----------------------------------------
      00A167                        489 _UART2_IrDACmd:
                                    490 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 300: UART2->CR5 |= UART2_CR5_IREN;
      00A167 C6 52 48         [ 1]  491 	ld	a, 0x5248
                                    492 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 297: if (NewState != DISABLE)
      00A16A 0D 03            [ 1]  493 	tnz	(0x03, sp)
      00A16C 27 06            [ 1]  494 	jreq	00102$
                                    495 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 300: UART2->CR5 |= UART2_CR5_IREN;
      00A16E AA 02            [ 1]  496 	or	a, #0x02
      00A170 C7 52 48         [ 1]  497 	ld	0x5248, a
      00A173 81               [ 4]  498 	ret
      00A174                        499 00102$:
                                    500 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 305: UART2->CR5 &= ((uint8_t)~UART2_CR5_IREN);
      00A174 A4 FD            [ 1]  501 	and	a, #0xfd
      00A176 C7 52 48         [ 1]  502 	ld	0x5248, a
                                    503 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 307: }
      00A179 81               [ 4]  504 	ret
                                    505 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 316: void UART2_LINBreakDetectionConfig(UART2_LINBreakDetectionLength_TypeDef UART2_LINBreakDetectionLength)
                                    506 ;	-----------------------------------------
                                    507 ;	 function UART2_LINBreakDetectionConfig
                                    508 ;	-----------------------------------------
      00A17A                        509 _UART2_LINBreakDetectionConfig:
                                    510 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 323: UART2->CR4 |= UART2_CR4_LBDL;
      00A17A C6 52 47         [ 1]  511 	ld	a, 0x5247
                                    512 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 321: if (UART2_LINBreakDetectionLength != UART2_LINBREAKDETECTIONLENGTH_10BITS)
      00A17D 0D 03            [ 1]  513 	tnz	(0x03, sp)
      00A17F 27 06            [ 1]  514 	jreq	00102$
                                    515 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 323: UART2->CR4 |= UART2_CR4_LBDL;
      00A181 AA 20            [ 1]  516 	or	a, #0x20
      00A183 C7 52 47         [ 1]  517 	ld	0x5247, a
      00A186 81               [ 4]  518 	ret
      00A187                        519 00102$:
                                    520 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 327: UART2->CR4 &= ((uint8_t)~UART2_CR4_LBDL);
      00A187 A4 DF            [ 1]  521 	and	a, #0xdf
      00A189 C7 52 47         [ 1]  522 	ld	0x5247, a
                                    523 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 329: }
      00A18C 81               [ 4]  524 	ret
                                    525 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 341: void UART2_LINConfig(UART2_LinMode_TypeDef UART2_Mode, 
                                    526 ;	-----------------------------------------
                                    527 ;	 function UART2_LINConfig
                                    528 ;	-----------------------------------------
      00A18D                        529 _UART2_LINConfig:
                                    530 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 352: UART2->CR6 |=  UART2_CR6_LSLV;
      00A18D C6 52 49         [ 1]  531 	ld	a, 0x5249
                                    532 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 350: if (UART2_Mode != UART2_LIN_MODE_MASTER)
      00A190 0D 03            [ 1]  533 	tnz	(0x03, sp)
      00A192 27 07            [ 1]  534 	jreq	00102$
                                    535 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 352: UART2->CR6 |=  UART2_CR6_LSLV;
      00A194 AA 20            [ 1]  536 	or	a, #0x20
      00A196 C7 52 49         [ 1]  537 	ld	0x5249, a
      00A199 20 05            [ 2]  538 	jra	00103$
      00A19B                        539 00102$:
                                    540 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 356: UART2->CR6 &= ((uint8_t)~UART2_CR6_LSLV);
      00A19B A4 DF            [ 1]  541 	and	a, #0xdf
      00A19D C7 52 49         [ 1]  542 	ld	0x5249, a
      00A1A0                        543 00103$:
                                    544 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 352: UART2->CR6 |=  UART2_CR6_LSLV;
      00A1A0 C6 52 49         [ 1]  545 	ld	a, 0x5249
                                    546 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 359: if (UART2_Autosync != UART2_LIN_AUTOSYNC_DISABLE)
      00A1A3 0D 04            [ 1]  547 	tnz	(0x04, sp)
      00A1A5 27 07            [ 1]  548 	jreq	00105$
                                    549 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 361: UART2->CR6 |=  UART2_CR6_LASE ;
      00A1A7 AA 10            [ 1]  550 	or	a, #0x10
      00A1A9 C7 52 49         [ 1]  551 	ld	0x5249, a
      00A1AC 20 05            [ 2]  552 	jra	00106$
      00A1AE                        553 00105$:
                                    554 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 365: UART2->CR6 &= ((uint8_t)~ UART2_CR6_LASE );
      00A1AE A4 EF            [ 1]  555 	and	a, #0xef
      00A1B0 C7 52 49         [ 1]  556 	ld	0x5249, a
      00A1B3                        557 00106$:
                                    558 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 352: UART2->CR6 |=  UART2_CR6_LSLV;
      00A1B3 C6 52 49         [ 1]  559 	ld	a, 0x5249
                                    560 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 368: if (UART2_DivUp != UART2_LIN_DIVUP_LBRR1)
      00A1B6 0D 05            [ 1]  561 	tnz	(0x05, sp)
      00A1B8 27 06            [ 1]  562 	jreq	00108$
                                    563 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 370: UART2->CR6 |=  UART2_CR6_LDUM;
      00A1BA AA 80            [ 1]  564 	or	a, #0x80
      00A1BC C7 52 49         [ 1]  565 	ld	0x5249, a
      00A1BF 81               [ 4]  566 	ret
      00A1C0                        567 00108$:
                                    568 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 374: UART2->CR6 &= ((uint8_t)~ UART2_CR6_LDUM);
      00A1C0 A4 7F            [ 1]  569 	and	a, #0x7f
      00A1C2 C7 52 49         [ 1]  570 	ld	0x5249, a
                                    571 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 376: }
      00A1C5 81               [ 4]  572 	ret
                                    573 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 384: void UART2_LINCmd(FunctionalState NewState)
                                    574 ;	-----------------------------------------
                                    575 ;	 function UART2_LINCmd
                                    576 ;	-----------------------------------------
      00A1C6                        577 _UART2_LINCmd:
                                    578 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 391: UART2->CR3 |= UART2_CR3_LINEN;
      00A1C6 C6 52 46         [ 1]  579 	ld	a, 0x5246
                                    580 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 388: if (NewState != DISABLE)
      00A1C9 0D 03            [ 1]  581 	tnz	(0x03, sp)
      00A1CB 27 06            [ 1]  582 	jreq	00102$
                                    583 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 391: UART2->CR3 |= UART2_CR3_LINEN;
      00A1CD AA 40            [ 1]  584 	or	a, #0x40
      00A1CF C7 52 46         [ 1]  585 	ld	0x5246, a
      00A1D2 81               [ 4]  586 	ret
      00A1D3                        587 00102$:
                                    588 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 396: UART2->CR3 &= ((uint8_t)~UART2_CR3_LINEN);
      00A1D3 A4 BF            [ 1]  589 	and	a, #0xbf
      00A1D5 C7 52 46         [ 1]  590 	ld	0x5246, a
                                    591 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 398: }
      00A1D8 81               [ 4]  592 	ret
                                    593 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 406: void UART2_SmartCardCmd(FunctionalState NewState)
                                    594 ;	-----------------------------------------
                                    595 ;	 function UART2_SmartCardCmd
                                    596 ;	-----------------------------------------
      00A1D9                        597 _UART2_SmartCardCmd:
                                    598 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 414: UART2->CR5 |= UART2_CR5_SCEN;
      00A1D9 C6 52 48         [ 1]  599 	ld	a, 0x5248
                                    600 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 411: if (NewState != DISABLE)
      00A1DC 0D 03            [ 1]  601 	tnz	(0x03, sp)
      00A1DE 27 06            [ 1]  602 	jreq	00102$
                                    603 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 414: UART2->CR5 |= UART2_CR5_SCEN;
      00A1E0 AA 20            [ 1]  604 	or	a, #0x20
      00A1E2 C7 52 48         [ 1]  605 	ld	0x5248, a
      00A1E5 81               [ 4]  606 	ret
      00A1E6                        607 00102$:
                                    608 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 419: UART2->CR5 &= ((uint8_t)(~UART2_CR5_SCEN));
      00A1E6 A4 DF            [ 1]  609 	and	a, #0xdf
      00A1E8 C7 52 48         [ 1]  610 	ld	0x5248, a
                                    611 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 421: }
      00A1EB 81               [ 4]  612 	ret
                                    613 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 429: void UART2_SmartCardNACKCmd(FunctionalState NewState)
                                    614 ;	-----------------------------------------
                                    615 ;	 function UART2_SmartCardNACKCmd
                                    616 ;	-----------------------------------------
      00A1EC                        617 _UART2_SmartCardNACKCmd:
                                    618 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 437: UART2->CR5 |= UART2_CR5_NACK;
      00A1EC C6 52 48         [ 1]  619 	ld	a, 0x5248
                                    620 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 434: if (NewState != DISABLE)
      00A1EF 0D 03            [ 1]  621 	tnz	(0x03, sp)
      00A1F1 27 06            [ 1]  622 	jreq	00102$
                                    623 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 437: UART2->CR5 |= UART2_CR5_NACK;
      00A1F3 AA 10            [ 1]  624 	or	a, #0x10
      00A1F5 C7 52 48         [ 1]  625 	ld	0x5248, a
      00A1F8 81               [ 4]  626 	ret
      00A1F9                        627 00102$:
                                    628 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 442: UART2->CR5 &= ((uint8_t)~(UART2_CR5_NACK));
      00A1F9 A4 EF            [ 1]  629 	and	a, #0xef
      00A1FB C7 52 48         [ 1]  630 	ld	0x5248, a
                                    631 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 444: }
      00A1FE 81               [ 4]  632 	ret
                                    633 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 452: void UART2_WakeUpConfig(UART2_WakeUp_TypeDef UART2_WakeUp)
                                    634 ;	-----------------------------------------
                                    635 ;	 function UART2_WakeUpConfig
                                    636 ;	-----------------------------------------
      00A1FF                        637 _UART2_WakeUpConfig:
                                    638 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 456: UART2->CR1 &= ((uint8_t)~UART2_CR1_WAKE);
      00A1FF 72 17 52 44      [ 1]  639 	bres	21060, #3
                                    640 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 457: UART2->CR1 |= (uint8_t)UART2_WakeUp;
      00A203 C6 52 44         [ 1]  641 	ld	a, 0x5244
      00A206 1A 03            [ 1]  642 	or	a, (0x03, sp)
      00A208 C7 52 44         [ 1]  643 	ld	0x5244, a
                                    644 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 458: }
      00A20B 81               [ 4]  645 	ret
                                    646 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 466: void UART2_ReceiverWakeUpCmd(FunctionalState NewState)
                                    647 ;	-----------------------------------------
                                    648 ;	 function UART2_ReceiverWakeUpCmd
                                    649 ;	-----------------------------------------
      00A20C                        650 _UART2_ReceiverWakeUpCmd:
                                    651 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 473: UART2->CR2 |= UART2_CR2_RWU;
      00A20C C6 52 45         [ 1]  652 	ld	a, 0x5245
                                    653 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 470: if (NewState != DISABLE)
      00A20F 0D 03            [ 1]  654 	tnz	(0x03, sp)
      00A211 27 06            [ 1]  655 	jreq	00102$
                                    656 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 473: UART2->CR2 |= UART2_CR2_RWU;
      00A213 AA 02            [ 1]  657 	or	a, #0x02
      00A215 C7 52 45         [ 1]  658 	ld	0x5245, a
      00A218 81               [ 4]  659 	ret
      00A219                        660 00102$:
                                    661 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 478: UART2->CR2 &= ((uint8_t)~UART2_CR2_RWU);
      00A219 A4 FD            [ 1]  662 	and	a, #0xfd
      00A21B C7 52 45         [ 1]  663 	ld	0x5245, a
                                    664 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 480: }
      00A21E 81               [ 4]  665 	ret
                                    666 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 487: uint8_t UART2_ReceiveData8(void)
                                    667 ;	-----------------------------------------
                                    668 ;	 function UART2_ReceiveData8
                                    669 ;	-----------------------------------------
      00A21F                        670 _UART2_ReceiveData8:
                                    671 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 489: return ((uint8_t)UART2->DR);
      00A21F C6 52 41         [ 1]  672 	ld	a, 0x5241
                                    673 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 490: }
      00A222 81               [ 4]  674 	ret
                                    675 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 497: uint16_t UART2_ReceiveData9(void)
                                    676 ;	-----------------------------------------
                                    677 ;	 function UART2_ReceiveData9
                                    678 ;	-----------------------------------------
      00A223                        679 _UART2_ReceiveData9:
      00A223 52 02            [ 2]  680 	sub	sp, #2
                                    681 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 501: temp = ((uint16_t)(((uint16_t)((uint16_t)UART2->CR1 & (uint16_t)UART2_CR1_R8)) << 1));
      00A225 C6 52 44         [ 1]  682 	ld	a, 0x5244
      00A228 A4 80            [ 1]  683 	and	a, #0x80
      00A22A 97               [ 1]  684 	ld	xl, a
      00A22B 4F               [ 1]  685 	clr	a
      00A22C 95               [ 1]  686 	ld	xh, a
      00A22D 58               [ 2]  687 	sllw	x
                                    688 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 503: return (uint16_t)((((uint16_t)UART2->DR) | temp) & ((uint16_t)0x01FF));
      00A22E C6 52 41         [ 1]  689 	ld	a, 0x5241
      00A231 6B 02            [ 1]  690 	ld	(0x02, sp), a
      00A233 0F 01            [ 1]  691 	clr	(0x01, sp)
      00A235 9F               [ 1]  692 	ld	a, xl
      00A236 1A 02            [ 1]  693 	or	a, (0x02, sp)
      00A238 02               [ 1]  694 	rlwa	x
      00A239 1A 01            [ 1]  695 	or	a, (0x01, sp)
      00A23B A4 01            [ 1]  696 	and	a, #0x01
      00A23D 95               [ 1]  697 	ld	xh, a
                                    698 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 504: }
      00A23E 5B 02            [ 2]  699 	addw	sp, #2
      00A240 81               [ 4]  700 	ret
                                    701 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 511: void UART2_SendData8(uint8_t Data)
                                    702 ;	-----------------------------------------
                                    703 ;	 function UART2_SendData8
                                    704 ;	-----------------------------------------
      00A241                        705 _UART2_SendData8:
                                    706 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 514: UART2->DR = Data;
      00A241 AE 52 41         [ 2]  707 	ldw	x, #0x5241
      00A244 7B 03            [ 1]  708 	ld	a, (0x03, sp)
      00A246 F7               [ 1]  709 	ld	(x), a
                                    710 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 515: }
      00A247 81               [ 4]  711 	ret
                                    712 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 522: void UART2_SendData9(uint16_t Data)
                                    713 ;	-----------------------------------------
                                    714 ;	 function UART2_SendData9
                                    715 ;	-----------------------------------------
      00A248                        716 _UART2_SendData9:
      00A248 88               [ 1]  717 	push	a
                                    718 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 525: UART2->CR1 &= ((uint8_t)~UART2_CR1_T8);                  
      00A249 72 1D 52 44      [ 1]  719 	bres	21060, #6
                                    720 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 528: UART2->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART2_CR1_T8); 
      00A24D C6 52 44         [ 1]  721 	ld	a, 0x5244
      00A250 6B 01            [ 1]  722 	ld	(0x01, sp), a
      00A252 1E 04            [ 2]  723 	ldw	x, (0x04, sp)
      00A254 54               [ 2]  724 	srlw	x
      00A255 54               [ 2]  725 	srlw	x
      00A256 9F               [ 1]  726 	ld	a, xl
      00A257 A4 40            [ 1]  727 	and	a, #0x40
      00A259 1A 01            [ 1]  728 	or	a, (0x01, sp)
      00A25B C7 52 44         [ 1]  729 	ld	0x5244, a
                                    730 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 531: UART2->DR   = (uint8_t)(Data);                    
      00A25E 7B 05            [ 1]  731 	ld	a, (0x05, sp)
      00A260 C7 52 41         [ 1]  732 	ld	0x5241, a
                                    733 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 532: }
      00A263 84               [ 1]  734 	pop	a
      00A264 81               [ 4]  735 	ret
                                    736 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 539: void UART2_SendBreak(void)
                                    737 ;	-----------------------------------------
                                    738 ;	 function UART2_SendBreak
                                    739 ;	-----------------------------------------
      00A265                        740 _UART2_SendBreak:
                                    741 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 541: UART2->CR2 |= UART2_CR2_SBK;
      00A265 72 10 52 45      [ 1]  742 	bset	21061, #0
                                    743 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 542: }
      00A269 81               [ 4]  744 	ret
                                    745 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 549: void UART2_SetAddress(uint8_t UART2_Address)
                                    746 ;	-----------------------------------------
                                    747 ;	 function UART2_SetAddress
                                    748 ;	-----------------------------------------
      00A26A                        749 _UART2_SetAddress:
                                    750 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 555: UART2->CR4 &= ((uint8_t)~UART2_CR4_ADD);
      00A26A C6 52 47         [ 1]  751 	ld	a, 0x5247
      00A26D A4 F0            [ 1]  752 	and	a, #0xf0
      00A26F C7 52 47         [ 1]  753 	ld	0x5247, a
                                    754 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 557: UART2->CR4 |= UART2_Address;
      00A272 C6 52 47         [ 1]  755 	ld	a, 0x5247
      00A275 1A 03            [ 1]  756 	or	a, (0x03, sp)
      00A277 C7 52 47         [ 1]  757 	ld	0x5247, a
                                    758 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 558: }
      00A27A 81               [ 4]  759 	ret
                                    760 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 566: void UART2_SetGuardTime(uint8_t UART2_GuardTime)
                                    761 ;	-----------------------------------------
                                    762 ;	 function UART2_SetGuardTime
                                    763 ;	-----------------------------------------
      00A27B                        764 _UART2_SetGuardTime:
                                    765 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 569: UART2->GTR = UART2_GuardTime;
      00A27B AE 52 4A         [ 2]  766 	ldw	x, #0x524a
      00A27E 7B 03            [ 1]  767 	ld	a, (0x03, sp)
      00A280 F7               [ 1]  768 	ld	(x), a
                                    769 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 570: }
      00A281 81               [ 4]  770 	ret
                                    771 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 594: void UART2_SetPrescaler(uint8_t UART2_Prescaler)
                                    772 ;	-----------------------------------------
                                    773 ;	 function UART2_SetPrescaler
                                    774 ;	-----------------------------------------
      00A282                        775 _UART2_SetPrescaler:
                                    776 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 597: UART2->PSCR = UART2_Prescaler;
      00A282 AE 52 4B         [ 2]  777 	ldw	x, #0x524b
      00A285 7B 03            [ 1]  778 	ld	a, (0x03, sp)
      00A287 F7               [ 1]  779 	ld	(x), a
                                    780 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 598: }
      00A288 81               [ 4]  781 	ret
                                    782 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 606: FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
                                    783 ;	-----------------------------------------
                                    784 ;	 function UART2_GetFlagStatus
                                    785 ;	-----------------------------------------
      00A289                        786 _UART2_GetFlagStatus:
      00A289 88               [ 1]  787 	push	a
                                    788 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 616: if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
      00A28A 7B 05            [ 1]  789 	ld	a, (0x05, sp)
      00A28C 6B 01            [ 1]  790 	ld	(0x01, sp), a
                                    791 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 614: if (UART2_FLAG == UART2_FLAG_LBDF)
      00A28E 1E 04            [ 2]  792 	ldw	x, (0x04, sp)
      00A290 A3 02 10         [ 2]  793 	cpw	x, #0x0210
      00A293 26 0E            [ 1]  794 	jrne	00121$
                                    795 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 616: if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
      00A295 C6 52 47         [ 1]  796 	ld	a, 0x5247
      00A298 14 01            [ 1]  797 	and	a, (0x01, sp)
      00A29A 27 04            [ 1]  798 	jreq	00102$
                                    799 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 619: status = SET;
      00A29C A6 01            [ 1]  800 	ld	a, #0x01
      00A29E 20 3F            [ 2]  801 	jra	00122$
      00A2A0                        802 00102$:
                                    803 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 624: status = RESET;
      00A2A0 4F               [ 1]  804 	clr	a
      00A2A1 20 3C            [ 2]  805 	jra	00122$
      00A2A3                        806 00121$:
                                    807 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 627: else if (UART2_FLAG == UART2_FLAG_SBK)
      00A2A3 1E 04            [ 2]  808 	ldw	x, (0x04, sp)
      00A2A5 A3 01 01         [ 2]  809 	cpw	x, #0x0101
      00A2A8 26 0E            [ 1]  810 	jrne	00118$
                                    811 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 629: if ((UART2->CR2 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
      00A2AA C6 52 45         [ 1]  812 	ld	a, 0x5245
      00A2AD 14 01            [ 1]  813 	and	a, (0x01, sp)
      00A2AF 27 04            [ 1]  814 	jreq	00105$
                                    815 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 632: status = SET;
      00A2B1 A6 01            [ 1]  816 	ld	a, #0x01
      00A2B3 20 2A            [ 2]  817 	jra	00122$
      00A2B5                        818 00105$:
                                    819 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 637: status = RESET;
      00A2B5 4F               [ 1]  820 	clr	a
      00A2B6 20 27            [ 2]  821 	jra	00122$
      00A2B8                        822 00118$:
                                    823 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 640: else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
      00A2B8 1E 04            [ 2]  824 	ldw	x, (0x04, sp)
      00A2BA A3 03 02         [ 2]  825 	cpw	x, #0x0302
      00A2BD 27 07            [ 1]  826 	jreq	00113$
      00A2BF 1E 04            [ 2]  827 	ldw	x, (0x04, sp)
      00A2C1 A3 03 01         [ 2]  828 	cpw	x, #0x0301
      00A2C4 26 0E            [ 1]  829 	jrne	00114$
      00A2C6                        830 00113$:
                                    831 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 642: if ((UART2->CR6 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
      00A2C6 C6 52 49         [ 1]  832 	ld	a, 0x5249
      00A2C9 14 01            [ 1]  833 	and	a, (0x01, sp)
      00A2CB 27 04            [ 1]  834 	jreq	00108$
                                    835 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 645: status = SET;
      00A2CD A6 01            [ 1]  836 	ld	a, #0x01
      00A2CF 20 0E            [ 2]  837 	jra	00122$
      00A2D1                        838 00108$:
                                    839 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 650: status = RESET;
      00A2D1 4F               [ 1]  840 	clr	a
      00A2D2 20 0B            [ 2]  841 	jra	00122$
      00A2D4                        842 00114$:
                                    843 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 655: if ((UART2->SR & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
      00A2D4 C6 52 40         [ 1]  844 	ld	a, 0x5240
      00A2D7 14 01            [ 1]  845 	and	a, (0x01, sp)
      00A2D9 27 03            [ 1]  846 	jreq	00111$
                                    847 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 658: status = SET;
      00A2DB A6 01            [ 1]  848 	ld	a, #0x01
                                    849 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 663: status = RESET;
      00A2DD 21                     850 	.byte 0x21
      00A2DE                        851 00111$:
      00A2DE 4F               [ 1]  852 	clr	a
      00A2DF                        853 00122$:
                                    854 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 668: return  status;
                                    855 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 669: }
      00A2DF 5B 01            [ 2]  856 	addw	sp, #1
      00A2E1 81               [ 4]  857 	ret
                                    858 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 699: void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)
                                    859 ;	-----------------------------------------
                                    860 ;	 function UART2_ClearFlag
                                    861 ;	-----------------------------------------
      00A2E2                        862 _UART2_ClearFlag:
                                    863 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 704: if (UART2_FLAG == UART2_FLAG_RXNE)
      00A2E2 1E 03            [ 2]  864 	ldw	x, (0x03, sp)
      00A2E4 A3 00 20         [ 2]  865 	cpw	x, #0x0020
      00A2E7 26 05            [ 1]  866 	jrne	00108$
                                    867 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 706: UART2->SR = (uint8_t)~(UART2_SR_RXNE);
      00A2E9 35 DF 52 40      [ 1]  868 	mov	0x5240+0, #0xdf
      00A2ED 81               [ 4]  869 	ret
      00A2EE                        870 00108$:
                                    871 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 709: else if (UART2_FLAG == UART2_FLAG_LBDF)
      00A2EE 1E 03            [ 2]  872 	ldw	x, (0x03, sp)
      00A2F0 A3 02 10         [ 2]  873 	cpw	x, #0x0210
      00A2F3 26 05            [ 1]  874 	jrne	00105$
                                    875 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 711: UART2->CR4 &= (uint8_t)(~UART2_CR4_LBDF);
      00A2F5 72 19 52 47      [ 1]  876 	bres	21063, #4
      00A2F9 81               [ 4]  877 	ret
      00A2FA                        878 00105$:
                                    879 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 716: UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
      00A2FA C6 52 49         [ 1]  880 	ld	a, 0x5249
                                    881 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 714: else if (UART2_FLAG == UART2_FLAG_LHDF)
      00A2FD 1E 03            [ 2]  882 	ldw	x, (0x03, sp)
      00A2FF A3 03 02         [ 2]  883 	cpw	x, #0x0302
      00A302 26 06            [ 1]  884 	jrne	00102$
                                    885 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 716: UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
      00A304 A4 FD            [ 1]  886 	and	a, #0xfd
      00A306 C7 52 49         [ 1]  887 	ld	0x5249, a
      00A309 81               [ 4]  888 	ret
      00A30A                        889 00102$:
                                    890 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 721: UART2->CR6 &= (uint8_t)(~UART2_CR6_LSF);
      00A30A A4 FE            [ 1]  891 	and	a, #0xfe
      00A30C C7 52 49         [ 1]  892 	ld	0x5249, a
                                    893 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 723: }
      00A30F 81               [ 4]  894 	ret
                                    895 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 738: ITStatus UART2_GetITStatus(UART2_IT_TypeDef UART2_IT)
                                    896 ;	-----------------------------------------
                                    897 ;	 function UART2_GetITStatus
                                    898 ;	-----------------------------------------
      00A310                        899 _UART2_GetITStatus:
      00A310 52 02            [ 2]  900 	sub	sp, #2
                                    901 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 750: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
      00A312 7B 06            [ 1]  902 	ld	a, (0x06, sp)
      00A314 97               [ 1]  903 	ld	xl, a
      00A315 A4 0F            [ 1]  904 	and	a, #0x0f
      00A317 88               [ 1]  905 	push	a
      00A318 A6 01            [ 1]  906 	ld	a, #0x01
      00A31A 6B 03            [ 1]  907 	ld	(0x03, sp), a
      00A31C 84               [ 1]  908 	pop	a
      00A31D 4D               [ 1]  909 	tnz	a
      00A31E 27 05            [ 1]  910 	jreq	00184$
      00A320                        911 00183$:
      00A320 08 02            [ 1]  912 	sll	(0x02, sp)
      00A322 4A               [ 1]  913 	dec	a
      00A323 26 FB            [ 1]  914 	jrne	00183$
      00A325                        915 00184$:
                                    916 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 752: itmask1 = (uint8_t)((uint8_t)UART2_IT >> (uint8_t)4);
      00A325 9F               [ 1]  917 	ld	a, xl
      00A326 4E               [ 1]  918 	swap	a
      00A327 A4 0F            [ 1]  919 	and	a, #0x0f
                                    920 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 754: itmask2 = (uint8_t)((uint8_t)1 << itmask1);
      00A329 88               [ 1]  921 	push	a
      00A32A A6 01            [ 1]  922 	ld	a, #0x01
      00A32C 6B 02            [ 1]  923 	ld	(0x02, sp), a
      00A32E 84               [ 1]  924 	pop	a
      00A32F 4D               [ 1]  925 	tnz	a
      00A330 27 05            [ 1]  926 	jreq	00186$
      00A332                        927 00185$:
      00A332 08 01            [ 1]  928 	sll	(0x01, sp)
      00A334 4A               [ 1]  929 	dec	a
      00A335 26 FB            [ 1]  930 	jrne	00185$
      00A337                        931 00186$:
                                    932 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 757: if (UART2_IT == UART2_IT_PE)
      00A337 1E 05            [ 2]  933 	ldw	x, (0x05, sp)
      00A339 A3 01 00         [ 2]  934 	cpw	x, #0x0100
      00A33C 26 18            [ 1]  935 	jrne	00124$
                                    936 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 760: enablestatus = (uint8_t)((uint8_t)UART2->CR1 & itmask2);
      00A33E C6 52 44         [ 1]  937 	ld	a, 0x5244
      00A341 14 01            [ 1]  938 	and	a, (0x01, sp)
      00A343 97               [ 1]  939 	ld	xl, a
                                    940 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 763: if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
      00A344 C6 52 40         [ 1]  941 	ld	a, 0x5240
      00A347 14 02            [ 1]  942 	and	a, (0x02, sp)
      00A349 27 08            [ 1]  943 	jreq	00102$
      00A34B 9F               [ 1]  944 	ld	a, xl
      00A34C 4D               [ 1]  945 	tnz	a
      00A34D 27 04            [ 1]  946 	jreq	00102$
                                    947 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 766: pendingbitstatus = SET;
      00A34F A6 01            [ 1]  948 	ld	a, #0x01
      00A351 20 56            [ 2]  949 	jra	00125$
      00A353                        950 00102$:
                                    951 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 771: pendingbitstatus = RESET;
      00A353 4F               [ 1]  952 	clr	a
      00A354 20 53            [ 2]  953 	jra	00125$
      00A356                        954 00124$:
                                    955 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 774: else if (UART2_IT == UART2_IT_LBDF)
      00A356 1E 05            [ 2]  956 	ldw	x, (0x05, sp)
      00A358 A3 03 46         [ 2]  957 	cpw	x, #0x0346
      00A35B 26 18            [ 1]  958 	jrne	00121$
                                    959 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 777: enablestatus = (uint8_t)((uint8_t)UART2->CR4 & itmask2);
      00A35D C6 52 47         [ 1]  960 	ld	a, 0x5247
      00A360 14 01            [ 1]  961 	and	a, (0x01, sp)
      00A362 97               [ 1]  962 	ld	xl, a
                                    963 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 779: if (((UART2->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
      00A363 C6 52 47         [ 1]  964 	ld	a, 0x5247
      00A366 14 02            [ 1]  965 	and	a, (0x02, sp)
      00A368 27 08            [ 1]  966 	jreq	00106$
      00A36A 9F               [ 1]  967 	ld	a, xl
      00A36B 4D               [ 1]  968 	tnz	a
      00A36C 27 04            [ 1]  969 	jreq	00106$
                                    970 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 782: pendingbitstatus = SET;
      00A36E A6 01            [ 1]  971 	ld	a, #0x01
      00A370 20 37            [ 2]  972 	jra	00125$
      00A372                        973 00106$:
                                    974 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 787: pendingbitstatus = RESET;
      00A372 4F               [ 1]  975 	clr	a
      00A373 20 34            [ 2]  976 	jra	00125$
      00A375                        977 00121$:
                                    978 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 790: else if (UART2_IT == UART2_IT_LHDF)
      00A375 1E 05            [ 2]  979 	ldw	x, (0x05, sp)
      00A377 A3 04 12         [ 2]  980 	cpw	x, #0x0412
      00A37A 26 18            [ 1]  981 	jrne	00118$
                                    982 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 793: enablestatus = (uint8_t)((uint8_t)UART2->CR6 & itmask2);
      00A37C C6 52 49         [ 1]  983 	ld	a, 0x5249
      00A37F 14 01            [ 1]  984 	and	a, (0x01, sp)
      00A381 97               [ 1]  985 	ld	xl, a
                                    986 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 795: if (((UART2->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
      00A382 C6 52 49         [ 1]  987 	ld	a, 0x5249
      00A385 14 02            [ 1]  988 	and	a, (0x02, sp)
      00A387 27 08            [ 1]  989 	jreq	00110$
      00A389 9F               [ 1]  990 	ld	a, xl
      00A38A 4D               [ 1]  991 	tnz	a
      00A38B 27 04            [ 1]  992 	jreq	00110$
                                    993 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 798: pendingbitstatus = SET;
      00A38D A6 01            [ 1]  994 	ld	a, #0x01
      00A38F 20 18            [ 2]  995 	jra	00125$
      00A391                        996 00110$:
                                    997 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 803: pendingbitstatus = RESET;
      00A391 4F               [ 1]  998 	clr	a
      00A392 20 15            [ 2]  999 	jra	00125$
      00A394                       1000 00118$:
                                   1001 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 809: enablestatus = (uint8_t)((uint8_t)UART2->CR2 & itmask2);
      00A394 C6 52 45         [ 1] 1002 	ld	a, 0x5245
      00A397 14 01            [ 1] 1003 	and	a, (0x01, sp)
      00A399 97               [ 1] 1004 	ld	xl, a
                                   1005 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 811: if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
      00A39A C6 52 40         [ 1] 1006 	ld	a, 0x5240
      00A39D 14 02            [ 1] 1007 	and	a, (0x02, sp)
      00A39F 27 07            [ 1] 1008 	jreq	00114$
      00A3A1 9F               [ 1] 1009 	ld	a, xl
      00A3A2 4D               [ 1] 1010 	tnz	a
      00A3A3 27 03            [ 1] 1011 	jreq	00114$
                                   1012 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 814: pendingbitstatus = SET;
      00A3A5 A6 01            [ 1] 1013 	ld	a, #0x01
                                   1014 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 819: pendingbitstatus = RESET;
      00A3A7 21                    1015 	.byte 0x21
      00A3A8                       1016 00114$:
      00A3A8 4F               [ 1] 1017 	clr	a
      00A3A9                       1018 00125$:
                                   1019 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 823: return  pendingbitstatus;
                                   1020 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 824: }
      00A3A9 5B 02            [ 2] 1021 	addw	sp, #2
      00A3AB 81               [ 4] 1022 	ret
                                   1023 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 852: void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)
                                   1024 ;	-----------------------------------------
                                   1025 ;	 function UART2_ClearITPendingBit
                                   1026 ;	-----------------------------------------
      00A3AC                       1027 _UART2_ClearITPendingBit:
                                   1028 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 857: if (UART2_IT == UART2_IT_RXNE)
      00A3AC 1E 03            [ 2] 1029 	ldw	x, (0x03, sp)
      00A3AE A3 02 55         [ 2] 1030 	cpw	x, #0x0255
      00A3B1 26 05            [ 1] 1031 	jrne	00105$
                                   1032 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 859: UART2->SR = (uint8_t)~(UART2_SR_RXNE);
      00A3B3 35 DF 52 40      [ 1] 1033 	mov	0x5240+0, #0xdf
      00A3B7 81               [ 4] 1034 	ret
      00A3B8                       1035 00105$:
                                   1036 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 862: else if (UART2_IT == UART2_IT_LBDF)
      00A3B8 1E 03            [ 2] 1037 	ldw	x, (0x03, sp)
      00A3BA A3 03 46         [ 2] 1038 	cpw	x, #0x0346
      00A3BD 26 05            [ 1] 1039 	jrne	00102$
                                   1040 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 864: UART2->CR4 &= (uint8_t)~(UART2_CR4_LBDF);
      00A3BF 72 19 52 47      [ 1] 1041 	bres	21063, #4
      00A3C3 81               [ 4] 1042 	ret
      00A3C4                       1043 00102$:
                                   1044 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 869: UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
      00A3C4 72 13 52 49      [ 1] 1045 	bres	21065, #1
                                   1046 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_uart2.c: 871: }
      00A3C8 81               [ 4] 1047 	ret
                                   1048 	.area CODE
                                   1049 	.area CONST
                                   1050 	.area INITIALIZER
                                   1051 	.area CABS (ABS)
