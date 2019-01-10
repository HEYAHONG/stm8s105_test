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
      009A0A                         57 _EXTI_DeInit:
                                     58 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 55: EXTI->CR1 = EXTI_CR1_RESET_VALUE;
      009A0A 35 00 50 A0      [ 1]   59 	mov	0x50a0+0, #0x00
                                     60 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 56: EXTI->CR2 = EXTI_CR2_RESET_VALUE;
      009A0E 35 00 50 A1      [ 1]   61 	mov	0x50a1+0, #0x00
                                     62 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 57: }
      009A12 81               [ 4]   63 	ret
                                     64 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 70: void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
                                     65 ;	-----------------------------------------
                                     66 ;	 function EXTI_SetExtIntSensitivity
                                     67 ;	-----------------------------------------
      009A13                         68 _EXTI_SetExtIntSensitivity:
      009A13 52 02            [ 2]   69 	sub	sp, #2
                                     70 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 77: switch (Port)
      009A15 7B 05            [ 1]   71 	ld	a, (0x05, sp)
      009A17 A1 04            [ 1]   72 	cp	a, #0x04
      009A19 23 03            [ 2]   73 	jrule	00115$
      009A1B CC 9A A2         [ 2]   74 	jp	00108$
      009A1E                         75 00115$:
                                     76 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 85: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
      009A1E 7B 06            [ 1]   77 	ld	a, (0x06, sp)
      009A20 90 97            [ 1]   78 	ld	yl, a
                                     79 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 77: switch (Port)
      009A22 5F               [ 1]   80 	clrw	x
      009A23 7B 05            [ 1]   81 	ld	a, (0x05, sp)
      009A25 97               [ 1]   82 	ld	xl, a
      009A26 58               [ 2]   83 	sllw	x
      009A27 DE 9A 2B         [ 2]   84 	ldw	x, (#00116$, x)
      009A2A FC               [ 2]   85 	jp	(x)
      009A2B                         86 00116$:
      009A2B 9A 35                   87 	.dw	#00101$
      009A2D 9A 47                   88 	.dw	#00102$
      009A2F 9A 5E                   89 	.dw	#00103$
      009A31 9A 77                   90 	.dw	#00104$
      009A33 9A 92                   91 	.dw	#00105$
                                     92 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 79: case EXTI_PORT_GPIOA:
      009A35                         93 00101$:
                                     94 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 80: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
      009A35 C6 50 A0         [ 1]   95 	ld	a, 0x50a0
      009A38 A4 FC            [ 1]   96 	and	a, #0xfc
      009A3A C7 50 A0         [ 1]   97 	ld	0x50a0, a
                                     98 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 81: EXTI->CR1 |= (uint8_t)(SensitivityValue);
      009A3D C6 50 A0         [ 1]   99 	ld	a, 0x50a0
      009A40 1A 06            [ 1]  100 	or	a, (0x06, sp)
      009A42 C7 50 A0         [ 1]  101 	ld	0x50a0, a
                                    102 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 82: break;
      009A45 20 5B            [ 2]  103 	jra	00108$
                                    104 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 83: case EXTI_PORT_GPIOB:
      009A47                        105 00102$:
                                    106 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 84: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
      009A47 C6 50 A0         [ 1]  107 	ld	a, 0x50a0
      009A4A A4 F3            [ 1]  108 	and	a, #0xf3
      009A4C C7 50 A0         [ 1]  109 	ld	0x50a0, a
                                    110 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 85: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
      009A4F C6 50 A0         [ 1]  111 	ld	a, 0x50a0
      009A52 93               [ 1]  112 	ldw	x, y
      009A53 58               [ 2]  113 	sllw	x
      009A54 58               [ 2]  114 	sllw	x
      009A55 89               [ 2]  115 	pushw	x
      009A56 1A 02            [ 1]  116 	or	a, (2, sp)
      009A58 85               [ 2]  117 	popw	x
      009A59 C7 50 A0         [ 1]  118 	ld	0x50a0, a
                                    119 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 86: break;
      009A5C 20 44            [ 2]  120 	jra	00108$
                                    121 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 87: case EXTI_PORT_GPIOC:
      009A5E                        122 00103$:
                                    123 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 88: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
      009A5E C6 50 A0         [ 1]  124 	ld	a, 0x50a0
      009A61 A4 CF            [ 1]  125 	and	a, #0xcf
      009A63 C7 50 A0         [ 1]  126 	ld	0x50a0, a
                                    127 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 89: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
      009A66 C6 50 A0         [ 1]  128 	ld	a, 0x50a0
      009A69 6B 02            [ 1]  129 	ld	(0x02, sp), a
      009A6B 90 9F            [ 1]  130 	ld	a, yl
      009A6D 4E               [ 1]  131 	swap	a
      009A6E A4 F0            [ 1]  132 	and	a, #0xf0
      009A70 1A 02            [ 1]  133 	or	a, (0x02, sp)
      009A72 C7 50 A0         [ 1]  134 	ld	0x50a0, a
                                    135 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 90: break;
      009A75 20 2B            [ 2]  136 	jra	00108$
                                    137 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 91: case EXTI_PORT_GPIOD:
      009A77                        138 00104$:
                                    139 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 92: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
      009A77 C6 50 A0         [ 1]  140 	ld	a, 0x50a0
      009A7A A4 3F            [ 1]  141 	and	a, #0x3f
      009A7C C7 50 A0         [ 1]  142 	ld	0x50a0, a
                                    143 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 93: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
      009A7F C6 50 A0         [ 1]  144 	ld	a, 0x50a0
      009A82 6B 01            [ 1]  145 	ld	(0x01, sp), a
      009A84 90 9F            [ 1]  146 	ld	a, yl
      009A86 4E               [ 1]  147 	swap	a
      009A87 A4 F0            [ 1]  148 	and	a, #0xf0
      009A89 48               [ 1]  149 	sll	a
      009A8A 48               [ 1]  150 	sll	a
      009A8B 1A 01            [ 1]  151 	or	a, (0x01, sp)
      009A8D C7 50 A0         [ 1]  152 	ld	0x50a0, a
                                    153 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 94: break;
      009A90 20 10            [ 2]  154 	jra	00108$
                                    155 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 95: case EXTI_PORT_GPIOE:
      009A92                        156 00105$:
                                    157 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 96: EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
      009A92 C6 50 A1         [ 1]  158 	ld	a, 0x50a1
      009A95 A4 FC            [ 1]  159 	and	a, #0xfc
      009A97 C7 50 A1         [ 1]  160 	ld	0x50a1, a
                                    161 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 97: EXTI->CR2 |= (uint8_t)(SensitivityValue);
      009A9A C6 50 A1         [ 1]  162 	ld	a, 0x50a1
      009A9D 1A 06            [ 1]  163 	or	a, (0x06, sp)
      009A9F C7 50 A1         [ 1]  164 	ld	0x50a1, a
                                    165 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 101: }
      009AA2                        166 00108$:
                                    167 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 102: }
      009AA2 5B 02            [ 2]  168 	addw	sp, #2
      009AA4 81               [ 4]  169 	ret
                                    170 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 111: void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
                                    171 ;	-----------------------------------------
                                    172 ;	 function EXTI_SetTLISensitivity
                                    173 ;	-----------------------------------------
      009AA5                        174 _EXTI_SetTLISensitivity:
                                    175 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 117: EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
      009AA5 C6 50 A1         [ 1]  176 	ld	a, 0x50a1
      009AA8 A4 FB            [ 1]  177 	and	a, #0xfb
      009AAA C7 50 A1         [ 1]  178 	ld	0x50a1, a
                                    179 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 118: EXTI->CR2 |= (uint8_t)(SensitivityValue);
      009AAD C6 50 A1         [ 1]  180 	ld	a, 0x50a1
      009AB0 1A 03            [ 1]  181 	or	a, (0x03, sp)
      009AB2 C7 50 A1         [ 1]  182 	ld	0x50a1, a
                                    183 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 119: }
      009AB5 81               [ 4]  184 	ret
                                    185 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 126: EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
                                    186 ;	-----------------------------------------
                                    187 ;	 function EXTI_GetExtIntSensitivity
                                    188 ;	-----------------------------------------
      009AB6                        189 _EXTI_GetExtIntSensitivity:
                                    190 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 128: uint8_t value = 0;
      009AB6 4F               [ 1]  191 	clr	a
                                    192 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 133: switch (Port)
      009AB7 88               [ 1]  193 	push	a
      009AB8 7B 04            [ 1]  194 	ld	a, (0x04, sp)
      009ABA A1 04            [ 1]  195 	cp	a, #0x04
      009ABC 84               [ 1]  196 	pop	a
      009ABD 23 01            [ 2]  197 	jrule	00115$
      009ABF 81               [ 4]  198 	ret
      009AC0                        199 00115$:
      009AC0 5F               [ 1]  200 	clrw	x
      009AC1 7B 03            [ 1]  201 	ld	a, (0x03, sp)
      009AC3 97               [ 1]  202 	ld	xl, a
      009AC4 58               [ 2]  203 	sllw	x
      009AC5 DE 9A C9         [ 2]  204 	ldw	x, (#00116$, x)
      009AC8 FC               [ 2]  205 	jp	(x)
      009AC9                        206 00116$:
      009AC9 9A D3                  207 	.dw	#00101$
      009ACB 9A D9                  208 	.dw	#00102$
      009ACD 9A E1                  209 	.dw	#00103$
      009ACF 9A EA                  210 	.dw	#00104$
      009AD1 9A F5                  211 	.dw	#00105$
                                    212 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 135: case EXTI_PORT_GPIOA:
      009AD3                        213 00101$:
                                    214 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 136: value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
      009AD3 C6 50 A0         [ 1]  215 	ld	a, 0x50a0
      009AD6 A4 03            [ 1]  216 	and	a, #0x03
                                    217 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 137: break;
      009AD8 81               [ 4]  218 	ret
                                    219 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 138: case EXTI_PORT_GPIOB:
      009AD9                        220 00102$:
                                    221 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 139: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
      009AD9 C6 50 A0         [ 1]  222 	ld	a, 0x50a0
      009ADC A4 0C            [ 1]  223 	and	a, #0x0c
      009ADE 44               [ 1]  224 	srl	a
      009ADF 44               [ 1]  225 	srl	a
                                    226 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 140: break;
      009AE0 81               [ 4]  227 	ret
                                    228 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 141: case EXTI_PORT_GPIOC:
      009AE1                        229 00103$:
                                    230 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 142: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
      009AE1 C6 50 A0         [ 1]  231 	ld	a, 0x50a0
      009AE4 A4 30            [ 1]  232 	and	a, #0x30
      009AE6 4E               [ 1]  233 	swap	a
      009AE7 A4 0F            [ 1]  234 	and	a, #0x0f
                                    235 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 143: break;
      009AE9 81               [ 4]  236 	ret
                                    237 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 144: case EXTI_PORT_GPIOD:
      009AEA                        238 00104$:
                                    239 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 145: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
      009AEA C6 50 A0         [ 1]  240 	ld	a, 0x50a0
      009AED A4 C0            [ 1]  241 	and	a, #0xc0
      009AEF 4E               [ 1]  242 	swap	a
      009AF0 A4 0F            [ 1]  243 	and	a, #0x0f
      009AF2 44               [ 1]  244 	srl	a
      009AF3 44               [ 1]  245 	srl	a
                                    246 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 146: break;
      009AF4 81               [ 4]  247 	ret
                                    248 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 147: case EXTI_PORT_GPIOE:
      009AF5                        249 00105$:
                                    250 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 148: value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
      009AF5 C6 50 A1         [ 1]  251 	ld	a, 0x50a1
      009AF8 A4 03            [ 1]  252 	and	a, #0x03
                                    253 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 152: }
                                    254 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 154: return((EXTI_Sensitivity_TypeDef)value);
                                    255 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 155: }
      009AFA 81               [ 4]  256 	ret
                                    257 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 162: EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
                                    258 ;	-----------------------------------------
                                    259 ;	 function EXTI_GetTLISensitivity
                                    260 ;	-----------------------------------------
      009AFB                        261 _EXTI_GetTLISensitivity:
                                    262 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 167: value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
      009AFB C6 50 A1         [ 1]  263 	ld	a, 0x50a1
      009AFE A4 04            [ 1]  264 	and	a, #0x04
                                    265 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 169: return((EXTI_TLISensitivity_TypeDef)value);
                                    266 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 170: }
      009B00 81               [ 4]  267 	ret
                                    268 	.area CODE
                                    269 	.area CONST
                                    270 	.area INITIALIZER
                                    271 	.area CABS (ABS)
