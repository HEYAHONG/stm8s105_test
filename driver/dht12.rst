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
      0088EE                         68 _i2c_init:
                                     69 ;	driver/dht12.c: 40: GPIO_Init(GPIOB,GPIO_PIN_4,GPIO_MODE_OUT_OD_LOW_FAST);
      0088EE 4B A0            [ 1]   70 	push	#0xa0
      0088F0 4B 10            [ 1]   71 	push	#0x10
      0088F2 4B 05            [ 1]   72 	push	#0x05
      0088F4 4B 50            [ 1]   73 	push	#0x50
      0088F6 CD 94 42         [ 4]   74 	call	_GPIO_Init
      0088F9 5B 04            [ 2]   75 	addw	sp, #4
                                     76 ;	driver/dht12.c: 41: GPIO_Init(GPIOB,GPIO_PIN_5,GPIO_MODE_OUT_OD_LOW_FAST);
      0088FB 4B A0            [ 1]   77 	push	#0xa0
      0088FD 4B 20            [ 1]   78 	push	#0x20
      0088FF 4B 05            [ 1]   79 	push	#0x05
      008901 4B 50            [ 1]   80 	push	#0x50
      008903 CD 94 42         [ 4]   81 	call	_GPIO_Init
      008906 5B 04            [ 2]   82 	addw	sp, #4
                                     83 ;	driver/dht12.c: 42: }
      008908 81               [ 4]   84 	ret
                                     85 ;	driver/dht12.c: 43: void i2c_deinit() 
                                     86 ;	-----------------------------------------
                                     87 ;	 function i2c_deinit
                                     88 ;	-----------------------------------------
      008909                         89 _i2c_deinit:
                                     90 ;	driver/dht12.c: 46: GPIO_Init(GPIOB,GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
      008909 4B 00            [ 1]   91 	push	#0x00
      00890B 4B 10            [ 1]   92 	push	#0x10
      00890D 4B 05            [ 1]   93 	push	#0x05
      00890F 4B 50            [ 1]   94 	push	#0x50
      008911 CD 94 42         [ 4]   95 	call	_GPIO_Init
      008914 5B 04            [ 2]   96 	addw	sp, #4
                                     97 ;	driver/dht12.c: 47: GPIO_Init(GPIOB,GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);
      008916 4B 00            [ 1]   98 	push	#0x00
      008918 4B 20            [ 1]   99 	push	#0x20
      00891A 4B 05            [ 1]  100 	push	#0x05
      00891C 4B 50            [ 1]  101 	push	#0x50
      00891E CD 94 42         [ 4]  102 	call	_GPIO_Init
      008921 5B 04            [ 2]  103 	addw	sp, #4
                                    104 ;	driver/dht12.c: 48: }
      008923 81               [ 4]  105 	ret
                                    106 ;	driver/dht12.c: 63: void I2CDataInOut(bool InOut)  
                                    107 ;	-----------------------------------------
                                    108 ;	 function I2CDataInOut
                                    109 ;	-----------------------------------------
      008924                        110 _I2CDataInOut:
                                    111 ;	driver/dht12.c: 67: if(InOut)  
      008924 0D 03            [ 1]  112 	tnz	(0x03, sp)
      008926 27 0E            [ 1]  113 	jreq	00102$
                                    114 ;	driver/dht12.c: 71: GPIO_Init(I2C_PORT,I2CSDA,GPIO_MODE_IN_FL_NO_IT);  
      008928 4B 00            [ 1]  115 	push	#0x00
      00892A 4B 20            [ 1]  116 	push	#0x20
      00892C 4B 05            [ 1]  117 	push	#0x05
      00892E 4B 50            [ 1]  118 	push	#0x50
      008930 CD 94 42         [ 4]  119 	call	_GPIO_Init
      008933 5B 04            [ 2]  120 	addw	sp, #4
      008935 81               [ 4]  121 	ret
      008936                        122 00102$:
                                    123 ;	driver/dht12.c: 79: GPIO_Init(I2C_PORT,I2CSDA,GPIO_MODE_OUT_PP_LOW_FAST);  
      008936 4B E0            [ 1]  124 	push	#0xe0
      008938 4B 20            [ 1]  125 	push	#0x20
      00893A 4B 05            [ 1]  126 	push	#0x05
      00893C 4B 50            [ 1]  127 	push	#0x50
      00893E CD 94 42         [ 4]  128 	call	_GPIO_Init
      008941 5B 04            [ 2]  129 	addw	sp, #4
                                    130 ;	driver/dht12.c: 83: }  
      008943 81               [ 4]  131 	ret
                                    132 ;	driver/dht12.c: 95: void I2C_Start (void)  
                                    133 ;	-----------------------------------------
                                    134 ;	 function I2C_Start
                                    135 ;	-----------------------------------------
      008944                        136 _I2C_Start:
                                    137 ;	driver/dht12.c: 98: I2CDataInOut(I2CDataOut);
      008944 4B 00            [ 1]  138 	push	#0x00
      008946 CD 89 24         [ 4]  139 	call	_I2CDataInOut
      008949 84               [ 1]  140 	pop	a
                                    141 ;	driver/dht12.c: 100: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
      00894A 4B 20            [ 1]  142 	push	#0x20
      00894C 4B 05            [ 1]  143 	push	#0x05
      00894E 4B 50            [ 1]  144 	push	#0x50
      008950 CD 94 BD         [ 4]  145 	call	_GPIO_WriteHigh
      008953 5B 03            [ 2]  146 	addw	sp, #3
                                    147 ;	driver/dht12.c: 104: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008955 4B 10            [ 1]  148 	push	#0x10
      008957 4B 05            [ 1]  149 	push	#0x05
      008959 4B 50            [ 1]  150 	push	#0x50
      00895B CD 94 BD         [ 4]  151 	call	_GPIO_WriteHigh
      00895E 5B 03            [ 2]  152 	addw	sp, #3
                                    153 ;	driver/dht12.c: 108: GPIO_WriteLow(I2C_PORT, I2CSDA);  
      008960 4B 20            [ 1]  154 	push	#0x20
      008962 4B 05            [ 1]  155 	push	#0x05
      008964 4B 50            [ 1]  156 	push	#0x50
      008966 CD 94 C4         [ 4]  157 	call	_GPIO_WriteLow
      008969 5B 03            [ 2]  158 	addw	sp, #3
                                    159 ;	driver/dht12.c: 111: GPIO_WriteLow(I2C_PORT, I2CSCL);    
      00896B 4B 10            [ 1]  160 	push	#0x10
      00896D 4B 05            [ 1]  161 	push	#0x05
      00896F 4B 50            [ 1]  162 	push	#0x50
      008971 CD 94 C4         [ 4]  163 	call	_GPIO_WriteLow
      008974 5B 03            [ 2]  164 	addw	sp, #3
                                    165 ;	driver/dht12.c: 112: }  
      008976 81               [ 4]  166 	ret
                                    167 ;	driver/dht12.c: 122: void I2C_Stop (void)  
                                    168 ;	-----------------------------------------
                                    169 ;	 function I2C_Stop
                                    170 ;	-----------------------------------------
      008977                        171 _I2C_Stop:
                                    172 ;	driver/dht12.c: 125: I2CDataInOut(I2CDataOut);
      008977 4B 00            [ 1]  173 	push	#0x00
      008979 CD 89 24         [ 4]  174 	call	_I2CDataInOut
      00897C 84               [ 1]  175 	pop	a
                                    176 ;	driver/dht12.c: 126: GPIO_WriteLow(I2C_PORT, I2CSCL); 
      00897D 4B 10            [ 1]  177 	push	#0x10
      00897F 4B 05            [ 1]  178 	push	#0x05
      008981 4B 50            [ 1]  179 	push	#0x50
      008983 CD 94 C4         [ 4]  180 	call	_GPIO_WriteLow
      008986 5B 03            [ 2]  181 	addw	sp, #3
                                    182 ;	driver/dht12.c: 128: GPIO_WriteLow(I2C_PORT, I2CSDA);  
      008988 4B 20            [ 1]  183 	push	#0x20
      00898A 4B 05            [ 1]  184 	push	#0x05
      00898C 4B 50            [ 1]  185 	push	#0x50
      00898E CD 94 C4         [ 4]  186 	call	_GPIO_WriteLow
      008991 5B 03            [ 2]  187 	addw	sp, #3
                                    188 ;	driver/dht12.c: 132: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008993 4B 10            [ 1]  189 	push	#0x10
      008995 4B 05            [ 1]  190 	push	#0x05
      008997 4B 50            [ 1]  191 	push	#0x50
      008999 CD 94 BD         [ 4]  192 	call	_GPIO_WriteHigh
      00899C 5B 03            [ 2]  193 	addw	sp, #3
                                    194 ;	driver/dht12.c: 136: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
      00899E 4B 20            [ 1]  195 	push	#0x20
      0089A0 4B 05            [ 1]  196 	push	#0x05
      0089A2 4B 50            [ 1]  197 	push	#0x50
      0089A4 CD 94 BD         [ 4]  198 	call	_GPIO_WriteHigh
      0089A7 5B 03            [ 2]  199 	addw	sp, #3
                                    200 ;	driver/dht12.c: 138: }  
      0089A9 81               [ 4]  201 	ret
                                    202 ;	driver/dht12.c: 152: void I2C_Rack(void)  
                                    203 ;	-----------------------------------------
                                    204 ;	 function I2C_Rack
                                    205 ;	-----------------------------------------
      0089AA                        206 _I2C_Rack:
                                    207 ;	driver/dht12.c: 155: I2CDataInOut(I2CDataOut);
      0089AA 4B 00            [ 1]  208 	push	#0x00
      0089AC CD 89 24         [ 4]  209 	call	_I2CDataInOut
      0089AF 84               [ 1]  210 	pop	a
                                    211 ;	driver/dht12.c: 157: GPIO_WriteLow(I2C_PORT, I2CSDA);  
      0089B0 4B 20            [ 1]  212 	push	#0x20
      0089B2 4B 05            [ 1]  213 	push	#0x05
      0089B4 4B 50            [ 1]  214 	push	#0x50
      0089B6 CD 94 C4         [ 4]  215 	call	_GPIO_WriteLow
      0089B9 5B 03            [ 2]  216 	addw	sp, #3
                                    217 ;	driver/dht12.c: 160: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      0089BB 4B 10            [ 1]  218 	push	#0x10
      0089BD 4B 05            [ 1]  219 	push	#0x05
      0089BF 4B 50            [ 1]  220 	push	#0x50
      0089C1 CD 94 C4         [ 4]  221 	call	_GPIO_WriteLow
      0089C4 5B 03            [ 2]  222 	addw	sp, #3
                                    223 ;	driver/dht12.c: 162: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      0089C6 4B 10            [ 1]  224 	push	#0x10
      0089C8 4B 05            [ 1]  225 	push	#0x05
      0089CA 4B 50            [ 1]  226 	push	#0x50
      0089CC CD 94 BD         [ 4]  227 	call	_GPIO_WriteHigh
      0089CF 5B 03            [ 2]  228 	addw	sp, #3
                                    229 ;	driver/dht12.c: 166: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      0089D1 4B 10            [ 1]  230 	push	#0x10
      0089D3 4B 05            [ 1]  231 	push	#0x05
      0089D5 4B 50            [ 1]  232 	push	#0x50
      0089D7 CD 94 C4         [ 4]  233 	call	_GPIO_WriteLow
      0089DA 5B 03            [ 2]  234 	addw	sp, #3
                                    235 ;	driver/dht12.c: 170: }  
      0089DC 81               [ 4]  236 	ret
                                    237 ;	driver/dht12.c: 185: void I2C_nAck (void)  
                                    238 ;	-----------------------------------------
                                    239 ;	 function I2C_nAck
                                    240 ;	-----------------------------------------
      0089DD                        241 _I2C_nAck:
                                    242 ;	driver/dht12.c: 188: I2CDataInOut(I2CDataOut);
      0089DD 4B 00            [ 1]  243 	push	#0x00
      0089DF CD 89 24         [ 4]  244 	call	_I2CDataInOut
      0089E2 84               [ 1]  245 	pop	a
                                    246 ;	driver/dht12.c: 191: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
      0089E3 4B 20            [ 1]  247 	push	#0x20
      0089E5 4B 05            [ 1]  248 	push	#0x05
      0089E7 4B 50            [ 1]  249 	push	#0x50
      0089E9 CD 94 BD         [ 4]  250 	call	_GPIO_WriteHigh
      0089EC 5B 03            [ 2]  251 	addw	sp, #3
                                    252 ;	driver/dht12.c: 195: GPIO_WriteLow(I2C_PORT, I2CSCL); 
      0089EE 4B 10            [ 1]  253 	push	#0x10
      0089F0 4B 05            [ 1]  254 	push	#0x05
      0089F2 4B 50            [ 1]  255 	push	#0x50
      0089F4 CD 94 C4         [ 4]  256 	call	_GPIO_WriteLow
      0089F7 5B 03            [ 2]  257 	addw	sp, #3
                                    258 ;	driver/dht12.c: 197: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      0089F9 4B 10            [ 1]  259 	push	#0x10
      0089FB 4B 05            [ 1]  260 	push	#0x05
      0089FD 4B 50            [ 1]  261 	push	#0x50
      0089FF CD 94 BD         [ 4]  262 	call	_GPIO_WriteHigh
      008A02 5B 03            [ 2]  263 	addw	sp, #3
                                    264 ;	driver/dht12.c: 201: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008A04 4B 10            [ 1]  265 	push	#0x10
      008A06 4B 05            [ 1]  266 	push	#0x05
      008A08 4B 50            [ 1]  267 	push	#0x50
      008A0A CD 94 C4         [ 4]  268 	call	_GPIO_WriteLow
      008A0D 5B 03            [ 2]  269 	addw	sp, #3
                                    270 ;	driver/dht12.c: 205: }  
      008A0F 81               [ 4]  271 	ret
                                    272 ;	driver/dht12.c: 215: bool SendByte(UCHAR I2cData)  
                                    273 ;	-----------------------------------------
                                    274 ;	 function SendByte
                                    275 ;	-----------------------------------------
      008A10                        276 _SendByte:
      008A10 52 03            [ 2]  277 	sub	sp, #3
                                    278 ;	driver/dht12.c: 224: for(i=0; i<8; i++)  
      008A12 0F 03            [ 1]  279 	clr	(0x03, sp)
      008A14                        280 00112$:
                                    281 ;	driver/dht12.c: 228: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008A14 4B 10            [ 1]  282 	push	#0x10
      008A16 4B 05            [ 1]  283 	push	#0x05
      008A18 4B 50            [ 1]  284 	push	#0x50
      008A1A CD 94 C4         [ 4]  285 	call	_GPIO_WriteLow
      008A1D 5B 03            [ 2]  286 	addw	sp, #3
                                    287 ;	driver/dht12.c: 232: if(I2cData & 0x80)  
      008A1F 7B 06            [ 1]  288 	ld	a, (0x06, sp)
      008A21 2A 0D            [ 1]  289 	jrpl	00102$
                                    290 ;	driver/dht12.c: 234: {GPIO_WriteHigh(I2C_PORT, I2CSDA);}  
      008A23 4B 20            [ 1]  291 	push	#0x20
      008A25 4B 05            [ 1]  292 	push	#0x05
      008A27 4B 50            [ 1]  293 	push	#0x50
      008A29 CD 94 BD         [ 4]  294 	call	_GPIO_WriteHigh
      008A2C 5B 03            [ 2]  295 	addw	sp, #3
      008A2E 20 0B            [ 2]  296 	jra	00103$
      008A30                        297 00102$:
                                    298 ;	driver/dht12.c: 238: {GPIO_WriteLow(I2C_PORT, I2CSDA);}  
      008A30 4B 20            [ 1]  299 	push	#0x20
      008A32 4B 05            [ 1]  300 	push	#0x05
      008A34 4B 50            [ 1]  301 	push	#0x50
      008A36 CD 94 C4         [ 4]  302 	call	_GPIO_WriteLow
      008A39 5B 03            [ 2]  303 	addw	sp, #3
      008A3B                        304 00103$:
                                    305 ;	driver/dht12.c: 240: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008A3B 4B 10            [ 1]  306 	push	#0x10
      008A3D 4B 05            [ 1]  307 	push	#0x05
      008A3F 4B 50            [ 1]  308 	push	#0x50
      008A41 CD 94 BD         [ 4]  309 	call	_GPIO_WriteHigh
      008A44 5B 03            [ 2]  310 	addw	sp, #3
                                    311 ;	driver/dht12.c: 244: I2cData <<= 1;  
      008A46 08 06            [ 1]  312 	sll	(0x06, sp)
                                    313 ;	driver/dht12.c: 224: for(i=0; i<8; i++)  
      008A48 0C 03            [ 1]  314 	inc	(0x03, sp)
      008A4A 7B 03            [ 1]  315 	ld	a, (0x03, sp)
      008A4C A1 08            [ 1]  316 	cp	a, #0x08
      008A4E 25 C4            [ 1]  317 	jrc	00112$
                                    318 ;	driver/dht12.c: 248: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008A50 4B 10            [ 1]  319 	push	#0x10
      008A52 4B 05            [ 1]  320 	push	#0x05
      008A54 4B 50            [ 1]  321 	push	#0x50
      008A56 CD 94 C4         [ 4]  322 	call	_GPIO_WriteLow
      008A59 5B 03            [ 2]  323 	addw	sp, #3
                                    324 ;	driver/dht12.c: 250: GPIO_WriteHigh(I2C_PORT, I2CSDA);//发送完一字节，接收应答  
      008A5B 4B 20            [ 1]  325 	push	#0x20
      008A5D 4B 05            [ 1]  326 	push	#0x05
      008A5F 4B 50            [ 1]  327 	push	#0x50
      008A61 CD 94 BD         [ 4]  328 	call	_GPIO_WriteHigh
      008A64 5B 03            [ 2]  329 	addw	sp, #3
                                    330 ;	driver/dht12.c: 254: I2CDataInOut(I2CDataIn);  
      008A66 4B 01            [ 1]  331 	push	#0x01
      008A68 CD 89 24         [ 4]  332 	call	_I2CDataInOut
      008A6B 84               [ 1]  333 	pop	a
                                    334 ;	driver/dht12.c: 257: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008A6C 4B 10            [ 1]  335 	push	#0x10
      008A6E 4B 05            [ 1]  336 	push	#0x05
      008A70 4B 50            [ 1]  337 	push	#0x50
      008A72 CD 94 BD         [ 4]  338 	call	_GPIO_WriteHigh
      008A75 5B 03            [ 2]  339 	addw	sp, #3
                                    340 ;	driver/dht12.c: 279: while(GPIO_ReadInputPin(I2C_PORT,I2CSDA) &&count--)
      008A77 AE 03 E8         [ 2]  341 	ldw	x, #0x03e8
      008A7A 1F 01            [ 2]  342 	ldw	(0x01, sp), x
      008A7C                        343 00106$:
      008A7C 4B 20            [ 1]  344 	push	#0x20
      008A7E 4B 05            [ 1]  345 	push	#0x05
      008A80 4B 50            [ 1]  346 	push	#0x50
      008A82 CD 94 E2         [ 4]  347 	call	_GPIO_ReadInputPin
      008A85 5B 03            [ 2]  348 	addw	sp, #3
      008A87 4D               [ 1]  349 	tnz	a
      008A88 27 0F            [ 1]  350 	jreq	00108$
      008A8A 1E 01            [ 2]  351 	ldw	x, (0x01, sp)
      008A8C 16 01            [ 2]  352 	ldw	y, (0x01, sp)
      008A8E 90 5A            [ 2]  353 	decw	y
      008A90 17 01            [ 2]  354 	ldw	(0x01, sp), y
      008A92 5D               [ 2]  355 	tnzw	x
      008A93 27 04            [ 1]  356 	jreq	00108$
                                    357 ;	driver/dht12.c: 280: {nop();nop();};
      008A95 9D               [ 1]  358 	nop
      008A96 9D               [ 1]  359 	nop
      008A97 20 E3            [ 2]  360 	jra	00106$
      008A99                        361 00108$:
                                    362 ;	driver/dht12.c: 281: GPIO_WriteLow(I2C_PORT, I2CSCL);
      008A99 4B 10            [ 1]  363 	push	#0x10
      008A9B 4B 05            [ 1]  364 	push	#0x05
      008A9D 4B 50            [ 1]  365 	push	#0x50
      008A9F CD 94 C4         [ 4]  366 	call	_GPIO_WriteLow
      008AA2 5B 03            [ 2]  367 	addw	sp, #3
                                    368 ;	driver/dht12.c: 286: I2CDataInOut(I2CDataOut);  
      008AA4 4B 00            [ 1]  369 	push	#0x00
      008AA6 CD 89 24         [ 4]  370 	call	_I2CDataInOut
      008AA9 84               [ 1]  371 	pop	a
                                    372 ;	driver/dht12.c: 287: if(count)
      008AAA 1E 01            [ 2]  373 	ldw	x, (0x01, sp)
      008AAC 27 03            [ 1]  374 	jreq	00110$
                                    375 ;	driver/dht12.c: 290: I2CStatus = I2C_CRR;  
      008AAE A6 01            [ 1]  376 	ld	a, #0x01
                                    377 ;	driver/dht12.c: 298: I2CStatus = I2C_ERR;  
      008AB0 21                     378 	.byte 0x21
      008AB1                        379 00110$:
      008AB1 4F               [ 1]  380 	clr	a
      008AB2                        381 00111$:
                                    382 ;	driver/dht12.c: 301: return I2CStatus;  
                                    383 ;	driver/dht12.c: 303: }  
      008AB2 5B 03            [ 2]  384 	addw	sp, #3
      008AB4 81               [ 4]  385 	ret
                                    386 ;	driver/dht12.c: 318: UCHAR RcvByte(void)  
                                    387 ;	-----------------------------------------
                                    388 ;	 function RcvByte
                                    389 ;	-----------------------------------------
      008AB5                        390 _RcvByte:
      008AB5 52 02            [ 2]  391 	sub	sp, #2
                                    392 ;	driver/dht12.c: 324: UCHAR ReadByte=0;  
      008AB7 0F 02            [ 1]  393 	clr	(0x02, sp)
                                    394 ;	driver/dht12.c: 326: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
      008AB9 4B 20            [ 1]  395 	push	#0x20
      008ABB 4B 05            [ 1]  396 	push	#0x05
      008ABD 4B 50            [ 1]  397 	push	#0x50
      008ABF CD 94 BD         [ 4]  398 	call	_GPIO_WriteHigh
      008AC2 5B 03            [ 2]  399 	addw	sp, #3
                                    400 ;	driver/dht12.c: 329: I2CDataInOut(I2CDataIn);  
      008AC4 4B 01            [ 1]  401 	push	#0x01
      008AC6 CD 89 24         [ 4]  402 	call	_I2CDataInOut
      008AC9 84               [ 1]  403 	pop	a
                                    404 ;	driver/dht12.c: 333: for(i=0; i<8; i++)  
      008ACA 0F 01            [ 1]  405 	clr	(0x01, sp)
      008ACC                        406 00104$:
                                    407 ;	driver/dht12.c: 337: ReadByte <<= 1;  
      008ACC 7B 02            [ 1]  408 	ld	a, (0x02, sp)
      008ACE 48               [ 1]  409 	sll	a
      008ACF 6B 02            [ 1]  410 	ld	(0x02, sp), a
                                    411 ;	driver/dht12.c: 339: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008AD1 4B 10            [ 1]  412 	push	#0x10
      008AD3 4B 05            [ 1]  413 	push	#0x05
      008AD5 4B 50            [ 1]  414 	push	#0x50
      008AD7 CD 94 C4         [ 4]  415 	call	_GPIO_WriteLow
      008ADA 5B 03            [ 2]  416 	addw	sp, #3
                                    417 ;	driver/dht12.c: 343: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008ADC 4B 10            [ 1]  418 	push	#0x10
      008ADE 4B 05            [ 1]  419 	push	#0x05
      008AE0 4B 50            [ 1]  420 	push	#0x50
      008AE2 CD 94 BD         [ 4]  421 	call	_GPIO_WriteHigh
      008AE5 5B 03            [ 2]  422 	addw	sp, #3
                                    423 ;	driver/dht12.c: 348: if(GPIO_ReadInputPin(I2C_PORT,I2CSDA) !=RESET)  
      008AE7 4B 20            [ 1]  424 	push	#0x20
      008AE9 4B 05            [ 1]  425 	push	#0x05
      008AEB 4B 50            [ 1]  426 	push	#0x50
      008AED CD 94 E2         [ 4]  427 	call	_GPIO_ReadInputPin
      008AF0 5B 03            [ 2]  428 	addw	sp, #3
      008AF2 4D               [ 1]  429 	tnz	a
      008AF3 27 06            [ 1]  430 	jreq	00105$
                                    431 ;	driver/dht12.c: 350: {ReadByte |= 0x01;}  
      008AF5 7B 02            [ 1]  432 	ld	a, (0x02, sp)
      008AF7 AA 01            [ 1]  433 	or	a, #0x01
      008AF9 6B 02            [ 1]  434 	ld	(0x02, sp), a
      008AFB                        435 00105$:
                                    436 ;	driver/dht12.c: 333: for(i=0; i<8; i++)  
      008AFB 0C 01            [ 1]  437 	inc	(0x01, sp)
      008AFD 7B 01            [ 1]  438 	ld	a, (0x01, sp)
      008AFF A1 08            [ 1]  439 	cp	a, #0x08
      008B01 25 C9            [ 1]  440 	jrc	00104$
                                    441 ;	driver/dht12.c: 356: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008B03 4B 10            [ 1]  442 	push	#0x10
      008B05 4B 05            [ 1]  443 	push	#0x05
      008B07 4B 50            [ 1]  444 	push	#0x50
      008B09 CD 94 C4         [ 4]  445 	call	_GPIO_WriteLow
      008B0C 5B 03            [ 2]  446 	addw	sp, #3
                                    447 ;	driver/dht12.c: 358: I2CDataInOut(I2CDataOut);  
      008B0E 4B 00            [ 1]  448 	push	#0x00
      008B10 CD 89 24         [ 4]  449 	call	_I2CDataInOut
      008B13 84               [ 1]  450 	pop	a
                                    451 ;	driver/dht12.c: 362: return ReadByte;  
      008B14 7B 02            [ 1]  452 	ld	a, (0x02, sp)
                                    453 ;	driver/dht12.c: 364: }  
      008B16 5B 02            [ 2]  454 	addw	sp, #2
      008B18 81               [ 4]  455 	ret
                                    456 ;	driver/dht12.c: 383: bool I2C_Read(UCHAR wrDAdr,UCHAR wordAdr,UCHAR *pRdDat,UCHAR num)  
                                    457 ;	-----------------------------------------
                                    458 ;	 function I2C_Read
                                    459 ;	-----------------------------------------
      008B19                        460 _I2C_Read:
      008B19 52 09            [ 2]  461 	sub	sp, #9
                                    462 ;	driver/dht12.c: 393: rdDAdr = wrDAdr+1; //读器件地址为写地址加1  
      008B1B 7B 0C            [ 1]  463 	ld	a, (0x0c, sp)
      008B1D 4C               [ 1]  464 	inc	a
      008B1E 6B 08            [ 1]  465 	ld	(0x08, sp), a
                                    466 ;	driver/dht12.c: 395: I2C_Start();  /*启动I2C*/  
      008B20 CD 89 44         [ 4]  467 	call	_I2C_Start
                                    468 ;	driver/dht12.c: 399: I2CAck = SendByte(wrDAdr); /*发写器件地址*/  
      008B23 7B 0C            [ 1]  469 	ld	a, (0x0c, sp)
      008B25 88               [ 1]  470 	push	a
      008B26 CD 8A 10         [ 4]  471 	call	_SendByte
      008B29 5B 01            [ 2]  472 	addw	sp, #1
                                    473 ;	driver/dht12.c: 401: if(!I2CAck)  
      008B2B 6B 03            [ 1]  474 	ld	(0x03, sp), a
      008B2D 26 03            [ 1]  475 	jrne	00102$
                                    476 ;	driver/dht12.c: 405: return I2C_ERR;  
      008B2F 4F               [ 1]  477 	clr	a
      008B30 20 64            [ 2]  478 	jra	00113$
      008B32                        479 00102$:
                                    480 ;	driver/dht12.c: 409: I2CAck = SendByte(wordAdr); /*发寄存器地址*/  
      008B32 7B 0D            [ 1]  481 	ld	a, (0x0d, sp)
      008B34 88               [ 1]  482 	push	a
      008B35 CD 8A 10         [ 4]  483 	call	_SendByte
      008B38 5B 01            [ 2]  484 	addw	sp, #1
                                    485 ;	driver/dht12.c: 411: if(!I2CAck)  
      008B3A 4D               [ 1]  486 	tnz	a
      008B3B 26 03            [ 1]  487 	jrne	00104$
                                    488 ;	driver/dht12.c: 415: return I2C_ERR;  
      008B3D 4F               [ 1]  489 	clr	a
      008B3E 20 56            [ 2]  490 	jra	00113$
      008B40                        491 00104$:
                                    492 ;	driver/dht12.c: 419: I2C_Start();   /*重启I2C*/  
      008B40 CD 89 44         [ 4]  493 	call	_I2C_Start
                                    494 ;	driver/dht12.c: 421: I2CAck = SendByte(rdDAdr); /*发读器件地址*/  
      008B43 7B 08            [ 1]  495 	ld	a, (0x08, sp)
      008B45 88               [ 1]  496 	push	a
      008B46 CD 8A 10         [ 4]  497 	call	_SendByte
      008B49 5B 01            [ 2]  498 	addw	sp, #1
                                    499 ;	driver/dht12.c: 423: if(!I2CAck)  
      008B4B 4D               [ 1]  500 	tnz	a
      008B4C 26 03            [ 1]  501 	jrne	00119$
                                    502 ;	driver/dht12.c: 427: return I2C_ERR;  
      008B4E 4F               [ 1]  503 	clr	a
      008B4F 20 45            [ 2]  504 	jra	00113$
                                    505 ;	driver/dht12.c: 433: for(i=0;i<num-1;i++)  
      008B51                        506 00119$:
      008B51 0F 09            [ 1]  507 	clr	(0x09, sp)
      008B53                        508 00111$:
      008B53 5F               [ 1]  509 	clrw	x
      008B54 7B 10            [ 1]  510 	ld	a, (0x10, sp)
      008B56 97               [ 1]  511 	ld	xl, a
      008B57 5A               [ 2]  512 	decw	x
      008B58 1F 01            [ 2]  513 	ldw	(0x01, sp), x
      008B5A 7B 09            [ 1]  514 	ld	a, (0x09, sp)
      008B5C 6B 07            [ 1]  515 	ld	(0x07, sp), a
      008B5E 0F 06            [ 1]  516 	clr	(0x06, sp)
                                    517 ;	driver/dht12.c: 437: *(pRdDat+i) = RcvByte();  
      008B60 5F               [ 1]  518 	clrw	x
      008B61 7B 09            [ 1]  519 	ld	a, (0x09, sp)
      008B63 97               [ 1]  520 	ld	xl, a
      008B64 72 FB 0E         [ 2]  521 	addw	x, (0x0e, sp)
      008B67 1F 04            [ 2]  522 	ldw	(0x04, sp), x
                                    523 ;	driver/dht12.c: 433: for(i=0;i<num-1;i++)  
      008B69 1E 06            [ 2]  524 	ldw	x, (0x06, sp)
      008B6B 13 01            [ 2]  525 	cpw	x, (0x01, sp)
      008B6D 2E 0D            [ 1]  526 	jrsge	00107$
                                    527 ;	driver/dht12.c: 437: *(pRdDat+i) = RcvByte();  
      008B6F CD 8A B5         [ 4]  528 	call	_RcvByte
      008B72 1E 04            [ 2]  529 	ldw	x, (0x04, sp)
      008B74 F7               [ 1]  530 	ld	(x), a
                                    531 ;	driver/dht12.c: 439: I2C_Rack();  
      008B75 CD 89 AA         [ 4]  532 	call	_I2C_Rack
                                    533 ;	driver/dht12.c: 433: for(i=0;i<num-1;i++)  
      008B78 0C 09            [ 1]  534 	inc	(0x09, sp)
      008B7A 20 D7            [ 2]  535 	jra	00111$
      008B7C                        536 00107$:
                                    537 ;	driver/dht12.c: 443: if(i==num-1)  
      008B7C 1E 06            [ 2]  538 	ldw	x, (0x06, sp)
      008B7E 13 01            [ 2]  539 	cpw	x, (0x01, sp)
      008B80 26 0F            [ 1]  540 	jrne	00109$
                                    541 ;	driver/dht12.c: 447: *(pRdDat+i) = RcvByte();  
      008B82 CD 8A B5         [ 4]  542 	call	_RcvByte
      008B85 1E 04            [ 2]  543 	ldw	x, (0x04, sp)
      008B87 F7               [ 1]  544 	ld	(x), a
                                    545 ;	driver/dht12.c: 449: I2C_Rack();
      008B88 CD 89 AA         [ 4]  546 	call	_I2C_Rack
                                    547 ;	driver/dht12.c: 450: RcvByte();
      008B8B CD 8A B5         [ 4]  548 	call	_RcvByte
                                    549 ;	driver/dht12.c: 452: I2C_nAck();  
      008B8E CD 89 DD         [ 4]  550 	call	_I2C_nAck
      008B91                        551 00109$:
                                    552 ;	driver/dht12.c: 456: I2C_Stop();  
      008B91 CD 89 77         [ 4]  553 	call	_I2C_Stop
                                    554 ;	driver/dht12.c: 457: return I2C_CRR;  
      008B94 A6 01            [ 1]  555 	ld	a, #0x01
      008B96                        556 00113$:
                                    557 ;	driver/dht12.c: 459: }  
      008B96 5B 09            [ 2]  558 	addw	sp, #9
      008B98 81               [ 4]  559 	ret
                                    560 ;	driver/dht12.c: 541: u8 i2c_read(u8 dev_addr,u8 Addr)
                                    561 ;	-----------------------------------------
                                    562 ;	 function i2c_read
                                    563 ;	-----------------------------------------
      008B99                        564 _i2c_read:
      008B99 88               [ 1]  565 	push	a
                                    566 ;	driver/dht12.c: 544: if(I2C_Read(dev_addr,Addr,&temp,1))
      008B9A 96               [ 1]  567 	ldw	x, sp
      008B9B 5C               [ 1]  568 	incw	x
      008B9C 4B 01            [ 1]  569 	push	#0x01
      008B9E 89               [ 2]  570 	pushw	x
      008B9F 7B 08            [ 1]  571 	ld	a, (0x08, sp)
      008BA1 88               [ 1]  572 	push	a
      008BA2 7B 08            [ 1]  573 	ld	a, (0x08, sp)
      008BA4 88               [ 1]  574 	push	a
      008BA5 CD 8B 19         [ 4]  575 	call	_I2C_Read
      008BA8 5B 05            [ 2]  576 	addw	sp, #5
      008BAA 4D               [ 1]  577 	tnz	a
      008BAB 27 03            [ 1]  578 	jreq	00102$
                                    579 ;	driver/dht12.c: 545: return temp;
      008BAD 7B 01            [ 1]  580 	ld	a, (0x01, sp)
                                    581 ;	driver/dht12.c: 546: else return 0;
      008BAF 21                     582 	.byte 0x21
      008BB0                        583 00102$:
      008BB0 4F               [ 1]  584 	clr	a
      008BB1                        585 00104$:
                                    586 ;	driver/dht12.c: 547: }
      008BB1 5B 01            [ 2]  587 	addw	sp, #1
      008BB3 81               [ 4]  588 	ret
                                    589 ;	driver/dht12.c: 549: void ReadDHT12(DHT12_DATA *data) 
                                    590 ;	-----------------------------------------
                                    591 ;	 function ReadDHT12
                                    592 ;	-----------------------------------------
      008BB4                        593 _ReadDHT12:
      008BB4 52 02            [ 2]  594 	sub	sp, #2
                                    595 ;	driver/dht12.c: 551: i2c_init();
      008BB6 CD 88 EE         [ 4]  596 	call	_i2c_init
                                    597 ;	driver/dht12.c: 552: data->W=i2c_read(0xB8,0x00);
      008BB9 16 05            [ 2]  598 	ldw	y, (0x05, sp)
      008BBB 17 01            [ 2]  599 	ldw	(0x01, sp), y
      008BBD 93               [ 1]  600 	ldw	x, y
      008BBE 5C               [ 1]  601 	incw	x
      008BBF 5C               [ 1]  602 	incw	x
      008BC0 89               [ 2]  603 	pushw	x
      008BC1 4B 00            [ 1]  604 	push	#0x00
      008BC3 4B B8            [ 1]  605 	push	#0xb8
      008BC5 CD 8B 99         [ 4]  606 	call	_i2c_read
      008BC8 5B 02            [ 2]  607 	addw	sp, #2
      008BCA 85               [ 2]  608 	popw	x
      008BCB F7               [ 1]  609 	ld	(x), a
                                    610 ;	driver/dht12.c: 553: data->W1=i2c_read(0xB8,0x01);
      008BCC 1E 01            [ 2]  611 	ldw	x, (0x01, sp)
      008BCE 1C 00 03         [ 2]  612 	addw	x, #0x0003
      008BD1 89               [ 2]  613 	pushw	x
      008BD2 4B 01            [ 1]  614 	push	#0x01
      008BD4 4B B8            [ 1]  615 	push	#0xb8
      008BD6 CD 8B 99         [ 4]  616 	call	_i2c_read
      008BD9 5B 02            [ 2]  617 	addw	sp, #2
      008BDB 85               [ 2]  618 	popw	x
      008BDC F7               [ 1]  619 	ld	(x), a
                                    620 ;	driver/dht12.c: 554: data->T=i2c_read(0xB8,0x02);
      008BDD 4B 02            [ 1]  621 	push	#0x02
      008BDF 4B B8            [ 1]  622 	push	#0xb8
      008BE1 CD 8B 99         [ 4]  623 	call	_i2c_read
      008BE4 5B 02            [ 2]  624 	addw	sp, #2
      008BE6 1E 01            [ 2]  625 	ldw	x, (0x01, sp)
      008BE8 F7               [ 1]  626 	ld	(x), a
                                    627 ;	driver/dht12.c: 555: data->T1=i2c_read(0xB8,0x03);
      008BE9 1E 01            [ 2]  628 	ldw	x, (0x01, sp)
      008BEB 5C               [ 1]  629 	incw	x
      008BEC 89               [ 2]  630 	pushw	x
      008BED 4B 03            [ 1]  631 	push	#0x03
      008BEF 4B B8            [ 1]  632 	push	#0xb8
      008BF1 CD 8B 99         [ 4]  633 	call	_i2c_read
      008BF4 5B 02            [ 2]  634 	addw	sp, #2
      008BF6 85               [ 2]  635 	popw	x
      008BF7 F7               [ 1]  636 	ld	(x), a
                                    637 ;	driver/dht12.c: 556: data->sum=i2c_read(0xB8,0x04);
      008BF8 1E 01            [ 2]  638 	ldw	x, (0x01, sp)
      008BFA 1C 00 04         [ 2]  639 	addw	x, #0x0004
      008BFD 89               [ 2]  640 	pushw	x
      008BFE 4B 04            [ 1]  641 	push	#0x04
      008C00 4B B8            [ 1]  642 	push	#0xb8
      008C02 CD 8B 99         [ 4]  643 	call	_i2c_read
      008C05 5B 02            [ 2]  644 	addw	sp, #2
      008C07 85               [ 2]  645 	popw	x
      008C08 F7               [ 1]  646 	ld	(x), a
                                    647 ;	driver/dht12.c: 557: i2c_deinit();
      008C09 CD 89 09         [ 4]  648 	call	_i2c_deinit
                                    649 ;	driver/dht12.c: 558: }
      008C0C 5B 02            [ 2]  650 	addw	sp, #2
      008C0E 81               [ 4]  651 	ret
                                    652 	.area CODE
                                    653 	.area CONST
                                    654 	.area INITIALIZER
                                    655 	.area CABS (ABS)
