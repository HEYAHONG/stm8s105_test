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
                                     77 ;	driver/stm8s_it.c: 67: INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
                                     78 ;	-----------------------------------------
                                     79 ;	 function TRAP_IRQHandler
                                     80 ;	-----------------------------------------
      00900C                         81 _TRAP_IRQHandler:
                                     82 ;	driver/stm8s_it.c: 74: }
      00900C 80               [11]   83 	iret
                                     84 ;	driver/stm8s_it.c: 81: INTERRUPT_HANDLER(TLI_IRQHandler, 0)
                                     85 ;	-----------------------------------------
                                     86 ;	 function TLI_IRQHandler
                                     87 ;	-----------------------------------------
      00900D                         88 _TLI_IRQHandler:
                                     89 ;	driver/stm8s_it.c: 87: }
      00900D 80               [11]   90 	iret
                                     91 ;	driver/stm8s_it.c: 94: INTERRUPT_HANDLER(AWU_IRQHandler, 1)
                                     92 ;	-----------------------------------------
                                     93 ;	 function AWU_IRQHandler
                                     94 ;	-----------------------------------------
      00900E                         95 _AWU_IRQHandler:
                                     96 ;	driver/stm8s_it.c: 99: }
      00900E 80               [11]   97 	iret
                                     98 ;	driver/stm8s_it.c: 106: INTERRUPT_HANDLER(CLK_IRQHandler, 2)
                                     99 ;	-----------------------------------------
                                    100 ;	 function CLK_IRQHandler
                                    101 ;	-----------------------------------------
      00900F                        102 _CLK_IRQHandler:
                                    103 ;	driver/stm8s_it.c: 111: }
      00900F 80               [11]  104 	iret
                                    105 ;	driver/stm8s_it.c: 118: INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
                                    106 ;	-----------------------------------------
                                    107 ;	 function EXTI_PORTA_IRQHandler
                                    108 ;	-----------------------------------------
      009010                        109 _EXTI_PORTA_IRQHandler:
                                    110 ;	driver/stm8s_it.c: 123: }
      009010 80               [11]  111 	iret
                                    112 ;	driver/stm8s_it.c: 130: INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
                                    113 ;	-----------------------------------------
                                    114 ;	 function EXTI_PORTB_IRQHandler
                                    115 ;	-----------------------------------------
      009011                        116 _EXTI_PORTB_IRQHandler:
                                    117 ;	driver/stm8s_it.c: 135: }
      009011 80               [11]  118 	iret
                                    119 ;	driver/stm8s_it.c: 142: INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
                                    120 ;	-----------------------------------------
                                    121 ;	 function EXTI_PORTC_IRQHandler
                                    122 ;	-----------------------------------------
      009012                        123 _EXTI_PORTC_IRQHandler:
                                    124 ;	driver/stm8s_it.c: 147: }
      009012 80               [11]  125 	iret
                                    126 ;	driver/stm8s_it.c: 155: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
                                    127 ;	-----------------------------------------
                                    128 ;	 function EXTI_PORTD_IRQHandler
                                    129 ;	-----------------------------------------
      009013                        130 _EXTI_PORTD_IRQHandler:
      009013 4F               [ 1]  131 	clr	a
      009014 62               [ 2]  132 	div	x, a
      009015 88               [ 1]  133 	push	a
                                    134 ;	driver/stm8s_it.c: 161: for(temp=0;temp<100;temp++) //延时去抖
      009016 A6 64            [ 1]  135 	ld	a, #0x64
      009018                        136 00107$:
                                    137 ;	driver/stm8s_it.c: 163: nop();nop();nop();nop();nop();
      009018 9D               [ 1]  138 	nop
      009019 9D               [ 1]  139 	nop
      00901A 9D               [ 1]  140 	nop
      00901B 9D               [ 1]  141 	nop
      00901C 9D               [ 1]  142 	nop
      00901D 4A               [ 1]  143 	dec	a
                                    144 ;	driver/stm8s_it.c: 161: for(temp=0;temp<100;temp++) //延时去抖
      00901E 4D               [ 1]  145 	tnz	a
      00901F 26 F7            [ 1]  146 	jrne	00107$
                                    147 ;	driver/stm8s_it.c: 165: for(temp=0;temp<5;temp++)
      009021 0F 01            [ 1]  148 	clr	(0x01, sp)
      009023                        149 00108$:
                                    150 ;	driver/stm8s_it.c: 167: if(key_read(temp)==RESET) keycount[temp]++;
      009023 7B 01            [ 1]  151 	ld	a, (0x01, sp)
      009025 88               [ 1]  152 	push	a
      009026 CD 90 F4         [ 4]  153 	call	_key_read
      009029 5B 01            [ 2]  154 	addw	sp, #1
      00902B 4D               [ 1]  155 	tnz	a
      00902C 26 08            [ 1]  156 	jrne	00109$
      00902E 5F               [ 1]  157 	clrw	x
      00902F 7B 01            [ 1]  158 	ld	a, (0x01, sp)
      009031 97               [ 1]  159 	ld	xl, a
      009032 1C 00 07         [ 2]  160 	addw	x, #_keycount
      009035 7C               [ 1]  161 	inc	(x)
      009036                        162 00109$:
                                    163 ;	driver/stm8s_it.c: 165: for(temp=0;temp<5;temp++)
      009036 0C 01            [ 1]  164 	inc	(0x01, sp)
      009038 7B 01            [ 1]  165 	ld	a, (0x01, sp)
      00903A A1 05            [ 1]  166 	cp	a, #0x05
      00903C 25 E5            [ 1]  167 	jrc	00108$
                                    168 ;	driver/stm8s_it.c: 170: }
      00903E 84               [ 1]  169 	pop	a
      00903F 80               [11]  170 	iret
                                    171 ;	driver/stm8s_it.c: 177: INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
                                    172 ;	-----------------------------------------
                                    173 ;	 function EXTI_PORTE_IRQHandler
                                    174 ;	-----------------------------------------
      009040                        175 _EXTI_PORTE_IRQHandler:
                                    176 ;	driver/stm8s_it.c: 182: }
      009040 80               [11]  177 	iret
                                    178 ;	driver/stm8s_it.c: 229: INTERRUPT_HANDLER(SPI_IRQHandler, 10)
                                    179 ;	-----------------------------------------
                                    180 ;	 function SPI_IRQHandler
                                    181 ;	-----------------------------------------
      009041                        182 _SPI_IRQHandler:
                                    183 ;	driver/stm8s_it.c: 234: }
      009041 80               [11]  184 	iret
                                    185 ;	driver/stm8s_it.c: 241: INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
                                    186 ;	-----------------------------------------
                                    187 ;	 function TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                    188 ;	-----------------------------------------
      009042                        189 _TIM1_UPD_OVF_TRG_BRK_IRQHandler:
                                    190 ;	driver/stm8s_it.c: 246: }
      009042 80               [11]  191 	iret
                                    192 ;	driver/stm8s_it.c: 253: INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
                                    193 ;	-----------------------------------------
                                    194 ;	 function TIM1_CAP_COM_IRQHandler
                                    195 ;	-----------------------------------------
      009043                        196 _TIM1_CAP_COM_IRQHandler:
                                    197 ;	driver/stm8s_it.c: 258: }
      009043 80               [11]  198 	iret
                                    199 ;	driver/stm8s_it.c: 291: INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
                                    200 ;	-----------------------------------------
                                    201 ;	 function TIM2_UPD_OVF_BRK_IRQHandler
                                    202 ;	-----------------------------------------
      009044                        203 _TIM2_UPD_OVF_BRK_IRQHandler:
                                    204 ;	driver/stm8s_it.c: 296: }
      009044 80               [11]  205 	iret
                                    206 ;	driver/stm8s_it.c: 303: INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
                                    207 ;	-----------------------------------------
                                    208 ;	 function TIM2_CAP_COM_IRQHandler
                                    209 ;	-----------------------------------------
      009045                        210 _TIM2_CAP_COM_IRQHandler:
                                    211 ;	driver/stm8s_it.c: 308: }
      009045 80               [11]  212 	iret
                                    213 ;	driver/stm8s_it.c: 318: INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
                                    214 ;	-----------------------------------------
                                    215 ;	 function TIM3_UPD_OVF_BRK_IRQHandler
                                    216 ;	-----------------------------------------
      009046                        217 _TIM3_UPD_OVF_BRK_IRQHandler:
                                    218 ;	driver/stm8s_it.c: 323: }
      009046 80               [11]  219 	iret
                                    220 ;	driver/stm8s_it.c: 330: INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
                                    221 ;	-----------------------------------------
                                    222 ;	 function TIM3_CAP_COM_IRQHandler
                                    223 ;	-----------------------------------------
      009047                        224 _TIM3_CAP_COM_IRQHandler:
                                    225 ;	driver/stm8s_it.c: 335: }
      009047 80               [11]  226 	iret
                                    227 ;	driver/stm8s_it.c: 400: INTERRUPT_HANDLER(I2C_IRQHandler, 19)
                                    228 ;	-----------------------------------------
                                    229 ;	 function I2C_IRQHandler
                                    230 ;	-----------------------------------------
      009048                        231 _I2C_IRQHandler:
                                    232 ;	driver/stm8s_it.c: 405: }
      009048 80               [11]  233 	iret
                                    234 ;	driver/stm8s_it.c: 413: INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
                                    235 ;	-----------------------------------------
                                    236 ;	 function UART2_TX_IRQHandler
                                    237 ;	-----------------------------------------
      009049                        238 _UART2_TX_IRQHandler:
                                    239 ;	driver/stm8s_it.c: 418: }
      009049 80               [11]  240 	iret
                                    241 ;	driver/stm8s_it.c: 425: INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
                                    242 ;	-----------------------------------------
                                    243 ;	 function UART2_RX_IRQHandler
                                    244 ;	-----------------------------------------
      00904A                        245 _UART2_RX_IRQHandler:
      00904A 4F               [ 1]  246 	clr	a
      00904B 62               [ 2]  247 	div	x, a
                                    248 ;	driver/stm8s_it.c: 430: if(UART2_GetITStatus(UART2_IT_RXNE))
      00904C 4B 55            [ 1]  249 	push	#0x55
      00904E 4B 02            [ 1]  250 	push	#0x02
      009050 CD A3 01         [ 4]  251 	call	_UART2_GetITStatus
      009053 5B 02            [ 2]  252 	addw	sp, #2
      009055 4D               [ 1]  253 	tnz	a
      009056 27 14            [ 1]  254 	jreq	00105$
                                    255 ;	driver/stm8s_it.c: 432: while(UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET);
      009058                        256 00101$:
      009058 4B 80            [ 1]  257 	push	#0x80
      00905A 4B 00            [ 1]  258 	push	#0x00
      00905C CD A2 7A         [ 4]  259 	call	_UART2_GetFlagStatus
      00905F 5B 02            [ 2]  260 	addw	sp, #2
      009061 4D               [ 1]  261 	tnz	a
      009062 27 F4            [ 1]  262 	jreq	00101$
                                    263 ;	driver/stm8s_it.c: 433: UART2_SendData8(UART2_ReceiveData8());
      009064 CD A2 10         [ 4]  264 	call	_UART2_ReceiveData8
      009067 88               [ 1]  265 	push	a
      009068 CD A2 32         [ 4]  266 	call	_UART2_SendData8
      00906B 84               [ 1]  267 	pop	a
      00906C                        268 00105$:
                                    269 ;	driver/stm8s_it.c: 435: UART2_ClearITPendingBit(UART2_IT_RXNE);	
      00906C 4B 55            [ 1]  270 	push	#0x55
      00906E 4B 02            [ 1]  271 	push	#0x02
      009070 CD A3 9D         [ 4]  272 	call	_UART2_ClearITPendingBit
      009073 5B 02            [ 2]  273 	addw	sp, #2
                                    274 ;	driver/stm8s_it.c: 438: if(UART2_GetITStatus(UART2_IT_OR))
      009075 4B 35            [ 1]  275 	push	#0x35
      009077 4B 02            [ 1]  276 	push	#0x02
      009079 CD A3 01         [ 4]  277 	call	_UART2_GetITStatus
      00907C 5B 02            [ 2]  278 	addw	sp, #2
      00907E 4D               [ 1]  279 	tnz	a
      00907F 27 09            [ 1]  280 	jreq	00107$
                                    281 ;	driver/stm8s_it.c: 440: UART2_ClearITPendingBit(UART2_IT_OR);
      009081 4B 35            [ 1]  282 	push	#0x35
      009083 4B 02            [ 1]  283 	push	#0x02
      009085 CD A3 9D         [ 4]  284 	call	_UART2_ClearITPendingBit
      009088 5B 02            [ 2]  285 	addw	sp, #2
      00908A                        286 00107$:
                                    287 ;	driver/stm8s_it.c: 442: if(UART2_GetFlagStatus(UART2_FLAG_OR_LHE))
      00908A 4B 08            [ 1]  288 	push	#0x08
      00908C 4B 00            [ 1]  289 	push	#0x00
      00908E CD A2 7A         [ 4]  290 	call	_UART2_GetFlagStatus
      009091 5B 02            [ 2]  291 	addw	sp, #2
      009093 4D               [ 1]  292 	tnz	a
      009094 27 09            [ 1]  293 	jreq	00110$
                                    294 ;	driver/stm8s_it.c: 444: UART2_ClearFlag(UART2_FLAG_OR_LHE);
      009096 4B 08            [ 1]  295 	push	#0x08
      009098 4B 00            [ 1]  296 	push	#0x00
      00909A CD A2 D3         [ 4]  297 	call	_UART2_ClearFlag
      00909D 5B 02            [ 2]  298 	addw	sp, #2
      00909F                        299 00110$:
                                    300 ;	driver/stm8s_it.c: 448: }
      00909F 80               [11]  301 	iret
                                    302 ;	driver/stm8s_it.c: 497: INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
                                    303 ;	-----------------------------------------
                                    304 ;	 function ADC1_IRQHandler
                                    305 ;	-----------------------------------------
      0090A0                        306 _ADC1_IRQHandler:
                                    307 ;	driver/stm8s_it.c: 502: }
      0090A0 80               [11]  308 	iret
                                    309 ;	driver/stm8s_it.c: 523: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    310 ;	-----------------------------------------
                                    311 ;	 function TIM4_UPD_OVF_IRQHandler
                                    312 ;	-----------------------------------------
      0090A1                        313 _TIM4_UPD_OVF_IRQHandler:
                                    314 ;	driver/stm8s_it.c: 528: }
      0090A1 80               [11]  315 	iret
                                    316 ;	driver/stm8s_it.c: 536: INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
                                    317 ;	-----------------------------------------
                                    318 ;	 function EEPROM_EEC_IRQHandler
                                    319 ;	-----------------------------------------
      0090A2                        320 _EEPROM_EEC_IRQHandler:
                                    321 ;	driver/stm8s_it.c: 541: }
      0090A2 80               [11]  322 	iret
                                    323 	.area CODE
                                    324 	.area CONST
                                    325 	.area INITIALIZER
                                    326 	.area CABS (ABS)
