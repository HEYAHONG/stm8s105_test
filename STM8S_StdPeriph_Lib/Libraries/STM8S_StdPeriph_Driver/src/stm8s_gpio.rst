                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_gpio
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _GPIO_DeInit
                                     12 	.globl _GPIO_Init
                                     13 	.globl _GPIO_Write
                                     14 	.globl _GPIO_WriteHigh
                                     15 	.globl _GPIO_WriteLow
                                     16 	.globl _GPIO_WriteReverse
                                     17 	.globl _GPIO_ReadOutputData
                                     18 	.globl _GPIO_ReadInputData
                                     19 	.globl _GPIO_ReadInputPin
                                     20 	.globl _GPIO_ExternalPullUpConfig
                                     21 ;--------------------------------------------------------
                                     22 ; ram data
                                     23 ;--------------------------------------------------------
                                     24 	.area DATA
                                     25 ;--------------------------------------------------------
                                     26 ; ram data
                                     27 ;--------------------------------------------------------
                                     28 	.area INITIALIZED
                                     29 ;--------------------------------------------------------
                                     30 ; absolute external ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area DABS (ABS)
                                     33 
                                     34 ; default segment ordering for linker
                                     35 	.area HOME
                                     36 	.area GSINIT
                                     37 	.area GSFINAL
                                     38 	.area CONST
                                     39 	.area INITIALIZER
                                     40 	.area CODE
                                     41 
                                     42 ;--------------------------------------------------------
                                     43 ; global & static initialisations
                                     44 ;--------------------------------------------------------
                                     45 	.area HOME
                                     46 	.area GSINIT
                                     47 	.area GSFINAL
                                     48 	.area GSINIT
                                     49 ;--------------------------------------------------------
                                     50 ; Home
                                     51 ;--------------------------------------------------------
                                     52 	.area HOME
                                     53 	.area HOME
                                     54 ;--------------------------------------------------------
                                     55 ; code
                                     56 ;--------------------------------------------------------
                                     57 	.area CODE
                                     58 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 53: void GPIO_DeInit(GPIO_TypeDef* GPIOx)
                                     59 ;	-----------------------------------------
                                     60 ;	 function GPIO_DeInit
                                     61 ;	-----------------------------------------
      00966E                         62 _GPIO_DeInit:
                                     63 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 55: GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      00966E 16 03            [ 2]   64 	ldw	y, (0x03, sp)
      009670 90 7F            [ 1]   65 	clr	(y)
                                     66 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 56: GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      009672 93               [ 1]   67 	ldw	x, y
      009673 5C               [ 1]   68 	incw	x
      009674 5C               [ 1]   69 	incw	x
      009675 7F               [ 1]   70 	clr	(x)
                                     71 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 57: GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      009676 93               [ 1]   72 	ldw	x, y
      009677 6F 03            [ 1]   73 	clr	(0x0003, x)
                                     74 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 58: GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      009679 93               [ 1]   75 	ldw	x, y
      00967A 6F 04            [ 1]   76 	clr	(0x0004, x)
                                     77 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 59: }
      00967C 81               [ 4]   78 	ret
                                     79 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 71: void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
                                     80 ;	-----------------------------------------
                                     81 ;	 function GPIO_Init
                                     82 ;	-----------------------------------------
      00967D                         83 _GPIO_Init:
      00967D 52 05            [ 2]   84 	sub	sp, #5
                                     85 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 81: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      00967F 16 08            [ 2]   86 	ldw	y, (0x08, sp)
      009681 93               [ 1]   87 	ldw	x, y
      009682 1C 00 04         [ 2]   88 	addw	x, #0x0004
      009685 1F 04            [ 2]   89 	ldw	(0x04, sp), x
      009687 F6               [ 1]   90 	ld	a, (x)
      009688 88               [ 1]   91 	push	a
      009689 7B 0B            [ 1]   92 	ld	a, (0x0b, sp)
      00968B 43               [ 1]   93 	cpl	a
      00968C 6B 04            [ 1]   94 	ld	(0x04, sp), a
      00968E 84               [ 1]   95 	pop	a
      00968F 14 03            [ 1]   96 	and	a, (0x03, sp)
      009691 1E 04            [ 2]   97 	ldw	x, (0x04, sp)
      009693 F7               [ 1]   98 	ld	(x), a
                                     99 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 98: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      009694 93               [ 1]  100 	ldw	x, y
      009695 5C               [ 1]  101 	incw	x
      009696 5C               [ 1]  102 	incw	x
      009697 1F 01            [ 2]  103 	ldw	(0x01, sp), x
                                    104 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 87: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
      009699 0D 0B            [ 1]  105 	tnz	(0x0b, sp)
      00969B 2A 1E            [ 1]  106 	jrpl	00105$
                                    107 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 91: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      00969D 90 F6            [ 1]  108 	ld	a, (y)
                                    109 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 89: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
      00969F 88               [ 1]  110 	push	a
      0096A0 7B 0C            [ 1]  111 	ld	a, (0x0c, sp)
      0096A2 A5 10            [ 1]  112 	bcp	a, #0x10
      0096A4 84               [ 1]  113 	pop	a
      0096A5 27 06            [ 1]  114 	jreq	00102$
                                    115 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 91: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      0096A7 1A 0A            [ 1]  116 	or	a, (0x0a, sp)
      0096A9 90 F7            [ 1]  117 	ld	(y), a
      0096AB 20 04            [ 2]  118 	jra	00103$
      0096AD                        119 00102$:
                                    120 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 95: GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
      0096AD 14 03            [ 1]  121 	and	a, (0x03, sp)
      0096AF 90 F7            [ 1]  122 	ld	(y), a
      0096B1                        123 00103$:
                                    124 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 98: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      0096B1 1E 01            [ 2]  125 	ldw	x, (0x01, sp)
      0096B3 F6               [ 1]  126 	ld	a, (x)
      0096B4 1A 0A            [ 1]  127 	or	a, (0x0a, sp)
      0096B6 1E 01            [ 2]  128 	ldw	x, (0x01, sp)
      0096B8 F7               [ 1]  129 	ld	(x), a
      0096B9 20 08            [ 2]  130 	jra	00106$
      0096BB                        131 00105$:
                                    132 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 103: GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
      0096BB 1E 01            [ 2]  133 	ldw	x, (0x01, sp)
      0096BD F6               [ 1]  134 	ld	a, (x)
      0096BE 14 03            [ 1]  135 	and	a, (0x03, sp)
      0096C0 1E 01            [ 2]  136 	ldw	x, (0x01, sp)
      0096C2 F7               [ 1]  137 	ld	(x), a
      0096C3                        138 00106$:
                                    139 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 112: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      0096C3 93               [ 1]  140 	ldw	x, y
      0096C4 1C 00 03         [ 2]  141 	addw	x, #0x0003
      0096C7 F6               [ 1]  142 	ld	a, (x)
                                    143 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 110: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
      0096C8 88               [ 1]  144 	push	a
      0096C9 7B 0C            [ 1]  145 	ld	a, (0x0c, sp)
      0096CB A5 40            [ 1]  146 	bcp	a, #0x40
      0096CD 84               [ 1]  147 	pop	a
      0096CE 27 05            [ 1]  148 	jreq	00108$
                                    149 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 112: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      0096D0 1A 0A            [ 1]  150 	or	a, (0x0a, sp)
      0096D2 F7               [ 1]  151 	ld	(x), a
      0096D3 20 03            [ 2]  152 	jra	00109$
      0096D5                        153 00108$:
                                    154 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 116: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      0096D5 14 03            [ 1]  155 	and	a, (0x03, sp)
      0096D7 F7               [ 1]  156 	ld	(x), a
      0096D8                        157 00109$:
                                    158 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 81: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      0096D8 1E 04            [ 2]  159 	ldw	x, (0x04, sp)
      0096DA F6               [ 1]  160 	ld	a, (x)
                                    161 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 123: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
      0096DB 88               [ 1]  162 	push	a
      0096DC 7B 0C            [ 1]  163 	ld	a, (0x0c, sp)
      0096DE A5 20            [ 1]  164 	bcp	a, #0x20
      0096E0 84               [ 1]  165 	pop	a
      0096E1 27 07            [ 1]  166 	jreq	00111$
                                    167 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 125: GPIOx->CR2 |= (uint8_t)GPIO_Pin;
      0096E3 1A 0A            [ 1]  168 	or	a, (0x0a, sp)
      0096E5 1E 04            [ 2]  169 	ldw	x, (0x04, sp)
      0096E7 F7               [ 1]  170 	ld	(x), a
      0096E8 20 05            [ 2]  171 	jra	00113$
      0096EA                        172 00111$:
                                    173 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 129: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      0096EA 14 03            [ 1]  174 	and	a, (0x03, sp)
      0096EC 1E 04            [ 2]  175 	ldw	x, (0x04, sp)
      0096EE F7               [ 1]  176 	ld	(x), a
      0096EF                        177 00113$:
                                    178 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 131: }
      0096EF 5B 05            [ 2]  179 	addw	sp, #5
      0096F1 81               [ 4]  180 	ret
                                    181 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 141: void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
                                    182 ;	-----------------------------------------
                                    183 ;	 function GPIO_Write
                                    184 ;	-----------------------------------------
      0096F2                        185 _GPIO_Write:
                                    186 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 143: GPIOx->ODR = PortVal;
      0096F2 1E 03            [ 2]  187 	ldw	x, (0x03, sp)
      0096F4 7B 05            [ 1]  188 	ld	a, (0x05, sp)
      0096F6 F7               [ 1]  189 	ld	(x), a
                                    190 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 144: }
      0096F7 81               [ 4]  191 	ret
                                    192 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 154: void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    193 ;	-----------------------------------------
                                    194 ;	 function GPIO_WriteHigh
                                    195 ;	-----------------------------------------
      0096F8                        196 _GPIO_WriteHigh:
                                    197 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 156: GPIOx->ODR |= (uint8_t)PortPins;
      0096F8 1E 03            [ 2]  198 	ldw	x, (0x03, sp)
      0096FA F6               [ 1]  199 	ld	a, (x)
      0096FB 1A 05            [ 1]  200 	or	a, (0x05, sp)
      0096FD F7               [ 1]  201 	ld	(x), a
                                    202 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 157: }
      0096FE 81               [ 4]  203 	ret
                                    204 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 167: void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    205 ;	-----------------------------------------
                                    206 ;	 function GPIO_WriteLow
                                    207 ;	-----------------------------------------
      0096FF                        208 _GPIO_WriteLow:
      0096FF 88               [ 1]  209 	push	a
                                    210 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 169: GPIOx->ODR &= (uint8_t)(~PortPins);
      009700 1E 04            [ 2]  211 	ldw	x, (0x04, sp)
      009702 F6               [ 1]  212 	ld	a, (x)
      009703 6B 01            [ 1]  213 	ld	(0x01, sp), a
      009705 7B 06            [ 1]  214 	ld	a, (0x06, sp)
      009707 43               [ 1]  215 	cpl	a
      009708 14 01            [ 1]  216 	and	a, (0x01, sp)
      00970A F7               [ 1]  217 	ld	(x), a
                                    218 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 170: }
      00970B 84               [ 1]  219 	pop	a
      00970C 81               [ 4]  220 	ret
                                    221 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 180: void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    222 ;	-----------------------------------------
                                    223 ;	 function GPIO_WriteReverse
                                    224 ;	-----------------------------------------
      00970D                        225 _GPIO_WriteReverse:
                                    226 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 182: GPIOx->ODR ^= (uint8_t)PortPins;
      00970D 1E 03            [ 2]  227 	ldw	x, (0x03, sp)
      00970F F6               [ 1]  228 	ld	a, (x)
      009710 18 05            [ 1]  229 	xor	a, (0x05, sp)
      009712 F7               [ 1]  230 	ld	(x), a
                                    231 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 183: }
      009713 81               [ 4]  232 	ret
                                    233 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 191: uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
                                    234 ;	-----------------------------------------
                                    235 ;	 function GPIO_ReadOutputData
                                    236 ;	-----------------------------------------
      009714                        237 _GPIO_ReadOutputData:
                                    238 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 193: return ((uint8_t)GPIOx->ODR);
      009714 1E 03            [ 2]  239 	ldw	x, (0x03, sp)
      009716 F6               [ 1]  240 	ld	a, (x)
                                    241 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 194: }
      009717 81               [ 4]  242 	ret
                                    243 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 202: uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
                                    244 ;	-----------------------------------------
                                    245 ;	 function GPIO_ReadInputData
                                    246 ;	-----------------------------------------
      009718                        247 _GPIO_ReadInputData:
                                    248 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 204: return ((uint8_t)GPIOx->IDR);
      009718 1E 03            [ 2]  249 	ldw	x, (0x03, sp)
      00971A E6 01            [ 1]  250 	ld	a, (0x1, x)
                                    251 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 205: }
      00971C 81               [ 4]  252 	ret
                                    253 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 213: BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
                                    254 ;	-----------------------------------------
                                    255 ;	 function GPIO_ReadInputPin
                                    256 ;	-----------------------------------------
      00971D                        257 _GPIO_ReadInputPin:
                                    258 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 215: return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
      00971D 1E 03            [ 2]  259 	ldw	x, (0x03, sp)
      00971F E6 01            [ 1]  260 	ld	a, (0x1, x)
      009721 14 05            [ 1]  261 	and	a, (0x05, sp)
                                    262 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 216: }
      009723 81               [ 4]  263 	ret
                                    264 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 225: void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
                                    265 ;	-----------------------------------------
                                    266 ;	 function GPIO_ExternalPullUpConfig
                                    267 ;	-----------------------------------------
      009724                        268 _GPIO_ExternalPullUpConfig:
      009724 88               [ 1]  269 	push	a
                                    270 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 233: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      009725 1E 04            [ 2]  271 	ldw	x, (0x04, sp)
      009727 1C 00 03         [ 2]  272 	addw	x, #0x0003
      00972A F6               [ 1]  273 	ld	a, (x)
                                    274 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 231: if (NewState != DISABLE) /* External Pull-Up Set*/
      00972B 0D 07            [ 1]  275 	tnz	(0x07, sp)
      00972D 27 05            [ 1]  276 	jreq	00102$
                                    277 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 233: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      00972F 1A 06            [ 1]  278 	or	a, (0x06, sp)
      009731 F7               [ 1]  279 	ld	(x), a
      009732 20 0A            [ 2]  280 	jra	00104$
      009734                        281 00102$:
                                    282 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 236: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      009734 88               [ 1]  283 	push	a
      009735 7B 07            [ 1]  284 	ld	a, (0x07, sp)
      009737 43               [ 1]  285 	cpl	a
      009738 6B 02            [ 1]  286 	ld	(0x02, sp), a
      00973A 84               [ 1]  287 	pop	a
      00973B 14 01            [ 1]  288 	and	a, (0x01, sp)
      00973D F7               [ 1]  289 	ld	(x), a
      00973E                        290 00104$:
                                    291 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_gpio.c: 238: }
      00973E 84               [ 1]  292 	pop	a
      00973F 81               [ 4]  293 	ret
                                    294 	.area CODE
                                    295 	.area CONST
                                    296 	.area INITIALIZER
                                    297 	.area CABS (ABS)
