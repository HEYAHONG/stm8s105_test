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
      0088B3                         68 _i2c_init:
                                     69 ;	driver/dht12.c: 40: GPIO_Init(GPIOB,GPIO_PIN_4,GPIO_MODE_OUT_OD_LOW_FAST);
      0088B3 4B A0            [ 1]   70 	push	#0xa0
      0088B5 4B 10            [ 1]   71 	push	#0x10
      0088B7 4B 05            [ 1]   72 	push	#0x05
      0088B9 4B 50            [ 1]   73 	push	#0x50
      0088BB CD 94 07         [ 4]   74 	call	_GPIO_Init
      0088BE 5B 04            [ 2]   75 	addw	sp, #4
                                     76 ;	driver/dht12.c: 41: GPIO_Init(GPIOB,GPIO_PIN_5,GPIO_MODE_OUT_OD_LOW_FAST);
      0088C0 4B A0            [ 1]   77 	push	#0xa0
      0088C2 4B 20            [ 1]   78 	push	#0x20
      0088C4 4B 05            [ 1]   79 	push	#0x05
      0088C6 4B 50            [ 1]   80 	push	#0x50
      0088C8 CD 94 07         [ 4]   81 	call	_GPIO_Init
      0088CB 5B 04            [ 2]   82 	addw	sp, #4
                                     83 ;	driver/dht12.c: 42: }
      0088CD 81               [ 4]   84 	ret
                                     85 ;	driver/dht12.c: 43: void i2c_deinit() 
                                     86 ;	-----------------------------------------
                                     87 ;	 function i2c_deinit
                                     88 ;	-----------------------------------------
      0088CE                         89 _i2c_deinit:
                                     90 ;	driver/dht12.c: 46: GPIO_Init(GPIOB,GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
      0088CE 4B 00            [ 1]   91 	push	#0x00
      0088D0 4B 10            [ 1]   92 	push	#0x10
      0088D2 4B 05            [ 1]   93 	push	#0x05
      0088D4 4B 50            [ 1]   94 	push	#0x50
      0088D6 CD 94 07         [ 4]   95 	call	_GPIO_Init
      0088D9 5B 04            [ 2]   96 	addw	sp, #4
                                     97 ;	driver/dht12.c: 47: GPIO_Init(GPIOB,GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);
      0088DB 4B 00            [ 1]   98 	push	#0x00
      0088DD 4B 20            [ 1]   99 	push	#0x20
      0088DF 4B 05            [ 1]  100 	push	#0x05
      0088E1 4B 50            [ 1]  101 	push	#0x50
      0088E3 CD 94 07         [ 4]  102 	call	_GPIO_Init
      0088E6 5B 04            [ 2]  103 	addw	sp, #4
                                    104 ;	driver/dht12.c: 48: }
      0088E8 81               [ 4]  105 	ret
                                    106 ;	driver/dht12.c: 63: void I2CDataInOut(bool InOut)  
                                    107 ;	-----------------------------------------
                                    108 ;	 function I2CDataInOut
                                    109 ;	-----------------------------------------
      0088E9                        110 _I2CDataInOut:
                                    111 ;	driver/dht12.c: 67: if(InOut)  
      0088E9 0D 03            [ 1]  112 	tnz	(0x03, sp)
      0088EB 27 0E            [ 1]  113 	jreq	00102$
                                    114 ;	driver/dht12.c: 71: GPIO_Init(I2C_PORT,I2CSDA,GPIO_MODE_IN_FL_NO_IT);  
      0088ED 4B 00            [ 1]  115 	push	#0x00
      0088EF 4B 20            [ 1]  116 	push	#0x20
      0088F1 4B 05            [ 1]  117 	push	#0x05
      0088F3 4B 50            [ 1]  118 	push	#0x50
      0088F5 CD 94 07         [ 4]  119 	call	_GPIO_Init
      0088F8 5B 04            [ 2]  120 	addw	sp, #4
      0088FA 81               [ 4]  121 	ret
      0088FB                        122 00102$:
                                    123 ;	driver/dht12.c: 79: GPIO_Init(I2C_PORT,I2CSDA,GPIO_MODE_OUT_PP_LOW_FAST);  
      0088FB 4B E0            [ 1]  124 	push	#0xe0
      0088FD 4B 20            [ 1]  125 	push	#0x20
      0088FF 4B 05            [ 1]  126 	push	#0x05
      008901 4B 50            [ 1]  127 	push	#0x50
      008903 CD 94 07         [ 4]  128 	call	_GPIO_Init
      008906 5B 04            [ 2]  129 	addw	sp, #4
                                    130 ;	driver/dht12.c: 83: }  
      008908 81               [ 4]  131 	ret
                                    132 ;	driver/dht12.c: 95: void I2C_Start (void)  
                                    133 ;	-----------------------------------------
                                    134 ;	 function I2C_Start
                                    135 ;	-----------------------------------------
      008909                        136 _I2C_Start:
                                    137 ;	driver/dht12.c: 98: I2CDataInOut(I2CDataOut);
      008909 4B 00            [ 1]  138 	push	#0x00
      00890B CD 88 E9         [ 4]  139 	call	_I2CDataInOut
      00890E 84               [ 1]  140 	pop	a
                                    141 ;	driver/dht12.c: 100: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
      00890F 4B 20            [ 1]  142 	push	#0x20
      008911 4B 05            [ 1]  143 	push	#0x05
      008913 4B 50            [ 1]  144 	push	#0x50
      008915 CD 94 82         [ 4]  145 	call	_GPIO_WriteHigh
      008918 5B 03            [ 2]  146 	addw	sp, #3
                                    147 ;	driver/dht12.c: 104: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      00891A 4B 10            [ 1]  148 	push	#0x10
      00891C 4B 05            [ 1]  149 	push	#0x05
      00891E 4B 50            [ 1]  150 	push	#0x50
      008920 CD 94 82         [ 4]  151 	call	_GPIO_WriteHigh
      008923 5B 03            [ 2]  152 	addw	sp, #3
                                    153 ;	driver/dht12.c: 108: GPIO_WriteLow(I2C_PORT, I2CSDA);  
      008925 4B 20            [ 1]  154 	push	#0x20
      008927 4B 05            [ 1]  155 	push	#0x05
      008929 4B 50            [ 1]  156 	push	#0x50
      00892B CD 94 89         [ 4]  157 	call	_GPIO_WriteLow
      00892E 5B 03            [ 2]  158 	addw	sp, #3
                                    159 ;	driver/dht12.c: 111: GPIO_WriteLow(I2C_PORT, I2CSCL);    
      008930 4B 10            [ 1]  160 	push	#0x10
      008932 4B 05            [ 1]  161 	push	#0x05
      008934 4B 50            [ 1]  162 	push	#0x50
      008936 CD 94 89         [ 4]  163 	call	_GPIO_WriteLow
      008939 5B 03            [ 2]  164 	addw	sp, #3
                                    165 ;	driver/dht12.c: 112: }  
      00893B 81               [ 4]  166 	ret
                                    167 ;	driver/dht12.c: 122: void I2C_Stop (void)  
                                    168 ;	-----------------------------------------
                                    169 ;	 function I2C_Stop
                                    170 ;	-----------------------------------------
      00893C                        171 _I2C_Stop:
                                    172 ;	driver/dht12.c: 125: I2CDataInOut(I2CDataOut);
      00893C 4B 00            [ 1]  173 	push	#0x00
      00893E CD 88 E9         [ 4]  174 	call	_I2CDataInOut
      008941 84               [ 1]  175 	pop	a
                                    176 ;	driver/dht12.c: 126: GPIO_WriteLow(I2C_PORT, I2CSCL); 
      008942 4B 10            [ 1]  177 	push	#0x10
      008944 4B 05            [ 1]  178 	push	#0x05
      008946 4B 50            [ 1]  179 	push	#0x50
      008948 CD 94 89         [ 4]  180 	call	_GPIO_WriteLow
      00894B 5B 03            [ 2]  181 	addw	sp, #3
                                    182 ;	driver/dht12.c: 128: GPIO_WriteLow(I2C_PORT, I2CSDA);  
      00894D 4B 20            [ 1]  183 	push	#0x20
      00894F 4B 05            [ 1]  184 	push	#0x05
      008951 4B 50            [ 1]  185 	push	#0x50
      008953 CD 94 89         [ 4]  186 	call	_GPIO_WriteLow
      008956 5B 03            [ 2]  187 	addw	sp, #3
                                    188 ;	driver/dht12.c: 132: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008958 4B 10            [ 1]  189 	push	#0x10
      00895A 4B 05            [ 1]  190 	push	#0x05
      00895C 4B 50            [ 1]  191 	push	#0x50
      00895E CD 94 82         [ 4]  192 	call	_GPIO_WriteHigh
      008961 5B 03            [ 2]  193 	addw	sp, #3
                                    194 ;	driver/dht12.c: 136: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
      008963 4B 20            [ 1]  195 	push	#0x20
      008965 4B 05            [ 1]  196 	push	#0x05
      008967 4B 50            [ 1]  197 	push	#0x50
      008969 CD 94 82         [ 4]  198 	call	_GPIO_WriteHigh
      00896C 5B 03            [ 2]  199 	addw	sp, #3
                                    200 ;	driver/dht12.c: 138: }  
      00896E 81               [ 4]  201 	ret
                                    202 ;	driver/dht12.c: 152: void I2C_Rack(void)  
                                    203 ;	-----------------------------------------
                                    204 ;	 function I2C_Rack
                                    205 ;	-----------------------------------------
      00896F                        206 _I2C_Rack:
                                    207 ;	driver/dht12.c: 155: I2CDataInOut(I2CDataOut);
      00896F 4B 00            [ 1]  208 	push	#0x00
      008971 CD 88 E9         [ 4]  209 	call	_I2CDataInOut
      008974 84               [ 1]  210 	pop	a
                                    211 ;	driver/dht12.c: 157: GPIO_WriteLow(I2C_PORT, I2CSDA);  
      008975 4B 20            [ 1]  212 	push	#0x20
      008977 4B 05            [ 1]  213 	push	#0x05
      008979 4B 50            [ 1]  214 	push	#0x50
      00897B CD 94 89         [ 4]  215 	call	_GPIO_WriteLow
      00897E 5B 03            [ 2]  216 	addw	sp, #3
                                    217 ;	driver/dht12.c: 160: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008980 4B 10            [ 1]  218 	push	#0x10
      008982 4B 05            [ 1]  219 	push	#0x05
      008984 4B 50            [ 1]  220 	push	#0x50
      008986 CD 94 89         [ 4]  221 	call	_GPIO_WriteLow
      008989 5B 03            [ 2]  222 	addw	sp, #3
                                    223 ;	driver/dht12.c: 162: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      00898B 4B 10            [ 1]  224 	push	#0x10
      00898D 4B 05            [ 1]  225 	push	#0x05
      00898F 4B 50            [ 1]  226 	push	#0x50
      008991 CD 94 82         [ 4]  227 	call	_GPIO_WriteHigh
      008994 5B 03            [ 2]  228 	addw	sp, #3
                                    229 ;	driver/dht12.c: 166: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008996 4B 10            [ 1]  230 	push	#0x10
      008998 4B 05            [ 1]  231 	push	#0x05
      00899A 4B 50            [ 1]  232 	push	#0x50
      00899C CD 94 89         [ 4]  233 	call	_GPIO_WriteLow
      00899F 5B 03            [ 2]  234 	addw	sp, #3
                                    235 ;	driver/dht12.c: 170: }  
      0089A1 81               [ 4]  236 	ret
                                    237 ;	driver/dht12.c: 185: void I2C_nAck (void)  
                                    238 ;	-----------------------------------------
                                    239 ;	 function I2C_nAck
                                    240 ;	-----------------------------------------
      0089A2                        241 _I2C_nAck:
                                    242 ;	driver/dht12.c: 188: I2CDataInOut(I2CDataOut);
      0089A2 4B 00            [ 1]  243 	push	#0x00
      0089A4 CD 88 E9         [ 4]  244 	call	_I2CDataInOut
      0089A7 84               [ 1]  245 	pop	a
                                    246 ;	driver/dht12.c: 191: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
      0089A8 4B 20            [ 1]  247 	push	#0x20
      0089AA 4B 05            [ 1]  248 	push	#0x05
      0089AC 4B 50            [ 1]  249 	push	#0x50
      0089AE CD 94 82         [ 4]  250 	call	_GPIO_WriteHigh
      0089B1 5B 03            [ 2]  251 	addw	sp, #3
                                    252 ;	driver/dht12.c: 195: GPIO_WriteLow(I2C_PORT, I2CSCL); 
      0089B3 4B 10            [ 1]  253 	push	#0x10
      0089B5 4B 05            [ 1]  254 	push	#0x05
      0089B7 4B 50            [ 1]  255 	push	#0x50
      0089B9 CD 94 89         [ 4]  256 	call	_GPIO_WriteLow
      0089BC 5B 03            [ 2]  257 	addw	sp, #3
                                    258 ;	driver/dht12.c: 197: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      0089BE 4B 10            [ 1]  259 	push	#0x10
      0089C0 4B 05            [ 1]  260 	push	#0x05
      0089C2 4B 50            [ 1]  261 	push	#0x50
      0089C4 CD 94 82         [ 4]  262 	call	_GPIO_WriteHigh
      0089C7 5B 03            [ 2]  263 	addw	sp, #3
                                    264 ;	driver/dht12.c: 201: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      0089C9 4B 10            [ 1]  265 	push	#0x10
      0089CB 4B 05            [ 1]  266 	push	#0x05
      0089CD 4B 50            [ 1]  267 	push	#0x50
      0089CF CD 94 89         [ 4]  268 	call	_GPIO_WriteLow
      0089D2 5B 03            [ 2]  269 	addw	sp, #3
                                    270 ;	driver/dht12.c: 205: }  
      0089D4 81               [ 4]  271 	ret
                                    272 ;	driver/dht12.c: 215: bool SendByte(UCHAR I2cData)  
                                    273 ;	-----------------------------------------
                                    274 ;	 function SendByte
                                    275 ;	-----------------------------------------
      0089D5                        276 _SendByte:
      0089D5 52 03            [ 2]  277 	sub	sp, #3
                                    278 ;	driver/dht12.c: 224: for(i=0; i<8; i++)  
      0089D7 0F 03            [ 1]  279 	clr	(0x03, sp)
      0089D9                        280 00112$:
                                    281 ;	driver/dht12.c: 228: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      0089D9 4B 10            [ 1]  282 	push	#0x10
      0089DB 4B 05            [ 1]  283 	push	#0x05
      0089DD 4B 50            [ 1]  284 	push	#0x50
      0089DF CD 94 89         [ 4]  285 	call	_GPIO_WriteLow
      0089E2 5B 03            [ 2]  286 	addw	sp, #3
                                    287 ;	driver/dht12.c: 232: if(I2cData & 0x80)  
      0089E4 7B 06            [ 1]  288 	ld	a, (0x06, sp)
      0089E6 2A 0D            [ 1]  289 	jrpl	00102$
                                    290 ;	driver/dht12.c: 234: {GPIO_WriteHigh(I2C_PORT, I2CSDA);}  
      0089E8 4B 20            [ 1]  291 	push	#0x20
      0089EA 4B 05            [ 1]  292 	push	#0x05
      0089EC 4B 50            [ 1]  293 	push	#0x50
      0089EE CD 94 82         [ 4]  294 	call	_GPIO_WriteHigh
      0089F1 5B 03            [ 2]  295 	addw	sp, #3
      0089F3 20 0B            [ 2]  296 	jra	00103$
      0089F5                        297 00102$:
                                    298 ;	driver/dht12.c: 238: {GPIO_WriteLow(I2C_PORT, I2CSDA);}  
      0089F5 4B 20            [ 1]  299 	push	#0x20
      0089F7 4B 05            [ 1]  300 	push	#0x05
      0089F9 4B 50            [ 1]  301 	push	#0x50
      0089FB CD 94 89         [ 4]  302 	call	_GPIO_WriteLow
      0089FE 5B 03            [ 2]  303 	addw	sp, #3
      008A00                        304 00103$:
                                    305 ;	driver/dht12.c: 240: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008A00 4B 10            [ 1]  306 	push	#0x10
      008A02 4B 05            [ 1]  307 	push	#0x05
      008A04 4B 50            [ 1]  308 	push	#0x50
      008A06 CD 94 82         [ 4]  309 	call	_GPIO_WriteHigh
      008A09 5B 03            [ 2]  310 	addw	sp, #3
                                    311 ;	driver/dht12.c: 244: I2cData <<= 1;  
      008A0B 08 06            [ 1]  312 	sll	(0x06, sp)
                                    313 ;	driver/dht12.c: 224: for(i=0; i<8; i++)  
      008A0D 0C 03            [ 1]  314 	inc	(0x03, sp)
      008A0F 7B 03            [ 1]  315 	ld	a, (0x03, sp)
      008A11 A1 08            [ 1]  316 	cp	a, #0x08
      008A13 25 C4            [ 1]  317 	jrc	00112$
                                    318 ;	driver/dht12.c: 248: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008A15 4B 10            [ 1]  319 	push	#0x10
      008A17 4B 05            [ 1]  320 	push	#0x05
      008A19 4B 50            [ 1]  321 	push	#0x50
      008A1B CD 94 89         [ 4]  322 	call	_GPIO_WriteLow
      008A1E 5B 03            [ 2]  323 	addw	sp, #3
                                    324 ;	driver/dht12.c: 250: GPIO_WriteHigh(I2C_PORT, I2CSDA);//发送完一字节，接收应答  
      008A20 4B 20            [ 1]  325 	push	#0x20
      008A22 4B 05            [ 1]  326 	push	#0x05
      008A24 4B 50            [ 1]  327 	push	#0x50
      008A26 CD 94 82         [ 4]  328 	call	_GPIO_WriteHigh
      008A29 5B 03            [ 2]  329 	addw	sp, #3
                                    330 ;	driver/dht12.c: 254: I2CDataInOut(I2CDataIn);  
      008A2B 4B 01            [ 1]  331 	push	#0x01
      008A2D CD 88 E9         [ 4]  332 	call	_I2CDataInOut
      008A30 84               [ 1]  333 	pop	a
                                    334 ;	driver/dht12.c: 257: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008A31 4B 10            [ 1]  335 	push	#0x10
      008A33 4B 05            [ 1]  336 	push	#0x05
      008A35 4B 50            [ 1]  337 	push	#0x50
      008A37 CD 94 82         [ 4]  338 	call	_GPIO_WriteHigh
      008A3A 5B 03            [ 2]  339 	addw	sp, #3
                                    340 ;	driver/dht12.c: 279: while(GPIO_ReadInputPin(I2C_PORT,I2CSDA) &&count--)
      008A3C AE 03 E8         [ 2]  341 	ldw	x, #0x03e8
      008A3F 1F 01            [ 2]  342 	ldw	(0x01, sp), x
      008A41                        343 00106$:
      008A41 4B 20            [ 1]  344 	push	#0x20
      008A43 4B 05            [ 1]  345 	push	#0x05
      008A45 4B 50            [ 1]  346 	push	#0x50
      008A47 CD 94 A7         [ 4]  347 	call	_GPIO_ReadInputPin
      008A4A 5B 03            [ 2]  348 	addw	sp, #3
      008A4C 4D               [ 1]  349 	tnz	a
      008A4D 27 0F            [ 1]  350 	jreq	00108$
      008A4F 1E 01            [ 2]  351 	ldw	x, (0x01, sp)
      008A51 16 01            [ 2]  352 	ldw	y, (0x01, sp)
      008A53 90 5A            [ 2]  353 	decw	y
      008A55 17 01            [ 2]  354 	ldw	(0x01, sp), y
      008A57 5D               [ 2]  355 	tnzw	x
      008A58 27 04            [ 1]  356 	jreq	00108$
                                    357 ;	driver/dht12.c: 280: {nop();nop();};
      008A5A 9D               [ 1]  358 	nop
      008A5B 9D               [ 1]  359 	nop
      008A5C 20 E3            [ 2]  360 	jra	00106$
      008A5E                        361 00108$:
                                    362 ;	driver/dht12.c: 281: GPIO_WriteLow(I2C_PORT, I2CSCL);
      008A5E 4B 10            [ 1]  363 	push	#0x10
      008A60 4B 05            [ 1]  364 	push	#0x05
      008A62 4B 50            [ 1]  365 	push	#0x50
      008A64 CD 94 89         [ 4]  366 	call	_GPIO_WriteLow
      008A67 5B 03            [ 2]  367 	addw	sp, #3
                                    368 ;	driver/dht12.c: 286: I2CDataInOut(I2CDataOut);  
      008A69 4B 00            [ 1]  369 	push	#0x00
      008A6B CD 88 E9         [ 4]  370 	call	_I2CDataInOut
      008A6E 84               [ 1]  371 	pop	a
                                    372 ;	driver/dht12.c: 287: if(count)
      008A6F 1E 01            [ 2]  373 	ldw	x, (0x01, sp)
      008A71 27 03            [ 1]  374 	jreq	00110$
                                    375 ;	driver/dht12.c: 290: I2CStatus = I2C_CRR;  
      008A73 A6 01            [ 1]  376 	ld	a, #0x01
                                    377 ;	driver/dht12.c: 298: I2CStatus = I2C_ERR;  
      008A75 21                     378 	.byte 0x21
      008A76                        379 00110$:
      008A76 4F               [ 1]  380 	clr	a
      008A77                        381 00111$:
                                    382 ;	driver/dht12.c: 301: return I2CStatus;  
                                    383 ;	driver/dht12.c: 303: }  
      008A77 5B 03            [ 2]  384 	addw	sp, #3
      008A79 81               [ 4]  385 	ret
                                    386 ;	driver/dht12.c: 318: UCHAR RcvByte(void)  
                                    387 ;	-----------------------------------------
                                    388 ;	 function RcvByte
                                    389 ;	-----------------------------------------
      008A7A                        390 _RcvByte:
      008A7A 52 02            [ 2]  391 	sub	sp, #2
                                    392 ;	driver/dht12.c: 324: UCHAR ReadByte=0;  
      008A7C 0F 02            [ 1]  393 	clr	(0x02, sp)
                                    394 ;	driver/dht12.c: 326: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
      008A7E 4B 20            [ 1]  395 	push	#0x20
      008A80 4B 05            [ 1]  396 	push	#0x05
      008A82 4B 50            [ 1]  397 	push	#0x50
      008A84 CD 94 82         [ 4]  398 	call	_GPIO_WriteHigh
      008A87 5B 03            [ 2]  399 	addw	sp, #3
                                    400 ;	driver/dht12.c: 329: I2CDataInOut(I2CDataIn);  
      008A89 4B 01            [ 1]  401 	push	#0x01
      008A8B CD 88 E9         [ 4]  402 	call	_I2CDataInOut
      008A8E 84               [ 1]  403 	pop	a
                                    404 ;	driver/dht12.c: 333: for(i=0; i<8; i++)  
      008A8F 0F 01            [ 1]  405 	clr	(0x01, sp)
      008A91                        406 00104$:
                                    407 ;	driver/dht12.c: 337: ReadByte <<= 1;  
      008A91 7B 02            [ 1]  408 	ld	a, (0x02, sp)
      008A93 48               [ 1]  409 	sll	a
      008A94 6B 02            [ 1]  410 	ld	(0x02, sp), a
                                    411 ;	driver/dht12.c: 339: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008A96 4B 10            [ 1]  412 	push	#0x10
      008A98 4B 05            [ 1]  413 	push	#0x05
      008A9A 4B 50            [ 1]  414 	push	#0x50
      008A9C CD 94 89         [ 4]  415 	call	_GPIO_WriteLow
      008A9F 5B 03            [ 2]  416 	addw	sp, #3
                                    417 ;	driver/dht12.c: 343: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008AA1 4B 10            [ 1]  418 	push	#0x10
      008AA3 4B 05            [ 1]  419 	push	#0x05
      008AA5 4B 50            [ 1]  420 	push	#0x50
      008AA7 CD 94 82         [ 4]  421 	call	_GPIO_WriteHigh
      008AAA 5B 03            [ 2]  422 	addw	sp, #3
                                    423 ;	driver/dht12.c: 348: if(GPIO_ReadInputPin(I2C_PORT,I2CSDA) !=RESET)  
      008AAC 4B 20            [ 1]  424 	push	#0x20
      008AAE 4B 05            [ 1]  425 	push	#0x05
      008AB0 4B 50            [ 1]  426 	push	#0x50
      008AB2 CD 94 A7         [ 4]  427 	call	_GPIO_ReadInputPin
      008AB5 5B 03            [ 2]  428 	addw	sp, #3
      008AB7 4D               [ 1]  429 	tnz	a
      008AB8 27 06            [ 1]  430 	jreq	00105$
                                    431 ;	driver/dht12.c: 350: {ReadByte |= 0x01;}  
      008ABA 7B 02            [ 1]  432 	ld	a, (0x02, sp)
      008ABC AA 01            [ 1]  433 	or	a, #0x01
      008ABE 6B 02            [ 1]  434 	ld	(0x02, sp), a
      008AC0                        435 00105$:
                                    436 ;	driver/dht12.c: 333: for(i=0; i<8; i++)  
      008AC0 0C 01            [ 1]  437 	inc	(0x01, sp)
      008AC2 7B 01            [ 1]  438 	ld	a, (0x01, sp)
      008AC4 A1 08            [ 1]  439 	cp	a, #0x08
      008AC6 25 C9            [ 1]  440 	jrc	00104$
                                    441 ;	driver/dht12.c: 356: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008AC8 4B 10            [ 1]  442 	push	#0x10
      008ACA 4B 05            [ 1]  443 	push	#0x05
      008ACC 4B 50            [ 1]  444 	push	#0x50
      008ACE CD 94 89         [ 4]  445 	call	_GPIO_WriteLow
      008AD1 5B 03            [ 2]  446 	addw	sp, #3
                                    447 ;	driver/dht12.c: 358: I2CDataInOut(I2CDataOut);  
      008AD3 4B 00            [ 1]  448 	push	#0x00
      008AD5 CD 88 E9         [ 4]  449 	call	_I2CDataInOut
      008AD8 84               [ 1]  450 	pop	a
                                    451 ;	driver/dht12.c: 362: return ReadByte;  
      008AD9 7B 02            [ 1]  452 	ld	a, (0x02, sp)
                                    453 ;	driver/dht12.c: 364: }  
      008ADB 5B 02            [ 2]  454 	addw	sp, #2
      008ADD 81               [ 4]  455 	ret
                                    456 ;	driver/dht12.c: 383: bool I2C_Read(UCHAR wrDAdr,UCHAR wordAdr,UCHAR *pRdDat,UCHAR num)  
                                    457 ;	-----------------------------------------
                                    458 ;	 function I2C_Read
                                    459 ;	-----------------------------------------
      008ADE                        460 _I2C_Read:
      008ADE 52 09            [ 2]  461 	sub	sp, #9
                                    462 ;	driver/dht12.c: 393: rdDAdr = wrDAdr+1; //读器件地址为写地址加1  
      008AE0 7B 0C            [ 1]  463 	ld	a, (0x0c, sp)
      008AE2 4C               [ 1]  464 	inc	a
      008AE3 6B 08            [ 1]  465 	ld	(0x08, sp), a
                                    466 ;	driver/dht12.c: 395: I2C_Start();  /*启动I2C*/  
      008AE5 CD 89 09         [ 4]  467 	call	_I2C_Start
                                    468 ;	driver/dht12.c: 399: I2CAck = SendByte(wrDAdr); /*发写器件地址*/  
      008AE8 7B 0C            [ 1]  469 	ld	a, (0x0c, sp)
      008AEA 88               [ 1]  470 	push	a
      008AEB CD 89 D5         [ 4]  471 	call	_SendByte
      008AEE 5B 01            [ 2]  472 	addw	sp, #1
                                    473 ;	driver/dht12.c: 401: if(!I2CAck)  
      008AF0 6B 03            [ 1]  474 	ld	(0x03, sp), a
      008AF2 26 03            [ 1]  475 	jrne	00102$
                                    476 ;	driver/dht12.c: 405: return I2C_ERR;  
      008AF4 4F               [ 1]  477 	clr	a
      008AF5 20 64            [ 2]  478 	jra	00113$
      008AF7                        479 00102$:
                                    480 ;	driver/dht12.c: 409: I2CAck = SendByte(wordAdr); /*发寄存器地址*/  
      008AF7 7B 0D            [ 1]  481 	ld	a, (0x0d, sp)
      008AF9 88               [ 1]  482 	push	a
      008AFA CD 89 D5         [ 4]  483 	call	_SendByte
      008AFD 5B 01            [ 2]  484 	addw	sp, #1
                                    485 ;	driver/dht12.c: 411: if(!I2CAck)  
      008AFF 4D               [ 1]  486 	tnz	a
      008B00 26 03            [ 1]  487 	jrne	00104$
                                    488 ;	driver/dht12.c: 415: return I2C_ERR;  
      008B02 4F               [ 1]  489 	clr	a
      008B03 20 56            [ 2]  490 	jra	00113$
      008B05                        491 00104$:
                                    492 ;	driver/dht12.c: 419: I2C_Start();   /*重启I2C*/  
      008B05 CD 89 09         [ 4]  493 	call	_I2C_Start
                                    494 ;	driver/dht12.c: 421: I2CAck = SendByte(rdDAdr); /*发读器件地址*/  
      008B08 7B 08            [ 1]  495 	ld	a, (0x08, sp)
      008B0A 88               [ 1]  496 	push	a
      008B0B CD 89 D5         [ 4]  497 	call	_SendByte
      008B0E 5B 01            [ 2]  498 	addw	sp, #1
                                    499 ;	driver/dht12.c: 423: if(!I2CAck)  
      008B10 4D               [ 1]  500 	tnz	a
      008B11 26 03            [ 1]  501 	jrne	00119$
                                    502 ;	driver/dht12.c: 427: return I2C_ERR;  
      008B13 4F               [ 1]  503 	clr	a
      008B14 20 45            [ 2]  504 	jra	00113$
                                    505 ;	driver/dht12.c: 433: for(i=0;i<num-1;i++)  
      008B16                        506 00119$:
      008B16 0F 09            [ 1]  507 	clr	(0x09, sp)
      008B18                        508 00111$:
      008B18 5F               [ 1]  509 	clrw	x
      008B19 7B 10            [ 1]  510 	ld	a, (0x10, sp)
      008B1B 97               [ 1]  511 	ld	xl, a
      008B1C 5A               [ 2]  512 	decw	x
      008B1D 1F 01            [ 2]  513 	ldw	(0x01, sp), x
      008B1F 7B 09            [ 1]  514 	ld	a, (0x09, sp)
      008B21 6B 07            [ 1]  515 	ld	(0x07, sp), a
      008B23 0F 06            [ 1]  516 	clr	(0x06, sp)
                                    517 ;	driver/dht12.c: 437: *(pRdDat+i) = RcvByte();  
      008B25 5F               [ 1]  518 	clrw	x
      008B26 7B 09            [ 1]  519 	ld	a, (0x09, sp)
      008B28 97               [ 1]  520 	ld	xl, a
      008B29 72 FB 0E         [ 2]  521 	addw	x, (0x0e, sp)
      008B2C 1F 04            [ 2]  522 	ldw	(0x04, sp), x
                                    523 ;	driver/dht12.c: 433: for(i=0;i<num-1;i++)  
      008B2E 1E 06            [ 2]  524 	ldw	x, (0x06, sp)
      008B30 13 01            [ 2]  525 	cpw	x, (0x01, sp)
      008B32 2E 0D            [ 1]  526 	jrsge	00107$
                                    527 ;	driver/dht12.c: 437: *(pRdDat+i) = RcvByte();  
      008B34 CD 8A 7A         [ 4]  528 	call	_RcvByte
      008B37 1E 04            [ 2]  529 	ldw	x, (0x04, sp)
      008B39 F7               [ 1]  530 	ld	(x), a
                                    531 ;	driver/dht12.c: 439: I2C_Rack();  
      008B3A CD 89 6F         [ 4]  532 	call	_I2C_Rack
                                    533 ;	driver/dht12.c: 433: for(i=0;i<num-1;i++)  
      008B3D 0C 09            [ 1]  534 	inc	(0x09, sp)
      008B3F 20 D7            [ 2]  535 	jra	00111$
      008B41                        536 00107$:
                                    537 ;	driver/dht12.c: 443: if(i==num-1)  
      008B41 1E 06            [ 2]  538 	ldw	x, (0x06, sp)
      008B43 13 01            [ 2]  539 	cpw	x, (0x01, sp)
      008B45 26 0F            [ 1]  540 	jrne	00109$
                                    541 ;	driver/dht12.c: 447: *(pRdDat+i) = RcvByte();  
      008B47 CD 8A 7A         [ 4]  542 	call	_RcvByte
      008B4A 1E 04            [ 2]  543 	ldw	x, (0x04, sp)
      008B4C F7               [ 1]  544 	ld	(x), a
                                    545 ;	driver/dht12.c: 449: I2C_Rack();
      008B4D CD 89 6F         [ 4]  546 	call	_I2C_Rack
                                    547 ;	driver/dht12.c: 450: RcvByte();
      008B50 CD 8A 7A         [ 4]  548 	call	_RcvByte
                                    549 ;	driver/dht12.c: 452: I2C_nAck();  
      008B53 CD 89 A2         [ 4]  550 	call	_I2C_nAck
      008B56                        551 00109$:
                                    552 ;	driver/dht12.c: 456: I2C_Stop();  
      008B56 CD 89 3C         [ 4]  553 	call	_I2C_Stop
                                    554 ;	driver/dht12.c: 457: return I2C_CRR;  
      008B59 A6 01            [ 1]  555 	ld	a, #0x01
      008B5B                        556 00113$:
                                    557 ;	driver/dht12.c: 459: }  
      008B5B 5B 09            [ 2]  558 	addw	sp, #9
      008B5D 81               [ 4]  559 	ret
                                    560 ;	driver/dht12.c: 541: u8 i2c_read(u8 dev_addr,u8 Addr)
                                    561 ;	-----------------------------------------
                                    562 ;	 function i2c_read
                                    563 ;	-----------------------------------------
      008B5E                        564 _i2c_read:
      008B5E 88               [ 1]  565 	push	a
                                    566 ;	driver/dht12.c: 544: if(I2C_Read(dev_addr,Addr,&temp,1))
      008B5F 96               [ 1]  567 	ldw	x, sp
      008B60 5C               [ 1]  568 	incw	x
      008B61 4B 01            [ 1]  569 	push	#0x01
      008B63 89               [ 2]  570 	pushw	x
      008B64 7B 08            [ 1]  571 	ld	a, (0x08, sp)
      008B66 88               [ 1]  572 	push	a
      008B67 7B 08            [ 1]  573 	ld	a, (0x08, sp)
      008B69 88               [ 1]  574 	push	a
      008B6A CD 8A DE         [ 4]  575 	call	_I2C_Read
      008B6D 5B 05            [ 2]  576 	addw	sp, #5
      008B6F 4D               [ 1]  577 	tnz	a
      008B70 27 03            [ 1]  578 	jreq	00102$
                                    579 ;	driver/dht12.c: 545: return temp;
      008B72 7B 01            [ 1]  580 	ld	a, (0x01, sp)
                                    581 ;	driver/dht12.c: 546: else return 0;
      008B74 21                     582 	.byte 0x21
      008B75                        583 00102$:
      008B75 4F               [ 1]  584 	clr	a
      008B76                        585 00104$:
                                    586 ;	driver/dht12.c: 547: }
      008B76 5B 01            [ 2]  587 	addw	sp, #1
      008B78 81               [ 4]  588 	ret
                                    589 ;	driver/dht12.c: 549: void ReadDHT12(DHT12_DATA *data) 
                                    590 ;	-----------------------------------------
                                    591 ;	 function ReadDHT12
                                    592 ;	-----------------------------------------
      008B79                        593 _ReadDHT12:
      008B79 52 02            [ 2]  594 	sub	sp, #2
                                    595 ;	driver/dht12.c: 551: i2c_init();
      008B7B CD 88 B3         [ 4]  596 	call	_i2c_init
                                    597 ;	driver/dht12.c: 552: data->W=i2c_read(0xB8,0x00);
      008B7E 16 05            [ 2]  598 	ldw	y, (0x05, sp)
      008B80 17 01            [ 2]  599 	ldw	(0x01, sp), y
      008B82 93               [ 1]  600 	ldw	x, y
      008B83 5C               [ 1]  601 	incw	x
      008B84 5C               [ 1]  602 	incw	x
      008B85 89               [ 2]  603 	pushw	x
      008B86 4B 00            [ 1]  604 	push	#0x00
      008B88 4B B8            [ 1]  605 	push	#0xb8
      008B8A CD 8B 5E         [ 4]  606 	call	_i2c_read
      008B8D 5B 02            [ 2]  607 	addw	sp, #2
      008B8F 85               [ 2]  608 	popw	x
      008B90 F7               [ 1]  609 	ld	(x), a
                                    610 ;	driver/dht12.c: 553: data->W1=i2c_read(0xB8,0x01);
      008B91 1E 01            [ 2]  611 	ldw	x, (0x01, sp)
      008B93 1C 00 03         [ 2]  612 	addw	x, #0x0003
      008B96 89               [ 2]  613 	pushw	x
      008B97 4B 01            [ 1]  614 	push	#0x01
      008B99 4B B8            [ 1]  615 	push	#0xb8
      008B9B CD 8B 5E         [ 4]  616 	call	_i2c_read
      008B9E 5B 02            [ 2]  617 	addw	sp, #2
      008BA0 85               [ 2]  618 	popw	x
      008BA1 F7               [ 1]  619 	ld	(x), a
                                    620 ;	driver/dht12.c: 554: data->T=i2c_read(0xB8,0x02);
      008BA2 4B 02            [ 1]  621 	push	#0x02
      008BA4 4B B8            [ 1]  622 	push	#0xb8
      008BA6 CD 8B 5E         [ 4]  623 	call	_i2c_read
      008BA9 5B 02            [ 2]  624 	addw	sp, #2
      008BAB 1E 01            [ 2]  625 	ldw	x, (0x01, sp)
      008BAD F7               [ 1]  626 	ld	(x), a
                                    627 ;	driver/dht12.c: 555: data->T1=i2c_read(0xB8,0x03);
      008BAE 1E 01            [ 2]  628 	ldw	x, (0x01, sp)
      008BB0 5C               [ 1]  629 	incw	x
      008BB1 89               [ 2]  630 	pushw	x
      008BB2 4B 03            [ 1]  631 	push	#0x03
      008BB4 4B B8            [ 1]  632 	push	#0xb8
      008BB6 CD 8B 5E         [ 4]  633 	call	_i2c_read
      008BB9 5B 02            [ 2]  634 	addw	sp, #2
      008BBB 85               [ 2]  635 	popw	x
      008BBC F7               [ 1]  636 	ld	(x), a
                                    637 ;	driver/dht12.c: 556: data->sum=i2c_read(0xB8,0x04);
      008BBD 1E 01            [ 2]  638 	ldw	x, (0x01, sp)
      008BBF 1C 00 04         [ 2]  639 	addw	x, #0x0004
      008BC2 89               [ 2]  640 	pushw	x
      008BC3 4B 04            [ 1]  641 	push	#0x04
      008BC5 4B B8            [ 1]  642 	push	#0xb8
      008BC7 CD 8B 5E         [ 4]  643 	call	_i2c_read
      008BCA 5B 02            [ 2]  644 	addw	sp, #2
      008BCC 85               [ 2]  645 	popw	x
      008BCD F7               [ 1]  646 	ld	(x), a
                                    647 ;	driver/dht12.c: 557: i2c_deinit();
      008BCE CD 88 CE         [ 4]  648 	call	_i2c_deinit
                                    649 ;	driver/dht12.c: 558: }
      008BD1 5B 02            [ 2]  650 	addw	sp, #2
      008BD3 81               [ 4]  651 	ret
                                    652 	.area CODE
                                    653 	.area CONST
                                    654 	.area INITIALIZER
                                    655 	.area CABS (ABS)
