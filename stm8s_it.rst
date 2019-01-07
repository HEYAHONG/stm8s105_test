                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_it
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TIM3_CAP_COM_IRQHandler
                                     12 	.globl _TIM3_UPD_OVF_BRK_IRQHandler
                                     13 	.globl _UART2_ClearITPendingBit
                                     14 	.globl _UART2_GetITStatus
                                     15 	.globl _UART2_ClearFlag
                                     16 	.globl _UART2_GetFlagStatus
                                     17 	.globl _UART2_SendData8
                                     18 	.globl _UART2_ReceiveData8
                                     19 	.globl _TRAP_IRQHandler
                                     20 	.globl _TLI_IRQHandler
                                     21 	.globl _AWU_IRQHandler
                                     22 	.globl _CLK_IRQHandler
                                     23 	.globl _EXTI_PORTA_IRQHandler
                                     24 	.globl _EXTI_PORTB_IRQHandler
                                     25 	.globl _EXTI_PORTC_IRQHandler
                                     26 	.globl _EXTI_PORTD_IRQHandler
                                     27 	.globl _EXTI_PORTE_IRQHandler
                                     28 	.globl _SPI_IRQHandler
                                     29 	.globl _TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                     30 	.globl _TIM1_CAP_COM_IRQHandler
                                     31 	.globl _TIM2_UPD_OVF_BRK_IRQHandler
                                     32 	.globl _TIM2_CAP_COM_IRQHandler
                                     33 	.globl _I2C_IRQHandler
                                     34 	.globl _UART2_TX_IRQHandler
                                     35 	.globl _UART2_RX_IRQHandler
                                     36 	.globl _ADC1_IRQHandler
                                     37 	.globl _TIM4_UPD_OVF_IRQHandler
                                     38 	.globl _EEPROM_EEC_IRQHandler
                                     39 ;--------------------------------------------------------
                                     40 ; ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area DATA
                                     43 ;--------------------------------------------------------
                                     44 ; ram data
                                     45 ;--------------------------------------------------------
                                     46 	.area INITIALIZED
                                     47 ;--------------------------------------------------------
                                     48 ; absolute external ram data
                                     49 ;--------------------------------------------------------
                                     50 	.area DABS (ABS)
                                     51 
                                     52 ; default segment ordering for linker
                                     53 	.area HOME
                                     54 	.area GSINIT
                                     55 	.area GSFINAL
                                     56 	.area CONST
                                     57 	.area INITIALIZER
                                     58 	.area CODE
                                     59 
                                     60 ;--------------------------------------------------------
                                     61 ; global & static initialisations
                                     62 ;--------------------------------------------------------
                                     63 	.area HOME
                                     64 	.area GSINIT
                                     65 	.area GSFINAL
                                     66 	.area GSINIT
                                     67 ;--------------------------------------------------------
                                     68 ; Home
                                     69 ;--------------------------------------------------------
                                     70 	.area HOME
                                     71 	.area HOME
                                     72 ;--------------------------------------------------------
                                     73 ; code
                                     74 ;--------------------------------------------------------
                                     75 	.area CODE
                                     76 ;	stm8s_it.c: 67: INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
                                     77 ;	-----------------------------------------
                                     78 ;	 function TRAP_IRQHandler
                                     79 ;	-----------------------------------------
      0086E0                         80 _TRAP_IRQHandler:
                                     81 ;	stm8s_it.c: 74: }
      0086E0 80               [11]   82 	iret
                                     83 ;	stm8s_it.c: 81: INTERRUPT_HANDLER(TLI_IRQHandler, 0)
                                     84 ;	-----------------------------------------
                                     85 ;	 function TLI_IRQHandler
                                     86 ;	-----------------------------------------
      0086E1                         87 _TLI_IRQHandler:
                                     88 ;	stm8s_it.c: 87: }
      0086E1 80               [11]   89 	iret
                                     90 ;	stm8s_it.c: 94: INTERRUPT_HANDLER(AWU_IRQHandler, 1)
                                     91 ;	-----------------------------------------
                                     92 ;	 function AWU_IRQHandler
                                     93 ;	-----------------------------------------
      0086E2                         94 _AWU_IRQHandler:
                                     95 ;	stm8s_it.c: 99: }
      0086E2 80               [11]   96 	iret
                                     97 ;	stm8s_it.c: 106: INTERRUPT_HANDLER(CLK_IRQHandler, 2)
                                     98 ;	-----------------------------------------
                                     99 ;	 function CLK_IRQHandler
                                    100 ;	-----------------------------------------
      0086E3                        101 _CLK_IRQHandler:
                                    102 ;	stm8s_it.c: 111: }
      0086E3 80               [11]  103 	iret
                                    104 ;	stm8s_it.c: 118: INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
                                    105 ;	-----------------------------------------
                                    106 ;	 function EXTI_PORTA_IRQHandler
                                    107 ;	-----------------------------------------
      0086E4                        108 _EXTI_PORTA_IRQHandler:
                                    109 ;	stm8s_it.c: 123: }
      0086E4 80               [11]  110 	iret
                                    111 ;	stm8s_it.c: 130: INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
                                    112 ;	-----------------------------------------
                                    113 ;	 function EXTI_PORTB_IRQHandler
                                    114 ;	-----------------------------------------
      0086E5                        115 _EXTI_PORTB_IRQHandler:
                                    116 ;	stm8s_it.c: 135: }
      0086E5 80               [11]  117 	iret
                                    118 ;	stm8s_it.c: 142: INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
                                    119 ;	-----------------------------------------
                                    120 ;	 function EXTI_PORTC_IRQHandler
                                    121 ;	-----------------------------------------
      0086E6                        122 _EXTI_PORTC_IRQHandler:
                                    123 ;	stm8s_it.c: 147: }
      0086E6 80               [11]  124 	iret
                                    125 ;	stm8s_it.c: 154: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
                                    126 ;	-----------------------------------------
                                    127 ;	 function EXTI_PORTD_IRQHandler
                                    128 ;	-----------------------------------------
      0086E7                        129 _EXTI_PORTD_IRQHandler:
                                    130 ;	stm8s_it.c: 159: }
      0086E7 80               [11]  131 	iret
                                    132 ;	stm8s_it.c: 166: INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
                                    133 ;	-----------------------------------------
                                    134 ;	 function EXTI_PORTE_IRQHandler
                                    135 ;	-----------------------------------------
      0086E8                        136 _EXTI_PORTE_IRQHandler:
                                    137 ;	stm8s_it.c: 171: }
      0086E8 80               [11]  138 	iret
                                    139 ;	stm8s_it.c: 218: INTERRUPT_HANDLER(SPI_IRQHandler, 10)
                                    140 ;	-----------------------------------------
                                    141 ;	 function SPI_IRQHandler
                                    142 ;	-----------------------------------------
      0086E9                        143 _SPI_IRQHandler:
                                    144 ;	stm8s_it.c: 223: }
      0086E9 80               [11]  145 	iret
                                    146 ;	stm8s_it.c: 230: INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
                                    147 ;	-----------------------------------------
                                    148 ;	 function TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                    149 ;	-----------------------------------------
      0086EA                        150 _TIM1_UPD_OVF_TRG_BRK_IRQHandler:
                                    151 ;	stm8s_it.c: 235: }
      0086EA 80               [11]  152 	iret
                                    153 ;	stm8s_it.c: 242: INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
                                    154 ;	-----------------------------------------
                                    155 ;	 function TIM1_CAP_COM_IRQHandler
                                    156 ;	-----------------------------------------
      0086EB                        157 _TIM1_CAP_COM_IRQHandler:
                                    158 ;	stm8s_it.c: 247: }
      0086EB 80               [11]  159 	iret
                                    160 ;	stm8s_it.c: 280: INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
                                    161 ;	-----------------------------------------
                                    162 ;	 function TIM2_UPD_OVF_BRK_IRQHandler
                                    163 ;	-----------------------------------------
      0086EC                        164 _TIM2_UPD_OVF_BRK_IRQHandler:
                                    165 ;	stm8s_it.c: 285: }
      0086EC 80               [11]  166 	iret
                                    167 ;	stm8s_it.c: 292: INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
                                    168 ;	-----------------------------------------
                                    169 ;	 function TIM2_CAP_COM_IRQHandler
                                    170 ;	-----------------------------------------
      0086ED                        171 _TIM2_CAP_COM_IRQHandler:
                                    172 ;	stm8s_it.c: 297: }
      0086ED 80               [11]  173 	iret
                                    174 ;	stm8s_it.c: 307: INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
                                    175 ;	-----------------------------------------
                                    176 ;	 function TIM3_UPD_OVF_BRK_IRQHandler
                                    177 ;	-----------------------------------------
      0086EE                        178 _TIM3_UPD_OVF_BRK_IRQHandler:
                                    179 ;	stm8s_it.c: 312: }
      0086EE 80               [11]  180 	iret
                                    181 ;	stm8s_it.c: 319: INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
                                    182 ;	-----------------------------------------
                                    183 ;	 function TIM3_CAP_COM_IRQHandler
                                    184 ;	-----------------------------------------
      0086EF                        185 _TIM3_CAP_COM_IRQHandler:
                                    186 ;	stm8s_it.c: 324: }
      0086EF 80               [11]  187 	iret
                                    188 ;	stm8s_it.c: 389: INTERRUPT_HANDLER(I2C_IRQHandler, 19)
                                    189 ;	-----------------------------------------
                                    190 ;	 function I2C_IRQHandler
                                    191 ;	-----------------------------------------
      0086F0                        192 _I2C_IRQHandler:
                                    193 ;	stm8s_it.c: 394: }
      0086F0 80               [11]  194 	iret
                                    195 ;	stm8s_it.c: 402: INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
                                    196 ;	-----------------------------------------
                                    197 ;	 function UART2_TX_IRQHandler
                                    198 ;	-----------------------------------------
      0086F1                        199 _UART2_TX_IRQHandler:
                                    200 ;	stm8s_it.c: 407: }
      0086F1 80               [11]  201 	iret
                                    202 ;	stm8s_it.c: 414: INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
                                    203 ;	-----------------------------------------
                                    204 ;	 function UART2_RX_IRQHandler
                                    205 ;	-----------------------------------------
      0086F2                        206 _UART2_RX_IRQHandler:
      0086F2 4F               [ 1]  207 	clr	a
      0086F3 62               [ 2]  208 	div	x, a
                                    209 ;	stm8s_it.c: 419: if(UART2_GetITStatus(UART2_IT_RXNE))
      0086F4 4B 55            [ 1]  210 	push	#0x55
      0086F6 4B 02            [ 1]  211 	push	#0x02
      0086F8 CD 9E 19         [ 4]  212 	call	_UART2_GetITStatus
      0086FB 5B 02            [ 2]  213 	addw	sp, #2
      0086FD 4D               [ 1]  214 	tnz	a
      0086FE 27 14            [ 1]  215 	jreq	00105$
                                    216 ;	stm8s_it.c: 421: while(UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET);
      008700                        217 00101$:
      008700 4B 80            [ 1]  218 	push	#0x80
      008702 4B 00            [ 1]  219 	push	#0x00
      008704 CD 9D 92         [ 4]  220 	call	_UART2_GetFlagStatus
      008707 5B 02            [ 2]  221 	addw	sp, #2
      008709 4D               [ 1]  222 	tnz	a
      00870A 27 F4            [ 1]  223 	jreq	00101$
                                    224 ;	stm8s_it.c: 422: UART2_SendData8(UART2_ReceiveData8());
      00870C CD 9D 28         [ 4]  225 	call	_UART2_ReceiveData8
      00870F 88               [ 1]  226 	push	a
      008710 CD 9D 4A         [ 4]  227 	call	_UART2_SendData8
      008713 84               [ 1]  228 	pop	a
      008714                        229 00105$:
                                    230 ;	stm8s_it.c: 424: UART2_ClearITPendingBit(UART2_IT_RXNE);	
      008714 4B 55            [ 1]  231 	push	#0x55
      008716 4B 02            [ 1]  232 	push	#0x02
      008718 CD 9E B5         [ 4]  233 	call	_UART2_ClearITPendingBit
      00871B 5B 02            [ 2]  234 	addw	sp, #2
                                    235 ;	stm8s_it.c: 427: if(UART2_GetITStatus(UART2_IT_OR))
      00871D 4B 35            [ 1]  236 	push	#0x35
      00871F 4B 02            [ 1]  237 	push	#0x02
      008721 CD 9E 19         [ 4]  238 	call	_UART2_GetITStatus
      008724 5B 02            [ 2]  239 	addw	sp, #2
      008726 4D               [ 1]  240 	tnz	a
      008727 27 09            [ 1]  241 	jreq	00107$
                                    242 ;	stm8s_it.c: 429: UART2_ClearITPendingBit(UART2_IT_OR);
      008729 4B 35            [ 1]  243 	push	#0x35
      00872B 4B 02            [ 1]  244 	push	#0x02
      00872D CD 9E B5         [ 4]  245 	call	_UART2_ClearITPendingBit
      008730 5B 02            [ 2]  246 	addw	sp, #2
      008732                        247 00107$:
                                    248 ;	stm8s_it.c: 431: if(UART2_GetFlagStatus(UART2_FLAG_OR_LHE))
      008732 4B 08            [ 1]  249 	push	#0x08
      008734 4B 00            [ 1]  250 	push	#0x00
      008736 CD 9D 92         [ 4]  251 	call	_UART2_GetFlagStatus
      008739 5B 02            [ 2]  252 	addw	sp, #2
      00873B 4D               [ 1]  253 	tnz	a
      00873C 27 09            [ 1]  254 	jreq	00110$
                                    255 ;	stm8s_it.c: 433: UART2_ClearFlag(UART2_FLAG_OR_LHE);
      00873E 4B 08            [ 1]  256 	push	#0x08
      008740 4B 00            [ 1]  257 	push	#0x00
      008742 CD 9D EB         [ 4]  258 	call	_UART2_ClearFlag
      008745 5B 02            [ 2]  259 	addw	sp, #2
      008747                        260 00110$:
                                    261 ;	stm8s_it.c: 437: }
      008747 80               [11]  262 	iret
                                    263 ;	stm8s_it.c: 486: INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
                                    264 ;	-----------------------------------------
                                    265 ;	 function ADC1_IRQHandler
                                    266 ;	-----------------------------------------
      008748                        267 _ADC1_IRQHandler:
                                    268 ;	stm8s_it.c: 491: }
      008748 80               [11]  269 	iret
                                    270 ;	stm8s_it.c: 512: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    271 ;	-----------------------------------------
                                    272 ;	 function TIM4_UPD_OVF_IRQHandler
                                    273 ;	-----------------------------------------
      008749                        274 _TIM4_UPD_OVF_IRQHandler:
                                    275 ;	stm8s_it.c: 517: }
      008749 80               [11]  276 	iret
                                    277 ;	stm8s_it.c: 525: INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
                                    278 ;	-----------------------------------------
                                    279 ;	 function EEPROM_EEC_IRQHandler
                                    280 ;	-----------------------------------------
      00874A                        281 _EEPROM_EEC_IRQHandler:
                                    282 ;	stm8s_it.c: 530: }
      00874A 80               [11]  283 	iret
                                    284 	.area CODE
                                    285 	.area CONST
                                    286 	.area INITIALIZER
                                    287 	.area CABS (ABS)
