                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_exti
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _EXTI_DeInit
                                     12 	.globl _EXTI_SetExtIntSensitivity
                                     13 	.globl _EXTI_SetTLISensitivity
                                     14 	.globl _EXTI_GetExtIntSensitivity
                                     15 	.globl _EXTI_GetTLISensitivity
                                     16 ;--------------------------------------------------------
                                     17 ; ram data
                                     18 ;--------------------------------------------------------
                                     19 	.area DATA
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area INITIALIZED
                                     24 ;--------------------------------------------------------
                                     25 ; absolute external ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area DABS (ABS)
                                     28 
                                     29 ; default segment ordering for linker
                                     30 	.area HOME
                                     31 	.area GSINIT
                                     32 	.area GSFINAL
                                     33 	.area CONST
                                     34 	.area INITIALIZER
                                     35 	.area CODE
                                     36 
                                     37 ;--------------------------------------------------------
                                     38 ; global & static initialisations
                                     39 ;--------------------------------------------------------
                                     40 	.area HOME
                                     41 	.area GSINIT
                                     42 	.area GSFINAL
                                     43 	.area GSINIT
                                     44 ;--------------------------------------------------------
                                     45 ; Home
                                     46 ;--------------------------------------------------------
                                     47 	.area HOME
                                     48 	.area HOME
                                     49 ;--------------------------------------------------------
                                     50 ; code
                                     51 ;--------------------------------------------------------
                                     52 	.area CODE
                                     53 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 53: void EXTI_DeInit(void)
                                     54 ;	-----------------------------------------
                                     55 ;	 function EXTI_DeInit
                                     56 ;	-----------------------------------------
      0096CC                         57 _EXTI_DeInit:
                                     58 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 55: EXTI->CR1 = EXTI_CR1_RESET_VALUE;
      0096CC 35 00 50 A0      [ 1]   59 	mov	0x50a0+0, #0x00
                                     60 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 56: EXTI->CR2 = EXTI_CR2_RESET_VALUE;
      0096D0 35 00 50 A1      [ 1]   61 	mov	0x50a1+0, #0x00
                                     62 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 57: }
      0096D4 81               [ 4]   63 	ret
                                     64 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 70: void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
                                     65 ;	-----------------------------------------
                                     66 ;	 function EXTI_SetExtIntSensitivity
                                     67 ;	-----------------------------------------
      0096D5                         68 _EXTI_SetExtIntSensitivity:
      0096D5 52 02            [ 2]   69 	sub	sp, #2
                                     70 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 77: switch (Port)
      0096D7 7B 05            [ 1]   71 	ld	a, (0x05, sp)
      0096D9 A1 04            [ 1]   72 	cp	a, #0x04
      0096DB 23 03            [ 2]   73 	jrule	00115$
      0096DD CC 97 64         [ 2]   74 	jp	00108$
      0096E0                         75 00115$:
                                     76 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 85: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
      0096E0 7B 06            [ 1]   77 	ld	a, (0x06, sp)
      0096E2 90 97            [ 1]   78 	ld	yl, a
                                     79 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 77: switch (Port)
      0096E4 5F               [ 1]   80 	clrw	x
      0096E5 7B 05            [ 1]   81 	ld	a, (0x05, sp)
      0096E7 97               [ 1]   82 	ld	xl, a
      0096E8 58               [ 2]   83 	sllw	x
      0096E9 DE 96 ED         [ 2]   84 	ldw	x, (#00116$, x)
      0096EC FC               [ 2]   85 	jp	(x)
      0096ED                         86 00116$:
      0096ED 96 F7                   87 	.dw	#00101$
      0096EF 97 09                   88 	.dw	#00102$
      0096F1 97 20                   89 	.dw	#00103$
      0096F3 97 39                   90 	.dw	#00104$
      0096F5 97 54                   91 	.dw	#00105$
                                     92 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 79: case EXTI_PORT_GPIOA:
      0096F7                         93 00101$:
                                     94 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 80: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
      0096F7 C6 50 A0         [ 1]   95 	ld	a, 0x50a0
      0096FA A4 FC            [ 1]   96 	and	a, #0xfc
      0096FC C7 50 A0         [ 1]   97 	ld	0x50a0, a
                                     98 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 81: EXTI->CR1 |= (uint8_t)(SensitivityValue);
      0096FF C6 50 A0         [ 1]   99 	ld	a, 0x50a0
      009702 1A 06            [ 1]  100 	or	a, (0x06, sp)
      009704 C7 50 A0         [ 1]  101 	ld	0x50a0, a
                                    102 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 82: break;
      009707 20 5B            [ 2]  103 	jra	00108$
                                    104 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 83: case EXTI_PORT_GPIOB:
      009709                        105 00102$:
                                    106 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 84: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
      009709 C6 50 A0         [ 1]  107 	ld	a, 0x50a0
      00970C A4 F3            [ 1]  108 	and	a, #0xf3
      00970E C7 50 A0         [ 1]  109 	ld	0x50a0, a
                                    110 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 85: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
      009711 C6 50 A0         [ 1]  111 	ld	a, 0x50a0
      009714 93               [ 1]  112 	ldw	x, y
      009715 58               [ 2]  113 	sllw	x
      009716 58               [ 2]  114 	sllw	x
      009717 89               [ 2]  115 	pushw	x
      009718 1A 02            [ 1]  116 	or	a, (2, sp)
      00971A 85               [ 2]  117 	popw	x
      00971B C7 50 A0         [ 1]  118 	ld	0x50a0, a
                                    119 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 86: break;
      00971E 20 44            [ 2]  120 	jra	00108$
                                    121 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 87: case EXTI_PORT_GPIOC:
      009720                        122 00103$:
                                    123 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 88: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
      009720 C6 50 A0         [ 1]  124 	ld	a, 0x50a0
      009723 A4 CF            [ 1]  125 	and	a, #0xcf
      009725 C7 50 A0         [ 1]  126 	ld	0x50a0, a
                                    127 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 89: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
      009728 C6 50 A0         [ 1]  128 	ld	a, 0x50a0
      00972B 6B 02            [ 1]  129 	ld	(0x02, sp), a
      00972D 90 9F            [ 1]  130 	ld	a, yl
      00972F 4E               [ 1]  131 	swap	a
      009730 A4 F0            [ 1]  132 	and	a, #0xf0
      009732 1A 02            [ 1]  133 	or	a, (0x02, sp)
      009734 C7 50 A0         [ 1]  134 	ld	0x50a0, a
                                    135 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 90: break;
      009737 20 2B            [ 2]  136 	jra	00108$
                                    137 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 91: case EXTI_PORT_GPIOD:
      009739                        138 00104$:
                                    139 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 92: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
      009739 C6 50 A0         [ 1]  140 	ld	a, 0x50a0
      00973C A4 3F            [ 1]  141 	and	a, #0x3f
      00973E C7 50 A0         [ 1]  142 	ld	0x50a0, a
                                    143 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 93: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
      009741 C6 50 A0         [ 1]  144 	ld	a, 0x50a0
      009744 6B 01            [ 1]  145 	ld	(0x01, sp), a
      009746 90 9F            [ 1]  146 	ld	a, yl
      009748 4E               [ 1]  147 	swap	a
      009749 A4 F0            [ 1]  148 	and	a, #0xf0
      00974B 48               [ 1]  149 	sll	a
      00974C 48               [ 1]  150 	sll	a
      00974D 1A 01            [ 1]  151 	or	a, (0x01, sp)
      00974F C7 50 A0         [ 1]  152 	ld	0x50a0, a
                                    153 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 94: break;
      009752 20 10            [ 2]  154 	jra	00108$
                                    155 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 95: case EXTI_PORT_GPIOE:
      009754                        156 00105$:
                                    157 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 96: EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
      009754 C6 50 A1         [ 1]  158 	ld	a, 0x50a1
      009757 A4 FC            [ 1]  159 	and	a, #0xfc
      009759 C7 50 A1         [ 1]  160 	ld	0x50a1, a
                                    161 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 97: EXTI->CR2 |= (uint8_t)(SensitivityValue);
      00975C C6 50 A1         [ 1]  162 	ld	a, 0x50a1
      00975F 1A 06            [ 1]  163 	or	a, (0x06, sp)
      009761 C7 50 A1         [ 1]  164 	ld	0x50a1, a
                                    165 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 101: }
      009764                        166 00108$:
                                    167 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 102: }
      009764 5B 02            [ 2]  168 	addw	sp, #2
      009766 81               [ 4]  169 	ret
                                    170 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 111: void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
                                    171 ;	-----------------------------------------
                                    172 ;	 function EXTI_SetTLISensitivity
                                    173 ;	-----------------------------------------
      009767                        174 _EXTI_SetTLISensitivity:
                                    175 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 117: EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
      009767 C6 50 A1         [ 1]  176 	ld	a, 0x50a1
      00976A A4 FB            [ 1]  177 	and	a, #0xfb
      00976C C7 50 A1         [ 1]  178 	ld	0x50a1, a
                                    179 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 118: EXTI->CR2 |= (uint8_t)(SensitivityValue);
      00976F C6 50 A1         [ 1]  180 	ld	a, 0x50a1
      009772 1A 03            [ 1]  181 	or	a, (0x03, sp)
      009774 C7 50 A1         [ 1]  182 	ld	0x50a1, a
                                    183 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 119: }
      009777 81               [ 4]  184 	ret
                                    185 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 126: EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
                                    186 ;	-----------------------------------------
                                    187 ;	 function EXTI_GetExtIntSensitivity
                                    188 ;	-----------------------------------------
      009778                        189 _EXTI_GetExtIntSensitivity:
                                    190 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 128: uint8_t value = 0;
      009778 4F               [ 1]  191 	clr	a
                                    192 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 133: switch (Port)
      009779 88               [ 1]  193 	push	a
      00977A 7B 04            [ 1]  194 	ld	a, (0x04, sp)
      00977C A1 04            [ 1]  195 	cp	a, #0x04
      00977E 84               [ 1]  196 	pop	a
      00977F 23 01            [ 2]  197 	jrule	00115$
      009781 81               [ 4]  198 	ret
      009782                        199 00115$:
      009782 5F               [ 1]  200 	clrw	x
      009783 7B 03            [ 1]  201 	ld	a, (0x03, sp)
      009785 97               [ 1]  202 	ld	xl, a
      009786 58               [ 2]  203 	sllw	x
      009787 DE 97 8B         [ 2]  204 	ldw	x, (#00116$, x)
      00978A FC               [ 2]  205 	jp	(x)
      00978B                        206 00116$:
      00978B 97 95                  207 	.dw	#00101$
      00978D 97 9B                  208 	.dw	#00102$
      00978F 97 A3                  209 	.dw	#00103$
      009791 97 AC                  210 	.dw	#00104$
      009793 97 B7                  211 	.dw	#00105$
                                    212 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 135: case EXTI_PORT_GPIOA:
      009795                        213 00101$:
                                    214 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 136: value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
      009795 C6 50 A0         [ 1]  215 	ld	a, 0x50a0
      009798 A4 03            [ 1]  216 	and	a, #0x03
                                    217 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 137: break;
      00979A 81               [ 4]  218 	ret
                                    219 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 138: case EXTI_PORT_GPIOB:
      00979B                        220 00102$:
                                    221 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 139: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
      00979B C6 50 A0         [ 1]  222 	ld	a, 0x50a0
      00979E A4 0C            [ 1]  223 	and	a, #0x0c
      0097A0 44               [ 1]  224 	srl	a
      0097A1 44               [ 1]  225 	srl	a
                                    226 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 140: break;
      0097A2 81               [ 4]  227 	ret
                                    228 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 141: case EXTI_PORT_GPIOC:
      0097A3                        229 00103$:
                                    230 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 142: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
      0097A3 C6 50 A0         [ 1]  231 	ld	a, 0x50a0
      0097A6 A4 30            [ 1]  232 	and	a, #0x30
      0097A8 4E               [ 1]  233 	swap	a
      0097A9 A4 0F            [ 1]  234 	and	a, #0x0f
                                    235 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 143: break;
      0097AB 81               [ 4]  236 	ret
                                    237 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 144: case EXTI_PORT_GPIOD:
      0097AC                        238 00104$:
                                    239 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 145: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
      0097AC C6 50 A0         [ 1]  240 	ld	a, 0x50a0
      0097AF A4 C0            [ 1]  241 	and	a, #0xc0
      0097B1 4E               [ 1]  242 	swap	a
      0097B2 A4 0F            [ 1]  243 	and	a, #0x0f
      0097B4 44               [ 1]  244 	srl	a
      0097B5 44               [ 1]  245 	srl	a
                                    246 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 146: break;
      0097B6 81               [ 4]  247 	ret
                                    248 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 147: case EXTI_PORT_GPIOE:
      0097B7                        249 00105$:
                                    250 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 148: value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
      0097B7 C6 50 A1         [ 1]  251 	ld	a, 0x50a1
      0097BA A4 03            [ 1]  252 	and	a, #0x03
                                    253 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 152: }
                                    254 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 154: return((EXTI_Sensitivity_TypeDef)value);
                                    255 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 155: }
      0097BC 81               [ 4]  256 	ret
                                    257 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 162: EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
                                    258 ;	-----------------------------------------
                                    259 ;	 function EXTI_GetTLISensitivity
                                    260 ;	-----------------------------------------
      0097BD                        261 _EXTI_GetTLISensitivity:
                                    262 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 167: value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
      0097BD C6 50 A1         [ 1]  263 	ld	a, 0x50a1
      0097C0 A4 04            [ 1]  264 	and	a, #0x04
                                    265 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 169: return((EXTI_TLISensitivity_TypeDef)value);
                                    266 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 170: }
      0097C2 81               [ 4]  267 	ret
                                    268 	.area CODE
                                    269 	.area CONST
                                    270 	.area INITIALIZER
                                    271 	.area CABS (ABS)
