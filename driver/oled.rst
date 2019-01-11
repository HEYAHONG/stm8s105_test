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
      00911B                         67 _delay_ms:
      00911B 52 02            [ 2]   68 	sub	sp, #2
                                     69 ;	driver/oled.c: 48: while(ms)
      00911D 16 05            [ 2]   70 	ldw	y, (0x05, sp)
      00911F 17 01            [ 2]   71 	ldw	(0x01, sp), y
      009121                         72 00104$:
      009121 1E 01            [ 2]   73 	ldw	x, (0x01, sp)
      009123 27 11            [ 1]   74 	jreq	00106$
                                     75 ;	driver/oled.c: 51: while(a--);
      009125 AE 07 08         [ 2]   76 	ldw	x, #0x0708
      009128                         77 00101$:
      009128 90 93            [ 1]   78 	ldw	y, x
      00912A 5A               [ 2]   79 	decw	x
      00912B 90 5D            [ 2]   80 	tnzw	y
      00912D 26 F9            [ 1]   81 	jrne	00101$
                                     82 ;	driver/oled.c: 52: ms--;
      00912F 1E 01            [ 2]   83 	ldw	x, (0x01, sp)
      009131 5A               [ 2]   84 	decw	x
      009132 1F 01            [ 2]   85 	ldw	(0x01, sp), x
      009134 20 EB            [ 2]   86 	jra	00104$
      009136                         87 00106$:
                                     88 ;	driver/oled.c: 54: return;
                                     89 ;	driver/oled.c: 55: }
      009136 5B 02            [ 2]   90 	addw	sp, #2
      009138 81               [ 4]   91 	ret
                                     92 ;	driver/oled.c: 77: void OLED_WR_Byte(u8 dat,u8 cmd)
                                     93 ;	-----------------------------------------
                                     94 ;	 function OLED_WR_Byte
                                     95 ;	-----------------------------------------
      009139                         96 _OLED_WR_Byte:
      009139 88               [ 1]   97 	push	a
                                     98 ;	driver/oled.c: 80: if(cmd)
      00913A 0D 05            [ 1]   99 	tnz	(0x05, sp)
      00913C 27 0D            [ 1]  100 	jreq	00102$
                                    101 ;	driver/oled.c: 81: OLED_DC_Set();
      00913E 4B 10            [ 1]  102 	push	#0x10
      009140 4B 0A            [ 1]  103 	push	#0x0a
      009142 4B 50            [ 1]  104 	push	#0x50
      009144 CD 96 A1         [ 4]  105 	call	_GPIO_WriteHigh
      009147 5B 03            [ 2]  106 	addw	sp, #3
      009149 20 0B            [ 2]  107 	jra	00103$
      00914B                        108 00102$:
                                    109 ;	driver/oled.c: 83: OLED_DC_Clr();
      00914B 4B 10            [ 1]  110 	push	#0x10
      00914D 4B 0A            [ 1]  111 	push	#0x0a
      00914F 4B 50            [ 1]  112 	push	#0x50
      009151 CD 96 A8         [ 4]  113 	call	_GPIO_WriteLow
      009154 5B 03            [ 2]  114 	addw	sp, #3
      009156                        115 00103$:
                                    116 ;	driver/oled.c: 84: OLED_CS_Clr();
      009156 4B 20            [ 1]  117 	push	#0x20
      009158 4B 0A            [ 1]  118 	push	#0x0a
      00915A 4B 50            [ 1]  119 	push	#0x50
      00915C CD 96 A8         [ 4]  120 	call	_GPIO_WriteLow
      00915F 5B 03            [ 2]  121 	addw	sp, #3
                                    122 ;	driver/oled.c: 85: for(i=0;i<8;i++)
      009161 0F 01            [ 1]  123 	clr	(0x01, sp)
      009163                        124 00108$:
                                    125 ;	driver/oled.c: 87: OLED_SCLK_Clr();
      009163 4B 02            [ 1]  126 	push	#0x02
      009165 4B 0A            [ 1]  127 	push	#0x0a
      009167 4B 50            [ 1]  128 	push	#0x50
      009169 CD 96 A8         [ 4]  129 	call	_GPIO_WriteLow
      00916C 5B 03            [ 2]  130 	addw	sp, #3
                                    131 ;	driver/oled.c: 88: if(dat&0x80)
      00916E 7B 04            [ 1]  132 	ld	a, (0x04, sp)
      009170 2A 0D            [ 1]  133 	jrpl	00105$
                                    134 ;	driver/oled.c: 90: OLED_SDIN_Set();
      009172 4B 04            [ 1]  135 	push	#0x04
      009174 4B 0A            [ 1]  136 	push	#0x0a
      009176 4B 50            [ 1]  137 	push	#0x50
      009178 CD 96 A1         [ 4]  138 	call	_GPIO_WriteHigh
      00917B 5B 03            [ 2]  139 	addw	sp, #3
      00917D 20 0B            [ 2]  140 	jra	00106$
      00917F                        141 00105$:
                                    142 ;	driver/oled.c: 93: OLED_SDIN_Clr();
      00917F 4B 04            [ 1]  143 	push	#0x04
      009181 4B 0A            [ 1]  144 	push	#0x0a
      009183 4B 50            [ 1]  145 	push	#0x50
      009185 CD 96 A8         [ 4]  146 	call	_GPIO_WriteLow
      009188 5B 03            [ 2]  147 	addw	sp, #3
      00918A                        148 00106$:
                                    149 ;	driver/oled.c: 94: OLED_SCLK_Set();
      00918A 4B 02            [ 1]  150 	push	#0x02
      00918C 4B 0A            [ 1]  151 	push	#0x0a
      00918E 4B 50            [ 1]  152 	push	#0x50
      009190 CD 96 A1         [ 4]  153 	call	_GPIO_WriteHigh
      009193 5B 03            [ 2]  154 	addw	sp, #3
                                    155 ;	driver/oled.c: 95: dat<<=1;
      009195 08 04            [ 1]  156 	sll	(0x04, sp)
                                    157 ;	driver/oled.c: 85: for(i=0;i<8;i++)
      009197 0C 01            [ 1]  158 	inc	(0x01, sp)
      009199 7B 01            [ 1]  159 	ld	a, (0x01, sp)
      00919B A1 08            [ 1]  160 	cp	a, #0x08
      00919D 25 C4            [ 1]  161 	jrc	00108$
                                    162 ;	driver/oled.c: 97: OLED_CS_Set();
      00919F 4B 20            [ 1]  163 	push	#0x20
      0091A1 4B 0A            [ 1]  164 	push	#0x0a
      0091A3 4B 50            [ 1]  165 	push	#0x50
      0091A5 CD 96 A1         [ 4]  166 	call	_GPIO_WriteHigh
      0091A8 5B 03            [ 2]  167 	addw	sp, #3
                                    168 ;	driver/oled.c: 98: OLED_DC_Set();
      0091AA 4B 10            [ 1]  169 	push	#0x10
      0091AC 4B 0A            [ 1]  170 	push	#0x0a
      0091AE 4B 50            [ 1]  171 	push	#0x50
      0091B0 CD 96 A1         [ 4]  172 	call	_GPIO_WriteHigh
                                    173 ;	driver/oled.c: 99: }
      0091B3 5B 04            [ 2]  174 	addw	sp, #4
      0091B5 81               [ 4]  175 	ret
                                    176 ;	driver/oled.c: 101: void OLED_Set_Pos(unsigned char x, unsigned char y)
                                    177 ;	-----------------------------------------
                                    178 ;	 function OLED_Set_Pos
                                    179 ;	-----------------------------------------
      0091B6                        180 _OLED_Set_Pos:
      0091B6 52 02            [ 2]  181 	sub	sp, #2
                                    182 ;	driver/oled.c: 103: OLED_WR_Byte(0xb0+y,OLED_CMD);
      0091B8 7B 06            [ 1]  183 	ld	a, (0x06, sp)
      0091BA AB B0            [ 1]  184 	add	a, #0xb0
      0091BC 4B 00            [ 1]  185 	push	#0x00
      0091BE 88               [ 1]  186 	push	a
      0091BF CD 91 39         [ 4]  187 	call	_OLED_WR_Byte
      0091C2 5B 02            [ 2]  188 	addw	sp, #2
                                    189 ;	driver/oled.c: 104: OLED_WR_Byte(((x&0xf0)>>4)|0x10,OLED_CMD);
      0091C4 7B 05            [ 1]  190 	ld	a, (0x05, sp)
      0091C6 0F 01            [ 1]  191 	clr	(0x01, sp)
      0091C8 88               [ 1]  192 	push	a
      0091C9 A4 F0            [ 1]  193 	and	a, #0xf0
      0091CB 97               [ 1]  194 	ld	xl, a
      0091CC 4F               [ 1]  195 	clr	a
      0091CD 95               [ 1]  196 	ld	xh, a
      0091CE 84               [ 1]  197 	pop	a
      0091CF 57               [ 2]  198 	sraw	x
      0091D0 57               [ 2]  199 	sraw	x
      0091D1 57               [ 2]  200 	sraw	x
      0091D2 57               [ 2]  201 	sraw	x
      0091D3 88               [ 1]  202 	push	a
      0091D4 9F               [ 1]  203 	ld	a, xl
      0091D5 AA 10            [ 1]  204 	or	a, #0x10
      0091D7 97               [ 1]  205 	ld	xl, a
      0091D8 4B 00            [ 1]  206 	push	#0x00
      0091DA 89               [ 2]  207 	pushw	x
      0091DB 5B 01            [ 2]  208 	addw	sp, #1
      0091DD CD 91 39         [ 4]  209 	call	_OLED_WR_Byte
      0091E0 5B 02            [ 2]  210 	addw	sp, #2
      0091E2 84               [ 1]  211 	pop	a
                                    212 ;	driver/oled.c: 105: OLED_WR_Byte((x&0x0f)|0x01,OLED_CMD);
      0091E3 A4 0F            [ 1]  213 	and	a, #0x0f
      0091E5 95               [ 1]  214 	ld	xh, a
      0091E6 4F               [ 1]  215 	clr	a
      0091E7 02               [ 1]  216 	rlwa	x
      0091E8 AA 01            [ 1]  217 	or	a, #0x01
      0091EA 4B 00            [ 1]  218 	push	#0x00
      0091EC 88               [ 1]  219 	push	a
      0091ED CD 91 39         [ 4]  220 	call	_OLED_WR_Byte
                                    221 ;	driver/oled.c: 106: }
      0091F0 5B 04            [ 2]  222 	addw	sp, #4
      0091F2 81               [ 4]  223 	ret
                                    224 ;	driver/oled.c: 108: void OLED_Display_On(void)
                                    225 ;	-----------------------------------------
                                    226 ;	 function OLED_Display_On
                                    227 ;	-----------------------------------------
      0091F3                        228 _OLED_Display_On:
                                    229 ;	driver/oled.c: 110: OLED_WR_Byte(0X8D,OLED_CMD);  //SET DCDC命令
      0091F3 4B 00            [ 1]  230 	push	#0x00
      0091F5 4B 8D            [ 1]  231 	push	#0x8d
      0091F7 CD 91 39         [ 4]  232 	call	_OLED_WR_Byte
      0091FA 5B 02            [ 2]  233 	addw	sp, #2
                                    234 ;	driver/oled.c: 111: OLED_WR_Byte(0X14,OLED_CMD);  //DCDC ON
      0091FC 4B 00            [ 1]  235 	push	#0x00
      0091FE 4B 14            [ 1]  236 	push	#0x14
      009200 CD 91 39         [ 4]  237 	call	_OLED_WR_Byte
      009203 5B 02            [ 2]  238 	addw	sp, #2
                                    239 ;	driver/oled.c: 112: OLED_WR_Byte(0XAF,OLED_CMD);  //DISPLAY ON
      009205 4B 00            [ 1]  240 	push	#0x00
      009207 4B AF            [ 1]  241 	push	#0xaf
      009209 CD 91 39         [ 4]  242 	call	_OLED_WR_Byte
      00920C 5B 02            [ 2]  243 	addw	sp, #2
                                    244 ;	driver/oled.c: 113: }
      00920E 81               [ 4]  245 	ret
                                    246 ;	driver/oled.c: 115: void OLED_Display_Off(void)
                                    247 ;	-----------------------------------------
                                    248 ;	 function OLED_Display_Off
                                    249 ;	-----------------------------------------
      00920F                        250 _OLED_Display_Off:
                                    251 ;	driver/oled.c: 117: OLED_WR_Byte(0X8D,OLED_CMD);  //SET DCDC命令
      00920F 4B 00            [ 1]  252 	push	#0x00
      009211 4B 8D            [ 1]  253 	push	#0x8d
      009213 CD 91 39         [ 4]  254 	call	_OLED_WR_Byte
      009216 5B 02            [ 2]  255 	addw	sp, #2
                                    256 ;	driver/oled.c: 118: OLED_WR_Byte(0X10,OLED_CMD);  //DCDC OFF
      009218 4B 00            [ 1]  257 	push	#0x00
      00921A 4B 10            [ 1]  258 	push	#0x10
      00921C CD 91 39         [ 4]  259 	call	_OLED_WR_Byte
      00921F 5B 02            [ 2]  260 	addw	sp, #2
                                    261 ;	driver/oled.c: 119: OLED_WR_Byte(0XAE,OLED_CMD);  //DISPLAY OFF
      009221 4B 00            [ 1]  262 	push	#0x00
      009223 4B AE            [ 1]  263 	push	#0xae
      009225 CD 91 39         [ 4]  264 	call	_OLED_WR_Byte
      009228 5B 02            [ 2]  265 	addw	sp, #2
                                    266 ;	driver/oled.c: 120: }
      00922A 81               [ 4]  267 	ret
                                    268 ;	driver/oled.c: 122: void OLED_Clear(void)
                                    269 ;	-----------------------------------------
                                    270 ;	 function OLED_Clear
                                    271 ;	-----------------------------------------
      00922B                        272 _OLED_Clear:
      00922B 88               [ 1]  273 	push	a
                                    274 ;	driver/oled.c: 125: for(i=0;i<8;i++)
      00922C 0F 01            [ 1]  275 	clr	(0x01, sp)
      00922E                        276 00105$:
                                    277 ;	driver/oled.c: 127: OLED_WR_Byte (0xb0+i,OLED_CMD);    //设置页地址（0~7）
      00922E 7B 01            [ 1]  278 	ld	a, (0x01, sp)
      009230 AB B0            [ 1]  279 	add	a, #0xb0
      009232 4B 00            [ 1]  280 	push	#0x00
      009234 88               [ 1]  281 	push	a
      009235 CD 91 39         [ 4]  282 	call	_OLED_WR_Byte
      009238 5B 02            [ 2]  283 	addw	sp, #2
                                    284 ;	driver/oled.c: 128: OLED_WR_Byte (0x00,OLED_CMD);      //设置显示位置—列低地址
      00923A 4B 00            [ 1]  285 	push	#0x00
      00923C 4B 00            [ 1]  286 	push	#0x00
      00923E CD 91 39         [ 4]  287 	call	_OLED_WR_Byte
      009241 5B 02            [ 2]  288 	addw	sp, #2
                                    289 ;	driver/oled.c: 129: OLED_WR_Byte (0x10,OLED_CMD);      //设置显示位置—列高地址
      009243 4B 00            [ 1]  290 	push	#0x00
      009245 4B 10            [ 1]  291 	push	#0x10
      009247 CD 91 39         [ 4]  292 	call	_OLED_WR_Byte
      00924A 5B 02            [ 2]  293 	addw	sp, #2
                                    294 ;	driver/oled.c: 130: for(n=0;n<128;n++)OLED_WR_Byte(0,OLED_DATA);
      00924C 4F               [ 1]  295 	clr	a
      00924D                        296 00103$:
      00924D 88               [ 1]  297 	push	a
      00924E 4B 01            [ 1]  298 	push	#0x01
      009250 4B 00            [ 1]  299 	push	#0x00
      009252 CD 91 39         [ 4]  300 	call	_OLED_WR_Byte
      009255 5B 02            [ 2]  301 	addw	sp, #2
      009257 84               [ 1]  302 	pop	a
      009258 4C               [ 1]  303 	inc	a
      009259 A1 80            [ 1]  304 	cp	a, #0x80
      00925B 25 F0            [ 1]  305 	jrc	00103$
                                    306 ;	driver/oled.c: 125: for(i=0;i<8;i++)
      00925D 0C 01            [ 1]  307 	inc	(0x01, sp)
      00925F 7B 01            [ 1]  308 	ld	a, (0x01, sp)
      009261 A1 08            [ 1]  309 	cp	a, #0x08
      009263 25 C9            [ 1]  310 	jrc	00105$
                                    311 ;	driver/oled.c: 132: }
      009265 84               [ 1]  312 	pop	a
      009266 81               [ 4]  313 	ret
                                    314 ;	driver/oled.c: 140: void OLED_ShowChar(u8 x,u8 y,u8 chr)
                                    315 ;	-----------------------------------------
                                    316 ;	 function OLED_ShowChar
                                    317 ;	-----------------------------------------
      009267                        318 _OLED_ShowChar:
      009267 52 04            [ 2]  319 	sub	sp, #4
                                    320 ;	driver/oled.c: 143: c=chr-' ';//得到偏移后的值
      009269 7B 09            [ 1]  321 	ld	a, (0x09, sp)
      00926B A0 20            [ 1]  322 	sub	a, #0x20
      00926D 6B 04            [ 1]  323 	ld	(0x04, sp), a
                                    324 ;	driver/oled.c: 144: if(x>Max_Column-1){x=0;y=y+2;}
      00926F 7B 07            [ 1]  325 	ld	a, (0x07, sp)
      009271 A1 7F            [ 1]  326 	cp	a, #0x7f
      009273 23 08            [ 2]  327 	jrule	00102$
      009275 0F 07            [ 1]  328 	clr	(0x07, sp)
      009277 7B 08            [ 1]  329 	ld	a, (0x08, sp)
      009279 AB 02            [ 1]  330 	add	a, #0x02
      00927B 6B 08            [ 1]  331 	ld	(0x08, sp), a
      00927D                        332 00102$:
                                    333 ;	driver/oled.c: 147: OLED_Set_Pos(x,y);
      00927D 7B 08            [ 1]  334 	ld	a, (0x08, sp)
      00927F 88               [ 1]  335 	push	a
      009280 7B 08            [ 1]  336 	ld	a, (0x08, sp)
      009282 88               [ 1]  337 	push	a
      009283 CD 91 B6         [ 4]  338 	call	_OLED_Set_Pos
      009286 5B 02            [ 2]  339 	addw	sp, #2
                                    340 ;	driver/oled.c: 148: for(i=0;i<8;i++)
      009288 0F 03            [ 1]  341 	clr	(0x03, sp)
      00928A                        342 00105$:
                                    343 ;	driver/oled.c: 149: OLED_WR_Byte(F8X16[c*16+i],OLED_DATA);
      00928A 5F               [ 1]  344 	clrw	x
      00928B 7B 04            [ 1]  345 	ld	a, (0x04, sp)
      00928D 97               [ 1]  346 	ld	xl, a
      00928E 58               [ 2]  347 	sllw	x
      00928F 58               [ 2]  348 	sllw	x
      009290 58               [ 2]  349 	sllw	x
      009291 58               [ 2]  350 	sllw	x
      009292 1F 01            [ 2]  351 	ldw	(0x01, sp), x
      009294 5F               [ 1]  352 	clrw	x
      009295 7B 03            [ 1]  353 	ld	a, (0x03, sp)
      009297 97               [ 1]  354 	ld	xl, a
      009298 72 FB 01         [ 2]  355 	addw	x, (0x01, sp)
      00929B 1C 80 F8         [ 2]  356 	addw	x, #_F8X16
      00929E F6               [ 1]  357 	ld	a, (x)
      00929F 4B 01            [ 1]  358 	push	#0x01
      0092A1 88               [ 1]  359 	push	a
      0092A2 CD 91 39         [ 4]  360 	call	_OLED_WR_Byte
      0092A5 5B 02            [ 2]  361 	addw	sp, #2
                                    362 ;	driver/oled.c: 148: for(i=0;i<8;i++)
      0092A7 0C 03            [ 1]  363 	inc	(0x03, sp)
      0092A9 7B 03            [ 1]  364 	ld	a, (0x03, sp)
      0092AB A1 08            [ 1]  365 	cp	a, #0x08
      0092AD 25 DB            [ 1]  366 	jrc	00105$
                                    367 ;	driver/oled.c: 150: OLED_Set_Pos(x,y+1);
      0092AF 7B 08            [ 1]  368 	ld	a, (0x08, sp)
      0092B1 4C               [ 1]  369 	inc	a
      0092B2 88               [ 1]  370 	push	a
      0092B3 7B 08            [ 1]  371 	ld	a, (0x08, sp)
      0092B5 88               [ 1]  372 	push	a
      0092B6 CD 91 B6         [ 4]  373 	call	_OLED_Set_Pos
      0092B9 5B 02            [ 2]  374 	addw	sp, #2
                                    375 ;	driver/oled.c: 151: for(i=0;i<8;i++)
      0092BB 0F 03            [ 1]  376 	clr	(0x03, sp)
      0092BD                        377 00107$:
                                    378 ;	driver/oled.c: 152: OLED_WR_Byte(F8X16[c*16+i+8],OLED_DATA);
      0092BD 5F               [ 1]  379 	clrw	x
      0092BE 7B 03            [ 1]  380 	ld	a, (0x03, sp)
      0092C0 97               [ 1]  381 	ld	xl, a
      0092C1 72 FB 01         [ 2]  382 	addw	x, (0x01, sp)
      0092C4 1C 00 08         [ 2]  383 	addw	x, #0x0008
      0092C7 1C 80 F8         [ 2]  384 	addw	x, #_F8X16
      0092CA F6               [ 1]  385 	ld	a, (x)
      0092CB 4B 01            [ 1]  386 	push	#0x01
      0092CD 88               [ 1]  387 	push	a
      0092CE CD 91 39         [ 4]  388 	call	_OLED_WR_Byte
      0092D1 5B 02            [ 2]  389 	addw	sp, #2
                                    390 ;	driver/oled.c: 151: for(i=0;i<8;i++)
      0092D3 0C 03            [ 1]  391 	inc	(0x03, sp)
      0092D5 7B 03            [ 1]  392 	ld	a, (0x03, sp)
      0092D7 A1 08            [ 1]  393 	cp	a, #0x08
      0092D9 25 E2            [ 1]  394 	jrc	00107$
                                    395 ;	driver/oled.c: 163: }
      0092DB 5B 04            [ 2]  396 	addw	sp, #4
      0092DD 81               [ 4]  397 	ret
                                    398 ;	driver/oled.c: 165: u32 oled_pow(u8 m,u8 n)
                                    399 ;	-----------------------------------------
                                    400 ;	 function oled_pow
                                    401 ;	-----------------------------------------
      0092DE                        402 _oled_pow:
      0092DE 52 09            [ 2]  403 	sub	sp, #9
                                    404 ;	driver/oled.c: 167: u32 result=1;
      0092E0 5F               [ 1]  405 	clrw	x
      0092E1 5C               [ 1]  406 	incw	x
      0092E2 0F 07            [ 1]  407 	clr	(0x07, sp)
      0092E4 0F 06            [ 1]  408 	clr	(0x06, sp)
                                    409 ;	driver/oled.c: 168: while(n--)result*=m;
      0092E6 7B 0D            [ 1]  410 	ld	a, (0x0d, sp)
      0092E8 6B 05            [ 1]  411 	ld	(0x05, sp), a
      0092EA                        412 00101$:
      0092EA 7B 05            [ 1]  413 	ld	a, (0x05, sp)
      0092EC 0A 05            [ 1]  414 	dec	(0x05, sp)
      0092EE 4D               [ 1]  415 	tnz	a
      0092EF 27 1D            [ 1]  416 	jreq	00103$
      0092F1 7B 0C            [ 1]  417 	ld	a, (0x0c, sp)
      0092F3 6B 04            [ 1]  418 	ld	(0x04, sp), a
      0092F5 90 5F            [ 1]  419 	clrw	y
      0092F7 0F 01            [ 1]  420 	clr	(0x01, sp)
      0092F9 7B 04            [ 1]  421 	ld	a, (0x04, sp)
      0092FB 88               [ 1]  422 	push	a
      0092FC 90 89            [ 2]  423 	pushw	y
      0092FE 7B 04            [ 1]  424 	ld	a, (0x04, sp)
      009300 88               [ 1]  425 	push	a
      009301 89               [ 2]  426 	pushw	x
      009302 1E 0C            [ 2]  427 	ldw	x, (0x0c, sp)
      009304 89               [ 2]  428 	pushw	x
      009305 CD A8 76         [ 4]  429 	call	__mullong
      009308 5B 08            [ 2]  430 	addw	sp, #8
      00930A 17 06            [ 2]  431 	ldw	(0x06, sp), y
      00930C 20 DC            [ 2]  432 	jra	00101$
      00930E                        433 00103$:
                                    434 ;	driver/oled.c: 169: return result;
      00930E 16 06            [ 2]  435 	ldw	y, (0x06, sp)
                                    436 ;	driver/oled.c: 170: }
      009310 5B 09            [ 2]  437 	addw	sp, #9
      009312 81               [ 4]  438 	ret
                                    439 ;	driver/oled.c: 177: void OLED_ShowNum(u8 x,u8 y,u32 num,u8 len,u8 size2)
                                    440 ;	-----------------------------------------
                                    441 ;	 function OLED_ShowNum
                                    442 ;	-----------------------------------------
      009313                        443 _OLED_ShowNum:
      009313 52 07            [ 2]  444 	sub	sp, #7
                                    445 ;	driver/oled.c: 180: u8 enshow=0;
      009315 0F 05            [ 1]  446 	clr	(0x05, sp)
                                    447 ;	driver/oled.c: 181: for(t=0;t<len;t++)
      009317 0F 07            [ 1]  448 	clr	(0x07, sp)
      009319                        449 00110$:
      009319 7B 07            [ 1]  450 	ld	a, (0x07, sp)
      00931B 11 10            [ 1]  451 	cp	a, (0x10, sp)
      00931D 25 03            [ 1]  452 	jrc	00139$
      00931F CC 93 AD         [ 2]  453 	jp	00111$
      009322                        454 00139$:
                                    455 ;	driver/oled.c: 183: temp=(num/oled_pow(10,len-t-1))%10;
      009322 7B 10            [ 1]  456 	ld	a, (0x10, sp)
      009324 10 07            [ 1]  457 	sub	a, (0x07, sp)
      009326 4A               [ 1]  458 	dec	a
      009327 88               [ 1]  459 	push	a
      009328 4B 0A            [ 1]  460 	push	#0x0a
      00932A CD 92 DE         [ 4]  461 	call	_oled_pow
      00932D 5B 02            [ 2]  462 	addw	sp, #2
      00932F 89               [ 2]  463 	pushw	x
      009330 90 89            [ 2]  464 	pushw	y
      009332 1E 12            [ 2]  465 	ldw	x, (0x12, sp)
      009334 89               [ 2]  466 	pushw	x
      009335 1E 12            [ 2]  467 	ldw	x, (0x12, sp)
      009337 89               [ 2]  468 	pushw	x
      009338 CD A7 C5         [ 4]  469 	call	__divulong
      00933B 5B 08            [ 2]  470 	addw	sp, #8
      00933D 4B 0A            [ 1]  471 	push	#0x0a
      00933F 4B 00            [ 1]  472 	push	#0x00
      009341 4B 00            [ 1]  473 	push	#0x00
      009343 4B 00            [ 1]  474 	push	#0x00
      009345 89               [ 2]  475 	pushw	x
      009346 90 89            [ 2]  476 	pushw	y
      009348 CD A7 07         [ 4]  477 	call	__modulong
      00934B 5B 08            [ 2]  478 	addw	sp, #8
      00934D 9F               [ 1]  479 	ld	a, xl
      00934E 6B 06            [ 1]  480 	ld	(0x06, sp), a
                                    481 ;	driver/oled.c: 188: OLED_ShowChar(x+(size2/2)*t,y,' ');
      009350 5F               [ 1]  482 	clrw	x
      009351 7B 11            [ 1]  483 	ld	a, (0x11, sp)
      009353 97               [ 1]  484 	ld	xl, a
      009354 7B 07            [ 1]  485 	ld	a, (0x07, sp)
      009356 6B 04            [ 1]  486 	ld	(0x04, sp), a
      009358 7B 0A            [ 1]  487 	ld	a, (0x0a, sp)
      00935A 6B 03            [ 1]  488 	ld	(0x03, sp), a
      00935C 4B 02            [ 1]  489 	push	#0x02
      00935E 4B 00            [ 1]  490 	push	#0x00
      009360 89               [ 2]  491 	pushw	x
      009361 CD A9 08         [ 4]  492 	call	__divsint
      009364 5B 04            [ 2]  493 	addw	sp, #4
      009366 7B 04            [ 1]  494 	ld	a, (0x04, sp)
      009368 42               [ 4]  495 	mul	x, a
      009369 9F               [ 1]  496 	ld	a, xl
      00936A 1B 03            [ 1]  497 	add	a, (0x03, sp)
      00936C 90 97            [ 1]  498 	ld	yl, a
                                    499 ;	driver/oled.c: 184: if(enshow==0&&t<(len-1))
      00936E 0D 05            [ 1]  500 	tnz	(0x05, sp)
      009370 26 26            [ 1]  501 	jrne	00105$
      009372 5F               [ 1]  502 	clrw	x
      009373 7B 10            [ 1]  503 	ld	a, (0x10, sp)
      009375 97               [ 1]  504 	ld	xl, a
      009376 5A               [ 2]  505 	decw	x
      009377 1F 01            [ 2]  506 	ldw	(0x01, sp), x
      009379 5F               [ 1]  507 	clrw	x
      00937A 7B 07            [ 1]  508 	ld	a, (0x07, sp)
      00937C 97               [ 1]  509 	ld	xl, a
      00937D 13 01            [ 2]  510 	cpw	x, (0x01, sp)
      00937F 2E 17            [ 1]  511 	jrsge	00105$
                                    512 ;	driver/oled.c: 186: if(temp==0)
      009381 0D 06            [ 1]  513 	tnz	(0x06, sp)
      009383 26 0F            [ 1]  514 	jrne	00102$
                                    515 ;	driver/oled.c: 188: OLED_ShowChar(x+(size2/2)*t,y,' ');
      009385 4B 20            [ 1]  516 	push	#0x20
      009387 7B 0C            [ 1]  517 	ld	a, (0x0c, sp)
      009389 88               [ 1]  518 	push	a
      00938A 90 9F            [ 1]  519 	ld	a, yl
      00938C 88               [ 1]  520 	push	a
      00938D CD 92 67         [ 4]  521 	call	_OLED_ShowChar
      009390 5B 03            [ 2]  522 	addw	sp, #3
                                    523 ;	driver/oled.c: 189: continue;
      009392 20 14            [ 2]  524 	jra	00107$
      009394                        525 00102$:
                                    526 ;	driver/oled.c: 190: }else enshow=1;
      009394 A6 01            [ 1]  527 	ld	a, #0x01
      009396 6B 05            [ 1]  528 	ld	(0x05, sp), a
      009398                        529 00105$:
                                    530 ;	driver/oled.c: 193: OLED_ShowChar(x+(size2/2)*t,y,temp+'0');
      009398 7B 06            [ 1]  531 	ld	a, (0x06, sp)
      00939A AB 30            [ 1]  532 	add	a, #0x30
      00939C 88               [ 1]  533 	push	a
      00939D 7B 0C            [ 1]  534 	ld	a, (0x0c, sp)
      00939F 88               [ 1]  535 	push	a
      0093A0 90 9F            [ 1]  536 	ld	a, yl
      0093A2 88               [ 1]  537 	push	a
      0093A3 CD 92 67         [ 4]  538 	call	_OLED_ShowChar
      0093A6 5B 03            [ 2]  539 	addw	sp, #3
      0093A8                        540 00107$:
                                    541 ;	driver/oled.c: 181: for(t=0;t<len;t++)
      0093A8 0C 07            [ 1]  542 	inc	(0x07, sp)
      0093AA CC 93 19         [ 2]  543 	jp	00110$
      0093AD                        544 00111$:
                                    545 ;	driver/oled.c: 195: }
      0093AD 5B 07            [ 2]  546 	addw	sp, #7
      0093AF 81               [ 4]  547 	ret
                                    548 ;	driver/oled.c: 197: void OLED_ShowString(u8 x,u8 y,u8 *chr)
                                    549 ;	-----------------------------------------
                                    550 ;	 function OLED_ShowString
                                    551 ;	-----------------------------------------
      0093B0                        552 _OLED_ShowString:
      0093B0 88               [ 1]  553 	push	a
                                    554 ;	driver/oled.c: 200: while (chr[j]!='\0')
      0093B1 0F 01            [ 1]  555 	clr	(0x01, sp)
      0093B3                        556 00103$:
      0093B3 5F               [ 1]  557 	clrw	x
      0093B4 7B 01            [ 1]  558 	ld	a, (0x01, sp)
      0093B6 97               [ 1]  559 	ld	xl, a
      0093B7 72 FB 06         [ 2]  560 	addw	x, (0x06, sp)
      0093BA F6               [ 1]  561 	ld	a, (x)
      0093BB 27 24            [ 1]  562 	jreq	00106$
                                    563 ;	driver/oled.c: 201: {		OLED_ShowChar(x,y,chr[j]);
      0093BD 88               [ 1]  564 	push	a
      0093BE 7B 06            [ 1]  565 	ld	a, (0x06, sp)
      0093C0 88               [ 1]  566 	push	a
      0093C1 7B 06            [ 1]  567 	ld	a, (0x06, sp)
      0093C3 88               [ 1]  568 	push	a
      0093C4 CD 92 67         [ 4]  569 	call	_OLED_ShowChar
      0093C7 5B 03            [ 2]  570 	addw	sp, #3
                                    571 ;	driver/oled.c: 202: x+=8;
      0093C9 7B 04            [ 1]  572 	ld	a, (0x04, sp)
      0093CB AB 08            [ 1]  573 	add	a, #0x08
      0093CD 6B 04            [ 1]  574 	ld	(0x04, sp), a
                                    575 ;	driver/oled.c: 203: if(x>120){x=0;y+=2;}
      0093CF 7B 04            [ 1]  576 	ld	a, (0x04, sp)
      0093D1 A1 78            [ 1]  577 	cp	a, #0x78
      0093D3 23 08            [ 2]  578 	jrule	00102$
      0093D5 0F 04            [ 1]  579 	clr	(0x04, sp)
      0093D7 7B 05            [ 1]  580 	ld	a, (0x05, sp)
      0093D9 AB 02            [ 1]  581 	add	a, #0x02
      0093DB 6B 05            [ 1]  582 	ld	(0x05, sp), a
      0093DD                        583 00102$:
                                    584 ;	driver/oled.c: 204: j++;
      0093DD 0C 01            [ 1]  585 	inc	(0x01, sp)
      0093DF 20 D2            [ 2]  586 	jra	00103$
      0093E1                        587 00106$:
                                    588 ;	driver/oled.c: 206: }
      0093E1 84               [ 1]  589 	pop	a
      0093E2 81               [ 4]  590 	ret
                                    591 ;	driver/oled.c: 248: void OLED_Init(void)
                                    592 ;	-----------------------------------------
                                    593 ;	 function OLED_Init
                                    594 ;	-----------------------------------------
      0093E3                        595 _OLED_Init:
                                    596 ;	driver/oled.c: 250: GPIO_Init(OLED_SCLK_PORT, (GPIO_Pin_TypeDef)OLED_SCLK_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      0093E3 4B E0            [ 1]  597 	push	#0xe0
      0093E5 4B 02            [ 1]  598 	push	#0x02
      0093E7 4B 0A            [ 1]  599 	push	#0x0a
      0093E9 4B 50            [ 1]  600 	push	#0x50
      0093EB CD 96 26         [ 4]  601 	call	_GPIO_Init
      0093EE 5B 04            [ 2]  602 	addw	sp, #4
                                    603 ;	driver/oled.c: 251: GPIO_Init(OLED_SDIN_PORT, (GPIO_Pin_TypeDef)OLED_SDIN_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      0093F0 4B E0            [ 1]  604 	push	#0xe0
      0093F2 4B 04            [ 1]  605 	push	#0x04
      0093F4 4B 0A            [ 1]  606 	push	#0x0a
      0093F6 4B 50            [ 1]  607 	push	#0x50
      0093F8 CD 96 26         [ 4]  608 	call	_GPIO_Init
      0093FB 5B 04            [ 2]  609 	addw	sp, #4
                                    610 ;	driver/oled.c: 252: GPIO_Init(OLED_RST_PORT, (GPIO_Pin_TypeDef)OLED_RST_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      0093FD 4B E0            [ 1]  611 	push	#0xe0
      0093FF 4B 08            [ 1]  612 	push	#0x08
      009401 4B 0A            [ 1]  613 	push	#0x0a
      009403 4B 50            [ 1]  614 	push	#0x50
      009405 CD 96 26         [ 4]  615 	call	_GPIO_Init
      009408 5B 04            [ 2]  616 	addw	sp, #4
                                    617 ;	driver/oled.c: 253: GPIO_Init(OLED_DC_PORT, (GPIO_Pin_TypeDef)OLED_DC_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      00940A 4B E0            [ 1]  618 	push	#0xe0
      00940C 4B 10            [ 1]  619 	push	#0x10
      00940E 4B 0A            [ 1]  620 	push	#0x0a
      009410 4B 50            [ 1]  621 	push	#0x50
      009412 CD 96 26         [ 4]  622 	call	_GPIO_Init
      009415 5B 04            [ 2]  623 	addw	sp, #4
                                    624 ;	driver/oled.c: 254: GPIO_Init(OLED_CS_PORT, (GPIO_Pin_TypeDef)OLED_CS_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      009417 4B E0            [ 1]  625 	push	#0xe0
      009419 4B 20            [ 1]  626 	push	#0x20
      00941B 4B 0A            [ 1]  627 	push	#0x0a
      00941D 4B 50            [ 1]  628 	push	#0x50
      00941F CD 96 26         [ 4]  629 	call	_GPIO_Init
      009422 5B 04            [ 2]  630 	addw	sp, #4
                                    631 ;	driver/oled.c: 257: OLED_RST_Set();
      009424 4B 08            [ 1]  632 	push	#0x08
      009426 4B 0A            [ 1]  633 	push	#0x0a
      009428 4B 50            [ 1]  634 	push	#0x50
      00942A CD 96 A1         [ 4]  635 	call	_GPIO_WriteHigh
      00942D 5B 03            [ 2]  636 	addw	sp, #3
                                    637 ;	driver/oled.c: 258: delay_ms(100);
      00942F 4B 64            [ 1]  638 	push	#0x64
      009431 4B 00            [ 1]  639 	push	#0x00
      009433 CD 91 1B         [ 4]  640 	call	_delay_ms
      009436 5B 02            [ 2]  641 	addw	sp, #2
                                    642 ;	driver/oled.c: 259: OLED_RST_Clr();
      009438 4B 08            [ 1]  643 	push	#0x08
      00943A 4B 0A            [ 1]  644 	push	#0x0a
      00943C 4B 50            [ 1]  645 	push	#0x50
      00943E CD 96 A8         [ 4]  646 	call	_GPIO_WriteLow
      009441 5B 03            [ 2]  647 	addw	sp, #3
                                    648 ;	driver/oled.c: 260: delay_ms(100);
      009443 4B 64            [ 1]  649 	push	#0x64
      009445 4B 00            [ 1]  650 	push	#0x00
      009447 CD 91 1B         [ 4]  651 	call	_delay_ms
      00944A 5B 02            [ 2]  652 	addw	sp, #2
                                    653 ;	driver/oled.c: 261: OLED_RST_Set();
      00944C 4B 08            [ 1]  654 	push	#0x08
      00944E 4B 0A            [ 1]  655 	push	#0x0a
      009450 4B 50            [ 1]  656 	push	#0x50
      009452 CD 96 A1         [ 4]  657 	call	_GPIO_WriteHigh
      009455 5B 03            [ 2]  658 	addw	sp, #3
                                    659 ;	driver/oled.c: 293: OLED_WR_Byte(0xAE,OLED_CMD);//--turn off oled panel
      009457 4B 00            [ 1]  660 	push	#0x00
      009459 4B AE            [ 1]  661 	push	#0xae
      00945B CD 91 39         [ 4]  662 	call	_OLED_WR_Byte
      00945E 5B 02            [ 2]  663 	addw	sp, #2
                                    664 ;	driver/oled.c: 294: OLED_WR_Byte(0x00,OLED_CMD);//---set low column address
      009460 4B 00            [ 1]  665 	push	#0x00
      009462 4B 00            [ 1]  666 	push	#0x00
      009464 CD 91 39         [ 4]  667 	call	_OLED_WR_Byte
      009467 5B 02            [ 2]  668 	addw	sp, #2
                                    669 ;	driver/oled.c: 295: OLED_WR_Byte(0x10,OLED_CMD);//---set high column address
      009469 4B 00            [ 1]  670 	push	#0x00
      00946B 4B 10            [ 1]  671 	push	#0x10
      00946D CD 91 39         [ 4]  672 	call	_OLED_WR_Byte
      009470 5B 02            [ 2]  673 	addw	sp, #2
                                    674 ;	driver/oled.c: 296: OLED_WR_Byte(0x40,OLED_CMD);//--set start line address  Set Mapping RAM Display Start Line (0x00~0x3F)
      009472 4B 00            [ 1]  675 	push	#0x00
      009474 4B 40            [ 1]  676 	push	#0x40
      009476 CD 91 39         [ 4]  677 	call	_OLED_WR_Byte
      009479 5B 02            [ 2]  678 	addw	sp, #2
                                    679 ;	driver/oled.c: 297: OLED_WR_Byte(0x81,OLED_CMD);//--set contrast control register
      00947B 4B 00            [ 1]  680 	push	#0x00
      00947D 4B 81            [ 1]  681 	push	#0x81
      00947F CD 91 39         [ 4]  682 	call	_OLED_WR_Byte
      009482 5B 02            [ 2]  683 	addw	sp, #2
                                    684 ;	driver/oled.c: 298: OLED_WR_Byte(0xCF,OLED_CMD); // Set SEG Output Current Brightness
      009484 4B 00            [ 1]  685 	push	#0x00
      009486 4B CF            [ 1]  686 	push	#0xcf
      009488 CD 91 39         [ 4]  687 	call	_OLED_WR_Byte
      00948B 5B 02            [ 2]  688 	addw	sp, #2
                                    689 ;	driver/oled.c: 299: OLED_WR_Byte(0xA1,OLED_CMD);//--Set SEG/Column Mapping     0xa0左右反置 0xa1正常
      00948D 4B 00            [ 1]  690 	push	#0x00
      00948F 4B A1            [ 1]  691 	push	#0xa1
      009491 CD 91 39         [ 4]  692 	call	_OLED_WR_Byte
      009494 5B 02            [ 2]  693 	addw	sp, #2
                                    694 ;	driver/oled.c: 300: OLED_WR_Byte(0xC8,OLED_CMD);//Set COM/Row Scan Direction   0xc0上下反置 0xc8正常
      009496 4B 00            [ 1]  695 	push	#0x00
      009498 4B C8            [ 1]  696 	push	#0xc8
      00949A CD 91 39         [ 4]  697 	call	_OLED_WR_Byte
      00949D 5B 02            [ 2]  698 	addw	sp, #2
                                    699 ;	driver/oled.c: 301: OLED_WR_Byte(0xA6,OLED_CMD);//--set normal display
      00949F 4B 00            [ 1]  700 	push	#0x00
      0094A1 4B A6            [ 1]  701 	push	#0xa6
      0094A3 CD 91 39         [ 4]  702 	call	_OLED_WR_Byte
      0094A6 5B 02            [ 2]  703 	addw	sp, #2
                                    704 ;	driver/oled.c: 302: OLED_WR_Byte(0xA8,OLED_CMD);//--set multiplex ratio(1 to 64)
      0094A8 4B 00            [ 1]  705 	push	#0x00
      0094AA 4B A8            [ 1]  706 	push	#0xa8
      0094AC CD 91 39         [ 4]  707 	call	_OLED_WR_Byte
      0094AF 5B 02            [ 2]  708 	addw	sp, #2
                                    709 ;	driver/oled.c: 303: OLED_WR_Byte(0x3f,OLED_CMD);//--1/64 duty
      0094B1 4B 00            [ 1]  710 	push	#0x00
      0094B3 4B 3F            [ 1]  711 	push	#0x3f
      0094B5 CD 91 39         [ 4]  712 	call	_OLED_WR_Byte
      0094B8 5B 02            [ 2]  713 	addw	sp, #2
                                    714 ;	driver/oled.c: 304: OLED_WR_Byte(0xD3,OLED_CMD);//-set display offset	Shift Mapping RAM Counter (0x00~0x3F)
      0094BA 4B 00            [ 1]  715 	push	#0x00
      0094BC 4B D3            [ 1]  716 	push	#0xd3
      0094BE CD 91 39         [ 4]  717 	call	_OLED_WR_Byte
      0094C1 5B 02            [ 2]  718 	addw	sp, #2
                                    719 ;	driver/oled.c: 305: OLED_WR_Byte(0x00,OLED_CMD);//-not offset
      0094C3 4B 00            [ 1]  720 	push	#0x00
      0094C5 4B 00            [ 1]  721 	push	#0x00
      0094C7 CD 91 39         [ 4]  722 	call	_OLED_WR_Byte
      0094CA 5B 02            [ 2]  723 	addw	sp, #2
                                    724 ;	driver/oled.c: 306: OLED_WR_Byte(0xd5,OLED_CMD);//--set display clock divide ratio/oscillator frequency
      0094CC 4B 00            [ 1]  725 	push	#0x00
      0094CE 4B D5            [ 1]  726 	push	#0xd5
      0094D0 CD 91 39         [ 4]  727 	call	_OLED_WR_Byte
      0094D3 5B 02            [ 2]  728 	addw	sp, #2
                                    729 ;	driver/oled.c: 307: OLED_WR_Byte(0x80,OLED_CMD);//--set divide ratio, Set Clock as 100 Frames/Sec
      0094D5 4B 00            [ 1]  730 	push	#0x00
      0094D7 4B 80            [ 1]  731 	push	#0x80
      0094D9 CD 91 39         [ 4]  732 	call	_OLED_WR_Byte
      0094DC 5B 02            [ 2]  733 	addw	sp, #2
                                    734 ;	driver/oled.c: 308: OLED_WR_Byte(0xD9,OLED_CMD);//--set pre-charge period
      0094DE 4B 00            [ 1]  735 	push	#0x00
      0094E0 4B D9            [ 1]  736 	push	#0xd9
      0094E2 CD 91 39         [ 4]  737 	call	_OLED_WR_Byte
      0094E5 5B 02            [ 2]  738 	addw	sp, #2
                                    739 ;	driver/oled.c: 309: OLED_WR_Byte(0xF1,OLED_CMD);//Set Pre-Charge as 15 Clocks & Discharge as 1 Clock
      0094E7 4B 00            [ 1]  740 	push	#0x00
      0094E9 4B F1            [ 1]  741 	push	#0xf1
      0094EB CD 91 39         [ 4]  742 	call	_OLED_WR_Byte
      0094EE 5B 02            [ 2]  743 	addw	sp, #2
                                    744 ;	driver/oled.c: 310: OLED_WR_Byte(0xDA,OLED_CMD);//--set com pins hardware configuration
      0094F0 4B 00            [ 1]  745 	push	#0x00
      0094F2 4B DA            [ 1]  746 	push	#0xda
      0094F4 CD 91 39         [ 4]  747 	call	_OLED_WR_Byte
      0094F7 5B 02            [ 2]  748 	addw	sp, #2
                                    749 ;	driver/oled.c: 311: OLED_WR_Byte(0x12,OLED_CMD);
      0094F9 4B 00            [ 1]  750 	push	#0x00
      0094FB 4B 12            [ 1]  751 	push	#0x12
      0094FD CD 91 39         [ 4]  752 	call	_OLED_WR_Byte
      009500 5B 02            [ 2]  753 	addw	sp, #2
                                    754 ;	driver/oled.c: 312: OLED_WR_Byte(0xDB,OLED_CMD);//--set vcomh
      009502 4B 00            [ 1]  755 	push	#0x00
      009504 4B DB            [ 1]  756 	push	#0xdb
      009506 CD 91 39         [ 4]  757 	call	_OLED_WR_Byte
      009509 5B 02            [ 2]  758 	addw	sp, #2
                                    759 ;	driver/oled.c: 313: OLED_WR_Byte(0x40,OLED_CMD);//Set VCOM Deselect Level
      00950B 4B 00            [ 1]  760 	push	#0x00
      00950D 4B 40            [ 1]  761 	push	#0x40
      00950F CD 91 39         [ 4]  762 	call	_OLED_WR_Byte
      009512 5B 02            [ 2]  763 	addw	sp, #2
                                    764 ;	driver/oled.c: 314: OLED_WR_Byte(0x20,OLED_CMD);//-Set Page Addressing Mode (0x00/0x01/0x02)
      009514 4B 00            [ 1]  765 	push	#0x00
      009516 4B 20            [ 1]  766 	push	#0x20
      009518 CD 91 39         [ 4]  767 	call	_OLED_WR_Byte
      00951B 5B 02            [ 2]  768 	addw	sp, #2
                                    769 ;	driver/oled.c: 315: OLED_WR_Byte(0x02,OLED_CMD);//
      00951D 4B 00            [ 1]  770 	push	#0x00
      00951F 4B 02            [ 1]  771 	push	#0x02
      009521 CD 91 39         [ 4]  772 	call	_OLED_WR_Byte
      009524 5B 02            [ 2]  773 	addw	sp, #2
                                    774 ;	driver/oled.c: 316: OLED_WR_Byte(0x8D,OLED_CMD);//--set Charge Pump enable/disable
      009526 4B 00            [ 1]  775 	push	#0x00
      009528 4B 8D            [ 1]  776 	push	#0x8d
      00952A CD 91 39         [ 4]  777 	call	_OLED_WR_Byte
      00952D 5B 02            [ 2]  778 	addw	sp, #2
                                    779 ;	driver/oled.c: 317: OLED_WR_Byte(0x14,OLED_CMD);//--set(0x10) disable
      00952F 4B 00            [ 1]  780 	push	#0x00
      009531 4B 14            [ 1]  781 	push	#0x14
      009533 CD 91 39         [ 4]  782 	call	_OLED_WR_Byte
      009536 5B 02            [ 2]  783 	addw	sp, #2
                                    784 ;	driver/oled.c: 318: OLED_WR_Byte(0xA4,OLED_CMD);// Disable Entire Display On (0xa4/0xa5)
      009538 4B 00            [ 1]  785 	push	#0x00
      00953A 4B A4            [ 1]  786 	push	#0xa4
      00953C CD 91 39         [ 4]  787 	call	_OLED_WR_Byte
      00953F 5B 02            [ 2]  788 	addw	sp, #2
                                    789 ;	driver/oled.c: 319: OLED_WR_Byte(0xA6,OLED_CMD);// Disable Inverse Display On (0xa6/a7)
      009541 4B 00            [ 1]  790 	push	#0x00
      009543 4B A6            [ 1]  791 	push	#0xa6
      009545 CD 91 39         [ 4]  792 	call	_OLED_WR_Byte
      009548 5B 02            [ 2]  793 	addw	sp, #2
                                    794 ;	driver/oled.c: 320: OLED_WR_Byte(0xAF,OLED_CMD);//--turn on oled panel
      00954A 4B 00            [ 1]  795 	push	#0x00
      00954C 4B AF            [ 1]  796 	push	#0xaf
      00954E CD 91 39         [ 4]  797 	call	_OLED_WR_Byte
      009551 5B 02            [ 2]  798 	addw	sp, #2
                                    799 ;	driver/oled.c: 322: OLED_WR_Byte(0xAF,OLED_CMD); /*display ON*/
      009553 4B 00            [ 1]  800 	push	#0x00
      009555 4B AF            [ 1]  801 	push	#0xaf
      009557 CD 91 39         [ 4]  802 	call	_OLED_WR_Byte
      00955A 5B 02            [ 2]  803 	addw	sp, #2
                                    804 ;	driver/oled.c: 323: OLED_Clear();
      00955C CD 92 2B         [ 4]  805 	call	_OLED_Clear
                                    806 ;	driver/oled.c: 324: OLED_Set_Pos(0,0);
      00955F 4B 00            [ 1]  807 	push	#0x00
      009561 4B 00            [ 1]  808 	push	#0x00
      009563 CD 91 B6         [ 4]  809 	call	_OLED_Set_Pos
      009566 5B 02            [ 2]  810 	addw	sp, #2
                                    811 ;	driver/oled.c: 325: }
      009568 81               [ 4]  812 	ret
                                    813 	.area CODE
                                    814 	.area CONST
      0080F8                        815 _F8X16:
      0080F8 00                     816 	.db #0x00	; 0
      0080F9 00                     817 	.db #0x00	; 0
      0080FA 00                     818 	.db #0x00	; 0
      0080FB 00                     819 	.db #0x00	; 0
      0080FC 00                     820 	.db #0x00	; 0
      0080FD 00                     821 	.db #0x00	; 0
      0080FE 00                     822 	.db #0x00	; 0
      0080FF 00                     823 	.db #0x00	; 0
      008100 00                     824 	.db #0x00	; 0
      008101 00                     825 	.db #0x00	; 0
      008102 00                     826 	.db #0x00	; 0
      008103 00                     827 	.db #0x00	; 0
      008104 00                     828 	.db #0x00	; 0
      008105 00                     829 	.db #0x00	; 0
      008106 00                     830 	.db #0x00	; 0
      008107 00                     831 	.db #0x00	; 0
      008108 00                     832 	.db #0x00	; 0
      008109 00                     833 	.db #0x00	; 0
      00810A 00                     834 	.db #0x00	; 0
      00810B F8                     835 	.db #0xf8	; 248
      00810C 00                     836 	.db #0x00	; 0
      00810D 00                     837 	.db #0x00	; 0
      00810E 00                     838 	.db #0x00	; 0
      00810F 00                     839 	.db #0x00	; 0
      008110 00                     840 	.db #0x00	; 0
      008111 00                     841 	.db #0x00	; 0
      008112 00                     842 	.db #0x00	; 0
      008113 33                     843 	.db #0x33	; 51	'3'
      008114 30                     844 	.db #0x30	; 48	'0'
      008115 00                     845 	.db #0x00	; 0
      008116 00                     846 	.db #0x00	; 0
      008117 00                     847 	.db #0x00	; 0
      008118 00                     848 	.db #0x00	; 0
      008119 10                     849 	.db #0x10	; 16
      00811A 0C                     850 	.db #0x0c	; 12
      00811B 06                     851 	.db #0x06	; 6
      00811C 10                     852 	.db #0x10	; 16
      00811D 0C                     853 	.db #0x0c	; 12
      00811E 06                     854 	.db #0x06	; 6
      00811F 00                     855 	.db #0x00	; 0
      008120 00                     856 	.db #0x00	; 0
      008121 00                     857 	.db #0x00	; 0
      008122 00                     858 	.db #0x00	; 0
      008123 00                     859 	.db #0x00	; 0
      008124 00                     860 	.db #0x00	; 0
      008125 00                     861 	.db #0x00	; 0
      008126 00                     862 	.db #0x00	; 0
      008127 00                     863 	.db #0x00	; 0
      008128 40                     864 	.db #0x40	; 64
      008129 C0                     865 	.db #0xc0	; 192
      00812A 78                     866 	.db #0x78	; 120	'x'
      00812B 40                     867 	.db #0x40	; 64
      00812C C0                     868 	.db #0xc0	; 192
      00812D 78                     869 	.db #0x78	; 120	'x'
      00812E 40                     870 	.db #0x40	; 64
      00812F 00                     871 	.db #0x00	; 0
      008130 04                     872 	.db #0x04	; 4
      008131 3F                     873 	.db #0x3f	; 63
      008132 04                     874 	.db #0x04	; 4
      008133 04                     875 	.db #0x04	; 4
      008134 3F                     876 	.db #0x3f	; 63
      008135 04                     877 	.db #0x04	; 4
      008136 04                     878 	.db #0x04	; 4
      008137 00                     879 	.db #0x00	; 0
      008138 00                     880 	.db #0x00	; 0
      008139 70                     881 	.db #0x70	; 112	'p'
      00813A 88                     882 	.db #0x88	; 136
      00813B FC                     883 	.db #0xfc	; 252
      00813C 08                     884 	.db #0x08	; 8
      00813D 30                     885 	.db #0x30	; 48	'0'
      00813E 00                     886 	.db #0x00	; 0
      00813F 00                     887 	.db #0x00	; 0
      008140 00                     888 	.db #0x00	; 0
      008141 18                     889 	.db #0x18	; 24
      008142 20                     890 	.db #0x20	; 32
      008143 FF                     891 	.db #0xff	; 255
      008144 21                     892 	.db #0x21	; 33
      008145 1E                     893 	.db #0x1e	; 30
      008146 00                     894 	.db #0x00	; 0
      008147 00                     895 	.db #0x00	; 0
      008148 F0                     896 	.db #0xf0	; 240
      008149 08                     897 	.db #0x08	; 8
      00814A F0                     898 	.db #0xf0	; 240
      00814B 00                     899 	.db #0x00	; 0
      00814C E0                     900 	.db #0xe0	; 224
      00814D 18                     901 	.db #0x18	; 24
      00814E 00                     902 	.db #0x00	; 0
      00814F 00                     903 	.db #0x00	; 0
      008150 00                     904 	.db #0x00	; 0
      008151 21                     905 	.db #0x21	; 33
      008152 1C                     906 	.db #0x1c	; 28
      008153 03                     907 	.db #0x03	; 3
      008154 1E                     908 	.db #0x1e	; 30
      008155 21                     909 	.db #0x21	; 33
      008156 1E                     910 	.db #0x1e	; 30
      008157 00                     911 	.db #0x00	; 0
      008158 00                     912 	.db #0x00	; 0
      008159 F0                     913 	.db #0xf0	; 240
      00815A 08                     914 	.db #0x08	; 8
      00815B 88                     915 	.db #0x88	; 136
      00815C 70                     916 	.db #0x70	; 112	'p'
      00815D 00                     917 	.db #0x00	; 0
      00815E 00                     918 	.db #0x00	; 0
      00815F 00                     919 	.db #0x00	; 0
      008160 1E                     920 	.db #0x1e	; 30
      008161 21                     921 	.db #0x21	; 33
      008162 23                     922 	.db #0x23	; 35
      008163 24                     923 	.db #0x24	; 36
      008164 19                     924 	.db #0x19	; 25
      008165 27                     925 	.db #0x27	; 39
      008166 21                     926 	.db #0x21	; 33
      008167 10                     927 	.db #0x10	; 16
      008168 10                     928 	.db #0x10	; 16
      008169 16                     929 	.db #0x16	; 22
      00816A 0E                     930 	.db #0x0e	; 14
      00816B 00                     931 	.db #0x00	; 0
      00816C 00                     932 	.db #0x00	; 0
      00816D 00                     933 	.db #0x00	; 0
      00816E 00                     934 	.db #0x00	; 0
      00816F 00                     935 	.db #0x00	; 0
      008170 00                     936 	.db #0x00	; 0
      008171 00                     937 	.db #0x00	; 0
      008172 00                     938 	.db #0x00	; 0
      008173 00                     939 	.db #0x00	; 0
      008174 00                     940 	.db #0x00	; 0
      008175 00                     941 	.db #0x00	; 0
      008176 00                     942 	.db #0x00	; 0
      008177 00                     943 	.db #0x00	; 0
      008178 00                     944 	.db #0x00	; 0
      008179 00                     945 	.db #0x00	; 0
      00817A 00                     946 	.db #0x00	; 0
      00817B E0                     947 	.db #0xe0	; 224
      00817C 18                     948 	.db #0x18	; 24
      00817D 04                     949 	.db #0x04	; 4
      00817E 02                     950 	.db #0x02	; 2
      00817F 00                     951 	.db #0x00	; 0
      008180 00                     952 	.db #0x00	; 0
      008181 00                     953 	.db #0x00	; 0
      008182 00                     954 	.db #0x00	; 0
      008183 07                     955 	.db #0x07	; 7
      008184 18                     956 	.db #0x18	; 24
      008185 20                     957 	.db #0x20	; 32
      008186 40                     958 	.db #0x40	; 64
      008187 00                     959 	.db #0x00	; 0
      008188 00                     960 	.db #0x00	; 0
      008189 02                     961 	.db #0x02	; 2
      00818A 04                     962 	.db #0x04	; 4
      00818B 18                     963 	.db #0x18	; 24
      00818C E0                     964 	.db #0xe0	; 224
      00818D 00                     965 	.db #0x00	; 0
      00818E 00                     966 	.db #0x00	; 0
      00818F 00                     967 	.db #0x00	; 0
      008190 00                     968 	.db #0x00	; 0
      008191 40                     969 	.db #0x40	; 64
      008192 20                     970 	.db #0x20	; 32
      008193 18                     971 	.db #0x18	; 24
      008194 07                     972 	.db #0x07	; 7
      008195 00                     973 	.db #0x00	; 0
      008196 00                     974 	.db #0x00	; 0
      008197 00                     975 	.db #0x00	; 0
      008198 40                     976 	.db #0x40	; 64
      008199 40                     977 	.db #0x40	; 64
      00819A 80                     978 	.db #0x80	; 128
      00819B F0                     979 	.db #0xf0	; 240
      00819C 80                     980 	.db #0x80	; 128
      00819D 40                     981 	.db #0x40	; 64
      00819E 40                     982 	.db #0x40	; 64
      00819F 00                     983 	.db #0x00	; 0
      0081A0 02                     984 	.db #0x02	; 2
      0081A1 02                     985 	.db #0x02	; 2
      0081A2 01                     986 	.db #0x01	; 1
      0081A3 0F                     987 	.db #0x0f	; 15
      0081A4 01                     988 	.db #0x01	; 1
      0081A5 02                     989 	.db #0x02	; 2
      0081A6 02                     990 	.db #0x02	; 2
      0081A7 00                     991 	.db #0x00	; 0
      0081A8 00                     992 	.db #0x00	; 0
      0081A9 00                     993 	.db #0x00	; 0
      0081AA 00                     994 	.db #0x00	; 0
      0081AB F0                     995 	.db #0xf0	; 240
      0081AC 00                     996 	.db #0x00	; 0
      0081AD 00                     997 	.db #0x00	; 0
      0081AE 00                     998 	.db #0x00	; 0
      0081AF 00                     999 	.db #0x00	; 0
      0081B0 01                    1000 	.db #0x01	; 1
      0081B1 01                    1001 	.db #0x01	; 1
      0081B2 01                    1002 	.db #0x01	; 1
      0081B3 1F                    1003 	.db #0x1f	; 31
      0081B4 01                    1004 	.db #0x01	; 1
      0081B5 01                    1005 	.db #0x01	; 1
      0081B6 01                    1006 	.db #0x01	; 1
      0081B7 00                    1007 	.db #0x00	; 0
      0081B8 00                    1008 	.db #0x00	; 0
      0081B9 00                    1009 	.db #0x00	; 0
      0081BA 00                    1010 	.db #0x00	; 0
      0081BB 00                    1011 	.db #0x00	; 0
      0081BC 00                    1012 	.db #0x00	; 0
      0081BD 00                    1013 	.db #0x00	; 0
      0081BE 00                    1014 	.db #0x00	; 0
      0081BF 00                    1015 	.db #0x00	; 0
      0081C0 80                    1016 	.db #0x80	; 128
      0081C1 B0                    1017 	.db #0xb0	; 176
      0081C2 70                    1018 	.db #0x70	; 112	'p'
      0081C3 00                    1019 	.db #0x00	; 0
      0081C4 00                    1020 	.db #0x00	; 0
      0081C5 00                    1021 	.db #0x00	; 0
      0081C6 00                    1022 	.db #0x00	; 0
      0081C7 00                    1023 	.db #0x00	; 0
      0081C8 00                    1024 	.db #0x00	; 0
      0081C9 00                    1025 	.db #0x00	; 0
      0081CA 00                    1026 	.db #0x00	; 0
      0081CB 00                    1027 	.db #0x00	; 0
      0081CC 00                    1028 	.db #0x00	; 0
      0081CD 00                    1029 	.db #0x00	; 0
      0081CE 00                    1030 	.db #0x00	; 0
      0081CF 00                    1031 	.db #0x00	; 0
      0081D0 00                    1032 	.db #0x00	; 0
      0081D1 01                    1033 	.db #0x01	; 1
      0081D2 01                    1034 	.db #0x01	; 1
      0081D3 01                    1035 	.db #0x01	; 1
      0081D4 01                    1036 	.db #0x01	; 1
      0081D5 01                    1037 	.db #0x01	; 1
      0081D6 01                    1038 	.db #0x01	; 1
      0081D7 01                    1039 	.db #0x01	; 1
      0081D8 00                    1040 	.db #0x00	; 0
      0081D9 00                    1041 	.db #0x00	; 0
      0081DA 00                    1042 	.db #0x00	; 0
      0081DB 00                    1043 	.db #0x00	; 0
      0081DC 00                    1044 	.db #0x00	; 0
      0081DD 00                    1045 	.db #0x00	; 0
      0081DE 00                    1046 	.db #0x00	; 0
      0081DF 00                    1047 	.db #0x00	; 0
      0081E0 00                    1048 	.db #0x00	; 0
      0081E1 30                    1049 	.db #0x30	; 48	'0'
      0081E2 30                    1050 	.db #0x30	; 48	'0'
      0081E3 00                    1051 	.db #0x00	; 0
      0081E4 00                    1052 	.db #0x00	; 0
      0081E5 00                    1053 	.db #0x00	; 0
      0081E6 00                    1054 	.db #0x00	; 0
      0081E7 00                    1055 	.db #0x00	; 0
      0081E8 00                    1056 	.db #0x00	; 0
      0081E9 00                    1057 	.db #0x00	; 0
      0081EA 00                    1058 	.db #0x00	; 0
      0081EB 00                    1059 	.db #0x00	; 0
      0081EC 80                    1060 	.db #0x80	; 128
      0081ED 60                    1061 	.db #0x60	; 96
      0081EE 18                    1062 	.db #0x18	; 24
      0081EF 04                    1063 	.db #0x04	; 4
      0081F0 00                    1064 	.db #0x00	; 0
      0081F1 60                    1065 	.db #0x60	; 96
      0081F2 18                    1066 	.db #0x18	; 24
      0081F3 06                    1067 	.db #0x06	; 6
      0081F4 01                    1068 	.db #0x01	; 1
      0081F5 00                    1069 	.db #0x00	; 0
      0081F6 00                    1070 	.db #0x00	; 0
      0081F7 00                    1071 	.db #0x00	; 0
      0081F8 00                    1072 	.db #0x00	; 0
      0081F9 E0                    1073 	.db #0xe0	; 224
      0081FA 10                    1074 	.db #0x10	; 16
      0081FB 08                    1075 	.db #0x08	; 8
      0081FC 08                    1076 	.db #0x08	; 8
      0081FD 10                    1077 	.db #0x10	; 16
      0081FE E0                    1078 	.db #0xe0	; 224
      0081FF 00                    1079 	.db #0x00	; 0
      008200 00                    1080 	.db #0x00	; 0
      008201 0F                    1081 	.db #0x0f	; 15
      008202 10                    1082 	.db #0x10	; 16
      008203 20                    1083 	.db #0x20	; 32
      008204 20                    1084 	.db #0x20	; 32
      008205 10                    1085 	.db #0x10	; 16
      008206 0F                    1086 	.db #0x0f	; 15
      008207 00                    1087 	.db #0x00	; 0
      008208 00                    1088 	.db #0x00	; 0
      008209 10                    1089 	.db #0x10	; 16
      00820A 10                    1090 	.db #0x10	; 16
      00820B F8                    1091 	.db #0xf8	; 248
      00820C 00                    1092 	.db #0x00	; 0
      00820D 00                    1093 	.db #0x00	; 0
      00820E 00                    1094 	.db #0x00	; 0
      00820F 00                    1095 	.db #0x00	; 0
      008210 00                    1096 	.db #0x00	; 0
      008211 20                    1097 	.db #0x20	; 32
      008212 20                    1098 	.db #0x20	; 32
      008213 3F                    1099 	.db #0x3f	; 63
      008214 20                    1100 	.db #0x20	; 32
      008215 20                    1101 	.db #0x20	; 32
      008216 00                    1102 	.db #0x00	; 0
      008217 00                    1103 	.db #0x00	; 0
      008218 00                    1104 	.db #0x00	; 0
      008219 70                    1105 	.db #0x70	; 112	'p'
      00821A 08                    1106 	.db #0x08	; 8
      00821B 08                    1107 	.db #0x08	; 8
      00821C 08                    1108 	.db #0x08	; 8
      00821D 88                    1109 	.db #0x88	; 136
      00821E 70                    1110 	.db #0x70	; 112	'p'
      00821F 00                    1111 	.db #0x00	; 0
      008220 00                    1112 	.db #0x00	; 0
      008221 30                    1113 	.db #0x30	; 48	'0'
      008222 28                    1114 	.db #0x28	; 40
      008223 24                    1115 	.db #0x24	; 36
      008224 22                    1116 	.db #0x22	; 34
      008225 21                    1117 	.db #0x21	; 33
      008226 30                    1118 	.db #0x30	; 48	'0'
      008227 00                    1119 	.db #0x00	; 0
      008228 00                    1120 	.db #0x00	; 0
      008229 30                    1121 	.db #0x30	; 48	'0'
      00822A 08                    1122 	.db #0x08	; 8
      00822B 88                    1123 	.db #0x88	; 136
      00822C 88                    1124 	.db #0x88	; 136
      00822D 48                    1125 	.db #0x48	; 72	'H'
      00822E 30                    1126 	.db #0x30	; 48	'0'
      00822F 00                    1127 	.db #0x00	; 0
      008230 00                    1128 	.db #0x00	; 0
      008231 18                    1129 	.db #0x18	; 24
      008232 20                    1130 	.db #0x20	; 32
      008233 20                    1131 	.db #0x20	; 32
      008234 20                    1132 	.db #0x20	; 32
      008235 11                    1133 	.db #0x11	; 17
      008236 0E                    1134 	.db #0x0e	; 14
      008237 00                    1135 	.db #0x00	; 0
      008238 00                    1136 	.db #0x00	; 0
      008239 00                    1137 	.db #0x00	; 0
      00823A C0                    1138 	.db #0xc0	; 192
      00823B 20                    1139 	.db #0x20	; 32
      00823C 10                    1140 	.db #0x10	; 16
      00823D F8                    1141 	.db #0xf8	; 248
      00823E 00                    1142 	.db #0x00	; 0
      00823F 00                    1143 	.db #0x00	; 0
      008240 00                    1144 	.db #0x00	; 0
      008241 07                    1145 	.db #0x07	; 7
      008242 04                    1146 	.db #0x04	; 4
      008243 24                    1147 	.db #0x24	; 36
      008244 24                    1148 	.db #0x24	; 36
      008245 3F                    1149 	.db #0x3f	; 63
      008246 24                    1150 	.db #0x24	; 36
      008247 00                    1151 	.db #0x00	; 0
      008248 00                    1152 	.db #0x00	; 0
      008249 F8                    1153 	.db #0xf8	; 248
      00824A 08                    1154 	.db #0x08	; 8
      00824B 88                    1155 	.db #0x88	; 136
      00824C 88                    1156 	.db #0x88	; 136
      00824D 08                    1157 	.db #0x08	; 8
      00824E 08                    1158 	.db #0x08	; 8
      00824F 00                    1159 	.db #0x00	; 0
      008250 00                    1160 	.db #0x00	; 0
      008251 19                    1161 	.db #0x19	; 25
      008252 21                    1162 	.db #0x21	; 33
      008253 20                    1163 	.db #0x20	; 32
      008254 20                    1164 	.db #0x20	; 32
      008255 11                    1165 	.db #0x11	; 17
      008256 0E                    1166 	.db #0x0e	; 14
      008257 00                    1167 	.db #0x00	; 0
      008258 00                    1168 	.db #0x00	; 0
      008259 E0                    1169 	.db #0xe0	; 224
      00825A 10                    1170 	.db #0x10	; 16
      00825B 88                    1171 	.db #0x88	; 136
      00825C 88                    1172 	.db #0x88	; 136
      00825D 18                    1173 	.db #0x18	; 24
      00825E 00                    1174 	.db #0x00	; 0
      00825F 00                    1175 	.db #0x00	; 0
      008260 00                    1176 	.db #0x00	; 0
      008261 0F                    1177 	.db #0x0f	; 15
      008262 11                    1178 	.db #0x11	; 17
      008263 20                    1179 	.db #0x20	; 32
      008264 20                    1180 	.db #0x20	; 32
      008265 11                    1181 	.db #0x11	; 17
      008266 0E                    1182 	.db #0x0e	; 14
      008267 00                    1183 	.db #0x00	; 0
      008268 00                    1184 	.db #0x00	; 0
      008269 38                    1185 	.db #0x38	; 56	'8'
      00826A 08                    1186 	.db #0x08	; 8
      00826B 08                    1187 	.db #0x08	; 8
      00826C C8                    1188 	.db #0xc8	; 200
      00826D 38                    1189 	.db #0x38	; 56	'8'
      00826E 08                    1190 	.db #0x08	; 8
      00826F 00                    1191 	.db #0x00	; 0
      008270 00                    1192 	.db #0x00	; 0
      008271 00                    1193 	.db #0x00	; 0
      008272 00                    1194 	.db #0x00	; 0
      008273 3F                    1195 	.db #0x3f	; 63
      008274 00                    1196 	.db #0x00	; 0
      008275 00                    1197 	.db #0x00	; 0
      008276 00                    1198 	.db #0x00	; 0
      008277 00                    1199 	.db #0x00	; 0
      008278 00                    1200 	.db #0x00	; 0
      008279 70                    1201 	.db #0x70	; 112	'p'
      00827A 88                    1202 	.db #0x88	; 136
      00827B 08                    1203 	.db #0x08	; 8
      00827C 08                    1204 	.db #0x08	; 8
      00827D 88                    1205 	.db #0x88	; 136
      00827E 70                    1206 	.db #0x70	; 112	'p'
      00827F 00                    1207 	.db #0x00	; 0
      008280 00                    1208 	.db #0x00	; 0
      008281 1C                    1209 	.db #0x1c	; 28
      008282 22                    1210 	.db #0x22	; 34
      008283 21                    1211 	.db #0x21	; 33
      008284 21                    1212 	.db #0x21	; 33
      008285 22                    1213 	.db #0x22	; 34
      008286 1C                    1214 	.db #0x1c	; 28
      008287 00                    1215 	.db #0x00	; 0
      008288 00                    1216 	.db #0x00	; 0
      008289 E0                    1217 	.db #0xe0	; 224
      00828A 10                    1218 	.db #0x10	; 16
      00828B 08                    1219 	.db #0x08	; 8
      00828C 08                    1220 	.db #0x08	; 8
      00828D 10                    1221 	.db #0x10	; 16
      00828E E0                    1222 	.db #0xe0	; 224
      00828F 00                    1223 	.db #0x00	; 0
      008290 00                    1224 	.db #0x00	; 0
      008291 00                    1225 	.db #0x00	; 0
      008292 31                    1226 	.db #0x31	; 49	'1'
      008293 22                    1227 	.db #0x22	; 34
      008294 22                    1228 	.db #0x22	; 34
      008295 11                    1229 	.db #0x11	; 17
      008296 0F                    1230 	.db #0x0f	; 15
      008297 00                    1231 	.db #0x00	; 0
      008298 00                    1232 	.db #0x00	; 0
      008299 00                    1233 	.db #0x00	; 0
      00829A 00                    1234 	.db #0x00	; 0
      00829B C0                    1235 	.db #0xc0	; 192
      00829C C0                    1236 	.db #0xc0	; 192
      00829D 00                    1237 	.db #0x00	; 0
      00829E 00                    1238 	.db #0x00	; 0
      00829F 00                    1239 	.db #0x00	; 0
      0082A0 00                    1240 	.db #0x00	; 0
      0082A1 00                    1241 	.db #0x00	; 0
      0082A2 00                    1242 	.db #0x00	; 0
      0082A3 30                    1243 	.db #0x30	; 48	'0'
      0082A4 30                    1244 	.db #0x30	; 48	'0'
      0082A5 00                    1245 	.db #0x00	; 0
      0082A6 00                    1246 	.db #0x00	; 0
      0082A7 00                    1247 	.db #0x00	; 0
      0082A8 00                    1248 	.db #0x00	; 0
      0082A9 00                    1249 	.db #0x00	; 0
      0082AA 00                    1250 	.db #0x00	; 0
      0082AB 80                    1251 	.db #0x80	; 128
      0082AC 00                    1252 	.db #0x00	; 0
      0082AD 00                    1253 	.db #0x00	; 0
      0082AE 00                    1254 	.db #0x00	; 0
      0082AF 00                    1255 	.db #0x00	; 0
      0082B0 00                    1256 	.db #0x00	; 0
      0082B1 00                    1257 	.db #0x00	; 0
      0082B2 80                    1258 	.db #0x80	; 128
      0082B3 60                    1259 	.db #0x60	; 96
      0082B4 00                    1260 	.db #0x00	; 0
      0082B5 00                    1261 	.db #0x00	; 0
      0082B6 00                    1262 	.db #0x00	; 0
      0082B7 00                    1263 	.db #0x00	; 0
      0082B8 00                    1264 	.db #0x00	; 0
      0082B9 00                    1265 	.db #0x00	; 0
      0082BA 80                    1266 	.db #0x80	; 128
      0082BB 40                    1267 	.db #0x40	; 64
      0082BC 20                    1268 	.db #0x20	; 32
      0082BD 10                    1269 	.db #0x10	; 16
      0082BE 08                    1270 	.db #0x08	; 8
      0082BF 00                    1271 	.db #0x00	; 0
      0082C0 00                    1272 	.db #0x00	; 0
      0082C1 01                    1273 	.db #0x01	; 1
      0082C2 02                    1274 	.db #0x02	; 2
      0082C3 04                    1275 	.db #0x04	; 4
      0082C4 08                    1276 	.db #0x08	; 8
      0082C5 10                    1277 	.db #0x10	; 16
      0082C6 20                    1278 	.db #0x20	; 32
      0082C7 00                    1279 	.db #0x00	; 0
      0082C8 40                    1280 	.db #0x40	; 64
      0082C9 40                    1281 	.db #0x40	; 64
      0082CA 40                    1282 	.db #0x40	; 64
      0082CB 40                    1283 	.db #0x40	; 64
      0082CC 40                    1284 	.db #0x40	; 64
      0082CD 40                    1285 	.db #0x40	; 64
      0082CE 40                    1286 	.db #0x40	; 64
      0082CF 00                    1287 	.db #0x00	; 0
      0082D0 04                    1288 	.db #0x04	; 4
      0082D1 04                    1289 	.db #0x04	; 4
      0082D2 04                    1290 	.db #0x04	; 4
      0082D3 04                    1291 	.db #0x04	; 4
      0082D4 04                    1292 	.db #0x04	; 4
      0082D5 04                    1293 	.db #0x04	; 4
      0082D6 04                    1294 	.db #0x04	; 4
      0082D7 00                    1295 	.db #0x00	; 0
      0082D8 00                    1296 	.db #0x00	; 0
      0082D9 08                    1297 	.db #0x08	; 8
      0082DA 10                    1298 	.db #0x10	; 16
      0082DB 20                    1299 	.db #0x20	; 32
      0082DC 40                    1300 	.db #0x40	; 64
      0082DD 80                    1301 	.db #0x80	; 128
      0082DE 00                    1302 	.db #0x00	; 0
      0082DF 00                    1303 	.db #0x00	; 0
      0082E0 00                    1304 	.db #0x00	; 0
      0082E1 20                    1305 	.db #0x20	; 32
      0082E2 10                    1306 	.db #0x10	; 16
      0082E3 08                    1307 	.db #0x08	; 8
      0082E4 04                    1308 	.db #0x04	; 4
      0082E5 02                    1309 	.db #0x02	; 2
      0082E6 01                    1310 	.db #0x01	; 1
      0082E7 00                    1311 	.db #0x00	; 0
      0082E8 00                    1312 	.db #0x00	; 0
      0082E9 70                    1313 	.db #0x70	; 112	'p'
      0082EA 48                    1314 	.db #0x48	; 72	'H'
      0082EB 08                    1315 	.db #0x08	; 8
      0082EC 08                    1316 	.db #0x08	; 8
      0082ED 08                    1317 	.db #0x08	; 8
      0082EE F0                    1318 	.db #0xf0	; 240
      0082EF 00                    1319 	.db #0x00	; 0
      0082F0 00                    1320 	.db #0x00	; 0
      0082F1 00                    1321 	.db #0x00	; 0
      0082F2 00                    1322 	.db #0x00	; 0
      0082F3 30                    1323 	.db #0x30	; 48	'0'
      0082F4 36                    1324 	.db #0x36	; 54	'6'
      0082F5 01                    1325 	.db #0x01	; 1
      0082F6 00                    1326 	.db #0x00	; 0
      0082F7 00                    1327 	.db #0x00	; 0
      0082F8 C0                    1328 	.db #0xc0	; 192
      0082F9 30                    1329 	.db #0x30	; 48	'0'
      0082FA C8                    1330 	.db #0xc8	; 200
      0082FB 28                    1331 	.db #0x28	; 40
      0082FC E8                    1332 	.db #0xe8	; 232
      0082FD 10                    1333 	.db #0x10	; 16
      0082FE E0                    1334 	.db #0xe0	; 224
      0082FF 00                    1335 	.db #0x00	; 0
      008300 07                    1336 	.db #0x07	; 7
      008301 18                    1337 	.db #0x18	; 24
      008302 27                    1338 	.db #0x27	; 39
      008303 24                    1339 	.db #0x24	; 36
      008304 23                    1340 	.db #0x23	; 35
      008305 14                    1341 	.db #0x14	; 20
      008306 0B                    1342 	.db #0x0b	; 11
      008307 00                    1343 	.db #0x00	; 0
      008308 00                    1344 	.db #0x00	; 0
      008309 00                    1345 	.db #0x00	; 0
      00830A C0                    1346 	.db #0xc0	; 192
      00830B 38                    1347 	.db #0x38	; 56	'8'
      00830C E0                    1348 	.db #0xe0	; 224
      00830D 00                    1349 	.db #0x00	; 0
      00830E 00                    1350 	.db #0x00	; 0
      00830F 00                    1351 	.db #0x00	; 0
      008310 20                    1352 	.db #0x20	; 32
      008311 3C                    1353 	.db #0x3c	; 60
      008312 23                    1354 	.db #0x23	; 35
      008313 02                    1355 	.db #0x02	; 2
      008314 02                    1356 	.db #0x02	; 2
      008315 27                    1357 	.db #0x27	; 39
      008316 38                    1358 	.db #0x38	; 56	'8'
      008317 20                    1359 	.db #0x20	; 32
      008318 08                    1360 	.db #0x08	; 8
      008319 F8                    1361 	.db #0xf8	; 248
      00831A 88                    1362 	.db #0x88	; 136
      00831B 88                    1363 	.db #0x88	; 136
      00831C 88                    1364 	.db #0x88	; 136
      00831D 70                    1365 	.db #0x70	; 112	'p'
      00831E 00                    1366 	.db #0x00	; 0
      00831F 00                    1367 	.db #0x00	; 0
      008320 20                    1368 	.db #0x20	; 32
      008321 3F                    1369 	.db #0x3f	; 63
      008322 20                    1370 	.db #0x20	; 32
      008323 20                    1371 	.db #0x20	; 32
      008324 20                    1372 	.db #0x20	; 32
      008325 11                    1373 	.db #0x11	; 17
      008326 0E                    1374 	.db #0x0e	; 14
      008327 00                    1375 	.db #0x00	; 0
      008328 C0                    1376 	.db #0xc0	; 192
      008329 30                    1377 	.db #0x30	; 48	'0'
      00832A 08                    1378 	.db #0x08	; 8
      00832B 08                    1379 	.db #0x08	; 8
      00832C 08                    1380 	.db #0x08	; 8
      00832D 08                    1381 	.db #0x08	; 8
      00832E 38                    1382 	.db #0x38	; 56	'8'
      00832F 00                    1383 	.db #0x00	; 0
      008330 07                    1384 	.db #0x07	; 7
      008331 18                    1385 	.db #0x18	; 24
      008332 20                    1386 	.db #0x20	; 32
      008333 20                    1387 	.db #0x20	; 32
      008334 20                    1388 	.db #0x20	; 32
      008335 10                    1389 	.db #0x10	; 16
      008336 08                    1390 	.db #0x08	; 8
      008337 00                    1391 	.db #0x00	; 0
      008338 08                    1392 	.db #0x08	; 8
      008339 F8                    1393 	.db #0xf8	; 248
      00833A 08                    1394 	.db #0x08	; 8
      00833B 08                    1395 	.db #0x08	; 8
      00833C 08                    1396 	.db #0x08	; 8
      00833D 10                    1397 	.db #0x10	; 16
      00833E E0                    1398 	.db #0xe0	; 224
      00833F 00                    1399 	.db #0x00	; 0
      008340 20                    1400 	.db #0x20	; 32
      008341 3F                    1401 	.db #0x3f	; 63
      008342 20                    1402 	.db #0x20	; 32
      008343 20                    1403 	.db #0x20	; 32
      008344 20                    1404 	.db #0x20	; 32
      008345 10                    1405 	.db #0x10	; 16
      008346 0F                    1406 	.db #0x0f	; 15
      008347 00                    1407 	.db #0x00	; 0
      008348 08                    1408 	.db #0x08	; 8
      008349 F8                    1409 	.db #0xf8	; 248
      00834A 88                    1410 	.db #0x88	; 136
      00834B 88                    1411 	.db #0x88	; 136
      00834C E8                    1412 	.db #0xe8	; 232
      00834D 08                    1413 	.db #0x08	; 8
      00834E 10                    1414 	.db #0x10	; 16
      00834F 00                    1415 	.db #0x00	; 0
      008350 20                    1416 	.db #0x20	; 32
      008351 3F                    1417 	.db #0x3f	; 63
      008352 20                    1418 	.db #0x20	; 32
      008353 20                    1419 	.db #0x20	; 32
      008354 23                    1420 	.db #0x23	; 35
      008355 20                    1421 	.db #0x20	; 32
      008356 18                    1422 	.db #0x18	; 24
      008357 00                    1423 	.db #0x00	; 0
      008358 08                    1424 	.db #0x08	; 8
      008359 F8                    1425 	.db #0xf8	; 248
      00835A 88                    1426 	.db #0x88	; 136
      00835B 88                    1427 	.db #0x88	; 136
      00835C E8                    1428 	.db #0xe8	; 232
      00835D 08                    1429 	.db #0x08	; 8
      00835E 10                    1430 	.db #0x10	; 16
      00835F 00                    1431 	.db #0x00	; 0
      008360 20                    1432 	.db #0x20	; 32
      008361 3F                    1433 	.db #0x3f	; 63
      008362 20                    1434 	.db #0x20	; 32
      008363 00                    1435 	.db #0x00	; 0
      008364 03                    1436 	.db #0x03	; 3
      008365 00                    1437 	.db #0x00	; 0
      008366 00                    1438 	.db #0x00	; 0
      008367 00                    1439 	.db #0x00	; 0
      008368 C0                    1440 	.db #0xc0	; 192
      008369 30                    1441 	.db #0x30	; 48	'0'
      00836A 08                    1442 	.db #0x08	; 8
      00836B 08                    1443 	.db #0x08	; 8
      00836C 08                    1444 	.db #0x08	; 8
      00836D 38                    1445 	.db #0x38	; 56	'8'
      00836E 00                    1446 	.db #0x00	; 0
      00836F 00                    1447 	.db #0x00	; 0
      008370 07                    1448 	.db #0x07	; 7
      008371 18                    1449 	.db #0x18	; 24
      008372 20                    1450 	.db #0x20	; 32
      008373 20                    1451 	.db #0x20	; 32
      008374 22                    1452 	.db #0x22	; 34
      008375 1E                    1453 	.db #0x1e	; 30
      008376 02                    1454 	.db #0x02	; 2
      008377 00                    1455 	.db #0x00	; 0
      008378 08                    1456 	.db #0x08	; 8
      008379 F8                    1457 	.db #0xf8	; 248
      00837A 08                    1458 	.db #0x08	; 8
      00837B 00                    1459 	.db #0x00	; 0
      00837C 00                    1460 	.db #0x00	; 0
      00837D 08                    1461 	.db #0x08	; 8
      00837E F8                    1462 	.db #0xf8	; 248
      00837F 08                    1463 	.db #0x08	; 8
      008380 20                    1464 	.db #0x20	; 32
      008381 3F                    1465 	.db #0x3f	; 63
      008382 21                    1466 	.db #0x21	; 33
      008383 01                    1467 	.db #0x01	; 1
      008384 01                    1468 	.db #0x01	; 1
      008385 21                    1469 	.db #0x21	; 33
      008386 3F                    1470 	.db #0x3f	; 63
      008387 20                    1471 	.db #0x20	; 32
      008388 00                    1472 	.db #0x00	; 0
      008389 08                    1473 	.db #0x08	; 8
      00838A 08                    1474 	.db #0x08	; 8
      00838B F8                    1475 	.db #0xf8	; 248
      00838C 08                    1476 	.db #0x08	; 8
      00838D 08                    1477 	.db #0x08	; 8
      00838E 00                    1478 	.db #0x00	; 0
      00838F 00                    1479 	.db #0x00	; 0
      008390 00                    1480 	.db #0x00	; 0
      008391 20                    1481 	.db #0x20	; 32
      008392 20                    1482 	.db #0x20	; 32
      008393 3F                    1483 	.db #0x3f	; 63
      008394 20                    1484 	.db #0x20	; 32
      008395 20                    1485 	.db #0x20	; 32
      008396 00                    1486 	.db #0x00	; 0
      008397 00                    1487 	.db #0x00	; 0
      008398 00                    1488 	.db #0x00	; 0
      008399 00                    1489 	.db #0x00	; 0
      00839A 08                    1490 	.db #0x08	; 8
      00839B 08                    1491 	.db #0x08	; 8
      00839C F8                    1492 	.db #0xf8	; 248
      00839D 08                    1493 	.db #0x08	; 8
      00839E 08                    1494 	.db #0x08	; 8
      00839F 00                    1495 	.db #0x00	; 0
      0083A0 C0                    1496 	.db #0xc0	; 192
      0083A1 80                    1497 	.db #0x80	; 128
      0083A2 80                    1498 	.db #0x80	; 128
      0083A3 80                    1499 	.db #0x80	; 128
      0083A4 7F                    1500 	.db #0x7f	; 127
      0083A5 00                    1501 	.db #0x00	; 0
      0083A6 00                    1502 	.db #0x00	; 0
      0083A7 00                    1503 	.db #0x00	; 0
      0083A8 08                    1504 	.db #0x08	; 8
      0083A9 F8                    1505 	.db #0xf8	; 248
      0083AA 88                    1506 	.db #0x88	; 136
      0083AB C0                    1507 	.db #0xc0	; 192
      0083AC 28                    1508 	.db #0x28	; 40
      0083AD 18                    1509 	.db #0x18	; 24
      0083AE 08                    1510 	.db #0x08	; 8
      0083AF 00                    1511 	.db #0x00	; 0
      0083B0 20                    1512 	.db #0x20	; 32
      0083B1 3F                    1513 	.db #0x3f	; 63
      0083B2 20                    1514 	.db #0x20	; 32
      0083B3 01                    1515 	.db #0x01	; 1
      0083B4 26                    1516 	.db #0x26	; 38
      0083B5 38                    1517 	.db #0x38	; 56	'8'
      0083B6 20                    1518 	.db #0x20	; 32
      0083B7 00                    1519 	.db #0x00	; 0
      0083B8 08                    1520 	.db #0x08	; 8
      0083B9 F8                    1521 	.db #0xf8	; 248
      0083BA 08                    1522 	.db #0x08	; 8
      0083BB 00                    1523 	.db #0x00	; 0
      0083BC 00                    1524 	.db #0x00	; 0
      0083BD 00                    1525 	.db #0x00	; 0
      0083BE 00                    1526 	.db #0x00	; 0
      0083BF 00                    1527 	.db #0x00	; 0
      0083C0 20                    1528 	.db #0x20	; 32
      0083C1 3F                    1529 	.db #0x3f	; 63
      0083C2 20                    1530 	.db #0x20	; 32
      0083C3 20                    1531 	.db #0x20	; 32
      0083C4 20                    1532 	.db #0x20	; 32
      0083C5 20                    1533 	.db #0x20	; 32
      0083C6 30                    1534 	.db #0x30	; 48	'0'
      0083C7 00                    1535 	.db #0x00	; 0
      0083C8 08                    1536 	.db #0x08	; 8
      0083C9 F8                    1537 	.db #0xf8	; 248
      0083CA F8                    1538 	.db #0xf8	; 248
      0083CB 00                    1539 	.db #0x00	; 0
      0083CC F8                    1540 	.db #0xf8	; 248
      0083CD F8                    1541 	.db #0xf8	; 248
      0083CE 08                    1542 	.db #0x08	; 8
      0083CF 00                    1543 	.db #0x00	; 0
      0083D0 20                    1544 	.db #0x20	; 32
      0083D1 3F                    1545 	.db #0x3f	; 63
      0083D2 00                    1546 	.db #0x00	; 0
      0083D3 3F                    1547 	.db #0x3f	; 63
      0083D4 00                    1548 	.db #0x00	; 0
      0083D5 3F                    1549 	.db #0x3f	; 63
      0083D6 20                    1550 	.db #0x20	; 32
      0083D7 00                    1551 	.db #0x00	; 0
      0083D8 08                    1552 	.db #0x08	; 8
      0083D9 F8                    1553 	.db #0xf8	; 248
      0083DA 30                    1554 	.db #0x30	; 48	'0'
      0083DB C0                    1555 	.db #0xc0	; 192
      0083DC 00                    1556 	.db #0x00	; 0
      0083DD 08                    1557 	.db #0x08	; 8
      0083DE F8                    1558 	.db #0xf8	; 248
      0083DF 08                    1559 	.db #0x08	; 8
      0083E0 20                    1560 	.db #0x20	; 32
      0083E1 3F                    1561 	.db #0x3f	; 63
      0083E2 20                    1562 	.db #0x20	; 32
      0083E3 00                    1563 	.db #0x00	; 0
      0083E4 07                    1564 	.db #0x07	; 7
      0083E5 18                    1565 	.db #0x18	; 24
      0083E6 3F                    1566 	.db #0x3f	; 63
      0083E7 00                    1567 	.db #0x00	; 0
      0083E8 E0                    1568 	.db #0xe0	; 224
      0083E9 10                    1569 	.db #0x10	; 16
      0083EA 08                    1570 	.db #0x08	; 8
      0083EB 08                    1571 	.db #0x08	; 8
      0083EC 08                    1572 	.db #0x08	; 8
      0083ED 10                    1573 	.db #0x10	; 16
      0083EE E0                    1574 	.db #0xe0	; 224
      0083EF 00                    1575 	.db #0x00	; 0
      0083F0 0F                    1576 	.db #0x0f	; 15
      0083F1 10                    1577 	.db #0x10	; 16
      0083F2 20                    1578 	.db #0x20	; 32
      0083F3 20                    1579 	.db #0x20	; 32
      0083F4 20                    1580 	.db #0x20	; 32
      0083F5 10                    1581 	.db #0x10	; 16
      0083F6 0F                    1582 	.db #0x0f	; 15
      0083F7 00                    1583 	.db #0x00	; 0
      0083F8 08                    1584 	.db #0x08	; 8
      0083F9 F8                    1585 	.db #0xf8	; 248
      0083FA 08                    1586 	.db #0x08	; 8
      0083FB 08                    1587 	.db #0x08	; 8
      0083FC 08                    1588 	.db #0x08	; 8
      0083FD 08                    1589 	.db #0x08	; 8
      0083FE F0                    1590 	.db #0xf0	; 240
      0083FF 00                    1591 	.db #0x00	; 0
      008400 20                    1592 	.db #0x20	; 32
      008401 3F                    1593 	.db #0x3f	; 63
      008402 21                    1594 	.db #0x21	; 33
      008403 01                    1595 	.db #0x01	; 1
      008404 01                    1596 	.db #0x01	; 1
      008405 01                    1597 	.db #0x01	; 1
      008406 00                    1598 	.db #0x00	; 0
      008407 00                    1599 	.db #0x00	; 0
      008408 E0                    1600 	.db #0xe0	; 224
      008409 10                    1601 	.db #0x10	; 16
      00840A 08                    1602 	.db #0x08	; 8
      00840B 08                    1603 	.db #0x08	; 8
      00840C 08                    1604 	.db #0x08	; 8
      00840D 10                    1605 	.db #0x10	; 16
      00840E E0                    1606 	.db #0xe0	; 224
      00840F 00                    1607 	.db #0x00	; 0
      008410 0F                    1608 	.db #0x0f	; 15
      008411 18                    1609 	.db #0x18	; 24
      008412 24                    1610 	.db #0x24	; 36
      008413 24                    1611 	.db #0x24	; 36
      008414 38                    1612 	.db #0x38	; 56	'8'
      008415 50                    1613 	.db #0x50	; 80	'P'
      008416 4F                    1614 	.db #0x4f	; 79	'O'
      008417 00                    1615 	.db #0x00	; 0
      008418 08                    1616 	.db #0x08	; 8
      008419 F8                    1617 	.db #0xf8	; 248
      00841A 88                    1618 	.db #0x88	; 136
      00841B 88                    1619 	.db #0x88	; 136
      00841C 88                    1620 	.db #0x88	; 136
      00841D 88                    1621 	.db #0x88	; 136
      00841E 70                    1622 	.db #0x70	; 112	'p'
      00841F 00                    1623 	.db #0x00	; 0
      008420 20                    1624 	.db #0x20	; 32
      008421 3F                    1625 	.db #0x3f	; 63
      008422 20                    1626 	.db #0x20	; 32
      008423 00                    1627 	.db #0x00	; 0
      008424 03                    1628 	.db #0x03	; 3
      008425 0C                    1629 	.db #0x0c	; 12
      008426 30                    1630 	.db #0x30	; 48	'0'
      008427 20                    1631 	.db #0x20	; 32
      008428 00                    1632 	.db #0x00	; 0
      008429 70                    1633 	.db #0x70	; 112	'p'
      00842A 88                    1634 	.db #0x88	; 136
      00842B 08                    1635 	.db #0x08	; 8
      00842C 08                    1636 	.db #0x08	; 8
      00842D 08                    1637 	.db #0x08	; 8
      00842E 38                    1638 	.db #0x38	; 56	'8'
      00842F 00                    1639 	.db #0x00	; 0
      008430 00                    1640 	.db #0x00	; 0
      008431 38                    1641 	.db #0x38	; 56	'8'
      008432 20                    1642 	.db #0x20	; 32
      008433 21                    1643 	.db #0x21	; 33
      008434 21                    1644 	.db #0x21	; 33
      008435 22                    1645 	.db #0x22	; 34
      008436 1C                    1646 	.db #0x1c	; 28
      008437 00                    1647 	.db #0x00	; 0
      008438 18                    1648 	.db #0x18	; 24
      008439 08                    1649 	.db #0x08	; 8
      00843A 08                    1650 	.db #0x08	; 8
      00843B F8                    1651 	.db #0xf8	; 248
      00843C 08                    1652 	.db #0x08	; 8
      00843D 08                    1653 	.db #0x08	; 8
      00843E 18                    1654 	.db #0x18	; 24
      00843F 00                    1655 	.db #0x00	; 0
      008440 00                    1656 	.db #0x00	; 0
      008441 00                    1657 	.db #0x00	; 0
      008442 20                    1658 	.db #0x20	; 32
      008443 3F                    1659 	.db #0x3f	; 63
      008444 20                    1660 	.db #0x20	; 32
      008445 00                    1661 	.db #0x00	; 0
      008446 00                    1662 	.db #0x00	; 0
      008447 00                    1663 	.db #0x00	; 0
      008448 08                    1664 	.db #0x08	; 8
      008449 F8                    1665 	.db #0xf8	; 248
      00844A 08                    1666 	.db #0x08	; 8
      00844B 00                    1667 	.db #0x00	; 0
      00844C 00                    1668 	.db #0x00	; 0
      00844D 08                    1669 	.db #0x08	; 8
      00844E F8                    1670 	.db #0xf8	; 248
      00844F 08                    1671 	.db #0x08	; 8
      008450 00                    1672 	.db #0x00	; 0
      008451 1F                    1673 	.db #0x1f	; 31
      008452 20                    1674 	.db #0x20	; 32
      008453 20                    1675 	.db #0x20	; 32
      008454 20                    1676 	.db #0x20	; 32
      008455 20                    1677 	.db #0x20	; 32
      008456 1F                    1678 	.db #0x1f	; 31
      008457 00                    1679 	.db #0x00	; 0
      008458 08                    1680 	.db #0x08	; 8
      008459 78                    1681 	.db #0x78	; 120	'x'
      00845A 88                    1682 	.db #0x88	; 136
      00845B 00                    1683 	.db #0x00	; 0
      00845C 00                    1684 	.db #0x00	; 0
      00845D C8                    1685 	.db #0xc8	; 200
      00845E 38                    1686 	.db #0x38	; 56	'8'
      00845F 08                    1687 	.db #0x08	; 8
      008460 00                    1688 	.db #0x00	; 0
      008461 00                    1689 	.db #0x00	; 0
      008462 07                    1690 	.db #0x07	; 7
      008463 38                    1691 	.db #0x38	; 56	'8'
      008464 0E                    1692 	.db #0x0e	; 14
      008465 01                    1693 	.db #0x01	; 1
      008466 00                    1694 	.db #0x00	; 0
      008467 00                    1695 	.db #0x00	; 0
      008468 F8                    1696 	.db #0xf8	; 248
      008469 08                    1697 	.db #0x08	; 8
      00846A 00                    1698 	.db #0x00	; 0
      00846B F8                    1699 	.db #0xf8	; 248
      00846C 00                    1700 	.db #0x00	; 0
      00846D 08                    1701 	.db #0x08	; 8
      00846E F8                    1702 	.db #0xf8	; 248
      00846F 00                    1703 	.db #0x00	; 0
      008470 03                    1704 	.db #0x03	; 3
      008471 3C                    1705 	.db #0x3c	; 60
      008472 07                    1706 	.db #0x07	; 7
      008473 00                    1707 	.db #0x00	; 0
      008474 07                    1708 	.db #0x07	; 7
      008475 3C                    1709 	.db #0x3c	; 60
      008476 03                    1710 	.db #0x03	; 3
      008477 00                    1711 	.db #0x00	; 0
      008478 08                    1712 	.db #0x08	; 8
      008479 18                    1713 	.db #0x18	; 24
      00847A 68                    1714 	.db #0x68	; 104	'h'
      00847B 80                    1715 	.db #0x80	; 128
      00847C 80                    1716 	.db #0x80	; 128
      00847D 68                    1717 	.db #0x68	; 104	'h'
      00847E 18                    1718 	.db #0x18	; 24
      00847F 08                    1719 	.db #0x08	; 8
      008480 20                    1720 	.db #0x20	; 32
      008481 30                    1721 	.db #0x30	; 48	'0'
      008482 2C                    1722 	.db #0x2c	; 44
      008483 03                    1723 	.db #0x03	; 3
      008484 03                    1724 	.db #0x03	; 3
      008485 2C                    1725 	.db #0x2c	; 44
      008486 30                    1726 	.db #0x30	; 48	'0'
      008487 20                    1727 	.db #0x20	; 32
      008488 08                    1728 	.db #0x08	; 8
      008489 38                    1729 	.db #0x38	; 56	'8'
      00848A C8                    1730 	.db #0xc8	; 200
      00848B 00                    1731 	.db #0x00	; 0
      00848C C8                    1732 	.db #0xc8	; 200
      00848D 38                    1733 	.db #0x38	; 56	'8'
      00848E 08                    1734 	.db #0x08	; 8
      00848F 00                    1735 	.db #0x00	; 0
      008490 00                    1736 	.db #0x00	; 0
      008491 00                    1737 	.db #0x00	; 0
      008492 20                    1738 	.db #0x20	; 32
      008493 3F                    1739 	.db #0x3f	; 63
      008494 20                    1740 	.db #0x20	; 32
      008495 00                    1741 	.db #0x00	; 0
      008496 00                    1742 	.db #0x00	; 0
      008497 00                    1743 	.db #0x00	; 0
      008498 10                    1744 	.db #0x10	; 16
      008499 08                    1745 	.db #0x08	; 8
      00849A 08                    1746 	.db #0x08	; 8
      00849B 08                    1747 	.db #0x08	; 8
      00849C C8                    1748 	.db #0xc8	; 200
      00849D 38                    1749 	.db #0x38	; 56	'8'
      00849E 08                    1750 	.db #0x08	; 8
      00849F 00                    1751 	.db #0x00	; 0
      0084A0 20                    1752 	.db #0x20	; 32
      0084A1 38                    1753 	.db #0x38	; 56	'8'
      0084A2 26                    1754 	.db #0x26	; 38
      0084A3 21                    1755 	.db #0x21	; 33
      0084A4 20                    1756 	.db #0x20	; 32
      0084A5 20                    1757 	.db #0x20	; 32
      0084A6 18                    1758 	.db #0x18	; 24
      0084A7 00                    1759 	.db #0x00	; 0
      0084A8 00                    1760 	.db #0x00	; 0
      0084A9 00                    1761 	.db #0x00	; 0
      0084AA 00                    1762 	.db #0x00	; 0
      0084AB FE                    1763 	.db #0xfe	; 254
      0084AC 02                    1764 	.db #0x02	; 2
      0084AD 02                    1765 	.db #0x02	; 2
      0084AE 02                    1766 	.db #0x02	; 2
      0084AF 00                    1767 	.db #0x00	; 0
      0084B0 00                    1768 	.db #0x00	; 0
      0084B1 00                    1769 	.db #0x00	; 0
      0084B2 00                    1770 	.db #0x00	; 0
      0084B3 7F                    1771 	.db #0x7f	; 127
      0084B4 40                    1772 	.db #0x40	; 64
      0084B5 40                    1773 	.db #0x40	; 64
      0084B6 40                    1774 	.db #0x40	; 64
      0084B7 00                    1775 	.db #0x00	; 0
      0084B8 00                    1776 	.db #0x00	; 0
      0084B9 0C                    1777 	.db #0x0c	; 12
      0084BA 30                    1778 	.db #0x30	; 48	'0'
      0084BB C0                    1779 	.db #0xc0	; 192
      0084BC 00                    1780 	.db #0x00	; 0
      0084BD 00                    1781 	.db #0x00	; 0
      0084BE 00                    1782 	.db #0x00	; 0
      0084BF 00                    1783 	.db #0x00	; 0
      0084C0 00                    1784 	.db #0x00	; 0
      0084C1 00                    1785 	.db #0x00	; 0
      0084C2 00                    1786 	.db #0x00	; 0
      0084C3 01                    1787 	.db #0x01	; 1
      0084C4 06                    1788 	.db #0x06	; 6
      0084C5 38                    1789 	.db #0x38	; 56	'8'
      0084C6 C0                    1790 	.db #0xc0	; 192
      0084C7 00                    1791 	.db #0x00	; 0
      0084C8 00                    1792 	.db #0x00	; 0
      0084C9 02                    1793 	.db #0x02	; 2
      0084CA 02                    1794 	.db #0x02	; 2
      0084CB 02                    1795 	.db #0x02	; 2
      0084CC FE                    1796 	.db #0xfe	; 254
      0084CD 00                    1797 	.db #0x00	; 0
      0084CE 00                    1798 	.db #0x00	; 0
      0084CF 00                    1799 	.db #0x00	; 0
      0084D0 00                    1800 	.db #0x00	; 0
      0084D1 40                    1801 	.db #0x40	; 64
      0084D2 40                    1802 	.db #0x40	; 64
      0084D3 40                    1803 	.db #0x40	; 64
      0084D4 7F                    1804 	.db #0x7f	; 127
      0084D5 00                    1805 	.db #0x00	; 0
      0084D6 00                    1806 	.db #0x00	; 0
      0084D7 00                    1807 	.db #0x00	; 0
      0084D8 00                    1808 	.db #0x00	; 0
      0084D9 00                    1809 	.db #0x00	; 0
      0084DA 04                    1810 	.db #0x04	; 4
      0084DB 02                    1811 	.db #0x02	; 2
      0084DC 02                    1812 	.db #0x02	; 2
      0084DD 02                    1813 	.db #0x02	; 2
      0084DE 04                    1814 	.db #0x04	; 4
      0084DF 00                    1815 	.db #0x00	; 0
      0084E0 00                    1816 	.db #0x00	; 0
      0084E1 00                    1817 	.db #0x00	; 0
      0084E2 00                    1818 	.db #0x00	; 0
      0084E3 00                    1819 	.db #0x00	; 0
      0084E4 00                    1820 	.db #0x00	; 0
      0084E5 00                    1821 	.db #0x00	; 0
      0084E6 00                    1822 	.db #0x00	; 0
      0084E7 00                    1823 	.db #0x00	; 0
      0084E8 00                    1824 	.db #0x00	; 0
      0084E9 00                    1825 	.db #0x00	; 0
      0084EA 00                    1826 	.db #0x00	; 0
      0084EB 00                    1827 	.db #0x00	; 0
      0084EC 00                    1828 	.db #0x00	; 0
      0084ED 00                    1829 	.db #0x00	; 0
      0084EE 00                    1830 	.db #0x00	; 0
      0084EF 00                    1831 	.db #0x00	; 0
      0084F0 80                    1832 	.db #0x80	; 128
      0084F1 80                    1833 	.db #0x80	; 128
      0084F2 80                    1834 	.db #0x80	; 128
      0084F3 80                    1835 	.db #0x80	; 128
      0084F4 80                    1836 	.db #0x80	; 128
      0084F5 80                    1837 	.db #0x80	; 128
      0084F6 80                    1838 	.db #0x80	; 128
      0084F7 80                    1839 	.db #0x80	; 128
      0084F8 00                    1840 	.db #0x00	; 0
      0084F9 02                    1841 	.db #0x02	; 2
      0084FA 02                    1842 	.db #0x02	; 2
      0084FB 04                    1843 	.db #0x04	; 4
      0084FC 00                    1844 	.db #0x00	; 0
      0084FD 00                    1845 	.db #0x00	; 0
      0084FE 00                    1846 	.db #0x00	; 0
      0084FF 00                    1847 	.db #0x00	; 0
      008500 00                    1848 	.db #0x00	; 0
      008501 00                    1849 	.db #0x00	; 0
      008502 00                    1850 	.db #0x00	; 0
      008503 00                    1851 	.db #0x00	; 0
      008504 00                    1852 	.db #0x00	; 0
      008505 00                    1853 	.db #0x00	; 0
      008506 00                    1854 	.db #0x00	; 0
      008507 00                    1855 	.db #0x00	; 0
      008508 00                    1856 	.db #0x00	; 0
      008509 00                    1857 	.db #0x00	; 0
      00850A 80                    1858 	.db #0x80	; 128
      00850B 80                    1859 	.db #0x80	; 128
      00850C 80                    1860 	.db #0x80	; 128
      00850D 80                    1861 	.db #0x80	; 128
      00850E 00                    1862 	.db #0x00	; 0
      00850F 00                    1863 	.db #0x00	; 0
      008510 00                    1864 	.db #0x00	; 0
      008511 19                    1865 	.db #0x19	; 25
      008512 24                    1866 	.db #0x24	; 36
      008513 22                    1867 	.db #0x22	; 34
      008514 22                    1868 	.db #0x22	; 34
      008515 22                    1869 	.db #0x22	; 34
      008516 3F                    1870 	.db #0x3f	; 63
      008517 20                    1871 	.db #0x20	; 32
      008518 08                    1872 	.db #0x08	; 8
      008519 F8                    1873 	.db #0xf8	; 248
      00851A 00                    1874 	.db #0x00	; 0
      00851B 80                    1875 	.db #0x80	; 128
      00851C 80                    1876 	.db #0x80	; 128
      00851D 00                    1877 	.db #0x00	; 0
      00851E 00                    1878 	.db #0x00	; 0
      00851F 00                    1879 	.db #0x00	; 0
      008520 00                    1880 	.db #0x00	; 0
      008521 3F                    1881 	.db #0x3f	; 63
      008522 11                    1882 	.db #0x11	; 17
      008523 20                    1883 	.db #0x20	; 32
      008524 20                    1884 	.db #0x20	; 32
      008525 11                    1885 	.db #0x11	; 17
      008526 0E                    1886 	.db #0x0e	; 14
      008527 00                    1887 	.db #0x00	; 0
      008528 00                    1888 	.db #0x00	; 0
      008529 00                    1889 	.db #0x00	; 0
      00852A 00                    1890 	.db #0x00	; 0
      00852B 80                    1891 	.db #0x80	; 128
      00852C 80                    1892 	.db #0x80	; 128
      00852D 80                    1893 	.db #0x80	; 128
      00852E 00                    1894 	.db #0x00	; 0
      00852F 00                    1895 	.db #0x00	; 0
      008530 00                    1896 	.db #0x00	; 0
      008531 0E                    1897 	.db #0x0e	; 14
      008532 11                    1898 	.db #0x11	; 17
      008533 20                    1899 	.db #0x20	; 32
      008534 20                    1900 	.db #0x20	; 32
      008535 20                    1901 	.db #0x20	; 32
      008536 11                    1902 	.db #0x11	; 17
      008537 00                    1903 	.db #0x00	; 0
      008538 00                    1904 	.db #0x00	; 0
      008539 00                    1905 	.db #0x00	; 0
      00853A 00                    1906 	.db #0x00	; 0
      00853B 80                    1907 	.db #0x80	; 128
      00853C 80                    1908 	.db #0x80	; 128
      00853D 88                    1909 	.db #0x88	; 136
      00853E F8                    1910 	.db #0xf8	; 248
      00853F 00                    1911 	.db #0x00	; 0
      008540 00                    1912 	.db #0x00	; 0
      008541 0E                    1913 	.db #0x0e	; 14
      008542 11                    1914 	.db #0x11	; 17
      008543 20                    1915 	.db #0x20	; 32
      008544 20                    1916 	.db #0x20	; 32
      008545 10                    1917 	.db #0x10	; 16
      008546 3F                    1918 	.db #0x3f	; 63
      008547 20                    1919 	.db #0x20	; 32
      008548 00                    1920 	.db #0x00	; 0
      008549 00                    1921 	.db #0x00	; 0
      00854A 80                    1922 	.db #0x80	; 128
      00854B 80                    1923 	.db #0x80	; 128
      00854C 80                    1924 	.db #0x80	; 128
      00854D 80                    1925 	.db #0x80	; 128
      00854E 00                    1926 	.db #0x00	; 0
      00854F 00                    1927 	.db #0x00	; 0
      008550 00                    1928 	.db #0x00	; 0
      008551 1F                    1929 	.db #0x1f	; 31
      008552 22                    1930 	.db #0x22	; 34
      008553 22                    1931 	.db #0x22	; 34
      008554 22                    1932 	.db #0x22	; 34
      008555 22                    1933 	.db #0x22	; 34
      008556 13                    1934 	.db #0x13	; 19
      008557 00                    1935 	.db #0x00	; 0
      008558 00                    1936 	.db #0x00	; 0
      008559 80                    1937 	.db #0x80	; 128
      00855A 80                    1938 	.db #0x80	; 128
      00855B F0                    1939 	.db #0xf0	; 240
      00855C 88                    1940 	.db #0x88	; 136
      00855D 88                    1941 	.db #0x88	; 136
      00855E 88                    1942 	.db #0x88	; 136
      00855F 18                    1943 	.db #0x18	; 24
      008560 00                    1944 	.db #0x00	; 0
      008561 20                    1945 	.db #0x20	; 32
      008562 20                    1946 	.db #0x20	; 32
      008563 3F                    1947 	.db #0x3f	; 63
      008564 20                    1948 	.db #0x20	; 32
      008565 20                    1949 	.db #0x20	; 32
      008566 00                    1950 	.db #0x00	; 0
      008567 00                    1951 	.db #0x00	; 0
      008568 00                    1952 	.db #0x00	; 0
      008569 00                    1953 	.db #0x00	; 0
      00856A 80                    1954 	.db #0x80	; 128
      00856B 80                    1955 	.db #0x80	; 128
      00856C 80                    1956 	.db #0x80	; 128
      00856D 80                    1957 	.db #0x80	; 128
      00856E 80                    1958 	.db #0x80	; 128
      00856F 00                    1959 	.db #0x00	; 0
      008570 00                    1960 	.db #0x00	; 0
      008571 6B                    1961 	.db #0x6b	; 107	'k'
      008572 94                    1962 	.db #0x94	; 148
      008573 94                    1963 	.db #0x94	; 148
      008574 94                    1964 	.db #0x94	; 148
      008575 93                    1965 	.db #0x93	; 147
      008576 60                    1966 	.db #0x60	; 96
      008577 00                    1967 	.db #0x00	; 0
      008578 08                    1968 	.db #0x08	; 8
      008579 F8                    1969 	.db #0xf8	; 248
      00857A 00                    1970 	.db #0x00	; 0
      00857B 80                    1971 	.db #0x80	; 128
      00857C 80                    1972 	.db #0x80	; 128
      00857D 80                    1973 	.db #0x80	; 128
      00857E 00                    1974 	.db #0x00	; 0
      00857F 00                    1975 	.db #0x00	; 0
      008580 20                    1976 	.db #0x20	; 32
      008581 3F                    1977 	.db #0x3f	; 63
      008582 21                    1978 	.db #0x21	; 33
      008583 00                    1979 	.db #0x00	; 0
      008584 00                    1980 	.db #0x00	; 0
      008585 20                    1981 	.db #0x20	; 32
      008586 3F                    1982 	.db #0x3f	; 63
      008587 20                    1983 	.db #0x20	; 32
      008588 00                    1984 	.db #0x00	; 0
      008589 80                    1985 	.db #0x80	; 128
      00858A 98                    1986 	.db #0x98	; 152
      00858B 98                    1987 	.db #0x98	; 152
      00858C 00                    1988 	.db #0x00	; 0
      00858D 00                    1989 	.db #0x00	; 0
      00858E 00                    1990 	.db #0x00	; 0
      00858F 00                    1991 	.db #0x00	; 0
      008590 00                    1992 	.db #0x00	; 0
      008591 20                    1993 	.db #0x20	; 32
      008592 20                    1994 	.db #0x20	; 32
      008593 3F                    1995 	.db #0x3f	; 63
      008594 20                    1996 	.db #0x20	; 32
      008595 20                    1997 	.db #0x20	; 32
      008596 00                    1998 	.db #0x00	; 0
      008597 00                    1999 	.db #0x00	; 0
      008598 00                    2000 	.db #0x00	; 0
      008599 00                    2001 	.db #0x00	; 0
      00859A 00                    2002 	.db #0x00	; 0
      00859B 80                    2003 	.db #0x80	; 128
      00859C 98                    2004 	.db #0x98	; 152
      00859D 98                    2005 	.db #0x98	; 152
      00859E 00                    2006 	.db #0x00	; 0
      00859F 00                    2007 	.db #0x00	; 0
      0085A0 00                    2008 	.db #0x00	; 0
      0085A1 C0                    2009 	.db #0xc0	; 192
      0085A2 80                    2010 	.db #0x80	; 128
      0085A3 80                    2011 	.db #0x80	; 128
      0085A4 80                    2012 	.db #0x80	; 128
      0085A5 7F                    2013 	.db #0x7f	; 127
      0085A6 00                    2014 	.db #0x00	; 0
      0085A7 00                    2015 	.db #0x00	; 0
      0085A8 08                    2016 	.db #0x08	; 8
      0085A9 F8                    2017 	.db #0xf8	; 248
      0085AA 00                    2018 	.db #0x00	; 0
      0085AB 00                    2019 	.db #0x00	; 0
      0085AC 80                    2020 	.db #0x80	; 128
      0085AD 80                    2021 	.db #0x80	; 128
      0085AE 80                    2022 	.db #0x80	; 128
      0085AF 00                    2023 	.db #0x00	; 0
      0085B0 20                    2024 	.db #0x20	; 32
      0085B1 3F                    2025 	.db #0x3f	; 63
      0085B2 24                    2026 	.db #0x24	; 36
      0085B3 02                    2027 	.db #0x02	; 2
      0085B4 2D                    2028 	.db #0x2d	; 45
      0085B5 30                    2029 	.db #0x30	; 48	'0'
      0085B6 20                    2030 	.db #0x20	; 32
      0085B7 00                    2031 	.db #0x00	; 0
      0085B8 00                    2032 	.db #0x00	; 0
      0085B9 08                    2033 	.db #0x08	; 8
      0085BA 08                    2034 	.db #0x08	; 8
      0085BB F8                    2035 	.db #0xf8	; 248
      0085BC 00                    2036 	.db #0x00	; 0
      0085BD 00                    2037 	.db #0x00	; 0
      0085BE 00                    2038 	.db #0x00	; 0
      0085BF 00                    2039 	.db #0x00	; 0
      0085C0 00                    2040 	.db #0x00	; 0
      0085C1 20                    2041 	.db #0x20	; 32
      0085C2 20                    2042 	.db #0x20	; 32
      0085C3 3F                    2043 	.db #0x3f	; 63
      0085C4 20                    2044 	.db #0x20	; 32
      0085C5 20                    2045 	.db #0x20	; 32
      0085C6 00                    2046 	.db #0x00	; 0
      0085C7 00                    2047 	.db #0x00	; 0
      0085C8 80                    2048 	.db #0x80	; 128
      0085C9 80                    2049 	.db #0x80	; 128
      0085CA 80                    2050 	.db #0x80	; 128
      0085CB 80                    2051 	.db #0x80	; 128
      0085CC 80                    2052 	.db #0x80	; 128
      0085CD 80                    2053 	.db #0x80	; 128
      0085CE 80                    2054 	.db #0x80	; 128
      0085CF 00                    2055 	.db #0x00	; 0
      0085D0 20                    2056 	.db #0x20	; 32
      0085D1 3F                    2057 	.db #0x3f	; 63
      0085D2 20                    2058 	.db #0x20	; 32
      0085D3 00                    2059 	.db #0x00	; 0
      0085D4 3F                    2060 	.db #0x3f	; 63
      0085D5 20                    2061 	.db #0x20	; 32
      0085D6 00                    2062 	.db #0x00	; 0
      0085D7 3F                    2063 	.db #0x3f	; 63
      0085D8 80                    2064 	.db #0x80	; 128
      0085D9 80                    2065 	.db #0x80	; 128
      0085DA 00                    2066 	.db #0x00	; 0
      0085DB 80                    2067 	.db #0x80	; 128
      0085DC 80                    2068 	.db #0x80	; 128
      0085DD 80                    2069 	.db #0x80	; 128
      0085DE 00                    2070 	.db #0x00	; 0
      0085DF 00                    2071 	.db #0x00	; 0
      0085E0 20                    2072 	.db #0x20	; 32
      0085E1 3F                    2073 	.db #0x3f	; 63
      0085E2 21                    2074 	.db #0x21	; 33
      0085E3 00                    2075 	.db #0x00	; 0
      0085E4 00                    2076 	.db #0x00	; 0
      0085E5 20                    2077 	.db #0x20	; 32
      0085E6 3F                    2078 	.db #0x3f	; 63
      0085E7 20                    2079 	.db #0x20	; 32
      0085E8 00                    2080 	.db #0x00	; 0
      0085E9 00                    2081 	.db #0x00	; 0
      0085EA 80                    2082 	.db #0x80	; 128
      0085EB 80                    2083 	.db #0x80	; 128
      0085EC 80                    2084 	.db #0x80	; 128
      0085ED 80                    2085 	.db #0x80	; 128
      0085EE 00                    2086 	.db #0x00	; 0
      0085EF 00                    2087 	.db #0x00	; 0
      0085F0 00                    2088 	.db #0x00	; 0
      0085F1 1F                    2089 	.db #0x1f	; 31
      0085F2 20                    2090 	.db #0x20	; 32
      0085F3 20                    2091 	.db #0x20	; 32
      0085F4 20                    2092 	.db #0x20	; 32
      0085F5 20                    2093 	.db #0x20	; 32
      0085F6 1F                    2094 	.db #0x1f	; 31
      0085F7 00                    2095 	.db #0x00	; 0
      0085F8 80                    2096 	.db #0x80	; 128
      0085F9 80                    2097 	.db #0x80	; 128
      0085FA 00                    2098 	.db #0x00	; 0
      0085FB 80                    2099 	.db #0x80	; 128
      0085FC 80                    2100 	.db #0x80	; 128
      0085FD 00                    2101 	.db #0x00	; 0
      0085FE 00                    2102 	.db #0x00	; 0
      0085FF 00                    2103 	.db #0x00	; 0
      008600 80                    2104 	.db #0x80	; 128
      008601 FF                    2105 	.db #0xff	; 255
      008602 A1                    2106 	.db #0xa1	; 161
      008603 20                    2107 	.db #0x20	; 32
      008604 20                    2108 	.db #0x20	; 32
      008605 11                    2109 	.db #0x11	; 17
      008606 0E                    2110 	.db #0x0e	; 14
      008607 00                    2111 	.db #0x00	; 0
      008608 00                    2112 	.db #0x00	; 0
      008609 00                    2113 	.db #0x00	; 0
      00860A 00                    2114 	.db #0x00	; 0
      00860B 80                    2115 	.db #0x80	; 128
      00860C 80                    2116 	.db #0x80	; 128
      00860D 80                    2117 	.db #0x80	; 128
      00860E 80                    2118 	.db #0x80	; 128
      00860F 00                    2119 	.db #0x00	; 0
      008610 00                    2120 	.db #0x00	; 0
      008611 0E                    2121 	.db #0x0e	; 14
      008612 11                    2122 	.db #0x11	; 17
      008613 20                    2123 	.db #0x20	; 32
      008614 20                    2124 	.db #0x20	; 32
      008615 A0                    2125 	.db #0xa0	; 160
      008616 FF                    2126 	.db #0xff	; 255
      008617 80                    2127 	.db #0x80	; 128
      008618 80                    2128 	.db #0x80	; 128
      008619 80                    2129 	.db #0x80	; 128
      00861A 80                    2130 	.db #0x80	; 128
      00861B 00                    2131 	.db #0x00	; 0
      00861C 80                    2132 	.db #0x80	; 128
      00861D 80                    2133 	.db #0x80	; 128
      00861E 80                    2134 	.db #0x80	; 128
      00861F 00                    2135 	.db #0x00	; 0
      008620 20                    2136 	.db #0x20	; 32
      008621 20                    2137 	.db #0x20	; 32
      008622 3F                    2138 	.db #0x3f	; 63
      008623 21                    2139 	.db #0x21	; 33
      008624 20                    2140 	.db #0x20	; 32
      008625 00                    2141 	.db #0x00	; 0
      008626 01                    2142 	.db #0x01	; 1
      008627 00                    2143 	.db #0x00	; 0
      008628 00                    2144 	.db #0x00	; 0
      008629 00                    2145 	.db #0x00	; 0
      00862A 80                    2146 	.db #0x80	; 128
      00862B 80                    2147 	.db #0x80	; 128
      00862C 80                    2148 	.db #0x80	; 128
      00862D 80                    2149 	.db #0x80	; 128
      00862E 80                    2150 	.db #0x80	; 128
      00862F 00                    2151 	.db #0x00	; 0
      008630 00                    2152 	.db #0x00	; 0
      008631 33                    2153 	.db #0x33	; 51	'3'
      008632 24                    2154 	.db #0x24	; 36
      008633 24                    2155 	.db #0x24	; 36
      008634 24                    2156 	.db #0x24	; 36
      008635 24                    2157 	.db #0x24	; 36
      008636 19                    2158 	.db #0x19	; 25
      008637 00                    2159 	.db #0x00	; 0
      008638 00                    2160 	.db #0x00	; 0
      008639 80                    2161 	.db #0x80	; 128
      00863A 80                    2162 	.db #0x80	; 128
      00863B E0                    2163 	.db #0xe0	; 224
      00863C 80                    2164 	.db #0x80	; 128
      00863D 80                    2165 	.db #0x80	; 128
      00863E 00                    2166 	.db #0x00	; 0
      00863F 00                    2167 	.db #0x00	; 0
      008640 00                    2168 	.db #0x00	; 0
      008641 00                    2169 	.db #0x00	; 0
      008642 00                    2170 	.db #0x00	; 0
      008643 1F                    2171 	.db #0x1f	; 31
      008644 20                    2172 	.db #0x20	; 32
      008645 20                    2173 	.db #0x20	; 32
      008646 00                    2174 	.db #0x00	; 0
      008647 00                    2175 	.db #0x00	; 0
      008648 80                    2176 	.db #0x80	; 128
      008649 80                    2177 	.db #0x80	; 128
      00864A 00                    2178 	.db #0x00	; 0
      00864B 00                    2179 	.db #0x00	; 0
      00864C 00                    2180 	.db #0x00	; 0
      00864D 80                    2181 	.db #0x80	; 128
      00864E 80                    2182 	.db #0x80	; 128
      00864F 00                    2183 	.db #0x00	; 0
      008650 00                    2184 	.db #0x00	; 0
      008651 1F                    2185 	.db #0x1f	; 31
      008652 20                    2186 	.db #0x20	; 32
      008653 20                    2187 	.db #0x20	; 32
      008654 20                    2188 	.db #0x20	; 32
      008655 10                    2189 	.db #0x10	; 16
      008656 3F                    2190 	.db #0x3f	; 63
      008657 20                    2191 	.db #0x20	; 32
      008658 80                    2192 	.db #0x80	; 128
      008659 80                    2193 	.db #0x80	; 128
      00865A 80                    2194 	.db #0x80	; 128
      00865B 00                    2195 	.db #0x00	; 0
      00865C 00                    2196 	.db #0x00	; 0
      00865D 80                    2197 	.db #0x80	; 128
      00865E 80                    2198 	.db #0x80	; 128
      00865F 80                    2199 	.db #0x80	; 128
      008660 00                    2200 	.db #0x00	; 0
      008661 01                    2201 	.db #0x01	; 1
      008662 0E                    2202 	.db #0x0e	; 14
      008663 30                    2203 	.db #0x30	; 48	'0'
      008664 08                    2204 	.db #0x08	; 8
      008665 06                    2205 	.db #0x06	; 6
      008666 01                    2206 	.db #0x01	; 1
      008667 00                    2207 	.db #0x00	; 0
      008668 80                    2208 	.db #0x80	; 128
      008669 80                    2209 	.db #0x80	; 128
      00866A 00                    2210 	.db #0x00	; 0
      00866B 80                    2211 	.db #0x80	; 128
      00866C 00                    2212 	.db #0x00	; 0
      00866D 80                    2213 	.db #0x80	; 128
      00866E 80                    2214 	.db #0x80	; 128
      00866F 80                    2215 	.db #0x80	; 128
      008670 0F                    2216 	.db #0x0f	; 15
      008671 30                    2217 	.db #0x30	; 48	'0'
      008672 0C                    2218 	.db #0x0c	; 12
      008673 03                    2219 	.db #0x03	; 3
      008674 0C                    2220 	.db #0x0c	; 12
      008675 30                    2221 	.db #0x30	; 48	'0'
      008676 0F                    2222 	.db #0x0f	; 15
      008677 00                    2223 	.db #0x00	; 0
      008678 00                    2224 	.db #0x00	; 0
      008679 80                    2225 	.db #0x80	; 128
      00867A 80                    2226 	.db #0x80	; 128
      00867B 00                    2227 	.db #0x00	; 0
      00867C 80                    2228 	.db #0x80	; 128
      00867D 80                    2229 	.db #0x80	; 128
      00867E 80                    2230 	.db #0x80	; 128
      00867F 00                    2231 	.db #0x00	; 0
      008680 00                    2232 	.db #0x00	; 0
      008681 20                    2233 	.db #0x20	; 32
      008682 31                    2234 	.db #0x31	; 49	'1'
      008683 2E                    2235 	.db #0x2e	; 46
      008684 0E                    2236 	.db #0x0e	; 14
      008685 31                    2237 	.db #0x31	; 49	'1'
      008686 20                    2238 	.db #0x20	; 32
      008687 00                    2239 	.db #0x00	; 0
      008688 80                    2240 	.db #0x80	; 128
      008689 80                    2241 	.db #0x80	; 128
      00868A 80                    2242 	.db #0x80	; 128
      00868B 00                    2243 	.db #0x00	; 0
      00868C 00                    2244 	.db #0x00	; 0
      00868D 80                    2245 	.db #0x80	; 128
      00868E 80                    2246 	.db #0x80	; 128
      00868F 80                    2247 	.db #0x80	; 128
      008690 80                    2248 	.db #0x80	; 128
      008691 81                    2249 	.db #0x81	; 129
      008692 8E                    2250 	.db #0x8e	; 142
      008693 70                    2251 	.db #0x70	; 112	'p'
      008694 18                    2252 	.db #0x18	; 24
      008695 06                    2253 	.db #0x06	; 6
      008696 01                    2254 	.db #0x01	; 1
      008697 00                    2255 	.db #0x00	; 0
      008698 00                    2256 	.db #0x00	; 0
      008699 80                    2257 	.db #0x80	; 128
      00869A 80                    2258 	.db #0x80	; 128
      00869B 80                    2259 	.db #0x80	; 128
      00869C 80                    2260 	.db #0x80	; 128
      00869D 80                    2261 	.db #0x80	; 128
      00869E 80                    2262 	.db #0x80	; 128
      00869F 00                    2263 	.db #0x00	; 0
      0086A0 00                    2264 	.db #0x00	; 0
      0086A1 21                    2265 	.db #0x21	; 33
      0086A2 30                    2266 	.db #0x30	; 48	'0'
      0086A3 2C                    2267 	.db #0x2c	; 44
      0086A4 22                    2268 	.db #0x22	; 34
      0086A5 21                    2269 	.db #0x21	; 33
      0086A6 30                    2270 	.db #0x30	; 48	'0'
      0086A7 00                    2271 	.db #0x00	; 0
      0086A8 00                    2272 	.db #0x00	; 0
      0086A9 00                    2273 	.db #0x00	; 0
      0086AA 00                    2274 	.db #0x00	; 0
      0086AB 00                    2275 	.db #0x00	; 0
      0086AC 80                    2276 	.db #0x80	; 128
      0086AD 7C                    2277 	.db #0x7c	; 124
      0086AE 02                    2278 	.db #0x02	; 2
      0086AF 02                    2279 	.db #0x02	; 2
      0086B0 00                    2280 	.db #0x00	; 0
      0086B1 00                    2281 	.db #0x00	; 0
      0086B2 00                    2282 	.db #0x00	; 0
      0086B3 00                    2283 	.db #0x00	; 0
      0086B4 00                    2284 	.db #0x00	; 0
      0086B5 3F                    2285 	.db #0x3f	; 63
      0086B6 40                    2286 	.db #0x40	; 64
      0086B7 40                    2287 	.db #0x40	; 64
      0086B8 00                    2288 	.db #0x00	; 0
      0086B9 00                    2289 	.db #0x00	; 0
      0086BA 00                    2290 	.db #0x00	; 0
      0086BB 00                    2291 	.db #0x00	; 0
      0086BC FF                    2292 	.db #0xff	; 255
      0086BD 00                    2293 	.db #0x00	; 0
      0086BE 00                    2294 	.db #0x00	; 0
      0086BF 00                    2295 	.db #0x00	; 0
      0086C0 00                    2296 	.db #0x00	; 0
      0086C1 00                    2297 	.db #0x00	; 0
      0086C2 00                    2298 	.db #0x00	; 0
      0086C3 00                    2299 	.db #0x00	; 0
      0086C4 FF                    2300 	.db #0xff	; 255
      0086C5 00                    2301 	.db #0x00	; 0
      0086C6 00                    2302 	.db #0x00	; 0
      0086C7 00                    2303 	.db #0x00	; 0
      0086C8 00                    2304 	.db #0x00	; 0
      0086C9 02                    2305 	.db #0x02	; 2
      0086CA 02                    2306 	.db #0x02	; 2
      0086CB 7C                    2307 	.db #0x7c	; 124
      0086CC 80                    2308 	.db #0x80	; 128
      0086CD 00                    2309 	.db #0x00	; 0
      0086CE 00                    2310 	.db #0x00	; 0
      0086CF 00                    2311 	.db #0x00	; 0
      0086D0 00                    2312 	.db #0x00	; 0
      0086D1 40                    2313 	.db #0x40	; 64
      0086D2 40                    2314 	.db #0x40	; 64
      0086D3 3F                    2315 	.db #0x3f	; 63
      0086D4 00                    2316 	.db #0x00	; 0
      0086D5 00                    2317 	.db #0x00	; 0
      0086D6 00                    2318 	.db #0x00	; 0
      0086D7 00                    2319 	.db #0x00	; 0
      0086D8 00                    2320 	.db #0x00	; 0
      0086D9 06                    2321 	.db #0x06	; 6
      0086DA 01                    2322 	.db #0x01	; 1
      0086DB 01                    2323 	.db #0x01	; 1
      0086DC 02                    2324 	.db #0x02	; 2
      0086DD 02                    2325 	.db #0x02	; 2
      0086DE 04                    2326 	.db #0x04	; 4
      0086DF 04                    2327 	.db #0x04	; 4
      0086E0 00                    2328 	.db #0x00	; 0
      0086E1 00                    2329 	.db #0x00	; 0
      0086E2 00                    2330 	.db #0x00	; 0
      0086E3 00                    2331 	.db #0x00	; 0
      0086E4 00                    2332 	.db #0x00	; 0
      0086E5 00                    2333 	.db #0x00	; 0
      0086E6 00                    2334 	.db #0x00	; 0
      0086E7 00                    2335 	.db #0x00	; 0
                                   2336 	.area INITIALIZER
                                   2337 	.area CABS (ABS)
