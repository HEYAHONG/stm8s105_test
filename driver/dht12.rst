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
                                     64 ;	driver/dht12.c: 38: void i2c_init()
                                     65 ;	-----------------------------------------
                                     66 ;	 function i2c_init
                                     67 ;	-----------------------------------------
      008A64                         68 _i2c_init:
                                     69 ;	driver/dht12.c: 40: GPIO_Init(GPIOB,GPIO_PIN_4,GPIO_MODE_OUT_OD_LOW_FAST);
      008A64 4B A0            [ 1]   70 	push	#0xa0
      008A66 4B 10            [ 1]   71 	push	#0x10
      008A68 4B 05            [ 1]   72 	push	#0x05
      008A6A 4B 50            [ 1]   73 	push	#0x50
      008A6C CD 96 7D         [ 4]   74 	call	_GPIO_Init
      008A6F 5B 04            [ 2]   75 	addw	sp, #4
                                     76 ;	driver/dht12.c: 41: GPIO_Init(GPIOB,GPIO_PIN_5,GPIO_MODE_OUT_OD_LOW_FAST);
      008A71 4B A0            [ 1]   77 	push	#0xa0
      008A73 4B 20            [ 1]   78 	push	#0x20
      008A75 4B 05            [ 1]   79 	push	#0x05
      008A77 4B 50            [ 1]   80 	push	#0x50
      008A79 CD 96 7D         [ 4]   81 	call	_GPIO_Init
      008A7C 5B 04            [ 2]   82 	addw	sp, #4
                                     83 ;	driver/dht12.c: 42: }
      008A7E 81               [ 4]   84 	ret
                                     85 ;	driver/dht12.c: 43: void i2c_deinit() 
                                     86 ;	-----------------------------------------
                                     87 ;	 function i2c_deinit
                                     88 ;	-----------------------------------------
      008A7F                         89 _i2c_deinit:
                                     90 ;	driver/dht12.c: 46: GPIO_Init(GPIOB,GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
      008A7F 4B 00            [ 1]   91 	push	#0x00
      008A81 4B 10            [ 1]   92 	push	#0x10
      008A83 4B 05            [ 1]   93 	push	#0x05
      008A85 4B 50            [ 1]   94 	push	#0x50
      008A87 CD 96 7D         [ 4]   95 	call	_GPIO_Init
      008A8A 5B 04            [ 2]   96 	addw	sp, #4
                                     97 ;	driver/dht12.c: 47: GPIO_Init(GPIOB,GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);
      008A8C 4B 00            [ 1]   98 	push	#0x00
      008A8E 4B 20            [ 1]   99 	push	#0x20
      008A90 4B 05            [ 1]  100 	push	#0x05
      008A92 4B 50            [ 1]  101 	push	#0x50
      008A94 CD 96 7D         [ 4]  102 	call	_GPIO_Init
      008A97 5B 04            [ 2]  103 	addw	sp, #4
                                    104 ;	driver/dht12.c: 48: }
      008A99 81               [ 4]  105 	ret
                                    106 ;	driver/dht12.c: 63: void I2CDataInOut(bool InOut)  
                                    107 ;	-----------------------------------------
                                    108 ;	 function I2CDataInOut
                                    109 ;	-----------------------------------------
      008A9A                        110 _I2CDataInOut:
                                    111 ;	driver/dht12.c: 67: if(InOut)  
      008A9A 0D 03            [ 1]  112 	tnz	(0x03, sp)
      008A9C 27 0E            [ 1]  113 	jreq	00102$
                                    114 ;	driver/dht12.c: 71: GPIO_Init(I2C_PORT,I2CSDA,GPIO_MODE_IN_FL_NO_IT);  
      008A9E 4B 00            [ 1]  115 	push	#0x00
      008AA0 4B 20            [ 1]  116 	push	#0x20
      008AA2 4B 05            [ 1]  117 	push	#0x05
      008AA4 4B 50            [ 1]  118 	push	#0x50
      008AA6 CD 96 7D         [ 4]  119 	call	_GPIO_Init
      008AA9 5B 04            [ 2]  120 	addw	sp, #4
      008AAB 81               [ 4]  121 	ret
      008AAC                        122 00102$:
                                    123 ;	driver/dht12.c: 79: GPIO_Init(I2C_PORT,I2CSDA,GPIO_MODE_OUT_PP_LOW_FAST);  
      008AAC 4B E0            [ 1]  124 	push	#0xe0
      008AAE 4B 20            [ 1]  125 	push	#0x20
      008AB0 4B 05            [ 1]  126 	push	#0x05
      008AB2 4B 50            [ 1]  127 	push	#0x50
      008AB4 CD 96 7D         [ 4]  128 	call	_GPIO_Init
      008AB7 5B 04            [ 2]  129 	addw	sp, #4
                                    130 ;	driver/dht12.c: 83: }  
      008AB9 81               [ 4]  131 	ret
                                    132 ;	driver/dht12.c: 95: void I2C_Start (void)  
                                    133 ;	-----------------------------------------
                                    134 ;	 function I2C_Start
                                    135 ;	-----------------------------------------
      008ABA                        136 _I2C_Start:
                                    137 ;	driver/dht12.c: 98: I2CDataInOut(I2CDataOut);
      008ABA 4B 00            [ 1]  138 	push	#0x00
      008ABC CD 8A 9A         [ 4]  139 	call	_I2CDataInOut
      008ABF 84               [ 1]  140 	pop	a
                                    141 ;	driver/dht12.c: 100: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
      008AC0 4B 20            [ 1]  142 	push	#0x20
      008AC2 4B 05            [ 1]  143 	push	#0x05
      008AC4 4B 50            [ 1]  144 	push	#0x50
      008AC6 CD 96 F8         [ 4]  145 	call	_GPIO_WriteHigh
      008AC9 5B 03            [ 2]  146 	addw	sp, #3
                                    147 ;	driver/dht12.c: 104: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008ACB 4B 10            [ 1]  148 	push	#0x10
      008ACD 4B 05            [ 1]  149 	push	#0x05
      008ACF 4B 50            [ 1]  150 	push	#0x50
      008AD1 CD 96 F8         [ 4]  151 	call	_GPIO_WriteHigh
      008AD4 5B 03            [ 2]  152 	addw	sp, #3
                                    153 ;	driver/dht12.c: 108: GPIO_WriteLow(I2C_PORT, I2CSDA);  
      008AD6 4B 20            [ 1]  154 	push	#0x20
      008AD8 4B 05            [ 1]  155 	push	#0x05
      008ADA 4B 50            [ 1]  156 	push	#0x50
      008ADC CD 96 FF         [ 4]  157 	call	_GPIO_WriteLow
      008ADF 5B 03            [ 2]  158 	addw	sp, #3
                                    159 ;	driver/dht12.c: 111: GPIO_WriteLow(I2C_PORT, I2CSCL);    
      008AE1 4B 10            [ 1]  160 	push	#0x10
      008AE3 4B 05            [ 1]  161 	push	#0x05
      008AE5 4B 50            [ 1]  162 	push	#0x50
      008AE7 CD 96 FF         [ 4]  163 	call	_GPIO_WriteLow
      008AEA 5B 03            [ 2]  164 	addw	sp, #3
                                    165 ;	driver/dht12.c: 112: }  
      008AEC 81               [ 4]  166 	ret
                                    167 ;	driver/dht12.c: 122: void I2C_Stop (void)  
                                    168 ;	-----------------------------------------
                                    169 ;	 function I2C_Stop
                                    170 ;	-----------------------------------------
      008AED                        171 _I2C_Stop:
                                    172 ;	driver/dht12.c: 125: I2CDataInOut(I2CDataOut);
      008AED 4B 00            [ 1]  173 	push	#0x00
      008AEF CD 8A 9A         [ 4]  174 	call	_I2CDataInOut
      008AF2 84               [ 1]  175 	pop	a
                                    176 ;	driver/dht12.c: 126: GPIO_WriteLow(I2C_PORT, I2CSCL); 
      008AF3 4B 10            [ 1]  177 	push	#0x10
      008AF5 4B 05            [ 1]  178 	push	#0x05
      008AF7 4B 50            [ 1]  179 	push	#0x50
      008AF9 CD 96 FF         [ 4]  180 	call	_GPIO_WriteLow
      008AFC 5B 03            [ 2]  181 	addw	sp, #3
                                    182 ;	driver/dht12.c: 128: GPIO_WriteLow(I2C_PORT, I2CSDA);  
      008AFE 4B 20            [ 1]  183 	push	#0x20
      008B00 4B 05            [ 1]  184 	push	#0x05
      008B02 4B 50            [ 1]  185 	push	#0x50
      008B04 CD 96 FF         [ 4]  186 	call	_GPIO_WriteLow
      008B07 5B 03            [ 2]  187 	addw	sp, #3
                                    188 ;	driver/dht12.c: 132: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008B09 4B 10            [ 1]  189 	push	#0x10
      008B0B 4B 05            [ 1]  190 	push	#0x05
      008B0D 4B 50            [ 1]  191 	push	#0x50
      008B0F CD 96 F8         [ 4]  192 	call	_GPIO_WriteHigh
      008B12 5B 03            [ 2]  193 	addw	sp, #3
                                    194 ;	driver/dht12.c: 136: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
      008B14 4B 20            [ 1]  195 	push	#0x20
      008B16 4B 05            [ 1]  196 	push	#0x05
      008B18 4B 50            [ 1]  197 	push	#0x50
      008B1A CD 96 F8         [ 4]  198 	call	_GPIO_WriteHigh
      008B1D 5B 03            [ 2]  199 	addw	sp, #3
                                    200 ;	driver/dht12.c: 138: }  
      008B1F 81               [ 4]  201 	ret
                                    202 ;	driver/dht12.c: 152: void I2C_Rack(void)  
                                    203 ;	-----------------------------------------
                                    204 ;	 function I2C_Rack
                                    205 ;	-----------------------------------------
      008B20                        206 _I2C_Rack:
                                    207 ;	driver/dht12.c: 155: I2CDataInOut(I2CDataOut);
      008B20 4B 00            [ 1]  208 	push	#0x00
      008B22 CD 8A 9A         [ 4]  209 	call	_I2CDataInOut
      008B25 84               [ 1]  210 	pop	a
                                    211 ;	driver/dht12.c: 157: GPIO_WriteLow(I2C_PORT, I2CSDA);  
      008B26 4B 20            [ 1]  212 	push	#0x20
      008B28 4B 05            [ 1]  213 	push	#0x05
      008B2A 4B 50            [ 1]  214 	push	#0x50
      008B2C CD 96 FF         [ 4]  215 	call	_GPIO_WriteLow
      008B2F 5B 03            [ 2]  216 	addw	sp, #3
                                    217 ;	driver/dht12.c: 160: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008B31 4B 10            [ 1]  218 	push	#0x10
      008B33 4B 05            [ 1]  219 	push	#0x05
      008B35 4B 50            [ 1]  220 	push	#0x50
      008B37 CD 96 FF         [ 4]  221 	call	_GPIO_WriteLow
      008B3A 5B 03            [ 2]  222 	addw	sp, #3
                                    223 ;	driver/dht12.c: 162: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008B3C 4B 10            [ 1]  224 	push	#0x10
      008B3E 4B 05            [ 1]  225 	push	#0x05
      008B40 4B 50            [ 1]  226 	push	#0x50
      008B42 CD 96 F8         [ 4]  227 	call	_GPIO_WriteHigh
      008B45 5B 03            [ 2]  228 	addw	sp, #3
                                    229 ;	driver/dht12.c: 166: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008B47 4B 10            [ 1]  230 	push	#0x10
      008B49 4B 05            [ 1]  231 	push	#0x05
      008B4B 4B 50            [ 1]  232 	push	#0x50
      008B4D CD 96 FF         [ 4]  233 	call	_GPIO_WriteLow
      008B50 5B 03            [ 2]  234 	addw	sp, #3
                                    235 ;	driver/dht12.c: 170: }  
      008B52 81               [ 4]  236 	ret
                                    237 ;	driver/dht12.c: 185: void I2C_nAck (void)  
                                    238 ;	-----------------------------------------
                                    239 ;	 function I2C_nAck
                                    240 ;	-----------------------------------------
      008B53                        241 _I2C_nAck:
                                    242 ;	driver/dht12.c: 188: I2CDataInOut(I2CDataOut);
      008B53 4B 00            [ 1]  243 	push	#0x00
      008B55 CD 8A 9A         [ 4]  244 	call	_I2CDataInOut
      008B58 84               [ 1]  245 	pop	a
                                    246 ;	driver/dht12.c: 191: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
      008B59 4B 20            [ 1]  247 	push	#0x20
      008B5B 4B 05            [ 1]  248 	push	#0x05
      008B5D 4B 50            [ 1]  249 	push	#0x50
      008B5F CD 96 F8         [ 4]  250 	call	_GPIO_WriteHigh
      008B62 5B 03            [ 2]  251 	addw	sp, #3
                                    252 ;	driver/dht12.c: 195: GPIO_WriteLow(I2C_PORT, I2CSCL); 
      008B64 4B 10            [ 1]  253 	push	#0x10
      008B66 4B 05            [ 1]  254 	push	#0x05
      008B68 4B 50            [ 1]  255 	push	#0x50
      008B6A CD 96 FF         [ 4]  256 	call	_GPIO_WriteLow
      008B6D 5B 03            [ 2]  257 	addw	sp, #3
                                    258 ;	driver/dht12.c: 197: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008B6F 4B 10            [ 1]  259 	push	#0x10
      008B71 4B 05            [ 1]  260 	push	#0x05
      008B73 4B 50            [ 1]  261 	push	#0x50
      008B75 CD 96 F8         [ 4]  262 	call	_GPIO_WriteHigh
      008B78 5B 03            [ 2]  263 	addw	sp, #3
                                    264 ;	driver/dht12.c: 201: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008B7A 4B 10            [ 1]  265 	push	#0x10
      008B7C 4B 05            [ 1]  266 	push	#0x05
      008B7E 4B 50            [ 1]  267 	push	#0x50
      008B80 CD 96 FF         [ 4]  268 	call	_GPIO_WriteLow
      008B83 5B 03            [ 2]  269 	addw	sp, #3
                                    270 ;	driver/dht12.c: 205: }  
      008B85 81               [ 4]  271 	ret
                                    272 ;	driver/dht12.c: 215: bool SendByte(UCHAR I2cData)  
                                    273 ;	-----------------------------------------
                                    274 ;	 function SendByte
                                    275 ;	-----------------------------------------
      008B86                        276 _SendByte:
      008B86 52 03            [ 2]  277 	sub	sp, #3
                                    278 ;	driver/dht12.c: 224: for(i=0; i<8; i++)  
      008B88 0F 03            [ 1]  279 	clr	(0x03, sp)
      008B8A                        280 00112$:
                                    281 ;	driver/dht12.c: 228: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008B8A 4B 10            [ 1]  282 	push	#0x10
      008B8C 4B 05            [ 1]  283 	push	#0x05
      008B8E 4B 50            [ 1]  284 	push	#0x50
      008B90 CD 96 FF         [ 4]  285 	call	_GPIO_WriteLow
      008B93 5B 03            [ 2]  286 	addw	sp, #3
                                    287 ;	driver/dht12.c: 232: if(I2cData & 0x80)  
      008B95 7B 06            [ 1]  288 	ld	a, (0x06, sp)
      008B97 2A 0D            [ 1]  289 	jrpl	00102$
                                    290 ;	driver/dht12.c: 234: {GPIO_WriteHigh(I2C_PORT, I2CSDA);}  
      008B99 4B 20            [ 1]  291 	push	#0x20
      008B9B 4B 05            [ 1]  292 	push	#0x05
      008B9D 4B 50            [ 1]  293 	push	#0x50
      008B9F CD 96 F8         [ 4]  294 	call	_GPIO_WriteHigh
      008BA2 5B 03            [ 2]  295 	addw	sp, #3
      008BA4 20 0B            [ 2]  296 	jra	00103$
      008BA6                        297 00102$:
                                    298 ;	driver/dht12.c: 238: {GPIO_WriteLow(I2C_PORT, I2CSDA);}  
      008BA6 4B 20            [ 1]  299 	push	#0x20
      008BA8 4B 05            [ 1]  300 	push	#0x05
      008BAA 4B 50            [ 1]  301 	push	#0x50
      008BAC CD 96 FF         [ 4]  302 	call	_GPIO_WriteLow
      008BAF 5B 03            [ 2]  303 	addw	sp, #3
      008BB1                        304 00103$:
                                    305 ;	driver/dht12.c: 240: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008BB1 4B 10            [ 1]  306 	push	#0x10
      008BB3 4B 05            [ 1]  307 	push	#0x05
      008BB5 4B 50            [ 1]  308 	push	#0x50
      008BB7 CD 96 F8         [ 4]  309 	call	_GPIO_WriteHigh
      008BBA 5B 03            [ 2]  310 	addw	sp, #3
                                    311 ;	driver/dht12.c: 244: I2cData <<= 1;  
      008BBC 08 06            [ 1]  312 	sll	(0x06, sp)
                                    313 ;	driver/dht12.c: 224: for(i=0; i<8; i++)  
      008BBE 0C 03            [ 1]  314 	inc	(0x03, sp)
      008BC0 7B 03            [ 1]  315 	ld	a, (0x03, sp)
      008BC2 A1 08            [ 1]  316 	cp	a, #0x08
      008BC4 25 C4            [ 1]  317 	jrc	00112$
                                    318 ;	driver/dht12.c: 248: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008BC6 4B 10            [ 1]  319 	push	#0x10
      008BC8 4B 05            [ 1]  320 	push	#0x05
      008BCA 4B 50            [ 1]  321 	push	#0x50
      008BCC CD 96 FF         [ 4]  322 	call	_GPIO_WriteLow
      008BCF 5B 03            [ 2]  323 	addw	sp, #3
                                    324 ;	driver/dht12.c: 250: GPIO_WriteHigh(I2C_PORT, I2CSDA);//发送完一字节，接收应答  
      008BD1 4B 20            [ 1]  325 	push	#0x20
      008BD3 4B 05            [ 1]  326 	push	#0x05
      008BD5 4B 50            [ 1]  327 	push	#0x50
      008BD7 CD 96 F8         [ 4]  328 	call	_GPIO_WriteHigh
      008BDA 5B 03            [ 2]  329 	addw	sp, #3
                                    330 ;	driver/dht12.c: 254: I2CDataInOut(I2CDataIn);  
      008BDC 4B 01            [ 1]  331 	push	#0x01
      008BDE CD 8A 9A         [ 4]  332 	call	_I2CDataInOut
      008BE1 84               [ 1]  333 	pop	a
                                    334 ;	driver/dht12.c: 257: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008BE2 4B 10            [ 1]  335 	push	#0x10
      008BE4 4B 05            [ 1]  336 	push	#0x05
      008BE6 4B 50            [ 1]  337 	push	#0x50
      008BE8 CD 96 F8         [ 4]  338 	call	_GPIO_WriteHigh
      008BEB 5B 03            [ 2]  339 	addw	sp, #3
                                    340 ;	driver/dht12.c: 279: while(GPIO_ReadInputPin(I2C_PORT,I2CSDA) &&count--)
      008BED AE 03 E8         [ 2]  341 	ldw	x, #0x03e8
      008BF0 1F 01            [ 2]  342 	ldw	(0x01, sp), x
      008BF2                        343 00106$:
      008BF2 4B 20            [ 1]  344 	push	#0x20
      008BF4 4B 05            [ 1]  345 	push	#0x05
      008BF6 4B 50            [ 1]  346 	push	#0x50
      008BF8 CD 97 1D         [ 4]  347 	call	_GPIO_ReadInputPin
      008BFB 5B 03            [ 2]  348 	addw	sp, #3
      008BFD 4D               [ 1]  349 	tnz	a
      008BFE 27 0F            [ 1]  350 	jreq	00108$
      008C00 1E 01            [ 2]  351 	ldw	x, (0x01, sp)
      008C02 16 01            [ 2]  352 	ldw	y, (0x01, sp)
      008C04 90 5A            [ 2]  353 	decw	y
      008C06 17 01            [ 2]  354 	ldw	(0x01, sp), y
      008C08 5D               [ 2]  355 	tnzw	x
      008C09 27 04            [ 1]  356 	jreq	00108$
                                    357 ;	driver/dht12.c: 280: {nop();nop();};
      008C0B 9D               [ 1]  358 	nop
      008C0C 9D               [ 1]  359 	nop
      008C0D 20 E3            [ 2]  360 	jra	00106$
      008C0F                        361 00108$:
                                    362 ;	driver/dht12.c: 281: GPIO_WriteLow(I2C_PORT, I2CSCL);
      008C0F 4B 10            [ 1]  363 	push	#0x10
      008C11 4B 05            [ 1]  364 	push	#0x05
      008C13 4B 50            [ 1]  365 	push	#0x50
      008C15 CD 96 FF         [ 4]  366 	call	_GPIO_WriteLow
      008C18 5B 03            [ 2]  367 	addw	sp, #3
                                    368 ;	driver/dht12.c: 286: I2CDataInOut(I2CDataOut);  
      008C1A 4B 00            [ 1]  369 	push	#0x00
      008C1C CD 8A 9A         [ 4]  370 	call	_I2CDataInOut
      008C1F 84               [ 1]  371 	pop	a
                                    372 ;	driver/dht12.c: 287: if(count)
      008C20 1E 01            [ 2]  373 	ldw	x, (0x01, sp)
      008C22 27 03            [ 1]  374 	jreq	00110$
                                    375 ;	driver/dht12.c: 290: I2CStatus = I2C_CRR;  
      008C24 A6 01            [ 1]  376 	ld	a, #0x01
                                    377 ;	driver/dht12.c: 298: I2CStatus = I2C_ERR;  
      008C26 21                     378 	.byte 0x21
      008C27                        379 00110$:
      008C27 4F               [ 1]  380 	clr	a
      008C28                        381 00111$:
                                    382 ;	driver/dht12.c: 301: return I2CStatus;  
                                    383 ;	driver/dht12.c: 303: }  
      008C28 5B 03            [ 2]  384 	addw	sp, #3
      008C2A 81               [ 4]  385 	ret
                                    386 ;	driver/dht12.c: 318: UCHAR RcvByte(void)  
                                    387 ;	-----------------------------------------
                                    388 ;	 function RcvByte
                                    389 ;	-----------------------------------------
      008C2B                        390 _RcvByte:
      008C2B 52 02            [ 2]  391 	sub	sp, #2
                                    392 ;	driver/dht12.c: 324: UCHAR ReadByte=0;  
      008C2D 0F 01            [ 1]  393 	clr	(0x01, sp)
                                    394 ;	driver/dht12.c: 326: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
      008C2F 4B 20            [ 1]  395 	push	#0x20
      008C31 4B 05            [ 1]  396 	push	#0x05
      008C33 4B 50            [ 1]  397 	push	#0x50
      008C35 CD 96 F8         [ 4]  398 	call	_GPIO_WriteHigh
      008C38 5B 03            [ 2]  399 	addw	sp, #3
                                    400 ;	driver/dht12.c: 329: I2CDataInOut(I2CDataIn);  
      008C3A 4B 01            [ 1]  401 	push	#0x01
      008C3C CD 8A 9A         [ 4]  402 	call	_I2CDataInOut
      008C3F 84               [ 1]  403 	pop	a
                                    404 ;	driver/dht12.c: 333: for(i=0; i<8; i++)  
      008C40 0F 02            [ 1]  405 	clr	(0x02, sp)
      008C42                        406 00104$:
                                    407 ;	driver/dht12.c: 337: ReadByte <<= 1;  
      008C42 7B 01            [ 1]  408 	ld	a, (0x01, sp)
      008C44 48               [ 1]  409 	sll	a
      008C45 6B 01            [ 1]  410 	ld	(0x01, sp), a
                                    411 ;	driver/dht12.c: 339: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008C47 4B 10            [ 1]  412 	push	#0x10
      008C49 4B 05            [ 1]  413 	push	#0x05
      008C4B 4B 50            [ 1]  414 	push	#0x50
      008C4D CD 96 FF         [ 4]  415 	call	_GPIO_WriteLow
      008C50 5B 03            [ 2]  416 	addw	sp, #3
                                    417 ;	driver/dht12.c: 343: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008C52 4B 10            [ 1]  418 	push	#0x10
      008C54 4B 05            [ 1]  419 	push	#0x05
      008C56 4B 50            [ 1]  420 	push	#0x50
      008C58 CD 96 F8         [ 4]  421 	call	_GPIO_WriteHigh
      008C5B 5B 03            [ 2]  422 	addw	sp, #3
                                    423 ;	driver/dht12.c: 348: if(GPIO_ReadInputPin(I2C_PORT,I2CSDA) !=RESET)  
      008C5D 4B 20            [ 1]  424 	push	#0x20
      008C5F 4B 05            [ 1]  425 	push	#0x05
      008C61 4B 50            [ 1]  426 	push	#0x50
      008C63 CD 97 1D         [ 4]  427 	call	_GPIO_ReadInputPin
      008C66 5B 03            [ 2]  428 	addw	sp, #3
      008C68 4D               [ 1]  429 	tnz	a
      008C69 27 06            [ 1]  430 	jreq	00105$
                                    431 ;	driver/dht12.c: 350: {ReadByte |= 0x01;}  
      008C6B 7B 01            [ 1]  432 	ld	a, (0x01, sp)
      008C6D AA 01            [ 1]  433 	or	a, #0x01
      008C6F 6B 01            [ 1]  434 	ld	(0x01, sp), a
      008C71                        435 00105$:
                                    436 ;	driver/dht12.c: 333: for(i=0; i<8; i++)  
      008C71 0C 02            [ 1]  437 	inc	(0x02, sp)
      008C73 7B 02            [ 1]  438 	ld	a, (0x02, sp)
      008C75 A1 08            [ 1]  439 	cp	a, #0x08
      008C77 25 C9            [ 1]  440 	jrc	00104$
                                    441 ;	driver/dht12.c: 356: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008C79 4B 10            [ 1]  442 	push	#0x10
      008C7B 4B 05            [ 1]  443 	push	#0x05
      008C7D 4B 50            [ 1]  444 	push	#0x50
      008C7F CD 96 FF         [ 4]  445 	call	_GPIO_WriteLow
      008C82 5B 03            [ 2]  446 	addw	sp, #3
                                    447 ;	driver/dht12.c: 358: I2CDataInOut(I2CDataOut);  
      008C84 4B 00            [ 1]  448 	push	#0x00
      008C86 CD 8A 9A         [ 4]  449 	call	_I2CDataInOut
      008C89 84               [ 1]  450 	pop	a
                                    451 ;	driver/dht12.c: 362: return ReadByte;  
      008C8A 7B 01            [ 1]  452 	ld	a, (0x01, sp)
                                    453 ;	driver/dht12.c: 364: }  
      008C8C 5B 02            [ 2]  454 	addw	sp, #2
      008C8E 81               [ 4]  455 	ret
                                    456 ;	driver/dht12.c: 383: bool I2C_Read(UCHAR wrDAdr,UCHAR wordAdr,UCHAR *pRdDat,UCHAR num)  
                                    457 ;	-----------------------------------------
                                    458 ;	 function I2C_Read
                                    459 ;	-----------------------------------------
      008C8F                        460 _I2C_Read:
      008C8F 52 09            [ 2]  461 	sub	sp, #9
                                    462 ;	driver/dht12.c: 393: rdDAdr = wrDAdr+1; //读器件地址为写地址加1  
      008C91 7B 0C            [ 1]  463 	ld	a, (0x0c, sp)
      008C93 4C               [ 1]  464 	inc	a
      008C94 6B 08            [ 1]  465 	ld	(0x08, sp), a
                                    466 ;	driver/dht12.c: 395: I2C_Start();  /*启动I2C*/  
      008C96 CD 8A BA         [ 4]  467 	call	_I2C_Start
                                    468 ;	driver/dht12.c: 399: I2CAck = SendByte(wrDAdr); /*发写器件地址*/  
      008C99 7B 0C            [ 1]  469 	ld	a, (0x0c, sp)
      008C9B 88               [ 1]  470 	push	a
      008C9C CD 8B 86         [ 4]  471 	call	_SendByte
      008C9F 5B 01            [ 2]  472 	addw	sp, #1
                                    473 ;	driver/dht12.c: 401: if(!I2CAck)  
      008CA1 6B 03            [ 1]  474 	ld	(0x03, sp), a
      008CA3 26 03            [ 1]  475 	jrne	00102$
                                    476 ;	driver/dht12.c: 405: return I2C_ERR;  
      008CA5 4F               [ 1]  477 	clr	a
      008CA6 20 64            [ 2]  478 	jra	00113$
      008CA8                        479 00102$:
                                    480 ;	driver/dht12.c: 409: I2CAck = SendByte(wordAdr); /*发寄存器地址*/  
      008CA8 7B 0D            [ 1]  481 	ld	a, (0x0d, sp)
      008CAA 88               [ 1]  482 	push	a
      008CAB CD 8B 86         [ 4]  483 	call	_SendByte
      008CAE 5B 01            [ 2]  484 	addw	sp, #1
                                    485 ;	driver/dht12.c: 411: if(!I2CAck)  
      008CB0 4D               [ 1]  486 	tnz	a
      008CB1 26 03            [ 1]  487 	jrne	00104$
                                    488 ;	driver/dht12.c: 415: return I2C_ERR;  
      008CB3 4F               [ 1]  489 	clr	a
      008CB4 20 56            [ 2]  490 	jra	00113$
      008CB6                        491 00104$:
                                    492 ;	driver/dht12.c: 419: I2C_Start();   /*重启I2C*/  
      008CB6 CD 8A BA         [ 4]  493 	call	_I2C_Start
                                    494 ;	driver/dht12.c: 421: I2CAck = SendByte(rdDAdr); /*发读器件地址*/  
      008CB9 7B 08            [ 1]  495 	ld	a, (0x08, sp)
      008CBB 88               [ 1]  496 	push	a
      008CBC CD 8B 86         [ 4]  497 	call	_SendByte
      008CBF 5B 01            [ 2]  498 	addw	sp, #1
                                    499 ;	driver/dht12.c: 423: if(!I2CAck)  
      008CC1 4D               [ 1]  500 	tnz	a
      008CC2 26 03            [ 1]  501 	jrne	00119$
                                    502 ;	driver/dht12.c: 427: return I2C_ERR;  
      008CC4 4F               [ 1]  503 	clr	a
      008CC5 20 45            [ 2]  504 	jra	00113$
                                    505 ;	driver/dht12.c: 433: for(i=0;i<num-1;i++)  
      008CC7                        506 00119$:
      008CC7 0F 09            [ 1]  507 	clr	(0x09, sp)
      008CC9                        508 00111$:
      008CC9 5F               [ 1]  509 	clrw	x
      008CCA 7B 10            [ 1]  510 	ld	a, (0x10, sp)
      008CCC 97               [ 1]  511 	ld	xl, a
      008CCD 5A               [ 2]  512 	decw	x
      008CCE 1F 01            [ 2]  513 	ldw	(0x01, sp), x
      008CD0 7B 09            [ 1]  514 	ld	a, (0x09, sp)
      008CD2 6B 07            [ 1]  515 	ld	(0x07, sp), a
      008CD4 0F 06            [ 1]  516 	clr	(0x06, sp)
                                    517 ;	driver/dht12.c: 437: *(pRdDat+i) = RcvByte();  
      008CD6 5F               [ 1]  518 	clrw	x
      008CD7 7B 09            [ 1]  519 	ld	a, (0x09, sp)
      008CD9 97               [ 1]  520 	ld	xl, a
      008CDA 72 FB 0E         [ 2]  521 	addw	x, (0x0e, sp)
      008CDD 1F 04            [ 2]  522 	ldw	(0x04, sp), x
                                    523 ;	driver/dht12.c: 433: for(i=0;i<num-1;i++)  
      008CDF 1E 06            [ 2]  524 	ldw	x, (0x06, sp)
      008CE1 13 01            [ 2]  525 	cpw	x, (0x01, sp)
      008CE3 2E 0D            [ 1]  526 	jrsge	00107$
                                    527 ;	driver/dht12.c: 437: *(pRdDat+i) = RcvByte();  
      008CE5 CD 8C 2B         [ 4]  528 	call	_RcvByte
      008CE8 1E 04            [ 2]  529 	ldw	x, (0x04, sp)
      008CEA F7               [ 1]  530 	ld	(x), a
                                    531 ;	driver/dht12.c: 439: I2C_Rack();  
      008CEB CD 8B 20         [ 4]  532 	call	_I2C_Rack
                                    533 ;	driver/dht12.c: 433: for(i=0;i<num-1;i++)  
      008CEE 0C 09            [ 1]  534 	inc	(0x09, sp)
      008CF0 20 D7            [ 2]  535 	jra	00111$
      008CF2                        536 00107$:
                                    537 ;	driver/dht12.c: 443: if(i==num-1)  
      008CF2 1E 06            [ 2]  538 	ldw	x, (0x06, sp)
      008CF4 13 01            [ 2]  539 	cpw	x, (0x01, sp)
      008CF6 26 0F            [ 1]  540 	jrne	00109$
                                    541 ;	driver/dht12.c: 447: *(pRdDat+i) = RcvByte();  
      008CF8 CD 8C 2B         [ 4]  542 	call	_RcvByte
      008CFB 1E 04            [ 2]  543 	ldw	x, (0x04, sp)
      008CFD F7               [ 1]  544 	ld	(x), a
                                    545 ;	driver/dht12.c: 449: I2C_Rack();
      008CFE CD 8B 20         [ 4]  546 	call	_I2C_Rack
                                    547 ;	driver/dht12.c: 450: RcvByte();
      008D01 CD 8C 2B         [ 4]  548 	call	_RcvByte
                                    549 ;	driver/dht12.c: 452: I2C_nAck();  
      008D04 CD 8B 53         [ 4]  550 	call	_I2C_nAck
      008D07                        551 00109$:
                                    552 ;	driver/dht12.c: 456: I2C_Stop();  
      008D07 CD 8A ED         [ 4]  553 	call	_I2C_Stop
                                    554 ;	driver/dht12.c: 457: return I2C_CRR;  
      008D0A A6 01            [ 1]  555 	ld	a, #0x01
      008D0C                        556 00113$:
                                    557 ;	driver/dht12.c: 459: }  
      008D0C 5B 09            [ 2]  558 	addw	sp, #9
      008D0E 81               [ 4]  559 	ret
                                    560 ;	driver/dht12.c: 541: u8 i2c_read(u8 dev_addr,u8 Addr)
                                    561 ;	-----------------------------------------
                                    562 ;	 function i2c_read
                                    563 ;	-----------------------------------------
      008D0F                        564 _i2c_read:
      008D0F 88               [ 1]  565 	push	a
                                    566 ;	driver/dht12.c: 544: if(I2C_Read(dev_addr,Addr,&temp,1))
      008D10 96               [ 1]  567 	ldw	x, sp
      008D11 5C               [ 1]  568 	incw	x
      008D12 4B 01            [ 1]  569 	push	#0x01
      008D14 89               [ 2]  570 	pushw	x
      008D15 7B 08            [ 1]  571 	ld	a, (0x08, sp)
      008D17 88               [ 1]  572 	push	a
      008D18 7B 08            [ 1]  573 	ld	a, (0x08, sp)
      008D1A 88               [ 1]  574 	push	a
      008D1B CD 8C 8F         [ 4]  575 	call	_I2C_Read
      008D1E 5B 05            [ 2]  576 	addw	sp, #5
      008D20 4D               [ 1]  577 	tnz	a
      008D21 27 03            [ 1]  578 	jreq	00102$
                                    579 ;	driver/dht12.c: 545: return temp;
      008D23 7B 01            [ 1]  580 	ld	a, (0x01, sp)
                                    581 ;	driver/dht12.c: 546: else return 0;
      008D25 21                     582 	.byte 0x21
      008D26                        583 00102$:
      008D26 4F               [ 1]  584 	clr	a
      008D27                        585 00104$:
                                    586 ;	driver/dht12.c: 547: }
      008D27 5B 01            [ 2]  587 	addw	sp, #1
      008D29 81               [ 4]  588 	ret
                                    589 ;	driver/dht12.c: 549: void ReadDHT12(DHT12_DATA *data) 
                                    590 ;	-----------------------------------------
                                    591 ;	 function ReadDHT12
                                    592 ;	-----------------------------------------
      008D2A                        593 _ReadDHT12:
      008D2A 52 02            [ 2]  594 	sub	sp, #2
                                    595 ;	driver/dht12.c: 551: i2c_init();
      008D2C CD 8A 64         [ 4]  596 	call	_i2c_init
                                    597 ;	driver/dht12.c: 552: data->W=i2c_read(0xB8,0x00);
      008D2F 16 05            [ 2]  598 	ldw	y, (0x05, sp)
      008D31 17 01            [ 2]  599 	ldw	(0x01, sp), y
      008D33 93               [ 1]  600 	ldw	x, y
      008D34 5C               [ 1]  601 	incw	x
      008D35 5C               [ 1]  602 	incw	x
      008D36 89               [ 2]  603 	pushw	x
      008D37 4B 00            [ 1]  604 	push	#0x00
      008D39 4B B8            [ 1]  605 	push	#0xb8
      008D3B CD 8D 0F         [ 4]  606 	call	_i2c_read
      008D3E 5B 02            [ 2]  607 	addw	sp, #2
      008D40 85               [ 2]  608 	popw	x
      008D41 F7               [ 1]  609 	ld	(x), a
                                    610 ;	driver/dht12.c: 553: data->W1=i2c_read(0xB8,0x01);
      008D42 1E 01            [ 2]  611 	ldw	x, (0x01, sp)
      008D44 1C 00 03         [ 2]  612 	addw	x, #0x0003
      008D47 89               [ 2]  613 	pushw	x
      008D48 4B 01            [ 1]  614 	push	#0x01
      008D4A 4B B8            [ 1]  615 	push	#0xb8
      008D4C CD 8D 0F         [ 4]  616 	call	_i2c_read
      008D4F 5B 02            [ 2]  617 	addw	sp, #2
      008D51 85               [ 2]  618 	popw	x
      008D52 F7               [ 1]  619 	ld	(x), a
                                    620 ;	driver/dht12.c: 554: data->T=i2c_read(0xB8,0x02);
      008D53 4B 02            [ 1]  621 	push	#0x02
      008D55 4B B8            [ 1]  622 	push	#0xb8
      008D57 CD 8D 0F         [ 4]  623 	call	_i2c_read
      008D5A 5B 02            [ 2]  624 	addw	sp, #2
      008D5C 1E 01            [ 2]  625 	ldw	x, (0x01, sp)
      008D5E F7               [ 1]  626 	ld	(x), a
                                    627 ;	driver/dht12.c: 555: data->T1=i2c_read(0xB8,0x03);
      008D5F 1E 01            [ 2]  628 	ldw	x, (0x01, sp)
      008D61 5C               [ 1]  629 	incw	x
      008D62 89               [ 2]  630 	pushw	x
      008D63 4B 03            [ 1]  631 	push	#0x03
      008D65 4B B8            [ 1]  632 	push	#0xb8
      008D67 CD 8D 0F         [ 4]  633 	call	_i2c_read
      008D6A 5B 02            [ 2]  634 	addw	sp, #2
      008D6C 85               [ 2]  635 	popw	x
      008D6D F7               [ 1]  636 	ld	(x), a
                                    637 ;	driver/dht12.c: 556: data->sum=i2c_read(0xB8,0x04);
      008D6E 1E 01            [ 2]  638 	ldw	x, (0x01, sp)
      008D70 1C 00 04         [ 2]  639 	addw	x, #0x0004
      008D73 89               [ 2]  640 	pushw	x
      008D74 4B 04            [ 1]  641 	push	#0x04
      008D76 4B B8            [ 1]  642 	push	#0xb8
      008D78 CD 8D 0F         [ 4]  643 	call	_i2c_read
      008D7B 5B 02            [ 2]  644 	addw	sp, #2
      008D7D 85               [ 2]  645 	popw	x
      008D7E F7               [ 1]  646 	ld	(x), a
                                    647 ;	driver/dht12.c: 557: i2c_deinit();
      008D7F CD 8A 7F         [ 4]  648 	call	_i2c_deinit
                                    649 ;	driver/dht12.c: 558: }
      008D82 5B 02            [ 2]  650 	addw	sp, #2
      008D84 81               [ 4]  651 	ret
                                    652 	.area CODE
                                    653 	.area CONST
                                    654 	.area INITIALIZER
                                    655 	.area CABS (ABS)
