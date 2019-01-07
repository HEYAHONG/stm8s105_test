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
                                     11 	.globl _EEPROM_EEC_IRQHandler
                                     12 	.globl _TIM4_UPD_OVF_IRQHandler
                                     13 	.globl _ADC1_IRQHandler
                                     14 	.globl _UART2_RX_IRQHandler
                                     15 	.globl _UART2_TX_IRQHandler
                                     16 	.globl _I2C_IRQHandler
                                     17 	.globl _TIM3_CAP_COM_IRQHandler
                                     18 	.globl _TIM3_UPD_OVF_BRK_IRQHandler
                                     19 	.globl _TIM2_CAP_COM_IRQHandler
                                     20 	.globl _TIM2_UPD_OVF_BRK_IRQHandler
                                     21 	.globl _TIM1_CAP_COM_IRQHandler
                                     22 	.globl _TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                     23 	.globl _SPI_IRQHandler
                                     24 	.globl _EXTI_PORTE_IRQHandler
                                     25 	.globl _EXTI_PORTD_IRQHandler
                                     26 	.globl _EXTI_PORTC_IRQHandler
                                     27 	.globl _EXTI_PORTB_IRQHandler
                                     28 	.globl _EXTI_PORTA_IRQHandler
                                     29 	.globl _CLK_IRQHandler
                                     30 	.globl _AWU_IRQHandler
                                     31 	.globl _TLI_IRQHandler
                                     32 	.globl _TRAP_IRQHandler
                                     33 	.globl _UART2_ClearITPendingBit
                                     34 	.globl _UART2_GetITStatus
                                     35 	.globl _UART2_GetFlagStatus
                                     36 	.globl _UART2_SendData8
                                     37 	.globl _UART2_ReceiveData8
                                     38 ;--------------------------------------------------------
                                     39 ; ram data
                                     40 ;--------------------------------------------------------
                                     41 	.area DATA
                                     42 ;--------------------------------------------------------
                                     43 ; ram data
                                     44 ;--------------------------------------------------------
                                     45 	.area INITIALIZED
                                     46 ;--------------------------------------------------------
                                     47 ; absolute external ram data
                                     48 ;--------------------------------------------------------
                                     49 	.area DABS (ABS)
                                     50 
                                     51 ; default segment ordering for linker
                                     52 	.area HOME
                                     53 	.area GSINIT
                                     54 	.area GSFINAL
                                     55 	.area CONST
                                     56 	.area INITIALIZER
                                     57 	.area CODE
                                     58 
                                     59 ;--------------------------------------------------------
                                     60 ; global & static initialisations
                                     61 ;--------------------------------------------------------
                                     62 	.area HOME
                                     63 	.area GSINIT
                                     64 	.area GSFINAL
                                     65 	.area GSINIT
                                     66 ;--------------------------------------------------------
                                     67 ; Home
                                     68 ;--------------------------------------------------------
                                     69 	.area HOME
                                     70 	.area HOME
                                     71 ;--------------------------------------------------------
                                     72 ; code
                                     73 ;--------------------------------------------------------
                                     74 	.area CODE
                                     75 ;	stm8s_it.c: 67: INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
                                     76 ;	-----------------------------------------
                                     77 ;	 function TRAP_IRQHandler
                                     78 ;	-----------------------------------------
      008678                         79 _TRAP_IRQHandler:
                                     80 ;	stm8s_it.c: 74: }
      008678 80               [11]   81 	iret
                                     82 ;	stm8s_it.c: 81: INTERRUPT_HANDLER(TLI_IRQHandler, 0)
                                     83 ;	-----------------------------------------
                                     84 ;	 function TLI_IRQHandler
                                     85 ;	-----------------------------------------
      008679                         86 _TLI_IRQHandler:
                                     87 ;	stm8s_it.c: 87: }
      008679 80               [11]   88 	iret
                                     89 ;	stm8s_it.c: 94: INTERRUPT_HANDLER(AWU_IRQHandler, 1)
                                     90 ;	-----------------------------------------
                                     91 ;	 function AWU_IRQHandler
                                     92 ;	-----------------------------------------
      00867A                         93 _AWU_IRQHandler:
                                     94 ;	stm8s_it.c: 99: }
      00867A 80               [11]   95 	iret
                                     96 ;	stm8s_it.c: 106: INTERRUPT_HANDLER(CLK_IRQHandler, 2)
                                     97 ;	-----------------------------------------
                                     98 ;	 function CLK_IRQHandler
                                     99 ;	-----------------------------------------
      00867B                        100 _CLK_IRQHandler:
                                    101 ;	stm8s_it.c: 111: }
      00867B 80               [11]  102 	iret
                                    103 ;	stm8s_it.c: 118: INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
                                    104 ;	-----------------------------------------
                                    105 ;	 function EXTI_PORTA_IRQHandler
                                    106 ;	-----------------------------------------
      00867C                        107 _EXTI_PORTA_IRQHandler:
                                    108 ;	stm8s_it.c: 123: }
      00867C 80               [11]  109 	iret
                                    110 ;	stm8s_it.c: 130: INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
                                    111 ;	-----------------------------------------
                                    112 ;	 function EXTI_PORTB_IRQHandler
                                    113 ;	-----------------------------------------
      00867D                        114 _EXTI_PORTB_IRQHandler:
                                    115 ;	stm8s_it.c: 135: }
      00867D 80               [11]  116 	iret
                                    117 ;	stm8s_it.c: 142: INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
                                    118 ;	-----------------------------------------
                                    119 ;	 function EXTI_PORTC_IRQHandler
                                    120 ;	-----------------------------------------
      00867E                        121 _EXTI_PORTC_IRQHandler:
                                    122 ;	stm8s_it.c: 147: }
      00867E 80               [11]  123 	iret
                                    124 ;	stm8s_it.c: 154: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
                                    125 ;	-----------------------------------------
                                    126 ;	 function EXTI_PORTD_IRQHandler
                                    127 ;	-----------------------------------------
      00867F                        128 _EXTI_PORTD_IRQHandler:
                                    129 ;	stm8s_it.c: 159: }
      00867F 80               [11]  130 	iret
                                    131 ;	stm8s_it.c: 166: INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
                                    132 ;	-----------------------------------------
                                    133 ;	 function EXTI_PORTE_IRQHandler
                                    134 ;	-----------------------------------------
      008680                        135 _EXTI_PORTE_IRQHandler:
                                    136 ;	stm8s_it.c: 171: }
      008680 80               [11]  137 	iret
                                    138 ;	stm8s_it.c: 218: INTERRUPT_HANDLER(SPI_IRQHandler, 10)
                                    139 ;	-----------------------------------------
                                    140 ;	 function SPI_IRQHandler
                                    141 ;	-----------------------------------------
      008681                        142 _SPI_IRQHandler:
                                    143 ;	stm8s_it.c: 223: }
      008681 80               [11]  144 	iret
                                    145 ;	stm8s_it.c: 230: INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
                                    146 ;	-----------------------------------------
                                    147 ;	 function TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                    148 ;	-----------------------------------------
      008682                        149 _TIM1_UPD_OVF_TRG_BRK_IRQHandler:
                                    150 ;	stm8s_it.c: 235: }
      008682 80               [11]  151 	iret
                                    152 ;	stm8s_it.c: 242: INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
                                    153 ;	-----------------------------------------
                                    154 ;	 function TIM1_CAP_COM_IRQHandler
                                    155 ;	-----------------------------------------
      008683                        156 _TIM1_CAP_COM_IRQHandler:
                                    157 ;	stm8s_it.c: 247: }
      008683 80               [11]  158 	iret
                                    159 ;	stm8s_it.c: 280: INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
                                    160 ;	-----------------------------------------
                                    161 ;	 function TIM2_UPD_OVF_BRK_IRQHandler
                                    162 ;	-----------------------------------------
      008684                        163 _TIM2_UPD_OVF_BRK_IRQHandler:
                                    164 ;	stm8s_it.c: 285: }
      008684 80               [11]  165 	iret
                                    166 ;	stm8s_it.c: 292: INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
                                    167 ;	-----------------------------------------
                                    168 ;	 function TIM2_CAP_COM_IRQHandler
                                    169 ;	-----------------------------------------
      008685                        170 _TIM2_CAP_COM_IRQHandler:
                                    171 ;	stm8s_it.c: 297: }
      008685 80               [11]  172 	iret
                                    173 ;	stm8s_it.c: 307: INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
                                    174 ;	-----------------------------------------
                                    175 ;	 function TIM3_UPD_OVF_BRK_IRQHandler
                                    176 ;	-----------------------------------------
      008686                        177 _TIM3_UPD_OVF_BRK_IRQHandler:
                                    178 ;	stm8s_it.c: 312: }
      008686 80               [11]  179 	iret
                                    180 ;	stm8s_it.c: 319: INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
                                    181 ;	-----------------------------------------
                                    182 ;	 function TIM3_CAP_COM_IRQHandler
                                    183 ;	-----------------------------------------
      008687                        184 _TIM3_CAP_COM_IRQHandler:
                                    185 ;	stm8s_it.c: 324: }
      008687 80               [11]  186 	iret
                                    187 ;	stm8s_it.c: 389: INTERRUPT_HANDLER(I2C_IRQHandler, 19)
                                    188 ;	-----------------------------------------
                                    189 ;	 function I2C_IRQHandler
                                    190 ;	-----------------------------------------
      008688                        191 _I2C_IRQHandler:
                                    192 ;	stm8s_it.c: 394: }
      008688 80               [11]  193 	iret
                                    194 ;	stm8s_it.c: 402: INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
                                    195 ;	-----------------------------------------
                                    196 ;	 function UART2_TX_IRQHandler
                                    197 ;	-----------------------------------------
      008689                        198 _UART2_TX_IRQHandler:
                                    199 ;	stm8s_it.c: 407: }
      008689 80               [11]  200 	iret
                                    201 ;	stm8s_it.c: 414: INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
                                    202 ;	-----------------------------------------
                                    203 ;	 function UART2_RX_IRQHandler
                                    204 ;	-----------------------------------------
      00868A                        205 _UART2_RX_IRQHandler:
      00868A 4F               [ 1]  206 	clr	a
      00868B 62               [ 2]  207 	div	x, a
                                    208 ;	stm8s_it.c: 419: if(UART2_GetITStatus(UART2_IT_RXNE))
      00868C 4B 55            [ 1]  209 	push	#0x55
      00868E 4B 02            [ 1]  210 	push	#0x02
      008690 CD 9D 6B         [ 4]  211 	call	_UART2_GetITStatus
      008693 5B 02            [ 2]  212 	addw	sp, #2
      008695 4D               [ 1]  213 	tnz	a
      008696 27 14            [ 1]  214 	jreq	00105$
                                    215 ;	stm8s_it.c: 421: while(UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET);
      008698                        216 00101$:
      008698 4B 80            [ 1]  217 	push	#0x80
      00869A 4B 00            [ 1]  218 	push	#0x00
      00869C CD 9C E4         [ 4]  219 	call	_UART2_GetFlagStatus
      00869F 5B 02            [ 2]  220 	addw	sp, #2
      0086A1 4D               [ 1]  221 	tnz	a
      0086A2 27 F4            [ 1]  222 	jreq	00101$
                                    223 ;	stm8s_it.c: 422: UART2_SendData8(UART2_ReceiveData8());
      0086A4 CD 9C 7A         [ 4]  224 	call	_UART2_ReceiveData8
      0086A7 88               [ 1]  225 	push	a
      0086A8 CD 9C 9C         [ 4]  226 	call	_UART2_SendData8
      0086AB 84               [ 1]  227 	pop	a
      0086AC                        228 00105$:
                                    229 ;	stm8s_it.c: 424: UART2_ClearITPendingBit(UART2_IT_RXNE);	
      0086AC 4B 55            [ 1]  230 	push	#0x55
      0086AE 4B 02            [ 1]  231 	push	#0x02
      0086B0 CD 9E 07         [ 4]  232 	call	_UART2_ClearITPendingBit
      0086B3 5B 02            [ 2]  233 	addw	sp, #2
                                    234 ;	stm8s_it.c: 427: if(UART2->SR & UART2_SR_OR)
      0086B5 C6 52 40         [ 1]  235 	ld	a, 0x5240
      0086B8 A5 08            [ 1]  236 	bcp	a, #0x08
      0086BA 27 09            [ 1]  237 	jreq	00108$
                                    238 ;	stm8s_it.c: 429: UART2_ClearITPendingBit(UART2_IT_OR);
      0086BC 4B 35            [ 1]  239 	push	#0x35
      0086BE 4B 02            [ 1]  240 	push	#0x02
      0086C0 CD 9E 07         [ 4]  241 	call	_UART2_ClearITPendingBit
      0086C3 5B 02            [ 2]  242 	addw	sp, #2
      0086C5                        243 00108$:
                                    244 ;	stm8s_it.c: 431: }
      0086C5 80               [11]  245 	iret
                                    246 ;	stm8s_it.c: 480: INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
                                    247 ;	-----------------------------------------
                                    248 ;	 function ADC1_IRQHandler
                                    249 ;	-----------------------------------------
      0086C6                        250 _ADC1_IRQHandler:
                                    251 ;	stm8s_it.c: 485: }
      0086C6 80               [11]  252 	iret
                                    253 ;	stm8s_it.c: 506: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    254 ;	-----------------------------------------
                                    255 ;	 function TIM4_UPD_OVF_IRQHandler
                                    256 ;	-----------------------------------------
      0086C7                        257 _TIM4_UPD_OVF_IRQHandler:
                                    258 ;	stm8s_it.c: 511: }
      0086C7 80               [11]  259 	iret
                                    260 ;	stm8s_it.c: 519: INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
                                    261 ;	-----------------------------------------
                                    262 ;	 function EEPROM_EEC_IRQHandler
                                    263 ;	-----------------------------------------
      0086C8                        264 _EEPROM_EEC_IRQHandler:
                                    265 ;	stm8s_it.c: 524: }
      0086C8 80               [11]  266 	iret
                                    267 	.area CODE
                                    268 	.area CONST
                                    269 	.area INITIALIZER
                                    270 	.area CABS (ABS)
