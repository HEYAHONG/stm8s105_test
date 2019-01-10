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
                                     13 	.globl _key_read
                                     14 	.globl _UART2_ClearITPendingBit
                                     15 	.globl _UART2_GetITStatus
                                     16 	.globl _UART2_ClearFlag
                                     17 	.globl _UART2_GetFlagStatus
                                     18 	.globl _UART2_SendData8
                                     19 	.globl _UART2_ReceiveData8
                                     20 	.globl _TRAP_IRQHandler
                                     21 	.globl _TLI_IRQHandler
                                     22 	.globl _AWU_IRQHandler
                                     23 	.globl _CLK_IRQHandler
                                     24 	.globl _EXTI_PORTA_IRQHandler
                                     25 	.globl _EXTI_PORTB_IRQHandler
                                     26 	.globl _EXTI_PORTC_IRQHandler
                                     27 	.globl _EXTI_PORTD_IRQHandler
                                     28 	.globl _EXTI_PORTE_IRQHandler
                                     29 	.globl _SPI_IRQHandler
                                     30 	.globl _TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                     31 	.globl _TIM1_CAP_COM_IRQHandler
                                     32 	.globl _TIM2_UPD_OVF_BRK_IRQHandler
                                     33 	.globl _TIM2_CAP_COM_IRQHandler
                                     34 	.globl _I2C_IRQHandler
                                     35 	.globl _UART2_TX_IRQHandler
                                     36 	.globl _UART2_RX_IRQHandler
                                     37 	.globl _ADC1_IRQHandler
                                     38 	.globl _TIM4_UPD_OVF_IRQHandler
                                     39 	.globl _EEPROM_EEC_IRQHandler
                                     40 ;--------------------------------------------------------
                                     41 ; ram data
                                     42 ;--------------------------------------------------------
                                     43 	.area DATA
                                     44 ;--------------------------------------------------------
                                     45 ; ram data
                                     46 ;--------------------------------------------------------
                                     47 	.area INITIALIZED
                                     48 ;--------------------------------------------------------
                                     49 ; absolute external ram data
                                     50 ;--------------------------------------------------------
                                     51 	.area DABS (ABS)
                                     52 
                                     53 ; default segment ordering for linker
                                     54 	.area HOME
                                     55 	.area GSINIT
                                     56 	.area GSFINAL
                                     57 	.area CONST
                                     58 	.area INITIALIZER
                                     59 	.area CODE
                                     60 
                                     61 ;--------------------------------------------------------
                                     62 ; global & static initialisations
                                     63 ;--------------------------------------------------------
                                     64 	.area HOME
                                     65 	.area GSINIT
                                     66 	.area GSFINAL
                                     67 	.area GSINIT
                                     68 ;--------------------------------------------------------
                                     69 ; Home
                                     70 ;--------------------------------------------------------
                                     71 	.area HOME
                                     72 	.area HOME
                                     73 ;--------------------------------------------------------
                                     74 ; code
                                     75 ;--------------------------------------------------------
                                     76 	.area CODE
                                     77 ;	stm8s_it.c: 67: INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
                                     78 ;	-----------------------------------------
                                     79 ;	 function TRAP_IRQHandler
                                     80 ;	-----------------------------------------
      0086FC                         81 _TRAP_IRQHandler:
                                     82 ;	stm8s_it.c: 74: }
      0086FC 80               [11]   83 	iret
                                     84 ;	stm8s_it.c: 81: INTERRUPT_HANDLER(TLI_IRQHandler, 0)
                                     85 ;	-----------------------------------------
                                     86 ;	 function TLI_IRQHandler
                                     87 ;	-----------------------------------------
      0086FD                         88 _TLI_IRQHandler:
                                     89 ;	stm8s_it.c: 87: }
      0086FD 80               [11]   90 	iret
                                     91 ;	stm8s_it.c: 94: INTERRUPT_HANDLER(AWU_IRQHandler, 1)
                                     92 ;	-----------------------------------------
                                     93 ;	 function AWU_IRQHandler
                                     94 ;	-----------------------------------------
      0086FE                         95 _AWU_IRQHandler:
                                     96 ;	stm8s_it.c: 99: }
      0086FE 80               [11]   97 	iret
                                     98 ;	stm8s_it.c: 106: INTERRUPT_HANDLER(CLK_IRQHandler, 2)
                                     99 ;	-----------------------------------------
                                    100 ;	 function CLK_IRQHandler
                                    101 ;	-----------------------------------------
      0086FF                        102 _CLK_IRQHandler:
                                    103 ;	stm8s_it.c: 111: }
      0086FF 80               [11]  104 	iret
                                    105 ;	stm8s_it.c: 118: INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
                                    106 ;	-----------------------------------------
                                    107 ;	 function EXTI_PORTA_IRQHandler
                                    108 ;	-----------------------------------------
      008700                        109 _EXTI_PORTA_IRQHandler:
                                    110 ;	stm8s_it.c: 123: }
      008700 80               [11]  111 	iret
                                    112 ;	stm8s_it.c: 130: INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
                                    113 ;	-----------------------------------------
                                    114 ;	 function EXTI_PORTB_IRQHandler
                                    115 ;	-----------------------------------------
      008701                        116 _EXTI_PORTB_IRQHandler:
                                    117 ;	stm8s_it.c: 135: }
      008701 80               [11]  118 	iret
                                    119 ;	stm8s_it.c: 142: INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
                                    120 ;	-----------------------------------------
                                    121 ;	 function EXTI_PORTC_IRQHandler
                                    122 ;	-----------------------------------------
      008702                        123 _EXTI_PORTC_IRQHandler:
                                    124 ;	stm8s_it.c: 147: }
      008702 80               [11]  125 	iret
                                    126 ;	stm8s_it.c: 155: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
                                    127 ;	-----------------------------------------
                                    128 ;	 function EXTI_PORTD_IRQHandler
                                    129 ;	-----------------------------------------
      008703                        130 _EXTI_PORTD_IRQHandler:
      008703 4F               [ 1]  131 	clr	a
      008704 62               [ 2]  132 	div	x, a
      008705 88               [ 1]  133 	push	a
                                    134 ;	stm8s_it.c: 161: for(temp=0;temp<100;temp++) //延时去抖
      008706 A6 64            [ 1]  135 	ld	a, #0x64
      008708                        136 00107$:
                                    137 ;	stm8s_it.c: 163: nop();nop();nop();nop();nop();
      008708 9D               [ 1]  138 	nop
      008709 9D               [ 1]  139 	nop
      00870A 9D               [ 1]  140 	nop
      00870B 9D               [ 1]  141 	nop
      00870C 9D               [ 1]  142 	nop
      00870D 4A               [ 1]  143 	dec	a
                                    144 ;	stm8s_it.c: 161: for(temp=0;temp<100;temp++) //延时去抖
      00870E 4D               [ 1]  145 	tnz	a
      00870F 26 F7            [ 1]  146 	jrne	00107$
                                    147 ;	stm8s_it.c: 165: for(temp=0;temp<5;temp++)
      008711 0F 01            [ 1]  148 	clr	(0x01, sp)
      008713                        149 00108$:
                                    150 ;	stm8s_it.c: 167: if(key_read(temp)==RESET) keycount[temp]++;
      008713 7B 01            [ 1]  151 	ld	a, (0x01, sp)
      008715 88               [ 1]  152 	push	a
      008716 CD 91 B6         [ 4]  153 	call	_key_read
      008719 5B 01            [ 2]  154 	addw	sp, #1
      00871B 4D               [ 1]  155 	tnz	a
      00871C 26 08            [ 1]  156 	jrne	00109$
      00871E 5F               [ 1]  157 	clrw	x
      00871F 7B 01            [ 1]  158 	ld	a, (0x01, sp)
      008721 97               [ 1]  159 	ld	xl, a
      008722 1C 00 07         [ 2]  160 	addw	x, #_keycount
      008725 7C               [ 1]  161 	inc	(x)
      008726                        162 00109$:
                                    163 ;	stm8s_it.c: 165: for(temp=0;temp<5;temp++)
      008726 0C 01            [ 1]  164 	inc	(0x01, sp)
      008728 7B 01            [ 1]  165 	ld	a, (0x01, sp)
      00872A A1 05            [ 1]  166 	cp	a, #0x05
      00872C 25 E5            [ 1]  167 	jrc	00108$
                                    168 ;	stm8s_it.c: 170: }
      00872E 84               [ 1]  169 	pop	a
      00872F 80               [11]  170 	iret
                                    171 ;	stm8s_it.c: 177: INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
                                    172 ;	-----------------------------------------
                                    173 ;	 function EXTI_PORTE_IRQHandler
                                    174 ;	-----------------------------------------
      008730                        175 _EXTI_PORTE_IRQHandler:
                                    176 ;	stm8s_it.c: 182: }
      008730 80               [11]  177 	iret
                                    178 ;	stm8s_it.c: 229: INTERRUPT_HANDLER(SPI_IRQHandler, 10)
                                    179 ;	-----------------------------------------
                                    180 ;	 function SPI_IRQHandler
                                    181 ;	-----------------------------------------
      008731                        182 _SPI_IRQHandler:
                                    183 ;	stm8s_it.c: 234: }
      008731 80               [11]  184 	iret
                                    185 ;	stm8s_it.c: 241: INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
                                    186 ;	-----------------------------------------
                                    187 ;	 function TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                    188 ;	-----------------------------------------
      008732                        189 _TIM1_UPD_OVF_TRG_BRK_IRQHandler:
                                    190 ;	stm8s_it.c: 246: }
      008732 80               [11]  191 	iret
                                    192 ;	stm8s_it.c: 253: INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
                                    193 ;	-----------------------------------------
                                    194 ;	 function TIM1_CAP_COM_IRQHandler
                                    195 ;	-----------------------------------------
      008733                        196 _TIM1_CAP_COM_IRQHandler:
                                    197 ;	stm8s_it.c: 258: }
      008733 80               [11]  198 	iret
                                    199 ;	stm8s_it.c: 291: INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
                                    200 ;	-----------------------------------------
                                    201 ;	 function TIM2_UPD_OVF_BRK_IRQHandler
                                    202 ;	-----------------------------------------
      008734                        203 _TIM2_UPD_OVF_BRK_IRQHandler:
                                    204 ;	stm8s_it.c: 296: }
      008734 80               [11]  205 	iret
                                    206 ;	stm8s_it.c: 303: INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
                                    207 ;	-----------------------------------------
                                    208 ;	 function TIM2_CAP_COM_IRQHandler
                                    209 ;	-----------------------------------------
      008735                        210 _TIM2_CAP_COM_IRQHandler:
                                    211 ;	stm8s_it.c: 308: }
      008735 80               [11]  212 	iret
                                    213 ;	stm8s_it.c: 318: INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
                                    214 ;	-----------------------------------------
                                    215 ;	 function TIM3_UPD_OVF_BRK_IRQHandler
                                    216 ;	-----------------------------------------
      008736                        217 _TIM3_UPD_OVF_BRK_IRQHandler:
                                    218 ;	stm8s_it.c: 323: }
      008736 80               [11]  219 	iret
                                    220 ;	stm8s_it.c: 330: INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
                                    221 ;	-----------------------------------------
                                    222 ;	 function TIM3_CAP_COM_IRQHandler
                                    223 ;	-----------------------------------------
      008737                        224 _TIM3_CAP_COM_IRQHandler:
                                    225 ;	stm8s_it.c: 335: }
      008737 80               [11]  226 	iret
                                    227 ;	stm8s_it.c: 400: INTERRUPT_HANDLER(I2C_IRQHandler, 19)
                                    228 ;	-----------------------------------------
                                    229 ;	 function I2C_IRQHandler
                                    230 ;	-----------------------------------------
      008738                        231 _I2C_IRQHandler:
                                    232 ;	stm8s_it.c: 405: }
      008738 80               [11]  233 	iret
                                    234 ;	stm8s_it.c: 413: INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
                                    235 ;	-----------------------------------------
                                    236 ;	 function UART2_TX_IRQHandler
                                    237 ;	-----------------------------------------
      008739                        238 _UART2_TX_IRQHandler:
                                    239 ;	stm8s_it.c: 418: }
      008739 80               [11]  240 	iret
                                    241 ;	stm8s_it.c: 425: INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
                                    242 ;	-----------------------------------------
                                    243 ;	 function UART2_RX_IRQHandler
                                    244 ;	-----------------------------------------
      00873A                        245 _UART2_RX_IRQHandler:
      00873A 4F               [ 1]  246 	clr	a
      00873B 62               [ 2]  247 	div	x, a
                                    248 ;	stm8s_it.c: 430: if(UART2_GetITStatus(UART2_IT_RXNE))
      00873C 4B 55            [ 1]  249 	push	#0x55
      00873E 4B 02            [ 1]  250 	push	#0x02
      008740 CD A3 67         [ 4]  251 	call	_UART2_GetITStatus
      008743 5B 02            [ 2]  252 	addw	sp, #2
      008745 4D               [ 1]  253 	tnz	a
      008746 27 14            [ 1]  254 	jreq	00105$
                                    255 ;	stm8s_it.c: 432: while(UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET);
      008748                        256 00101$:
      008748 4B 80            [ 1]  257 	push	#0x80
      00874A 4B 00            [ 1]  258 	push	#0x00
      00874C CD A2 E0         [ 4]  259 	call	_UART2_GetFlagStatus
      00874F 5B 02            [ 2]  260 	addw	sp, #2
      008751 4D               [ 1]  261 	tnz	a
      008752 27 F4            [ 1]  262 	jreq	00101$
                                    263 ;	stm8s_it.c: 433: UART2_SendData8(UART2_ReceiveData8());
      008754 CD A2 76         [ 4]  264 	call	_UART2_ReceiveData8
      008757 88               [ 1]  265 	push	a
      008758 CD A2 98         [ 4]  266 	call	_UART2_SendData8
      00875B 84               [ 1]  267 	pop	a
      00875C                        268 00105$:
                                    269 ;	stm8s_it.c: 435: UART2_ClearITPendingBit(UART2_IT_RXNE);	
      00875C 4B 55            [ 1]  270 	push	#0x55
      00875E 4B 02            [ 1]  271 	push	#0x02
      008760 CD A4 03         [ 4]  272 	call	_UART2_ClearITPendingBit
      008763 5B 02            [ 2]  273 	addw	sp, #2
                                    274 ;	stm8s_it.c: 438: if(UART2_GetITStatus(UART2_IT_OR))
      008765 4B 35            [ 1]  275 	push	#0x35
      008767 4B 02            [ 1]  276 	push	#0x02
      008769 CD A3 67         [ 4]  277 	call	_UART2_GetITStatus
      00876C 5B 02            [ 2]  278 	addw	sp, #2
      00876E 4D               [ 1]  279 	tnz	a
      00876F 27 09            [ 1]  280 	jreq	00107$
                                    281 ;	stm8s_it.c: 440: UART2_ClearITPendingBit(UART2_IT_OR);
      008771 4B 35            [ 1]  282 	push	#0x35
      008773 4B 02            [ 1]  283 	push	#0x02
      008775 CD A4 03         [ 4]  284 	call	_UART2_ClearITPendingBit
      008778 5B 02            [ 2]  285 	addw	sp, #2
      00877A                        286 00107$:
                                    287 ;	stm8s_it.c: 442: if(UART2_GetFlagStatus(UART2_FLAG_OR_LHE))
      00877A 4B 08            [ 1]  288 	push	#0x08
      00877C 4B 00            [ 1]  289 	push	#0x00
      00877E CD A2 E0         [ 4]  290 	call	_UART2_GetFlagStatus
      008781 5B 02            [ 2]  291 	addw	sp, #2
      008783 4D               [ 1]  292 	tnz	a
      008784 27 09            [ 1]  293 	jreq	00110$
                                    294 ;	stm8s_it.c: 444: UART2_ClearFlag(UART2_FLAG_OR_LHE);
      008786 4B 08            [ 1]  295 	push	#0x08
      008788 4B 00            [ 1]  296 	push	#0x00
      00878A CD A3 39         [ 4]  297 	call	_UART2_ClearFlag
      00878D 5B 02            [ 2]  298 	addw	sp, #2
      00878F                        299 00110$:
                                    300 ;	stm8s_it.c: 448: }
      00878F 80               [11]  301 	iret
                                    302 ;	stm8s_it.c: 497: INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
                                    303 ;	-----------------------------------------
                                    304 ;	 function ADC1_IRQHandler
                                    305 ;	-----------------------------------------
      008790                        306 _ADC1_IRQHandler:
                                    307 ;	stm8s_it.c: 502: }
      008790 80               [11]  308 	iret
                                    309 ;	stm8s_it.c: 523: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    310 ;	-----------------------------------------
                                    311 ;	 function TIM4_UPD_OVF_IRQHandler
                                    312 ;	-----------------------------------------
      008791                        313 _TIM4_UPD_OVF_IRQHandler:
                                    314 ;	stm8s_it.c: 528: }
      008791 80               [11]  315 	iret
                                    316 ;	stm8s_it.c: 536: INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
                                    317 ;	-----------------------------------------
                                    318 ;	 function EEPROM_EEC_IRQHandler
                                    319 ;	-----------------------------------------
      008792                        320 _EEPROM_EEC_IRQHandler:
                                    321 ;	stm8s_it.c: 541: }
      008792 80               [11]  322 	iret
                                    323 	.area CODE
                                    324 	.area CONST
                                    325 	.area INITIALIZER
                                    326 	.area CABS (ABS)
