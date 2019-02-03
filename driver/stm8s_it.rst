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
                                     13 	.globl _modbus_process
                                     14 	.globl _key_read
                                     15 	.globl _UART2_ClearITPendingBit
                                     16 	.globl _UART2_GetITStatus
                                     17 	.globl _UART2_ReceiveData8
                                     18 	.globl _last_uart_receive_time
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
      000097                         47 _last_uart_receive_time::
      000097                         48 	.ds 1
                                     49 ;--------------------------------------------------------
                                     50 ; absolute external ram data
                                     51 ;--------------------------------------------------------
                                     52 	.area DABS (ABS)
                                     53 
                                     54 ; default segment ordering for linker
                                     55 	.area HOME
                                     56 	.area GSINIT
                                     57 	.area GSFINAL
                                     58 	.area CONST
                                     59 	.area INITIALIZER
                                     60 	.area CODE
                                     61 
                                     62 ;--------------------------------------------------------
                                     63 ; global & static initialisations
                                     64 ;--------------------------------------------------------
                                     65 	.area HOME
                                     66 	.area GSINIT
                                     67 	.area GSFINAL
                                     68 	.area GSINIT
                                     69 ;--------------------------------------------------------
                                     70 ; Home
                                     71 ;--------------------------------------------------------
                                     72 	.area HOME
                                     73 	.area HOME
                                     74 ;--------------------------------------------------------
                                     75 ; code
                                     76 ;--------------------------------------------------------
                                     77 	.area CODE
                                     78 ;	driver/stm8s_it.c: 67: INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
                                     79 ;	-----------------------------------------
                                     80 ;	 function TRAP_IRQHandler
                                     81 ;	-----------------------------------------
      008E41                         82 _TRAP_IRQHandler:
                                     83 ;	driver/stm8s_it.c: 74: }
      008E41 80               [11]   84 	iret
                                     85 ;	driver/stm8s_it.c: 81: INTERRUPT_HANDLER(TLI_IRQHandler, 0)
                                     86 ;	-----------------------------------------
                                     87 ;	 function TLI_IRQHandler
                                     88 ;	-----------------------------------------
      008E42                         89 _TLI_IRQHandler:
                                     90 ;	driver/stm8s_it.c: 87: }
      008E42 80               [11]   91 	iret
                                     92 ;	driver/stm8s_it.c: 94: INTERRUPT_HANDLER(AWU_IRQHandler, 1)
                                     93 ;	-----------------------------------------
                                     94 ;	 function AWU_IRQHandler
                                     95 ;	-----------------------------------------
      008E43                         96 _AWU_IRQHandler:
                                     97 ;	driver/stm8s_it.c: 99: }
      008E43 80               [11]   98 	iret
                                     99 ;	driver/stm8s_it.c: 106: INTERRUPT_HANDLER(CLK_IRQHandler, 2)
                                    100 ;	-----------------------------------------
                                    101 ;	 function CLK_IRQHandler
                                    102 ;	-----------------------------------------
      008E44                        103 _CLK_IRQHandler:
                                    104 ;	driver/stm8s_it.c: 111: }
      008E44 80               [11]  105 	iret
                                    106 ;	driver/stm8s_it.c: 118: INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
                                    107 ;	-----------------------------------------
                                    108 ;	 function EXTI_PORTA_IRQHandler
                                    109 ;	-----------------------------------------
      008E45                        110 _EXTI_PORTA_IRQHandler:
                                    111 ;	driver/stm8s_it.c: 123: }
      008E45 80               [11]  112 	iret
                                    113 ;	driver/stm8s_it.c: 130: INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
                                    114 ;	-----------------------------------------
                                    115 ;	 function EXTI_PORTB_IRQHandler
                                    116 ;	-----------------------------------------
      008E46                        117 _EXTI_PORTB_IRQHandler:
                                    118 ;	driver/stm8s_it.c: 135: }
      008E46 80               [11]  119 	iret
                                    120 ;	driver/stm8s_it.c: 142: INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
                                    121 ;	-----------------------------------------
                                    122 ;	 function EXTI_PORTC_IRQHandler
                                    123 ;	-----------------------------------------
      008E47                        124 _EXTI_PORTC_IRQHandler:
                                    125 ;	driver/stm8s_it.c: 147: }
      008E47 80               [11]  126 	iret
                                    127 ;	driver/stm8s_it.c: 155: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
                                    128 ;	-----------------------------------------
                                    129 ;	 function EXTI_PORTD_IRQHandler
                                    130 ;	-----------------------------------------
      008E48                        131 _EXTI_PORTD_IRQHandler:
      008E48 4F               [ 1]  132 	clr	a
      008E49 62               [ 2]  133 	div	x, a
                                    134 ;	driver/stm8s_it.c: 161: for(temp=0;temp<500;temp++) //延时去抖
      008E4A AE 01 F4         [ 2]  135 	ldw	x, #0x01f4
      008E4D                        136 00107$:
                                    137 ;	driver/stm8s_it.c: 163: nop();nop();nop();nop();nop();
      008E4D 9D               [ 1]  138 	nop
      008E4E 9D               [ 1]  139 	nop
      008E4F 9D               [ 1]  140 	nop
      008E50 9D               [ 1]  141 	nop
      008E51 9D               [ 1]  142 	nop
      008E52 5A               [ 2]  143 	decw	x
                                    144 ;	driver/stm8s_it.c: 161: for(temp=0;temp<500;temp++) //延时去抖
                                    145 ;	driver/stm8s_it.c: 165: for(temp=0;temp<5;temp++)
      008E53 5D               [ 2]  146 	tnzw	x
      008E54 26 F7            [ 1]  147 	jrne	00107$
      008E56                        148 00108$:
                                    149 ;	driver/stm8s_it.c: 167: if(key_read(temp)==RESET) keycount[temp]++;
      008E56 9F               [ 1]  150 	ld	a, xl
      008E57 89               [ 2]  151 	pushw	x
      008E58 88               [ 1]  152 	push	a
      008E59 CD 94 4A         [ 4]  153 	call	_key_read
      008E5C 5B 01            [ 2]  154 	addw	sp, #1
      008E5E 85               [ 2]  155 	popw	x
      008E5F 4D               [ 1]  156 	tnz	a
      008E60 26 0B            [ 1]  157 	jrne	00109$
      008E62 90 93            [ 1]  158 	ldw	y, x
      008E64 72 A9 00 99      [ 2]  159 	addw	y, #_keycount
      008E68 90 F6            [ 1]  160 	ld	a, (y)
      008E6A 4C               [ 1]  161 	inc	a
      008E6B 90 F7            [ 1]  162 	ld	(y), a
      008E6D                        163 00109$:
                                    164 ;	driver/stm8s_it.c: 165: for(temp=0;temp<5;temp++)
      008E6D 5C               [ 1]  165 	incw	x
      008E6E A3 00 05         [ 2]  166 	cpw	x, #0x0005
      008E71 25 E3            [ 1]  167 	jrc	00108$
                                    168 ;	driver/stm8s_it.c: 170: }
      008E73 80               [11]  169 	iret
                                    170 ;	driver/stm8s_it.c: 177: INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
                                    171 ;	-----------------------------------------
                                    172 ;	 function EXTI_PORTE_IRQHandler
                                    173 ;	-----------------------------------------
      008E74                        174 _EXTI_PORTE_IRQHandler:
                                    175 ;	driver/stm8s_it.c: 182: }
      008E74 80               [11]  176 	iret
                                    177 ;	driver/stm8s_it.c: 229: INTERRUPT_HANDLER(SPI_IRQHandler, 10)
                                    178 ;	-----------------------------------------
                                    179 ;	 function SPI_IRQHandler
                                    180 ;	-----------------------------------------
      008E75                        181 _SPI_IRQHandler:
                                    182 ;	driver/stm8s_it.c: 234: }
      008E75 80               [11]  183 	iret
                                    184 ;	driver/stm8s_it.c: 241: INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
                                    185 ;	-----------------------------------------
                                    186 ;	 function TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                    187 ;	-----------------------------------------
      008E76                        188 _TIM1_UPD_OVF_TRG_BRK_IRQHandler:
                                    189 ;	driver/stm8s_it.c: 246: }
      008E76 80               [11]  190 	iret
                                    191 ;	driver/stm8s_it.c: 253: INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
                                    192 ;	-----------------------------------------
                                    193 ;	 function TIM1_CAP_COM_IRQHandler
                                    194 ;	-----------------------------------------
      008E77                        195 _TIM1_CAP_COM_IRQHandler:
                                    196 ;	driver/stm8s_it.c: 258: }
      008E77 80               [11]  197 	iret
                                    198 ;	driver/stm8s_it.c: 291: INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
                                    199 ;	-----------------------------------------
                                    200 ;	 function TIM2_UPD_OVF_BRK_IRQHandler
                                    201 ;	-----------------------------------------
      008E78                        202 _TIM2_UPD_OVF_BRK_IRQHandler:
                                    203 ;	driver/stm8s_it.c: 296: }
      008E78 80               [11]  204 	iret
                                    205 ;	driver/stm8s_it.c: 303: INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
                                    206 ;	-----------------------------------------
                                    207 ;	 function TIM2_CAP_COM_IRQHandler
                                    208 ;	-----------------------------------------
      008E79                        209 _TIM2_CAP_COM_IRQHandler:
                                    210 ;	driver/stm8s_it.c: 308: }
      008E79 80               [11]  211 	iret
                                    212 ;	driver/stm8s_it.c: 318: INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
                                    213 ;	-----------------------------------------
                                    214 ;	 function TIM3_UPD_OVF_BRK_IRQHandler
                                    215 ;	-----------------------------------------
      008E7A                        216 _TIM3_UPD_OVF_BRK_IRQHandler:
                                    217 ;	driver/stm8s_it.c: 323: }
      008E7A 80               [11]  218 	iret
                                    219 ;	driver/stm8s_it.c: 330: INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
                                    220 ;	-----------------------------------------
                                    221 ;	 function TIM3_CAP_COM_IRQHandler
                                    222 ;	-----------------------------------------
      008E7B                        223 _TIM3_CAP_COM_IRQHandler:
                                    224 ;	driver/stm8s_it.c: 335: }
      008E7B 80               [11]  225 	iret
                                    226 ;	driver/stm8s_it.c: 400: INTERRUPT_HANDLER(I2C_IRQHandler, 19)
                                    227 ;	-----------------------------------------
                                    228 ;	 function I2C_IRQHandler
                                    229 ;	-----------------------------------------
      008E7C                        230 _I2C_IRQHandler:
                                    231 ;	driver/stm8s_it.c: 405: }
      008E7C 80               [11]  232 	iret
                                    233 ;	driver/stm8s_it.c: 413: INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
                                    234 ;	-----------------------------------------
                                    235 ;	 function UART2_TX_IRQHandler
                                    236 ;	-----------------------------------------
      008E7D                        237 _UART2_TX_IRQHandler:
                                    238 ;	driver/stm8s_it.c: 418: }
      008E7D 80               [11]  239 	iret
                                    240 ;	driver/stm8s_it.c: 427: INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
                                    241 ;	-----------------------------------------
                                    242 ;	 function UART2_RX_IRQHandler
                                    243 ;	-----------------------------------------
      008E7E                        244 _UART2_RX_IRQHandler:
      008E7E 4F               [ 1]  245 	clr	a
      008E7F 62               [ 2]  246 	div	x, a
      008E80 52 04            [ 2]  247 	sub	sp, #4
                                    248 ;	driver/stm8s_it.c: 432: if(UART2_GetITStatus(UART2_IT_RXNE))
      008E82 4B 55            [ 1]  249 	push	#0x55
      008E84 4B 02            [ 1]  250 	push	#0x02
      008E86 CD B4 0B         [ 4]  251 	call	_UART2_GetITStatus
      008E89 5B 02            [ 2]  252 	addw	sp, #2
      008E8B 4D               [ 1]  253 	tnz	a
      008E8C 27 47            [ 1]  254 	jreq	00105$
                                    255 ;	driver/stm8s_it.c: 437: if(ds_time.second/2 == last_uart_receive_time/2)
      008E8E AE 00 07         [ 2]  256 	ldw	x, #_ds_time+6
      008E91 F6               [ 1]  257 	ld	a, (x)
      008E92 5F               [ 1]  258 	clrw	x
      008E93 97               [ 1]  259 	ld	xl, a
      008E94 4B 02            [ 1]  260 	push	#0x02
      008E96 4B 00            [ 1]  261 	push	#0x00
      008E98 89               [ 2]  262 	pushw	x
      008E99 CD B9 AC         [ 4]  263 	call	__divsint
      008E9C 5B 04            [ 2]  264 	addw	sp, #4
      008E9E 1F 03            [ 2]  265 	ldw	(0x03, sp), x
      008EA0 5F               [ 1]  266 	clrw	x
      008EA1 C6 00 97         [ 1]  267 	ld	a, _last_uart_receive_time+0
      008EA4 97               [ 1]  268 	ld	xl, a
      008EA5 4B 02            [ 1]  269 	push	#0x02
      008EA7 4B 00            [ 1]  270 	push	#0x00
      008EA9 89               [ 2]  271 	pushw	x
      008EAA CD B9 AC         [ 4]  272 	call	__divsint
      008EAD 5B 04            [ 2]  273 	addw	sp, #4
      008EAF 1F 01            [ 2]  274 	ldw	(0x01, sp), x
      008EB1 1E 03            [ 2]  275 	ldw	x, (0x03, sp)
      008EB3 13 01            [ 2]  276 	cpw	x, (0x01, sp)
      008EB5 26 14            [ 1]  277 	jrne	00102$
                                    278 ;	driver/stm8s_it.c: 439: modbus_buff[modbus_status]=UART2_ReceiveData8();
      008EB7 5F               [ 1]  279 	clrw	x
      008EB8 C6 00 98         [ 1]  280 	ld	a, _modbus_status+0
      008EBB 97               [ 1]  281 	ld	xl, a
      008EBC 1C 00 11         [ 2]  282 	addw	x, #_modbus_buff
      008EBF 89               [ 2]  283 	pushw	x
      008EC0 CD B3 1A         [ 4]  284 	call	_UART2_ReceiveData8
      008EC3 85               [ 2]  285 	popw	x
      008EC4 F7               [ 1]  286 	ld	(x), a
                                    287 ;	driver/stm8s_it.c: 440: modbus_status++;
      008EC5 72 5C 00 98      [ 1]  288 	inc	_modbus_status+0
      008EC9 20 0A            [ 2]  289 	jra	00105$
      008ECB                        290 00102$:
                                    291 ;	driver/stm8s_it.c: 444: modbus_buff[0]=UART2_ReceiveData8();
      008ECB CD B3 1A         [ 4]  292 	call	_UART2_ReceiveData8
      008ECE C7 00 11         [ 1]  293 	ld	_modbus_buff, a
                                    294 ;	driver/stm8s_it.c: 445: modbus_status=1;
      008ED1 35 01 00 98      [ 1]  295 	mov	_modbus_status+0, #0x01
      008ED5                        296 00105$:
                                    297 ;	driver/stm8s_it.c: 450: if(modbus_status>7)
      008ED5 C6 00 98         [ 1]  298 	ld	a, _modbus_status+0
      008ED8 A1 07            [ 1]  299 	cp	a, #0x07
      008EDA 23 07            [ 2]  300 	jrule	00107$
                                    301 ;	driver/stm8s_it.c: 452: modbus_process();
      008EDC CD 92 1B         [ 4]  302 	call	_modbus_process
                                    303 ;	driver/stm8s_it.c: 453: modbus_status=0;
      008EDF 72 5F 00 98      [ 1]  304 	clr	_modbus_status+0
      008EE3                        305 00107$:
                                    306 ;	driver/stm8s_it.c: 456: last_uart_receive_time=ds_time.second;
      008EE3 AE 00 07         [ 2]  307 	ldw	x, #_ds_time+6
      008EE6 F6               [ 1]  308 	ld	a, (x)
      008EE7 C7 00 97         [ 1]  309 	ld	_last_uart_receive_time+0, a
                                    310 ;	driver/stm8s_it.c: 457: UART2_ClearITPendingBit(UART2_IT_RXNE);
      008EEA 4B 55            [ 1]  311 	push	#0x55
      008EEC 4B 02            [ 1]  312 	push	#0x02
      008EEE CD B4 A7         [ 4]  313 	call	_UART2_ClearITPendingBit
      008EF1 5B 02            [ 2]  314 	addw	sp, #2
                                    315 ;	driver/stm8s_it.c: 460: if(UART2_GetITStatus(UART2_IT_OR))
      008EF3 4B 35            [ 1]  316 	push	#0x35
      008EF5 4B 02            [ 1]  317 	push	#0x02
      008EF7 CD B4 0B         [ 4]  318 	call	_UART2_GetITStatus
      008EFA 5B 02            [ 2]  319 	addw	sp, #2
      008EFC 4D               [ 1]  320 	tnz	a
      008EFD 27 09            [ 1]  321 	jreq	00110$
                                    322 ;	driver/stm8s_it.c: 462: UART2_ClearITPendingBit(UART2_IT_OR);
      008EFF 4B 35            [ 1]  323 	push	#0x35
      008F01 4B 02            [ 1]  324 	push	#0x02
      008F03 CD B4 A7         [ 4]  325 	call	_UART2_ClearITPendingBit
      008F06 5B 02            [ 2]  326 	addw	sp, #2
      008F08                        327 00110$:
                                    328 ;	driver/stm8s_it.c: 465: }
      008F08 5B 04            [ 2]  329 	addw	sp, #4
      008F0A 80               [11]  330 	iret
                                    331 ;	driver/stm8s_it.c: 514: INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
                                    332 ;	-----------------------------------------
                                    333 ;	 function ADC1_IRQHandler
                                    334 ;	-----------------------------------------
      008F0B                        335 _ADC1_IRQHandler:
                                    336 ;	driver/stm8s_it.c: 519: }
      008F0B 80               [11]  337 	iret
                                    338 ;	driver/stm8s_it.c: 540: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    339 ;	-----------------------------------------
                                    340 ;	 function TIM4_UPD_OVF_IRQHandler
                                    341 ;	-----------------------------------------
      008F0C                        342 _TIM4_UPD_OVF_IRQHandler:
                                    343 ;	driver/stm8s_it.c: 545: }
      008F0C 80               [11]  344 	iret
                                    345 ;	driver/stm8s_it.c: 553: INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
                                    346 ;	-----------------------------------------
                                    347 ;	 function EEPROM_EEC_IRQHandler
                                    348 ;	-----------------------------------------
      008F0D                        349 _EEPROM_EEC_IRQHandler:
                                    350 ;	driver/stm8s_it.c: 558: }
      008F0D 80               [11]  351 	iret
                                    352 	.area CODE
                                    353 	.area CONST
                                    354 	.area INITIALIZER
      008704                        355 __xinit__last_uart_receive_time:
      008704 00                     356 	.db #0x00	; 0
                                    357 	.area CABS (ABS)
