                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_itc
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _ITC_GetCPUCC
                                     12 	.globl _ITC_DeInit
                                     13 	.globl _ITC_GetSoftIntStatus
                                     14 	.globl _ITC_GetSoftwarePriority
                                     15 	.globl _ITC_SetSoftwarePriority
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
                                     53 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 50: uint8_t ITC_GetCPUCC(void)
                                     54 ;	-----------------------------------------
                                     55 ;	 function ITC_GetCPUCC
                                     56 ;	-----------------------------------------
      00A623                         57 _ITC_GetCPUCC:
                                     58 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 62: __asm__("push cc");
      00A623 8A               [ 1]   59 	push	cc
                                     60 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 63: __asm__("pop a"); /* Ignore compiler warning, the returned value is in A register */
      00A624 84               [ 1]   61 	pop	a
                                     62 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 65: }
      00A625 81               [ 4]   63 	ret
                                     64 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 83: void ITC_DeInit(void)
                                     65 ;	-----------------------------------------
                                     66 ;	 function ITC_DeInit
                                     67 ;	-----------------------------------------
      00A626                         68 _ITC_DeInit:
                                     69 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 85: ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
      00A626 35 FF 7F 70      [ 1]   70 	mov	0x7f70+0, #0xff
                                     71 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 86: ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
      00A62A 35 FF 7F 71      [ 1]   72 	mov	0x7f71+0, #0xff
                                     73 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 87: ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
      00A62E 35 FF 7F 72      [ 1]   74 	mov	0x7f72+0, #0xff
                                     75 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 88: ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
      00A632 35 FF 7F 73      [ 1]   76 	mov	0x7f73+0, #0xff
                                     77 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 89: ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
      00A636 35 FF 7F 74      [ 1]   78 	mov	0x7f74+0, #0xff
                                     79 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 90: ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
      00A63A 35 FF 7F 75      [ 1]   80 	mov	0x7f75+0, #0xff
                                     81 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 91: ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
      00A63E 35 FF 7F 76      [ 1]   82 	mov	0x7f76+0, #0xff
                                     83 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 92: ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
      00A642 35 FF 7F 77      [ 1]   84 	mov	0x7f77+0, #0xff
                                     85 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 93: }
      00A646 81               [ 4]   86 	ret
                                     87 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 100: uint8_t ITC_GetSoftIntStatus(void)
                                     88 ;	-----------------------------------------
                                     89 ;	 function ITC_GetSoftIntStatus
                                     90 ;	-----------------------------------------
      00A647                         91 _ITC_GetSoftIntStatus:
                                     92 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 102: return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
      00A647 CD A6 23         [ 4]   93 	call	_ITC_GetCPUCC
      00A64A A4 28            [ 1]   94 	and	a, #0x28
                                     95 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 103: }
      00A64C 81               [ 4]   96 	ret
                                     97 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 110: ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
                                     98 ;	-----------------------------------------
                                     99 ;	 function ITC_GetSoftwarePriority
                                    100 ;	-----------------------------------------
      00A64D                        101 _ITC_GetSoftwarePriority:
      00A64D 52 03            [ 2]  102 	sub	sp, #3
                                    103 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 112: uint8_t Value = 0;
      00A64F 0F 01            [ 1]  104 	clr	(0x01, sp)
                                    105 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 119: Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
      00A651 7B 06            [ 1]  106 	ld	a, (0x06, sp)
      00A653 90 5F            [ 1]  107 	clrw	y
      00A655 A4 03            [ 1]  108 	and	a, #0x03
      00A657 48               [ 1]  109 	sll	a
      00A658 6B 02            [ 1]  110 	ld	(0x02, sp), a
      00A65A A6 03            [ 1]  111 	ld	a, #0x03
      00A65C 6B 03            [ 1]  112 	ld	(0x03, sp), a
      00A65E 7B 02            [ 1]  113 	ld	a, (0x02, sp)
      00A660 27 05            [ 1]  114 	jreq	00132$
      00A662                        115 00131$:
      00A662 08 03            [ 1]  116 	sll	(0x03, sp)
      00A664 4A               [ 1]  117 	dec	a
      00A665 26 FB            [ 1]  118 	jrne	00131$
      00A667                        119 00132$:
                                    120 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 121: switch (IrqNum)
      00A667 7B 06            [ 1]  121 	ld	a, (0x06, sp)
      00A669 A1 18            [ 1]  122 	cp	a, #0x18
      00A66B 23 03            [ 2]  123 	jrule	00133$
      00A66D CC A6 E8         [ 2]  124 	jp	00123$
      00A670                        125 00133$:
      00A670 5F               [ 1]  126 	clrw	x
      00A671 7B 06            [ 1]  127 	ld	a, (0x06, sp)
      00A673 97               [ 1]  128 	ld	xl, a
      00A674 58               [ 2]  129 	sllw	x
      00A675 DE A6 79         [ 2]  130 	ldw	x, (#00134$, x)
      00A678 FC               [ 2]  131 	jp	(x)
      00A679                        132 00134$:
      00A679 A6 AB                  133 	.dw	#00104$
      00A67B A6 AB                  134 	.dw	#00104$
      00A67D A6 AB                  135 	.dw	#00104$
      00A67F A6 AB                  136 	.dw	#00104$
      00A681 A6 B4                  137 	.dw	#00108$
      00A683 A6 B4                  138 	.dw	#00108$
      00A685 A6 B4                  139 	.dw	#00108$
      00A687 A6 B4                  140 	.dw	#00108$
      00A689 A6 E8                  141 	.dw	#00123$
      00A68B A6 E8                  142 	.dw	#00123$
      00A68D A6 BD                  143 	.dw	#00110$
      00A68F A6 BD                  144 	.dw	#00110$
      00A691 A6 C6                  145 	.dw	#00114$
      00A693 A6 C6                  146 	.dw	#00114$
      00A695 A6 C6                  147 	.dw	#00114$
      00A697 A6 C6                  148 	.dw	#00114$
      00A699 A6 CF                  149 	.dw	#00116$
      00A69B A6 E8                  150 	.dw	#00123$
      00A69D A6 E8                  151 	.dw	#00123$
      00A69F A6 CF                  152 	.dw	#00116$
      00A6A1 A6 D8                  153 	.dw	#00120$
      00A6A3 A6 D8                  154 	.dw	#00120$
      00A6A5 A6 D8                  155 	.dw	#00120$
      00A6A7 A6 D8                  156 	.dw	#00120$
      00A6A9 A6 E1                  157 	.dw	#00121$
                                    158 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 126: case ITC_IRQ_PORTA:
      00A6AB                        159 00104$:
                                    160 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 127: Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
      00A6AB C6 7F 70         [ 1]  161 	ld	a, 0x7f70
      00A6AE 14 03            [ 1]  162 	and	a, (0x03, sp)
      00A6B0 6B 01            [ 1]  163 	ld	(0x01, sp), a
                                    164 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 128: break;
      00A6B2 20 34            [ 2]  165 	jra	00123$
                                    166 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 133: case ITC_IRQ_PORTE:
      00A6B4                        167 00108$:
                                    168 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 134: Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
      00A6B4 C6 7F 71         [ 1]  169 	ld	a, 0x7f71
      00A6B7 14 03            [ 1]  170 	and	a, (0x03, sp)
      00A6B9 6B 01            [ 1]  171 	ld	(0x01, sp), a
                                    172 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 135: break;
      00A6BB 20 2B            [ 2]  173 	jra	00123$
                                    174 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 145: case ITC_IRQ_TIM1_OVF:
      00A6BD                        175 00110$:
                                    176 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 146: Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
      00A6BD C6 7F 72         [ 1]  177 	ld	a, 0x7f72
      00A6C0 14 03            [ 1]  178 	and	a, (0x03, sp)
      00A6C2 6B 01            [ 1]  179 	ld	(0x01, sp), a
                                    180 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 147: break;
      00A6C4 20 22            [ 2]  181 	jra	00123$
                                    182 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 157: case ITC_IRQ_TIM3_OVF:
      00A6C6                        183 00114$:
                                    184 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 158: Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
      00A6C6 C6 7F 73         [ 1]  185 	ld	a, 0x7f73
      00A6C9 14 03            [ 1]  186 	and	a, (0x03, sp)
      00A6CB 6B 01            [ 1]  187 	ld	(0x01, sp), a
                                    188 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 159: break;
      00A6CD 20 19            [ 2]  189 	jra	00123$
                                    190 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 171: case ITC_IRQ_I2C:
      00A6CF                        191 00116$:
                                    192 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 172: Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
      00A6CF C6 7F 74         [ 1]  193 	ld	a, 0x7f74
      00A6D2 14 03            [ 1]  194 	and	a, (0x03, sp)
      00A6D4 6B 01            [ 1]  195 	ld	(0x01, sp), a
                                    196 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 173: break;
      00A6D6 20 10            [ 2]  197 	jra	00123$
                                    198 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 192: case ITC_IRQ_TIM4_OVF:
      00A6D8                        199 00120$:
                                    200 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 194: Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
      00A6D8 C6 7F 75         [ 1]  201 	ld	a, 0x7f75
      00A6DB 14 03            [ 1]  202 	and	a, (0x03, sp)
      00A6DD 6B 01            [ 1]  203 	ld	(0x01, sp), a
                                    204 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 195: break;
      00A6DF 20 07            [ 2]  205 	jra	00123$
                                    206 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 197: case ITC_IRQ_EEPROM_EEC:
      00A6E1                        207 00121$:
                                    208 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 198: Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
      00A6E1 C6 7F 76         [ 1]  209 	ld	a, 0x7f76
      00A6E4 14 03            [ 1]  210 	and	a, (0x03, sp)
      00A6E6 6B 01            [ 1]  211 	ld	(0x01, sp), a
                                    212 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 203: }
      00A6E8                        213 00123$:
                                    214 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 205: Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
      00A6E8 7B 01            [ 1]  215 	ld	a, (0x01, sp)
      00A6EA 88               [ 1]  216 	push	a
      00A6EB 7B 03            [ 1]  217 	ld	a, (0x03, sp)
      00A6ED 27 05            [ 1]  218 	jreq	00136$
      00A6EF                        219 00135$:
      00A6EF 04 01            [ 1]  220 	srl	(1, sp)
      00A6F1 4A               [ 1]  221 	dec	a
      00A6F2 26 FB            [ 1]  222 	jrne	00135$
      00A6F4                        223 00136$:
      00A6F4 84               [ 1]  224 	pop	a
                                    225 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 207: return((ITC_PriorityLevel_TypeDef)Value);
                                    226 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 208: }
      00A6F5 5B 03            [ 2]  227 	addw	sp, #3
      00A6F7 81               [ 4]  228 	ret
                                    229 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 223: void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
                                    230 ;	-----------------------------------------
                                    231 ;	 function ITC_SetSoftwarePriority
                                    232 ;	-----------------------------------------
      00A6F8                        233 _ITC_SetSoftwarePriority:
      00A6F8 52 02            [ 2]  234 	sub	sp, #2
                                    235 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 237: Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
      00A6FA 7B 05            [ 1]  236 	ld	a, (0x05, sp)
      00A6FC 90 5F            [ 1]  237 	clrw	y
      00A6FE A4 03            [ 1]  238 	and	a, #0x03
      00A700 97               [ 1]  239 	ld	xl, a
      00A701 58               [ 2]  240 	sllw	x
      00A702 A6 03            [ 1]  241 	ld	a, #0x03
      00A704 88               [ 1]  242 	push	a
      00A705 9F               [ 1]  243 	ld	a, xl
      00A706 4D               [ 1]  244 	tnz	a
      00A707 27 05            [ 1]  245 	jreq	00132$
      00A709                        246 00131$:
      00A709 08 01            [ 1]  247 	sll	(1, sp)
      00A70B 4A               [ 1]  248 	dec	a
      00A70C 26 FB            [ 1]  249 	jrne	00131$
      00A70E                        250 00132$:
      00A70E 84               [ 1]  251 	pop	a
      00A70F 43               [ 1]  252 	cpl	a
      00A710 6B 02            [ 1]  253 	ld	(0x02, sp), a
                                    254 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 240: NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
      00A712 7B 06            [ 1]  255 	ld	a, (0x06, sp)
      00A714 88               [ 1]  256 	push	a
      00A715 9F               [ 1]  257 	ld	a, xl
      00A716 4D               [ 1]  258 	tnz	a
      00A717 27 05            [ 1]  259 	jreq	00134$
      00A719                        260 00133$:
      00A719 08 01            [ 1]  261 	sll	(1, sp)
      00A71B 4A               [ 1]  262 	dec	a
      00A71C 26 FB            [ 1]  263 	jrne	00133$
      00A71E                        264 00134$:
      00A71E 84               [ 1]  265 	pop	a
      00A71F 6B 01            [ 1]  266 	ld	(0x01, sp), a
                                    267 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 242: switch (IrqNum)
      00A721 7B 05            [ 1]  268 	ld	a, (0x05, sp)
      00A723 A1 18            [ 1]  269 	cp	a, #0x18
      00A725 23 03            [ 2]  270 	jrule	00135$
      00A727 CC A7 E1         [ 2]  271 	jp	00124$
      00A72A                        272 00135$:
      00A72A 5F               [ 1]  273 	clrw	x
      00A72B 7B 05            [ 1]  274 	ld	a, (0x05, sp)
      00A72D 97               [ 1]  275 	ld	xl, a
      00A72E 58               [ 2]  276 	sllw	x
      00A72F DE A7 33         [ 2]  277 	ldw	x, (#00136$, x)
      00A732 FC               [ 2]  278 	jp	(x)
      00A733                        279 00136$:
      00A733 A7 65                  280 	.dw	#00104$
      00A735 A7 65                  281 	.dw	#00104$
      00A737 A7 65                  282 	.dw	#00104$
      00A739 A7 65                  283 	.dw	#00104$
      00A73B A7 77                  284 	.dw	#00108$
      00A73D A7 77                  285 	.dw	#00108$
      00A73F A7 77                  286 	.dw	#00108$
      00A741 A7 77                  287 	.dw	#00108$
      00A743 A7 E1                  288 	.dw	#00124$
      00A745 A7 E1                  289 	.dw	#00124$
      00A747 A7 89                  290 	.dw	#00110$
      00A749 A7 89                  291 	.dw	#00110$
      00A74B A7 9B                  292 	.dw	#00114$
      00A74D A7 9B                  293 	.dw	#00114$
      00A74F A7 9B                  294 	.dw	#00114$
      00A751 A7 9B                  295 	.dw	#00114$
      00A753 A7 AD                  296 	.dw	#00116$
      00A755 A7 E1                  297 	.dw	#00124$
      00A757 A7 E1                  298 	.dw	#00124$
      00A759 A7 AD                  299 	.dw	#00116$
      00A75B A7 BF                  300 	.dw	#00120$
      00A75D A7 BF                  301 	.dw	#00120$
      00A75F A7 BF                  302 	.dw	#00120$
      00A761 A7 BF                  303 	.dw	#00120$
      00A763 A7 D1                  304 	.dw	#00121$
                                    305 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 247: case ITC_IRQ_PORTA:
      00A765                        306 00104$:
                                    307 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 248: ITC->ISPR1 &= Mask;
      00A765 C6 7F 70         [ 1]  308 	ld	a, 0x7f70
      00A768 14 02            [ 1]  309 	and	a, (0x02, sp)
      00A76A C7 7F 70         [ 1]  310 	ld	0x7f70, a
                                    311 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 249: ITC->ISPR1 |= NewPriority;
      00A76D C6 7F 70         [ 1]  312 	ld	a, 0x7f70
      00A770 1A 01            [ 1]  313 	or	a, (0x01, sp)
      00A772 C7 7F 70         [ 1]  314 	ld	0x7f70, a
                                    315 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 250: break;
      00A775 20 6A            [ 2]  316 	jra	00124$
                                    317 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 255: case ITC_IRQ_PORTE:
      00A777                        318 00108$:
                                    319 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 256: ITC->ISPR2 &= Mask;
      00A777 C6 7F 71         [ 1]  320 	ld	a, 0x7f71
      00A77A 14 02            [ 1]  321 	and	a, (0x02, sp)
      00A77C C7 7F 71         [ 1]  322 	ld	0x7f71, a
                                    323 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 257: ITC->ISPR2 |= NewPriority;
      00A77F C6 7F 71         [ 1]  324 	ld	a, 0x7f71
      00A782 1A 01            [ 1]  325 	or	a, (0x01, sp)
      00A784 C7 7F 71         [ 1]  326 	ld	0x7f71, a
                                    327 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 258: break;
      00A787 20 58            [ 2]  328 	jra	00124$
                                    329 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 268: case ITC_IRQ_TIM1_OVF:
      00A789                        330 00110$:
                                    331 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 269: ITC->ISPR3 &= Mask;
      00A789 C6 7F 72         [ 1]  332 	ld	a, 0x7f72
      00A78C 14 02            [ 1]  333 	and	a, (0x02, sp)
      00A78E C7 7F 72         [ 1]  334 	ld	0x7f72, a
                                    335 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 270: ITC->ISPR3 |= NewPriority;
      00A791 C6 7F 72         [ 1]  336 	ld	a, 0x7f72
      00A794 1A 01            [ 1]  337 	or	a, (0x01, sp)
      00A796 C7 7F 72         [ 1]  338 	ld	0x7f72, a
                                    339 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 271: break;
      00A799 20 46            [ 2]  340 	jra	00124$
                                    341 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 281: case ITC_IRQ_TIM3_OVF:
      00A79B                        342 00114$:
                                    343 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 282: ITC->ISPR4 &= Mask;
      00A79B C6 7F 73         [ 1]  344 	ld	a, 0x7f73
      00A79E 14 02            [ 1]  345 	and	a, (0x02, sp)
      00A7A0 C7 7F 73         [ 1]  346 	ld	0x7f73, a
                                    347 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 283: ITC->ISPR4 |= NewPriority;
      00A7A3 C6 7F 73         [ 1]  348 	ld	a, 0x7f73
      00A7A6 1A 01            [ 1]  349 	or	a, (0x01, sp)
      00A7A8 C7 7F 73         [ 1]  350 	ld	0x7f73, a
                                    351 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 284: break;
      00A7AB 20 34            [ 2]  352 	jra	00124$
                                    353 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 296: case ITC_IRQ_I2C:
      00A7AD                        354 00116$:
                                    355 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 297: ITC->ISPR5 &= Mask;
      00A7AD C6 7F 74         [ 1]  356 	ld	a, 0x7f74
      00A7B0 14 02            [ 1]  357 	and	a, (0x02, sp)
      00A7B2 C7 7F 74         [ 1]  358 	ld	0x7f74, a
                                    359 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 298: ITC->ISPR5 |= NewPriority;
      00A7B5 C6 7F 74         [ 1]  360 	ld	a, 0x7f74
      00A7B8 1A 01            [ 1]  361 	or	a, (0x01, sp)
      00A7BA C7 7F 74         [ 1]  362 	ld	0x7f74, a
                                    363 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 299: break;
      00A7BD 20 22            [ 2]  364 	jra	00124$
                                    365 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 321: case ITC_IRQ_TIM4_OVF:
      00A7BF                        366 00120$:
                                    367 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 323: ITC->ISPR6 &= Mask;
      00A7BF C6 7F 75         [ 1]  368 	ld	a, 0x7f75
      00A7C2 14 02            [ 1]  369 	and	a, (0x02, sp)
      00A7C4 C7 7F 75         [ 1]  370 	ld	0x7f75, a
                                    371 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 324: ITC->ISPR6 |= NewPriority;
      00A7C7 C6 7F 75         [ 1]  372 	ld	a, 0x7f75
      00A7CA 1A 01            [ 1]  373 	or	a, (0x01, sp)
      00A7CC C7 7F 75         [ 1]  374 	ld	0x7f75, a
                                    375 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 325: break;
      00A7CF 20 10            [ 2]  376 	jra	00124$
                                    377 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 327: case ITC_IRQ_EEPROM_EEC:
      00A7D1                        378 00121$:
                                    379 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 328: ITC->ISPR7 &= Mask;
      00A7D1 C6 7F 76         [ 1]  380 	ld	a, 0x7f76
      00A7D4 14 02            [ 1]  381 	and	a, (0x02, sp)
      00A7D6 C7 7F 76         [ 1]  382 	ld	0x7f76, a
                                    383 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 329: ITC->ISPR7 |= NewPriority;
      00A7D9 C6 7F 76         [ 1]  384 	ld	a, 0x7f76
      00A7DC 1A 01            [ 1]  385 	or	a, (0x01, sp)
      00A7DE C7 7F 76         [ 1]  386 	ld	0x7f76, a
                                    387 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 334: }
      00A7E1                        388 00124$:
                                    389 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 335: }
      00A7E1 5B 02            [ 2]  390 	addw	sp, #2
      00A7E3 81               [ 4]  391 	ret
                                    392 	.area CODE
                                    393 	.area CONST
                                    394 	.area INITIALIZER
                                    395 	.area CABS (ABS)
