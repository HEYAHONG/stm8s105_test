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
                                     20 	.globl _i2c_deinit
                                     21 	.globl _i2c_init
                                     22 	.globl _GPIO_ReadInputPin
                                     23 	.globl _GPIO_WriteLow
                                     24 	.globl _GPIO_WriteHigh
                                     25 	.globl _GPIO_Init
                                     26 	.globl _ReadDHT12
                                     27 ;--------------------------------------------------------
                                     28 ; ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area DATA
                                     31 ;--------------------------------------------------------
                                     32 ; ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area INITIALIZED
                                     35 ;--------------------------------------------------------
                                     36 ; absolute external ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area DABS (ABS)
                                     39 
                                     40 ; default segment ordering for linker
                                     41 	.area HOME
                                     42 	.area GSINIT
                                     43 	.area GSFINAL
                                     44 	.area CONST
                                     45 	.area INITIALIZER
                                     46 	.area CODE
                                     47 
                                     48 ;--------------------------------------------------------
                                     49 ; global & static initialisations
                                     50 ;--------------------------------------------------------
                                     51 	.area HOME
                                     52 	.area GSINIT
                                     53 	.area GSFINAL
                                     54 	.area GSINIT
                                     55 ;--------------------------------------------------------
                                     56 ; Home
                                     57 ;--------------------------------------------------------
                                     58 	.area HOME
                                     59 	.area HOME
                                     60 ;--------------------------------------------------------
                                     61 ; code
                                     62 ;--------------------------------------------------------
                                     63 	.area CODE
                                     64 ;	driver/dht12.c: 39: void i2c_init()
                                     65 ;	-----------------------------------------
                                     66 ;	 function i2c_init
                                     67 ;	-----------------------------------------
      0089BD                         68 _i2c_init:
                                     69 ;	driver/dht12.c: 41: GPIO_Init(GPIOB,GPIO_PIN_4,GPIO_MODE_OUT_OD_LOW_FAST);
      0089BD 4B A0            [ 1]   70 	push	#0xa0
      0089BF 4B 10            [ 1]   71 	push	#0x10
      0089C1 4B 05            [ 1]   72 	push	#0x05
      0089C3 4B 50            [ 1]   73 	push	#0x50
      0089C5 CD 96 26         [ 4]   74 	call	_GPIO_Init
      0089C8 5B 04            [ 2]   75 	addw	sp, #4
                                     76 ;	driver/dht12.c: 42: GPIO_Init(GPIOB,GPIO_PIN_5,GPIO_MODE_OUT_OD_LOW_FAST);
      0089CA 4B A0            [ 1]   77 	push	#0xa0
      0089CC 4B 20            [ 1]   78 	push	#0x20
      0089CE 4B 05            [ 1]   79 	push	#0x05
      0089D0 4B 50            [ 1]   80 	push	#0x50
      0089D2 CD 96 26         [ 4]   81 	call	_GPIO_Init
      0089D5 5B 04            [ 2]   82 	addw	sp, #4
                                     83 ;	driver/dht12.c: 43: }
      0089D7 81               [ 4]   84 	ret
                                     85 ;	driver/dht12.c: 44: void i2c_deinit() 
                                     86 ;	-----------------------------------------
                                     87 ;	 function i2c_deinit
                                     88 ;	-----------------------------------------
      0089D8                         89 _i2c_deinit:
                                     90 ;	driver/dht12.c: 47: GPIO_Init(GPIOB,GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
      0089D8 4B 00            [ 1]   91 	push	#0x00
      0089DA 4B 10            [ 1]   92 	push	#0x10
      0089DC 4B 05            [ 1]   93 	push	#0x05
      0089DE 4B 50            [ 1]   94 	push	#0x50
      0089E0 CD 96 26         [ 4]   95 	call	_GPIO_Init
      0089E3 5B 04            [ 2]   96 	addw	sp, #4
                                     97 ;	driver/dht12.c: 48: GPIO_Init(GPIOB,GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);
      0089E5 4B 00            [ 1]   98 	push	#0x00
      0089E7 4B 20            [ 1]   99 	push	#0x20
      0089E9 4B 05            [ 1]  100 	push	#0x05
      0089EB 4B 50            [ 1]  101 	push	#0x50
      0089ED CD 96 26         [ 4]  102 	call	_GPIO_Init
      0089F0 5B 04            [ 2]  103 	addw	sp, #4
                                    104 ;	driver/dht12.c: 49: }
      0089F2 81               [ 4]  105 	ret
                                    106 ;	driver/dht12.c: 64: void I2CDataInOut(bool InOut)  
                                    107 ;	-----------------------------------------
                                    108 ;	 function I2CDataInOut
                                    109 ;	-----------------------------------------
      0089F3                        110 _I2CDataInOut:
                                    111 ;	driver/dht12.c: 68: if(InOut)  
      0089F3 0D 03            [ 1]  112 	tnz	(0x03, sp)
      0089F5 27 0E            [ 1]  113 	jreq	00102$
                                    114 ;	driver/dht12.c: 72: GPIO_Init(I2C_PORT,I2CSDA,GPIO_MODE_IN_FL_NO_IT);  
      0089F7 4B 00            [ 1]  115 	push	#0x00
      0089F9 4B 20            [ 1]  116 	push	#0x20
      0089FB 4B 05            [ 1]  117 	push	#0x05
      0089FD 4B 50            [ 1]  118 	push	#0x50
      0089FF CD 96 26         [ 4]  119 	call	_GPIO_Init
      008A02 5B 04            [ 2]  120 	addw	sp, #4
      008A04 81               [ 4]  121 	ret
      008A05                        122 00102$:
                                    123 ;	driver/dht12.c: 80: GPIO_Init(I2C_PORT,I2CSDA,GPIO_MODE_OUT_PP_LOW_FAST);  
      008A05 4B E0            [ 1]  124 	push	#0xe0
      008A07 4B 20            [ 1]  125 	push	#0x20
      008A09 4B 05            [ 1]  126 	push	#0x05
      008A0B 4B 50            [ 1]  127 	push	#0x50
      008A0D CD 96 26         [ 4]  128 	call	_GPIO_Init
      008A10 5B 04            [ 2]  129 	addw	sp, #4
                                    130 ;	driver/dht12.c: 84: }  
      008A12 81               [ 4]  131 	ret
                                    132 ;	driver/dht12.c: 96: void I2C_Start (void)  
                                    133 ;	-----------------------------------------
                                    134 ;	 function I2C_Start
                                    135 ;	-----------------------------------------
      008A13                        136 _I2C_Start:
                                    137 ;	driver/dht12.c: 99: I2CDataInOut(I2CDataOut);
      008A13 4B 00            [ 1]  138 	push	#0x00
      008A15 CD 89 F3         [ 4]  139 	call	_I2CDataInOut
      008A18 84               [ 1]  140 	pop	a
                                    141 ;	driver/dht12.c: 101: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
      008A19 4B 20            [ 1]  142 	push	#0x20
      008A1B 4B 05            [ 1]  143 	push	#0x05
      008A1D 4B 50            [ 1]  144 	push	#0x50
      008A1F CD 96 A1         [ 4]  145 	call	_GPIO_WriteHigh
      008A22 5B 03            [ 2]  146 	addw	sp, #3
                                    147 ;	driver/dht12.c: 105: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008A24 4B 10            [ 1]  148 	push	#0x10
      008A26 4B 05            [ 1]  149 	push	#0x05
      008A28 4B 50            [ 1]  150 	push	#0x50
      008A2A CD 96 A1         [ 4]  151 	call	_GPIO_WriteHigh
      008A2D 5B 03            [ 2]  152 	addw	sp, #3
                                    153 ;	driver/dht12.c: 109: GPIO_WriteLow(I2C_PORT, I2CSDA);  
      008A2F 4B 20            [ 1]  154 	push	#0x20
      008A31 4B 05            [ 1]  155 	push	#0x05
      008A33 4B 50            [ 1]  156 	push	#0x50
      008A35 CD 96 A8         [ 4]  157 	call	_GPIO_WriteLow
      008A38 5B 03            [ 2]  158 	addw	sp, #3
                                    159 ;	driver/dht12.c: 112: GPIO_WriteLow(I2C_PORT, I2CSCL);    
      008A3A 4B 10            [ 1]  160 	push	#0x10
      008A3C 4B 05            [ 1]  161 	push	#0x05
      008A3E 4B 50            [ 1]  162 	push	#0x50
      008A40 CD 96 A8         [ 4]  163 	call	_GPIO_WriteLow
      008A43 5B 03            [ 2]  164 	addw	sp, #3
                                    165 ;	driver/dht12.c: 113: }  
      008A45 81               [ 4]  166 	ret
                                    167 ;	driver/dht12.c: 123: void I2C_Stop (void)  
                                    168 ;	-----------------------------------------
                                    169 ;	 function I2C_Stop
                                    170 ;	-----------------------------------------
      008A46                        171 _I2C_Stop:
                                    172 ;	driver/dht12.c: 126: I2CDataInOut(I2CDataOut);
      008A46 4B 00            [ 1]  173 	push	#0x00
      008A48 CD 89 F3         [ 4]  174 	call	_I2CDataInOut
      008A4B 84               [ 1]  175 	pop	a
                                    176 ;	driver/dht12.c: 127: GPIO_WriteLow(I2C_PORT, I2CSCL); 
      008A4C 4B 10            [ 1]  177 	push	#0x10
      008A4E 4B 05            [ 1]  178 	push	#0x05
      008A50 4B 50            [ 1]  179 	push	#0x50
      008A52 CD 96 A8         [ 4]  180 	call	_GPIO_WriteLow
      008A55 5B 03            [ 2]  181 	addw	sp, #3
                                    182 ;	driver/dht12.c: 129: GPIO_WriteLow(I2C_PORT, I2CSDA);  
      008A57 4B 20            [ 1]  183 	push	#0x20
      008A59 4B 05            [ 1]  184 	push	#0x05
      008A5B 4B 50            [ 1]  185 	push	#0x50
      008A5D CD 96 A8         [ 4]  186 	call	_GPIO_WriteLow
      008A60 5B 03            [ 2]  187 	addw	sp, #3
                                    188 ;	driver/dht12.c: 133: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008A62 4B 10            [ 1]  189 	push	#0x10
      008A64 4B 05            [ 1]  190 	push	#0x05
      008A66 4B 50            [ 1]  191 	push	#0x50
      008A68 CD 96 A1         [ 4]  192 	call	_GPIO_WriteHigh
      008A6B 5B 03            [ 2]  193 	addw	sp, #3
                                    194 ;	driver/dht12.c: 137: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
      008A6D 4B 20            [ 1]  195 	push	#0x20
      008A6F 4B 05            [ 1]  196 	push	#0x05
      008A71 4B 50            [ 1]  197 	push	#0x50
      008A73 CD 96 A1         [ 4]  198 	call	_GPIO_WriteHigh
      008A76 5B 03            [ 2]  199 	addw	sp, #3
                                    200 ;	driver/dht12.c: 139: }  
      008A78 81               [ 4]  201 	ret
                                    202 ;	driver/dht12.c: 153: void I2C_Rack(void)  
                                    203 ;	-----------------------------------------
                                    204 ;	 function I2C_Rack
                                    205 ;	-----------------------------------------
      008A79                        206 _I2C_Rack:
                                    207 ;	driver/dht12.c: 156: I2CDataInOut(I2CDataOut);
      008A79 4B 00            [ 1]  208 	push	#0x00
      008A7B CD 89 F3         [ 4]  209 	call	_I2CDataInOut
      008A7E 84               [ 1]  210 	pop	a
                                    211 ;	driver/dht12.c: 158: GPIO_WriteLow(I2C_PORT, I2CSDA);  
      008A7F 4B 20            [ 1]  212 	push	#0x20
      008A81 4B 05            [ 1]  213 	push	#0x05
      008A83 4B 50            [ 1]  214 	push	#0x50
      008A85 CD 96 A8         [ 4]  215 	call	_GPIO_WriteLow
      008A88 5B 03            [ 2]  216 	addw	sp, #3
                                    217 ;	driver/dht12.c: 161: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008A8A 4B 10            [ 1]  218 	push	#0x10
      008A8C 4B 05            [ 1]  219 	push	#0x05
      008A8E 4B 50            [ 1]  220 	push	#0x50
      008A90 CD 96 A8         [ 4]  221 	call	_GPIO_WriteLow
      008A93 5B 03            [ 2]  222 	addw	sp, #3
                                    223 ;	driver/dht12.c: 163: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008A95 4B 10            [ 1]  224 	push	#0x10
      008A97 4B 05            [ 1]  225 	push	#0x05
      008A99 4B 50            [ 1]  226 	push	#0x50
      008A9B CD 96 A1         [ 4]  227 	call	_GPIO_WriteHigh
      008A9E 5B 03            [ 2]  228 	addw	sp, #3
                                    229 ;	driver/dht12.c: 167: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008AA0 4B 10            [ 1]  230 	push	#0x10
      008AA2 4B 05            [ 1]  231 	push	#0x05
      008AA4 4B 50            [ 1]  232 	push	#0x50
      008AA6 CD 96 A8         [ 4]  233 	call	_GPIO_WriteLow
      008AA9 5B 03            [ 2]  234 	addw	sp, #3
                                    235 ;	driver/dht12.c: 171: }  
      008AAB 81               [ 4]  236 	ret
                                    237 ;	driver/dht12.c: 186: void I2C_nAck (void)  
                                    238 ;	-----------------------------------------
                                    239 ;	 function I2C_nAck
                                    240 ;	-----------------------------------------
      008AAC                        241 _I2C_nAck:
                                    242 ;	driver/dht12.c: 189: I2CDataInOut(I2CDataOut);
      008AAC 4B 00            [ 1]  243 	push	#0x00
      008AAE CD 89 F3         [ 4]  244 	call	_I2CDataInOut
      008AB1 84               [ 1]  245 	pop	a
                                    246 ;	driver/dht12.c: 192: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
      008AB2 4B 20            [ 1]  247 	push	#0x20
      008AB4 4B 05            [ 1]  248 	push	#0x05
      008AB6 4B 50            [ 1]  249 	push	#0x50
      008AB8 CD 96 A1         [ 4]  250 	call	_GPIO_WriteHigh
      008ABB 5B 03            [ 2]  251 	addw	sp, #3
                                    252 ;	driver/dht12.c: 196: GPIO_WriteLow(I2C_PORT, I2CSCL); 
      008ABD 4B 10            [ 1]  253 	push	#0x10
      008ABF 4B 05            [ 1]  254 	push	#0x05
      008AC1 4B 50            [ 1]  255 	push	#0x50
      008AC3 CD 96 A8         [ 4]  256 	call	_GPIO_WriteLow
      008AC6 5B 03            [ 2]  257 	addw	sp, #3
                                    258 ;	driver/dht12.c: 198: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008AC8 4B 10            [ 1]  259 	push	#0x10
      008ACA 4B 05            [ 1]  260 	push	#0x05
      008ACC 4B 50            [ 1]  261 	push	#0x50
      008ACE CD 96 A1         [ 4]  262 	call	_GPIO_WriteHigh
      008AD1 5B 03            [ 2]  263 	addw	sp, #3
                                    264 ;	driver/dht12.c: 202: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008AD3 4B 10            [ 1]  265 	push	#0x10
      008AD5 4B 05            [ 1]  266 	push	#0x05
      008AD7 4B 50            [ 1]  267 	push	#0x50
      008AD9 CD 96 A8         [ 4]  268 	call	_GPIO_WriteLow
      008ADC 5B 03            [ 2]  269 	addw	sp, #3
                                    270 ;	driver/dht12.c: 206: }  
      008ADE 81               [ 4]  271 	ret
                                    272 ;	driver/dht12.c: 216: bool SendByte(UCHAR I2cData)  
                                    273 ;	-----------------------------------------
                                    274 ;	 function SendByte
                                    275 ;	-----------------------------------------
      008ADF                        276 _SendByte:
      008ADF 52 03            [ 2]  277 	sub	sp, #3
                                    278 ;	driver/dht12.c: 225: for(i=0; i<8; i++)  
      008AE1 0F 03            [ 1]  279 	clr	(0x03, sp)
      008AE3                        280 00112$:
                                    281 ;	driver/dht12.c: 229: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008AE3 4B 10            [ 1]  282 	push	#0x10
      008AE5 4B 05            [ 1]  283 	push	#0x05
      008AE7 4B 50            [ 1]  284 	push	#0x50
      008AE9 CD 96 A8         [ 4]  285 	call	_GPIO_WriteLow
      008AEC 5B 03            [ 2]  286 	addw	sp, #3
                                    287 ;	driver/dht12.c: 233: if(I2cData & 0x80)  
      008AEE 7B 06            [ 1]  288 	ld	a, (0x06, sp)
      008AF0 2A 0D            [ 1]  289 	jrpl	00102$
                                    290 ;	driver/dht12.c: 235: {GPIO_WriteHigh(I2C_PORT, I2CSDA);}  
      008AF2 4B 20            [ 1]  291 	push	#0x20
      008AF4 4B 05            [ 1]  292 	push	#0x05
      008AF6 4B 50            [ 1]  293 	push	#0x50
      008AF8 CD 96 A1         [ 4]  294 	call	_GPIO_WriteHigh
      008AFB 5B 03            [ 2]  295 	addw	sp, #3
      008AFD 20 0B            [ 2]  296 	jra	00103$
      008AFF                        297 00102$:
                                    298 ;	driver/dht12.c: 239: {GPIO_WriteLow(I2C_PORT, I2CSDA);}  
      008AFF 4B 20            [ 1]  299 	push	#0x20
      008B01 4B 05            [ 1]  300 	push	#0x05
      008B03 4B 50            [ 1]  301 	push	#0x50
      008B05 CD 96 A8         [ 4]  302 	call	_GPIO_WriteLow
      008B08 5B 03            [ 2]  303 	addw	sp, #3
      008B0A                        304 00103$:
                                    305 ;	driver/dht12.c: 241: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008B0A 4B 10            [ 1]  306 	push	#0x10
      008B0C 4B 05            [ 1]  307 	push	#0x05
      008B0E 4B 50            [ 1]  308 	push	#0x50
      008B10 CD 96 A1         [ 4]  309 	call	_GPIO_WriteHigh
      008B13 5B 03            [ 2]  310 	addw	sp, #3
                                    311 ;	driver/dht12.c: 245: I2cData <<= 1;  
      008B15 08 06            [ 1]  312 	sll	(0x06, sp)
                                    313 ;	driver/dht12.c: 225: for(i=0; i<8; i++)  
      008B17 0C 03            [ 1]  314 	inc	(0x03, sp)
      008B19 7B 03            [ 1]  315 	ld	a, (0x03, sp)
      008B1B A1 08            [ 1]  316 	cp	a, #0x08
      008B1D 25 C4            [ 1]  317 	jrc	00112$
                                    318 ;	driver/dht12.c: 249: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008B1F 4B 10            [ 1]  319 	push	#0x10
      008B21 4B 05            [ 1]  320 	push	#0x05
      008B23 4B 50            [ 1]  321 	push	#0x50
      008B25 CD 96 A8         [ 4]  322 	call	_GPIO_WriteLow
      008B28 5B 03            [ 2]  323 	addw	sp, #3
                                    324 ;	driver/dht12.c: 251: GPIO_WriteHigh(I2C_PORT, I2CSDA);//发送完一字节，接收应答  
      008B2A 4B 20            [ 1]  325 	push	#0x20
      008B2C 4B 05            [ 1]  326 	push	#0x05
      008B2E 4B 50            [ 1]  327 	push	#0x50
      008B30 CD 96 A1         [ 4]  328 	call	_GPIO_WriteHigh
      008B33 5B 03            [ 2]  329 	addw	sp, #3
                                    330 ;	driver/dht12.c: 255: I2CDataInOut(I2CDataIn);  
      008B35 4B 01            [ 1]  331 	push	#0x01
      008B37 CD 89 F3         [ 4]  332 	call	_I2CDataInOut
      008B3A 84               [ 1]  333 	pop	a
                                    334 ;	driver/dht12.c: 258: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008B3B 4B 10            [ 1]  335 	push	#0x10
      008B3D 4B 05            [ 1]  336 	push	#0x05
      008B3F 4B 50            [ 1]  337 	push	#0x50
      008B41 CD 96 A1         [ 4]  338 	call	_GPIO_WriteHigh
      008B44 5B 03            [ 2]  339 	addw	sp, #3
                                    340 ;	driver/dht12.c: 280: while(GPIO_ReadInputPin(I2C_PORT,I2CSDA) &&count--)
      008B46 AE 03 E8         [ 2]  341 	ldw	x, #0x03e8
      008B49 1F 01            [ 2]  342 	ldw	(0x01, sp), x
      008B4B                        343 00106$:
      008B4B 4B 20            [ 1]  344 	push	#0x20
      008B4D 4B 05            [ 1]  345 	push	#0x05
      008B4F 4B 50            [ 1]  346 	push	#0x50
      008B51 CD 96 C6         [ 4]  347 	call	_GPIO_ReadInputPin
      008B54 5B 03            [ 2]  348 	addw	sp, #3
      008B56 4D               [ 1]  349 	tnz	a
      008B57 27 0F            [ 1]  350 	jreq	00108$
      008B59 1E 01            [ 2]  351 	ldw	x, (0x01, sp)
      008B5B 16 01            [ 2]  352 	ldw	y, (0x01, sp)
      008B5D 90 5A            [ 2]  353 	decw	y
      008B5F 17 01            [ 2]  354 	ldw	(0x01, sp), y
      008B61 5D               [ 2]  355 	tnzw	x
      008B62 27 04            [ 1]  356 	jreq	00108$
                                    357 ;	driver/dht12.c: 281: {nop();nop();};
      008B64 9D               [ 1]  358 	nop
      008B65 9D               [ 1]  359 	nop
      008B66 20 E3            [ 2]  360 	jra	00106$
      008B68                        361 00108$:
                                    362 ;	driver/dht12.c: 282: GPIO_WriteLow(I2C_PORT, I2CSCL);
      008B68 4B 10            [ 1]  363 	push	#0x10
      008B6A 4B 05            [ 1]  364 	push	#0x05
      008B6C 4B 50            [ 1]  365 	push	#0x50
      008B6E CD 96 A8         [ 4]  366 	call	_GPIO_WriteLow
      008B71 5B 03            [ 2]  367 	addw	sp, #3
                                    368 ;	driver/dht12.c: 287: I2CDataInOut(I2CDataOut);  
      008B73 4B 00            [ 1]  369 	push	#0x00
      008B75 CD 89 F3         [ 4]  370 	call	_I2CDataInOut
      008B78 84               [ 1]  371 	pop	a
                                    372 ;	driver/dht12.c: 288: if(count)
      008B79 1E 01            [ 2]  373 	ldw	x, (0x01, sp)
      008B7B 27 03            [ 1]  374 	jreq	00110$
                                    375 ;	driver/dht12.c: 291: I2CStatus = I2C_CRR;  
      008B7D A6 01            [ 1]  376 	ld	a, #0x01
                                    377 ;	driver/dht12.c: 299: I2CStatus = I2C_ERR;  
      008B7F 21                     378 	.byte 0x21
      008B80                        379 00110$:
      008B80 4F               [ 1]  380 	clr	a
      008B81                        381 00111$:
                                    382 ;	driver/dht12.c: 302: return I2CStatus;  
                                    383 ;	driver/dht12.c: 304: }  
      008B81 5B 03            [ 2]  384 	addw	sp, #3
      008B83 81               [ 4]  385 	ret
                                    386 ;	driver/dht12.c: 319: UCHAR RcvByte(void)  
                                    387 ;	-----------------------------------------
                                    388 ;	 function RcvByte
                                    389 ;	-----------------------------------------
      008B84                        390 _RcvByte:
      008B84 52 02            [ 2]  391 	sub	sp, #2
                                    392 ;	driver/dht12.c: 325: UCHAR ReadByte=0;  
      008B86 0F 01            [ 1]  393 	clr	(0x01, sp)
                                    394 ;	driver/dht12.c: 327: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
      008B88 4B 20            [ 1]  395 	push	#0x20
      008B8A 4B 05            [ 1]  396 	push	#0x05
      008B8C 4B 50            [ 1]  397 	push	#0x50
      008B8E CD 96 A1         [ 4]  398 	call	_GPIO_WriteHigh
      008B91 5B 03            [ 2]  399 	addw	sp, #3
                                    400 ;	driver/dht12.c: 330: I2CDataInOut(I2CDataIn);  
      008B93 4B 01            [ 1]  401 	push	#0x01
      008B95 CD 89 F3         [ 4]  402 	call	_I2CDataInOut
      008B98 84               [ 1]  403 	pop	a
                                    404 ;	driver/dht12.c: 334: for(i=0; i<8; i++)  
      008B99 0F 02            [ 1]  405 	clr	(0x02, sp)
      008B9B                        406 00104$:
                                    407 ;	driver/dht12.c: 338: ReadByte <<= 1;  
      008B9B 7B 01            [ 1]  408 	ld	a, (0x01, sp)
      008B9D 48               [ 1]  409 	sll	a
      008B9E 6B 01            [ 1]  410 	ld	(0x01, sp), a
                                    411 ;	driver/dht12.c: 340: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008BA0 4B 10            [ 1]  412 	push	#0x10
      008BA2 4B 05            [ 1]  413 	push	#0x05
      008BA4 4B 50            [ 1]  414 	push	#0x50
      008BA6 CD 96 A8         [ 4]  415 	call	_GPIO_WriteLow
      008BA9 5B 03            [ 2]  416 	addw	sp, #3
                                    417 ;	driver/dht12.c: 344: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008BAB 4B 10            [ 1]  418 	push	#0x10
      008BAD 4B 05            [ 1]  419 	push	#0x05
      008BAF 4B 50            [ 1]  420 	push	#0x50
      008BB1 CD 96 A1         [ 4]  421 	call	_GPIO_WriteHigh
      008BB4 5B 03            [ 2]  422 	addw	sp, #3
                                    423 ;	driver/dht12.c: 349: if(GPIO_ReadInputPin(I2C_PORT,I2CSDA) !=RESET)  
      008BB6 4B 20            [ 1]  424 	push	#0x20
      008BB8 4B 05            [ 1]  425 	push	#0x05
      008BBA 4B 50            [ 1]  426 	push	#0x50
      008BBC CD 96 C6         [ 4]  427 	call	_GPIO_ReadInputPin
      008BBF 5B 03            [ 2]  428 	addw	sp, #3
      008BC1 4D               [ 1]  429 	tnz	a
      008BC2 27 06            [ 1]  430 	jreq	00105$
                                    431 ;	driver/dht12.c: 351: {ReadByte |= 0x01;}  
      008BC4 7B 01            [ 1]  432 	ld	a, (0x01, sp)
      008BC6 AA 01            [ 1]  433 	or	a, #0x01
      008BC8 6B 01            [ 1]  434 	ld	(0x01, sp), a
      008BCA                        435 00105$:
                                    436 ;	driver/dht12.c: 334: for(i=0; i<8; i++)  
      008BCA 0C 02            [ 1]  437 	inc	(0x02, sp)
      008BCC 7B 02            [ 1]  438 	ld	a, (0x02, sp)
      008BCE A1 08            [ 1]  439 	cp	a, #0x08
      008BD0 25 C9            [ 1]  440 	jrc	00104$
                                    441 ;	driver/dht12.c: 357: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008BD2 4B 10            [ 1]  442 	push	#0x10
      008BD4 4B 05            [ 1]  443 	push	#0x05
      008BD6 4B 50            [ 1]  444 	push	#0x50
      008BD8 CD 96 A8         [ 4]  445 	call	_GPIO_WriteLow
      008BDB 5B 03            [ 2]  446 	addw	sp, #3
                                    447 ;	driver/dht12.c: 359: I2CDataInOut(I2CDataOut);  
      008BDD 4B 00            [ 1]  448 	push	#0x00
      008BDF CD 89 F3         [ 4]  449 	call	_I2CDataInOut
      008BE2 84               [ 1]  450 	pop	a
                                    451 ;	driver/dht12.c: 363: return ReadByte;  
      008BE3 7B 01            [ 1]  452 	ld	a, (0x01, sp)
                                    453 ;	driver/dht12.c: 365: }  
      008BE5 5B 02            [ 2]  454 	addw	sp, #2
      008BE7 81               [ 4]  455 	ret
                                    456 ;	driver/dht12.c: 384: bool I2C_Read(UCHAR wrDAdr,UCHAR wordAdr,UCHAR *pRdDat,UCHAR num)  
                                    457 ;	-----------------------------------------
                                    458 ;	 function I2C_Read
                                    459 ;	-----------------------------------------
      008BE8                        460 _I2C_Read:
      008BE8 52 09            [ 2]  461 	sub	sp, #9
                                    462 ;	driver/dht12.c: 394: rdDAdr = wrDAdr+1; //读器件地址为写地址加1  
      008BEA 7B 0C            [ 1]  463 	ld	a, (0x0c, sp)
      008BEC 4C               [ 1]  464 	inc	a
      008BED 6B 08            [ 1]  465 	ld	(0x08, sp), a
                                    466 ;	driver/dht12.c: 396: I2C_Start();  /*启动I2C*/  
      008BEF CD 8A 13         [ 4]  467 	call	_I2C_Start
                                    468 ;	driver/dht12.c: 400: I2CAck = SendByte(wrDAdr); /*发写器件地址*/  
      008BF2 7B 0C            [ 1]  469 	ld	a, (0x0c, sp)
      008BF4 88               [ 1]  470 	push	a
      008BF5 CD 8A DF         [ 4]  471 	call	_SendByte
      008BF8 5B 01            [ 2]  472 	addw	sp, #1
                                    473 ;	driver/dht12.c: 402: if(!I2CAck)  
      008BFA 6B 07            [ 1]  474 	ld	(0x07, sp), a
      008BFC 26 03            [ 1]  475 	jrne	00102$
                                    476 ;	driver/dht12.c: 406: return I2C_ERR;  
      008BFE 4F               [ 1]  477 	clr	a
      008BFF 20 64            [ 2]  478 	jra	00113$
      008C01                        479 00102$:
                                    480 ;	driver/dht12.c: 410: I2CAck = SendByte(wordAdr); /*发寄存器地址*/  
      008C01 7B 0D            [ 1]  481 	ld	a, (0x0d, sp)
      008C03 88               [ 1]  482 	push	a
      008C04 CD 8A DF         [ 4]  483 	call	_SendByte
      008C07 5B 01            [ 2]  484 	addw	sp, #1
                                    485 ;	driver/dht12.c: 412: if(!I2CAck)  
      008C09 4D               [ 1]  486 	tnz	a
      008C0A 26 03            [ 1]  487 	jrne	00104$
                                    488 ;	driver/dht12.c: 416: return I2C_ERR;  
      008C0C 4F               [ 1]  489 	clr	a
      008C0D 20 56            [ 2]  490 	jra	00113$
      008C0F                        491 00104$:
                                    492 ;	driver/dht12.c: 420: I2C_Start();   /*重启I2C*/  
      008C0F CD 8A 13         [ 4]  493 	call	_I2C_Start
                                    494 ;	driver/dht12.c: 422: I2CAck = SendByte(rdDAdr); /*发读器件地址*/  
      008C12 7B 08            [ 1]  495 	ld	a, (0x08, sp)
      008C14 88               [ 1]  496 	push	a
      008C15 CD 8A DF         [ 4]  497 	call	_SendByte
      008C18 5B 01            [ 2]  498 	addw	sp, #1
                                    499 ;	driver/dht12.c: 424: if(!I2CAck)  
      008C1A 4D               [ 1]  500 	tnz	a
      008C1B 26 03            [ 1]  501 	jrne	00119$
                                    502 ;	driver/dht12.c: 428: return I2C_ERR;  
      008C1D 4F               [ 1]  503 	clr	a
      008C1E 20 45            [ 2]  504 	jra	00113$
                                    505 ;	driver/dht12.c: 434: for(i=0;i<num-1;i++)  
      008C20                        506 00119$:
      008C20 0F 09            [ 1]  507 	clr	(0x09, sp)
      008C22                        508 00111$:
      008C22 5F               [ 1]  509 	clrw	x
      008C23 7B 10            [ 1]  510 	ld	a, (0x10, sp)
      008C25 97               [ 1]  511 	ld	xl, a
      008C26 5A               [ 2]  512 	decw	x
      008C27 1F 05            [ 2]  513 	ldw	(0x05, sp), x
      008C29 7B 09            [ 1]  514 	ld	a, (0x09, sp)
      008C2B 6B 04            [ 1]  515 	ld	(0x04, sp), a
      008C2D 0F 03            [ 1]  516 	clr	(0x03, sp)
                                    517 ;	driver/dht12.c: 438: *(pRdDat+i) = RcvByte();  
      008C2F 5F               [ 1]  518 	clrw	x
      008C30 7B 09            [ 1]  519 	ld	a, (0x09, sp)
      008C32 97               [ 1]  520 	ld	xl, a
      008C33 72 FB 0E         [ 2]  521 	addw	x, (0x0e, sp)
      008C36 1F 01            [ 2]  522 	ldw	(0x01, sp), x
                                    523 ;	driver/dht12.c: 434: for(i=0;i<num-1;i++)  
      008C38 1E 03            [ 2]  524 	ldw	x, (0x03, sp)
      008C3A 13 05            [ 2]  525 	cpw	x, (0x05, sp)
      008C3C 2E 0D            [ 1]  526 	jrsge	00107$
                                    527 ;	driver/dht12.c: 438: *(pRdDat+i) = RcvByte();  
      008C3E CD 8B 84         [ 4]  528 	call	_RcvByte
      008C41 1E 01            [ 2]  529 	ldw	x, (0x01, sp)
      008C43 F7               [ 1]  530 	ld	(x), a
                                    531 ;	driver/dht12.c: 440: I2C_Rack();  
      008C44 CD 8A 79         [ 4]  532 	call	_I2C_Rack
                                    533 ;	driver/dht12.c: 434: for(i=0;i<num-1;i++)  
      008C47 0C 09            [ 1]  534 	inc	(0x09, sp)
      008C49 20 D7            [ 2]  535 	jra	00111$
      008C4B                        536 00107$:
                                    537 ;	driver/dht12.c: 444: if(i==num-1)  
      008C4B 1E 03            [ 2]  538 	ldw	x, (0x03, sp)
      008C4D 13 05            [ 2]  539 	cpw	x, (0x05, sp)
      008C4F 26 0F            [ 1]  540 	jrne	00109$
                                    541 ;	driver/dht12.c: 448: *(pRdDat+i) = RcvByte();  
      008C51 CD 8B 84         [ 4]  542 	call	_RcvByte
      008C54 1E 01            [ 2]  543 	ldw	x, (0x01, sp)
      008C56 F7               [ 1]  544 	ld	(x), a
                                    545 ;	driver/dht12.c: 450: I2C_Rack();
      008C57 CD 8A 79         [ 4]  546 	call	_I2C_Rack
                                    547 ;	driver/dht12.c: 451: RcvByte();
      008C5A CD 8B 84         [ 4]  548 	call	_RcvByte
                                    549 ;	driver/dht12.c: 453: I2C_nAck();  
      008C5D CD 8A AC         [ 4]  550 	call	_I2C_nAck
      008C60                        551 00109$:
                                    552 ;	driver/dht12.c: 457: I2C_Stop();  
      008C60 CD 8A 46         [ 4]  553 	call	_I2C_Stop
                                    554 ;	driver/dht12.c: 458: return I2C_CRR;  
      008C63 A6 01            [ 1]  555 	ld	a, #0x01
      008C65                        556 00113$:
                                    557 ;	driver/dht12.c: 460: }  
      008C65 5B 09            [ 2]  558 	addw	sp, #9
      008C67 81               [ 4]  559 	ret
                                    560 ;	driver/dht12.c: 542: u8 i2c_read(u8 dev_addr,u8 Addr)
                                    561 ;	-----------------------------------------
                                    562 ;	 function i2c_read
                                    563 ;	-----------------------------------------
      008C68                        564 _i2c_read:
      008C68 88               [ 1]  565 	push	a
                                    566 ;	driver/dht12.c: 545: if(I2C_Read(dev_addr,Addr,&temp,1))
      008C69 96               [ 1]  567 	ldw	x, sp
      008C6A 5C               [ 1]  568 	incw	x
      008C6B 4B 01            [ 1]  569 	push	#0x01
      008C6D 89               [ 2]  570 	pushw	x
      008C6E 7B 08            [ 1]  571 	ld	a, (0x08, sp)
      008C70 88               [ 1]  572 	push	a
      008C71 7B 08            [ 1]  573 	ld	a, (0x08, sp)
      008C73 88               [ 1]  574 	push	a
      008C74 CD 8B E8         [ 4]  575 	call	_I2C_Read
      008C77 5B 05            [ 2]  576 	addw	sp, #5
      008C79 4D               [ 1]  577 	tnz	a
      008C7A 27 03            [ 1]  578 	jreq	00102$
                                    579 ;	driver/dht12.c: 546: return temp;
      008C7C 7B 01            [ 1]  580 	ld	a, (0x01, sp)
                                    581 ;	driver/dht12.c: 547: else return 0;
      008C7E 21                     582 	.byte 0x21
      008C7F                        583 00102$:
      008C7F 4F               [ 1]  584 	clr	a
      008C80                        585 00104$:
                                    586 ;	driver/dht12.c: 548: }
      008C80 5B 01            [ 2]  587 	addw	sp, #1
      008C82 81               [ 4]  588 	ret
                                    589 ;	driver/dht12.c: 550: void ReadDHT12(DHT12_DATA *data) 
                                    590 ;	-----------------------------------------
                                    591 ;	 function ReadDHT12
                                    592 ;	-----------------------------------------
      008C83                        593 _ReadDHT12:
      008C83 52 02            [ 2]  594 	sub	sp, #2
                                    595 ;	driver/dht12.c: 552: i2c_init();
      008C85 CD 89 BD         [ 4]  596 	call	_i2c_init
                                    597 ;	driver/dht12.c: 553: data->W=i2c_read(0xB8,0x00);
      008C88 16 05            [ 2]  598 	ldw	y, (0x05, sp)
      008C8A 17 01            [ 2]  599 	ldw	(0x01, sp), y
      008C8C 93               [ 1]  600 	ldw	x, y
      008C8D 5C               [ 1]  601 	incw	x
      008C8E 5C               [ 1]  602 	incw	x
      008C8F 89               [ 2]  603 	pushw	x
      008C90 4B 00            [ 1]  604 	push	#0x00
      008C92 4B B8            [ 1]  605 	push	#0xb8
      008C94 CD 8C 68         [ 4]  606 	call	_i2c_read
      008C97 5B 02            [ 2]  607 	addw	sp, #2
      008C99 85               [ 2]  608 	popw	x
      008C9A F7               [ 1]  609 	ld	(x), a
                                    610 ;	driver/dht12.c: 554: data->W1=i2c_read(0xB8,0x01);
      008C9B 1E 01            [ 2]  611 	ldw	x, (0x01, sp)
      008C9D 1C 00 03         [ 2]  612 	addw	x, #0x0003
      008CA0 89               [ 2]  613 	pushw	x
      008CA1 4B 01            [ 1]  614 	push	#0x01
      008CA3 4B B8            [ 1]  615 	push	#0xb8
      008CA5 CD 8C 68         [ 4]  616 	call	_i2c_read
      008CA8 5B 02            [ 2]  617 	addw	sp, #2
      008CAA 85               [ 2]  618 	popw	x
      008CAB F7               [ 1]  619 	ld	(x), a
                                    620 ;	driver/dht12.c: 555: data->T=i2c_read(0xB8,0x02);
      008CAC 4B 02            [ 1]  621 	push	#0x02
      008CAE 4B B8            [ 1]  622 	push	#0xb8
      008CB0 CD 8C 68         [ 4]  623 	call	_i2c_read
      008CB3 5B 02            [ 2]  624 	addw	sp, #2
      008CB5 1E 01            [ 2]  625 	ldw	x, (0x01, sp)
      008CB7 F7               [ 1]  626 	ld	(x), a
                                    627 ;	driver/dht12.c: 556: data->T1=i2c_read(0xB8,0x03);
      008CB8 1E 01            [ 2]  628 	ldw	x, (0x01, sp)
      008CBA 5C               [ 1]  629 	incw	x
      008CBB 89               [ 2]  630 	pushw	x
      008CBC 4B 03            [ 1]  631 	push	#0x03
      008CBE 4B B8            [ 1]  632 	push	#0xb8
      008CC0 CD 8C 68         [ 4]  633 	call	_i2c_read
      008CC3 5B 02            [ 2]  634 	addw	sp, #2
      008CC5 85               [ 2]  635 	popw	x
      008CC6 F7               [ 1]  636 	ld	(x), a
                                    637 ;	driver/dht12.c: 557: data->sum=i2c_read(0xB8,0x04);
      008CC7 1E 01            [ 2]  638 	ldw	x, (0x01, sp)
      008CC9 1C 00 04         [ 2]  639 	addw	x, #0x0004
      008CCC 89               [ 2]  640 	pushw	x
      008CCD 4B 04            [ 1]  641 	push	#0x04
      008CCF 4B B8            [ 1]  642 	push	#0xb8
      008CD1 CD 8C 68         [ 4]  643 	call	_i2c_read
      008CD4 5B 02            [ 2]  644 	addw	sp, #2
      008CD6 85               [ 2]  645 	popw	x
      008CD7 F7               [ 1]  646 	ld	(x), a
                                    647 ;	driver/dht12.c: 558: i2c_deinit();
      008CD8 CD 89 D8         [ 4]  648 	call	_i2c_deinit
                                    649 ;	driver/dht12.c: 559: }
      008CDB 5B 02            [ 2]  650 	addw	sp, #2
      008CDD 81               [ 4]  651 	ret
                                    652 	.area CODE
                                    653 	.area CONST
                                    654 	.area INITIALIZER
                                    655 	.area CABS (ABS)
