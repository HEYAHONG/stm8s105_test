                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module dht12
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _i2c_read
                                     12 	.globl _I2C_Read
                                     13 	.globl _RcvByte
                                     14 	.globl _SendByte
                                     15 	.globl _I2C_nAck
                                     16 	.globl _I2C_Rack
                                     17 	.globl _I2C_Stop
                                     18 	.globl _I2C_Start
                                     19 	.globl _I2CDataInOut
                                     20 	.globl __delay_5us
                                     21 	.globl _i2c_deinit
                                     22 	.globl _i2c_init
                                     23 	.globl _GPIO_ReadInputPin
                                     24 	.globl _GPIO_WriteLow
                                     25 	.globl _GPIO_WriteHigh
                                     26 	.globl _GPIO_Init
                                     27 	.globl _ReadDHT12
                                     28 ;--------------------------------------------------------
                                     29 ; ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area DATA
                                     32 ;--------------------------------------------------------
                                     33 ; ram data
                                     34 ;--------------------------------------------------------
                                     35 	.area INITIALIZED
                                     36 ;--------------------------------------------------------
                                     37 ; absolute external ram data
                                     38 ;--------------------------------------------------------
                                     39 	.area DABS (ABS)
                                     40 
                                     41 ; default segment ordering for linker
                                     42 	.area HOME
                                     43 	.area GSINIT
                                     44 	.area GSFINAL
                                     45 	.area CONST
                                     46 	.area INITIALIZER
                                     47 	.area CODE
                                     48 
                                     49 ;--------------------------------------------------------
                                     50 ; global & static initialisations
                                     51 ;--------------------------------------------------------
                                     52 	.area HOME
                                     53 	.area GSINIT
                                     54 	.area GSFINAL
                                     55 	.area GSINIT
                                     56 ;--------------------------------------------------------
                                     57 ; Home
                                     58 ;--------------------------------------------------------
                                     59 	.area HOME
                                     60 	.area HOME
                                     61 ;--------------------------------------------------------
                                     62 ; code
                                     63 ;--------------------------------------------------------
                                     64 	.area CODE
                                     65 ;	driver/dht12.c: 3: void i2c_init()
                                     66 ;	-----------------------------------------
                                     67 ;	 function i2c_init
                                     68 ;	-----------------------------------------
      008889                         69 _i2c_init:
                                     70 ;	driver/dht12.c: 5: GPIO_Init(GPIOB,GPIO_PIN_4,GPIO_MODE_OUT_OD_LOW_FAST);
      008889 4B A0            [ 1]   71 	push	#0xa0
      00888B 4B 10            [ 1]   72 	push	#0x10
      00888D 4B 05            [ 1]   73 	push	#0x05
      00888F 4B 50            [ 1]   74 	push	#0x50
      008891 CD 94 CE         [ 4]   75 	call	_GPIO_Init
      008894 5B 04            [ 2]   76 	addw	sp, #4
                                     77 ;	driver/dht12.c: 6: GPIO_Init(GPIOB,GPIO_PIN_5,GPIO_MODE_OUT_OD_LOW_FAST);
      008896 4B A0            [ 1]   78 	push	#0xa0
      008898 4B 20            [ 1]   79 	push	#0x20
      00889A 4B 05            [ 1]   80 	push	#0x05
      00889C 4B 50            [ 1]   81 	push	#0x50
      00889E CD 94 CE         [ 4]   82 	call	_GPIO_Init
      0088A1 5B 04            [ 2]   83 	addw	sp, #4
                                     84 ;	driver/dht12.c: 7: }
      0088A3 81               [ 4]   85 	ret
                                     86 ;	driver/dht12.c: 8: void i2c_deinit() 
                                     87 ;	-----------------------------------------
                                     88 ;	 function i2c_deinit
                                     89 ;	-----------------------------------------
      0088A4                         90 _i2c_deinit:
                                     91 ;	driver/dht12.c: 10: GPIO_Init(GPIOB,GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
      0088A4 4B 00            [ 1]   92 	push	#0x00
      0088A6 4B 10            [ 1]   93 	push	#0x10
      0088A8 4B 05            [ 1]   94 	push	#0x05
      0088AA 4B 50            [ 1]   95 	push	#0x50
      0088AC CD 94 CE         [ 4]   96 	call	_GPIO_Init
      0088AF 5B 04            [ 2]   97 	addw	sp, #4
                                     98 ;	driver/dht12.c: 11: GPIO_Init(GPIOB,GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);
      0088B1 4B 00            [ 1]   99 	push	#0x00
      0088B3 4B 20            [ 1]  100 	push	#0x20
      0088B5 4B 05            [ 1]  101 	push	#0x05
      0088B7 4B 50            [ 1]  102 	push	#0x50
      0088B9 CD 94 CE         [ 4]  103 	call	_GPIO_Init
      0088BC 5B 04            [ 2]  104 	addw	sp, #4
                                    105 ;	driver/dht12.c: 12: }
      0088BE 81               [ 4]  106 	ret
                                    107 ;	driver/dht12.c: 14: void _delay_5us(unsigned int xx)
                                    108 ;	-----------------------------------------
                                    109 ;	 function _delay_5us
                                    110 ;	-----------------------------------------
      0088BF                        111 __delay_5us:
      0088BF 52 04            [ 2]  112 	sub	sp, #4
                                    113 ;	driver/dht12.c: 16: unsigned int yy = 0;
      0088C1 16 07            [ 2]  114 	ldw	y, (0x07, sp)
      0088C3 17 03            [ 2]  115 	ldw	(0x03, sp), y
      0088C5                        116 00107$:
                                    117 ;	driver/dht12.c: 17: for(;xx>0;xx--)
      0088C5 1E 03            [ 2]  118 	ldw	x, (0x03, sp)
      0088C7 27 11            [ 1]  119 	jreq	00109$
                                    120 ;	driver/dht12.c: 19: for(yy = 0;yy<1;yy++)
      0088C9 5F               [ 1]  121 	clrw	x
      0088CA 5C               [ 1]  122 	incw	x
      0088CB                        123 00105$:
                                    124 ;	driver/dht12.c: 20: nop();
      0088CB 9D               [ 1]  125 	nop
      0088CC 5A               [ 2]  126 	decw	x
                                    127 ;	driver/dht12.c: 19: for(yy = 0;yy<1;yy++)
      0088CD 1F 01            [ 2]  128 	ldw	(0x01, sp), x
      0088CF 90 93            [ 1]  129 	ldw	y, x
      0088D1 26 F8            [ 1]  130 	jrne	00105$
                                    131 ;	driver/dht12.c: 17: for(;xx>0;xx--)
      0088D3 1E 03            [ 2]  132 	ldw	x, (0x03, sp)
      0088D5 5A               [ 2]  133 	decw	x
      0088D6 1F 03            [ 2]  134 	ldw	(0x03, sp), x
      0088D8 20 EB            [ 2]  135 	jra	00107$
      0088DA                        136 00109$:
                                    137 ;	driver/dht12.c: 32: }
      0088DA 5B 04            [ 2]  138 	addw	sp, #4
      0088DC 81               [ 4]  139 	ret
                                    140 ;	driver/dht12.c: 60: void I2CDataInOut(bool InOut)  
                                    141 ;	-----------------------------------------
                                    142 ;	 function I2CDataInOut
                                    143 ;	-----------------------------------------
      0088DD                        144 _I2CDataInOut:
                                    145 ;	driver/dht12.c: 64: if(InOut)  
      0088DD 0D 03            [ 1]  146 	tnz	(0x03, sp)
      0088DF 27 0E            [ 1]  147 	jreq	00102$
                                    148 ;	driver/dht12.c: 68: GPIO_Init(I2C_PORT,I2CSDA,GPIO_MODE_IN_FL_NO_IT);  
      0088E1 4B 00            [ 1]  149 	push	#0x00
      0088E3 4B 20            [ 1]  150 	push	#0x20
      0088E5 4B 05            [ 1]  151 	push	#0x05
      0088E7 4B 50            [ 1]  152 	push	#0x50
      0088E9 CD 94 CE         [ 4]  153 	call	_GPIO_Init
      0088EC 5B 04            [ 2]  154 	addw	sp, #4
      0088EE 81               [ 4]  155 	ret
      0088EF                        156 00102$:
                                    157 ;	driver/dht12.c: 76: GPIO_Init(I2C_PORT,I2CSDA,GPIO_MODE_OUT_PP_LOW_FAST);  
      0088EF 4B E0            [ 1]  158 	push	#0xe0
      0088F1 4B 20            [ 1]  159 	push	#0x20
      0088F3 4B 05            [ 1]  160 	push	#0x05
      0088F5 4B 50            [ 1]  161 	push	#0x50
      0088F7 CD 94 CE         [ 4]  162 	call	_GPIO_Init
      0088FA 5B 04            [ 2]  163 	addw	sp, #4
                                    164 ;	driver/dht12.c: 80: }  
      0088FC 81               [ 4]  165 	ret
                                    166 ;	driver/dht12.c: 92: void I2C_Start (void)  
                                    167 ;	-----------------------------------------
                                    168 ;	 function I2C_Start
                                    169 ;	-----------------------------------------
      0088FD                        170 _I2C_Start:
                                    171 ;	driver/dht12.c: 95: I2CDataInOut(I2CDataOut);
      0088FD 4B 00            [ 1]  172 	push	#0x00
      0088FF CD 88 DD         [ 4]  173 	call	_I2CDataInOut
      008902 84               [ 1]  174 	pop	a
                                    175 ;	driver/dht12.c: 97: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
      008903 4B 20            [ 1]  176 	push	#0x20
      008905 4B 05            [ 1]  177 	push	#0x05
      008907 4B 50            [ 1]  178 	push	#0x50
      008909 CD 95 49         [ 4]  179 	call	_GPIO_WriteHigh
      00890C 5B 03            [ 2]  180 	addw	sp, #3
                                    181 ;	driver/dht12.c: 99: _delay_5us(5);  
      00890E 4B 05            [ 1]  182 	push	#0x05
      008910 4B 00            [ 1]  183 	push	#0x00
      008912 CD 88 BF         [ 4]  184 	call	__delay_5us
      008915 5B 02            [ 2]  185 	addw	sp, #2
                                    186 ;	driver/dht12.c: 101: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008917 4B 10            [ 1]  187 	push	#0x10
      008919 4B 05            [ 1]  188 	push	#0x05
      00891B 4B 50            [ 1]  189 	push	#0x50
      00891D CD 95 49         [ 4]  190 	call	_GPIO_WriteHigh
      008920 5B 03            [ 2]  191 	addw	sp, #3
                                    192 ;	driver/dht12.c: 103: _delay_5us(5);  
      008922 4B 05            [ 1]  193 	push	#0x05
      008924 4B 00            [ 1]  194 	push	#0x00
      008926 CD 88 BF         [ 4]  195 	call	__delay_5us
      008929 5B 02            [ 2]  196 	addw	sp, #2
                                    197 ;	driver/dht12.c: 105: GPIO_WriteLow(I2C_PORT, I2CSDA);  
      00892B 4B 20            [ 1]  198 	push	#0x20
      00892D 4B 05            [ 1]  199 	push	#0x05
      00892F 4B 50            [ 1]  200 	push	#0x50
      008931 CD 95 50         [ 4]  201 	call	_GPIO_WriteLow
      008934 5B 03            [ 2]  202 	addw	sp, #3
                                    203 ;	driver/dht12.c: 107: _delay_5us(5);  
      008936 4B 05            [ 1]  204 	push	#0x05
      008938 4B 00            [ 1]  205 	push	#0x00
      00893A CD 88 BF         [ 4]  206 	call	__delay_5us
      00893D 5B 02            [ 2]  207 	addw	sp, #2
                                    208 ;	driver/dht12.c: 108: GPIO_WriteLow(I2C_PORT, I2CSCL);    
      00893F 4B 10            [ 1]  209 	push	#0x10
      008941 4B 05            [ 1]  210 	push	#0x05
      008943 4B 50            [ 1]  211 	push	#0x50
      008945 CD 95 50         [ 4]  212 	call	_GPIO_WriteLow
      008948 5B 03            [ 2]  213 	addw	sp, #3
                                    214 ;	driver/dht12.c: 109: }  
      00894A 81               [ 4]  215 	ret
                                    216 ;	driver/dht12.c: 119: void I2C_Stop (void)  
                                    217 ;	-----------------------------------------
                                    218 ;	 function I2C_Stop
                                    219 ;	-----------------------------------------
      00894B                        220 _I2C_Stop:
                                    221 ;	driver/dht12.c: 122: I2CDataInOut(I2CDataOut);
      00894B 4B 00            [ 1]  222 	push	#0x00
      00894D CD 88 DD         [ 4]  223 	call	_I2CDataInOut
      008950 84               [ 1]  224 	pop	a
                                    225 ;	driver/dht12.c: 123: GPIO_WriteLow(I2C_PORT, I2CSCL); 
      008951 4B 10            [ 1]  226 	push	#0x10
      008953 4B 05            [ 1]  227 	push	#0x05
      008955 4B 50            [ 1]  228 	push	#0x50
      008957 CD 95 50         [ 4]  229 	call	_GPIO_WriteLow
      00895A 5B 03            [ 2]  230 	addw	sp, #3
                                    231 ;	driver/dht12.c: 124: _delay_5us(5);   
      00895C 4B 05            [ 1]  232 	push	#0x05
      00895E 4B 00            [ 1]  233 	push	#0x00
      008960 CD 88 BF         [ 4]  234 	call	__delay_5us
      008963 5B 02            [ 2]  235 	addw	sp, #2
                                    236 ;	driver/dht12.c: 125: GPIO_WriteLow(I2C_PORT, I2CSDA);  
      008965 4B 20            [ 1]  237 	push	#0x20
      008967 4B 05            [ 1]  238 	push	#0x05
      008969 4B 50            [ 1]  239 	push	#0x50
      00896B CD 95 50         [ 4]  240 	call	_GPIO_WriteLow
      00896E 5B 03            [ 2]  241 	addw	sp, #3
                                    242 ;	driver/dht12.c: 127: _delay_5us(5);  
      008970 4B 05            [ 1]  243 	push	#0x05
      008972 4B 00            [ 1]  244 	push	#0x00
      008974 CD 88 BF         [ 4]  245 	call	__delay_5us
      008977 5B 02            [ 2]  246 	addw	sp, #2
                                    247 ;	driver/dht12.c: 129: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008979 4B 10            [ 1]  248 	push	#0x10
      00897B 4B 05            [ 1]  249 	push	#0x05
      00897D 4B 50            [ 1]  250 	push	#0x50
      00897F CD 95 49         [ 4]  251 	call	_GPIO_WriteHigh
      008982 5B 03            [ 2]  252 	addw	sp, #3
                                    253 ;	driver/dht12.c: 131: _delay_5us(5);  
      008984 4B 05            [ 1]  254 	push	#0x05
      008986 4B 00            [ 1]  255 	push	#0x00
      008988 CD 88 BF         [ 4]  256 	call	__delay_5us
      00898B 5B 02            [ 2]  257 	addw	sp, #2
                                    258 ;	driver/dht12.c: 133: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
      00898D 4B 20            [ 1]  259 	push	#0x20
      00898F 4B 05            [ 1]  260 	push	#0x05
      008991 4B 50            [ 1]  261 	push	#0x50
      008993 CD 95 49         [ 4]  262 	call	_GPIO_WriteHigh
      008996 5B 03            [ 2]  263 	addw	sp, #3
                                    264 ;	driver/dht12.c: 135: }  
      008998 81               [ 4]  265 	ret
                                    266 ;	driver/dht12.c: 149: void I2C_Rack(void)  
                                    267 ;	-----------------------------------------
                                    268 ;	 function I2C_Rack
                                    269 ;	-----------------------------------------
      008999                        270 _I2C_Rack:
                                    271 ;	driver/dht12.c: 152: I2CDataInOut(I2CDataOut);
      008999 4B 00            [ 1]  272 	push	#0x00
      00899B CD 88 DD         [ 4]  273 	call	_I2CDataInOut
      00899E 84               [ 1]  274 	pop	a
                                    275 ;	driver/dht12.c: 154: GPIO_WriteLow(I2C_PORT, I2CSDA);  
      00899F 4B 20            [ 1]  276 	push	#0x20
      0089A1 4B 05            [ 1]  277 	push	#0x05
      0089A3 4B 50            [ 1]  278 	push	#0x50
      0089A5 CD 95 50         [ 4]  279 	call	_GPIO_WriteLow
      0089A8 5B 03            [ 2]  280 	addw	sp, #3
                                    281 ;	driver/dht12.c: 156: _delay_5us(5);  
      0089AA 4B 05            [ 1]  282 	push	#0x05
      0089AC 4B 00            [ 1]  283 	push	#0x00
      0089AE CD 88 BF         [ 4]  284 	call	__delay_5us
      0089B1 5B 02            [ 2]  285 	addw	sp, #2
                                    286 ;	driver/dht12.c: 158: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      0089B3 4B 10            [ 1]  287 	push	#0x10
      0089B5 4B 05            [ 1]  288 	push	#0x05
      0089B7 4B 50            [ 1]  289 	push	#0x50
      0089B9 CD 95 49         [ 4]  290 	call	_GPIO_WriteHigh
      0089BC 5B 03            [ 2]  291 	addw	sp, #3
                                    292 ;	driver/dht12.c: 160: _delay_5us(5);  
      0089BE 4B 05            [ 1]  293 	push	#0x05
      0089C0 4B 00            [ 1]  294 	push	#0x00
      0089C2 CD 88 BF         [ 4]  295 	call	__delay_5us
      0089C5 5B 02            [ 2]  296 	addw	sp, #2
                                    297 ;	driver/dht12.c: 162: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      0089C7 4B 10            [ 1]  298 	push	#0x10
      0089C9 4B 05            [ 1]  299 	push	#0x05
      0089CB 4B 50            [ 1]  300 	push	#0x50
      0089CD CD 95 50         [ 4]  301 	call	_GPIO_WriteLow
      0089D0 5B 03            [ 2]  302 	addw	sp, #3
                                    303 ;	driver/dht12.c: 164: _delay_5us(5);  
      0089D2 4B 05            [ 1]  304 	push	#0x05
      0089D4 4B 00            [ 1]  305 	push	#0x00
      0089D6 CD 88 BF         [ 4]  306 	call	__delay_5us
      0089D9 5B 02            [ 2]  307 	addw	sp, #2
                                    308 ;	driver/dht12.c: 166: }  
      0089DB 81               [ 4]  309 	ret
                                    310 ;	driver/dht12.c: 181: void I2C_nAck (void)  
                                    311 ;	-----------------------------------------
                                    312 ;	 function I2C_nAck
                                    313 ;	-----------------------------------------
      0089DC                        314 _I2C_nAck:
                                    315 ;	driver/dht12.c: 184: I2CDataInOut(I2CDataOut);
      0089DC 4B 00            [ 1]  316 	push	#0x00
      0089DE CD 88 DD         [ 4]  317 	call	_I2CDataInOut
      0089E1 84               [ 1]  318 	pop	a
                                    319 ;	driver/dht12.c: 187: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
      0089E2 4B 20            [ 1]  320 	push	#0x20
      0089E4 4B 05            [ 1]  321 	push	#0x05
      0089E6 4B 50            [ 1]  322 	push	#0x50
      0089E8 CD 95 49         [ 4]  323 	call	_GPIO_WriteHigh
      0089EB 5B 03            [ 2]  324 	addw	sp, #3
                                    325 ;	driver/dht12.c: 189: _delay_5us(5);  
      0089ED 4B 05            [ 1]  326 	push	#0x05
      0089EF 4B 00            [ 1]  327 	push	#0x00
      0089F1 CD 88 BF         [ 4]  328 	call	__delay_5us
      0089F4 5B 02            [ 2]  329 	addw	sp, #2
                                    330 ;	driver/dht12.c: 191: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      0089F6 4B 10            [ 1]  331 	push	#0x10
      0089F8 4B 05            [ 1]  332 	push	#0x05
      0089FA 4B 50            [ 1]  333 	push	#0x50
      0089FC CD 95 49         [ 4]  334 	call	_GPIO_WriteHigh
      0089FF 5B 03            [ 2]  335 	addw	sp, #3
                                    336 ;	driver/dht12.c: 193: _delay_5us(5);  
      008A01 4B 05            [ 1]  337 	push	#0x05
      008A03 4B 00            [ 1]  338 	push	#0x00
      008A05 CD 88 BF         [ 4]  339 	call	__delay_5us
      008A08 5B 02            [ 2]  340 	addw	sp, #2
                                    341 ;	driver/dht12.c: 195: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008A0A 4B 10            [ 1]  342 	push	#0x10
      008A0C 4B 05            [ 1]  343 	push	#0x05
      008A0E 4B 50            [ 1]  344 	push	#0x50
      008A10 CD 95 50         [ 4]  345 	call	_GPIO_WriteLow
      008A13 5B 03            [ 2]  346 	addw	sp, #3
                                    347 ;	driver/dht12.c: 197: _delay_5us(5);  
      008A15 4B 05            [ 1]  348 	push	#0x05
      008A17 4B 00            [ 1]  349 	push	#0x00
      008A19 CD 88 BF         [ 4]  350 	call	__delay_5us
      008A1C 5B 02            [ 2]  351 	addw	sp, #2
                                    352 ;	driver/dht12.c: 199: }  
      008A1E 81               [ 4]  353 	ret
                                    354 ;	driver/dht12.c: 209: bool SendByte(UCHAR I2cData)  
                                    355 ;	-----------------------------------------
                                    356 ;	 function SendByte
                                    357 ;	-----------------------------------------
      008A1F                        358 _SendByte:
      008A1F 52 03            [ 2]  359 	sub	sp, #3
                                    360 ;	driver/dht12.c: 218: for(i=0; i<8; i++)  
      008A21 0F 03            [ 1]  361 	clr	(0x03, sp)
      008A23                        362 00112$:
                                    363 ;	driver/dht12.c: 222: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008A23 4B 10            [ 1]  364 	push	#0x10
      008A25 4B 05            [ 1]  365 	push	#0x05
      008A27 4B 50            [ 1]  366 	push	#0x50
      008A29 CD 95 50         [ 4]  367 	call	_GPIO_WriteLow
      008A2C 5B 03            [ 2]  368 	addw	sp, #3
                                    369 ;	driver/dht12.c: 224: _delay_5us(5);  
      008A2E 4B 05            [ 1]  370 	push	#0x05
      008A30 4B 00            [ 1]  371 	push	#0x00
      008A32 CD 88 BF         [ 4]  372 	call	__delay_5us
      008A35 5B 02            [ 2]  373 	addw	sp, #2
                                    374 ;	driver/dht12.c: 226: if(I2cData & 0x80)  
      008A37 7B 06            [ 1]  375 	ld	a, (0x06, sp)
      008A39 2A 0D            [ 1]  376 	jrpl	00102$
                                    377 ;	driver/dht12.c: 228: {GPIO_WriteHigh(I2C_PORT, I2CSDA);}  
      008A3B 4B 20            [ 1]  378 	push	#0x20
      008A3D 4B 05            [ 1]  379 	push	#0x05
      008A3F 4B 50            [ 1]  380 	push	#0x50
      008A41 CD 95 49         [ 4]  381 	call	_GPIO_WriteHigh
      008A44 5B 03            [ 2]  382 	addw	sp, #3
      008A46 20 0B            [ 2]  383 	jra	00103$
      008A48                        384 00102$:
                                    385 ;	driver/dht12.c: 232: {GPIO_WriteLow(I2C_PORT, I2CSDA);}  
      008A48 4B 20            [ 1]  386 	push	#0x20
      008A4A 4B 05            [ 1]  387 	push	#0x05
      008A4C 4B 50            [ 1]  388 	push	#0x50
      008A4E CD 95 50         [ 4]  389 	call	_GPIO_WriteLow
      008A51 5B 03            [ 2]  390 	addw	sp, #3
      008A53                        391 00103$:
                                    392 ;	driver/dht12.c: 234: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008A53 4B 10            [ 1]  393 	push	#0x10
      008A55 4B 05            [ 1]  394 	push	#0x05
      008A57 4B 50            [ 1]  395 	push	#0x50
      008A59 CD 95 49         [ 4]  396 	call	_GPIO_WriteHigh
      008A5C 5B 03            [ 2]  397 	addw	sp, #3
                                    398 ;	driver/dht12.c: 236: _delay_5us(5);  
      008A5E 4B 05            [ 1]  399 	push	#0x05
      008A60 4B 00            [ 1]  400 	push	#0x00
      008A62 CD 88 BF         [ 4]  401 	call	__delay_5us
      008A65 5B 02            [ 2]  402 	addw	sp, #2
                                    403 ;	driver/dht12.c: 238: I2cData <<= 1;  
      008A67 08 06            [ 1]  404 	sll	(0x06, sp)
                                    405 ;	driver/dht12.c: 218: for(i=0; i<8; i++)  
      008A69 0C 03            [ 1]  406 	inc	(0x03, sp)
      008A6B 7B 03            [ 1]  407 	ld	a, (0x03, sp)
      008A6D A1 08            [ 1]  408 	cp	a, #0x08
      008A6F 25 B2            [ 1]  409 	jrc	00112$
                                    410 ;	driver/dht12.c: 242: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008A71 4B 10            [ 1]  411 	push	#0x10
      008A73 4B 05            [ 1]  412 	push	#0x05
      008A75 4B 50            [ 1]  413 	push	#0x50
      008A77 CD 95 50         [ 4]  414 	call	_GPIO_WriteLow
      008A7A 5B 03            [ 2]  415 	addw	sp, #3
                                    416 ;	driver/dht12.c: 244: GPIO_WriteHigh(I2C_PORT, I2CSDA);//发送完一字节，接收应答  
      008A7C 4B 20            [ 1]  417 	push	#0x20
      008A7E 4B 05            [ 1]  418 	push	#0x05
      008A80 4B 50            [ 1]  419 	push	#0x50
      008A82 CD 95 49         [ 4]  420 	call	_GPIO_WriteHigh
      008A85 5B 03            [ 2]  421 	addw	sp, #3
                                    422 ;	driver/dht12.c: 248: I2CDataInOut(I2CDataIn);  
      008A87 4B 01            [ 1]  423 	push	#0x01
      008A89 CD 88 DD         [ 4]  424 	call	_I2CDataInOut
      008A8C 84               [ 1]  425 	pop	a
                                    426 ;	driver/dht12.c: 251: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008A8D 4B 10            [ 1]  427 	push	#0x10
      008A8F 4B 05            [ 1]  428 	push	#0x05
      008A91 4B 50            [ 1]  429 	push	#0x50
      008A93 CD 95 49         [ 4]  430 	call	_GPIO_WriteHigh
      008A96 5B 03            [ 2]  431 	addw	sp, #3
                                    432 ;	driver/dht12.c: 273: while(GPIO_ReadInputPin(I2C_PORT,I2CSDA) &&count--)
      008A98 AE 03 E8         [ 2]  433 	ldw	x, #0x03e8
      008A9B 1F 01            [ 2]  434 	ldw	(0x01, sp), x
      008A9D                        435 00106$:
      008A9D 4B 20            [ 1]  436 	push	#0x20
      008A9F 4B 05            [ 1]  437 	push	#0x05
      008AA1 4B 50            [ 1]  438 	push	#0x50
      008AA3 CD 95 6E         [ 4]  439 	call	_GPIO_ReadInputPin
      008AA6 5B 03            [ 2]  440 	addw	sp, #3
      008AA8 4D               [ 1]  441 	tnz	a
      008AA9 27 0F            [ 1]  442 	jreq	00108$
      008AAB 1E 01            [ 2]  443 	ldw	x, (0x01, sp)
      008AAD 16 01            [ 2]  444 	ldw	y, (0x01, sp)
      008AAF 90 5A            [ 2]  445 	decw	y
      008AB1 17 01            [ 2]  446 	ldw	(0x01, sp), y
      008AB3 5D               [ 2]  447 	tnzw	x
      008AB4 27 04            [ 1]  448 	jreq	00108$
                                    449 ;	driver/dht12.c: 274: {nop();nop();};
      008AB6 9D               [ 1]  450 	nop
      008AB7 9D               [ 1]  451 	nop
      008AB8 20 E3            [ 2]  452 	jra	00106$
      008ABA                        453 00108$:
                                    454 ;	driver/dht12.c: 275: GPIO_WriteLow(I2C_PORT, I2CSCL);
      008ABA 4B 10            [ 1]  455 	push	#0x10
      008ABC 4B 05            [ 1]  456 	push	#0x05
      008ABE 4B 50            [ 1]  457 	push	#0x50
      008AC0 CD 95 50         [ 4]  458 	call	_GPIO_WriteLow
      008AC3 5B 03            [ 2]  459 	addw	sp, #3
                                    460 ;	driver/dht12.c: 280: I2CDataInOut(I2CDataOut);  
      008AC5 4B 00            [ 1]  461 	push	#0x00
      008AC7 CD 88 DD         [ 4]  462 	call	_I2CDataInOut
      008ACA 84               [ 1]  463 	pop	a
                                    464 ;	driver/dht12.c: 281: if(count)
      008ACB 1E 01            [ 2]  465 	ldw	x, (0x01, sp)
      008ACD 27 03            [ 1]  466 	jreq	00110$
                                    467 ;	driver/dht12.c: 284: I2CStatus = I2C_CRR;  
      008ACF A6 01            [ 1]  468 	ld	a, #0x01
                                    469 ;	driver/dht12.c: 292: I2CStatus = I2C_ERR;  
      008AD1 21                     470 	.byte 0x21
      008AD2                        471 00110$:
      008AD2 4F               [ 1]  472 	clr	a
      008AD3                        473 00111$:
                                    474 ;	driver/dht12.c: 295: return I2CStatus;  
                                    475 ;	driver/dht12.c: 297: }  
      008AD3 5B 03            [ 2]  476 	addw	sp, #3
      008AD5 81               [ 4]  477 	ret
                                    478 ;	driver/dht12.c: 312: UCHAR RcvByte(void)  
                                    479 ;	-----------------------------------------
                                    480 ;	 function RcvByte
                                    481 ;	-----------------------------------------
      008AD6                        482 _RcvByte:
      008AD6 52 02            [ 2]  483 	sub	sp, #2
                                    484 ;	driver/dht12.c: 318: UCHAR ReadByte=0;  
      008AD8 0F 02            [ 1]  485 	clr	(0x02, sp)
                                    486 ;	driver/dht12.c: 320: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
      008ADA 4B 20            [ 1]  487 	push	#0x20
      008ADC 4B 05            [ 1]  488 	push	#0x05
      008ADE 4B 50            [ 1]  489 	push	#0x50
      008AE0 CD 95 49         [ 4]  490 	call	_GPIO_WriteHigh
      008AE3 5B 03            [ 2]  491 	addw	sp, #3
                                    492 ;	driver/dht12.c: 323: I2CDataInOut(I2CDataIn);  
      008AE5 4B 01            [ 1]  493 	push	#0x01
      008AE7 CD 88 DD         [ 4]  494 	call	_I2CDataInOut
      008AEA 84               [ 1]  495 	pop	a
                                    496 ;	driver/dht12.c: 325: _delay_5us(10);  
      008AEB 4B 0A            [ 1]  497 	push	#0x0a
      008AED 4B 00            [ 1]  498 	push	#0x00
      008AEF CD 88 BF         [ 4]  499 	call	__delay_5us
      008AF2 5B 02            [ 2]  500 	addw	sp, #2
                                    501 ;	driver/dht12.c: 327: for(i=0; i<8; i++)  
      008AF4 0F 01            [ 1]  502 	clr	(0x01, sp)
      008AF6                        503 00104$:
                                    504 ;	driver/dht12.c: 331: ReadByte <<= 1;  
      008AF6 7B 02            [ 1]  505 	ld	a, (0x02, sp)
      008AF8 48               [ 1]  506 	sll	a
      008AF9 6B 02            [ 1]  507 	ld	(0x02, sp), a
                                    508 ;	driver/dht12.c: 333: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008AFB 4B 10            [ 1]  509 	push	#0x10
      008AFD 4B 05            [ 1]  510 	push	#0x05
      008AFF 4B 50            [ 1]  511 	push	#0x50
      008B01 CD 95 50         [ 4]  512 	call	_GPIO_WriteLow
      008B04 5B 03            [ 2]  513 	addw	sp, #3
                                    514 ;	driver/dht12.c: 335: _delay_5us(5);  
      008B06 4B 05            [ 1]  515 	push	#0x05
      008B08 4B 00            [ 1]  516 	push	#0x00
      008B0A CD 88 BF         [ 4]  517 	call	__delay_5us
      008B0D 5B 02            [ 2]  518 	addw	sp, #2
                                    519 ;	driver/dht12.c: 337: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008B0F 4B 10            [ 1]  520 	push	#0x10
      008B11 4B 05            [ 1]  521 	push	#0x05
      008B13 4B 50            [ 1]  522 	push	#0x50
      008B15 CD 95 49         [ 4]  523 	call	_GPIO_WriteHigh
      008B18 5B 03            [ 2]  524 	addw	sp, #3
                                    525 ;	driver/dht12.c: 339: _delay_5us(10);  
      008B1A 4B 0A            [ 1]  526 	push	#0x0a
      008B1C 4B 00            [ 1]  527 	push	#0x00
      008B1E CD 88 BF         [ 4]  528 	call	__delay_5us
      008B21 5B 02            [ 2]  529 	addw	sp, #2
                                    530 ;	driver/dht12.c: 342: if(GPIO_ReadInputPin(I2C_PORT,I2CSDA) !=RESET)  
      008B23 4B 20            [ 1]  531 	push	#0x20
      008B25 4B 05            [ 1]  532 	push	#0x05
      008B27 4B 50            [ 1]  533 	push	#0x50
      008B29 CD 95 6E         [ 4]  534 	call	_GPIO_ReadInputPin
      008B2C 5B 03            [ 2]  535 	addw	sp, #3
      008B2E 4D               [ 1]  536 	tnz	a
      008B2F 27 06            [ 1]  537 	jreq	00102$
                                    538 ;	driver/dht12.c: 344: {ReadByte |= 0x01;}  
      008B31 7B 02            [ 1]  539 	ld	a, (0x02, sp)
      008B33 AA 01            [ 1]  540 	or	a, #0x01
      008B35 6B 02            [ 1]  541 	ld	(0x02, sp), a
      008B37                        542 00102$:
                                    543 ;	driver/dht12.c: 346: _delay_5us(10);  
      008B37 4B 0A            [ 1]  544 	push	#0x0a
      008B39 4B 00            [ 1]  545 	push	#0x00
      008B3B CD 88 BF         [ 4]  546 	call	__delay_5us
      008B3E 5B 02            [ 2]  547 	addw	sp, #2
                                    548 ;	driver/dht12.c: 327: for(i=0; i<8; i++)  
      008B40 0C 01            [ 1]  549 	inc	(0x01, sp)
      008B42 7B 01            [ 1]  550 	ld	a, (0x01, sp)
      008B44 A1 08            [ 1]  551 	cp	a, #0x08
      008B46 25 AE            [ 1]  552 	jrc	00104$
                                    553 ;	driver/dht12.c: 350: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008B48 4B 10            [ 1]  554 	push	#0x10
      008B4A 4B 05            [ 1]  555 	push	#0x05
      008B4C 4B 50            [ 1]  556 	push	#0x50
      008B4E CD 95 50         [ 4]  557 	call	_GPIO_WriteLow
      008B51 5B 03            [ 2]  558 	addw	sp, #3
                                    559 ;	driver/dht12.c: 352: I2CDataInOut(I2CDataOut);  
      008B53 4B 00            [ 1]  560 	push	#0x00
      008B55 CD 88 DD         [ 4]  561 	call	_I2CDataInOut
      008B58 84               [ 1]  562 	pop	a
                                    563 ;	driver/dht12.c: 354: _delay_5us(10);  
      008B59 4B 0A            [ 1]  564 	push	#0x0a
      008B5B 4B 00            [ 1]  565 	push	#0x00
      008B5D CD 88 BF         [ 4]  566 	call	__delay_5us
      008B60 5B 02            [ 2]  567 	addw	sp, #2
                                    568 ;	driver/dht12.c: 356: return ReadByte;  
      008B62 7B 02            [ 1]  569 	ld	a, (0x02, sp)
                                    570 ;	driver/dht12.c: 358: }  
      008B64 5B 02            [ 2]  571 	addw	sp, #2
      008B66 81               [ 4]  572 	ret
                                    573 ;	driver/dht12.c: 377: bool I2C_Read(UCHAR wrDAdr,UCHAR wordAdr,UCHAR *pRdDat,UCHAR num)  
                                    574 ;	-----------------------------------------
                                    575 ;	 function I2C_Read
                                    576 ;	-----------------------------------------
      008B67                        577 _I2C_Read:
      008B67 52 09            [ 2]  578 	sub	sp, #9
                                    579 ;	driver/dht12.c: 387: rdDAdr = wrDAdr+1; //读器件地址为写地址加1  
      008B69 7B 0C            [ 1]  580 	ld	a, (0x0c, sp)
      008B6B 4C               [ 1]  581 	inc	a
      008B6C 6B 09            [ 1]  582 	ld	(0x09, sp), a
                                    583 ;	driver/dht12.c: 389: I2C_Start();  /*启动I2C*/  
      008B6E CD 88 FD         [ 4]  584 	call	_I2C_Start
                                    585 ;	driver/dht12.c: 391: _delay_5us(5);  
      008B71 4B 05            [ 1]  586 	push	#0x05
      008B73 4B 00            [ 1]  587 	push	#0x00
      008B75 CD 88 BF         [ 4]  588 	call	__delay_5us
      008B78 5B 02            [ 2]  589 	addw	sp, #2
                                    590 ;	driver/dht12.c: 393: I2CAck = SendByte(wrDAdr); /*发写器件地址*/  
      008B7A 7B 0C            [ 1]  591 	ld	a, (0x0c, sp)
      008B7C 88               [ 1]  592 	push	a
      008B7D CD 8A 1F         [ 4]  593 	call	_SendByte
      008B80 5B 01            [ 2]  594 	addw	sp, #1
                                    595 ;	driver/dht12.c: 395: if(!I2CAck)  
      008B82 6B 08            [ 1]  596 	ld	(0x08, sp), a
      008B84 26 03            [ 1]  597 	jrne	00102$
                                    598 ;	driver/dht12.c: 399: return I2C_ERR;  
      008B86 4F               [ 1]  599 	clr	a
      008B87 20 67            [ 2]  600 	jra	00113$
      008B89                        601 00102$:
                                    602 ;	driver/dht12.c: 403: I2CAck = SendByte(wordAdr); /*发寄存器地址*/  
      008B89 7B 0D            [ 1]  603 	ld	a, (0x0d, sp)
      008B8B 88               [ 1]  604 	push	a
      008B8C CD 8A 1F         [ 4]  605 	call	_SendByte
      008B8F 5B 01            [ 2]  606 	addw	sp, #1
                                    607 ;	driver/dht12.c: 405: if(!I2CAck)  
      008B91 4D               [ 1]  608 	tnz	a
      008B92 26 03            [ 1]  609 	jrne	00104$
                                    610 ;	driver/dht12.c: 409: return I2C_ERR;  
      008B94 4F               [ 1]  611 	clr	a
      008B95 20 59            [ 2]  612 	jra	00113$
      008B97                        613 00104$:
                                    614 ;	driver/dht12.c: 413: I2C_Start();   /*重启I2C*/  
      008B97 CD 88 FD         [ 4]  615 	call	_I2C_Start
                                    616 ;	driver/dht12.c: 415: I2CAck = SendByte(rdDAdr); /*发读器件地址*/  
      008B9A 7B 09            [ 1]  617 	ld	a, (0x09, sp)
      008B9C 88               [ 1]  618 	push	a
      008B9D CD 8A 1F         [ 4]  619 	call	_SendByte
      008BA0 5B 01            [ 2]  620 	addw	sp, #1
                                    621 ;	driver/dht12.c: 417: if(!I2CAck)  
      008BA2 4D               [ 1]  622 	tnz	a
      008BA3 26 03            [ 1]  623 	jrne	00106$
                                    624 ;	driver/dht12.c: 421: return I2C_ERR;  
      008BA5 4F               [ 1]  625 	clr	a
      008BA6 20 48            [ 2]  626 	jra	00113$
      008BA8                        627 00106$:
                                    628 ;	driver/dht12.c: 425: _delay_5us(5);  
      008BA8 4B 05            [ 1]  629 	push	#0x05
      008BAA 4B 00            [ 1]  630 	push	#0x00
      008BAC CD 88 BF         [ 4]  631 	call	__delay_5us
      008BAF 5B 02            [ 2]  632 	addw	sp, #2
                                    633 ;	driver/dht12.c: 427: for(i=0;i<num-1;i++)  
      008BB1 0F 03            [ 1]  634 	clr	(0x03, sp)
      008BB3                        635 00111$:
      008BB3 5F               [ 1]  636 	clrw	x
      008BB4 7B 10            [ 1]  637 	ld	a, (0x10, sp)
      008BB6 97               [ 1]  638 	ld	xl, a
      008BB7 5A               [ 2]  639 	decw	x
      008BB8 1F 06            [ 2]  640 	ldw	(0x06, sp), x
      008BBA 7B 03            [ 1]  641 	ld	a, (0x03, sp)
      008BBC 6B 05            [ 1]  642 	ld	(0x05, sp), a
      008BBE 0F 04            [ 1]  643 	clr	(0x04, sp)
                                    644 ;	driver/dht12.c: 431: *(pRdDat+i) = RcvByte();  
      008BC0 5F               [ 1]  645 	clrw	x
      008BC1 7B 03            [ 1]  646 	ld	a, (0x03, sp)
      008BC3 97               [ 1]  647 	ld	xl, a
      008BC4 72 FB 0E         [ 2]  648 	addw	x, (0x0e, sp)
      008BC7 1F 01            [ 2]  649 	ldw	(0x01, sp), x
                                    650 ;	driver/dht12.c: 427: for(i=0;i<num-1;i++)  
      008BC9 1E 04            [ 2]  651 	ldw	x, (0x04, sp)
      008BCB 13 06            [ 2]  652 	cpw	x, (0x06, sp)
      008BCD 2E 0D            [ 1]  653 	jrsge	00107$
                                    654 ;	driver/dht12.c: 431: *(pRdDat+i) = RcvByte();  
      008BCF CD 8A D6         [ 4]  655 	call	_RcvByte
      008BD2 1E 01            [ 2]  656 	ldw	x, (0x01, sp)
      008BD4 F7               [ 1]  657 	ld	(x), a
                                    658 ;	driver/dht12.c: 433: I2C_Rack();  
      008BD5 CD 89 99         [ 4]  659 	call	_I2C_Rack
                                    660 ;	driver/dht12.c: 427: for(i=0;i<num-1;i++)  
      008BD8 0C 03            [ 1]  661 	inc	(0x03, sp)
      008BDA 20 D7            [ 2]  662 	jra	00111$
      008BDC                        663 00107$:
                                    664 ;	driver/dht12.c: 437: if(i==num-1)  
      008BDC 1E 04            [ 2]  665 	ldw	x, (0x04, sp)
      008BDE 13 06            [ 2]  666 	cpw	x, (0x06, sp)
      008BE0 26 09            [ 1]  667 	jrne	00109$
                                    668 ;	driver/dht12.c: 441: *(pRdDat+i) = RcvByte();  
      008BE2 CD 8A D6         [ 4]  669 	call	_RcvByte
      008BE5 1E 01            [ 2]  670 	ldw	x, (0x01, sp)
      008BE7 F7               [ 1]  671 	ld	(x), a
                                    672 ;	driver/dht12.c: 443: I2C_nAck();  
      008BE8 CD 89 DC         [ 4]  673 	call	_I2C_nAck
      008BEB                        674 00109$:
                                    675 ;	driver/dht12.c: 447: I2C_Stop();  
      008BEB CD 89 4B         [ 4]  676 	call	_I2C_Stop
                                    677 ;	driver/dht12.c: 449: return I2C_CRR;  
      008BEE A6 01            [ 1]  678 	ld	a, #0x01
      008BF0                        679 00113$:
                                    680 ;	driver/dht12.c: 451: }  
      008BF0 5B 09            [ 2]  681 	addw	sp, #9
      008BF2 81               [ 4]  682 	ret
                                    683 ;	driver/dht12.c: 533: u8 i2c_read(u8 dev_addr,u8 Addr)
                                    684 ;	-----------------------------------------
                                    685 ;	 function i2c_read
                                    686 ;	-----------------------------------------
      008BF3                        687 _i2c_read:
      008BF3 88               [ 1]  688 	push	a
                                    689 ;	driver/dht12.c: 536: if(I2C_Read(dev_addr,Addr,&temp,1))
      008BF4 96               [ 1]  690 	ldw	x, sp
      008BF5 5C               [ 1]  691 	incw	x
      008BF6 4B 01            [ 1]  692 	push	#0x01
      008BF8 89               [ 2]  693 	pushw	x
      008BF9 7B 08            [ 1]  694 	ld	a, (0x08, sp)
      008BFB 88               [ 1]  695 	push	a
      008BFC 7B 08            [ 1]  696 	ld	a, (0x08, sp)
      008BFE 88               [ 1]  697 	push	a
      008BFF CD 8B 67         [ 4]  698 	call	_I2C_Read
      008C02 5B 05            [ 2]  699 	addw	sp, #5
      008C04 4D               [ 1]  700 	tnz	a
      008C05 27 03            [ 1]  701 	jreq	00102$
                                    702 ;	driver/dht12.c: 537: return temp;
      008C07 7B 01            [ 1]  703 	ld	a, (0x01, sp)
                                    704 ;	driver/dht12.c: 538: else return 0;
      008C09 21                     705 	.byte 0x21
      008C0A                        706 00102$:
      008C0A 4F               [ 1]  707 	clr	a
      008C0B                        708 00104$:
                                    709 ;	driver/dht12.c: 539: }
      008C0B 5B 01            [ 2]  710 	addw	sp, #1
      008C0D 81               [ 4]  711 	ret
                                    712 ;	driver/dht12.c: 541: void ReadDHT12(DHT12_DATA *data) 
                                    713 ;	-----------------------------------------
                                    714 ;	 function ReadDHT12
                                    715 ;	-----------------------------------------
      008C0E                        716 _ReadDHT12:
      008C0E 52 02            [ 2]  717 	sub	sp, #2
                                    718 ;	driver/dht12.c: 543: i2c_init();
      008C10 CD 88 89         [ 4]  719 	call	_i2c_init
                                    720 ;	driver/dht12.c: 544: data->W=i2c_read(0xB8,0x00);
      008C13 16 05            [ 2]  721 	ldw	y, (0x05, sp)
      008C15 17 01            [ 2]  722 	ldw	(0x01, sp), y
      008C17 93               [ 1]  723 	ldw	x, y
      008C18 5C               [ 1]  724 	incw	x
      008C19 5C               [ 1]  725 	incw	x
      008C1A 89               [ 2]  726 	pushw	x
      008C1B 4B 00            [ 1]  727 	push	#0x00
      008C1D 4B B8            [ 1]  728 	push	#0xb8
      008C1F CD 8B F3         [ 4]  729 	call	_i2c_read
      008C22 5B 02            [ 2]  730 	addw	sp, #2
      008C24 85               [ 2]  731 	popw	x
      008C25 F7               [ 1]  732 	ld	(x), a
                                    733 ;	driver/dht12.c: 545: data->W1=i2c_read(0xB8,0x01);
      008C26 1E 01            [ 2]  734 	ldw	x, (0x01, sp)
      008C28 1C 00 03         [ 2]  735 	addw	x, #0x0003
      008C2B 89               [ 2]  736 	pushw	x
      008C2C 4B 01            [ 1]  737 	push	#0x01
      008C2E 4B B8            [ 1]  738 	push	#0xb8
      008C30 CD 8B F3         [ 4]  739 	call	_i2c_read
      008C33 5B 02            [ 2]  740 	addw	sp, #2
      008C35 85               [ 2]  741 	popw	x
      008C36 F7               [ 1]  742 	ld	(x), a
                                    743 ;	driver/dht12.c: 546: data->T=i2c_read(0xB8,0x02);
      008C37 4B 02            [ 1]  744 	push	#0x02
      008C39 4B B8            [ 1]  745 	push	#0xb8
      008C3B CD 8B F3         [ 4]  746 	call	_i2c_read
      008C3E 5B 02            [ 2]  747 	addw	sp, #2
      008C40 1E 01            [ 2]  748 	ldw	x, (0x01, sp)
      008C42 F7               [ 1]  749 	ld	(x), a
                                    750 ;	driver/dht12.c: 547: data->T1=i2c_read(0xB8,0x03);
      008C43 1E 01            [ 2]  751 	ldw	x, (0x01, sp)
      008C45 5C               [ 1]  752 	incw	x
      008C46 89               [ 2]  753 	pushw	x
      008C47 4B 03            [ 1]  754 	push	#0x03
      008C49 4B B8            [ 1]  755 	push	#0xb8
      008C4B CD 8B F3         [ 4]  756 	call	_i2c_read
      008C4E 5B 02            [ 2]  757 	addw	sp, #2
      008C50 85               [ 2]  758 	popw	x
      008C51 F7               [ 1]  759 	ld	(x), a
                                    760 ;	driver/dht12.c: 548: data->sum=i2c_read(0xB8,0x04);
      008C52 1E 01            [ 2]  761 	ldw	x, (0x01, sp)
      008C54 1C 00 04         [ 2]  762 	addw	x, #0x0004
      008C57 89               [ 2]  763 	pushw	x
      008C58 4B 04            [ 1]  764 	push	#0x04
      008C5A 4B B8            [ 1]  765 	push	#0xb8
      008C5C CD 8B F3         [ 4]  766 	call	_i2c_read
      008C5F 5B 02            [ 2]  767 	addw	sp, #2
      008C61 85               [ 2]  768 	popw	x
      008C62 F7               [ 1]  769 	ld	(x), a
                                    770 ;	driver/dht12.c: 549: i2c_deinit();
      008C63 CD 88 A4         [ 4]  771 	call	_i2c_deinit
                                    772 ;	driver/dht12.c: 550: }
      008C66 5B 02            [ 2]  773 	addw	sp, #2
      008C68 81               [ 4]  774 	ret
                                    775 	.area CODE
                                    776 	.area CONST
                                    777 	.area INITIALIZER
                                    778 	.area CABS (ABS)
