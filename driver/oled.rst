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
      00901F                         67 _delay_ms:
      00901F 52 02            [ 2]   68 	sub	sp, #2
                                     69 ;	driver/oled.c: 48: while(ms)
      009021 16 05            [ 2]   70 	ldw	y, (0x05, sp)
      009023 17 01            [ 2]   71 	ldw	(0x01, sp), y
      009025                         72 00104$:
      009025 1E 01            [ 2]   73 	ldw	x, (0x01, sp)
      009027 27 11            [ 1]   74 	jreq	00106$
                                     75 ;	driver/oled.c: 51: while(a--);
      009029 AE 07 08         [ 2]   76 	ldw	x, #0x0708
      00902C                         77 00101$:
      00902C 90 93            [ 1]   78 	ldw	y, x
      00902E 5A               [ 2]   79 	decw	x
      00902F 90 5D            [ 2]   80 	tnzw	y
      009031 26 F9            [ 1]   81 	jrne	00101$
                                     82 ;	driver/oled.c: 52: ms--;
      009033 1E 01            [ 2]   83 	ldw	x, (0x01, sp)
      009035 5A               [ 2]   84 	decw	x
      009036 1F 01            [ 2]   85 	ldw	(0x01, sp), x
      009038 20 EB            [ 2]   86 	jra	00104$
      00903A                         87 00106$:
                                     88 ;	driver/oled.c: 54: return;
                                     89 ;	driver/oled.c: 55: }
      00903A 5B 02            [ 2]   90 	addw	sp, #2
      00903C 81               [ 4]   91 	ret
                                     92 ;	driver/oled.c: 77: void OLED_WR_Byte(u8 dat,u8 cmd)
                                     93 ;	-----------------------------------------
                                     94 ;	 function OLED_WR_Byte
                                     95 ;	-----------------------------------------
      00903D                         96 _OLED_WR_Byte:
      00903D 88               [ 1]   97 	push	a
                                     98 ;	driver/oled.c: 80: if(cmd)
      00903E 0D 05            [ 1]   99 	tnz	(0x05, sp)
      009040 27 0D            [ 1]  100 	jreq	00102$
                                    101 ;	driver/oled.c: 81: OLED_DC_Set();
      009042 4B 10            [ 1]  102 	push	#0x10
      009044 4B 0A            [ 1]  103 	push	#0x0a
      009046 4B 50            [ 1]  104 	push	#0x50
      009048 CD 95 49         [ 4]  105 	call	_GPIO_WriteHigh
      00904B 5B 03            [ 2]  106 	addw	sp, #3
      00904D 20 0B            [ 2]  107 	jra	00103$
      00904F                        108 00102$:
                                    109 ;	driver/oled.c: 83: OLED_DC_Clr();
      00904F 4B 10            [ 1]  110 	push	#0x10
      009051 4B 0A            [ 1]  111 	push	#0x0a
      009053 4B 50            [ 1]  112 	push	#0x50
      009055 CD 95 50         [ 4]  113 	call	_GPIO_WriteLow
      009058 5B 03            [ 2]  114 	addw	sp, #3
      00905A                        115 00103$:
                                    116 ;	driver/oled.c: 84: OLED_CS_Clr();
      00905A 4B 20            [ 1]  117 	push	#0x20
      00905C 4B 0A            [ 1]  118 	push	#0x0a
      00905E 4B 50            [ 1]  119 	push	#0x50
      009060 CD 95 50         [ 4]  120 	call	_GPIO_WriteLow
      009063 5B 03            [ 2]  121 	addw	sp, #3
                                    122 ;	driver/oled.c: 85: for(i=0;i<8;i++)
      009065 0F 01            [ 1]  123 	clr	(0x01, sp)
      009067                        124 00108$:
                                    125 ;	driver/oled.c: 87: OLED_SCLK_Clr();
      009067 4B 02            [ 1]  126 	push	#0x02
      009069 4B 0A            [ 1]  127 	push	#0x0a
      00906B 4B 50            [ 1]  128 	push	#0x50
      00906D CD 95 50         [ 4]  129 	call	_GPIO_WriteLow
      009070 5B 03            [ 2]  130 	addw	sp, #3
                                    131 ;	driver/oled.c: 88: if(dat&0x80)
      009072 7B 04            [ 1]  132 	ld	a, (0x04, sp)
      009074 2A 0D            [ 1]  133 	jrpl	00105$
                                    134 ;	driver/oled.c: 90: OLED_SDIN_Set();
      009076 4B 04            [ 1]  135 	push	#0x04
      009078 4B 0A            [ 1]  136 	push	#0x0a
      00907A 4B 50            [ 1]  137 	push	#0x50
      00907C CD 95 49         [ 4]  138 	call	_GPIO_WriteHigh
      00907F 5B 03            [ 2]  139 	addw	sp, #3
      009081 20 0B            [ 2]  140 	jra	00106$
      009083                        141 00105$:
                                    142 ;	driver/oled.c: 93: OLED_SDIN_Clr();
      009083 4B 04            [ 1]  143 	push	#0x04
      009085 4B 0A            [ 1]  144 	push	#0x0a
      009087 4B 50            [ 1]  145 	push	#0x50
      009089 CD 95 50         [ 4]  146 	call	_GPIO_WriteLow
      00908C 5B 03            [ 2]  147 	addw	sp, #3
      00908E                        148 00106$:
                                    149 ;	driver/oled.c: 94: OLED_SCLK_Set();
      00908E 4B 02            [ 1]  150 	push	#0x02
      009090 4B 0A            [ 1]  151 	push	#0x0a
      009092 4B 50            [ 1]  152 	push	#0x50
      009094 CD 95 49         [ 4]  153 	call	_GPIO_WriteHigh
      009097 5B 03            [ 2]  154 	addw	sp, #3
                                    155 ;	driver/oled.c: 95: dat<<=1;
      009099 08 04            [ 1]  156 	sll	(0x04, sp)
                                    157 ;	driver/oled.c: 85: for(i=0;i<8;i++)
      00909B 0C 01            [ 1]  158 	inc	(0x01, sp)
      00909D 7B 01            [ 1]  159 	ld	a, (0x01, sp)
      00909F A1 08            [ 1]  160 	cp	a, #0x08
      0090A1 25 C4            [ 1]  161 	jrc	00108$
                                    162 ;	driver/oled.c: 97: OLED_CS_Set();
      0090A3 4B 20            [ 1]  163 	push	#0x20
      0090A5 4B 0A            [ 1]  164 	push	#0x0a
      0090A7 4B 50            [ 1]  165 	push	#0x50
      0090A9 CD 95 49         [ 4]  166 	call	_GPIO_WriteHigh
      0090AC 5B 03            [ 2]  167 	addw	sp, #3
                                    168 ;	driver/oled.c: 98: OLED_DC_Set();
      0090AE 4B 10            [ 1]  169 	push	#0x10
      0090B0 4B 0A            [ 1]  170 	push	#0x0a
      0090B2 4B 50            [ 1]  171 	push	#0x50
      0090B4 CD 95 49         [ 4]  172 	call	_GPIO_WriteHigh
                                    173 ;	driver/oled.c: 99: }
      0090B7 5B 04            [ 2]  174 	addw	sp, #4
      0090B9 81               [ 4]  175 	ret
                                    176 ;	driver/oled.c: 101: void OLED_Set_Pos(unsigned char x, unsigned char y)
                                    177 ;	-----------------------------------------
                                    178 ;	 function OLED_Set_Pos
                                    179 ;	-----------------------------------------
      0090BA                        180 _OLED_Set_Pos:
      0090BA 52 02            [ 2]  181 	sub	sp, #2
                                    182 ;	driver/oled.c: 103: OLED_WR_Byte(0xb0+y,OLED_CMD);
      0090BC 7B 06            [ 1]  183 	ld	a, (0x06, sp)
      0090BE AB B0            [ 1]  184 	add	a, #0xb0
      0090C0 4B 00            [ 1]  185 	push	#0x00
      0090C2 88               [ 1]  186 	push	a
      0090C3 CD 90 3D         [ 4]  187 	call	_OLED_WR_Byte
      0090C6 5B 02            [ 2]  188 	addw	sp, #2
                                    189 ;	driver/oled.c: 104: OLED_WR_Byte(((x&0xf0)>>4)|0x10,OLED_CMD);
      0090C8 7B 05            [ 1]  190 	ld	a, (0x05, sp)
      0090CA 0F 01            [ 1]  191 	clr	(0x01, sp)
      0090CC 88               [ 1]  192 	push	a
      0090CD A4 F0            [ 1]  193 	and	a, #0xf0
      0090CF 97               [ 1]  194 	ld	xl, a
      0090D0 4F               [ 1]  195 	clr	a
      0090D1 95               [ 1]  196 	ld	xh, a
      0090D2 84               [ 1]  197 	pop	a
      0090D3 57               [ 2]  198 	sraw	x
      0090D4 57               [ 2]  199 	sraw	x
      0090D5 57               [ 2]  200 	sraw	x
      0090D6 57               [ 2]  201 	sraw	x
      0090D7 88               [ 1]  202 	push	a
      0090D8 9F               [ 1]  203 	ld	a, xl
      0090D9 AA 10            [ 1]  204 	or	a, #0x10
      0090DB 97               [ 1]  205 	ld	xl, a
      0090DC 4B 00            [ 1]  206 	push	#0x00
      0090DE 89               [ 2]  207 	pushw	x
      0090DF 5B 01            [ 2]  208 	addw	sp, #1
      0090E1 CD 90 3D         [ 4]  209 	call	_OLED_WR_Byte
      0090E4 5B 02            [ 2]  210 	addw	sp, #2
      0090E6 84               [ 1]  211 	pop	a
                                    212 ;	driver/oled.c: 105: OLED_WR_Byte((x&0x0f)|0x01,OLED_CMD);
      0090E7 A4 0F            [ 1]  213 	and	a, #0x0f
      0090E9 95               [ 1]  214 	ld	xh, a
      0090EA 4F               [ 1]  215 	clr	a
      0090EB 02               [ 1]  216 	rlwa	x
      0090EC AA 01            [ 1]  217 	or	a, #0x01
      0090EE 4B 00            [ 1]  218 	push	#0x00
      0090F0 88               [ 1]  219 	push	a
      0090F1 CD 90 3D         [ 4]  220 	call	_OLED_WR_Byte
                                    221 ;	driver/oled.c: 106: }
      0090F4 5B 04            [ 2]  222 	addw	sp, #4
      0090F6 81               [ 4]  223 	ret
                                    224 ;	driver/oled.c: 108: void OLED_Display_On(void)
                                    225 ;	-----------------------------------------
                                    226 ;	 function OLED_Display_On
                                    227 ;	-----------------------------------------
      0090F7                        228 _OLED_Display_On:
                                    229 ;	driver/oled.c: 110: OLED_WR_Byte(0X8D,OLED_CMD);  //SET DCDC命令
      0090F7 4B 00            [ 1]  230 	push	#0x00
      0090F9 4B 8D            [ 1]  231 	push	#0x8d
      0090FB CD 90 3D         [ 4]  232 	call	_OLED_WR_Byte
      0090FE 5B 02            [ 2]  233 	addw	sp, #2
                                    234 ;	driver/oled.c: 111: OLED_WR_Byte(0X14,OLED_CMD);  //DCDC ON
      009100 4B 00            [ 1]  235 	push	#0x00
      009102 4B 14            [ 1]  236 	push	#0x14
      009104 CD 90 3D         [ 4]  237 	call	_OLED_WR_Byte
      009107 5B 02            [ 2]  238 	addw	sp, #2
                                    239 ;	driver/oled.c: 112: OLED_WR_Byte(0XAF,OLED_CMD);  //DISPLAY ON
      009109 4B 00            [ 1]  240 	push	#0x00
      00910B 4B AF            [ 1]  241 	push	#0xaf
      00910D CD 90 3D         [ 4]  242 	call	_OLED_WR_Byte
      009110 5B 02            [ 2]  243 	addw	sp, #2
                                    244 ;	driver/oled.c: 113: }
      009112 81               [ 4]  245 	ret
                                    246 ;	driver/oled.c: 115: void OLED_Display_Off(void)
                                    247 ;	-----------------------------------------
                                    248 ;	 function OLED_Display_Off
                                    249 ;	-----------------------------------------
      009113                        250 _OLED_Display_Off:
                                    251 ;	driver/oled.c: 117: OLED_WR_Byte(0X8D,OLED_CMD);  //SET DCDC命令
      009113 4B 00            [ 1]  252 	push	#0x00
      009115 4B 8D            [ 1]  253 	push	#0x8d
      009117 CD 90 3D         [ 4]  254 	call	_OLED_WR_Byte
      00911A 5B 02            [ 2]  255 	addw	sp, #2
                                    256 ;	driver/oled.c: 118: OLED_WR_Byte(0X10,OLED_CMD);  //DCDC OFF
      00911C 4B 00            [ 1]  257 	push	#0x00
      00911E 4B 10            [ 1]  258 	push	#0x10
      009120 CD 90 3D         [ 4]  259 	call	_OLED_WR_Byte
      009123 5B 02            [ 2]  260 	addw	sp, #2
                                    261 ;	driver/oled.c: 119: OLED_WR_Byte(0XAE,OLED_CMD);  //DISPLAY OFF
      009125 4B 00            [ 1]  262 	push	#0x00
      009127 4B AE            [ 1]  263 	push	#0xae
      009129 CD 90 3D         [ 4]  264 	call	_OLED_WR_Byte
      00912C 5B 02            [ 2]  265 	addw	sp, #2
                                    266 ;	driver/oled.c: 120: }
      00912E 81               [ 4]  267 	ret
                                    268 ;	driver/oled.c: 122: void OLED_Clear(void)
                                    269 ;	-----------------------------------------
                                    270 ;	 function OLED_Clear
                                    271 ;	-----------------------------------------
      00912F                        272 _OLED_Clear:
      00912F 88               [ 1]  273 	push	a
                                    274 ;	driver/oled.c: 125: for(i=0;i<8;i++)
      009130 0F 01            [ 1]  275 	clr	(0x01, sp)
      009132                        276 00105$:
                                    277 ;	driver/oled.c: 127: OLED_WR_Byte (0xb0+i,OLED_CMD);    //设置页地址（0~7）
      009132 7B 01            [ 1]  278 	ld	a, (0x01, sp)
      009134 AB B0            [ 1]  279 	add	a, #0xb0
      009136 4B 00            [ 1]  280 	push	#0x00
      009138 88               [ 1]  281 	push	a
      009139 CD 90 3D         [ 4]  282 	call	_OLED_WR_Byte
      00913C 5B 02            [ 2]  283 	addw	sp, #2
                                    284 ;	driver/oled.c: 128: OLED_WR_Byte (0x00,OLED_CMD);      //设置显示位置—列低地址
      00913E 4B 00            [ 1]  285 	push	#0x00
      009140 4B 00            [ 1]  286 	push	#0x00
      009142 CD 90 3D         [ 4]  287 	call	_OLED_WR_Byte
      009145 5B 02            [ 2]  288 	addw	sp, #2
                                    289 ;	driver/oled.c: 129: OLED_WR_Byte (0x10,OLED_CMD);      //设置显示位置—列高地址
      009147 4B 00            [ 1]  290 	push	#0x00
      009149 4B 10            [ 1]  291 	push	#0x10
      00914B CD 90 3D         [ 4]  292 	call	_OLED_WR_Byte
      00914E 5B 02            [ 2]  293 	addw	sp, #2
                                    294 ;	driver/oled.c: 130: for(n=0;n<128;n++)OLED_WR_Byte(0,OLED_DATA);
      009150 4F               [ 1]  295 	clr	a
      009151                        296 00103$:
      009151 88               [ 1]  297 	push	a
      009152 4B 01            [ 1]  298 	push	#0x01
      009154 4B 00            [ 1]  299 	push	#0x00
      009156 CD 90 3D         [ 4]  300 	call	_OLED_WR_Byte
      009159 5B 02            [ 2]  301 	addw	sp, #2
      00915B 84               [ 1]  302 	pop	a
      00915C 4C               [ 1]  303 	inc	a
      00915D A1 80            [ 1]  304 	cp	a, #0x80
      00915F 25 F0            [ 1]  305 	jrc	00103$
                                    306 ;	driver/oled.c: 125: for(i=0;i<8;i++)
      009161 0C 01            [ 1]  307 	inc	(0x01, sp)
      009163 7B 01            [ 1]  308 	ld	a, (0x01, sp)
      009165 A1 08            [ 1]  309 	cp	a, #0x08
      009167 25 C9            [ 1]  310 	jrc	00105$
                                    311 ;	driver/oled.c: 132: }
      009169 84               [ 1]  312 	pop	a
      00916A 81               [ 4]  313 	ret
                                    314 ;	driver/oled.c: 140: void OLED_ShowChar(u8 x,u8 y,u8 chr)
                                    315 ;	-----------------------------------------
                                    316 ;	 function OLED_ShowChar
                                    317 ;	-----------------------------------------
      00916B                        318 _OLED_ShowChar:
      00916B 52 04            [ 2]  319 	sub	sp, #4
                                    320 ;	driver/oled.c: 143: c=chr-' ';//得到偏移后的值
      00916D 7B 09            [ 1]  321 	ld	a, (0x09, sp)
      00916F A0 20            [ 1]  322 	sub	a, #0x20
      009171 6B 04            [ 1]  323 	ld	(0x04, sp), a
                                    324 ;	driver/oled.c: 144: if(x>Max_Column-1){x=0;y=y+2;}
      009173 7B 07            [ 1]  325 	ld	a, (0x07, sp)
      009175 A1 7F            [ 1]  326 	cp	a, #0x7f
      009177 23 08            [ 2]  327 	jrule	00102$
      009179 0F 07            [ 1]  328 	clr	(0x07, sp)
      00917B 7B 08            [ 1]  329 	ld	a, (0x08, sp)
      00917D AB 02            [ 1]  330 	add	a, #0x02
      00917F 6B 08            [ 1]  331 	ld	(0x08, sp), a
      009181                        332 00102$:
                                    333 ;	driver/oled.c: 147: OLED_Set_Pos(x,y);
      009181 7B 08            [ 1]  334 	ld	a, (0x08, sp)
      009183 88               [ 1]  335 	push	a
      009184 7B 08            [ 1]  336 	ld	a, (0x08, sp)
      009186 88               [ 1]  337 	push	a
      009187 CD 90 BA         [ 4]  338 	call	_OLED_Set_Pos
      00918A 5B 02            [ 2]  339 	addw	sp, #2
                                    340 ;	driver/oled.c: 148: for(i=0;i<8;i++)
      00918C 0F 03            [ 1]  341 	clr	(0x03, sp)
      00918E                        342 00105$:
                                    343 ;	driver/oled.c: 149: OLED_WR_Byte(F8X16[c*16+i],OLED_DATA);
      00918E 5F               [ 1]  344 	clrw	x
      00918F 7B 04            [ 1]  345 	ld	a, (0x04, sp)
      009191 97               [ 1]  346 	ld	xl, a
      009192 58               [ 2]  347 	sllw	x
      009193 58               [ 2]  348 	sllw	x
      009194 58               [ 2]  349 	sllw	x
      009195 58               [ 2]  350 	sllw	x
      009196 1F 01            [ 2]  351 	ldw	(0x01, sp), x
      009198 5F               [ 1]  352 	clrw	x
      009199 7B 03            [ 1]  353 	ld	a, (0x03, sp)
      00919B 97               [ 1]  354 	ld	xl, a
      00919C 72 FB 01         [ 2]  355 	addw	x, (0x01, sp)
      00919F 1C 80 79         [ 2]  356 	addw	x, #_F8X16
      0091A2 F6               [ 1]  357 	ld	a, (x)
      0091A3 4B 01            [ 1]  358 	push	#0x01
      0091A5 88               [ 1]  359 	push	a
      0091A6 CD 90 3D         [ 4]  360 	call	_OLED_WR_Byte
      0091A9 5B 02            [ 2]  361 	addw	sp, #2
                                    362 ;	driver/oled.c: 148: for(i=0;i<8;i++)
      0091AB 0C 03            [ 1]  363 	inc	(0x03, sp)
      0091AD 7B 03            [ 1]  364 	ld	a, (0x03, sp)
      0091AF A1 08            [ 1]  365 	cp	a, #0x08
      0091B1 25 DB            [ 1]  366 	jrc	00105$
                                    367 ;	driver/oled.c: 150: OLED_Set_Pos(x,y+1);
      0091B3 7B 08            [ 1]  368 	ld	a, (0x08, sp)
      0091B5 4C               [ 1]  369 	inc	a
      0091B6 88               [ 1]  370 	push	a
      0091B7 7B 08            [ 1]  371 	ld	a, (0x08, sp)
      0091B9 88               [ 1]  372 	push	a
      0091BA CD 90 BA         [ 4]  373 	call	_OLED_Set_Pos
      0091BD 5B 02            [ 2]  374 	addw	sp, #2
                                    375 ;	driver/oled.c: 151: for(i=0;i<8;i++)
      0091BF 0F 03            [ 1]  376 	clr	(0x03, sp)
      0091C1                        377 00107$:
                                    378 ;	driver/oled.c: 152: OLED_WR_Byte(F8X16[c*16+i+8],OLED_DATA);
      0091C1 5F               [ 1]  379 	clrw	x
      0091C2 7B 03            [ 1]  380 	ld	a, (0x03, sp)
      0091C4 97               [ 1]  381 	ld	xl, a
      0091C5 72 FB 01         [ 2]  382 	addw	x, (0x01, sp)
      0091C8 1C 00 08         [ 2]  383 	addw	x, #0x0008
      0091CB 1C 80 79         [ 2]  384 	addw	x, #_F8X16
      0091CE F6               [ 1]  385 	ld	a, (x)
      0091CF 4B 01            [ 1]  386 	push	#0x01
      0091D1 88               [ 1]  387 	push	a
      0091D2 CD 90 3D         [ 4]  388 	call	_OLED_WR_Byte
      0091D5 5B 02            [ 2]  389 	addw	sp, #2
                                    390 ;	driver/oled.c: 151: for(i=0;i<8;i++)
      0091D7 0C 03            [ 1]  391 	inc	(0x03, sp)
      0091D9 7B 03            [ 1]  392 	ld	a, (0x03, sp)
      0091DB A1 08            [ 1]  393 	cp	a, #0x08
      0091DD 25 E2            [ 1]  394 	jrc	00107$
                                    395 ;	driver/oled.c: 163: }
      0091DF 5B 04            [ 2]  396 	addw	sp, #4
      0091E1 81               [ 4]  397 	ret
                                    398 ;	driver/oled.c: 165: u32 oled_pow(u8 m,u8 n)
                                    399 ;	-----------------------------------------
                                    400 ;	 function oled_pow
                                    401 ;	-----------------------------------------
      0091E2                        402 _oled_pow:
      0091E2 52 09            [ 2]  403 	sub	sp, #9
                                    404 ;	driver/oled.c: 167: u32 result=1;
      0091E4 5F               [ 1]  405 	clrw	x
      0091E5 5C               [ 1]  406 	incw	x
      0091E6 0F 07            [ 1]  407 	clr	(0x07, sp)
      0091E8 0F 06            [ 1]  408 	clr	(0x06, sp)
                                    409 ;	driver/oled.c: 168: while(n--)result*=m;
      0091EA 7B 0D            [ 1]  410 	ld	a, (0x0d, sp)
      0091EC 6B 01            [ 1]  411 	ld	(0x01, sp), a
      0091EE                        412 00101$:
      0091EE 7B 01            [ 1]  413 	ld	a, (0x01, sp)
      0091F0 0A 01            [ 1]  414 	dec	(0x01, sp)
      0091F2 4D               [ 1]  415 	tnz	a
      0091F3 27 1D            [ 1]  416 	jreq	00103$
      0091F5 7B 0C            [ 1]  417 	ld	a, (0x0c, sp)
      0091F7 6B 05            [ 1]  418 	ld	(0x05, sp), a
      0091F9 90 5F            [ 1]  419 	clrw	y
      0091FB 0F 02            [ 1]  420 	clr	(0x02, sp)
      0091FD 7B 05            [ 1]  421 	ld	a, (0x05, sp)
      0091FF 88               [ 1]  422 	push	a
      009200 90 89            [ 2]  423 	pushw	y
      009202 7B 05            [ 1]  424 	ld	a, (0x05, sp)
      009204 88               [ 1]  425 	push	a
      009205 89               [ 2]  426 	pushw	x
      009206 1E 0C            [ 2]  427 	ldw	x, (0x0c, sp)
      009208 89               [ 2]  428 	pushw	x
      009209 CD A3 5D         [ 4]  429 	call	__mullong
      00920C 5B 08            [ 2]  430 	addw	sp, #8
      00920E 17 06            [ 2]  431 	ldw	(0x06, sp), y
      009210 20 DC            [ 2]  432 	jra	00101$
      009212                        433 00103$:
                                    434 ;	driver/oled.c: 169: return result;
      009212 16 06            [ 2]  435 	ldw	y, (0x06, sp)
                                    436 ;	driver/oled.c: 170: }
      009214 5B 09            [ 2]  437 	addw	sp, #9
      009216 81               [ 4]  438 	ret
                                    439 ;	driver/oled.c: 177: void OLED_ShowNum(u8 x,u8 y,u32 num,u8 len,u8 size2)
                                    440 ;	-----------------------------------------
                                    441 ;	 function OLED_ShowNum
                                    442 ;	-----------------------------------------
      009217                        443 _OLED_ShowNum:
      009217 52 07            [ 2]  444 	sub	sp, #7
                                    445 ;	driver/oled.c: 180: u8 enshow=0;
      009219 0F 05            [ 1]  446 	clr	(0x05, sp)
                                    447 ;	driver/oled.c: 181: for(t=0;t<len;t++)
      00921B 0F 07            [ 1]  448 	clr	(0x07, sp)
      00921D                        449 00110$:
      00921D 7B 07            [ 1]  450 	ld	a, (0x07, sp)
      00921F 11 10            [ 1]  451 	cp	a, (0x10, sp)
      009221 25 03            [ 1]  452 	jrc	00139$
      009223 CC 92 B1         [ 2]  453 	jp	00111$
      009226                        454 00139$:
                                    455 ;	driver/oled.c: 183: temp=(num/oled_pow(10,len-t-1))%10;
      009226 7B 10            [ 1]  456 	ld	a, (0x10, sp)
      009228 10 07            [ 1]  457 	sub	a, (0x07, sp)
      00922A 4A               [ 1]  458 	dec	a
      00922B 88               [ 1]  459 	push	a
      00922C 4B 0A            [ 1]  460 	push	#0x0a
      00922E CD 91 E2         [ 4]  461 	call	_oled_pow
      009231 5B 02            [ 2]  462 	addw	sp, #2
      009233 89               [ 2]  463 	pushw	x
      009234 90 89            [ 2]  464 	pushw	y
      009236 1E 12            [ 2]  465 	ldw	x, (0x12, sp)
      009238 89               [ 2]  466 	pushw	x
      009239 1E 12            [ 2]  467 	ldw	x, (0x12, sp)
      00923B 89               [ 2]  468 	pushw	x
      00923C CD A2 AC         [ 4]  469 	call	__divulong
      00923F 5B 08            [ 2]  470 	addw	sp, #8
      009241 4B 0A            [ 1]  471 	push	#0x0a
      009243 4B 00            [ 1]  472 	push	#0x00
      009245 4B 00            [ 1]  473 	push	#0x00
      009247 4B 00            [ 1]  474 	push	#0x00
      009249 89               [ 2]  475 	pushw	x
      00924A 90 89            [ 2]  476 	pushw	y
      00924C CD A1 EE         [ 4]  477 	call	__modulong
      00924F 5B 08            [ 2]  478 	addw	sp, #8
      009251 9F               [ 1]  479 	ld	a, xl
      009252 6B 06            [ 1]  480 	ld	(0x06, sp), a
                                    481 ;	driver/oled.c: 188: OLED_ShowChar(x+(size2/2)*t,y,' ');
      009254 5F               [ 1]  482 	clrw	x
      009255 7B 11            [ 1]  483 	ld	a, (0x11, sp)
      009257 97               [ 1]  484 	ld	xl, a
      009258 7B 07            [ 1]  485 	ld	a, (0x07, sp)
      00925A 6B 01            [ 1]  486 	ld	(0x01, sp), a
      00925C 7B 0A            [ 1]  487 	ld	a, (0x0a, sp)
      00925E 6B 02            [ 1]  488 	ld	(0x02, sp), a
      009260 4B 02            [ 1]  489 	push	#0x02
      009262 4B 00            [ 1]  490 	push	#0x00
      009264 89               [ 2]  491 	pushw	x
      009265 CD A3 EF         [ 4]  492 	call	__divsint
      009268 5B 04            [ 2]  493 	addw	sp, #4
      00926A 7B 01            [ 1]  494 	ld	a, (0x01, sp)
      00926C 42               [ 4]  495 	mul	x, a
      00926D 9F               [ 1]  496 	ld	a, xl
      00926E 1B 02            [ 1]  497 	add	a, (0x02, sp)
      009270 90 97            [ 1]  498 	ld	yl, a
                                    499 ;	driver/oled.c: 184: if(enshow==0&&t<(len-1))
      009272 0D 05            [ 1]  500 	tnz	(0x05, sp)
      009274 26 26            [ 1]  501 	jrne	00105$
      009276 5F               [ 1]  502 	clrw	x
      009277 7B 10            [ 1]  503 	ld	a, (0x10, sp)
      009279 97               [ 1]  504 	ld	xl, a
      00927A 5A               [ 2]  505 	decw	x
      00927B 1F 03            [ 2]  506 	ldw	(0x03, sp), x
      00927D 5F               [ 1]  507 	clrw	x
      00927E 7B 07            [ 1]  508 	ld	a, (0x07, sp)
      009280 97               [ 1]  509 	ld	xl, a
      009281 13 03            [ 2]  510 	cpw	x, (0x03, sp)
      009283 2E 17            [ 1]  511 	jrsge	00105$
                                    512 ;	driver/oled.c: 186: if(temp==0)
      009285 0D 06            [ 1]  513 	tnz	(0x06, sp)
      009287 26 0F            [ 1]  514 	jrne	00102$
                                    515 ;	driver/oled.c: 188: OLED_ShowChar(x+(size2/2)*t,y,' ');
      009289 4B 20            [ 1]  516 	push	#0x20
      00928B 7B 0C            [ 1]  517 	ld	a, (0x0c, sp)
      00928D 88               [ 1]  518 	push	a
      00928E 90 9F            [ 1]  519 	ld	a, yl
      009290 88               [ 1]  520 	push	a
      009291 CD 91 6B         [ 4]  521 	call	_OLED_ShowChar
      009294 5B 03            [ 2]  522 	addw	sp, #3
                                    523 ;	driver/oled.c: 189: continue;
      009296 20 14            [ 2]  524 	jra	00107$
      009298                        525 00102$:
                                    526 ;	driver/oled.c: 190: }else enshow=1;
      009298 A6 01            [ 1]  527 	ld	a, #0x01
      00929A 6B 05            [ 1]  528 	ld	(0x05, sp), a
      00929C                        529 00105$:
                                    530 ;	driver/oled.c: 193: OLED_ShowChar(x+(size2/2)*t,y,temp+'0');
      00929C 7B 06            [ 1]  531 	ld	a, (0x06, sp)
      00929E AB 30            [ 1]  532 	add	a, #0x30
      0092A0 88               [ 1]  533 	push	a
      0092A1 7B 0C            [ 1]  534 	ld	a, (0x0c, sp)
      0092A3 88               [ 1]  535 	push	a
      0092A4 90 9F            [ 1]  536 	ld	a, yl
      0092A6 88               [ 1]  537 	push	a
      0092A7 CD 91 6B         [ 4]  538 	call	_OLED_ShowChar
      0092AA 5B 03            [ 2]  539 	addw	sp, #3
      0092AC                        540 00107$:
                                    541 ;	driver/oled.c: 181: for(t=0;t<len;t++)
      0092AC 0C 07            [ 1]  542 	inc	(0x07, sp)
      0092AE CC 92 1D         [ 2]  543 	jp	00110$
      0092B1                        544 00111$:
                                    545 ;	driver/oled.c: 195: }
      0092B1 5B 07            [ 2]  546 	addw	sp, #7
      0092B3 81               [ 4]  547 	ret
                                    548 ;	driver/oled.c: 197: void OLED_ShowString(u8 x,u8 y,u8 *chr)
                                    549 ;	-----------------------------------------
                                    550 ;	 function OLED_ShowString
                                    551 ;	-----------------------------------------
      0092B4                        552 _OLED_ShowString:
      0092B4 88               [ 1]  553 	push	a
                                    554 ;	driver/oled.c: 200: while (chr[j]!='\0')
      0092B5 0F 01            [ 1]  555 	clr	(0x01, sp)
      0092B7                        556 00103$:
      0092B7 5F               [ 1]  557 	clrw	x
      0092B8 7B 01            [ 1]  558 	ld	a, (0x01, sp)
      0092BA 97               [ 1]  559 	ld	xl, a
      0092BB 72 FB 06         [ 2]  560 	addw	x, (0x06, sp)
      0092BE F6               [ 1]  561 	ld	a, (x)
      0092BF 27 24            [ 1]  562 	jreq	00106$
                                    563 ;	driver/oled.c: 201: {		OLED_ShowChar(x,y,chr[j]);
      0092C1 88               [ 1]  564 	push	a
      0092C2 7B 06            [ 1]  565 	ld	a, (0x06, sp)
      0092C4 88               [ 1]  566 	push	a
      0092C5 7B 06            [ 1]  567 	ld	a, (0x06, sp)
      0092C7 88               [ 1]  568 	push	a
      0092C8 CD 91 6B         [ 4]  569 	call	_OLED_ShowChar
      0092CB 5B 03            [ 2]  570 	addw	sp, #3
                                    571 ;	driver/oled.c: 202: x+=8;
      0092CD 7B 04            [ 1]  572 	ld	a, (0x04, sp)
      0092CF AB 08            [ 1]  573 	add	a, #0x08
      0092D1 6B 04            [ 1]  574 	ld	(0x04, sp), a
                                    575 ;	driver/oled.c: 203: if(x>120){x=0;y+=2;}
      0092D3 7B 04            [ 1]  576 	ld	a, (0x04, sp)
      0092D5 A1 78            [ 1]  577 	cp	a, #0x78
      0092D7 23 08            [ 2]  578 	jrule	00102$
      0092D9 0F 04            [ 1]  579 	clr	(0x04, sp)
      0092DB 7B 05            [ 1]  580 	ld	a, (0x05, sp)
      0092DD AB 02            [ 1]  581 	add	a, #0x02
      0092DF 6B 05            [ 1]  582 	ld	(0x05, sp), a
      0092E1                        583 00102$:
                                    584 ;	driver/oled.c: 204: j++;
      0092E1 0C 01            [ 1]  585 	inc	(0x01, sp)
      0092E3 20 D2            [ 2]  586 	jra	00103$
      0092E5                        587 00106$:
                                    588 ;	driver/oled.c: 206: }
      0092E5 84               [ 1]  589 	pop	a
      0092E6 81               [ 4]  590 	ret
                                    591 ;	driver/oled.c: 248: void OLED_Init(void)
                                    592 ;	-----------------------------------------
                                    593 ;	 function OLED_Init
                                    594 ;	-----------------------------------------
      0092E7                        595 _OLED_Init:
                                    596 ;	driver/oled.c: 250: GPIO_Init(OLED_SCLK_PORT, (GPIO_Pin_TypeDef)OLED_SCLK_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      0092E7 4B E0            [ 1]  597 	push	#0xe0
      0092E9 4B 02            [ 1]  598 	push	#0x02
      0092EB 4B 0A            [ 1]  599 	push	#0x0a
      0092ED 4B 50            [ 1]  600 	push	#0x50
      0092EF CD 94 CE         [ 4]  601 	call	_GPIO_Init
      0092F2 5B 04            [ 2]  602 	addw	sp, #4
                                    603 ;	driver/oled.c: 251: GPIO_Init(OLED_SDIN_PORT, (GPIO_Pin_TypeDef)OLED_SDIN_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      0092F4 4B E0            [ 1]  604 	push	#0xe0
      0092F6 4B 04            [ 1]  605 	push	#0x04
      0092F8 4B 0A            [ 1]  606 	push	#0x0a
      0092FA 4B 50            [ 1]  607 	push	#0x50
      0092FC CD 94 CE         [ 4]  608 	call	_GPIO_Init
      0092FF 5B 04            [ 2]  609 	addw	sp, #4
                                    610 ;	driver/oled.c: 252: GPIO_Init(OLED_RST_PORT, (GPIO_Pin_TypeDef)OLED_RST_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      009301 4B E0            [ 1]  611 	push	#0xe0
      009303 4B 08            [ 1]  612 	push	#0x08
      009305 4B 0A            [ 1]  613 	push	#0x0a
      009307 4B 50            [ 1]  614 	push	#0x50
      009309 CD 94 CE         [ 4]  615 	call	_GPIO_Init
      00930C 5B 04            [ 2]  616 	addw	sp, #4
                                    617 ;	driver/oled.c: 253: GPIO_Init(OLED_DC_PORT, (GPIO_Pin_TypeDef)OLED_DC_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      00930E 4B E0            [ 1]  618 	push	#0xe0
      009310 4B 10            [ 1]  619 	push	#0x10
      009312 4B 0A            [ 1]  620 	push	#0x0a
      009314 4B 50            [ 1]  621 	push	#0x50
      009316 CD 94 CE         [ 4]  622 	call	_GPIO_Init
      009319 5B 04            [ 2]  623 	addw	sp, #4
                                    624 ;	driver/oled.c: 254: GPIO_Init(OLED_CS_PORT, (GPIO_Pin_TypeDef)OLED_CS_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      00931B 4B E0            [ 1]  625 	push	#0xe0
      00931D 4B 20            [ 1]  626 	push	#0x20
      00931F 4B 0A            [ 1]  627 	push	#0x0a
      009321 4B 50            [ 1]  628 	push	#0x50
      009323 CD 94 CE         [ 4]  629 	call	_GPIO_Init
      009326 5B 04            [ 2]  630 	addw	sp, #4
                                    631 ;	driver/oled.c: 257: OLED_RST_Set();
      009328 4B 08            [ 1]  632 	push	#0x08
      00932A 4B 0A            [ 1]  633 	push	#0x0a
      00932C 4B 50            [ 1]  634 	push	#0x50
      00932E CD 95 49         [ 4]  635 	call	_GPIO_WriteHigh
      009331 5B 03            [ 2]  636 	addw	sp, #3
                                    637 ;	driver/oled.c: 258: delay_ms(100);
      009333 4B 64            [ 1]  638 	push	#0x64
      009335 4B 00            [ 1]  639 	push	#0x00
      009337 CD 90 1F         [ 4]  640 	call	_delay_ms
      00933A 5B 02            [ 2]  641 	addw	sp, #2
                                    642 ;	driver/oled.c: 259: OLED_RST_Clr();
      00933C 4B 08            [ 1]  643 	push	#0x08
      00933E 4B 0A            [ 1]  644 	push	#0x0a
      009340 4B 50            [ 1]  645 	push	#0x50
      009342 CD 95 50         [ 4]  646 	call	_GPIO_WriteLow
      009345 5B 03            [ 2]  647 	addw	sp, #3
                                    648 ;	driver/oled.c: 260: delay_ms(100);
      009347 4B 64            [ 1]  649 	push	#0x64
      009349 4B 00            [ 1]  650 	push	#0x00
      00934B CD 90 1F         [ 4]  651 	call	_delay_ms
      00934E 5B 02            [ 2]  652 	addw	sp, #2
                                    653 ;	driver/oled.c: 261: OLED_RST_Set();
      009350 4B 08            [ 1]  654 	push	#0x08
      009352 4B 0A            [ 1]  655 	push	#0x0a
      009354 4B 50            [ 1]  656 	push	#0x50
      009356 CD 95 49         [ 4]  657 	call	_GPIO_WriteHigh
      009359 5B 03            [ 2]  658 	addw	sp, #3
                                    659 ;	driver/oled.c: 293: OLED_WR_Byte(0xAE,OLED_CMD);//--turn off oled panel
      00935B 4B 00            [ 1]  660 	push	#0x00
      00935D 4B AE            [ 1]  661 	push	#0xae
      00935F CD 90 3D         [ 4]  662 	call	_OLED_WR_Byte
      009362 5B 02            [ 2]  663 	addw	sp, #2
                                    664 ;	driver/oled.c: 294: OLED_WR_Byte(0x00,OLED_CMD);//---set low column address
      009364 4B 00            [ 1]  665 	push	#0x00
      009366 4B 00            [ 1]  666 	push	#0x00
      009368 CD 90 3D         [ 4]  667 	call	_OLED_WR_Byte
      00936B 5B 02            [ 2]  668 	addw	sp, #2
                                    669 ;	driver/oled.c: 295: OLED_WR_Byte(0x10,OLED_CMD);//---set high column address
      00936D 4B 00            [ 1]  670 	push	#0x00
      00936F 4B 10            [ 1]  671 	push	#0x10
      009371 CD 90 3D         [ 4]  672 	call	_OLED_WR_Byte
      009374 5B 02            [ 2]  673 	addw	sp, #2
                                    674 ;	driver/oled.c: 296: OLED_WR_Byte(0x40,OLED_CMD);//--set start line address  Set Mapping RAM Display Start Line (0x00~0x3F)
      009376 4B 00            [ 1]  675 	push	#0x00
      009378 4B 40            [ 1]  676 	push	#0x40
      00937A CD 90 3D         [ 4]  677 	call	_OLED_WR_Byte
      00937D 5B 02            [ 2]  678 	addw	sp, #2
                                    679 ;	driver/oled.c: 297: OLED_WR_Byte(0x81,OLED_CMD);//--set contrast control register
      00937F 4B 00            [ 1]  680 	push	#0x00
      009381 4B 81            [ 1]  681 	push	#0x81
      009383 CD 90 3D         [ 4]  682 	call	_OLED_WR_Byte
      009386 5B 02            [ 2]  683 	addw	sp, #2
                                    684 ;	driver/oled.c: 298: OLED_WR_Byte(0xCF,OLED_CMD); // Set SEG Output Current Brightness
      009388 4B 00            [ 1]  685 	push	#0x00
      00938A 4B CF            [ 1]  686 	push	#0xcf
      00938C CD 90 3D         [ 4]  687 	call	_OLED_WR_Byte
      00938F 5B 02            [ 2]  688 	addw	sp, #2
                                    689 ;	driver/oled.c: 299: OLED_WR_Byte(0xA1,OLED_CMD);//--Set SEG/Column Mapping     0xa0左右反置 0xa1正常
      009391 4B 00            [ 1]  690 	push	#0x00
      009393 4B A1            [ 1]  691 	push	#0xa1
      009395 CD 90 3D         [ 4]  692 	call	_OLED_WR_Byte
      009398 5B 02            [ 2]  693 	addw	sp, #2
                                    694 ;	driver/oled.c: 300: OLED_WR_Byte(0xC8,OLED_CMD);//Set COM/Row Scan Direction   0xc0上下反置 0xc8正常
      00939A 4B 00            [ 1]  695 	push	#0x00
      00939C 4B C8            [ 1]  696 	push	#0xc8
      00939E CD 90 3D         [ 4]  697 	call	_OLED_WR_Byte
      0093A1 5B 02            [ 2]  698 	addw	sp, #2
                                    699 ;	driver/oled.c: 301: OLED_WR_Byte(0xA6,OLED_CMD);//--set normal display
      0093A3 4B 00            [ 1]  700 	push	#0x00
      0093A5 4B A6            [ 1]  701 	push	#0xa6
      0093A7 CD 90 3D         [ 4]  702 	call	_OLED_WR_Byte
      0093AA 5B 02            [ 2]  703 	addw	sp, #2
                                    704 ;	driver/oled.c: 302: OLED_WR_Byte(0xA8,OLED_CMD);//--set multiplex ratio(1 to 64)
      0093AC 4B 00            [ 1]  705 	push	#0x00
      0093AE 4B A8            [ 1]  706 	push	#0xa8
      0093B0 CD 90 3D         [ 4]  707 	call	_OLED_WR_Byte
      0093B3 5B 02            [ 2]  708 	addw	sp, #2
                                    709 ;	driver/oled.c: 303: OLED_WR_Byte(0x3f,OLED_CMD);//--1/64 duty
      0093B5 4B 00            [ 1]  710 	push	#0x00
      0093B7 4B 3F            [ 1]  711 	push	#0x3f
      0093B9 CD 90 3D         [ 4]  712 	call	_OLED_WR_Byte
      0093BC 5B 02            [ 2]  713 	addw	sp, #2
                                    714 ;	driver/oled.c: 304: OLED_WR_Byte(0xD3,OLED_CMD);//-set display offset	Shift Mapping RAM Counter (0x00~0x3F)
      0093BE 4B 00            [ 1]  715 	push	#0x00
      0093C0 4B D3            [ 1]  716 	push	#0xd3
      0093C2 CD 90 3D         [ 4]  717 	call	_OLED_WR_Byte
      0093C5 5B 02            [ 2]  718 	addw	sp, #2
                                    719 ;	driver/oled.c: 305: OLED_WR_Byte(0x00,OLED_CMD);//-not offset
      0093C7 4B 00            [ 1]  720 	push	#0x00
      0093C9 4B 00            [ 1]  721 	push	#0x00
      0093CB CD 90 3D         [ 4]  722 	call	_OLED_WR_Byte
      0093CE 5B 02            [ 2]  723 	addw	sp, #2
                                    724 ;	driver/oled.c: 306: OLED_WR_Byte(0xd5,OLED_CMD);//--set display clock divide ratio/oscillator frequency
      0093D0 4B 00            [ 1]  725 	push	#0x00
      0093D2 4B D5            [ 1]  726 	push	#0xd5
      0093D4 CD 90 3D         [ 4]  727 	call	_OLED_WR_Byte
      0093D7 5B 02            [ 2]  728 	addw	sp, #2
                                    729 ;	driver/oled.c: 307: OLED_WR_Byte(0x80,OLED_CMD);//--set divide ratio, Set Clock as 100 Frames/Sec
      0093D9 4B 00            [ 1]  730 	push	#0x00
      0093DB 4B 80            [ 1]  731 	push	#0x80
      0093DD CD 90 3D         [ 4]  732 	call	_OLED_WR_Byte
      0093E0 5B 02            [ 2]  733 	addw	sp, #2
                                    734 ;	driver/oled.c: 308: OLED_WR_Byte(0xD9,OLED_CMD);//--set pre-charge period
      0093E2 4B 00            [ 1]  735 	push	#0x00
      0093E4 4B D9            [ 1]  736 	push	#0xd9
      0093E6 CD 90 3D         [ 4]  737 	call	_OLED_WR_Byte
      0093E9 5B 02            [ 2]  738 	addw	sp, #2
                                    739 ;	driver/oled.c: 309: OLED_WR_Byte(0xF1,OLED_CMD);//Set Pre-Charge as 15 Clocks & Discharge as 1 Clock
      0093EB 4B 00            [ 1]  740 	push	#0x00
      0093ED 4B F1            [ 1]  741 	push	#0xf1
      0093EF CD 90 3D         [ 4]  742 	call	_OLED_WR_Byte
      0093F2 5B 02            [ 2]  743 	addw	sp, #2
                                    744 ;	driver/oled.c: 310: OLED_WR_Byte(0xDA,OLED_CMD);//--set com pins hardware configuration
      0093F4 4B 00            [ 1]  745 	push	#0x00
      0093F6 4B DA            [ 1]  746 	push	#0xda
      0093F8 CD 90 3D         [ 4]  747 	call	_OLED_WR_Byte
      0093FB 5B 02            [ 2]  748 	addw	sp, #2
                                    749 ;	driver/oled.c: 311: OLED_WR_Byte(0x12,OLED_CMD);
      0093FD 4B 00            [ 1]  750 	push	#0x00
      0093FF 4B 12            [ 1]  751 	push	#0x12
      009401 CD 90 3D         [ 4]  752 	call	_OLED_WR_Byte
      009404 5B 02            [ 2]  753 	addw	sp, #2
                                    754 ;	driver/oled.c: 312: OLED_WR_Byte(0xDB,OLED_CMD);//--set vcomh
      009406 4B 00            [ 1]  755 	push	#0x00
      009408 4B DB            [ 1]  756 	push	#0xdb
      00940A CD 90 3D         [ 4]  757 	call	_OLED_WR_Byte
      00940D 5B 02            [ 2]  758 	addw	sp, #2
                                    759 ;	driver/oled.c: 313: OLED_WR_Byte(0x40,OLED_CMD);//Set VCOM Deselect Level
      00940F 4B 00            [ 1]  760 	push	#0x00
      009411 4B 40            [ 1]  761 	push	#0x40
      009413 CD 90 3D         [ 4]  762 	call	_OLED_WR_Byte
      009416 5B 02            [ 2]  763 	addw	sp, #2
                                    764 ;	driver/oled.c: 314: OLED_WR_Byte(0x20,OLED_CMD);//-Set Page Addressing Mode (0x00/0x01/0x02)
      009418 4B 00            [ 1]  765 	push	#0x00
      00941A 4B 20            [ 1]  766 	push	#0x20
      00941C CD 90 3D         [ 4]  767 	call	_OLED_WR_Byte
      00941F 5B 02            [ 2]  768 	addw	sp, #2
                                    769 ;	driver/oled.c: 315: OLED_WR_Byte(0x02,OLED_CMD);//
      009421 4B 00            [ 1]  770 	push	#0x00
      009423 4B 02            [ 1]  771 	push	#0x02
      009425 CD 90 3D         [ 4]  772 	call	_OLED_WR_Byte
      009428 5B 02            [ 2]  773 	addw	sp, #2
                                    774 ;	driver/oled.c: 316: OLED_WR_Byte(0x8D,OLED_CMD);//--set Charge Pump enable/disable
      00942A 4B 00            [ 1]  775 	push	#0x00
      00942C 4B 8D            [ 1]  776 	push	#0x8d
      00942E CD 90 3D         [ 4]  777 	call	_OLED_WR_Byte
      009431 5B 02            [ 2]  778 	addw	sp, #2
                                    779 ;	driver/oled.c: 317: OLED_WR_Byte(0x14,OLED_CMD);//--set(0x10) disable
      009433 4B 00            [ 1]  780 	push	#0x00
      009435 4B 14            [ 1]  781 	push	#0x14
      009437 CD 90 3D         [ 4]  782 	call	_OLED_WR_Byte
      00943A 5B 02            [ 2]  783 	addw	sp, #2
                                    784 ;	driver/oled.c: 318: OLED_WR_Byte(0xA4,OLED_CMD);// Disable Entire Display On (0xa4/0xa5)
      00943C 4B 00            [ 1]  785 	push	#0x00
      00943E 4B A4            [ 1]  786 	push	#0xa4
      009440 CD 90 3D         [ 4]  787 	call	_OLED_WR_Byte
      009443 5B 02            [ 2]  788 	addw	sp, #2
                                    789 ;	driver/oled.c: 319: OLED_WR_Byte(0xA6,OLED_CMD);// Disable Inverse Display On (0xa6/a7)
      009445 4B 00            [ 1]  790 	push	#0x00
      009447 4B A6            [ 1]  791 	push	#0xa6
      009449 CD 90 3D         [ 4]  792 	call	_OLED_WR_Byte
      00944C 5B 02            [ 2]  793 	addw	sp, #2
                                    794 ;	driver/oled.c: 320: OLED_WR_Byte(0xAF,OLED_CMD);//--turn on oled panel
      00944E 4B 00            [ 1]  795 	push	#0x00
      009450 4B AF            [ 1]  796 	push	#0xaf
      009452 CD 90 3D         [ 4]  797 	call	_OLED_WR_Byte
      009455 5B 02            [ 2]  798 	addw	sp, #2
                                    799 ;	driver/oled.c: 322: OLED_WR_Byte(0xAF,OLED_CMD); /*display ON*/
      009457 4B 00            [ 1]  800 	push	#0x00
      009459 4B AF            [ 1]  801 	push	#0xaf
      00945B CD 90 3D         [ 4]  802 	call	_OLED_WR_Byte
      00945E 5B 02            [ 2]  803 	addw	sp, #2
                                    804 ;	driver/oled.c: 323: OLED_Clear();
      009460 CD 91 2F         [ 4]  805 	call	_OLED_Clear
                                    806 ;	driver/oled.c: 324: OLED_Set_Pos(0,0);
      009463 4B 00            [ 1]  807 	push	#0x00
      009465 4B 00            [ 1]  808 	push	#0x00
      009467 CD 90 BA         [ 4]  809 	call	_OLED_Set_Pos
      00946A 5B 02            [ 2]  810 	addw	sp, #2
                                    811 ;	driver/oled.c: 325: }
      00946C 81               [ 4]  812 	ret
                                    813 	.area CODE
                                    814 	.area CONST
      008079                        815 _F8X16:
      008079 00                     816 	.db #0x00	; 0
      00807A 00                     817 	.db #0x00	; 0
      00807B 00                     818 	.db #0x00	; 0
      00807C 00                     819 	.db #0x00	; 0
      00807D 00                     820 	.db #0x00	; 0
      00807E 00                     821 	.db #0x00	; 0
      00807F 00                     822 	.db #0x00	; 0
      008080 00                     823 	.db #0x00	; 0
      008081 00                     824 	.db #0x00	; 0
      008082 00                     825 	.db #0x00	; 0
      008083 00                     826 	.db #0x00	; 0
      008084 00                     827 	.db #0x00	; 0
      008085 00                     828 	.db #0x00	; 0
      008086 00                     829 	.db #0x00	; 0
      008087 00                     830 	.db #0x00	; 0
      008088 00                     831 	.db #0x00	; 0
      008089 00                     832 	.db #0x00	; 0
      00808A 00                     833 	.db #0x00	; 0
      00808B 00                     834 	.db #0x00	; 0
      00808C F8                     835 	.db #0xf8	; 248
      00808D 00                     836 	.db #0x00	; 0
      00808E 00                     837 	.db #0x00	; 0
      00808F 00                     838 	.db #0x00	; 0
      008090 00                     839 	.db #0x00	; 0
      008091 00                     840 	.db #0x00	; 0
      008092 00                     841 	.db #0x00	; 0
      008093 00                     842 	.db #0x00	; 0
      008094 33                     843 	.db #0x33	; 51	'3'
      008095 30                     844 	.db #0x30	; 48	'0'
      008096 00                     845 	.db #0x00	; 0
      008097 00                     846 	.db #0x00	; 0
      008098 00                     847 	.db #0x00	; 0
      008099 00                     848 	.db #0x00	; 0
      00809A 10                     849 	.db #0x10	; 16
      00809B 0C                     850 	.db #0x0c	; 12
      00809C 06                     851 	.db #0x06	; 6
      00809D 10                     852 	.db #0x10	; 16
      00809E 0C                     853 	.db #0x0c	; 12
      00809F 06                     854 	.db #0x06	; 6
      0080A0 00                     855 	.db #0x00	; 0
      0080A1 00                     856 	.db #0x00	; 0
      0080A2 00                     857 	.db #0x00	; 0
      0080A3 00                     858 	.db #0x00	; 0
      0080A4 00                     859 	.db #0x00	; 0
      0080A5 00                     860 	.db #0x00	; 0
      0080A6 00                     861 	.db #0x00	; 0
      0080A7 00                     862 	.db #0x00	; 0
      0080A8 00                     863 	.db #0x00	; 0
      0080A9 40                     864 	.db #0x40	; 64
      0080AA C0                     865 	.db #0xc0	; 192
      0080AB 78                     866 	.db #0x78	; 120	'x'
      0080AC 40                     867 	.db #0x40	; 64
      0080AD C0                     868 	.db #0xc0	; 192
      0080AE 78                     869 	.db #0x78	; 120	'x'
      0080AF 40                     870 	.db #0x40	; 64
      0080B0 00                     871 	.db #0x00	; 0
      0080B1 04                     872 	.db #0x04	; 4
      0080B2 3F                     873 	.db #0x3f	; 63
      0080B3 04                     874 	.db #0x04	; 4
      0080B4 04                     875 	.db #0x04	; 4
      0080B5 3F                     876 	.db #0x3f	; 63
      0080B6 04                     877 	.db #0x04	; 4
      0080B7 04                     878 	.db #0x04	; 4
      0080B8 00                     879 	.db #0x00	; 0
      0080B9 00                     880 	.db #0x00	; 0
      0080BA 70                     881 	.db #0x70	; 112	'p'
      0080BB 88                     882 	.db #0x88	; 136
      0080BC FC                     883 	.db #0xfc	; 252
      0080BD 08                     884 	.db #0x08	; 8
      0080BE 30                     885 	.db #0x30	; 48	'0'
      0080BF 00                     886 	.db #0x00	; 0
      0080C0 00                     887 	.db #0x00	; 0
      0080C1 00                     888 	.db #0x00	; 0
      0080C2 18                     889 	.db #0x18	; 24
      0080C3 20                     890 	.db #0x20	; 32
      0080C4 FF                     891 	.db #0xff	; 255
      0080C5 21                     892 	.db #0x21	; 33
      0080C6 1E                     893 	.db #0x1e	; 30
      0080C7 00                     894 	.db #0x00	; 0
      0080C8 00                     895 	.db #0x00	; 0
      0080C9 F0                     896 	.db #0xf0	; 240
      0080CA 08                     897 	.db #0x08	; 8
      0080CB F0                     898 	.db #0xf0	; 240
      0080CC 00                     899 	.db #0x00	; 0
      0080CD E0                     900 	.db #0xe0	; 224
      0080CE 18                     901 	.db #0x18	; 24
      0080CF 00                     902 	.db #0x00	; 0
      0080D0 00                     903 	.db #0x00	; 0
      0080D1 00                     904 	.db #0x00	; 0
      0080D2 21                     905 	.db #0x21	; 33
      0080D3 1C                     906 	.db #0x1c	; 28
      0080D4 03                     907 	.db #0x03	; 3
      0080D5 1E                     908 	.db #0x1e	; 30
      0080D6 21                     909 	.db #0x21	; 33
      0080D7 1E                     910 	.db #0x1e	; 30
      0080D8 00                     911 	.db #0x00	; 0
      0080D9 00                     912 	.db #0x00	; 0
      0080DA F0                     913 	.db #0xf0	; 240
      0080DB 08                     914 	.db #0x08	; 8
      0080DC 88                     915 	.db #0x88	; 136
      0080DD 70                     916 	.db #0x70	; 112	'p'
      0080DE 00                     917 	.db #0x00	; 0
      0080DF 00                     918 	.db #0x00	; 0
      0080E0 00                     919 	.db #0x00	; 0
      0080E1 1E                     920 	.db #0x1e	; 30
      0080E2 21                     921 	.db #0x21	; 33
      0080E3 23                     922 	.db #0x23	; 35
      0080E4 24                     923 	.db #0x24	; 36
      0080E5 19                     924 	.db #0x19	; 25
      0080E6 27                     925 	.db #0x27	; 39
      0080E7 21                     926 	.db #0x21	; 33
      0080E8 10                     927 	.db #0x10	; 16
      0080E9 10                     928 	.db #0x10	; 16
      0080EA 16                     929 	.db #0x16	; 22
      0080EB 0E                     930 	.db #0x0e	; 14
      0080EC 00                     931 	.db #0x00	; 0
      0080ED 00                     932 	.db #0x00	; 0
      0080EE 00                     933 	.db #0x00	; 0
      0080EF 00                     934 	.db #0x00	; 0
      0080F0 00                     935 	.db #0x00	; 0
      0080F1 00                     936 	.db #0x00	; 0
      0080F2 00                     937 	.db #0x00	; 0
      0080F3 00                     938 	.db #0x00	; 0
      0080F4 00                     939 	.db #0x00	; 0
      0080F5 00                     940 	.db #0x00	; 0
      0080F6 00                     941 	.db #0x00	; 0
      0080F7 00                     942 	.db #0x00	; 0
      0080F8 00                     943 	.db #0x00	; 0
      0080F9 00                     944 	.db #0x00	; 0
      0080FA 00                     945 	.db #0x00	; 0
      0080FB 00                     946 	.db #0x00	; 0
      0080FC E0                     947 	.db #0xe0	; 224
      0080FD 18                     948 	.db #0x18	; 24
      0080FE 04                     949 	.db #0x04	; 4
      0080FF 02                     950 	.db #0x02	; 2
      008100 00                     951 	.db #0x00	; 0
      008101 00                     952 	.db #0x00	; 0
      008102 00                     953 	.db #0x00	; 0
      008103 00                     954 	.db #0x00	; 0
      008104 07                     955 	.db #0x07	; 7
      008105 18                     956 	.db #0x18	; 24
      008106 20                     957 	.db #0x20	; 32
      008107 40                     958 	.db #0x40	; 64
      008108 00                     959 	.db #0x00	; 0
      008109 00                     960 	.db #0x00	; 0
      00810A 02                     961 	.db #0x02	; 2
      00810B 04                     962 	.db #0x04	; 4
      00810C 18                     963 	.db #0x18	; 24
      00810D E0                     964 	.db #0xe0	; 224
      00810E 00                     965 	.db #0x00	; 0
      00810F 00                     966 	.db #0x00	; 0
      008110 00                     967 	.db #0x00	; 0
      008111 00                     968 	.db #0x00	; 0
      008112 40                     969 	.db #0x40	; 64
      008113 20                     970 	.db #0x20	; 32
      008114 18                     971 	.db #0x18	; 24
      008115 07                     972 	.db #0x07	; 7
      008116 00                     973 	.db #0x00	; 0
      008117 00                     974 	.db #0x00	; 0
      008118 00                     975 	.db #0x00	; 0
      008119 40                     976 	.db #0x40	; 64
      00811A 40                     977 	.db #0x40	; 64
      00811B 80                     978 	.db #0x80	; 128
      00811C F0                     979 	.db #0xf0	; 240
      00811D 80                     980 	.db #0x80	; 128
      00811E 40                     981 	.db #0x40	; 64
      00811F 40                     982 	.db #0x40	; 64
      008120 00                     983 	.db #0x00	; 0
      008121 02                     984 	.db #0x02	; 2
      008122 02                     985 	.db #0x02	; 2
      008123 01                     986 	.db #0x01	; 1
      008124 0F                     987 	.db #0x0f	; 15
      008125 01                     988 	.db #0x01	; 1
      008126 02                     989 	.db #0x02	; 2
      008127 02                     990 	.db #0x02	; 2
      008128 00                     991 	.db #0x00	; 0
      008129 00                     992 	.db #0x00	; 0
      00812A 00                     993 	.db #0x00	; 0
      00812B 00                     994 	.db #0x00	; 0
      00812C F0                     995 	.db #0xf0	; 240
      00812D 00                     996 	.db #0x00	; 0
      00812E 00                     997 	.db #0x00	; 0
      00812F 00                     998 	.db #0x00	; 0
      008130 00                     999 	.db #0x00	; 0
      008131 01                    1000 	.db #0x01	; 1
      008132 01                    1001 	.db #0x01	; 1
      008133 01                    1002 	.db #0x01	; 1
      008134 1F                    1003 	.db #0x1f	; 31
      008135 01                    1004 	.db #0x01	; 1
      008136 01                    1005 	.db #0x01	; 1
      008137 01                    1006 	.db #0x01	; 1
      008138 00                    1007 	.db #0x00	; 0
      008139 00                    1008 	.db #0x00	; 0
      00813A 00                    1009 	.db #0x00	; 0
      00813B 00                    1010 	.db #0x00	; 0
      00813C 00                    1011 	.db #0x00	; 0
      00813D 00                    1012 	.db #0x00	; 0
      00813E 00                    1013 	.db #0x00	; 0
      00813F 00                    1014 	.db #0x00	; 0
      008140 00                    1015 	.db #0x00	; 0
      008141 80                    1016 	.db #0x80	; 128
      008142 B0                    1017 	.db #0xb0	; 176
      008143 70                    1018 	.db #0x70	; 112	'p'
      008144 00                    1019 	.db #0x00	; 0
      008145 00                    1020 	.db #0x00	; 0
      008146 00                    1021 	.db #0x00	; 0
      008147 00                    1022 	.db #0x00	; 0
      008148 00                    1023 	.db #0x00	; 0
      008149 00                    1024 	.db #0x00	; 0
      00814A 00                    1025 	.db #0x00	; 0
      00814B 00                    1026 	.db #0x00	; 0
      00814C 00                    1027 	.db #0x00	; 0
      00814D 00                    1028 	.db #0x00	; 0
      00814E 00                    1029 	.db #0x00	; 0
      00814F 00                    1030 	.db #0x00	; 0
      008150 00                    1031 	.db #0x00	; 0
      008151 00                    1032 	.db #0x00	; 0
      008152 01                    1033 	.db #0x01	; 1
      008153 01                    1034 	.db #0x01	; 1
      008154 01                    1035 	.db #0x01	; 1
      008155 01                    1036 	.db #0x01	; 1
      008156 01                    1037 	.db #0x01	; 1
      008157 01                    1038 	.db #0x01	; 1
      008158 01                    1039 	.db #0x01	; 1
      008159 00                    1040 	.db #0x00	; 0
      00815A 00                    1041 	.db #0x00	; 0
      00815B 00                    1042 	.db #0x00	; 0
      00815C 00                    1043 	.db #0x00	; 0
      00815D 00                    1044 	.db #0x00	; 0
      00815E 00                    1045 	.db #0x00	; 0
      00815F 00                    1046 	.db #0x00	; 0
      008160 00                    1047 	.db #0x00	; 0
      008161 00                    1048 	.db #0x00	; 0
      008162 30                    1049 	.db #0x30	; 48	'0'
      008163 30                    1050 	.db #0x30	; 48	'0'
      008164 00                    1051 	.db #0x00	; 0
      008165 00                    1052 	.db #0x00	; 0
      008166 00                    1053 	.db #0x00	; 0
      008167 00                    1054 	.db #0x00	; 0
      008168 00                    1055 	.db #0x00	; 0
      008169 00                    1056 	.db #0x00	; 0
      00816A 00                    1057 	.db #0x00	; 0
      00816B 00                    1058 	.db #0x00	; 0
      00816C 00                    1059 	.db #0x00	; 0
      00816D 80                    1060 	.db #0x80	; 128
      00816E 60                    1061 	.db #0x60	; 96
      00816F 18                    1062 	.db #0x18	; 24
      008170 04                    1063 	.db #0x04	; 4
      008171 00                    1064 	.db #0x00	; 0
      008172 60                    1065 	.db #0x60	; 96
      008173 18                    1066 	.db #0x18	; 24
      008174 06                    1067 	.db #0x06	; 6
      008175 01                    1068 	.db #0x01	; 1
      008176 00                    1069 	.db #0x00	; 0
      008177 00                    1070 	.db #0x00	; 0
      008178 00                    1071 	.db #0x00	; 0
      008179 00                    1072 	.db #0x00	; 0
      00817A E0                    1073 	.db #0xe0	; 224
      00817B 10                    1074 	.db #0x10	; 16
      00817C 08                    1075 	.db #0x08	; 8
      00817D 08                    1076 	.db #0x08	; 8
      00817E 10                    1077 	.db #0x10	; 16
      00817F E0                    1078 	.db #0xe0	; 224
      008180 00                    1079 	.db #0x00	; 0
      008181 00                    1080 	.db #0x00	; 0
      008182 0F                    1081 	.db #0x0f	; 15
      008183 10                    1082 	.db #0x10	; 16
      008184 20                    1083 	.db #0x20	; 32
      008185 20                    1084 	.db #0x20	; 32
      008186 10                    1085 	.db #0x10	; 16
      008187 0F                    1086 	.db #0x0f	; 15
      008188 00                    1087 	.db #0x00	; 0
      008189 00                    1088 	.db #0x00	; 0
      00818A 10                    1089 	.db #0x10	; 16
      00818B 10                    1090 	.db #0x10	; 16
      00818C F8                    1091 	.db #0xf8	; 248
      00818D 00                    1092 	.db #0x00	; 0
      00818E 00                    1093 	.db #0x00	; 0
      00818F 00                    1094 	.db #0x00	; 0
      008190 00                    1095 	.db #0x00	; 0
      008191 00                    1096 	.db #0x00	; 0
      008192 20                    1097 	.db #0x20	; 32
      008193 20                    1098 	.db #0x20	; 32
      008194 3F                    1099 	.db #0x3f	; 63
      008195 20                    1100 	.db #0x20	; 32
      008196 20                    1101 	.db #0x20	; 32
      008197 00                    1102 	.db #0x00	; 0
      008198 00                    1103 	.db #0x00	; 0
      008199 00                    1104 	.db #0x00	; 0
      00819A 70                    1105 	.db #0x70	; 112	'p'
      00819B 08                    1106 	.db #0x08	; 8
      00819C 08                    1107 	.db #0x08	; 8
      00819D 08                    1108 	.db #0x08	; 8
      00819E 88                    1109 	.db #0x88	; 136
      00819F 70                    1110 	.db #0x70	; 112	'p'
      0081A0 00                    1111 	.db #0x00	; 0
      0081A1 00                    1112 	.db #0x00	; 0
      0081A2 30                    1113 	.db #0x30	; 48	'0'
      0081A3 28                    1114 	.db #0x28	; 40
      0081A4 24                    1115 	.db #0x24	; 36
      0081A5 22                    1116 	.db #0x22	; 34
      0081A6 21                    1117 	.db #0x21	; 33
      0081A7 30                    1118 	.db #0x30	; 48	'0'
      0081A8 00                    1119 	.db #0x00	; 0
      0081A9 00                    1120 	.db #0x00	; 0
      0081AA 30                    1121 	.db #0x30	; 48	'0'
      0081AB 08                    1122 	.db #0x08	; 8
      0081AC 88                    1123 	.db #0x88	; 136
      0081AD 88                    1124 	.db #0x88	; 136
      0081AE 48                    1125 	.db #0x48	; 72	'H'
      0081AF 30                    1126 	.db #0x30	; 48	'0'
      0081B0 00                    1127 	.db #0x00	; 0
      0081B1 00                    1128 	.db #0x00	; 0
      0081B2 18                    1129 	.db #0x18	; 24
      0081B3 20                    1130 	.db #0x20	; 32
      0081B4 20                    1131 	.db #0x20	; 32
      0081B5 20                    1132 	.db #0x20	; 32
      0081B6 11                    1133 	.db #0x11	; 17
      0081B7 0E                    1134 	.db #0x0e	; 14
      0081B8 00                    1135 	.db #0x00	; 0
      0081B9 00                    1136 	.db #0x00	; 0
      0081BA 00                    1137 	.db #0x00	; 0
      0081BB C0                    1138 	.db #0xc0	; 192
      0081BC 20                    1139 	.db #0x20	; 32
      0081BD 10                    1140 	.db #0x10	; 16
      0081BE F8                    1141 	.db #0xf8	; 248
      0081BF 00                    1142 	.db #0x00	; 0
      0081C0 00                    1143 	.db #0x00	; 0
      0081C1 00                    1144 	.db #0x00	; 0
      0081C2 07                    1145 	.db #0x07	; 7
      0081C3 04                    1146 	.db #0x04	; 4
      0081C4 24                    1147 	.db #0x24	; 36
      0081C5 24                    1148 	.db #0x24	; 36
      0081C6 3F                    1149 	.db #0x3f	; 63
      0081C7 24                    1150 	.db #0x24	; 36
      0081C8 00                    1151 	.db #0x00	; 0
      0081C9 00                    1152 	.db #0x00	; 0
      0081CA F8                    1153 	.db #0xf8	; 248
      0081CB 08                    1154 	.db #0x08	; 8
      0081CC 88                    1155 	.db #0x88	; 136
      0081CD 88                    1156 	.db #0x88	; 136
      0081CE 08                    1157 	.db #0x08	; 8
      0081CF 08                    1158 	.db #0x08	; 8
      0081D0 00                    1159 	.db #0x00	; 0
      0081D1 00                    1160 	.db #0x00	; 0
      0081D2 19                    1161 	.db #0x19	; 25
      0081D3 21                    1162 	.db #0x21	; 33
      0081D4 20                    1163 	.db #0x20	; 32
      0081D5 20                    1164 	.db #0x20	; 32
      0081D6 11                    1165 	.db #0x11	; 17
      0081D7 0E                    1166 	.db #0x0e	; 14
      0081D8 00                    1167 	.db #0x00	; 0
      0081D9 00                    1168 	.db #0x00	; 0
      0081DA E0                    1169 	.db #0xe0	; 224
      0081DB 10                    1170 	.db #0x10	; 16
      0081DC 88                    1171 	.db #0x88	; 136
      0081DD 88                    1172 	.db #0x88	; 136
      0081DE 18                    1173 	.db #0x18	; 24
      0081DF 00                    1174 	.db #0x00	; 0
      0081E0 00                    1175 	.db #0x00	; 0
      0081E1 00                    1176 	.db #0x00	; 0
      0081E2 0F                    1177 	.db #0x0f	; 15
      0081E3 11                    1178 	.db #0x11	; 17
      0081E4 20                    1179 	.db #0x20	; 32
      0081E5 20                    1180 	.db #0x20	; 32
      0081E6 11                    1181 	.db #0x11	; 17
      0081E7 0E                    1182 	.db #0x0e	; 14
      0081E8 00                    1183 	.db #0x00	; 0
      0081E9 00                    1184 	.db #0x00	; 0
      0081EA 38                    1185 	.db #0x38	; 56	'8'
      0081EB 08                    1186 	.db #0x08	; 8
      0081EC 08                    1187 	.db #0x08	; 8
      0081ED C8                    1188 	.db #0xc8	; 200
      0081EE 38                    1189 	.db #0x38	; 56	'8'
      0081EF 08                    1190 	.db #0x08	; 8
      0081F0 00                    1191 	.db #0x00	; 0
      0081F1 00                    1192 	.db #0x00	; 0
      0081F2 00                    1193 	.db #0x00	; 0
      0081F3 00                    1194 	.db #0x00	; 0
      0081F4 3F                    1195 	.db #0x3f	; 63
      0081F5 00                    1196 	.db #0x00	; 0
      0081F6 00                    1197 	.db #0x00	; 0
      0081F7 00                    1198 	.db #0x00	; 0
      0081F8 00                    1199 	.db #0x00	; 0
      0081F9 00                    1200 	.db #0x00	; 0
      0081FA 70                    1201 	.db #0x70	; 112	'p'
      0081FB 88                    1202 	.db #0x88	; 136
      0081FC 08                    1203 	.db #0x08	; 8
      0081FD 08                    1204 	.db #0x08	; 8
      0081FE 88                    1205 	.db #0x88	; 136
      0081FF 70                    1206 	.db #0x70	; 112	'p'
      008200 00                    1207 	.db #0x00	; 0
      008201 00                    1208 	.db #0x00	; 0
      008202 1C                    1209 	.db #0x1c	; 28
      008203 22                    1210 	.db #0x22	; 34
      008204 21                    1211 	.db #0x21	; 33
      008205 21                    1212 	.db #0x21	; 33
      008206 22                    1213 	.db #0x22	; 34
      008207 1C                    1214 	.db #0x1c	; 28
      008208 00                    1215 	.db #0x00	; 0
      008209 00                    1216 	.db #0x00	; 0
      00820A E0                    1217 	.db #0xe0	; 224
      00820B 10                    1218 	.db #0x10	; 16
      00820C 08                    1219 	.db #0x08	; 8
      00820D 08                    1220 	.db #0x08	; 8
      00820E 10                    1221 	.db #0x10	; 16
      00820F E0                    1222 	.db #0xe0	; 224
      008210 00                    1223 	.db #0x00	; 0
      008211 00                    1224 	.db #0x00	; 0
      008212 00                    1225 	.db #0x00	; 0
      008213 31                    1226 	.db #0x31	; 49	'1'
      008214 22                    1227 	.db #0x22	; 34
      008215 22                    1228 	.db #0x22	; 34
      008216 11                    1229 	.db #0x11	; 17
      008217 0F                    1230 	.db #0x0f	; 15
      008218 00                    1231 	.db #0x00	; 0
      008219 00                    1232 	.db #0x00	; 0
      00821A 00                    1233 	.db #0x00	; 0
      00821B 00                    1234 	.db #0x00	; 0
      00821C C0                    1235 	.db #0xc0	; 192
      00821D C0                    1236 	.db #0xc0	; 192
      00821E 00                    1237 	.db #0x00	; 0
      00821F 00                    1238 	.db #0x00	; 0
      008220 00                    1239 	.db #0x00	; 0
      008221 00                    1240 	.db #0x00	; 0
      008222 00                    1241 	.db #0x00	; 0
      008223 00                    1242 	.db #0x00	; 0
      008224 30                    1243 	.db #0x30	; 48	'0'
      008225 30                    1244 	.db #0x30	; 48	'0'
      008226 00                    1245 	.db #0x00	; 0
      008227 00                    1246 	.db #0x00	; 0
      008228 00                    1247 	.db #0x00	; 0
      008229 00                    1248 	.db #0x00	; 0
      00822A 00                    1249 	.db #0x00	; 0
      00822B 00                    1250 	.db #0x00	; 0
      00822C 80                    1251 	.db #0x80	; 128
      00822D 00                    1252 	.db #0x00	; 0
      00822E 00                    1253 	.db #0x00	; 0
      00822F 00                    1254 	.db #0x00	; 0
      008230 00                    1255 	.db #0x00	; 0
      008231 00                    1256 	.db #0x00	; 0
      008232 00                    1257 	.db #0x00	; 0
      008233 80                    1258 	.db #0x80	; 128
      008234 60                    1259 	.db #0x60	; 96
      008235 00                    1260 	.db #0x00	; 0
      008236 00                    1261 	.db #0x00	; 0
      008237 00                    1262 	.db #0x00	; 0
      008238 00                    1263 	.db #0x00	; 0
      008239 00                    1264 	.db #0x00	; 0
      00823A 00                    1265 	.db #0x00	; 0
      00823B 80                    1266 	.db #0x80	; 128
      00823C 40                    1267 	.db #0x40	; 64
      00823D 20                    1268 	.db #0x20	; 32
      00823E 10                    1269 	.db #0x10	; 16
      00823F 08                    1270 	.db #0x08	; 8
      008240 00                    1271 	.db #0x00	; 0
      008241 00                    1272 	.db #0x00	; 0
      008242 01                    1273 	.db #0x01	; 1
      008243 02                    1274 	.db #0x02	; 2
      008244 04                    1275 	.db #0x04	; 4
      008245 08                    1276 	.db #0x08	; 8
      008246 10                    1277 	.db #0x10	; 16
      008247 20                    1278 	.db #0x20	; 32
      008248 00                    1279 	.db #0x00	; 0
      008249 40                    1280 	.db #0x40	; 64
      00824A 40                    1281 	.db #0x40	; 64
      00824B 40                    1282 	.db #0x40	; 64
      00824C 40                    1283 	.db #0x40	; 64
      00824D 40                    1284 	.db #0x40	; 64
      00824E 40                    1285 	.db #0x40	; 64
      00824F 40                    1286 	.db #0x40	; 64
      008250 00                    1287 	.db #0x00	; 0
      008251 04                    1288 	.db #0x04	; 4
      008252 04                    1289 	.db #0x04	; 4
      008253 04                    1290 	.db #0x04	; 4
      008254 04                    1291 	.db #0x04	; 4
      008255 04                    1292 	.db #0x04	; 4
      008256 04                    1293 	.db #0x04	; 4
      008257 04                    1294 	.db #0x04	; 4
      008258 00                    1295 	.db #0x00	; 0
      008259 00                    1296 	.db #0x00	; 0
      00825A 08                    1297 	.db #0x08	; 8
      00825B 10                    1298 	.db #0x10	; 16
      00825C 20                    1299 	.db #0x20	; 32
      00825D 40                    1300 	.db #0x40	; 64
      00825E 80                    1301 	.db #0x80	; 128
      00825F 00                    1302 	.db #0x00	; 0
      008260 00                    1303 	.db #0x00	; 0
      008261 00                    1304 	.db #0x00	; 0
      008262 20                    1305 	.db #0x20	; 32
      008263 10                    1306 	.db #0x10	; 16
      008264 08                    1307 	.db #0x08	; 8
      008265 04                    1308 	.db #0x04	; 4
      008266 02                    1309 	.db #0x02	; 2
      008267 01                    1310 	.db #0x01	; 1
      008268 00                    1311 	.db #0x00	; 0
      008269 00                    1312 	.db #0x00	; 0
      00826A 70                    1313 	.db #0x70	; 112	'p'
      00826B 48                    1314 	.db #0x48	; 72	'H'
      00826C 08                    1315 	.db #0x08	; 8
      00826D 08                    1316 	.db #0x08	; 8
      00826E 08                    1317 	.db #0x08	; 8
      00826F F0                    1318 	.db #0xf0	; 240
      008270 00                    1319 	.db #0x00	; 0
      008271 00                    1320 	.db #0x00	; 0
      008272 00                    1321 	.db #0x00	; 0
      008273 00                    1322 	.db #0x00	; 0
      008274 30                    1323 	.db #0x30	; 48	'0'
      008275 36                    1324 	.db #0x36	; 54	'6'
      008276 01                    1325 	.db #0x01	; 1
      008277 00                    1326 	.db #0x00	; 0
      008278 00                    1327 	.db #0x00	; 0
      008279 C0                    1328 	.db #0xc0	; 192
      00827A 30                    1329 	.db #0x30	; 48	'0'
      00827B C8                    1330 	.db #0xc8	; 200
      00827C 28                    1331 	.db #0x28	; 40
      00827D E8                    1332 	.db #0xe8	; 232
      00827E 10                    1333 	.db #0x10	; 16
      00827F E0                    1334 	.db #0xe0	; 224
      008280 00                    1335 	.db #0x00	; 0
      008281 07                    1336 	.db #0x07	; 7
      008282 18                    1337 	.db #0x18	; 24
      008283 27                    1338 	.db #0x27	; 39
      008284 24                    1339 	.db #0x24	; 36
      008285 23                    1340 	.db #0x23	; 35
      008286 14                    1341 	.db #0x14	; 20
      008287 0B                    1342 	.db #0x0b	; 11
      008288 00                    1343 	.db #0x00	; 0
      008289 00                    1344 	.db #0x00	; 0
      00828A 00                    1345 	.db #0x00	; 0
      00828B C0                    1346 	.db #0xc0	; 192
      00828C 38                    1347 	.db #0x38	; 56	'8'
      00828D E0                    1348 	.db #0xe0	; 224
      00828E 00                    1349 	.db #0x00	; 0
      00828F 00                    1350 	.db #0x00	; 0
      008290 00                    1351 	.db #0x00	; 0
      008291 20                    1352 	.db #0x20	; 32
      008292 3C                    1353 	.db #0x3c	; 60
      008293 23                    1354 	.db #0x23	; 35
      008294 02                    1355 	.db #0x02	; 2
      008295 02                    1356 	.db #0x02	; 2
      008296 27                    1357 	.db #0x27	; 39
      008297 38                    1358 	.db #0x38	; 56	'8'
      008298 20                    1359 	.db #0x20	; 32
      008299 08                    1360 	.db #0x08	; 8
      00829A F8                    1361 	.db #0xf8	; 248
      00829B 88                    1362 	.db #0x88	; 136
      00829C 88                    1363 	.db #0x88	; 136
      00829D 88                    1364 	.db #0x88	; 136
      00829E 70                    1365 	.db #0x70	; 112	'p'
      00829F 00                    1366 	.db #0x00	; 0
      0082A0 00                    1367 	.db #0x00	; 0
      0082A1 20                    1368 	.db #0x20	; 32
      0082A2 3F                    1369 	.db #0x3f	; 63
      0082A3 20                    1370 	.db #0x20	; 32
      0082A4 20                    1371 	.db #0x20	; 32
      0082A5 20                    1372 	.db #0x20	; 32
      0082A6 11                    1373 	.db #0x11	; 17
      0082A7 0E                    1374 	.db #0x0e	; 14
      0082A8 00                    1375 	.db #0x00	; 0
      0082A9 C0                    1376 	.db #0xc0	; 192
      0082AA 30                    1377 	.db #0x30	; 48	'0'
      0082AB 08                    1378 	.db #0x08	; 8
      0082AC 08                    1379 	.db #0x08	; 8
      0082AD 08                    1380 	.db #0x08	; 8
      0082AE 08                    1381 	.db #0x08	; 8
      0082AF 38                    1382 	.db #0x38	; 56	'8'
      0082B0 00                    1383 	.db #0x00	; 0
      0082B1 07                    1384 	.db #0x07	; 7
      0082B2 18                    1385 	.db #0x18	; 24
      0082B3 20                    1386 	.db #0x20	; 32
      0082B4 20                    1387 	.db #0x20	; 32
      0082B5 20                    1388 	.db #0x20	; 32
      0082B6 10                    1389 	.db #0x10	; 16
      0082B7 08                    1390 	.db #0x08	; 8
      0082B8 00                    1391 	.db #0x00	; 0
      0082B9 08                    1392 	.db #0x08	; 8
      0082BA F8                    1393 	.db #0xf8	; 248
      0082BB 08                    1394 	.db #0x08	; 8
      0082BC 08                    1395 	.db #0x08	; 8
      0082BD 08                    1396 	.db #0x08	; 8
      0082BE 10                    1397 	.db #0x10	; 16
      0082BF E0                    1398 	.db #0xe0	; 224
      0082C0 00                    1399 	.db #0x00	; 0
      0082C1 20                    1400 	.db #0x20	; 32
      0082C2 3F                    1401 	.db #0x3f	; 63
      0082C3 20                    1402 	.db #0x20	; 32
      0082C4 20                    1403 	.db #0x20	; 32
      0082C5 20                    1404 	.db #0x20	; 32
      0082C6 10                    1405 	.db #0x10	; 16
      0082C7 0F                    1406 	.db #0x0f	; 15
      0082C8 00                    1407 	.db #0x00	; 0
      0082C9 08                    1408 	.db #0x08	; 8
      0082CA F8                    1409 	.db #0xf8	; 248
      0082CB 88                    1410 	.db #0x88	; 136
      0082CC 88                    1411 	.db #0x88	; 136
      0082CD E8                    1412 	.db #0xe8	; 232
      0082CE 08                    1413 	.db #0x08	; 8
      0082CF 10                    1414 	.db #0x10	; 16
      0082D0 00                    1415 	.db #0x00	; 0
      0082D1 20                    1416 	.db #0x20	; 32
      0082D2 3F                    1417 	.db #0x3f	; 63
      0082D3 20                    1418 	.db #0x20	; 32
      0082D4 20                    1419 	.db #0x20	; 32
      0082D5 23                    1420 	.db #0x23	; 35
      0082D6 20                    1421 	.db #0x20	; 32
      0082D7 18                    1422 	.db #0x18	; 24
      0082D8 00                    1423 	.db #0x00	; 0
      0082D9 08                    1424 	.db #0x08	; 8
      0082DA F8                    1425 	.db #0xf8	; 248
      0082DB 88                    1426 	.db #0x88	; 136
      0082DC 88                    1427 	.db #0x88	; 136
      0082DD E8                    1428 	.db #0xe8	; 232
      0082DE 08                    1429 	.db #0x08	; 8
      0082DF 10                    1430 	.db #0x10	; 16
      0082E0 00                    1431 	.db #0x00	; 0
      0082E1 20                    1432 	.db #0x20	; 32
      0082E2 3F                    1433 	.db #0x3f	; 63
      0082E3 20                    1434 	.db #0x20	; 32
      0082E4 00                    1435 	.db #0x00	; 0
      0082E5 03                    1436 	.db #0x03	; 3
      0082E6 00                    1437 	.db #0x00	; 0
      0082E7 00                    1438 	.db #0x00	; 0
      0082E8 00                    1439 	.db #0x00	; 0
      0082E9 C0                    1440 	.db #0xc0	; 192
      0082EA 30                    1441 	.db #0x30	; 48	'0'
      0082EB 08                    1442 	.db #0x08	; 8
      0082EC 08                    1443 	.db #0x08	; 8
      0082ED 08                    1444 	.db #0x08	; 8
      0082EE 38                    1445 	.db #0x38	; 56	'8'
      0082EF 00                    1446 	.db #0x00	; 0
      0082F0 00                    1447 	.db #0x00	; 0
      0082F1 07                    1448 	.db #0x07	; 7
      0082F2 18                    1449 	.db #0x18	; 24
      0082F3 20                    1450 	.db #0x20	; 32
      0082F4 20                    1451 	.db #0x20	; 32
      0082F5 22                    1452 	.db #0x22	; 34
      0082F6 1E                    1453 	.db #0x1e	; 30
      0082F7 02                    1454 	.db #0x02	; 2
      0082F8 00                    1455 	.db #0x00	; 0
      0082F9 08                    1456 	.db #0x08	; 8
      0082FA F8                    1457 	.db #0xf8	; 248
      0082FB 08                    1458 	.db #0x08	; 8
      0082FC 00                    1459 	.db #0x00	; 0
      0082FD 00                    1460 	.db #0x00	; 0
      0082FE 08                    1461 	.db #0x08	; 8
      0082FF F8                    1462 	.db #0xf8	; 248
      008300 08                    1463 	.db #0x08	; 8
      008301 20                    1464 	.db #0x20	; 32
      008302 3F                    1465 	.db #0x3f	; 63
      008303 21                    1466 	.db #0x21	; 33
      008304 01                    1467 	.db #0x01	; 1
      008305 01                    1468 	.db #0x01	; 1
      008306 21                    1469 	.db #0x21	; 33
      008307 3F                    1470 	.db #0x3f	; 63
      008308 20                    1471 	.db #0x20	; 32
      008309 00                    1472 	.db #0x00	; 0
      00830A 08                    1473 	.db #0x08	; 8
      00830B 08                    1474 	.db #0x08	; 8
      00830C F8                    1475 	.db #0xf8	; 248
      00830D 08                    1476 	.db #0x08	; 8
      00830E 08                    1477 	.db #0x08	; 8
      00830F 00                    1478 	.db #0x00	; 0
      008310 00                    1479 	.db #0x00	; 0
      008311 00                    1480 	.db #0x00	; 0
      008312 20                    1481 	.db #0x20	; 32
      008313 20                    1482 	.db #0x20	; 32
      008314 3F                    1483 	.db #0x3f	; 63
      008315 20                    1484 	.db #0x20	; 32
      008316 20                    1485 	.db #0x20	; 32
      008317 00                    1486 	.db #0x00	; 0
      008318 00                    1487 	.db #0x00	; 0
      008319 00                    1488 	.db #0x00	; 0
      00831A 00                    1489 	.db #0x00	; 0
      00831B 08                    1490 	.db #0x08	; 8
      00831C 08                    1491 	.db #0x08	; 8
      00831D F8                    1492 	.db #0xf8	; 248
      00831E 08                    1493 	.db #0x08	; 8
      00831F 08                    1494 	.db #0x08	; 8
      008320 00                    1495 	.db #0x00	; 0
      008321 C0                    1496 	.db #0xc0	; 192
      008322 80                    1497 	.db #0x80	; 128
      008323 80                    1498 	.db #0x80	; 128
      008324 80                    1499 	.db #0x80	; 128
      008325 7F                    1500 	.db #0x7f	; 127
      008326 00                    1501 	.db #0x00	; 0
      008327 00                    1502 	.db #0x00	; 0
      008328 00                    1503 	.db #0x00	; 0
      008329 08                    1504 	.db #0x08	; 8
      00832A F8                    1505 	.db #0xf8	; 248
      00832B 88                    1506 	.db #0x88	; 136
      00832C C0                    1507 	.db #0xc0	; 192
      00832D 28                    1508 	.db #0x28	; 40
      00832E 18                    1509 	.db #0x18	; 24
      00832F 08                    1510 	.db #0x08	; 8
      008330 00                    1511 	.db #0x00	; 0
      008331 20                    1512 	.db #0x20	; 32
      008332 3F                    1513 	.db #0x3f	; 63
      008333 20                    1514 	.db #0x20	; 32
      008334 01                    1515 	.db #0x01	; 1
      008335 26                    1516 	.db #0x26	; 38
      008336 38                    1517 	.db #0x38	; 56	'8'
      008337 20                    1518 	.db #0x20	; 32
      008338 00                    1519 	.db #0x00	; 0
      008339 08                    1520 	.db #0x08	; 8
      00833A F8                    1521 	.db #0xf8	; 248
      00833B 08                    1522 	.db #0x08	; 8
      00833C 00                    1523 	.db #0x00	; 0
      00833D 00                    1524 	.db #0x00	; 0
      00833E 00                    1525 	.db #0x00	; 0
      00833F 00                    1526 	.db #0x00	; 0
      008340 00                    1527 	.db #0x00	; 0
      008341 20                    1528 	.db #0x20	; 32
      008342 3F                    1529 	.db #0x3f	; 63
      008343 20                    1530 	.db #0x20	; 32
      008344 20                    1531 	.db #0x20	; 32
      008345 20                    1532 	.db #0x20	; 32
      008346 20                    1533 	.db #0x20	; 32
      008347 30                    1534 	.db #0x30	; 48	'0'
      008348 00                    1535 	.db #0x00	; 0
      008349 08                    1536 	.db #0x08	; 8
      00834A F8                    1537 	.db #0xf8	; 248
      00834B F8                    1538 	.db #0xf8	; 248
      00834C 00                    1539 	.db #0x00	; 0
      00834D F8                    1540 	.db #0xf8	; 248
      00834E F8                    1541 	.db #0xf8	; 248
      00834F 08                    1542 	.db #0x08	; 8
      008350 00                    1543 	.db #0x00	; 0
      008351 20                    1544 	.db #0x20	; 32
      008352 3F                    1545 	.db #0x3f	; 63
      008353 00                    1546 	.db #0x00	; 0
      008354 3F                    1547 	.db #0x3f	; 63
      008355 00                    1548 	.db #0x00	; 0
      008356 3F                    1549 	.db #0x3f	; 63
      008357 20                    1550 	.db #0x20	; 32
      008358 00                    1551 	.db #0x00	; 0
      008359 08                    1552 	.db #0x08	; 8
      00835A F8                    1553 	.db #0xf8	; 248
      00835B 30                    1554 	.db #0x30	; 48	'0'
      00835C C0                    1555 	.db #0xc0	; 192
      00835D 00                    1556 	.db #0x00	; 0
      00835E 08                    1557 	.db #0x08	; 8
      00835F F8                    1558 	.db #0xf8	; 248
      008360 08                    1559 	.db #0x08	; 8
      008361 20                    1560 	.db #0x20	; 32
      008362 3F                    1561 	.db #0x3f	; 63
      008363 20                    1562 	.db #0x20	; 32
      008364 00                    1563 	.db #0x00	; 0
      008365 07                    1564 	.db #0x07	; 7
      008366 18                    1565 	.db #0x18	; 24
      008367 3F                    1566 	.db #0x3f	; 63
      008368 00                    1567 	.db #0x00	; 0
      008369 E0                    1568 	.db #0xe0	; 224
      00836A 10                    1569 	.db #0x10	; 16
      00836B 08                    1570 	.db #0x08	; 8
      00836C 08                    1571 	.db #0x08	; 8
      00836D 08                    1572 	.db #0x08	; 8
      00836E 10                    1573 	.db #0x10	; 16
      00836F E0                    1574 	.db #0xe0	; 224
      008370 00                    1575 	.db #0x00	; 0
      008371 0F                    1576 	.db #0x0f	; 15
      008372 10                    1577 	.db #0x10	; 16
      008373 20                    1578 	.db #0x20	; 32
      008374 20                    1579 	.db #0x20	; 32
      008375 20                    1580 	.db #0x20	; 32
      008376 10                    1581 	.db #0x10	; 16
      008377 0F                    1582 	.db #0x0f	; 15
      008378 00                    1583 	.db #0x00	; 0
      008379 08                    1584 	.db #0x08	; 8
      00837A F8                    1585 	.db #0xf8	; 248
      00837B 08                    1586 	.db #0x08	; 8
      00837C 08                    1587 	.db #0x08	; 8
      00837D 08                    1588 	.db #0x08	; 8
      00837E 08                    1589 	.db #0x08	; 8
      00837F F0                    1590 	.db #0xf0	; 240
      008380 00                    1591 	.db #0x00	; 0
      008381 20                    1592 	.db #0x20	; 32
      008382 3F                    1593 	.db #0x3f	; 63
      008383 21                    1594 	.db #0x21	; 33
      008384 01                    1595 	.db #0x01	; 1
      008385 01                    1596 	.db #0x01	; 1
      008386 01                    1597 	.db #0x01	; 1
      008387 00                    1598 	.db #0x00	; 0
      008388 00                    1599 	.db #0x00	; 0
      008389 E0                    1600 	.db #0xe0	; 224
      00838A 10                    1601 	.db #0x10	; 16
      00838B 08                    1602 	.db #0x08	; 8
      00838C 08                    1603 	.db #0x08	; 8
      00838D 08                    1604 	.db #0x08	; 8
      00838E 10                    1605 	.db #0x10	; 16
      00838F E0                    1606 	.db #0xe0	; 224
      008390 00                    1607 	.db #0x00	; 0
      008391 0F                    1608 	.db #0x0f	; 15
      008392 18                    1609 	.db #0x18	; 24
      008393 24                    1610 	.db #0x24	; 36
      008394 24                    1611 	.db #0x24	; 36
      008395 38                    1612 	.db #0x38	; 56	'8'
      008396 50                    1613 	.db #0x50	; 80	'P'
      008397 4F                    1614 	.db #0x4f	; 79	'O'
      008398 00                    1615 	.db #0x00	; 0
      008399 08                    1616 	.db #0x08	; 8
      00839A F8                    1617 	.db #0xf8	; 248
      00839B 88                    1618 	.db #0x88	; 136
      00839C 88                    1619 	.db #0x88	; 136
      00839D 88                    1620 	.db #0x88	; 136
      00839E 88                    1621 	.db #0x88	; 136
      00839F 70                    1622 	.db #0x70	; 112	'p'
      0083A0 00                    1623 	.db #0x00	; 0
      0083A1 20                    1624 	.db #0x20	; 32
      0083A2 3F                    1625 	.db #0x3f	; 63
      0083A3 20                    1626 	.db #0x20	; 32
      0083A4 00                    1627 	.db #0x00	; 0
      0083A5 03                    1628 	.db #0x03	; 3
      0083A6 0C                    1629 	.db #0x0c	; 12
      0083A7 30                    1630 	.db #0x30	; 48	'0'
      0083A8 20                    1631 	.db #0x20	; 32
      0083A9 00                    1632 	.db #0x00	; 0
      0083AA 70                    1633 	.db #0x70	; 112	'p'
      0083AB 88                    1634 	.db #0x88	; 136
      0083AC 08                    1635 	.db #0x08	; 8
      0083AD 08                    1636 	.db #0x08	; 8
      0083AE 08                    1637 	.db #0x08	; 8
      0083AF 38                    1638 	.db #0x38	; 56	'8'
      0083B0 00                    1639 	.db #0x00	; 0
      0083B1 00                    1640 	.db #0x00	; 0
      0083B2 38                    1641 	.db #0x38	; 56	'8'
      0083B3 20                    1642 	.db #0x20	; 32
      0083B4 21                    1643 	.db #0x21	; 33
      0083B5 21                    1644 	.db #0x21	; 33
      0083B6 22                    1645 	.db #0x22	; 34
      0083B7 1C                    1646 	.db #0x1c	; 28
      0083B8 00                    1647 	.db #0x00	; 0
      0083B9 18                    1648 	.db #0x18	; 24
      0083BA 08                    1649 	.db #0x08	; 8
      0083BB 08                    1650 	.db #0x08	; 8
      0083BC F8                    1651 	.db #0xf8	; 248
      0083BD 08                    1652 	.db #0x08	; 8
      0083BE 08                    1653 	.db #0x08	; 8
      0083BF 18                    1654 	.db #0x18	; 24
      0083C0 00                    1655 	.db #0x00	; 0
      0083C1 00                    1656 	.db #0x00	; 0
      0083C2 00                    1657 	.db #0x00	; 0
      0083C3 20                    1658 	.db #0x20	; 32
      0083C4 3F                    1659 	.db #0x3f	; 63
      0083C5 20                    1660 	.db #0x20	; 32
      0083C6 00                    1661 	.db #0x00	; 0
      0083C7 00                    1662 	.db #0x00	; 0
      0083C8 00                    1663 	.db #0x00	; 0
      0083C9 08                    1664 	.db #0x08	; 8
      0083CA F8                    1665 	.db #0xf8	; 248
      0083CB 08                    1666 	.db #0x08	; 8
      0083CC 00                    1667 	.db #0x00	; 0
      0083CD 00                    1668 	.db #0x00	; 0
      0083CE 08                    1669 	.db #0x08	; 8
      0083CF F8                    1670 	.db #0xf8	; 248
      0083D0 08                    1671 	.db #0x08	; 8
      0083D1 00                    1672 	.db #0x00	; 0
      0083D2 1F                    1673 	.db #0x1f	; 31
      0083D3 20                    1674 	.db #0x20	; 32
      0083D4 20                    1675 	.db #0x20	; 32
      0083D5 20                    1676 	.db #0x20	; 32
      0083D6 20                    1677 	.db #0x20	; 32
      0083D7 1F                    1678 	.db #0x1f	; 31
      0083D8 00                    1679 	.db #0x00	; 0
      0083D9 08                    1680 	.db #0x08	; 8
      0083DA 78                    1681 	.db #0x78	; 120	'x'
      0083DB 88                    1682 	.db #0x88	; 136
      0083DC 00                    1683 	.db #0x00	; 0
      0083DD 00                    1684 	.db #0x00	; 0
      0083DE C8                    1685 	.db #0xc8	; 200
      0083DF 38                    1686 	.db #0x38	; 56	'8'
      0083E0 08                    1687 	.db #0x08	; 8
      0083E1 00                    1688 	.db #0x00	; 0
      0083E2 00                    1689 	.db #0x00	; 0
      0083E3 07                    1690 	.db #0x07	; 7
      0083E4 38                    1691 	.db #0x38	; 56	'8'
      0083E5 0E                    1692 	.db #0x0e	; 14
      0083E6 01                    1693 	.db #0x01	; 1
      0083E7 00                    1694 	.db #0x00	; 0
      0083E8 00                    1695 	.db #0x00	; 0
      0083E9 F8                    1696 	.db #0xf8	; 248
      0083EA 08                    1697 	.db #0x08	; 8
      0083EB 00                    1698 	.db #0x00	; 0
      0083EC F8                    1699 	.db #0xf8	; 248
      0083ED 00                    1700 	.db #0x00	; 0
      0083EE 08                    1701 	.db #0x08	; 8
      0083EF F8                    1702 	.db #0xf8	; 248
      0083F0 00                    1703 	.db #0x00	; 0
      0083F1 03                    1704 	.db #0x03	; 3
      0083F2 3C                    1705 	.db #0x3c	; 60
      0083F3 07                    1706 	.db #0x07	; 7
      0083F4 00                    1707 	.db #0x00	; 0
      0083F5 07                    1708 	.db #0x07	; 7
      0083F6 3C                    1709 	.db #0x3c	; 60
      0083F7 03                    1710 	.db #0x03	; 3
      0083F8 00                    1711 	.db #0x00	; 0
      0083F9 08                    1712 	.db #0x08	; 8
      0083FA 18                    1713 	.db #0x18	; 24
      0083FB 68                    1714 	.db #0x68	; 104	'h'
      0083FC 80                    1715 	.db #0x80	; 128
      0083FD 80                    1716 	.db #0x80	; 128
      0083FE 68                    1717 	.db #0x68	; 104	'h'
      0083FF 18                    1718 	.db #0x18	; 24
      008400 08                    1719 	.db #0x08	; 8
      008401 20                    1720 	.db #0x20	; 32
      008402 30                    1721 	.db #0x30	; 48	'0'
      008403 2C                    1722 	.db #0x2c	; 44
      008404 03                    1723 	.db #0x03	; 3
      008405 03                    1724 	.db #0x03	; 3
      008406 2C                    1725 	.db #0x2c	; 44
      008407 30                    1726 	.db #0x30	; 48	'0'
      008408 20                    1727 	.db #0x20	; 32
      008409 08                    1728 	.db #0x08	; 8
      00840A 38                    1729 	.db #0x38	; 56	'8'
      00840B C8                    1730 	.db #0xc8	; 200
      00840C 00                    1731 	.db #0x00	; 0
      00840D C8                    1732 	.db #0xc8	; 200
      00840E 38                    1733 	.db #0x38	; 56	'8'
      00840F 08                    1734 	.db #0x08	; 8
      008410 00                    1735 	.db #0x00	; 0
      008411 00                    1736 	.db #0x00	; 0
      008412 00                    1737 	.db #0x00	; 0
      008413 20                    1738 	.db #0x20	; 32
      008414 3F                    1739 	.db #0x3f	; 63
      008415 20                    1740 	.db #0x20	; 32
      008416 00                    1741 	.db #0x00	; 0
      008417 00                    1742 	.db #0x00	; 0
      008418 00                    1743 	.db #0x00	; 0
      008419 10                    1744 	.db #0x10	; 16
      00841A 08                    1745 	.db #0x08	; 8
      00841B 08                    1746 	.db #0x08	; 8
      00841C 08                    1747 	.db #0x08	; 8
      00841D C8                    1748 	.db #0xc8	; 200
      00841E 38                    1749 	.db #0x38	; 56	'8'
      00841F 08                    1750 	.db #0x08	; 8
      008420 00                    1751 	.db #0x00	; 0
      008421 20                    1752 	.db #0x20	; 32
      008422 38                    1753 	.db #0x38	; 56	'8'
      008423 26                    1754 	.db #0x26	; 38
      008424 21                    1755 	.db #0x21	; 33
      008425 20                    1756 	.db #0x20	; 32
      008426 20                    1757 	.db #0x20	; 32
      008427 18                    1758 	.db #0x18	; 24
      008428 00                    1759 	.db #0x00	; 0
      008429 00                    1760 	.db #0x00	; 0
      00842A 00                    1761 	.db #0x00	; 0
      00842B 00                    1762 	.db #0x00	; 0
      00842C FE                    1763 	.db #0xfe	; 254
      00842D 02                    1764 	.db #0x02	; 2
      00842E 02                    1765 	.db #0x02	; 2
      00842F 02                    1766 	.db #0x02	; 2
      008430 00                    1767 	.db #0x00	; 0
      008431 00                    1768 	.db #0x00	; 0
      008432 00                    1769 	.db #0x00	; 0
      008433 00                    1770 	.db #0x00	; 0
      008434 7F                    1771 	.db #0x7f	; 127
      008435 40                    1772 	.db #0x40	; 64
      008436 40                    1773 	.db #0x40	; 64
      008437 40                    1774 	.db #0x40	; 64
      008438 00                    1775 	.db #0x00	; 0
      008439 00                    1776 	.db #0x00	; 0
      00843A 0C                    1777 	.db #0x0c	; 12
      00843B 30                    1778 	.db #0x30	; 48	'0'
      00843C C0                    1779 	.db #0xc0	; 192
      00843D 00                    1780 	.db #0x00	; 0
      00843E 00                    1781 	.db #0x00	; 0
      00843F 00                    1782 	.db #0x00	; 0
      008440 00                    1783 	.db #0x00	; 0
      008441 00                    1784 	.db #0x00	; 0
      008442 00                    1785 	.db #0x00	; 0
      008443 00                    1786 	.db #0x00	; 0
      008444 01                    1787 	.db #0x01	; 1
      008445 06                    1788 	.db #0x06	; 6
      008446 38                    1789 	.db #0x38	; 56	'8'
      008447 C0                    1790 	.db #0xc0	; 192
      008448 00                    1791 	.db #0x00	; 0
      008449 00                    1792 	.db #0x00	; 0
      00844A 02                    1793 	.db #0x02	; 2
      00844B 02                    1794 	.db #0x02	; 2
      00844C 02                    1795 	.db #0x02	; 2
      00844D FE                    1796 	.db #0xfe	; 254
      00844E 00                    1797 	.db #0x00	; 0
      00844F 00                    1798 	.db #0x00	; 0
      008450 00                    1799 	.db #0x00	; 0
      008451 00                    1800 	.db #0x00	; 0
      008452 40                    1801 	.db #0x40	; 64
      008453 40                    1802 	.db #0x40	; 64
      008454 40                    1803 	.db #0x40	; 64
      008455 7F                    1804 	.db #0x7f	; 127
      008456 00                    1805 	.db #0x00	; 0
      008457 00                    1806 	.db #0x00	; 0
      008458 00                    1807 	.db #0x00	; 0
      008459 00                    1808 	.db #0x00	; 0
      00845A 00                    1809 	.db #0x00	; 0
      00845B 04                    1810 	.db #0x04	; 4
      00845C 02                    1811 	.db #0x02	; 2
      00845D 02                    1812 	.db #0x02	; 2
      00845E 02                    1813 	.db #0x02	; 2
      00845F 04                    1814 	.db #0x04	; 4
      008460 00                    1815 	.db #0x00	; 0
      008461 00                    1816 	.db #0x00	; 0
      008462 00                    1817 	.db #0x00	; 0
      008463 00                    1818 	.db #0x00	; 0
      008464 00                    1819 	.db #0x00	; 0
      008465 00                    1820 	.db #0x00	; 0
      008466 00                    1821 	.db #0x00	; 0
      008467 00                    1822 	.db #0x00	; 0
      008468 00                    1823 	.db #0x00	; 0
      008469 00                    1824 	.db #0x00	; 0
      00846A 00                    1825 	.db #0x00	; 0
      00846B 00                    1826 	.db #0x00	; 0
      00846C 00                    1827 	.db #0x00	; 0
      00846D 00                    1828 	.db #0x00	; 0
      00846E 00                    1829 	.db #0x00	; 0
      00846F 00                    1830 	.db #0x00	; 0
      008470 00                    1831 	.db #0x00	; 0
      008471 80                    1832 	.db #0x80	; 128
      008472 80                    1833 	.db #0x80	; 128
      008473 80                    1834 	.db #0x80	; 128
      008474 80                    1835 	.db #0x80	; 128
      008475 80                    1836 	.db #0x80	; 128
      008476 80                    1837 	.db #0x80	; 128
      008477 80                    1838 	.db #0x80	; 128
      008478 80                    1839 	.db #0x80	; 128
      008479 00                    1840 	.db #0x00	; 0
      00847A 02                    1841 	.db #0x02	; 2
      00847B 02                    1842 	.db #0x02	; 2
      00847C 04                    1843 	.db #0x04	; 4
      00847D 00                    1844 	.db #0x00	; 0
      00847E 00                    1845 	.db #0x00	; 0
      00847F 00                    1846 	.db #0x00	; 0
      008480 00                    1847 	.db #0x00	; 0
      008481 00                    1848 	.db #0x00	; 0
      008482 00                    1849 	.db #0x00	; 0
      008483 00                    1850 	.db #0x00	; 0
      008484 00                    1851 	.db #0x00	; 0
      008485 00                    1852 	.db #0x00	; 0
      008486 00                    1853 	.db #0x00	; 0
      008487 00                    1854 	.db #0x00	; 0
      008488 00                    1855 	.db #0x00	; 0
      008489 00                    1856 	.db #0x00	; 0
      00848A 00                    1857 	.db #0x00	; 0
      00848B 80                    1858 	.db #0x80	; 128
      00848C 80                    1859 	.db #0x80	; 128
      00848D 80                    1860 	.db #0x80	; 128
      00848E 80                    1861 	.db #0x80	; 128
      00848F 00                    1862 	.db #0x00	; 0
      008490 00                    1863 	.db #0x00	; 0
      008491 00                    1864 	.db #0x00	; 0
      008492 19                    1865 	.db #0x19	; 25
      008493 24                    1866 	.db #0x24	; 36
      008494 22                    1867 	.db #0x22	; 34
      008495 22                    1868 	.db #0x22	; 34
      008496 22                    1869 	.db #0x22	; 34
      008497 3F                    1870 	.db #0x3f	; 63
      008498 20                    1871 	.db #0x20	; 32
      008499 08                    1872 	.db #0x08	; 8
      00849A F8                    1873 	.db #0xf8	; 248
      00849B 00                    1874 	.db #0x00	; 0
      00849C 80                    1875 	.db #0x80	; 128
      00849D 80                    1876 	.db #0x80	; 128
      00849E 00                    1877 	.db #0x00	; 0
      00849F 00                    1878 	.db #0x00	; 0
      0084A0 00                    1879 	.db #0x00	; 0
      0084A1 00                    1880 	.db #0x00	; 0
      0084A2 3F                    1881 	.db #0x3f	; 63
      0084A3 11                    1882 	.db #0x11	; 17
      0084A4 20                    1883 	.db #0x20	; 32
      0084A5 20                    1884 	.db #0x20	; 32
      0084A6 11                    1885 	.db #0x11	; 17
      0084A7 0E                    1886 	.db #0x0e	; 14
      0084A8 00                    1887 	.db #0x00	; 0
      0084A9 00                    1888 	.db #0x00	; 0
      0084AA 00                    1889 	.db #0x00	; 0
      0084AB 00                    1890 	.db #0x00	; 0
      0084AC 80                    1891 	.db #0x80	; 128
      0084AD 80                    1892 	.db #0x80	; 128
      0084AE 80                    1893 	.db #0x80	; 128
      0084AF 00                    1894 	.db #0x00	; 0
      0084B0 00                    1895 	.db #0x00	; 0
      0084B1 00                    1896 	.db #0x00	; 0
      0084B2 0E                    1897 	.db #0x0e	; 14
      0084B3 11                    1898 	.db #0x11	; 17
      0084B4 20                    1899 	.db #0x20	; 32
      0084B5 20                    1900 	.db #0x20	; 32
      0084B6 20                    1901 	.db #0x20	; 32
      0084B7 11                    1902 	.db #0x11	; 17
      0084B8 00                    1903 	.db #0x00	; 0
      0084B9 00                    1904 	.db #0x00	; 0
      0084BA 00                    1905 	.db #0x00	; 0
      0084BB 00                    1906 	.db #0x00	; 0
      0084BC 80                    1907 	.db #0x80	; 128
      0084BD 80                    1908 	.db #0x80	; 128
      0084BE 88                    1909 	.db #0x88	; 136
      0084BF F8                    1910 	.db #0xf8	; 248
      0084C0 00                    1911 	.db #0x00	; 0
      0084C1 00                    1912 	.db #0x00	; 0
      0084C2 0E                    1913 	.db #0x0e	; 14
      0084C3 11                    1914 	.db #0x11	; 17
      0084C4 20                    1915 	.db #0x20	; 32
      0084C5 20                    1916 	.db #0x20	; 32
      0084C6 10                    1917 	.db #0x10	; 16
      0084C7 3F                    1918 	.db #0x3f	; 63
      0084C8 20                    1919 	.db #0x20	; 32
      0084C9 00                    1920 	.db #0x00	; 0
      0084CA 00                    1921 	.db #0x00	; 0
      0084CB 80                    1922 	.db #0x80	; 128
      0084CC 80                    1923 	.db #0x80	; 128
      0084CD 80                    1924 	.db #0x80	; 128
      0084CE 80                    1925 	.db #0x80	; 128
      0084CF 00                    1926 	.db #0x00	; 0
      0084D0 00                    1927 	.db #0x00	; 0
      0084D1 00                    1928 	.db #0x00	; 0
      0084D2 1F                    1929 	.db #0x1f	; 31
      0084D3 22                    1930 	.db #0x22	; 34
      0084D4 22                    1931 	.db #0x22	; 34
      0084D5 22                    1932 	.db #0x22	; 34
      0084D6 22                    1933 	.db #0x22	; 34
      0084D7 13                    1934 	.db #0x13	; 19
      0084D8 00                    1935 	.db #0x00	; 0
      0084D9 00                    1936 	.db #0x00	; 0
      0084DA 80                    1937 	.db #0x80	; 128
      0084DB 80                    1938 	.db #0x80	; 128
      0084DC F0                    1939 	.db #0xf0	; 240
      0084DD 88                    1940 	.db #0x88	; 136
      0084DE 88                    1941 	.db #0x88	; 136
      0084DF 88                    1942 	.db #0x88	; 136
      0084E0 18                    1943 	.db #0x18	; 24
      0084E1 00                    1944 	.db #0x00	; 0
      0084E2 20                    1945 	.db #0x20	; 32
      0084E3 20                    1946 	.db #0x20	; 32
      0084E4 3F                    1947 	.db #0x3f	; 63
      0084E5 20                    1948 	.db #0x20	; 32
      0084E6 20                    1949 	.db #0x20	; 32
      0084E7 00                    1950 	.db #0x00	; 0
      0084E8 00                    1951 	.db #0x00	; 0
      0084E9 00                    1952 	.db #0x00	; 0
      0084EA 00                    1953 	.db #0x00	; 0
      0084EB 80                    1954 	.db #0x80	; 128
      0084EC 80                    1955 	.db #0x80	; 128
      0084ED 80                    1956 	.db #0x80	; 128
      0084EE 80                    1957 	.db #0x80	; 128
      0084EF 80                    1958 	.db #0x80	; 128
      0084F0 00                    1959 	.db #0x00	; 0
      0084F1 00                    1960 	.db #0x00	; 0
      0084F2 6B                    1961 	.db #0x6b	; 107	'k'
      0084F3 94                    1962 	.db #0x94	; 148
      0084F4 94                    1963 	.db #0x94	; 148
      0084F5 94                    1964 	.db #0x94	; 148
      0084F6 93                    1965 	.db #0x93	; 147
      0084F7 60                    1966 	.db #0x60	; 96
      0084F8 00                    1967 	.db #0x00	; 0
      0084F9 08                    1968 	.db #0x08	; 8
      0084FA F8                    1969 	.db #0xf8	; 248
      0084FB 00                    1970 	.db #0x00	; 0
      0084FC 80                    1971 	.db #0x80	; 128
      0084FD 80                    1972 	.db #0x80	; 128
      0084FE 80                    1973 	.db #0x80	; 128
      0084FF 00                    1974 	.db #0x00	; 0
      008500 00                    1975 	.db #0x00	; 0
      008501 20                    1976 	.db #0x20	; 32
      008502 3F                    1977 	.db #0x3f	; 63
      008503 21                    1978 	.db #0x21	; 33
      008504 00                    1979 	.db #0x00	; 0
      008505 00                    1980 	.db #0x00	; 0
      008506 20                    1981 	.db #0x20	; 32
      008507 3F                    1982 	.db #0x3f	; 63
      008508 20                    1983 	.db #0x20	; 32
      008509 00                    1984 	.db #0x00	; 0
      00850A 80                    1985 	.db #0x80	; 128
      00850B 98                    1986 	.db #0x98	; 152
      00850C 98                    1987 	.db #0x98	; 152
      00850D 00                    1988 	.db #0x00	; 0
      00850E 00                    1989 	.db #0x00	; 0
      00850F 00                    1990 	.db #0x00	; 0
      008510 00                    1991 	.db #0x00	; 0
      008511 00                    1992 	.db #0x00	; 0
      008512 20                    1993 	.db #0x20	; 32
      008513 20                    1994 	.db #0x20	; 32
      008514 3F                    1995 	.db #0x3f	; 63
      008515 20                    1996 	.db #0x20	; 32
      008516 20                    1997 	.db #0x20	; 32
      008517 00                    1998 	.db #0x00	; 0
      008518 00                    1999 	.db #0x00	; 0
      008519 00                    2000 	.db #0x00	; 0
      00851A 00                    2001 	.db #0x00	; 0
      00851B 00                    2002 	.db #0x00	; 0
      00851C 80                    2003 	.db #0x80	; 128
      00851D 98                    2004 	.db #0x98	; 152
      00851E 98                    2005 	.db #0x98	; 152
      00851F 00                    2006 	.db #0x00	; 0
      008520 00                    2007 	.db #0x00	; 0
      008521 00                    2008 	.db #0x00	; 0
      008522 C0                    2009 	.db #0xc0	; 192
      008523 80                    2010 	.db #0x80	; 128
      008524 80                    2011 	.db #0x80	; 128
      008525 80                    2012 	.db #0x80	; 128
      008526 7F                    2013 	.db #0x7f	; 127
      008527 00                    2014 	.db #0x00	; 0
      008528 00                    2015 	.db #0x00	; 0
      008529 08                    2016 	.db #0x08	; 8
      00852A F8                    2017 	.db #0xf8	; 248
      00852B 00                    2018 	.db #0x00	; 0
      00852C 00                    2019 	.db #0x00	; 0
      00852D 80                    2020 	.db #0x80	; 128
      00852E 80                    2021 	.db #0x80	; 128
      00852F 80                    2022 	.db #0x80	; 128
      008530 00                    2023 	.db #0x00	; 0
      008531 20                    2024 	.db #0x20	; 32
      008532 3F                    2025 	.db #0x3f	; 63
      008533 24                    2026 	.db #0x24	; 36
      008534 02                    2027 	.db #0x02	; 2
      008535 2D                    2028 	.db #0x2d	; 45
      008536 30                    2029 	.db #0x30	; 48	'0'
      008537 20                    2030 	.db #0x20	; 32
      008538 00                    2031 	.db #0x00	; 0
      008539 00                    2032 	.db #0x00	; 0
      00853A 08                    2033 	.db #0x08	; 8
      00853B 08                    2034 	.db #0x08	; 8
      00853C F8                    2035 	.db #0xf8	; 248
      00853D 00                    2036 	.db #0x00	; 0
      00853E 00                    2037 	.db #0x00	; 0
      00853F 00                    2038 	.db #0x00	; 0
      008540 00                    2039 	.db #0x00	; 0
      008541 00                    2040 	.db #0x00	; 0
      008542 20                    2041 	.db #0x20	; 32
      008543 20                    2042 	.db #0x20	; 32
      008544 3F                    2043 	.db #0x3f	; 63
      008545 20                    2044 	.db #0x20	; 32
      008546 20                    2045 	.db #0x20	; 32
      008547 00                    2046 	.db #0x00	; 0
      008548 00                    2047 	.db #0x00	; 0
      008549 80                    2048 	.db #0x80	; 128
      00854A 80                    2049 	.db #0x80	; 128
      00854B 80                    2050 	.db #0x80	; 128
      00854C 80                    2051 	.db #0x80	; 128
      00854D 80                    2052 	.db #0x80	; 128
      00854E 80                    2053 	.db #0x80	; 128
      00854F 80                    2054 	.db #0x80	; 128
      008550 00                    2055 	.db #0x00	; 0
      008551 20                    2056 	.db #0x20	; 32
      008552 3F                    2057 	.db #0x3f	; 63
      008553 20                    2058 	.db #0x20	; 32
      008554 00                    2059 	.db #0x00	; 0
      008555 3F                    2060 	.db #0x3f	; 63
      008556 20                    2061 	.db #0x20	; 32
      008557 00                    2062 	.db #0x00	; 0
      008558 3F                    2063 	.db #0x3f	; 63
      008559 80                    2064 	.db #0x80	; 128
      00855A 80                    2065 	.db #0x80	; 128
      00855B 00                    2066 	.db #0x00	; 0
      00855C 80                    2067 	.db #0x80	; 128
      00855D 80                    2068 	.db #0x80	; 128
      00855E 80                    2069 	.db #0x80	; 128
      00855F 00                    2070 	.db #0x00	; 0
      008560 00                    2071 	.db #0x00	; 0
      008561 20                    2072 	.db #0x20	; 32
      008562 3F                    2073 	.db #0x3f	; 63
      008563 21                    2074 	.db #0x21	; 33
      008564 00                    2075 	.db #0x00	; 0
      008565 00                    2076 	.db #0x00	; 0
      008566 20                    2077 	.db #0x20	; 32
      008567 3F                    2078 	.db #0x3f	; 63
      008568 20                    2079 	.db #0x20	; 32
      008569 00                    2080 	.db #0x00	; 0
      00856A 00                    2081 	.db #0x00	; 0
      00856B 80                    2082 	.db #0x80	; 128
      00856C 80                    2083 	.db #0x80	; 128
      00856D 80                    2084 	.db #0x80	; 128
      00856E 80                    2085 	.db #0x80	; 128
      00856F 00                    2086 	.db #0x00	; 0
      008570 00                    2087 	.db #0x00	; 0
      008571 00                    2088 	.db #0x00	; 0
      008572 1F                    2089 	.db #0x1f	; 31
      008573 20                    2090 	.db #0x20	; 32
      008574 20                    2091 	.db #0x20	; 32
      008575 20                    2092 	.db #0x20	; 32
      008576 20                    2093 	.db #0x20	; 32
      008577 1F                    2094 	.db #0x1f	; 31
      008578 00                    2095 	.db #0x00	; 0
      008579 80                    2096 	.db #0x80	; 128
      00857A 80                    2097 	.db #0x80	; 128
      00857B 00                    2098 	.db #0x00	; 0
      00857C 80                    2099 	.db #0x80	; 128
      00857D 80                    2100 	.db #0x80	; 128
      00857E 00                    2101 	.db #0x00	; 0
      00857F 00                    2102 	.db #0x00	; 0
      008580 00                    2103 	.db #0x00	; 0
      008581 80                    2104 	.db #0x80	; 128
      008582 FF                    2105 	.db #0xff	; 255
      008583 A1                    2106 	.db #0xa1	; 161
      008584 20                    2107 	.db #0x20	; 32
      008585 20                    2108 	.db #0x20	; 32
      008586 11                    2109 	.db #0x11	; 17
      008587 0E                    2110 	.db #0x0e	; 14
      008588 00                    2111 	.db #0x00	; 0
      008589 00                    2112 	.db #0x00	; 0
      00858A 00                    2113 	.db #0x00	; 0
      00858B 00                    2114 	.db #0x00	; 0
      00858C 80                    2115 	.db #0x80	; 128
      00858D 80                    2116 	.db #0x80	; 128
      00858E 80                    2117 	.db #0x80	; 128
      00858F 80                    2118 	.db #0x80	; 128
      008590 00                    2119 	.db #0x00	; 0
      008591 00                    2120 	.db #0x00	; 0
      008592 0E                    2121 	.db #0x0e	; 14
      008593 11                    2122 	.db #0x11	; 17
      008594 20                    2123 	.db #0x20	; 32
      008595 20                    2124 	.db #0x20	; 32
      008596 A0                    2125 	.db #0xa0	; 160
      008597 FF                    2126 	.db #0xff	; 255
      008598 80                    2127 	.db #0x80	; 128
      008599 80                    2128 	.db #0x80	; 128
      00859A 80                    2129 	.db #0x80	; 128
      00859B 80                    2130 	.db #0x80	; 128
      00859C 00                    2131 	.db #0x00	; 0
      00859D 80                    2132 	.db #0x80	; 128
      00859E 80                    2133 	.db #0x80	; 128
      00859F 80                    2134 	.db #0x80	; 128
      0085A0 00                    2135 	.db #0x00	; 0
      0085A1 20                    2136 	.db #0x20	; 32
      0085A2 20                    2137 	.db #0x20	; 32
      0085A3 3F                    2138 	.db #0x3f	; 63
      0085A4 21                    2139 	.db #0x21	; 33
      0085A5 20                    2140 	.db #0x20	; 32
      0085A6 00                    2141 	.db #0x00	; 0
      0085A7 01                    2142 	.db #0x01	; 1
      0085A8 00                    2143 	.db #0x00	; 0
      0085A9 00                    2144 	.db #0x00	; 0
      0085AA 00                    2145 	.db #0x00	; 0
      0085AB 80                    2146 	.db #0x80	; 128
      0085AC 80                    2147 	.db #0x80	; 128
      0085AD 80                    2148 	.db #0x80	; 128
      0085AE 80                    2149 	.db #0x80	; 128
      0085AF 80                    2150 	.db #0x80	; 128
      0085B0 00                    2151 	.db #0x00	; 0
      0085B1 00                    2152 	.db #0x00	; 0
      0085B2 33                    2153 	.db #0x33	; 51	'3'
      0085B3 24                    2154 	.db #0x24	; 36
      0085B4 24                    2155 	.db #0x24	; 36
      0085B5 24                    2156 	.db #0x24	; 36
      0085B6 24                    2157 	.db #0x24	; 36
      0085B7 19                    2158 	.db #0x19	; 25
      0085B8 00                    2159 	.db #0x00	; 0
      0085B9 00                    2160 	.db #0x00	; 0
      0085BA 80                    2161 	.db #0x80	; 128
      0085BB 80                    2162 	.db #0x80	; 128
      0085BC E0                    2163 	.db #0xe0	; 224
      0085BD 80                    2164 	.db #0x80	; 128
      0085BE 80                    2165 	.db #0x80	; 128
      0085BF 00                    2166 	.db #0x00	; 0
      0085C0 00                    2167 	.db #0x00	; 0
      0085C1 00                    2168 	.db #0x00	; 0
      0085C2 00                    2169 	.db #0x00	; 0
      0085C3 00                    2170 	.db #0x00	; 0
      0085C4 1F                    2171 	.db #0x1f	; 31
      0085C5 20                    2172 	.db #0x20	; 32
      0085C6 20                    2173 	.db #0x20	; 32
      0085C7 00                    2174 	.db #0x00	; 0
      0085C8 00                    2175 	.db #0x00	; 0
      0085C9 80                    2176 	.db #0x80	; 128
      0085CA 80                    2177 	.db #0x80	; 128
      0085CB 00                    2178 	.db #0x00	; 0
      0085CC 00                    2179 	.db #0x00	; 0
      0085CD 00                    2180 	.db #0x00	; 0
      0085CE 80                    2181 	.db #0x80	; 128
      0085CF 80                    2182 	.db #0x80	; 128
      0085D0 00                    2183 	.db #0x00	; 0
      0085D1 00                    2184 	.db #0x00	; 0
      0085D2 1F                    2185 	.db #0x1f	; 31
      0085D3 20                    2186 	.db #0x20	; 32
      0085D4 20                    2187 	.db #0x20	; 32
      0085D5 20                    2188 	.db #0x20	; 32
      0085D6 10                    2189 	.db #0x10	; 16
      0085D7 3F                    2190 	.db #0x3f	; 63
      0085D8 20                    2191 	.db #0x20	; 32
      0085D9 80                    2192 	.db #0x80	; 128
      0085DA 80                    2193 	.db #0x80	; 128
      0085DB 80                    2194 	.db #0x80	; 128
      0085DC 00                    2195 	.db #0x00	; 0
      0085DD 00                    2196 	.db #0x00	; 0
      0085DE 80                    2197 	.db #0x80	; 128
      0085DF 80                    2198 	.db #0x80	; 128
      0085E0 80                    2199 	.db #0x80	; 128
      0085E1 00                    2200 	.db #0x00	; 0
      0085E2 01                    2201 	.db #0x01	; 1
      0085E3 0E                    2202 	.db #0x0e	; 14
      0085E4 30                    2203 	.db #0x30	; 48	'0'
      0085E5 08                    2204 	.db #0x08	; 8
      0085E6 06                    2205 	.db #0x06	; 6
      0085E7 01                    2206 	.db #0x01	; 1
      0085E8 00                    2207 	.db #0x00	; 0
      0085E9 80                    2208 	.db #0x80	; 128
      0085EA 80                    2209 	.db #0x80	; 128
      0085EB 00                    2210 	.db #0x00	; 0
      0085EC 80                    2211 	.db #0x80	; 128
      0085ED 00                    2212 	.db #0x00	; 0
      0085EE 80                    2213 	.db #0x80	; 128
      0085EF 80                    2214 	.db #0x80	; 128
      0085F0 80                    2215 	.db #0x80	; 128
      0085F1 0F                    2216 	.db #0x0f	; 15
      0085F2 30                    2217 	.db #0x30	; 48	'0'
      0085F3 0C                    2218 	.db #0x0c	; 12
      0085F4 03                    2219 	.db #0x03	; 3
      0085F5 0C                    2220 	.db #0x0c	; 12
      0085F6 30                    2221 	.db #0x30	; 48	'0'
      0085F7 0F                    2222 	.db #0x0f	; 15
      0085F8 00                    2223 	.db #0x00	; 0
      0085F9 00                    2224 	.db #0x00	; 0
      0085FA 80                    2225 	.db #0x80	; 128
      0085FB 80                    2226 	.db #0x80	; 128
      0085FC 00                    2227 	.db #0x00	; 0
      0085FD 80                    2228 	.db #0x80	; 128
      0085FE 80                    2229 	.db #0x80	; 128
      0085FF 80                    2230 	.db #0x80	; 128
      008600 00                    2231 	.db #0x00	; 0
      008601 00                    2232 	.db #0x00	; 0
      008602 20                    2233 	.db #0x20	; 32
      008603 31                    2234 	.db #0x31	; 49	'1'
      008604 2E                    2235 	.db #0x2e	; 46
      008605 0E                    2236 	.db #0x0e	; 14
      008606 31                    2237 	.db #0x31	; 49	'1'
      008607 20                    2238 	.db #0x20	; 32
      008608 00                    2239 	.db #0x00	; 0
      008609 80                    2240 	.db #0x80	; 128
      00860A 80                    2241 	.db #0x80	; 128
      00860B 80                    2242 	.db #0x80	; 128
      00860C 00                    2243 	.db #0x00	; 0
      00860D 00                    2244 	.db #0x00	; 0
      00860E 80                    2245 	.db #0x80	; 128
      00860F 80                    2246 	.db #0x80	; 128
      008610 80                    2247 	.db #0x80	; 128
      008611 80                    2248 	.db #0x80	; 128
      008612 81                    2249 	.db #0x81	; 129
      008613 8E                    2250 	.db #0x8e	; 142
      008614 70                    2251 	.db #0x70	; 112	'p'
      008615 18                    2252 	.db #0x18	; 24
      008616 06                    2253 	.db #0x06	; 6
      008617 01                    2254 	.db #0x01	; 1
      008618 00                    2255 	.db #0x00	; 0
      008619 00                    2256 	.db #0x00	; 0
      00861A 80                    2257 	.db #0x80	; 128
      00861B 80                    2258 	.db #0x80	; 128
      00861C 80                    2259 	.db #0x80	; 128
      00861D 80                    2260 	.db #0x80	; 128
      00861E 80                    2261 	.db #0x80	; 128
      00861F 80                    2262 	.db #0x80	; 128
      008620 00                    2263 	.db #0x00	; 0
      008621 00                    2264 	.db #0x00	; 0
      008622 21                    2265 	.db #0x21	; 33
      008623 30                    2266 	.db #0x30	; 48	'0'
      008624 2C                    2267 	.db #0x2c	; 44
      008625 22                    2268 	.db #0x22	; 34
      008626 21                    2269 	.db #0x21	; 33
      008627 30                    2270 	.db #0x30	; 48	'0'
      008628 00                    2271 	.db #0x00	; 0
      008629 00                    2272 	.db #0x00	; 0
      00862A 00                    2273 	.db #0x00	; 0
      00862B 00                    2274 	.db #0x00	; 0
      00862C 00                    2275 	.db #0x00	; 0
      00862D 80                    2276 	.db #0x80	; 128
      00862E 7C                    2277 	.db #0x7c	; 124
      00862F 02                    2278 	.db #0x02	; 2
      008630 02                    2279 	.db #0x02	; 2
      008631 00                    2280 	.db #0x00	; 0
      008632 00                    2281 	.db #0x00	; 0
      008633 00                    2282 	.db #0x00	; 0
      008634 00                    2283 	.db #0x00	; 0
      008635 00                    2284 	.db #0x00	; 0
      008636 3F                    2285 	.db #0x3f	; 63
      008637 40                    2286 	.db #0x40	; 64
      008638 40                    2287 	.db #0x40	; 64
      008639 00                    2288 	.db #0x00	; 0
      00863A 00                    2289 	.db #0x00	; 0
      00863B 00                    2290 	.db #0x00	; 0
      00863C 00                    2291 	.db #0x00	; 0
      00863D FF                    2292 	.db #0xff	; 255
      00863E 00                    2293 	.db #0x00	; 0
      00863F 00                    2294 	.db #0x00	; 0
      008640 00                    2295 	.db #0x00	; 0
      008641 00                    2296 	.db #0x00	; 0
      008642 00                    2297 	.db #0x00	; 0
      008643 00                    2298 	.db #0x00	; 0
      008644 00                    2299 	.db #0x00	; 0
      008645 FF                    2300 	.db #0xff	; 255
      008646 00                    2301 	.db #0x00	; 0
      008647 00                    2302 	.db #0x00	; 0
      008648 00                    2303 	.db #0x00	; 0
      008649 00                    2304 	.db #0x00	; 0
      00864A 02                    2305 	.db #0x02	; 2
      00864B 02                    2306 	.db #0x02	; 2
      00864C 7C                    2307 	.db #0x7c	; 124
      00864D 80                    2308 	.db #0x80	; 128
      00864E 00                    2309 	.db #0x00	; 0
      00864F 00                    2310 	.db #0x00	; 0
      008650 00                    2311 	.db #0x00	; 0
      008651 00                    2312 	.db #0x00	; 0
      008652 40                    2313 	.db #0x40	; 64
      008653 40                    2314 	.db #0x40	; 64
      008654 3F                    2315 	.db #0x3f	; 63
      008655 00                    2316 	.db #0x00	; 0
      008656 00                    2317 	.db #0x00	; 0
      008657 00                    2318 	.db #0x00	; 0
      008658 00                    2319 	.db #0x00	; 0
      008659 00                    2320 	.db #0x00	; 0
      00865A 06                    2321 	.db #0x06	; 6
      00865B 01                    2322 	.db #0x01	; 1
      00865C 01                    2323 	.db #0x01	; 1
      00865D 02                    2324 	.db #0x02	; 2
      00865E 02                    2325 	.db #0x02	; 2
      00865F 04                    2326 	.db #0x04	; 4
      008660 04                    2327 	.db #0x04	; 4
      008661 00                    2328 	.db #0x00	; 0
      008662 00                    2329 	.db #0x00	; 0
      008663 00                    2330 	.db #0x00	; 0
      008664 00                    2331 	.db #0x00	; 0
      008665 00                    2332 	.db #0x00	; 0
      008666 00                    2333 	.db #0x00	; 0
      008667 00                    2334 	.db #0x00	; 0
      008668 00                    2335 	.db #0x00	; 0
                                   2336 	.area INITIALIZER
                                   2337 	.area CABS (ABS)
