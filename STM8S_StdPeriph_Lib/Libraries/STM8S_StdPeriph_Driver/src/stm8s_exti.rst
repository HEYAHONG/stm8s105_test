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
      0099B3                         57 _EXTI_DeInit:
                                     58 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 55: EXTI->CR1 = EXTI_CR1_RESET_VALUE;
      0099B3 35 00 50 A0      [ 1]   59 	mov	0x50a0+0, #0x00
                                     60 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 56: EXTI->CR2 = EXTI_CR2_RESET_VALUE;
      0099B7 35 00 50 A1      [ 1]   61 	mov	0x50a1+0, #0x00
                                     62 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 57: }
      0099BB 81               [ 4]   63 	ret
                                     64 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 70: void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
                                     65 ;	-----------------------------------------
                                     66 ;	 function EXTI_SetExtIntSensitivity
                                     67 ;	-----------------------------------------
      0099BC                         68 _EXTI_SetExtIntSensitivity:
      0099BC 52 02            [ 2]   69 	sub	sp, #2
                                     70 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 77: switch (Port)
      0099BE 7B 05            [ 1]   71 	ld	a, (0x05, sp)
      0099C0 A1 04            [ 1]   72 	cp	a, #0x04
      0099C2 23 03            [ 2]   73 	jrule	00115$
      0099C4 CC 9A 4B         [ 2]   74 	jp	00108$
      0099C7                         75 00115$:
                                     76 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 85: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
      0099C7 7B 06            [ 1]   77 	ld	a, (0x06, sp)
      0099C9 90 97            [ 1]   78 	ld	yl, a
                                     79 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 77: switch (Port)
      0099CB 5F               [ 1]   80 	clrw	x
      0099CC 7B 05            [ 1]   81 	ld	a, (0x05, sp)
      0099CE 97               [ 1]   82 	ld	xl, a
      0099CF 58               [ 2]   83 	sllw	x
      0099D0 DE 99 D4         [ 2]   84 	ldw	x, (#00116$, x)
      0099D3 FC               [ 2]   85 	jp	(x)
      0099D4                         86 00116$:
      0099D4 99 DE                   87 	.dw	#00101$
      0099D6 99 F0                   88 	.dw	#00102$
      0099D8 9A 07                   89 	.dw	#00103$
      0099DA 9A 20                   90 	.dw	#00104$
      0099DC 9A 3B                   91 	.dw	#00105$
                                     92 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 79: case EXTI_PORT_GPIOA:
      0099DE                         93 00101$:
                                     94 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 80: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
      0099DE C6 50 A0         [ 1]   95 	ld	a, 0x50a0
      0099E1 A4 FC            [ 1]   96 	and	a, #0xfc
      0099E3 C7 50 A0         [ 1]   97 	ld	0x50a0, a
                                     98 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 81: EXTI->CR1 |= (uint8_t)(SensitivityValue);
      0099E6 C6 50 A0         [ 1]   99 	ld	a, 0x50a0
      0099E9 1A 06            [ 1]  100 	or	a, (0x06, sp)
      0099EB C7 50 A0         [ 1]  101 	ld	0x50a0, a
                                    102 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 82: break;
      0099EE 20 5B            [ 2]  103 	jra	00108$
                                    104 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 83: case EXTI_PORT_GPIOB:
      0099F0                        105 00102$:
                                    106 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 84: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
      0099F0 C6 50 A0         [ 1]  107 	ld	a, 0x50a0
      0099F3 A4 F3            [ 1]  108 	and	a, #0xf3
      0099F5 C7 50 A0         [ 1]  109 	ld	0x50a0, a
                                    110 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 85: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
      0099F8 C6 50 A0         [ 1]  111 	ld	a, 0x50a0
      0099FB 93               [ 1]  112 	ldw	x, y
      0099FC 58               [ 2]  113 	sllw	x
      0099FD 58               [ 2]  114 	sllw	x
      0099FE 89               [ 2]  115 	pushw	x
      0099FF 1A 02            [ 1]  116 	or	a, (2, sp)
      009A01 85               [ 2]  117 	popw	x
      009A02 C7 50 A0         [ 1]  118 	ld	0x50a0, a
                                    119 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 86: break;
      009A05 20 44            [ 2]  120 	jra	00108$
                                    121 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 87: case EXTI_PORT_GPIOC:
      009A07                        122 00103$:
                                    123 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 88: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
      009A07 C6 50 A0         [ 1]  124 	ld	a, 0x50a0
      009A0A A4 CF            [ 1]  125 	and	a, #0xcf
      009A0C C7 50 A0         [ 1]  126 	ld	0x50a0, a
                                    127 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 89: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
      009A0F C6 50 A0         [ 1]  128 	ld	a, 0x50a0
      009A12 6B 02            [ 1]  129 	ld	(0x02, sp), a
      009A14 90 9F            [ 1]  130 	ld	a, yl
      009A16 4E               [ 1]  131 	swap	a
      009A17 A4 F0            [ 1]  132 	and	a, #0xf0
      009A19 1A 02            [ 1]  133 	or	a, (0x02, sp)
      009A1B C7 50 A0         [ 1]  134 	ld	0x50a0, a
                                    135 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 90: break;
      009A1E 20 2B            [ 2]  136 	jra	00108$
                                    137 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 91: case EXTI_PORT_GPIOD:
      009A20                        138 00104$:
                                    139 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 92: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
      009A20 C6 50 A0         [ 1]  140 	ld	a, 0x50a0
      009A23 A4 3F            [ 1]  141 	and	a, #0x3f
      009A25 C7 50 A0         [ 1]  142 	ld	0x50a0, a
                                    143 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 93: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
      009A28 C6 50 A0         [ 1]  144 	ld	a, 0x50a0
      009A2B 6B 01            [ 1]  145 	ld	(0x01, sp), a
      009A2D 90 9F            [ 1]  146 	ld	a, yl
      009A2F 4E               [ 1]  147 	swap	a
      009A30 A4 F0            [ 1]  148 	and	a, #0xf0
      009A32 48               [ 1]  149 	sll	a
      009A33 48               [ 1]  150 	sll	a
      009A34 1A 01            [ 1]  151 	or	a, (0x01, sp)
      009A36 C7 50 A0         [ 1]  152 	ld	0x50a0, a
                                    153 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 94: break;
      009A39 20 10            [ 2]  154 	jra	00108$
                                    155 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 95: case EXTI_PORT_GPIOE:
      009A3B                        156 00105$:
                                    157 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 96: EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
      009A3B C6 50 A1         [ 1]  158 	ld	a, 0x50a1
      009A3E A4 FC            [ 1]  159 	and	a, #0xfc
      009A40 C7 50 A1         [ 1]  160 	ld	0x50a1, a
                                    161 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 97: EXTI->CR2 |= (uint8_t)(SensitivityValue);
      009A43 C6 50 A1         [ 1]  162 	ld	a, 0x50a1
      009A46 1A 06            [ 1]  163 	or	a, (0x06, sp)
      009A48 C7 50 A1         [ 1]  164 	ld	0x50a1, a
                                    165 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 101: }
      009A4B                        166 00108$:
                                    167 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 102: }
      009A4B 5B 02            [ 2]  168 	addw	sp, #2
      009A4D 81               [ 4]  169 	ret
                                    170 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 111: void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
                                    171 ;	-----------------------------------------
                                    172 ;	 function EXTI_SetTLISensitivity
                                    173 ;	-----------------------------------------
      009A4E                        174 _EXTI_SetTLISensitivity:
                                    175 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 117: EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
      009A4E C6 50 A1         [ 1]  176 	ld	a, 0x50a1
      009A51 A4 FB            [ 1]  177 	and	a, #0xfb
      009A53 C7 50 A1         [ 1]  178 	ld	0x50a1, a
                                    179 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 118: EXTI->CR2 |= (uint8_t)(SensitivityValue);
      009A56 C6 50 A1         [ 1]  180 	ld	a, 0x50a1
      009A59 1A 03            [ 1]  181 	or	a, (0x03, sp)
      009A5B C7 50 A1         [ 1]  182 	ld	0x50a1, a
                                    183 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 119: }
      009A5E 81               [ 4]  184 	ret
                                    185 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 126: EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
                                    186 ;	-----------------------------------------
                                    187 ;	 function EXTI_GetExtIntSensitivity
                                    188 ;	-----------------------------------------
      009A5F                        189 _EXTI_GetExtIntSensitivity:
                                    190 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 128: uint8_t value = 0;
      009A5F 4F               [ 1]  191 	clr	a
                                    192 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 133: switch (Port)
      009A60 88               [ 1]  193 	push	a
      009A61 7B 04            [ 1]  194 	ld	a, (0x04, sp)
      009A63 A1 04            [ 1]  195 	cp	a, #0x04
      009A65 84               [ 1]  196 	pop	a
      009A66 23 01            [ 2]  197 	jrule	00115$
      009A68 81               [ 4]  198 	ret
      009A69                        199 00115$:
      009A69 5F               [ 1]  200 	clrw	x
      009A6A 7B 03            [ 1]  201 	ld	a, (0x03, sp)
      009A6C 97               [ 1]  202 	ld	xl, a
      009A6D 58               [ 2]  203 	sllw	x
      009A6E DE 9A 72         [ 2]  204 	ldw	x, (#00116$, x)
      009A71 FC               [ 2]  205 	jp	(x)
      009A72                        206 00116$:
      009A72 9A 7C                  207 	.dw	#00101$
      009A74 9A 82                  208 	.dw	#00102$
      009A76 9A 8A                  209 	.dw	#00103$
      009A78 9A 93                  210 	.dw	#00104$
      009A7A 9A 9E                  211 	.dw	#00105$
                                    212 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 135: case EXTI_PORT_GPIOA:
      009A7C                        213 00101$:
                                    214 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 136: value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
      009A7C C6 50 A0         [ 1]  215 	ld	a, 0x50a0
      009A7F A4 03            [ 1]  216 	and	a, #0x03
                                    217 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 137: break;
      009A81 81               [ 4]  218 	ret
                                    219 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 138: case EXTI_PORT_GPIOB:
      009A82                        220 00102$:
                                    221 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 139: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
      009A82 C6 50 A0         [ 1]  222 	ld	a, 0x50a0
      009A85 A4 0C            [ 1]  223 	and	a, #0x0c
      009A87 44               [ 1]  224 	srl	a
      009A88 44               [ 1]  225 	srl	a
                                    226 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 140: break;
      009A89 81               [ 4]  227 	ret
                                    228 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 141: case EXTI_PORT_GPIOC:
      009A8A                        229 00103$:
                                    230 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 142: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
      009A8A C6 50 A0         [ 1]  231 	ld	a, 0x50a0
      009A8D A4 30            [ 1]  232 	and	a, #0x30
      009A8F 4E               [ 1]  233 	swap	a
      009A90 A4 0F            [ 1]  234 	and	a, #0x0f
                                    235 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 143: break;
      009A92 81               [ 4]  236 	ret
                                    237 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 144: case EXTI_PORT_GPIOD:
      009A93                        238 00104$:
                                    239 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 145: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
      009A93 C6 50 A0         [ 1]  240 	ld	a, 0x50a0
      009A96 A4 C0            [ 1]  241 	and	a, #0xc0
      009A98 4E               [ 1]  242 	swap	a
      009A99 A4 0F            [ 1]  243 	and	a, #0x0f
      009A9B 44               [ 1]  244 	srl	a
      009A9C 44               [ 1]  245 	srl	a
                                    246 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 146: break;
      009A9D 81               [ 4]  247 	ret
                                    248 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 147: case EXTI_PORT_GPIOE:
      009A9E                        249 00105$:
                                    250 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 148: value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
      009A9E C6 50 A1         [ 1]  251 	ld	a, 0x50a1
      009AA1 A4 03            [ 1]  252 	and	a, #0x03
                                    253 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 152: }
                                    254 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 154: return((EXTI_Sensitivity_TypeDef)value);
                                    255 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 155: }
      009AA3 81               [ 4]  256 	ret
                                    257 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 162: EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
                                    258 ;	-----------------------------------------
                                    259 ;	 function EXTI_GetTLISensitivity
                                    260 ;	-----------------------------------------
      009AA4                        261 _EXTI_GetTLISensitivity:
                                    262 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 167: value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
      009AA4 C6 50 A1         [ 1]  263 	ld	a, 0x50a1
      009AA7 A4 04            [ 1]  264 	and	a, #0x04
                                    265 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 169: return((EXTI_TLISensitivity_TypeDef)value);
                                    266 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 170: }
      009AA9 81               [ 4]  267 	ret
                                    268 	.area CODE
                                    269 	.area CONST
                                    270 	.area INITIALIZER
                                    271 	.area CABS (ABS)
