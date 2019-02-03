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
      008741                         68 _i2c_init:
                                     69 ;	driver/dht12.c: 41: GPIO_Init(GPIOB,GPIO_PIN_4,GPIO_MODE_OUT_OD_LOW_FAST);
      008741 4B A0            [ 1]   70 	push	#0xa0
      008743 4B 10            [ 1]   71 	push	#0x10
      008745 4B 05            [ 1]   72 	push	#0x05
      008747 4B 50            [ 1]   73 	push	#0x50
      008749 CD A5 60         [ 4]   74 	call	_GPIO_Init
      00874C 5B 04            [ 2]   75 	addw	sp, #4
                                     76 ;	driver/dht12.c: 42: GPIO_Init(GPIOB,GPIO_PIN_5,GPIO_MODE_OUT_OD_LOW_FAST);
      00874E 4B A0            [ 1]   77 	push	#0xa0
      008750 4B 20            [ 1]   78 	push	#0x20
      008752 4B 05            [ 1]   79 	push	#0x05
      008754 4B 50            [ 1]   80 	push	#0x50
      008756 CD A5 60         [ 4]   81 	call	_GPIO_Init
      008759 5B 04            [ 2]   82 	addw	sp, #4
                                     83 ;	driver/dht12.c: 43: }
      00875B 81               [ 4]   84 	ret
                                     85 ;	driver/dht12.c: 44: void i2c_deinit() 
                                     86 ;	-----------------------------------------
                                     87 ;	 function i2c_deinit
                                     88 ;	-----------------------------------------
      00875C                         89 _i2c_deinit:
                                     90 ;	driver/dht12.c: 47: GPIO_Init(GPIOB,GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
      00875C 4B 00            [ 1]   91 	push	#0x00
      00875E 4B 10            [ 1]   92 	push	#0x10
      008760 4B 05            [ 1]   93 	push	#0x05
      008762 4B 50            [ 1]   94 	push	#0x50
      008764 CD A5 60         [ 4]   95 	call	_GPIO_Init
      008767 5B 04            [ 2]   96 	addw	sp, #4
                                     97 ;	driver/dht12.c: 48: GPIO_Init(GPIOB,GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);
      008769 4B 00            [ 1]   98 	push	#0x00
      00876B 4B 20            [ 1]   99 	push	#0x20
      00876D 4B 05            [ 1]  100 	push	#0x05
      00876F 4B 50            [ 1]  101 	push	#0x50
      008771 CD A5 60         [ 4]  102 	call	_GPIO_Init
      008774 5B 04            [ 2]  103 	addw	sp, #4
                                    104 ;	driver/dht12.c: 49: }
      008776 81               [ 4]  105 	ret
                                    106 ;	driver/dht12.c: 64: void I2CDataInOut(bool InOut)  
                                    107 ;	-----------------------------------------
                                    108 ;	 function I2CDataInOut
                                    109 ;	-----------------------------------------
      008777                        110 _I2CDataInOut:
                                    111 ;	driver/dht12.c: 68: if(InOut)  
      008777 0D 03            [ 1]  112 	tnz	(0x03, sp)
      008779 27 0E            [ 1]  113 	jreq	00102$
                                    114 ;	driver/dht12.c: 72: GPIO_Init(I2C_PORT,I2CSDA,GPIO_MODE_IN_FL_NO_IT);  
      00877B 4B 00            [ 1]  115 	push	#0x00
      00877D 4B 20            [ 1]  116 	push	#0x20
      00877F 4B 05            [ 1]  117 	push	#0x05
      008781 4B 50            [ 1]  118 	push	#0x50
      008783 CD A5 60         [ 4]  119 	call	_GPIO_Init
      008786 5B 04            [ 2]  120 	addw	sp, #4
      008788 81               [ 4]  121 	ret
      008789                        122 00102$:
                                    123 ;	driver/dht12.c: 80: GPIO_Init(I2C_PORT,I2CSDA,GPIO_MODE_OUT_PP_LOW_FAST);  
      008789 4B E0            [ 1]  124 	push	#0xe0
      00878B 4B 20            [ 1]  125 	push	#0x20
      00878D 4B 05            [ 1]  126 	push	#0x05
      00878F 4B 50            [ 1]  127 	push	#0x50
      008791 CD A5 60         [ 4]  128 	call	_GPIO_Init
      008794 5B 04            [ 2]  129 	addw	sp, #4
                                    130 ;	driver/dht12.c: 84: }  
      008796 81               [ 4]  131 	ret
                                    132 ;	driver/dht12.c: 96: void I2C_Start (void)  
                                    133 ;	-----------------------------------------
                                    134 ;	 function I2C_Start
                                    135 ;	-----------------------------------------
      008797                        136 _I2C_Start:
                                    137 ;	driver/dht12.c: 99: I2CDataInOut(I2CDataOut);
      008797 4B 00            [ 1]  138 	push	#0x00
      008799 CD 87 77         [ 4]  139 	call	_I2CDataInOut
      00879C 84               [ 1]  140 	pop	a
                                    141 ;	driver/dht12.c: 101: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
      00879D 4B 20            [ 1]  142 	push	#0x20
      00879F 4B 05            [ 1]  143 	push	#0x05
      0087A1 4B 50            [ 1]  144 	push	#0x50
      0087A3 CD A5 DB         [ 4]  145 	call	_GPIO_WriteHigh
      0087A6 5B 03            [ 2]  146 	addw	sp, #3
                                    147 ;	driver/dht12.c: 105: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      0087A8 4B 10            [ 1]  148 	push	#0x10
      0087AA 4B 05            [ 1]  149 	push	#0x05
      0087AC 4B 50            [ 1]  150 	push	#0x50
      0087AE CD A5 DB         [ 4]  151 	call	_GPIO_WriteHigh
      0087B1 5B 03            [ 2]  152 	addw	sp, #3
                                    153 ;	driver/dht12.c: 109: GPIO_WriteLow(I2C_PORT, I2CSDA);  
      0087B3 4B 20            [ 1]  154 	push	#0x20
      0087B5 4B 05            [ 1]  155 	push	#0x05
      0087B7 4B 50            [ 1]  156 	push	#0x50
      0087B9 CD A5 E2         [ 4]  157 	call	_GPIO_WriteLow
      0087BC 5B 03            [ 2]  158 	addw	sp, #3
                                    159 ;	driver/dht12.c: 112: GPIO_WriteLow(I2C_PORT, I2CSCL);    
      0087BE 4B 10            [ 1]  160 	push	#0x10
      0087C0 4B 05            [ 1]  161 	push	#0x05
      0087C2 4B 50            [ 1]  162 	push	#0x50
      0087C4 CD A5 E2         [ 4]  163 	call	_GPIO_WriteLow
      0087C7 5B 03            [ 2]  164 	addw	sp, #3
                                    165 ;	driver/dht12.c: 113: }  
      0087C9 81               [ 4]  166 	ret
                                    167 ;	driver/dht12.c: 123: void I2C_Stop (void)  
                                    168 ;	-----------------------------------------
                                    169 ;	 function I2C_Stop
                                    170 ;	-----------------------------------------
      0087CA                        171 _I2C_Stop:
                                    172 ;	driver/dht12.c: 126: I2CDataInOut(I2CDataOut);
      0087CA 4B 00            [ 1]  173 	push	#0x00
      0087CC CD 87 77         [ 4]  174 	call	_I2CDataInOut
      0087CF 84               [ 1]  175 	pop	a
                                    176 ;	driver/dht12.c: 127: GPIO_WriteLow(I2C_PORT, I2CSCL); 
      0087D0 4B 10            [ 1]  177 	push	#0x10
      0087D2 4B 05            [ 1]  178 	push	#0x05
      0087D4 4B 50            [ 1]  179 	push	#0x50
      0087D6 CD A5 E2         [ 4]  180 	call	_GPIO_WriteLow
      0087D9 5B 03            [ 2]  181 	addw	sp, #3
                                    182 ;	driver/dht12.c: 129: GPIO_WriteLow(I2C_PORT, I2CSDA);  
      0087DB 4B 20            [ 1]  183 	push	#0x20
      0087DD 4B 05            [ 1]  184 	push	#0x05
      0087DF 4B 50            [ 1]  185 	push	#0x50
      0087E1 CD A5 E2         [ 4]  186 	call	_GPIO_WriteLow
      0087E4 5B 03            [ 2]  187 	addw	sp, #3
                                    188 ;	driver/dht12.c: 133: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      0087E6 4B 10            [ 1]  189 	push	#0x10
      0087E8 4B 05            [ 1]  190 	push	#0x05
      0087EA 4B 50            [ 1]  191 	push	#0x50
      0087EC CD A5 DB         [ 4]  192 	call	_GPIO_WriteHigh
      0087EF 5B 03            [ 2]  193 	addw	sp, #3
                                    194 ;	driver/dht12.c: 137: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
      0087F1 4B 20            [ 1]  195 	push	#0x20
      0087F3 4B 05            [ 1]  196 	push	#0x05
      0087F5 4B 50            [ 1]  197 	push	#0x50
      0087F7 CD A5 DB         [ 4]  198 	call	_GPIO_WriteHigh
      0087FA 5B 03            [ 2]  199 	addw	sp, #3
                                    200 ;	driver/dht12.c: 139: }  
      0087FC 81               [ 4]  201 	ret
                                    202 ;	driver/dht12.c: 153: void I2C_Rack(void)  
                                    203 ;	-----------------------------------------
                                    204 ;	 function I2C_Rack
                                    205 ;	-----------------------------------------
      0087FD                        206 _I2C_Rack:
                                    207 ;	driver/dht12.c: 156: I2CDataInOut(I2CDataOut);
      0087FD 4B 00            [ 1]  208 	push	#0x00
      0087FF CD 87 77         [ 4]  209 	call	_I2CDataInOut
      008802 84               [ 1]  210 	pop	a
                                    211 ;	driver/dht12.c: 158: GPIO_WriteLow(I2C_PORT, I2CSDA);  
      008803 4B 20            [ 1]  212 	push	#0x20
      008805 4B 05            [ 1]  213 	push	#0x05
      008807 4B 50            [ 1]  214 	push	#0x50
      008809 CD A5 E2         [ 4]  215 	call	_GPIO_WriteLow
      00880C 5B 03            [ 2]  216 	addw	sp, #3
                                    217 ;	driver/dht12.c: 161: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      00880E 4B 10            [ 1]  218 	push	#0x10
      008810 4B 05            [ 1]  219 	push	#0x05
      008812 4B 50            [ 1]  220 	push	#0x50
      008814 CD A5 E2         [ 4]  221 	call	_GPIO_WriteLow
      008817 5B 03            [ 2]  222 	addw	sp, #3
                                    223 ;	driver/dht12.c: 163: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      008819 4B 10            [ 1]  224 	push	#0x10
      00881B 4B 05            [ 1]  225 	push	#0x05
      00881D 4B 50            [ 1]  226 	push	#0x50
      00881F CD A5 DB         [ 4]  227 	call	_GPIO_WriteHigh
      008822 5B 03            [ 2]  228 	addw	sp, #3
                                    229 ;	driver/dht12.c: 167: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008824 4B 10            [ 1]  230 	push	#0x10
      008826 4B 05            [ 1]  231 	push	#0x05
      008828 4B 50            [ 1]  232 	push	#0x50
      00882A CD A5 E2         [ 4]  233 	call	_GPIO_WriteLow
      00882D 5B 03            [ 2]  234 	addw	sp, #3
                                    235 ;	driver/dht12.c: 171: }  
      00882F 81               [ 4]  236 	ret
                                    237 ;	driver/dht12.c: 186: void I2C_nAck (void)  
                                    238 ;	-----------------------------------------
                                    239 ;	 function I2C_nAck
                                    240 ;	-----------------------------------------
      008830                        241 _I2C_nAck:
                                    242 ;	driver/dht12.c: 189: I2CDataInOut(I2CDataOut);
      008830 4B 00            [ 1]  243 	push	#0x00
      008832 CD 87 77         [ 4]  244 	call	_I2CDataInOut
      008835 84               [ 1]  245 	pop	a
                                    246 ;	driver/dht12.c: 192: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
      008836 4B 20            [ 1]  247 	push	#0x20
      008838 4B 05            [ 1]  248 	push	#0x05
      00883A 4B 50            [ 1]  249 	push	#0x50
      00883C CD A5 DB         [ 4]  250 	call	_GPIO_WriteHigh
      00883F 5B 03            [ 2]  251 	addw	sp, #3
                                    252 ;	driver/dht12.c: 196: GPIO_WriteLow(I2C_PORT, I2CSCL); 
      008841 4B 10            [ 1]  253 	push	#0x10
      008843 4B 05            [ 1]  254 	push	#0x05
      008845 4B 50            [ 1]  255 	push	#0x50
      008847 CD A5 E2         [ 4]  256 	call	_GPIO_WriteLow
      00884A 5B 03            [ 2]  257 	addw	sp, #3
                                    258 ;	driver/dht12.c: 198: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      00884C 4B 10            [ 1]  259 	push	#0x10
      00884E 4B 05            [ 1]  260 	push	#0x05
      008850 4B 50            [ 1]  261 	push	#0x50
      008852 CD A5 DB         [ 4]  262 	call	_GPIO_WriteHigh
      008855 5B 03            [ 2]  263 	addw	sp, #3
                                    264 ;	driver/dht12.c: 202: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008857 4B 10            [ 1]  265 	push	#0x10
      008859 4B 05            [ 1]  266 	push	#0x05
      00885B 4B 50            [ 1]  267 	push	#0x50
      00885D CD A5 E2         [ 4]  268 	call	_GPIO_WriteLow
      008860 5B 03            [ 2]  269 	addw	sp, #3
                                    270 ;	driver/dht12.c: 206: }  
      008862 81               [ 4]  271 	ret
                                    272 ;	driver/dht12.c: 216: bool SendByte(UCHAR I2cData)  
                                    273 ;	-----------------------------------------
                                    274 ;	 function SendByte
                                    275 ;	-----------------------------------------
      008863                        276 _SendByte:
      008863 52 03            [ 2]  277 	sub	sp, #3
                                    278 ;	driver/dht12.c: 225: for(i=0; i<8; i++)  
      008865 0F 03            [ 1]  279 	clr	(0x03, sp)
      008867                        280 00112$:
                                    281 ;	driver/dht12.c: 229: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008867 4B 10            [ 1]  282 	push	#0x10
      008869 4B 05            [ 1]  283 	push	#0x05
      00886B 4B 50            [ 1]  284 	push	#0x50
      00886D CD A5 E2         [ 4]  285 	call	_GPIO_WriteLow
      008870 5B 03            [ 2]  286 	addw	sp, #3
                                    287 ;	driver/dht12.c: 233: if(I2cData & 0x80)  
      008872 7B 06            [ 1]  288 	ld	a, (0x06, sp)
      008874 2A 0D            [ 1]  289 	jrpl	00102$
                                    290 ;	driver/dht12.c: 235: {GPIO_WriteHigh(I2C_PORT, I2CSDA);}  
      008876 4B 20            [ 1]  291 	push	#0x20
      008878 4B 05            [ 1]  292 	push	#0x05
      00887A 4B 50            [ 1]  293 	push	#0x50
      00887C CD A5 DB         [ 4]  294 	call	_GPIO_WriteHigh
      00887F 5B 03            [ 2]  295 	addw	sp, #3
      008881 20 0B            [ 2]  296 	jra	00103$
      008883                        297 00102$:
                                    298 ;	driver/dht12.c: 239: {GPIO_WriteLow(I2C_PORT, I2CSDA);}  
      008883 4B 20            [ 1]  299 	push	#0x20
      008885 4B 05            [ 1]  300 	push	#0x05
      008887 4B 50            [ 1]  301 	push	#0x50
      008889 CD A5 E2         [ 4]  302 	call	_GPIO_WriteLow
      00888C 5B 03            [ 2]  303 	addw	sp, #3
      00888E                        304 00103$:
                                    305 ;	driver/dht12.c: 241: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      00888E 4B 10            [ 1]  306 	push	#0x10
      008890 4B 05            [ 1]  307 	push	#0x05
      008892 4B 50            [ 1]  308 	push	#0x50
      008894 CD A5 DB         [ 4]  309 	call	_GPIO_WriteHigh
      008897 5B 03            [ 2]  310 	addw	sp, #3
                                    311 ;	driver/dht12.c: 245: I2cData <<= 1;  
      008899 08 06            [ 1]  312 	sll	(0x06, sp)
                                    313 ;	driver/dht12.c: 225: for(i=0; i<8; i++)  
      00889B 0C 03            [ 1]  314 	inc	(0x03, sp)
      00889D 7B 03            [ 1]  315 	ld	a, (0x03, sp)
      00889F A1 08            [ 1]  316 	cp	a, #0x08
      0088A1 25 C4            [ 1]  317 	jrc	00112$
                                    318 ;	driver/dht12.c: 249: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      0088A3 4B 10            [ 1]  319 	push	#0x10
      0088A5 4B 05            [ 1]  320 	push	#0x05
      0088A7 4B 50            [ 1]  321 	push	#0x50
      0088A9 CD A5 E2         [ 4]  322 	call	_GPIO_WriteLow
      0088AC 5B 03            [ 2]  323 	addw	sp, #3
                                    324 ;	driver/dht12.c: 251: GPIO_WriteHigh(I2C_PORT, I2CSDA);//发送完一字节，接收应答  
      0088AE 4B 20            [ 1]  325 	push	#0x20
      0088B0 4B 05            [ 1]  326 	push	#0x05
      0088B2 4B 50            [ 1]  327 	push	#0x50
      0088B4 CD A5 DB         [ 4]  328 	call	_GPIO_WriteHigh
      0088B7 5B 03            [ 2]  329 	addw	sp, #3
                                    330 ;	driver/dht12.c: 255: I2CDataInOut(I2CDataIn);  
      0088B9 4B 01            [ 1]  331 	push	#0x01
      0088BB CD 87 77         [ 4]  332 	call	_I2CDataInOut
      0088BE 84               [ 1]  333 	pop	a
                                    334 ;	driver/dht12.c: 258: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      0088BF 4B 10            [ 1]  335 	push	#0x10
      0088C1 4B 05            [ 1]  336 	push	#0x05
      0088C3 4B 50            [ 1]  337 	push	#0x50
      0088C5 CD A5 DB         [ 4]  338 	call	_GPIO_WriteHigh
      0088C8 5B 03            [ 2]  339 	addw	sp, #3
                                    340 ;	driver/dht12.c: 280: while(GPIO_ReadInputPin(I2C_PORT,I2CSDA) &&count--)
      0088CA AE 03 E8         [ 2]  341 	ldw	x, #0x03e8
      0088CD 1F 01            [ 2]  342 	ldw	(0x01, sp), x
      0088CF                        343 00106$:
      0088CF 4B 20            [ 1]  344 	push	#0x20
      0088D1 4B 05            [ 1]  345 	push	#0x05
      0088D3 4B 50            [ 1]  346 	push	#0x50
      0088D5 CD A6 00         [ 4]  347 	call	_GPIO_ReadInputPin
      0088D8 5B 03            [ 2]  348 	addw	sp, #3
      0088DA 4D               [ 1]  349 	tnz	a
      0088DB 27 0F            [ 1]  350 	jreq	00108$
      0088DD 1E 01            [ 2]  351 	ldw	x, (0x01, sp)
      0088DF 16 01            [ 2]  352 	ldw	y, (0x01, sp)
      0088E1 90 5A            [ 2]  353 	decw	y
      0088E3 17 01            [ 2]  354 	ldw	(0x01, sp), y
      0088E5 5D               [ 2]  355 	tnzw	x
      0088E6 27 04            [ 1]  356 	jreq	00108$
                                    357 ;	driver/dht12.c: 281: {nop();nop();};
      0088E8 9D               [ 1]  358 	nop
      0088E9 9D               [ 1]  359 	nop
      0088EA 20 E3            [ 2]  360 	jra	00106$
      0088EC                        361 00108$:
                                    362 ;	driver/dht12.c: 282: GPIO_WriteLow(I2C_PORT, I2CSCL);
      0088EC 4B 10            [ 1]  363 	push	#0x10
      0088EE 4B 05            [ 1]  364 	push	#0x05
      0088F0 4B 50            [ 1]  365 	push	#0x50
      0088F2 CD A5 E2         [ 4]  366 	call	_GPIO_WriteLow
      0088F5 5B 03            [ 2]  367 	addw	sp, #3
                                    368 ;	driver/dht12.c: 287: I2CDataInOut(I2CDataOut);  
      0088F7 4B 00            [ 1]  369 	push	#0x00
      0088F9 CD 87 77         [ 4]  370 	call	_I2CDataInOut
      0088FC 84               [ 1]  371 	pop	a
                                    372 ;	driver/dht12.c: 288: if(count)
      0088FD 1E 01            [ 2]  373 	ldw	x, (0x01, sp)
      0088FF 27 03            [ 1]  374 	jreq	00110$
                                    375 ;	driver/dht12.c: 291: I2CStatus = I2C_CRR;  
      008901 A6 01            [ 1]  376 	ld	a, #0x01
                                    377 ;	driver/dht12.c: 299: I2CStatus = I2C_ERR;  
      008903 21                     378 	.byte 0x21
      008904                        379 00110$:
      008904 4F               [ 1]  380 	clr	a
      008905                        381 00111$:
                                    382 ;	driver/dht12.c: 302: return I2CStatus;  
                                    383 ;	driver/dht12.c: 304: }  
      008905 5B 03            [ 2]  384 	addw	sp, #3
      008907 81               [ 4]  385 	ret
                                    386 ;	driver/dht12.c: 319: UCHAR RcvByte(void)  
                                    387 ;	-----------------------------------------
                                    388 ;	 function RcvByte
                                    389 ;	-----------------------------------------
      008908                        390 _RcvByte:
      008908 52 02            [ 2]  391 	sub	sp, #2
                                    392 ;	driver/dht12.c: 325: UCHAR ReadByte=0;  
      00890A 0F 01            [ 1]  393 	clr	(0x01, sp)
                                    394 ;	driver/dht12.c: 327: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
      00890C 4B 20            [ 1]  395 	push	#0x20
      00890E 4B 05            [ 1]  396 	push	#0x05
      008910 4B 50            [ 1]  397 	push	#0x50
      008912 CD A5 DB         [ 4]  398 	call	_GPIO_WriteHigh
      008915 5B 03            [ 2]  399 	addw	sp, #3
                                    400 ;	driver/dht12.c: 330: I2CDataInOut(I2CDataIn);  
      008917 4B 01            [ 1]  401 	push	#0x01
      008919 CD 87 77         [ 4]  402 	call	_I2CDataInOut
      00891C 84               [ 1]  403 	pop	a
                                    404 ;	driver/dht12.c: 334: for(i=0; i<8; i++)  
      00891D 0F 02            [ 1]  405 	clr	(0x02, sp)
      00891F                        406 00104$:
                                    407 ;	driver/dht12.c: 338: ReadByte <<= 1;  
      00891F 7B 01            [ 1]  408 	ld	a, (0x01, sp)
      008921 48               [ 1]  409 	sll	a
      008922 6B 01            [ 1]  410 	ld	(0x01, sp), a
                                    411 ;	driver/dht12.c: 340: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008924 4B 10            [ 1]  412 	push	#0x10
      008926 4B 05            [ 1]  413 	push	#0x05
      008928 4B 50            [ 1]  414 	push	#0x50
      00892A CD A5 E2         [ 4]  415 	call	_GPIO_WriteLow
      00892D 5B 03            [ 2]  416 	addw	sp, #3
                                    417 ;	driver/dht12.c: 344: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
      00892F 4B 10            [ 1]  418 	push	#0x10
      008931 4B 05            [ 1]  419 	push	#0x05
      008933 4B 50            [ 1]  420 	push	#0x50
      008935 CD A5 DB         [ 4]  421 	call	_GPIO_WriteHigh
      008938 5B 03            [ 2]  422 	addw	sp, #3
                                    423 ;	driver/dht12.c: 349: if(GPIO_ReadInputPin(I2C_PORT,I2CSDA) !=RESET)  
      00893A 4B 20            [ 1]  424 	push	#0x20
      00893C 4B 05            [ 1]  425 	push	#0x05
      00893E 4B 50            [ 1]  426 	push	#0x50
      008940 CD A6 00         [ 4]  427 	call	_GPIO_ReadInputPin
      008943 5B 03            [ 2]  428 	addw	sp, #3
      008945 4D               [ 1]  429 	tnz	a
      008946 27 06            [ 1]  430 	jreq	00105$
                                    431 ;	driver/dht12.c: 351: {ReadByte |= 0x01;}  
      008948 7B 01            [ 1]  432 	ld	a, (0x01, sp)
      00894A AA 01            [ 1]  433 	or	a, #0x01
      00894C 6B 01            [ 1]  434 	ld	(0x01, sp), a
      00894E                        435 00105$:
                                    436 ;	driver/dht12.c: 334: for(i=0; i<8; i++)  
      00894E 0C 02            [ 1]  437 	inc	(0x02, sp)
      008950 7B 02            [ 1]  438 	ld	a, (0x02, sp)
      008952 A1 08            [ 1]  439 	cp	a, #0x08
      008954 25 C9            [ 1]  440 	jrc	00104$
                                    441 ;	driver/dht12.c: 357: GPIO_WriteLow(I2C_PORT, I2CSCL);  
      008956 4B 10            [ 1]  442 	push	#0x10
      008958 4B 05            [ 1]  443 	push	#0x05
      00895A 4B 50            [ 1]  444 	push	#0x50
      00895C CD A5 E2         [ 4]  445 	call	_GPIO_WriteLow
      00895F 5B 03            [ 2]  446 	addw	sp, #3
                                    447 ;	driver/dht12.c: 359: I2CDataInOut(I2CDataOut);  
      008961 4B 00            [ 1]  448 	push	#0x00
      008963 CD 87 77         [ 4]  449 	call	_I2CDataInOut
      008966 84               [ 1]  450 	pop	a
                                    451 ;	driver/dht12.c: 363: return ReadByte;  
      008967 7B 01            [ 1]  452 	ld	a, (0x01, sp)
                                    453 ;	driver/dht12.c: 365: }  
      008969 5B 02            [ 2]  454 	addw	sp, #2
      00896B 81               [ 4]  455 	ret
                                    456 ;	driver/dht12.c: 384: bool I2C_Read(UCHAR wrDAdr,UCHAR wordAdr,UCHAR *pRdDat,UCHAR num)  
                                    457 ;	-----------------------------------------
                                    458 ;	 function I2C_Read
                                    459 ;	-----------------------------------------
      00896C                        460 _I2C_Read:
      00896C 52 09            [ 2]  461 	sub	sp, #9
                                    462 ;	driver/dht12.c: 388: disableInterrupts();
      00896E 9B               [ 1]  463 	sim
                                    464 ;	driver/dht12.c: 395: rdDAdr = wrDAdr+1; //读器件地址为写地址加1  
      00896F 7B 0C            [ 1]  465 	ld	a, (0x0c, sp)
      008971 4C               [ 1]  466 	inc	a
      008972 6B 08            [ 1]  467 	ld	(0x08, sp), a
                                    468 ;	driver/dht12.c: 397: I2C_Start();  /*启动I2C*/  
      008974 CD 87 97         [ 4]  469 	call	_I2C_Start
                                    470 ;	driver/dht12.c: 401: I2CAck = SendByte(wrDAdr); /*发写器件地址*/  
      008977 7B 0C            [ 1]  471 	ld	a, (0x0c, sp)
      008979 88               [ 1]  472 	push	a
      00897A CD 88 63         [ 4]  473 	call	_SendByte
      00897D 5B 01            [ 2]  474 	addw	sp, #1
                                    475 ;	driver/dht12.c: 403: if(!I2CAck)  
      00897F 6B 03            [ 1]  476 	ld	(0x03, sp), a
      008981 26 03            [ 1]  477 	jrne	00102$
                                    478 ;	driver/dht12.c: 407: return I2C_ERR;  
      008983 4F               [ 1]  479 	clr	a
      008984 20 65            [ 2]  480 	jra	00113$
      008986                        481 00102$:
                                    482 ;	driver/dht12.c: 411: I2CAck = SendByte(wordAdr); /*发寄存器地址*/  
      008986 7B 0D            [ 1]  483 	ld	a, (0x0d, sp)
      008988 88               [ 1]  484 	push	a
      008989 CD 88 63         [ 4]  485 	call	_SendByte
      00898C 5B 01            [ 2]  486 	addw	sp, #1
                                    487 ;	driver/dht12.c: 413: if(!I2CAck)  
      00898E 4D               [ 1]  488 	tnz	a
      00898F 26 03            [ 1]  489 	jrne	00104$
                                    490 ;	driver/dht12.c: 417: return I2C_ERR;  
      008991 4F               [ 1]  491 	clr	a
      008992 20 57            [ 2]  492 	jra	00113$
      008994                        493 00104$:
                                    494 ;	driver/dht12.c: 421: I2C_Start();   /*重启I2C*/  
      008994 CD 87 97         [ 4]  495 	call	_I2C_Start
                                    496 ;	driver/dht12.c: 423: I2CAck = SendByte(rdDAdr); /*发读器件地址*/  
      008997 7B 08            [ 1]  497 	ld	a, (0x08, sp)
      008999 88               [ 1]  498 	push	a
      00899A CD 88 63         [ 4]  499 	call	_SendByte
      00899D 5B 01            [ 2]  500 	addw	sp, #1
                                    501 ;	driver/dht12.c: 425: if(!I2CAck)  
      00899F 4D               [ 1]  502 	tnz	a
      0089A0 26 03            [ 1]  503 	jrne	00119$
                                    504 ;	driver/dht12.c: 429: return I2C_ERR;  
      0089A2 4F               [ 1]  505 	clr	a
      0089A3 20 46            [ 2]  506 	jra	00113$
                                    507 ;	driver/dht12.c: 435: for(i=0;i<num-1;i++)  
      0089A5                        508 00119$:
      0089A5 0F 09            [ 1]  509 	clr	(0x09, sp)
      0089A7                        510 00111$:
      0089A7 5F               [ 1]  511 	clrw	x
      0089A8 7B 10            [ 1]  512 	ld	a, (0x10, sp)
      0089AA 97               [ 1]  513 	ld	xl, a
      0089AB 5A               [ 2]  514 	decw	x
      0089AC 1F 06            [ 2]  515 	ldw	(0x06, sp), x
      0089AE 7B 09            [ 1]  516 	ld	a, (0x09, sp)
      0089B0 6B 02            [ 1]  517 	ld	(0x02, sp), a
      0089B2 0F 01            [ 1]  518 	clr	(0x01, sp)
                                    519 ;	driver/dht12.c: 439: *(pRdDat+i) = RcvByte();  
      0089B4 5F               [ 1]  520 	clrw	x
      0089B5 7B 09            [ 1]  521 	ld	a, (0x09, sp)
      0089B7 97               [ 1]  522 	ld	xl, a
      0089B8 72 FB 0E         [ 2]  523 	addw	x, (0x0e, sp)
      0089BB 1F 04            [ 2]  524 	ldw	(0x04, sp), x
                                    525 ;	driver/dht12.c: 435: for(i=0;i<num-1;i++)  
      0089BD 1E 01            [ 2]  526 	ldw	x, (0x01, sp)
      0089BF 13 06            [ 2]  527 	cpw	x, (0x06, sp)
      0089C1 2E 0D            [ 1]  528 	jrsge	00107$
                                    529 ;	driver/dht12.c: 439: *(pRdDat+i) = RcvByte();  
      0089C3 CD 89 08         [ 4]  530 	call	_RcvByte
      0089C6 1E 04            [ 2]  531 	ldw	x, (0x04, sp)
      0089C8 F7               [ 1]  532 	ld	(x), a
                                    533 ;	driver/dht12.c: 441: I2C_Rack();  
      0089C9 CD 87 FD         [ 4]  534 	call	_I2C_Rack
                                    535 ;	driver/dht12.c: 435: for(i=0;i<num-1;i++)  
      0089CC 0C 09            [ 1]  536 	inc	(0x09, sp)
      0089CE 20 D7            [ 2]  537 	jra	00111$
      0089D0                        538 00107$:
                                    539 ;	driver/dht12.c: 445: if(i==num-1)  
      0089D0 1E 01            [ 2]  540 	ldw	x, (0x01, sp)
      0089D2 13 06            [ 2]  541 	cpw	x, (0x06, sp)
      0089D4 26 0F            [ 1]  542 	jrne	00109$
                                    543 ;	driver/dht12.c: 449: *(pRdDat+i) = RcvByte();  
      0089D6 CD 89 08         [ 4]  544 	call	_RcvByte
      0089D9 1E 04            [ 2]  545 	ldw	x, (0x04, sp)
      0089DB F7               [ 1]  546 	ld	(x), a
                                    547 ;	driver/dht12.c: 451: I2C_Rack();
      0089DC CD 87 FD         [ 4]  548 	call	_I2C_Rack
                                    549 ;	driver/dht12.c: 452: RcvByte();
      0089DF CD 89 08         [ 4]  550 	call	_RcvByte
                                    551 ;	driver/dht12.c: 454: I2C_nAck();  
      0089E2 CD 88 30         [ 4]  552 	call	_I2C_nAck
      0089E5                        553 00109$:
                                    554 ;	driver/dht12.c: 458: I2C_Stop();  
      0089E5 CD 87 CA         [ 4]  555 	call	_I2C_Stop
                                    556 ;	driver/dht12.c: 460: enableInterrupts();
      0089E8 9A               [ 1]  557 	rim
                                    558 ;	driver/dht12.c: 461: return I2C_CRR;  
      0089E9 A6 01            [ 1]  559 	ld	a, #0x01
      0089EB                        560 00113$:
                                    561 ;	driver/dht12.c: 463: }  
      0089EB 5B 09            [ 2]  562 	addw	sp, #9
      0089ED 81               [ 4]  563 	ret
                                    564 ;	driver/dht12.c: 545: u8 i2c_read(u8 dev_addr,u8 Addr)
                                    565 ;	-----------------------------------------
                                    566 ;	 function i2c_read
                                    567 ;	-----------------------------------------
      0089EE                        568 _i2c_read:
      0089EE 88               [ 1]  569 	push	a
                                    570 ;	driver/dht12.c: 548: if(I2C_Read(dev_addr,Addr,&temp,1))
      0089EF 96               [ 1]  571 	ldw	x, sp
      0089F0 5C               [ 1]  572 	incw	x
      0089F1 4B 01            [ 1]  573 	push	#0x01
      0089F3 89               [ 2]  574 	pushw	x
      0089F4 7B 08            [ 1]  575 	ld	a, (0x08, sp)
      0089F6 88               [ 1]  576 	push	a
      0089F7 7B 08            [ 1]  577 	ld	a, (0x08, sp)
      0089F9 88               [ 1]  578 	push	a
      0089FA CD 89 6C         [ 4]  579 	call	_I2C_Read
      0089FD 5B 05            [ 2]  580 	addw	sp, #5
      0089FF 4D               [ 1]  581 	tnz	a
      008A00 27 03            [ 1]  582 	jreq	00102$
                                    583 ;	driver/dht12.c: 549: return temp;
      008A02 7B 01            [ 1]  584 	ld	a, (0x01, sp)
                                    585 ;	driver/dht12.c: 550: else return 0;
      008A04 21                     586 	.byte 0x21
      008A05                        587 00102$:
      008A05 4F               [ 1]  588 	clr	a
      008A06                        589 00104$:
                                    590 ;	driver/dht12.c: 551: }
      008A06 5B 01            [ 2]  591 	addw	sp, #1
      008A08 81               [ 4]  592 	ret
                                    593 ;	driver/dht12.c: 553: void ReadDHT12(DHT12_DATA *data) 
                                    594 ;	-----------------------------------------
                                    595 ;	 function ReadDHT12
                                    596 ;	-----------------------------------------
      008A09                        597 _ReadDHT12:
      008A09 52 02            [ 2]  598 	sub	sp, #2
                                    599 ;	driver/dht12.c: 555: i2c_init();
      008A0B CD 87 41         [ 4]  600 	call	_i2c_init
                                    601 ;	driver/dht12.c: 556: data->W=i2c_read(0xB8,0x00);
      008A0E 16 05            [ 2]  602 	ldw	y, (0x05, sp)
      008A10 17 01            [ 2]  603 	ldw	(0x01, sp), y
      008A12 93               [ 1]  604 	ldw	x, y
      008A13 5C               [ 1]  605 	incw	x
      008A14 5C               [ 1]  606 	incw	x
      008A15 89               [ 2]  607 	pushw	x
      008A16 4B 00            [ 1]  608 	push	#0x00
      008A18 4B B8            [ 1]  609 	push	#0xb8
      008A1A CD 89 EE         [ 4]  610 	call	_i2c_read
      008A1D 5B 02            [ 2]  611 	addw	sp, #2
      008A1F 85               [ 2]  612 	popw	x
      008A20 F7               [ 1]  613 	ld	(x), a
                                    614 ;	driver/dht12.c: 557: data->W1=i2c_read(0xB8,0x01);
      008A21 1E 01            [ 2]  615 	ldw	x, (0x01, sp)
      008A23 1C 00 03         [ 2]  616 	addw	x, #0x0003
      008A26 89               [ 2]  617 	pushw	x
      008A27 4B 01            [ 1]  618 	push	#0x01
      008A29 4B B8            [ 1]  619 	push	#0xb8
      008A2B CD 89 EE         [ 4]  620 	call	_i2c_read
      008A2E 5B 02            [ 2]  621 	addw	sp, #2
      008A30 85               [ 2]  622 	popw	x
      008A31 F7               [ 1]  623 	ld	(x), a
                                    624 ;	driver/dht12.c: 558: data->T=i2c_read(0xB8,0x02);
      008A32 4B 02            [ 1]  625 	push	#0x02
      008A34 4B B8            [ 1]  626 	push	#0xb8
      008A36 CD 89 EE         [ 4]  627 	call	_i2c_read
      008A39 5B 02            [ 2]  628 	addw	sp, #2
      008A3B 1E 01            [ 2]  629 	ldw	x, (0x01, sp)
      008A3D F7               [ 1]  630 	ld	(x), a
                                    631 ;	driver/dht12.c: 559: data->T1=i2c_read(0xB8,0x03);
      008A3E 1E 01            [ 2]  632 	ldw	x, (0x01, sp)
      008A40 5C               [ 1]  633 	incw	x
      008A41 89               [ 2]  634 	pushw	x
      008A42 4B 03            [ 1]  635 	push	#0x03
      008A44 4B B8            [ 1]  636 	push	#0xb8
      008A46 CD 89 EE         [ 4]  637 	call	_i2c_read
      008A49 5B 02            [ 2]  638 	addw	sp, #2
      008A4B 85               [ 2]  639 	popw	x
      008A4C F7               [ 1]  640 	ld	(x), a
                                    641 ;	driver/dht12.c: 560: data->sum=i2c_read(0xB8,0x04);
      008A4D 1E 01            [ 2]  642 	ldw	x, (0x01, sp)
      008A4F 1C 00 04         [ 2]  643 	addw	x, #0x0004
      008A52 89               [ 2]  644 	pushw	x
      008A53 4B 04            [ 1]  645 	push	#0x04
      008A55 4B B8            [ 1]  646 	push	#0xb8
      008A57 CD 89 EE         [ 4]  647 	call	_i2c_read
      008A5A 5B 02            [ 2]  648 	addw	sp, #2
      008A5C 85               [ 2]  649 	popw	x
      008A5D F7               [ 1]  650 	ld	(x), a
                                    651 ;	driver/dht12.c: 561: i2c_deinit();
      008A5E CD 87 5C         [ 4]  652 	call	_i2c_deinit
                                    653 ;	driver/dht12.c: 562: }
      008A61 5B 02            [ 2]  654 	addw	sp, #2
      008A63 81               [ 4]  655 	ret
                                    656 	.area CODE
                                    657 	.area CONST
                                    658 	.area INITIALIZER
                                    659 	.area CABS (ABS)
