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
      00AAAE                         57 _EXTI_DeInit:
                                     58 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 55: EXTI->CR1 = EXTI_CR1_RESET_VALUE;
      00AAAE 35 00 50 A0      [ 1]   59 	mov	0x50a0+0, #0x00
                                     60 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 56: EXTI->CR2 = EXTI_CR2_RESET_VALUE;
      00AAB2 35 00 50 A1      [ 1]   61 	mov	0x50a1+0, #0x00
                                     62 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 57: }
      00AAB6 81               [ 4]   63 	ret
                                     64 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 70: void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
                                     65 ;	-----------------------------------------
                                     66 ;	 function EXTI_SetExtIntSensitivity
                                     67 ;	-----------------------------------------
      00AAB7                         68 _EXTI_SetExtIntSensitivity:
      00AAB7 52 02            [ 2]   69 	sub	sp, #2
                                     70 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 77: switch (Port)
      00AAB9 7B 05            [ 1]   71 	ld	a, (0x05, sp)
      00AABB A1 04            [ 1]   72 	cp	a, #0x04
      00AABD 23 03            [ 2]   73 	jrule	00115$
      00AABF CC AB 46         [ 2]   74 	jp	00108$
      00AAC2                         75 00115$:
                                     76 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 85: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
      00AAC2 7B 06            [ 1]   77 	ld	a, (0x06, sp)
      00AAC4 90 97            [ 1]   78 	ld	yl, a
                                     79 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 77: switch (Port)
      00AAC6 5F               [ 1]   80 	clrw	x
      00AAC7 7B 05            [ 1]   81 	ld	a, (0x05, sp)
      00AAC9 97               [ 1]   82 	ld	xl, a
      00AACA 58               [ 2]   83 	sllw	x
      00AACB DE AA CF         [ 2]   84 	ldw	x, (#00116$, x)
      00AACE FC               [ 2]   85 	jp	(x)
      00AACF                         86 00116$:
      00AACF AA D9                   87 	.dw	#00101$
      00AAD1 AA EB                   88 	.dw	#00102$
      00AAD3 AB 02                   89 	.dw	#00103$
      00AAD5 AB 1B                   90 	.dw	#00104$
      00AAD7 AB 36                   91 	.dw	#00105$
                                     92 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 79: case EXTI_PORT_GPIOA:
      00AAD9                         93 00101$:
                                     94 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 80: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
      00AAD9 C6 50 A0         [ 1]   95 	ld	a, 0x50a0
      00AADC A4 FC            [ 1]   96 	and	a, #0xfc
      00AADE C7 50 A0         [ 1]   97 	ld	0x50a0, a
                                     98 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 81: EXTI->CR1 |= (uint8_t)(SensitivityValue);
      00AAE1 C6 50 A0         [ 1]   99 	ld	a, 0x50a0
      00AAE4 1A 06            [ 1]  100 	or	a, (0x06, sp)
      00AAE6 C7 50 A0         [ 1]  101 	ld	0x50a0, a
                                    102 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 82: break;
      00AAE9 20 5B            [ 2]  103 	jra	00108$
                                    104 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 83: case EXTI_PORT_GPIOB:
      00AAEB                        105 00102$:
                                    106 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 84: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
      00AAEB C6 50 A0         [ 1]  107 	ld	a, 0x50a0
      00AAEE A4 F3            [ 1]  108 	and	a, #0xf3
      00AAF0 C7 50 A0         [ 1]  109 	ld	0x50a0, a
                                    110 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 85: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
      00AAF3 C6 50 A0         [ 1]  111 	ld	a, 0x50a0
      00AAF6 93               [ 1]  112 	ldw	x, y
      00AAF7 58               [ 2]  113 	sllw	x
      00AAF8 58               [ 2]  114 	sllw	x
      00AAF9 89               [ 2]  115 	pushw	x
      00AAFA 1A 02            [ 1]  116 	or	a, (2, sp)
      00AAFC 85               [ 2]  117 	popw	x
      00AAFD C7 50 A0         [ 1]  118 	ld	0x50a0, a
                                    119 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 86: break;
      00AB00 20 44            [ 2]  120 	jra	00108$
                                    121 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 87: case EXTI_PORT_GPIOC:
      00AB02                        122 00103$:
                                    123 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 88: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
      00AB02 C6 50 A0         [ 1]  124 	ld	a, 0x50a0
      00AB05 A4 CF            [ 1]  125 	and	a, #0xcf
      00AB07 C7 50 A0         [ 1]  126 	ld	0x50a0, a
                                    127 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 89: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
      00AB0A C6 50 A0         [ 1]  128 	ld	a, 0x50a0
      00AB0D 6B 02            [ 1]  129 	ld	(0x02, sp), a
      00AB0F 90 9F            [ 1]  130 	ld	a, yl
      00AB11 4E               [ 1]  131 	swap	a
      00AB12 A4 F0            [ 1]  132 	and	a, #0xf0
      00AB14 1A 02            [ 1]  133 	or	a, (0x02, sp)
      00AB16 C7 50 A0         [ 1]  134 	ld	0x50a0, a
                                    135 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 90: break;
      00AB19 20 2B            [ 2]  136 	jra	00108$
                                    137 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 91: case EXTI_PORT_GPIOD:
      00AB1B                        138 00104$:
                                    139 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 92: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
      00AB1B C6 50 A0         [ 1]  140 	ld	a, 0x50a0
      00AB1E A4 3F            [ 1]  141 	and	a, #0x3f
      00AB20 C7 50 A0         [ 1]  142 	ld	0x50a0, a
                                    143 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 93: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
      00AB23 C6 50 A0         [ 1]  144 	ld	a, 0x50a0
      00AB26 6B 01            [ 1]  145 	ld	(0x01, sp), a
      00AB28 90 9F            [ 1]  146 	ld	a, yl
      00AB2A 4E               [ 1]  147 	swap	a
      00AB2B A4 F0            [ 1]  148 	and	a, #0xf0
      00AB2D 48               [ 1]  149 	sll	a
      00AB2E 48               [ 1]  150 	sll	a
      00AB2F 1A 01            [ 1]  151 	or	a, (0x01, sp)
      00AB31 C7 50 A0         [ 1]  152 	ld	0x50a0, a
                                    153 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 94: break;
      00AB34 20 10            [ 2]  154 	jra	00108$
                                    155 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 95: case EXTI_PORT_GPIOE:
      00AB36                        156 00105$:
                                    157 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 96: EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
      00AB36 C6 50 A1         [ 1]  158 	ld	a, 0x50a1
      00AB39 A4 FC            [ 1]  159 	and	a, #0xfc
      00AB3B C7 50 A1         [ 1]  160 	ld	0x50a1, a
                                    161 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 97: EXTI->CR2 |= (uint8_t)(SensitivityValue);
      00AB3E C6 50 A1         [ 1]  162 	ld	a, 0x50a1
      00AB41 1A 06            [ 1]  163 	or	a, (0x06, sp)
      00AB43 C7 50 A1         [ 1]  164 	ld	0x50a1, a
                                    165 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 101: }
      00AB46                        166 00108$:
                                    167 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 102: }
      00AB46 5B 02            [ 2]  168 	addw	sp, #2
      00AB48 81               [ 4]  169 	ret
                                    170 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 111: void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
                                    171 ;	-----------------------------------------
                                    172 ;	 function EXTI_SetTLISensitivity
                                    173 ;	-----------------------------------------
      00AB49                        174 _EXTI_SetTLISensitivity:
                                    175 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 117: EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
      00AB49 C6 50 A1         [ 1]  176 	ld	a, 0x50a1
      00AB4C A4 FB            [ 1]  177 	and	a, #0xfb
      00AB4E C7 50 A1         [ 1]  178 	ld	0x50a1, a
                                    179 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 118: EXTI->CR2 |= (uint8_t)(SensitivityValue);
      00AB51 C6 50 A1         [ 1]  180 	ld	a, 0x50a1
      00AB54 1A 03            [ 1]  181 	or	a, (0x03, sp)
      00AB56 C7 50 A1         [ 1]  182 	ld	0x50a1, a
                                    183 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 119: }
      00AB59 81               [ 4]  184 	ret
                                    185 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 126: EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
                                    186 ;	-----------------------------------------
                                    187 ;	 function EXTI_GetExtIntSensitivity
                                    188 ;	-----------------------------------------
      00AB5A                        189 _EXTI_GetExtIntSensitivity:
                                    190 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 128: uint8_t value = 0;
      00AB5A 4F               [ 1]  191 	clr	a
                                    192 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 133: switch (Port)
      00AB5B 88               [ 1]  193 	push	a
      00AB5C 7B 04            [ 1]  194 	ld	a, (0x04, sp)
      00AB5E A1 04            [ 1]  195 	cp	a, #0x04
      00AB60 84               [ 1]  196 	pop	a
      00AB61 23 01            [ 2]  197 	jrule	00115$
      00AB63 81               [ 4]  198 	ret
      00AB64                        199 00115$:
      00AB64 5F               [ 1]  200 	clrw	x
      00AB65 7B 03            [ 1]  201 	ld	a, (0x03, sp)
      00AB67 97               [ 1]  202 	ld	xl, a
      00AB68 58               [ 2]  203 	sllw	x
      00AB69 DE AB 6D         [ 2]  204 	ldw	x, (#00116$, x)
      00AB6C FC               [ 2]  205 	jp	(x)
      00AB6D                        206 00116$:
      00AB6D AB 77                  207 	.dw	#00101$
      00AB6F AB 7D                  208 	.dw	#00102$
      00AB71 AB 85                  209 	.dw	#00103$
      00AB73 AB 8E                  210 	.dw	#00104$
      00AB75 AB 99                  211 	.dw	#00105$
                                    212 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 135: case EXTI_PORT_GPIOA:
      00AB77                        213 00101$:
                                    214 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 136: value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
      00AB77 C6 50 A0         [ 1]  215 	ld	a, 0x50a0
      00AB7A A4 03            [ 1]  216 	and	a, #0x03
                                    217 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 137: break;
      00AB7C 81               [ 4]  218 	ret
                                    219 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 138: case EXTI_PORT_GPIOB:
      00AB7D                        220 00102$:
                                    221 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 139: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
      00AB7D C6 50 A0         [ 1]  222 	ld	a, 0x50a0
      00AB80 A4 0C            [ 1]  223 	and	a, #0x0c
      00AB82 44               [ 1]  224 	srl	a
      00AB83 44               [ 1]  225 	srl	a
                                    226 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 140: break;
      00AB84 81               [ 4]  227 	ret
                                    228 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 141: case EXTI_PORT_GPIOC:
      00AB85                        229 00103$:
                                    230 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 142: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
      00AB85 C6 50 A0         [ 1]  231 	ld	a, 0x50a0
      00AB88 A4 30            [ 1]  232 	and	a, #0x30
      00AB8A 4E               [ 1]  233 	swap	a
      00AB8B A4 0F            [ 1]  234 	and	a, #0x0f
                                    235 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 143: break;
      00AB8D 81               [ 4]  236 	ret
                                    237 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 144: case EXTI_PORT_GPIOD:
      00AB8E                        238 00104$:
                                    239 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 145: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
      00AB8E C6 50 A0         [ 1]  240 	ld	a, 0x50a0
      00AB91 A4 C0            [ 1]  241 	and	a, #0xc0
      00AB93 4E               [ 1]  242 	swap	a
      00AB94 A4 0F            [ 1]  243 	and	a, #0x0f
      00AB96 44               [ 1]  244 	srl	a
      00AB97 44               [ 1]  245 	srl	a
                                    246 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 146: break;
      00AB98 81               [ 4]  247 	ret
                                    248 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 147: case EXTI_PORT_GPIOE:
      00AB99                        249 00105$:
                                    250 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 148: value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
      00AB99 C6 50 A1         [ 1]  251 	ld	a, 0x50a1
      00AB9C A4 03            [ 1]  252 	and	a, #0x03
                                    253 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 152: }
                                    254 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 154: return((EXTI_Sensitivity_TypeDef)value);
                                    255 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 155: }
      00AB9E 81               [ 4]  256 	ret
                                    257 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 162: EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
                                    258 ;	-----------------------------------------
                                    259 ;	 function EXTI_GetTLISensitivity
                                    260 ;	-----------------------------------------
      00AB9F                        261 _EXTI_GetTLISensitivity:
                                    262 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 167: value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
      00AB9F C6 50 A1         [ 1]  263 	ld	a, 0x50a1
      00ABA2 A4 04            [ 1]  264 	and	a, #0x04
                                    265 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 169: return((EXTI_TLISensitivity_TypeDef)value);
                                    266 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_exti.c: 170: }
      00ABA4 81               [ 4]  267 	ret
                                    268 	.area CODE
                                    269 	.area CONST
                                    270 	.area INITIALIZER
                                    271 	.area CABS (ABS)
