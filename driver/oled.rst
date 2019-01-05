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
      008742                         67 _delay_ms:
      008742 52 02            [ 2]   68 	sub	sp, #2
                                     69 ;	driver/oled.c: 48: while(ms)
      008744 16 05            [ 2]   70 	ldw	y, (0x05, sp)
      008746 17 01            [ 2]   71 	ldw	(0x01, sp), y
      008748                         72 00104$:
      008748 1E 01            [ 2]   73 	ldw	x, (0x01, sp)
      00874A 27 11            [ 1]   74 	jreq	00106$
                                     75 ;	driver/oled.c: 51: while(a--);
      00874C AE 07 08         [ 2]   76 	ldw	x, #0x0708
      00874F                         77 00101$:
      00874F 90 93            [ 1]   78 	ldw	y, x
      008751 5A               [ 2]   79 	decw	x
      008752 90 5D            [ 2]   80 	tnzw	y
      008754 26 F9            [ 1]   81 	jrne	00101$
                                     82 ;	driver/oled.c: 52: ms--;
      008756 1E 01            [ 2]   83 	ldw	x, (0x01, sp)
      008758 5A               [ 2]   84 	decw	x
      008759 1F 01            [ 2]   85 	ldw	(0x01, sp), x
      00875B 20 EB            [ 2]   86 	jra	00104$
      00875D                         87 00106$:
                                     88 ;	driver/oled.c: 54: return;
                                     89 ;	driver/oled.c: 55: }
      00875D 5B 02            [ 2]   90 	addw	sp, #2
      00875F 81               [ 4]   91 	ret
                                     92 ;	driver/oled.c: 77: void OLED_WR_Byte(u8 dat,u8 cmd)
                                     93 ;	-----------------------------------------
                                     94 ;	 function OLED_WR_Byte
                                     95 ;	-----------------------------------------
      008760                         96 _OLED_WR_Byte:
      008760 88               [ 1]   97 	push	a
                                     98 ;	driver/oled.c: 80: if(cmd)
      008761 0D 05            [ 1]   99 	tnz	(0x05, sp)
      008763 27 0D            [ 1]  100 	jreq	00102$
                                    101 ;	driver/oled.c: 81: OLED_DC_Set();
      008765 4B 10            [ 1]  102 	push	#0x10
      008767 4B 0A            [ 1]  103 	push	#0x0a
      008769 4B 50            [ 1]  104 	push	#0x50
      00876B CD 8C 6F         [ 4]  105 	call	_GPIO_WriteHigh
      00876E 5B 03            [ 2]  106 	addw	sp, #3
      008770 20 0B            [ 2]  107 	jra	00103$
      008772                        108 00102$:
                                    109 ;	driver/oled.c: 83: OLED_DC_Clr();
      008772 4B 10            [ 1]  110 	push	#0x10
      008774 4B 0A            [ 1]  111 	push	#0x0a
      008776 4B 50            [ 1]  112 	push	#0x50
      008778 CD 8C 76         [ 4]  113 	call	_GPIO_WriteLow
      00877B 5B 03            [ 2]  114 	addw	sp, #3
      00877D                        115 00103$:
                                    116 ;	driver/oled.c: 84: OLED_CS_Clr();
      00877D 4B 20            [ 1]  117 	push	#0x20
      00877F 4B 0A            [ 1]  118 	push	#0x0a
      008781 4B 50            [ 1]  119 	push	#0x50
      008783 CD 8C 76         [ 4]  120 	call	_GPIO_WriteLow
      008786 5B 03            [ 2]  121 	addw	sp, #3
                                    122 ;	driver/oled.c: 85: for(i=0;i<8;i++)
      008788 0F 01            [ 1]  123 	clr	(0x01, sp)
      00878A                        124 00108$:
                                    125 ;	driver/oled.c: 87: OLED_SCLK_Clr();
      00878A 4B 02            [ 1]  126 	push	#0x02
      00878C 4B 0A            [ 1]  127 	push	#0x0a
      00878E 4B 50            [ 1]  128 	push	#0x50
      008790 CD 8C 76         [ 4]  129 	call	_GPIO_WriteLow
      008793 5B 03            [ 2]  130 	addw	sp, #3
                                    131 ;	driver/oled.c: 88: if(dat&0x80)
      008795 7B 04            [ 1]  132 	ld	a, (0x04, sp)
      008797 2A 0D            [ 1]  133 	jrpl	00105$
                                    134 ;	driver/oled.c: 90: OLED_SDIN_Set();
      008799 4B 04            [ 1]  135 	push	#0x04
      00879B 4B 0A            [ 1]  136 	push	#0x0a
      00879D 4B 50            [ 1]  137 	push	#0x50
      00879F CD 8C 6F         [ 4]  138 	call	_GPIO_WriteHigh
      0087A2 5B 03            [ 2]  139 	addw	sp, #3
      0087A4 20 0B            [ 2]  140 	jra	00106$
      0087A6                        141 00105$:
                                    142 ;	driver/oled.c: 93: OLED_SDIN_Clr();
      0087A6 4B 04            [ 1]  143 	push	#0x04
      0087A8 4B 0A            [ 1]  144 	push	#0x0a
      0087AA 4B 50            [ 1]  145 	push	#0x50
      0087AC CD 8C 76         [ 4]  146 	call	_GPIO_WriteLow
      0087AF 5B 03            [ 2]  147 	addw	sp, #3
      0087B1                        148 00106$:
                                    149 ;	driver/oled.c: 94: OLED_SCLK_Set();
      0087B1 4B 02            [ 1]  150 	push	#0x02
      0087B3 4B 0A            [ 1]  151 	push	#0x0a
      0087B5 4B 50            [ 1]  152 	push	#0x50
      0087B7 CD 8C 6F         [ 4]  153 	call	_GPIO_WriteHigh
      0087BA 5B 03            [ 2]  154 	addw	sp, #3
                                    155 ;	driver/oled.c: 95: dat<<=1;
      0087BC 08 04            [ 1]  156 	sll	(0x04, sp)
                                    157 ;	driver/oled.c: 85: for(i=0;i<8;i++)
      0087BE 0C 01            [ 1]  158 	inc	(0x01, sp)
      0087C0 7B 01            [ 1]  159 	ld	a, (0x01, sp)
      0087C2 A1 08            [ 1]  160 	cp	a, #0x08
      0087C4 25 C4            [ 1]  161 	jrc	00108$
                                    162 ;	driver/oled.c: 97: OLED_CS_Set();
      0087C6 4B 20            [ 1]  163 	push	#0x20
      0087C8 4B 0A            [ 1]  164 	push	#0x0a
      0087CA 4B 50            [ 1]  165 	push	#0x50
      0087CC CD 8C 6F         [ 4]  166 	call	_GPIO_WriteHigh
      0087CF 5B 03            [ 2]  167 	addw	sp, #3
                                    168 ;	driver/oled.c: 98: OLED_DC_Set();
      0087D1 4B 10            [ 1]  169 	push	#0x10
      0087D3 4B 0A            [ 1]  170 	push	#0x0a
      0087D5 4B 50            [ 1]  171 	push	#0x50
      0087D7 CD 8C 6F         [ 4]  172 	call	_GPIO_WriteHigh
                                    173 ;	driver/oled.c: 99: }
      0087DA 5B 04            [ 2]  174 	addw	sp, #4
      0087DC 81               [ 4]  175 	ret
                                    176 ;	driver/oled.c: 101: void OLED_Set_Pos(unsigned char x, unsigned char y)
                                    177 ;	-----------------------------------------
                                    178 ;	 function OLED_Set_Pos
                                    179 ;	-----------------------------------------
      0087DD                        180 _OLED_Set_Pos:
      0087DD 52 02            [ 2]  181 	sub	sp, #2
                                    182 ;	driver/oled.c: 103: OLED_WR_Byte(0xb0+y,OLED_CMD);
      0087DF 7B 06            [ 1]  183 	ld	a, (0x06, sp)
      0087E1 AB B0            [ 1]  184 	add	a, #0xb0
      0087E3 4B 00            [ 1]  185 	push	#0x00
      0087E5 88               [ 1]  186 	push	a
      0087E6 CD 87 60         [ 4]  187 	call	_OLED_WR_Byte
      0087E9 5B 02            [ 2]  188 	addw	sp, #2
                                    189 ;	driver/oled.c: 104: OLED_WR_Byte(((x&0xf0)>>4)|0x10,OLED_CMD);
      0087EB 7B 05            [ 1]  190 	ld	a, (0x05, sp)
      0087ED 0F 01            [ 1]  191 	clr	(0x01, sp)
      0087EF 88               [ 1]  192 	push	a
      0087F0 A4 F0            [ 1]  193 	and	a, #0xf0
      0087F2 97               [ 1]  194 	ld	xl, a
      0087F3 4F               [ 1]  195 	clr	a
      0087F4 95               [ 1]  196 	ld	xh, a
      0087F5 84               [ 1]  197 	pop	a
      0087F6 57               [ 2]  198 	sraw	x
      0087F7 57               [ 2]  199 	sraw	x
      0087F8 57               [ 2]  200 	sraw	x
      0087F9 57               [ 2]  201 	sraw	x
      0087FA 88               [ 1]  202 	push	a
      0087FB 9F               [ 1]  203 	ld	a, xl
      0087FC AA 10            [ 1]  204 	or	a, #0x10
      0087FE 97               [ 1]  205 	ld	xl, a
      0087FF 4B 00            [ 1]  206 	push	#0x00
      008801 89               [ 2]  207 	pushw	x
      008802 5B 01            [ 2]  208 	addw	sp, #1
      008804 CD 87 60         [ 4]  209 	call	_OLED_WR_Byte
      008807 5B 02            [ 2]  210 	addw	sp, #2
      008809 84               [ 1]  211 	pop	a
                                    212 ;	driver/oled.c: 105: OLED_WR_Byte((x&0x0f)|0x01,OLED_CMD);
      00880A A4 0F            [ 1]  213 	and	a, #0x0f
      00880C 95               [ 1]  214 	ld	xh, a
      00880D 4F               [ 1]  215 	clr	a
      00880E 02               [ 1]  216 	rlwa	x
      00880F AA 01            [ 1]  217 	or	a, #0x01
      008811 4B 00            [ 1]  218 	push	#0x00
      008813 88               [ 1]  219 	push	a
      008814 CD 87 60         [ 4]  220 	call	_OLED_WR_Byte
                                    221 ;	driver/oled.c: 106: }
      008817 5B 04            [ 2]  222 	addw	sp, #4
      008819 81               [ 4]  223 	ret
                                    224 ;	driver/oled.c: 108: void OLED_Display_On(void)
                                    225 ;	-----------------------------------------
                                    226 ;	 function OLED_Display_On
                                    227 ;	-----------------------------------------
      00881A                        228 _OLED_Display_On:
                                    229 ;	driver/oled.c: 110: OLED_WR_Byte(0X8D,OLED_CMD);  //SET DCDC命令
      00881A 4B 00            [ 1]  230 	push	#0x00
      00881C 4B 8D            [ 1]  231 	push	#0x8d
      00881E CD 87 60         [ 4]  232 	call	_OLED_WR_Byte
      008821 5B 02            [ 2]  233 	addw	sp, #2
                                    234 ;	driver/oled.c: 111: OLED_WR_Byte(0X14,OLED_CMD);  //DCDC ON
      008823 4B 00            [ 1]  235 	push	#0x00
      008825 4B 14            [ 1]  236 	push	#0x14
      008827 CD 87 60         [ 4]  237 	call	_OLED_WR_Byte
      00882A 5B 02            [ 2]  238 	addw	sp, #2
                                    239 ;	driver/oled.c: 112: OLED_WR_Byte(0XAF,OLED_CMD);  //DISPLAY ON
      00882C 4B 00            [ 1]  240 	push	#0x00
      00882E 4B AF            [ 1]  241 	push	#0xaf
      008830 CD 87 60         [ 4]  242 	call	_OLED_WR_Byte
      008833 5B 02            [ 2]  243 	addw	sp, #2
                                    244 ;	driver/oled.c: 113: }
      008835 81               [ 4]  245 	ret
                                    246 ;	driver/oled.c: 115: void OLED_Display_Off(void)
                                    247 ;	-----------------------------------------
                                    248 ;	 function OLED_Display_Off
                                    249 ;	-----------------------------------------
      008836                        250 _OLED_Display_Off:
                                    251 ;	driver/oled.c: 117: OLED_WR_Byte(0X8D,OLED_CMD);  //SET DCDC命令
      008836 4B 00            [ 1]  252 	push	#0x00
      008838 4B 8D            [ 1]  253 	push	#0x8d
      00883A CD 87 60         [ 4]  254 	call	_OLED_WR_Byte
      00883D 5B 02            [ 2]  255 	addw	sp, #2
                                    256 ;	driver/oled.c: 118: OLED_WR_Byte(0X10,OLED_CMD);  //DCDC OFF
      00883F 4B 00            [ 1]  257 	push	#0x00
      008841 4B 10            [ 1]  258 	push	#0x10
      008843 CD 87 60         [ 4]  259 	call	_OLED_WR_Byte
      008846 5B 02            [ 2]  260 	addw	sp, #2
                                    261 ;	driver/oled.c: 119: OLED_WR_Byte(0XAE,OLED_CMD);  //DISPLAY OFF
      008848 4B 00            [ 1]  262 	push	#0x00
      00884A 4B AE            [ 1]  263 	push	#0xae
      00884C CD 87 60         [ 4]  264 	call	_OLED_WR_Byte
      00884F 5B 02            [ 2]  265 	addw	sp, #2
                                    266 ;	driver/oled.c: 120: }
      008851 81               [ 4]  267 	ret
                                    268 ;	driver/oled.c: 122: void OLED_Clear(void)
                                    269 ;	-----------------------------------------
                                    270 ;	 function OLED_Clear
                                    271 ;	-----------------------------------------
      008852                        272 _OLED_Clear:
      008852 88               [ 1]  273 	push	a
                                    274 ;	driver/oled.c: 125: for(i=0;i<8;i++)
      008853 0F 01            [ 1]  275 	clr	(0x01, sp)
      008855                        276 00105$:
                                    277 ;	driver/oled.c: 127: OLED_WR_Byte (0xb0+i,OLED_CMD);    //设置页地址（0~7）
      008855 7B 01            [ 1]  278 	ld	a, (0x01, sp)
      008857 AB B0            [ 1]  279 	add	a, #0xb0
      008859 4B 00            [ 1]  280 	push	#0x00
      00885B 88               [ 1]  281 	push	a
      00885C CD 87 60         [ 4]  282 	call	_OLED_WR_Byte
      00885F 5B 02            [ 2]  283 	addw	sp, #2
                                    284 ;	driver/oled.c: 128: OLED_WR_Byte (0x00,OLED_CMD);      //设置显示位置—列低地址
      008861 4B 00            [ 1]  285 	push	#0x00
      008863 4B 00            [ 1]  286 	push	#0x00
      008865 CD 87 60         [ 4]  287 	call	_OLED_WR_Byte
      008868 5B 02            [ 2]  288 	addw	sp, #2
                                    289 ;	driver/oled.c: 129: OLED_WR_Byte (0x10,OLED_CMD);      //设置显示位置—列高地址
      00886A 4B 00            [ 1]  290 	push	#0x00
      00886C 4B 10            [ 1]  291 	push	#0x10
      00886E CD 87 60         [ 4]  292 	call	_OLED_WR_Byte
      008871 5B 02            [ 2]  293 	addw	sp, #2
                                    294 ;	driver/oled.c: 130: for(n=0;n<128;n++)OLED_WR_Byte(0,OLED_DATA);
      008873 4F               [ 1]  295 	clr	a
      008874                        296 00103$:
      008874 88               [ 1]  297 	push	a
      008875 4B 01            [ 1]  298 	push	#0x01
      008877 4B 00            [ 1]  299 	push	#0x00
      008879 CD 87 60         [ 4]  300 	call	_OLED_WR_Byte
      00887C 5B 02            [ 2]  301 	addw	sp, #2
      00887E 84               [ 1]  302 	pop	a
      00887F 4C               [ 1]  303 	inc	a
      008880 A1 80            [ 1]  304 	cp	a, #0x80
      008882 25 F0            [ 1]  305 	jrc	00103$
                                    306 ;	driver/oled.c: 125: for(i=0;i<8;i++)
      008884 0C 01            [ 1]  307 	inc	(0x01, sp)
      008886 7B 01            [ 1]  308 	ld	a, (0x01, sp)
      008888 A1 08            [ 1]  309 	cp	a, #0x08
      00888A 25 C9            [ 1]  310 	jrc	00105$
                                    311 ;	driver/oled.c: 132: }
      00888C 84               [ 1]  312 	pop	a
      00888D 81               [ 4]  313 	ret
                                    314 ;	driver/oled.c: 140: void OLED_ShowChar(u8 x,u8 y,u8 chr)
                                    315 ;	-----------------------------------------
                                    316 ;	 function OLED_ShowChar
                                    317 ;	-----------------------------------------
      00888E                        318 _OLED_ShowChar:
      00888E 52 04            [ 2]  319 	sub	sp, #4
                                    320 ;	driver/oled.c: 143: c=chr-' ';//得到偏移后的值
      008890 7B 09            [ 1]  321 	ld	a, (0x09, sp)
      008892 A0 20            [ 1]  322 	sub	a, #0x20
      008894 6B 04            [ 1]  323 	ld	(0x04, sp), a
                                    324 ;	driver/oled.c: 144: if(x>Max_Column-1){x=0;y=y+2;}
      008896 7B 07            [ 1]  325 	ld	a, (0x07, sp)
      008898 A1 7F            [ 1]  326 	cp	a, #0x7f
      00889A 23 08            [ 2]  327 	jrule	00102$
      00889C 0F 07            [ 1]  328 	clr	(0x07, sp)
      00889E 7B 08            [ 1]  329 	ld	a, (0x08, sp)
      0088A0 AB 02            [ 1]  330 	add	a, #0x02
      0088A2 6B 08            [ 1]  331 	ld	(0x08, sp), a
      0088A4                        332 00102$:
                                    333 ;	driver/oled.c: 147: OLED_Set_Pos(x,y);
      0088A4 7B 08            [ 1]  334 	ld	a, (0x08, sp)
      0088A6 88               [ 1]  335 	push	a
      0088A7 7B 08            [ 1]  336 	ld	a, (0x08, sp)
      0088A9 88               [ 1]  337 	push	a
      0088AA CD 87 DD         [ 4]  338 	call	_OLED_Set_Pos
      0088AD 5B 02            [ 2]  339 	addw	sp, #2
                                    340 ;	driver/oled.c: 148: for(i=0;i<8;i++)
      0088AF 0F 03            [ 1]  341 	clr	(0x03, sp)
      0088B1                        342 00105$:
                                    343 ;	driver/oled.c: 149: OLED_WR_Byte(F8X16[c*16+i],OLED_DATA);
      0088B1 5F               [ 1]  344 	clrw	x
      0088B2 7B 04            [ 1]  345 	ld	a, (0x04, sp)
      0088B4 97               [ 1]  346 	ld	xl, a
      0088B5 58               [ 2]  347 	sllw	x
      0088B6 58               [ 2]  348 	sllw	x
      0088B7 58               [ 2]  349 	sllw	x
      0088B8 58               [ 2]  350 	sllw	x
      0088B9 1F 01            [ 2]  351 	ldw	(0x01, sp), x
      0088BB 5F               [ 1]  352 	clrw	x
      0088BC 7B 03            [ 1]  353 	ld	a, (0x03, sp)
      0088BE 97               [ 1]  354 	ld	xl, a
      0088BF 72 FB 01         [ 2]  355 	addw	x, (0x01, sp)
      0088C2 1C 80 48         [ 2]  356 	addw	x, #_F8X16
      0088C5 F6               [ 1]  357 	ld	a, (x)
      0088C6 4B 01            [ 1]  358 	push	#0x01
      0088C8 88               [ 1]  359 	push	a
      0088C9 CD 87 60         [ 4]  360 	call	_OLED_WR_Byte
      0088CC 5B 02            [ 2]  361 	addw	sp, #2
                                    362 ;	driver/oled.c: 148: for(i=0;i<8;i++)
      0088CE 0C 03            [ 1]  363 	inc	(0x03, sp)
      0088D0 7B 03            [ 1]  364 	ld	a, (0x03, sp)
      0088D2 A1 08            [ 1]  365 	cp	a, #0x08
      0088D4 25 DB            [ 1]  366 	jrc	00105$
                                    367 ;	driver/oled.c: 150: OLED_Set_Pos(x,y+1);
      0088D6 7B 08            [ 1]  368 	ld	a, (0x08, sp)
      0088D8 4C               [ 1]  369 	inc	a
      0088D9 88               [ 1]  370 	push	a
      0088DA 7B 08            [ 1]  371 	ld	a, (0x08, sp)
      0088DC 88               [ 1]  372 	push	a
      0088DD CD 87 DD         [ 4]  373 	call	_OLED_Set_Pos
      0088E0 5B 02            [ 2]  374 	addw	sp, #2
                                    375 ;	driver/oled.c: 151: for(i=0;i<8;i++)
      0088E2 0F 03            [ 1]  376 	clr	(0x03, sp)
      0088E4                        377 00107$:
                                    378 ;	driver/oled.c: 152: OLED_WR_Byte(F8X16[c*16+i+8],OLED_DATA);
      0088E4 5F               [ 1]  379 	clrw	x
      0088E5 7B 03            [ 1]  380 	ld	a, (0x03, sp)
      0088E7 97               [ 1]  381 	ld	xl, a
      0088E8 72 FB 01         [ 2]  382 	addw	x, (0x01, sp)
      0088EB 1C 00 08         [ 2]  383 	addw	x, #0x0008
      0088EE 1C 80 48         [ 2]  384 	addw	x, #_F8X16
      0088F1 F6               [ 1]  385 	ld	a, (x)
      0088F2 4B 01            [ 1]  386 	push	#0x01
      0088F4 88               [ 1]  387 	push	a
      0088F5 CD 87 60         [ 4]  388 	call	_OLED_WR_Byte
      0088F8 5B 02            [ 2]  389 	addw	sp, #2
                                    390 ;	driver/oled.c: 151: for(i=0;i<8;i++)
      0088FA 0C 03            [ 1]  391 	inc	(0x03, sp)
      0088FC 7B 03            [ 1]  392 	ld	a, (0x03, sp)
      0088FE A1 08            [ 1]  393 	cp	a, #0x08
      008900 25 E2            [ 1]  394 	jrc	00107$
                                    395 ;	driver/oled.c: 163: }
      008902 5B 04            [ 2]  396 	addw	sp, #4
      008904 81               [ 4]  397 	ret
                                    398 ;	driver/oled.c: 165: u32 oled_pow(u8 m,u8 n)
                                    399 ;	-----------------------------------------
                                    400 ;	 function oled_pow
                                    401 ;	-----------------------------------------
      008905                        402 _oled_pow:
      008905 52 09            [ 2]  403 	sub	sp, #9
                                    404 ;	driver/oled.c: 167: u32 result=1;
      008907 5F               [ 1]  405 	clrw	x
      008908 5C               [ 1]  406 	incw	x
      008909 0F 07            [ 1]  407 	clr	(0x07, sp)
      00890B 0F 06            [ 1]  408 	clr	(0x06, sp)
                                    409 ;	driver/oled.c: 168: while(n--)result*=m;
      00890D 7B 0D            [ 1]  410 	ld	a, (0x0d, sp)
      00890F 6B 01            [ 1]  411 	ld	(0x01, sp), a
      008911                        412 00101$:
      008911 7B 01            [ 1]  413 	ld	a, (0x01, sp)
      008913 0A 01            [ 1]  414 	dec	(0x01, sp)
      008915 4D               [ 1]  415 	tnz	a
      008916 27 1D            [ 1]  416 	jreq	00103$
      008918 7B 0C            [ 1]  417 	ld	a, (0x0c, sp)
      00891A 6B 05            [ 1]  418 	ld	(0x05, sp), a
      00891C 90 5F            [ 1]  419 	clrw	y
      00891E 0F 02            [ 1]  420 	clr	(0x02, sp)
      008920 7B 05            [ 1]  421 	ld	a, (0x05, sp)
      008922 88               [ 1]  422 	push	a
      008923 90 89            [ 2]  423 	pushw	y
      008925 7B 05            [ 1]  424 	ld	a, (0x05, sp)
      008927 88               [ 1]  425 	push	a
      008928 89               [ 2]  426 	pushw	x
      008929 1E 0C            [ 2]  427 	ldw	x, (0x0c, sp)
      00892B 89               [ 2]  428 	pushw	x
      00892C CD 9A 83         [ 4]  429 	call	__mullong
      00892F 5B 08            [ 2]  430 	addw	sp, #8
      008931 17 06            [ 2]  431 	ldw	(0x06, sp), y
      008933 20 DC            [ 2]  432 	jra	00101$
      008935                        433 00103$:
                                    434 ;	driver/oled.c: 169: return result;
      008935 16 06            [ 2]  435 	ldw	y, (0x06, sp)
                                    436 ;	driver/oled.c: 170: }
      008937 5B 09            [ 2]  437 	addw	sp, #9
      008939 81               [ 4]  438 	ret
                                    439 ;	driver/oled.c: 177: void OLED_ShowNum(u8 x,u8 y,u32 num,u8 len,u8 size2)
                                    440 ;	-----------------------------------------
                                    441 ;	 function OLED_ShowNum
                                    442 ;	-----------------------------------------
      00893A                        443 _OLED_ShowNum:
      00893A 52 07            [ 2]  444 	sub	sp, #7
                                    445 ;	driver/oled.c: 180: u8 enshow=0;
      00893C 0F 05            [ 1]  446 	clr	(0x05, sp)
                                    447 ;	driver/oled.c: 181: for(t=0;t<len;t++)
      00893E 0F 07            [ 1]  448 	clr	(0x07, sp)
      008940                        449 00110$:
      008940 7B 07            [ 1]  450 	ld	a, (0x07, sp)
      008942 11 10            [ 1]  451 	cp	a, (0x10, sp)
      008944 25 03            [ 1]  452 	jrc	00139$
      008946 CC 89 D4         [ 2]  453 	jp	00111$
      008949                        454 00139$:
                                    455 ;	driver/oled.c: 183: temp=(num/oled_pow(10,len-t-1))%10;
      008949 7B 10            [ 1]  456 	ld	a, (0x10, sp)
      00894B 10 07            [ 1]  457 	sub	a, (0x07, sp)
      00894D 4A               [ 1]  458 	dec	a
      00894E 88               [ 1]  459 	push	a
      00894F 4B 0A            [ 1]  460 	push	#0x0a
      008951 CD 89 05         [ 4]  461 	call	_oled_pow
      008954 5B 02            [ 2]  462 	addw	sp, #2
      008956 89               [ 2]  463 	pushw	x
      008957 90 89            [ 2]  464 	pushw	y
      008959 1E 12            [ 2]  465 	ldw	x, (0x12, sp)
      00895B 89               [ 2]  466 	pushw	x
      00895C 1E 12            [ 2]  467 	ldw	x, (0x12, sp)
      00895E 89               [ 2]  468 	pushw	x
      00895F CD 99 D2         [ 4]  469 	call	__divulong
      008962 5B 08            [ 2]  470 	addw	sp, #8
      008964 4B 0A            [ 1]  471 	push	#0x0a
      008966 4B 00            [ 1]  472 	push	#0x00
      008968 4B 00            [ 1]  473 	push	#0x00
      00896A 4B 00            [ 1]  474 	push	#0x00
      00896C 89               [ 2]  475 	pushw	x
      00896D 90 89            [ 2]  476 	pushw	y
      00896F CD 99 14         [ 4]  477 	call	__modulong
      008972 5B 08            [ 2]  478 	addw	sp, #8
      008974 9F               [ 1]  479 	ld	a, xl
      008975 6B 06            [ 1]  480 	ld	(0x06, sp), a
                                    481 ;	driver/oled.c: 188: OLED_ShowChar(x+(size2/2)*t,y,' ');
      008977 5F               [ 1]  482 	clrw	x
      008978 7B 11            [ 1]  483 	ld	a, (0x11, sp)
      00897A 97               [ 1]  484 	ld	xl, a
      00897B 7B 07            [ 1]  485 	ld	a, (0x07, sp)
      00897D 6B 01            [ 1]  486 	ld	(0x01, sp), a
      00897F 7B 0A            [ 1]  487 	ld	a, (0x0a, sp)
      008981 6B 02            [ 1]  488 	ld	(0x02, sp), a
      008983 4B 02            [ 1]  489 	push	#0x02
      008985 4B 00            [ 1]  490 	push	#0x00
      008987 89               [ 2]  491 	pushw	x
      008988 CD 9A FF         [ 4]  492 	call	__divsint
      00898B 5B 04            [ 2]  493 	addw	sp, #4
      00898D 7B 01            [ 1]  494 	ld	a, (0x01, sp)
      00898F 42               [ 4]  495 	mul	x, a
      008990 9F               [ 1]  496 	ld	a, xl
      008991 1B 02            [ 1]  497 	add	a, (0x02, sp)
      008993 90 97            [ 1]  498 	ld	yl, a
                                    499 ;	driver/oled.c: 184: if(enshow==0&&t<(len-1))
      008995 0D 05            [ 1]  500 	tnz	(0x05, sp)
      008997 26 26            [ 1]  501 	jrne	00105$
      008999 5F               [ 1]  502 	clrw	x
      00899A 7B 10            [ 1]  503 	ld	a, (0x10, sp)
      00899C 97               [ 1]  504 	ld	xl, a
      00899D 5A               [ 2]  505 	decw	x
      00899E 1F 03            [ 2]  506 	ldw	(0x03, sp), x
      0089A0 5F               [ 1]  507 	clrw	x
      0089A1 7B 07            [ 1]  508 	ld	a, (0x07, sp)
      0089A3 97               [ 1]  509 	ld	xl, a
      0089A4 13 03            [ 2]  510 	cpw	x, (0x03, sp)
      0089A6 2E 17            [ 1]  511 	jrsge	00105$
                                    512 ;	driver/oled.c: 186: if(temp==0)
      0089A8 0D 06            [ 1]  513 	tnz	(0x06, sp)
      0089AA 26 0F            [ 1]  514 	jrne	00102$
                                    515 ;	driver/oled.c: 188: OLED_ShowChar(x+(size2/2)*t,y,' ');
      0089AC 4B 20            [ 1]  516 	push	#0x20
      0089AE 7B 0C            [ 1]  517 	ld	a, (0x0c, sp)
      0089B0 88               [ 1]  518 	push	a
      0089B1 90 9F            [ 1]  519 	ld	a, yl
      0089B3 88               [ 1]  520 	push	a
      0089B4 CD 88 8E         [ 4]  521 	call	_OLED_ShowChar
      0089B7 5B 03            [ 2]  522 	addw	sp, #3
                                    523 ;	driver/oled.c: 189: continue;
      0089B9 20 14            [ 2]  524 	jra	00107$
      0089BB                        525 00102$:
                                    526 ;	driver/oled.c: 190: }else enshow=1;
      0089BB A6 01            [ 1]  527 	ld	a, #0x01
      0089BD 6B 05            [ 1]  528 	ld	(0x05, sp), a
      0089BF                        529 00105$:
                                    530 ;	driver/oled.c: 193: OLED_ShowChar(x+(size2/2)*t,y,temp+'0');
      0089BF 7B 06            [ 1]  531 	ld	a, (0x06, sp)
      0089C1 AB 30            [ 1]  532 	add	a, #0x30
      0089C3 88               [ 1]  533 	push	a
      0089C4 7B 0C            [ 1]  534 	ld	a, (0x0c, sp)
      0089C6 88               [ 1]  535 	push	a
      0089C7 90 9F            [ 1]  536 	ld	a, yl
      0089C9 88               [ 1]  537 	push	a
      0089CA CD 88 8E         [ 4]  538 	call	_OLED_ShowChar
      0089CD 5B 03            [ 2]  539 	addw	sp, #3
      0089CF                        540 00107$:
                                    541 ;	driver/oled.c: 181: for(t=0;t<len;t++)
      0089CF 0C 07            [ 1]  542 	inc	(0x07, sp)
      0089D1 CC 89 40         [ 2]  543 	jp	00110$
      0089D4                        544 00111$:
                                    545 ;	driver/oled.c: 195: }
      0089D4 5B 07            [ 2]  546 	addw	sp, #7
      0089D6 81               [ 4]  547 	ret
                                    548 ;	driver/oled.c: 197: void OLED_ShowString(u8 x,u8 y,u8 *chr)
                                    549 ;	-----------------------------------------
                                    550 ;	 function OLED_ShowString
                                    551 ;	-----------------------------------------
      0089D7                        552 _OLED_ShowString:
      0089D7 88               [ 1]  553 	push	a
                                    554 ;	driver/oled.c: 200: while (chr[j]!='\0')
      0089D8 0F 01            [ 1]  555 	clr	(0x01, sp)
      0089DA                        556 00103$:
      0089DA 5F               [ 1]  557 	clrw	x
      0089DB 7B 01            [ 1]  558 	ld	a, (0x01, sp)
      0089DD 97               [ 1]  559 	ld	xl, a
      0089DE 72 FB 06         [ 2]  560 	addw	x, (0x06, sp)
      0089E1 F6               [ 1]  561 	ld	a, (x)
      0089E2 27 24            [ 1]  562 	jreq	00106$
                                    563 ;	driver/oled.c: 201: {		OLED_ShowChar(x,y,chr[j]);
      0089E4 88               [ 1]  564 	push	a
      0089E5 7B 06            [ 1]  565 	ld	a, (0x06, sp)
      0089E7 88               [ 1]  566 	push	a
      0089E8 7B 06            [ 1]  567 	ld	a, (0x06, sp)
      0089EA 88               [ 1]  568 	push	a
      0089EB CD 88 8E         [ 4]  569 	call	_OLED_ShowChar
      0089EE 5B 03            [ 2]  570 	addw	sp, #3
                                    571 ;	driver/oled.c: 202: x+=8;
      0089F0 7B 04            [ 1]  572 	ld	a, (0x04, sp)
      0089F2 AB 08            [ 1]  573 	add	a, #0x08
      0089F4 6B 04            [ 1]  574 	ld	(0x04, sp), a
                                    575 ;	driver/oled.c: 203: if(x>120){x=0;y+=2;}
      0089F6 7B 04            [ 1]  576 	ld	a, (0x04, sp)
      0089F8 A1 78            [ 1]  577 	cp	a, #0x78
      0089FA 23 08            [ 2]  578 	jrule	00102$
      0089FC 0F 04            [ 1]  579 	clr	(0x04, sp)
      0089FE 7B 05            [ 1]  580 	ld	a, (0x05, sp)
      008A00 AB 02            [ 1]  581 	add	a, #0x02
      008A02 6B 05            [ 1]  582 	ld	(0x05, sp), a
      008A04                        583 00102$:
                                    584 ;	driver/oled.c: 204: j++;
      008A04 0C 01            [ 1]  585 	inc	(0x01, sp)
      008A06 20 D2            [ 2]  586 	jra	00103$
      008A08                        587 00106$:
                                    588 ;	driver/oled.c: 206: }
      008A08 84               [ 1]  589 	pop	a
      008A09 81               [ 4]  590 	ret
                                    591 ;	driver/oled.c: 248: void OLED_Init(void)
                                    592 ;	-----------------------------------------
                                    593 ;	 function OLED_Init
                                    594 ;	-----------------------------------------
      008A0A                        595 _OLED_Init:
                                    596 ;	driver/oled.c: 250: GPIO_Init(OLED_SCLK_PORT, (GPIO_Pin_TypeDef)OLED_SCLK_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      008A0A 4B E0            [ 1]  597 	push	#0xe0
      008A0C 4B 02            [ 1]  598 	push	#0x02
      008A0E 4B 0A            [ 1]  599 	push	#0x0a
      008A10 4B 50            [ 1]  600 	push	#0x50
      008A12 CD 8B F4         [ 4]  601 	call	_GPIO_Init
      008A15 5B 04            [ 2]  602 	addw	sp, #4
                                    603 ;	driver/oled.c: 251: GPIO_Init(OLED_SDIN_PORT, (GPIO_Pin_TypeDef)OLED_SDIN_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      008A17 4B E0            [ 1]  604 	push	#0xe0
      008A19 4B 04            [ 1]  605 	push	#0x04
      008A1B 4B 0A            [ 1]  606 	push	#0x0a
      008A1D 4B 50            [ 1]  607 	push	#0x50
      008A1F CD 8B F4         [ 4]  608 	call	_GPIO_Init
      008A22 5B 04            [ 2]  609 	addw	sp, #4
                                    610 ;	driver/oled.c: 252: GPIO_Init(OLED_RST_PORT, (GPIO_Pin_TypeDef)OLED_RST_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      008A24 4B E0            [ 1]  611 	push	#0xe0
      008A26 4B 08            [ 1]  612 	push	#0x08
      008A28 4B 0A            [ 1]  613 	push	#0x0a
      008A2A 4B 50            [ 1]  614 	push	#0x50
      008A2C CD 8B F4         [ 4]  615 	call	_GPIO_Init
      008A2F 5B 04            [ 2]  616 	addw	sp, #4
                                    617 ;	driver/oled.c: 253: GPIO_Init(OLED_DC_PORT, (GPIO_Pin_TypeDef)OLED_DC_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      008A31 4B E0            [ 1]  618 	push	#0xe0
      008A33 4B 10            [ 1]  619 	push	#0x10
      008A35 4B 0A            [ 1]  620 	push	#0x0a
      008A37 4B 50            [ 1]  621 	push	#0x50
      008A39 CD 8B F4         [ 4]  622 	call	_GPIO_Init
      008A3C 5B 04            [ 2]  623 	addw	sp, #4
                                    624 ;	driver/oled.c: 254: GPIO_Init(OLED_CS_PORT, (GPIO_Pin_TypeDef)OLED_CS_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      008A3E 4B E0            [ 1]  625 	push	#0xe0
      008A40 4B 20            [ 1]  626 	push	#0x20
      008A42 4B 0A            [ 1]  627 	push	#0x0a
      008A44 4B 50            [ 1]  628 	push	#0x50
      008A46 CD 8B F4         [ 4]  629 	call	_GPIO_Init
      008A49 5B 04            [ 2]  630 	addw	sp, #4
                                    631 ;	driver/oled.c: 257: OLED_RST_Set();
      008A4B 4B 08            [ 1]  632 	push	#0x08
      008A4D 4B 0A            [ 1]  633 	push	#0x0a
      008A4F 4B 50            [ 1]  634 	push	#0x50
      008A51 CD 8C 6F         [ 4]  635 	call	_GPIO_WriteHigh
      008A54 5B 03            [ 2]  636 	addw	sp, #3
                                    637 ;	driver/oled.c: 258: delay_ms(100);
      008A56 4B 64            [ 1]  638 	push	#0x64
      008A58 4B 00            [ 1]  639 	push	#0x00
      008A5A CD 87 42         [ 4]  640 	call	_delay_ms
      008A5D 5B 02            [ 2]  641 	addw	sp, #2
                                    642 ;	driver/oled.c: 259: OLED_RST_Clr();
      008A5F 4B 08            [ 1]  643 	push	#0x08
      008A61 4B 0A            [ 1]  644 	push	#0x0a
      008A63 4B 50            [ 1]  645 	push	#0x50
      008A65 CD 8C 76         [ 4]  646 	call	_GPIO_WriteLow
      008A68 5B 03            [ 2]  647 	addw	sp, #3
                                    648 ;	driver/oled.c: 260: delay_ms(100);
      008A6A 4B 64            [ 1]  649 	push	#0x64
      008A6C 4B 00            [ 1]  650 	push	#0x00
      008A6E CD 87 42         [ 4]  651 	call	_delay_ms
      008A71 5B 02            [ 2]  652 	addw	sp, #2
                                    653 ;	driver/oled.c: 261: OLED_RST_Set();
      008A73 4B 08            [ 1]  654 	push	#0x08
      008A75 4B 0A            [ 1]  655 	push	#0x0a
      008A77 4B 50            [ 1]  656 	push	#0x50
      008A79 CD 8C 6F         [ 4]  657 	call	_GPIO_WriteHigh
      008A7C 5B 03            [ 2]  658 	addw	sp, #3
                                    659 ;	driver/oled.c: 293: OLED_WR_Byte(0xAE,OLED_CMD);//--turn off oled panel
      008A7E 4B 00            [ 1]  660 	push	#0x00
      008A80 4B AE            [ 1]  661 	push	#0xae
      008A82 CD 87 60         [ 4]  662 	call	_OLED_WR_Byte
      008A85 5B 02            [ 2]  663 	addw	sp, #2
                                    664 ;	driver/oled.c: 294: OLED_WR_Byte(0x00,OLED_CMD);//---set low column address
      008A87 4B 00            [ 1]  665 	push	#0x00
      008A89 4B 00            [ 1]  666 	push	#0x00
      008A8B CD 87 60         [ 4]  667 	call	_OLED_WR_Byte
      008A8E 5B 02            [ 2]  668 	addw	sp, #2
                                    669 ;	driver/oled.c: 295: OLED_WR_Byte(0x10,OLED_CMD);//---set high column address
      008A90 4B 00            [ 1]  670 	push	#0x00
      008A92 4B 10            [ 1]  671 	push	#0x10
      008A94 CD 87 60         [ 4]  672 	call	_OLED_WR_Byte
      008A97 5B 02            [ 2]  673 	addw	sp, #2
                                    674 ;	driver/oled.c: 296: OLED_WR_Byte(0x40,OLED_CMD);//--set start line address  Set Mapping RAM Display Start Line (0x00~0x3F)
      008A99 4B 00            [ 1]  675 	push	#0x00
      008A9B 4B 40            [ 1]  676 	push	#0x40
      008A9D CD 87 60         [ 4]  677 	call	_OLED_WR_Byte
      008AA0 5B 02            [ 2]  678 	addw	sp, #2
                                    679 ;	driver/oled.c: 297: OLED_WR_Byte(0x81,OLED_CMD);//--set contrast control register
      008AA2 4B 00            [ 1]  680 	push	#0x00
      008AA4 4B 81            [ 1]  681 	push	#0x81
      008AA6 CD 87 60         [ 4]  682 	call	_OLED_WR_Byte
      008AA9 5B 02            [ 2]  683 	addw	sp, #2
                                    684 ;	driver/oled.c: 298: OLED_WR_Byte(0xCF,OLED_CMD); // Set SEG Output Current Brightness
      008AAB 4B 00            [ 1]  685 	push	#0x00
      008AAD 4B CF            [ 1]  686 	push	#0xcf
      008AAF CD 87 60         [ 4]  687 	call	_OLED_WR_Byte
      008AB2 5B 02            [ 2]  688 	addw	sp, #2
                                    689 ;	driver/oled.c: 299: OLED_WR_Byte(0xA1,OLED_CMD);//--Set SEG/Column Mapping     0xa0左右反置 0xa1正常
      008AB4 4B 00            [ 1]  690 	push	#0x00
      008AB6 4B A1            [ 1]  691 	push	#0xa1
      008AB8 CD 87 60         [ 4]  692 	call	_OLED_WR_Byte
      008ABB 5B 02            [ 2]  693 	addw	sp, #2
                                    694 ;	driver/oled.c: 300: OLED_WR_Byte(0xC8,OLED_CMD);//Set COM/Row Scan Direction   0xc0上下反置 0xc8正常
      008ABD 4B 00            [ 1]  695 	push	#0x00
      008ABF 4B C8            [ 1]  696 	push	#0xc8
      008AC1 CD 87 60         [ 4]  697 	call	_OLED_WR_Byte
      008AC4 5B 02            [ 2]  698 	addw	sp, #2
                                    699 ;	driver/oled.c: 301: OLED_WR_Byte(0xA6,OLED_CMD);//--set normal display
      008AC6 4B 00            [ 1]  700 	push	#0x00
      008AC8 4B A6            [ 1]  701 	push	#0xa6
      008ACA CD 87 60         [ 4]  702 	call	_OLED_WR_Byte
      008ACD 5B 02            [ 2]  703 	addw	sp, #2
                                    704 ;	driver/oled.c: 302: OLED_WR_Byte(0xA8,OLED_CMD);//--set multiplex ratio(1 to 64)
      008ACF 4B 00            [ 1]  705 	push	#0x00
      008AD1 4B A8            [ 1]  706 	push	#0xa8
      008AD3 CD 87 60         [ 4]  707 	call	_OLED_WR_Byte
      008AD6 5B 02            [ 2]  708 	addw	sp, #2
                                    709 ;	driver/oled.c: 303: OLED_WR_Byte(0x3f,OLED_CMD);//--1/64 duty
      008AD8 4B 00            [ 1]  710 	push	#0x00
      008ADA 4B 3F            [ 1]  711 	push	#0x3f
      008ADC CD 87 60         [ 4]  712 	call	_OLED_WR_Byte
      008ADF 5B 02            [ 2]  713 	addw	sp, #2
                                    714 ;	driver/oled.c: 304: OLED_WR_Byte(0xD3,OLED_CMD);//-set display offset	Shift Mapping RAM Counter (0x00~0x3F)
      008AE1 4B 00            [ 1]  715 	push	#0x00
      008AE3 4B D3            [ 1]  716 	push	#0xd3
      008AE5 CD 87 60         [ 4]  717 	call	_OLED_WR_Byte
      008AE8 5B 02            [ 2]  718 	addw	sp, #2
                                    719 ;	driver/oled.c: 305: OLED_WR_Byte(0x00,OLED_CMD);//-not offset
      008AEA 4B 00            [ 1]  720 	push	#0x00
      008AEC 4B 00            [ 1]  721 	push	#0x00
      008AEE CD 87 60         [ 4]  722 	call	_OLED_WR_Byte
      008AF1 5B 02            [ 2]  723 	addw	sp, #2
                                    724 ;	driver/oled.c: 306: OLED_WR_Byte(0xd5,OLED_CMD);//--set display clock divide ratio/oscillator frequency
      008AF3 4B 00            [ 1]  725 	push	#0x00
      008AF5 4B D5            [ 1]  726 	push	#0xd5
      008AF7 CD 87 60         [ 4]  727 	call	_OLED_WR_Byte
      008AFA 5B 02            [ 2]  728 	addw	sp, #2
                                    729 ;	driver/oled.c: 307: OLED_WR_Byte(0x80,OLED_CMD);//--set divide ratio, Set Clock as 100 Frames/Sec
      008AFC 4B 00            [ 1]  730 	push	#0x00
      008AFE 4B 80            [ 1]  731 	push	#0x80
      008B00 CD 87 60         [ 4]  732 	call	_OLED_WR_Byte
      008B03 5B 02            [ 2]  733 	addw	sp, #2
                                    734 ;	driver/oled.c: 308: OLED_WR_Byte(0xD9,OLED_CMD);//--set pre-charge period
      008B05 4B 00            [ 1]  735 	push	#0x00
      008B07 4B D9            [ 1]  736 	push	#0xd9
      008B09 CD 87 60         [ 4]  737 	call	_OLED_WR_Byte
      008B0C 5B 02            [ 2]  738 	addw	sp, #2
                                    739 ;	driver/oled.c: 309: OLED_WR_Byte(0xF1,OLED_CMD);//Set Pre-Charge as 15 Clocks & Discharge as 1 Clock
      008B0E 4B 00            [ 1]  740 	push	#0x00
      008B10 4B F1            [ 1]  741 	push	#0xf1
      008B12 CD 87 60         [ 4]  742 	call	_OLED_WR_Byte
      008B15 5B 02            [ 2]  743 	addw	sp, #2
                                    744 ;	driver/oled.c: 310: OLED_WR_Byte(0xDA,OLED_CMD);//--set com pins hardware configuration
      008B17 4B 00            [ 1]  745 	push	#0x00
      008B19 4B DA            [ 1]  746 	push	#0xda
      008B1B CD 87 60         [ 4]  747 	call	_OLED_WR_Byte
      008B1E 5B 02            [ 2]  748 	addw	sp, #2
                                    749 ;	driver/oled.c: 311: OLED_WR_Byte(0x12,OLED_CMD);
      008B20 4B 00            [ 1]  750 	push	#0x00
      008B22 4B 12            [ 1]  751 	push	#0x12
      008B24 CD 87 60         [ 4]  752 	call	_OLED_WR_Byte
      008B27 5B 02            [ 2]  753 	addw	sp, #2
                                    754 ;	driver/oled.c: 312: OLED_WR_Byte(0xDB,OLED_CMD);//--set vcomh
      008B29 4B 00            [ 1]  755 	push	#0x00
      008B2B 4B DB            [ 1]  756 	push	#0xdb
      008B2D CD 87 60         [ 4]  757 	call	_OLED_WR_Byte
      008B30 5B 02            [ 2]  758 	addw	sp, #2
                                    759 ;	driver/oled.c: 313: OLED_WR_Byte(0x40,OLED_CMD);//Set VCOM Deselect Level
      008B32 4B 00            [ 1]  760 	push	#0x00
      008B34 4B 40            [ 1]  761 	push	#0x40
      008B36 CD 87 60         [ 4]  762 	call	_OLED_WR_Byte
      008B39 5B 02            [ 2]  763 	addw	sp, #2
                                    764 ;	driver/oled.c: 314: OLED_WR_Byte(0x20,OLED_CMD);//-Set Page Addressing Mode (0x00/0x01/0x02)
      008B3B 4B 00            [ 1]  765 	push	#0x00
      008B3D 4B 20            [ 1]  766 	push	#0x20
      008B3F CD 87 60         [ 4]  767 	call	_OLED_WR_Byte
      008B42 5B 02            [ 2]  768 	addw	sp, #2
                                    769 ;	driver/oled.c: 315: OLED_WR_Byte(0x02,OLED_CMD);//
      008B44 4B 00            [ 1]  770 	push	#0x00
      008B46 4B 02            [ 1]  771 	push	#0x02
      008B48 CD 87 60         [ 4]  772 	call	_OLED_WR_Byte
      008B4B 5B 02            [ 2]  773 	addw	sp, #2
                                    774 ;	driver/oled.c: 316: OLED_WR_Byte(0x8D,OLED_CMD);//--set Charge Pump enable/disable
      008B4D 4B 00            [ 1]  775 	push	#0x00
      008B4F 4B 8D            [ 1]  776 	push	#0x8d
      008B51 CD 87 60         [ 4]  777 	call	_OLED_WR_Byte
      008B54 5B 02            [ 2]  778 	addw	sp, #2
                                    779 ;	driver/oled.c: 317: OLED_WR_Byte(0x14,OLED_CMD);//--set(0x10) disable
      008B56 4B 00            [ 1]  780 	push	#0x00
      008B58 4B 14            [ 1]  781 	push	#0x14
      008B5A CD 87 60         [ 4]  782 	call	_OLED_WR_Byte
      008B5D 5B 02            [ 2]  783 	addw	sp, #2
                                    784 ;	driver/oled.c: 318: OLED_WR_Byte(0xA4,OLED_CMD);// Disable Entire Display On (0xa4/0xa5)
      008B5F 4B 00            [ 1]  785 	push	#0x00
      008B61 4B A4            [ 1]  786 	push	#0xa4
      008B63 CD 87 60         [ 4]  787 	call	_OLED_WR_Byte
      008B66 5B 02            [ 2]  788 	addw	sp, #2
                                    789 ;	driver/oled.c: 319: OLED_WR_Byte(0xA6,OLED_CMD);// Disable Inverse Display On (0xa6/a7)
      008B68 4B 00            [ 1]  790 	push	#0x00
      008B6A 4B A6            [ 1]  791 	push	#0xa6
      008B6C CD 87 60         [ 4]  792 	call	_OLED_WR_Byte
      008B6F 5B 02            [ 2]  793 	addw	sp, #2
                                    794 ;	driver/oled.c: 320: OLED_WR_Byte(0xAF,OLED_CMD);//--turn on oled panel
      008B71 4B 00            [ 1]  795 	push	#0x00
      008B73 4B AF            [ 1]  796 	push	#0xaf
      008B75 CD 87 60         [ 4]  797 	call	_OLED_WR_Byte
      008B78 5B 02            [ 2]  798 	addw	sp, #2
                                    799 ;	driver/oled.c: 322: OLED_WR_Byte(0xAF,OLED_CMD); /*display ON*/
      008B7A 4B 00            [ 1]  800 	push	#0x00
      008B7C 4B AF            [ 1]  801 	push	#0xaf
      008B7E CD 87 60         [ 4]  802 	call	_OLED_WR_Byte
      008B81 5B 02            [ 2]  803 	addw	sp, #2
                                    804 ;	driver/oled.c: 323: OLED_Clear();
      008B83 CD 88 52         [ 4]  805 	call	_OLED_Clear
                                    806 ;	driver/oled.c: 324: OLED_Set_Pos(0,0);
      008B86 4B 00            [ 1]  807 	push	#0x00
      008B88 4B 00            [ 1]  808 	push	#0x00
      008B8A CD 87 DD         [ 4]  809 	call	_OLED_Set_Pos
      008B8D 5B 02            [ 2]  810 	addw	sp, #2
                                    811 ;	driver/oled.c: 325: }
      008B8F 81               [ 4]  812 	ret
                                    813 	.area CODE
                                    814 	.area CONST
      008048                        815 _F8X16:
      008048 00                     816 	.db #0x00	; 0
      008049 00                     817 	.db #0x00	; 0
      00804A 00                     818 	.db #0x00	; 0
      00804B 00                     819 	.db #0x00	; 0
      00804C 00                     820 	.db #0x00	; 0
      00804D 00                     821 	.db #0x00	; 0
      00804E 00                     822 	.db #0x00	; 0
      00804F 00                     823 	.db #0x00	; 0
      008050 00                     824 	.db #0x00	; 0
      008051 00                     825 	.db #0x00	; 0
      008052 00                     826 	.db #0x00	; 0
      008053 00                     827 	.db #0x00	; 0
      008054 00                     828 	.db #0x00	; 0
      008055 00                     829 	.db #0x00	; 0
      008056 00                     830 	.db #0x00	; 0
      008057 00                     831 	.db #0x00	; 0
      008058 00                     832 	.db #0x00	; 0
      008059 00                     833 	.db #0x00	; 0
      00805A 00                     834 	.db #0x00	; 0
      00805B F8                     835 	.db #0xf8	; 248
      00805C 00                     836 	.db #0x00	; 0
      00805D 00                     837 	.db #0x00	; 0
      00805E 00                     838 	.db #0x00	; 0
      00805F 00                     839 	.db #0x00	; 0
      008060 00                     840 	.db #0x00	; 0
      008061 00                     841 	.db #0x00	; 0
      008062 00                     842 	.db #0x00	; 0
      008063 33                     843 	.db #0x33	; 51	'3'
      008064 30                     844 	.db #0x30	; 48	'0'
      008065 00                     845 	.db #0x00	; 0
      008066 00                     846 	.db #0x00	; 0
      008067 00                     847 	.db #0x00	; 0
      008068 00                     848 	.db #0x00	; 0
      008069 10                     849 	.db #0x10	; 16
      00806A 0C                     850 	.db #0x0c	; 12
      00806B 06                     851 	.db #0x06	; 6
      00806C 10                     852 	.db #0x10	; 16
      00806D 0C                     853 	.db #0x0c	; 12
      00806E 06                     854 	.db #0x06	; 6
      00806F 00                     855 	.db #0x00	; 0
      008070 00                     856 	.db #0x00	; 0
      008071 00                     857 	.db #0x00	; 0
      008072 00                     858 	.db #0x00	; 0
      008073 00                     859 	.db #0x00	; 0
      008074 00                     860 	.db #0x00	; 0
      008075 00                     861 	.db #0x00	; 0
      008076 00                     862 	.db #0x00	; 0
      008077 00                     863 	.db #0x00	; 0
      008078 40                     864 	.db #0x40	; 64
      008079 C0                     865 	.db #0xc0	; 192
      00807A 78                     866 	.db #0x78	; 120	'x'
      00807B 40                     867 	.db #0x40	; 64
      00807C C0                     868 	.db #0xc0	; 192
      00807D 78                     869 	.db #0x78	; 120	'x'
      00807E 40                     870 	.db #0x40	; 64
      00807F 00                     871 	.db #0x00	; 0
      008080 04                     872 	.db #0x04	; 4
      008081 3F                     873 	.db #0x3f	; 63
      008082 04                     874 	.db #0x04	; 4
      008083 04                     875 	.db #0x04	; 4
      008084 3F                     876 	.db #0x3f	; 63
      008085 04                     877 	.db #0x04	; 4
      008086 04                     878 	.db #0x04	; 4
      008087 00                     879 	.db #0x00	; 0
      008088 00                     880 	.db #0x00	; 0
      008089 70                     881 	.db #0x70	; 112	'p'
      00808A 88                     882 	.db #0x88	; 136
      00808B FC                     883 	.db #0xfc	; 252
      00808C 08                     884 	.db #0x08	; 8
      00808D 30                     885 	.db #0x30	; 48	'0'
      00808E 00                     886 	.db #0x00	; 0
      00808F 00                     887 	.db #0x00	; 0
      008090 00                     888 	.db #0x00	; 0
      008091 18                     889 	.db #0x18	; 24
      008092 20                     890 	.db #0x20	; 32
      008093 FF                     891 	.db #0xff	; 255
      008094 21                     892 	.db #0x21	; 33
      008095 1E                     893 	.db #0x1e	; 30
      008096 00                     894 	.db #0x00	; 0
      008097 00                     895 	.db #0x00	; 0
      008098 F0                     896 	.db #0xf0	; 240
      008099 08                     897 	.db #0x08	; 8
      00809A F0                     898 	.db #0xf0	; 240
      00809B 00                     899 	.db #0x00	; 0
      00809C E0                     900 	.db #0xe0	; 224
      00809D 18                     901 	.db #0x18	; 24
      00809E 00                     902 	.db #0x00	; 0
      00809F 00                     903 	.db #0x00	; 0
      0080A0 00                     904 	.db #0x00	; 0
      0080A1 21                     905 	.db #0x21	; 33
      0080A2 1C                     906 	.db #0x1c	; 28
      0080A3 03                     907 	.db #0x03	; 3
      0080A4 1E                     908 	.db #0x1e	; 30
      0080A5 21                     909 	.db #0x21	; 33
      0080A6 1E                     910 	.db #0x1e	; 30
      0080A7 00                     911 	.db #0x00	; 0
      0080A8 00                     912 	.db #0x00	; 0
      0080A9 F0                     913 	.db #0xf0	; 240
      0080AA 08                     914 	.db #0x08	; 8
      0080AB 88                     915 	.db #0x88	; 136
      0080AC 70                     916 	.db #0x70	; 112	'p'
      0080AD 00                     917 	.db #0x00	; 0
      0080AE 00                     918 	.db #0x00	; 0
      0080AF 00                     919 	.db #0x00	; 0
      0080B0 1E                     920 	.db #0x1e	; 30
      0080B1 21                     921 	.db #0x21	; 33
      0080B2 23                     922 	.db #0x23	; 35
      0080B3 24                     923 	.db #0x24	; 36
      0080B4 19                     924 	.db #0x19	; 25
      0080B5 27                     925 	.db #0x27	; 39
      0080B6 21                     926 	.db #0x21	; 33
      0080B7 10                     927 	.db #0x10	; 16
      0080B8 10                     928 	.db #0x10	; 16
      0080B9 16                     929 	.db #0x16	; 22
      0080BA 0E                     930 	.db #0x0e	; 14
      0080BB 00                     931 	.db #0x00	; 0
      0080BC 00                     932 	.db #0x00	; 0
      0080BD 00                     933 	.db #0x00	; 0
      0080BE 00                     934 	.db #0x00	; 0
      0080BF 00                     935 	.db #0x00	; 0
      0080C0 00                     936 	.db #0x00	; 0
      0080C1 00                     937 	.db #0x00	; 0
      0080C2 00                     938 	.db #0x00	; 0
      0080C3 00                     939 	.db #0x00	; 0
      0080C4 00                     940 	.db #0x00	; 0
      0080C5 00                     941 	.db #0x00	; 0
      0080C6 00                     942 	.db #0x00	; 0
      0080C7 00                     943 	.db #0x00	; 0
      0080C8 00                     944 	.db #0x00	; 0
      0080C9 00                     945 	.db #0x00	; 0
      0080CA 00                     946 	.db #0x00	; 0
      0080CB E0                     947 	.db #0xe0	; 224
      0080CC 18                     948 	.db #0x18	; 24
      0080CD 04                     949 	.db #0x04	; 4
      0080CE 02                     950 	.db #0x02	; 2
      0080CF 00                     951 	.db #0x00	; 0
      0080D0 00                     952 	.db #0x00	; 0
      0080D1 00                     953 	.db #0x00	; 0
      0080D2 00                     954 	.db #0x00	; 0
      0080D3 07                     955 	.db #0x07	; 7
      0080D4 18                     956 	.db #0x18	; 24
      0080D5 20                     957 	.db #0x20	; 32
      0080D6 40                     958 	.db #0x40	; 64
      0080D7 00                     959 	.db #0x00	; 0
      0080D8 00                     960 	.db #0x00	; 0
      0080D9 02                     961 	.db #0x02	; 2
      0080DA 04                     962 	.db #0x04	; 4
      0080DB 18                     963 	.db #0x18	; 24
      0080DC E0                     964 	.db #0xe0	; 224
      0080DD 00                     965 	.db #0x00	; 0
      0080DE 00                     966 	.db #0x00	; 0
      0080DF 00                     967 	.db #0x00	; 0
      0080E0 00                     968 	.db #0x00	; 0
      0080E1 40                     969 	.db #0x40	; 64
      0080E2 20                     970 	.db #0x20	; 32
      0080E3 18                     971 	.db #0x18	; 24
      0080E4 07                     972 	.db #0x07	; 7
      0080E5 00                     973 	.db #0x00	; 0
      0080E6 00                     974 	.db #0x00	; 0
      0080E7 00                     975 	.db #0x00	; 0
      0080E8 40                     976 	.db #0x40	; 64
      0080E9 40                     977 	.db #0x40	; 64
      0080EA 80                     978 	.db #0x80	; 128
      0080EB F0                     979 	.db #0xf0	; 240
      0080EC 80                     980 	.db #0x80	; 128
      0080ED 40                     981 	.db #0x40	; 64
      0080EE 40                     982 	.db #0x40	; 64
      0080EF 00                     983 	.db #0x00	; 0
      0080F0 02                     984 	.db #0x02	; 2
      0080F1 02                     985 	.db #0x02	; 2
      0080F2 01                     986 	.db #0x01	; 1
      0080F3 0F                     987 	.db #0x0f	; 15
      0080F4 01                     988 	.db #0x01	; 1
      0080F5 02                     989 	.db #0x02	; 2
      0080F6 02                     990 	.db #0x02	; 2
      0080F7 00                     991 	.db #0x00	; 0
      0080F8 00                     992 	.db #0x00	; 0
      0080F9 00                     993 	.db #0x00	; 0
      0080FA 00                     994 	.db #0x00	; 0
      0080FB F0                     995 	.db #0xf0	; 240
      0080FC 00                     996 	.db #0x00	; 0
      0080FD 00                     997 	.db #0x00	; 0
      0080FE 00                     998 	.db #0x00	; 0
      0080FF 00                     999 	.db #0x00	; 0
      008100 01                    1000 	.db #0x01	; 1
      008101 01                    1001 	.db #0x01	; 1
      008102 01                    1002 	.db #0x01	; 1
      008103 1F                    1003 	.db #0x1f	; 31
      008104 01                    1004 	.db #0x01	; 1
      008105 01                    1005 	.db #0x01	; 1
      008106 01                    1006 	.db #0x01	; 1
      008107 00                    1007 	.db #0x00	; 0
      008108 00                    1008 	.db #0x00	; 0
      008109 00                    1009 	.db #0x00	; 0
      00810A 00                    1010 	.db #0x00	; 0
      00810B 00                    1011 	.db #0x00	; 0
      00810C 00                    1012 	.db #0x00	; 0
      00810D 00                    1013 	.db #0x00	; 0
      00810E 00                    1014 	.db #0x00	; 0
      00810F 00                    1015 	.db #0x00	; 0
      008110 80                    1016 	.db #0x80	; 128
      008111 B0                    1017 	.db #0xb0	; 176
      008112 70                    1018 	.db #0x70	; 112	'p'
      008113 00                    1019 	.db #0x00	; 0
      008114 00                    1020 	.db #0x00	; 0
      008115 00                    1021 	.db #0x00	; 0
      008116 00                    1022 	.db #0x00	; 0
      008117 00                    1023 	.db #0x00	; 0
      008118 00                    1024 	.db #0x00	; 0
      008119 00                    1025 	.db #0x00	; 0
      00811A 00                    1026 	.db #0x00	; 0
      00811B 00                    1027 	.db #0x00	; 0
      00811C 00                    1028 	.db #0x00	; 0
      00811D 00                    1029 	.db #0x00	; 0
      00811E 00                    1030 	.db #0x00	; 0
      00811F 00                    1031 	.db #0x00	; 0
      008120 00                    1032 	.db #0x00	; 0
      008121 01                    1033 	.db #0x01	; 1
      008122 01                    1034 	.db #0x01	; 1
      008123 01                    1035 	.db #0x01	; 1
      008124 01                    1036 	.db #0x01	; 1
      008125 01                    1037 	.db #0x01	; 1
      008126 01                    1038 	.db #0x01	; 1
      008127 01                    1039 	.db #0x01	; 1
      008128 00                    1040 	.db #0x00	; 0
      008129 00                    1041 	.db #0x00	; 0
      00812A 00                    1042 	.db #0x00	; 0
      00812B 00                    1043 	.db #0x00	; 0
      00812C 00                    1044 	.db #0x00	; 0
      00812D 00                    1045 	.db #0x00	; 0
      00812E 00                    1046 	.db #0x00	; 0
      00812F 00                    1047 	.db #0x00	; 0
      008130 00                    1048 	.db #0x00	; 0
      008131 30                    1049 	.db #0x30	; 48	'0'
      008132 30                    1050 	.db #0x30	; 48	'0'
      008133 00                    1051 	.db #0x00	; 0
      008134 00                    1052 	.db #0x00	; 0
      008135 00                    1053 	.db #0x00	; 0
      008136 00                    1054 	.db #0x00	; 0
      008137 00                    1055 	.db #0x00	; 0
      008138 00                    1056 	.db #0x00	; 0
      008139 00                    1057 	.db #0x00	; 0
      00813A 00                    1058 	.db #0x00	; 0
      00813B 00                    1059 	.db #0x00	; 0
      00813C 80                    1060 	.db #0x80	; 128
      00813D 60                    1061 	.db #0x60	; 96
      00813E 18                    1062 	.db #0x18	; 24
      00813F 04                    1063 	.db #0x04	; 4
      008140 00                    1064 	.db #0x00	; 0
      008141 60                    1065 	.db #0x60	; 96
      008142 18                    1066 	.db #0x18	; 24
      008143 06                    1067 	.db #0x06	; 6
      008144 01                    1068 	.db #0x01	; 1
      008145 00                    1069 	.db #0x00	; 0
      008146 00                    1070 	.db #0x00	; 0
      008147 00                    1071 	.db #0x00	; 0
      008148 00                    1072 	.db #0x00	; 0
      008149 E0                    1073 	.db #0xe0	; 224
      00814A 10                    1074 	.db #0x10	; 16
      00814B 08                    1075 	.db #0x08	; 8
      00814C 08                    1076 	.db #0x08	; 8
      00814D 10                    1077 	.db #0x10	; 16
      00814E E0                    1078 	.db #0xe0	; 224
      00814F 00                    1079 	.db #0x00	; 0
      008150 00                    1080 	.db #0x00	; 0
      008151 0F                    1081 	.db #0x0f	; 15
      008152 10                    1082 	.db #0x10	; 16
      008153 20                    1083 	.db #0x20	; 32
      008154 20                    1084 	.db #0x20	; 32
      008155 10                    1085 	.db #0x10	; 16
      008156 0F                    1086 	.db #0x0f	; 15
      008157 00                    1087 	.db #0x00	; 0
      008158 00                    1088 	.db #0x00	; 0
      008159 10                    1089 	.db #0x10	; 16
      00815A 10                    1090 	.db #0x10	; 16
      00815B F8                    1091 	.db #0xf8	; 248
      00815C 00                    1092 	.db #0x00	; 0
      00815D 00                    1093 	.db #0x00	; 0
      00815E 00                    1094 	.db #0x00	; 0
      00815F 00                    1095 	.db #0x00	; 0
      008160 00                    1096 	.db #0x00	; 0
      008161 20                    1097 	.db #0x20	; 32
      008162 20                    1098 	.db #0x20	; 32
      008163 3F                    1099 	.db #0x3f	; 63
      008164 20                    1100 	.db #0x20	; 32
      008165 20                    1101 	.db #0x20	; 32
      008166 00                    1102 	.db #0x00	; 0
      008167 00                    1103 	.db #0x00	; 0
      008168 00                    1104 	.db #0x00	; 0
      008169 70                    1105 	.db #0x70	; 112	'p'
      00816A 08                    1106 	.db #0x08	; 8
      00816B 08                    1107 	.db #0x08	; 8
      00816C 08                    1108 	.db #0x08	; 8
      00816D 88                    1109 	.db #0x88	; 136
      00816E 70                    1110 	.db #0x70	; 112	'p'
      00816F 00                    1111 	.db #0x00	; 0
      008170 00                    1112 	.db #0x00	; 0
      008171 30                    1113 	.db #0x30	; 48	'0'
      008172 28                    1114 	.db #0x28	; 40
      008173 24                    1115 	.db #0x24	; 36
      008174 22                    1116 	.db #0x22	; 34
      008175 21                    1117 	.db #0x21	; 33
      008176 30                    1118 	.db #0x30	; 48	'0'
      008177 00                    1119 	.db #0x00	; 0
      008178 00                    1120 	.db #0x00	; 0
      008179 30                    1121 	.db #0x30	; 48	'0'
      00817A 08                    1122 	.db #0x08	; 8
      00817B 88                    1123 	.db #0x88	; 136
      00817C 88                    1124 	.db #0x88	; 136
      00817D 48                    1125 	.db #0x48	; 72	'H'
      00817E 30                    1126 	.db #0x30	; 48	'0'
      00817F 00                    1127 	.db #0x00	; 0
      008180 00                    1128 	.db #0x00	; 0
      008181 18                    1129 	.db #0x18	; 24
      008182 20                    1130 	.db #0x20	; 32
      008183 20                    1131 	.db #0x20	; 32
      008184 20                    1132 	.db #0x20	; 32
      008185 11                    1133 	.db #0x11	; 17
      008186 0E                    1134 	.db #0x0e	; 14
      008187 00                    1135 	.db #0x00	; 0
      008188 00                    1136 	.db #0x00	; 0
      008189 00                    1137 	.db #0x00	; 0
      00818A C0                    1138 	.db #0xc0	; 192
      00818B 20                    1139 	.db #0x20	; 32
      00818C 10                    1140 	.db #0x10	; 16
      00818D F8                    1141 	.db #0xf8	; 248
      00818E 00                    1142 	.db #0x00	; 0
      00818F 00                    1143 	.db #0x00	; 0
      008190 00                    1144 	.db #0x00	; 0
      008191 07                    1145 	.db #0x07	; 7
      008192 04                    1146 	.db #0x04	; 4
      008193 24                    1147 	.db #0x24	; 36
      008194 24                    1148 	.db #0x24	; 36
      008195 3F                    1149 	.db #0x3f	; 63
      008196 24                    1150 	.db #0x24	; 36
      008197 00                    1151 	.db #0x00	; 0
      008198 00                    1152 	.db #0x00	; 0
      008199 F8                    1153 	.db #0xf8	; 248
      00819A 08                    1154 	.db #0x08	; 8
      00819B 88                    1155 	.db #0x88	; 136
      00819C 88                    1156 	.db #0x88	; 136
      00819D 08                    1157 	.db #0x08	; 8
      00819E 08                    1158 	.db #0x08	; 8
      00819F 00                    1159 	.db #0x00	; 0
      0081A0 00                    1160 	.db #0x00	; 0
      0081A1 19                    1161 	.db #0x19	; 25
      0081A2 21                    1162 	.db #0x21	; 33
      0081A3 20                    1163 	.db #0x20	; 32
      0081A4 20                    1164 	.db #0x20	; 32
      0081A5 11                    1165 	.db #0x11	; 17
      0081A6 0E                    1166 	.db #0x0e	; 14
      0081A7 00                    1167 	.db #0x00	; 0
      0081A8 00                    1168 	.db #0x00	; 0
      0081A9 E0                    1169 	.db #0xe0	; 224
      0081AA 10                    1170 	.db #0x10	; 16
      0081AB 88                    1171 	.db #0x88	; 136
      0081AC 88                    1172 	.db #0x88	; 136
      0081AD 18                    1173 	.db #0x18	; 24
      0081AE 00                    1174 	.db #0x00	; 0
      0081AF 00                    1175 	.db #0x00	; 0
      0081B0 00                    1176 	.db #0x00	; 0
      0081B1 0F                    1177 	.db #0x0f	; 15
      0081B2 11                    1178 	.db #0x11	; 17
      0081B3 20                    1179 	.db #0x20	; 32
      0081B4 20                    1180 	.db #0x20	; 32
      0081B5 11                    1181 	.db #0x11	; 17
      0081B6 0E                    1182 	.db #0x0e	; 14
      0081B7 00                    1183 	.db #0x00	; 0
      0081B8 00                    1184 	.db #0x00	; 0
      0081B9 38                    1185 	.db #0x38	; 56	'8'
      0081BA 08                    1186 	.db #0x08	; 8
      0081BB 08                    1187 	.db #0x08	; 8
      0081BC C8                    1188 	.db #0xc8	; 200
      0081BD 38                    1189 	.db #0x38	; 56	'8'
      0081BE 08                    1190 	.db #0x08	; 8
      0081BF 00                    1191 	.db #0x00	; 0
      0081C0 00                    1192 	.db #0x00	; 0
      0081C1 00                    1193 	.db #0x00	; 0
      0081C2 00                    1194 	.db #0x00	; 0
      0081C3 3F                    1195 	.db #0x3f	; 63
      0081C4 00                    1196 	.db #0x00	; 0
      0081C5 00                    1197 	.db #0x00	; 0
      0081C6 00                    1198 	.db #0x00	; 0
      0081C7 00                    1199 	.db #0x00	; 0
      0081C8 00                    1200 	.db #0x00	; 0
      0081C9 70                    1201 	.db #0x70	; 112	'p'
      0081CA 88                    1202 	.db #0x88	; 136
      0081CB 08                    1203 	.db #0x08	; 8
      0081CC 08                    1204 	.db #0x08	; 8
      0081CD 88                    1205 	.db #0x88	; 136
      0081CE 70                    1206 	.db #0x70	; 112	'p'
      0081CF 00                    1207 	.db #0x00	; 0
      0081D0 00                    1208 	.db #0x00	; 0
      0081D1 1C                    1209 	.db #0x1c	; 28
      0081D2 22                    1210 	.db #0x22	; 34
      0081D3 21                    1211 	.db #0x21	; 33
      0081D4 21                    1212 	.db #0x21	; 33
      0081D5 22                    1213 	.db #0x22	; 34
      0081D6 1C                    1214 	.db #0x1c	; 28
      0081D7 00                    1215 	.db #0x00	; 0
      0081D8 00                    1216 	.db #0x00	; 0
      0081D9 E0                    1217 	.db #0xe0	; 224
      0081DA 10                    1218 	.db #0x10	; 16
      0081DB 08                    1219 	.db #0x08	; 8
      0081DC 08                    1220 	.db #0x08	; 8
      0081DD 10                    1221 	.db #0x10	; 16
      0081DE E0                    1222 	.db #0xe0	; 224
      0081DF 00                    1223 	.db #0x00	; 0
      0081E0 00                    1224 	.db #0x00	; 0
      0081E1 00                    1225 	.db #0x00	; 0
      0081E2 31                    1226 	.db #0x31	; 49	'1'
      0081E3 22                    1227 	.db #0x22	; 34
      0081E4 22                    1228 	.db #0x22	; 34
      0081E5 11                    1229 	.db #0x11	; 17
      0081E6 0F                    1230 	.db #0x0f	; 15
      0081E7 00                    1231 	.db #0x00	; 0
      0081E8 00                    1232 	.db #0x00	; 0
      0081E9 00                    1233 	.db #0x00	; 0
      0081EA 00                    1234 	.db #0x00	; 0
      0081EB C0                    1235 	.db #0xc0	; 192
      0081EC C0                    1236 	.db #0xc0	; 192
      0081ED 00                    1237 	.db #0x00	; 0
      0081EE 00                    1238 	.db #0x00	; 0
      0081EF 00                    1239 	.db #0x00	; 0
      0081F0 00                    1240 	.db #0x00	; 0
      0081F1 00                    1241 	.db #0x00	; 0
      0081F2 00                    1242 	.db #0x00	; 0
      0081F3 30                    1243 	.db #0x30	; 48	'0'
      0081F4 30                    1244 	.db #0x30	; 48	'0'
      0081F5 00                    1245 	.db #0x00	; 0
      0081F6 00                    1246 	.db #0x00	; 0
      0081F7 00                    1247 	.db #0x00	; 0
      0081F8 00                    1248 	.db #0x00	; 0
      0081F9 00                    1249 	.db #0x00	; 0
      0081FA 00                    1250 	.db #0x00	; 0
      0081FB 80                    1251 	.db #0x80	; 128
      0081FC 00                    1252 	.db #0x00	; 0
      0081FD 00                    1253 	.db #0x00	; 0
      0081FE 00                    1254 	.db #0x00	; 0
      0081FF 00                    1255 	.db #0x00	; 0
      008200 00                    1256 	.db #0x00	; 0
      008201 00                    1257 	.db #0x00	; 0
      008202 80                    1258 	.db #0x80	; 128
      008203 60                    1259 	.db #0x60	; 96
      008204 00                    1260 	.db #0x00	; 0
      008205 00                    1261 	.db #0x00	; 0
      008206 00                    1262 	.db #0x00	; 0
      008207 00                    1263 	.db #0x00	; 0
      008208 00                    1264 	.db #0x00	; 0
      008209 00                    1265 	.db #0x00	; 0
      00820A 80                    1266 	.db #0x80	; 128
      00820B 40                    1267 	.db #0x40	; 64
      00820C 20                    1268 	.db #0x20	; 32
      00820D 10                    1269 	.db #0x10	; 16
      00820E 08                    1270 	.db #0x08	; 8
      00820F 00                    1271 	.db #0x00	; 0
      008210 00                    1272 	.db #0x00	; 0
      008211 01                    1273 	.db #0x01	; 1
      008212 02                    1274 	.db #0x02	; 2
      008213 04                    1275 	.db #0x04	; 4
      008214 08                    1276 	.db #0x08	; 8
      008215 10                    1277 	.db #0x10	; 16
      008216 20                    1278 	.db #0x20	; 32
      008217 00                    1279 	.db #0x00	; 0
      008218 40                    1280 	.db #0x40	; 64
      008219 40                    1281 	.db #0x40	; 64
      00821A 40                    1282 	.db #0x40	; 64
      00821B 40                    1283 	.db #0x40	; 64
      00821C 40                    1284 	.db #0x40	; 64
      00821D 40                    1285 	.db #0x40	; 64
      00821E 40                    1286 	.db #0x40	; 64
      00821F 00                    1287 	.db #0x00	; 0
      008220 04                    1288 	.db #0x04	; 4
      008221 04                    1289 	.db #0x04	; 4
      008222 04                    1290 	.db #0x04	; 4
      008223 04                    1291 	.db #0x04	; 4
      008224 04                    1292 	.db #0x04	; 4
      008225 04                    1293 	.db #0x04	; 4
      008226 04                    1294 	.db #0x04	; 4
      008227 00                    1295 	.db #0x00	; 0
      008228 00                    1296 	.db #0x00	; 0
      008229 08                    1297 	.db #0x08	; 8
      00822A 10                    1298 	.db #0x10	; 16
      00822B 20                    1299 	.db #0x20	; 32
      00822C 40                    1300 	.db #0x40	; 64
      00822D 80                    1301 	.db #0x80	; 128
      00822E 00                    1302 	.db #0x00	; 0
      00822F 00                    1303 	.db #0x00	; 0
      008230 00                    1304 	.db #0x00	; 0
      008231 20                    1305 	.db #0x20	; 32
      008232 10                    1306 	.db #0x10	; 16
      008233 08                    1307 	.db #0x08	; 8
      008234 04                    1308 	.db #0x04	; 4
      008235 02                    1309 	.db #0x02	; 2
      008236 01                    1310 	.db #0x01	; 1
      008237 00                    1311 	.db #0x00	; 0
      008238 00                    1312 	.db #0x00	; 0
      008239 70                    1313 	.db #0x70	; 112	'p'
      00823A 48                    1314 	.db #0x48	; 72	'H'
      00823B 08                    1315 	.db #0x08	; 8
      00823C 08                    1316 	.db #0x08	; 8
      00823D 08                    1317 	.db #0x08	; 8
      00823E F0                    1318 	.db #0xf0	; 240
      00823F 00                    1319 	.db #0x00	; 0
      008240 00                    1320 	.db #0x00	; 0
      008241 00                    1321 	.db #0x00	; 0
      008242 00                    1322 	.db #0x00	; 0
      008243 30                    1323 	.db #0x30	; 48	'0'
      008244 36                    1324 	.db #0x36	; 54	'6'
      008245 01                    1325 	.db #0x01	; 1
      008246 00                    1326 	.db #0x00	; 0
      008247 00                    1327 	.db #0x00	; 0
      008248 C0                    1328 	.db #0xc0	; 192
      008249 30                    1329 	.db #0x30	; 48	'0'
      00824A C8                    1330 	.db #0xc8	; 200
      00824B 28                    1331 	.db #0x28	; 40
      00824C E8                    1332 	.db #0xe8	; 232
      00824D 10                    1333 	.db #0x10	; 16
      00824E E0                    1334 	.db #0xe0	; 224
      00824F 00                    1335 	.db #0x00	; 0
      008250 07                    1336 	.db #0x07	; 7
      008251 18                    1337 	.db #0x18	; 24
      008252 27                    1338 	.db #0x27	; 39
      008253 24                    1339 	.db #0x24	; 36
      008254 23                    1340 	.db #0x23	; 35
      008255 14                    1341 	.db #0x14	; 20
      008256 0B                    1342 	.db #0x0b	; 11
      008257 00                    1343 	.db #0x00	; 0
      008258 00                    1344 	.db #0x00	; 0
      008259 00                    1345 	.db #0x00	; 0
      00825A C0                    1346 	.db #0xc0	; 192
      00825B 38                    1347 	.db #0x38	; 56	'8'
      00825C E0                    1348 	.db #0xe0	; 224
      00825D 00                    1349 	.db #0x00	; 0
      00825E 00                    1350 	.db #0x00	; 0
      00825F 00                    1351 	.db #0x00	; 0
      008260 20                    1352 	.db #0x20	; 32
      008261 3C                    1353 	.db #0x3c	; 60
      008262 23                    1354 	.db #0x23	; 35
      008263 02                    1355 	.db #0x02	; 2
      008264 02                    1356 	.db #0x02	; 2
      008265 27                    1357 	.db #0x27	; 39
      008266 38                    1358 	.db #0x38	; 56	'8'
      008267 20                    1359 	.db #0x20	; 32
      008268 08                    1360 	.db #0x08	; 8
      008269 F8                    1361 	.db #0xf8	; 248
      00826A 88                    1362 	.db #0x88	; 136
      00826B 88                    1363 	.db #0x88	; 136
      00826C 88                    1364 	.db #0x88	; 136
      00826D 70                    1365 	.db #0x70	; 112	'p'
      00826E 00                    1366 	.db #0x00	; 0
      00826F 00                    1367 	.db #0x00	; 0
      008270 20                    1368 	.db #0x20	; 32
      008271 3F                    1369 	.db #0x3f	; 63
      008272 20                    1370 	.db #0x20	; 32
      008273 20                    1371 	.db #0x20	; 32
      008274 20                    1372 	.db #0x20	; 32
      008275 11                    1373 	.db #0x11	; 17
      008276 0E                    1374 	.db #0x0e	; 14
      008277 00                    1375 	.db #0x00	; 0
      008278 C0                    1376 	.db #0xc0	; 192
      008279 30                    1377 	.db #0x30	; 48	'0'
      00827A 08                    1378 	.db #0x08	; 8
      00827B 08                    1379 	.db #0x08	; 8
      00827C 08                    1380 	.db #0x08	; 8
      00827D 08                    1381 	.db #0x08	; 8
      00827E 38                    1382 	.db #0x38	; 56	'8'
      00827F 00                    1383 	.db #0x00	; 0
      008280 07                    1384 	.db #0x07	; 7
      008281 18                    1385 	.db #0x18	; 24
      008282 20                    1386 	.db #0x20	; 32
      008283 20                    1387 	.db #0x20	; 32
      008284 20                    1388 	.db #0x20	; 32
      008285 10                    1389 	.db #0x10	; 16
      008286 08                    1390 	.db #0x08	; 8
      008287 00                    1391 	.db #0x00	; 0
      008288 08                    1392 	.db #0x08	; 8
      008289 F8                    1393 	.db #0xf8	; 248
      00828A 08                    1394 	.db #0x08	; 8
      00828B 08                    1395 	.db #0x08	; 8
      00828C 08                    1396 	.db #0x08	; 8
      00828D 10                    1397 	.db #0x10	; 16
      00828E E0                    1398 	.db #0xe0	; 224
      00828F 00                    1399 	.db #0x00	; 0
      008290 20                    1400 	.db #0x20	; 32
      008291 3F                    1401 	.db #0x3f	; 63
      008292 20                    1402 	.db #0x20	; 32
      008293 20                    1403 	.db #0x20	; 32
      008294 20                    1404 	.db #0x20	; 32
      008295 10                    1405 	.db #0x10	; 16
      008296 0F                    1406 	.db #0x0f	; 15
      008297 00                    1407 	.db #0x00	; 0
      008298 08                    1408 	.db #0x08	; 8
      008299 F8                    1409 	.db #0xf8	; 248
      00829A 88                    1410 	.db #0x88	; 136
      00829B 88                    1411 	.db #0x88	; 136
      00829C E8                    1412 	.db #0xe8	; 232
      00829D 08                    1413 	.db #0x08	; 8
      00829E 10                    1414 	.db #0x10	; 16
      00829F 00                    1415 	.db #0x00	; 0
      0082A0 20                    1416 	.db #0x20	; 32
      0082A1 3F                    1417 	.db #0x3f	; 63
      0082A2 20                    1418 	.db #0x20	; 32
      0082A3 20                    1419 	.db #0x20	; 32
      0082A4 23                    1420 	.db #0x23	; 35
      0082A5 20                    1421 	.db #0x20	; 32
      0082A6 18                    1422 	.db #0x18	; 24
      0082A7 00                    1423 	.db #0x00	; 0
      0082A8 08                    1424 	.db #0x08	; 8
      0082A9 F8                    1425 	.db #0xf8	; 248
      0082AA 88                    1426 	.db #0x88	; 136
      0082AB 88                    1427 	.db #0x88	; 136
      0082AC E8                    1428 	.db #0xe8	; 232
      0082AD 08                    1429 	.db #0x08	; 8
      0082AE 10                    1430 	.db #0x10	; 16
      0082AF 00                    1431 	.db #0x00	; 0
      0082B0 20                    1432 	.db #0x20	; 32
      0082B1 3F                    1433 	.db #0x3f	; 63
      0082B2 20                    1434 	.db #0x20	; 32
      0082B3 00                    1435 	.db #0x00	; 0
      0082B4 03                    1436 	.db #0x03	; 3
      0082B5 00                    1437 	.db #0x00	; 0
      0082B6 00                    1438 	.db #0x00	; 0
      0082B7 00                    1439 	.db #0x00	; 0
      0082B8 C0                    1440 	.db #0xc0	; 192
      0082B9 30                    1441 	.db #0x30	; 48	'0'
      0082BA 08                    1442 	.db #0x08	; 8
      0082BB 08                    1443 	.db #0x08	; 8
      0082BC 08                    1444 	.db #0x08	; 8
      0082BD 38                    1445 	.db #0x38	; 56	'8'
      0082BE 00                    1446 	.db #0x00	; 0
      0082BF 00                    1447 	.db #0x00	; 0
      0082C0 07                    1448 	.db #0x07	; 7
      0082C1 18                    1449 	.db #0x18	; 24
      0082C2 20                    1450 	.db #0x20	; 32
      0082C3 20                    1451 	.db #0x20	; 32
      0082C4 22                    1452 	.db #0x22	; 34
      0082C5 1E                    1453 	.db #0x1e	; 30
      0082C6 02                    1454 	.db #0x02	; 2
      0082C7 00                    1455 	.db #0x00	; 0
      0082C8 08                    1456 	.db #0x08	; 8
      0082C9 F8                    1457 	.db #0xf8	; 248
      0082CA 08                    1458 	.db #0x08	; 8
      0082CB 00                    1459 	.db #0x00	; 0
      0082CC 00                    1460 	.db #0x00	; 0
      0082CD 08                    1461 	.db #0x08	; 8
      0082CE F8                    1462 	.db #0xf8	; 248
      0082CF 08                    1463 	.db #0x08	; 8
      0082D0 20                    1464 	.db #0x20	; 32
      0082D1 3F                    1465 	.db #0x3f	; 63
      0082D2 21                    1466 	.db #0x21	; 33
      0082D3 01                    1467 	.db #0x01	; 1
      0082D4 01                    1468 	.db #0x01	; 1
      0082D5 21                    1469 	.db #0x21	; 33
      0082D6 3F                    1470 	.db #0x3f	; 63
      0082D7 20                    1471 	.db #0x20	; 32
      0082D8 00                    1472 	.db #0x00	; 0
      0082D9 08                    1473 	.db #0x08	; 8
      0082DA 08                    1474 	.db #0x08	; 8
      0082DB F8                    1475 	.db #0xf8	; 248
      0082DC 08                    1476 	.db #0x08	; 8
      0082DD 08                    1477 	.db #0x08	; 8
      0082DE 00                    1478 	.db #0x00	; 0
      0082DF 00                    1479 	.db #0x00	; 0
      0082E0 00                    1480 	.db #0x00	; 0
      0082E1 20                    1481 	.db #0x20	; 32
      0082E2 20                    1482 	.db #0x20	; 32
      0082E3 3F                    1483 	.db #0x3f	; 63
      0082E4 20                    1484 	.db #0x20	; 32
      0082E5 20                    1485 	.db #0x20	; 32
      0082E6 00                    1486 	.db #0x00	; 0
      0082E7 00                    1487 	.db #0x00	; 0
      0082E8 00                    1488 	.db #0x00	; 0
      0082E9 00                    1489 	.db #0x00	; 0
      0082EA 08                    1490 	.db #0x08	; 8
      0082EB 08                    1491 	.db #0x08	; 8
      0082EC F8                    1492 	.db #0xf8	; 248
      0082ED 08                    1493 	.db #0x08	; 8
      0082EE 08                    1494 	.db #0x08	; 8
      0082EF 00                    1495 	.db #0x00	; 0
      0082F0 C0                    1496 	.db #0xc0	; 192
      0082F1 80                    1497 	.db #0x80	; 128
      0082F2 80                    1498 	.db #0x80	; 128
      0082F3 80                    1499 	.db #0x80	; 128
      0082F4 7F                    1500 	.db #0x7f	; 127
      0082F5 00                    1501 	.db #0x00	; 0
      0082F6 00                    1502 	.db #0x00	; 0
      0082F7 00                    1503 	.db #0x00	; 0
      0082F8 08                    1504 	.db #0x08	; 8
      0082F9 F8                    1505 	.db #0xf8	; 248
      0082FA 88                    1506 	.db #0x88	; 136
      0082FB C0                    1507 	.db #0xc0	; 192
      0082FC 28                    1508 	.db #0x28	; 40
      0082FD 18                    1509 	.db #0x18	; 24
      0082FE 08                    1510 	.db #0x08	; 8
      0082FF 00                    1511 	.db #0x00	; 0
      008300 20                    1512 	.db #0x20	; 32
      008301 3F                    1513 	.db #0x3f	; 63
      008302 20                    1514 	.db #0x20	; 32
      008303 01                    1515 	.db #0x01	; 1
      008304 26                    1516 	.db #0x26	; 38
      008305 38                    1517 	.db #0x38	; 56	'8'
      008306 20                    1518 	.db #0x20	; 32
      008307 00                    1519 	.db #0x00	; 0
      008308 08                    1520 	.db #0x08	; 8
      008309 F8                    1521 	.db #0xf8	; 248
      00830A 08                    1522 	.db #0x08	; 8
      00830B 00                    1523 	.db #0x00	; 0
      00830C 00                    1524 	.db #0x00	; 0
      00830D 00                    1525 	.db #0x00	; 0
      00830E 00                    1526 	.db #0x00	; 0
      00830F 00                    1527 	.db #0x00	; 0
      008310 20                    1528 	.db #0x20	; 32
      008311 3F                    1529 	.db #0x3f	; 63
      008312 20                    1530 	.db #0x20	; 32
      008313 20                    1531 	.db #0x20	; 32
      008314 20                    1532 	.db #0x20	; 32
      008315 20                    1533 	.db #0x20	; 32
      008316 30                    1534 	.db #0x30	; 48	'0'
      008317 00                    1535 	.db #0x00	; 0
      008318 08                    1536 	.db #0x08	; 8
      008319 F8                    1537 	.db #0xf8	; 248
      00831A F8                    1538 	.db #0xf8	; 248
      00831B 00                    1539 	.db #0x00	; 0
      00831C F8                    1540 	.db #0xf8	; 248
      00831D F8                    1541 	.db #0xf8	; 248
      00831E 08                    1542 	.db #0x08	; 8
      00831F 00                    1543 	.db #0x00	; 0
      008320 20                    1544 	.db #0x20	; 32
      008321 3F                    1545 	.db #0x3f	; 63
      008322 00                    1546 	.db #0x00	; 0
      008323 3F                    1547 	.db #0x3f	; 63
      008324 00                    1548 	.db #0x00	; 0
      008325 3F                    1549 	.db #0x3f	; 63
      008326 20                    1550 	.db #0x20	; 32
      008327 00                    1551 	.db #0x00	; 0
      008328 08                    1552 	.db #0x08	; 8
      008329 F8                    1553 	.db #0xf8	; 248
      00832A 30                    1554 	.db #0x30	; 48	'0'
      00832B C0                    1555 	.db #0xc0	; 192
      00832C 00                    1556 	.db #0x00	; 0
      00832D 08                    1557 	.db #0x08	; 8
      00832E F8                    1558 	.db #0xf8	; 248
      00832F 08                    1559 	.db #0x08	; 8
      008330 20                    1560 	.db #0x20	; 32
      008331 3F                    1561 	.db #0x3f	; 63
      008332 20                    1562 	.db #0x20	; 32
      008333 00                    1563 	.db #0x00	; 0
      008334 07                    1564 	.db #0x07	; 7
      008335 18                    1565 	.db #0x18	; 24
      008336 3F                    1566 	.db #0x3f	; 63
      008337 00                    1567 	.db #0x00	; 0
      008338 E0                    1568 	.db #0xe0	; 224
      008339 10                    1569 	.db #0x10	; 16
      00833A 08                    1570 	.db #0x08	; 8
      00833B 08                    1571 	.db #0x08	; 8
      00833C 08                    1572 	.db #0x08	; 8
      00833D 10                    1573 	.db #0x10	; 16
      00833E E0                    1574 	.db #0xe0	; 224
      00833F 00                    1575 	.db #0x00	; 0
      008340 0F                    1576 	.db #0x0f	; 15
      008341 10                    1577 	.db #0x10	; 16
      008342 20                    1578 	.db #0x20	; 32
      008343 20                    1579 	.db #0x20	; 32
      008344 20                    1580 	.db #0x20	; 32
      008345 10                    1581 	.db #0x10	; 16
      008346 0F                    1582 	.db #0x0f	; 15
      008347 00                    1583 	.db #0x00	; 0
      008348 08                    1584 	.db #0x08	; 8
      008349 F8                    1585 	.db #0xf8	; 248
      00834A 08                    1586 	.db #0x08	; 8
      00834B 08                    1587 	.db #0x08	; 8
      00834C 08                    1588 	.db #0x08	; 8
      00834D 08                    1589 	.db #0x08	; 8
      00834E F0                    1590 	.db #0xf0	; 240
      00834F 00                    1591 	.db #0x00	; 0
      008350 20                    1592 	.db #0x20	; 32
      008351 3F                    1593 	.db #0x3f	; 63
      008352 21                    1594 	.db #0x21	; 33
      008353 01                    1595 	.db #0x01	; 1
      008354 01                    1596 	.db #0x01	; 1
      008355 01                    1597 	.db #0x01	; 1
      008356 00                    1598 	.db #0x00	; 0
      008357 00                    1599 	.db #0x00	; 0
      008358 E0                    1600 	.db #0xe0	; 224
      008359 10                    1601 	.db #0x10	; 16
      00835A 08                    1602 	.db #0x08	; 8
      00835B 08                    1603 	.db #0x08	; 8
      00835C 08                    1604 	.db #0x08	; 8
      00835D 10                    1605 	.db #0x10	; 16
      00835E E0                    1606 	.db #0xe0	; 224
      00835F 00                    1607 	.db #0x00	; 0
      008360 0F                    1608 	.db #0x0f	; 15
      008361 18                    1609 	.db #0x18	; 24
      008362 24                    1610 	.db #0x24	; 36
      008363 24                    1611 	.db #0x24	; 36
      008364 38                    1612 	.db #0x38	; 56	'8'
      008365 50                    1613 	.db #0x50	; 80	'P'
      008366 4F                    1614 	.db #0x4f	; 79	'O'
      008367 00                    1615 	.db #0x00	; 0
      008368 08                    1616 	.db #0x08	; 8
      008369 F8                    1617 	.db #0xf8	; 248
      00836A 88                    1618 	.db #0x88	; 136
      00836B 88                    1619 	.db #0x88	; 136
      00836C 88                    1620 	.db #0x88	; 136
      00836D 88                    1621 	.db #0x88	; 136
      00836E 70                    1622 	.db #0x70	; 112	'p'
      00836F 00                    1623 	.db #0x00	; 0
      008370 20                    1624 	.db #0x20	; 32
      008371 3F                    1625 	.db #0x3f	; 63
      008372 20                    1626 	.db #0x20	; 32
      008373 00                    1627 	.db #0x00	; 0
      008374 03                    1628 	.db #0x03	; 3
      008375 0C                    1629 	.db #0x0c	; 12
      008376 30                    1630 	.db #0x30	; 48	'0'
      008377 20                    1631 	.db #0x20	; 32
      008378 00                    1632 	.db #0x00	; 0
      008379 70                    1633 	.db #0x70	; 112	'p'
      00837A 88                    1634 	.db #0x88	; 136
      00837B 08                    1635 	.db #0x08	; 8
      00837C 08                    1636 	.db #0x08	; 8
      00837D 08                    1637 	.db #0x08	; 8
      00837E 38                    1638 	.db #0x38	; 56	'8'
      00837F 00                    1639 	.db #0x00	; 0
      008380 00                    1640 	.db #0x00	; 0
      008381 38                    1641 	.db #0x38	; 56	'8'
      008382 20                    1642 	.db #0x20	; 32
      008383 21                    1643 	.db #0x21	; 33
      008384 21                    1644 	.db #0x21	; 33
      008385 22                    1645 	.db #0x22	; 34
      008386 1C                    1646 	.db #0x1c	; 28
      008387 00                    1647 	.db #0x00	; 0
      008388 18                    1648 	.db #0x18	; 24
      008389 08                    1649 	.db #0x08	; 8
      00838A 08                    1650 	.db #0x08	; 8
      00838B F8                    1651 	.db #0xf8	; 248
      00838C 08                    1652 	.db #0x08	; 8
      00838D 08                    1653 	.db #0x08	; 8
      00838E 18                    1654 	.db #0x18	; 24
      00838F 00                    1655 	.db #0x00	; 0
      008390 00                    1656 	.db #0x00	; 0
      008391 00                    1657 	.db #0x00	; 0
      008392 20                    1658 	.db #0x20	; 32
      008393 3F                    1659 	.db #0x3f	; 63
      008394 20                    1660 	.db #0x20	; 32
      008395 00                    1661 	.db #0x00	; 0
      008396 00                    1662 	.db #0x00	; 0
      008397 00                    1663 	.db #0x00	; 0
      008398 08                    1664 	.db #0x08	; 8
      008399 F8                    1665 	.db #0xf8	; 248
      00839A 08                    1666 	.db #0x08	; 8
      00839B 00                    1667 	.db #0x00	; 0
      00839C 00                    1668 	.db #0x00	; 0
      00839D 08                    1669 	.db #0x08	; 8
      00839E F8                    1670 	.db #0xf8	; 248
      00839F 08                    1671 	.db #0x08	; 8
      0083A0 00                    1672 	.db #0x00	; 0
      0083A1 1F                    1673 	.db #0x1f	; 31
      0083A2 20                    1674 	.db #0x20	; 32
      0083A3 20                    1675 	.db #0x20	; 32
      0083A4 20                    1676 	.db #0x20	; 32
      0083A5 20                    1677 	.db #0x20	; 32
      0083A6 1F                    1678 	.db #0x1f	; 31
      0083A7 00                    1679 	.db #0x00	; 0
      0083A8 08                    1680 	.db #0x08	; 8
      0083A9 78                    1681 	.db #0x78	; 120	'x'
      0083AA 88                    1682 	.db #0x88	; 136
      0083AB 00                    1683 	.db #0x00	; 0
      0083AC 00                    1684 	.db #0x00	; 0
      0083AD C8                    1685 	.db #0xc8	; 200
      0083AE 38                    1686 	.db #0x38	; 56	'8'
      0083AF 08                    1687 	.db #0x08	; 8
      0083B0 00                    1688 	.db #0x00	; 0
      0083B1 00                    1689 	.db #0x00	; 0
      0083B2 07                    1690 	.db #0x07	; 7
      0083B3 38                    1691 	.db #0x38	; 56	'8'
      0083B4 0E                    1692 	.db #0x0e	; 14
      0083B5 01                    1693 	.db #0x01	; 1
      0083B6 00                    1694 	.db #0x00	; 0
      0083B7 00                    1695 	.db #0x00	; 0
      0083B8 F8                    1696 	.db #0xf8	; 248
      0083B9 08                    1697 	.db #0x08	; 8
      0083BA 00                    1698 	.db #0x00	; 0
      0083BB F8                    1699 	.db #0xf8	; 248
      0083BC 00                    1700 	.db #0x00	; 0
      0083BD 08                    1701 	.db #0x08	; 8
      0083BE F8                    1702 	.db #0xf8	; 248
      0083BF 00                    1703 	.db #0x00	; 0
      0083C0 03                    1704 	.db #0x03	; 3
      0083C1 3C                    1705 	.db #0x3c	; 60
      0083C2 07                    1706 	.db #0x07	; 7
      0083C3 00                    1707 	.db #0x00	; 0
      0083C4 07                    1708 	.db #0x07	; 7
      0083C5 3C                    1709 	.db #0x3c	; 60
      0083C6 03                    1710 	.db #0x03	; 3
      0083C7 00                    1711 	.db #0x00	; 0
      0083C8 08                    1712 	.db #0x08	; 8
      0083C9 18                    1713 	.db #0x18	; 24
      0083CA 68                    1714 	.db #0x68	; 104	'h'
      0083CB 80                    1715 	.db #0x80	; 128
      0083CC 80                    1716 	.db #0x80	; 128
      0083CD 68                    1717 	.db #0x68	; 104	'h'
      0083CE 18                    1718 	.db #0x18	; 24
      0083CF 08                    1719 	.db #0x08	; 8
      0083D0 20                    1720 	.db #0x20	; 32
      0083D1 30                    1721 	.db #0x30	; 48	'0'
      0083D2 2C                    1722 	.db #0x2c	; 44
      0083D3 03                    1723 	.db #0x03	; 3
      0083D4 03                    1724 	.db #0x03	; 3
      0083D5 2C                    1725 	.db #0x2c	; 44
      0083D6 30                    1726 	.db #0x30	; 48	'0'
      0083D7 20                    1727 	.db #0x20	; 32
      0083D8 08                    1728 	.db #0x08	; 8
      0083D9 38                    1729 	.db #0x38	; 56	'8'
      0083DA C8                    1730 	.db #0xc8	; 200
      0083DB 00                    1731 	.db #0x00	; 0
      0083DC C8                    1732 	.db #0xc8	; 200
      0083DD 38                    1733 	.db #0x38	; 56	'8'
      0083DE 08                    1734 	.db #0x08	; 8
      0083DF 00                    1735 	.db #0x00	; 0
      0083E0 00                    1736 	.db #0x00	; 0
      0083E1 00                    1737 	.db #0x00	; 0
      0083E2 20                    1738 	.db #0x20	; 32
      0083E3 3F                    1739 	.db #0x3f	; 63
      0083E4 20                    1740 	.db #0x20	; 32
      0083E5 00                    1741 	.db #0x00	; 0
      0083E6 00                    1742 	.db #0x00	; 0
      0083E7 00                    1743 	.db #0x00	; 0
      0083E8 10                    1744 	.db #0x10	; 16
      0083E9 08                    1745 	.db #0x08	; 8
      0083EA 08                    1746 	.db #0x08	; 8
      0083EB 08                    1747 	.db #0x08	; 8
      0083EC C8                    1748 	.db #0xc8	; 200
      0083ED 38                    1749 	.db #0x38	; 56	'8'
      0083EE 08                    1750 	.db #0x08	; 8
      0083EF 00                    1751 	.db #0x00	; 0
      0083F0 20                    1752 	.db #0x20	; 32
      0083F1 38                    1753 	.db #0x38	; 56	'8'
      0083F2 26                    1754 	.db #0x26	; 38
      0083F3 21                    1755 	.db #0x21	; 33
      0083F4 20                    1756 	.db #0x20	; 32
      0083F5 20                    1757 	.db #0x20	; 32
      0083F6 18                    1758 	.db #0x18	; 24
      0083F7 00                    1759 	.db #0x00	; 0
      0083F8 00                    1760 	.db #0x00	; 0
      0083F9 00                    1761 	.db #0x00	; 0
      0083FA 00                    1762 	.db #0x00	; 0
      0083FB FE                    1763 	.db #0xfe	; 254
      0083FC 02                    1764 	.db #0x02	; 2
      0083FD 02                    1765 	.db #0x02	; 2
      0083FE 02                    1766 	.db #0x02	; 2
      0083FF 00                    1767 	.db #0x00	; 0
      008400 00                    1768 	.db #0x00	; 0
      008401 00                    1769 	.db #0x00	; 0
      008402 00                    1770 	.db #0x00	; 0
      008403 7F                    1771 	.db #0x7f	; 127
      008404 40                    1772 	.db #0x40	; 64
      008405 40                    1773 	.db #0x40	; 64
      008406 40                    1774 	.db #0x40	; 64
      008407 00                    1775 	.db #0x00	; 0
      008408 00                    1776 	.db #0x00	; 0
      008409 0C                    1777 	.db #0x0c	; 12
      00840A 30                    1778 	.db #0x30	; 48	'0'
      00840B C0                    1779 	.db #0xc0	; 192
      00840C 00                    1780 	.db #0x00	; 0
      00840D 00                    1781 	.db #0x00	; 0
      00840E 00                    1782 	.db #0x00	; 0
      00840F 00                    1783 	.db #0x00	; 0
      008410 00                    1784 	.db #0x00	; 0
      008411 00                    1785 	.db #0x00	; 0
      008412 00                    1786 	.db #0x00	; 0
      008413 01                    1787 	.db #0x01	; 1
      008414 06                    1788 	.db #0x06	; 6
      008415 38                    1789 	.db #0x38	; 56	'8'
      008416 C0                    1790 	.db #0xc0	; 192
      008417 00                    1791 	.db #0x00	; 0
      008418 00                    1792 	.db #0x00	; 0
      008419 02                    1793 	.db #0x02	; 2
      00841A 02                    1794 	.db #0x02	; 2
      00841B 02                    1795 	.db #0x02	; 2
      00841C FE                    1796 	.db #0xfe	; 254
      00841D 00                    1797 	.db #0x00	; 0
      00841E 00                    1798 	.db #0x00	; 0
      00841F 00                    1799 	.db #0x00	; 0
      008420 00                    1800 	.db #0x00	; 0
      008421 40                    1801 	.db #0x40	; 64
      008422 40                    1802 	.db #0x40	; 64
      008423 40                    1803 	.db #0x40	; 64
      008424 7F                    1804 	.db #0x7f	; 127
      008425 00                    1805 	.db #0x00	; 0
      008426 00                    1806 	.db #0x00	; 0
      008427 00                    1807 	.db #0x00	; 0
      008428 00                    1808 	.db #0x00	; 0
      008429 00                    1809 	.db #0x00	; 0
      00842A 04                    1810 	.db #0x04	; 4
      00842B 02                    1811 	.db #0x02	; 2
      00842C 02                    1812 	.db #0x02	; 2
      00842D 02                    1813 	.db #0x02	; 2
      00842E 04                    1814 	.db #0x04	; 4
      00842F 00                    1815 	.db #0x00	; 0
      008430 00                    1816 	.db #0x00	; 0
      008431 00                    1817 	.db #0x00	; 0
      008432 00                    1818 	.db #0x00	; 0
      008433 00                    1819 	.db #0x00	; 0
      008434 00                    1820 	.db #0x00	; 0
      008435 00                    1821 	.db #0x00	; 0
      008436 00                    1822 	.db #0x00	; 0
      008437 00                    1823 	.db #0x00	; 0
      008438 00                    1824 	.db #0x00	; 0
      008439 00                    1825 	.db #0x00	; 0
      00843A 00                    1826 	.db #0x00	; 0
      00843B 00                    1827 	.db #0x00	; 0
      00843C 00                    1828 	.db #0x00	; 0
      00843D 00                    1829 	.db #0x00	; 0
      00843E 00                    1830 	.db #0x00	; 0
      00843F 00                    1831 	.db #0x00	; 0
      008440 80                    1832 	.db #0x80	; 128
      008441 80                    1833 	.db #0x80	; 128
      008442 80                    1834 	.db #0x80	; 128
      008443 80                    1835 	.db #0x80	; 128
      008444 80                    1836 	.db #0x80	; 128
      008445 80                    1837 	.db #0x80	; 128
      008446 80                    1838 	.db #0x80	; 128
      008447 80                    1839 	.db #0x80	; 128
      008448 00                    1840 	.db #0x00	; 0
      008449 02                    1841 	.db #0x02	; 2
      00844A 02                    1842 	.db #0x02	; 2
      00844B 04                    1843 	.db #0x04	; 4
      00844C 00                    1844 	.db #0x00	; 0
      00844D 00                    1845 	.db #0x00	; 0
      00844E 00                    1846 	.db #0x00	; 0
      00844F 00                    1847 	.db #0x00	; 0
      008450 00                    1848 	.db #0x00	; 0
      008451 00                    1849 	.db #0x00	; 0
      008452 00                    1850 	.db #0x00	; 0
      008453 00                    1851 	.db #0x00	; 0
      008454 00                    1852 	.db #0x00	; 0
      008455 00                    1853 	.db #0x00	; 0
      008456 00                    1854 	.db #0x00	; 0
      008457 00                    1855 	.db #0x00	; 0
      008458 00                    1856 	.db #0x00	; 0
      008459 00                    1857 	.db #0x00	; 0
      00845A 80                    1858 	.db #0x80	; 128
      00845B 80                    1859 	.db #0x80	; 128
      00845C 80                    1860 	.db #0x80	; 128
      00845D 80                    1861 	.db #0x80	; 128
      00845E 00                    1862 	.db #0x00	; 0
      00845F 00                    1863 	.db #0x00	; 0
      008460 00                    1864 	.db #0x00	; 0
      008461 19                    1865 	.db #0x19	; 25
      008462 24                    1866 	.db #0x24	; 36
      008463 22                    1867 	.db #0x22	; 34
      008464 22                    1868 	.db #0x22	; 34
      008465 22                    1869 	.db #0x22	; 34
      008466 3F                    1870 	.db #0x3f	; 63
      008467 20                    1871 	.db #0x20	; 32
      008468 08                    1872 	.db #0x08	; 8
      008469 F8                    1873 	.db #0xf8	; 248
      00846A 00                    1874 	.db #0x00	; 0
      00846B 80                    1875 	.db #0x80	; 128
      00846C 80                    1876 	.db #0x80	; 128
      00846D 00                    1877 	.db #0x00	; 0
      00846E 00                    1878 	.db #0x00	; 0
      00846F 00                    1879 	.db #0x00	; 0
      008470 00                    1880 	.db #0x00	; 0
      008471 3F                    1881 	.db #0x3f	; 63
      008472 11                    1882 	.db #0x11	; 17
      008473 20                    1883 	.db #0x20	; 32
      008474 20                    1884 	.db #0x20	; 32
      008475 11                    1885 	.db #0x11	; 17
      008476 0E                    1886 	.db #0x0e	; 14
      008477 00                    1887 	.db #0x00	; 0
      008478 00                    1888 	.db #0x00	; 0
      008479 00                    1889 	.db #0x00	; 0
      00847A 00                    1890 	.db #0x00	; 0
      00847B 80                    1891 	.db #0x80	; 128
      00847C 80                    1892 	.db #0x80	; 128
      00847D 80                    1893 	.db #0x80	; 128
      00847E 00                    1894 	.db #0x00	; 0
      00847F 00                    1895 	.db #0x00	; 0
      008480 00                    1896 	.db #0x00	; 0
      008481 0E                    1897 	.db #0x0e	; 14
      008482 11                    1898 	.db #0x11	; 17
      008483 20                    1899 	.db #0x20	; 32
      008484 20                    1900 	.db #0x20	; 32
      008485 20                    1901 	.db #0x20	; 32
      008486 11                    1902 	.db #0x11	; 17
      008487 00                    1903 	.db #0x00	; 0
      008488 00                    1904 	.db #0x00	; 0
      008489 00                    1905 	.db #0x00	; 0
      00848A 00                    1906 	.db #0x00	; 0
      00848B 80                    1907 	.db #0x80	; 128
      00848C 80                    1908 	.db #0x80	; 128
      00848D 88                    1909 	.db #0x88	; 136
      00848E F8                    1910 	.db #0xf8	; 248
      00848F 00                    1911 	.db #0x00	; 0
      008490 00                    1912 	.db #0x00	; 0
      008491 0E                    1913 	.db #0x0e	; 14
      008492 11                    1914 	.db #0x11	; 17
      008493 20                    1915 	.db #0x20	; 32
      008494 20                    1916 	.db #0x20	; 32
      008495 10                    1917 	.db #0x10	; 16
      008496 3F                    1918 	.db #0x3f	; 63
      008497 20                    1919 	.db #0x20	; 32
      008498 00                    1920 	.db #0x00	; 0
      008499 00                    1921 	.db #0x00	; 0
      00849A 80                    1922 	.db #0x80	; 128
      00849B 80                    1923 	.db #0x80	; 128
      00849C 80                    1924 	.db #0x80	; 128
      00849D 80                    1925 	.db #0x80	; 128
      00849E 00                    1926 	.db #0x00	; 0
      00849F 00                    1927 	.db #0x00	; 0
      0084A0 00                    1928 	.db #0x00	; 0
      0084A1 1F                    1929 	.db #0x1f	; 31
      0084A2 22                    1930 	.db #0x22	; 34
      0084A3 22                    1931 	.db #0x22	; 34
      0084A4 22                    1932 	.db #0x22	; 34
      0084A5 22                    1933 	.db #0x22	; 34
      0084A6 13                    1934 	.db #0x13	; 19
      0084A7 00                    1935 	.db #0x00	; 0
      0084A8 00                    1936 	.db #0x00	; 0
      0084A9 80                    1937 	.db #0x80	; 128
      0084AA 80                    1938 	.db #0x80	; 128
      0084AB F0                    1939 	.db #0xf0	; 240
      0084AC 88                    1940 	.db #0x88	; 136
      0084AD 88                    1941 	.db #0x88	; 136
      0084AE 88                    1942 	.db #0x88	; 136
      0084AF 18                    1943 	.db #0x18	; 24
      0084B0 00                    1944 	.db #0x00	; 0
      0084B1 20                    1945 	.db #0x20	; 32
      0084B2 20                    1946 	.db #0x20	; 32
      0084B3 3F                    1947 	.db #0x3f	; 63
      0084B4 20                    1948 	.db #0x20	; 32
      0084B5 20                    1949 	.db #0x20	; 32
      0084B6 00                    1950 	.db #0x00	; 0
      0084B7 00                    1951 	.db #0x00	; 0
      0084B8 00                    1952 	.db #0x00	; 0
      0084B9 00                    1953 	.db #0x00	; 0
      0084BA 80                    1954 	.db #0x80	; 128
      0084BB 80                    1955 	.db #0x80	; 128
      0084BC 80                    1956 	.db #0x80	; 128
      0084BD 80                    1957 	.db #0x80	; 128
      0084BE 80                    1958 	.db #0x80	; 128
      0084BF 00                    1959 	.db #0x00	; 0
      0084C0 00                    1960 	.db #0x00	; 0
      0084C1 6B                    1961 	.db #0x6b	; 107	'k'
      0084C2 94                    1962 	.db #0x94	; 148
      0084C3 94                    1963 	.db #0x94	; 148
      0084C4 94                    1964 	.db #0x94	; 148
      0084C5 93                    1965 	.db #0x93	; 147
      0084C6 60                    1966 	.db #0x60	; 96
      0084C7 00                    1967 	.db #0x00	; 0
      0084C8 08                    1968 	.db #0x08	; 8
      0084C9 F8                    1969 	.db #0xf8	; 248
      0084CA 00                    1970 	.db #0x00	; 0
      0084CB 80                    1971 	.db #0x80	; 128
      0084CC 80                    1972 	.db #0x80	; 128
      0084CD 80                    1973 	.db #0x80	; 128
      0084CE 00                    1974 	.db #0x00	; 0
      0084CF 00                    1975 	.db #0x00	; 0
      0084D0 20                    1976 	.db #0x20	; 32
      0084D1 3F                    1977 	.db #0x3f	; 63
      0084D2 21                    1978 	.db #0x21	; 33
      0084D3 00                    1979 	.db #0x00	; 0
      0084D4 00                    1980 	.db #0x00	; 0
      0084D5 20                    1981 	.db #0x20	; 32
      0084D6 3F                    1982 	.db #0x3f	; 63
      0084D7 20                    1983 	.db #0x20	; 32
      0084D8 00                    1984 	.db #0x00	; 0
      0084D9 80                    1985 	.db #0x80	; 128
      0084DA 98                    1986 	.db #0x98	; 152
      0084DB 98                    1987 	.db #0x98	; 152
      0084DC 00                    1988 	.db #0x00	; 0
      0084DD 00                    1989 	.db #0x00	; 0
      0084DE 00                    1990 	.db #0x00	; 0
      0084DF 00                    1991 	.db #0x00	; 0
      0084E0 00                    1992 	.db #0x00	; 0
      0084E1 20                    1993 	.db #0x20	; 32
      0084E2 20                    1994 	.db #0x20	; 32
      0084E3 3F                    1995 	.db #0x3f	; 63
      0084E4 20                    1996 	.db #0x20	; 32
      0084E5 20                    1997 	.db #0x20	; 32
      0084E6 00                    1998 	.db #0x00	; 0
      0084E7 00                    1999 	.db #0x00	; 0
      0084E8 00                    2000 	.db #0x00	; 0
      0084E9 00                    2001 	.db #0x00	; 0
      0084EA 00                    2002 	.db #0x00	; 0
      0084EB 80                    2003 	.db #0x80	; 128
      0084EC 98                    2004 	.db #0x98	; 152
      0084ED 98                    2005 	.db #0x98	; 152
      0084EE 00                    2006 	.db #0x00	; 0
      0084EF 00                    2007 	.db #0x00	; 0
      0084F0 00                    2008 	.db #0x00	; 0
      0084F1 C0                    2009 	.db #0xc0	; 192
      0084F2 80                    2010 	.db #0x80	; 128
      0084F3 80                    2011 	.db #0x80	; 128
      0084F4 80                    2012 	.db #0x80	; 128
      0084F5 7F                    2013 	.db #0x7f	; 127
      0084F6 00                    2014 	.db #0x00	; 0
      0084F7 00                    2015 	.db #0x00	; 0
      0084F8 08                    2016 	.db #0x08	; 8
      0084F9 F8                    2017 	.db #0xf8	; 248
      0084FA 00                    2018 	.db #0x00	; 0
      0084FB 00                    2019 	.db #0x00	; 0
      0084FC 80                    2020 	.db #0x80	; 128
      0084FD 80                    2021 	.db #0x80	; 128
      0084FE 80                    2022 	.db #0x80	; 128
      0084FF 00                    2023 	.db #0x00	; 0
      008500 20                    2024 	.db #0x20	; 32
      008501 3F                    2025 	.db #0x3f	; 63
      008502 24                    2026 	.db #0x24	; 36
      008503 02                    2027 	.db #0x02	; 2
      008504 2D                    2028 	.db #0x2d	; 45
      008505 30                    2029 	.db #0x30	; 48	'0'
      008506 20                    2030 	.db #0x20	; 32
      008507 00                    2031 	.db #0x00	; 0
      008508 00                    2032 	.db #0x00	; 0
      008509 08                    2033 	.db #0x08	; 8
      00850A 08                    2034 	.db #0x08	; 8
      00850B F8                    2035 	.db #0xf8	; 248
      00850C 00                    2036 	.db #0x00	; 0
      00850D 00                    2037 	.db #0x00	; 0
      00850E 00                    2038 	.db #0x00	; 0
      00850F 00                    2039 	.db #0x00	; 0
      008510 00                    2040 	.db #0x00	; 0
      008511 20                    2041 	.db #0x20	; 32
      008512 20                    2042 	.db #0x20	; 32
      008513 3F                    2043 	.db #0x3f	; 63
      008514 20                    2044 	.db #0x20	; 32
      008515 20                    2045 	.db #0x20	; 32
      008516 00                    2046 	.db #0x00	; 0
      008517 00                    2047 	.db #0x00	; 0
      008518 80                    2048 	.db #0x80	; 128
      008519 80                    2049 	.db #0x80	; 128
      00851A 80                    2050 	.db #0x80	; 128
      00851B 80                    2051 	.db #0x80	; 128
      00851C 80                    2052 	.db #0x80	; 128
      00851D 80                    2053 	.db #0x80	; 128
      00851E 80                    2054 	.db #0x80	; 128
      00851F 00                    2055 	.db #0x00	; 0
      008520 20                    2056 	.db #0x20	; 32
      008521 3F                    2057 	.db #0x3f	; 63
      008522 20                    2058 	.db #0x20	; 32
      008523 00                    2059 	.db #0x00	; 0
      008524 3F                    2060 	.db #0x3f	; 63
      008525 20                    2061 	.db #0x20	; 32
      008526 00                    2062 	.db #0x00	; 0
      008527 3F                    2063 	.db #0x3f	; 63
      008528 80                    2064 	.db #0x80	; 128
      008529 80                    2065 	.db #0x80	; 128
      00852A 00                    2066 	.db #0x00	; 0
      00852B 80                    2067 	.db #0x80	; 128
      00852C 80                    2068 	.db #0x80	; 128
      00852D 80                    2069 	.db #0x80	; 128
      00852E 00                    2070 	.db #0x00	; 0
      00852F 00                    2071 	.db #0x00	; 0
      008530 20                    2072 	.db #0x20	; 32
      008531 3F                    2073 	.db #0x3f	; 63
      008532 21                    2074 	.db #0x21	; 33
      008533 00                    2075 	.db #0x00	; 0
      008534 00                    2076 	.db #0x00	; 0
      008535 20                    2077 	.db #0x20	; 32
      008536 3F                    2078 	.db #0x3f	; 63
      008537 20                    2079 	.db #0x20	; 32
      008538 00                    2080 	.db #0x00	; 0
      008539 00                    2081 	.db #0x00	; 0
      00853A 80                    2082 	.db #0x80	; 128
      00853B 80                    2083 	.db #0x80	; 128
      00853C 80                    2084 	.db #0x80	; 128
      00853D 80                    2085 	.db #0x80	; 128
      00853E 00                    2086 	.db #0x00	; 0
      00853F 00                    2087 	.db #0x00	; 0
      008540 00                    2088 	.db #0x00	; 0
      008541 1F                    2089 	.db #0x1f	; 31
      008542 20                    2090 	.db #0x20	; 32
      008543 20                    2091 	.db #0x20	; 32
      008544 20                    2092 	.db #0x20	; 32
      008545 20                    2093 	.db #0x20	; 32
      008546 1F                    2094 	.db #0x1f	; 31
      008547 00                    2095 	.db #0x00	; 0
      008548 80                    2096 	.db #0x80	; 128
      008549 80                    2097 	.db #0x80	; 128
      00854A 00                    2098 	.db #0x00	; 0
      00854B 80                    2099 	.db #0x80	; 128
      00854C 80                    2100 	.db #0x80	; 128
      00854D 00                    2101 	.db #0x00	; 0
      00854E 00                    2102 	.db #0x00	; 0
      00854F 00                    2103 	.db #0x00	; 0
      008550 80                    2104 	.db #0x80	; 128
      008551 FF                    2105 	.db #0xff	; 255
      008552 A1                    2106 	.db #0xa1	; 161
      008553 20                    2107 	.db #0x20	; 32
      008554 20                    2108 	.db #0x20	; 32
      008555 11                    2109 	.db #0x11	; 17
      008556 0E                    2110 	.db #0x0e	; 14
      008557 00                    2111 	.db #0x00	; 0
      008558 00                    2112 	.db #0x00	; 0
      008559 00                    2113 	.db #0x00	; 0
      00855A 00                    2114 	.db #0x00	; 0
      00855B 80                    2115 	.db #0x80	; 128
      00855C 80                    2116 	.db #0x80	; 128
      00855D 80                    2117 	.db #0x80	; 128
      00855E 80                    2118 	.db #0x80	; 128
      00855F 00                    2119 	.db #0x00	; 0
      008560 00                    2120 	.db #0x00	; 0
      008561 0E                    2121 	.db #0x0e	; 14
      008562 11                    2122 	.db #0x11	; 17
      008563 20                    2123 	.db #0x20	; 32
      008564 20                    2124 	.db #0x20	; 32
      008565 A0                    2125 	.db #0xa0	; 160
      008566 FF                    2126 	.db #0xff	; 255
      008567 80                    2127 	.db #0x80	; 128
      008568 80                    2128 	.db #0x80	; 128
      008569 80                    2129 	.db #0x80	; 128
      00856A 80                    2130 	.db #0x80	; 128
      00856B 00                    2131 	.db #0x00	; 0
      00856C 80                    2132 	.db #0x80	; 128
      00856D 80                    2133 	.db #0x80	; 128
      00856E 80                    2134 	.db #0x80	; 128
      00856F 00                    2135 	.db #0x00	; 0
      008570 20                    2136 	.db #0x20	; 32
      008571 20                    2137 	.db #0x20	; 32
      008572 3F                    2138 	.db #0x3f	; 63
      008573 21                    2139 	.db #0x21	; 33
      008574 20                    2140 	.db #0x20	; 32
      008575 00                    2141 	.db #0x00	; 0
      008576 01                    2142 	.db #0x01	; 1
      008577 00                    2143 	.db #0x00	; 0
      008578 00                    2144 	.db #0x00	; 0
      008579 00                    2145 	.db #0x00	; 0
      00857A 80                    2146 	.db #0x80	; 128
      00857B 80                    2147 	.db #0x80	; 128
      00857C 80                    2148 	.db #0x80	; 128
      00857D 80                    2149 	.db #0x80	; 128
      00857E 80                    2150 	.db #0x80	; 128
      00857F 00                    2151 	.db #0x00	; 0
      008580 00                    2152 	.db #0x00	; 0
      008581 33                    2153 	.db #0x33	; 51	'3'
      008582 24                    2154 	.db #0x24	; 36
      008583 24                    2155 	.db #0x24	; 36
      008584 24                    2156 	.db #0x24	; 36
      008585 24                    2157 	.db #0x24	; 36
      008586 19                    2158 	.db #0x19	; 25
      008587 00                    2159 	.db #0x00	; 0
      008588 00                    2160 	.db #0x00	; 0
      008589 80                    2161 	.db #0x80	; 128
      00858A 80                    2162 	.db #0x80	; 128
      00858B E0                    2163 	.db #0xe0	; 224
      00858C 80                    2164 	.db #0x80	; 128
      00858D 80                    2165 	.db #0x80	; 128
      00858E 00                    2166 	.db #0x00	; 0
      00858F 00                    2167 	.db #0x00	; 0
      008590 00                    2168 	.db #0x00	; 0
      008591 00                    2169 	.db #0x00	; 0
      008592 00                    2170 	.db #0x00	; 0
      008593 1F                    2171 	.db #0x1f	; 31
      008594 20                    2172 	.db #0x20	; 32
      008595 20                    2173 	.db #0x20	; 32
      008596 00                    2174 	.db #0x00	; 0
      008597 00                    2175 	.db #0x00	; 0
      008598 80                    2176 	.db #0x80	; 128
      008599 80                    2177 	.db #0x80	; 128
      00859A 00                    2178 	.db #0x00	; 0
      00859B 00                    2179 	.db #0x00	; 0
      00859C 00                    2180 	.db #0x00	; 0
      00859D 80                    2181 	.db #0x80	; 128
      00859E 80                    2182 	.db #0x80	; 128
      00859F 00                    2183 	.db #0x00	; 0
      0085A0 00                    2184 	.db #0x00	; 0
      0085A1 1F                    2185 	.db #0x1f	; 31
      0085A2 20                    2186 	.db #0x20	; 32
      0085A3 20                    2187 	.db #0x20	; 32
      0085A4 20                    2188 	.db #0x20	; 32
      0085A5 10                    2189 	.db #0x10	; 16
      0085A6 3F                    2190 	.db #0x3f	; 63
      0085A7 20                    2191 	.db #0x20	; 32
      0085A8 80                    2192 	.db #0x80	; 128
      0085A9 80                    2193 	.db #0x80	; 128
      0085AA 80                    2194 	.db #0x80	; 128
      0085AB 00                    2195 	.db #0x00	; 0
      0085AC 00                    2196 	.db #0x00	; 0
      0085AD 80                    2197 	.db #0x80	; 128
      0085AE 80                    2198 	.db #0x80	; 128
      0085AF 80                    2199 	.db #0x80	; 128
      0085B0 00                    2200 	.db #0x00	; 0
      0085B1 01                    2201 	.db #0x01	; 1
      0085B2 0E                    2202 	.db #0x0e	; 14
      0085B3 30                    2203 	.db #0x30	; 48	'0'
      0085B4 08                    2204 	.db #0x08	; 8
      0085B5 06                    2205 	.db #0x06	; 6
      0085B6 01                    2206 	.db #0x01	; 1
      0085B7 00                    2207 	.db #0x00	; 0
      0085B8 80                    2208 	.db #0x80	; 128
      0085B9 80                    2209 	.db #0x80	; 128
      0085BA 00                    2210 	.db #0x00	; 0
      0085BB 80                    2211 	.db #0x80	; 128
      0085BC 00                    2212 	.db #0x00	; 0
      0085BD 80                    2213 	.db #0x80	; 128
      0085BE 80                    2214 	.db #0x80	; 128
      0085BF 80                    2215 	.db #0x80	; 128
      0085C0 0F                    2216 	.db #0x0f	; 15
      0085C1 30                    2217 	.db #0x30	; 48	'0'
      0085C2 0C                    2218 	.db #0x0c	; 12
      0085C3 03                    2219 	.db #0x03	; 3
      0085C4 0C                    2220 	.db #0x0c	; 12
      0085C5 30                    2221 	.db #0x30	; 48	'0'
      0085C6 0F                    2222 	.db #0x0f	; 15
      0085C7 00                    2223 	.db #0x00	; 0
      0085C8 00                    2224 	.db #0x00	; 0
      0085C9 80                    2225 	.db #0x80	; 128
      0085CA 80                    2226 	.db #0x80	; 128
      0085CB 00                    2227 	.db #0x00	; 0
      0085CC 80                    2228 	.db #0x80	; 128
      0085CD 80                    2229 	.db #0x80	; 128
      0085CE 80                    2230 	.db #0x80	; 128
      0085CF 00                    2231 	.db #0x00	; 0
      0085D0 00                    2232 	.db #0x00	; 0
      0085D1 20                    2233 	.db #0x20	; 32
      0085D2 31                    2234 	.db #0x31	; 49	'1'
      0085D3 2E                    2235 	.db #0x2e	; 46
      0085D4 0E                    2236 	.db #0x0e	; 14
      0085D5 31                    2237 	.db #0x31	; 49	'1'
      0085D6 20                    2238 	.db #0x20	; 32
      0085D7 00                    2239 	.db #0x00	; 0
      0085D8 80                    2240 	.db #0x80	; 128
      0085D9 80                    2241 	.db #0x80	; 128
      0085DA 80                    2242 	.db #0x80	; 128
      0085DB 00                    2243 	.db #0x00	; 0
      0085DC 00                    2244 	.db #0x00	; 0
      0085DD 80                    2245 	.db #0x80	; 128
      0085DE 80                    2246 	.db #0x80	; 128
      0085DF 80                    2247 	.db #0x80	; 128
      0085E0 80                    2248 	.db #0x80	; 128
      0085E1 81                    2249 	.db #0x81	; 129
      0085E2 8E                    2250 	.db #0x8e	; 142
      0085E3 70                    2251 	.db #0x70	; 112	'p'
      0085E4 18                    2252 	.db #0x18	; 24
      0085E5 06                    2253 	.db #0x06	; 6
      0085E6 01                    2254 	.db #0x01	; 1
      0085E7 00                    2255 	.db #0x00	; 0
      0085E8 00                    2256 	.db #0x00	; 0
      0085E9 80                    2257 	.db #0x80	; 128
      0085EA 80                    2258 	.db #0x80	; 128
      0085EB 80                    2259 	.db #0x80	; 128
      0085EC 80                    2260 	.db #0x80	; 128
      0085ED 80                    2261 	.db #0x80	; 128
      0085EE 80                    2262 	.db #0x80	; 128
      0085EF 00                    2263 	.db #0x00	; 0
      0085F0 00                    2264 	.db #0x00	; 0
      0085F1 21                    2265 	.db #0x21	; 33
      0085F2 30                    2266 	.db #0x30	; 48	'0'
      0085F3 2C                    2267 	.db #0x2c	; 44
      0085F4 22                    2268 	.db #0x22	; 34
      0085F5 21                    2269 	.db #0x21	; 33
      0085F6 30                    2270 	.db #0x30	; 48	'0'
      0085F7 00                    2271 	.db #0x00	; 0
      0085F8 00                    2272 	.db #0x00	; 0
      0085F9 00                    2273 	.db #0x00	; 0
      0085FA 00                    2274 	.db #0x00	; 0
      0085FB 00                    2275 	.db #0x00	; 0
      0085FC 80                    2276 	.db #0x80	; 128
      0085FD 7C                    2277 	.db #0x7c	; 124
      0085FE 02                    2278 	.db #0x02	; 2
      0085FF 02                    2279 	.db #0x02	; 2
      008600 00                    2280 	.db #0x00	; 0
      008601 00                    2281 	.db #0x00	; 0
      008602 00                    2282 	.db #0x00	; 0
      008603 00                    2283 	.db #0x00	; 0
      008604 00                    2284 	.db #0x00	; 0
      008605 3F                    2285 	.db #0x3f	; 63
      008606 40                    2286 	.db #0x40	; 64
      008607 40                    2287 	.db #0x40	; 64
      008608 00                    2288 	.db #0x00	; 0
      008609 00                    2289 	.db #0x00	; 0
      00860A 00                    2290 	.db #0x00	; 0
      00860B 00                    2291 	.db #0x00	; 0
      00860C FF                    2292 	.db #0xff	; 255
      00860D 00                    2293 	.db #0x00	; 0
      00860E 00                    2294 	.db #0x00	; 0
      00860F 00                    2295 	.db #0x00	; 0
      008610 00                    2296 	.db #0x00	; 0
      008611 00                    2297 	.db #0x00	; 0
      008612 00                    2298 	.db #0x00	; 0
      008613 00                    2299 	.db #0x00	; 0
      008614 FF                    2300 	.db #0xff	; 255
      008615 00                    2301 	.db #0x00	; 0
      008616 00                    2302 	.db #0x00	; 0
      008617 00                    2303 	.db #0x00	; 0
      008618 00                    2304 	.db #0x00	; 0
      008619 02                    2305 	.db #0x02	; 2
      00861A 02                    2306 	.db #0x02	; 2
      00861B 7C                    2307 	.db #0x7c	; 124
      00861C 80                    2308 	.db #0x80	; 128
      00861D 00                    2309 	.db #0x00	; 0
      00861E 00                    2310 	.db #0x00	; 0
      00861F 00                    2311 	.db #0x00	; 0
      008620 00                    2312 	.db #0x00	; 0
      008621 40                    2313 	.db #0x40	; 64
      008622 40                    2314 	.db #0x40	; 64
      008623 3F                    2315 	.db #0x3f	; 63
      008624 00                    2316 	.db #0x00	; 0
      008625 00                    2317 	.db #0x00	; 0
      008626 00                    2318 	.db #0x00	; 0
      008627 00                    2319 	.db #0x00	; 0
      008628 00                    2320 	.db #0x00	; 0
      008629 06                    2321 	.db #0x06	; 6
      00862A 01                    2322 	.db #0x01	; 1
      00862B 01                    2323 	.db #0x01	; 1
      00862C 02                    2324 	.db #0x02	; 2
      00862D 02                    2325 	.db #0x02	; 2
      00862E 04                    2326 	.db #0x04	; 4
      00862F 04                    2327 	.db #0x04	; 4
      008630 00                    2328 	.db #0x00	; 0
      008631 00                    2329 	.db #0x00	; 0
      008632 00                    2330 	.db #0x00	; 0
      008633 00                    2331 	.db #0x00	; 0
      008634 00                    2332 	.db #0x00	; 0
      008635 00                    2333 	.db #0x00	; 0
      008636 00                    2334 	.db #0x00	; 0
      008637 00                    2335 	.db #0x00	; 0
                                   2336 	.area INITIALIZER
                                   2337 	.area CABS (ABS)
