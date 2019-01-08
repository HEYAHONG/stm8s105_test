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
      00915A                         67 _delay_ms:
      00915A 52 02            [ 2]   68 	sub	sp, #2
                                     69 ;	driver/oled.c: 48: while(ms)
      00915C 16 05            [ 2]   70 	ldw	y, (0x05, sp)
      00915E 17 01            [ 2]   71 	ldw	(0x01, sp), y
      009160                         72 00104$:
      009160 1E 01            [ 2]   73 	ldw	x, (0x01, sp)
      009162 27 11            [ 1]   74 	jreq	00106$
                                     75 ;	driver/oled.c: 51: while(a--);
      009164 AE 07 08         [ 2]   76 	ldw	x, #0x0708
      009167                         77 00101$:
      009167 90 93            [ 1]   78 	ldw	y, x
      009169 5A               [ 2]   79 	decw	x
      00916A 90 5D            [ 2]   80 	tnzw	y
      00916C 26 F9            [ 1]   81 	jrne	00101$
                                     82 ;	driver/oled.c: 52: ms--;
      00916E 1E 01            [ 2]   83 	ldw	x, (0x01, sp)
      009170 5A               [ 2]   84 	decw	x
      009171 1F 01            [ 2]   85 	ldw	(0x01, sp), x
      009173 20 EB            [ 2]   86 	jra	00104$
      009175                         87 00106$:
                                     88 ;	driver/oled.c: 54: return;
                                     89 ;	driver/oled.c: 55: }
      009175 5B 02            [ 2]   90 	addw	sp, #2
      009177 81               [ 4]   91 	ret
                                     92 ;	driver/oled.c: 77: void OLED_WR_Byte(u8 dat,u8 cmd)
                                     93 ;	-----------------------------------------
                                     94 ;	 function OLED_WR_Byte
                                     95 ;	-----------------------------------------
      009178                         96 _OLED_WR_Byte:
      009178 88               [ 1]   97 	push	a
                                     98 ;	driver/oled.c: 80: if(cmd)
      009179 0D 05            [ 1]   99 	tnz	(0x05, sp)
      00917B 27 0D            [ 1]  100 	jreq	00102$
                                    101 ;	driver/oled.c: 81: OLED_DC_Set();
      00917D 4B 10            [ 1]  102 	push	#0x10
      00917F 4B 0A            [ 1]  103 	push	#0x0a
      009181 4B 50            [ 1]  104 	push	#0x50
      009183 CD 96 84         [ 4]  105 	call	_GPIO_WriteHigh
      009186 5B 03            [ 2]  106 	addw	sp, #3
      009188 20 0B            [ 2]  107 	jra	00103$
      00918A                        108 00102$:
                                    109 ;	driver/oled.c: 83: OLED_DC_Clr();
      00918A 4B 10            [ 1]  110 	push	#0x10
      00918C 4B 0A            [ 1]  111 	push	#0x0a
      00918E 4B 50            [ 1]  112 	push	#0x50
      009190 CD 96 8B         [ 4]  113 	call	_GPIO_WriteLow
      009193 5B 03            [ 2]  114 	addw	sp, #3
      009195                        115 00103$:
                                    116 ;	driver/oled.c: 84: OLED_CS_Clr();
      009195 4B 20            [ 1]  117 	push	#0x20
      009197 4B 0A            [ 1]  118 	push	#0x0a
      009199 4B 50            [ 1]  119 	push	#0x50
      00919B CD 96 8B         [ 4]  120 	call	_GPIO_WriteLow
      00919E 5B 03            [ 2]  121 	addw	sp, #3
                                    122 ;	driver/oled.c: 85: for(i=0;i<8;i++)
      0091A0 0F 01            [ 1]  123 	clr	(0x01, sp)
      0091A2                        124 00108$:
                                    125 ;	driver/oled.c: 87: OLED_SCLK_Clr();
      0091A2 4B 02            [ 1]  126 	push	#0x02
      0091A4 4B 0A            [ 1]  127 	push	#0x0a
      0091A6 4B 50            [ 1]  128 	push	#0x50
      0091A8 CD 96 8B         [ 4]  129 	call	_GPIO_WriteLow
      0091AB 5B 03            [ 2]  130 	addw	sp, #3
                                    131 ;	driver/oled.c: 88: if(dat&0x80)
      0091AD 7B 04            [ 1]  132 	ld	a, (0x04, sp)
      0091AF 2A 0D            [ 1]  133 	jrpl	00105$
                                    134 ;	driver/oled.c: 90: OLED_SDIN_Set();
      0091B1 4B 04            [ 1]  135 	push	#0x04
      0091B3 4B 0A            [ 1]  136 	push	#0x0a
      0091B5 4B 50            [ 1]  137 	push	#0x50
      0091B7 CD 96 84         [ 4]  138 	call	_GPIO_WriteHigh
      0091BA 5B 03            [ 2]  139 	addw	sp, #3
      0091BC 20 0B            [ 2]  140 	jra	00106$
      0091BE                        141 00105$:
                                    142 ;	driver/oled.c: 93: OLED_SDIN_Clr();
      0091BE 4B 04            [ 1]  143 	push	#0x04
      0091C0 4B 0A            [ 1]  144 	push	#0x0a
      0091C2 4B 50            [ 1]  145 	push	#0x50
      0091C4 CD 96 8B         [ 4]  146 	call	_GPIO_WriteLow
      0091C7 5B 03            [ 2]  147 	addw	sp, #3
      0091C9                        148 00106$:
                                    149 ;	driver/oled.c: 94: OLED_SCLK_Set();
      0091C9 4B 02            [ 1]  150 	push	#0x02
      0091CB 4B 0A            [ 1]  151 	push	#0x0a
      0091CD 4B 50            [ 1]  152 	push	#0x50
      0091CF CD 96 84         [ 4]  153 	call	_GPIO_WriteHigh
      0091D2 5B 03            [ 2]  154 	addw	sp, #3
                                    155 ;	driver/oled.c: 95: dat<<=1;
      0091D4 08 04            [ 1]  156 	sll	(0x04, sp)
                                    157 ;	driver/oled.c: 85: for(i=0;i<8;i++)
      0091D6 0C 01            [ 1]  158 	inc	(0x01, sp)
      0091D8 7B 01            [ 1]  159 	ld	a, (0x01, sp)
      0091DA A1 08            [ 1]  160 	cp	a, #0x08
      0091DC 25 C4            [ 1]  161 	jrc	00108$
                                    162 ;	driver/oled.c: 97: OLED_CS_Set();
      0091DE 4B 20            [ 1]  163 	push	#0x20
      0091E0 4B 0A            [ 1]  164 	push	#0x0a
      0091E2 4B 50            [ 1]  165 	push	#0x50
      0091E4 CD 96 84         [ 4]  166 	call	_GPIO_WriteHigh
      0091E7 5B 03            [ 2]  167 	addw	sp, #3
                                    168 ;	driver/oled.c: 98: OLED_DC_Set();
      0091E9 4B 10            [ 1]  169 	push	#0x10
      0091EB 4B 0A            [ 1]  170 	push	#0x0a
      0091ED 4B 50            [ 1]  171 	push	#0x50
      0091EF CD 96 84         [ 4]  172 	call	_GPIO_WriteHigh
                                    173 ;	driver/oled.c: 99: }
      0091F2 5B 04            [ 2]  174 	addw	sp, #4
      0091F4 81               [ 4]  175 	ret
                                    176 ;	driver/oled.c: 101: void OLED_Set_Pos(unsigned char x, unsigned char y)
                                    177 ;	-----------------------------------------
                                    178 ;	 function OLED_Set_Pos
                                    179 ;	-----------------------------------------
      0091F5                        180 _OLED_Set_Pos:
      0091F5 52 02            [ 2]  181 	sub	sp, #2
                                    182 ;	driver/oled.c: 103: OLED_WR_Byte(0xb0+y,OLED_CMD);
      0091F7 7B 06            [ 1]  183 	ld	a, (0x06, sp)
      0091F9 AB B0            [ 1]  184 	add	a, #0xb0
      0091FB 4B 00            [ 1]  185 	push	#0x00
      0091FD 88               [ 1]  186 	push	a
      0091FE CD 91 78         [ 4]  187 	call	_OLED_WR_Byte
      009201 5B 02            [ 2]  188 	addw	sp, #2
                                    189 ;	driver/oled.c: 104: OLED_WR_Byte(((x&0xf0)>>4)|0x10,OLED_CMD);
      009203 7B 05            [ 1]  190 	ld	a, (0x05, sp)
      009205 0F 01            [ 1]  191 	clr	(0x01, sp)
      009207 88               [ 1]  192 	push	a
      009208 A4 F0            [ 1]  193 	and	a, #0xf0
      00920A 97               [ 1]  194 	ld	xl, a
      00920B 4F               [ 1]  195 	clr	a
      00920C 95               [ 1]  196 	ld	xh, a
      00920D 84               [ 1]  197 	pop	a
      00920E 57               [ 2]  198 	sraw	x
      00920F 57               [ 2]  199 	sraw	x
      009210 57               [ 2]  200 	sraw	x
      009211 57               [ 2]  201 	sraw	x
      009212 88               [ 1]  202 	push	a
      009213 9F               [ 1]  203 	ld	a, xl
      009214 AA 10            [ 1]  204 	or	a, #0x10
      009216 97               [ 1]  205 	ld	xl, a
      009217 4B 00            [ 1]  206 	push	#0x00
      009219 89               [ 2]  207 	pushw	x
      00921A 5B 01            [ 2]  208 	addw	sp, #1
      00921C CD 91 78         [ 4]  209 	call	_OLED_WR_Byte
      00921F 5B 02            [ 2]  210 	addw	sp, #2
      009221 84               [ 1]  211 	pop	a
                                    212 ;	driver/oled.c: 105: OLED_WR_Byte((x&0x0f)|0x01,OLED_CMD);
      009222 A4 0F            [ 1]  213 	and	a, #0x0f
      009224 95               [ 1]  214 	ld	xh, a
      009225 4F               [ 1]  215 	clr	a
      009226 02               [ 1]  216 	rlwa	x
      009227 AA 01            [ 1]  217 	or	a, #0x01
      009229 4B 00            [ 1]  218 	push	#0x00
      00922B 88               [ 1]  219 	push	a
      00922C CD 91 78         [ 4]  220 	call	_OLED_WR_Byte
                                    221 ;	driver/oled.c: 106: }
      00922F 5B 04            [ 2]  222 	addw	sp, #4
      009231 81               [ 4]  223 	ret
                                    224 ;	driver/oled.c: 108: void OLED_Display_On(void)
                                    225 ;	-----------------------------------------
                                    226 ;	 function OLED_Display_On
                                    227 ;	-----------------------------------------
      009232                        228 _OLED_Display_On:
                                    229 ;	driver/oled.c: 110: OLED_WR_Byte(0X8D,OLED_CMD);  //SET DCDC命令
      009232 4B 00            [ 1]  230 	push	#0x00
      009234 4B 8D            [ 1]  231 	push	#0x8d
      009236 CD 91 78         [ 4]  232 	call	_OLED_WR_Byte
      009239 5B 02            [ 2]  233 	addw	sp, #2
                                    234 ;	driver/oled.c: 111: OLED_WR_Byte(0X14,OLED_CMD);  //DCDC ON
      00923B 4B 00            [ 1]  235 	push	#0x00
      00923D 4B 14            [ 1]  236 	push	#0x14
      00923F CD 91 78         [ 4]  237 	call	_OLED_WR_Byte
      009242 5B 02            [ 2]  238 	addw	sp, #2
                                    239 ;	driver/oled.c: 112: OLED_WR_Byte(0XAF,OLED_CMD);  //DISPLAY ON
      009244 4B 00            [ 1]  240 	push	#0x00
      009246 4B AF            [ 1]  241 	push	#0xaf
      009248 CD 91 78         [ 4]  242 	call	_OLED_WR_Byte
      00924B 5B 02            [ 2]  243 	addw	sp, #2
                                    244 ;	driver/oled.c: 113: }
      00924D 81               [ 4]  245 	ret
                                    246 ;	driver/oled.c: 115: void OLED_Display_Off(void)
                                    247 ;	-----------------------------------------
                                    248 ;	 function OLED_Display_Off
                                    249 ;	-----------------------------------------
      00924E                        250 _OLED_Display_Off:
                                    251 ;	driver/oled.c: 117: OLED_WR_Byte(0X8D,OLED_CMD);  //SET DCDC命令
      00924E 4B 00            [ 1]  252 	push	#0x00
      009250 4B 8D            [ 1]  253 	push	#0x8d
      009252 CD 91 78         [ 4]  254 	call	_OLED_WR_Byte
      009255 5B 02            [ 2]  255 	addw	sp, #2
                                    256 ;	driver/oled.c: 118: OLED_WR_Byte(0X10,OLED_CMD);  //DCDC OFF
      009257 4B 00            [ 1]  257 	push	#0x00
      009259 4B 10            [ 1]  258 	push	#0x10
      00925B CD 91 78         [ 4]  259 	call	_OLED_WR_Byte
      00925E 5B 02            [ 2]  260 	addw	sp, #2
                                    261 ;	driver/oled.c: 119: OLED_WR_Byte(0XAE,OLED_CMD);  //DISPLAY OFF
      009260 4B 00            [ 1]  262 	push	#0x00
      009262 4B AE            [ 1]  263 	push	#0xae
      009264 CD 91 78         [ 4]  264 	call	_OLED_WR_Byte
      009267 5B 02            [ 2]  265 	addw	sp, #2
                                    266 ;	driver/oled.c: 120: }
      009269 81               [ 4]  267 	ret
                                    268 ;	driver/oled.c: 122: void OLED_Clear(void)
                                    269 ;	-----------------------------------------
                                    270 ;	 function OLED_Clear
                                    271 ;	-----------------------------------------
      00926A                        272 _OLED_Clear:
      00926A 88               [ 1]  273 	push	a
                                    274 ;	driver/oled.c: 125: for(i=0;i<8;i++)
      00926B 0F 01            [ 1]  275 	clr	(0x01, sp)
      00926D                        276 00105$:
                                    277 ;	driver/oled.c: 127: OLED_WR_Byte (0xb0+i,OLED_CMD);    //设置页地址（0~7）
      00926D 7B 01            [ 1]  278 	ld	a, (0x01, sp)
      00926F AB B0            [ 1]  279 	add	a, #0xb0
      009271 4B 00            [ 1]  280 	push	#0x00
      009273 88               [ 1]  281 	push	a
      009274 CD 91 78         [ 4]  282 	call	_OLED_WR_Byte
      009277 5B 02            [ 2]  283 	addw	sp, #2
                                    284 ;	driver/oled.c: 128: OLED_WR_Byte (0x00,OLED_CMD);      //设置显示位置—列低地址
      009279 4B 00            [ 1]  285 	push	#0x00
      00927B 4B 00            [ 1]  286 	push	#0x00
      00927D CD 91 78         [ 4]  287 	call	_OLED_WR_Byte
      009280 5B 02            [ 2]  288 	addw	sp, #2
                                    289 ;	driver/oled.c: 129: OLED_WR_Byte (0x10,OLED_CMD);      //设置显示位置—列高地址
      009282 4B 00            [ 1]  290 	push	#0x00
      009284 4B 10            [ 1]  291 	push	#0x10
      009286 CD 91 78         [ 4]  292 	call	_OLED_WR_Byte
      009289 5B 02            [ 2]  293 	addw	sp, #2
                                    294 ;	driver/oled.c: 130: for(n=0;n<128;n++)OLED_WR_Byte(0,OLED_DATA);
      00928B 4F               [ 1]  295 	clr	a
      00928C                        296 00103$:
      00928C 88               [ 1]  297 	push	a
      00928D 4B 01            [ 1]  298 	push	#0x01
      00928F 4B 00            [ 1]  299 	push	#0x00
      009291 CD 91 78         [ 4]  300 	call	_OLED_WR_Byte
      009294 5B 02            [ 2]  301 	addw	sp, #2
      009296 84               [ 1]  302 	pop	a
      009297 4C               [ 1]  303 	inc	a
      009298 A1 80            [ 1]  304 	cp	a, #0x80
      00929A 25 F0            [ 1]  305 	jrc	00103$
                                    306 ;	driver/oled.c: 125: for(i=0;i<8;i++)
      00929C 0C 01            [ 1]  307 	inc	(0x01, sp)
      00929E 7B 01            [ 1]  308 	ld	a, (0x01, sp)
      0092A0 A1 08            [ 1]  309 	cp	a, #0x08
      0092A2 25 C9            [ 1]  310 	jrc	00105$
                                    311 ;	driver/oled.c: 132: }
      0092A4 84               [ 1]  312 	pop	a
      0092A5 81               [ 4]  313 	ret
                                    314 ;	driver/oled.c: 140: void OLED_ShowChar(u8 x,u8 y,u8 chr)
                                    315 ;	-----------------------------------------
                                    316 ;	 function OLED_ShowChar
                                    317 ;	-----------------------------------------
      0092A6                        318 _OLED_ShowChar:
      0092A6 52 04            [ 2]  319 	sub	sp, #4
                                    320 ;	driver/oled.c: 143: c=chr-' ';//得到偏移后的值
      0092A8 7B 09            [ 1]  321 	ld	a, (0x09, sp)
      0092AA A0 20            [ 1]  322 	sub	a, #0x20
      0092AC 6B 04            [ 1]  323 	ld	(0x04, sp), a
                                    324 ;	driver/oled.c: 144: if(x>Max_Column-1){x=0;y=y+2;}
      0092AE 7B 07            [ 1]  325 	ld	a, (0x07, sp)
      0092B0 A1 7F            [ 1]  326 	cp	a, #0x7f
      0092B2 23 08            [ 2]  327 	jrule	00102$
      0092B4 0F 07            [ 1]  328 	clr	(0x07, sp)
      0092B6 7B 08            [ 1]  329 	ld	a, (0x08, sp)
      0092B8 AB 02            [ 1]  330 	add	a, #0x02
      0092BA 6B 08            [ 1]  331 	ld	(0x08, sp), a
      0092BC                        332 00102$:
                                    333 ;	driver/oled.c: 147: OLED_Set_Pos(x,y);
      0092BC 7B 08            [ 1]  334 	ld	a, (0x08, sp)
      0092BE 88               [ 1]  335 	push	a
      0092BF 7B 08            [ 1]  336 	ld	a, (0x08, sp)
      0092C1 88               [ 1]  337 	push	a
      0092C2 CD 91 F5         [ 4]  338 	call	_OLED_Set_Pos
      0092C5 5B 02            [ 2]  339 	addw	sp, #2
                                    340 ;	driver/oled.c: 148: for(i=0;i<8;i++)
      0092C7 0F 03            [ 1]  341 	clr	(0x03, sp)
      0092C9                        342 00105$:
                                    343 ;	driver/oled.c: 149: OLED_WR_Byte(F8X16[c*16+i],OLED_DATA);
      0092C9 5F               [ 1]  344 	clrw	x
      0092CA 7B 04            [ 1]  345 	ld	a, (0x04, sp)
      0092CC 97               [ 1]  346 	ld	xl, a
      0092CD 58               [ 2]  347 	sllw	x
      0092CE 58               [ 2]  348 	sllw	x
      0092CF 58               [ 2]  349 	sllw	x
      0092D0 58               [ 2]  350 	sllw	x
      0092D1 1F 01            [ 2]  351 	ldw	(0x01, sp), x
      0092D3 5F               [ 1]  352 	clrw	x
      0092D4 7B 03            [ 1]  353 	ld	a, (0x03, sp)
      0092D6 97               [ 1]  354 	ld	xl, a
      0092D7 72 FB 01         [ 2]  355 	addw	x, (0x01, sp)
      0092DA 1C 80 F5         [ 2]  356 	addw	x, #_F8X16
      0092DD F6               [ 1]  357 	ld	a, (x)
      0092DE 4B 01            [ 1]  358 	push	#0x01
      0092E0 88               [ 1]  359 	push	a
      0092E1 CD 91 78         [ 4]  360 	call	_OLED_WR_Byte
      0092E4 5B 02            [ 2]  361 	addw	sp, #2
                                    362 ;	driver/oled.c: 148: for(i=0;i<8;i++)
      0092E6 0C 03            [ 1]  363 	inc	(0x03, sp)
      0092E8 7B 03            [ 1]  364 	ld	a, (0x03, sp)
      0092EA A1 08            [ 1]  365 	cp	a, #0x08
      0092EC 25 DB            [ 1]  366 	jrc	00105$
                                    367 ;	driver/oled.c: 150: OLED_Set_Pos(x,y+1);
      0092EE 7B 08            [ 1]  368 	ld	a, (0x08, sp)
      0092F0 4C               [ 1]  369 	inc	a
      0092F1 88               [ 1]  370 	push	a
      0092F2 7B 08            [ 1]  371 	ld	a, (0x08, sp)
      0092F4 88               [ 1]  372 	push	a
      0092F5 CD 91 F5         [ 4]  373 	call	_OLED_Set_Pos
      0092F8 5B 02            [ 2]  374 	addw	sp, #2
                                    375 ;	driver/oled.c: 151: for(i=0;i<8;i++)
      0092FA 0F 03            [ 1]  376 	clr	(0x03, sp)
      0092FC                        377 00107$:
                                    378 ;	driver/oled.c: 152: OLED_WR_Byte(F8X16[c*16+i+8],OLED_DATA);
      0092FC 5F               [ 1]  379 	clrw	x
      0092FD 7B 03            [ 1]  380 	ld	a, (0x03, sp)
      0092FF 97               [ 1]  381 	ld	xl, a
      009300 72 FB 01         [ 2]  382 	addw	x, (0x01, sp)
      009303 1C 00 08         [ 2]  383 	addw	x, #0x0008
      009306 1C 80 F5         [ 2]  384 	addw	x, #_F8X16
      009309 F6               [ 1]  385 	ld	a, (x)
      00930A 4B 01            [ 1]  386 	push	#0x01
      00930C 88               [ 1]  387 	push	a
      00930D CD 91 78         [ 4]  388 	call	_OLED_WR_Byte
      009310 5B 02            [ 2]  389 	addw	sp, #2
                                    390 ;	driver/oled.c: 151: for(i=0;i<8;i++)
      009312 0C 03            [ 1]  391 	inc	(0x03, sp)
      009314 7B 03            [ 1]  392 	ld	a, (0x03, sp)
      009316 A1 08            [ 1]  393 	cp	a, #0x08
      009318 25 E2            [ 1]  394 	jrc	00107$
                                    395 ;	driver/oled.c: 163: }
      00931A 5B 04            [ 2]  396 	addw	sp, #4
      00931C 81               [ 4]  397 	ret
                                    398 ;	driver/oled.c: 165: u32 oled_pow(u8 m,u8 n)
                                    399 ;	-----------------------------------------
                                    400 ;	 function oled_pow
                                    401 ;	-----------------------------------------
      00931D                        402 _oled_pow:
      00931D 52 09            [ 2]  403 	sub	sp, #9
                                    404 ;	driver/oled.c: 167: u32 result=1;
      00931F 5F               [ 1]  405 	clrw	x
      009320 5C               [ 1]  406 	incw	x
      009321 0F 07            [ 1]  407 	clr	(0x07, sp)
      009323 0F 06            [ 1]  408 	clr	(0x06, sp)
                                    409 ;	driver/oled.c: 168: while(n--)result*=m;
      009325 7B 0D            [ 1]  410 	ld	a, (0x0d, sp)
      009327 6B 05            [ 1]  411 	ld	(0x05, sp), a
      009329                        412 00101$:
      009329 7B 05            [ 1]  413 	ld	a, (0x05, sp)
      00932B 0A 05            [ 1]  414 	dec	(0x05, sp)
      00932D 4D               [ 1]  415 	tnz	a
      00932E 27 1D            [ 1]  416 	jreq	00103$
      009330 7B 0C            [ 1]  417 	ld	a, (0x0c, sp)
      009332 6B 04            [ 1]  418 	ld	(0x04, sp), a
      009334 90 5F            [ 1]  419 	clrw	y
      009336 0F 01            [ 1]  420 	clr	(0x01, sp)
      009338 7B 04            [ 1]  421 	ld	a, (0x04, sp)
      00933A 88               [ 1]  422 	push	a
      00933B 90 89            [ 2]  423 	pushw	y
      00933D 7B 04            [ 1]  424 	ld	a, (0x04, sp)
      00933F 88               [ 1]  425 	push	a
      009340 89               [ 2]  426 	pushw	x
      009341 1E 0C            [ 2]  427 	ldw	x, (0x0c, sp)
      009343 89               [ 2]  428 	pushw	x
      009344 CD A5 8F         [ 4]  429 	call	__mullong
      009347 5B 08            [ 2]  430 	addw	sp, #8
      009349 17 06            [ 2]  431 	ldw	(0x06, sp), y
      00934B 20 DC            [ 2]  432 	jra	00101$
      00934D                        433 00103$:
                                    434 ;	driver/oled.c: 169: return result;
      00934D 16 06            [ 2]  435 	ldw	y, (0x06, sp)
                                    436 ;	driver/oled.c: 170: }
      00934F 5B 09            [ 2]  437 	addw	sp, #9
      009351 81               [ 4]  438 	ret
                                    439 ;	driver/oled.c: 177: void OLED_ShowNum(u8 x,u8 y,u32 num,u8 len,u8 size2)
                                    440 ;	-----------------------------------------
                                    441 ;	 function OLED_ShowNum
                                    442 ;	-----------------------------------------
      009352                        443 _OLED_ShowNum:
      009352 52 07            [ 2]  444 	sub	sp, #7
                                    445 ;	driver/oled.c: 180: u8 enshow=0;
      009354 0F 05            [ 1]  446 	clr	(0x05, sp)
                                    447 ;	driver/oled.c: 181: for(t=0;t<len;t++)
      009356 0F 07            [ 1]  448 	clr	(0x07, sp)
      009358                        449 00110$:
      009358 7B 07            [ 1]  450 	ld	a, (0x07, sp)
      00935A 11 10            [ 1]  451 	cp	a, (0x10, sp)
      00935C 25 03            [ 1]  452 	jrc	00139$
      00935E CC 93 EC         [ 2]  453 	jp	00111$
      009361                        454 00139$:
                                    455 ;	driver/oled.c: 183: temp=(num/oled_pow(10,len-t-1))%10;
      009361 7B 10            [ 1]  456 	ld	a, (0x10, sp)
      009363 10 07            [ 1]  457 	sub	a, (0x07, sp)
      009365 4A               [ 1]  458 	dec	a
      009366 88               [ 1]  459 	push	a
      009367 4B 0A            [ 1]  460 	push	#0x0a
      009369 CD 93 1D         [ 4]  461 	call	_oled_pow
      00936C 5B 02            [ 2]  462 	addw	sp, #2
      00936E 89               [ 2]  463 	pushw	x
      00936F 90 89            [ 2]  464 	pushw	y
      009371 1E 12            [ 2]  465 	ldw	x, (0x12, sp)
      009373 89               [ 2]  466 	pushw	x
      009374 1E 12            [ 2]  467 	ldw	x, (0x12, sp)
      009376 89               [ 2]  468 	pushw	x
      009377 CD A4 DE         [ 4]  469 	call	__divulong
      00937A 5B 08            [ 2]  470 	addw	sp, #8
      00937C 4B 0A            [ 1]  471 	push	#0x0a
      00937E 4B 00            [ 1]  472 	push	#0x00
      009380 4B 00            [ 1]  473 	push	#0x00
      009382 4B 00            [ 1]  474 	push	#0x00
      009384 89               [ 2]  475 	pushw	x
      009385 90 89            [ 2]  476 	pushw	y
      009387 CD A4 20         [ 4]  477 	call	__modulong
      00938A 5B 08            [ 2]  478 	addw	sp, #8
      00938C 9F               [ 1]  479 	ld	a, xl
      00938D 6B 06            [ 1]  480 	ld	(0x06, sp), a
                                    481 ;	driver/oled.c: 188: OLED_ShowChar(x+(size2/2)*t,y,' ');
      00938F 5F               [ 1]  482 	clrw	x
      009390 7B 11            [ 1]  483 	ld	a, (0x11, sp)
      009392 97               [ 1]  484 	ld	xl, a
      009393 7B 07            [ 1]  485 	ld	a, (0x07, sp)
      009395 6B 04            [ 1]  486 	ld	(0x04, sp), a
      009397 7B 0A            [ 1]  487 	ld	a, (0x0a, sp)
      009399 6B 03            [ 1]  488 	ld	(0x03, sp), a
      00939B 4B 02            [ 1]  489 	push	#0x02
      00939D 4B 00            [ 1]  490 	push	#0x00
      00939F 89               [ 2]  491 	pushw	x
      0093A0 CD A6 21         [ 4]  492 	call	__divsint
      0093A3 5B 04            [ 2]  493 	addw	sp, #4
      0093A5 7B 04            [ 1]  494 	ld	a, (0x04, sp)
      0093A7 42               [ 4]  495 	mul	x, a
      0093A8 9F               [ 1]  496 	ld	a, xl
      0093A9 1B 03            [ 1]  497 	add	a, (0x03, sp)
      0093AB 90 97            [ 1]  498 	ld	yl, a
                                    499 ;	driver/oled.c: 184: if(enshow==0&&t<(len-1))
      0093AD 0D 05            [ 1]  500 	tnz	(0x05, sp)
      0093AF 26 26            [ 1]  501 	jrne	00105$
      0093B1 5F               [ 1]  502 	clrw	x
      0093B2 7B 10            [ 1]  503 	ld	a, (0x10, sp)
      0093B4 97               [ 1]  504 	ld	xl, a
      0093B5 5A               [ 2]  505 	decw	x
      0093B6 1F 01            [ 2]  506 	ldw	(0x01, sp), x
      0093B8 5F               [ 1]  507 	clrw	x
      0093B9 7B 07            [ 1]  508 	ld	a, (0x07, sp)
      0093BB 97               [ 1]  509 	ld	xl, a
      0093BC 13 01            [ 2]  510 	cpw	x, (0x01, sp)
      0093BE 2E 17            [ 1]  511 	jrsge	00105$
                                    512 ;	driver/oled.c: 186: if(temp==0)
      0093C0 0D 06            [ 1]  513 	tnz	(0x06, sp)
      0093C2 26 0F            [ 1]  514 	jrne	00102$
                                    515 ;	driver/oled.c: 188: OLED_ShowChar(x+(size2/2)*t,y,' ');
      0093C4 4B 20            [ 1]  516 	push	#0x20
      0093C6 7B 0C            [ 1]  517 	ld	a, (0x0c, sp)
      0093C8 88               [ 1]  518 	push	a
      0093C9 90 9F            [ 1]  519 	ld	a, yl
      0093CB 88               [ 1]  520 	push	a
      0093CC CD 92 A6         [ 4]  521 	call	_OLED_ShowChar
      0093CF 5B 03            [ 2]  522 	addw	sp, #3
                                    523 ;	driver/oled.c: 189: continue;
      0093D1 20 14            [ 2]  524 	jra	00107$
      0093D3                        525 00102$:
                                    526 ;	driver/oled.c: 190: }else enshow=1;
      0093D3 A6 01            [ 1]  527 	ld	a, #0x01
      0093D5 6B 05            [ 1]  528 	ld	(0x05, sp), a
      0093D7                        529 00105$:
                                    530 ;	driver/oled.c: 193: OLED_ShowChar(x+(size2/2)*t,y,temp+'0');
      0093D7 7B 06            [ 1]  531 	ld	a, (0x06, sp)
      0093D9 AB 30            [ 1]  532 	add	a, #0x30
      0093DB 88               [ 1]  533 	push	a
      0093DC 7B 0C            [ 1]  534 	ld	a, (0x0c, sp)
      0093DE 88               [ 1]  535 	push	a
      0093DF 90 9F            [ 1]  536 	ld	a, yl
      0093E1 88               [ 1]  537 	push	a
      0093E2 CD 92 A6         [ 4]  538 	call	_OLED_ShowChar
      0093E5 5B 03            [ 2]  539 	addw	sp, #3
      0093E7                        540 00107$:
                                    541 ;	driver/oled.c: 181: for(t=0;t<len;t++)
      0093E7 0C 07            [ 1]  542 	inc	(0x07, sp)
      0093E9 CC 93 58         [ 2]  543 	jp	00110$
      0093EC                        544 00111$:
                                    545 ;	driver/oled.c: 195: }
      0093EC 5B 07            [ 2]  546 	addw	sp, #7
      0093EE 81               [ 4]  547 	ret
                                    548 ;	driver/oled.c: 197: void OLED_ShowString(u8 x,u8 y,u8 *chr)
                                    549 ;	-----------------------------------------
                                    550 ;	 function OLED_ShowString
                                    551 ;	-----------------------------------------
      0093EF                        552 _OLED_ShowString:
      0093EF 88               [ 1]  553 	push	a
                                    554 ;	driver/oled.c: 200: while (chr[j]!='\0')
      0093F0 0F 01            [ 1]  555 	clr	(0x01, sp)
      0093F2                        556 00103$:
      0093F2 5F               [ 1]  557 	clrw	x
      0093F3 7B 01            [ 1]  558 	ld	a, (0x01, sp)
      0093F5 97               [ 1]  559 	ld	xl, a
      0093F6 72 FB 06         [ 2]  560 	addw	x, (0x06, sp)
      0093F9 F6               [ 1]  561 	ld	a, (x)
      0093FA 27 24            [ 1]  562 	jreq	00106$
                                    563 ;	driver/oled.c: 201: {		OLED_ShowChar(x,y,chr[j]);
      0093FC 88               [ 1]  564 	push	a
      0093FD 7B 06            [ 1]  565 	ld	a, (0x06, sp)
      0093FF 88               [ 1]  566 	push	a
      009400 7B 06            [ 1]  567 	ld	a, (0x06, sp)
      009402 88               [ 1]  568 	push	a
      009403 CD 92 A6         [ 4]  569 	call	_OLED_ShowChar
      009406 5B 03            [ 2]  570 	addw	sp, #3
                                    571 ;	driver/oled.c: 202: x+=8;
      009408 7B 04            [ 1]  572 	ld	a, (0x04, sp)
      00940A AB 08            [ 1]  573 	add	a, #0x08
      00940C 6B 04            [ 1]  574 	ld	(0x04, sp), a
                                    575 ;	driver/oled.c: 203: if(x>120){x=0;y+=2;}
      00940E 7B 04            [ 1]  576 	ld	a, (0x04, sp)
      009410 A1 78            [ 1]  577 	cp	a, #0x78
      009412 23 08            [ 2]  578 	jrule	00102$
      009414 0F 04            [ 1]  579 	clr	(0x04, sp)
      009416 7B 05            [ 1]  580 	ld	a, (0x05, sp)
      009418 AB 02            [ 1]  581 	add	a, #0x02
      00941A 6B 05            [ 1]  582 	ld	(0x05, sp), a
      00941C                        583 00102$:
                                    584 ;	driver/oled.c: 204: j++;
      00941C 0C 01            [ 1]  585 	inc	(0x01, sp)
      00941E 20 D2            [ 2]  586 	jra	00103$
      009420                        587 00106$:
                                    588 ;	driver/oled.c: 206: }
      009420 84               [ 1]  589 	pop	a
      009421 81               [ 4]  590 	ret
                                    591 ;	driver/oled.c: 248: void OLED_Init(void)
                                    592 ;	-----------------------------------------
                                    593 ;	 function OLED_Init
                                    594 ;	-----------------------------------------
      009422                        595 _OLED_Init:
                                    596 ;	driver/oled.c: 250: GPIO_Init(OLED_SCLK_PORT, (GPIO_Pin_TypeDef)OLED_SCLK_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      009422 4B E0            [ 1]  597 	push	#0xe0
      009424 4B 02            [ 1]  598 	push	#0x02
      009426 4B 0A            [ 1]  599 	push	#0x0a
      009428 4B 50            [ 1]  600 	push	#0x50
      00942A CD 96 09         [ 4]  601 	call	_GPIO_Init
      00942D 5B 04            [ 2]  602 	addw	sp, #4
                                    603 ;	driver/oled.c: 251: GPIO_Init(OLED_SDIN_PORT, (GPIO_Pin_TypeDef)OLED_SDIN_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      00942F 4B E0            [ 1]  604 	push	#0xe0
      009431 4B 04            [ 1]  605 	push	#0x04
      009433 4B 0A            [ 1]  606 	push	#0x0a
      009435 4B 50            [ 1]  607 	push	#0x50
      009437 CD 96 09         [ 4]  608 	call	_GPIO_Init
      00943A 5B 04            [ 2]  609 	addw	sp, #4
                                    610 ;	driver/oled.c: 252: GPIO_Init(OLED_RST_PORT, (GPIO_Pin_TypeDef)OLED_RST_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      00943C 4B E0            [ 1]  611 	push	#0xe0
      00943E 4B 08            [ 1]  612 	push	#0x08
      009440 4B 0A            [ 1]  613 	push	#0x0a
      009442 4B 50            [ 1]  614 	push	#0x50
      009444 CD 96 09         [ 4]  615 	call	_GPIO_Init
      009447 5B 04            [ 2]  616 	addw	sp, #4
                                    617 ;	driver/oled.c: 253: GPIO_Init(OLED_DC_PORT, (GPIO_Pin_TypeDef)OLED_DC_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      009449 4B E0            [ 1]  618 	push	#0xe0
      00944B 4B 10            [ 1]  619 	push	#0x10
      00944D 4B 0A            [ 1]  620 	push	#0x0a
      00944F 4B 50            [ 1]  621 	push	#0x50
      009451 CD 96 09         [ 4]  622 	call	_GPIO_Init
      009454 5B 04            [ 2]  623 	addw	sp, #4
                                    624 ;	driver/oled.c: 254: GPIO_Init(OLED_CS_PORT, (GPIO_Pin_TypeDef)OLED_CS_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      009456 4B E0            [ 1]  625 	push	#0xe0
      009458 4B 20            [ 1]  626 	push	#0x20
      00945A 4B 0A            [ 1]  627 	push	#0x0a
      00945C 4B 50            [ 1]  628 	push	#0x50
      00945E CD 96 09         [ 4]  629 	call	_GPIO_Init
      009461 5B 04            [ 2]  630 	addw	sp, #4
                                    631 ;	driver/oled.c: 257: OLED_RST_Set();
      009463 4B 08            [ 1]  632 	push	#0x08
      009465 4B 0A            [ 1]  633 	push	#0x0a
      009467 4B 50            [ 1]  634 	push	#0x50
      009469 CD 96 84         [ 4]  635 	call	_GPIO_WriteHigh
      00946C 5B 03            [ 2]  636 	addw	sp, #3
                                    637 ;	driver/oled.c: 258: delay_ms(100);
      00946E 4B 64            [ 1]  638 	push	#0x64
      009470 4B 00            [ 1]  639 	push	#0x00
      009472 CD 91 5A         [ 4]  640 	call	_delay_ms
      009475 5B 02            [ 2]  641 	addw	sp, #2
                                    642 ;	driver/oled.c: 259: OLED_RST_Clr();
      009477 4B 08            [ 1]  643 	push	#0x08
      009479 4B 0A            [ 1]  644 	push	#0x0a
      00947B 4B 50            [ 1]  645 	push	#0x50
      00947D CD 96 8B         [ 4]  646 	call	_GPIO_WriteLow
      009480 5B 03            [ 2]  647 	addw	sp, #3
                                    648 ;	driver/oled.c: 260: delay_ms(100);
      009482 4B 64            [ 1]  649 	push	#0x64
      009484 4B 00            [ 1]  650 	push	#0x00
      009486 CD 91 5A         [ 4]  651 	call	_delay_ms
      009489 5B 02            [ 2]  652 	addw	sp, #2
                                    653 ;	driver/oled.c: 261: OLED_RST_Set();
      00948B 4B 08            [ 1]  654 	push	#0x08
      00948D 4B 0A            [ 1]  655 	push	#0x0a
      00948F 4B 50            [ 1]  656 	push	#0x50
      009491 CD 96 84         [ 4]  657 	call	_GPIO_WriteHigh
      009494 5B 03            [ 2]  658 	addw	sp, #3
                                    659 ;	driver/oled.c: 293: OLED_WR_Byte(0xAE,OLED_CMD);//--turn off oled panel
      009496 4B 00            [ 1]  660 	push	#0x00
      009498 4B AE            [ 1]  661 	push	#0xae
      00949A CD 91 78         [ 4]  662 	call	_OLED_WR_Byte
      00949D 5B 02            [ 2]  663 	addw	sp, #2
                                    664 ;	driver/oled.c: 294: OLED_WR_Byte(0x00,OLED_CMD);//---set low column address
      00949F 4B 00            [ 1]  665 	push	#0x00
      0094A1 4B 00            [ 1]  666 	push	#0x00
      0094A3 CD 91 78         [ 4]  667 	call	_OLED_WR_Byte
      0094A6 5B 02            [ 2]  668 	addw	sp, #2
                                    669 ;	driver/oled.c: 295: OLED_WR_Byte(0x10,OLED_CMD);//---set high column address
      0094A8 4B 00            [ 1]  670 	push	#0x00
      0094AA 4B 10            [ 1]  671 	push	#0x10
      0094AC CD 91 78         [ 4]  672 	call	_OLED_WR_Byte
      0094AF 5B 02            [ 2]  673 	addw	sp, #2
                                    674 ;	driver/oled.c: 296: OLED_WR_Byte(0x40,OLED_CMD);//--set start line address  Set Mapping RAM Display Start Line (0x00~0x3F)
      0094B1 4B 00            [ 1]  675 	push	#0x00
      0094B3 4B 40            [ 1]  676 	push	#0x40
      0094B5 CD 91 78         [ 4]  677 	call	_OLED_WR_Byte
      0094B8 5B 02            [ 2]  678 	addw	sp, #2
                                    679 ;	driver/oled.c: 297: OLED_WR_Byte(0x81,OLED_CMD);//--set contrast control register
      0094BA 4B 00            [ 1]  680 	push	#0x00
      0094BC 4B 81            [ 1]  681 	push	#0x81
      0094BE CD 91 78         [ 4]  682 	call	_OLED_WR_Byte
      0094C1 5B 02            [ 2]  683 	addw	sp, #2
                                    684 ;	driver/oled.c: 298: OLED_WR_Byte(0xCF,OLED_CMD); // Set SEG Output Current Brightness
      0094C3 4B 00            [ 1]  685 	push	#0x00
      0094C5 4B CF            [ 1]  686 	push	#0xcf
      0094C7 CD 91 78         [ 4]  687 	call	_OLED_WR_Byte
      0094CA 5B 02            [ 2]  688 	addw	sp, #2
                                    689 ;	driver/oled.c: 299: OLED_WR_Byte(0xA1,OLED_CMD);//--Set SEG/Column Mapping     0xa0左右反置 0xa1正常
      0094CC 4B 00            [ 1]  690 	push	#0x00
      0094CE 4B A1            [ 1]  691 	push	#0xa1
      0094D0 CD 91 78         [ 4]  692 	call	_OLED_WR_Byte
      0094D3 5B 02            [ 2]  693 	addw	sp, #2
                                    694 ;	driver/oled.c: 300: OLED_WR_Byte(0xC8,OLED_CMD);//Set COM/Row Scan Direction   0xc0上下反置 0xc8正常
      0094D5 4B 00            [ 1]  695 	push	#0x00
      0094D7 4B C8            [ 1]  696 	push	#0xc8
      0094D9 CD 91 78         [ 4]  697 	call	_OLED_WR_Byte
      0094DC 5B 02            [ 2]  698 	addw	sp, #2
                                    699 ;	driver/oled.c: 301: OLED_WR_Byte(0xA6,OLED_CMD);//--set normal display
      0094DE 4B 00            [ 1]  700 	push	#0x00
      0094E0 4B A6            [ 1]  701 	push	#0xa6
      0094E2 CD 91 78         [ 4]  702 	call	_OLED_WR_Byte
      0094E5 5B 02            [ 2]  703 	addw	sp, #2
                                    704 ;	driver/oled.c: 302: OLED_WR_Byte(0xA8,OLED_CMD);//--set multiplex ratio(1 to 64)
      0094E7 4B 00            [ 1]  705 	push	#0x00
      0094E9 4B A8            [ 1]  706 	push	#0xa8
      0094EB CD 91 78         [ 4]  707 	call	_OLED_WR_Byte
      0094EE 5B 02            [ 2]  708 	addw	sp, #2
                                    709 ;	driver/oled.c: 303: OLED_WR_Byte(0x3f,OLED_CMD);//--1/64 duty
      0094F0 4B 00            [ 1]  710 	push	#0x00
      0094F2 4B 3F            [ 1]  711 	push	#0x3f
      0094F4 CD 91 78         [ 4]  712 	call	_OLED_WR_Byte
      0094F7 5B 02            [ 2]  713 	addw	sp, #2
                                    714 ;	driver/oled.c: 304: OLED_WR_Byte(0xD3,OLED_CMD);//-set display offset	Shift Mapping RAM Counter (0x00~0x3F)
      0094F9 4B 00            [ 1]  715 	push	#0x00
      0094FB 4B D3            [ 1]  716 	push	#0xd3
      0094FD CD 91 78         [ 4]  717 	call	_OLED_WR_Byte
      009500 5B 02            [ 2]  718 	addw	sp, #2
                                    719 ;	driver/oled.c: 305: OLED_WR_Byte(0x00,OLED_CMD);//-not offset
      009502 4B 00            [ 1]  720 	push	#0x00
      009504 4B 00            [ 1]  721 	push	#0x00
      009506 CD 91 78         [ 4]  722 	call	_OLED_WR_Byte
      009509 5B 02            [ 2]  723 	addw	sp, #2
                                    724 ;	driver/oled.c: 306: OLED_WR_Byte(0xd5,OLED_CMD);//--set display clock divide ratio/oscillator frequency
      00950B 4B 00            [ 1]  725 	push	#0x00
      00950D 4B D5            [ 1]  726 	push	#0xd5
      00950F CD 91 78         [ 4]  727 	call	_OLED_WR_Byte
      009512 5B 02            [ 2]  728 	addw	sp, #2
                                    729 ;	driver/oled.c: 307: OLED_WR_Byte(0x80,OLED_CMD);//--set divide ratio, Set Clock as 100 Frames/Sec
      009514 4B 00            [ 1]  730 	push	#0x00
      009516 4B 80            [ 1]  731 	push	#0x80
      009518 CD 91 78         [ 4]  732 	call	_OLED_WR_Byte
      00951B 5B 02            [ 2]  733 	addw	sp, #2
                                    734 ;	driver/oled.c: 308: OLED_WR_Byte(0xD9,OLED_CMD);//--set pre-charge period
      00951D 4B 00            [ 1]  735 	push	#0x00
      00951F 4B D9            [ 1]  736 	push	#0xd9
      009521 CD 91 78         [ 4]  737 	call	_OLED_WR_Byte
      009524 5B 02            [ 2]  738 	addw	sp, #2
                                    739 ;	driver/oled.c: 309: OLED_WR_Byte(0xF1,OLED_CMD);//Set Pre-Charge as 15 Clocks & Discharge as 1 Clock
      009526 4B 00            [ 1]  740 	push	#0x00
      009528 4B F1            [ 1]  741 	push	#0xf1
      00952A CD 91 78         [ 4]  742 	call	_OLED_WR_Byte
      00952D 5B 02            [ 2]  743 	addw	sp, #2
                                    744 ;	driver/oled.c: 310: OLED_WR_Byte(0xDA,OLED_CMD);//--set com pins hardware configuration
      00952F 4B 00            [ 1]  745 	push	#0x00
      009531 4B DA            [ 1]  746 	push	#0xda
      009533 CD 91 78         [ 4]  747 	call	_OLED_WR_Byte
      009536 5B 02            [ 2]  748 	addw	sp, #2
                                    749 ;	driver/oled.c: 311: OLED_WR_Byte(0x12,OLED_CMD);
      009538 4B 00            [ 1]  750 	push	#0x00
      00953A 4B 12            [ 1]  751 	push	#0x12
      00953C CD 91 78         [ 4]  752 	call	_OLED_WR_Byte
      00953F 5B 02            [ 2]  753 	addw	sp, #2
                                    754 ;	driver/oled.c: 312: OLED_WR_Byte(0xDB,OLED_CMD);//--set vcomh
      009541 4B 00            [ 1]  755 	push	#0x00
      009543 4B DB            [ 1]  756 	push	#0xdb
      009545 CD 91 78         [ 4]  757 	call	_OLED_WR_Byte
      009548 5B 02            [ 2]  758 	addw	sp, #2
                                    759 ;	driver/oled.c: 313: OLED_WR_Byte(0x40,OLED_CMD);//Set VCOM Deselect Level
      00954A 4B 00            [ 1]  760 	push	#0x00
      00954C 4B 40            [ 1]  761 	push	#0x40
      00954E CD 91 78         [ 4]  762 	call	_OLED_WR_Byte
      009551 5B 02            [ 2]  763 	addw	sp, #2
                                    764 ;	driver/oled.c: 314: OLED_WR_Byte(0x20,OLED_CMD);//-Set Page Addressing Mode (0x00/0x01/0x02)
      009553 4B 00            [ 1]  765 	push	#0x00
      009555 4B 20            [ 1]  766 	push	#0x20
      009557 CD 91 78         [ 4]  767 	call	_OLED_WR_Byte
      00955A 5B 02            [ 2]  768 	addw	sp, #2
                                    769 ;	driver/oled.c: 315: OLED_WR_Byte(0x02,OLED_CMD);//
      00955C 4B 00            [ 1]  770 	push	#0x00
      00955E 4B 02            [ 1]  771 	push	#0x02
      009560 CD 91 78         [ 4]  772 	call	_OLED_WR_Byte
      009563 5B 02            [ 2]  773 	addw	sp, #2
                                    774 ;	driver/oled.c: 316: OLED_WR_Byte(0x8D,OLED_CMD);//--set Charge Pump enable/disable
      009565 4B 00            [ 1]  775 	push	#0x00
      009567 4B 8D            [ 1]  776 	push	#0x8d
      009569 CD 91 78         [ 4]  777 	call	_OLED_WR_Byte
      00956C 5B 02            [ 2]  778 	addw	sp, #2
                                    779 ;	driver/oled.c: 317: OLED_WR_Byte(0x14,OLED_CMD);//--set(0x10) disable
      00956E 4B 00            [ 1]  780 	push	#0x00
      009570 4B 14            [ 1]  781 	push	#0x14
      009572 CD 91 78         [ 4]  782 	call	_OLED_WR_Byte
      009575 5B 02            [ 2]  783 	addw	sp, #2
                                    784 ;	driver/oled.c: 318: OLED_WR_Byte(0xA4,OLED_CMD);// Disable Entire Display On (0xa4/0xa5)
      009577 4B 00            [ 1]  785 	push	#0x00
      009579 4B A4            [ 1]  786 	push	#0xa4
      00957B CD 91 78         [ 4]  787 	call	_OLED_WR_Byte
      00957E 5B 02            [ 2]  788 	addw	sp, #2
                                    789 ;	driver/oled.c: 319: OLED_WR_Byte(0xA6,OLED_CMD);// Disable Inverse Display On (0xa6/a7)
      009580 4B 00            [ 1]  790 	push	#0x00
      009582 4B A6            [ 1]  791 	push	#0xa6
      009584 CD 91 78         [ 4]  792 	call	_OLED_WR_Byte
      009587 5B 02            [ 2]  793 	addw	sp, #2
                                    794 ;	driver/oled.c: 320: OLED_WR_Byte(0xAF,OLED_CMD);//--turn on oled panel
      009589 4B 00            [ 1]  795 	push	#0x00
      00958B 4B AF            [ 1]  796 	push	#0xaf
      00958D CD 91 78         [ 4]  797 	call	_OLED_WR_Byte
      009590 5B 02            [ 2]  798 	addw	sp, #2
                                    799 ;	driver/oled.c: 322: OLED_WR_Byte(0xAF,OLED_CMD); /*display ON*/
      009592 4B 00            [ 1]  800 	push	#0x00
      009594 4B AF            [ 1]  801 	push	#0xaf
      009596 CD 91 78         [ 4]  802 	call	_OLED_WR_Byte
      009599 5B 02            [ 2]  803 	addw	sp, #2
                                    804 ;	driver/oled.c: 323: OLED_Clear();
      00959B CD 92 6A         [ 4]  805 	call	_OLED_Clear
                                    806 ;	driver/oled.c: 324: OLED_Set_Pos(0,0);
      00959E 4B 00            [ 1]  807 	push	#0x00
      0095A0 4B 00            [ 1]  808 	push	#0x00
      0095A2 CD 91 F5         [ 4]  809 	call	_OLED_Set_Pos
      0095A5 5B 02            [ 2]  810 	addw	sp, #2
                                    811 ;	driver/oled.c: 325: }
      0095A7 81               [ 4]  812 	ret
                                    813 	.area CODE
                                    814 	.area CONST
      0080F5                        815 _F8X16:
      0080F5 00                     816 	.db #0x00	; 0
      0080F6 00                     817 	.db #0x00	; 0
      0080F7 00                     818 	.db #0x00	; 0
      0080F8 00                     819 	.db #0x00	; 0
      0080F9 00                     820 	.db #0x00	; 0
      0080FA 00                     821 	.db #0x00	; 0
      0080FB 00                     822 	.db #0x00	; 0
      0080FC 00                     823 	.db #0x00	; 0
      0080FD 00                     824 	.db #0x00	; 0
      0080FE 00                     825 	.db #0x00	; 0
      0080FF 00                     826 	.db #0x00	; 0
      008100 00                     827 	.db #0x00	; 0
      008101 00                     828 	.db #0x00	; 0
      008102 00                     829 	.db #0x00	; 0
      008103 00                     830 	.db #0x00	; 0
      008104 00                     831 	.db #0x00	; 0
      008105 00                     832 	.db #0x00	; 0
      008106 00                     833 	.db #0x00	; 0
      008107 00                     834 	.db #0x00	; 0
      008108 F8                     835 	.db #0xf8	; 248
      008109 00                     836 	.db #0x00	; 0
      00810A 00                     837 	.db #0x00	; 0
      00810B 00                     838 	.db #0x00	; 0
      00810C 00                     839 	.db #0x00	; 0
      00810D 00                     840 	.db #0x00	; 0
      00810E 00                     841 	.db #0x00	; 0
      00810F 00                     842 	.db #0x00	; 0
      008110 33                     843 	.db #0x33	; 51	'3'
      008111 30                     844 	.db #0x30	; 48	'0'
      008112 00                     845 	.db #0x00	; 0
      008113 00                     846 	.db #0x00	; 0
      008114 00                     847 	.db #0x00	; 0
      008115 00                     848 	.db #0x00	; 0
      008116 10                     849 	.db #0x10	; 16
      008117 0C                     850 	.db #0x0c	; 12
      008118 06                     851 	.db #0x06	; 6
      008119 10                     852 	.db #0x10	; 16
      00811A 0C                     853 	.db #0x0c	; 12
      00811B 06                     854 	.db #0x06	; 6
      00811C 00                     855 	.db #0x00	; 0
      00811D 00                     856 	.db #0x00	; 0
      00811E 00                     857 	.db #0x00	; 0
      00811F 00                     858 	.db #0x00	; 0
      008120 00                     859 	.db #0x00	; 0
      008121 00                     860 	.db #0x00	; 0
      008122 00                     861 	.db #0x00	; 0
      008123 00                     862 	.db #0x00	; 0
      008124 00                     863 	.db #0x00	; 0
      008125 40                     864 	.db #0x40	; 64
      008126 C0                     865 	.db #0xc0	; 192
      008127 78                     866 	.db #0x78	; 120	'x'
      008128 40                     867 	.db #0x40	; 64
      008129 C0                     868 	.db #0xc0	; 192
      00812A 78                     869 	.db #0x78	; 120	'x'
      00812B 40                     870 	.db #0x40	; 64
      00812C 00                     871 	.db #0x00	; 0
      00812D 04                     872 	.db #0x04	; 4
      00812E 3F                     873 	.db #0x3f	; 63
      00812F 04                     874 	.db #0x04	; 4
      008130 04                     875 	.db #0x04	; 4
      008131 3F                     876 	.db #0x3f	; 63
      008132 04                     877 	.db #0x04	; 4
      008133 04                     878 	.db #0x04	; 4
      008134 00                     879 	.db #0x00	; 0
      008135 00                     880 	.db #0x00	; 0
      008136 70                     881 	.db #0x70	; 112	'p'
      008137 88                     882 	.db #0x88	; 136
      008138 FC                     883 	.db #0xfc	; 252
      008139 08                     884 	.db #0x08	; 8
      00813A 30                     885 	.db #0x30	; 48	'0'
      00813B 00                     886 	.db #0x00	; 0
      00813C 00                     887 	.db #0x00	; 0
      00813D 00                     888 	.db #0x00	; 0
      00813E 18                     889 	.db #0x18	; 24
      00813F 20                     890 	.db #0x20	; 32
      008140 FF                     891 	.db #0xff	; 255
      008141 21                     892 	.db #0x21	; 33
      008142 1E                     893 	.db #0x1e	; 30
      008143 00                     894 	.db #0x00	; 0
      008144 00                     895 	.db #0x00	; 0
      008145 F0                     896 	.db #0xf0	; 240
      008146 08                     897 	.db #0x08	; 8
      008147 F0                     898 	.db #0xf0	; 240
      008148 00                     899 	.db #0x00	; 0
      008149 E0                     900 	.db #0xe0	; 224
      00814A 18                     901 	.db #0x18	; 24
      00814B 00                     902 	.db #0x00	; 0
      00814C 00                     903 	.db #0x00	; 0
      00814D 00                     904 	.db #0x00	; 0
      00814E 21                     905 	.db #0x21	; 33
      00814F 1C                     906 	.db #0x1c	; 28
      008150 03                     907 	.db #0x03	; 3
      008151 1E                     908 	.db #0x1e	; 30
      008152 21                     909 	.db #0x21	; 33
      008153 1E                     910 	.db #0x1e	; 30
      008154 00                     911 	.db #0x00	; 0
      008155 00                     912 	.db #0x00	; 0
      008156 F0                     913 	.db #0xf0	; 240
      008157 08                     914 	.db #0x08	; 8
      008158 88                     915 	.db #0x88	; 136
      008159 70                     916 	.db #0x70	; 112	'p'
      00815A 00                     917 	.db #0x00	; 0
      00815B 00                     918 	.db #0x00	; 0
      00815C 00                     919 	.db #0x00	; 0
      00815D 1E                     920 	.db #0x1e	; 30
      00815E 21                     921 	.db #0x21	; 33
      00815F 23                     922 	.db #0x23	; 35
      008160 24                     923 	.db #0x24	; 36
      008161 19                     924 	.db #0x19	; 25
      008162 27                     925 	.db #0x27	; 39
      008163 21                     926 	.db #0x21	; 33
      008164 10                     927 	.db #0x10	; 16
      008165 10                     928 	.db #0x10	; 16
      008166 16                     929 	.db #0x16	; 22
      008167 0E                     930 	.db #0x0e	; 14
      008168 00                     931 	.db #0x00	; 0
      008169 00                     932 	.db #0x00	; 0
      00816A 00                     933 	.db #0x00	; 0
      00816B 00                     934 	.db #0x00	; 0
      00816C 00                     935 	.db #0x00	; 0
      00816D 00                     936 	.db #0x00	; 0
      00816E 00                     937 	.db #0x00	; 0
      00816F 00                     938 	.db #0x00	; 0
      008170 00                     939 	.db #0x00	; 0
      008171 00                     940 	.db #0x00	; 0
      008172 00                     941 	.db #0x00	; 0
      008173 00                     942 	.db #0x00	; 0
      008174 00                     943 	.db #0x00	; 0
      008175 00                     944 	.db #0x00	; 0
      008176 00                     945 	.db #0x00	; 0
      008177 00                     946 	.db #0x00	; 0
      008178 E0                     947 	.db #0xe0	; 224
      008179 18                     948 	.db #0x18	; 24
      00817A 04                     949 	.db #0x04	; 4
      00817B 02                     950 	.db #0x02	; 2
      00817C 00                     951 	.db #0x00	; 0
      00817D 00                     952 	.db #0x00	; 0
      00817E 00                     953 	.db #0x00	; 0
      00817F 00                     954 	.db #0x00	; 0
      008180 07                     955 	.db #0x07	; 7
      008181 18                     956 	.db #0x18	; 24
      008182 20                     957 	.db #0x20	; 32
      008183 40                     958 	.db #0x40	; 64
      008184 00                     959 	.db #0x00	; 0
      008185 00                     960 	.db #0x00	; 0
      008186 02                     961 	.db #0x02	; 2
      008187 04                     962 	.db #0x04	; 4
      008188 18                     963 	.db #0x18	; 24
      008189 E0                     964 	.db #0xe0	; 224
      00818A 00                     965 	.db #0x00	; 0
      00818B 00                     966 	.db #0x00	; 0
      00818C 00                     967 	.db #0x00	; 0
      00818D 00                     968 	.db #0x00	; 0
      00818E 40                     969 	.db #0x40	; 64
      00818F 20                     970 	.db #0x20	; 32
      008190 18                     971 	.db #0x18	; 24
      008191 07                     972 	.db #0x07	; 7
      008192 00                     973 	.db #0x00	; 0
      008193 00                     974 	.db #0x00	; 0
      008194 00                     975 	.db #0x00	; 0
      008195 40                     976 	.db #0x40	; 64
      008196 40                     977 	.db #0x40	; 64
      008197 80                     978 	.db #0x80	; 128
      008198 F0                     979 	.db #0xf0	; 240
      008199 80                     980 	.db #0x80	; 128
      00819A 40                     981 	.db #0x40	; 64
      00819B 40                     982 	.db #0x40	; 64
      00819C 00                     983 	.db #0x00	; 0
      00819D 02                     984 	.db #0x02	; 2
      00819E 02                     985 	.db #0x02	; 2
      00819F 01                     986 	.db #0x01	; 1
      0081A0 0F                     987 	.db #0x0f	; 15
      0081A1 01                     988 	.db #0x01	; 1
      0081A2 02                     989 	.db #0x02	; 2
      0081A3 02                     990 	.db #0x02	; 2
      0081A4 00                     991 	.db #0x00	; 0
      0081A5 00                     992 	.db #0x00	; 0
      0081A6 00                     993 	.db #0x00	; 0
      0081A7 00                     994 	.db #0x00	; 0
      0081A8 F0                     995 	.db #0xf0	; 240
      0081A9 00                     996 	.db #0x00	; 0
      0081AA 00                     997 	.db #0x00	; 0
      0081AB 00                     998 	.db #0x00	; 0
      0081AC 00                     999 	.db #0x00	; 0
      0081AD 01                    1000 	.db #0x01	; 1
      0081AE 01                    1001 	.db #0x01	; 1
      0081AF 01                    1002 	.db #0x01	; 1
      0081B0 1F                    1003 	.db #0x1f	; 31
      0081B1 01                    1004 	.db #0x01	; 1
      0081B2 01                    1005 	.db #0x01	; 1
      0081B3 01                    1006 	.db #0x01	; 1
      0081B4 00                    1007 	.db #0x00	; 0
      0081B5 00                    1008 	.db #0x00	; 0
      0081B6 00                    1009 	.db #0x00	; 0
      0081B7 00                    1010 	.db #0x00	; 0
      0081B8 00                    1011 	.db #0x00	; 0
      0081B9 00                    1012 	.db #0x00	; 0
      0081BA 00                    1013 	.db #0x00	; 0
      0081BB 00                    1014 	.db #0x00	; 0
      0081BC 00                    1015 	.db #0x00	; 0
      0081BD 80                    1016 	.db #0x80	; 128
      0081BE B0                    1017 	.db #0xb0	; 176
      0081BF 70                    1018 	.db #0x70	; 112	'p'
      0081C0 00                    1019 	.db #0x00	; 0
      0081C1 00                    1020 	.db #0x00	; 0
      0081C2 00                    1021 	.db #0x00	; 0
      0081C3 00                    1022 	.db #0x00	; 0
      0081C4 00                    1023 	.db #0x00	; 0
      0081C5 00                    1024 	.db #0x00	; 0
      0081C6 00                    1025 	.db #0x00	; 0
      0081C7 00                    1026 	.db #0x00	; 0
      0081C8 00                    1027 	.db #0x00	; 0
      0081C9 00                    1028 	.db #0x00	; 0
      0081CA 00                    1029 	.db #0x00	; 0
      0081CB 00                    1030 	.db #0x00	; 0
      0081CC 00                    1031 	.db #0x00	; 0
      0081CD 00                    1032 	.db #0x00	; 0
      0081CE 01                    1033 	.db #0x01	; 1
      0081CF 01                    1034 	.db #0x01	; 1
      0081D0 01                    1035 	.db #0x01	; 1
      0081D1 01                    1036 	.db #0x01	; 1
      0081D2 01                    1037 	.db #0x01	; 1
      0081D3 01                    1038 	.db #0x01	; 1
      0081D4 01                    1039 	.db #0x01	; 1
      0081D5 00                    1040 	.db #0x00	; 0
      0081D6 00                    1041 	.db #0x00	; 0
      0081D7 00                    1042 	.db #0x00	; 0
      0081D8 00                    1043 	.db #0x00	; 0
      0081D9 00                    1044 	.db #0x00	; 0
      0081DA 00                    1045 	.db #0x00	; 0
      0081DB 00                    1046 	.db #0x00	; 0
      0081DC 00                    1047 	.db #0x00	; 0
      0081DD 00                    1048 	.db #0x00	; 0
      0081DE 30                    1049 	.db #0x30	; 48	'0'
      0081DF 30                    1050 	.db #0x30	; 48	'0'
      0081E0 00                    1051 	.db #0x00	; 0
      0081E1 00                    1052 	.db #0x00	; 0
      0081E2 00                    1053 	.db #0x00	; 0
      0081E3 00                    1054 	.db #0x00	; 0
      0081E4 00                    1055 	.db #0x00	; 0
      0081E5 00                    1056 	.db #0x00	; 0
      0081E6 00                    1057 	.db #0x00	; 0
      0081E7 00                    1058 	.db #0x00	; 0
      0081E8 00                    1059 	.db #0x00	; 0
      0081E9 80                    1060 	.db #0x80	; 128
      0081EA 60                    1061 	.db #0x60	; 96
      0081EB 18                    1062 	.db #0x18	; 24
      0081EC 04                    1063 	.db #0x04	; 4
      0081ED 00                    1064 	.db #0x00	; 0
      0081EE 60                    1065 	.db #0x60	; 96
      0081EF 18                    1066 	.db #0x18	; 24
      0081F0 06                    1067 	.db #0x06	; 6
      0081F1 01                    1068 	.db #0x01	; 1
      0081F2 00                    1069 	.db #0x00	; 0
      0081F3 00                    1070 	.db #0x00	; 0
      0081F4 00                    1071 	.db #0x00	; 0
      0081F5 00                    1072 	.db #0x00	; 0
      0081F6 E0                    1073 	.db #0xe0	; 224
      0081F7 10                    1074 	.db #0x10	; 16
      0081F8 08                    1075 	.db #0x08	; 8
      0081F9 08                    1076 	.db #0x08	; 8
      0081FA 10                    1077 	.db #0x10	; 16
      0081FB E0                    1078 	.db #0xe0	; 224
      0081FC 00                    1079 	.db #0x00	; 0
      0081FD 00                    1080 	.db #0x00	; 0
      0081FE 0F                    1081 	.db #0x0f	; 15
      0081FF 10                    1082 	.db #0x10	; 16
      008200 20                    1083 	.db #0x20	; 32
      008201 20                    1084 	.db #0x20	; 32
      008202 10                    1085 	.db #0x10	; 16
      008203 0F                    1086 	.db #0x0f	; 15
      008204 00                    1087 	.db #0x00	; 0
      008205 00                    1088 	.db #0x00	; 0
      008206 10                    1089 	.db #0x10	; 16
      008207 10                    1090 	.db #0x10	; 16
      008208 F8                    1091 	.db #0xf8	; 248
      008209 00                    1092 	.db #0x00	; 0
      00820A 00                    1093 	.db #0x00	; 0
      00820B 00                    1094 	.db #0x00	; 0
      00820C 00                    1095 	.db #0x00	; 0
      00820D 00                    1096 	.db #0x00	; 0
      00820E 20                    1097 	.db #0x20	; 32
      00820F 20                    1098 	.db #0x20	; 32
      008210 3F                    1099 	.db #0x3f	; 63
      008211 20                    1100 	.db #0x20	; 32
      008212 20                    1101 	.db #0x20	; 32
      008213 00                    1102 	.db #0x00	; 0
      008214 00                    1103 	.db #0x00	; 0
      008215 00                    1104 	.db #0x00	; 0
      008216 70                    1105 	.db #0x70	; 112	'p'
      008217 08                    1106 	.db #0x08	; 8
      008218 08                    1107 	.db #0x08	; 8
      008219 08                    1108 	.db #0x08	; 8
      00821A 88                    1109 	.db #0x88	; 136
      00821B 70                    1110 	.db #0x70	; 112	'p'
      00821C 00                    1111 	.db #0x00	; 0
      00821D 00                    1112 	.db #0x00	; 0
      00821E 30                    1113 	.db #0x30	; 48	'0'
      00821F 28                    1114 	.db #0x28	; 40
      008220 24                    1115 	.db #0x24	; 36
      008221 22                    1116 	.db #0x22	; 34
      008222 21                    1117 	.db #0x21	; 33
      008223 30                    1118 	.db #0x30	; 48	'0'
      008224 00                    1119 	.db #0x00	; 0
      008225 00                    1120 	.db #0x00	; 0
      008226 30                    1121 	.db #0x30	; 48	'0'
      008227 08                    1122 	.db #0x08	; 8
      008228 88                    1123 	.db #0x88	; 136
      008229 88                    1124 	.db #0x88	; 136
      00822A 48                    1125 	.db #0x48	; 72	'H'
      00822B 30                    1126 	.db #0x30	; 48	'0'
      00822C 00                    1127 	.db #0x00	; 0
      00822D 00                    1128 	.db #0x00	; 0
      00822E 18                    1129 	.db #0x18	; 24
      00822F 20                    1130 	.db #0x20	; 32
      008230 20                    1131 	.db #0x20	; 32
      008231 20                    1132 	.db #0x20	; 32
      008232 11                    1133 	.db #0x11	; 17
      008233 0E                    1134 	.db #0x0e	; 14
      008234 00                    1135 	.db #0x00	; 0
      008235 00                    1136 	.db #0x00	; 0
      008236 00                    1137 	.db #0x00	; 0
      008237 C0                    1138 	.db #0xc0	; 192
      008238 20                    1139 	.db #0x20	; 32
      008239 10                    1140 	.db #0x10	; 16
      00823A F8                    1141 	.db #0xf8	; 248
      00823B 00                    1142 	.db #0x00	; 0
      00823C 00                    1143 	.db #0x00	; 0
      00823D 00                    1144 	.db #0x00	; 0
      00823E 07                    1145 	.db #0x07	; 7
      00823F 04                    1146 	.db #0x04	; 4
      008240 24                    1147 	.db #0x24	; 36
      008241 24                    1148 	.db #0x24	; 36
      008242 3F                    1149 	.db #0x3f	; 63
      008243 24                    1150 	.db #0x24	; 36
      008244 00                    1151 	.db #0x00	; 0
      008245 00                    1152 	.db #0x00	; 0
      008246 F8                    1153 	.db #0xf8	; 248
      008247 08                    1154 	.db #0x08	; 8
      008248 88                    1155 	.db #0x88	; 136
      008249 88                    1156 	.db #0x88	; 136
      00824A 08                    1157 	.db #0x08	; 8
      00824B 08                    1158 	.db #0x08	; 8
      00824C 00                    1159 	.db #0x00	; 0
      00824D 00                    1160 	.db #0x00	; 0
      00824E 19                    1161 	.db #0x19	; 25
      00824F 21                    1162 	.db #0x21	; 33
      008250 20                    1163 	.db #0x20	; 32
      008251 20                    1164 	.db #0x20	; 32
      008252 11                    1165 	.db #0x11	; 17
      008253 0E                    1166 	.db #0x0e	; 14
      008254 00                    1167 	.db #0x00	; 0
      008255 00                    1168 	.db #0x00	; 0
      008256 E0                    1169 	.db #0xe0	; 224
      008257 10                    1170 	.db #0x10	; 16
      008258 88                    1171 	.db #0x88	; 136
      008259 88                    1172 	.db #0x88	; 136
      00825A 18                    1173 	.db #0x18	; 24
      00825B 00                    1174 	.db #0x00	; 0
      00825C 00                    1175 	.db #0x00	; 0
      00825D 00                    1176 	.db #0x00	; 0
      00825E 0F                    1177 	.db #0x0f	; 15
      00825F 11                    1178 	.db #0x11	; 17
      008260 20                    1179 	.db #0x20	; 32
      008261 20                    1180 	.db #0x20	; 32
      008262 11                    1181 	.db #0x11	; 17
      008263 0E                    1182 	.db #0x0e	; 14
      008264 00                    1183 	.db #0x00	; 0
      008265 00                    1184 	.db #0x00	; 0
      008266 38                    1185 	.db #0x38	; 56	'8'
      008267 08                    1186 	.db #0x08	; 8
      008268 08                    1187 	.db #0x08	; 8
      008269 C8                    1188 	.db #0xc8	; 200
      00826A 38                    1189 	.db #0x38	; 56	'8'
      00826B 08                    1190 	.db #0x08	; 8
      00826C 00                    1191 	.db #0x00	; 0
      00826D 00                    1192 	.db #0x00	; 0
      00826E 00                    1193 	.db #0x00	; 0
      00826F 00                    1194 	.db #0x00	; 0
      008270 3F                    1195 	.db #0x3f	; 63
      008271 00                    1196 	.db #0x00	; 0
      008272 00                    1197 	.db #0x00	; 0
      008273 00                    1198 	.db #0x00	; 0
      008274 00                    1199 	.db #0x00	; 0
      008275 00                    1200 	.db #0x00	; 0
      008276 70                    1201 	.db #0x70	; 112	'p'
      008277 88                    1202 	.db #0x88	; 136
      008278 08                    1203 	.db #0x08	; 8
      008279 08                    1204 	.db #0x08	; 8
      00827A 88                    1205 	.db #0x88	; 136
      00827B 70                    1206 	.db #0x70	; 112	'p'
      00827C 00                    1207 	.db #0x00	; 0
      00827D 00                    1208 	.db #0x00	; 0
      00827E 1C                    1209 	.db #0x1c	; 28
      00827F 22                    1210 	.db #0x22	; 34
      008280 21                    1211 	.db #0x21	; 33
      008281 21                    1212 	.db #0x21	; 33
      008282 22                    1213 	.db #0x22	; 34
      008283 1C                    1214 	.db #0x1c	; 28
      008284 00                    1215 	.db #0x00	; 0
      008285 00                    1216 	.db #0x00	; 0
      008286 E0                    1217 	.db #0xe0	; 224
      008287 10                    1218 	.db #0x10	; 16
      008288 08                    1219 	.db #0x08	; 8
      008289 08                    1220 	.db #0x08	; 8
      00828A 10                    1221 	.db #0x10	; 16
      00828B E0                    1222 	.db #0xe0	; 224
      00828C 00                    1223 	.db #0x00	; 0
      00828D 00                    1224 	.db #0x00	; 0
      00828E 00                    1225 	.db #0x00	; 0
      00828F 31                    1226 	.db #0x31	; 49	'1'
      008290 22                    1227 	.db #0x22	; 34
      008291 22                    1228 	.db #0x22	; 34
      008292 11                    1229 	.db #0x11	; 17
      008293 0F                    1230 	.db #0x0f	; 15
      008294 00                    1231 	.db #0x00	; 0
      008295 00                    1232 	.db #0x00	; 0
      008296 00                    1233 	.db #0x00	; 0
      008297 00                    1234 	.db #0x00	; 0
      008298 C0                    1235 	.db #0xc0	; 192
      008299 C0                    1236 	.db #0xc0	; 192
      00829A 00                    1237 	.db #0x00	; 0
      00829B 00                    1238 	.db #0x00	; 0
      00829C 00                    1239 	.db #0x00	; 0
      00829D 00                    1240 	.db #0x00	; 0
      00829E 00                    1241 	.db #0x00	; 0
      00829F 00                    1242 	.db #0x00	; 0
      0082A0 30                    1243 	.db #0x30	; 48	'0'
      0082A1 30                    1244 	.db #0x30	; 48	'0'
      0082A2 00                    1245 	.db #0x00	; 0
      0082A3 00                    1246 	.db #0x00	; 0
      0082A4 00                    1247 	.db #0x00	; 0
      0082A5 00                    1248 	.db #0x00	; 0
      0082A6 00                    1249 	.db #0x00	; 0
      0082A7 00                    1250 	.db #0x00	; 0
      0082A8 80                    1251 	.db #0x80	; 128
      0082A9 00                    1252 	.db #0x00	; 0
      0082AA 00                    1253 	.db #0x00	; 0
      0082AB 00                    1254 	.db #0x00	; 0
      0082AC 00                    1255 	.db #0x00	; 0
      0082AD 00                    1256 	.db #0x00	; 0
      0082AE 00                    1257 	.db #0x00	; 0
      0082AF 80                    1258 	.db #0x80	; 128
      0082B0 60                    1259 	.db #0x60	; 96
      0082B1 00                    1260 	.db #0x00	; 0
      0082B2 00                    1261 	.db #0x00	; 0
      0082B3 00                    1262 	.db #0x00	; 0
      0082B4 00                    1263 	.db #0x00	; 0
      0082B5 00                    1264 	.db #0x00	; 0
      0082B6 00                    1265 	.db #0x00	; 0
      0082B7 80                    1266 	.db #0x80	; 128
      0082B8 40                    1267 	.db #0x40	; 64
      0082B9 20                    1268 	.db #0x20	; 32
      0082BA 10                    1269 	.db #0x10	; 16
      0082BB 08                    1270 	.db #0x08	; 8
      0082BC 00                    1271 	.db #0x00	; 0
      0082BD 00                    1272 	.db #0x00	; 0
      0082BE 01                    1273 	.db #0x01	; 1
      0082BF 02                    1274 	.db #0x02	; 2
      0082C0 04                    1275 	.db #0x04	; 4
      0082C1 08                    1276 	.db #0x08	; 8
      0082C2 10                    1277 	.db #0x10	; 16
      0082C3 20                    1278 	.db #0x20	; 32
      0082C4 00                    1279 	.db #0x00	; 0
      0082C5 40                    1280 	.db #0x40	; 64
      0082C6 40                    1281 	.db #0x40	; 64
      0082C7 40                    1282 	.db #0x40	; 64
      0082C8 40                    1283 	.db #0x40	; 64
      0082C9 40                    1284 	.db #0x40	; 64
      0082CA 40                    1285 	.db #0x40	; 64
      0082CB 40                    1286 	.db #0x40	; 64
      0082CC 00                    1287 	.db #0x00	; 0
      0082CD 04                    1288 	.db #0x04	; 4
      0082CE 04                    1289 	.db #0x04	; 4
      0082CF 04                    1290 	.db #0x04	; 4
      0082D0 04                    1291 	.db #0x04	; 4
      0082D1 04                    1292 	.db #0x04	; 4
      0082D2 04                    1293 	.db #0x04	; 4
      0082D3 04                    1294 	.db #0x04	; 4
      0082D4 00                    1295 	.db #0x00	; 0
      0082D5 00                    1296 	.db #0x00	; 0
      0082D6 08                    1297 	.db #0x08	; 8
      0082D7 10                    1298 	.db #0x10	; 16
      0082D8 20                    1299 	.db #0x20	; 32
      0082D9 40                    1300 	.db #0x40	; 64
      0082DA 80                    1301 	.db #0x80	; 128
      0082DB 00                    1302 	.db #0x00	; 0
      0082DC 00                    1303 	.db #0x00	; 0
      0082DD 00                    1304 	.db #0x00	; 0
      0082DE 20                    1305 	.db #0x20	; 32
      0082DF 10                    1306 	.db #0x10	; 16
      0082E0 08                    1307 	.db #0x08	; 8
      0082E1 04                    1308 	.db #0x04	; 4
      0082E2 02                    1309 	.db #0x02	; 2
      0082E3 01                    1310 	.db #0x01	; 1
      0082E4 00                    1311 	.db #0x00	; 0
      0082E5 00                    1312 	.db #0x00	; 0
      0082E6 70                    1313 	.db #0x70	; 112	'p'
      0082E7 48                    1314 	.db #0x48	; 72	'H'
      0082E8 08                    1315 	.db #0x08	; 8
      0082E9 08                    1316 	.db #0x08	; 8
      0082EA 08                    1317 	.db #0x08	; 8
      0082EB F0                    1318 	.db #0xf0	; 240
      0082EC 00                    1319 	.db #0x00	; 0
      0082ED 00                    1320 	.db #0x00	; 0
      0082EE 00                    1321 	.db #0x00	; 0
      0082EF 00                    1322 	.db #0x00	; 0
      0082F0 30                    1323 	.db #0x30	; 48	'0'
      0082F1 36                    1324 	.db #0x36	; 54	'6'
      0082F2 01                    1325 	.db #0x01	; 1
      0082F3 00                    1326 	.db #0x00	; 0
      0082F4 00                    1327 	.db #0x00	; 0
      0082F5 C0                    1328 	.db #0xc0	; 192
      0082F6 30                    1329 	.db #0x30	; 48	'0'
      0082F7 C8                    1330 	.db #0xc8	; 200
      0082F8 28                    1331 	.db #0x28	; 40
      0082F9 E8                    1332 	.db #0xe8	; 232
      0082FA 10                    1333 	.db #0x10	; 16
      0082FB E0                    1334 	.db #0xe0	; 224
      0082FC 00                    1335 	.db #0x00	; 0
      0082FD 07                    1336 	.db #0x07	; 7
      0082FE 18                    1337 	.db #0x18	; 24
      0082FF 27                    1338 	.db #0x27	; 39
      008300 24                    1339 	.db #0x24	; 36
      008301 23                    1340 	.db #0x23	; 35
      008302 14                    1341 	.db #0x14	; 20
      008303 0B                    1342 	.db #0x0b	; 11
      008304 00                    1343 	.db #0x00	; 0
      008305 00                    1344 	.db #0x00	; 0
      008306 00                    1345 	.db #0x00	; 0
      008307 C0                    1346 	.db #0xc0	; 192
      008308 38                    1347 	.db #0x38	; 56	'8'
      008309 E0                    1348 	.db #0xe0	; 224
      00830A 00                    1349 	.db #0x00	; 0
      00830B 00                    1350 	.db #0x00	; 0
      00830C 00                    1351 	.db #0x00	; 0
      00830D 20                    1352 	.db #0x20	; 32
      00830E 3C                    1353 	.db #0x3c	; 60
      00830F 23                    1354 	.db #0x23	; 35
      008310 02                    1355 	.db #0x02	; 2
      008311 02                    1356 	.db #0x02	; 2
      008312 27                    1357 	.db #0x27	; 39
      008313 38                    1358 	.db #0x38	; 56	'8'
      008314 20                    1359 	.db #0x20	; 32
      008315 08                    1360 	.db #0x08	; 8
      008316 F8                    1361 	.db #0xf8	; 248
      008317 88                    1362 	.db #0x88	; 136
      008318 88                    1363 	.db #0x88	; 136
      008319 88                    1364 	.db #0x88	; 136
      00831A 70                    1365 	.db #0x70	; 112	'p'
      00831B 00                    1366 	.db #0x00	; 0
      00831C 00                    1367 	.db #0x00	; 0
      00831D 20                    1368 	.db #0x20	; 32
      00831E 3F                    1369 	.db #0x3f	; 63
      00831F 20                    1370 	.db #0x20	; 32
      008320 20                    1371 	.db #0x20	; 32
      008321 20                    1372 	.db #0x20	; 32
      008322 11                    1373 	.db #0x11	; 17
      008323 0E                    1374 	.db #0x0e	; 14
      008324 00                    1375 	.db #0x00	; 0
      008325 C0                    1376 	.db #0xc0	; 192
      008326 30                    1377 	.db #0x30	; 48	'0'
      008327 08                    1378 	.db #0x08	; 8
      008328 08                    1379 	.db #0x08	; 8
      008329 08                    1380 	.db #0x08	; 8
      00832A 08                    1381 	.db #0x08	; 8
      00832B 38                    1382 	.db #0x38	; 56	'8'
      00832C 00                    1383 	.db #0x00	; 0
      00832D 07                    1384 	.db #0x07	; 7
      00832E 18                    1385 	.db #0x18	; 24
      00832F 20                    1386 	.db #0x20	; 32
      008330 20                    1387 	.db #0x20	; 32
      008331 20                    1388 	.db #0x20	; 32
      008332 10                    1389 	.db #0x10	; 16
      008333 08                    1390 	.db #0x08	; 8
      008334 00                    1391 	.db #0x00	; 0
      008335 08                    1392 	.db #0x08	; 8
      008336 F8                    1393 	.db #0xf8	; 248
      008337 08                    1394 	.db #0x08	; 8
      008338 08                    1395 	.db #0x08	; 8
      008339 08                    1396 	.db #0x08	; 8
      00833A 10                    1397 	.db #0x10	; 16
      00833B E0                    1398 	.db #0xe0	; 224
      00833C 00                    1399 	.db #0x00	; 0
      00833D 20                    1400 	.db #0x20	; 32
      00833E 3F                    1401 	.db #0x3f	; 63
      00833F 20                    1402 	.db #0x20	; 32
      008340 20                    1403 	.db #0x20	; 32
      008341 20                    1404 	.db #0x20	; 32
      008342 10                    1405 	.db #0x10	; 16
      008343 0F                    1406 	.db #0x0f	; 15
      008344 00                    1407 	.db #0x00	; 0
      008345 08                    1408 	.db #0x08	; 8
      008346 F8                    1409 	.db #0xf8	; 248
      008347 88                    1410 	.db #0x88	; 136
      008348 88                    1411 	.db #0x88	; 136
      008349 E8                    1412 	.db #0xe8	; 232
      00834A 08                    1413 	.db #0x08	; 8
      00834B 10                    1414 	.db #0x10	; 16
      00834C 00                    1415 	.db #0x00	; 0
      00834D 20                    1416 	.db #0x20	; 32
      00834E 3F                    1417 	.db #0x3f	; 63
      00834F 20                    1418 	.db #0x20	; 32
      008350 20                    1419 	.db #0x20	; 32
      008351 23                    1420 	.db #0x23	; 35
      008352 20                    1421 	.db #0x20	; 32
      008353 18                    1422 	.db #0x18	; 24
      008354 00                    1423 	.db #0x00	; 0
      008355 08                    1424 	.db #0x08	; 8
      008356 F8                    1425 	.db #0xf8	; 248
      008357 88                    1426 	.db #0x88	; 136
      008358 88                    1427 	.db #0x88	; 136
      008359 E8                    1428 	.db #0xe8	; 232
      00835A 08                    1429 	.db #0x08	; 8
      00835B 10                    1430 	.db #0x10	; 16
      00835C 00                    1431 	.db #0x00	; 0
      00835D 20                    1432 	.db #0x20	; 32
      00835E 3F                    1433 	.db #0x3f	; 63
      00835F 20                    1434 	.db #0x20	; 32
      008360 00                    1435 	.db #0x00	; 0
      008361 03                    1436 	.db #0x03	; 3
      008362 00                    1437 	.db #0x00	; 0
      008363 00                    1438 	.db #0x00	; 0
      008364 00                    1439 	.db #0x00	; 0
      008365 C0                    1440 	.db #0xc0	; 192
      008366 30                    1441 	.db #0x30	; 48	'0'
      008367 08                    1442 	.db #0x08	; 8
      008368 08                    1443 	.db #0x08	; 8
      008369 08                    1444 	.db #0x08	; 8
      00836A 38                    1445 	.db #0x38	; 56	'8'
      00836B 00                    1446 	.db #0x00	; 0
      00836C 00                    1447 	.db #0x00	; 0
      00836D 07                    1448 	.db #0x07	; 7
      00836E 18                    1449 	.db #0x18	; 24
      00836F 20                    1450 	.db #0x20	; 32
      008370 20                    1451 	.db #0x20	; 32
      008371 22                    1452 	.db #0x22	; 34
      008372 1E                    1453 	.db #0x1e	; 30
      008373 02                    1454 	.db #0x02	; 2
      008374 00                    1455 	.db #0x00	; 0
      008375 08                    1456 	.db #0x08	; 8
      008376 F8                    1457 	.db #0xf8	; 248
      008377 08                    1458 	.db #0x08	; 8
      008378 00                    1459 	.db #0x00	; 0
      008379 00                    1460 	.db #0x00	; 0
      00837A 08                    1461 	.db #0x08	; 8
      00837B F8                    1462 	.db #0xf8	; 248
      00837C 08                    1463 	.db #0x08	; 8
      00837D 20                    1464 	.db #0x20	; 32
      00837E 3F                    1465 	.db #0x3f	; 63
      00837F 21                    1466 	.db #0x21	; 33
      008380 01                    1467 	.db #0x01	; 1
      008381 01                    1468 	.db #0x01	; 1
      008382 21                    1469 	.db #0x21	; 33
      008383 3F                    1470 	.db #0x3f	; 63
      008384 20                    1471 	.db #0x20	; 32
      008385 00                    1472 	.db #0x00	; 0
      008386 08                    1473 	.db #0x08	; 8
      008387 08                    1474 	.db #0x08	; 8
      008388 F8                    1475 	.db #0xf8	; 248
      008389 08                    1476 	.db #0x08	; 8
      00838A 08                    1477 	.db #0x08	; 8
      00838B 00                    1478 	.db #0x00	; 0
      00838C 00                    1479 	.db #0x00	; 0
      00838D 00                    1480 	.db #0x00	; 0
      00838E 20                    1481 	.db #0x20	; 32
      00838F 20                    1482 	.db #0x20	; 32
      008390 3F                    1483 	.db #0x3f	; 63
      008391 20                    1484 	.db #0x20	; 32
      008392 20                    1485 	.db #0x20	; 32
      008393 00                    1486 	.db #0x00	; 0
      008394 00                    1487 	.db #0x00	; 0
      008395 00                    1488 	.db #0x00	; 0
      008396 00                    1489 	.db #0x00	; 0
      008397 08                    1490 	.db #0x08	; 8
      008398 08                    1491 	.db #0x08	; 8
      008399 F8                    1492 	.db #0xf8	; 248
      00839A 08                    1493 	.db #0x08	; 8
      00839B 08                    1494 	.db #0x08	; 8
      00839C 00                    1495 	.db #0x00	; 0
      00839D C0                    1496 	.db #0xc0	; 192
      00839E 80                    1497 	.db #0x80	; 128
      00839F 80                    1498 	.db #0x80	; 128
      0083A0 80                    1499 	.db #0x80	; 128
      0083A1 7F                    1500 	.db #0x7f	; 127
      0083A2 00                    1501 	.db #0x00	; 0
      0083A3 00                    1502 	.db #0x00	; 0
      0083A4 00                    1503 	.db #0x00	; 0
      0083A5 08                    1504 	.db #0x08	; 8
      0083A6 F8                    1505 	.db #0xf8	; 248
      0083A7 88                    1506 	.db #0x88	; 136
      0083A8 C0                    1507 	.db #0xc0	; 192
      0083A9 28                    1508 	.db #0x28	; 40
      0083AA 18                    1509 	.db #0x18	; 24
      0083AB 08                    1510 	.db #0x08	; 8
      0083AC 00                    1511 	.db #0x00	; 0
      0083AD 20                    1512 	.db #0x20	; 32
      0083AE 3F                    1513 	.db #0x3f	; 63
      0083AF 20                    1514 	.db #0x20	; 32
      0083B0 01                    1515 	.db #0x01	; 1
      0083B1 26                    1516 	.db #0x26	; 38
      0083B2 38                    1517 	.db #0x38	; 56	'8'
      0083B3 20                    1518 	.db #0x20	; 32
      0083B4 00                    1519 	.db #0x00	; 0
      0083B5 08                    1520 	.db #0x08	; 8
      0083B6 F8                    1521 	.db #0xf8	; 248
      0083B7 08                    1522 	.db #0x08	; 8
      0083B8 00                    1523 	.db #0x00	; 0
      0083B9 00                    1524 	.db #0x00	; 0
      0083BA 00                    1525 	.db #0x00	; 0
      0083BB 00                    1526 	.db #0x00	; 0
      0083BC 00                    1527 	.db #0x00	; 0
      0083BD 20                    1528 	.db #0x20	; 32
      0083BE 3F                    1529 	.db #0x3f	; 63
      0083BF 20                    1530 	.db #0x20	; 32
      0083C0 20                    1531 	.db #0x20	; 32
      0083C1 20                    1532 	.db #0x20	; 32
      0083C2 20                    1533 	.db #0x20	; 32
      0083C3 30                    1534 	.db #0x30	; 48	'0'
      0083C4 00                    1535 	.db #0x00	; 0
      0083C5 08                    1536 	.db #0x08	; 8
      0083C6 F8                    1537 	.db #0xf8	; 248
      0083C7 F8                    1538 	.db #0xf8	; 248
      0083C8 00                    1539 	.db #0x00	; 0
      0083C9 F8                    1540 	.db #0xf8	; 248
      0083CA F8                    1541 	.db #0xf8	; 248
      0083CB 08                    1542 	.db #0x08	; 8
      0083CC 00                    1543 	.db #0x00	; 0
      0083CD 20                    1544 	.db #0x20	; 32
      0083CE 3F                    1545 	.db #0x3f	; 63
      0083CF 00                    1546 	.db #0x00	; 0
      0083D0 3F                    1547 	.db #0x3f	; 63
      0083D1 00                    1548 	.db #0x00	; 0
      0083D2 3F                    1549 	.db #0x3f	; 63
      0083D3 20                    1550 	.db #0x20	; 32
      0083D4 00                    1551 	.db #0x00	; 0
      0083D5 08                    1552 	.db #0x08	; 8
      0083D6 F8                    1553 	.db #0xf8	; 248
      0083D7 30                    1554 	.db #0x30	; 48	'0'
      0083D8 C0                    1555 	.db #0xc0	; 192
      0083D9 00                    1556 	.db #0x00	; 0
      0083DA 08                    1557 	.db #0x08	; 8
      0083DB F8                    1558 	.db #0xf8	; 248
      0083DC 08                    1559 	.db #0x08	; 8
      0083DD 20                    1560 	.db #0x20	; 32
      0083DE 3F                    1561 	.db #0x3f	; 63
      0083DF 20                    1562 	.db #0x20	; 32
      0083E0 00                    1563 	.db #0x00	; 0
      0083E1 07                    1564 	.db #0x07	; 7
      0083E2 18                    1565 	.db #0x18	; 24
      0083E3 3F                    1566 	.db #0x3f	; 63
      0083E4 00                    1567 	.db #0x00	; 0
      0083E5 E0                    1568 	.db #0xe0	; 224
      0083E6 10                    1569 	.db #0x10	; 16
      0083E7 08                    1570 	.db #0x08	; 8
      0083E8 08                    1571 	.db #0x08	; 8
      0083E9 08                    1572 	.db #0x08	; 8
      0083EA 10                    1573 	.db #0x10	; 16
      0083EB E0                    1574 	.db #0xe0	; 224
      0083EC 00                    1575 	.db #0x00	; 0
      0083ED 0F                    1576 	.db #0x0f	; 15
      0083EE 10                    1577 	.db #0x10	; 16
      0083EF 20                    1578 	.db #0x20	; 32
      0083F0 20                    1579 	.db #0x20	; 32
      0083F1 20                    1580 	.db #0x20	; 32
      0083F2 10                    1581 	.db #0x10	; 16
      0083F3 0F                    1582 	.db #0x0f	; 15
      0083F4 00                    1583 	.db #0x00	; 0
      0083F5 08                    1584 	.db #0x08	; 8
      0083F6 F8                    1585 	.db #0xf8	; 248
      0083F7 08                    1586 	.db #0x08	; 8
      0083F8 08                    1587 	.db #0x08	; 8
      0083F9 08                    1588 	.db #0x08	; 8
      0083FA 08                    1589 	.db #0x08	; 8
      0083FB F0                    1590 	.db #0xf0	; 240
      0083FC 00                    1591 	.db #0x00	; 0
      0083FD 20                    1592 	.db #0x20	; 32
      0083FE 3F                    1593 	.db #0x3f	; 63
      0083FF 21                    1594 	.db #0x21	; 33
      008400 01                    1595 	.db #0x01	; 1
      008401 01                    1596 	.db #0x01	; 1
      008402 01                    1597 	.db #0x01	; 1
      008403 00                    1598 	.db #0x00	; 0
      008404 00                    1599 	.db #0x00	; 0
      008405 E0                    1600 	.db #0xe0	; 224
      008406 10                    1601 	.db #0x10	; 16
      008407 08                    1602 	.db #0x08	; 8
      008408 08                    1603 	.db #0x08	; 8
      008409 08                    1604 	.db #0x08	; 8
      00840A 10                    1605 	.db #0x10	; 16
      00840B E0                    1606 	.db #0xe0	; 224
      00840C 00                    1607 	.db #0x00	; 0
      00840D 0F                    1608 	.db #0x0f	; 15
      00840E 18                    1609 	.db #0x18	; 24
      00840F 24                    1610 	.db #0x24	; 36
      008410 24                    1611 	.db #0x24	; 36
      008411 38                    1612 	.db #0x38	; 56	'8'
      008412 50                    1613 	.db #0x50	; 80	'P'
      008413 4F                    1614 	.db #0x4f	; 79	'O'
      008414 00                    1615 	.db #0x00	; 0
      008415 08                    1616 	.db #0x08	; 8
      008416 F8                    1617 	.db #0xf8	; 248
      008417 88                    1618 	.db #0x88	; 136
      008418 88                    1619 	.db #0x88	; 136
      008419 88                    1620 	.db #0x88	; 136
      00841A 88                    1621 	.db #0x88	; 136
      00841B 70                    1622 	.db #0x70	; 112	'p'
      00841C 00                    1623 	.db #0x00	; 0
      00841D 20                    1624 	.db #0x20	; 32
      00841E 3F                    1625 	.db #0x3f	; 63
      00841F 20                    1626 	.db #0x20	; 32
      008420 00                    1627 	.db #0x00	; 0
      008421 03                    1628 	.db #0x03	; 3
      008422 0C                    1629 	.db #0x0c	; 12
      008423 30                    1630 	.db #0x30	; 48	'0'
      008424 20                    1631 	.db #0x20	; 32
      008425 00                    1632 	.db #0x00	; 0
      008426 70                    1633 	.db #0x70	; 112	'p'
      008427 88                    1634 	.db #0x88	; 136
      008428 08                    1635 	.db #0x08	; 8
      008429 08                    1636 	.db #0x08	; 8
      00842A 08                    1637 	.db #0x08	; 8
      00842B 38                    1638 	.db #0x38	; 56	'8'
      00842C 00                    1639 	.db #0x00	; 0
      00842D 00                    1640 	.db #0x00	; 0
      00842E 38                    1641 	.db #0x38	; 56	'8'
      00842F 20                    1642 	.db #0x20	; 32
      008430 21                    1643 	.db #0x21	; 33
      008431 21                    1644 	.db #0x21	; 33
      008432 22                    1645 	.db #0x22	; 34
      008433 1C                    1646 	.db #0x1c	; 28
      008434 00                    1647 	.db #0x00	; 0
      008435 18                    1648 	.db #0x18	; 24
      008436 08                    1649 	.db #0x08	; 8
      008437 08                    1650 	.db #0x08	; 8
      008438 F8                    1651 	.db #0xf8	; 248
      008439 08                    1652 	.db #0x08	; 8
      00843A 08                    1653 	.db #0x08	; 8
      00843B 18                    1654 	.db #0x18	; 24
      00843C 00                    1655 	.db #0x00	; 0
      00843D 00                    1656 	.db #0x00	; 0
      00843E 00                    1657 	.db #0x00	; 0
      00843F 20                    1658 	.db #0x20	; 32
      008440 3F                    1659 	.db #0x3f	; 63
      008441 20                    1660 	.db #0x20	; 32
      008442 00                    1661 	.db #0x00	; 0
      008443 00                    1662 	.db #0x00	; 0
      008444 00                    1663 	.db #0x00	; 0
      008445 08                    1664 	.db #0x08	; 8
      008446 F8                    1665 	.db #0xf8	; 248
      008447 08                    1666 	.db #0x08	; 8
      008448 00                    1667 	.db #0x00	; 0
      008449 00                    1668 	.db #0x00	; 0
      00844A 08                    1669 	.db #0x08	; 8
      00844B F8                    1670 	.db #0xf8	; 248
      00844C 08                    1671 	.db #0x08	; 8
      00844D 00                    1672 	.db #0x00	; 0
      00844E 1F                    1673 	.db #0x1f	; 31
      00844F 20                    1674 	.db #0x20	; 32
      008450 20                    1675 	.db #0x20	; 32
      008451 20                    1676 	.db #0x20	; 32
      008452 20                    1677 	.db #0x20	; 32
      008453 1F                    1678 	.db #0x1f	; 31
      008454 00                    1679 	.db #0x00	; 0
      008455 08                    1680 	.db #0x08	; 8
      008456 78                    1681 	.db #0x78	; 120	'x'
      008457 88                    1682 	.db #0x88	; 136
      008458 00                    1683 	.db #0x00	; 0
      008459 00                    1684 	.db #0x00	; 0
      00845A C8                    1685 	.db #0xc8	; 200
      00845B 38                    1686 	.db #0x38	; 56	'8'
      00845C 08                    1687 	.db #0x08	; 8
      00845D 00                    1688 	.db #0x00	; 0
      00845E 00                    1689 	.db #0x00	; 0
      00845F 07                    1690 	.db #0x07	; 7
      008460 38                    1691 	.db #0x38	; 56	'8'
      008461 0E                    1692 	.db #0x0e	; 14
      008462 01                    1693 	.db #0x01	; 1
      008463 00                    1694 	.db #0x00	; 0
      008464 00                    1695 	.db #0x00	; 0
      008465 F8                    1696 	.db #0xf8	; 248
      008466 08                    1697 	.db #0x08	; 8
      008467 00                    1698 	.db #0x00	; 0
      008468 F8                    1699 	.db #0xf8	; 248
      008469 00                    1700 	.db #0x00	; 0
      00846A 08                    1701 	.db #0x08	; 8
      00846B F8                    1702 	.db #0xf8	; 248
      00846C 00                    1703 	.db #0x00	; 0
      00846D 03                    1704 	.db #0x03	; 3
      00846E 3C                    1705 	.db #0x3c	; 60
      00846F 07                    1706 	.db #0x07	; 7
      008470 00                    1707 	.db #0x00	; 0
      008471 07                    1708 	.db #0x07	; 7
      008472 3C                    1709 	.db #0x3c	; 60
      008473 03                    1710 	.db #0x03	; 3
      008474 00                    1711 	.db #0x00	; 0
      008475 08                    1712 	.db #0x08	; 8
      008476 18                    1713 	.db #0x18	; 24
      008477 68                    1714 	.db #0x68	; 104	'h'
      008478 80                    1715 	.db #0x80	; 128
      008479 80                    1716 	.db #0x80	; 128
      00847A 68                    1717 	.db #0x68	; 104	'h'
      00847B 18                    1718 	.db #0x18	; 24
      00847C 08                    1719 	.db #0x08	; 8
      00847D 20                    1720 	.db #0x20	; 32
      00847E 30                    1721 	.db #0x30	; 48	'0'
      00847F 2C                    1722 	.db #0x2c	; 44
      008480 03                    1723 	.db #0x03	; 3
      008481 03                    1724 	.db #0x03	; 3
      008482 2C                    1725 	.db #0x2c	; 44
      008483 30                    1726 	.db #0x30	; 48	'0'
      008484 20                    1727 	.db #0x20	; 32
      008485 08                    1728 	.db #0x08	; 8
      008486 38                    1729 	.db #0x38	; 56	'8'
      008487 C8                    1730 	.db #0xc8	; 200
      008488 00                    1731 	.db #0x00	; 0
      008489 C8                    1732 	.db #0xc8	; 200
      00848A 38                    1733 	.db #0x38	; 56	'8'
      00848B 08                    1734 	.db #0x08	; 8
      00848C 00                    1735 	.db #0x00	; 0
      00848D 00                    1736 	.db #0x00	; 0
      00848E 00                    1737 	.db #0x00	; 0
      00848F 20                    1738 	.db #0x20	; 32
      008490 3F                    1739 	.db #0x3f	; 63
      008491 20                    1740 	.db #0x20	; 32
      008492 00                    1741 	.db #0x00	; 0
      008493 00                    1742 	.db #0x00	; 0
      008494 00                    1743 	.db #0x00	; 0
      008495 10                    1744 	.db #0x10	; 16
      008496 08                    1745 	.db #0x08	; 8
      008497 08                    1746 	.db #0x08	; 8
      008498 08                    1747 	.db #0x08	; 8
      008499 C8                    1748 	.db #0xc8	; 200
      00849A 38                    1749 	.db #0x38	; 56	'8'
      00849B 08                    1750 	.db #0x08	; 8
      00849C 00                    1751 	.db #0x00	; 0
      00849D 20                    1752 	.db #0x20	; 32
      00849E 38                    1753 	.db #0x38	; 56	'8'
      00849F 26                    1754 	.db #0x26	; 38
      0084A0 21                    1755 	.db #0x21	; 33
      0084A1 20                    1756 	.db #0x20	; 32
      0084A2 20                    1757 	.db #0x20	; 32
      0084A3 18                    1758 	.db #0x18	; 24
      0084A4 00                    1759 	.db #0x00	; 0
      0084A5 00                    1760 	.db #0x00	; 0
      0084A6 00                    1761 	.db #0x00	; 0
      0084A7 00                    1762 	.db #0x00	; 0
      0084A8 FE                    1763 	.db #0xfe	; 254
      0084A9 02                    1764 	.db #0x02	; 2
      0084AA 02                    1765 	.db #0x02	; 2
      0084AB 02                    1766 	.db #0x02	; 2
      0084AC 00                    1767 	.db #0x00	; 0
      0084AD 00                    1768 	.db #0x00	; 0
      0084AE 00                    1769 	.db #0x00	; 0
      0084AF 00                    1770 	.db #0x00	; 0
      0084B0 7F                    1771 	.db #0x7f	; 127
      0084B1 40                    1772 	.db #0x40	; 64
      0084B2 40                    1773 	.db #0x40	; 64
      0084B3 40                    1774 	.db #0x40	; 64
      0084B4 00                    1775 	.db #0x00	; 0
      0084B5 00                    1776 	.db #0x00	; 0
      0084B6 0C                    1777 	.db #0x0c	; 12
      0084B7 30                    1778 	.db #0x30	; 48	'0'
      0084B8 C0                    1779 	.db #0xc0	; 192
      0084B9 00                    1780 	.db #0x00	; 0
      0084BA 00                    1781 	.db #0x00	; 0
      0084BB 00                    1782 	.db #0x00	; 0
      0084BC 00                    1783 	.db #0x00	; 0
      0084BD 00                    1784 	.db #0x00	; 0
      0084BE 00                    1785 	.db #0x00	; 0
      0084BF 00                    1786 	.db #0x00	; 0
      0084C0 01                    1787 	.db #0x01	; 1
      0084C1 06                    1788 	.db #0x06	; 6
      0084C2 38                    1789 	.db #0x38	; 56	'8'
      0084C3 C0                    1790 	.db #0xc0	; 192
      0084C4 00                    1791 	.db #0x00	; 0
      0084C5 00                    1792 	.db #0x00	; 0
      0084C6 02                    1793 	.db #0x02	; 2
      0084C7 02                    1794 	.db #0x02	; 2
      0084C8 02                    1795 	.db #0x02	; 2
      0084C9 FE                    1796 	.db #0xfe	; 254
      0084CA 00                    1797 	.db #0x00	; 0
      0084CB 00                    1798 	.db #0x00	; 0
      0084CC 00                    1799 	.db #0x00	; 0
      0084CD 00                    1800 	.db #0x00	; 0
      0084CE 40                    1801 	.db #0x40	; 64
      0084CF 40                    1802 	.db #0x40	; 64
      0084D0 40                    1803 	.db #0x40	; 64
      0084D1 7F                    1804 	.db #0x7f	; 127
      0084D2 00                    1805 	.db #0x00	; 0
      0084D3 00                    1806 	.db #0x00	; 0
      0084D4 00                    1807 	.db #0x00	; 0
      0084D5 00                    1808 	.db #0x00	; 0
      0084D6 00                    1809 	.db #0x00	; 0
      0084D7 04                    1810 	.db #0x04	; 4
      0084D8 02                    1811 	.db #0x02	; 2
      0084D9 02                    1812 	.db #0x02	; 2
      0084DA 02                    1813 	.db #0x02	; 2
      0084DB 04                    1814 	.db #0x04	; 4
      0084DC 00                    1815 	.db #0x00	; 0
      0084DD 00                    1816 	.db #0x00	; 0
      0084DE 00                    1817 	.db #0x00	; 0
      0084DF 00                    1818 	.db #0x00	; 0
      0084E0 00                    1819 	.db #0x00	; 0
      0084E1 00                    1820 	.db #0x00	; 0
      0084E2 00                    1821 	.db #0x00	; 0
      0084E3 00                    1822 	.db #0x00	; 0
      0084E4 00                    1823 	.db #0x00	; 0
      0084E5 00                    1824 	.db #0x00	; 0
      0084E6 00                    1825 	.db #0x00	; 0
      0084E7 00                    1826 	.db #0x00	; 0
      0084E8 00                    1827 	.db #0x00	; 0
      0084E9 00                    1828 	.db #0x00	; 0
      0084EA 00                    1829 	.db #0x00	; 0
      0084EB 00                    1830 	.db #0x00	; 0
      0084EC 00                    1831 	.db #0x00	; 0
      0084ED 80                    1832 	.db #0x80	; 128
      0084EE 80                    1833 	.db #0x80	; 128
      0084EF 80                    1834 	.db #0x80	; 128
      0084F0 80                    1835 	.db #0x80	; 128
      0084F1 80                    1836 	.db #0x80	; 128
      0084F2 80                    1837 	.db #0x80	; 128
      0084F3 80                    1838 	.db #0x80	; 128
      0084F4 80                    1839 	.db #0x80	; 128
      0084F5 00                    1840 	.db #0x00	; 0
      0084F6 02                    1841 	.db #0x02	; 2
      0084F7 02                    1842 	.db #0x02	; 2
      0084F8 04                    1843 	.db #0x04	; 4
      0084F9 00                    1844 	.db #0x00	; 0
      0084FA 00                    1845 	.db #0x00	; 0
      0084FB 00                    1846 	.db #0x00	; 0
      0084FC 00                    1847 	.db #0x00	; 0
      0084FD 00                    1848 	.db #0x00	; 0
      0084FE 00                    1849 	.db #0x00	; 0
      0084FF 00                    1850 	.db #0x00	; 0
      008500 00                    1851 	.db #0x00	; 0
      008501 00                    1852 	.db #0x00	; 0
      008502 00                    1853 	.db #0x00	; 0
      008503 00                    1854 	.db #0x00	; 0
      008504 00                    1855 	.db #0x00	; 0
      008505 00                    1856 	.db #0x00	; 0
      008506 00                    1857 	.db #0x00	; 0
      008507 80                    1858 	.db #0x80	; 128
      008508 80                    1859 	.db #0x80	; 128
      008509 80                    1860 	.db #0x80	; 128
      00850A 80                    1861 	.db #0x80	; 128
      00850B 00                    1862 	.db #0x00	; 0
      00850C 00                    1863 	.db #0x00	; 0
      00850D 00                    1864 	.db #0x00	; 0
      00850E 19                    1865 	.db #0x19	; 25
      00850F 24                    1866 	.db #0x24	; 36
      008510 22                    1867 	.db #0x22	; 34
      008511 22                    1868 	.db #0x22	; 34
      008512 22                    1869 	.db #0x22	; 34
      008513 3F                    1870 	.db #0x3f	; 63
      008514 20                    1871 	.db #0x20	; 32
      008515 08                    1872 	.db #0x08	; 8
      008516 F8                    1873 	.db #0xf8	; 248
      008517 00                    1874 	.db #0x00	; 0
      008518 80                    1875 	.db #0x80	; 128
      008519 80                    1876 	.db #0x80	; 128
      00851A 00                    1877 	.db #0x00	; 0
      00851B 00                    1878 	.db #0x00	; 0
      00851C 00                    1879 	.db #0x00	; 0
      00851D 00                    1880 	.db #0x00	; 0
      00851E 3F                    1881 	.db #0x3f	; 63
      00851F 11                    1882 	.db #0x11	; 17
      008520 20                    1883 	.db #0x20	; 32
      008521 20                    1884 	.db #0x20	; 32
      008522 11                    1885 	.db #0x11	; 17
      008523 0E                    1886 	.db #0x0e	; 14
      008524 00                    1887 	.db #0x00	; 0
      008525 00                    1888 	.db #0x00	; 0
      008526 00                    1889 	.db #0x00	; 0
      008527 00                    1890 	.db #0x00	; 0
      008528 80                    1891 	.db #0x80	; 128
      008529 80                    1892 	.db #0x80	; 128
      00852A 80                    1893 	.db #0x80	; 128
      00852B 00                    1894 	.db #0x00	; 0
      00852C 00                    1895 	.db #0x00	; 0
      00852D 00                    1896 	.db #0x00	; 0
      00852E 0E                    1897 	.db #0x0e	; 14
      00852F 11                    1898 	.db #0x11	; 17
      008530 20                    1899 	.db #0x20	; 32
      008531 20                    1900 	.db #0x20	; 32
      008532 20                    1901 	.db #0x20	; 32
      008533 11                    1902 	.db #0x11	; 17
      008534 00                    1903 	.db #0x00	; 0
      008535 00                    1904 	.db #0x00	; 0
      008536 00                    1905 	.db #0x00	; 0
      008537 00                    1906 	.db #0x00	; 0
      008538 80                    1907 	.db #0x80	; 128
      008539 80                    1908 	.db #0x80	; 128
      00853A 88                    1909 	.db #0x88	; 136
      00853B F8                    1910 	.db #0xf8	; 248
      00853C 00                    1911 	.db #0x00	; 0
      00853D 00                    1912 	.db #0x00	; 0
      00853E 0E                    1913 	.db #0x0e	; 14
      00853F 11                    1914 	.db #0x11	; 17
      008540 20                    1915 	.db #0x20	; 32
      008541 20                    1916 	.db #0x20	; 32
      008542 10                    1917 	.db #0x10	; 16
      008543 3F                    1918 	.db #0x3f	; 63
      008544 20                    1919 	.db #0x20	; 32
      008545 00                    1920 	.db #0x00	; 0
      008546 00                    1921 	.db #0x00	; 0
      008547 80                    1922 	.db #0x80	; 128
      008548 80                    1923 	.db #0x80	; 128
      008549 80                    1924 	.db #0x80	; 128
      00854A 80                    1925 	.db #0x80	; 128
      00854B 00                    1926 	.db #0x00	; 0
      00854C 00                    1927 	.db #0x00	; 0
      00854D 00                    1928 	.db #0x00	; 0
      00854E 1F                    1929 	.db #0x1f	; 31
      00854F 22                    1930 	.db #0x22	; 34
      008550 22                    1931 	.db #0x22	; 34
      008551 22                    1932 	.db #0x22	; 34
      008552 22                    1933 	.db #0x22	; 34
      008553 13                    1934 	.db #0x13	; 19
      008554 00                    1935 	.db #0x00	; 0
      008555 00                    1936 	.db #0x00	; 0
      008556 80                    1937 	.db #0x80	; 128
      008557 80                    1938 	.db #0x80	; 128
      008558 F0                    1939 	.db #0xf0	; 240
      008559 88                    1940 	.db #0x88	; 136
      00855A 88                    1941 	.db #0x88	; 136
      00855B 88                    1942 	.db #0x88	; 136
      00855C 18                    1943 	.db #0x18	; 24
      00855D 00                    1944 	.db #0x00	; 0
      00855E 20                    1945 	.db #0x20	; 32
      00855F 20                    1946 	.db #0x20	; 32
      008560 3F                    1947 	.db #0x3f	; 63
      008561 20                    1948 	.db #0x20	; 32
      008562 20                    1949 	.db #0x20	; 32
      008563 00                    1950 	.db #0x00	; 0
      008564 00                    1951 	.db #0x00	; 0
      008565 00                    1952 	.db #0x00	; 0
      008566 00                    1953 	.db #0x00	; 0
      008567 80                    1954 	.db #0x80	; 128
      008568 80                    1955 	.db #0x80	; 128
      008569 80                    1956 	.db #0x80	; 128
      00856A 80                    1957 	.db #0x80	; 128
      00856B 80                    1958 	.db #0x80	; 128
      00856C 00                    1959 	.db #0x00	; 0
      00856D 00                    1960 	.db #0x00	; 0
      00856E 6B                    1961 	.db #0x6b	; 107	'k'
      00856F 94                    1962 	.db #0x94	; 148
      008570 94                    1963 	.db #0x94	; 148
      008571 94                    1964 	.db #0x94	; 148
      008572 93                    1965 	.db #0x93	; 147
      008573 60                    1966 	.db #0x60	; 96
      008574 00                    1967 	.db #0x00	; 0
      008575 08                    1968 	.db #0x08	; 8
      008576 F8                    1969 	.db #0xf8	; 248
      008577 00                    1970 	.db #0x00	; 0
      008578 80                    1971 	.db #0x80	; 128
      008579 80                    1972 	.db #0x80	; 128
      00857A 80                    1973 	.db #0x80	; 128
      00857B 00                    1974 	.db #0x00	; 0
      00857C 00                    1975 	.db #0x00	; 0
      00857D 20                    1976 	.db #0x20	; 32
      00857E 3F                    1977 	.db #0x3f	; 63
      00857F 21                    1978 	.db #0x21	; 33
      008580 00                    1979 	.db #0x00	; 0
      008581 00                    1980 	.db #0x00	; 0
      008582 20                    1981 	.db #0x20	; 32
      008583 3F                    1982 	.db #0x3f	; 63
      008584 20                    1983 	.db #0x20	; 32
      008585 00                    1984 	.db #0x00	; 0
      008586 80                    1985 	.db #0x80	; 128
      008587 98                    1986 	.db #0x98	; 152
      008588 98                    1987 	.db #0x98	; 152
      008589 00                    1988 	.db #0x00	; 0
      00858A 00                    1989 	.db #0x00	; 0
      00858B 00                    1990 	.db #0x00	; 0
      00858C 00                    1991 	.db #0x00	; 0
      00858D 00                    1992 	.db #0x00	; 0
      00858E 20                    1993 	.db #0x20	; 32
      00858F 20                    1994 	.db #0x20	; 32
      008590 3F                    1995 	.db #0x3f	; 63
      008591 20                    1996 	.db #0x20	; 32
      008592 20                    1997 	.db #0x20	; 32
      008593 00                    1998 	.db #0x00	; 0
      008594 00                    1999 	.db #0x00	; 0
      008595 00                    2000 	.db #0x00	; 0
      008596 00                    2001 	.db #0x00	; 0
      008597 00                    2002 	.db #0x00	; 0
      008598 80                    2003 	.db #0x80	; 128
      008599 98                    2004 	.db #0x98	; 152
      00859A 98                    2005 	.db #0x98	; 152
      00859B 00                    2006 	.db #0x00	; 0
      00859C 00                    2007 	.db #0x00	; 0
      00859D 00                    2008 	.db #0x00	; 0
      00859E C0                    2009 	.db #0xc0	; 192
      00859F 80                    2010 	.db #0x80	; 128
      0085A0 80                    2011 	.db #0x80	; 128
      0085A1 80                    2012 	.db #0x80	; 128
      0085A2 7F                    2013 	.db #0x7f	; 127
      0085A3 00                    2014 	.db #0x00	; 0
      0085A4 00                    2015 	.db #0x00	; 0
      0085A5 08                    2016 	.db #0x08	; 8
      0085A6 F8                    2017 	.db #0xf8	; 248
      0085A7 00                    2018 	.db #0x00	; 0
      0085A8 00                    2019 	.db #0x00	; 0
      0085A9 80                    2020 	.db #0x80	; 128
      0085AA 80                    2021 	.db #0x80	; 128
      0085AB 80                    2022 	.db #0x80	; 128
      0085AC 00                    2023 	.db #0x00	; 0
      0085AD 20                    2024 	.db #0x20	; 32
      0085AE 3F                    2025 	.db #0x3f	; 63
      0085AF 24                    2026 	.db #0x24	; 36
      0085B0 02                    2027 	.db #0x02	; 2
      0085B1 2D                    2028 	.db #0x2d	; 45
      0085B2 30                    2029 	.db #0x30	; 48	'0'
      0085B3 20                    2030 	.db #0x20	; 32
      0085B4 00                    2031 	.db #0x00	; 0
      0085B5 00                    2032 	.db #0x00	; 0
      0085B6 08                    2033 	.db #0x08	; 8
      0085B7 08                    2034 	.db #0x08	; 8
      0085B8 F8                    2035 	.db #0xf8	; 248
      0085B9 00                    2036 	.db #0x00	; 0
      0085BA 00                    2037 	.db #0x00	; 0
      0085BB 00                    2038 	.db #0x00	; 0
      0085BC 00                    2039 	.db #0x00	; 0
      0085BD 00                    2040 	.db #0x00	; 0
      0085BE 20                    2041 	.db #0x20	; 32
      0085BF 20                    2042 	.db #0x20	; 32
      0085C0 3F                    2043 	.db #0x3f	; 63
      0085C1 20                    2044 	.db #0x20	; 32
      0085C2 20                    2045 	.db #0x20	; 32
      0085C3 00                    2046 	.db #0x00	; 0
      0085C4 00                    2047 	.db #0x00	; 0
      0085C5 80                    2048 	.db #0x80	; 128
      0085C6 80                    2049 	.db #0x80	; 128
      0085C7 80                    2050 	.db #0x80	; 128
      0085C8 80                    2051 	.db #0x80	; 128
      0085C9 80                    2052 	.db #0x80	; 128
      0085CA 80                    2053 	.db #0x80	; 128
      0085CB 80                    2054 	.db #0x80	; 128
      0085CC 00                    2055 	.db #0x00	; 0
      0085CD 20                    2056 	.db #0x20	; 32
      0085CE 3F                    2057 	.db #0x3f	; 63
      0085CF 20                    2058 	.db #0x20	; 32
      0085D0 00                    2059 	.db #0x00	; 0
      0085D1 3F                    2060 	.db #0x3f	; 63
      0085D2 20                    2061 	.db #0x20	; 32
      0085D3 00                    2062 	.db #0x00	; 0
      0085D4 3F                    2063 	.db #0x3f	; 63
      0085D5 80                    2064 	.db #0x80	; 128
      0085D6 80                    2065 	.db #0x80	; 128
      0085D7 00                    2066 	.db #0x00	; 0
      0085D8 80                    2067 	.db #0x80	; 128
      0085D9 80                    2068 	.db #0x80	; 128
      0085DA 80                    2069 	.db #0x80	; 128
      0085DB 00                    2070 	.db #0x00	; 0
      0085DC 00                    2071 	.db #0x00	; 0
      0085DD 20                    2072 	.db #0x20	; 32
      0085DE 3F                    2073 	.db #0x3f	; 63
      0085DF 21                    2074 	.db #0x21	; 33
      0085E0 00                    2075 	.db #0x00	; 0
      0085E1 00                    2076 	.db #0x00	; 0
      0085E2 20                    2077 	.db #0x20	; 32
      0085E3 3F                    2078 	.db #0x3f	; 63
      0085E4 20                    2079 	.db #0x20	; 32
      0085E5 00                    2080 	.db #0x00	; 0
      0085E6 00                    2081 	.db #0x00	; 0
      0085E7 80                    2082 	.db #0x80	; 128
      0085E8 80                    2083 	.db #0x80	; 128
      0085E9 80                    2084 	.db #0x80	; 128
      0085EA 80                    2085 	.db #0x80	; 128
      0085EB 00                    2086 	.db #0x00	; 0
      0085EC 00                    2087 	.db #0x00	; 0
      0085ED 00                    2088 	.db #0x00	; 0
      0085EE 1F                    2089 	.db #0x1f	; 31
      0085EF 20                    2090 	.db #0x20	; 32
      0085F0 20                    2091 	.db #0x20	; 32
      0085F1 20                    2092 	.db #0x20	; 32
      0085F2 20                    2093 	.db #0x20	; 32
      0085F3 1F                    2094 	.db #0x1f	; 31
      0085F4 00                    2095 	.db #0x00	; 0
      0085F5 80                    2096 	.db #0x80	; 128
      0085F6 80                    2097 	.db #0x80	; 128
      0085F7 00                    2098 	.db #0x00	; 0
      0085F8 80                    2099 	.db #0x80	; 128
      0085F9 80                    2100 	.db #0x80	; 128
      0085FA 00                    2101 	.db #0x00	; 0
      0085FB 00                    2102 	.db #0x00	; 0
      0085FC 00                    2103 	.db #0x00	; 0
      0085FD 80                    2104 	.db #0x80	; 128
      0085FE FF                    2105 	.db #0xff	; 255
      0085FF A1                    2106 	.db #0xa1	; 161
      008600 20                    2107 	.db #0x20	; 32
      008601 20                    2108 	.db #0x20	; 32
      008602 11                    2109 	.db #0x11	; 17
      008603 0E                    2110 	.db #0x0e	; 14
      008604 00                    2111 	.db #0x00	; 0
      008605 00                    2112 	.db #0x00	; 0
      008606 00                    2113 	.db #0x00	; 0
      008607 00                    2114 	.db #0x00	; 0
      008608 80                    2115 	.db #0x80	; 128
      008609 80                    2116 	.db #0x80	; 128
      00860A 80                    2117 	.db #0x80	; 128
      00860B 80                    2118 	.db #0x80	; 128
      00860C 00                    2119 	.db #0x00	; 0
      00860D 00                    2120 	.db #0x00	; 0
      00860E 0E                    2121 	.db #0x0e	; 14
      00860F 11                    2122 	.db #0x11	; 17
      008610 20                    2123 	.db #0x20	; 32
      008611 20                    2124 	.db #0x20	; 32
      008612 A0                    2125 	.db #0xa0	; 160
      008613 FF                    2126 	.db #0xff	; 255
      008614 80                    2127 	.db #0x80	; 128
      008615 80                    2128 	.db #0x80	; 128
      008616 80                    2129 	.db #0x80	; 128
      008617 80                    2130 	.db #0x80	; 128
      008618 00                    2131 	.db #0x00	; 0
      008619 80                    2132 	.db #0x80	; 128
      00861A 80                    2133 	.db #0x80	; 128
      00861B 80                    2134 	.db #0x80	; 128
      00861C 00                    2135 	.db #0x00	; 0
      00861D 20                    2136 	.db #0x20	; 32
      00861E 20                    2137 	.db #0x20	; 32
      00861F 3F                    2138 	.db #0x3f	; 63
      008620 21                    2139 	.db #0x21	; 33
      008621 20                    2140 	.db #0x20	; 32
      008622 00                    2141 	.db #0x00	; 0
      008623 01                    2142 	.db #0x01	; 1
      008624 00                    2143 	.db #0x00	; 0
      008625 00                    2144 	.db #0x00	; 0
      008626 00                    2145 	.db #0x00	; 0
      008627 80                    2146 	.db #0x80	; 128
      008628 80                    2147 	.db #0x80	; 128
      008629 80                    2148 	.db #0x80	; 128
      00862A 80                    2149 	.db #0x80	; 128
      00862B 80                    2150 	.db #0x80	; 128
      00862C 00                    2151 	.db #0x00	; 0
      00862D 00                    2152 	.db #0x00	; 0
      00862E 33                    2153 	.db #0x33	; 51	'3'
      00862F 24                    2154 	.db #0x24	; 36
      008630 24                    2155 	.db #0x24	; 36
      008631 24                    2156 	.db #0x24	; 36
      008632 24                    2157 	.db #0x24	; 36
      008633 19                    2158 	.db #0x19	; 25
      008634 00                    2159 	.db #0x00	; 0
      008635 00                    2160 	.db #0x00	; 0
      008636 80                    2161 	.db #0x80	; 128
      008637 80                    2162 	.db #0x80	; 128
      008638 E0                    2163 	.db #0xe0	; 224
      008639 80                    2164 	.db #0x80	; 128
      00863A 80                    2165 	.db #0x80	; 128
      00863B 00                    2166 	.db #0x00	; 0
      00863C 00                    2167 	.db #0x00	; 0
      00863D 00                    2168 	.db #0x00	; 0
      00863E 00                    2169 	.db #0x00	; 0
      00863F 00                    2170 	.db #0x00	; 0
      008640 1F                    2171 	.db #0x1f	; 31
      008641 20                    2172 	.db #0x20	; 32
      008642 20                    2173 	.db #0x20	; 32
      008643 00                    2174 	.db #0x00	; 0
      008644 00                    2175 	.db #0x00	; 0
      008645 80                    2176 	.db #0x80	; 128
      008646 80                    2177 	.db #0x80	; 128
      008647 00                    2178 	.db #0x00	; 0
      008648 00                    2179 	.db #0x00	; 0
      008649 00                    2180 	.db #0x00	; 0
      00864A 80                    2181 	.db #0x80	; 128
      00864B 80                    2182 	.db #0x80	; 128
      00864C 00                    2183 	.db #0x00	; 0
      00864D 00                    2184 	.db #0x00	; 0
      00864E 1F                    2185 	.db #0x1f	; 31
      00864F 20                    2186 	.db #0x20	; 32
      008650 20                    2187 	.db #0x20	; 32
      008651 20                    2188 	.db #0x20	; 32
      008652 10                    2189 	.db #0x10	; 16
      008653 3F                    2190 	.db #0x3f	; 63
      008654 20                    2191 	.db #0x20	; 32
      008655 80                    2192 	.db #0x80	; 128
      008656 80                    2193 	.db #0x80	; 128
      008657 80                    2194 	.db #0x80	; 128
      008658 00                    2195 	.db #0x00	; 0
      008659 00                    2196 	.db #0x00	; 0
      00865A 80                    2197 	.db #0x80	; 128
      00865B 80                    2198 	.db #0x80	; 128
      00865C 80                    2199 	.db #0x80	; 128
      00865D 00                    2200 	.db #0x00	; 0
      00865E 01                    2201 	.db #0x01	; 1
      00865F 0E                    2202 	.db #0x0e	; 14
      008660 30                    2203 	.db #0x30	; 48	'0'
      008661 08                    2204 	.db #0x08	; 8
      008662 06                    2205 	.db #0x06	; 6
      008663 01                    2206 	.db #0x01	; 1
      008664 00                    2207 	.db #0x00	; 0
      008665 80                    2208 	.db #0x80	; 128
      008666 80                    2209 	.db #0x80	; 128
      008667 00                    2210 	.db #0x00	; 0
      008668 80                    2211 	.db #0x80	; 128
      008669 00                    2212 	.db #0x00	; 0
      00866A 80                    2213 	.db #0x80	; 128
      00866B 80                    2214 	.db #0x80	; 128
      00866C 80                    2215 	.db #0x80	; 128
      00866D 0F                    2216 	.db #0x0f	; 15
      00866E 30                    2217 	.db #0x30	; 48	'0'
      00866F 0C                    2218 	.db #0x0c	; 12
      008670 03                    2219 	.db #0x03	; 3
      008671 0C                    2220 	.db #0x0c	; 12
      008672 30                    2221 	.db #0x30	; 48	'0'
      008673 0F                    2222 	.db #0x0f	; 15
      008674 00                    2223 	.db #0x00	; 0
      008675 00                    2224 	.db #0x00	; 0
      008676 80                    2225 	.db #0x80	; 128
      008677 80                    2226 	.db #0x80	; 128
      008678 00                    2227 	.db #0x00	; 0
      008679 80                    2228 	.db #0x80	; 128
      00867A 80                    2229 	.db #0x80	; 128
      00867B 80                    2230 	.db #0x80	; 128
      00867C 00                    2231 	.db #0x00	; 0
      00867D 00                    2232 	.db #0x00	; 0
      00867E 20                    2233 	.db #0x20	; 32
      00867F 31                    2234 	.db #0x31	; 49	'1'
      008680 2E                    2235 	.db #0x2e	; 46
      008681 0E                    2236 	.db #0x0e	; 14
      008682 31                    2237 	.db #0x31	; 49	'1'
      008683 20                    2238 	.db #0x20	; 32
      008684 00                    2239 	.db #0x00	; 0
      008685 80                    2240 	.db #0x80	; 128
      008686 80                    2241 	.db #0x80	; 128
      008687 80                    2242 	.db #0x80	; 128
      008688 00                    2243 	.db #0x00	; 0
      008689 00                    2244 	.db #0x00	; 0
      00868A 80                    2245 	.db #0x80	; 128
      00868B 80                    2246 	.db #0x80	; 128
      00868C 80                    2247 	.db #0x80	; 128
      00868D 80                    2248 	.db #0x80	; 128
      00868E 81                    2249 	.db #0x81	; 129
      00868F 8E                    2250 	.db #0x8e	; 142
      008690 70                    2251 	.db #0x70	; 112	'p'
      008691 18                    2252 	.db #0x18	; 24
      008692 06                    2253 	.db #0x06	; 6
      008693 01                    2254 	.db #0x01	; 1
      008694 00                    2255 	.db #0x00	; 0
      008695 00                    2256 	.db #0x00	; 0
      008696 80                    2257 	.db #0x80	; 128
      008697 80                    2258 	.db #0x80	; 128
      008698 80                    2259 	.db #0x80	; 128
      008699 80                    2260 	.db #0x80	; 128
      00869A 80                    2261 	.db #0x80	; 128
      00869B 80                    2262 	.db #0x80	; 128
      00869C 00                    2263 	.db #0x00	; 0
      00869D 00                    2264 	.db #0x00	; 0
      00869E 21                    2265 	.db #0x21	; 33
      00869F 30                    2266 	.db #0x30	; 48	'0'
      0086A0 2C                    2267 	.db #0x2c	; 44
      0086A1 22                    2268 	.db #0x22	; 34
      0086A2 21                    2269 	.db #0x21	; 33
      0086A3 30                    2270 	.db #0x30	; 48	'0'
      0086A4 00                    2271 	.db #0x00	; 0
      0086A5 00                    2272 	.db #0x00	; 0
      0086A6 00                    2273 	.db #0x00	; 0
      0086A7 00                    2274 	.db #0x00	; 0
      0086A8 00                    2275 	.db #0x00	; 0
      0086A9 80                    2276 	.db #0x80	; 128
      0086AA 7C                    2277 	.db #0x7c	; 124
      0086AB 02                    2278 	.db #0x02	; 2
      0086AC 02                    2279 	.db #0x02	; 2
      0086AD 00                    2280 	.db #0x00	; 0
      0086AE 00                    2281 	.db #0x00	; 0
      0086AF 00                    2282 	.db #0x00	; 0
      0086B0 00                    2283 	.db #0x00	; 0
      0086B1 00                    2284 	.db #0x00	; 0
      0086B2 3F                    2285 	.db #0x3f	; 63
      0086B3 40                    2286 	.db #0x40	; 64
      0086B4 40                    2287 	.db #0x40	; 64
      0086B5 00                    2288 	.db #0x00	; 0
      0086B6 00                    2289 	.db #0x00	; 0
      0086B7 00                    2290 	.db #0x00	; 0
      0086B8 00                    2291 	.db #0x00	; 0
      0086B9 FF                    2292 	.db #0xff	; 255
      0086BA 00                    2293 	.db #0x00	; 0
      0086BB 00                    2294 	.db #0x00	; 0
      0086BC 00                    2295 	.db #0x00	; 0
      0086BD 00                    2296 	.db #0x00	; 0
      0086BE 00                    2297 	.db #0x00	; 0
      0086BF 00                    2298 	.db #0x00	; 0
      0086C0 00                    2299 	.db #0x00	; 0
      0086C1 FF                    2300 	.db #0xff	; 255
      0086C2 00                    2301 	.db #0x00	; 0
      0086C3 00                    2302 	.db #0x00	; 0
      0086C4 00                    2303 	.db #0x00	; 0
      0086C5 00                    2304 	.db #0x00	; 0
      0086C6 02                    2305 	.db #0x02	; 2
      0086C7 02                    2306 	.db #0x02	; 2
      0086C8 7C                    2307 	.db #0x7c	; 124
      0086C9 80                    2308 	.db #0x80	; 128
      0086CA 00                    2309 	.db #0x00	; 0
      0086CB 00                    2310 	.db #0x00	; 0
      0086CC 00                    2311 	.db #0x00	; 0
      0086CD 00                    2312 	.db #0x00	; 0
      0086CE 40                    2313 	.db #0x40	; 64
      0086CF 40                    2314 	.db #0x40	; 64
      0086D0 3F                    2315 	.db #0x3f	; 63
      0086D1 00                    2316 	.db #0x00	; 0
      0086D2 00                    2317 	.db #0x00	; 0
      0086D3 00                    2318 	.db #0x00	; 0
      0086D4 00                    2319 	.db #0x00	; 0
      0086D5 00                    2320 	.db #0x00	; 0
      0086D6 06                    2321 	.db #0x06	; 6
      0086D7 01                    2322 	.db #0x01	; 1
      0086D8 01                    2323 	.db #0x01	; 1
      0086D9 02                    2324 	.db #0x02	; 2
      0086DA 02                    2325 	.db #0x02	; 2
      0086DB 04                    2326 	.db #0x04	; 4
      0086DC 04                    2327 	.db #0x04	; 4
      0086DD 00                    2328 	.db #0x00	; 0
      0086DE 00                    2329 	.db #0x00	; 0
      0086DF 00                    2330 	.db #0x00	; 0
      0086E0 00                    2331 	.db #0x00	; 0
      0086E1 00                    2332 	.db #0x00	; 0
      0086E2 00                    2333 	.db #0x00	; 0
      0086E3 00                    2334 	.db #0x00	; 0
      0086E4 00                    2335 	.db #0x00	; 0
                                   2336 	.area INITIALIZER
                                   2337 	.area CABS (ABS)
