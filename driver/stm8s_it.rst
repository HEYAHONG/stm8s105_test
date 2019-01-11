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
      00901B                         81 _TRAP_IRQHandler:
                                     82 ;	driver/stm8s_it.c: 74: }
      00901B 80               [11]   83 	iret
                                     84 ;	driver/stm8s_it.c: 81: INTERRUPT_HANDLER(TLI_IRQHandler, 0)
                                     85 ;	-----------------------------------------
                                     86 ;	 function TLI_IRQHandler
                                     87 ;	-----------------------------------------
      00901C                         88 _TLI_IRQHandler:
                                     89 ;	driver/stm8s_it.c: 87: }
      00901C 80               [11]   90 	iret
                                     91 ;	driver/stm8s_it.c: 94: INTERRUPT_HANDLER(AWU_IRQHandler, 1)
                                     92 ;	-----------------------------------------
                                     93 ;	 function AWU_IRQHandler
                                     94 ;	-----------------------------------------
      00901D                         95 _AWU_IRQHandler:
                                     96 ;	driver/stm8s_it.c: 99: }
      00901D 80               [11]   97 	iret
                                     98 ;	driver/stm8s_it.c: 106: INTERRUPT_HANDLER(CLK_IRQHandler, 2)
                                     99 ;	-----------------------------------------
                                    100 ;	 function CLK_IRQHandler
                                    101 ;	-----------------------------------------
      00901E                        102 _CLK_IRQHandler:
                                    103 ;	driver/stm8s_it.c: 111: }
      00901E 80               [11]  104 	iret
                                    105 ;	driver/stm8s_it.c: 118: INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
                                    106 ;	-----------------------------------------
                                    107 ;	 function EXTI_PORTA_IRQHandler
                                    108 ;	-----------------------------------------
      00901F                        109 _EXTI_PORTA_IRQHandler:
                                    110 ;	driver/stm8s_it.c: 123: }
      00901F 80               [11]  111 	iret
                                    112 ;	driver/stm8s_it.c: 130: INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
                                    113 ;	-----------------------------------------
                                    114 ;	 function EXTI_PORTB_IRQHandler
                                    115 ;	-----------------------------------------
      009020                        116 _EXTI_PORTB_IRQHandler:
                                    117 ;	driver/stm8s_it.c: 135: }
      009020 80               [11]  118 	iret
                                    119 ;	driver/stm8s_it.c: 142: INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
                                    120 ;	-----------------------------------------
                                    121 ;	 function EXTI_PORTC_IRQHandler
                                    122 ;	-----------------------------------------
      009021                        123 _EXTI_PORTC_IRQHandler:
                                    124 ;	driver/stm8s_it.c: 147: }
      009021 80               [11]  125 	iret
                                    126 ;	driver/stm8s_it.c: 155: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
                                    127 ;	-----------------------------------------
                                    128 ;	 function EXTI_PORTD_IRQHandler
                                    129 ;	-----------------------------------------
      009022                        130 _EXTI_PORTD_IRQHandler:
      009022 4F               [ 1]  131 	clr	a
      009023 62               [ 2]  132 	div	x, a
      009024 88               [ 1]  133 	push	a
                                    134 ;	driver/stm8s_it.c: 161: for(temp=0;temp<100;temp++) //延时去抖
      009025 A6 64            [ 1]  135 	ld	a, #0x64
      009027                        136 00107$:
                                    137 ;	driver/stm8s_it.c: 163: nop();nop();nop();nop();nop();
      009027 9D               [ 1]  138 	nop
      009028 9D               [ 1]  139 	nop
      009029 9D               [ 1]  140 	nop
      00902A 9D               [ 1]  141 	nop
      00902B 9D               [ 1]  142 	nop
      00902C 4A               [ 1]  143 	dec	a
                                    144 ;	driver/stm8s_it.c: 161: for(temp=0;temp<100;temp++) //延时去抖
      00902D 4D               [ 1]  145 	tnz	a
      00902E 26 F7            [ 1]  146 	jrne	00107$
                                    147 ;	driver/stm8s_it.c: 165: for(temp=0;temp<5;temp++)
      009030 0F 01            [ 1]  148 	clr	(0x01, sp)
      009032                        149 00108$:
                                    150 ;	driver/stm8s_it.c: 167: if(key_read(temp)==RESET) keycount[temp]++;
      009032 7B 01            [ 1]  151 	ld	a, (0x01, sp)
      009034 88               [ 1]  152 	push	a
      009035 CD 91 03         [ 4]  153 	call	_key_read
      009038 5B 01            [ 2]  154 	addw	sp, #1
      00903A 4D               [ 1]  155 	tnz	a
      00903B 26 08            [ 1]  156 	jrne	00109$
      00903D 5F               [ 1]  157 	clrw	x
      00903E 7B 01            [ 1]  158 	ld	a, (0x01, sp)
      009040 97               [ 1]  159 	ld	xl, a
      009041 1C 00 07         [ 2]  160 	addw	x, #_keycount
      009044 7C               [ 1]  161 	inc	(x)
      009045                        162 00109$:
                                    163 ;	driver/stm8s_it.c: 165: for(temp=0;temp<5;temp++)
      009045 0C 01            [ 1]  164 	inc	(0x01, sp)
      009047 7B 01            [ 1]  165 	ld	a, (0x01, sp)
      009049 A1 05            [ 1]  166 	cp	a, #0x05
      00904B 25 E5            [ 1]  167 	jrc	00108$
                                    168 ;	driver/stm8s_it.c: 170: }
      00904D 84               [ 1]  169 	pop	a
      00904E 80               [11]  170 	iret
                                    171 ;	driver/stm8s_it.c: 177: INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
                                    172 ;	-----------------------------------------
                                    173 ;	 function EXTI_PORTE_IRQHandler
                                    174 ;	-----------------------------------------
      00904F                        175 _EXTI_PORTE_IRQHandler:
                                    176 ;	driver/stm8s_it.c: 182: }
      00904F 80               [11]  177 	iret
                                    178 ;	driver/stm8s_it.c: 229: INTERRUPT_HANDLER(SPI_IRQHandler, 10)
                                    179 ;	-----------------------------------------
                                    180 ;	 function SPI_IRQHandler
                                    181 ;	-----------------------------------------
      009050                        182 _SPI_IRQHandler:
                                    183 ;	driver/stm8s_it.c: 234: }
      009050 80               [11]  184 	iret
                                    185 ;	driver/stm8s_it.c: 241: INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
                                    186 ;	-----------------------------------------
                                    187 ;	 function TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                    188 ;	-----------------------------------------
      009051                        189 _TIM1_UPD_OVF_TRG_BRK_IRQHandler:
                                    190 ;	driver/stm8s_it.c: 246: }
      009051 80               [11]  191 	iret
                                    192 ;	driver/stm8s_it.c: 253: INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
                                    193 ;	-----------------------------------------
                                    194 ;	 function TIM1_CAP_COM_IRQHandler
                                    195 ;	-----------------------------------------
      009052                        196 _TIM1_CAP_COM_IRQHandler:
                                    197 ;	driver/stm8s_it.c: 258: }
      009052 80               [11]  198 	iret
                                    199 ;	driver/stm8s_it.c: 291: INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
                                    200 ;	-----------------------------------------
                                    201 ;	 function TIM2_UPD_OVF_BRK_IRQHandler
                                    202 ;	-----------------------------------------
      009053                        203 _TIM2_UPD_OVF_BRK_IRQHandler:
                                    204 ;	driver/stm8s_it.c: 296: }
      009053 80               [11]  205 	iret
                                    206 ;	driver/stm8s_it.c: 303: INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
                                    207 ;	-----------------------------------------
                                    208 ;	 function TIM2_CAP_COM_IRQHandler
                                    209 ;	-----------------------------------------
      009054                        210 _TIM2_CAP_COM_IRQHandler:
                                    211 ;	driver/stm8s_it.c: 308: }
      009054 80               [11]  212 	iret
                                    213 ;	driver/stm8s_it.c: 318: INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
                                    214 ;	-----------------------------------------
                                    215 ;	 function TIM3_UPD_OVF_BRK_IRQHandler
                                    216 ;	-----------------------------------------
      009055                        217 _TIM3_UPD_OVF_BRK_IRQHandler:
                                    218 ;	driver/stm8s_it.c: 323: }
      009055 80               [11]  219 	iret
                                    220 ;	driver/stm8s_it.c: 330: INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
                                    221 ;	-----------------------------------------
                                    222 ;	 function TIM3_CAP_COM_IRQHandler
                                    223 ;	-----------------------------------------
      009056                        224 _TIM3_CAP_COM_IRQHandler:
                                    225 ;	driver/stm8s_it.c: 335: }
      009056 80               [11]  226 	iret
                                    227 ;	driver/stm8s_it.c: 400: INTERRUPT_HANDLER(I2C_IRQHandler, 19)
                                    228 ;	-----------------------------------------
                                    229 ;	 function I2C_IRQHandler
                                    230 ;	-----------------------------------------
      009057                        231 _I2C_IRQHandler:
                                    232 ;	driver/stm8s_it.c: 405: }
      009057 80               [11]  233 	iret
                                    234 ;	driver/stm8s_it.c: 413: INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
                                    235 ;	-----------------------------------------
                                    236 ;	 function UART2_TX_IRQHandler
                                    237 ;	-----------------------------------------
      009058                        238 _UART2_TX_IRQHandler:
                                    239 ;	driver/stm8s_it.c: 418: }
      009058 80               [11]  240 	iret
                                    241 ;	driver/stm8s_it.c: 425: INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
                                    242 ;	-----------------------------------------
                                    243 ;	 function UART2_RX_IRQHandler
                                    244 ;	-----------------------------------------
      009059                        245 _UART2_RX_IRQHandler:
      009059 4F               [ 1]  246 	clr	a
      00905A 62               [ 2]  247 	div	x, a
                                    248 ;	driver/stm8s_it.c: 430: if(UART2_GetITStatus(UART2_IT_RXNE))
      00905B 4B 55            [ 1]  249 	push	#0x55
      00905D 4B 02            [ 1]  250 	push	#0x02
      00905F CD A3 10         [ 4]  251 	call	_UART2_GetITStatus
      009062 5B 02            [ 2]  252 	addw	sp, #2
      009064 4D               [ 1]  253 	tnz	a
      009065 27 14            [ 1]  254 	jreq	00105$
                                    255 ;	driver/stm8s_it.c: 432: while(UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET);
      009067                        256 00101$:
      009067 4B 80            [ 1]  257 	push	#0x80
      009069 4B 00            [ 1]  258 	push	#0x00
      00906B CD A2 89         [ 4]  259 	call	_UART2_GetFlagStatus
      00906E 5B 02            [ 2]  260 	addw	sp, #2
      009070 4D               [ 1]  261 	tnz	a
      009071 27 F4            [ 1]  262 	jreq	00101$
                                    263 ;	driver/stm8s_it.c: 433: UART2_SendData8(UART2_ReceiveData8());
      009073 CD A2 1F         [ 4]  264 	call	_UART2_ReceiveData8
      009076 88               [ 1]  265 	push	a
      009077 CD A2 41         [ 4]  266 	call	_UART2_SendData8
      00907A 84               [ 1]  267 	pop	a
      00907B                        268 00105$:
                                    269 ;	driver/stm8s_it.c: 435: UART2_ClearITPendingBit(UART2_IT_RXNE);	
      00907B 4B 55            [ 1]  270 	push	#0x55
      00907D 4B 02            [ 1]  271 	push	#0x02
      00907F CD A3 AC         [ 4]  272 	call	_UART2_ClearITPendingBit
      009082 5B 02            [ 2]  273 	addw	sp, #2
                                    274 ;	driver/stm8s_it.c: 438: if(UART2_GetITStatus(UART2_IT_OR))
      009084 4B 35            [ 1]  275 	push	#0x35
      009086 4B 02            [ 1]  276 	push	#0x02
      009088 CD A3 10         [ 4]  277 	call	_UART2_GetITStatus
      00908B 5B 02            [ 2]  278 	addw	sp, #2
      00908D 4D               [ 1]  279 	tnz	a
      00908E 27 09            [ 1]  280 	jreq	00107$
                                    281 ;	driver/stm8s_it.c: 440: UART2_ClearITPendingBit(UART2_IT_OR);
      009090 4B 35            [ 1]  282 	push	#0x35
      009092 4B 02            [ 1]  283 	push	#0x02
      009094 CD A3 AC         [ 4]  284 	call	_UART2_ClearITPendingBit
      009097 5B 02            [ 2]  285 	addw	sp, #2
      009099                        286 00107$:
                                    287 ;	driver/stm8s_it.c: 442: if(UART2_GetFlagStatus(UART2_FLAG_OR_LHE))
      009099 4B 08            [ 1]  288 	push	#0x08
      00909B 4B 00            [ 1]  289 	push	#0x00
      00909D CD A2 89         [ 4]  290 	call	_UART2_GetFlagStatus
      0090A0 5B 02            [ 2]  291 	addw	sp, #2
      0090A2 4D               [ 1]  292 	tnz	a
      0090A3 27 09            [ 1]  293 	jreq	00110$
                                    294 ;	driver/stm8s_it.c: 444: UART2_ClearFlag(UART2_FLAG_OR_LHE);
      0090A5 4B 08            [ 1]  295 	push	#0x08
      0090A7 4B 00            [ 1]  296 	push	#0x00
      0090A9 CD A2 E2         [ 4]  297 	call	_UART2_ClearFlag
      0090AC 5B 02            [ 2]  298 	addw	sp, #2
      0090AE                        299 00110$:
                                    300 ;	driver/stm8s_it.c: 448: }
      0090AE 80               [11]  301 	iret
                                    302 ;	driver/stm8s_it.c: 497: INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
                                    303 ;	-----------------------------------------
                                    304 ;	 function ADC1_IRQHandler
                                    305 ;	-----------------------------------------
      0090AF                        306 _ADC1_IRQHandler:
                                    307 ;	driver/stm8s_it.c: 502: }
      0090AF 80               [11]  308 	iret
                                    309 ;	driver/stm8s_it.c: 523: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    310 ;	-----------------------------------------
                                    311 ;	 function TIM4_UPD_OVF_IRQHandler
                                    312 ;	-----------------------------------------
      0090B0                        313 _TIM4_UPD_OVF_IRQHandler:
                                    314 ;	driver/stm8s_it.c: 528: }
      0090B0 80               [11]  315 	iret
                                    316 ;	driver/stm8s_it.c: 536: INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
                                    317 ;	-----------------------------------------
                                    318 ;	 function EEPROM_EEC_IRQHandler
                                    319 ;	-----------------------------------------
      0090B1                        320 _EEPROM_EEC_IRQHandler:
                                    321 ;	driver/stm8s_it.c: 541: }
      0090B1 80               [11]  322 	iret
                                    323 	.area CODE
                                    324 	.area CONST
                                    325 	.area INITIALIZER
                                    326 	.area CABS (ABS)
