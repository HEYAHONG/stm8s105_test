                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module oled
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _F8X16
                                     12 	.globl _oled_pow
                                     13 	.globl _GPIO_WriteLow
                                     14 	.globl _GPIO_WriteHigh
                                     15 	.globl _GPIO_Init
                                     16 	.globl _delay_ms
                                     17 	.globl _OLED_WR_Byte
                                     18 	.globl _OLED_Set_Pos
                                     19 	.globl _OLED_Display_On
                                     20 	.globl _OLED_Display_Off
                                     21 	.globl _OLED_Clear
                                     22 	.globl _OLED_ShowChar
                                     23 	.globl _OLED_ShowNum
                                     24 	.globl _OLED_ShowString
                                     25 	.globl _OLED_Init
                                     26 ;--------------------------------------------------------
                                     27 ; ram data
                                     28 ;--------------------------------------------------------
                                     29 	.area DATA
                                     30 ;--------------------------------------------------------
                                     31 ; ram data
                                     32 ;--------------------------------------------------------
                                     33 	.area INITIALIZED
                                     34 ;--------------------------------------------------------
                                     35 ; absolute external ram data
                                     36 ;--------------------------------------------------------
                                     37 	.area DABS (ABS)
                                     38 
                                     39 ; default segment ordering for linker
                                     40 	.area HOME
                                     41 	.area GSINIT
                                     42 	.area GSFINAL
                                     43 	.area CONST
                                     44 	.area INITIALIZER
                                     45 	.area CODE
                                     46 
                                     47 ;--------------------------------------------------------
                                     48 ; global & static initialisations
                                     49 ;--------------------------------------------------------
                                     50 	.area HOME
                                     51 	.area GSINIT
                                     52 	.area GSFINAL
                                     53 	.area GSINIT
                                     54 ;--------------------------------------------------------
                                     55 ; Home
                                     56 ;--------------------------------------------------------
                                     57 	.area HOME
                                     58 	.area HOME
                                     59 ;--------------------------------------------------------
                                     60 ; code
                                     61 ;--------------------------------------------------------
                                     62 	.area CODE
                                     63 ;	driver/oled.c: 45: void delay_ms(unsigned int ms)
                                     64 ;	-----------------------------------------
                                     65 ;	 function delay_ms
                                     66 ;	-----------------------------------------
      00A08F                         67 _delay_ms:
      00A08F 52 02            [ 2]   68 	sub	sp, #2
                                     69 ;	driver/oled.c: 48: while(ms)
      00A091 16 05            [ 2]   70 	ldw	y, (0x05, sp)
      00A093 17 01            [ 2]   71 	ldw	(0x01, sp), y
      00A095                         72 00104$:
      00A095 1E 01            [ 2]   73 	ldw	x, (0x01, sp)
      00A097 27 11            [ 1]   74 	jreq	00106$
                                     75 ;	driver/oled.c: 51: while(a--);
      00A099 AE 07 08         [ 2]   76 	ldw	x, #0x0708
      00A09C                         77 00101$:
      00A09C 90 93            [ 1]   78 	ldw	y, x
      00A09E 5A               [ 2]   79 	decw	x
      00A09F 90 5D            [ 2]   80 	tnzw	y
      00A0A1 26 F9            [ 1]   81 	jrne	00101$
                                     82 ;	driver/oled.c: 52: ms--;
      00A0A3 1E 01            [ 2]   83 	ldw	x, (0x01, sp)
      00A0A5 5A               [ 2]   84 	decw	x
      00A0A6 1F 01            [ 2]   85 	ldw	(0x01, sp), x
      00A0A8 20 EB            [ 2]   86 	jra	00104$
      00A0AA                         87 00106$:
                                     88 ;	driver/oled.c: 54: return;
                                     89 ;	driver/oled.c: 55: }
      00A0AA 5B 02            [ 2]   90 	addw	sp, #2
      00A0AC 81               [ 4]   91 	ret
                                     92 ;	driver/oled.c: 77: void OLED_WR_Byte(u8 dat,u8 cmd)
                                     93 ;	-----------------------------------------
                                     94 ;	 function OLED_WR_Byte
                                     95 ;	-----------------------------------------
      00A0AD                         96 _OLED_WR_Byte:
      00A0AD 88               [ 1]   97 	push	a
                                     98 ;	driver/oled.c: 80: if(cmd)
      00A0AE 0D 05            [ 1]   99 	tnz	(0x05, sp)
      00A0B0 27 0D            [ 1]  100 	jreq	00102$
                                    101 ;	driver/oled.c: 81: OLED_DC_Set();
      00A0B2 4B 10            [ 1]  102 	push	#0x10
      00A0B4 4B 0A            [ 1]  103 	push	#0x0a
      00A0B6 4B 50            [ 1]  104 	push	#0x50
      00A0B8 CD A5 DB         [ 4]  105 	call	_GPIO_WriteHigh
      00A0BB 5B 03            [ 2]  106 	addw	sp, #3
      00A0BD 20 0B            [ 2]  107 	jra	00103$
      00A0BF                        108 00102$:
                                    109 ;	driver/oled.c: 83: OLED_DC_Clr();
      00A0BF 4B 10            [ 1]  110 	push	#0x10
      00A0C1 4B 0A            [ 1]  111 	push	#0x0a
      00A0C3 4B 50            [ 1]  112 	push	#0x50
      00A0C5 CD A5 E2         [ 4]  113 	call	_GPIO_WriteLow
      00A0C8 5B 03            [ 2]  114 	addw	sp, #3
      00A0CA                        115 00103$:
                                    116 ;	driver/oled.c: 84: OLED_CS_Clr();
      00A0CA 4B 20            [ 1]  117 	push	#0x20
      00A0CC 4B 0A            [ 1]  118 	push	#0x0a
      00A0CE 4B 50            [ 1]  119 	push	#0x50
      00A0D0 CD A5 E2         [ 4]  120 	call	_GPIO_WriteLow
      00A0D3 5B 03            [ 2]  121 	addw	sp, #3
                                    122 ;	driver/oled.c: 85: for(i=0;i<8;i++)
      00A0D5 0F 01            [ 1]  123 	clr	(0x01, sp)
      00A0D7                        124 00108$:
                                    125 ;	driver/oled.c: 87: OLED_SCLK_Clr();
      00A0D7 4B 02            [ 1]  126 	push	#0x02
      00A0D9 4B 0A            [ 1]  127 	push	#0x0a
      00A0DB 4B 50            [ 1]  128 	push	#0x50
      00A0DD CD A5 E2         [ 4]  129 	call	_GPIO_WriteLow
      00A0E0 5B 03            [ 2]  130 	addw	sp, #3
                                    131 ;	driver/oled.c: 88: if(dat&0x80)
      00A0E2 7B 04            [ 1]  132 	ld	a, (0x04, sp)
      00A0E4 2A 0D            [ 1]  133 	jrpl	00105$
                                    134 ;	driver/oled.c: 90: OLED_SDIN_Set();
      00A0E6 4B 04            [ 1]  135 	push	#0x04
      00A0E8 4B 0A            [ 1]  136 	push	#0x0a
      00A0EA 4B 50            [ 1]  137 	push	#0x50
      00A0EC CD A5 DB         [ 4]  138 	call	_GPIO_WriteHigh
      00A0EF 5B 03            [ 2]  139 	addw	sp, #3
      00A0F1 20 0B            [ 2]  140 	jra	00106$
      00A0F3                        141 00105$:
                                    142 ;	driver/oled.c: 93: OLED_SDIN_Clr();
      00A0F3 4B 04            [ 1]  143 	push	#0x04
      00A0F5 4B 0A            [ 1]  144 	push	#0x0a
      00A0F7 4B 50            [ 1]  145 	push	#0x50
      00A0F9 CD A5 E2         [ 4]  146 	call	_GPIO_WriteLow
      00A0FC 5B 03            [ 2]  147 	addw	sp, #3
      00A0FE                        148 00106$:
                                    149 ;	driver/oled.c: 94: OLED_SCLK_Set();
      00A0FE 4B 02            [ 1]  150 	push	#0x02
      00A100 4B 0A            [ 1]  151 	push	#0x0a
      00A102 4B 50            [ 1]  152 	push	#0x50
      00A104 CD A5 DB         [ 4]  153 	call	_GPIO_WriteHigh
      00A107 5B 03            [ 2]  154 	addw	sp, #3
                                    155 ;	driver/oled.c: 95: dat<<=1;
      00A109 08 04            [ 1]  156 	sll	(0x04, sp)
                                    157 ;	driver/oled.c: 85: for(i=0;i<8;i++)
      00A10B 0C 01            [ 1]  158 	inc	(0x01, sp)
      00A10D 7B 01            [ 1]  159 	ld	a, (0x01, sp)
      00A10F A1 08            [ 1]  160 	cp	a, #0x08
      00A111 25 C4            [ 1]  161 	jrc	00108$
                                    162 ;	driver/oled.c: 97: OLED_CS_Set();
      00A113 4B 20            [ 1]  163 	push	#0x20
      00A115 4B 0A            [ 1]  164 	push	#0x0a
      00A117 4B 50            [ 1]  165 	push	#0x50
      00A119 CD A5 DB         [ 4]  166 	call	_GPIO_WriteHigh
      00A11C 5B 03            [ 2]  167 	addw	sp, #3
                                    168 ;	driver/oled.c: 98: OLED_DC_Set();
      00A11E 4B 10            [ 1]  169 	push	#0x10
      00A120 4B 0A            [ 1]  170 	push	#0x0a
      00A122 4B 50            [ 1]  171 	push	#0x50
      00A124 CD A5 DB         [ 4]  172 	call	_GPIO_WriteHigh
                                    173 ;	driver/oled.c: 99: }
      00A127 5B 04            [ 2]  174 	addw	sp, #4
      00A129 81               [ 4]  175 	ret
                                    176 ;	driver/oled.c: 101: void OLED_Set_Pos(unsigned char x, unsigned char y)
                                    177 ;	-----------------------------------------
                                    178 ;	 function OLED_Set_Pos
                                    179 ;	-----------------------------------------
      00A12A                        180 _OLED_Set_Pos:
      00A12A 52 02            [ 2]  181 	sub	sp, #2
                                    182 ;	driver/oled.c: 103: OLED_WR_Byte(0xb0+y,OLED_CMD);
      00A12C 7B 06            [ 1]  183 	ld	a, (0x06, sp)
      00A12E AB B0            [ 1]  184 	add	a, #0xb0
      00A130 4B 00            [ 1]  185 	push	#0x00
      00A132 88               [ 1]  186 	push	a
      00A133 CD A0 AD         [ 4]  187 	call	_OLED_WR_Byte
      00A136 5B 02            [ 2]  188 	addw	sp, #2
                                    189 ;	driver/oled.c: 104: OLED_WR_Byte(((x&0xf0)>>4)|0x10,OLED_CMD);
      00A138 7B 05            [ 1]  190 	ld	a, (0x05, sp)
      00A13A 0F 01            [ 1]  191 	clr	(0x01, sp)
      00A13C 88               [ 1]  192 	push	a
      00A13D A4 F0            [ 1]  193 	and	a, #0xf0
      00A13F 97               [ 1]  194 	ld	xl, a
      00A140 4F               [ 1]  195 	clr	a
      00A141 95               [ 1]  196 	ld	xh, a
      00A142 84               [ 1]  197 	pop	a
      00A143 57               [ 2]  198 	sraw	x
      00A144 57               [ 2]  199 	sraw	x
      00A145 57               [ 2]  200 	sraw	x
      00A146 57               [ 2]  201 	sraw	x
      00A147 88               [ 1]  202 	push	a
      00A148 9F               [ 1]  203 	ld	a, xl
      00A149 AA 10            [ 1]  204 	or	a, #0x10
      00A14B 97               [ 1]  205 	ld	xl, a
      00A14C 4B 00            [ 1]  206 	push	#0x00
      00A14E 89               [ 2]  207 	pushw	x
      00A14F 5B 01            [ 2]  208 	addw	sp, #1
      00A151 CD A0 AD         [ 4]  209 	call	_OLED_WR_Byte
      00A154 5B 02            [ 2]  210 	addw	sp, #2
      00A156 84               [ 1]  211 	pop	a
                                    212 ;	driver/oled.c: 105: OLED_WR_Byte((x&0x0f)|0x01,OLED_CMD);
      00A157 A4 0F            [ 1]  213 	and	a, #0x0f
      00A159 95               [ 1]  214 	ld	xh, a
      00A15A 4F               [ 1]  215 	clr	a
      00A15B 02               [ 1]  216 	rlwa	x
      00A15C AA 01            [ 1]  217 	or	a, #0x01
      00A15E 4B 00            [ 1]  218 	push	#0x00
      00A160 88               [ 1]  219 	push	a
      00A161 CD A0 AD         [ 4]  220 	call	_OLED_WR_Byte
                                    221 ;	driver/oled.c: 106: }
      00A164 5B 04            [ 2]  222 	addw	sp, #4
      00A166 81               [ 4]  223 	ret
                                    224 ;	driver/oled.c: 108: void OLED_Display_On(void)
                                    225 ;	-----------------------------------------
                                    226 ;	 function OLED_Display_On
                                    227 ;	-----------------------------------------
      00A167                        228 _OLED_Display_On:
                                    229 ;	driver/oled.c: 110: OLED_WR_Byte(0X8D,OLED_CMD);  //SET DCDC命令
      00A167 4B 00            [ 1]  230 	push	#0x00
      00A169 4B 8D            [ 1]  231 	push	#0x8d
      00A16B CD A0 AD         [ 4]  232 	call	_OLED_WR_Byte
      00A16E 5B 02            [ 2]  233 	addw	sp, #2
                                    234 ;	driver/oled.c: 111: OLED_WR_Byte(0X14,OLED_CMD);  //DCDC ON
      00A170 4B 00            [ 1]  235 	push	#0x00
      00A172 4B 14            [ 1]  236 	push	#0x14
      00A174 CD A0 AD         [ 4]  237 	call	_OLED_WR_Byte
      00A177 5B 02            [ 2]  238 	addw	sp, #2
                                    239 ;	driver/oled.c: 112: OLED_WR_Byte(0XAF,OLED_CMD);  //DISPLAY ON
      00A179 4B 00            [ 1]  240 	push	#0x00
      00A17B 4B AF            [ 1]  241 	push	#0xaf
      00A17D CD A0 AD         [ 4]  242 	call	_OLED_WR_Byte
      00A180 5B 02            [ 2]  243 	addw	sp, #2
                                    244 ;	driver/oled.c: 113: }
      00A182 81               [ 4]  245 	ret
                                    246 ;	driver/oled.c: 115: void OLED_Display_Off(void)
                                    247 ;	-----------------------------------------
                                    248 ;	 function OLED_Display_Off
                                    249 ;	-----------------------------------------
      00A183                        250 _OLED_Display_Off:
                                    251 ;	driver/oled.c: 117: OLED_WR_Byte(0X8D,OLED_CMD);  //SET DCDC命令
      00A183 4B 00            [ 1]  252 	push	#0x00
      00A185 4B 8D            [ 1]  253 	push	#0x8d
      00A187 CD A0 AD         [ 4]  254 	call	_OLED_WR_Byte
      00A18A 5B 02            [ 2]  255 	addw	sp, #2
                                    256 ;	driver/oled.c: 118: OLED_WR_Byte(0X10,OLED_CMD);  //DCDC OFF
      00A18C 4B 00            [ 1]  257 	push	#0x00
      00A18E 4B 10            [ 1]  258 	push	#0x10
      00A190 CD A0 AD         [ 4]  259 	call	_OLED_WR_Byte
      00A193 5B 02            [ 2]  260 	addw	sp, #2
                                    261 ;	driver/oled.c: 119: OLED_WR_Byte(0XAE,OLED_CMD);  //DISPLAY OFF
      00A195 4B 00            [ 1]  262 	push	#0x00
      00A197 4B AE            [ 1]  263 	push	#0xae
      00A199 CD A0 AD         [ 4]  264 	call	_OLED_WR_Byte
      00A19C 5B 02            [ 2]  265 	addw	sp, #2
                                    266 ;	driver/oled.c: 120: }
      00A19E 81               [ 4]  267 	ret
                                    268 ;	driver/oled.c: 122: void OLED_Clear(void)
                                    269 ;	-----------------------------------------
                                    270 ;	 function OLED_Clear
                                    271 ;	-----------------------------------------
      00A19F                        272 _OLED_Clear:
      00A19F 88               [ 1]  273 	push	a
                                    274 ;	driver/oled.c: 125: for(i=0;i<8;i++)
      00A1A0 0F 01            [ 1]  275 	clr	(0x01, sp)
      00A1A2                        276 00105$:
                                    277 ;	driver/oled.c: 127: OLED_WR_Byte (0xb0+i,OLED_CMD);    //设置页地址（0~7）
      00A1A2 7B 01            [ 1]  278 	ld	a, (0x01, sp)
      00A1A4 AB B0            [ 1]  279 	add	a, #0xb0
      00A1A6 4B 00            [ 1]  280 	push	#0x00
      00A1A8 88               [ 1]  281 	push	a
      00A1A9 CD A0 AD         [ 4]  282 	call	_OLED_WR_Byte
      00A1AC 5B 02            [ 2]  283 	addw	sp, #2
                                    284 ;	driver/oled.c: 128: OLED_WR_Byte (0x00,OLED_CMD);      //设置显示位置—列低地址
      00A1AE 4B 00            [ 1]  285 	push	#0x00
      00A1B0 4B 00            [ 1]  286 	push	#0x00
      00A1B2 CD A0 AD         [ 4]  287 	call	_OLED_WR_Byte
      00A1B5 5B 02            [ 2]  288 	addw	sp, #2
                                    289 ;	driver/oled.c: 129: OLED_WR_Byte (0x10,OLED_CMD);      //设置显示位置—列高地址
      00A1B7 4B 00            [ 1]  290 	push	#0x00
      00A1B9 4B 10            [ 1]  291 	push	#0x10
      00A1BB CD A0 AD         [ 4]  292 	call	_OLED_WR_Byte
      00A1BE 5B 02            [ 2]  293 	addw	sp, #2
                                    294 ;	driver/oled.c: 130: for(n=0;n<128;n++)OLED_WR_Byte(0,OLED_DATA);
      00A1C0 4F               [ 1]  295 	clr	a
      00A1C1                        296 00103$:
      00A1C1 88               [ 1]  297 	push	a
      00A1C2 4B 01            [ 1]  298 	push	#0x01
      00A1C4 4B 00            [ 1]  299 	push	#0x00
      00A1C6 CD A0 AD         [ 4]  300 	call	_OLED_WR_Byte
      00A1C9 5B 02            [ 2]  301 	addw	sp, #2
      00A1CB 84               [ 1]  302 	pop	a
      00A1CC 4C               [ 1]  303 	inc	a
      00A1CD A1 80            [ 1]  304 	cp	a, #0x80
      00A1CF 25 F0            [ 1]  305 	jrc	00103$
                                    306 ;	driver/oled.c: 125: for(i=0;i<8;i++)
      00A1D1 0C 01            [ 1]  307 	inc	(0x01, sp)
      00A1D3 7B 01            [ 1]  308 	ld	a, (0x01, sp)
      00A1D5 A1 08            [ 1]  309 	cp	a, #0x08
      00A1D7 25 C9            [ 1]  310 	jrc	00105$
                                    311 ;	driver/oled.c: 132: }
      00A1D9 84               [ 1]  312 	pop	a
      00A1DA 81               [ 4]  313 	ret
                                    314 ;	driver/oled.c: 140: void OLED_ShowChar(u8 x,u8 y,u8 chr)
                                    315 ;	-----------------------------------------
                                    316 ;	 function OLED_ShowChar
                                    317 ;	-----------------------------------------
      00A1DB                        318 _OLED_ShowChar:
      00A1DB 52 04            [ 2]  319 	sub	sp, #4
                                    320 ;	driver/oled.c: 143: c=chr-' ';//得到偏移后的值
      00A1DD 7B 09            [ 1]  321 	ld	a, (0x09, sp)
      00A1DF A0 20            [ 1]  322 	sub	a, #0x20
      00A1E1 6B 04            [ 1]  323 	ld	(0x04, sp), a
                                    324 ;	driver/oled.c: 144: if(x>Max_Column-1){x=0;y=y+2;}
      00A1E3 7B 07            [ 1]  325 	ld	a, (0x07, sp)
      00A1E5 A1 7F            [ 1]  326 	cp	a, #0x7f
      00A1E7 23 08            [ 2]  327 	jrule	00102$
      00A1E9 0F 07            [ 1]  328 	clr	(0x07, sp)
      00A1EB 7B 08            [ 1]  329 	ld	a, (0x08, sp)
      00A1ED AB 02            [ 1]  330 	add	a, #0x02
      00A1EF 6B 08            [ 1]  331 	ld	(0x08, sp), a
      00A1F1                        332 00102$:
                                    333 ;	driver/oled.c: 147: OLED_Set_Pos(x,y);
      00A1F1 7B 08            [ 1]  334 	ld	a, (0x08, sp)
      00A1F3 88               [ 1]  335 	push	a
      00A1F4 7B 08            [ 1]  336 	ld	a, (0x08, sp)
      00A1F6 88               [ 1]  337 	push	a
      00A1F7 CD A1 2A         [ 4]  338 	call	_OLED_Set_Pos
      00A1FA 5B 02            [ 2]  339 	addw	sp, #2
                                    340 ;	driver/oled.c: 148: for(i=0;i<8;i++)
      00A1FC 0F 03            [ 1]  341 	clr	(0x03, sp)
      00A1FE                        342 00105$:
                                    343 ;	driver/oled.c: 149: OLED_WR_Byte(F8X16[c*16+i],OLED_DATA);
      00A1FE 5F               [ 1]  344 	clrw	x
      00A1FF 7B 04            [ 1]  345 	ld	a, (0x04, sp)
      00A201 97               [ 1]  346 	ld	xl, a
      00A202 58               [ 2]  347 	sllw	x
      00A203 58               [ 2]  348 	sllw	x
      00A204 58               [ 2]  349 	sllw	x
      00A205 58               [ 2]  350 	sllw	x
      00A206 1F 01            [ 2]  351 	ldw	(0x01, sp), x
      00A208 5F               [ 1]  352 	clrw	x
      00A209 7B 03            [ 1]  353 	ld	a, (0x03, sp)
      00A20B 97               [ 1]  354 	ld	xl, a
      00A20C 72 FB 01         [ 2]  355 	addw	x, (0x01, sp)
      00A20F 1C 81 05         [ 2]  356 	addw	x, #_F8X16
      00A212 F6               [ 1]  357 	ld	a, (x)
      00A213 4B 01            [ 1]  358 	push	#0x01
      00A215 88               [ 1]  359 	push	a
      00A216 CD A0 AD         [ 4]  360 	call	_OLED_WR_Byte
      00A219 5B 02            [ 2]  361 	addw	sp, #2
                                    362 ;	driver/oled.c: 148: for(i=0;i<8;i++)
      00A21B 0C 03            [ 1]  363 	inc	(0x03, sp)
      00A21D 7B 03            [ 1]  364 	ld	a, (0x03, sp)
      00A21F A1 08            [ 1]  365 	cp	a, #0x08
      00A221 25 DB            [ 1]  366 	jrc	00105$
                                    367 ;	driver/oled.c: 150: OLED_Set_Pos(x,y+1);
      00A223 7B 08            [ 1]  368 	ld	a, (0x08, sp)
      00A225 4C               [ 1]  369 	inc	a
      00A226 88               [ 1]  370 	push	a
      00A227 7B 08            [ 1]  371 	ld	a, (0x08, sp)
      00A229 88               [ 1]  372 	push	a
      00A22A CD A1 2A         [ 4]  373 	call	_OLED_Set_Pos
      00A22D 5B 02            [ 2]  374 	addw	sp, #2
                                    375 ;	driver/oled.c: 151: for(i=0;i<8;i++)
      00A22F 0F 03            [ 1]  376 	clr	(0x03, sp)
      00A231                        377 00107$:
                                    378 ;	driver/oled.c: 152: OLED_WR_Byte(F8X16[c*16+i+8],OLED_DATA);
      00A231 5F               [ 1]  379 	clrw	x
      00A232 7B 03            [ 1]  380 	ld	a, (0x03, sp)
      00A234 97               [ 1]  381 	ld	xl, a
      00A235 72 FB 01         [ 2]  382 	addw	x, (0x01, sp)
      00A238 1C 00 08         [ 2]  383 	addw	x, #0x0008
      00A23B 1C 81 05         [ 2]  384 	addw	x, #_F8X16
      00A23E F6               [ 1]  385 	ld	a, (x)
      00A23F 4B 01            [ 1]  386 	push	#0x01
      00A241 88               [ 1]  387 	push	a
      00A242 CD A0 AD         [ 4]  388 	call	_OLED_WR_Byte
      00A245 5B 02            [ 2]  389 	addw	sp, #2
                                    390 ;	driver/oled.c: 151: for(i=0;i<8;i++)
      00A247 0C 03            [ 1]  391 	inc	(0x03, sp)
      00A249 7B 03            [ 1]  392 	ld	a, (0x03, sp)
      00A24B A1 08            [ 1]  393 	cp	a, #0x08
      00A24D 25 E2            [ 1]  394 	jrc	00107$
                                    395 ;	driver/oled.c: 163: }
      00A24F 5B 04            [ 2]  396 	addw	sp, #4
      00A251 81               [ 4]  397 	ret
                                    398 ;	driver/oled.c: 165: u32 oled_pow(u8 m,u8 n)
                                    399 ;	-----------------------------------------
                                    400 ;	 function oled_pow
                                    401 ;	-----------------------------------------
      00A252                        402 _oled_pow:
      00A252 52 09            [ 2]  403 	sub	sp, #9
                                    404 ;	driver/oled.c: 167: u32 result=1;
      00A254 5F               [ 1]  405 	clrw	x
      00A255 5C               [ 1]  406 	incw	x
      00A256 0F 07            [ 1]  407 	clr	(0x07, sp)
      00A258 0F 06            [ 1]  408 	clr	(0x06, sp)
                                    409 ;	driver/oled.c: 168: while(n--)result*=m;
      00A25A 7B 0D            [ 1]  410 	ld	a, (0x0d, sp)
      00A25C 6B 01            [ 1]  411 	ld	(0x01, sp), a
      00A25E                        412 00101$:
      00A25E 7B 01            [ 1]  413 	ld	a, (0x01, sp)
      00A260 0A 01            [ 1]  414 	dec	(0x01, sp)
      00A262 4D               [ 1]  415 	tnz	a
      00A263 27 1D            [ 1]  416 	jreq	00103$
      00A265 7B 0C            [ 1]  417 	ld	a, (0x0c, sp)
      00A267 6B 05            [ 1]  418 	ld	(0x05, sp), a
      00A269 90 5F            [ 1]  419 	clrw	y
      00A26B 0F 02            [ 1]  420 	clr	(0x02, sp)
      00A26D 7B 05            [ 1]  421 	ld	a, (0x05, sp)
      00A26F 88               [ 1]  422 	push	a
      00A270 90 89            [ 2]  423 	pushw	y
      00A272 7B 05            [ 1]  424 	ld	a, (0x05, sp)
      00A274 88               [ 1]  425 	push	a
      00A275 89               [ 2]  426 	pushw	x
      00A276 1E 0C            [ 2]  427 	ldw	x, (0x0c, sp)
      00A278 89               [ 2]  428 	pushw	x
      00A279 CD B9 1A         [ 4]  429 	call	__mullong
      00A27C 5B 08            [ 2]  430 	addw	sp, #8
      00A27E 17 06            [ 2]  431 	ldw	(0x06, sp), y
      00A280 20 DC            [ 2]  432 	jra	00101$
      00A282                        433 00103$:
                                    434 ;	driver/oled.c: 169: return result;
      00A282 16 06            [ 2]  435 	ldw	y, (0x06, sp)
                                    436 ;	driver/oled.c: 170: }
      00A284 5B 09            [ 2]  437 	addw	sp, #9
      00A286 81               [ 4]  438 	ret
                                    439 ;	driver/oled.c: 177: void OLED_ShowNum(u8 x,u8 y,u32 num,u8 len,u8 size2)
                                    440 ;	-----------------------------------------
                                    441 ;	 function OLED_ShowNum
                                    442 ;	-----------------------------------------
      00A287                        443 _OLED_ShowNum:
      00A287 52 07            [ 2]  444 	sub	sp, #7
                                    445 ;	driver/oled.c: 180: u8 enshow=0;
      00A289 0F 05            [ 1]  446 	clr	(0x05, sp)
                                    447 ;	driver/oled.c: 181: for(t=0;t<len;t++)
      00A28B 0F 07            [ 1]  448 	clr	(0x07, sp)
      00A28D                        449 00110$:
      00A28D 7B 07            [ 1]  450 	ld	a, (0x07, sp)
      00A28F 11 10            [ 1]  451 	cp	a, (0x10, sp)
      00A291 25 03            [ 1]  452 	jrc	00139$
      00A293 CC A3 21         [ 2]  453 	jp	00111$
      00A296                        454 00139$:
                                    455 ;	driver/oled.c: 183: temp=(num/oled_pow(10,len-t-1))%10;
      00A296 7B 10            [ 1]  456 	ld	a, (0x10, sp)
      00A298 10 07            [ 1]  457 	sub	a, (0x07, sp)
      00A29A 4A               [ 1]  458 	dec	a
      00A29B 88               [ 1]  459 	push	a
      00A29C 4B 0A            [ 1]  460 	push	#0x0a
      00A29E CD A2 52         [ 4]  461 	call	_oled_pow
      00A2A1 5B 02            [ 2]  462 	addw	sp, #2
      00A2A3 89               [ 2]  463 	pushw	x
      00A2A4 90 89            [ 2]  464 	pushw	y
      00A2A6 1E 12            [ 2]  465 	ldw	x, (0x12, sp)
      00A2A8 89               [ 2]  466 	pushw	x
      00A2A9 1E 12            [ 2]  467 	ldw	x, (0x12, sp)
      00A2AB 89               [ 2]  468 	pushw	x
      00A2AC CD B8 C0         [ 4]  469 	call	__divulong
      00A2AF 5B 08            [ 2]  470 	addw	sp, #8
      00A2B1 4B 0A            [ 1]  471 	push	#0x0a
      00A2B3 4B 00            [ 1]  472 	push	#0x00
      00A2B5 4B 00            [ 1]  473 	push	#0x00
      00A2B7 4B 00            [ 1]  474 	push	#0x00
      00A2B9 89               [ 2]  475 	pushw	x
      00A2BA 90 89            [ 2]  476 	pushw	y
      00A2BC CD B8 02         [ 4]  477 	call	__modulong
      00A2BF 5B 08            [ 2]  478 	addw	sp, #8
      00A2C1 9F               [ 1]  479 	ld	a, xl
      00A2C2 6B 06            [ 1]  480 	ld	(0x06, sp), a
                                    481 ;	driver/oled.c: 188: OLED_ShowChar(x+(size2/2)*t,y,' ');
      00A2C4 5F               [ 1]  482 	clrw	x
      00A2C5 7B 11            [ 1]  483 	ld	a, (0x11, sp)
      00A2C7 97               [ 1]  484 	ld	xl, a
      00A2C8 7B 07            [ 1]  485 	ld	a, (0x07, sp)
      00A2CA 6B 04            [ 1]  486 	ld	(0x04, sp), a
      00A2CC 7B 0A            [ 1]  487 	ld	a, (0x0a, sp)
      00A2CE 6B 03            [ 1]  488 	ld	(0x03, sp), a
      00A2D0 4B 02            [ 1]  489 	push	#0x02
      00A2D2 4B 00            [ 1]  490 	push	#0x00
      00A2D4 89               [ 2]  491 	pushw	x
      00A2D5 CD B9 AC         [ 4]  492 	call	__divsint
      00A2D8 5B 04            [ 2]  493 	addw	sp, #4
      00A2DA 7B 04            [ 1]  494 	ld	a, (0x04, sp)
      00A2DC 42               [ 4]  495 	mul	x, a
      00A2DD 9F               [ 1]  496 	ld	a, xl
      00A2DE 1B 03            [ 1]  497 	add	a, (0x03, sp)
      00A2E0 90 97            [ 1]  498 	ld	yl, a
                                    499 ;	driver/oled.c: 184: if(enshow==0&&t<(len-1))
      00A2E2 0D 05            [ 1]  500 	tnz	(0x05, sp)
      00A2E4 26 26            [ 1]  501 	jrne	00105$
      00A2E6 5F               [ 1]  502 	clrw	x
      00A2E7 7B 10            [ 1]  503 	ld	a, (0x10, sp)
      00A2E9 97               [ 1]  504 	ld	xl, a
      00A2EA 5A               [ 2]  505 	decw	x
      00A2EB 1F 01            [ 2]  506 	ldw	(0x01, sp), x
      00A2ED 5F               [ 1]  507 	clrw	x
      00A2EE 7B 07            [ 1]  508 	ld	a, (0x07, sp)
      00A2F0 97               [ 1]  509 	ld	xl, a
      00A2F1 13 01            [ 2]  510 	cpw	x, (0x01, sp)
      00A2F3 2E 17            [ 1]  511 	jrsge	00105$
                                    512 ;	driver/oled.c: 186: if(temp==0)
      00A2F5 0D 06            [ 1]  513 	tnz	(0x06, sp)
      00A2F7 26 0F            [ 1]  514 	jrne	00102$
                                    515 ;	driver/oled.c: 188: OLED_ShowChar(x+(size2/2)*t,y,' ');
      00A2F9 4B 20            [ 1]  516 	push	#0x20
      00A2FB 7B 0C            [ 1]  517 	ld	a, (0x0c, sp)
      00A2FD 88               [ 1]  518 	push	a
      00A2FE 90 9F            [ 1]  519 	ld	a, yl
      00A300 88               [ 1]  520 	push	a
      00A301 CD A1 DB         [ 4]  521 	call	_OLED_ShowChar
      00A304 5B 03            [ 2]  522 	addw	sp, #3
                                    523 ;	driver/oled.c: 189: continue;
      00A306 20 14            [ 2]  524 	jra	00107$
      00A308                        525 00102$:
                                    526 ;	driver/oled.c: 190: }else enshow=1;
      00A308 A6 01            [ 1]  527 	ld	a, #0x01
      00A30A 6B 05            [ 1]  528 	ld	(0x05, sp), a
      00A30C                        529 00105$:
                                    530 ;	driver/oled.c: 193: OLED_ShowChar(x+(size2/2)*t,y,temp+'0');
      00A30C 7B 06            [ 1]  531 	ld	a, (0x06, sp)
      00A30E AB 30            [ 1]  532 	add	a, #0x30
      00A310 88               [ 1]  533 	push	a
      00A311 7B 0C            [ 1]  534 	ld	a, (0x0c, sp)
      00A313 88               [ 1]  535 	push	a
      00A314 90 9F            [ 1]  536 	ld	a, yl
      00A316 88               [ 1]  537 	push	a
      00A317 CD A1 DB         [ 4]  538 	call	_OLED_ShowChar
      00A31A 5B 03            [ 2]  539 	addw	sp, #3
      00A31C                        540 00107$:
                                    541 ;	driver/oled.c: 181: for(t=0;t<len;t++)
      00A31C 0C 07            [ 1]  542 	inc	(0x07, sp)
      00A31E CC A2 8D         [ 2]  543 	jp	00110$
      00A321                        544 00111$:
                                    545 ;	driver/oled.c: 195: }
      00A321 5B 07            [ 2]  546 	addw	sp, #7
      00A323 81               [ 4]  547 	ret
                                    548 ;	driver/oled.c: 197: void OLED_ShowString(u8 x,u8 y,u8 *chr)
                                    549 ;	-----------------------------------------
                                    550 ;	 function OLED_ShowString
                                    551 ;	-----------------------------------------
      00A324                        552 _OLED_ShowString:
      00A324 88               [ 1]  553 	push	a
                                    554 ;	driver/oled.c: 200: while (chr[j]!='\0')
      00A325 0F 01            [ 1]  555 	clr	(0x01, sp)
      00A327                        556 00103$:
      00A327 5F               [ 1]  557 	clrw	x
      00A328 7B 01            [ 1]  558 	ld	a, (0x01, sp)
      00A32A 97               [ 1]  559 	ld	xl, a
      00A32B 72 FB 06         [ 2]  560 	addw	x, (0x06, sp)
      00A32E F6               [ 1]  561 	ld	a, (x)
      00A32F 27 24            [ 1]  562 	jreq	00106$
                                    563 ;	driver/oled.c: 201: {		OLED_ShowChar(x,y,chr[j]);
      00A331 88               [ 1]  564 	push	a
      00A332 7B 06            [ 1]  565 	ld	a, (0x06, sp)
      00A334 88               [ 1]  566 	push	a
      00A335 7B 06            [ 1]  567 	ld	a, (0x06, sp)
      00A337 88               [ 1]  568 	push	a
      00A338 CD A1 DB         [ 4]  569 	call	_OLED_ShowChar
      00A33B 5B 03            [ 2]  570 	addw	sp, #3
                                    571 ;	driver/oled.c: 202: x+=8;
      00A33D 7B 04            [ 1]  572 	ld	a, (0x04, sp)
      00A33F AB 08            [ 1]  573 	add	a, #0x08
      00A341 6B 04            [ 1]  574 	ld	(0x04, sp), a
                                    575 ;	driver/oled.c: 203: if(x>120){x=0;y+=2;}
      00A343 7B 04            [ 1]  576 	ld	a, (0x04, sp)
      00A345 A1 78            [ 1]  577 	cp	a, #0x78
      00A347 23 08            [ 2]  578 	jrule	00102$
      00A349 0F 04            [ 1]  579 	clr	(0x04, sp)
      00A34B 7B 05            [ 1]  580 	ld	a, (0x05, sp)
      00A34D AB 02            [ 1]  581 	add	a, #0x02
      00A34F 6B 05            [ 1]  582 	ld	(0x05, sp), a
      00A351                        583 00102$:
                                    584 ;	driver/oled.c: 204: j++;
      00A351 0C 01            [ 1]  585 	inc	(0x01, sp)
      00A353 20 D2            [ 2]  586 	jra	00103$
      00A355                        587 00106$:
                                    588 ;	driver/oled.c: 206: }
      00A355 84               [ 1]  589 	pop	a
      00A356 81               [ 4]  590 	ret
                                    591 ;	driver/oled.c: 248: void OLED_Init(void)
                                    592 ;	-----------------------------------------
                                    593 ;	 function OLED_Init
                                    594 ;	-----------------------------------------
      00A357                        595 _OLED_Init:
                                    596 ;	driver/oled.c: 250: GPIO_Init(OLED_SCLK_PORT, (GPIO_Pin_TypeDef)OLED_SCLK_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      00A357 4B E0            [ 1]  597 	push	#0xe0
      00A359 4B 02            [ 1]  598 	push	#0x02
      00A35B 4B 0A            [ 1]  599 	push	#0x0a
      00A35D 4B 50            [ 1]  600 	push	#0x50
      00A35F CD A5 60         [ 4]  601 	call	_GPIO_Init
      00A362 5B 04            [ 2]  602 	addw	sp, #4
                                    603 ;	driver/oled.c: 251: GPIO_Init(OLED_SDIN_PORT, (GPIO_Pin_TypeDef)OLED_SDIN_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      00A364 4B E0            [ 1]  604 	push	#0xe0
      00A366 4B 04            [ 1]  605 	push	#0x04
      00A368 4B 0A            [ 1]  606 	push	#0x0a
      00A36A 4B 50            [ 1]  607 	push	#0x50
      00A36C CD A5 60         [ 4]  608 	call	_GPIO_Init
      00A36F 5B 04            [ 2]  609 	addw	sp, #4
                                    610 ;	driver/oled.c: 252: GPIO_Init(OLED_RST_PORT, (GPIO_Pin_TypeDef)OLED_RST_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      00A371 4B E0            [ 1]  611 	push	#0xe0
      00A373 4B 08            [ 1]  612 	push	#0x08
      00A375 4B 0A            [ 1]  613 	push	#0x0a
      00A377 4B 50            [ 1]  614 	push	#0x50
      00A379 CD A5 60         [ 4]  615 	call	_GPIO_Init
      00A37C 5B 04            [ 2]  616 	addw	sp, #4
                                    617 ;	driver/oled.c: 253: GPIO_Init(OLED_DC_PORT, (GPIO_Pin_TypeDef)OLED_DC_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      00A37E 4B E0            [ 1]  618 	push	#0xe0
      00A380 4B 10            [ 1]  619 	push	#0x10
      00A382 4B 0A            [ 1]  620 	push	#0x0a
      00A384 4B 50            [ 1]  621 	push	#0x50
      00A386 CD A5 60         [ 4]  622 	call	_GPIO_Init
      00A389 5B 04            [ 2]  623 	addw	sp, #4
                                    624 ;	driver/oled.c: 254: GPIO_Init(OLED_CS_PORT, (GPIO_Pin_TypeDef)OLED_CS_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      00A38B 4B E0            [ 1]  625 	push	#0xe0
      00A38D 4B 20            [ 1]  626 	push	#0x20
      00A38F 4B 0A            [ 1]  627 	push	#0x0a
      00A391 4B 50            [ 1]  628 	push	#0x50
      00A393 CD A5 60         [ 4]  629 	call	_GPIO_Init
      00A396 5B 04            [ 2]  630 	addw	sp, #4
                                    631 ;	driver/oled.c: 257: OLED_RST_Set();
      00A398 4B 08            [ 1]  632 	push	#0x08
      00A39A 4B 0A            [ 1]  633 	push	#0x0a
      00A39C 4B 50            [ 1]  634 	push	#0x50
      00A39E CD A5 DB         [ 4]  635 	call	_GPIO_WriteHigh
      00A3A1 5B 03            [ 2]  636 	addw	sp, #3
                                    637 ;	driver/oled.c: 258: delay_ms(100);
      00A3A3 4B 64            [ 1]  638 	push	#0x64
      00A3A5 4B 00            [ 1]  639 	push	#0x00
      00A3A7 CD A0 8F         [ 4]  640 	call	_delay_ms
      00A3AA 5B 02            [ 2]  641 	addw	sp, #2
                                    642 ;	driver/oled.c: 259: OLED_RST_Clr();
      00A3AC 4B 08            [ 1]  643 	push	#0x08
      00A3AE 4B 0A            [ 1]  644 	push	#0x0a
      00A3B0 4B 50            [ 1]  645 	push	#0x50
      00A3B2 CD A5 E2         [ 4]  646 	call	_GPIO_WriteLow
      00A3B5 5B 03            [ 2]  647 	addw	sp, #3
                                    648 ;	driver/oled.c: 260: delay_ms(100);
      00A3B7 4B 64            [ 1]  649 	push	#0x64
      00A3B9 4B 00            [ 1]  650 	push	#0x00
      00A3BB CD A0 8F         [ 4]  651 	call	_delay_ms
      00A3BE 5B 02            [ 2]  652 	addw	sp, #2
                                    653 ;	driver/oled.c: 261: OLED_RST_Set();
      00A3C0 4B 08            [ 1]  654 	push	#0x08
      00A3C2 4B 0A            [ 1]  655 	push	#0x0a
      00A3C4 4B 50            [ 1]  656 	push	#0x50
      00A3C6 CD A5 DB         [ 4]  657 	call	_GPIO_WriteHigh
      00A3C9 5B 03            [ 2]  658 	addw	sp, #3
                                    659 ;	driver/oled.c: 293: OLED_WR_Byte(0xAE,OLED_CMD);//--turn off oled panel
      00A3CB 4B 00            [ 1]  660 	push	#0x00
      00A3CD 4B AE            [ 1]  661 	push	#0xae
      00A3CF CD A0 AD         [ 4]  662 	call	_OLED_WR_Byte
      00A3D2 5B 02            [ 2]  663 	addw	sp, #2
                                    664 ;	driver/oled.c: 294: OLED_WR_Byte(0x00,OLED_CMD);//---set low column address
      00A3D4 4B 00            [ 1]  665 	push	#0x00
      00A3D6 4B 00            [ 1]  666 	push	#0x00
      00A3D8 CD A0 AD         [ 4]  667 	call	_OLED_WR_Byte
      00A3DB 5B 02            [ 2]  668 	addw	sp, #2
                                    669 ;	driver/oled.c: 295: OLED_WR_Byte(0x10,OLED_CMD);//---set high column address
      00A3DD 4B 00            [ 1]  670 	push	#0x00
      00A3DF 4B 10            [ 1]  671 	push	#0x10
      00A3E1 CD A0 AD         [ 4]  672 	call	_OLED_WR_Byte
      00A3E4 5B 02            [ 2]  673 	addw	sp, #2
                                    674 ;	driver/oled.c: 296: OLED_WR_Byte(0x40,OLED_CMD);//--set start line address  Set Mapping RAM Display Start Line (0x00~0x3F)
      00A3E6 4B 00            [ 1]  675 	push	#0x00
      00A3E8 4B 40            [ 1]  676 	push	#0x40
      00A3EA CD A0 AD         [ 4]  677 	call	_OLED_WR_Byte
      00A3ED 5B 02            [ 2]  678 	addw	sp, #2
                                    679 ;	driver/oled.c: 297: OLED_WR_Byte(0x81,OLED_CMD);//--set contrast control register
      00A3EF 4B 00            [ 1]  680 	push	#0x00
      00A3F1 4B 81            [ 1]  681 	push	#0x81
      00A3F3 CD A0 AD         [ 4]  682 	call	_OLED_WR_Byte
      00A3F6 5B 02            [ 2]  683 	addw	sp, #2
                                    684 ;	driver/oled.c: 298: OLED_WR_Byte(0xCF,OLED_CMD); // Set SEG Output Current Brightness
      00A3F8 4B 00            [ 1]  685 	push	#0x00
      00A3FA 4B CF            [ 1]  686 	push	#0xcf
      00A3FC CD A0 AD         [ 4]  687 	call	_OLED_WR_Byte
      00A3FF 5B 02            [ 2]  688 	addw	sp, #2
                                    689 ;	driver/oled.c: 299: OLED_WR_Byte(0xA1,OLED_CMD);//--Set SEG/Column Mapping     0xa0左右反置 0xa1正常
      00A401 4B 00            [ 1]  690 	push	#0x00
      00A403 4B A1            [ 1]  691 	push	#0xa1
      00A405 CD A0 AD         [ 4]  692 	call	_OLED_WR_Byte
      00A408 5B 02            [ 2]  693 	addw	sp, #2
                                    694 ;	driver/oled.c: 300: OLED_WR_Byte(0xC8,OLED_CMD);//Set COM/Row Scan Direction   0xc0上下反置 0xc8正常
      00A40A 4B 00            [ 1]  695 	push	#0x00
      00A40C 4B C8            [ 1]  696 	push	#0xc8
      00A40E CD A0 AD         [ 4]  697 	call	_OLED_WR_Byte
      00A411 5B 02            [ 2]  698 	addw	sp, #2
                                    699 ;	driver/oled.c: 301: OLED_WR_Byte(0xA6,OLED_CMD);//--set normal display
      00A413 4B 00            [ 1]  700 	push	#0x00
      00A415 4B A6            [ 1]  701 	push	#0xa6
      00A417 CD A0 AD         [ 4]  702 	call	_OLED_WR_Byte
      00A41A 5B 02            [ 2]  703 	addw	sp, #2
                                    704 ;	driver/oled.c: 302: OLED_WR_Byte(0xA8,OLED_CMD);//--set multiplex ratio(1 to 64)
      00A41C 4B 00            [ 1]  705 	push	#0x00
      00A41E 4B A8            [ 1]  706 	push	#0xa8
      00A420 CD A0 AD         [ 4]  707 	call	_OLED_WR_Byte
      00A423 5B 02            [ 2]  708 	addw	sp, #2
                                    709 ;	driver/oled.c: 303: OLED_WR_Byte(0x3f,OLED_CMD);//--1/64 duty
      00A425 4B 00            [ 1]  710 	push	#0x00
      00A427 4B 3F            [ 1]  711 	push	#0x3f
      00A429 CD A0 AD         [ 4]  712 	call	_OLED_WR_Byte
      00A42C 5B 02            [ 2]  713 	addw	sp, #2
                                    714 ;	driver/oled.c: 304: OLED_WR_Byte(0xD3,OLED_CMD);//-set display offset	Shift Mapping RAM Counter (0x00~0x3F)
      00A42E 4B 00            [ 1]  715 	push	#0x00
      00A430 4B D3            [ 1]  716 	push	#0xd3
      00A432 CD A0 AD         [ 4]  717 	call	_OLED_WR_Byte
      00A435 5B 02            [ 2]  718 	addw	sp, #2
                                    719 ;	driver/oled.c: 305: OLED_WR_Byte(0x00,OLED_CMD);//-not offset
      00A437 4B 00            [ 1]  720 	push	#0x00
      00A439 4B 00            [ 1]  721 	push	#0x00
      00A43B CD A0 AD         [ 4]  722 	call	_OLED_WR_Byte
      00A43E 5B 02            [ 2]  723 	addw	sp, #2
                                    724 ;	driver/oled.c: 306: OLED_WR_Byte(0xd5,OLED_CMD);//--set display clock divide ratio/oscillator frequency
      00A440 4B 00            [ 1]  725 	push	#0x00
      00A442 4B D5            [ 1]  726 	push	#0xd5
      00A444 CD A0 AD         [ 4]  727 	call	_OLED_WR_Byte
      00A447 5B 02            [ 2]  728 	addw	sp, #2
                                    729 ;	driver/oled.c: 307: OLED_WR_Byte(0x80,OLED_CMD);//--set divide ratio, Set Clock as 100 Frames/Sec
      00A449 4B 00            [ 1]  730 	push	#0x00
      00A44B 4B 80            [ 1]  731 	push	#0x80
      00A44D CD A0 AD         [ 4]  732 	call	_OLED_WR_Byte
      00A450 5B 02            [ 2]  733 	addw	sp, #2
                                    734 ;	driver/oled.c: 308: OLED_WR_Byte(0xD9,OLED_CMD);//--set pre-charge period
      00A452 4B 00            [ 1]  735 	push	#0x00
      00A454 4B D9            [ 1]  736 	push	#0xd9
      00A456 CD A0 AD         [ 4]  737 	call	_OLED_WR_Byte
      00A459 5B 02            [ 2]  738 	addw	sp, #2
                                    739 ;	driver/oled.c: 309: OLED_WR_Byte(0xF1,OLED_CMD);//Set Pre-Charge as 15 Clocks & Discharge as 1 Clock
      00A45B 4B 00            [ 1]  740 	push	#0x00
      00A45D 4B F1            [ 1]  741 	push	#0xf1
      00A45F CD A0 AD         [ 4]  742 	call	_OLED_WR_Byte
      00A462 5B 02            [ 2]  743 	addw	sp, #2
                                    744 ;	driver/oled.c: 310: OLED_WR_Byte(0xDA,OLED_CMD);//--set com pins hardware configuration
      00A464 4B 00            [ 1]  745 	push	#0x00
      00A466 4B DA            [ 1]  746 	push	#0xda
      00A468 CD A0 AD         [ 4]  747 	call	_OLED_WR_Byte
      00A46B 5B 02            [ 2]  748 	addw	sp, #2
                                    749 ;	driver/oled.c: 311: OLED_WR_Byte(0x12,OLED_CMD);
      00A46D 4B 00            [ 1]  750 	push	#0x00
      00A46F 4B 12            [ 1]  751 	push	#0x12
      00A471 CD A0 AD         [ 4]  752 	call	_OLED_WR_Byte
      00A474 5B 02            [ 2]  753 	addw	sp, #2
                                    754 ;	driver/oled.c: 312: OLED_WR_Byte(0xDB,OLED_CMD);//--set vcomh
      00A476 4B 00            [ 1]  755 	push	#0x00
      00A478 4B DB            [ 1]  756 	push	#0xdb
      00A47A CD A0 AD         [ 4]  757 	call	_OLED_WR_Byte
      00A47D 5B 02            [ 2]  758 	addw	sp, #2
                                    759 ;	driver/oled.c: 313: OLED_WR_Byte(0x40,OLED_CMD);//Set VCOM Deselect Level
      00A47F 4B 00            [ 1]  760 	push	#0x00
      00A481 4B 40            [ 1]  761 	push	#0x40
      00A483 CD A0 AD         [ 4]  762 	call	_OLED_WR_Byte
      00A486 5B 02            [ 2]  763 	addw	sp, #2
                                    764 ;	driver/oled.c: 314: OLED_WR_Byte(0x20,OLED_CMD);//-Set Page Addressing Mode (0x00/0x01/0x02)
      00A488 4B 00            [ 1]  765 	push	#0x00
      00A48A 4B 20            [ 1]  766 	push	#0x20
      00A48C CD A0 AD         [ 4]  767 	call	_OLED_WR_Byte
      00A48F 5B 02            [ 2]  768 	addw	sp, #2
                                    769 ;	driver/oled.c: 315: OLED_WR_Byte(0x02,OLED_CMD);//
      00A491 4B 00            [ 1]  770 	push	#0x00
      00A493 4B 02            [ 1]  771 	push	#0x02
      00A495 CD A0 AD         [ 4]  772 	call	_OLED_WR_Byte
      00A498 5B 02            [ 2]  773 	addw	sp, #2
                                    774 ;	driver/oled.c: 316: OLED_WR_Byte(0x8D,OLED_CMD);//--set Charge Pump enable/disable
      00A49A 4B 00            [ 1]  775 	push	#0x00
      00A49C 4B 8D            [ 1]  776 	push	#0x8d
      00A49E CD A0 AD         [ 4]  777 	call	_OLED_WR_Byte
      00A4A1 5B 02            [ 2]  778 	addw	sp, #2
                                    779 ;	driver/oled.c: 317: OLED_WR_Byte(0x14,OLED_CMD);//--set(0x10) disable
      00A4A3 4B 00            [ 1]  780 	push	#0x00
      00A4A5 4B 14            [ 1]  781 	push	#0x14
      00A4A7 CD A0 AD         [ 4]  782 	call	_OLED_WR_Byte
      00A4AA 5B 02            [ 2]  783 	addw	sp, #2
                                    784 ;	driver/oled.c: 318: OLED_WR_Byte(0xA4,OLED_CMD);// Disable Entire Display On (0xa4/0xa5)
      00A4AC 4B 00            [ 1]  785 	push	#0x00
      00A4AE 4B A4            [ 1]  786 	push	#0xa4
      00A4B0 CD A0 AD         [ 4]  787 	call	_OLED_WR_Byte
      00A4B3 5B 02            [ 2]  788 	addw	sp, #2
                                    789 ;	driver/oled.c: 319: OLED_WR_Byte(0xA6,OLED_CMD);// Disable Inverse Display On (0xa6/a7)
      00A4B5 4B 00            [ 1]  790 	push	#0x00
      00A4B7 4B A6            [ 1]  791 	push	#0xa6
      00A4B9 CD A0 AD         [ 4]  792 	call	_OLED_WR_Byte
      00A4BC 5B 02            [ 2]  793 	addw	sp, #2
                                    794 ;	driver/oled.c: 320: OLED_WR_Byte(0xAF,OLED_CMD);//--turn on oled panel
      00A4BE 4B 00            [ 1]  795 	push	#0x00
      00A4C0 4B AF            [ 1]  796 	push	#0xaf
      00A4C2 CD A0 AD         [ 4]  797 	call	_OLED_WR_Byte
      00A4C5 5B 02            [ 2]  798 	addw	sp, #2
                                    799 ;	driver/oled.c: 322: OLED_WR_Byte(0xAF,OLED_CMD); /*display ON*/
      00A4C7 4B 00            [ 1]  800 	push	#0x00
      00A4C9 4B AF            [ 1]  801 	push	#0xaf
      00A4CB CD A0 AD         [ 4]  802 	call	_OLED_WR_Byte
      00A4CE 5B 02            [ 2]  803 	addw	sp, #2
                                    804 ;	driver/oled.c: 323: OLED_Clear();
      00A4D0 CD A1 9F         [ 4]  805 	call	_OLED_Clear
                                    806 ;	driver/oled.c: 324: OLED_Set_Pos(0,0);
      00A4D3 4B 00            [ 1]  807 	push	#0x00
      00A4D5 4B 00            [ 1]  808 	push	#0x00
      00A4D7 CD A1 2A         [ 4]  809 	call	_OLED_Set_Pos
      00A4DA 5B 02            [ 2]  810 	addw	sp, #2
                                    811 ;	driver/oled.c: 325: }
      00A4DC 81               [ 4]  812 	ret
                                    813 	.area CODE
                                    814 	.area CONST
      008105                        815 _F8X16:
      008105 00                     816 	.db #0x00	; 0
      008106 00                     817 	.db #0x00	; 0
      008107 00                     818 	.db #0x00	; 0
      008108 00                     819 	.db #0x00	; 0
      008109 00                     820 	.db #0x00	; 0
      00810A 00                     821 	.db #0x00	; 0
      00810B 00                     822 	.db #0x00	; 0
      00810C 00                     823 	.db #0x00	; 0
      00810D 00                     824 	.db #0x00	; 0
      00810E 00                     825 	.db #0x00	; 0
      00810F 00                     826 	.db #0x00	; 0
      008110 00                     827 	.db #0x00	; 0
      008111 00                     828 	.db #0x00	; 0
      008112 00                     829 	.db #0x00	; 0
      008113 00                     830 	.db #0x00	; 0
      008114 00                     831 	.db #0x00	; 0
      008115 00                     832 	.db #0x00	; 0
      008116 00                     833 	.db #0x00	; 0
      008117 00                     834 	.db #0x00	; 0
      008118 F8                     835 	.db #0xf8	; 248
      008119 00                     836 	.db #0x00	; 0
      00811A 00                     837 	.db #0x00	; 0
      00811B 00                     838 	.db #0x00	; 0
      00811C 00                     839 	.db #0x00	; 0
      00811D 00                     840 	.db #0x00	; 0
      00811E 00                     841 	.db #0x00	; 0
      00811F 00                     842 	.db #0x00	; 0
      008120 33                     843 	.db #0x33	; 51	'3'
      008121 30                     844 	.db #0x30	; 48	'0'
      008122 00                     845 	.db #0x00	; 0
      008123 00                     846 	.db #0x00	; 0
      008124 00                     847 	.db #0x00	; 0
      008125 00                     848 	.db #0x00	; 0
      008126 10                     849 	.db #0x10	; 16
      008127 0C                     850 	.db #0x0c	; 12
      008128 06                     851 	.db #0x06	; 6
      008129 10                     852 	.db #0x10	; 16
      00812A 0C                     853 	.db #0x0c	; 12
      00812B 06                     854 	.db #0x06	; 6
      00812C 00                     855 	.db #0x00	; 0
      00812D 00                     856 	.db #0x00	; 0
      00812E 00                     857 	.db #0x00	; 0
      00812F 00                     858 	.db #0x00	; 0
      008130 00                     859 	.db #0x00	; 0
      008131 00                     860 	.db #0x00	; 0
      008132 00                     861 	.db #0x00	; 0
      008133 00                     862 	.db #0x00	; 0
      008134 00                     863 	.db #0x00	; 0
      008135 40                     864 	.db #0x40	; 64
      008136 C0                     865 	.db #0xc0	; 192
      008137 78                     866 	.db #0x78	; 120	'x'
      008138 40                     867 	.db #0x40	; 64
      008139 C0                     868 	.db #0xc0	; 192
      00813A 78                     869 	.db #0x78	; 120	'x'
      00813B 40                     870 	.db #0x40	; 64
      00813C 00                     871 	.db #0x00	; 0
      00813D 04                     872 	.db #0x04	; 4
      00813E 3F                     873 	.db #0x3f	; 63
      00813F 04                     874 	.db #0x04	; 4
      008140 04                     875 	.db #0x04	; 4
      008141 3F                     876 	.db #0x3f	; 63
      008142 04                     877 	.db #0x04	; 4
      008143 04                     878 	.db #0x04	; 4
      008144 00                     879 	.db #0x00	; 0
      008145 00                     880 	.db #0x00	; 0
      008146 70                     881 	.db #0x70	; 112	'p'
      008147 88                     882 	.db #0x88	; 136
      008148 FC                     883 	.db #0xfc	; 252
      008149 08                     884 	.db #0x08	; 8
      00814A 30                     885 	.db #0x30	; 48	'0'
      00814B 00                     886 	.db #0x00	; 0
      00814C 00                     887 	.db #0x00	; 0
      00814D 00                     888 	.db #0x00	; 0
      00814E 18                     889 	.db #0x18	; 24
      00814F 20                     890 	.db #0x20	; 32
      008150 FF                     891 	.db #0xff	; 255
      008151 21                     892 	.db #0x21	; 33
      008152 1E                     893 	.db #0x1e	; 30
      008153 00                     894 	.db #0x00	; 0
      008154 00                     895 	.db #0x00	; 0
      008155 F0                     896 	.db #0xf0	; 240
      008156 08                     897 	.db #0x08	; 8
      008157 F0                     898 	.db #0xf0	; 240
      008158 00                     899 	.db #0x00	; 0
      008159 E0                     900 	.db #0xe0	; 224
      00815A 18                     901 	.db #0x18	; 24
      00815B 00                     902 	.db #0x00	; 0
      00815C 00                     903 	.db #0x00	; 0
      00815D 00                     904 	.db #0x00	; 0
      00815E 21                     905 	.db #0x21	; 33
      00815F 1C                     906 	.db #0x1c	; 28
      008160 03                     907 	.db #0x03	; 3
      008161 1E                     908 	.db #0x1e	; 30
      008162 21                     909 	.db #0x21	; 33
      008163 1E                     910 	.db #0x1e	; 30
      008164 00                     911 	.db #0x00	; 0
      008165 00                     912 	.db #0x00	; 0
      008166 F0                     913 	.db #0xf0	; 240
      008167 08                     914 	.db #0x08	; 8
      008168 88                     915 	.db #0x88	; 136
      008169 70                     916 	.db #0x70	; 112	'p'
      00816A 00                     917 	.db #0x00	; 0
      00816B 00                     918 	.db #0x00	; 0
      00816C 00                     919 	.db #0x00	; 0
      00816D 1E                     920 	.db #0x1e	; 30
      00816E 21                     921 	.db #0x21	; 33
      00816F 23                     922 	.db #0x23	; 35
      008170 24                     923 	.db #0x24	; 36
      008171 19                     924 	.db #0x19	; 25
      008172 27                     925 	.db #0x27	; 39
      008173 21                     926 	.db #0x21	; 33
      008174 10                     927 	.db #0x10	; 16
      008175 10                     928 	.db #0x10	; 16
      008176 16                     929 	.db #0x16	; 22
      008177 0E                     930 	.db #0x0e	; 14
      008178 00                     931 	.db #0x00	; 0
      008179 00                     932 	.db #0x00	; 0
      00817A 00                     933 	.db #0x00	; 0
      00817B 00                     934 	.db #0x00	; 0
      00817C 00                     935 	.db #0x00	; 0
      00817D 00                     936 	.db #0x00	; 0
      00817E 00                     937 	.db #0x00	; 0
      00817F 00                     938 	.db #0x00	; 0
      008180 00                     939 	.db #0x00	; 0
      008181 00                     940 	.db #0x00	; 0
      008182 00                     941 	.db #0x00	; 0
      008183 00                     942 	.db #0x00	; 0
      008184 00                     943 	.db #0x00	; 0
      008185 00                     944 	.db #0x00	; 0
      008186 00                     945 	.db #0x00	; 0
      008187 00                     946 	.db #0x00	; 0
      008188 E0                     947 	.db #0xe0	; 224
      008189 18                     948 	.db #0x18	; 24
      00818A 04                     949 	.db #0x04	; 4
      00818B 02                     950 	.db #0x02	; 2
      00818C 00                     951 	.db #0x00	; 0
      00818D 00                     952 	.db #0x00	; 0
      00818E 00                     953 	.db #0x00	; 0
      00818F 00                     954 	.db #0x00	; 0
      008190 07                     955 	.db #0x07	; 7
      008191 18                     956 	.db #0x18	; 24
      008192 20                     957 	.db #0x20	; 32
      008193 40                     958 	.db #0x40	; 64
      008194 00                     959 	.db #0x00	; 0
      008195 00                     960 	.db #0x00	; 0
      008196 02                     961 	.db #0x02	; 2
      008197 04                     962 	.db #0x04	; 4
      008198 18                     963 	.db #0x18	; 24
      008199 E0                     964 	.db #0xe0	; 224
      00819A 00                     965 	.db #0x00	; 0
      00819B 00                     966 	.db #0x00	; 0
      00819C 00                     967 	.db #0x00	; 0
      00819D 00                     968 	.db #0x00	; 0
      00819E 40                     969 	.db #0x40	; 64
      00819F 20                     970 	.db #0x20	; 32
      0081A0 18                     971 	.db #0x18	; 24
      0081A1 07                     972 	.db #0x07	; 7
      0081A2 00                     973 	.db #0x00	; 0
      0081A3 00                     974 	.db #0x00	; 0
      0081A4 00                     975 	.db #0x00	; 0
      0081A5 40                     976 	.db #0x40	; 64
      0081A6 40                     977 	.db #0x40	; 64
      0081A7 80                     978 	.db #0x80	; 128
      0081A8 F0                     979 	.db #0xf0	; 240
      0081A9 80                     980 	.db #0x80	; 128
      0081AA 40                     981 	.db #0x40	; 64
      0081AB 40                     982 	.db #0x40	; 64
      0081AC 00                     983 	.db #0x00	; 0
      0081AD 02                     984 	.db #0x02	; 2
      0081AE 02                     985 	.db #0x02	; 2
      0081AF 01                     986 	.db #0x01	; 1
      0081B0 0F                     987 	.db #0x0f	; 15
      0081B1 01                     988 	.db #0x01	; 1
      0081B2 02                     989 	.db #0x02	; 2
      0081B3 02                     990 	.db #0x02	; 2
      0081B4 00                     991 	.db #0x00	; 0
      0081B5 00                     992 	.db #0x00	; 0
      0081B6 00                     993 	.db #0x00	; 0
      0081B7 00                     994 	.db #0x00	; 0
      0081B8 F0                     995 	.db #0xf0	; 240
      0081B9 00                     996 	.db #0x00	; 0
      0081BA 00                     997 	.db #0x00	; 0
      0081BB 00                     998 	.db #0x00	; 0
      0081BC 00                     999 	.db #0x00	; 0
      0081BD 01                    1000 	.db #0x01	; 1
      0081BE 01                    1001 	.db #0x01	; 1
      0081BF 01                    1002 	.db #0x01	; 1
      0081C0 1F                    1003 	.db #0x1f	; 31
      0081C1 01                    1004 	.db #0x01	; 1
      0081C2 01                    1005 	.db #0x01	; 1
      0081C3 01                    1006 	.db #0x01	; 1
      0081C4 00                    1007 	.db #0x00	; 0
      0081C5 00                    1008 	.db #0x00	; 0
      0081C6 00                    1009 	.db #0x00	; 0
      0081C7 00                    1010 	.db #0x00	; 0
      0081C8 00                    1011 	.db #0x00	; 0
      0081C9 00                    1012 	.db #0x00	; 0
      0081CA 00                    1013 	.db #0x00	; 0
      0081CB 00                    1014 	.db #0x00	; 0
      0081CC 00                    1015 	.db #0x00	; 0
      0081CD 80                    1016 	.db #0x80	; 128
      0081CE B0                    1017 	.db #0xb0	; 176
      0081CF 70                    1018 	.db #0x70	; 112	'p'
      0081D0 00                    1019 	.db #0x00	; 0
      0081D1 00                    1020 	.db #0x00	; 0
      0081D2 00                    1021 	.db #0x00	; 0
      0081D3 00                    1022 	.db #0x00	; 0
      0081D4 00                    1023 	.db #0x00	; 0
      0081D5 00                    1024 	.db #0x00	; 0
      0081D6 00                    1025 	.db #0x00	; 0
      0081D7 00                    1026 	.db #0x00	; 0
      0081D8 00                    1027 	.db #0x00	; 0
      0081D9 00                    1028 	.db #0x00	; 0
      0081DA 00                    1029 	.db #0x00	; 0
      0081DB 00                    1030 	.db #0x00	; 0
      0081DC 00                    1031 	.db #0x00	; 0
      0081DD 00                    1032 	.db #0x00	; 0
      0081DE 01                    1033 	.db #0x01	; 1
      0081DF 01                    1034 	.db #0x01	; 1
      0081E0 01                    1035 	.db #0x01	; 1
      0081E1 01                    1036 	.db #0x01	; 1
      0081E2 01                    1037 	.db #0x01	; 1
      0081E3 01                    1038 	.db #0x01	; 1
      0081E4 01                    1039 	.db #0x01	; 1
      0081E5 00                    1040 	.db #0x00	; 0
      0081E6 00                    1041 	.db #0x00	; 0
      0081E7 00                    1042 	.db #0x00	; 0
      0081E8 00                    1043 	.db #0x00	; 0
      0081E9 00                    1044 	.db #0x00	; 0
      0081EA 00                    1045 	.db #0x00	; 0
      0081EB 00                    1046 	.db #0x00	; 0
      0081EC 00                    1047 	.db #0x00	; 0
      0081ED 00                    1048 	.db #0x00	; 0
      0081EE 30                    1049 	.db #0x30	; 48	'0'
      0081EF 30                    1050 	.db #0x30	; 48	'0'
      0081F0 00                    1051 	.db #0x00	; 0
      0081F1 00                    1052 	.db #0x00	; 0
      0081F2 00                    1053 	.db #0x00	; 0
      0081F3 00                    1054 	.db #0x00	; 0
      0081F4 00                    1055 	.db #0x00	; 0
      0081F5 00                    1056 	.db #0x00	; 0
      0081F6 00                    1057 	.db #0x00	; 0
      0081F7 00                    1058 	.db #0x00	; 0
      0081F8 00                    1059 	.db #0x00	; 0
      0081F9 80                    1060 	.db #0x80	; 128
      0081FA 60                    1061 	.db #0x60	; 96
      0081FB 18                    1062 	.db #0x18	; 24
      0081FC 04                    1063 	.db #0x04	; 4
      0081FD 00                    1064 	.db #0x00	; 0
      0081FE 60                    1065 	.db #0x60	; 96
      0081FF 18                    1066 	.db #0x18	; 24
      008200 06                    1067 	.db #0x06	; 6
      008201 01                    1068 	.db #0x01	; 1
      008202 00                    1069 	.db #0x00	; 0
      008203 00                    1070 	.db #0x00	; 0
      008204 00                    1071 	.db #0x00	; 0
      008205 00                    1072 	.db #0x00	; 0
      008206 E0                    1073 	.db #0xe0	; 224
      008207 10                    1074 	.db #0x10	; 16
      008208 08                    1075 	.db #0x08	; 8
      008209 08                    1076 	.db #0x08	; 8
      00820A 10                    1077 	.db #0x10	; 16
      00820B E0                    1078 	.db #0xe0	; 224
      00820C 00                    1079 	.db #0x00	; 0
      00820D 00                    1080 	.db #0x00	; 0
      00820E 0F                    1081 	.db #0x0f	; 15
      00820F 10                    1082 	.db #0x10	; 16
      008210 20                    1083 	.db #0x20	; 32
      008211 20                    1084 	.db #0x20	; 32
      008212 10                    1085 	.db #0x10	; 16
      008213 0F                    1086 	.db #0x0f	; 15
      008214 00                    1087 	.db #0x00	; 0
      008215 00                    1088 	.db #0x00	; 0
      008216 10                    1089 	.db #0x10	; 16
      008217 10                    1090 	.db #0x10	; 16
      008218 F8                    1091 	.db #0xf8	; 248
      008219 00                    1092 	.db #0x00	; 0
      00821A 00                    1093 	.db #0x00	; 0
      00821B 00                    1094 	.db #0x00	; 0
      00821C 00                    1095 	.db #0x00	; 0
      00821D 00                    1096 	.db #0x00	; 0
      00821E 20                    1097 	.db #0x20	; 32
      00821F 20                    1098 	.db #0x20	; 32
      008220 3F                    1099 	.db #0x3f	; 63
      008221 20                    1100 	.db #0x20	; 32
      008222 20                    1101 	.db #0x20	; 32
      008223 00                    1102 	.db #0x00	; 0
      008224 00                    1103 	.db #0x00	; 0
      008225 00                    1104 	.db #0x00	; 0
      008226 70                    1105 	.db #0x70	; 112	'p'
      008227 08                    1106 	.db #0x08	; 8
      008228 08                    1107 	.db #0x08	; 8
      008229 08                    1108 	.db #0x08	; 8
      00822A 88                    1109 	.db #0x88	; 136
      00822B 70                    1110 	.db #0x70	; 112	'p'
      00822C 00                    1111 	.db #0x00	; 0
      00822D 00                    1112 	.db #0x00	; 0
      00822E 30                    1113 	.db #0x30	; 48	'0'
      00822F 28                    1114 	.db #0x28	; 40
      008230 24                    1115 	.db #0x24	; 36
      008231 22                    1116 	.db #0x22	; 34
      008232 21                    1117 	.db #0x21	; 33
      008233 30                    1118 	.db #0x30	; 48	'0'
      008234 00                    1119 	.db #0x00	; 0
      008235 00                    1120 	.db #0x00	; 0
      008236 30                    1121 	.db #0x30	; 48	'0'
      008237 08                    1122 	.db #0x08	; 8
      008238 88                    1123 	.db #0x88	; 136
      008239 88                    1124 	.db #0x88	; 136
      00823A 48                    1125 	.db #0x48	; 72	'H'
      00823B 30                    1126 	.db #0x30	; 48	'0'
      00823C 00                    1127 	.db #0x00	; 0
      00823D 00                    1128 	.db #0x00	; 0
      00823E 18                    1129 	.db #0x18	; 24
      00823F 20                    1130 	.db #0x20	; 32
      008240 20                    1131 	.db #0x20	; 32
      008241 20                    1132 	.db #0x20	; 32
      008242 11                    1133 	.db #0x11	; 17
      008243 0E                    1134 	.db #0x0e	; 14
      008244 00                    1135 	.db #0x00	; 0
      008245 00                    1136 	.db #0x00	; 0
      008246 00                    1137 	.db #0x00	; 0
      008247 C0                    1138 	.db #0xc0	; 192
      008248 20                    1139 	.db #0x20	; 32
      008249 10                    1140 	.db #0x10	; 16
      00824A F8                    1141 	.db #0xf8	; 248
      00824B 00                    1142 	.db #0x00	; 0
      00824C 00                    1143 	.db #0x00	; 0
      00824D 00                    1144 	.db #0x00	; 0
      00824E 07                    1145 	.db #0x07	; 7
      00824F 04                    1146 	.db #0x04	; 4
      008250 24                    1147 	.db #0x24	; 36
      008251 24                    1148 	.db #0x24	; 36
      008252 3F                    1149 	.db #0x3f	; 63
      008253 24                    1150 	.db #0x24	; 36
      008254 00                    1151 	.db #0x00	; 0
      008255 00                    1152 	.db #0x00	; 0
      008256 F8                    1153 	.db #0xf8	; 248
      008257 08                    1154 	.db #0x08	; 8
      008258 88                    1155 	.db #0x88	; 136
      008259 88                    1156 	.db #0x88	; 136
      00825A 08                    1157 	.db #0x08	; 8
      00825B 08                    1158 	.db #0x08	; 8
      00825C 00                    1159 	.db #0x00	; 0
      00825D 00                    1160 	.db #0x00	; 0
      00825E 19                    1161 	.db #0x19	; 25
      00825F 21                    1162 	.db #0x21	; 33
      008260 20                    1163 	.db #0x20	; 32
      008261 20                    1164 	.db #0x20	; 32
      008262 11                    1165 	.db #0x11	; 17
      008263 0E                    1166 	.db #0x0e	; 14
      008264 00                    1167 	.db #0x00	; 0
      008265 00                    1168 	.db #0x00	; 0
      008266 E0                    1169 	.db #0xe0	; 224
      008267 10                    1170 	.db #0x10	; 16
      008268 88                    1171 	.db #0x88	; 136
      008269 88                    1172 	.db #0x88	; 136
      00826A 18                    1173 	.db #0x18	; 24
      00826B 00                    1174 	.db #0x00	; 0
      00826C 00                    1175 	.db #0x00	; 0
      00826D 00                    1176 	.db #0x00	; 0
      00826E 0F                    1177 	.db #0x0f	; 15
      00826F 11                    1178 	.db #0x11	; 17
      008270 20                    1179 	.db #0x20	; 32
      008271 20                    1180 	.db #0x20	; 32
      008272 11                    1181 	.db #0x11	; 17
      008273 0E                    1182 	.db #0x0e	; 14
      008274 00                    1183 	.db #0x00	; 0
      008275 00                    1184 	.db #0x00	; 0
      008276 38                    1185 	.db #0x38	; 56	'8'
      008277 08                    1186 	.db #0x08	; 8
      008278 08                    1187 	.db #0x08	; 8
      008279 C8                    1188 	.db #0xc8	; 200
      00827A 38                    1189 	.db #0x38	; 56	'8'
      00827B 08                    1190 	.db #0x08	; 8
      00827C 00                    1191 	.db #0x00	; 0
      00827D 00                    1192 	.db #0x00	; 0
      00827E 00                    1193 	.db #0x00	; 0
      00827F 00                    1194 	.db #0x00	; 0
      008280 3F                    1195 	.db #0x3f	; 63
      008281 00                    1196 	.db #0x00	; 0
      008282 00                    1197 	.db #0x00	; 0
      008283 00                    1198 	.db #0x00	; 0
      008284 00                    1199 	.db #0x00	; 0
      008285 00                    1200 	.db #0x00	; 0
      008286 70                    1201 	.db #0x70	; 112	'p'
      008287 88                    1202 	.db #0x88	; 136
      008288 08                    1203 	.db #0x08	; 8
      008289 08                    1204 	.db #0x08	; 8
      00828A 88                    1205 	.db #0x88	; 136
      00828B 70                    1206 	.db #0x70	; 112	'p'
      00828C 00                    1207 	.db #0x00	; 0
      00828D 00                    1208 	.db #0x00	; 0
      00828E 1C                    1209 	.db #0x1c	; 28
      00828F 22                    1210 	.db #0x22	; 34
      008290 21                    1211 	.db #0x21	; 33
      008291 21                    1212 	.db #0x21	; 33
      008292 22                    1213 	.db #0x22	; 34
      008293 1C                    1214 	.db #0x1c	; 28
      008294 00                    1215 	.db #0x00	; 0
      008295 00                    1216 	.db #0x00	; 0
      008296 E0                    1217 	.db #0xe0	; 224
      008297 10                    1218 	.db #0x10	; 16
      008298 08                    1219 	.db #0x08	; 8
      008299 08                    1220 	.db #0x08	; 8
      00829A 10                    1221 	.db #0x10	; 16
      00829B E0                    1222 	.db #0xe0	; 224
      00829C 00                    1223 	.db #0x00	; 0
      00829D 00                    1224 	.db #0x00	; 0
      00829E 00                    1225 	.db #0x00	; 0
      00829F 31                    1226 	.db #0x31	; 49	'1'
      0082A0 22                    1227 	.db #0x22	; 34
      0082A1 22                    1228 	.db #0x22	; 34
      0082A2 11                    1229 	.db #0x11	; 17
      0082A3 0F                    1230 	.db #0x0f	; 15
      0082A4 00                    1231 	.db #0x00	; 0
      0082A5 00                    1232 	.db #0x00	; 0
      0082A6 00                    1233 	.db #0x00	; 0
      0082A7 00                    1234 	.db #0x00	; 0
      0082A8 C0                    1235 	.db #0xc0	; 192
      0082A9 C0                    1236 	.db #0xc0	; 192
      0082AA 00                    1237 	.db #0x00	; 0
      0082AB 00                    1238 	.db #0x00	; 0
      0082AC 00                    1239 	.db #0x00	; 0
      0082AD 00                    1240 	.db #0x00	; 0
      0082AE 00                    1241 	.db #0x00	; 0
      0082AF 00                    1242 	.db #0x00	; 0
      0082B0 30                    1243 	.db #0x30	; 48	'0'
      0082B1 30                    1244 	.db #0x30	; 48	'0'
      0082B2 00                    1245 	.db #0x00	; 0
      0082B3 00                    1246 	.db #0x00	; 0
      0082B4 00                    1247 	.db #0x00	; 0
      0082B5 00                    1248 	.db #0x00	; 0
      0082B6 00                    1249 	.db #0x00	; 0
      0082B7 00                    1250 	.db #0x00	; 0
      0082B8 80                    1251 	.db #0x80	; 128
      0082B9 00                    1252 	.db #0x00	; 0
      0082BA 00                    1253 	.db #0x00	; 0
      0082BB 00                    1254 	.db #0x00	; 0
      0082BC 00                    1255 	.db #0x00	; 0
      0082BD 00                    1256 	.db #0x00	; 0
      0082BE 00                    1257 	.db #0x00	; 0
      0082BF 80                    1258 	.db #0x80	; 128
      0082C0 60                    1259 	.db #0x60	; 96
      0082C1 00                    1260 	.db #0x00	; 0
      0082C2 00                    1261 	.db #0x00	; 0
      0082C3 00                    1262 	.db #0x00	; 0
      0082C4 00                    1263 	.db #0x00	; 0
      0082C5 00                    1264 	.db #0x00	; 0
      0082C6 00                    1265 	.db #0x00	; 0
      0082C7 80                    1266 	.db #0x80	; 128
      0082C8 40                    1267 	.db #0x40	; 64
      0082C9 20                    1268 	.db #0x20	; 32
      0082CA 10                    1269 	.db #0x10	; 16
      0082CB 08                    1270 	.db #0x08	; 8
      0082CC 00                    1271 	.db #0x00	; 0
      0082CD 00                    1272 	.db #0x00	; 0
      0082CE 01                    1273 	.db #0x01	; 1
      0082CF 02                    1274 	.db #0x02	; 2
      0082D0 04                    1275 	.db #0x04	; 4
      0082D1 08                    1276 	.db #0x08	; 8
      0082D2 10                    1277 	.db #0x10	; 16
      0082D3 20                    1278 	.db #0x20	; 32
      0082D4 00                    1279 	.db #0x00	; 0
      0082D5 40                    1280 	.db #0x40	; 64
      0082D6 40                    1281 	.db #0x40	; 64
      0082D7 40                    1282 	.db #0x40	; 64
      0082D8 40                    1283 	.db #0x40	; 64
      0082D9 40                    1284 	.db #0x40	; 64
      0082DA 40                    1285 	.db #0x40	; 64
      0082DB 40                    1286 	.db #0x40	; 64
      0082DC 00                    1287 	.db #0x00	; 0
      0082DD 04                    1288 	.db #0x04	; 4
      0082DE 04                    1289 	.db #0x04	; 4
      0082DF 04                    1290 	.db #0x04	; 4
      0082E0 04                    1291 	.db #0x04	; 4
      0082E1 04                    1292 	.db #0x04	; 4
      0082E2 04                    1293 	.db #0x04	; 4
      0082E3 04                    1294 	.db #0x04	; 4
      0082E4 00                    1295 	.db #0x00	; 0
      0082E5 00                    1296 	.db #0x00	; 0
      0082E6 08                    1297 	.db #0x08	; 8
      0082E7 10                    1298 	.db #0x10	; 16
      0082E8 20                    1299 	.db #0x20	; 32
      0082E9 40                    1300 	.db #0x40	; 64
      0082EA 80                    1301 	.db #0x80	; 128
      0082EB 00                    1302 	.db #0x00	; 0
      0082EC 00                    1303 	.db #0x00	; 0
      0082ED 00                    1304 	.db #0x00	; 0
      0082EE 20                    1305 	.db #0x20	; 32
      0082EF 10                    1306 	.db #0x10	; 16
      0082F0 08                    1307 	.db #0x08	; 8
      0082F1 04                    1308 	.db #0x04	; 4
      0082F2 02                    1309 	.db #0x02	; 2
      0082F3 01                    1310 	.db #0x01	; 1
      0082F4 00                    1311 	.db #0x00	; 0
      0082F5 00                    1312 	.db #0x00	; 0
      0082F6 70                    1313 	.db #0x70	; 112	'p'
      0082F7 48                    1314 	.db #0x48	; 72	'H'
      0082F8 08                    1315 	.db #0x08	; 8
      0082F9 08                    1316 	.db #0x08	; 8
      0082FA 08                    1317 	.db #0x08	; 8
      0082FB F0                    1318 	.db #0xf0	; 240
      0082FC 00                    1319 	.db #0x00	; 0
      0082FD 00                    1320 	.db #0x00	; 0
      0082FE 00                    1321 	.db #0x00	; 0
      0082FF 00                    1322 	.db #0x00	; 0
      008300 30                    1323 	.db #0x30	; 48	'0'
      008301 36                    1324 	.db #0x36	; 54	'6'
      008302 01                    1325 	.db #0x01	; 1
      008303 00                    1326 	.db #0x00	; 0
      008304 00                    1327 	.db #0x00	; 0
      008305 C0                    1328 	.db #0xc0	; 192
      008306 30                    1329 	.db #0x30	; 48	'0'
      008307 C8                    1330 	.db #0xc8	; 200
      008308 28                    1331 	.db #0x28	; 40
      008309 E8                    1332 	.db #0xe8	; 232
      00830A 10                    1333 	.db #0x10	; 16
      00830B E0                    1334 	.db #0xe0	; 224
      00830C 00                    1335 	.db #0x00	; 0
      00830D 07                    1336 	.db #0x07	; 7
      00830E 18                    1337 	.db #0x18	; 24
      00830F 27                    1338 	.db #0x27	; 39
      008310 24                    1339 	.db #0x24	; 36
      008311 23                    1340 	.db #0x23	; 35
      008312 14                    1341 	.db #0x14	; 20
      008313 0B                    1342 	.db #0x0b	; 11
      008314 00                    1343 	.db #0x00	; 0
      008315 00                    1344 	.db #0x00	; 0
      008316 00                    1345 	.db #0x00	; 0
      008317 C0                    1346 	.db #0xc0	; 192
      008318 38                    1347 	.db #0x38	; 56	'8'
      008319 E0                    1348 	.db #0xe0	; 224
      00831A 00                    1349 	.db #0x00	; 0
      00831B 00                    1350 	.db #0x00	; 0
      00831C 00                    1351 	.db #0x00	; 0
      00831D 20                    1352 	.db #0x20	; 32
      00831E 3C                    1353 	.db #0x3c	; 60
      00831F 23                    1354 	.db #0x23	; 35
      008320 02                    1355 	.db #0x02	; 2
      008321 02                    1356 	.db #0x02	; 2
      008322 27                    1357 	.db #0x27	; 39
      008323 38                    1358 	.db #0x38	; 56	'8'
      008324 20                    1359 	.db #0x20	; 32
      008325 08                    1360 	.db #0x08	; 8
      008326 F8                    1361 	.db #0xf8	; 248
      008327 88                    1362 	.db #0x88	; 136
      008328 88                    1363 	.db #0x88	; 136
      008329 88                    1364 	.db #0x88	; 136
      00832A 70                    1365 	.db #0x70	; 112	'p'
      00832B 00                    1366 	.db #0x00	; 0
      00832C 00                    1367 	.db #0x00	; 0
      00832D 20                    1368 	.db #0x20	; 32
      00832E 3F                    1369 	.db #0x3f	; 63
      00832F 20                    1370 	.db #0x20	; 32
      008330 20                    1371 	.db #0x20	; 32
      008331 20                    1372 	.db #0x20	; 32
      008332 11                    1373 	.db #0x11	; 17
      008333 0E                    1374 	.db #0x0e	; 14
      008334 00                    1375 	.db #0x00	; 0
      008335 C0                    1376 	.db #0xc0	; 192
      008336 30                    1377 	.db #0x30	; 48	'0'
      008337 08                    1378 	.db #0x08	; 8
      008338 08                    1379 	.db #0x08	; 8
      008339 08                    1380 	.db #0x08	; 8
      00833A 08                    1381 	.db #0x08	; 8
      00833B 38                    1382 	.db #0x38	; 56	'8'
      00833C 00                    1383 	.db #0x00	; 0
      00833D 07                    1384 	.db #0x07	; 7
      00833E 18                    1385 	.db #0x18	; 24
      00833F 20                    1386 	.db #0x20	; 32
      008340 20                    1387 	.db #0x20	; 32
      008341 20                    1388 	.db #0x20	; 32
      008342 10                    1389 	.db #0x10	; 16
      008343 08                    1390 	.db #0x08	; 8
      008344 00                    1391 	.db #0x00	; 0
      008345 08                    1392 	.db #0x08	; 8
      008346 F8                    1393 	.db #0xf8	; 248
      008347 08                    1394 	.db #0x08	; 8
      008348 08                    1395 	.db #0x08	; 8
      008349 08                    1396 	.db #0x08	; 8
      00834A 10                    1397 	.db #0x10	; 16
      00834B E0                    1398 	.db #0xe0	; 224
      00834C 00                    1399 	.db #0x00	; 0
      00834D 20                    1400 	.db #0x20	; 32
      00834E 3F                    1401 	.db #0x3f	; 63
      00834F 20                    1402 	.db #0x20	; 32
      008350 20                    1403 	.db #0x20	; 32
      008351 20                    1404 	.db #0x20	; 32
      008352 10                    1405 	.db #0x10	; 16
      008353 0F                    1406 	.db #0x0f	; 15
      008354 00                    1407 	.db #0x00	; 0
      008355 08                    1408 	.db #0x08	; 8
      008356 F8                    1409 	.db #0xf8	; 248
      008357 88                    1410 	.db #0x88	; 136
      008358 88                    1411 	.db #0x88	; 136
      008359 E8                    1412 	.db #0xe8	; 232
      00835A 08                    1413 	.db #0x08	; 8
      00835B 10                    1414 	.db #0x10	; 16
      00835C 00                    1415 	.db #0x00	; 0
      00835D 20                    1416 	.db #0x20	; 32
      00835E 3F                    1417 	.db #0x3f	; 63
      00835F 20                    1418 	.db #0x20	; 32
      008360 20                    1419 	.db #0x20	; 32
      008361 23                    1420 	.db #0x23	; 35
      008362 20                    1421 	.db #0x20	; 32
      008363 18                    1422 	.db #0x18	; 24
      008364 00                    1423 	.db #0x00	; 0
      008365 08                    1424 	.db #0x08	; 8
      008366 F8                    1425 	.db #0xf8	; 248
      008367 88                    1426 	.db #0x88	; 136
      008368 88                    1427 	.db #0x88	; 136
      008369 E8                    1428 	.db #0xe8	; 232
      00836A 08                    1429 	.db #0x08	; 8
      00836B 10                    1430 	.db #0x10	; 16
      00836C 00                    1431 	.db #0x00	; 0
      00836D 20                    1432 	.db #0x20	; 32
      00836E 3F                    1433 	.db #0x3f	; 63
      00836F 20                    1434 	.db #0x20	; 32
      008370 00                    1435 	.db #0x00	; 0
      008371 03                    1436 	.db #0x03	; 3
      008372 00                    1437 	.db #0x00	; 0
      008373 00                    1438 	.db #0x00	; 0
      008374 00                    1439 	.db #0x00	; 0
      008375 C0                    1440 	.db #0xc0	; 192
      008376 30                    1441 	.db #0x30	; 48	'0'
      008377 08                    1442 	.db #0x08	; 8
      008378 08                    1443 	.db #0x08	; 8
      008379 08                    1444 	.db #0x08	; 8
      00837A 38                    1445 	.db #0x38	; 56	'8'
      00837B 00                    1446 	.db #0x00	; 0
      00837C 00                    1447 	.db #0x00	; 0
      00837D 07                    1448 	.db #0x07	; 7
      00837E 18                    1449 	.db #0x18	; 24
      00837F 20                    1450 	.db #0x20	; 32
      008380 20                    1451 	.db #0x20	; 32
      008381 22                    1452 	.db #0x22	; 34
      008382 1E                    1453 	.db #0x1e	; 30
      008383 02                    1454 	.db #0x02	; 2
      008384 00                    1455 	.db #0x00	; 0
      008385 08                    1456 	.db #0x08	; 8
      008386 F8                    1457 	.db #0xf8	; 248
      008387 08                    1458 	.db #0x08	; 8
      008388 00                    1459 	.db #0x00	; 0
      008389 00                    1460 	.db #0x00	; 0
      00838A 08                    1461 	.db #0x08	; 8
      00838B F8                    1462 	.db #0xf8	; 248
      00838C 08                    1463 	.db #0x08	; 8
      00838D 20                    1464 	.db #0x20	; 32
      00838E 3F                    1465 	.db #0x3f	; 63
      00838F 21                    1466 	.db #0x21	; 33
      008390 01                    1467 	.db #0x01	; 1
      008391 01                    1468 	.db #0x01	; 1
      008392 21                    1469 	.db #0x21	; 33
      008393 3F                    1470 	.db #0x3f	; 63
      008394 20                    1471 	.db #0x20	; 32
      008395 00                    1472 	.db #0x00	; 0
      008396 08                    1473 	.db #0x08	; 8
      008397 08                    1474 	.db #0x08	; 8
      008398 F8                    1475 	.db #0xf8	; 248
      008399 08                    1476 	.db #0x08	; 8
      00839A 08                    1477 	.db #0x08	; 8
      00839B 00                    1478 	.db #0x00	; 0
      00839C 00                    1479 	.db #0x00	; 0
      00839D 00                    1480 	.db #0x00	; 0
      00839E 20                    1481 	.db #0x20	; 32
      00839F 20                    1482 	.db #0x20	; 32
      0083A0 3F                    1483 	.db #0x3f	; 63
      0083A1 20                    1484 	.db #0x20	; 32
      0083A2 20                    1485 	.db #0x20	; 32
      0083A3 00                    1486 	.db #0x00	; 0
      0083A4 00                    1487 	.db #0x00	; 0
      0083A5 00                    1488 	.db #0x00	; 0
      0083A6 00                    1489 	.db #0x00	; 0
      0083A7 08                    1490 	.db #0x08	; 8
      0083A8 08                    1491 	.db #0x08	; 8
      0083A9 F8                    1492 	.db #0xf8	; 248
      0083AA 08                    1493 	.db #0x08	; 8
      0083AB 08                    1494 	.db #0x08	; 8
      0083AC 00                    1495 	.db #0x00	; 0
      0083AD C0                    1496 	.db #0xc0	; 192
      0083AE 80                    1497 	.db #0x80	; 128
      0083AF 80                    1498 	.db #0x80	; 128
      0083B0 80                    1499 	.db #0x80	; 128
      0083B1 7F                    1500 	.db #0x7f	; 127
      0083B2 00                    1501 	.db #0x00	; 0
      0083B3 00                    1502 	.db #0x00	; 0
      0083B4 00                    1503 	.db #0x00	; 0
      0083B5 08                    1504 	.db #0x08	; 8
      0083B6 F8                    1505 	.db #0xf8	; 248
      0083B7 88                    1506 	.db #0x88	; 136
      0083B8 C0                    1507 	.db #0xc0	; 192
      0083B9 28                    1508 	.db #0x28	; 40
      0083BA 18                    1509 	.db #0x18	; 24
      0083BB 08                    1510 	.db #0x08	; 8
      0083BC 00                    1511 	.db #0x00	; 0
      0083BD 20                    1512 	.db #0x20	; 32
      0083BE 3F                    1513 	.db #0x3f	; 63
      0083BF 20                    1514 	.db #0x20	; 32
      0083C0 01                    1515 	.db #0x01	; 1
      0083C1 26                    1516 	.db #0x26	; 38
      0083C2 38                    1517 	.db #0x38	; 56	'8'
      0083C3 20                    1518 	.db #0x20	; 32
      0083C4 00                    1519 	.db #0x00	; 0
      0083C5 08                    1520 	.db #0x08	; 8
      0083C6 F8                    1521 	.db #0xf8	; 248
      0083C7 08                    1522 	.db #0x08	; 8
      0083C8 00                    1523 	.db #0x00	; 0
      0083C9 00                    1524 	.db #0x00	; 0
      0083CA 00                    1525 	.db #0x00	; 0
      0083CB 00                    1526 	.db #0x00	; 0
      0083CC 00                    1527 	.db #0x00	; 0
      0083CD 20                    1528 	.db #0x20	; 32
      0083CE 3F                    1529 	.db #0x3f	; 63
      0083CF 20                    1530 	.db #0x20	; 32
      0083D0 20                    1531 	.db #0x20	; 32
      0083D1 20                    1532 	.db #0x20	; 32
      0083D2 20                    1533 	.db #0x20	; 32
      0083D3 30                    1534 	.db #0x30	; 48	'0'
      0083D4 00                    1535 	.db #0x00	; 0
      0083D5 08                    1536 	.db #0x08	; 8
      0083D6 F8                    1537 	.db #0xf8	; 248
      0083D7 F8                    1538 	.db #0xf8	; 248
      0083D8 00                    1539 	.db #0x00	; 0
      0083D9 F8                    1540 	.db #0xf8	; 248
      0083DA F8                    1541 	.db #0xf8	; 248
      0083DB 08                    1542 	.db #0x08	; 8
      0083DC 00                    1543 	.db #0x00	; 0
      0083DD 20                    1544 	.db #0x20	; 32
      0083DE 3F                    1545 	.db #0x3f	; 63
      0083DF 00                    1546 	.db #0x00	; 0
      0083E0 3F                    1547 	.db #0x3f	; 63
      0083E1 00                    1548 	.db #0x00	; 0
      0083E2 3F                    1549 	.db #0x3f	; 63
      0083E3 20                    1550 	.db #0x20	; 32
      0083E4 00                    1551 	.db #0x00	; 0
      0083E5 08                    1552 	.db #0x08	; 8
      0083E6 F8                    1553 	.db #0xf8	; 248
      0083E7 30                    1554 	.db #0x30	; 48	'0'
      0083E8 C0                    1555 	.db #0xc0	; 192
      0083E9 00                    1556 	.db #0x00	; 0
      0083EA 08                    1557 	.db #0x08	; 8
      0083EB F8                    1558 	.db #0xf8	; 248
      0083EC 08                    1559 	.db #0x08	; 8
      0083ED 20                    1560 	.db #0x20	; 32
      0083EE 3F                    1561 	.db #0x3f	; 63
      0083EF 20                    1562 	.db #0x20	; 32
      0083F0 00                    1563 	.db #0x00	; 0
      0083F1 07                    1564 	.db #0x07	; 7
      0083F2 18                    1565 	.db #0x18	; 24
      0083F3 3F                    1566 	.db #0x3f	; 63
      0083F4 00                    1567 	.db #0x00	; 0
      0083F5 E0                    1568 	.db #0xe0	; 224
      0083F6 10                    1569 	.db #0x10	; 16
      0083F7 08                    1570 	.db #0x08	; 8
      0083F8 08                    1571 	.db #0x08	; 8
      0083F9 08                    1572 	.db #0x08	; 8
      0083FA 10                    1573 	.db #0x10	; 16
      0083FB E0                    1574 	.db #0xe0	; 224
      0083FC 00                    1575 	.db #0x00	; 0
      0083FD 0F                    1576 	.db #0x0f	; 15
      0083FE 10                    1577 	.db #0x10	; 16
      0083FF 20                    1578 	.db #0x20	; 32
      008400 20                    1579 	.db #0x20	; 32
      008401 20                    1580 	.db #0x20	; 32
      008402 10                    1581 	.db #0x10	; 16
      008403 0F                    1582 	.db #0x0f	; 15
      008404 00                    1583 	.db #0x00	; 0
      008405 08                    1584 	.db #0x08	; 8
      008406 F8                    1585 	.db #0xf8	; 248
      008407 08                    1586 	.db #0x08	; 8
      008408 08                    1587 	.db #0x08	; 8
      008409 08                    1588 	.db #0x08	; 8
      00840A 08                    1589 	.db #0x08	; 8
      00840B F0                    1590 	.db #0xf0	; 240
      00840C 00                    1591 	.db #0x00	; 0
      00840D 20                    1592 	.db #0x20	; 32
      00840E 3F                    1593 	.db #0x3f	; 63
      00840F 21                    1594 	.db #0x21	; 33
      008410 01                    1595 	.db #0x01	; 1
      008411 01                    1596 	.db #0x01	; 1
      008412 01                    1597 	.db #0x01	; 1
      008413 00                    1598 	.db #0x00	; 0
      008414 00                    1599 	.db #0x00	; 0
      008415 E0                    1600 	.db #0xe0	; 224
      008416 10                    1601 	.db #0x10	; 16
      008417 08                    1602 	.db #0x08	; 8
      008418 08                    1603 	.db #0x08	; 8
      008419 08                    1604 	.db #0x08	; 8
      00841A 10                    1605 	.db #0x10	; 16
      00841B E0                    1606 	.db #0xe0	; 224
      00841C 00                    1607 	.db #0x00	; 0
      00841D 0F                    1608 	.db #0x0f	; 15
      00841E 18                    1609 	.db #0x18	; 24
      00841F 24                    1610 	.db #0x24	; 36
      008420 24                    1611 	.db #0x24	; 36
      008421 38                    1612 	.db #0x38	; 56	'8'
      008422 50                    1613 	.db #0x50	; 80	'P'
      008423 4F                    1614 	.db #0x4f	; 79	'O'
      008424 00                    1615 	.db #0x00	; 0
      008425 08                    1616 	.db #0x08	; 8
      008426 F8                    1617 	.db #0xf8	; 248
      008427 88                    1618 	.db #0x88	; 136
      008428 88                    1619 	.db #0x88	; 136
      008429 88                    1620 	.db #0x88	; 136
      00842A 88                    1621 	.db #0x88	; 136
      00842B 70                    1622 	.db #0x70	; 112	'p'
      00842C 00                    1623 	.db #0x00	; 0
      00842D 20                    1624 	.db #0x20	; 32
      00842E 3F                    1625 	.db #0x3f	; 63
      00842F 20                    1626 	.db #0x20	; 32
      008430 00                    1627 	.db #0x00	; 0
      008431 03                    1628 	.db #0x03	; 3
      008432 0C                    1629 	.db #0x0c	; 12
      008433 30                    1630 	.db #0x30	; 48	'0'
      008434 20                    1631 	.db #0x20	; 32
      008435 00                    1632 	.db #0x00	; 0
      008436 70                    1633 	.db #0x70	; 112	'p'
      008437 88                    1634 	.db #0x88	; 136
      008438 08                    1635 	.db #0x08	; 8
      008439 08                    1636 	.db #0x08	; 8
      00843A 08                    1637 	.db #0x08	; 8
      00843B 38                    1638 	.db #0x38	; 56	'8'
      00843C 00                    1639 	.db #0x00	; 0
      00843D 00                    1640 	.db #0x00	; 0
      00843E 38                    1641 	.db #0x38	; 56	'8'
      00843F 20                    1642 	.db #0x20	; 32
      008440 21                    1643 	.db #0x21	; 33
      008441 21                    1644 	.db #0x21	; 33
      008442 22                    1645 	.db #0x22	; 34
      008443 1C                    1646 	.db #0x1c	; 28
      008444 00                    1647 	.db #0x00	; 0
      008445 18                    1648 	.db #0x18	; 24
      008446 08                    1649 	.db #0x08	; 8
      008447 08                    1650 	.db #0x08	; 8
      008448 F8                    1651 	.db #0xf8	; 248
      008449 08                    1652 	.db #0x08	; 8
      00844A 08                    1653 	.db #0x08	; 8
      00844B 18                    1654 	.db #0x18	; 24
      00844C 00                    1655 	.db #0x00	; 0
      00844D 00                    1656 	.db #0x00	; 0
      00844E 00                    1657 	.db #0x00	; 0
      00844F 20                    1658 	.db #0x20	; 32
      008450 3F                    1659 	.db #0x3f	; 63
      008451 20                    1660 	.db #0x20	; 32
      008452 00                    1661 	.db #0x00	; 0
      008453 00                    1662 	.db #0x00	; 0
      008454 00                    1663 	.db #0x00	; 0
      008455 08                    1664 	.db #0x08	; 8
      008456 F8                    1665 	.db #0xf8	; 248
      008457 08                    1666 	.db #0x08	; 8
      008458 00                    1667 	.db #0x00	; 0
      008459 00                    1668 	.db #0x00	; 0
      00845A 08                    1669 	.db #0x08	; 8
      00845B F8                    1670 	.db #0xf8	; 248
      00845C 08                    1671 	.db #0x08	; 8
      00845D 00                    1672 	.db #0x00	; 0
      00845E 1F                    1673 	.db #0x1f	; 31
      00845F 20                    1674 	.db #0x20	; 32
      008460 20                    1675 	.db #0x20	; 32
      008461 20                    1676 	.db #0x20	; 32
      008462 20                    1677 	.db #0x20	; 32
      008463 1F                    1678 	.db #0x1f	; 31
      008464 00                    1679 	.db #0x00	; 0
      008465 08                    1680 	.db #0x08	; 8
      008466 78                    1681 	.db #0x78	; 120	'x'
      008467 88                    1682 	.db #0x88	; 136
      008468 00                    1683 	.db #0x00	; 0
      008469 00                    1684 	.db #0x00	; 0
      00846A C8                    1685 	.db #0xc8	; 200
      00846B 38                    1686 	.db #0x38	; 56	'8'
      00846C 08                    1687 	.db #0x08	; 8
      00846D 00                    1688 	.db #0x00	; 0
      00846E 00                    1689 	.db #0x00	; 0
      00846F 07                    1690 	.db #0x07	; 7
      008470 38                    1691 	.db #0x38	; 56	'8'
      008471 0E                    1692 	.db #0x0e	; 14
      008472 01                    1693 	.db #0x01	; 1
      008473 00                    1694 	.db #0x00	; 0
      008474 00                    1695 	.db #0x00	; 0
      008475 F8                    1696 	.db #0xf8	; 248
      008476 08                    1697 	.db #0x08	; 8
      008477 00                    1698 	.db #0x00	; 0
      008478 F8                    1699 	.db #0xf8	; 248
      008479 00                    1700 	.db #0x00	; 0
      00847A 08                    1701 	.db #0x08	; 8
      00847B F8                    1702 	.db #0xf8	; 248
      00847C 00                    1703 	.db #0x00	; 0
      00847D 03                    1704 	.db #0x03	; 3
      00847E 3C                    1705 	.db #0x3c	; 60
      00847F 07                    1706 	.db #0x07	; 7
      008480 00                    1707 	.db #0x00	; 0
      008481 07                    1708 	.db #0x07	; 7
      008482 3C                    1709 	.db #0x3c	; 60
      008483 03                    1710 	.db #0x03	; 3
      008484 00                    1711 	.db #0x00	; 0
      008485 08                    1712 	.db #0x08	; 8
      008486 18                    1713 	.db #0x18	; 24
      008487 68                    1714 	.db #0x68	; 104	'h'
      008488 80                    1715 	.db #0x80	; 128
      008489 80                    1716 	.db #0x80	; 128
      00848A 68                    1717 	.db #0x68	; 104	'h'
      00848B 18                    1718 	.db #0x18	; 24
      00848C 08                    1719 	.db #0x08	; 8
      00848D 20                    1720 	.db #0x20	; 32
      00848E 30                    1721 	.db #0x30	; 48	'0'
      00848F 2C                    1722 	.db #0x2c	; 44
      008490 03                    1723 	.db #0x03	; 3
      008491 03                    1724 	.db #0x03	; 3
      008492 2C                    1725 	.db #0x2c	; 44
      008493 30                    1726 	.db #0x30	; 48	'0'
      008494 20                    1727 	.db #0x20	; 32
      008495 08                    1728 	.db #0x08	; 8
      008496 38                    1729 	.db #0x38	; 56	'8'
      008497 C8                    1730 	.db #0xc8	; 200
      008498 00                    1731 	.db #0x00	; 0
      008499 C8                    1732 	.db #0xc8	; 200
      00849A 38                    1733 	.db #0x38	; 56	'8'
      00849B 08                    1734 	.db #0x08	; 8
      00849C 00                    1735 	.db #0x00	; 0
      00849D 00                    1736 	.db #0x00	; 0
      00849E 00                    1737 	.db #0x00	; 0
      00849F 20                    1738 	.db #0x20	; 32
      0084A0 3F                    1739 	.db #0x3f	; 63
      0084A1 20                    1740 	.db #0x20	; 32
      0084A2 00                    1741 	.db #0x00	; 0
      0084A3 00                    1742 	.db #0x00	; 0
      0084A4 00                    1743 	.db #0x00	; 0
      0084A5 10                    1744 	.db #0x10	; 16
      0084A6 08                    1745 	.db #0x08	; 8
      0084A7 08                    1746 	.db #0x08	; 8
      0084A8 08                    1747 	.db #0x08	; 8
      0084A9 C8                    1748 	.db #0xc8	; 200
      0084AA 38                    1749 	.db #0x38	; 56	'8'
      0084AB 08                    1750 	.db #0x08	; 8
      0084AC 00                    1751 	.db #0x00	; 0
      0084AD 20                    1752 	.db #0x20	; 32
      0084AE 38                    1753 	.db #0x38	; 56	'8'
      0084AF 26                    1754 	.db #0x26	; 38
      0084B0 21                    1755 	.db #0x21	; 33
      0084B1 20                    1756 	.db #0x20	; 32
      0084B2 20                    1757 	.db #0x20	; 32
      0084B3 18                    1758 	.db #0x18	; 24
      0084B4 00                    1759 	.db #0x00	; 0
      0084B5 00                    1760 	.db #0x00	; 0
      0084B6 00                    1761 	.db #0x00	; 0
      0084B7 00                    1762 	.db #0x00	; 0
      0084B8 FE                    1763 	.db #0xfe	; 254
      0084B9 02                    1764 	.db #0x02	; 2
      0084BA 02                    1765 	.db #0x02	; 2
      0084BB 02                    1766 	.db #0x02	; 2
      0084BC 00                    1767 	.db #0x00	; 0
      0084BD 00                    1768 	.db #0x00	; 0
      0084BE 00                    1769 	.db #0x00	; 0
      0084BF 00                    1770 	.db #0x00	; 0
      0084C0 7F                    1771 	.db #0x7f	; 127
      0084C1 40                    1772 	.db #0x40	; 64
      0084C2 40                    1773 	.db #0x40	; 64
      0084C3 40                    1774 	.db #0x40	; 64
      0084C4 00                    1775 	.db #0x00	; 0
      0084C5 00                    1776 	.db #0x00	; 0
      0084C6 0C                    1777 	.db #0x0c	; 12
      0084C7 30                    1778 	.db #0x30	; 48	'0'
      0084C8 C0                    1779 	.db #0xc0	; 192
      0084C9 00                    1780 	.db #0x00	; 0
      0084CA 00                    1781 	.db #0x00	; 0
      0084CB 00                    1782 	.db #0x00	; 0
      0084CC 00                    1783 	.db #0x00	; 0
      0084CD 00                    1784 	.db #0x00	; 0
      0084CE 00                    1785 	.db #0x00	; 0
      0084CF 00                    1786 	.db #0x00	; 0
      0084D0 01                    1787 	.db #0x01	; 1
      0084D1 06                    1788 	.db #0x06	; 6
      0084D2 38                    1789 	.db #0x38	; 56	'8'
      0084D3 C0                    1790 	.db #0xc0	; 192
      0084D4 00                    1791 	.db #0x00	; 0
      0084D5 00                    1792 	.db #0x00	; 0
      0084D6 02                    1793 	.db #0x02	; 2
      0084D7 02                    1794 	.db #0x02	; 2
      0084D8 02                    1795 	.db #0x02	; 2
      0084D9 FE                    1796 	.db #0xfe	; 254
      0084DA 00                    1797 	.db #0x00	; 0
      0084DB 00                    1798 	.db #0x00	; 0
      0084DC 00                    1799 	.db #0x00	; 0
      0084DD 00                    1800 	.db #0x00	; 0
      0084DE 40                    1801 	.db #0x40	; 64
      0084DF 40                    1802 	.db #0x40	; 64
      0084E0 40                    1803 	.db #0x40	; 64
      0084E1 7F                    1804 	.db #0x7f	; 127
      0084E2 00                    1805 	.db #0x00	; 0
      0084E3 00                    1806 	.db #0x00	; 0
      0084E4 00                    1807 	.db #0x00	; 0
      0084E5 00                    1808 	.db #0x00	; 0
      0084E6 00                    1809 	.db #0x00	; 0
      0084E7 04                    1810 	.db #0x04	; 4
      0084E8 02                    1811 	.db #0x02	; 2
      0084E9 02                    1812 	.db #0x02	; 2
      0084EA 02                    1813 	.db #0x02	; 2
      0084EB 04                    1814 	.db #0x04	; 4
      0084EC 00                    1815 	.db #0x00	; 0
      0084ED 00                    1816 	.db #0x00	; 0
      0084EE 00                    1817 	.db #0x00	; 0
      0084EF 00                    1818 	.db #0x00	; 0
      0084F0 00                    1819 	.db #0x00	; 0
      0084F1 00                    1820 	.db #0x00	; 0
      0084F2 00                    1821 	.db #0x00	; 0
      0084F3 00                    1822 	.db #0x00	; 0
      0084F4 00                    1823 	.db #0x00	; 0
      0084F5 00                    1824 	.db #0x00	; 0
      0084F6 00                    1825 	.db #0x00	; 0
      0084F7 00                    1826 	.db #0x00	; 0
      0084F8 00                    1827 	.db #0x00	; 0
      0084F9 00                    1828 	.db #0x00	; 0
      0084FA 00                    1829 	.db #0x00	; 0
      0084FB 00                    1830 	.db #0x00	; 0
      0084FC 00                    1831 	.db #0x00	; 0
      0084FD 80                    1832 	.db #0x80	; 128
      0084FE 80                    1833 	.db #0x80	; 128
      0084FF 80                    1834 	.db #0x80	; 128
      008500 80                    1835 	.db #0x80	; 128
      008501 80                    1836 	.db #0x80	; 128
      008502 80                    1837 	.db #0x80	; 128
      008503 80                    1838 	.db #0x80	; 128
      008504 80                    1839 	.db #0x80	; 128
      008505 00                    1840 	.db #0x00	; 0
      008506 02                    1841 	.db #0x02	; 2
      008507 02                    1842 	.db #0x02	; 2
      008508 04                    1843 	.db #0x04	; 4
      008509 00                    1844 	.db #0x00	; 0
      00850A 00                    1845 	.db #0x00	; 0
      00850B 00                    1846 	.db #0x00	; 0
      00850C 00                    1847 	.db #0x00	; 0
      00850D 00                    1848 	.db #0x00	; 0
      00850E 00                    1849 	.db #0x00	; 0
      00850F 00                    1850 	.db #0x00	; 0
      008510 00                    1851 	.db #0x00	; 0
      008511 00                    1852 	.db #0x00	; 0
      008512 00                    1853 	.db #0x00	; 0
      008513 00                    1854 	.db #0x00	; 0
      008514 00                    1855 	.db #0x00	; 0
      008515 00                    1856 	.db #0x00	; 0
      008516 00                    1857 	.db #0x00	; 0
      008517 80                    1858 	.db #0x80	; 128
      008518 80                    1859 	.db #0x80	; 128
      008519 80                    1860 	.db #0x80	; 128
      00851A 80                    1861 	.db #0x80	; 128
      00851B 00                    1862 	.db #0x00	; 0
      00851C 00                    1863 	.db #0x00	; 0
      00851D 00                    1864 	.db #0x00	; 0
      00851E 19                    1865 	.db #0x19	; 25
      00851F 24                    1866 	.db #0x24	; 36
      008520 22                    1867 	.db #0x22	; 34
      008521 22                    1868 	.db #0x22	; 34
      008522 22                    1869 	.db #0x22	; 34
      008523 3F                    1870 	.db #0x3f	; 63
      008524 20                    1871 	.db #0x20	; 32
      008525 08                    1872 	.db #0x08	; 8
      008526 F8                    1873 	.db #0xf8	; 248
      008527 00                    1874 	.db #0x00	; 0
      008528 80                    1875 	.db #0x80	; 128
      008529 80                    1876 	.db #0x80	; 128
      00852A 00                    1877 	.db #0x00	; 0
      00852B 00                    1878 	.db #0x00	; 0
      00852C 00                    1879 	.db #0x00	; 0
      00852D 00                    1880 	.db #0x00	; 0
      00852E 3F                    1881 	.db #0x3f	; 63
      00852F 11                    1882 	.db #0x11	; 17
      008530 20                    1883 	.db #0x20	; 32
      008531 20                    1884 	.db #0x20	; 32
      008532 11                    1885 	.db #0x11	; 17
      008533 0E                    1886 	.db #0x0e	; 14
      008534 00                    1887 	.db #0x00	; 0
      008535 00                    1888 	.db #0x00	; 0
      008536 00                    1889 	.db #0x00	; 0
      008537 00                    1890 	.db #0x00	; 0
      008538 80                    1891 	.db #0x80	; 128
      008539 80                    1892 	.db #0x80	; 128
      00853A 80                    1893 	.db #0x80	; 128
      00853B 00                    1894 	.db #0x00	; 0
      00853C 00                    1895 	.db #0x00	; 0
      00853D 00                    1896 	.db #0x00	; 0
      00853E 0E                    1897 	.db #0x0e	; 14
      00853F 11                    1898 	.db #0x11	; 17
      008540 20                    1899 	.db #0x20	; 32
      008541 20                    1900 	.db #0x20	; 32
      008542 20                    1901 	.db #0x20	; 32
      008543 11                    1902 	.db #0x11	; 17
      008544 00                    1903 	.db #0x00	; 0
      008545 00                    1904 	.db #0x00	; 0
      008546 00                    1905 	.db #0x00	; 0
      008547 00                    1906 	.db #0x00	; 0
      008548 80                    1907 	.db #0x80	; 128
      008549 80                    1908 	.db #0x80	; 128
      00854A 88                    1909 	.db #0x88	; 136
      00854B F8                    1910 	.db #0xf8	; 248
      00854C 00                    1911 	.db #0x00	; 0
      00854D 00                    1912 	.db #0x00	; 0
      00854E 0E                    1913 	.db #0x0e	; 14
      00854F 11                    1914 	.db #0x11	; 17
      008550 20                    1915 	.db #0x20	; 32
      008551 20                    1916 	.db #0x20	; 32
      008552 10                    1917 	.db #0x10	; 16
      008553 3F                    1918 	.db #0x3f	; 63
      008554 20                    1919 	.db #0x20	; 32
      008555 00                    1920 	.db #0x00	; 0
      008556 00                    1921 	.db #0x00	; 0
      008557 80                    1922 	.db #0x80	; 128
      008558 80                    1923 	.db #0x80	; 128
      008559 80                    1924 	.db #0x80	; 128
      00855A 80                    1925 	.db #0x80	; 128
      00855B 00                    1926 	.db #0x00	; 0
      00855C 00                    1927 	.db #0x00	; 0
      00855D 00                    1928 	.db #0x00	; 0
      00855E 1F                    1929 	.db #0x1f	; 31
      00855F 22                    1930 	.db #0x22	; 34
      008560 22                    1931 	.db #0x22	; 34
      008561 22                    1932 	.db #0x22	; 34
      008562 22                    1933 	.db #0x22	; 34
      008563 13                    1934 	.db #0x13	; 19
      008564 00                    1935 	.db #0x00	; 0
      008565 00                    1936 	.db #0x00	; 0
      008566 80                    1937 	.db #0x80	; 128
      008567 80                    1938 	.db #0x80	; 128
      008568 F0                    1939 	.db #0xf0	; 240
      008569 88                    1940 	.db #0x88	; 136
      00856A 88                    1941 	.db #0x88	; 136
      00856B 88                    1942 	.db #0x88	; 136
      00856C 18                    1943 	.db #0x18	; 24
      00856D 00                    1944 	.db #0x00	; 0
      00856E 20                    1945 	.db #0x20	; 32
      00856F 20                    1946 	.db #0x20	; 32
      008570 3F                    1947 	.db #0x3f	; 63
      008571 20                    1948 	.db #0x20	; 32
      008572 20                    1949 	.db #0x20	; 32
      008573 00                    1950 	.db #0x00	; 0
      008574 00                    1951 	.db #0x00	; 0
      008575 00                    1952 	.db #0x00	; 0
      008576 00                    1953 	.db #0x00	; 0
      008577 80                    1954 	.db #0x80	; 128
      008578 80                    1955 	.db #0x80	; 128
      008579 80                    1956 	.db #0x80	; 128
      00857A 80                    1957 	.db #0x80	; 128
      00857B 80                    1958 	.db #0x80	; 128
      00857C 00                    1959 	.db #0x00	; 0
      00857D 00                    1960 	.db #0x00	; 0
      00857E 6B                    1961 	.db #0x6b	; 107	'k'
      00857F 94                    1962 	.db #0x94	; 148
      008580 94                    1963 	.db #0x94	; 148
      008581 94                    1964 	.db #0x94	; 148
      008582 93                    1965 	.db #0x93	; 147
      008583 60                    1966 	.db #0x60	; 96
      008584 00                    1967 	.db #0x00	; 0
      008585 08                    1968 	.db #0x08	; 8
      008586 F8                    1969 	.db #0xf8	; 248
      008587 00                    1970 	.db #0x00	; 0
      008588 80                    1971 	.db #0x80	; 128
      008589 80                    1972 	.db #0x80	; 128
      00858A 80                    1973 	.db #0x80	; 128
      00858B 00                    1974 	.db #0x00	; 0
      00858C 00                    1975 	.db #0x00	; 0
      00858D 20                    1976 	.db #0x20	; 32
      00858E 3F                    1977 	.db #0x3f	; 63
      00858F 21                    1978 	.db #0x21	; 33
      008590 00                    1979 	.db #0x00	; 0
      008591 00                    1980 	.db #0x00	; 0
      008592 20                    1981 	.db #0x20	; 32
      008593 3F                    1982 	.db #0x3f	; 63
      008594 20                    1983 	.db #0x20	; 32
      008595 00                    1984 	.db #0x00	; 0
      008596 80                    1985 	.db #0x80	; 128
      008597 98                    1986 	.db #0x98	; 152
      008598 98                    1987 	.db #0x98	; 152
      008599 00                    1988 	.db #0x00	; 0
      00859A 00                    1989 	.db #0x00	; 0
      00859B 00                    1990 	.db #0x00	; 0
      00859C 00                    1991 	.db #0x00	; 0
      00859D 00                    1992 	.db #0x00	; 0
      00859E 20                    1993 	.db #0x20	; 32
      00859F 20                    1994 	.db #0x20	; 32
      0085A0 3F                    1995 	.db #0x3f	; 63
      0085A1 20                    1996 	.db #0x20	; 32
      0085A2 20                    1997 	.db #0x20	; 32
      0085A3 00                    1998 	.db #0x00	; 0
      0085A4 00                    1999 	.db #0x00	; 0
      0085A5 00                    2000 	.db #0x00	; 0
      0085A6 00                    2001 	.db #0x00	; 0
      0085A7 00                    2002 	.db #0x00	; 0
      0085A8 80                    2003 	.db #0x80	; 128
      0085A9 98                    2004 	.db #0x98	; 152
      0085AA 98                    2005 	.db #0x98	; 152
      0085AB 00                    2006 	.db #0x00	; 0
      0085AC 00                    2007 	.db #0x00	; 0
      0085AD 00                    2008 	.db #0x00	; 0
      0085AE C0                    2009 	.db #0xc0	; 192
      0085AF 80                    2010 	.db #0x80	; 128
      0085B0 80                    2011 	.db #0x80	; 128
      0085B1 80                    2012 	.db #0x80	; 128
      0085B2 7F                    2013 	.db #0x7f	; 127
      0085B3 00                    2014 	.db #0x00	; 0
      0085B4 00                    2015 	.db #0x00	; 0
      0085B5 08                    2016 	.db #0x08	; 8
      0085B6 F8                    2017 	.db #0xf8	; 248
      0085B7 00                    2018 	.db #0x00	; 0
      0085B8 00                    2019 	.db #0x00	; 0
      0085B9 80                    2020 	.db #0x80	; 128
      0085BA 80                    2021 	.db #0x80	; 128
      0085BB 80                    2022 	.db #0x80	; 128
      0085BC 00                    2023 	.db #0x00	; 0
      0085BD 20                    2024 	.db #0x20	; 32
      0085BE 3F                    2025 	.db #0x3f	; 63
      0085BF 24                    2026 	.db #0x24	; 36
      0085C0 02                    2027 	.db #0x02	; 2
      0085C1 2D                    2028 	.db #0x2d	; 45
      0085C2 30                    2029 	.db #0x30	; 48	'0'
      0085C3 20                    2030 	.db #0x20	; 32
      0085C4 00                    2031 	.db #0x00	; 0
      0085C5 00                    2032 	.db #0x00	; 0
      0085C6 08                    2033 	.db #0x08	; 8
      0085C7 08                    2034 	.db #0x08	; 8
      0085C8 F8                    2035 	.db #0xf8	; 248
      0085C9 00                    2036 	.db #0x00	; 0
      0085CA 00                    2037 	.db #0x00	; 0
      0085CB 00                    2038 	.db #0x00	; 0
      0085CC 00                    2039 	.db #0x00	; 0
      0085CD 00                    2040 	.db #0x00	; 0
      0085CE 20                    2041 	.db #0x20	; 32
      0085CF 20                    2042 	.db #0x20	; 32
      0085D0 3F                    2043 	.db #0x3f	; 63
      0085D1 20                    2044 	.db #0x20	; 32
      0085D2 20                    2045 	.db #0x20	; 32
      0085D3 00                    2046 	.db #0x00	; 0
      0085D4 00                    2047 	.db #0x00	; 0
      0085D5 80                    2048 	.db #0x80	; 128
      0085D6 80                    2049 	.db #0x80	; 128
      0085D7 80                    2050 	.db #0x80	; 128
      0085D8 80                    2051 	.db #0x80	; 128
      0085D9 80                    2052 	.db #0x80	; 128
      0085DA 80                    2053 	.db #0x80	; 128
      0085DB 80                    2054 	.db #0x80	; 128
      0085DC 00                    2055 	.db #0x00	; 0
      0085DD 20                    2056 	.db #0x20	; 32
      0085DE 3F                    2057 	.db #0x3f	; 63
      0085DF 20                    2058 	.db #0x20	; 32
      0085E0 00                    2059 	.db #0x00	; 0
      0085E1 3F                    2060 	.db #0x3f	; 63
      0085E2 20                    2061 	.db #0x20	; 32
      0085E3 00                    2062 	.db #0x00	; 0
      0085E4 3F                    2063 	.db #0x3f	; 63
      0085E5 80                    2064 	.db #0x80	; 128
      0085E6 80                    2065 	.db #0x80	; 128
      0085E7 00                    2066 	.db #0x00	; 0
      0085E8 80                    2067 	.db #0x80	; 128
      0085E9 80                    2068 	.db #0x80	; 128
      0085EA 80                    2069 	.db #0x80	; 128
      0085EB 00                    2070 	.db #0x00	; 0
      0085EC 00                    2071 	.db #0x00	; 0
      0085ED 20                    2072 	.db #0x20	; 32
      0085EE 3F                    2073 	.db #0x3f	; 63
      0085EF 21                    2074 	.db #0x21	; 33
      0085F0 00                    2075 	.db #0x00	; 0
      0085F1 00                    2076 	.db #0x00	; 0
      0085F2 20                    2077 	.db #0x20	; 32
      0085F3 3F                    2078 	.db #0x3f	; 63
      0085F4 20                    2079 	.db #0x20	; 32
      0085F5 00                    2080 	.db #0x00	; 0
      0085F6 00                    2081 	.db #0x00	; 0
      0085F7 80                    2082 	.db #0x80	; 128
      0085F8 80                    2083 	.db #0x80	; 128
      0085F9 80                    2084 	.db #0x80	; 128
      0085FA 80                    2085 	.db #0x80	; 128
      0085FB 00                    2086 	.db #0x00	; 0
      0085FC 00                    2087 	.db #0x00	; 0
      0085FD 00                    2088 	.db #0x00	; 0
      0085FE 1F                    2089 	.db #0x1f	; 31
      0085FF 20                    2090 	.db #0x20	; 32
      008600 20                    2091 	.db #0x20	; 32
      008601 20                    2092 	.db #0x20	; 32
      008602 20                    2093 	.db #0x20	; 32
      008603 1F                    2094 	.db #0x1f	; 31
      008604 00                    2095 	.db #0x00	; 0
      008605 80                    2096 	.db #0x80	; 128
      008606 80                    2097 	.db #0x80	; 128
      008607 00                    2098 	.db #0x00	; 0
      008608 80                    2099 	.db #0x80	; 128
      008609 80                    2100 	.db #0x80	; 128
      00860A 00                    2101 	.db #0x00	; 0
      00860B 00                    2102 	.db #0x00	; 0
      00860C 00                    2103 	.db #0x00	; 0
      00860D 80                    2104 	.db #0x80	; 128
      00860E FF                    2105 	.db #0xff	; 255
      00860F A1                    2106 	.db #0xa1	; 161
      008610 20                    2107 	.db #0x20	; 32
      008611 20                    2108 	.db #0x20	; 32
      008612 11                    2109 	.db #0x11	; 17
      008613 0E                    2110 	.db #0x0e	; 14
      008614 00                    2111 	.db #0x00	; 0
      008615 00                    2112 	.db #0x00	; 0
      008616 00                    2113 	.db #0x00	; 0
      008617 00                    2114 	.db #0x00	; 0
      008618 80                    2115 	.db #0x80	; 128
      008619 80                    2116 	.db #0x80	; 128
      00861A 80                    2117 	.db #0x80	; 128
      00861B 80                    2118 	.db #0x80	; 128
      00861C 00                    2119 	.db #0x00	; 0
      00861D 00                    2120 	.db #0x00	; 0
      00861E 0E                    2121 	.db #0x0e	; 14
      00861F 11                    2122 	.db #0x11	; 17
      008620 20                    2123 	.db #0x20	; 32
      008621 20                    2124 	.db #0x20	; 32
      008622 A0                    2125 	.db #0xa0	; 160
      008623 FF                    2126 	.db #0xff	; 255
      008624 80                    2127 	.db #0x80	; 128
      008625 80                    2128 	.db #0x80	; 128
      008626 80                    2129 	.db #0x80	; 128
      008627 80                    2130 	.db #0x80	; 128
      008628 00                    2131 	.db #0x00	; 0
      008629 80                    2132 	.db #0x80	; 128
      00862A 80                    2133 	.db #0x80	; 128
      00862B 80                    2134 	.db #0x80	; 128
      00862C 00                    2135 	.db #0x00	; 0
      00862D 20                    2136 	.db #0x20	; 32
      00862E 20                    2137 	.db #0x20	; 32
      00862F 3F                    2138 	.db #0x3f	; 63
      008630 21                    2139 	.db #0x21	; 33
      008631 20                    2140 	.db #0x20	; 32
      008632 00                    2141 	.db #0x00	; 0
      008633 01                    2142 	.db #0x01	; 1
      008634 00                    2143 	.db #0x00	; 0
      008635 00                    2144 	.db #0x00	; 0
      008636 00                    2145 	.db #0x00	; 0
      008637 80                    2146 	.db #0x80	; 128
      008638 80                    2147 	.db #0x80	; 128
      008639 80                    2148 	.db #0x80	; 128
      00863A 80                    2149 	.db #0x80	; 128
      00863B 80                    2150 	.db #0x80	; 128
      00863C 00                    2151 	.db #0x00	; 0
      00863D 00                    2152 	.db #0x00	; 0
      00863E 33                    2153 	.db #0x33	; 51	'3'
      00863F 24                    2154 	.db #0x24	; 36
      008640 24                    2155 	.db #0x24	; 36
      008641 24                    2156 	.db #0x24	; 36
      008642 24                    2157 	.db #0x24	; 36
      008643 19                    2158 	.db #0x19	; 25
      008644 00                    2159 	.db #0x00	; 0
      008645 00                    2160 	.db #0x00	; 0
      008646 80                    2161 	.db #0x80	; 128
      008647 80                    2162 	.db #0x80	; 128
      008648 E0                    2163 	.db #0xe0	; 224
      008649 80                    2164 	.db #0x80	; 128
      00864A 80                    2165 	.db #0x80	; 128
      00864B 00                    2166 	.db #0x00	; 0
      00864C 00                    2167 	.db #0x00	; 0
      00864D 00                    2168 	.db #0x00	; 0
      00864E 00                    2169 	.db #0x00	; 0
      00864F 00                    2170 	.db #0x00	; 0
      008650 1F                    2171 	.db #0x1f	; 31
      008651 20                    2172 	.db #0x20	; 32
      008652 20                    2173 	.db #0x20	; 32
      008653 00                    2174 	.db #0x00	; 0
      008654 00                    2175 	.db #0x00	; 0
      008655 80                    2176 	.db #0x80	; 128
      008656 80                    2177 	.db #0x80	; 128
      008657 00                    2178 	.db #0x00	; 0
      008658 00                    2179 	.db #0x00	; 0
      008659 00                    2180 	.db #0x00	; 0
      00865A 80                    2181 	.db #0x80	; 128
      00865B 80                    2182 	.db #0x80	; 128
      00865C 00                    2183 	.db #0x00	; 0
      00865D 00                    2184 	.db #0x00	; 0
      00865E 1F                    2185 	.db #0x1f	; 31
      00865F 20                    2186 	.db #0x20	; 32
      008660 20                    2187 	.db #0x20	; 32
      008661 20                    2188 	.db #0x20	; 32
      008662 10                    2189 	.db #0x10	; 16
      008663 3F                    2190 	.db #0x3f	; 63
      008664 20                    2191 	.db #0x20	; 32
      008665 80                    2192 	.db #0x80	; 128
      008666 80                    2193 	.db #0x80	; 128
      008667 80                    2194 	.db #0x80	; 128
      008668 00                    2195 	.db #0x00	; 0
      008669 00                    2196 	.db #0x00	; 0
      00866A 80                    2197 	.db #0x80	; 128
      00866B 80                    2198 	.db #0x80	; 128
      00866C 80                    2199 	.db #0x80	; 128
      00866D 00                    2200 	.db #0x00	; 0
      00866E 01                    2201 	.db #0x01	; 1
      00866F 0E                    2202 	.db #0x0e	; 14
      008670 30                    2203 	.db #0x30	; 48	'0'
      008671 08                    2204 	.db #0x08	; 8
      008672 06                    2205 	.db #0x06	; 6
      008673 01                    2206 	.db #0x01	; 1
      008674 00                    2207 	.db #0x00	; 0
      008675 80                    2208 	.db #0x80	; 128
      008676 80                    2209 	.db #0x80	; 128
      008677 00                    2210 	.db #0x00	; 0
      008678 80                    2211 	.db #0x80	; 128
      008679 00                    2212 	.db #0x00	; 0
      00867A 80                    2213 	.db #0x80	; 128
      00867B 80                    2214 	.db #0x80	; 128
      00867C 80                    2215 	.db #0x80	; 128
      00867D 0F                    2216 	.db #0x0f	; 15
      00867E 30                    2217 	.db #0x30	; 48	'0'
      00867F 0C                    2218 	.db #0x0c	; 12
      008680 03                    2219 	.db #0x03	; 3
      008681 0C                    2220 	.db #0x0c	; 12
      008682 30                    2221 	.db #0x30	; 48	'0'
      008683 0F                    2222 	.db #0x0f	; 15
      008684 00                    2223 	.db #0x00	; 0
      008685 00                    2224 	.db #0x00	; 0
      008686 80                    2225 	.db #0x80	; 128
      008687 80                    2226 	.db #0x80	; 128
      008688 00                    2227 	.db #0x00	; 0
      008689 80                    2228 	.db #0x80	; 128
      00868A 80                    2229 	.db #0x80	; 128
      00868B 80                    2230 	.db #0x80	; 128
      00868C 00                    2231 	.db #0x00	; 0
      00868D 00                    2232 	.db #0x00	; 0
      00868E 20                    2233 	.db #0x20	; 32
      00868F 31                    2234 	.db #0x31	; 49	'1'
      008690 2E                    2235 	.db #0x2e	; 46
      008691 0E                    2236 	.db #0x0e	; 14
      008692 31                    2237 	.db #0x31	; 49	'1'
      008693 20                    2238 	.db #0x20	; 32
      008694 00                    2239 	.db #0x00	; 0
      008695 80                    2240 	.db #0x80	; 128
      008696 80                    2241 	.db #0x80	; 128
      008697 80                    2242 	.db #0x80	; 128
      008698 00                    2243 	.db #0x00	; 0
      008699 00                    2244 	.db #0x00	; 0
      00869A 80                    2245 	.db #0x80	; 128
      00869B 80                    2246 	.db #0x80	; 128
      00869C 80                    2247 	.db #0x80	; 128
      00869D 80                    2248 	.db #0x80	; 128
      00869E 81                    2249 	.db #0x81	; 129
      00869F 8E                    2250 	.db #0x8e	; 142
      0086A0 70                    2251 	.db #0x70	; 112	'p'
      0086A1 18                    2252 	.db #0x18	; 24
      0086A2 06                    2253 	.db #0x06	; 6
      0086A3 01                    2254 	.db #0x01	; 1
      0086A4 00                    2255 	.db #0x00	; 0
      0086A5 00                    2256 	.db #0x00	; 0
      0086A6 80                    2257 	.db #0x80	; 128
      0086A7 80                    2258 	.db #0x80	; 128
      0086A8 80                    2259 	.db #0x80	; 128
      0086A9 80                    2260 	.db #0x80	; 128
      0086AA 80                    2261 	.db #0x80	; 128
      0086AB 80                    2262 	.db #0x80	; 128
      0086AC 00                    2263 	.db #0x00	; 0
      0086AD 00                    2264 	.db #0x00	; 0
      0086AE 21                    2265 	.db #0x21	; 33
      0086AF 30                    2266 	.db #0x30	; 48	'0'
      0086B0 2C                    2267 	.db #0x2c	; 44
      0086B1 22                    2268 	.db #0x22	; 34
      0086B2 21                    2269 	.db #0x21	; 33
      0086B3 30                    2270 	.db #0x30	; 48	'0'
      0086B4 00                    2271 	.db #0x00	; 0
      0086B5 00                    2272 	.db #0x00	; 0
      0086B6 00                    2273 	.db #0x00	; 0
      0086B7 00                    2274 	.db #0x00	; 0
      0086B8 00                    2275 	.db #0x00	; 0
      0086B9 80                    2276 	.db #0x80	; 128
      0086BA 7C                    2277 	.db #0x7c	; 124
      0086BB 02                    2278 	.db #0x02	; 2
      0086BC 02                    2279 	.db #0x02	; 2
      0086BD 00                    2280 	.db #0x00	; 0
      0086BE 00                    2281 	.db #0x00	; 0
      0086BF 00                    2282 	.db #0x00	; 0
      0086C0 00                    2283 	.db #0x00	; 0
      0086C1 00                    2284 	.db #0x00	; 0
      0086C2 3F                    2285 	.db #0x3f	; 63
      0086C3 40                    2286 	.db #0x40	; 64
      0086C4 40                    2287 	.db #0x40	; 64
      0086C5 00                    2288 	.db #0x00	; 0
      0086C6 00                    2289 	.db #0x00	; 0
      0086C7 00                    2290 	.db #0x00	; 0
      0086C8 00                    2291 	.db #0x00	; 0
      0086C9 FF                    2292 	.db #0xff	; 255
      0086CA 00                    2293 	.db #0x00	; 0
      0086CB 00                    2294 	.db #0x00	; 0
      0086CC 00                    2295 	.db #0x00	; 0
      0086CD 00                    2296 	.db #0x00	; 0
      0086CE 00                    2297 	.db #0x00	; 0
      0086CF 00                    2298 	.db #0x00	; 0
      0086D0 00                    2299 	.db #0x00	; 0
      0086D1 FF                    2300 	.db #0xff	; 255
      0086D2 00                    2301 	.db #0x00	; 0
      0086D3 00                    2302 	.db #0x00	; 0
      0086D4 00                    2303 	.db #0x00	; 0
      0086D5 00                    2304 	.db #0x00	; 0
      0086D6 02                    2305 	.db #0x02	; 2
      0086D7 02                    2306 	.db #0x02	; 2
      0086D8 7C                    2307 	.db #0x7c	; 124
      0086D9 80                    2308 	.db #0x80	; 128
      0086DA 00                    2309 	.db #0x00	; 0
      0086DB 00                    2310 	.db #0x00	; 0
      0086DC 00                    2311 	.db #0x00	; 0
      0086DD 00                    2312 	.db #0x00	; 0
      0086DE 40                    2313 	.db #0x40	; 64
      0086DF 40                    2314 	.db #0x40	; 64
      0086E0 3F                    2315 	.db #0x3f	; 63
      0086E1 00                    2316 	.db #0x00	; 0
      0086E2 00                    2317 	.db #0x00	; 0
      0086E3 00                    2318 	.db #0x00	; 0
      0086E4 00                    2319 	.db #0x00	; 0
      0086E5 00                    2320 	.db #0x00	; 0
      0086E6 06                    2321 	.db #0x06	; 6
      0086E7 01                    2322 	.db #0x01	; 1
      0086E8 01                    2323 	.db #0x01	; 1
      0086E9 02                    2324 	.db #0x02	; 2
      0086EA 02                    2325 	.db #0x02	; 2
      0086EB 04                    2326 	.db #0x04	; 4
      0086EC 04                    2327 	.db #0x04	; 4
      0086ED 00                    2328 	.db #0x00	; 0
      0086EE 00                    2329 	.db #0x00	; 0
      0086EF 00                    2330 	.db #0x00	; 0
      0086F0 00                    2331 	.db #0x00	; 0
      0086F1 00                    2332 	.db #0x00	; 0
      0086F2 00                    2333 	.db #0x00	; 0
      0086F3 00                    2334 	.db #0x00	; 0
      0086F4 00                    2335 	.db #0x00	; 0
                                   2336 	.area INITIALIZER
                                   2337 	.area CABS (ABS)
