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
      0086F9                         81 _TRAP_IRQHandler:
                                     82 ;	stm8s_it.c: 74: }
      0086F9 80               [11]   83 	iret
                                     84 ;	stm8s_it.c: 81: INTERRUPT_HANDLER(TLI_IRQHandler, 0)
                                     85 ;	-----------------------------------------
                                     86 ;	 function TLI_IRQHandler
                                     87 ;	-----------------------------------------
      0086FA                         88 _TLI_IRQHandler:
                                     89 ;	stm8s_it.c: 87: }
      0086FA 80               [11]   90 	iret
                                     91 ;	stm8s_it.c: 94: INTERRUPT_HANDLER(AWU_IRQHandler, 1)
                                     92 ;	-----------------------------------------
                                     93 ;	 function AWU_IRQHandler
                                     94 ;	-----------------------------------------
      0086FB                         95 _AWU_IRQHandler:
                                     96 ;	stm8s_it.c: 99: }
      0086FB 80               [11]   97 	iret
                                     98 ;	stm8s_it.c: 106: INTERRUPT_HANDLER(CLK_IRQHandler, 2)
                                     99 ;	-----------------------------------------
                                    100 ;	 function CLK_IRQHandler
                                    101 ;	-----------------------------------------
      0086FC                        102 _CLK_IRQHandler:
                                    103 ;	stm8s_it.c: 111: }
      0086FC 80               [11]  104 	iret
                                    105 ;	stm8s_it.c: 118: INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
                                    106 ;	-----------------------------------------
                                    107 ;	 function EXTI_PORTA_IRQHandler
                                    108 ;	-----------------------------------------
      0086FD                        109 _EXTI_PORTA_IRQHandler:
                                    110 ;	stm8s_it.c: 123: }
      0086FD 80               [11]  111 	iret
                                    112 ;	stm8s_it.c: 130: INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
                                    113 ;	-----------------------------------------
                                    114 ;	 function EXTI_PORTB_IRQHandler
                                    115 ;	-----------------------------------------
      0086FE                        116 _EXTI_PORTB_IRQHandler:
                                    117 ;	stm8s_it.c: 135: }
      0086FE 80               [11]  118 	iret
                                    119 ;	stm8s_it.c: 142: INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
                                    120 ;	-----------------------------------------
                                    121 ;	 function EXTI_PORTC_IRQHandler
                                    122 ;	-----------------------------------------
      0086FF                        123 _EXTI_PORTC_IRQHandler:
                                    124 ;	stm8s_it.c: 147: }
      0086FF 80               [11]  125 	iret
                                    126 ;	stm8s_it.c: 155: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
                                    127 ;	-----------------------------------------
                                    128 ;	 function EXTI_PORTD_IRQHandler
                                    129 ;	-----------------------------------------
      008700                        130 _EXTI_PORTD_IRQHandler:
      008700 4F               [ 1]  131 	clr	a
      008701 62               [ 2]  132 	div	x, a
      008702 88               [ 1]  133 	push	a
                                    134 ;	stm8s_it.c: 161: for(temp=0;temp<100;temp++) //延时去抖
      008703 A6 64            [ 1]  135 	ld	a, #0x64
      008705                        136 00107$:
                                    137 ;	stm8s_it.c: 163: nop();nop();nop();nop();nop();
      008705 9D               [ 1]  138 	nop
      008706 9D               [ 1]  139 	nop
      008707 9D               [ 1]  140 	nop
      008708 9D               [ 1]  141 	nop
      008709 9D               [ 1]  142 	nop
      00870A 4A               [ 1]  143 	dec	a
                                    144 ;	stm8s_it.c: 161: for(temp=0;temp<100;temp++) //延时去抖
      00870B 4D               [ 1]  145 	tnz	a
      00870C 26 F7            [ 1]  146 	jrne	00107$
                                    147 ;	stm8s_it.c: 165: for(temp=0;temp<5;temp++)
      00870E 0F 01            [ 1]  148 	clr	(0x01, sp)
      008710                        149 00108$:
                                    150 ;	stm8s_it.c: 167: if(key_read(temp)==RESET) keycount[temp]++;
      008710 7B 01            [ 1]  151 	ld	a, (0x01, sp)
      008712 88               [ 1]  152 	push	a
      008713 CD 8E 3E         [ 4]  153 	call	_key_read
      008716 5B 01            [ 2]  154 	addw	sp, #1
      008718 4D               [ 1]  155 	tnz	a
      008719 26 08            [ 1]  156 	jrne	00109$
      00871B 5F               [ 1]  157 	clrw	x
      00871C 7B 01            [ 1]  158 	ld	a, (0x01, sp)
      00871E 97               [ 1]  159 	ld	xl, a
      00871F 1C 00 02         [ 2]  160 	addw	x, #_keycount
      008722 7C               [ 1]  161 	inc	(x)
      008723                        162 00109$:
                                    163 ;	stm8s_it.c: 165: for(temp=0;temp<5;temp++)
      008723 0C 01            [ 1]  164 	inc	(0x01, sp)
      008725 7B 01            [ 1]  165 	ld	a, (0x01, sp)
      008727 A1 05            [ 1]  166 	cp	a, #0x05
      008729 25 E5            [ 1]  167 	jrc	00108$
                                    168 ;	stm8s_it.c: 170: }
      00872B 84               [ 1]  169 	pop	a
      00872C 80               [11]  170 	iret
                                    171 ;	stm8s_it.c: 177: INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
                                    172 ;	-----------------------------------------
                                    173 ;	 function EXTI_PORTE_IRQHandler
                                    174 ;	-----------------------------------------
      00872D                        175 _EXTI_PORTE_IRQHandler:
                                    176 ;	stm8s_it.c: 182: }
      00872D 80               [11]  177 	iret
                                    178 ;	stm8s_it.c: 229: INTERRUPT_HANDLER(SPI_IRQHandler, 10)
                                    179 ;	-----------------------------------------
                                    180 ;	 function SPI_IRQHandler
                                    181 ;	-----------------------------------------
      00872E                        182 _SPI_IRQHandler:
                                    183 ;	stm8s_it.c: 234: }
      00872E 80               [11]  184 	iret
                                    185 ;	stm8s_it.c: 241: INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
                                    186 ;	-----------------------------------------
                                    187 ;	 function TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                    188 ;	-----------------------------------------
      00872F                        189 _TIM1_UPD_OVF_TRG_BRK_IRQHandler:
                                    190 ;	stm8s_it.c: 246: }
      00872F 80               [11]  191 	iret
                                    192 ;	stm8s_it.c: 253: INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
                                    193 ;	-----------------------------------------
                                    194 ;	 function TIM1_CAP_COM_IRQHandler
                                    195 ;	-----------------------------------------
      008730                        196 _TIM1_CAP_COM_IRQHandler:
                                    197 ;	stm8s_it.c: 258: }
      008730 80               [11]  198 	iret
                                    199 ;	stm8s_it.c: 291: INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
                                    200 ;	-----------------------------------------
                                    201 ;	 function TIM2_UPD_OVF_BRK_IRQHandler
                                    202 ;	-----------------------------------------
      008731                        203 _TIM2_UPD_OVF_BRK_IRQHandler:
                                    204 ;	stm8s_it.c: 296: }
      008731 80               [11]  205 	iret
                                    206 ;	stm8s_it.c: 303: INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
                                    207 ;	-----------------------------------------
                                    208 ;	 function TIM2_CAP_COM_IRQHandler
                                    209 ;	-----------------------------------------
      008732                        210 _TIM2_CAP_COM_IRQHandler:
                                    211 ;	stm8s_it.c: 308: }
      008732 80               [11]  212 	iret
                                    213 ;	stm8s_it.c: 318: INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
                                    214 ;	-----------------------------------------
                                    215 ;	 function TIM3_UPD_OVF_BRK_IRQHandler
                                    216 ;	-----------------------------------------
      008733                        217 _TIM3_UPD_OVF_BRK_IRQHandler:
                                    218 ;	stm8s_it.c: 323: }
      008733 80               [11]  219 	iret
                                    220 ;	stm8s_it.c: 330: INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
                                    221 ;	-----------------------------------------
                                    222 ;	 function TIM3_CAP_COM_IRQHandler
                                    223 ;	-----------------------------------------
      008734                        224 _TIM3_CAP_COM_IRQHandler:
                                    225 ;	stm8s_it.c: 335: }
      008734 80               [11]  226 	iret
                                    227 ;	stm8s_it.c: 400: INTERRUPT_HANDLER(I2C_IRQHandler, 19)
                                    228 ;	-----------------------------------------
                                    229 ;	 function I2C_IRQHandler
                                    230 ;	-----------------------------------------
      008735                        231 _I2C_IRQHandler:
                                    232 ;	stm8s_it.c: 405: }
      008735 80               [11]  233 	iret
                                    234 ;	stm8s_it.c: 413: INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
                                    235 ;	-----------------------------------------
                                    236 ;	 function UART2_TX_IRQHandler
                                    237 ;	-----------------------------------------
      008736                        238 _UART2_TX_IRQHandler:
                                    239 ;	stm8s_it.c: 418: }
      008736 80               [11]  240 	iret
                                    241 ;	stm8s_it.c: 425: INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
                                    242 ;	-----------------------------------------
                                    243 ;	 function UART2_RX_IRQHandler
                                    244 ;	-----------------------------------------
      008737                        245 _UART2_RX_IRQHandler:
      008737 4F               [ 1]  246 	clr	a
      008738 62               [ 2]  247 	div	x, a
                                    248 ;	stm8s_it.c: 430: if(UART2_GetITStatus(UART2_IT_RXNE))
      008739 4B 55            [ 1]  249 	push	#0x55
      00873B 4B 02            [ 1]  250 	push	#0x02
      00873D CD A0 29         [ 4]  251 	call	_UART2_GetITStatus
      008740 5B 02            [ 2]  252 	addw	sp, #2
      008742 4D               [ 1]  253 	tnz	a
      008743 27 14            [ 1]  254 	jreq	00105$
                                    255 ;	stm8s_it.c: 432: while(UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET);
      008745                        256 00101$:
      008745 4B 80            [ 1]  257 	push	#0x80
      008747 4B 00            [ 1]  258 	push	#0x00
      008749 CD 9F A2         [ 4]  259 	call	_UART2_GetFlagStatus
      00874C 5B 02            [ 2]  260 	addw	sp, #2
      00874E 4D               [ 1]  261 	tnz	a
      00874F 27 F4            [ 1]  262 	jreq	00101$
                                    263 ;	stm8s_it.c: 433: UART2_SendData8(UART2_ReceiveData8());
      008751 CD 9F 38         [ 4]  264 	call	_UART2_ReceiveData8
      008754 88               [ 1]  265 	push	a
      008755 CD 9F 5A         [ 4]  266 	call	_UART2_SendData8
      008758 84               [ 1]  267 	pop	a
      008759                        268 00105$:
                                    269 ;	stm8s_it.c: 435: UART2_ClearITPendingBit(UART2_IT_RXNE);	
      008759 4B 55            [ 1]  270 	push	#0x55
      00875B 4B 02            [ 1]  271 	push	#0x02
      00875D CD A0 C5         [ 4]  272 	call	_UART2_ClearITPendingBit
      008760 5B 02            [ 2]  273 	addw	sp, #2
                                    274 ;	stm8s_it.c: 438: if(UART2_GetITStatus(UART2_IT_OR))
      008762 4B 35            [ 1]  275 	push	#0x35
      008764 4B 02            [ 1]  276 	push	#0x02
      008766 CD A0 29         [ 4]  277 	call	_UART2_GetITStatus
      008769 5B 02            [ 2]  278 	addw	sp, #2
      00876B 4D               [ 1]  279 	tnz	a
      00876C 27 09            [ 1]  280 	jreq	00107$
                                    281 ;	stm8s_it.c: 440: UART2_ClearITPendingBit(UART2_IT_OR);
      00876E 4B 35            [ 1]  282 	push	#0x35
      008770 4B 02            [ 1]  283 	push	#0x02
      008772 CD A0 C5         [ 4]  284 	call	_UART2_ClearITPendingBit
      008775 5B 02            [ 2]  285 	addw	sp, #2
      008777                        286 00107$:
                                    287 ;	stm8s_it.c: 442: if(UART2_GetFlagStatus(UART2_FLAG_OR_LHE))
      008777 4B 08            [ 1]  288 	push	#0x08
      008779 4B 00            [ 1]  289 	push	#0x00
      00877B CD 9F A2         [ 4]  290 	call	_UART2_GetFlagStatus
      00877E 5B 02            [ 2]  291 	addw	sp, #2
      008780 4D               [ 1]  292 	tnz	a
      008781 27 09            [ 1]  293 	jreq	00110$
                                    294 ;	stm8s_it.c: 444: UART2_ClearFlag(UART2_FLAG_OR_LHE);
      008783 4B 08            [ 1]  295 	push	#0x08
      008785 4B 00            [ 1]  296 	push	#0x00
      008787 CD 9F FB         [ 4]  297 	call	_UART2_ClearFlag
      00878A 5B 02            [ 2]  298 	addw	sp, #2
      00878C                        299 00110$:
                                    300 ;	stm8s_it.c: 448: }
      00878C 80               [11]  301 	iret
                                    302 ;	stm8s_it.c: 497: INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
                                    303 ;	-----------------------------------------
                                    304 ;	 function ADC1_IRQHandler
                                    305 ;	-----------------------------------------
      00878D                        306 _ADC1_IRQHandler:
                                    307 ;	stm8s_it.c: 502: }
      00878D 80               [11]  308 	iret
                                    309 ;	stm8s_it.c: 523: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    310 ;	-----------------------------------------
                                    311 ;	 function TIM4_UPD_OVF_IRQHandler
                                    312 ;	-----------------------------------------
      00878E                        313 _TIM4_UPD_OVF_IRQHandler:
                                    314 ;	stm8s_it.c: 528: }
      00878E 80               [11]  315 	iret
                                    316 ;	stm8s_it.c: 536: INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
                                    317 ;	-----------------------------------------
                                    318 ;	 function EEPROM_EEC_IRQHandler
                                    319 ;	-----------------------------------------
      00878F                        320 _EEPROM_EEC_IRQHandler:
                                    321 ;	stm8s_it.c: 541: }
      00878F 80               [11]  322 	iret
                                    323 	.area CODE
                                    324 	.area CONST
                                    325 	.area INITIALIZER
                                    326 	.area CABS (ABS)
