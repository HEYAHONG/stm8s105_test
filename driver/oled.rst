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
      00879A                         67 _delay_ms:
      00879A 52 02            [ 2]   68 	sub	sp, #2
                                     69 ;	driver/oled.c: 48: while(ms)
      00879C 16 05            [ 2]   70 	ldw	y, (0x05, sp)
      00879E 17 01            [ 2]   71 	ldw	(0x01, sp), y
      0087A0                         72 00104$:
      0087A0 1E 01            [ 2]   73 	ldw	x, (0x01, sp)
      0087A2 27 11            [ 1]   74 	jreq	00106$
                                     75 ;	driver/oled.c: 51: while(a--);
      0087A4 AE 07 08         [ 2]   76 	ldw	x, #0x0708
      0087A7                         77 00101$:
      0087A7 90 93            [ 1]   78 	ldw	y, x
      0087A9 5A               [ 2]   79 	decw	x
      0087AA 90 5D            [ 2]   80 	tnzw	y
      0087AC 26 F9            [ 1]   81 	jrne	00101$
                                     82 ;	driver/oled.c: 52: ms--;
      0087AE 1E 01            [ 2]   83 	ldw	x, (0x01, sp)
      0087B0 5A               [ 2]   84 	decw	x
      0087B1 1F 01            [ 2]   85 	ldw	(0x01, sp), x
      0087B3 20 EB            [ 2]   86 	jra	00104$
      0087B5                         87 00106$:
                                     88 ;	driver/oled.c: 54: return;
                                     89 ;	driver/oled.c: 55: }
      0087B5 5B 02            [ 2]   90 	addw	sp, #2
      0087B7 81               [ 4]   91 	ret
                                     92 ;	driver/oled.c: 77: void OLED_WR_Byte(u8 dat,u8 cmd)
                                     93 ;	-----------------------------------------
                                     94 ;	 function OLED_WR_Byte
                                     95 ;	-----------------------------------------
      0087B8                         96 _OLED_WR_Byte:
      0087B8 88               [ 1]   97 	push	a
                                     98 ;	driver/oled.c: 80: if(cmd)
      0087B9 0D 05            [ 1]   99 	tnz	(0x05, sp)
      0087BB 27 0D            [ 1]  100 	jreq	00102$
                                    101 ;	driver/oled.c: 81: OLED_DC_Set();
      0087BD 4B 10            [ 1]  102 	push	#0x10
      0087BF 4B 0A            [ 1]  103 	push	#0x0a
      0087C1 4B 50            [ 1]  104 	push	#0x50
      0087C3 CD 8C C7         [ 4]  105 	call	_GPIO_WriteHigh
      0087C6 5B 03            [ 2]  106 	addw	sp, #3
      0087C8 20 0B            [ 2]  107 	jra	00103$
      0087CA                        108 00102$:
                                    109 ;	driver/oled.c: 83: OLED_DC_Clr();
      0087CA 4B 10            [ 1]  110 	push	#0x10
      0087CC 4B 0A            [ 1]  111 	push	#0x0a
      0087CE 4B 50            [ 1]  112 	push	#0x50
      0087D0 CD 8C CE         [ 4]  113 	call	_GPIO_WriteLow
      0087D3 5B 03            [ 2]  114 	addw	sp, #3
      0087D5                        115 00103$:
                                    116 ;	driver/oled.c: 84: OLED_CS_Clr();
      0087D5 4B 20            [ 1]  117 	push	#0x20
      0087D7 4B 0A            [ 1]  118 	push	#0x0a
      0087D9 4B 50            [ 1]  119 	push	#0x50
      0087DB CD 8C CE         [ 4]  120 	call	_GPIO_WriteLow
      0087DE 5B 03            [ 2]  121 	addw	sp, #3
                                    122 ;	driver/oled.c: 85: for(i=0;i<8;i++)
      0087E0 0F 01            [ 1]  123 	clr	(0x01, sp)
      0087E2                        124 00108$:
                                    125 ;	driver/oled.c: 87: OLED_SCLK_Clr();
      0087E2 4B 02            [ 1]  126 	push	#0x02
      0087E4 4B 0A            [ 1]  127 	push	#0x0a
      0087E6 4B 50            [ 1]  128 	push	#0x50
      0087E8 CD 8C CE         [ 4]  129 	call	_GPIO_WriteLow
      0087EB 5B 03            [ 2]  130 	addw	sp, #3
                                    131 ;	driver/oled.c: 88: if(dat&0x80)
      0087ED 7B 04            [ 1]  132 	ld	a, (0x04, sp)
      0087EF 2A 0D            [ 1]  133 	jrpl	00105$
                                    134 ;	driver/oled.c: 90: OLED_SDIN_Set();
      0087F1 4B 04            [ 1]  135 	push	#0x04
      0087F3 4B 0A            [ 1]  136 	push	#0x0a
      0087F5 4B 50            [ 1]  137 	push	#0x50
      0087F7 CD 8C C7         [ 4]  138 	call	_GPIO_WriteHigh
      0087FA 5B 03            [ 2]  139 	addw	sp, #3
      0087FC 20 0B            [ 2]  140 	jra	00106$
      0087FE                        141 00105$:
                                    142 ;	driver/oled.c: 93: OLED_SDIN_Clr();
      0087FE 4B 04            [ 1]  143 	push	#0x04
      008800 4B 0A            [ 1]  144 	push	#0x0a
      008802 4B 50            [ 1]  145 	push	#0x50
      008804 CD 8C CE         [ 4]  146 	call	_GPIO_WriteLow
      008807 5B 03            [ 2]  147 	addw	sp, #3
      008809                        148 00106$:
                                    149 ;	driver/oled.c: 94: OLED_SCLK_Set();
      008809 4B 02            [ 1]  150 	push	#0x02
      00880B 4B 0A            [ 1]  151 	push	#0x0a
      00880D 4B 50            [ 1]  152 	push	#0x50
      00880F CD 8C C7         [ 4]  153 	call	_GPIO_WriteHigh
      008812 5B 03            [ 2]  154 	addw	sp, #3
                                    155 ;	driver/oled.c: 95: dat<<=1;
      008814 08 04            [ 1]  156 	sll	(0x04, sp)
                                    157 ;	driver/oled.c: 85: for(i=0;i<8;i++)
      008816 0C 01            [ 1]  158 	inc	(0x01, sp)
      008818 7B 01            [ 1]  159 	ld	a, (0x01, sp)
      00881A A1 08            [ 1]  160 	cp	a, #0x08
      00881C 25 C4            [ 1]  161 	jrc	00108$
                                    162 ;	driver/oled.c: 97: OLED_CS_Set();
      00881E 4B 20            [ 1]  163 	push	#0x20
      008820 4B 0A            [ 1]  164 	push	#0x0a
      008822 4B 50            [ 1]  165 	push	#0x50
      008824 CD 8C C7         [ 4]  166 	call	_GPIO_WriteHigh
      008827 5B 03            [ 2]  167 	addw	sp, #3
                                    168 ;	driver/oled.c: 98: OLED_DC_Set();
      008829 4B 10            [ 1]  169 	push	#0x10
      00882B 4B 0A            [ 1]  170 	push	#0x0a
      00882D 4B 50            [ 1]  171 	push	#0x50
      00882F CD 8C C7         [ 4]  172 	call	_GPIO_WriteHigh
                                    173 ;	driver/oled.c: 99: }
      008832 5B 04            [ 2]  174 	addw	sp, #4
      008834 81               [ 4]  175 	ret
                                    176 ;	driver/oled.c: 101: void OLED_Set_Pos(unsigned char x, unsigned char y)
                                    177 ;	-----------------------------------------
                                    178 ;	 function OLED_Set_Pos
                                    179 ;	-----------------------------------------
      008835                        180 _OLED_Set_Pos:
      008835 52 02            [ 2]  181 	sub	sp, #2
                                    182 ;	driver/oled.c: 103: OLED_WR_Byte(0xb0+y,OLED_CMD);
      008837 7B 06            [ 1]  183 	ld	a, (0x06, sp)
      008839 AB B0            [ 1]  184 	add	a, #0xb0
      00883B 4B 00            [ 1]  185 	push	#0x00
      00883D 88               [ 1]  186 	push	a
      00883E CD 87 B8         [ 4]  187 	call	_OLED_WR_Byte
      008841 5B 02            [ 2]  188 	addw	sp, #2
                                    189 ;	driver/oled.c: 104: OLED_WR_Byte(((x&0xf0)>>4)|0x10,OLED_CMD);
      008843 7B 05            [ 1]  190 	ld	a, (0x05, sp)
      008845 0F 01            [ 1]  191 	clr	(0x01, sp)
      008847 88               [ 1]  192 	push	a
      008848 A4 F0            [ 1]  193 	and	a, #0xf0
      00884A 97               [ 1]  194 	ld	xl, a
      00884B 4F               [ 1]  195 	clr	a
      00884C 95               [ 1]  196 	ld	xh, a
      00884D 84               [ 1]  197 	pop	a
      00884E 57               [ 2]  198 	sraw	x
      00884F 57               [ 2]  199 	sraw	x
      008850 57               [ 2]  200 	sraw	x
      008851 57               [ 2]  201 	sraw	x
      008852 88               [ 1]  202 	push	a
      008853 9F               [ 1]  203 	ld	a, xl
      008854 AA 10            [ 1]  204 	or	a, #0x10
      008856 97               [ 1]  205 	ld	xl, a
      008857 4B 00            [ 1]  206 	push	#0x00
      008859 89               [ 2]  207 	pushw	x
      00885A 5B 01            [ 2]  208 	addw	sp, #1
      00885C CD 87 B8         [ 4]  209 	call	_OLED_WR_Byte
      00885F 5B 02            [ 2]  210 	addw	sp, #2
      008861 84               [ 1]  211 	pop	a
                                    212 ;	driver/oled.c: 105: OLED_WR_Byte((x&0x0f)|0x01,OLED_CMD);
      008862 A4 0F            [ 1]  213 	and	a, #0x0f
      008864 95               [ 1]  214 	ld	xh, a
      008865 4F               [ 1]  215 	clr	a
      008866 02               [ 1]  216 	rlwa	x
      008867 AA 01            [ 1]  217 	or	a, #0x01
      008869 4B 00            [ 1]  218 	push	#0x00
      00886B 88               [ 1]  219 	push	a
      00886C CD 87 B8         [ 4]  220 	call	_OLED_WR_Byte
                                    221 ;	driver/oled.c: 106: }
      00886F 5B 04            [ 2]  222 	addw	sp, #4
      008871 81               [ 4]  223 	ret
                                    224 ;	driver/oled.c: 108: void OLED_Display_On(void)
                                    225 ;	-----------------------------------------
                                    226 ;	 function OLED_Display_On
                                    227 ;	-----------------------------------------
      008872                        228 _OLED_Display_On:
                                    229 ;	driver/oled.c: 110: OLED_WR_Byte(0X8D,OLED_CMD);  //SET DCDC命令
      008872 4B 00            [ 1]  230 	push	#0x00
      008874 4B 8D            [ 1]  231 	push	#0x8d
      008876 CD 87 B8         [ 4]  232 	call	_OLED_WR_Byte
      008879 5B 02            [ 2]  233 	addw	sp, #2
                                    234 ;	driver/oled.c: 111: OLED_WR_Byte(0X14,OLED_CMD);  //DCDC ON
      00887B 4B 00            [ 1]  235 	push	#0x00
      00887D 4B 14            [ 1]  236 	push	#0x14
      00887F CD 87 B8         [ 4]  237 	call	_OLED_WR_Byte
      008882 5B 02            [ 2]  238 	addw	sp, #2
                                    239 ;	driver/oled.c: 112: OLED_WR_Byte(0XAF,OLED_CMD);  //DISPLAY ON
      008884 4B 00            [ 1]  240 	push	#0x00
      008886 4B AF            [ 1]  241 	push	#0xaf
      008888 CD 87 B8         [ 4]  242 	call	_OLED_WR_Byte
      00888B 5B 02            [ 2]  243 	addw	sp, #2
                                    244 ;	driver/oled.c: 113: }
      00888D 81               [ 4]  245 	ret
                                    246 ;	driver/oled.c: 115: void OLED_Display_Off(void)
                                    247 ;	-----------------------------------------
                                    248 ;	 function OLED_Display_Off
                                    249 ;	-----------------------------------------
      00888E                        250 _OLED_Display_Off:
                                    251 ;	driver/oled.c: 117: OLED_WR_Byte(0X8D,OLED_CMD);  //SET DCDC命令
      00888E 4B 00            [ 1]  252 	push	#0x00
      008890 4B 8D            [ 1]  253 	push	#0x8d
      008892 CD 87 B8         [ 4]  254 	call	_OLED_WR_Byte
      008895 5B 02            [ 2]  255 	addw	sp, #2
                                    256 ;	driver/oled.c: 118: OLED_WR_Byte(0X10,OLED_CMD);  //DCDC OFF
      008897 4B 00            [ 1]  257 	push	#0x00
      008899 4B 10            [ 1]  258 	push	#0x10
      00889B CD 87 B8         [ 4]  259 	call	_OLED_WR_Byte
      00889E 5B 02            [ 2]  260 	addw	sp, #2
                                    261 ;	driver/oled.c: 119: OLED_WR_Byte(0XAE,OLED_CMD);  //DISPLAY OFF
      0088A0 4B 00            [ 1]  262 	push	#0x00
      0088A2 4B AE            [ 1]  263 	push	#0xae
      0088A4 CD 87 B8         [ 4]  264 	call	_OLED_WR_Byte
      0088A7 5B 02            [ 2]  265 	addw	sp, #2
                                    266 ;	driver/oled.c: 120: }
      0088A9 81               [ 4]  267 	ret
                                    268 ;	driver/oled.c: 122: void OLED_Clear(void)
                                    269 ;	-----------------------------------------
                                    270 ;	 function OLED_Clear
                                    271 ;	-----------------------------------------
      0088AA                        272 _OLED_Clear:
      0088AA 88               [ 1]  273 	push	a
                                    274 ;	driver/oled.c: 125: for(i=0;i<8;i++)
      0088AB 0F 01            [ 1]  275 	clr	(0x01, sp)
      0088AD                        276 00105$:
                                    277 ;	driver/oled.c: 127: OLED_WR_Byte (0xb0+i,OLED_CMD);    //设置页地址（0~7）
      0088AD 7B 01            [ 1]  278 	ld	a, (0x01, sp)
      0088AF AB B0            [ 1]  279 	add	a, #0xb0
      0088B1 4B 00            [ 1]  280 	push	#0x00
      0088B3 88               [ 1]  281 	push	a
      0088B4 CD 87 B8         [ 4]  282 	call	_OLED_WR_Byte
      0088B7 5B 02            [ 2]  283 	addw	sp, #2
                                    284 ;	driver/oled.c: 128: OLED_WR_Byte (0x00,OLED_CMD);      //设置显示位置—列低地址
      0088B9 4B 00            [ 1]  285 	push	#0x00
      0088BB 4B 00            [ 1]  286 	push	#0x00
      0088BD CD 87 B8         [ 4]  287 	call	_OLED_WR_Byte
      0088C0 5B 02            [ 2]  288 	addw	sp, #2
                                    289 ;	driver/oled.c: 129: OLED_WR_Byte (0x10,OLED_CMD);      //设置显示位置—列高地址
      0088C2 4B 00            [ 1]  290 	push	#0x00
      0088C4 4B 10            [ 1]  291 	push	#0x10
      0088C6 CD 87 B8         [ 4]  292 	call	_OLED_WR_Byte
      0088C9 5B 02            [ 2]  293 	addw	sp, #2
                                    294 ;	driver/oled.c: 130: for(n=0;n<128;n++)OLED_WR_Byte(0,OLED_DATA);
      0088CB 4F               [ 1]  295 	clr	a
      0088CC                        296 00103$:
      0088CC 88               [ 1]  297 	push	a
      0088CD 4B 01            [ 1]  298 	push	#0x01
      0088CF 4B 00            [ 1]  299 	push	#0x00
      0088D1 CD 87 B8         [ 4]  300 	call	_OLED_WR_Byte
      0088D4 5B 02            [ 2]  301 	addw	sp, #2
      0088D6 84               [ 1]  302 	pop	a
      0088D7 4C               [ 1]  303 	inc	a
      0088D8 A1 80            [ 1]  304 	cp	a, #0x80
      0088DA 25 F0            [ 1]  305 	jrc	00103$
                                    306 ;	driver/oled.c: 125: for(i=0;i<8;i++)
      0088DC 0C 01            [ 1]  307 	inc	(0x01, sp)
      0088DE 7B 01            [ 1]  308 	ld	a, (0x01, sp)
      0088E0 A1 08            [ 1]  309 	cp	a, #0x08
      0088E2 25 C9            [ 1]  310 	jrc	00105$
                                    311 ;	driver/oled.c: 132: }
      0088E4 84               [ 1]  312 	pop	a
      0088E5 81               [ 4]  313 	ret
                                    314 ;	driver/oled.c: 140: void OLED_ShowChar(u8 x,u8 y,u8 chr)
                                    315 ;	-----------------------------------------
                                    316 ;	 function OLED_ShowChar
                                    317 ;	-----------------------------------------
      0088E6                        318 _OLED_ShowChar:
      0088E6 52 04            [ 2]  319 	sub	sp, #4
                                    320 ;	driver/oled.c: 143: c=chr-' ';//得到偏移后的值
      0088E8 7B 09            [ 1]  321 	ld	a, (0x09, sp)
      0088EA A0 20            [ 1]  322 	sub	a, #0x20
      0088EC 6B 04            [ 1]  323 	ld	(0x04, sp), a
                                    324 ;	driver/oled.c: 144: if(x>Max_Column-1){x=0;y=y+2;}
      0088EE 7B 07            [ 1]  325 	ld	a, (0x07, sp)
      0088F0 A1 7F            [ 1]  326 	cp	a, #0x7f
      0088F2 23 08            [ 2]  327 	jrule	00102$
      0088F4 0F 07            [ 1]  328 	clr	(0x07, sp)
      0088F6 7B 08            [ 1]  329 	ld	a, (0x08, sp)
      0088F8 AB 02            [ 1]  330 	add	a, #0x02
      0088FA 6B 08            [ 1]  331 	ld	(0x08, sp), a
      0088FC                        332 00102$:
                                    333 ;	driver/oled.c: 147: OLED_Set_Pos(x,y);
      0088FC 7B 08            [ 1]  334 	ld	a, (0x08, sp)
      0088FE 88               [ 1]  335 	push	a
      0088FF 7B 08            [ 1]  336 	ld	a, (0x08, sp)
      008901 88               [ 1]  337 	push	a
      008902 CD 88 35         [ 4]  338 	call	_OLED_Set_Pos
      008905 5B 02            [ 2]  339 	addw	sp, #2
                                    340 ;	driver/oled.c: 148: for(i=0;i<8;i++)
      008907 0F 03            [ 1]  341 	clr	(0x03, sp)
      008909                        342 00105$:
                                    343 ;	driver/oled.c: 149: OLED_WR_Byte(F8X16[c*16+i],OLED_DATA);
      008909 5F               [ 1]  344 	clrw	x
      00890A 7B 04            [ 1]  345 	ld	a, (0x04, sp)
      00890C 97               [ 1]  346 	ld	xl, a
      00890D 58               [ 2]  347 	sllw	x
      00890E 58               [ 2]  348 	sllw	x
      00890F 58               [ 2]  349 	sllw	x
      008910 58               [ 2]  350 	sllw	x
      008911 1F 01            [ 2]  351 	ldw	(0x01, sp), x
      008913 5F               [ 1]  352 	clrw	x
      008914 7B 03            [ 1]  353 	ld	a, (0x03, sp)
      008916 97               [ 1]  354 	ld	xl, a
      008917 72 FB 01         [ 2]  355 	addw	x, (0x01, sp)
      00891A 1C 80 52         [ 2]  356 	addw	x, #_F8X16
      00891D F6               [ 1]  357 	ld	a, (x)
      00891E 4B 01            [ 1]  358 	push	#0x01
      008920 88               [ 1]  359 	push	a
      008921 CD 87 B8         [ 4]  360 	call	_OLED_WR_Byte
      008924 5B 02            [ 2]  361 	addw	sp, #2
                                    362 ;	driver/oled.c: 148: for(i=0;i<8;i++)
      008926 0C 03            [ 1]  363 	inc	(0x03, sp)
      008928 7B 03            [ 1]  364 	ld	a, (0x03, sp)
      00892A A1 08            [ 1]  365 	cp	a, #0x08
      00892C 25 DB            [ 1]  366 	jrc	00105$
                                    367 ;	driver/oled.c: 150: OLED_Set_Pos(x,y+1);
      00892E 7B 08            [ 1]  368 	ld	a, (0x08, sp)
      008930 4C               [ 1]  369 	inc	a
      008931 88               [ 1]  370 	push	a
      008932 7B 08            [ 1]  371 	ld	a, (0x08, sp)
      008934 88               [ 1]  372 	push	a
      008935 CD 88 35         [ 4]  373 	call	_OLED_Set_Pos
      008938 5B 02            [ 2]  374 	addw	sp, #2
                                    375 ;	driver/oled.c: 151: for(i=0;i<8;i++)
      00893A 0F 03            [ 1]  376 	clr	(0x03, sp)
      00893C                        377 00107$:
                                    378 ;	driver/oled.c: 152: OLED_WR_Byte(F8X16[c*16+i+8],OLED_DATA);
      00893C 5F               [ 1]  379 	clrw	x
      00893D 7B 03            [ 1]  380 	ld	a, (0x03, sp)
      00893F 97               [ 1]  381 	ld	xl, a
      008940 72 FB 01         [ 2]  382 	addw	x, (0x01, sp)
      008943 1C 00 08         [ 2]  383 	addw	x, #0x0008
      008946 1C 80 52         [ 2]  384 	addw	x, #_F8X16
      008949 F6               [ 1]  385 	ld	a, (x)
      00894A 4B 01            [ 1]  386 	push	#0x01
      00894C 88               [ 1]  387 	push	a
      00894D CD 87 B8         [ 4]  388 	call	_OLED_WR_Byte
      008950 5B 02            [ 2]  389 	addw	sp, #2
                                    390 ;	driver/oled.c: 151: for(i=0;i<8;i++)
      008952 0C 03            [ 1]  391 	inc	(0x03, sp)
      008954 7B 03            [ 1]  392 	ld	a, (0x03, sp)
      008956 A1 08            [ 1]  393 	cp	a, #0x08
      008958 25 E2            [ 1]  394 	jrc	00107$
                                    395 ;	driver/oled.c: 163: }
      00895A 5B 04            [ 2]  396 	addw	sp, #4
      00895C 81               [ 4]  397 	ret
                                    398 ;	driver/oled.c: 165: u32 oled_pow(u8 m,u8 n)
                                    399 ;	-----------------------------------------
                                    400 ;	 function oled_pow
                                    401 ;	-----------------------------------------
      00895D                        402 _oled_pow:
      00895D 52 09            [ 2]  403 	sub	sp, #9
                                    404 ;	driver/oled.c: 167: u32 result=1;
      00895F 5F               [ 1]  405 	clrw	x
      008960 5C               [ 1]  406 	incw	x
      008961 0F 07            [ 1]  407 	clr	(0x07, sp)
      008963 0F 06            [ 1]  408 	clr	(0x06, sp)
                                    409 ;	driver/oled.c: 168: while(n--)result*=m;
      008965 7B 0D            [ 1]  410 	ld	a, (0x0d, sp)
      008967 6B 01            [ 1]  411 	ld	(0x01, sp), a
      008969                        412 00101$:
      008969 7B 01            [ 1]  413 	ld	a, (0x01, sp)
      00896B 0A 01            [ 1]  414 	dec	(0x01, sp)
      00896D 4D               [ 1]  415 	tnz	a
      00896E 27 1D            [ 1]  416 	jreq	00103$
      008970 7B 0C            [ 1]  417 	ld	a, (0x0c, sp)
      008972 6B 05            [ 1]  418 	ld	(0x05, sp), a
      008974 90 5F            [ 1]  419 	clrw	y
      008976 0F 02            [ 1]  420 	clr	(0x02, sp)
      008978 7B 05            [ 1]  421 	ld	a, (0x05, sp)
      00897A 88               [ 1]  422 	push	a
      00897B 90 89            [ 2]  423 	pushw	y
      00897D 7B 05            [ 1]  424 	ld	a, (0x05, sp)
      00897F 88               [ 1]  425 	push	a
      008980 89               [ 2]  426 	pushw	x
      008981 1E 0C            [ 2]  427 	ldw	x, (0x0c, sp)
      008983 89               [ 2]  428 	pushw	x
      008984 CD 9A DB         [ 4]  429 	call	__mullong
      008987 5B 08            [ 2]  430 	addw	sp, #8
      008989 17 06            [ 2]  431 	ldw	(0x06, sp), y
      00898B 20 DC            [ 2]  432 	jra	00101$
      00898D                        433 00103$:
                                    434 ;	driver/oled.c: 169: return result;
      00898D 16 06            [ 2]  435 	ldw	y, (0x06, sp)
                                    436 ;	driver/oled.c: 170: }
      00898F 5B 09            [ 2]  437 	addw	sp, #9
      008991 81               [ 4]  438 	ret
                                    439 ;	driver/oled.c: 177: void OLED_ShowNum(u8 x,u8 y,u32 num,u8 len,u8 size2)
                                    440 ;	-----------------------------------------
                                    441 ;	 function OLED_ShowNum
                                    442 ;	-----------------------------------------
      008992                        443 _OLED_ShowNum:
      008992 52 07            [ 2]  444 	sub	sp, #7
                                    445 ;	driver/oled.c: 180: u8 enshow=0;
      008994 0F 05            [ 1]  446 	clr	(0x05, sp)
                                    447 ;	driver/oled.c: 181: for(t=0;t<len;t++)
      008996 0F 07            [ 1]  448 	clr	(0x07, sp)
      008998                        449 00110$:
      008998 7B 07            [ 1]  450 	ld	a, (0x07, sp)
      00899A 11 10            [ 1]  451 	cp	a, (0x10, sp)
      00899C 25 03            [ 1]  452 	jrc	00139$
      00899E CC 8A 2C         [ 2]  453 	jp	00111$
      0089A1                        454 00139$:
                                    455 ;	driver/oled.c: 183: temp=(num/oled_pow(10,len-t-1))%10;
      0089A1 7B 10            [ 1]  456 	ld	a, (0x10, sp)
      0089A3 10 07            [ 1]  457 	sub	a, (0x07, sp)
      0089A5 4A               [ 1]  458 	dec	a
      0089A6 88               [ 1]  459 	push	a
      0089A7 4B 0A            [ 1]  460 	push	#0x0a
      0089A9 CD 89 5D         [ 4]  461 	call	_oled_pow
      0089AC 5B 02            [ 2]  462 	addw	sp, #2
      0089AE 89               [ 2]  463 	pushw	x
      0089AF 90 89            [ 2]  464 	pushw	y
      0089B1 1E 12            [ 2]  465 	ldw	x, (0x12, sp)
      0089B3 89               [ 2]  466 	pushw	x
      0089B4 1E 12            [ 2]  467 	ldw	x, (0x12, sp)
      0089B6 89               [ 2]  468 	pushw	x
      0089B7 CD 9A 2A         [ 4]  469 	call	__divulong
      0089BA 5B 08            [ 2]  470 	addw	sp, #8
      0089BC 4B 0A            [ 1]  471 	push	#0x0a
      0089BE 4B 00            [ 1]  472 	push	#0x00
      0089C0 4B 00            [ 1]  473 	push	#0x00
      0089C2 4B 00            [ 1]  474 	push	#0x00
      0089C4 89               [ 2]  475 	pushw	x
      0089C5 90 89            [ 2]  476 	pushw	y
      0089C7 CD 99 6C         [ 4]  477 	call	__modulong
      0089CA 5B 08            [ 2]  478 	addw	sp, #8
      0089CC 9F               [ 1]  479 	ld	a, xl
      0089CD 6B 06            [ 1]  480 	ld	(0x06, sp), a
                                    481 ;	driver/oled.c: 188: OLED_ShowChar(x+(size2/2)*t,y,' ');
      0089CF 5F               [ 1]  482 	clrw	x
      0089D0 7B 11            [ 1]  483 	ld	a, (0x11, sp)
      0089D2 97               [ 1]  484 	ld	xl, a
      0089D3 7B 07            [ 1]  485 	ld	a, (0x07, sp)
      0089D5 6B 01            [ 1]  486 	ld	(0x01, sp), a
      0089D7 7B 0A            [ 1]  487 	ld	a, (0x0a, sp)
      0089D9 6B 02            [ 1]  488 	ld	(0x02, sp), a
      0089DB 4B 02            [ 1]  489 	push	#0x02
      0089DD 4B 00            [ 1]  490 	push	#0x00
      0089DF 89               [ 2]  491 	pushw	x
      0089E0 CD 9B 57         [ 4]  492 	call	__divsint
      0089E3 5B 04            [ 2]  493 	addw	sp, #4
      0089E5 7B 01            [ 1]  494 	ld	a, (0x01, sp)
      0089E7 42               [ 4]  495 	mul	x, a
      0089E8 9F               [ 1]  496 	ld	a, xl
      0089E9 1B 02            [ 1]  497 	add	a, (0x02, sp)
      0089EB 90 97            [ 1]  498 	ld	yl, a
                                    499 ;	driver/oled.c: 184: if(enshow==0&&t<(len-1))
      0089ED 0D 05            [ 1]  500 	tnz	(0x05, sp)
      0089EF 26 26            [ 1]  501 	jrne	00105$
      0089F1 5F               [ 1]  502 	clrw	x
      0089F2 7B 10            [ 1]  503 	ld	a, (0x10, sp)
      0089F4 97               [ 1]  504 	ld	xl, a
      0089F5 5A               [ 2]  505 	decw	x
      0089F6 1F 03            [ 2]  506 	ldw	(0x03, sp), x
      0089F8 5F               [ 1]  507 	clrw	x
      0089F9 7B 07            [ 1]  508 	ld	a, (0x07, sp)
      0089FB 97               [ 1]  509 	ld	xl, a
      0089FC 13 03            [ 2]  510 	cpw	x, (0x03, sp)
      0089FE 2E 17            [ 1]  511 	jrsge	00105$
                                    512 ;	driver/oled.c: 186: if(temp==0)
      008A00 0D 06            [ 1]  513 	tnz	(0x06, sp)
      008A02 26 0F            [ 1]  514 	jrne	00102$
                                    515 ;	driver/oled.c: 188: OLED_ShowChar(x+(size2/2)*t,y,' ');
      008A04 4B 20            [ 1]  516 	push	#0x20
      008A06 7B 0C            [ 1]  517 	ld	a, (0x0c, sp)
      008A08 88               [ 1]  518 	push	a
      008A09 90 9F            [ 1]  519 	ld	a, yl
      008A0B 88               [ 1]  520 	push	a
      008A0C CD 88 E6         [ 4]  521 	call	_OLED_ShowChar
      008A0F 5B 03            [ 2]  522 	addw	sp, #3
                                    523 ;	driver/oled.c: 189: continue;
      008A11 20 14            [ 2]  524 	jra	00107$
      008A13                        525 00102$:
                                    526 ;	driver/oled.c: 190: }else enshow=1;
      008A13 A6 01            [ 1]  527 	ld	a, #0x01
      008A15 6B 05            [ 1]  528 	ld	(0x05, sp), a
      008A17                        529 00105$:
                                    530 ;	driver/oled.c: 193: OLED_ShowChar(x+(size2/2)*t,y,temp+'0');
      008A17 7B 06            [ 1]  531 	ld	a, (0x06, sp)
      008A19 AB 30            [ 1]  532 	add	a, #0x30
      008A1B 88               [ 1]  533 	push	a
      008A1C 7B 0C            [ 1]  534 	ld	a, (0x0c, sp)
      008A1E 88               [ 1]  535 	push	a
      008A1F 90 9F            [ 1]  536 	ld	a, yl
      008A21 88               [ 1]  537 	push	a
      008A22 CD 88 E6         [ 4]  538 	call	_OLED_ShowChar
      008A25 5B 03            [ 2]  539 	addw	sp, #3
      008A27                        540 00107$:
                                    541 ;	driver/oled.c: 181: for(t=0;t<len;t++)
      008A27 0C 07            [ 1]  542 	inc	(0x07, sp)
      008A29 CC 89 98         [ 2]  543 	jp	00110$
      008A2C                        544 00111$:
                                    545 ;	driver/oled.c: 195: }
      008A2C 5B 07            [ 2]  546 	addw	sp, #7
      008A2E 81               [ 4]  547 	ret
                                    548 ;	driver/oled.c: 197: void OLED_ShowString(u8 x,u8 y,u8 *chr)
                                    549 ;	-----------------------------------------
                                    550 ;	 function OLED_ShowString
                                    551 ;	-----------------------------------------
      008A2F                        552 _OLED_ShowString:
      008A2F 88               [ 1]  553 	push	a
                                    554 ;	driver/oled.c: 200: while (chr[j]!='\0')
      008A30 0F 01            [ 1]  555 	clr	(0x01, sp)
      008A32                        556 00103$:
      008A32 5F               [ 1]  557 	clrw	x
      008A33 7B 01            [ 1]  558 	ld	a, (0x01, sp)
      008A35 97               [ 1]  559 	ld	xl, a
      008A36 72 FB 06         [ 2]  560 	addw	x, (0x06, sp)
      008A39 F6               [ 1]  561 	ld	a, (x)
      008A3A 27 24            [ 1]  562 	jreq	00106$
                                    563 ;	driver/oled.c: 201: {		OLED_ShowChar(x,y,chr[j]);
      008A3C 88               [ 1]  564 	push	a
      008A3D 7B 06            [ 1]  565 	ld	a, (0x06, sp)
      008A3F 88               [ 1]  566 	push	a
      008A40 7B 06            [ 1]  567 	ld	a, (0x06, sp)
      008A42 88               [ 1]  568 	push	a
      008A43 CD 88 E6         [ 4]  569 	call	_OLED_ShowChar
      008A46 5B 03            [ 2]  570 	addw	sp, #3
                                    571 ;	driver/oled.c: 202: x+=8;
      008A48 7B 04            [ 1]  572 	ld	a, (0x04, sp)
      008A4A AB 08            [ 1]  573 	add	a, #0x08
      008A4C 6B 04            [ 1]  574 	ld	(0x04, sp), a
                                    575 ;	driver/oled.c: 203: if(x>120){x=0;y+=2;}
      008A4E 7B 04            [ 1]  576 	ld	a, (0x04, sp)
      008A50 A1 78            [ 1]  577 	cp	a, #0x78
      008A52 23 08            [ 2]  578 	jrule	00102$
      008A54 0F 04            [ 1]  579 	clr	(0x04, sp)
      008A56 7B 05            [ 1]  580 	ld	a, (0x05, sp)
      008A58 AB 02            [ 1]  581 	add	a, #0x02
      008A5A 6B 05            [ 1]  582 	ld	(0x05, sp), a
      008A5C                        583 00102$:
                                    584 ;	driver/oled.c: 204: j++;
      008A5C 0C 01            [ 1]  585 	inc	(0x01, sp)
      008A5E 20 D2            [ 2]  586 	jra	00103$
      008A60                        587 00106$:
                                    588 ;	driver/oled.c: 206: }
      008A60 84               [ 1]  589 	pop	a
      008A61 81               [ 4]  590 	ret
                                    591 ;	driver/oled.c: 248: void OLED_Init(void)
                                    592 ;	-----------------------------------------
                                    593 ;	 function OLED_Init
                                    594 ;	-----------------------------------------
      008A62                        595 _OLED_Init:
                                    596 ;	driver/oled.c: 250: GPIO_Init(OLED_SCLK_PORT, (GPIO_Pin_TypeDef)OLED_SCLK_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      008A62 4B E0            [ 1]  597 	push	#0xe0
      008A64 4B 02            [ 1]  598 	push	#0x02
      008A66 4B 0A            [ 1]  599 	push	#0x0a
      008A68 4B 50            [ 1]  600 	push	#0x50
      008A6A CD 8C 4C         [ 4]  601 	call	_GPIO_Init
      008A6D 5B 04            [ 2]  602 	addw	sp, #4
                                    603 ;	driver/oled.c: 251: GPIO_Init(OLED_SDIN_PORT, (GPIO_Pin_TypeDef)OLED_SDIN_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      008A6F 4B E0            [ 1]  604 	push	#0xe0
      008A71 4B 04            [ 1]  605 	push	#0x04
      008A73 4B 0A            [ 1]  606 	push	#0x0a
      008A75 4B 50            [ 1]  607 	push	#0x50
      008A77 CD 8C 4C         [ 4]  608 	call	_GPIO_Init
      008A7A 5B 04            [ 2]  609 	addw	sp, #4
                                    610 ;	driver/oled.c: 252: GPIO_Init(OLED_RST_PORT, (GPIO_Pin_TypeDef)OLED_RST_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      008A7C 4B E0            [ 1]  611 	push	#0xe0
      008A7E 4B 08            [ 1]  612 	push	#0x08
      008A80 4B 0A            [ 1]  613 	push	#0x0a
      008A82 4B 50            [ 1]  614 	push	#0x50
      008A84 CD 8C 4C         [ 4]  615 	call	_GPIO_Init
      008A87 5B 04            [ 2]  616 	addw	sp, #4
                                    617 ;	driver/oled.c: 253: GPIO_Init(OLED_DC_PORT, (GPIO_Pin_TypeDef)OLED_DC_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      008A89 4B E0            [ 1]  618 	push	#0xe0
      008A8B 4B 10            [ 1]  619 	push	#0x10
      008A8D 4B 0A            [ 1]  620 	push	#0x0a
      008A8F 4B 50            [ 1]  621 	push	#0x50
      008A91 CD 8C 4C         [ 4]  622 	call	_GPIO_Init
      008A94 5B 04            [ 2]  623 	addw	sp, #4
                                    624 ;	driver/oled.c: 254: GPIO_Init(OLED_CS_PORT, (GPIO_Pin_TypeDef)OLED_CS_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      008A96 4B E0            [ 1]  625 	push	#0xe0
      008A98 4B 20            [ 1]  626 	push	#0x20
      008A9A 4B 0A            [ 1]  627 	push	#0x0a
      008A9C 4B 50            [ 1]  628 	push	#0x50
      008A9E CD 8C 4C         [ 4]  629 	call	_GPIO_Init
      008AA1 5B 04            [ 2]  630 	addw	sp, #4
                                    631 ;	driver/oled.c: 257: OLED_RST_Set();
      008AA3 4B 08            [ 1]  632 	push	#0x08
      008AA5 4B 0A            [ 1]  633 	push	#0x0a
      008AA7 4B 50            [ 1]  634 	push	#0x50
      008AA9 CD 8C C7         [ 4]  635 	call	_GPIO_WriteHigh
      008AAC 5B 03            [ 2]  636 	addw	sp, #3
                                    637 ;	driver/oled.c: 258: delay_ms(100);
      008AAE 4B 64            [ 1]  638 	push	#0x64
      008AB0 4B 00            [ 1]  639 	push	#0x00
      008AB2 CD 87 9A         [ 4]  640 	call	_delay_ms
      008AB5 5B 02            [ 2]  641 	addw	sp, #2
                                    642 ;	driver/oled.c: 259: OLED_RST_Clr();
      008AB7 4B 08            [ 1]  643 	push	#0x08
      008AB9 4B 0A            [ 1]  644 	push	#0x0a
      008ABB 4B 50            [ 1]  645 	push	#0x50
      008ABD CD 8C CE         [ 4]  646 	call	_GPIO_WriteLow
      008AC0 5B 03            [ 2]  647 	addw	sp, #3
                                    648 ;	driver/oled.c: 260: delay_ms(100);
      008AC2 4B 64            [ 1]  649 	push	#0x64
      008AC4 4B 00            [ 1]  650 	push	#0x00
      008AC6 CD 87 9A         [ 4]  651 	call	_delay_ms
      008AC9 5B 02            [ 2]  652 	addw	sp, #2
                                    653 ;	driver/oled.c: 261: OLED_RST_Set();
      008ACB 4B 08            [ 1]  654 	push	#0x08
      008ACD 4B 0A            [ 1]  655 	push	#0x0a
      008ACF 4B 50            [ 1]  656 	push	#0x50
      008AD1 CD 8C C7         [ 4]  657 	call	_GPIO_WriteHigh
      008AD4 5B 03            [ 2]  658 	addw	sp, #3
                                    659 ;	driver/oled.c: 293: OLED_WR_Byte(0xAE,OLED_CMD);//--turn off oled panel
      008AD6 4B 00            [ 1]  660 	push	#0x00
      008AD8 4B AE            [ 1]  661 	push	#0xae
      008ADA CD 87 B8         [ 4]  662 	call	_OLED_WR_Byte
      008ADD 5B 02            [ 2]  663 	addw	sp, #2
                                    664 ;	driver/oled.c: 294: OLED_WR_Byte(0x00,OLED_CMD);//---set low column address
      008ADF 4B 00            [ 1]  665 	push	#0x00
      008AE1 4B 00            [ 1]  666 	push	#0x00
      008AE3 CD 87 B8         [ 4]  667 	call	_OLED_WR_Byte
      008AE6 5B 02            [ 2]  668 	addw	sp, #2
                                    669 ;	driver/oled.c: 295: OLED_WR_Byte(0x10,OLED_CMD);//---set high column address
      008AE8 4B 00            [ 1]  670 	push	#0x00
      008AEA 4B 10            [ 1]  671 	push	#0x10
      008AEC CD 87 B8         [ 4]  672 	call	_OLED_WR_Byte
      008AEF 5B 02            [ 2]  673 	addw	sp, #2
                                    674 ;	driver/oled.c: 296: OLED_WR_Byte(0x40,OLED_CMD);//--set start line address  Set Mapping RAM Display Start Line (0x00~0x3F)
      008AF1 4B 00            [ 1]  675 	push	#0x00
      008AF3 4B 40            [ 1]  676 	push	#0x40
      008AF5 CD 87 B8         [ 4]  677 	call	_OLED_WR_Byte
      008AF8 5B 02            [ 2]  678 	addw	sp, #2
                                    679 ;	driver/oled.c: 297: OLED_WR_Byte(0x81,OLED_CMD);//--set contrast control register
      008AFA 4B 00            [ 1]  680 	push	#0x00
      008AFC 4B 81            [ 1]  681 	push	#0x81
      008AFE CD 87 B8         [ 4]  682 	call	_OLED_WR_Byte
      008B01 5B 02            [ 2]  683 	addw	sp, #2
                                    684 ;	driver/oled.c: 298: OLED_WR_Byte(0xCF,OLED_CMD); // Set SEG Output Current Brightness
      008B03 4B 00            [ 1]  685 	push	#0x00
      008B05 4B CF            [ 1]  686 	push	#0xcf
      008B07 CD 87 B8         [ 4]  687 	call	_OLED_WR_Byte
      008B0A 5B 02            [ 2]  688 	addw	sp, #2
                                    689 ;	driver/oled.c: 299: OLED_WR_Byte(0xA1,OLED_CMD);//--Set SEG/Column Mapping     0xa0左右反置 0xa1正常
      008B0C 4B 00            [ 1]  690 	push	#0x00
      008B0E 4B A1            [ 1]  691 	push	#0xa1
      008B10 CD 87 B8         [ 4]  692 	call	_OLED_WR_Byte
      008B13 5B 02            [ 2]  693 	addw	sp, #2
                                    694 ;	driver/oled.c: 300: OLED_WR_Byte(0xC8,OLED_CMD);//Set COM/Row Scan Direction   0xc0上下反置 0xc8正常
      008B15 4B 00            [ 1]  695 	push	#0x00
      008B17 4B C8            [ 1]  696 	push	#0xc8
      008B19 CD 87 B8         [ 4]  697 	call	_OLED_WR_Byte
      008B1C 5B 02            [ 2]  698 	addw	sp, #2
                                    699 ;	driver/oled.c: 301: OLED_WR_Byte(0xA6,OLED_CMD);//--set normal display
      008B1E 4B 00            [ 1]  700 	push	#0x00
      008B20 4B A6            [ 1]  701 	push	#0xa6
      008B22 CD 87 B8         [ 4]  702 	call	_OLED_WR_Byte
      008B25 5B 02            [ 2]  703 	addw	sp, #2
                                    704 ;	driver/oled.c: 302: OLED_WR_Byte(0xA8,OLED_CMD);//--set multiplex ratio(1 to 64)
      008B27 4B 00            [ 1]  705 	push	#0x00
      008B29 4B A8            [ 1]  706 	push	#0xa8
      008B2B CD 87 B8         [ 4]  707 	call	_OLED_WR_Byte
      008B2E 5B 02            [ 2]  708 	addw	sp, #2
                                    709 ;	driver/oled.c: 303: OLED_WR_Byte(0x3f,OLED_CMD);//--1/64 duty
      008B30 4B 00            [ 1]  710 	push	#0x00
      008B32 4B 3F            [ 1]  711 	push	#0x3f
      008B34 CD 87 B8         [ 4]  712 	call	_OLED_WR_Byte
      008B37 5B 02            [ 2]  713 	addw	sp, #2
                                    714 ;	driver/oled.c: 304: OLED_WR_Byte(0xD3,OLED_CMD);//-set display offset	Shift Mapping RAM Counter (0x00~0x3F)
      008B39 4B 00            [ 1]  715 	push	#0x00
      008B3B 4B D3            [ 1]  716 	push	#0xd3
      008B3D CD 87 B8         [ 4]  717 	call	_OLED_WR_Byte
      008B40 5B 02            [ 2]  718 	addw	sp, #2
                                    719 ;	driver/oled.c: 305: OLED_WR_Byte(0x00,OLED_CMD);//-not offset
      008B42 4B 00            [ 1]  720 	push	#0x00
      008B44 4B 00            [ 1]  721 	push	#0x00
      008B46 CD 87 B8         [ 4]  722 	call	_OLED_WR_Byte
      008B49 5B 02            [ 2]  723 	addw	sp, #2
                                    724 ;	driver/oled.c: 306: OLED_WR_Byte(0xd5,OLED_CMD);//--set display clock divide ratio/oscillator frequency
      008B4B 4B 00            [ 1]  725 	push	#0x00
      008B4D 4B D5            [ 1]  726 	push	#0xd5
      008B4F CD 87 B8         [ 4]  727 	call	_OLED_WR_Byte
      008B52 5B 02            [ 2]  728 	addw	sp, #2
                                    729 ;	driver/oled.c: 307: OLED_WR_Byte(0x80,OLED_CMD);//--set divide ratio, Set Clock as 100 Frames/Sec
      008B54 4B 00            [ 1]  730 	push	#0x00
      008B56 4B 80            [ 1]  731 	push	#0x80
      008B58 CD 87 B8         [ 4]  732 	call	_OLED_WR_Byte
      008B5B 5B 02            [ 2]  733 	addw	sp, #2
                                    734 ;	driver/oled.c: 308: OLED_WR_Byte(0xD9,OLED_CMD);//--set pre-charge period
      008B5D 4B 00            [ 1]  735 	push	#0x00
      008B5F 4B D9            [ 1]  736 	push	#0xd9
      008B61 CD 87 B8         [ 4]  737 	call	_OLED_WR_Byte
      008B64 5B 02            [ 2]  738 	addw	sp, #2
                                    739 ;	driver/oled.c: 309: OLED_WR_Byte(0xF1,OLED_CMD);//Set Pre-Charge as 15 Clocks & Discharge as 1 Clock
      008B66 4B 00            [ 1]  740 	push	#0x00
      008B68 4B F1            [ 1]  741 	push	#0xf1
      008B6A CD 87 B8         [ 4]  742 	call	_OLED_WR_Byte
      008B6D 5B 02            [ 2]  743 	addw	sp, #2
                                    744 ;	driver/oled.c: 310: OLED_WR_Byte(0xDA,OLED_CMD);//--set com pins hardware configuration
      008B6F 4B 00            [ 1]  745 	push	#0x00
      008B71 4B DA            [ 1]  746 	push	#0xda
      008B73 CD 87 B8         [ 4]  747 	call	_OLED_WR_Byte
      008B76 5B 02            [ 2]  748 	addw	sp, #2
                                    749 ;	driver/oled.c: 311: OLED_WR_Byte(0x12,OLED_CMD);
      008B78 4B 00            [ 1]  750 	push	#0x00
      008B7A 4B 12            [ 1]  751 	push	#0x12
      008B7C CD 87 B8         [ 4]  752 	call	_OLED_WR_Byte
      008B7F 5B 02            [ 2]  753 	addw	sp, #2
                                    754 ;	driver/oled.c: 312: OLED_WR_Byte(0xDB,OLED_CMD);//--set vcomh
      008B81 4B 00            [ 1]  755 	push	#0x00
      008B83 4B DB            [ 1]  756 	push	#0xdb
      008B85 CD 87 B8         [ 4]  757 	call	_OLED_WR_Byte
      008B88 5B 02            [ 2]  758 	addw	sp, #2
                                    759 ;	driver/oled.c: 313: OLED_WR_Byte(0x40,OLED_CMD);//Set VCOM Deselect Level
      008B8A 4B 00            [ 1]  760 	push	#0x00
      008B8C 4B 40            [ 1]  761 	push	#0x40
      008B8E CD 87 B8         [ 4]  762 	call	_OLED_WR_Byte
      008B91 5B 02            [ 2]  763 	addw	sp, #2
                                    764 ;	driver/oled.c: 314: OLED_WR_Byte(0x20,OLED_CMD);//-Set Page Addressing Mode (0x00/0x01/0x02)
      008B93 4B 00            [ 1]  765 	push	#0x00
      008B95 4B 20            [ 1]  766 	push	#0x20
      008B97 CD 87 B8         [ 4]  767 	call	_OLED_WR_Byte
      008B9A 5B 02            [ 2]  768 	addw	sp, #2
                                    769 ;	driver/oled.c: 315: OLED_WR_Byte(0x02,OLED_CMD);//
      008B9C 4B 00            [ 1]  770 	push	#0x00
      008B9E 4B 02            [ 1]  771 	push	#0x02
      008BA0 CD 87 B8         [ 4]  772 	call	_OLED_WR_Byte
      008BA3 5B 02            [ 2]  773 	addw	sp, #2
                                    774 ;	driver/oled.c: 316: OLED_WR_Byte(0x8D,OLED_CMD);//--set Charge Pump enable/disable
      008BA5 4B 00            [ 1]  775 	push	#0x00
      008BA7 4B 8D            [ 1]  776 	push	#0x8d
      008BA9 CD 87 B8         [ 4]  777 	call	_OLED_WR_Byte
      008BAC 5B 02            [ 2]  778 	addw	sp, #2
                                    779 ;	driver/oled.c: 317: OLED_WR_Byte(0x14,OLED_CMD);//--set(0x10) disable
      008BAE 4B 00            [ 1]  780 	push	#0x00
      008BB0 4B 14            [ 1]  781 	push	#0x14
      008BB2 CD 87 B8         [ 4]  782 	call	_OLED_WR_Byte
      008BB5 5B 02            [ 2]  783 	addw	sp, #2
                                    784 ;	driver/oled.c: 318: OLED_WR_Byte(0xA4,OLED_CMD);// Disable Entire Display On (0xa4/0xa5)
      008BB7 4B 00            [ 1]  785 	push	#0x00
      008BB9 4B A4            [ 1]  786 	push	#0xa4
      008BBB CD 87 B8         [ 4]  787 	call	_OLED_WR_Byte
      008BBE 5B 02            [ 2]  788 	addw	sp, #2
                                    789 ;	driver/oled.c: 319: OLED_WR_Byte(0xA6,OLED_CMD);// Disable Inverse Display On (0xa6/a7)
      008BC0 4B 00            [ 1]  790 	push	#0x00
      008BC2 4B A6            [ 1]  791 	push	#0xa6
      008BC4 CD 87 B8         [ 4]  792 	call	_OLED_WR_Byte
      008BC7 5B 02            [ 2]  793 	addw	sp, #2
                                    794 ;	driver/oled.c: 320: OLED_WR_Byte(0xAF,OLED_CMD);//--turn on oled panel
      008BC9 4B 00            [ 1]  795 	push	#0x00
      008BCB 4B AF            [ 1]  796 	push	#0xaf
      008BCD CD 87 B8         [ 4]  797 	call	_OLED_WR_Byte
      008BD0 5B 02            [ 2]  798 	addw	sp, #2
                                    799 ;	driver/oled.c: 322: OLED_WR_Byte(0xAF,OLED_CMD); /*display ON*/
      008BD2 4B 00            [ 1]  800 	push	#0x00
      008BD4 4B AF            [ 1]  801 	push	#0xaf
      008BD6 CD 87 B8         [ 4]  802 	call	_OLED_WR_Byte
      008BD9 5B 02            [ 2]  803 	addw	sp, #2
                                    804 ;	driver/oled.c: 323: OLED_Clear();
      008BDB CD 88 AA         [ 4]  805 	call	_OLED_Clear
                                    806 ;	driver/oled.c: 324: OLED_Set_Pos(0,0);
      008BDE 4B 00            [ 1]  807 	push	#0x00
      008BE0 4B 00            [ 1]  808 	push	#0x00
      008BE2 CD 88 35         [ 4]  809 	call	_OLED_Set_Pos
      008BE5 5B 02            [ 2]  810 	addw	sp, #2
                                    811 ;	driver/oled.c: 325: }
      008BE7 81               [ 4]  812 	ret
                                    813 	.area CODE
                                    814 	.area CONST
      008052                        815 _F8X16:
      008052 00                     816 	.db #0x00	; 0
      008053 00                     817 	.db #0x00	; 0
      008054 00                     818 	.db #0x00	; 0
      008055 00                     819 	.db #0x00	; 0
      008056 00                     820 	.db #0x00	; 0
      008057 00                     821 	.db #0x00	; 0
      008058 00                     822 	.db #0x00	; 0
      008059 00                     823 	.db #0x00	; 0
      00805A 00                     824 	.db #0x00	; 0
      00805B 00                     825 	.db #0x00	; 0
      00805C 00                     826 	.db #0x00	; 0
      00805D 00                     827 	.db #0x00	; 0
      00805E 00                     828 	.db #0x00	; 0
      00805F 00                     829 	.db #0x00	; 0
      008060 00                     830 	.db #0x00	; 0
      008061 00                     831 	.db #0x00	; 0
      008062 00                     832 	.db #0x00	; 0
      008063 00                     833 	.db #0x00	; 0
      008064 00                     834 	.db #0x00	; 0
      008065 F8                     835 	.db #0xf8	; 248
      008066 00                     836 	.db #0x00	; 0
      008067 00                     837 	.db #0x00	; 0
      008068 00                     838 	.db #0x00	; 0
      008069 00                     839 	.db #0x00	; 0
      00806A 00                     840 	.db #0x00	; 0
      00806B 00                     841 	.db #0x00	; 0
      00806C 00                     842 	.db #0x00	; 0
      00806D 33                     843 	.db #0x33	; 51	'3'
      00806E 30                     844 	.db #0x30	; 48	'0'
      00806F 00                     845 	.db #0x00	; 0
      008070 00                     846 	.db #0x00	; 0
      008071 00                     847 	.db #0x00	; 0
      008072 00                     848 	.db #0x00	; 0
      008073 10                     849 	.db #0x10	; 16
      008074 0C                     850 	.db #0x0c	; 12
      008075 06                     851 	.db #0x06	; 6
      008076 10                     852 	.db #0x10	; 16
      008077 0C                     853 	.db #0x0c	; 12
      008078 06                     854 	.db #0x06	; 6
      008079 00                     855 	.db #0x00	; 0
      00807A 00                     856 	.db #0x00	; 0
      00807B 00                     857 	.db #0x00	; 0
      00807C 00                     858 	.db #0x00	; 0
      00807D 00                     859 	.db #0x00	; 0
      00807E 00                     860 	.db #0x00	; 0
      00807F 00                     861 	.db #0x00	; 0
      008080 00                     862 	.db #0x00	; 0
      008081 00                     863 	.db #0x00	; 0
      008082 40                     864 	.db #0x40	; 64
      008083 C0                     865 	.db #0xc0	; 192
      008084 78                     866 	.db #0x78	; 120	'x'
      008085 40                     867 	.db #0x40	; 64
      008086 C0                     868 	.db #0xc0	; 192
      008087 78                     869 	.db #0x78	; 120	'x'
      008088 40                     870 	.db #0x40	; 64
      008089 00                     871 	.db #0x00	; 0
      00808A 04                     872 	.db #0x04	; 4
      00808B 3F                     873 	.db #0x3f	; 63
      00808C 04                     874 	.db #0x04	; 4
      00808D 04                     875 	.db #0x04	; 4
      00808E 3F                     876 	.db #0x3f	; 63
      00808F 04                     877 	.db #0x04	; 4
      008090 04                     878 	.db #0x04	; 4
      008091 00                     879 	.db #0x00	; 0
      008092 00                     880 	.db #0x00	; 0
      008093 70                     881 	.db #0x70	; 112	'p'
      008094 88                     882 	.db #0x88	; 136
      008095 FC                     883 	.db #0xfc	; 252
      008096 08                     884 	.db #0x08	; 8
      008097 30                     885 	.db #0x30	; 48	'0'
      008098 00                     886 	.db #0x00	; 0
      008099 00                     887 	.db #0x00	; 0
      00809A 00                     888 	.db #0x00	; 0
      00809B 18                     889 	.db #0x18	; 24
      00809C 20                     890 	.db #0x20	; 32
      00809D FF                     891 	.db #0xff	; 255
      00809E 21                     892 	.db #0x21	; 33
      00809F 1E                     893 	.db #0x1e	; 30
      0080A0 00                     894 	.db #0x00	; 0
      0080A1 00                     895 	.db #0x00	; 0
      0080A2 F0                     896 	.db #0xf0	; 240
      0080A3 08                     897 	.db #0x08	; 8
      0080A4 F0                     898 	.db #0xf0	; 240
      0080A5 00                     899 	.db #0x00	; 0
      0080A6 E0                     900 	.db #0xe0	; 224
      0080A7 18                     901 	.db #0x18	; 24
      0080A8 00                     902 	.db #0x00	; 0
      0080A9 00                     903 	.db #0x00	; 0
      0080AA 00                     904 	.db #0x00	; 0
      0080AB 21                     905 	.db #0x21	; 33
      0080AC 1C                     906 	.db #0x1c	; 28
      0080AD 03                     907 	.db #0x03	; 3
      0080AE 1E                     908 	.db #0x1e	; 30
      0080AF 21                     909 	.db #0x21	; 33
      0080B0 1E                     910 	.db #0x1e	; 30
      0080B1 00                     911 	.db #0x00	; 0
      0080B2 00                     912 	.db #0x00	; 0
      0080B3 F0                     913 	.db #0xf0	; 240
      0080B4 08                     914 	.db #0x08	; 8
      0080B5 88                     915 	.db #0x88	; 136
      0080B6 70                     916 	.db #0x70	; 112	'p'
      0080B7 00                     917 	.db #0x00	; 0
      0080B8 00                     918 	.db #0x00	; 0
      0080B9 00                     919 	.db #0x00	; 0
      0080BA 1E                     920 	.db #0x1e	; 30
      0080BB 21                     921 	.db #0x21	; 33
      0080BC 23                     922 	.db #0x23	; 35
      0080BD 24                     923 	.db #0x24	; 36
      0080BE 19                     924 	.db #0x19	; 25
      0080BF 27                     925 	.db #0x27	; 39
      0080C0 21                     926 	.db #0x21	; 33
      0080C1 10                     927 	.db #0x10	; 16
      0080C2 10                     928 	.db #0x10	; 16
      0080C3 16                     929 	.db #0x16	; 22
      0080C4 0E                     930 	.db #0x0e	; 14
      0080C5 00                     931 	.db #0x00	; 0
      0080C6 00                     932 	.db #0x00	; 0
      0080C7 00                     933 	.db #0x00	; 0
      0080C8 00                     934 	.db #0x00	; 0
      0080C9 00                     935 	.db #0x00	; 0
      0080CA 00                     936 	.db #0x00	; 0
      0080CB 00                     937 	.db #0x00	; 0
      0080CC 00                     938 	.db #0x00	; 0
      0080CD 00                     939 	.db #0x00	; 0
      0080CE 00                     940 	.db #0x00	; 0
      0080CF 00                     941 	.db #0x00	; 0
      0080D0 00                     942 	.db #0x00	; 0
      0080D1 00                     943 	.db #0x00	; 0
      0080D2 00                     944 	.db #0x00	; 0
      0080D3 00                     945 	.db #0x00	; 0
      0080D4 00                     946 	.db #0x00	; 0
      0080D5 E0                     947 	.db #0xe0	; 224
      0080D6 18                     948 	.db #0x18	; 24
      0080D7 04                     949 	.db #0x04	; 4
      0080D8 02                     950 	.db #0x02	; 2
      0080D9 00                     951 	.db #0x00	; 0
      0080DA 00                     952 	.db #0x00	; 0
      0080DB 00                     953 	.db #0x00	; 0
      0080DC 00                     954 	.db #0x00	; 0
      0080DD 07                     955 	.db #0x07	; 7
      0080DE 18                     956 	.db #0x18	; 24
      0080DF 20                     957 	.db #0x20	; 32
      0080E0 40                     958 	.db #0x40	; 64
      0080E1 00                     959 	.db #0x00	; 0
      0080E2 00                     960 	.db #0x00	; 0
      0080E3 02                     961 	.db #0x02	; 2
      0080E4 04                     962 	.db #0x04	; 4
      0080E5 18                     963 	.db #0x18	; 24
      0080E6 E0                     964 	.db #0xe0	; 224
      0080E7 00                     965 	.db #0x00	; 0
      0080E8 00                     966 	.db #0x00	; 0
      0080E9 00                     967 	.db #0x00	; 0
      0080EA 00                     968 	.db #0x00	; 0
      0080EB 40                     969 	.db #0x40	; 64
      0080EC 20                     970 	.db #0x20	; 32
      0080ED 18                     971 	.db #0x18	; 24
      0080EE 07                     972 	.db #0x07	; 7
      0080EF 00                     973 	.db #0x00	; 0
      0080F0 00                     974 	.db #0x00	; 0
      0080F1 00                     975 	.db #0x00	; 0
      0080F2 40                     976 	.db #0x40	; 64
      0080F3 40                     977 	.db #0x40	; 64
      0080F4 80                     978 	.db #0x80	; 128
      0080F5 F0                     979 	.db #0xf0	; 240
      0080F6 80                     980 	.db #0x80	; 128
      0080F7 40                     981 	.db #0x40	; 64
      0080F8 40                     982 	.db #0x40	; 64
      0080F9 00                     983 	.db #0x00	; 0
      0080FA 02                     984 	.db #0x02	; 2
      0080FB 02                     985 	.db #0x02	; 2
      0080FC 01                     986 	.db #0x01	; 1
      0080FD 0F                     987 	.db #0x0f	; 15
      0080FE 01                     988 	.db #0x01	; 1
      0080FF 02                     989 	.db #0x02	; 2
      008100 02                     990 	.db #0x02	; 2
      008101 00                     991 	.db #0x00	; 0
      008102 00                     992 	.db #0x00	; 0
      008103 00                     993 	.db #0x00	; 0
      008104 00                     994 	.db #0x00	; 0
      008105 F0                     995 	.db #0xf0	; 240
      008106 00                     996 	.db #0x00	; 0
      008107 00                     997 	.db #0x00	; 0
      008108 00                     998 	.db #0x00	; 0
      008109 00                     999 	.db #0x00	; 0
      00810A 01                    1000 	.db #0x01	; 1
      00810B 01                    1001 	.db #0x01	; 1
      00810C 01                    1002 	.db #0x01	; 1
      00810D 1F                    1003 	.db #0x1f	; 31
      00810E 01                    1004 	.db #0x01	; 1
      00810F 01                    1005 	.db #0x01	; 1
      008110 01                    1006 	.db #0x01	; 1
      008111 00                    1007 	.db #0x00	; 0
      008112 00                    1008 	.db #0x00	; 0
      008113 00                    1009 	.db #0x00	; 0
      008114 00                    1010 	.db #0x00	; 0
      008115 00                    1011 	.db #0x00	; 0
      008116 00                    1012 	.db #0x00	; 0
      008117 00                    1013 	.db #0x00	; 0
      008118 00                    1014 	.db #0x00	; 0
      008119 00                    1015 	.db #0x00	; 0
      00811A 80                    1016 	.db #0x80	; 128
      00811B B0                    1017 	.db #0xb0	; 176
      00811C 70                    1018 	.db #0x70	; 112	'p'
      00811D 00                    1019 	.db #0x00	; 0
      00811E 00                    1020 	.db #0x00	; 0
      00811F 00                    1021 	.db #0x00	; 0
      008120 00                    1022 	.db #0x00	; 0
      008121 00                    1023 	.db #0x00	; 0
      008122 00                    1024 	.db #0x00	; 0
      008123 00                    1025 	.db #0x00	; 0
      008124 00                    1026 	.db #0x00	; 0
      008125 00                    1027 	.db #0x00	; 0
      008126 00                    1028 	.db #0x00	; 0
      008127 00                    1029 	.db #0x00	; 0
      008128 00                    1030 	.db #0x00	; 0
      008129 00                    1031 	.db #0x00	; 0
      00812A 00                    1032 	.db #0x00	; 0
      00812B 01                    1033 	.db #0x01	; 1
      00812C 01                    1034 	.db #0x01	; 1
      00812D 01                    1035 	.db #0x01	; 1
      00812E 01                    1036 	.db #0x01	; 1
      00812F 01                    1037 	.db #0x01	; 1
      008130 01                    1038 	.db #0x01	; 1
      008131 01                    1039 	.db #0x01	; 1
      008132 00                    1040 	.db #0x00	; 0
      008133 00                    1041 	.db #0x00	; 0
      008134 00                    1042 	.db #0x00	; 0
      008135 00                    1043 	.db #0x00	; 0
      008136 00                    1044 	.db #0x00	; 0
      008137 00                    1045 	.db #0x00	; 0
      008138 00                    1046 	.db #0x00	; 0
      008139 00                    1047 	.db #0x00	; 0
      00813A 00                    1048 	.db #0x00	; 0
      00813B 30                    1049 	.db #0x30	; 48	'0'
      00813C 30                    1050 	.db #0x30	; 48	'0'
      00813D 00                    1051 	.db #0x00	; 0
      00813E 00                    1052 	.db #0x00	; 0
      00813F 00                    1053 	.db #0x00	; 0
      008140 00                    1054 	.db #0x00	; 0
      008141 00                    1055 	.db #0x00	; 0
      008142 00                    1056 	.db #0x00	; 0
      008143 00                    1057 	.db #0x00	; 0
      008144 00                    1058 	.db #0x00	; 0
      008145 00                    1059 	.db #0x00	; 0
      008146 80                    1060 	.db #0x80	; 128
      008147 60                    1061 	.db #0x60	; 96
      008148 18                    1062 	.db #0x18	; 24
      008149 04                    1063 	.db #0x04	; 4
      00814A 00                    1064 	.db #0x00	; 0
      00814B 60                    1065 	.db #0x60	; 96
      00814C 18                    1066 	.db #0x18	; 24
      00814D 06                    1067 	.db #0x06	; 6
      00814E 01                    1068 	.db #0x01	; 1
      00814F 00                    1069 	.db #0x00	; 0
      008150 00                    1070 	.db #0x00	; 0
      008151 00                    1071 	.db #0x00	; 0
      008152 00                    1072 	.db #0x00	; 0
      008153 E0                    1073 	.db #0xe0	; 224
      008154 10                    1074 	.db #0x10	; 16
      008155 08                    1075 	.db #0x08	; 8
      008156 08                    1076 	.db #0x08	; 8
      008157 10                    1077 	.db #0x10	; 16
      008158 E0                    1078 	.db #0xe0	; 224
      008159 00                    1079 	.db #0x00	; 0
      00815A 00                    1080 	.db #0x00	; 0
      00815B 0F                    1081 	.db #0x0f	; 15
      00815C 10                    1082 	.db #0x10	; 16
      00815D 20                    1083 	.db #0x20	; 32
      00815E 20                    1084 	.db #0x20	; 32
      00815F 10                    1085 	.db #0x10	; 16
      008160 0F                    1086 	.db #0x0f	; 15
      008161 00                    1087 	.db #0x00	; 0
      008162 00                    1088 	.db #0x00	; 0
      008163 10                    1089 	.db #0x10	; 16
      008164 10                    1090 	.db #0x10	; 16
      008165 F8                    1091 	.db #0xf8	; 248
      008166 00                    1092 	.db #0x00	; 0
      008167 00                    1093 	.db #0x00	; 0
      008168 00                    1094 	.db #0x00	; 0
      008169 00                    1095 	.db #0x00	; 0
      00816A 00                    1096 	.db #0x00	; 0
      00816B 20                    1097 	.db #0x20	; 32
      00816C 20                    1098 	.db #0x20	; 32
      00816D 3F                    1099 	.db #0x3f	; 63
      00816E 20                    1100 	.db #0x20	; 32
      00816F 20                    1101 	.db #0x20	; 32
      008170 00                    1102 	.db #0x00	; 0
      008171 00                    1103 	.db #0x00	; 0
      008172 00                    1104 	.db #0x00	; 0
      008173 70                    1105 	.db #0x70	; 112	'p'
      008174 08                    1106 	.db #0x08	; 8
      008175 08                    1107 	.db #0x08	; 8
      008176 08                    1108 	.db #0x08	; 8
      008177 88                    1109 	.db #0x88	; 136
      008178 70                    1110 	.db #0x70	; 112	'p'
      008179 00                    1111 	.db #0x00	; 0
      00817A 00                    1112 	.db #0x00	; 0
      00817B 30                    1113 	.db #0x30	; 48	'0'
      00817C 28                    1114 	.db #0x28	; 40
      00817D 24                    1115 	.db #0x24	; 36
      00817E 22                    1116 	.db #0x22	; 34
      00817F 21                    1117 	.db #0x21	; 33
      008180 30                    1118 	.db #0x30	; 48	'0'
      008181 00                    1119 	.db #0x00	; 0
      008182 00                    1120 	.db #0x00	; 0
      008183 30                    1121 	.db #0x30	; 48	'0'
      008184 08                    1122 	.db #0x08	; 8
      008185 88                    1123 	.db #0x88	; 136
      008186 88                    1124 	.db #0x88	; 136
      008187 48                    1125 	.db #0x48	; 72	'H'
      008188 30                    1126 	.db #0x30	; 48	'0'
      008189 00                    1127 	.db #0x00	; 0
      00818A 00                    1128 	.db #0x00	; 0
      00818B 18                    1129 	.db #0x18	; 24
      00818C 20                    1130 	.db #0x20	; 32
      00818D 20                    1131 	.db #0x20	; 32
      00818E 20                    1132 	.db #0x20	; 32
      00818F 11                    1133 	.db #0x11	; 17
      008190 0E                    1134 	.db #0x0e	; 14
      008191 00                    1135 	.db #0x00	; 0
      008192 00                    1136 	.db #0x00	; 0
      008193 00                    1137 	.db #0x00	; 0
      008194 C0                    1138 	.db #0xc0	; 192
      008195 20                    1139 	.db #0x20	; 32
      008196 10                    1140 	.db #0x10	; 16
      008197 F8                    1141 	.db #0xf8	; 248
      008198 00                    1142 	.db #0x00	; 0
      008199 00                    1143 	.db #0x00	; 0
      00819A 00                    1144 	.db #0x00	; 0
      00819B 07                    1145 	.db #0x07	; 7
      00819C 04                    1146 	.db #0x04	; 4
      00819D 24                    1147 	.db #0x24	; 36
      00819E 24                    1148 	.db #0x24	; 36
      00819F 3F                    1149 	.db #0x3f	; 63
      0081A0 24                    1150 	.db #0x24	; 36
      0081A1 00                    1151 	.db #0x00	; 0
      0081A2 00                    1152 	.db #0x00	; 0
      0081A3 F8                    1153 	.db #0xf8	; 248
      0081A4 08                    1154 	.db #0x08	; 8
      0081A5 88                    1155 	.db #0x88	; 136
      0081A6 88                    1156 	.db #0x88	; 136
      0081A7 08                    1157 	.db #0x08	; 8
      0081A8 08                    1158 	.db #0x08	; 8
      0081A9 00                    1159 	.db #0x00	; 0
      0081AA 00                    1160 	.db #0x00	; 0
      0081AB 19                    1161 	.db #0x19	; 25
      0081AC 21                    1162 	.db #0x21	; 33
      0081AD 20                    1163 	.db #0x20	; 32
      0081AE 20                    1164 	.db #0x20	; 32
      0081AF 11                    1165 	.db #0x11	; 17
      0081B0 0E                    1166 	.db #0x0e	; 14
      0081B1 00                    1167 	.db #0x00	; 0
      0081B2 00                    1168 	.db #0x00	; 0
      0081B3 E0                    1169 	.db #0xe0	; 224
      0081B4 10                    1170 	.db #0x10	; 16
      0081B5 88                    1171 	.db #0x88	; 136
      0081B6 88                    1172 	.db #0x88	; 136
      0081B7 18                    1173 	.db #0x18	; 24
      0081B8 00                    1174 	.db #0x00	; 0
      0081B9 00                    1175 	.db #0x00	; 0
      0081BA 00                    1176 	.db #0x00	; 0
      0081BB 0F                    1177 	.db #0x0f	; 15
      0081BC 11                    1178 	.db #0x11	; 17
      0081BD 20                    1179 	.db #0x20	; 32
      0081BE 20                    1180 	.db #0x20	; 32
      0081BF 11                    1181 	.db #0x11	; 17
      0081C0 0E                    1182 	.db #0x0e	; 14
      0081C1 00                    1183 	.db #0x00	; 0
      0081C2 00                    1184 	.db #0x00	; 0
      0081C3 38                    1185 	.db #0x38	; 56	'8'
      0081C4 08                    1186 	.db #0x08	; 8
      0081C5 08                    1187 	.db #0x08	; 8
      0081C6 C8                    1188 	.db #0xc8	; 200
      0081C7 38                    1189 	.db #0x38	; 56	'8'
      0081C8 08                    1190 	.db #0x08	; 8
      0081C9 00                    1191 	.db #0x00	; 0
      0081CA 00                    1192 	.db #0x00	; 0
      0081CB 00                    1193 	.db #0x00	; 0
      0081CC 00                    1194 	.db #0x00	; 0
      0081CD 3F                    1195 	.db #0x3f	; 63
      0081CE 00                    1196 	.db #0x00	; 0
      0081CF 00                    1197 	.db #0x00	; 0
      0081D0 00                    1198 	.db #0x00	; 0
      0081D1 00                    1199 	.db #0x00	; 0
      0081D2 00                    1200 	.db #0x00	; 0
      0081D3 70                    1201 	.db #0x70	; 112	'p'
      0081D4 88                    1202 	.db #0x88	; 136
      0081D5 08                    1203 	.db #0x08	; 8
      0081D6 08                    1204 	.db #0x08	; 8
      0081D7 88                    1205 	.db #0x88	; 136
      0081D8 70                    1206 	.db #0x70	; 112	'p'
      0081D9 00                    1207 	.db #0x00	; 0
      0081DA 00                    1208 	.db #0x00	; 0
      0081DB 1C                    1209 	.db #0x1c	; 28
      0081DC 22                    1210 	.db #0x22	; 34
      0081DD 21                    1211 	.db #0x21	; 33
      0081DE 21                    1212 	.db #0x21	; 33
      0081DF 22                    1213 	.db #0x22	; 34
      0081E0 1C                    1214 	.db #0x1c	; 28
      0081E1 00                    1215 	.db #0x00	; 0
      0081E2 00                    1216 	.db #0x00	; 0
      0081E3 E0                    1217 	.db #0xe0	; 224
      0081E4 10                    1218 	.db #0x10	; 16
      0081E5 08                    1219 	.db #0x08	; 8
      0081E6 08                    1220 	.db #0x08	; 8
      0081E7 10                    1221 	.db #0x10	; 16
      0081E8 E0                    1222 	.db #0xe0	; 224
      0081E9 00                    1223 	.db #0x00	; 0
      0081EA 00                    1224 	.db #0x00	; 0
      0081EB 00                    1225 	.db #0x00	; 0
      0081EC 31                    1226 	.db #0x31	; 49	'1'
      0081ED 22                    1227 	.db #0x22	; 34
      0081EE 22                    1228 	.db #0x22	; 34
      0081EF 11                    1229 	.db #0x11	; 17
      0081F0 0F                    1230 	.db #0x0f	; 15
      0081F1 00                    1231 	.db #0x00	; 0
      0081F2 00                    1232 	.db #0x00	; 0
      0081F3 00                    1233 	.db #0x00	; 0
      0081F4 00                    1234 	.db #0x00	; 0
      0081F5 C0                    1235 	.db #0xc0	; 192
      0081F6 C0                    1236 	.db #0xc0	; 192
      0081F7 00                    1237 	.db #0x00	; 0
      0081F8 00                    1238 	.db #0x00	; 0
      0081F9 00                    1239 	.db #0x00	; 0
      0081FA 00                    1240 	.db #0x00	; 0
      0081FB 00                    1241 	.db #0x00	; 0
      0081FC 00                    1242 	.db #0x00	; 0
      0081FD 30                    1243 	.db #0x30	; 48	'0'
      0081FE 30                    1244 	.db #0x30	; 48	'0'
      0081FF 00                    1245 	.db #0x00	; 0
      008200 00                    1246 	.db #0x00	; 0
      008201 00                    1247 	.db #0x00	; 0
      008202 00                    1248 	.db #0x00	; 0
      008203 00                    1249 	.db #0x00	; 0
      008204 00                    1250 	.db #0x00	; 0
      008205 80                    1251 	.db #0x80	; 128
      008206 00                    1252 	.db #0x00	; 0
      008207 00                    1253 	.db #0x00	; 0
      008208 00                    1254 	.db #0x00	; 0
      008209 00                    1255 	.db #0x00	; 0
      00820A 00                    1256 	.db #0x00	; 0
      00820B 00                    1257 	.db #0x00	; 0
      00820C 80                    1258 	.db #0x80	; 128
      00820D 60                    1259 	.db #0x60	; 96
      00820E 00                    1260 	.db #0x00	; 0
      00820F 00                    1261 	.db #0x00	; 0
      008210 00                    1262 	.db #0x00	; 0
      008211 00                    1263 	.db #0x00	; 0
      008212 00                    1264 	.db #0x00	; 0
      008213 00                    1265 	.db #0x00	; 0
      008214 80                    1266 	.db #0x80	; 128
      008215 40                    1267 	.db #0x40	; 64
      008216 20                    1268 	.db #0x20	; 32
      008217 10                    1269 	.db #0x10	; 16
      008218 08                    1270 	.db #0x08	; 8
      008219 00                    1271 	.db #0x00	; 0
      00821A 00                    1272 	.db #0x00	; 0
      00821B 01                    1273 	.db #0x01	; 1
      00821C 02                    1274 	.db #0x02	; 2
      00821D 04                    1275 	.db #0x04	; 4
      00821E 08                    1276 	.db #0x08	; 8
      00821F 10                    1277 	.db #0x10	; 16
      008220 20                    1278 	.db #0x20	; 32
      008221 00                    1279 	.db #0x00	; 0
      008222 40                    1280 	.db #0x40	; 64
      008223 40                    1281 	.db #0x40	; 64
      008224 40                    1282 	.db #0x40	; 64
      008225 40                    1283 	.db #0x40	; 64
      008226 40                    1284 	.db #0x40	; 64
      008227 40                    1285 	.db #0x40	; 64
      008228 40                    1286 	.db #0x40	; 64
      008229 00                    1287 	.db #0x00	; 0
      00822A 04                    1288 	.db #0x04	; 4
      00822B 04                    1289 	.db #0x04	; 4
      00822C 04                    1290 	.db #0x04	; 4
      00822D 04                    1291 	.db #0x04	; 4
      00822E 04                    1292 	.db #0x04	; 4
      00822F 04                    1293 	.db #0x04	; 4
      008230 04                    1294 	.db #0x04	; 4
      008231 00                    1295 	.db #0x00	; 0
      008232 00                    1296 	.db #0x00	; 0
      008233 08                    1297 	.db #0x08	; 8
      008234 10                    1298 	.db #0x10	; 16
      008235 20                    1299 	.db #0x20	; 32
      008236 40                    1300 	.db #0x40	; 64
      008237 80                    1301 	.db #0x80	; 128
      008238 00                    1302 	.db #0x00	; 0
      008239 00                    1303 	.db #0x00	; 0
      00823A 00                    1304 	.db #0x00	; 0
      00823B 20                    1305 	.db #0x20	; 32
      00823C 10                    1306 	.db #0x10	; 16
      00823D 08                    1307 	.db #0x08	; 8
      00823E 04                    1308 	.db #0x04	; 4
      00823F 02                    1309 	.db #0x02	; 2
      008240 01                    1310 	.db #0x01	; 1
      008241 00                    1311 	.db #0x00	; 0
      008242 00                    1312 	.db #0x00	; 0
      008243 70                    1313 	.db #0x70	; 112	'p'
      008244 48                    1314 	.db #0x48	; 72	'H'
      008245 08                    1315 	.db #0x08	; 8
      008246 08                    1316 	.db #0x08	; 8
      008247 08                    1317 	.db #0x08	; 8
      008248 F0                    1318 	.db #0xf0	; 240
      008249 00                    1319 	.db #0x00	; 0
      00824A 00                    1320 	.db #0x00	; 0
      00824B 00                    1321 	.db #0x00	; 0
      00824C 00                    1322 	.db #0x00	; 0
      00824D 30                    1323 	.db #0x30	; 48	'0'
      00824E 36                    1324 	.db #0x36	; 54	'6'
      00824F 01                    1325 	.db #0x01	; 1
      008250 00                    1326 	.db #0x00	; 0
      008251 00                    1327 	.db #0x00	; 0
      008252 C0                    1328 	.db #0xc0	; 192
      008253 30                    1329 	.db #0x30	; 48	'0'
      008254 C8                    1330 	.db #0xc8	; 200
      008255 28                    1331 	.db #0x28	; 40
      008256 E8                    1332 	.db #0xe8	; 232
      008257 10                    1333 	.db #0x10	; 16
      008258 E0                    1334 	.db #0xe0	; 224
      008259 00                    1335 	.db #0x00	; 0
      00825A 07                    1336 	.db #0x07	; 7
      00825B 18                    1337 	.db #0x18	; 24
      00825C 27                    1338 	.db #0x27	; 39
      00825D 24                    1339 	.db #0x24	; 36
      00825E 23                    1340 	.db #0x23	; 35
      00825F 14                    1341 	.db #0x14	; 20
      008260 0B                    1342 	.db #0x0b	; 11
      008261 00                    1343 	.db #0x00	; 0
      008262 00                    1344 	.db #0x00	; 0
      008263 00                    1345 	.db #0x00	; 0
      008264 C0                    1346 	.db #0xc0	; 192
      008265 38                    1347 	.db #0x38	; 56	'8'
      008266 E0                    1348 	.db #0xe0	; 224
      008267 00                    1349 	.db #0x00	; 0
      008268 00                    1350 	.db #0x00	; 0
      008269 00                    1351 	.db #0x00	; 0
      00826A 20                    1352 	.db #0x20	; 32
      00826B 3C                    1353 	.db #0x3c	; 60
      00826C 23                    1354 	.db #0x23	; 35
      00826D 02                    1355 	.db #0x02	; 2
      00826E 02                    1356 	.db #0x02	; 2
      00826F 27                    1357 	.db #0x27	; 39
      008270 38                    1358 	.db #0x38	; 56	'8'
      008271 20                    1359 	.db #0x20	; 32
      008272 08                    1360 	.db #0x08	; 8
      008273 F8                    1361 	.db #0xf8	; 248
      008274 88                    1362 	.db #0x88	; 136
      008275 88                    1363 	.db #0x88	; 136
      008276 88                    1364 	.db #0x88	; 136
      008277 70                    1365 	.db #0x70	; 112	'p'
      008278 00                    1366 	.db #0x00	; 0
      008279 00                    1367 	.db #0x00	; 0
      00827A 20                    1368 	.db #0x20	; 32
      00827B 3F                    1369 	.db #0x3f	; 63
      00827C 20                    1370 	.db #0x20	; 32
      00827D 20                    1371 	.db #0x20	; 32
      00827E 20                    1372 	.db #0x20	; 32
      00827F 11                    1373 	.db #0x11	; 17
      008280 0E                    1374 	.db #0x0e	; 14
      008281 00                    1375 	.db #0x00	; 0
      008282 C0                    1376 	.db #0xc0	; 192
      008283 30                    1377 	.db #0x30	; 48	'0'
      008284 08                    1378 	.db #0x08	; 8
      008285 08                    1379 	.db #0x08	; 8
      008286 08                    1380 	.db #0x08	; 8
      008287 08                    1381 	.db #0x08	; 8
      008288 38                    1382 	.db #0x38	; 56	'8'
      008289 00                    1383 	.db #0x00	; 0
      00828A 07                    1384 	.db #0x07	; 7
      00828B 18                    1385 	.db #0x18	; 24
      00828C 20                    1386 	.db #0x20	; 32
      00828D 20                    1387 	.db #0x20	; 32
      00828E 20                    1388 	.db #0x20	; 32
      00828F 10                    1389 	.db #0x10	; 16
      008290 08                    1390 	.db #0x08	; 8
      008291 00                    1391 	.db #0x00	; 0
      008292 08                    1392 	.db #0x08	; 8
      008293 F8                    1393 	.db #0xf8	; 248
      008294 08                    1394 	.db #0x08	; 8
      008295 08                    1395 	.db #0x08	; 8
      008296 08                    1396 	.db #0x08	; 8
      008297 10                    1397 	.db #0x10	; 16
      008298 E0                    1398 	.db #0xe0	; 224
      008299 00                    1399 	.db #0x00	; 0
      00829A 20                    1400 	.db #0x20	; 32
      00829B 3F                    1401 	.db #0x3f	; 63
      00829C 20                    1402 	.db #0x20	; 32
      00829D 20                    1403 	.db #0x20	; 32
      00829E 20                    1404 	.db #0x20	; 32
      00829F 10                    1405 	.db #0x10	; 16
      0082A0 0F                    1406 	.db #0x0f	; 15
      0082A1 00                    1407 	.db #0x00	; 0
      0082A2 08                    1408 	.db #0x08	; 8
      0082A3 F8                    1409 	.db #0xf8	; 248
      0082A4 88                    1410 	.db #0x88	; 136
      0082A5 88                    1411 	.db #0x88	; 136
      0082A6 E8                    1412 	.db #0xe8	; 232
      0082A7 08                    1413 	.db #0x08	; 8
      0082A8 10                    1414 	.db #0x10	; 16
      0082A9 00                    1415 	.db #0x00	; 0
      0082AA 20                    1416 	.db #0x20	; 32
      0082AB 3F                    1417 	.db #0x3f	; 63
      0082AC 20                    1418 	.db #0x20	; 32
      0082AD 20                    1419 	.db #0x20	; 32
      0082AE 23                    1420 	.db #0x23	; 35
      0082AF 20                    1421 	.db #0x20	; 32
      0082B0 18                    1422 	.db #0x18	; 24
      0082B1 00                    1423 	.db #0x00	; 0
      0082B2 08                    1424 	.db #0x08	; 8
      0082B3 F8                    1425 	.db #0xf8	; 248
      0082B4 88                    1426 	.db #0x88	; 136
      0082B5 88                    1427 	.db #0x88	; 136
      0082B6 E8                    1428 	.db #0xe8	; 232
      0082B7 08                    1429 	.db #0x08	; 8
      0082B8 10                    1430 	.db #0x10	; 16
      0082B9 00                    1431 	.db #0x00	; 0
      0082BA 20                    1432 	.db #0x20	; 32
      0082BB 3F                    1433 	.db #0x3f	; 63
      0082BC 20                    1434 	.db #0x20	; 32
      0082BD 00                    1435 	.db #0x00	; 0
      0082BE 03                    1436 	.db #0x03	; 3
      0082BF 00                    1437 	.db #0x00	; 0
      0082C0 00                    1438 	.db #0x00	; 0
      0082C1 00                    1439 	.db #0x00	; 0
      0082C2 C0                    1440 	.db #0xc0	; 192
      0082C3 30                    1441 	.db #0x30	; 48	'0'
      0082C4 08                    1442 	.db #0x08	; 8
      0082C5 08                    1443 	.db #0x08	; 8
      0082C6 08                    1444 	.db #0x08	; 8
      0082C7 38                    1445 	.db #0x38	; 56	'8'
      0082C8 00                    1446 	.db #0x00	; 0
      0082C9 00                    1447 	.db #0x00	; 0
      0082CA 07                    1448 	.db #0x07	; 7
      0082CB 18                    1449 	.db #0x18	; 24
      0082CC 20                    1450 	.db #0x20	; 32
      0082CD 20                    1451 	.db #0x20	; 32
      0082CE 22                    1452 	.db #0x22	; 34
      0082CF 1E                    1453 	.db #0x1e	; 30
      0082D0 02                    1454 	.db #0x02	; 2
      0082D1 00                    1455 	.db #0x00	; 0
      0082D2 08                    1456 	.db #0x08	; 8
      0082D3 F8                    1457 	.db #0xf8	; 248
      0082D4 08                    1458 	.db #0x08	; 8
      0082D5 00                    1459 	.db #0x00	; 0
      0082D6 00                    1460 	.db #0x00	; 0
      0082D7 08                    1461 	.db #0x08	; 8
      0082D8 F8                    1462 	.db #0xf8	; 248
      0082D9 08                    1463 	.db #0x08	; 8
      0082DA 20                    1464 	.db #0x20	; 32
      0082DB 3F                    1465 	.db #0x3f	; 63
      0082DC 21                    1466 	.db #0x21	; 33
      0082DD 01                    1467 	.db #0x01	; 1
      0082DE 01                    1468 	.db #0x01	; 1
      0082DF 21                    1469 	.db #0x21	; 33
      0082E0 3F                    1470 	.db #0x3f	; 63
      0082E1 20                    1471 	.db #0x20	; 32
      0082E2 00                    1472 	.db #0x00	; 0
      0082E3 08                    1473 	.db #0x08	; 8
      0082E4 08                    1474 	.db #0x08	; 8
      0082E5 F8                    1475 	.db #0xf8	; 248
      0082E6 08                    1476 	.db #0x08	; 8
      0082E7 08                    1477 	.db #0x08	; 8
      0082E8 00                    1478 	.db #0x00	; 0
      0082E9 00                    1479 	.db #0x00	; 0
      0082EA 00                    1480 	.db #0x00	; 0
      0082EB 20                    1481 	.db #0x20	; 32
      0082EC 20                    1482 	.db #0x20	; 32
      0082ED 3F                    1483 	.db #0x3f	; 63
      0082EE 20                    1484 	.db #0x20	; 32
      0082EF 20                    1485 	.db #0x20	; 32
      0082F0 00                    1486 	.db #0x00	; 0
      0082F1 00                    1487 	.db #0x00	; 0
      0082F2 00                    1488 	.db #0x00	; 0
      0082F3 00                    1489 	.db #0x00	; 0
      0082F4 08                    1490 	.db #0x08	; 8
      0082F5 08                    1491 	.db #0x08	; 8
      0082F6 F8                    1492 	.db #0xf8	; 248
      0082F7 08                    1493 	.db #0x08	; 8
      0082F8 08                    1494 	.db #0x08	; 8
      0082F9 00                    1495 	.db #0x00	; 0
      0082FA C0                    1496 	.db #0xc0	; 192
      0082FB 80                    1497 	.db #0x80	; 128
      0082FC 80                    1498 	.db #0x80	; 128
      0082FD 80                    1499 	.db #0x80	; 128
      0082FE 7F                    1500 	.db #0x7f	; 127
      0082FF 00                    1501 	.db #0x00	; 0
      008300 00                    1502 	.db #0x00	; 0
      008301 00                    1503 	.db #0x00	; 0
      008302 08                    1504 	.db #0x08	; 8
      008303 F8                    1505 	.db #0xf8	; 248
      008304 88                    1506 	.db #0x88	; 136
      008305 C0                    1507 	.db #0xc0	; 192
      008306 28                    1508 	.db #0x28	; 40
      008307 18                    1509 	.db #0x18	; 24
      008308 08                    1510 	.db #0x08	; 8
      008309 00                    1511 	.db #0x00	; 0
      00830A 20                    1512 	.db #0x20	; 32
      00830B 3F                    1513 	.db #0x3f	; 63
      00830C 20                    1514 	.db #0x20	; 32
      00830D 01                    1515 	.db #0x01	; 1
      00830E 26                    1516 	.db #0x26	; 38
      00830F 38                    1517 	.db #0x38	; 56	'8'
      008310 20                    1518 	.db #0x20	; 32
      008311 00                    1519 	.db #0x00	; 0
      008312 08                    1520 	.db #0x08	; 8
      008313 F8                    1521 	.db #0xf8	; 248
      008314 08                    1522 	.db #0x08	; 8
      008315 00                    1523 	.db #0x00	; 0
      008316 00                    1524 	.db #0x00	; 0
      008317 00                    1525 	.db #0x00	; 0
      008318 00                    1526 	.db #0x00	; 0
      008319 00                    1527 	.db #0x00	; 0
      00831A 20                    1528 	.db #0x20	; 32
      00831B 3F                    1529 	.db #0x3f	; 63
      00831C 20                    1530 	.db #0x20	; 32
      00831D 20                    1531 	.db #0x20	; 32
      00831E 20                    1532 	.db #0x20	; 32
      00831F 20                    1533 	.db #0x20	; 32
      008320 30                    1534 	.db #0x30	; 48	'0'
      008321 00                    1535 	.db #0x00	; 0
      008322 08                    1536 	.db #0x08	; 8
      008323 F8                    1537 	.db #0xf8	; 248
      008324 F8                    1538 	.db #0xf8	; 248
      008325 00                    1539 	.db #0x00	; 0
      008326 F8                    1540 	.db #0xf8	; 248
      008327 F8                    1541 	.db #0xf8	; 248
      008328 08                    1542 	.db #0x08	; 8
      008329 00                    1543 	.db #0x00	; 0
      00832A 20                    1544 	.db #0x20	; 32
      00832B 3F                    1545 	.db #0x3f	; 63
      00832C 00                    1546 	.db #0x00	; 0
      00832D 3F                    1547 	.db #0x3f	; 63
      00832E 00                    1548 	.db #0x00	; 0
      00832F 3F                    1549 	.db #0x3f	; 63
      008330 20                    1550 	.db #0x20	; 32
      008331 00                    1551 	.db #0x00	; 0
      008332 08                    1552 	.db #0x08	; 8
      008333 F8                    1553 	.db #0xf8	; 248
      008334 30                    1554 	.db #0x30	; 48	'0'
      008335 C0                    1555 	.db #0xc0	; 192
      008336 00                    1556 	.db #0x00	; 0
      008337 08                    1557 	.db #0x08	; 8
      008338 F8                    1558 	.db #0xf8	; 248
      008339 08                    1559 	.db #0x08	; 8
      00833A 20                    1560 	.db #0x20	; 32
      00833B 3F                    1561 	.db #0x3f	; 63
      00833C 20                    1562 	.db #0x20	; 32
      00833D 00                    1563 	.db #0x00	; 0
      00833E 07                    1564 	.db #0x07	; 7
      00833F 18                    1565 	.db #0x18	; 24
      008340 3F                    1566 	.db #0x3f	; 63
      008341 00                    1567 	.db #0x00	; 0
      008342 E0                    1568 	.db #0xe0	; 224
      008343 10                    1569 	.db #0x10	; 16
      008344 08                    1570 	.db #0x08	; 8
      008345 08                    1571 	.db #0x08	; 8
      008346 08                    1572 	.db #0x08	; 8
      008347 10                    1573 	.db #0x10	; 16
      008348 E0                    1574 	.db #0xe0	; 224
      008349 00                    1575 	.db #0x00	; 0
      00834A 0F                    1576 	.db #0x0f	; 15
      00834B 10                    1577 	.db #0x10	; 16
      00834C 20                    1578 	.db #0x20	; 32
      00834D 20                    1579 	.db #0x20	; 32
      00834E 20                    1580 	.db #0x20	; 32
      00834F 10                    1581 	.db #0x10	; 16
      008350 0F                    1582 	.db #0x0f	; 15
      008351 00                    1583 	.db #0x00	; 0
      008352 08                    1584 	.db #0x08	; 8
      008353 F8                    1585 	.db #0xf8	; 248
      008354 08                    1586 	.db #0x08	; 8
      008355 08                    1587 	.db #0x08	; 8
      008356 08                    1588 	.db #0x08	; 8
      008357 08                    1589 	.db #0x08	; 8
      008358 F0                    1590 	.db #0xf0	; 240
      008359 00                    1591 	.db #0x00	; 0
      00835A 20                    1592 	.db #0x20	; 32
      00835B 3F                    1593 	.db #0x3f	; 63
      00835C 21                    1594 	.db #0x21	; 33
      00835D 01                    1595 	.db #0x01	; 1
      00835E 01                    1596 	.db #0x01	; 1
      00835F 01                    1597 	.db #0x01	; 1
      008360 00                    1598 	.db #0x00	; 0
      008361 00                    1599 	.db #0x00	; 0
      008362 E0                    1600 	.db #0xe0	; 224
      008363 10                    1601 	.db #0x10	; 16
      008364 08                    1602 	.db #0x08	; 8
      008365 08                    1603 	.db #0x08	; 8
      008366 08                    1604 	.db #0x08	; 8
      008367 10                    1605 	.db #0x10	; 16
      008368 E0                    1606 	.db #0xe0	; 224
      008369 00                    1607 	.db #0x00	; 0
      00836A 0F                    1608 	.db #0x0f	; 15
      00836B 18                    1609 	.db #0x18	; 24
      00836C 24                    1610 	.db #0x24	; 36
      00836D 24                    1611 	.db #0x24	; 36
      00836E 38                    1612 	.db #0x38	; 56	'8'
      00836F 50                    1613 	.db #0x50	; 80	'P'
      008370 4F                    1614 	.db #0x4f	; 79	'O'
      008371 00                    1615 	.db #0x00	; 0
      008372 08                    1616 	.db #0x08	; 8
      008373 F8                    1617 	.db #0xf8	; 248
      008374 88                    1618 	.db #0x88	; 136
      008375 88                    1619 	.db #0x88	; 136
      008376 88                    1620 	.db #0x88	; 136
      008377 88                    1621 	.db #0x88	; 136
      008378 70                    1622 	.db #0x70	; 112	'p'
      008379 00                    1623 	.db #0x00	; 0
      00837A 20                    1624 	.db #0x20	; 32
      00837B 3F                    1625 	.db #0x3f	; 63
      00837C 20                    1626 	.db #0x20	; 32
      00837D 00                    1627 	.db #0x00	; 0
      00837E 03                    1628 	.db #0x03	; 3
      00837F 0C                    1629 	.db #0x0c	; 12
      008380 30                    1630 	.db #0x30	; 48	'0'
      008381 20                    1631 	.db #0x20	; 32
      008382 00                    1632 	.db #0x00	; 0
      008383 70                    1633 	.db #0x70	; 112	'p'
      008384 88                    1634 	.db #0x88	; 136
      008385 08                    1635 	.db #0x08	; 8
      008386 08                    1636 	.db #0x08	; 8
      008387 08                    1637 	.db #0x08	; 8
      008388 38                    1638 	.db #0x38	; 56	'8'
      008389 00                    1639 	.db #0x00	; 0
      00838A 00                    1640 	.db #0x00	; 0
      00838B 38                    1641 	.db #0x38	; 56	'8'
      00838C 20                    1642 	.db #0x20	; 32
      00838D 21                    1643 	.db #0x21	; 33
      00838E 21                    1644 	.db #0x21	; 33
      00838F 22                    1645 	.db #0x22	; 34
      008390 1C                    1646 	.db #0x1c	; 28
      008391 00                    1647 	.db #0x00	; 0
      008392 18                    1648 	.db #0x18	; 24
      008393 08                    1649 	.db #0x08	; 8
      008394 08                    1650 	.db #0x08	; 8
      008395 F8                    1651 	.db #0xf8	; 248
      008396 08                    1652 	.db #0x08	; 8
      008397 08                    1653 	.db #0x08	; 8
      008398 18                    1654 	.db #0x18	; 24
      008399 00                    1655 	.db #0x00	; 0
      00839A 00                    1656 	.db #0x00	; 0
      00839B 00                    1657 	.db #0x00	; 0
      00839C 20                    1658 	.db #0x20	; 32
      00839D 3F                    1659 	.db #0x3f	; 63
      00839E 20                    1660 	.db #0x20	; 32
      00839F 00                    1661 	.db #0x00	; 0
      0083A0 00                    1662 	.db #0x00	; 0
      0083A1 00                    1663 	.db #0x00	; 0
      0083A2 08                    1664 	.db #0x08	; 8
      0083A3 F8                    1665 	.db #0xf8	; 248
      0083A4 08                    1666 	.db #0x08	; 8
      0083A5 00                    1667 	.db #0x00	; 0
      0083A6 00                    1668 	.db #0x00	; 0
      0083A7 08                    1669 	.db #0x08	; 8
      0083A8 F8                    1670 	.db #0xf8	; 248
      0083A9 08                    1671 	.db #0x08	; 8
      0083AA 00                    1672 	.db #0x00	; 0
      0083AB 1F                    1673 	.db #0x1f	; 31
      0083AC 20                    1674 	.db #0x20	; 32
      0083AD 20                    1675 	.db #0x20	; 32
      0083AE 20                    1676 	.db #0x20	; 32
      0083AF 20                    1677 	.db #0x20	; 32
      0083B0 1F                    1678 	.db #0x1f	; 31
      0083B1 00                    1679 	.db #0x00	; 0
      0083B2 08                    1680 	.db #0x08	; 8
      0083B3 78                    1681 	.db #0x78	; 120	'x'
      0083B4 88                    1682 	.db #0x88	; 136
      0083B5 00                    1683 	.db #0x00	; 0
      0083B6 00                    1684 	.db #0x00	; 0
      0083B7 C8                    1685 	.db #0xc8	; 200
      0083B8 38                    1686 	.db #0x38	; 56	'8'
      0083B9 08                    1687 	.db #0x08	; 8
      0083BA 00                    1688 	.db #0x00	; 0
      0083BB 00                    1689 	.db #0x00	; 0
      0083BC 07                    1690 	.db #0x07	; 7
      0083BD 38                    1691 	.db #0x38	; 56	'8'
      0083BE 0E                    1692 	.db #0x0e	; 14
      0083BF 01                    1693 	.db #0x01	; 1
      0083C0 00                    1694 	.db #0x00	; 0
      0083C1 00                    1695 	.db #0x00	; 0
      0083C2 F8                    1696 	.db #0xf8	; 248
      0083C3 08                    1697 	.db #0x08	; 8
      0083C4 00                    1698 	.db #0x00	; 0
      0083C5 F8                    1699 	.db #0xf8	; 248
      0083C6 00                    1700 	.db #0x00	; 0
      0083C7 08                    1701 	.db #0x08	; 8
      0083C8 F8                    1702 	.db #0xf8	; 248
      0083C9 00                    1703 	.db #0x00	; 0
      0083CA 03                    1704 	.db #0x03	; 3
      0083CB 3C                    1705 	.db #0x3c	; 60
      0083CC 07                    1706 	.db #0x07	; 7
      0083CD 00                    1707 	.db #0x00	; 0
      0083CE 07                    1708 	.db #0x07	; 7
      0083CF 3C                    1709 	.db #0x3c	; 60
      0083D0 03                    1710 	.db #0x03	; 3
      0083D1 00                    1711 	.db #0x00	; 0
      0083D2 08                    1712 	.db #0x08	; 8
      0083D3 18                    1713 	.db #0x18	; 24
      0083D4 68                    1714 	.db #0x68	; 104	'h'
      0083D5 80                    1715 	.db #0x80	; 128
      0083D6 80                    1716 	.db #0x80	; 128
      0083D7 68                    1717 	.db #0x68	; 104	'h'
      0083D8 18                    1718 	.db #0x18	; 24
      0083D9 08                    1719 	.db #0x08	; 8
      0083DA 20                    1720 	.db #0x20	; 32
      0083DB 30                    1721 	.db #0x30	; 48	'0'
      0083DC 2C                    1722 	.db #0x2c	; 44
      0083DD 03                    1723 	.db #0x03	; 3
      0083DE 03                    1724 	.db #0x03	; 3
      0083DF 2C                    1725 	.db #0x2c	; 44
      0083E0 30                    1726 	.db #0x30	; 48	'0'
      0083E1 20                    1727 	.db #0x20	; 32
      0083E2 08                    1728 	.db #0x08	; 8
      0083E3 38                    1729 	.db #0x38	; 56	'8'
      0083E4 C8                    1730 	.db #0xc8	; 200
      0083E5 00                    1731 	.db #0x00	; 0
      0083E6 C8                    1732 	.db #0xc8	; 200
      0083E7 38                    1733 	.db #0x38	; 56	'8'
      0083E8 08                    1734 	.db #0x08	; 8
      0083E9 00                    1735 	.db #0x00	; 0
      0083EA 00                    1736 	.db #0x00	; 0
      0083EB 00                    1737 	.db #0x00	; 0
      0083EC 20                    1738 	.db #0x20	; 32
      0083ED 3F                    1739 	.db #0x3f	; 63
      0083EE 20                    1740 	.db #0x20	; 32
      0083EF 00                    1741 	.db #0x00	; 0
      0083F0 00                    1742 	.db #0x00	; 0
      0083F1 00                    1743 	.db #0x00	; 0
      0083F2 10                    1744 	.db #0x10	; 16
      0083F3 08                    1745 	.db #0x08	; 8
      0083F4 08                    1746 	.db #0x08	; 8
      0083F5 08                    1747 	.db #0x08	; 8
      0083F6 C8                    1748 	.db #0xc8	; 200
      0083F7 38                    1749 	.db #0x38	; 56	'8'
      0083F8 08                    1750 	.db #0x08	; 8
      0083F9 00                    1751 	.db #0x00	; 0
      0083FA 20                    1752 	.db #0x20	; 32
      0083FB 38                    1753 	.db #0x38	; 56	'8'
      0083FC 26                    1754 	.db #0x26	; 38
      0083FD 21                    1755 	.db #0x21	; 33
      0083FE 20                    1756 	.db #0x20	; 32
      0083FF 20                    1757 	.db #0x20	; 32
      008400 18                    1758 	.db #0x18	; 24
      008401 00                    1759 	.db #0x00	; 0
      008402 00                    1760 	.db #0x00	; 0
      008403 00                    1761 	.db #0x00	; 0
      008404 00                    1762 	.db #0x00	; 0
      008405 FE                    1763 	.db #0xfe	; 254
      008406 02                    1764 	.db #0x02	; 2
      008407 02                    1765 	.db #0x02	; 2
      008408 02                    1766 	.db #0x02	; 2
      008409 00                    1767 	.db #0x00	; 0
      00840A 00                    1768 	.db #0x00	; 0
      00840B 00                    1769 	.db #0x00	; 0
      00840C 00                    1770 	.db #0x00	; 0
      00840D 7F                    1771 	.db #0x7f	; 127
      00840E 40                    1772 	.db #0x40	; 64
      00840F 40                    1773 	.db #0x40	; 64
      008410 40                    1774 	.db #0x40	; 64
      008411 00                    1775 	.db #0x00	; 0
      008412 00                    1776 	.db #0x00	; 0
      008413 0C                    1777 	.db #0x0c	; 12
      008414 30                    1778 	.db #0x30	; 48	'0'
      008415 C0                    1779 	.db #0xc0	; 192
      008416 00                    1780 	.db #0x00	; 0
      008417 00                    1781 	.db #0x00	; 0
      008418 00                    1782 	.db #0x00	; 0
      008419 00                    1783 	.db #0x00	; 0
      00841A 00                    1784 	.db #0x00	; 0
      00841B 00                    1785 	.db #0x00	; 0
      00841C 00                    1786 	.db #0x00	; 0
      00841D 01                    1787 	.db #0x01	; 1
      00841E 06                    1788 	.db #0x06	; 6
      00841F 38                    1789 	.db #0x38	; 56	'8'
      008420 C0                    1790 	.db #0xc0	; 192
      008421 00                    1791 	.db #0x00	; 0
      008422 00                    1792 	.db #0x00	; 0
      008423 02                    1793 	.db #0x02	; 2
      008424 02                    1794 	.db #0x02	; 2
      008425 02                    1795 	.db #0x02	; 2
      008426 FE                    1796 	.db #0xfe	; 254
      008427 00                    1797 	.db #0x00	; 0
      008428 00                    1798 	.db #0x00	; 0
      008429 00                    1799 	.db #0x00	; 0
      00842A 00                    1800 	.db #0x00	; 0
      00842B 40                    1801 	.db #0x40	; 64
      00842C 40                    1802 	.db #0x40	; 64
      00842D 40                    1803 	.db #0x40	; 64
      00842E 7F                    1804 	.db #0x7f	; 127
      00842F 00                    1805 	.db #0x00	; 0
      008430 00                    1806 	.db #0x00	; 0
      008431 00                    1807 	.db #0x00	; 0
      008432 00                    1808 	.db #0x00	; 0
      008433 00                    1809 	.db #0x00	; 0
      008434 04                    1810 	.db #0x04	; 4
      008435 02                    1811 	.db #0x02	; 2
      008436 02                    1812 	.db #0x02	; 2
      008437 02                    1813 	.db #0x02	; 2
      008438 04                    1814 	.db #0x04	; 4
      008439 00                    1815 	.db #0x00	; 0
      00843A 00                    1816 	.db #0x00	; 0
      00843B 00                    1817 	.db #0x00	; 0
      00843C 00                    1818 	.db #0x00	; 0
      00843D 00                    1819 	.db #0x00	; 0
      00843E 00                    1820 	.db #0x00	; 0
      00843F 00                    1821 	.db #0x00	; 0
      008440 00                    1822 	.db #0x00	; 0
      008441 00                    1823 	.db #0x00	; 0
      008442 00                    1824 	.db #0x00	; 0
      008443 00                    1825 	.db #0x00	; 0
      008444 00                    1826 	.db #0x00	; 0
      008445 00                    1827 	.db #0x00	; 0
      008446 00                    1828 	.db #0x00	; 0
      008447 00                    1829 	.db #0x00	; 0
      008448 00                    1830 	.db #0x00	; 0
      008449 00                    1831 	.db #0x00	; 0
      00844A 80                    1832 	.db #0x80	; 128
      00844B 80                    1833 	.db #0x80	; 128
      00844C 80                    1834 	.db #0x80	; 128
      00844D 80                    1835 	.db #0x80	; 128
      00844E 80                    1836 	.db #0x80	; 128
      00844F 80                    1837 	.db #0x80	; 128
      008450 80                    1838 	.db #0x80	; 128
      008451 80                    1839 	.db #0x80	; 128
      008452 00                    1840 	.db #0x00	; 0
      008453 02                    1841 	.db #0x02	; 2
      008454 02                    1842 	.db #0x02	; 2
      008455 04                    1843 	.db #0x04	; 4
      008456 00                    1844 	.db #0x00	; 0
      008457 00                    1845 	.db #0x00	; 0
      008458 00                    1846 	.db #0x00	; 0
      008459 00                    1847 	.db #0x00	; 0
      00845A 00                    1848 	.db #0x00	; 0
      00845B 00                    1849 	.db #0x00	; 0
      00845C 00                    1850 	.db #0x00	; 0
      00845D 00                    1851 	.db #0x00	; 0
      00845E 00                    1852 	.db #0x00	; 0
      00845F 00                    1853 	.db #0x00	; 0
      008460 00                    1854 	.db #0x00	; 0
      008461 00                    1855 	.db #0x00	; 0
      008462 00                    1856 	.db #0x00	; 0
      008463 00                    1857 	.db #0x00	; 0
      008464 80                    1858 	.db #0x80	; 128
      008465 80                    1859 	.db #0x80	; 128
      008466 80                    1860 	.db #0x80	; 128
      008467 80                    1861 	.db #0x80	; 128
      008468 00                    1862 	.db #0x00	; 0
      008469 00                    1863 	.db #0x00	; 0
      00846A 00                    1864 	.db #0x00	; 0
      00846B 19                    1865 	.db #0x19	; 25
      00846C 24                    1866 	.db #0x24	; 36
      00846D 22                    1867 	.db #0x22	; 34
      00846E 22                    1868 	.db #0x22	; 34
      00846F 22                    1869 	.db #0x22	; 34
      008470 3F                    1870 	.db #0x3f	; 63
      008471 20                    1871 	.db #0x20	; 32
      008472 08                    1872 	.db #0x08	; 8
      008473 F8                    1873 	.db #0xf8	; 248
      008474 00                    1874 	.db #0x00	; 0
      008475 80                    1875 	.db #0x80	; 128
      008476 80                    1876 	.db #0x80	; 128
      008477 00                    1877 	.db #0x00	; 0
      008478 00                    1878 	.db #0x00	; 0
      008479 00                    1879 	.db #0x00	; 0
      00847A 00                    1880 	.db #0x00	; 0
      00847B 3F                    1881 	.db #0x3f	; 63
      00847C 11                    1882 	.db #0x11	; 17
      00847D 20                    1883 	.db #0x20	; 32
      00847E 20                    1884 	.db #0x20	; 32
      00847F 11                    1885 	.db #0x11	; 17
      008480 0E                    1886 	.db #0x0e	; 14
      008481 00                    1887 	.db #0x00	; 0
      008482 00                    1888 	.db #0x00	; 0
      008483 00                    1889 	.db #0x00	; 0
      008484 00                    1890 	.db #0x00	; 0
      008485 80                    1891 	.db #0x80	; 128
      008486 80                    1892 	.db #0x80	; 128
      008487 80                    1893 	.db #0x80	; 128
      008488 00                    1894 	.db #0x00	; 0
      008489 00                    1895 	.db #0x00	; 0
      00848A 00                    1896 	.db #0x00	; 0
      00848B 0E                    1897 	.db #0x0e	; 14
      00848C 11                    1898 	.db #0x11	; 17
      00848D 20                    1899 	.db #0x20	; 32
      00848E 20                    1900 	.db #0x20	; 32
      00848F 20                    1901 	.db #0x20	; 32
      008490 11                    1902 	.db #0x11	; 17
      008491 00                    1903 	.db #0x00	; 0
      008492 00                    1904 	.db #0x00	; 0
      008493 00                    1905 	.db #0x00	; 0
      008494 00                    1906 	.db #0x00	; 0
      008495 80                    1907 	.db #0x80	; 128
      008496 80                    1908 	.db #0x80	; 128
      008497 88                    1909 	.db #0x88	; 136
      008498 F8                    1910 	.db #0xf8	; 248
      008499 00                    1911 	.db #0x00	; 0
      00849A 00                    1912 	.db #0x00	; 0
      00849B 0E                    1913 	.db #0x0e	; 14
      00849C 11                    1914 	.db #0x11	; 17
      00849D 20                    1915 	.db #0x20	; 32
      00849E 20                    1916 	.db #0x20	; 32
      00849F 10                    1917 	.db #0x10	; 16
      0084A0 3F                    1918 	.db #0x3f	; 63
      0084A1 20                    1919 	.db #0x20	; 32
      0084A2 00                    1920 	.db #0x00	; 0
      0084A3 00                    1921 	.db #0x00	; 0
      0084A4 80                    1922 	.db #0x80	; 128
      0084A5 80                    1923 	.db #0x80	; 128
      0084A6 80                    1924 	.db #0x80	; 128
      0084A7 80                    1925 	.db #0x80	; 128
      0084A8 00                    1926 	.db #0x00	; 0
      0084A9 00                    1927 	.db #0x00	; 0
      0084AA 00                    1928 	.db #0x00	; 0
      0084AB 1F                    1929 	.db #0x1f	; 31
      0084AC 22                    1930 	.db #0x22	; 34
      0084AD 22                    1931 	.db #0x22	; 34
      0084AE 22                    1932 	.db #0x22	; 34
      0084AF 22                    1933 	.db #0x22	; 34
      0084B0 13                    1934 	.db #0x13	; 19
      0084B1 00                    1935 	.db #0x00	; 0
      0084B2 00                    1936 	.db #0x00	; 0
      0084B3 80                    1937 	.db #0x80	; 128
      0084B4 80                    1938 	.db #0x80	; 128
      0084B5 F0                    1939 	.db #0xf0	; 240
      0084B6 88                    1940 	.db #0x88	; 136
      0084B7 88                    1941 	.db #0x88	; 136
      0084B8 88                    1942 	.db #0x88	; 136
      0084B9 18                    1943 	.db #0x18	; 24
      0084BA 00                    1944 	.db #0x00	; 0
      0084BB 20                    1945 	.db #0x20	; 32
      0084BC 20                    1946 	.db #0x20	; 32
      0084BD 3F                    1947 	.db #0x3f	; 63
      0084BE 20                    1948 	.db #0x20	; 32
      0084BF 20                    1949 	.db #0x20	; 32
      0084C0 00                    1950 	.db #0x00	; 0
      0084C1 00                    1951 	.db #0x00	; 0
      0084C2 00                    1952 	.db #0x00	; 0
      0084C3 00                    1953 	.db #0x00	; 0
      0084C4 80                    1954 	.db #0x80	; 128
      0084C5 80                    1955 	.db #0x80	; 128
      0084C6 80                    1956 	.db #0x80	; 128
      0084C7 80                    1957 	.db #0x80	; 128
      0084C8 80                    1958 	.db #0x80	; 128
      0084C9 00                    1959 	.db #0x00	; 0
      0084CA 00                    1960 	.db #0x00	; 0
      0084CB 6B                    1961 	.db #0x6b	; 107	'k'
      0084CC 94                    1962 	.db #0x94	; 148
      0084CD 94                    1963 	.db #0x94	; 148
      0084CE 94                    1964 	.db #0x94	; 148
      0084CF 93                    1965 	.db #0x93	; 147
      0084D0 60                    1966 	.db #0x60	; 96
      0084D1 00                    1967 	.db #0x00	; 0
      0084D2 08                    1968 	.db #0x08	; 8
      0084D3 F8                    1969 	.db #0xf8	; 248
      0084D4 00                    1970 	.db #0x00	; 0
      0084D5 80                    1971 	.db #0x80	; 128
      0084D6 80                    1972 	.db #0x80	; 128
      0084D7 80                    1973 	.db #0x80	; 128
      0084D8 00                    1974 	.db #0x00	; 0
      0084D9 00                    1975 	.db #0x00	; 0
      0084DA 20                    1976 	.db #0x20	; 32
      0084DB 3F                    1977 	.db #0x3f	; 63
      0084DC 21                    1978 	.db #0x21	; 33
      0084DD 00                    1979 	.db #0x00	; 0
      0084DE 00                    1980 	.db #0x00	; 0
      0084DF 20                    1981 	.db #0x20	; 32
      0084E0 3F                    1982 	.db #0x3f	; 63
      0084E1 20                    1983 	.db #0x20	; 32
      0084E2 00                    1984 	.db #0x00	; 0
      0084E3 80                    1985 	.db #0x80	; 128
      0084E4 98                    1986 	.db #0x98	; 152
      0084E5 98                    1987 	.db #0x98	; 152
      0084E6 00                    1988 	.db #0x00	; 0
      0084E7 00                    1989 	.db #0x00	; 0
      0084E8 00                    1990 	.db #0x00	; 0
      0084E9 00                    1991 	.db #0x00	; 0
      0084EA 00                    1992 	.db #0x00	; 0
      0084EB 20                    1993 	.db #0x20	; 32
      0084EC 20                    1994 	.db #0x20	; 32
      0084ED 3F                    1995 	.db #0x3f	; 63
      0084EE 20                    1996 	.db #0x20	; 32
      0084EF 20                    1997 	.db #0x20	; 32
      0084F0 00                    1998 	.db #0x00	; 0
      0084F1 00                    1999 	.db #0x00	; 0
      0084F2 00                    2000 	.db #0x00	; 0
      0084F3 00                    2001 	.db #0x00	; 0
      0084F4 00                    2002 	.db #0x00	; 0
      0084F5 80                    2003 	.db #0x80	; 128
      0084F6 98                    2004 	.db #0x98	; 152
      0084F7 98                    2005 	.db #0x98	; 152
      0084F8 00                    2006 	.db #0x00	; 0
      0084F9 00                    2007 	.db #0x00	; 0
      0084FA 00                    2008 	.db #0x00	; 0
      0084FB C0                    2009 	.db #0xc0	; 192
      0084FC 80                    2010 	.db #0x80	; 128
      0084FD 80                    2011 	.db #0x80	; 128
      0084FE 80                    2012 	.db #0x80	; 128
      0084FF 7F                    2013 	.db #0x7f	; 127
      008500 00                    2014 	.db #0x00	; 0
      008501 00                    2015 	.db #0x00	; 0
      008502 08                    2016 	.db #0x08	; 8
      008503 F8                    2017 	.db #0xf8	; 248
      008504 00                    2018 	.db #0x00	; 0
      008505 00                    2019 	.db #0x00	; 0
      008506 80                    2020 	.db #0x80	; 128
      008507 80                    2021 	.db #0x80	; 128
      008508 80                    2022 	.db #0x80	; 128
      008509 00                    2023 	.db #0x00	; 0
      00850A 20                    2024 	.db #0x20	; 32
      00850B 3F                    2025 	.db #0x3f	; 63
      00850C 24                    2026 	.db #0x24	; 36
      00850D 02                    2027 	.db #0x02	; 2
      00850E 2D                    2028 	.db #0x2d	; 45
      00850F 30                    2029 	.db #0x30	; 48	'0'
      008510 20                    2030 	.db #0x20	; 32
      008511 00                    2031 	.db #0x00	; 0
      008512 00                    2032 	.db #0x00	; 0
      008513 08                    2033 	.db #0x08	; 8
      008514 08                    2034 	.db #0x08	; 8
      008515 F8                    2035 	.db #0xf8	; 248
      008516 00                    2036 	.db #0x00	; 0
      008517 00                    2037 	.db #0x00	; 0
      008518 00                    2038 	.db #0x00	; 0
      008519 00                    2039 	.db #0x00	; 0
      00851A 00                    2040 	.db #0x00	; 0
      00851B 20                    2041 	.db #0x20	; 32
      00851C 20                    2042 	.db #0x20	; 32
      00851D 3F                    2043 	.db #0x3f	; 63
      00851E 20                    2044 	.db #0x20	; 32
      00851F 20                    2045 	.db #0x20	; 32
      008520 00                    2046 	.db #0x00	; 0
      008521 00                    2047 	.db #0x00	; 0
      008522 80                    2048 	.db #0x80	; 128
      008523 80                    2049 	.db #0x80	; 128
      008524 80                    2050 	.db #0x80	; 128
      008525 80                    2051 	.db #0x80	; 128
      008526 80                    2052 	.db #0x80	; 128
      008527 80                    2053 	.db #0x80	; 128
      008528 80                    2054 	.db #0x80	; 128
      008529 00                    2055 	.db #0x00	; 0
      00852A 20                    2056 	.db #0x20	; 32
      00852B 3F                    2057 	.db #0x3f	; 63
      00852C 20                    2058 	.db #0x20	; 32
      00852D 00                    2059 	.db #0x00	; 0
      00852E 3F                    2060 	.db #0x3f	; 63
      00852F 20                    2061 	.db #0x20	; 32
      008530 00                    2062 	.db #0x00	; 0
      008531 3F                    2063 	.db #0x3f	; 63
      008532 80                    2064 	.db #0x80	; 128
      008533 80                    2065 	.db #0x80	; 128
      008534 00                    2066 	.db #0x00	; 0
      008535 80                    2067 	.db #0x80	; 128
      008536 80                    2068 	.db #0x80	; 128
      008537 80                    2069 	.db #0x80	; 128
      008538 00                    2070 	.db #0x00	; 0
      008539 00                    2071 	.db #0x00	; 0
      00853A 20                    2072 	.db #0x20	; 32
      00853B 3F                    2073 	.db #0x3f	; 63
      00853C 21                    2074 	.db #0x21	; 33
      00853D 00                    2075 	.db #0x00	; 0
      00853E 00                    2076 	.db #0x00	; 0
      00853F 20                    2077 	.db #0x20	; 32
      008540 3F                    2078 	.db #0x3f	; 63
      008541 20                    2079 	.db #0x20	; 32
      008542 00                    2080 	.db #0x00	; 0
      008543 00                    2081 	.db #0x00	; 0
      008544 80                    2082 	.db #0x80	; 128
      008545 80                    2083 	.db #0x80	; 128
      008546 80                    2084 	.db #0x80	; 128
      008547 80                    2085 	.db #0x80	; 128
      008548 00                    2086 	.db #0x00	; 0
      008549 00                    2087 	.db #0x00	; 0
      00854A 00                    2088 	.db #0x00	; 0
      00854B 1F                    2089 	.db #0x1f	; 31
      00854C 20                    2090 	.db #0x20	; 32
      00854D 20                    2091 	.db #0x20	; 32
      00854E 20                    2092 	.db #0x20	; 32
      00854F 20                    2093 	.db #0x20	; 32
      008550 1F                    2094 	.db #0x1f	; 31
      008551 00                    2095 	.db #0x00	; 0
      008552 80                    2096 	.db #0x80	; 128
      008553 80                    2097 	.db #0x80	; 128
      008554 00                    2098 	.db #0x00	; 0
      008555 80                    2099 	.db #0x80	; 128
      008556 80                    2100 	.db #0x80	; 128
      008557 00                    2101 	.db #0x00	; 0
      008558 00                    2102 	.db #0x00	; 0
      008559 00                    2103 	.db #0x00	; 0
      00855A 80                    2104 	.db #0x80	; 128
      00855B FF                    2105 	.db #0xff	; 255
      00855C A1                    2106 	.db #0xa1	; 161
      00855D 20                    2107 	.db #0x20	; 32
      00855E 20                    2108 	.db #0x20	; 32
      00855F 11                    2109 	.db #0x11	; 17
      008560 0E                    2110 	.db #0x0e	; 14
      008561 00                    2111 	.db #0x00	; 0
      008562 00                    2112 	.db #0x00	; 0
      008563 00                    2113 	.db #0x00	; 0
      008564 00                    2114 	.db #0x00	; 0
      008565 80                    2115 	.db #0x80	; 128
      008566 80                    2116 	.db #0x80	; 128
      008567 80                    2117 	.db #0x80	; 128
      008568 80                    2118 	.db #0x80	; 128
      008569 00                    2119 	.db #0x00	; 0
      00856A 00                    2120 	.db #0x00	; 0
      00856B 0E                    2121 	.db #0x0e	; 14
      00856C 11                    2122 	.db #0x11	; 17
      00856D 20                    2123 	.db #0x20	; 32
      00856E 20                    2124 	.db #0x20	; 32
      00856F A0                    2125 	.db #0xa0	; 160
      008570 FF                    2126 	.db #0xff	; 255
      008571 80                    2127 	.db #0x80	; 128
      008572 80                    2128 	.db #0x80	; 128
      008573 80                    2129 	.db #0x80	; 128
      008574 80                    2130 	.db #0x80	; 128
      008575 00                    2131 	.db #0x00	; 0
      008576 80                    2132 	.db #0x80	; 128
      008577 80                    2133 	.db #0x80	; 128
      008578 80                    2134 	.db #0x80	; 128
      008579 00                    2135 	.db #0x00	; 0
      00857A 20                    2136 	.db #0x20	; 32
      00857B 20                    2137 	.db #0x20	; 32
      00857C 3F                    2138 	.db #0x3f	; 63
      00857D 21                    2139 	.db #0x21	; 33
      00857E 20                    2140 	.db #0x20	; 32
      00857F 00                    2141 	.db #0x00	; 0
      008580 01                    2142 	.db #0x01	; 1
      008581 00                    2143 	.db #0x00	; 0
      008582 00                    2144 	.db #0x00	; 0
      008583 00                    2145 	.db #0x00	; 0
      008584 80                    2146 	.db #0x80	; 128
      008585 80                    2147 	.db #0x80	; 128
      008586 80                    2148 	.db #0x80	; 128
      008587 80                    2149 	.db #0x80	; 128
      008588 80                    2150 	.db #0x80	; 128
      008589 00                    2151 	.db #0x00	; 0
      00858A 00                    2152 	.db #0x00	; 0
      00858B 33                    2153 	.db #0x33	; 51	'3'
      00858C 24                    2154 	.db #0x24	; 36
      00858D 24                    2155 	.db #0x24	; 36
      00858E 24                    2156 	.db #0x24	; 36
      00858F 24                    2157 	.db #0x24	; 36
      008590 19                    2158 	.db #0x19	; 25
      008591 00                    2159 	.db #0x00	; 0
      008592 00                    2160 	.db #0x00	; 0
      008593 80                    2161 	.db #0x80	; 128
      008594 80                    2162 	.db #0x80	; 128
      008595 E0                    2163 	.db #0xe0	; 224
      008596 80                    2164 	.db #0x80	; 128
      008597 80                    2165 	.db #0x80	; 128
      008598 00                    2166 	.db #0x00	; 0
      008599 00                    2167 	.db #0x00	; 0
      00859A 00                    2168 	.db #0x00	; 0
      00859B 00                    2169 	.db #0x00	; 0
      00859C 00                    2170 	.db #0x00	; 0
      00859D 1F                    2171 	.db #0x1f	; 31
      00859E 20                    2172 	.db #0x20	; 32
      00859F 20                    2173 	.db #0x20	; 32
      0085A0 00                    2174 	.db #0x00	; 0
      0085A1 00                    2175 	.db #0x00	; 0
      0085A2 80                    2176 	.db #0x80	; 128
      0085A3 80                    2177 	.db #0x80	; 128
      0085A4 00                    2178 	.db #0x00	; 0
      0085A5 00                    2179 	.db #0x00	; 0
      0085A6 00                    2180 	.db #0x00	; 0
      0085A7 80                    2181 	.db #0x80	; 128
      0085A8 80                    2182 	.db #0x80	; 128
      0085A9 00                    2183 	.db #0x00	; 0
      0085AA 00                    2184 	.db #0x00	; 0
      0085AB 1F                    2185 	.db #0x1f	; 31
      0085AC 20                    2186 	.db #0x20	; 32
      0085AD 20                    2187 	.db #0x20	; 32
      0085AE 20                    2188 	.db #0x20	; 32
      0085AF 10                    2189 	.db #0x10	; 16
      0085B0 3F                    2190 	.db #0x3f	; 63
      0085B1 20                    2191 	.db #0x20	; 32
      0085B2 80                    2192 	.db #0x80	; 128
      0085B3 80                    2193 	.db #0x80	; 128
      0085B4 80                    2194 	.db #0x80	; 128
      0085B5 00                    2195 	.db #0x00	; 0
      0085B6 00                    2196 	.db #0x00	; 0
      0085B7 80                    2197 	.db #0x80	; 128
      0085B8 80                    2198 	.db #0x80	; 128
      0085B9 80                    2199 	.db #0x80	; 128
      0085BA 00                    2200 	.db #0x00	; 0
      0085BB 01                    2201 	.db #0x01	; 1
      0085BC 0E                    2202 	.db #0x0e	; 14
      0085BD 30                    2203 	.db #0x30	; 48	'0'
      0085BE 08                    2204 	.db #0x08	; 8
      0085BF 06                    2205 	.db #0x06	; 6
      0085C0 01                    2206 	.db #0x01	; 1
      0085C1 00                    2207 	.db #0x00	; 0
      0085C2 80                    2208 	.db #0x80	; 128
      0085C3 80                    2209 	.db #0x80	; 128
      0085C4 00                    2210 	.db #0x00	; 0
      0085C5 80                    2211 	.db #0x80	; 128
      0085C6 00                    2212 	.db #0x00	; 0
      0085C7 80                    2213 	.db #0x80	; 128
      0085C8 80                    2214 	.db #0x80	; 128
      0085C9 80                    2215 	.db #0x80	; 128
      0085CA 0F                    2216 	.db #0x0f	; 15
      0085CB 30                    2217 	.db #0x30	; 48	'0'
      0085CC 0C                    2218 	.db #0x0c	; 12
      0085CD 03                    2219 	.db #0x03	; 3
      0085CE 0C                    2220 	.db #0x0c	; 12
      0085CF 30                    2221 	.db #0x30	; 48	'0'
      0085D0 0F                    2222 	.db #0x0f	; 15
      0085D1 00                    2223 	.db #0x00	; 0
      0085D2 00                    2224 	.db #0x00	; 0
      0085D3 80                    2225 	.db #0x80	; 128
      0085D4 80                    2226 	.db #0x80	; 128
      0085D5 00                    2227 	.db #0x00	; 0
      0085D6 80                    2228 	.db #0x80	; 128
      0085D7 80                    2229 	.db #0x80	; 128
      0085D8 80                    2230 	.db #0x80	; 128
      0085D9 00                    2231 	.db #0x00	; 0
      0085DA 00                    2232 	.db #0x00	; 0
      0085DB 20                    2233 	.db #0x20	; 32
      0085DC 31                    2234 	.db #0x31	; 49	'1'
      0085DD 2E                    2235 	.db #0x2e	; 46
      0085DE 0E                    2236 	.db #0x0e	; 14
      0085DF 31                    2237 	.db #0x31	; 49	'1'
      0085E0 20                    2238 	.db #0x20	; 32
      0085E1 00                    2239 	.db #0x00	; 0
      0085E2 80                    2240 	.db #0x80	; 128
      0085E3 80                    2241 	.db #0x80	; 128
      0085E4 80                    2242 	.db #0x80	; 128
      0085E5 00                    2243 	.db #0x00	; 0
      0085E6 00                    2244 	.db #0x00	; 0
      0085E7 80                    2245 	.db #0x80	; 128
      0085E8 80                    2246 	.db #0x80	; 128
      0085E9 80                    2247 	.db #0x80	; 128
      0085EA 80                    2248 	.db #0x80	; 128
      0085EB 81                    2249 	.db #0x81	; 129
      0085EC 8E                    2250 	.db #0x8e	; 142
      0085ED 70                    2251 	.db #0x70	; 112	'p'
      0085EE 18                    2252 	.db #0x18	; 24
      0085EF 06                    2253 	.db #0x06	; 6
      0085F0 01                    2254 	.db #0x01	; 1
      0085F1 00                    2255 	.db #0x00	; 0
      0085F2 00                    2256 	.db #0x00	; 0
      0085F3 80                    2257 	.db #0x80	; 128
      0085F4 80                    2258 	.db #0x80	; 128
      0085F5 80                    2259 	.db #0x80	; 128
      0085F6 80                    2260 	.db #0x80	; 128
      0085F7 80                    2261 	.db #0x80	; 128
      0085F8 80                    2262 	.db #0x80	; 128
      0085F9 00                    2263 	.db #0x00	; 0
      0085FA 00                    2264 	.db #0x00	; 0
      0085FB 21                    2265 	.db #0x21	; 33
      0085FC 30                    2266 	.db #0x30	; 48	'0'
      0085FD 2C                    2267 	.db #0x2c	; 44
      0085FE 22                    2268 	.db #0x22	; 34
      0085FF 21                    2269 	.db #0x21	; 33
      008600 30                    2270 	.db #0x30	; 48	'0'
      008601 00                    2271 	.db #0x00	; 0
      008602 00                    2272 	.db #0x00	; 0
      008603 00                    2273 	.db #0x00	; 0
      008604 00                    2274 	.db #0x00	; 0
      008605 00                    2275 	.db #0x00	; 0
      008606 80                    2276 	.db #0x80	; 128
      008607 7C                    2277 	.db #0x7c	; 124
      008608 02                    2278 	.db #0x02	; 2
      008609 02                    2279 	.db #0x02	; 2
      00860A 00                    2280 	.db #0x00	; 0
      00860B 00                    2281 	.db #0x00	; 0
      00860C 00                    2282 	.db #0x00	; 0
      00860D 00                    2283 	.db #0x00	; 0
      00860E 00                    2284 	.db #0x00	; 0
      00860F 3F                    2285 	.db #0x3f	; 63
      008610 40                    2286 	.db #0x40	; 64
      008611 40                    2287 	.db #0x40	; 64
      008612 00                    2288 	.db #0x00	; 0
      008613 00                    2289 	.db #0x00	; 0
      008614 00                    2290 	.db #0x00	; 0
      008615 00                    2291 	.db #0x00	; 0
      008616 FF                    2292 	.db #0xff	; 255
      008617 00                    2293 	.db #0x00	; 0
      008618 00                    2294 	.db #0x00	; 0
      008619 00                    2295 	.db #0x00	; 0
      00861A 00                    2296 	.db #0x00	; 0
      00861B 00                    2297 	.db #0x00	; 0
      00861C 00                    2298 	.db #0x00	; 0
      00861D 00                    2299 	.db #0x00	; 0
      00861E FF                    2300 	.db #0xff	; 255
      00861F 00                    2301 	.db #0x00	; 0
      008620 00                    2302 	.db #0x00	; 0
      008621 00                    2303 	.db #0x00	; 0
      008622 00                    2304 	.db #0x00	; 0
      008623 02                    2305 	.db #0x02	; 2
      008624 02                    2306 	.db #0x02	; 2
      008625 7C                    2307 	.db #0x7c	; 124
      008626 80                    2308 	.db #0x80	; 128
      008627 00                    2309 	.db #0x00	; 0
      008628 00                    2310 	.db #0x00	; 0
      008629 00                    2311 	.db #0x00	; 0
      00862A 00                    2312 	.db #0x00	; 0
      00862B 40                    2313 	.db #0x40	; 64
      00862C 40                    2314 	.db #0x40	; 64
      00862D 3F                    2315 	.db #0x3f	; 63
      00862E 00                    2316 	.db #0x00	; 0
      00862F 00                    2317 	.db #0x00	; 0
      008630 00                    2318 	.db #0x00	; 0
      008631 00                    2319 	.db #0x00	; 0
      008632 00                    2320 	.db #0x00	; 0
      008633 06                    2321 	.db #0x06	; 6
      008634 01                    2322 	.db #0x01	; 1
      008635 01                    2323 	.db #0x01	; 1
      008636 02                    2324 	.db #0x02	; 2
      008637 02                    2325 	.db #0x02	; 2
      008638 04                    2326 	.db #0x04	; 4
      008639 04                    2327 	.db #0x04	; 4
      00863A 00                    2328 	.db #0x00	; 0
      00863B 00                    2329 	.db #0x00	; 0
      00863C 00                    2330 	.db #0x00	; 0
      00863D 00                    2331 	.db #0x00	; 0
      00863E 00                    2332 	.db #0x00	; 0
      00863F 00                    2333 	.db #0x00	; 0
      008640 00                    2334 	.db #0x00	; 0
      008641 00                    2335 	.db #0x00	; 0
                                   2336 	.area INITIALIZER
                                   2337 	.area CABS (ABS)
