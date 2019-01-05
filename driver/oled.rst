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
      008B9C                         67 _delay_ms:
      008B9C 52 02            [ 2]   68 	sub	sp, #2
                                     69 ;	driver/oled.c: 48: while(ms)
      008B9E 16 05            [ 2]   70 	ldw	y, (0x05, sp)
      008BA0 17 01            [ 2]   71 	ldw	(0x01, sp), y
      008BA2                         72 00104$:
      008BA2 1E 01            [ 2]   73 	ldw	x, (0x01, sp)
      008BA4 27 11            [ 1]   74 	jreq	00106$
                                     75 ;	driver/oled.c: 51: while(a--);
      008BA6 AE 07 08         [ 2]   76 	ldw	x, #0x0708
      008BA9                         77 00101$:
      008BA9 90 93            [ 1]   78 	ldw	y, x
      008BAB 5A               [ 2]   79 	decw	x
      008BAC 90 5D            [ 2]   80 	tnzw	y
      008BAE 26 F9            [ 1]   81 	jrne	00101$
                                     82 ;	driver/oled.c: 52: ms--;
      008BB0 1E 01            [ 2]   83 	ldw	x, (0x01, sp)
      008BB2 5A               [ 2]   84 	decw	x
      008BB3 1F 01            [ 2]   85 	ldw	(0x01, sp), x
      008BB5 20 EB            [ 2]   86 	jra	00104$
      008BB7                         87 00106$:
                                     88 ;	driver/oled.c: 54: return;
                                     89 ;	driver/oled.c: 55: }
      008BB7 5B 02            [ 2]   90 	addw	sp, #2
      008BB9 81               [ 4]   91 	ret
                                     92 ;	driver/oled.c: 77: void OLED_WR_Byte(u8 dat,u8 cmd)
                                     93 ;	-----------------------------------------
                                     94 ;	 function OLED_WR_Byte
                                     95 ;	-----------------------------------------
      008BBA                         96 _OLED_WR_Byte:
      008BBA 88               [ 1]   97 	push	a
                                     98 ;	driver/oled.c: 80: if(cmd)
      008BBB 0D 05            [ 1]   99 	tnz	(0x05, sp)
      008BBD 27 0D            [ 1]  100 	jreq	00102$
                                    101 ;	driver/oled.c: 81: OLED_DC_Set();
      008BBF 4B 10            [ 1]  102 	push	#0x10
      008BC1 4B 0A            [ 1]  103 	push	#0x0a
      008BC3 4B 50            [ 1]  104 	push	#0x50
      008BC5 CD 90 C6         [ 4]  105 	call	_GPIO_WriteHigh
      008BC8 5B 03            [ 2]  106 	addw	sp, #3
      008BCA 20 0B            [ 2]  107 	jra	00103$
      008BCC                        108 00102$:
                                    109 ;	driver/oled.c: 83: OLED_DC_Clr();
      008BCC 4B 10            [ 1]  110 	push	#0x10
      008BCE 4B 0A            [ 1]  111 	push	#0x0a
      008BD0 4B 50            [ 1]  112 	push	#0x50
      008BD2 CD 90 CD         [ 4]  113 	call	_GPIO_WriteLow
      008BD5 5B 03            [ 2]  114 	addw	sp, #3
      008BD7                        115 00103$:
                                    116 ;	driver/oled.c: 84: OLED_CS_Clr();
      008BD7 4B 20            [ 1]  117 	push	#0x20
      008BD9 4B 0A            [ 1]  118 	push	#0x0a
      008BDB 4B 50            [ 1]  119 	push	#0x50
      008BDD CD 90 CD         [ 4]  120 	call	_GPIO_WriteLow
      008BE0 5B 03            [ 2]  121 	addw	sp, #3
                                    122 ;	driver/oled.c: 85: for(i=0;i<8;i++)
      008BE2 0F 01            [ 1]  123 	clr	(0x01, sp)
      008BE4                        124 00108$:
                                    125 ;	driver/oled.c: 87: OLED_SCLK_Clr();
      008BE4 4B 02            [ 1]  126 	push	#0x02
      008BE6 4B 0A            [ 1]  127 	push	#0x0a
      008BE8 4B 50            [ 1]  128 	push	#0x50
      008BEA CD 90 CD         [ 4]  129 	call	_GPIO_WriteLow
      008BED 5B 03            [ 2]  130 	addw	sp, #3
                                    131 ;	driver/oled.c: 88: if(dat&0x80)
      008BEF 7B 04            [ 1]  132 	ld	a, (0x04, sp)
      008BF1 2A 0D            [ 1]  133 	jrpl	00105$
                                    134 ;	driver/oled.c: 90: OLED_SDIN_Set();
      008BF3 4B 04            [ 1]  135 	push	#0x04
      008BF5 4B 0A            [ 1]  136 	push	#0x0a
      008BF7 4B 50            [ 1]  137 	push	#0x50
      008BF9 CD 90 C6         [ 4]  138 	call	_GPIO_WriteHigh
      008BFC 5B 03            [ 2]  139 	addw	sp, #3
      008BFE 20 0B            [ 2]  140 	jra	00106$
      008C00                        141 00105$:
                                    142 ;	driver/oled.c: 93: OLED_SDIN_Clr();
      008C00 4B 04            [ 1]  143 	push	#0x04
      008C02 4B 0A            [ 1]  144 	push	#0x0a
      008C04 4B 50            [ 1]  145 	push	#0x50
      008C06 CD 90 CD         [ 4]  146 	call	_GPIO_WriteLow
      008C09 5B 03            [ 2]  147 	addw	sp, #3
      008C0B                        148 00106$:
                                    149 ;	driver/oled.c: 94: OLED_SCLK_Set();
      008C0B 4B 02            [ 1]  150 	push	#0x02
      008C0D 4B 0A            [ 1]  151 	push	#0x0a
      008C0F 4B 50            [ 1]  152 	push	#0x50
      008C11 CD 90 C6         [ 4]  153 	call	_GPIO_WriteHigh
      008C14 5B 03            [ 2]  154 	addw	sp, #3
                                    155 ;	driver/oled.c: 95: dat<<=1;
      008C16 08 04            [ 1]  156 	sll	(0x04, sp)
                                    157 ;	driver/oled.c: 85: for(i=0;i<8;i++)
      008C18 0C 01            [ 1]  158 	inc	(0x01, sp)
      008C1A 7B 01            [ 1]  159 	ld	a, (0x01, sp)
      008C1C A1 08            [ 1]  160 	cp	a, #0x08
      008C1E 25 C4            [ 1]  161 	jrc	00108$
                                    162 ;	driver/oled.c: 97: OLED_CS_Set();
      008C20 4B 20            [ 1]  163 	push	#0x20
      008C22 4B 0A            [ 1]  164 	push	#0x0a
      008C24 4B 50            [ 1]  165 	push	#0x50
      008C26 CD 90 C6         [ 4]  166 	call	_GPIO_WriteHigh
      008C29 5B 03            [ 2]  167 	addw	sp, #3
                                    168 ;	driver/oled.c: 98: OLED_DC_Set();
      008C2B 4B 10            [ 1]  169 	push	#0x10
      008C2D 4B 0A            [ 1]  170 	push	#0x0a
      008C2F 4B 50            [ 1]  171 	push	#0x50
      008C31 CD 90 C6         [ 4]  172 	call	_GPIO_WriteHigh
                                    173 ;	driver/oled.c: 99: }
      008C34 5B 04            [ 2]  174 	addw	sp, #4
      008C36 81               [ 4]  175 	ret
                                    176 ;	driver/oled.c: 101: void OLED_Set_Pos(unsigned char x, unsigned char y)
                                    177 ;	-----------------------------------------
                                    178 ;	 function OLED_Set_Pos
                                    179 ;	-----------------------------------------
      008C37                        180 _OLED_Set_Pos:
      008C37 52 02            [ 2]  181 	sub	sp, #2
                                    182 ;	driver/oled.c: 103: OLED_WR_Byte(0xb0+y,OLED_CMD);
      008C39 7B 06            [ 1]  183 	ld	a, (0x06, sp)
      008C3B AB B0            [ 1]  184 	add	a, #0xb0
      008C3D 4B 00            [ 1]  185 	push	#0x00
      008C3F 88               [ 1]  186 	push	a
      008C40 CD 8B BA         [ 4]  187 	call	_OLED_WR_Byte
      008C43 5B 02            [ 2]  188 	addw	sp, #2
                                    189 ;	driver/oled.c: 104: OLED_WR_Byte(((x&0xf0)>>4)|0x10,OLED_CMD);
      008C45 7B 05            [ 1]  190 	ld	a, (0x05, sp)
      008C47 0F 01            [ 1]  191 	clr	(0x01, sp)
      008C49 88               [ 1]  192 	push	a
      008C4A A4 F0            [ 1]  193 	and	a, #0xf0
      008C4C 97               [ 1]  194 	ld	xl, a
      008C4D 4F               [ 1]  195 	clr	a
      008C4E 95               [ 1]  196 	ld	xh, a
      008C4F 84               [ 1]  197 	pop	a
      008C50 57               [ 2]  198 	sraw	x
      008C51 57               [ 2]  199 	sraw	x
      008C52 57               [ 2]  200 	sraw	x
      008C53 57               [ 2]  201 	sraw	x
      008C54 88               [ 1]  202 	push	a
      008C55 9F               [ 1]  203 	ld	a, xl
      008C56 AA 10            [ 1]  204 	or	a, #0x10
      008C58 97               [ 1]  205 	ld	xl, a
      008C59 4B 00            [ 1]  206 	push	#0x00
      008C5B 89               [ 2]  207 	pushw	x
      008C5C 5B 01            [ 2]  208 	addw	sp, #1
      008C5E CD 8B BA         [ 4]  209 	call	_OLED_WR_Byte
      008C61 5B 02            [ 2]  210 	addw	sp, #2
      008C63 84               [ 1]  211 	pop	a
                                    212 ;	driver/oled.c: 105: OLED_WR_Byte((x&0x0f)|0x01,OLED_CMD);
      008C64 A4 0F            [ 1]  213 	and	a, #0x0f
      008C66 95               [ 1]  214 	ld	xh, a
      008C67 4F               [ 1]  215 	clr	a
      008C68 02               [ 1]  216 	rlwa	x
      008C69 AA 01            [ 1]  217 	or	a, #0x01
      008C6B 4B 00            [ 1]  218 	push	#0x00
      008C6D 88               [ 1]  219 	push	a
      008C6E CD 8B BA         [ 4]  220 	call	_OLED_WR_Byte
                                    221 ;	driver/oled.c: 106: }
      008C71 5B 04            [ 2]  222 	addw	sp, #4
      008C73 81               [ 4]  223 	ret
                                    224 ;	driver/oled.c: 108: void OLED_Display_On(void)
                                    225 ;	-----------------------------------------
                                    226 ;	 function OLED_Display_On
                                    227 ;	-----------------------------------------
      008C74                        228 _OLED_Display_On:
                                    229 ;	driver/oled.c: 110: OLED_WR_Byte(0X8D,OLED_CMD);  //SET DCDC命令
      008C74 4B 00            [ 1]  230 	push	#0x00
      008C76 4B 8D            [ 1]  231 	push	#0x8d
      008C78 CD 8B BA         [ 4]  232 	call	_OLED_WR_Byte
      008C7B 5B 02            [ 2]  233 	addw	sp, #2
                                    234 ;	driver/oled.c: 111: OLED_WR_Byte(0X14,OLED_CMD);  //DCDC ON
      008C7D 4B 00            [ 1]  235 	push	#0x00
      008C7F 4B 14            [ 1]  236 	push	#0x14
      008C81 CD 8B BA         [ 4]  237 	call	_OLED_WR_Byte
      008C84 5B 02            [ 2]  238 	addw	sp, #2
                                    239 ;	driver/oled.c: 112: OLED_WR_Byte(0XAF,OLED_CMD);  //DISPLAY ON
      008C86 4B 00            [ 1]  240 	push	#0x00
      008C88 4B AF            [ 1]  241 	push	#0xaf
      008C8A CD 8B BA         [ 4]  242 	call	_OLED_WR_Byte
      008C8D 5B 02            [ 2]  243 	addw	sp, #2
                                    244 ;	driver/oled.c: 113: }
      008C8F 81               [ 4]  245 	ret
                                    246 ;	driver/oled.c: 115: void OLED_Display_Off(void)
                                    247 ;	-----------------------------------------
                                    248 ;	 function OLED_Display_Off
                                    249 ;	-----------------------------------------
      008C90                        250 _OLED_Display_Off:
                                    251 ;	driver/oled.c: 117: OLED_WR_Byte(0X8D,OLED_CMD);  //SET DCDC命令
      008C90 4B 00            [ 1]  252 	push	#0x00
      008C92 4B 8D            [ 1]  253 	push	#0x8d
      008C94 CD 8B BA         [ 4]  254 	call	_OLED_WR_Byte
      008C97 5B 02            [ 2]  255 	addw	sp, #2
                                    256 ;	driver/oled.c: 118: OLED_WR_Byte(0X10,OLED_CMD);  //DCDC OFF
      008C99 4B 00            [ 1]  257 	push	#0x00
      008C9B 4B 10            [ 1]  258 	push	#0x10
      008C9D CD 8B BA         [ 4]  259 	call	_OLED_WR_Byte
      008CA0 5B 02            [ 2]  260 	addw	sp, #2
                                    261 ;	driver/oled.c: 119: OLED_WR_Byte(0XAE,OLED_CMD);  //DISPLAY OFF
      008CA2 4B 00            [ 1]  262 	push	#0x00
      008CA4 4B AE            [ 1]  263 	push	#0xae
      008CA6 CD 8B BA         [ 4]  264 	call	_OLED_WR_Byte
      008CA9 5B 02            [ 2]  265 	addw	sp, #2
                                    266 ;	driver/oled.c: 120: }
      008CAB 81               [ 4]  267 	ret
                                    268 ;	driver/oled.c: 122: void OLED_Clear(void)
                                    269 ;	-----------------------------------------
                                    270 ;	 function OLED_Clear
                                    271 ;	-----------------------------------------
      008CAC                        272 _OLED_Clear:
      008CAC 88               [ 1]  273 	push	a
                                    274 ;	driver/oled.c: 125: for(i=0;i<8;i++)
      008CAD 0F 01            [ 1]  275 	clr	(0x01, sp)
      008CAF                        276 00105$:
                                    277 ;	driver/oled.c: 127: OLED_WR_Byte (0xb0+i,OLED_CMD);    //设置页地址（0~7）
      008CAF 7B 01            [ 1]  278 	ld	a, (0x01, sp)
      008CB1 AB B0            [ 1]  279 	add	a, #0xb0
      008CB3 4B 00            [ 1]  280 	push	#0x00
      008CB5 88               [ 1]  281 	push	a
      008CB6 CD 8B BA         [ 4]  282 	call	_OLED_WR_Byte
      008CB9 5B 02            [ 2]  283 	addw	sp, #2
                                    284 ;	driver/oled.c: 128: OLED_WR_Byte (0x00,OLED_CMD);      //设置显示位置—列低地址
      008CBB 4B 00            [ 1]  285 	push	#0x00
      008CBD 4B 00            [ 1]  286 	push	#0x00
      008CBF CD 8B BA         [ 4]  287 	call	_OLED_WR_Byte
      008CC2 5B 02            [ 2]  288 	addw	sp, #2
                                    289 ;	driver/oled.c: 129: OLED_WR_Byte (0x10,OLED_CMD);      //设置显示位置—列高地址
      008CC4 4B 00            [ 1]  290 	push	#0x00
      008CC6 4B 10            [ 1]  291 	push	#0x10
      008CC8 CD 8B BA         [ 4]  292 	call	_OLED_WR_Byte
      008CCB 5B 02            [ 2]  293 	addw	sp, #2
                                    294 ;	driver/oled.c: 130: for(n=0;n<128;n++)OLED_WR_Byte(0,OLED_DATA);
      008CCD 4F               [ 1]  295 	clr	a
      008CCE                        296 00103$:
      008CCE 88               [ 1]  297 	push	a
      008CCF 4B 01            [ 1]  298 	push	#0x01
      008CD1 4B 00            [ 1]  299 	push	#0x00
      008CD3 CD 8B BA         [ 4]  300 	call	_OLED_WR_Byte
      008CD6 5B 02            [ 2]  301 	addw	sp, #2
      008CD8 84               [ 1]  302 	pop	a
      008CD9 4C               [ 1]  303 	inc	a
      008CDA A1 80            [ 1]  304 	cp	a, #0x80
      008CDC 25 F0            [ 1]  305 	jrc	00103$
                                    306 ;	driver/oled.c: 125: for(i=0;i<8;i++)
      008CDE 0C 01            [ 1]  307 	inc	(0x01, sp)
      008CE0 7B 01            [ 1]  308 	ld	a, (0x01, sp)
      008CE2 A1 08            [ 1]  309 	cp	a, #0x08
      008CE4 25 C9            [ 1]  310 	jrc	00105$
                                    311 ;	driver/oled.c: 132: }
      008CE6 84               [ 1]  312 	pop	a
      008CE7 81               [ 4]  313 	ret
                                    314 ;	driver/oled.c: 140: void OLED_ShowChar(u8 x,u8 y,u8 chr)
                                    315 ;	-----------------------------------------
                                    316 ;	 function OLED_ShowChar
                                    317 ;	-----------------------------------------
      008CE8                        318 _OLED_ShowChar:
      008CE8 52 04            [ 2]  319 	sub	sp, #4
                                    320 ;	driver/oled.c: 143: c=chr-' ';//得到偏移后的值
      008CEA 7B 09            [ 1]  321 	ld	a, (0x09, sp)
      008CEC A0 20            [ 1]  322 	sub	a, #0x20
      008CEE 6B 04            [ 1]  323 	ld	(0x04, sp), a
                                    324 ;	driver/oled.c: 144: if(x>Max_Column-1){x=0;y=y+2;}
      008CF0 7B 07            [ 1]  325 	ld	a, (0x07, sp)
      008CF2 A1 7F            [ 1]  326 	cp	a, #0x7f
      008CF4 23 08            [ 2]  327 	jrule	00102$
      008CF6 0F 07            [ 1]  328 	clr	(0x07, sp)
      008CF8 7B 08            [ 1]  329 	ld	a, (0x08, sp)
      008CFA AB 02            [ 1]  330 	add	a, #0x02
      008CFC 6B 08            [ 1]  331 	ld	(0x08, sp), a
      008CFE                        332 00102$:
                                    333 ;	driver/oled.c: 147: OLED_Set_Pos(x,y);
      008CFE 7B 08            [ 1]  334 	ld	a, (0x08, sp)
      008D00 88               [ 1]  335 	push	a
      008D01 7B 08            [ 1]  336 	ld	a, (0x08, sp)
      008D03 88               [ 1]  337 	push	a
      008D04 CD 8C 37         [ 4]  338 	call	_OLED_Set_Pos
      008D07 5B 02            [ 2]  339 	addw	sp, #2
                                    340 ;	driver/oled.c: 148: for(i=0;i<8;i++)
      008D09 0F 03            [ 1]  341 	clr	(0x03, sp)
      008D0B                        342 00105$:
                                    343 ;	driver/oled.c: 149: OLED_WR_Byte(F8X16[c*16+i],OLED_DATA);
      008D0B 5F               [ 1]  344 	clrw	x
      008D0C 7B 04            [ 1]  345 	ld	a, (0x04, sp)
      008D0E 97               [ 1]  346 	ld	xl, a
      008D0F 58               [ 2]  347 	sllw	x
      008D10 58               [ 2]  348 	sllw	x
      008D11 58               [ 2]  349 	sllw	x
      008D12 58               [ 2]  350 	sllw	x
      008D13 1F 01            [ 2]  351 	ldw	(0x01, sp), x
      008D15 5F               [ 1]  352 	clrw	x
      008D16 7B 03            [ 1]  353 	ld	a, (0x03, sp)
      008D18 97               [ 1]  354 	ld	xl, a
      008D19 72 FB 01         [ 2]  355 	addw	x, (0x01, sp)
      008D1C 1C 80 5E         [ 2]  356 	addw	x, #_F8X16
      008D1F F6               [ 1]  357 	ld	a, (x)
      008D20 4B 01            [ 1]  358 	push	#0x01
      008D22 88               [ 1]  359 	push	a
      008D23 CD 8B BA         [ 4]  360 	call	_OLED_WR_Byte
      008D26 5B 02            [ 2]  361 	addw	sp, #2
                                    362 ;	driver/oled.c: 148: for(i=0;i<8;i++)
      008D28 0C 03            [ 1]  363 	inc	(0x03, sp)
      008D2A 7B 03            [ 1]  364 	ld	a, (0x03, sp)
      008D2C A1 08            [ 1]  365 	cp	a, #0x08
      008D2E 25 DB            [ 1]  366 	jrc	00105$
                                    367 ;	driver/oled.c: 150: OLED_Set_Pos(x,y+1);
      008D30 7B 08            [ 1]  368 	ld	a, (0x08, sp)
      008D32 4C               [ 1]  369 	inc	a
      008D33 88               [ 1]  370 	push	a
      008D34 7B 08            [ 1]  371 	ld	a, (0x08, sp)
      008D36 88               [ 1]  372 	push	a
      008D37 CD 8C 37         [ 4]  373 	call	_OLED_Set_Pos
      008D3A 5B 02            [ 2]  374 	addw	sp, #2
                                    375 ;	driver/oled.c: 151: for(i=0;i<8;i++)
      008D3C 0F 03            [ 1]  376 	clr	(0x03, sp)
      008D3E                        377 00107$:
                                    378 ;	driver/oled.c: 152: OLED_WR_Byte(F8X16[c*16+i+8],OLED_DATA);
      008D3E 5F               [ 1]  379 	clrw	x
      008D3F 7B 03            [ 1]  380 	ld	a, (0x03, sp)
      008D41 97               [ 1]  381 	ld	xl, a
      008D42 72 FB 01         [ 2]  382 	addw	x, (0x01, sp)
      008D45 1C 00 08         [ 2]  383 	addw	x, #0x0008
      008D48 1C 80 5E         [ 2]  384 	addw	x, #_F8X16
      008D4B F6               [ 1]  385 	ld	a, (x)
      008D4C 4B 01            [ 1]  386 	push	#0x01
      008D4E 88               [ 1]  387 	push	a
      008D4F CD 8B BA         [ 4]  388 	call	_OLED_WR_Byte
      008D52 5B 02            [ 2]  389 	addw	sp, #2
                                    390 ;	driver/oled.c: 151: for(i=0;i<8;i++)
      008D54 0C 03            [ 1]  391 	inc	(0x03, sp)
      008D56 7B 03            [ 1]  392 	ld	a, (0x03, sp)
      008D58 A1 08            [ 1]  393 	cp	a, #0x08
      008D5A 25 E2            [ 1]  394 	jrc	00107$
                                    395 ;	driver/oled.c: 163: }
      008D5C 5B 04            [ 2]  396 	addw	sp, #4
      008D5E 81               [ 4]  397 	ret
                                    398 ;	driver/oled.c: 165: u32 oled_pow(u8 m,u8 n)
                                    399 ;	-----------------------------------------
                                    400 ;	 function oled_pow
                                    401 ;	-----------------------------------------
      008D5F                        402 _oled_pow:
      008D5F 52 09            [ 2]  403 	sub	sp, #9
                                    404 ;	driver/oled.c: 167: u32 result=1;
      008D61 5F               [ 1]  405 	clrw	x
      008D62 5C               [ 1]  406 	incw	x
      008D63 0F 07            [ 1]  407 	clr	(0x07, sp)
      008D65 0F 06            [ 1]  408 	clr	(0x06, sp)
                                    409 ;	driver/oled.c: 168: while(n--)result*=m;
      008D67 7B 0D            [ 1]  410 	ld	a, (0x0d, sp)
      008D69 6B 01            [ 1]  411 	ld	(0x01, sp), a
      008D6B                        412 00101$:
      008D6B 7B 01            [ 1]  413 	ld	a, (0x01, sp)
      008D6D 0A 01            [ 1]  414 	dec	(0x01, sp)
      008D6F 4D               [ 1]  415 	tnz	a
      008D70 27 1D            [ 1]  416 	jreq	00103$
      008D72 7B 0C            [ 1]  417 	ld	a, (0x0c, sp)
      008D74 6B 05            [ 1]  418 	ld	(0x05, sp), a
      008D76 90 5F            [ 1]  419 	clrw	y
      008D78 0F 02            [ 1]  420 	clr	(0x02, sp)
      008D7A 7B 05            [ 1]  421 	ld	a, (0x05, sp)
      008D7C 88               [ 1]  422 	push	a
      008D7D 90 89            [ 2]  423 	pushw	y
      008D7F 7B 05            [ 1]  424 	ld	a, (0x05, sp)
      008D81 88               [ 1]  425 	push	a
      008D82 89               [ 2]  426 	pushw	x
      008D83 1E 0C            [ 2]  427 	ldw	x, (0x0c, sp)
      008D85 89               [ 2]  428 	pushw	x
      008D86 CD 9E DA         [ 4]  429 	call	__mullong
      008D89 5B 08            [ 2]  430 	addw	sp, #8
      008D8B 17 06            [ 2]  431 	ldw	(0x06, sp), y
      008D8D 20 DC            [ 2]  432 	jra	00101$
      008D8F                        433 00103$:
                                    434 ;	driver/oled.c: 169: return result;
      008D8F 16 06            [ 2]  435 	ldw	y, (0x06, sp)
                                    436 ;	driver/oled.c: 170: }
      008D91 5B 09            [ 2]  437 	addw	sp, #9
      008D93 81               [ 4]  438 	ret
                                    439 ;	driver/oled.c: 177: void OLED_ShowNum(u8 x,u8 y,u32 num,u8 len,u8 size2)
                                    440 ;	-----------------------------------------
                                    441 ;	 function OLED_ShowNum
                                    442 ;	-----------------------------------------
      008D94                        443 _OLED_ShowNum:
      008D94 52 07            [ 2]  444 	sub	sp, #7
                                    445 ;	driver/oled.c: 180: u8 enshow=0;
      008D96 0F 05            [ 1]  446 	clr	(0x05, sp)
                                    447 ;	driver/oled.c: 181: for(t=0;t<len;t++)
      008D98 0F 07            [ 1]  448 	clr	(0x07, sp)
      008D9A                        449 00110$:
      008D9A 7B 07            [ 1]  450 	ld	a, (0x07, sp)
      008D9C 11 10            [ 1]  451 	cp	a, (0x10, sp)
      008D9E 25 03            [ 1]  452 	jrc	00139$
      008DA0 CC 8E 2E         [ 2]  453 	jp	00111$
      008DA3                        454 00139$:
                                    455 ;	driver/oled.c: 183: temp=(num/oled_pow(10,len-t-1))%10;
      008DA3 7B 10            [ 1]  456 	ld	a, (0x10, sp)
      008DA5 10 07            [ 1]  457 	sub	a, (0x07, sp)
      008DA7 4A               [ 1]  458 	dec	a
      008DA8 88               [ 1]  459 	push	a
      008DA9 4B 0A            [ 1]  460 	push	#0x0a
      008DAB CD 8D 5F         [ 4]  461 	call	_oled_pow
      008DAE 5B 02            [ 2]  462 	addw	sp, #2
      008DB0 89               [ 2]  463 	pushw	x
      008DB1 90 89            [ 2]  464 	pushw	y
      008DB3 1E 12            [ 2]  465 	ldw	x, (0x12, sp)
      008DB5 89               [ 2]  466 	pushw	x
      008DB6 1E 12            [ 2]  467 	ldw	x, (0x12, sp)
      008DB8 89               [ 2]  468 	pushw	x
      008DB9 CD 9E 29         [ 4]  469 	call	__divulong
      008DBC 5B 08            [ 2]  470 	addw	sp, #8
      008DBE 4B 0A            [ 1]  471 	push	#0x0a
      008DC0 4B 00            [ 1]  472 	push	#0x00
      008DC2 4B 00            [ 1]  473 	push	#0x00
      008DC4 4B 00            [ 1]  474 	push	#0x00
      008DC6 89               [ 2]  475 	pushw	x
      008DC7 90 89            [ 2]  476 	pushw	y
      008DC9 CD 9D 6B         [ 4]  477 	call	__modulong
      008DCC 5B 08            [ 2]  478 	addw	sp, #8
      008DCE 9F               [ 1]  479 	ld	a, xl
      008DCF 6B 06            [ 1]  480 	ld	(0x06, sp), a
                                    481 ;	driver/oled.c: 188: OLED_ShowChar(x+(size2/2)*t,y,' ');
      008DD1 5F               [ 1]  482 	clrw	x
      008DD2 7B 11            [ 1]  483 	ld	a, (0x11, sp)
      008DD4 97               [ 1]  484 	ld	xl, a
      008DD5 7B 07            [ 1]  485 	ld	a, (0x07, sp)
      008DD7 6B 01            [ 1]  486 	ld	(0x01, sp), a
      008DD9 7B 0A            [ 1]  487 	ld	a, (0x0a, sp)
      008DDB 6B 02            [ 1]  488 	ld	(0x02, sp), a
      008DDD 4B 02            [ 1]  489 	push	#0x02
      008DDF 4B 00            [ 1]  490 	push	#0x00
      008DE1 89               [ 2]  491 	pushw	x
      008DE2 CD 9F 6C         [ 4]  492 	call	__divsint
      008DE5 5B 04            [ 2]  493 	addw	sp, #4
      008DE7 7B 01            [ 1]  494 	ld	a, (0x01, sp)
      008DE9 42               [ 4]  495 	mul	x, a
      008DEA 9F               [ 1]  496 	ld	a, xl
      008DEB 1B 02            [ 1]  497 	add	a, (0x02, sp)
      008DED 90 97            [ 1]  498 	ld	yl, a
                                    499 ;	driver/oled.c: 184: if(enshow==0&&t<(len-1))
      008DEF 0D 05            [ 1]  500 	tnz	(0x05, sp)
      008DF1 26 26            [ 1]  501 	jrne	00105$
      008DF3 5F               [ 1]  502 	clrw	x
      008DF4 7B 10            [ 1]  503 	ld	a, (0x10, sp)
      008DF6 97               [ 1]  504 	ld	xl, a
      008DF7 5A               [ 2]  505 	decw	x
      008DF8 1F 03            [ 2]  506 	ldw	(0x03, sp), x
      008DFA 5F               [ 1]  507 	clrw	x
      008DFB 7B 07            [ 1]  508 	ld	a, (0x07, sp)
      008DFD 97               [ 1]  509 	ld	xl, a
      008DFE 13 03            [ 2]  510 	cpw	x, (0x03, sp)
      008E00 2E 17            [ 1]  511 	jrsge	00105$
                                    512 ;	driver/oled.c: 186: if(temp==0)
      008E02 0D 06            [ 1]  513 	tnz	(0x06, sp)
      008E04 26 0F            [ 1]  514 	jrne	00102$
                                    515 ;	driver/oled.c: 188: OLED_ShowChar(x+(size2/2)*t,y,' ');
      008E06 4B 20            [ 1]  516 	push	#0x20
      008E08 7B 0C            [ 1]  517 	ld	a, (0x0c, sp)
      008E0A 88               [ 1]  518 	push	a
      008E0B 90 9F            [ 1]  519 	ld	a, yl
      008E0D 88               [ 1]  520 	push	a
      008E0E CD 8C E8         [ 4]  521 	call	_OLED_ShowChar
      008E11 5B 03            [ 2]  522 	addw	sp, #3
                                    523 ;	driver/oled.c: 189: continue;
      008E13 20 14            [ 2]  524 	jra	00107$
      008E15                        525 00102$:
                                    526 ;	driver/oled.c: 190: }else enshow=1;
      008E15 A6 01            [ 1]  527 	ld	a, #0x01
      008E17 6B 05            [ 1]  528 	ld	(0x05, sp), a
      008E19                        529 00105$:
                                    530 ;	driver/oled.c: 193: OLED_ShowChar(x+(size2/2)*t,y,temp+'0');
      008E19 7B 06            [ 1]  531 	ld	a, (0x06, sp)
      008E1B AB 30            [ 1]  532 	add	a, #0x30
      008E1D 88               [ 1]  533 	push	a
      008E1E 7B 0C            [ 1]  534 	ld	a, (0x0c, sp)
      008E20 88               [ 1]  535 	push	a
      008E21 90 9F            [ 1]  536 	ld	a, yl
      008E23 88               [ 1]  537 	push	a
      008E24 CD 8C E8         [ 4]  538 	call	_OLED_ShowChar
      008E27 5B 03            [ 2]  539 	addw	sp, #3
      008E29                        540 00107$:
                                    541 ;	driver/oled.c: 181: for(t=0;t<len;t++)
      008E29 0C 07            [ 1]  542 	inc	(0x07, sp)
      008E2B CC 8D 9A         [ 2]  543 	jp	00110$
      008E2E                        544 00111$:
                                    545 ;	driver/oled.c: 195: }
      008E2E 5B 07            [ 2]  546 	addw	sp, #7
      008E30 81               [ 4]  547 	ret
                                    548 ;	driver/oled.c: 197: void OLED_ShowString(u8 x,u8 y,u8 *chr)
                                    549 ;	-----------------------------------------
                                    550 ;	 function OLED_ShowString
                                    551 ;	-----------------------------------------
      008E31                        552 _OLED_ShowString:
      008E31 88               [ 1]  553 	push	a
                                    554 ;	driver/oled.c: 200: while (chr[j]!='\0')
      008E32 0F 01            [ 1]  555 	clr	(0x01, sp)
      008E34                        556 00103$:
      008E34 5F               [ 1]  557 	clrw	x
      008E35 7B 01            [ 1]  558 	ld	a, (0x01, sp)
      008E37 97               [ 1]  559 	ld	xl, a
      008E38 72 FB 06         [ 2]  560 	addw	x, (0x06, sp)
      008E3B F6               [ 1]  561 	ld	a, (x)
      008E3C 27 24            [ 1]  562 	jreq	00106$
                                    563 ;	driver/oled.c: 201: {		OLED_ShowChar(x,y,chr[j]);
      008E3E 88               [ 1]  564 	push	a
      008E3F 7B 06            [ 1]  565 	ld	a, (0x06, sp)
      008E41 88               [ 1]  566 	push	a
      008E42 7B 06            [ 1]  567 	ld	a, (0x06, sp)
      008E44 88               [ 1]  568 	push	a
      008E45 CD 8C E8         [ 4]  569 	call	_OLED_ShowChar
      008E48 5B 03            [ 2]  570 	addw	sp, #3
                                    571 ;	driver/oled.c: 202: x+=8;
      008E4A 7B 04            [ 1]  572 	ld	a, (0x04, sp)
      008E4C AB 08            [ 1]  573 	add	a, #0x08
      008E4E 6B 04            [ 1]  574 	ld	(0x04, sp), a
                                    575 ;	driver/oled.c: 203: if(x>120){x=0;y+=2;}
      008E50 7B 04            [ 1]  576 	ld	a, (0x04, sp)
      008E52 A1 78            [ 1]  577 	cp	a, #0x78
      008E54 23 08            [ 2]  578 	jrule	00102$
      008E56 0F 04            [ 1]  579 	clr	(0x04, sp)
      008E58 7B 05            [ 1]  580 	ld	a, (0x05, sp)
      008E5A AB 02            [ 1]  581 	add	a, #0x02
      008E5C 6B 05            [ 1]  582 	ld	(0x05, sp), a
      008E5E                        583 00102$:
                                    584 ;	driver/oled.c: 204: j++;
      008E5E 0C 01            [ 1]  585 	inc	(0x01, sp)
      008E60 20 D2            [ 2]  586 	jra	00103$
      008E62                        587 00106$:
                                    588 ;	driver/oled.c: 206: }
      008E62 84               [ 1]  589 	pop	a
      008E63 81               [ 4]  590 	ret
                                    591 ;	driver/oled.c: 248: void OLED_Init(void)
                                    592 ;	-----------------------------------------
                                    593 ;	 function OLED_Init
                                    594 ;	-----------------------------------------
      008E64                        595 _OLED_Init:
                                    596 ;	driver/oled.c: 250: GPIO_Init(OLED_SCLK_PORT, (GPIO_Pin_TypeDef)OLED_SCLK_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      008E64 4B E0            [ 1]  597 	push	#0xe0
      008E66 4B 02            [ 1]  598 	push	#0x02
      008E68 4B 0A            [ 1]  599 	push	#0x0a
      008E6A 4B 50            [ 1]  600 	push	#0x50
      008E6C CD 90 4B         [ 4]  601 	call	_GPIO_Init
      008E6F 5B 04            [ 2]  602 	addw	sp, #4
                                    603 ;	driver/oled.c: 251: GPIO_Init(OLED_SDIN_PORT, (GPIO_Pin_TypeDef)OLED_SDIN_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      008E71 4B E0            [ 1]  604 	push	#0xe0
      008E73 4B 04            [ 1]  605 	push	#0x04
      008E75 4B 0A            [ 1]  606 	push	#0x0a
      008E77 4B 50            [ 1]  607 	push	#0x50
      008E79 CD 90 4B         [ 4]  608 	call	_GPIO_Init
      008E7C 5B 04            [ 2]  609 	addw	sp, #4
                                    610 ;	driver/oled.c: 252: GPIO_Init(OLED_RST_PORT, (GPIO_Pin_TypeDef)OLED_RST_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      008E7E 4B E0            [ 1]  611 	push	#0xe0
      008E80 4B 08            [ 1]  612 	push	#0x08
      008E82 4B 0A            [ 1]  613 	push	#0x0a
      008E84 4B 50            [ 1]  614 	push	#0x50
      008E86 CD 90 4B         [ 4]  615 	call	_GPIO_Init
      008E89 5B 04            [ 2]  616 	addw	sp, #4
                                    617 ;	driver/oled.c: 253: GPIO_Init(OLED_DC_PORT, (GPIO_Pin_TypeDef)OLED_DC_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      008E8B 4B E0            [ 1]  618 	push	#0xe0
      008E8D 4B 10            [ 1]  619 	push	#0x10
      008E8F 4B 0A            [ 1]  620 	push	#0x0a
      008E91 4B 50            [ 1]  621 	push	#0x50
      008E93 CD 90 4B         [ 4]  622 	call	_GPIO_Init
      008E96 5B 04            [ 2]  623 	addw	sp, #4
                                    624 ;	driver/oled.c: 254: GPIO_Init(OLED_CS_PORT, (GPIO_Pin_TypeDef)OLED_CS_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      008E98 4B E0            [ 1]  625 	push	#0xe0
      008E9A 4B 20            [ 1]  626 	push	#0x20
      008E9C 4B 0A            [ 1]  627 	push	#0x0a
      008E9E 4B 50            [ 1]  628 	push	#0x50
      008EA0 CD 90 4B         [ 4]  629 	call	_GPIO_Init
      008EA3 5B 04            [ 2]  630 	addw	sp, #4
                                    631 ;	driver/oled.c: 257: OLED_RST_Set();
      008EA5 4B 08            [ 1]  632 	push	#0x08
      008EA7 4B 0A            [ 1]  633 	push	#0x0a
      008EA9 4B 50            [ 1]  634 	push	#0x50
      008EAB CD 90 C6         [ 4]  635 	call	_GPIO_WriteHigh
      008EAE 5B 03            [ 2]  636 	addw	sp, #3
                                    637 ;	driver/oled.c: 258: delay_ms(100);
      008EB0 4B 64            [ 1]  638 	push	#0x64
      008EB2 4B 00            [ 1]  639 	push	#0x00
      008EB4 CD 8B 9C         [ 4]  640 	call	_delay_ms
      008EB7 5B 02            [ 2]  641 	addw	sp, #2
                                    642 ;	driver/oled.c: 259: OLED_RST_Clr();
      008EB9 4B 08            [ 1]  643 	push	#0x08
      008EBB 4B 0A            [ 1]  644 	push	#0x0a
      008EBD 4B 50            [ 1]  645 	push	#0x50
      008EBF CD 90 CD         [ 4]  646 	call	_GPIO_WriteLow
      008EC2 5B 03            [ 2]  647 	addw	sp, #3
                                    648 ;	driver/oled.c: 260: delay_ms(100);
      008EC4 4B 64            [ 1]  649 	push	#0x64
      008EC6 4B 00            [ 1]  650 	push	#0x00
      008EC8 CD 8B 9C         [ 4]  651 	call	_delay_ms
      008ECB 5B 02            [ 2]  652 	addw	sp, #2
                                    653 ;	driver/oled.c: 261: OLED_RST_Set();
      008ECD 4B 08            [ 1]  654 	push	#0x08
      008ECF 4B 0A            [ 1]  655 	push	#0x0a
      008ED1 4B 50            [ 1]  656 	push	#0x50
      008ED3 CD 90 C6         [ 4]  657 	call	_GPIO_WriteHigh
      008ED6 5B 03            [ 2]  658 	addw	sp, #3
                                    659 ;	driver/oled.c: 293: OLED_WR_Byte(0xAE,OLED_CMD);//--turn off oled panel
      008ED8 4B 00            [ 1]  660 	push	#0x00
      008EDA 4B AE            [ 1]  661 	push	#0xae
      008EDC CD 8B BA         [ 4]  662 	call	_OLED_WR_Byte
      008EDF 5B 02            [ 2]  663 	addw	sp, #2
                                    664 ;	driver/oled.c: 294: OLED_WR_Byte(0x00,OLED_CMD);//---set low column address
      008EE1 4B 00            [ 1]  665 	push	#0x00
      008EE3 4B 00            [ 1]  666 	push	#0x00
      008EE5 CD 8B BA         [ 4]  667 	call	_OLED_WR_Byte
      008EE8 5B 02            [ 2]  668 	addw	sp, #2
                                    669 ;	driver/oled.c: 295: OLED_WR_Byte(0x10,OLED_CMD);//---set high column address
      008EEA 4B 00            [ 1]  670 	push	#0x00
      008EEC 4B 10            [ 1]  671 	push	#0x10
      008EEE CD 8B BA         [ 4]  672 	call	_OLED_WR_Byte
      008EF1 5B 02            [ 2]  673 	addw	sp, #2
                                    674 ;	driver/oled.c: 296: OLED_WR_Byte(0x40,OLED_CMD);//--set start line address  Set Mapping RAM Display Start Line (0x00~0x3F)
      008EF3 4B 00            [ 1]  675 	push	#0x00
      008EF5 4B 40            [ 1]  676 	push	#0x40
      008EF7 CD 8B BA         [ 4]  677 	call	_OLED_WR_Byte
      008EFA 5B 02            [ 2]  678 	addw	sp, #2
                                    679 ;	driver/oled.c: 297: OLED_WR_Byte(0x81,OLED_CMD);//--set contrast control register
      008EFC 4B 00            [ 1]  680 	push	#0x00
      008EFE 4B 81            [ 1]  681 	push	#0x81
      008F00 CD 8B BA         [ 4]  682 	call	_OLED_WR_Byte
      008F03 5B 02            [ 2]  683 	addw	sp, #2
                                    684 ;	driver/oled.c: 298: OLED_WR_Byte(0xCF,OLED_CMD); // Set SEG Output Current Brightness
      008F05 4B 00            [ 1]  685 	push	#0x00
      008F07 4B CF            [ 1]  686 	push	#0xcf
      008F09 CD 8B BA         [ 4]  687 	call	_OLED_WR_Byte
      008F0C 5B 02            [ 2]  688 	addw	sp, #2
                                    689 ;	driver/oled.c: 299: OLED_WR_Byte(0xA1,OLED_CMD);//--Set SEG/Column Mapping     0xa0左右反置 0xa1正常
      008F0E 4B 00            [ 1]  690 	push	#0x00
      008F10 4B A1            [ 1]  691 	push	#0xa1
      008F12 CD 8B BA         [ 4]  692 	call	_OLED_WR_Byte
      008F15 5B 02            [ 2]  693 	addw	sp, #2
                                    694 ;	driver/oled.c: 300: OLED_WR_Byte(0xC8,OLED_CMD);//Set COM/Row Scan Direction   0xc0上下反置 0xc8正常
      008F17 4B 00            [ 1]  695 	push	#0x00
      008F19 4B C8            [ 1]  696 	push	#0xc8
      008F1B CD 8B BA         [ 4]  697 	call	_OLED_WR_Byte
      008F1E 5B 02            [ 2]  698 	addw	sp, #2
                                    699 ;	driver/oled.c: 301: OLED_WR_Byte(0xA6,OLED_CMD);//--set normal display
      008F20 4B 00            [ 1]  700 	push	#0x00
      008F22 4B A6            [ 1]  701 	push	#0xa6
      008F24 CD 8B BA         [ 4]  702 	call	_OLED_WR_Byte
      008F27 5B 02            [ 2]  703 	addw	sp, #2
                                    704 ;	driver/oled.c: 302: OLED_WR_Byte(0xA8,OLED_CMD);//--set multiplex ratio(1 to 64)
      008F29 4B 00            [ 1]  705 	push	#0x00
      008F2B 4B A8            [ 1]  706 	push	#0xa8
      008F2D CD 8B BA         [ 4]  707 	call	_OLED_WR_Byte
      008F30 5B 02            [ 2]  708 	addw	sp, #2
                                    709 ;	driver/oled.c: 303: OLED_WR_Byte(0x3f,OLED_CMD);//--1/64 duty
      008F32 4B 00            [ 1]  710 	push	#0x00
      008F34 4B 3F            [ 1]  711 	push	#0x3f
      008F36 CD 8B BA         [ 4]  712 	call	_OLED_WR_Byte
      008F39 5B 02            [ 2]  713 	addw	sp, #2
                                    714 ;	driver/oled.c: 304: OLED_WR_Byte(0xD3,OLED_CMD);//-set display offset	Shift Mapping RAM Counter (0x00~0x3F)
      008F3B 4B 00            [ 1]  715 	push	#0x00
      008F3D 4B D3            [ 1]  716 	push	#0xd3
      008F3F CD 8B BA         [ 4]  717 	call	_OLED_WR_Byte
      008F42 5B 02            [ 2]  718 	addw	sp, #2
                                    719 ;	driver/oled.c: 305: OLED_WR_Byte(0x00,OLED_CMD);//-not offset
      008F44 4B 00            [ 1]  720 	push	#0x00
      008F46 4B 00            [ 1]  721 	push	#0x00
      008F48 CD 8B BA         [ 4]  722 	call	_OLED_WR_Byte
      008F4B 5B 02            [ 2]  723 	addw	sp, #2
                                    724 ;	driver/oled.c: 306: OLED_WR_Byte(0xd5,OLED_CMD);//--set display clock divide ratio/oscillator frequency
      008F4D 4B 00            [ 1]  725 	push	#0x00
      008F4F 4B D5            [ 1]  726 	push	#0xd5
      008F51 CD 8B BA         [ 4]  727 	call	_OLED_WR_Byte
      008F54 5B 02            [ 2]  728 	addw	sp, #2
                                    729 ;	driver/oled.c: 307: OLED_WR_Byte(0x80,OLED_CMD);//--set divide ratio, Set Clock as 100 Frames/Sec
      008F56 4B 00            [ 1]  730 	push	#0x00
      008F58 4B 80            [ 1]  731 	push	#0x80
      008F5A CD 8B BA         [ 4]  732 	call	_OLED_WR_Byte
      008F5D 5B 02            [ 2]  733 	addw	sp, #2
                                    734 ;	driver/oled.c: 308: OLED_WR_Byte(0xD9,OLED_CMD);//--set pre-charge period
      008F5F 4B 00            [ 1]  735 	push	#0x00
      008F61 4B D9            [ 1]  736 	push	#0xd9
      008F63 CD 8B BA         [ 4]  737 	call	_OLED_WR_Byte
      008F66 5B 02            [ 2]  738 	addw	sp, #2
                                    739 ;	driver/oled.c: 309: OLED_WR_Byte(0xF1,OLED_CMD);//Set Pre-Charge as 15 Clocks & Discharge as 1 Clock
      008F68 4B 00            [ 1]  740 	push	#0x00
      008F6A 4B F1            [ 1]  741 	push	#0xf1
      008F6C CD 8B BA         [ 4]  742 	call	_OLED_WR_Byte
      008F6F 5B 02            [ 2]  743 	addw	sp, #2
                                    744 ;	driver/oled.c: 310: OLED_WR_Byte(0xDA,OLED_CMD);//--set com pins hardware configuration
      008F71 4B 00            [ 1]  745 	push	#0x00
      008F73 4B DA            [ 1]  746 	push	#0xda
      008F75 CD 8B BA         [ 4]  747 	call	_OLED_WR_Byte
      008F78 5B 02            [ 2]  748 	addw	sp, #2
                                    749 ;	driver/oled.c: 311: OLED_WR_Byte(0x12,OLED_CMD);
      008F7A 4B 00            [ 1]  750 	push	#0x00
      008F7C 4B 12            [ 1]  751 	push	#0x12
      008F7E CD 8B BA         [ 4]  752 	call	_OLED_WR_Byte
      008F81 5B 02            [ 2]  753 	addw	sp, #2
                                    754 ;	driver/oled.c: 312: OLED_WR_Byte(0xDB,OLED_CMD);//--set vcomh
      008F83 4B 00            [ 1]  755 	push	#0x00
      008F85 4B DB            [ 1]  756 	push	#0xdb
      008F87 CD 8B BA         [ 4]  757 	call	_OLED_WR_Byte
      008F8A 5B 02            [ 2]  758 	addw	sp, #2
                                    759 ;	driver/oled.c: 313: OLED_WR_Byte(0x40,OLED_CMD);//Set VCOM Deselect Level
      008F8C 4B 00            [ 1]  760 	push	#0x00
      008F8E 4B 40            [ 1]  761 	push	#0x40
      008F90 CD 8B BA         [ 4]  762 	call	_OLED_WR_Byte
      008F93 5B 02            [ 2]  763 	addw	sp, #2
                                    764 ;	driver/oled.c: 314: OLED_WR_Byte(0x20,OLED_CMD);//-Set Page Addressing Mode (0x00/0x01/0x02)
      008F95 4B 00            [ 1]  765 	push	#0x00
      008F97 4B 20            [ 1]  766 	push	#0x20
      008F99 CD 8B BA         [ 4]  767 	call	_OLED_WR_Byte
      008F9C 5B 02            [ 2]  768 	addw	sp, #2
                                    769 ;	driver/oled.c: 315: OLED_WR_Byte(0x02,OLED_CMD);//
      008F9E 4B 00            [ 1]  770 	push	#0x00
      008FA0 4B 02            [ 1]  771 	push	#0x02
      008FA2 CD 8B BA         [ 4]  772 	call	_OLED_WR_Byte
      008FA5 5B 02            [ 2]  773 	addw	sp, #2
                                    774 ;	driver/oled.c: 316: OLED_WR_Byte(0x8D,OLED_CMD);//--set Charge Pump enable/disable
      008FA7 4B 00            [ 1]  775 	push	#0x00
      008FA9 4B 8D            [ 1]  776 	push	#0x8d
      008FAB CD 8B BA         [ 4]  777 	call	_OLED_WR_Byte
      008FAE 5B 02            [ 2]  778 	addw	sp, #2
                                    779 ;	driver/oled.c: 317: OLED_WR_Byte(0x14,OLED_CMD);//--set(0x10) disable
      008FB0 4B 00            [ 1]  780 	push	#0x00
      008FB2 4B 14            [ 1]  781 	push	#0x14
      008FB4 CD 8B BA         [ 4]  782 	call	_OLED_WR_Byte
      008FB7 5B 02            [ 2]  783 	addw	sp, #2
                                    784 ;	driver/oled.c: 318: OLED_WR_Byte(0xA4,OLED_CMD);// Disable Entire Display On (0xa4/0xa5)
      008FB9 4B 00            [ 1]  785 	push	#0x00
      008FBB 4B A4            [ 1]  786 	push	#0xa4
      008FBD CD 8B BA         [ 4]  787 	call	_OLED_WR_Byte
      008FC0 5B 02            [ 2]  788 	addw	sp, #2
                                    789 ;	driver/oled.c: 319: OLED_WR_Byte(0xA6,OLED_CMD);// Disable Inverse Display On (0xa6/a7)
      008FC2 4B 00            [ 1]  790 	push	#0x00
      008FC4 4B A6            [ 1]  791 	push	#0xa6
      008FC6 CD 8B BA         [ 4]  792 	call	_OLED_WR_Byte
      008FC9 5B 02            [ 2]  793 	addw	sp, #2
                                    794 ;	driver/oled.c: 320: OLED_WR_Byte(0xAF,OLED_CMD);//--turn on oled panel
      008FCB 4B 00            [ 1]  795 	push	#0x00
      008FCD 4B AF            [ 1]  796 	push	#0xaf
      008FCF CD 8B BA         [ 4]  797 	call	_OLED_WR_Byte
      008FD2 5B 02            [ 2]  798 	addw	sp, #2
                                    799 ;	driver/oled.c: 322: OLED_WR_Byte(0xAF,OLED_CMD); /*display ON*/
      008FD4 4B 00            [ 1]  800 	push	#0x00
      008FD6 4B AF            [ 1]  801 	push	#0xaf
      008FD8 CD 8B BA         [ 4]  802 	call	_OLED_WR_Byte
      008FDB 5B 02            [ 2]  803 	addw	sp, #2
                                    804 ;	driver/oled.c: 323: OLED_Clear();
      008FDD CD 8C AC         [ 4]  805 	call	_OLED_Clear
                                    806 ;	driver/oled.c: 324: OLED_Set_Pos(0,0);
      008FE0 4B 00            [ 1]  807 	push	#0x00
      008FE2 4B 00            [ 1]  808 	push	#0x00
      008FE4 CD 8C 37         [ 4]  809 	call	_OLED_Set_Pos
      008FE7 5B 02            [ 2]  810 	addw	sp, #2
                                    811 ;	driver/oled.c: 325: }
      008FE9 81               [ 4]  812 	ret
                                    813 	.area CODE
                                    814 	.area CONST
      00805E                        815 _F8X16:
      00805E 00                     816 	.db #0x00	; 0
      00805F 00                     817 	.db #0x00	; 0
      008060 00                     818 	.db #0x00	; 0
      008061 00                     819 	.db #0x00	; 0
      008062 00                     820 	.db #0x00	; 0
      008063 00                     821 	.db #0x00	; 0
      008064 00                     822 	.db #0x00	; 0
      008065 00                     823 	.db #0x00	; 0
      008066 00                     824 	.db #0x00	; 0
      008067 00                     825 	.db #0x00	; 0
      008068 00                     826 	.db #0x00	; 0
      008069 00                     827 	.db #0x00	; 0
      00806A 00                     828 	.db #0x00	; 0
      00806B 00                     829 	.db #0x00	; 0
      00806C 00                     830 	.db #0x00	; 0
      00806D 00                     831 	.db #0x00	; 0
      00806E 00                     832 	.db #0x00	; 0
      00806F 00                     833 	.db #0x00	; 0
      008070 00                     834 	.db #0x00	; 0
      008071 F8                     835 	.db #0xf8	; 248
      008072 00                     836 	.db #0x00	; 0
      008073 00                     837 	.db #0x00	; 0
      008074 00                     838 	.db #0x00	; 0
      008075 00                     839 	.db #0x00	; 0
      008076 00                     840 	.db #0x00	; 0
      008077 00                     841 	.db #0x00	; 0
      008078 00                     842 	.db #0x00	; 0
      008079 33                     843 	.db #0x33	; 51	'3'
      00807A 30                     844 	.db #0x30	; 48	'0'
      00807B 00                     845 	.db #0x00	; 0
      00807C 00                     846 	.db #0x00	; 0
      00807D 00                     847 	.db #0x00	; 0
      00807E 00                     848 	.db #0x00	; 0
      00807F 10                     849 	.db #0x10	; 16
      008080 0C                     850 	.db #0x0c	; 12
      008081 06                     851 	.db #0x06	; 6
      008082 10                     852 	.db #0x10	; 16
      008083 0C                     853 	.db #0x0c	; 12
      008084 06                     854 	.db #0x06	; 6
      008085 00                     855 	.db #0x00	; 0
      008086 00                     856 	.db #0x00	; 0
      008087 00                     857 	.db #0x00	; 0
      008088 00                     858 	.db #0x00	; 0
      008089 00                     859 	.db #0x00	; 0
      00808A 00                     860 	.db #0x00	; 0
      00808B 00                     861 	.db #0x00	; 0
      00808C 00                     862 	.db #0x00	; 0
      00808D 00                     863 	.db #0x00	; 0
      00808E 40                     864 	.db #0x40	; 64
      00808F C0                     865 	.db #0xc0	; 192
      008090 78                     866 	.db #0x78	; 120	'x'
      008091 40                     867 	.db #0x40	; 64
      008092 C0                     868 	.db #0xc0	; 192
      008093 78                     869 	.db #0x78	; 120	'x'
      008094 40                     870 	.db #0x40	; 64
      008095 00                     871 	.db #0x00	; 0
      008096 04                     872 	.db #0x04	; 4
      008097 3F                     873 	.db #0x3f	; 63
      008098 04                     874 	.db #0x04	; 4
      008099 04                     875 	.db #0x04	; 4
      00809A 3F                     876 	.db #0x3f	; 63
      00809B 04                     877 	.db #0x04	; 4
      00809C 04                     878 	.db #0x04	; 4
      00809D 00                     879 	.db #0x00	; 0
      00809E 00                     880 	.db #0x00	; 0
      00809F 70                     881 	.db #0x70	; 112	'p'
      0080A0 88                     882 	.db #0x88	; 136
      0080A1 FC                     883 	.db #0xfc	; 252
      0080A2 08                     884 	.db #0x08	; 8
      0080A3 30                     885 	.db #0x30	; 48	'0'
      0080A4 00                     886 	.db #0x00	; 0
      0080A5 00                     887 	.db #0x00	; 0
      0080A6 00                     888 	.db #0x00	; 0
      0080A7 18                     889 	.db #0x18	; 24
      0080A8 20                     890 	.db #0x20	; 32
      0080A9 FF                     891 	.db #0xff	; 255
      0080AA 21                     892 	.db #0x21	; 33
      0080AB 1E                     893 	.db #0x1e	; 30
      0080AC 00                     894 	.db #0x00	; 0
      0080AD 00                     895 	.db #0x00	; 0
      0080AE F0                     896 	.db #0xf0	; 240
      0080AF 08                     897 	.db #0x08	; 8
      0080B0 F0                     898 	.db #0xf0	; 240
      0080B1 00                     899 	.db #0x00	; 0
      0080B2 E0                     900 	.db #0xe0	; 224
      0080B3 18                     901 	.db #0x18	; 24
      0080B4 00                     902 	.db #0x00	; 0
      0080B5 00                     903 	.db #0x00	; 0
      0080B6 00                     904 	.db #0x00	; 0
      0080B7 21                     905 	.db #0x21	; 33
      0080B8 1C                     906 	.db #0x1c	; 28
      0080B9 03                     907 	.db #0x03	; 3
      0080BA 1E                     908 	.db #0x1e	; 30
      0080BB 21                     909 	.db #0x21	; 33
      0080BC 1E                     910 	.db #0x1e	; 30
      0080BD 00                     911 	.db #0x00	; 0
      0080BE 00                     912 	.db #0x00	; 0
      0080BF F0                     913 	.db #0xf0	; 240
      0080C0 08                     914 	.db #0x08	; 8
      0080C1 88                     915 	.db #0x88	; 136
      0080C2 70                     916 	.db #0x70	; 112	'p'
      0080C3 00                     917 	.db #0x00	; 0
      0080C4 00                     918 	.db #0x00	; 0
      0080C5 00                     919 	.db #0x00	; 0
      0080C6 1E                     920 	.db #0x1e	; 30
      0080C7 21                     921 	.db #0x21	; 33
      0080C8 23                     922 	.db #0x23	; 35
      0080C9 24                     923 	.db #0x24	; 36
      0080CA 19                     924 	.db #0x19	; 25
      0080CB 27                     925 	.db #0x27	; 39
      0080CC 21                     926 	.db #0x21	; 33
      0080CD 10                     927 	.db #0x10	; 16
      0080CE 10                     928 	.db #0x10	; 16
      0080CF 16                     929 	.db #0x16	; 22
      0080D0 0E                     930 	.db #0x0e	; 14
      0080D1 00                     931 	.db #0x00	; 0
      0080D2 00                     932 	.db #0x00	; 0
      0080D3 00                     933 	.db #0x00	; 0
      0080D4 00                     934 	.db #0x00	; 0
      0080D5 00                     935 	.db #0x00	; 0
      0080D6 00                     936 	.db #0x00	; 0
      0080D7 00                     937 	.db #0x00	; 0
      0080D8 00                     938 	.db #0x00	; 0
      0080D9 00                     939 	.db #0x00	; 0
      0080DA 00                     940 	.db #0x00	; 0
      0080DB 00                     941 	.db #0x00	; 0
      0080DC 00                     942 	.db #0x00	; 0
      0080DD 00                     943 	.db #0x00	; 0
      0080DE 00                     944 	.db #0x00	; 0
      0080DF 00                     945 	.db #0x00	; 0
      0080E0 00                     946 	.db #0x00	; 0
      0080E1 E0                     947 	.db #0xe0	; 224
      0080E2 18                     948 	.db #0x18	; 24
      0080E3 04                     949 	.db #0x04	; 4
      0080E4 02                     950 	.db #0x02	; 2
      0080E5 00                     951 	.db #0x00	; 0
      0080E6 00                     952 	.db #0x00	; 0
      0080E7 00                     953 	.db #0x00	; 0
      0080E8 00                     954 	.db #0x00	; 0
      0080E9 07                     955 	.db #0x07	; 7
      0080EA 18                     956 	.db #0x18	; 24
      0080EB 20                     957 	.db #0x20	; 32
      0080EC 40                     958 	.db #0x40	; 64
      0080ED 00                     959 	.db #0x00	; 0
      0080EE 00                     960 	.db #0x00	; 0
      0080EF 02                     961 	.db #0x02	; 2
      0080F0 04                     962 	.db #0x04	; 4
      0080F1 18                     963 	.db #0x18	; 24
      0080F2 E0                     964 	.db #0xe0	; 224
      0080F3 00                     965 	.db #0x00	; 0
      0080F4 00                     966 	.db #0x00	; 0
      0080F5 00                     967 	.db #0x00	; 0
      0080F6 00                     968 	.db #0x00	; 0
      0080F7 40                     969 	.db #0x40	; 64
      0080F8 20                     970 	.db #0x20	; 32
      0080F9 18                     971 	.db #0x18	; 24
      0080FA 07                     972 	.db #0x07	; 7
      0080FB 00                     973 	.db #0x00	; 0
      0080FC 00                     974 	.db #0x00	; 0
      0080FD 00                     975 	.db #0x00	; 0
      0080FE 40                     976 	.db #0x40	; 64
      0080FF 40                     977 	.db #0x40	; 64
      008100 80                     978 	.db #0x80	; 128
      008101 F0                     979 	.db #0xf0	; 240
      008102 80                     980 	.db #0x80	; 128
      008103 40                     981 	.db #0x40	; 64
      008104 40                     982 	.db #0x40	; 64
      008105 00                     983 	.db #0x00	; 0
      008106 02                     984 	.db #0x02	; 2
      008107 02                     985 	.db #0x02	; 2
      008108 01                     986 	.db #0x01	; 1
      008109 0F                     987 	.db #0x0f	; 15
      00810A 01                     988 	.db #0x01	; 1
      00810B 02                     989 	.db #0x02	; 2
      00810C 02                     990 	.db #0x02	; 2
      00810D 00                     991 	.db #0x00	; 0
      00810E 00                     992 	.db #0x00	; 0
      00810F 00                     993 	.db #0x00	; 0
      008110 00                     994 	.db #0x00	; 0
      008111 F0                     995 	.db #0xf0	; 240
      008112 00                     996 	.db #0x00	; 0
      008113 00                     997 	.db #0x00	; 0
      008114 00                     998 	.db #0x00	; 0
      008115 00                     999 	.db #0x00	; 0
      008116 01                    1000 	.db #0x01	; 1
      008117 01                    1001 	.db #0x01	; 1
      008118 01                    1002 	.db #0x01	; 1
      008119 1F                    1003 	.db #0x1f	; 31
      00811A 01                    1004 	.db #0x01	; 1
      00811B 01                    1005 	.db #0x01	; 1
      00811C 01                    1006 	.db #0x01	; 1
      00811D 00                    1007 	.db #0x00	; 0
      00811E 00                    1008 	.db #0x00	; 0
      00811F 00                    1009 	.db #0x00	; 0
      008120 00                    1010 	.db #0x00	; 0
      008121 00                    1011 	.db #0x00	; 0
      008122 00                    1012 	.db #0x00	; 0
      008123 00                    1013 	.db #0x00	; 0
      008124 00                    1014 	.db #0x00	; 0
      008125 00                    1015 	.db #0x00	; 0
      008126 80                    1016 	.db #0x80	; 128
      008127 B0                    1017 	.db #0xb0	; 176
      008128 70                    1018 	.db #0x70	; 112	'p'
      008129 00                    1019 	.db #0x00	; 0
      00812A 00                    1020 	.db #0x00	; 0
      00812B 00                    1021 	.db #0x00	; 0
      00812C 00                    1022 	.db #0x00	; 0
      00812D 00                    1023 	.db #0x00	; 0
      00812E 00                    1024 	.db #0x00	; 0
      00812F 00                    1025 	.db #0x00	; 0
      008130 00                    1026 	.db #0x00	; 0
      008131 00                    1027 	.db #0x00	; 0
      008132 00                    1028 	.db #0x00	; 0
      008133 00                    1029 	.db #0x00	; 0
      008134 00                    1030 	.db #0x00	; 0
      008135 00                    1031 	.db #0x00	; 0
      008136 00                    1032 	.db #0x00	; 0
      008137 01                    1033 	.db #0x01	; 1
      008138 01                    1034 	.db #0x01	; 1
      008139 01                    1035 	.db #0x01	; 1
      00813A 01                    1036 	.db #0x01	; 1
      00813B 01                    1037 	.db #0x01	; 1
      00813C 01                    1038 	.db #0x01	; 1
      00813D 01                    1039 	.db #0x01	; 1
      00813E 00                    1040 	.db #0x00	; 0
      00813F 00                    1041 	.db #0x00	; 0
      008140 00                    1042 	.db #0x00	; 0
      008141 00                    1043 	.db #0x00	; 0
      008142 00                    1044 	.db #0x00	; 0
      008143 00                    1045 	.db #0x00	; 0
      008144 00                    1046 	.db #0x00	; 0
      008145 00                    1047 	.db #0x00	; 0
      008146 00                    1048 	.db #0x00	; 0
      008147 30                    1049 	.db #0x30	; 48	'0'
      008148 30                    1050 	.db #0x30	; 48	'0'
      008149 00                    1051 	.db #0x00	; 0
      00814A 00                    1052 	.db #0x00	; 0
      00814B 00                    1053 	.db #0x00	; 0
      00814C 00                    1054 	.db #0x00	; 0
      00814D 00                    1055 	.db #0x00	; 0
      00814E 00                    1056 	.db #0x00	; 0
      00814F 00                    1057 	.db #0x00	; 0
      008150 00                    1058 	.db #0x00	; 0
      008151 00                    1059 	.db #0x00	; 0
      008152 80                    1060 	.db #0x80	; 128
      008153 60                    1061 	.db #0x60	; 96
      008154 18                    1062 	.db #0x18	; 24
      008155 04                    1063 	.db #0x04	; 4
      008156 00                    1064 	.db #0x00	; 0
      008157 60                    1065 	.db #0x60	; 96
      008158 18                    1066 	.db #0x18	; 24
      008159 06                    1067 	.db #0x06	; 6
      00815A 01                    1068 	.db #0x01	; 1
      00815B 00                    1069 	.db #0x00	; 0
      00815C 00                    1070 	.db #0x00	; 0
      00815D 00                    1071 	.db #0x00	; 0
      00815E 00                    1072 	.db #0x00	; 0
      00815F E0                    1073 	.db #0xe0	; 224
      008160 10                    1074 	.db #0x10	; 16
      008161 08                    1075 	.db #0x08	; 8
      008162 08                    1076 	.db #0x08	; 8
      008163 10                    1077 	.db #0x10	; 16
      008164 E0                    1078 	.db #0xe0	; 224
      008165 00                    1079 	.db #0x00	; 0
      008166 00                    1080 	.db #0x00	; 0
      008167 0F                    1081 	.db #0x0f	; 15
      008168 10                    1082 	.db #0x10	; 16
      008169 20                    1083 	.db #0x20	; 32
      00816A 20                    1084 	.db #0x20	; 32
      00816B 10                    1085 	.db #0x10	; 16
      00816C 0F                    1086 	.db #0x0f	; 15
      00816D 00                    1087 	.db #0x00	; 0
      00816E 00                    1088 	.db #0x00	; 0
      00816F 10                    1089 	.db #0x10	; 16
      008170 10                    1090 	.db #0x10	; 16
      008171 F8                    1091 	.db #0xf8	; 248
      008172 00                    1092 	.db #0x00	; 0
      008173 00                    1093 	.db #0x00	; 0
      008174 00                    1094 	.db #0x00	; 0
      008175 00                    1095 	.db #0x00	; 0
      008176 00                    1096 	.db #0x00	; 0
      008177 20                    1097 	.db #0x20	; 32
      008178 20                    1098 	.db #0x20	; 32
      008179 3F                    1099 	.db #0x3f	; 63
      00817A 20                    1100 	.db #0x20	; 32
      00817B 20                    1101 	.db #0x20	; 32
      00817C 00                    1102 	.db #0x00	; 0
      00817D 00                    1103 	.db #0x00	; 0
      00817E 00                    1104 	.db #0x00	; 0
      00817F 70                    1105 	.db #0x70	; 112	'p'
      008180 08                    1106 	.db #0x08	; 8
      008181 08                    1107 	.db #0x08	; 8
      008182 08                    1108 	.db #0x08	; 8
      008183 88                    1109 	.db #0x88	; 136
      008184 70                    1110 	.db #0x70	; 112	'p'
      008185 00                    1111 	.db #0x00	; 0
      008186 00                    1112 	.db #0x00	; 0
      008187 30                    1113 	.db #0x30	; 48	'0'
      008188 28                    1114 	.db #0x28	; 40
      008189 24                    1115 	.db #0x24	; 36
      00818A 22                    1116 	.db #0x22	; 34
      00818B 21                    1117 	.db #0x21	; 33
      00818C 30                    1118 	.db #0x30	; 48	'0'
      00818D 00                    1119 	.db #0x00	; 0
      00818E 00                    1120 	.db #0x00	; 0
      00818F 30                    1121 	.db #0x30	; 48	'0'
      008190 08                    1122 	.db #0x08	; 8
      008191 88                    1123 	.db #0x88	; 136
      008192 88                    1124 	.db #0x88	; 136
      008193 48                    1125 	.db #0x48	; 72	'H'
      008194 30                    1126 	.db #0x30	; 48	'0'
      008195 00                    1127 	.db #0x00	; 0
      008196 00                    1128 	.db #0x00	; 0
      008197 18                    1129 	.db #0x18	; 24
      008198 20                    1130 	.db #0x20	; 32
      008199 20                    1131 	.db #0x20	; 32
      00819A 20                    1132 	.db #0x20	; 32
      00819B 11                    1133 	.db #0x11	; 17
      00819C 0E                    1134 	.db #0x0e	; 14
      00819D 00                    1135 	.db #0x00	; 0
      00819E 00                    1136 	.db #0x00	; 0
      00819F 00                    1137 	.db #0x00	; 0
      0081A0 C0                    1138 	.db #0xc0	; 192
      0081A1 20                    1139 	.db #0x20	; 32
      0081A2 10                    1140 	.db #0x10	; 16
      0081A3 F8                    1141 	.db #0xf8	; 248
      0081A4 00                    1142 	.db #0x00	; 0
      0081A5 00                    1143 	.db #0x00	; 0
      0081A6 00                    1144 	.db #0x00	; 0
      0081A7 07                    1145 	.db #0x07	; 7
      0081A8 04                    1146 	.db #0x04	; 4
      0081A9 24                    1147 	.db #0x24	; 36
      0081AA 24                    1148 	.db #0x24	; 36
      0081AB 3F                    1149 	.db #0x3f	; 63
      0081AC 24                    1150 	.db #0x24	; 36
      0081AD 00                    1151 	.db #0x00	; 0
      0081AE 00                    1152 	.db #0x00	; 0
      0081AF F8                    1153 	.db #0xf8	; 248
      0081B0 08                    1154 	.db #0x08	; 8
      0081B1 88                    1155 	.db #0x88	; 136
      0081B2 88                    1156 	.db #0x88	; 136
      0081B3 08                    1157 	.db #0x08	; 8
      0081B4 08                    1158 	.db #0x08	; 8
      0081B5 00                    1159 	.db #0x00	; 0
      0081B6 00                    1160 	.db #0x00	; 0
      0081B7 19                    1161 	.db #0x19	; 25
      0081B8 21                    1162 	.db #0x21	; 33
      0081B9 20                    1163 	.db #0x20	; 32
      0081BA 20                    1164 	.db #0x20	; 32
      0081BB 11                    1165 	.db #0x11	; 17
      0081BC 0E                    1166 	.db #0x0e	; 14
      0081BD 00                    1167 	.db #0x00	; 0
      0081BE 00                    1168 	.db #0x00	; 0
      0081BF E0                    1169 	.db #0xe0	; 224
      0081C0 10                    1170 	.db #0x10	; 16
      0081C1 88                    1171 	.db #0x88	; 136
      0081C2 88                    1172 	.db #0x88	; 136
      0081C3 18                    1173 	.db #0x18	; 24
      0081C4 00                    1174 	.db #0x00	; 0
      0081C5 00                    1175 	.db #0x00	; 0
      0081C6 00                    1176 	.db #0x00	; 0
      0081C7 0F                    1177 	.db #0x0f	; 15
      0081C8 11                    1178 	.db #0x11	; 17
      0081C9 20                    1179 	.db #0x20	; 32
      0081CA 20                    1180 	.db #0x20	; 32
      0081CB 11                    1181 	.db #0x11	; 17
      0081CC 0E                    1182 	.db #0x0e	; 14
      0081CD 00                    1183 	.db #0x00	; 0
      0081CE 00                    1184 	.db #0x00	; 0
      0081CF 38                    1185 	.db #0x38	; 56	'8'
      0081D0 08                    1186 	.db #0x08	; 8
      0081D1 08                    1187 	.db #0x08	; 8
      0081D2 C8                    1188 	.db #0xc8	; 200
      0081D3 38                    1189 	.db #0x38	; 56	'8'
      0081D4 08                    1190 	.db #0x08	; 8
      0081D5 00                    1191 	.db #0x00	; 0
      0081D6 00                    1192 	.db #0x00	; 0
      0081D7 00                    1193 	.db #0x00	; 0
      0081D8 00                    1194 	.db #0x00	; 0
      0081D9 3F                    1195 	.db #0x3f	; 63
      0081DA 00                    1196 	.db #0x00	; 0
      0081DB 00                    1197 	.db #0x00	; 0
      0081DC 00                    1198 	.db #0x00	; 0
      0081DD 00                    1199 	.db #0x00	; 0
      0081DE 00                    1200 	.db #0x00	; 0
      0081DF 70                    1201 	.db #0x70	; 112	'p'
      0081E0 88                    1202 	.db #0x88	; 136
      0081E1 08                    1203 	.db #0x08	; 8
      0081E2 08                    1204 	.db #0x08	; 8
      0081E3 88                    1205 	.db #0x88	; 136
      0081E4 70                    1206 	.db #0x70	; 112	'p'
      0081E5 00                    1207 	.db #0x00	; 0
      0081E6 00                    1208 	.db #0x00	; 0
      0081E7 1C                    1209 	.db #0x1c	; 28
      0081E8 22                    1210 	.db #0x22	; 34
      0081E9 21                    1211 	.db #0x21	; 33
      0081EA 21                    1212 	.db #0x21	; 33
      0081EB 22                    1213 	.db #0x22	; 34
      0081EC 1C                    1214 	.db #0x1c	; 28
      0081ED 00                    1215 	.db #0x00	; 0
      0081EE 00                    1216 	.db #0x00	; 0
      0081EF E0                    1217 	.db #0xe0	; 224
      0081F0 10                    1218 	.db #0x10	; 16
      0081F1 08                    1219 	.db #0x08	; 8
      0081F2 08                    1220 	.db #0x08	; 8
      0081F3 10                    1221 	.db #0x10	; 16
      0081F4 E0                    1222 	.db #0xe0	; 224
      0081F5 00                    1223 	.db #0x00	; 0
      0081F6 00                    1224 	.db #0x00	; 0
      0081F7 00                    1225 	.db #0x00	; 0
      0081F8 31                    1226 	.db #0x31	; 49	'1'
      0081F9 22                    1227 	.db #0x22	; 34
      0081FA 22                    1228 	.db #0x22	; 34
      0081FB 11                    1229 	.db #0x11	; 17
      0081FC 0F                    1230 	.db #0x0f	; 15
      0081FD 00                    1231 	.db #0x00	; 0
      0081FE 00                    1232 	.db #0x00	; 0
      0081FF 00                    1233 	.db #0x00	; 0
      008200 00                    1234 	.db #0x00	; 0
      008201 C0                    1235 	.db #0xc0	; 192
      008202 C0                    1236 	.db #0xc0	; 192
      008203 00                    1237 	.db #0x00	; 0
      008204 00                    1238 	.db #0x00	; 0
      008205 00                    1239 	.db #0x00	; 0
      008206 00                    1240 	.db #0x00	; 0
      008207 00                    1241 	.db #0x00	; 0
      008208 00                    1242 	.db #0x00	; 0
      008209 30                    1243 	.db #0x30	; 48	'0'
      00820A 30                    1244 	.db #0x30	; 48	'0'
      00820B 00                    1245 	.db #0x00	; 0
      00820C 00                    1246 	.db #0x00	; 0
      00820D 00                    1247 	.db #0x00	; 0
      00820E 00                    1248 	.db #0x00	; 0
      00820F 00                    1249 	.db #0x00	; 0
      008210 00                    1250 	.db #0x00	; 0
      008211 80                    1251 	.db #0x80	; 128
      008212 00                    1252 	.db #0x00	; 0
      008213 00                    1253 	.db #0x00	; 0
      008214 00                    1254 	.db #0x00	; 0
      008215 00                    1255 	.db #0x00	; 0
      008216 00                    1256 	.db #0x00	; 0
      008217 00                    1257 	.db #0x00	; 0
      008218 80                    1258 	.db #0x80	; 128
      008219 60                    1259 	.db #0x60	; 96
      00821A 00                    1260 	.db #0x00	; 0
      00821B 00                    1261 	.db #0x00	; 0
      00821C 00                    1262 	.db #0x00	; 0
      00821D 00                    1263 	.db #0x00	; 0
      00821E 00                    1264 	.db #0x00	; 0
      00821F 00                    1265 	.db #0x00	; 0
      008220 80                    1266 	.db #0x80	; 128
      008221 40                    1267 	.db #0x40	; 64
      008222 20                    1268 	.db #0x20	; 32
      008223 10                    1269 	.db #0x10	; 16
      008224 08                    1270 	.db #0x08	; 8
      008225 00                    1271 	.db #0x00	; 0
      008226 00                    1272 	.db #0x00	; 0
      008227 01                    1273 	.db #0x01	; 1
      008228 02                    1274 	.db #0x02	; 2
      008229 04                    1275 	.db #0x04	; 4
      00822A 08                    1276 	.db #0x08	; 8
      00822B 10                    1277 	.db #0x10	; 16
      00822C 20                    1278 	.db #0x20	; 32
      00822D 00                    1279 	.db #0x00	; 0
      00822E 40                    1280 	.db #0x40	; 64
      00822F 40                    1281 	.db #0x40	; 64
      008230 40                    1282 	.db #0x40	; 64
      008231 40                    1283 	.db #0x40	; 64
      008232 40                    1284 	.db #0x40	; 64
      008233 40                    1285 	.db #0x40	; 64
      008234 40                    1286 	.db #0x40	; 64
      008235 00                    1287 	.db #0x00	; 0
      008236 04                    1288 	.db #0x04	; 4
      008237 04                    1289 	.db #0x04	; 4
      008238 04                    1290 	.db #0x04	; 4
      008239 04                    1291 	.db #0x04	; 4
      00823A 04                    1292 	.db #0x04	; 4
      00823B 04                    1293 	.db #0x04	; 4
      00823C 04                    1294 	.db #0x04	; 4
      00823D 00                    1295 	.db #0x00	; 0
      00823E 00                    1296 	.db #0x00	; 0
      00823F 08                    1297 	.db #0x08	; 8
      008240 10                    1298 	.db #0x10	; 16
      008241 20                    1299 	.db #0x20	; 32
      008242 40                    1300 	.db #0x40	; 64
      008243 80                    1301 	.db #0x80	; 128
      008244 00                    1302 	.db #0x00	; 0
      008245 00                    1303 	.db #0x00	; 0
      008246 00                    1304 	.db #0x00	; 0
      008247 20                    1305 	.db #0x20	; 32
      008248 10                    1306 	.db #0x10	; 16
      008249 08                    1307 	.db #0x08	; 8
      00824A 04                    1308 	.db #0x04	; 4
      00824B 02                    1309 	.db #0x02	; 2
      00824C 01                    1310 	.db #0x01	; 1
      00824D 00                    1311 	.db #0x00	; 0
      00824E 00                    1312 	.db #0x00	; 0
      00824F 70                    1313 	.db #0x70	; 112	'p'
      008250 48                    1314 	.db #0x48	; 72	'H'
      008251 08                    1315 	.db #0x08	; 8
      008252 08                    1316 	.db #0x08	; 8
      008253 08                    1317 	.db #0x08	; 8
      008254 F0                    1318 	.db #0xf0	; 240
      008255 00                    1319 	.db #0x00	; 0
      008256 00                    1320 	.db #0x00	; 0
      008257 00                    1321 	.db #0x00	; 0
      008258 00                    1322 	.db #0x00	; 0
      008259 30                    1323 	.db #0x30	; 48	'0'
      00825A 36                    1324 	.db #0x36	; 54	'6'
      00825B 01                    1325 	.db #0x01	; 1
      00825C 00                    1326 	.db #0x00	; 0
      00825D 00                    1327 	.db #0x00	; 0
      00825E C0                    1328 	.db #0xc0	; 192
      00825F 30                    1329 	.db #0x30	; 48	'0'
      008260 C8                    1330 	.db #0xc8	; 200
      008261 28                    1331 	.db #0x28	; 40
      008262 E8                    1332 	.db #0xe8	; 232
      008263 10                    1333 	.db #0x10	; 16
      008264 E0                    1334 	.db #0xe0	; 224
      008265 00                    1335 	.db #0x00	; 0
      008266 07                    1336 	.db #0x07	; 7
      008267 18                    1337 	.db #0x18	; 24
      008268 27                    1338 	.db #0x27	; 39
      008269 24                    1339 	.db #0x24	; 36
      00826A 23                    1340 	.db #0x23	; 35
      00826B 14                    1341 	.db #0x14	; 20
      00826C 0B                    1342 	.db #0x0b	; 11
      00826D 00                    1343 	.db #0x00	; 0
      00826E 00                    1344 	.db #0x00	; 0
      00826F 00                    1345 	.db #0x00	; 0
      008270 C0                    1346 	.db #0xc0	; 192
      008271 38                    1347 	.db #0x38	; 56	'8'
      008272 E0                    1348 	.db #0xe0	; 224
      008273 00                    1349 	.db #0x00	; 0
      008274 00                    1350 	.db #0x00	; 0
      008275 00                    1351 	.db #0x00	; 0
      008276 20                    1352 	.db #0x20	; 32
      008277 3C                    1353 	.db #0x3c	; 60
      008278 23                    1354 	.db #0x23	; 35
      008279 02                    1355 	.db #0x02	; 2
      00827A 02                    1356 	.db #0x02	; 2
      00827B 27                    1357 	.db #0x27	; 39
      00827C 38                    1358 	.db #0x38	; 56	'8'
      00827D 20                    1359 	.db #0x20	; 32
      00827E 08                    1360 	.db #0x08	; 8
      00827F F8                    1361 	.db #0xf8	; 248
      008280 88                    1362 	.db #0x88	; 136
      008281 88                    1363 	.db #0x88	; 136
      008282 88                    1364 	.db #0x88	; 136
      008283 70                    1365 	.db #0x70	; 112	'p'
      008284 00                    1366 	.db #0x00	; 0
      008285 00                    1367 	.db #0x00	; 0
      008286 20                    1368 	.db #0x20	; 32
      008287 3F                    1369 	.db #0x3f	; 63
      008288 20                    1370 	.db #0x20	; 32
      008289 20                    1371 	.db #0x20	; 32
      00828A 20                    1372 	.db #0x20	; 32
      00828B 11                    1373 	.db #0x11	; 17
      00828C 0E                    1374 	.db #0x0e	; 14
      00828D 00                    1375 	.db #0x00	; 0
      00828E C0                    1376 	.db #0xc0	; 192
      00828F 30                    1377 	.db #0x30	; 48	'0'
      008290 08                    1378 	.db #0x08	; 8
      008291 08                    1379 	.db #0x08	; 8
      008292 08                    1380 	.db #0x08	; 8
      008293 08                    1381 	.db #0x08	; 8
      008294 38                    1382 	.db #0x38	; 56	'8'
      008295 00                    1383 	.db #0x00	; 0
      008296 07                    1384 	.db #0x07	; 7
      008297 18                    1385 	.db #0x18	; 24
      008298 20                    1386 	.db #0x20	; 32
      008299 20                    1387 	.db #0x20	; 32
      00829A 20                    1388 	.db #0x20	; 32
      00829B 10                    1389 	.db #0x10	; 16
      00829C 08                    1390 	.db #0x08	; 8
      00829D 00                    1391 	.db #0x00	; 0
      00829E 08                    1392 	.db #0x08	; 8
      00829F F8                    1393 	.db #0xf8	; 248
      0082A0 08                    1394 	.db #0x08	; 8
      0082A1 08                    1395 	.db #0x08	; 8
      0082A2 08                    1396 	.db #0x08	; 8
      0082A3 10                    1397 	.db #0x10	; 16
      0082A4 E0                    1398 	.db #0xe0	; 224
      0082A5 00                    1399 	.db #0x00	; 0
      0082A6 20                    1400 	.db #0x20	; 32
      0082A7 3F                    1401 	.db #0x3f	; 63
      0082A8 20                    1402 	.db #0x20	; 32
      0082A9 20                    1403 	.db #0x20	; 32
      0082AA 20                    1404 	.db #0x20	; 32
      0082AB 10                    1405 	.db #0x10	; 16
      0082AC 0F                    1406 	.db #0x0f	; 15
      0082AD 00                    1407 	.db #0x00	; 0
      0082AE 08                    1408 	.db #0x08	; 8
      0082AF F8                    1409 	.db #0xf8	; 248
      0082B0 88                    1410 	.db #0x88	; 136
      0082B1 88                    1411 	.db #0x88	; 136
      0082B2 E8                    1412 	.db #0xe8	; 232
      0082B3 08                    1413 	.db #0x08	; 8
      0082B4 10                    1414 	.db #0x10	; 16
      0082B5 00                    1415 	.db #0x00	; 0
      0082B6 20                    1416 	.db #0x20	; 32
      0082B7 3F                    1417 	.db #0x3f	; 63
      0082B8 20                    1418 	.db #0x20	; 32
      0082B9 20                    1419 	.db #0x20	; 32
      0082BA 23                    1420 	.db #0x23	; 35
      0082BB 20                    1421 	.db #0x20	; 32
      0082BC 18                    1422 	.db #0x18	; 24
      0082BD 00                    1423 	.db #0x00	; 0
      0082BE 08                    1424 	.db #0x08	; 8
      0082BF F8                    1425 	.db #0xf8	; 248
      0082C0 88                    1426 	.db #0x88	; 136
      0082C1 88                    1427 	.db #0x88	; 136
      0082C2 E8                    1428 	.db #0xe8	; 232
      0082C3 08                    1429 	.db #0x08	; 8
      0082C4 10                    1430 	.db #0x10	; 16
      0082C5 00                    1431 	.db #0x00	; 0
      0082C6 20                    1432 	.db #0x20	; 32
      0082C7 3F                    1433 	.db #0x3f	; 63
      0082C8 20                    1434 	.db #0x20	; 32
      0082C9 00                    1435 	.db #0x00	; 0
      0082CA 03                    1436 	.db #0x03	; 3
      0082CB 00                    1437 	.db #0x00	; 0
      0082CC 00                    1438 	.db #0x00	; 0
      0082CD 00                    1439 	.db #0x00	; 0
      0082CE C0                    1440 	.db #0xc0	; 192
      0082CF 30                    1441 	.db #0x30	; 48	'0'
      0082D0 08                    1442 	.db #0x08	; 8
      0082D1 08                    1443 	.db #0x08	; 8
      0082D2 08                    1444 	.db #0x08	; 8
      0082D3 38                    1445 	.db #0x38	; 56	'8'
      0082D4 00                    1446 	.db #0x00	; 0
      0082D5 00                    1447 	.db #0x00	; 0
      0082D6 07                    1448 	.db #0x07	; 7
      0082D7 18                    1449 	.db #0x18	; 24
      0082D8 20                    1450 	.db #0x20	; 32
      0082D9 20                    1451 	.db #0x20	; 32
      0082DA 22                    1452 	.db #0x22	; 34
      0082DB 1E                    1453 	.db #0x1e	; 30
      0082DC 02                    1454 	.db #0x02	; 2
      0082DD 00                    1455 	.db #0x00	; 0
      0082DE 08                    1456 	.db #0x08	; 8
      0082DF F8                    1457 	.db #0xf8	; 248
      0082E0 08                    1458 	.db #0x08	; 8
      0082E1 00                    1459 	.db #0x00	; 0
      0082E2 00                    1460 	.db #0x00	; 0
      0082E3 08                    1461 	.db #0x08	; 8
      0082E4 F8                    1462 	.db #0xf8	; 248
      0082E5 08                    1463 	.db #0x08	; 8
      0082E6 20                    1464 	.db #0x20	; 32
      0082E7 3F                    1465 	.db #0x3f	; 63
      0082E8 21                    1466 	.db #0x21	; 33
      0082E9 01                    1467 	.db #0x01	; 1
      0082EA 01                    1468 	.db #0x01	; 1
      0082EB 21                    1469 	.db #0x21	; 33
      0082EC 3F                    1470 	.db #0x3f	; 63
      0082ED 20                    1471 	.db #0x20	; 32
      0082EE 00                    1472 	.db #0x00	; 0
      0082EF 08                    1473 	.db #0x08	; 8
      0082F0 08                    1474 	.db #0x08	; 8
      0082F1 F8                    1475 	.db #0xf8	; 248
      0082F2 08                    1476 	.db #0x08	; 8
      0082F3 08                    1477 	.db #0x08	; 8
      0082F4 00                    1478 	.db #0x00	; 0
      0082F5 00                    1479 	.db #0x00	; 0
      0082F6 00                    1480 	.db #0x00	; 0
      0082F7 20                    1481 	.db #0x20	; 32
      0082F8 20                    1482 	.db #0x20	; 32
      0082F9 3F                    1483 	.db #0x3f	; 63
      0082FA 20                    1484 	.db #0x20	; 32
      0082FB 20                    1485 	.db #0x20	; 32
      0082FC 00                    1486 	.db #0x00	; 0
      0082FD 00                    1487 	.db #0x00	; 0
      0082FE 00                    1488 	.db #0x00	; 0
      0082FF 00                    1489 	.db #0x00	; 0
      008300 08                    1490 	.db #0x08	; 8
      008301 08                    1491 	.db #0x08	; 8
      008302 F8                    1492 	.db #0xf8	; 248
      008303 08                    1493 	.db #0x08	; 8
      008304 08                    1494 	.db #0x08	; 8
      008305 00                    1495 	.db #0x00	; 0
      008306 C0                    1496 	.db #0xc0	; 192
      008307 80                    1497 	.db #0x80	; 128
      008308 80                    1498 	.db #0x80	; 128
      008309 80                    1499 	.db #0x80	; 128
      00830A 7F                    1500 	.db #0x7f	; 127
      00830B 00                    1501 	.db #0x00	; 0
      00830C 00                    1502 	.db #0x00	; 0
      00830D 00                    1503 	.db #0x00	; 0
      00830E 08                    1504 	.db #0x08	; 8
      00830F F8                    1505 	.db #0xf8	; 248
      008310 88                    1506 	.db #0x88	; 136
      008311 C0                    1507 	.db #0xc0	; 192
      008312 28                    1508 	.db #0x28	; 40
      008313 18                    1509 	.db #0x18	; 24
      008314 08                    1510 	.db #0x08	; 8
      008315 00                    1511 	.db #0x00	; 0
      008316 20                    1512 	.db #0x20	; 32
      008317 3F                    1513 	.db #0x3f	; 63
      008318 20                    1514 	.db #0x20	; 32
      008319 01                    1515 	.db #0x01	; 1
      00831A 26                    1516 	.db #0x26	; 38
      00831B 38                    1517 	.db #0x38	; 56	'8'
      00831C 20                    1518 	.db #0x20	; 32
      00831D 00                    1519 	.db #0x00	; 0
      00831E 08                    1520 	.db #0x08	; 8
      00831F F8                    1521 	.db #0xf8	; 248
      008320 08                    1522 	.db #0x08	; 8
      008321 00                    1523 	.db #0x00	; 0
      008322 00                    1524 	.db #0x00	; 0
      008323 00                    1525 	.db #0x00	; 0
      008324 00                    1526 	.db #0x00	; 0
      008325 00                    1527 	.db #0x00	; 0
      008326 20                    1528 	.db #0x20	; 32
      008327 3F                    1529 	.db #0x3f	; 63
      008328 20                    1530 	.db #0x20	; 32
      008329 20                    1531 	.db #0x20	; 32
      00832A 20                    1532 	.db #0x20	; 32
      00832B 20                    1533 	.db #0x20	; 32
      00832C 30                    1534 	.db #0x30	; 48	'0'
      00832D 00                    1535 	.db #0x00	; 0
      00832E 08                    1536 	.db #0x08	; 8
      00832F F8                    1537 	.db #0xf8	; 248
      008330 F8                    1538 	.db #0xf8	; 248
      008331 00                    1539 	.db #0x00	; 0
      008332 F8                    1540 	.db #0xf8	; 248
      008333 F8                    1541 	.db #0xf8	; 248
      008334 08                    1542 	.db #0x08	; 8
      008335 00                    1543 	.db #0x00	; 0
      008336 20                    1544 	.db #0x20	; 32
      008337 3F                    1545 	.db #0x3f	; 63
      008338 00                    1546 	.db #0x00	; 0
      008339 3F                    1547 	.db #0x3f	; 63
      00833A 00                    1548 	.db #0x00	; 0
      00833B 3F                    1549 	.db #0x3f	; 63
      00833C 20                    1550 	.db #0x20	; 32
      00833D 00                    1551 	.db #0x00	; 0
      00833E 08                    1552 	.db #0x08	; 8
      00833F F8                    1553 	.db #0xf8	; 248
      008340 30                    1554 	.db #0x30	; 48	'0'
      008341 C0                    1555 	.db #0xc0	; 192
      008342 00                    1556 	.db #0x00	; 0
      008343 08                    1557 	.db #0x08	; 8
      008344 F8                    1558 	.db #0xf8	; 248
      008345 08                    1559 	.db #0x08	; 8
      008346 20                    1560 	.db #0x20	; 32
      008347 3F                    1561 	.db #0x3f	; 63
      008348 20                    1562 	.db #0x20	; 32
      008349 00                    1563 	.db #0x00	; 0
      00834A 07                    1564 	.db #0x07	; 7
      00834B 18                    1565 	.db #0x18	; 24
      00834C 3F                    1566 	.db #0x3f	; 63
      00834D 00                    1567 	.db #0x00	; 0
      00834E E0                    1568 	.db #0xe0	; 224
      00834F 10                    1569 	.db #0x10	; 16
      008350 08                    1570 	.db #0x08	; 8
      008351 08                    1571 	.db #0x08	; 8
      008352 08                    1572 	.db #0x08	; 8
      008353 10                    1573 	.db #0x10	; 16
      008354 E0                    1574 	.db #0xe0	; 224
      008355 00                    1575 	.db #0x00	; 0
      008356 0F                    1576 	.db #0x0f	; 15
      008357 10                    1577 	.db #0x10	; 16
      008358 20                    1578 	.db #0x20	; 32
      008359 20                    1579 	.db #0x20	; 32
      00835A 20                    1580 	.db #0x20	; 32
      00835B 10                    1581 	.db #0x10	; 16
      00835C 0F                    1582 	.db #0x0f	; 15
      00835D 00                    1583 	.db #0x00	; 0
      00835E 08                    1584 	.db #0x08	; 8
      00835F F8                    1585 	.db #0xf8	; 248
      008360 08                    1586 	.db #0x08	; 8
      008361 08                    1587 	.db #0x08	; 8
      008362 08                    1588 	.db #0x08	; 8
      008363 08                    1589 	.db #0x08	; 8
      008364 F0                    1590 	.db #0xf0	; 240
      008365 00                    1591 	.db #0x00	; 0
      008366 20                    1592 	.db #0x20	; 32
      008367 3F                    1593 	.db #0x3f	; 63
      008368 21                    1594 	.db #0x21	; 33
      008369 01                    1595 	.db #0x01	; 1
      00836A 01                    1596 	.db #0x01	; 1
      00836B 01                    1597 	.db #0x01	; 1
      00836C 00                    1598 	.db #0x00	; 0
      00836D 00                    1599 	.db #0x00	; 0
      00836E E0                    1600 	.db #0xe0	; 224
      00836F 10                    1601 	.db #0x10	; 16
      008370 08                    1602 	.db #0x08	; 8
      008371 08                    1603 	.db #0x08	; 8
      008372 08                    1604 	.db #0x08	; 8
      008373 10                    1605 	.db #0x10	; 16
      008374 E0                    1606 	.db #0xe0	; 224
      008375 00                    1607 	.db #0x00	; 0
      008376 0F                    1608 	.db #0x0f	; 15
      008377 18                    1609 	.db #0x18	; 24
      008378 24                    1610 	.db #0x24	; 36
      008379 24                    1611 	.db #0x24	; 36
      00837A 38                    1612 	.db #0x38	; 56	'8'
      00837B 50                    1613 	.db #0x50	; 80	'P'
      00837C 4F                    1614 	.db #0x4f	; 79	'O'
      00837D 00                    1615 	.db #0x00	; 0
      00837E 08                    1616 	.db #0x08	; 8
      00837F F8                    1617 	.db #0xf8	; 248
      008380 88                    1618 	.db #0x88	; 136
      008381 88                    1619 	.db #0x88	; 136
      008382 88                    1620 	.db #0x88	; 136
      008383 88                    1621 	.db #0x88	; 136
      008384 70                    1622 	.db #0x70	; 112	'p'
      008385 00                    1623 	.db #0x00	; 0
      008386 20                    1624 	.db #0x20	; 32
      008387 3F                    1625 	.db #0x3f	; 63
      008388 20                    1626 	.db #0x20	; 32
      008389 00                    1627 	.db #0x00	; 0
      00838A 03                    1628 	.db #0x03	; 3
      00838B 0C                    1629 	.db #0x0c	; 12
      00838C 30                    1630 	.db #0x30	; 48	'0'
      00838D 20                    1631 	.db #0x20	; 32
      00838E 00                    1632 	.db #0x00	; 0
      00838F 70                    1633 	.db #0x70	; 112	'p'
      008390 88                    1634 	.db #0x88	; 136
      008391 08                    1635 	.db #0x08	; 8
      008392 08                    1636 	.db #0x08	; 8
      008393 08                    1637 	.db #0x08	; 8
      008394 38                    1638 	.db #0x38	; 56	'8'
      008395 00                    1639 	.db #0x00	; 0
      008396 00                    1640 	.db #0x00	; 0
      008397 38                    1641 	.db #0x38	; 56	'8'
      008398 20                    1642 	.db #0x20	; 32
      008399 21                    1643 	.db #0x21	; 33
      00839A 21                    1644 	.db #0x21	; 33
      00839B 22                    1645 	.db #0x22	; 34
      00839C 1C                    1646 	.db #0x1c	; 28
      00839D 00                    1647 	.db #0x00	; 0
      00839E 18                    1648 	.db #0x18	; 24
      00839F 08                    1649 	.db #0x08	; 8
      0083A0 08                    1650 	.db #0x08	; 8
      0083A1 F8                    1651 	.db #0xf8	; 248
      0083A2 08                    1652 	.db #0x08	; 8
      0083A3 08                    1653 	.db #0x08	; 8
      0083A4 18                    1654 	.db #0x18	; 24
      0083A5 00                    1655 	.db #0x00	; 0
      0083A6 00                    1656 	.db #0x00	; 0
      0083A7 00                    1657 	.db #0x00	; 0
      0083A8 20                    1658 	.db #0x20	; 32
      0083A9 3F                    1659 	.db #0x3f	; 63
      0083AA 20                    1660 	.db #0x20	; 32
      0083AB 00                    1661 	.db #0x00	; 0
      0083AC 00                    1662 	.db #0x00	; 0
      0083AD 00                    1663 	.db #0x00	; 0
      0083AE 08                    1664 	.db #0x08	; 8
      0083AF F8                    1665 	.db #0xf8	; 248
      0083B0 08                    1666 	.db #0x08	; 8
      0083B1 00                    1667 	.db #0x00	; 0
      0083B2 00                    1668 	.db #0x00	; 0
      0083B3 08                    1669 	.db #0x08	; 8
      0083B4 F8                    1670 	.db #0xf8	; 248
      0083B5 08                    1671 	.db #0x08	; 8
      0083B6 00                    1672 	.db #0x00	; 0
      0083B7 1F                    1673 	.db #0x1f	; 31
      0083B8 20                    1674 	.db #0x20	; 32
      0083B9 20                    1675 	.db #0x20	; 32
      0083BA 20                    1676 	.db #0x20	; 32
      0083BB 20                    1677 	.db #0x20	; 32
      0083BC 1F                    1678 	.db #0x1f	; 31
      0083BD 00                    1679 	.db #0x00	; 0
      0083BE 08                    1680 	.db #0x08	; 8
      0083BF 78                    1681 	.db #0x78	; 120	'x'
      0083C0 88                    1682 	.db #0x88	; 136
      0083C1 00                    1683 	.db #0x00	; 0
      0083C2 00                    1684 	.db #0x00	; 0
      0083C3 C8                    1685 	.db #0xc8	; 200
      0083C4 38                    1686 	.db #0x38	; 56	'8'
      0083C5 08                    1687 	.db #0x08	; 8
      0083C6 00                    1688 	.db #0x00	; 0
      0083C7 00                    1689 	.db #0x00	; 0
      0083C8 07                    1690 	.db #0x07	; 7
      0083C9 38                    1691 	.db #0x38	; 56	'8'
      0083CA 0E                    1692 	.db #0x0e	; 14
      0083CB 01                    1693 	.db #0x01	; 1
      0083CC 00                    1694 	.db #0x00	; 0
      0083CD 00                    1695 	.db #0x00	; 0
      0083CE F8                    1696 	.db #0xf8	; 248
      0083CF 08                    1697 	.db #0x08	; 8
      0083D0 00                    1698 	.db #0x00	; 0
      0083D1 F8                    1699 	.db #0xf8	; 248
      0083D2 00                    1700 	.db #0x00	; 0
      0083D3 08                    1701 	.db #0x08	; 8
      0083D4 F8                    1702 	.db #0xf8	; 248
      0083D5 00                    1703 	.db #0x00	; 0
      0083D6 03                    1704 	.db #0x03	; 3
      0083D7 3C                    1705 	.db #0x3c	; 60
      0083D8 07                    1706 	.db #0x07	; 7
      0083D9 00                    1707 	.db #0x00	; 0
      0083DA 07                    1708 	.db #0x07	; 7
      0083DB 3C                    1709 	.db #0x3c	; 60
      0083DC 03                    1710 	.db #0x03	; 3
      0083DD 00                    1711 	.db #0x00	; 0
      0083DE 08                    1712 	.db #0x08	; 8
      0083DF 18                    1713 	.db #0x18	; 24
      0083E0 68                    1714 	.db #0x68	; 104	'h'
      0083E1 80                    1715 	.db #0x80	; 128
      0083E2 80                    1716 	.db #0x80	; 128
      0083E3 68                    1717 	.db #0x68	; 104	'h'
      0083E4 18                    1718 	.db #0x18	; 24
      0083E5 08                    1719 	.db #0x08	; 8
      0083E6 20                    1720 	.db #0x20	; 32
      0083E7 30                    1721 	.db #0x30	; 48	'0'
      0083E8 2C                    1722 	.db #0x2c	; 44
      0083E9 03                    1723 	.db #0x03	; 3
      0083EA 03                    1724 	.db #0x03	; 3
      0083EB 2C                    1725 	.db #0x2c	; 44
      0083EC 30                    1726 	.db #0x30	; 48	'0'
      0083ED 20                    1727 	.db #0x20	; 32
      0083EE 08                    1728 	.db #0x08	; 8
      0083EF 38                    1729 	.db #0x38	; 56	'8'
      0083F0 C8                    1730 	.db #0xc8	; 200
      0083F1 00                    1731 	.db #0x00	; 0
      0083F2 C8                    1732 	.db #0xc8	; 200
      0083F3 38                    1733 	.db #0x38	; 56	'8'
      0083F4 08                    1734 	.db #0x08	; 8
      0083F5 00                    1735 	.db #0x00	; 0
      0083F6 00                    1736 	.db #0x00	; 0
      0083F7 00                    1737 	.db #0x00	; 0
      0083F8 20                    1738 	.db #0x20	; 32
      0083F9 3F                    1739 	.db #0x3f	; 63
      0083FA 20                    1740 	.db #0x20	; 32
      0083FB 00                    1741 	.db #0x00	; 0
      0083FC 00                    1742 	.db #0x00	; 0
      0083FD 00                    1743 	.db #0x00	; 0
      0083FE 10                    1744 	.db #0x10	; 16
      0083FF 08                    1745 	.db #0x08	; 8
      008400 08                    1746 	.db #0x08	; 8
      008401 08                    1747 	.db #0x08	; 8
      008402 C8                    1748 	.db #0xc8	; 200
      008403 38                    1749 	.db #0x38	; 56	'8'
      008404 08                    1750 	.db #0x08	; 8
      008405 00                    1751 	.db #0x00	; 0
      008406 20                    1752 	.db #0x20	; 32
      008407 38                    1753 	.db #0x38	; 56	'8'
      008408 26                    1754 	.db #0x26	; 38
      008409 21                    1755 	.db #0x21	; 33
      00840A 20                    1756 	.db #0x20	; 32
      00840B 20                    1757 	.db #0x20	; 32
      00840C 18                    1758 	.db #0x18	; 24
      00840D 00                    1759 	.db #0x00	; 0
      00840E 00                    1760 	.db #0x00	; 0
      00840F 00                    1761 	.db #0x00	; 0
      008410 00                    1762 	.db #0x00	; 0
      008411 FE                    1763 	.db #0xfe	; 254
      008412 02                    1764 	.db #0x02	; 2
      008413 02                    1765 	.db #0x02	; 2
      008414 02                    1766 	.db #0x02	; 2
      008415 00                    1767 	.db #0x00	; 0
      008416 00                    1768 	.db #0x00	; 0
      008417 00                    1769 	.db #0x00	; 0
      008418 00                    1770 	.db #0x00	; 0
      008419 7F                    1771 	.db #0x7f	; 127
      00841A 40                    1772 	.db #0x40	; 64
      00841B 40                    1773 	.db #0x40	; 64
      00841C 40                    1774 	.db #0x40	; 64
      00841D 00                    1775 	.db #0x00	; 0
      00841E 00                    1776 	.db #0x00	; 0
      00841F 0C                    1777 	.db #0x0c	; 12
      008420 30                    1778 	.db #0x30	; 48	'0'
      008421 C0                    1779 	.db #0xc0	; 192
      008422 00                    1780 	.db #0x00	; 0
      008423 00                    1781 	.db #0x00	; 0
      008424 00                    1782 	.db #0x00	; 0
      008425 00                    1783 	.db #0x00	; 0
      008426 00                    1784 	.db #0x00	; 0
      008427 00                    1785 	.db #0x00	; 0
      008428 00                    1786 	.db #0x00	; 0
      008429 01                    1787 	.db #0x01	; 1
      00842A 06                    1788 	.db #0x06	; 6
      00842B 38                    1789 	.db #0x38	; 56	'8'
      00842C C0                    1790 	.db #0xc0	; 192
      00842D 00                    1791 	.db #0x00	; 0
      00842E 00                    1792 	.db #0x00	; 0
      00842F 02                    1793 	.db #0x02	; 2
      008430 02                    1794 	.db #0x02	; 2
      008431 02                    1795 	.db #0x02	; 2
      008432 FE                    1796 	.db #0xfe	; 254
      008433 00                    1797 	.db #0x00	; 0
      008434 00                    1798 	.db #0x00	; 0
      008435 00                    1799 	.db #0x00	; 0
      008436 00                    1800 	.db #0x00	; 0
      008437 40                    1801 	.db #0x40	; 64
      008438 40                    1802 	.db #0x40	; 64
      008439 40                    1803 	.db #0x40	; 64
      00843A 7F                    1804 	.db #0x7f	; 127
      00843B 00                    1805 	.db #0x00	; 0
      00843C 00                    1806 	.db #0x00	; 0
      00843D 00                    1807 	.db #0x00	; 0
      00843E 00                    1808 	.db #0x00	; 0
      00843F 00                    1809 	.db #0x00	; 0
      008440 04                    1810 	.db #0x04	; 4
      008441 02                    1811 	.db #0x02	; 2
      008442 02                    1812 	.db #0x02	; 2
      008443 02                    1813 	.db #0x02	; 2
      008444 04                    1814 	.db #0x04	; 4
      008445 00                    1815 	.db #0x00	; 0
      008446 00                    1816 	.db #0x00	; 0
      008447 00                    1817 	.db #0x00	; 0
      008448 00                    1818 	.db #0x00	; 0
      008449 00                    1819 	.db #0x00	; 0
      00844A 00                    1820 	.db #0x00	; 0
      00844B 00                    1821 	.db #0x00	; 0
      00844C 00                    1822 	.db #0x00	; 0
      00844D 00                    1823 	.db #0x00	; 0
      00844E 00                    1824 	.db #0x00	; 0
      00844F 00                    1825 	.db #0x00	; 0
      008450 00                    1826 	.db #0x00	; 0
      008451 00                    1827 	.db #0x00	; 0
      008452 00                    1828 	.db #0x00	; 0
      008453 00                    1829 	.db #0x00	; 0
      008454 00                    1830 	.db #0x00	; 0
      008455 00                    1831 	.db #0x00	; 0
      008456 80                    1832 	.db #0x80	; 128
      008457 80                    1833 	.db #0x80	; 128
      008458 80                    1834 	.db #0x80	; 128
      008459 80                    1835 	.db #0x80	; 128
      00845A 80                    1836 	.db #0x80	; 128
      00845B 80                    1837 	.db #0x80	; 128
      00845C 80                    1838 	.db #0x80	; 128
      00845D 80                    1839 	.db #0x80	; 128
      00845E 00                    1840 	.db #0x00	; 0
      00845F 02                    1841 	.db #0x02	; 2
      008460 02                    1842 	.db #0x02	; 2
      008461 04                    1843 	.db #0x04	; 4
      008462 00                    1844 	.db #0x00	; 0
      008463 00                    1845 	.db #0x00	; 0
      008464 00                    1846 	.db #0x00	; 0
      008465 00                    1847 	.db #0x00	; 0
      008466 00                    1848 	.db #0x00	; 0
      008467 00                    1849 	.db #0x00	; 0
      008468 00                    1850 	.db #0x00	; 0
      008469 00                    1851 	.db #0x00	; 0
      00846A 00                    1852 	.db #0x00	; 0
      00846B 00                    1853 	.db #0x00	; 0
      00846C 00                    1854 	.db #0x00	; 0
      00846D 00                    1855 	.db #0x00	; 0
      00846E 00                    1856 	.db #0x00	; 0
      00846F 00                    1857 	.db #0x00	; 0
      008470 80                    1858 	.db #0x80	; 128
      008471 80                    1859 	.db #0x80	; 128
      008472 80                    1860 	.db #0x80	; 128
      008473 80                    1861 	.db #0x80	; 128
      008474 00                    1862 	.db #0x00	; 0
      008475 00                    1863 	.db #0x00	; 0
      008476 00                    1864 	.db #0x00	; 0
      008477 19                    1865 	.db #0x19	; 25
      008478 24                    1866 	.db #0x24	; 36
      008479 22                    1867 	.db #0x22	; 34
      00847A 22                    1868 	.db #0x22	; 34
      00847B 22                    1869 	.db #0x22	; 34
      00847C 3F                    1870 	.db #0x3f	; 63
      00847D 20                    1871 	.db #0x20	; 32
      00847E 08                    1872 	.db #0x08	; 8
      00847F F8                    1873 	.db #0xf8	; 248
      008480 00                    1874 	.db #0x00	; 0
      008481 80                    1875 	.db #0x80	; 128
      008482 80                    1876 	.db #0x80	; 128
      008483 00                    1877 	.db #0x00	; 0
      008484 00                    1878 	.db #0x00	; 0
      008485 00                    1879 	.db #0x00	; 0
      008486 00                    1880 	.db #0x00	; 0
      008487 3F                    1881 	.db #0x3f	; 63
      008488 11                    1882 	.db #0x11	; 17
      008489 20                    1883 	.db #0x20	; 32
      00848A 20                    1884 	.db #0x20	; 32
      00848B 11                    1885 	.db #0x11	; 17
      00848C 0E                    1886 	.db #0x0e	; 14
      00848D 00                    1887 	.db #0x00	; 0
      00848E 00                    1888 	.db #0x00	; 0
      00848F 00                    1889 	.db #0x00	; 0
      008490 00                    1890 	.db #0x00	; 0
      008491 80                    1891 	.db #0x80	; 128
      008492 80                    1892 	.db #0x80	; 128
      008493 80                    1893 	.db #0x80	; 128
      008494 00                    1894 	.db #0x00	; 0
      008495 00                    1895 	.db #0x00	; 0
      008496 00                    1896 	.db #0x00	; 0
      008497 0E                    1897 	.db #0x0e	; 14
      008498 11                    1898 	.db #0x11	; 17
      008499 20                    1899 	.db #0x20	; 32
      00849A 20                    1900 	.db #0x20	; 32
      00849B 20                    1901 	.db #0x20	; 32
      00849C 11                    1902 	.db #0x11	; 17
      00849D 00                    1903 	.db #0x00	; 0
      00849E 00                    1904 	.db #0x00	; 0
      00849F 00                    1905 	.db #0x00	; 0
      0084A0 00                    1906 	.db #0x00	; 0
      0084A1 80                    1907 	.db #0x80	; 128
      0084A2 80                    1908 	.db #0x80	; 128
      0084A3 88                    1909 	.db #0x88	; 136
      0084A4 F8                    1910 	.db #0xf8	; 248
      0084A5 00                    1911 	.db #0x00	; 0
      0084A6 00                    1912 	.db #0x00	; 0
      0084A7 0E                    1913 	.db #0x0e	; 14
      0084A8 11                    1914 	.db #0x11	; 17
      0084A9 20                    1915 	.db #0x20	; 32
      0084AA 20                    1916 	.db #0x20	; 32
      0084AB 10                    1917 	.db #0x10	; 16
      0084AC 3F                    1918 	.db #0x3f	; 63
      0084AD 20                    1919 	.db #0x20	; 32
      0084AE 00                    1920 	.db #0x00	; 0
      0084AF 00                    1921 	.db #0x00	; 0
      0084B0 80                    1922 	.db #0x80	; 128
      0084B1 80                    1923 	.db #0x80	; 128
      0084B2 80                    1924 	.db #0x80	; 128
      0084B3 80                    1925 	.db #0x80	; 128
      0084B4 00                    1926 	.db #0x00	; 0
      0084B5 00                    1927 	.db #0x00	; 0
      0084B6 00                    1928 	.db #0x00	; 0
      0084B7 1F                    1929 	.db #0x1f	; 31
      0084B8 22                    1930 	.db #0x22	; 34
      0084B9 22                    1931 	.db #0x22	; 34
      0084BA 22                    1932 	.db #0x22	; 34
      0084BB 22                    1933 	.db #0x22	; 34
      0084BC 13                    1934 	.db #0x13	; 19
      0084BD 00                    1935 	.db #0x00	; 0
      0084BE 00                    1936 	.db #0x00	; 0
      0084BF 80                    1937 	.db #0x80	; 128
      0084C0 80                    1938 	.db #0x80	; 128
      0084C1 F0                    1939 	.db #0xf0	; 240
      0084C2 88                    1940 	.db #0x88	; 136
      0084C3 88                    1941 	.db #0x88	; 136
      0084C4 88                    1942 	.db #0x88	; 136
      0084C5 18                    1943 	.db #0x18	; 24
      0084C6 00                    1944 	.db #0x00	; 0
      0084C7 20                    1945 	.db #0x20	; 32
      0084C8 20                    1946 	.db #0x20	; 32
      0084C9 3F                    1947 	.db #0x3f	; 63
      0084CA 20                    1948 	.db #0x20	; 32
      0084CB 20                    1949 	.db #0x20	; 32
      0084CC 00                    1950 	.db #0x00	; 0
      0084CD 00                    1951 	.db #0x00	; 0
      0084CE 00                    1952 	.db #0x00	; 0
      0084CF 00                    1953 	.db #0x00	; 0
      0084D0 80                    1954 	.db #0x80	; 128
      0084D1 80                    1955 	.db #0x80	; 128
      0084D2 80                    1956 	.db #0x80	; 128
      0084D3 80                    1957 	.db #0x80	; 128
      0084D4 80                    1958 	.db #0x80	; 128
      0084D5 00                    1959 	.db #0x00	; 0
      0084D6 00                    1960 	.db #0x00	; 0
      0084D7 6B                    1961 	.db #0x6b	; 107	'k'
      0084D8 94                    1962 	.db #0x94	; 148
      0084D9 94                    1963 	.db #0x94	; 148
      0084DA 94                    1964 	.db #0x94	; 148
      0084DB 93                    1965 	.db #0x93	; 147
      0084DC 60                    1966 	.db #0x60	; 96
      0084DD 00                    1967 	.db #0x00	; 0
      0084DE 08                    1968 	.db #0x08	; 8
      0084DF F8                    1969 	.db #0xf8	; 248
      0084E0 00                    1970 	.db #0x00	; 0
      0084E1 80                    1971 	.db #0x80	; 128
      0084E2 80                    1972 	.db #0x80	; 128
      0084E3 80                    1973 	.db #0x80	; 128
      0084E4 00                    1974 	.db #0x00	; 0
      0084E5 00                    1975 	.db #0x00	; 0
      0084E6 20                    1976 	.db #0x20	; 32
      0084E7 3F                    1977 	.db #0x3f	; 63
      0084E8 21                    1978 	.db #0x21	; 33
      0084E9 00                    1979 	.db #0x00	; 0
      0084EA 00                    1980 	.db #0x00	; 0
      0084EB 20                    1981 	.db #0x20	; 32
      0084EC 3F                    1982 	.db #0x3f	; 63
      0084ED 20                    1983 	.db #0x20	; 32
      0084EE 00                    1984 	.db #0x00	; 0
      0084EF 80                    1985 	.db #0x80	; 128
      0084F0 98                    1986 	.db #0x98	; 152
      0084F1 98                    1987 	.db #0x98	; 152
      0084F2 00                    1988 	.db #0x00	; 0
      0084F3 00                    1989 	.db #0x00	; 0
      0084F4 00                    1990 	.db #0x00	; 0
      0084F5 00                    1991 	.db #0x00	; 0
      0084F6 00                    1992 	.db #0x00	; 0
      0084F7 20                    1993 	.db #0x20	; 32
      0084F8 20                    1994 	.db #0x20	; 32
      0084F9 3F                    1995 	.db #0x3f	; 63
      0084FA 20                    1996 	.db #0x20	; 32
      0084FB 20                    1997 	.db #0x20	; 32
      0084FC 00                    1998 	.db #0x00	; 0
      0084FD 00                    1999 	.db #0x00	; 0
      0084FE 00                    2000 	.db #0x00	; 0
      0084FF 00                    2001 	.db #0x00	; 0
      008500 00                    2002 	.db #0x00	; 0
      008501 80                    2003 	.db #0x80	; 128
      008502 98                    2004 	.db #0x98	; 152
      008503 98                    2005 	.db #0x98	; 152
      008504 00                    2006 	.db #0x00	; 0
      008505 00                    2007 	.db #0x00	; 0
      008506 00                    2008 	.db #0x00	; 0
      008507 C0                    2009 	.db #0xc0	; 192
      008508 80                    2010 	.db #0x80	; 128
      008509 80                    2011 	.db #0x80	; 128
      00850A 80                    2012 	.db #0x80	; 128
      00850B 7F                    2013 	.db #0x7f	; 127
      00850C 00                    2014 	.db #0x00	; 0
      00850D 00                    2015 	.db #0x00	; 0
      00850E 08                    2016 	.db #0x08	; 8
      00850F F8                    2017 	.db #0xf8	; 248
      008510 00                    2018 	.db #0x00	; 0
      008511 00                    2019 	.db #0x00	; 0
      008512 80                    2020 	.db #0x80	; 128
      008513 80                    2021 	.db #0x80	; 128
      008514 80                    2022 	.db #0x80	; 128
      008515 00                    2023 	.db #0x00	; 0
      008516 20                    2024 	.db #0x20	; 32
      008517 3F                    2025 	.db #0x3f	; 63
      008518 24                    2026 	.db #0x24	; 36
      008519 02                    2027 	.db #0x02	; 2
      00851A 2D                    2028 	.db #0x2d	; 45
      00851B 30                    2029 	.db #0x30	; 48	'0'
      00851C 20                    2030 	.db #0x20	; 32
      00851D 00                    2031 	.db #0x00	; 0
      00851E 00                    2032 	.db #0x00	; 0
      00851F 08                    2033 	.db #0x08	; 8
      008520 08                    2034 	.db #0x08	; 8
      008521 F8                    2035 	.db #0xf8	; 248
      008522 00                    2036 	.db #0x00	; 0
      008523 00                    2037 	.db #0x00	; 0
      008524 00                    2038 	.db #0x00	; 0
      008525 00                    2039 	.db #0x00	; 0
      008526 00                    2040 	.db #0x00	; 0
      008527 20                    2041 	.db #0x20	; 32
      008528 20                    2042 	.db #0x20	; 32
      008529 3F                    2043 	.db #0x3f	; 63
      00852A 20                    2044 	.db #0x20	; 32
      00852B 20                    2045 	.db #0x20	; 32
      00852C 00                    2046 	.db #0x00	; 0
      00852D 00                    2047 	.db #0x00	; 0
      00852E 80                    2048 	.db #0x80	; 128
      00852F 80                    2049 	.db #0x80	; 128
      008530 80                    2050 	.db #0x80	; 128
      008531 80                    2051 	.db #0x80	; 128
      008532 80                    2052 	.db #0x80	; 128
      008533 80                    2053 	.db #0x80	; 128
      008534 80                    2054 	.db #0x80	; 128
      008535 00                    2055 	.db #0x00	; 0
      008536 20                    2056 	.db #0x20	; 32
      008537 3F                    2057 	.db #0x3f	; 63
      008538 20                    2058 	.db #0x20	; 32
      008539 00                    2059 	.db #0x00	; 0
      00853A 3F                    2060 	.db #0x3f	; 63
      00853B 20                    2061 	.db #0x20	; 32
      00853C 00                    2062 	.db #0x00	; 0
      00853D 3F                    2063 	.db #0x3f	; 63
      00853E 80                    2064 	.db #0x80	; 128
      00853F 80                    2065 	.db #0x80	; 128
      008540 00                    2066 	.db #0x00	; 0
      008541 80                    2067 	.db #0x80	; 128
      008542 80                    2068 	.db #0x80	; 128
      008543 80                    2069 	.db #0x80	; 128
      008544 00                    2070 	.db #0x00	; 0
      008545 00                    2071 	.db #0x00	; 0
      008546 20                    2072 	.db #0x20	; 32
      008547 3F                    2073 	.db #0x3f	; 63
      008548 21                    2074 	.db #0x21	; 33
      008549 00                    2075 	.db #0x00	; 0
      00854A 00                    2076 	.db #0x00	; 0
      00854B 20                    2077 	.db #0x20	; 32
      00854C 3F                    2078 	.db #0x3f	; 63
      00854D 20                    2079 	.db #0x20	; 32
      00854E 00                    2080 	.db #0x00	; 0
      00854F 00                    2081 	.db #0x00	; 0
      008550 80                    2082 	.db #0x80	; 128
      008551 80                    2083 	.db #0x80	; 128
      008552 80                    2084 	.db #0x80	; 128
      008553 80                    2085 	.db #0x80	; 128
      008554 00                    2086 	.db #0x00	; 0
      008555 00                    2087 	.db #0x00	; 0
      008556 00                    2088 	.db #0x00	; 0
      008557 1F                    2089 	.db #0x1f	; 31
      008558 20                    2090 	.db #0x20	; 32
      008559 20                    2091 	.db #0x20	; 32
      00855A 20                    2092 	.db #0x20	; 32
      00855B 20                    2093 	.db #0x20	; 32
      00855C 1F                    2094 	.db #0x1f	; 31
      00855D 00                    2095 	.db #0x00	; 0
      00855E 80                    2096 	.db #0x80	; 128
      00855F 80                    2097 	.db #0x80	; 128
      008560 00                    2098 	.db #0x00	; 0
      008561 80                    2099 	.db #0x80	; 128
      008562 80                    2100 	.db #0x80	; 128
      008563 00                    2101 	.db #0x00	; 0
      008564 00                    2102 	.db #0x00	; 0
      008565 00                    2103 	.db #0x00	; 0
      008566 80                    2104 	.db #0x80	; 128
      008567 FF                    2105 	.db #0xff	; 255
      008568 A1                    2106 	.db #0xa1	; 161
      008569 20                    2107 	.db #0x20	; 32
      00856A 20                    2108 	.db #0x20	; 32
      00856B 11                    2109 	.db #0x11	; 17
      00856C 0E                    2110 	.db #0x0e	; 14
      00856D 00                    2111 	.db #0x00	; 0
      00856E 00                    2112 	.db #0x00	; 0
      00856F 00                    2113 	.db #0x00	; 0
      008570 00                    2114 	.db #0x00	; 0
      008571 80                    2115 	.db #0x80	; 128
      008572 80                    2116 	.db #0x80	; 128
      008573 80                    2117 	.db #0x80	; 128
      008574 80                    2118 	.db #0x80	; 128
      008575 00                    2119 	.db #0x00	; 0
      008576 00                    2120 	.db #0x00	; 0
      008577 0E                    2121 	.db #0x0e	; 14
      008578 11                    2122 	.db #0x11	; 17
      008579 20                    2123 	.db #0x20	; 32
      00857A 20                    2124 	.db #0x20	; 32
      00857B A0                    2125 	.db #0xa0	; 160
      00857C FF                    2126 	.db #0xff	; 255
      00857D 80                    2127 	.db #0x80	; 128
      00857E 80                    2128 	.db #0x80	; 128
      00857F 80                    2129 	.db #0x80	; 128
      008580 80                    2130 	.db #0x80	; 128
      008581 00                    2131 	.db #0x00	; 0
      008582 80                    2132 	.db #0x80	; 128
      008583 80                    2133 	.db #0x80	; 128
      008584 80                    2134 	.db #0x80	; 128
      008585 00                    2135 	.db #0x00	; 0
      008586 20                    2136 	.db #0x20	; 32
      008587 20                    2137 	.db #0x20	; 32
      008588 3F                    2138 	.db #0x3f	; 63
      008589 21                    2139 	.db #0x21	; 33
      00858A 20                    2140 	.db #0x20	; 32
      00858B 00                    2141 	.db #0x00	; 0
      00858C 01                    2142 	.db #0x01	; 1
      00858D 00                    2143 	.db #0x00	; 0
      00858E 00                    2144 	.db #0x00	; 0
      00858F 00                    2145 	.db #0x00	; 0
      008590 80                    2146 	.db #0x80	; 128
      008591 80                    2147 	.db #0x80	; 128
      008592 80                    2148 	.db #0x80	; 128
      008593 80                    2149 	.db #0x80	; 128
      008594 80                    2150 	.db #0x80	; 128
      008595 00                    2151 	.db #0x00	; 0
      008596 00                    2152 	.db #0x00	; 0
      008597 33                    2153 	.db #0x33	; 51	'3'
      008598 24                    2154 	.db #0x24	; 36
      008599 24                    2155 	.db #0x24	; 36
      00859A 24                    2156 	.db #0x24	; 36
      00859B 24                    2157 	.db #0x24	; 36
      00859C 19                    2158 	.db #0x19	; 25
      00859D 00                    2159 	.db #0x00	; 0
      00859E 00                    2160 	.db #0x00	; 0
      00859F 80                    2161 	.db #0x80	; 128
      0085A0 80                    2162 	.db #0x80	; 128
      0085A1 E0                    2163 	.db #0xe0	; 224
      0085A2 80                    2164 	.db #0x80	; 128
      0085A3 80                    2165 	.db #0x80	; 128
      0085A4 00                    2166 	.db #0x00	; 0
      0085A5 00                    2167 	.db #0x00	; 0
      0085A6 00                    2168 	.db #0x00	; 0
      0085A7 00                    2169 	.db #0x00	; 0
      0085A8 00                    2170 	.db #0x00	; 0
      0085A9 1F                    2171 	.db #0x1f	; 31
      0085AA 20                    2172 	.db #0x20	; 32
      0085AB 20                    2173 	.db #0x20	; 32
      0085AC 00                    2174 	.db #0x00	; 0
      0085AD 00                    2175 	.db #0x00	; 0
      0085AE 80                    2176 	.db #0x80	; 128
      0085AF 80                    2177 	.db #0x80	; 128
      0085B0 00                    2178 	.db #0x00	; 0
      0085B1 00                    2179 	.db #0x00	; 0
      0085B2 00                    2180 	.db #0x00	; 0
      0085B3 80                    2181 	.db #0x80	; 128
      0085B4 80                    2182 	.db #0x80	; 128
      0085B5 00                    2183 	.db #0x00	; 0
      0085B6 00                    2184 	.db #0x00	; 0
      0085B7 1F                    2185 	.db #0x1f	; 31
      0085B8 20                    2186 	.db #0x20	; 32
      0085B9 20                    2187 	.db #0x20	; 32
      0085BA 20                    2188 	.db #0x20	; 32
      0085BB 10                    2189 	.db #0x10	; 16
      0085BC 3F                    2190 	.db #0x3f	; 63
      0085BD 20                    2191 	.db #0x20	; 32
      0085BE 80                    2192 	.db #0x80	; 128
      0085BF 80                    2193 	.db #0x80	; 128
      0085C0 80                    2194 	.db #0x80	; 128
      0085C1 00                    2195 	.db #0x00	; 0
      0085C2 00                    2196 	.db #0x00	; 0
      0085C3 80                    2197 	.db #0x80	; 128
      0085C4 80                    2198 	.db #0x80	; 128
      0085C5 80                    2199 	.db #0x80	; 128
      0085C6 00                    2200 	.db #0x00	; 0
      0085C7 01                    2201 	.db #0x01	; 1
      0085C8 0E                    2202 	.db #0x0e	; 14
      0085C9 30                    2203 	.db #0x30	; 48	'0'
      0085CA 08                    2204 	.db #0x08	; 8
      0085CB 06                    2205 	.db #0x06	; 6
      0085CC 01                    2206 	.db #0x01	; 1
      0085CD 00                    2207 	.db #0x00	; 0
      0085CE 80                    2208 	.db #0x80	; 128
      0085CF 80                    2209 	.db #0x80	; 128
      0085D0 00                    2210 	.db #0x00	; 0
      0085D1 80                    2211 	.db #0x80	; 128
      0085D2 00                    2212 	.db #0x00	; 0
      0085D3 80                    2213 	.db #0x80	; 128
      0085D4 80                    2214 	.db #0x80	; 128
      0085D5 80                    2215 	.db #0x80	; 128
      0085D6 0F                    2216 	.db #0x0f	; 15
      0085D7 30                    2217 	.db #0x30	; 48	'0'
      0085D8 0C                    2218 	.db #0x0c	; 12
      0085D9 03                    2219 	.db #0x03	; 3
      0085DA 0C                    2220 	.db #0x0c	; 12
      0085DB 30                    2221 	.db #0x30	; 48	'0'
      0085DC 0F                    2222 	.db #0x0f	; 15
      0085DD 00                    2223 	.db #0x00	; 0
      0085DE 00                    2224 	.db #0x00	; 0
      0085DF 80                    2225 	.db #0x80	; 128
      0085E0 80                    2226 	.db #0x80	; 128
      0085E1 00                    2227 	.db #0x00	; 0
      0085E2 80                    2228 	.db #0x80	; 128
      0085E3 80                    2229 	.db #0x80	; 128
      0085E4 80                    2230 	.db #0x80	; 128
      0085E5 00                    2231 	.db #0x00	; 0
      0085E6 00                    2232 	.db #0x00	; 0
      0085E7 20                    2233 	.db #0x20	; 32
      0085E8 31                    2234 	.db #0x31	; 49	'1'
      0085E9 2E                    2235 	.db #0x2e	; 46
      0085EA 0E                    2236 	.db #0x0e	; 14
      0085EB 31                    2237 	.db #0x31	; 49	'1'
      0085EC 20                    2238 	.db #0x20	; 32
      0085ED 00                    2239 	.db #0x00	; 0
      0085EE 80                    2240 	.db #0x80	; 128
      0085EF 80                    2241 	.db #0x80	; 128
      0085F0 80                    2242 	.db #0x80	; 128
      0085F1 00                    2243 	.db #0x00	; 0
      0085F2 00                    2244 	.db #0x00	; 0
      0085F3 80                    2245 	.db #0x80	; 128
      0085F4 80                    2246 	.db #0x80	; 128
      0085F5 80                    2247 	.db #0x80	; 128
      0085F6 80                    2248 	.db #0x80	; 128
      0085F7 81                    2249 	.db #0x81	; 129
      0085F8 8E                    2250 	.db #0x8e	; 142
      0085F9 70                    2251 	.db #0x70	; 112	'p'
      0085FA 18                    2252 	.db #0x18	; 24
      0085FB 06                    2253 	.db #0x06	; 6
      0085FC 01                    2254 	.db #0x01	; 1
      0085FD 00                    2255 	.db #0x00	; 0
      0085FE 00                    2256 	.db #0x00	; 0
      0085FF 80                    2257 	.db #0x80	; 128
      008600 80                    2258 	.db #0x80	; 128
      008601 80                    2259 	.db #0x80	; 128
      008602 80                    2260 	.db #0x80	; 128
      008603 80                    2261 	.db #0x80	; 128
      008604 80                    2262 	.db #0x80	; 128
      008605 00                    2263 	.db #0x00	; 0
      008606 00                    2264 	.db #0x00	; 0
      008607 21                    2265 	.db #0x21	; 33
      008608 30                    2266 	.db #0x30	; 48	'0'
      008609 2C                    2267 	.db #0x2c	; 44
      00860A 22                    2268 	.db #0x22	; 34
      00860B 21                    2269 	.db #0x21	; 33
      00860C 30                    2270 	.db #0x30	; 48	'0'
      00860D 00                    2271 	.db #0x00	; 0
      00860E 00                    2272 	.db #0x00	; 0
      00860F 00                    2273 	.db #0x00	; 0
      008610 00                    2274 	.db #0x00	; 0
      008611 00                    2275 	.db #0x00	; 0
      008612 80                    2276 	.db #0x80	; 128
      008613 7C                    2277 	.db #0x7c	; 124
      008614 02                    2278 	.db #0x02	; 2
      008615 02                    2279 	.db #0x02	; 2
      008616 00                    2280 	.db #0x00	; 0
      008617 00                    2281 	.db #0x00	; 0
      008618 00                    2282 	.db #0x00	; 0
      008619 00                    2283 	.db #0x00	; 0
      00861A 00                    2284 	.db #0x00	; 0
      00861B 3F                    2285 	.db #0x3f	; 63
      00861C 40                    2286 	.db #0x40	; 64
      00861D 40                    2287 	.db #0x40	; 64
      00861E 00                    2288 	.db #0x00	; 0
      00861F 00                    2289 	.db #0x00	; 0
      008620 00                    2290 	.db #0x00	; 0
      008621 00                    2291 	.db #0x00	; 0
      008622 FF                    2292 	.db #0xff	; 255
      008623 00                    2293 	.db #0x00	; 0
      008624 00                    2294 	.db #0x00	; 0
      008625 00                    2295 	.db #0x00	; 0
      008626 00                    2296 	.db #0x00	; 0
      008627 00                    2297 	.db #0x00	; 0
      008628 00                    2298 	.db #0x00	; 0
      008629 00                    2299 	.db #0x00	; 0
      00862A FF                    2300 	.db #0xff	; 255
      00862B 00                    2301 	.db #0x00	; 0
      00862C 00                    2302 	.db #0x00	; 0
      00862D 00                    2303 	.db #0x00	; 0
      00862E 00                    2304 	.db #0x00	; 0
      00862F 02                    2305 	.db #0x02	; 2
      008630 02                    2306 	.db #0x02	; 2
      008631 7C                    2307 	.db #0x7c	; 124
      008632 80                    2308 	.db #0x80	; 128
      008633 00                    2309 	.db #0x00	; 0
      008634 00                    2310 	.db #0x00	; 0
      008635 00                    2311 	.db #0x00	; 0
      008636 00                    2312 	.db #0x00	; 0
      008637 40                    2313 	.db #0x40	; 64
      008638 40                    2314 	.db #0x40	; 64
      008639 3F                    2315 	.db #0x3f	; 63
      00863A 00                    2316 	.db #0x00	; 0
      00863B 00                    2317 	.db #0x00	; 0
      00863C 00                    2318 	.db #0x00	; 0
      00863D 00                    2319 	.db #0x00	; 0
      00863E 00                    2320 	.db #0x00	; 0
      00863F 06                    2321 	.db #0x06	; 6
      008640 01                    2322 	.db #0x01	; 1
      008641 01                    2323 	.db #0x01	; 1
      008642 02                    2324 	.db #0x02	; 2
      008643 02                    2325 	.db #0x02	; 2
      008644 04                    2326 	.db #0x04	; 4
      008645 04                    2327 	.db #0x04	; 4
      008646 00                    2328 	.db #0x00	; 0
      008647 00                    2329 	.db #0x00	; 0
      008648 00                    2330 	.db #0x00	; 0
      008649 00                    2331 	.db #0x00	; 0
      00864A 00                    2332 	.db #0x00	; 0
      00864B 00                    2333 	.db #0x00	; 0
      00864C 00                    2334 	.db #0x00	; 0
      00864D 00                    2335 	.db #0x00	; 0
                                   2336 	.area INITIALIZER
                                   2337 	.area CABS (ABS)
