                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module app
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _Is_In_Area
                                     12 	.globl _sprintf
                                     13 	.globl _OLED_ShowString
                                     14 	.globl _OLED_Clear
                                     15 	.globl _beep_off
                                     16 	.globl _beep_on
                                     17 	.globl _beep_read
                                     18 	.globl _eeprom_write
                                     19 	.globl _eeprom_read
                                     20 	.globl _ds1302_write_time
                                     21 	.globl _relay_off
                                     22 	.globl _relay_on
                                     23 	.globl _relay_read
                                     24 	.globl _app_init
                                     25 	.globl _app_loop
                                     26 ;--------------------------------------------------------
                                     27 ; ram data
                                     28 ;--------------------------------------------------------
                                     29 	.area DATA
      00001B                         30 _Is_In_Area_flag_65536_384:
      00001B                         31 	.ds 1
      00001C                         32 _app_loop_status_65536_386:
      00001C                         33 	.ds 2
      00001E                         34 _app_loop_adcH_131072_387:
      00001E                         35 	.ds 1
      00001F                         36 _app_loop_adcL_131072_387:
      00001F                         37 	.ds 1
      000020                         38 _app_loop_h_131072_387:
      000020                         39 	.ds 1
      000021                         40 _app_loop_m_131072_387:
      000021                         41 	.ds 1
      000022                         42 _app_loop_s_131072_387:
      000022                         43 	.ds 1
      000023                         44 _app_loop_i_131072_387:
      000023                         45 	.ds 1
      000024                         46 _app_loop_beep_flag_131072_387:
      000024                         47 	.ds 1
      000025                         48 _app_loop_relay_flag_131072_387:
      000025                         49 	.ds 1
      000026                         50 _app_loop_baseadd_262144_389:
      000026                         51 	.ds 2
      000028                         52 _app_loop_data_327680_390:
      000028                         53 	.ds 1
      000029                         54 _app_loop_conbase_327680_390:
      000029                         55 	.ds 1
      00002A                         56 _app_loop_is_rule_on_196608_411:
      00002A                         57 	.ds 1
      00002B                         58 _app_loop_h_262144_421:
      00002B                         59 	.ds 1
      00002C                         60 _app_loop_m_262144_427:
      00002C                         61 	.ds 1
      00002D                         62 _app_loop_temp_131072_432:
      00002D                         63 	.ds 100
      000091                         64 _app_loop_i_131072_432:
      000091                         65 	.ds 1
                                     66 ;--------------------------------------------------------
                                     67 ; ram data
                                     68 ;--------------------------------------------------------
                                     69 	.area INITIALIZED
                                     70 ;--------------------------------------------------------
                                     71 ; absolute external ram data
                                     72 ;--------------------------------------------------------
                                     73 	.area DABS (ABS)
                                     74 
                                     75 ; default segment ordering for linker
                                     76 	.area HOME
                                     77 	.area GSINIT
                                     78 	.area GSFINAL
                                     79 	.area CONST
                                     80 	.area INITIALIZER
                                     81 	.area CODE
                                     82 
                                     83 ;--------------------------------------------------------
                                     84 ; global & static initialisations
                                     85 ;--------------------------------------------------------
                                     86 	.area HOME
                                     87 	.area GSINIT
                                     88 	.area GSFINAL
                                     89 	.area GSINIT
                                     90 ;--------------------------------------------------------
                                     91 ; Home
                                     92 ;--------------------------------------------------------
                                     93 	.area HOME
                                     94 	.area HOME
                                     95 ;--------------------------------------------------------
                                     96 ; code
                                     97 ;--------------------------------------------------------
                                     98 	.area CODE
                                     99 ;	driver/app.c: 4: u8 Is_In_Area(u16 rule_address,u8 data)
                                    100 ;	-----------------------------------------
                                    101 ;	 function Is_In_Area
                                    102 ;	-----------------------------------------
      0094AE                        103 _Is_In_Area:
      0094AE 52 08            [ 2]  104 	sub	sp, #8
                                    105 ;	driver/app.c: 7: flag=0;
      0094B0 72 5F 00 1B      [ 1]  106 	clr	_Is_In_Area_flag_65536_384+0
                                    107 ;	driver/app.c: 8: if(data<eeprom_read(rule_address)) flag|=0x01;//置位0
      0094B4 1E 0B            [ 2]  108 	ldw	x, (0x0b, sp)
      0094B6 0F 02            [ 1]  109 	clr	(0x02, sp)
      0094B8 0F 01            [ 1]  110 	clr	(0x01, sp)
      0094BA 89               [ 2]  111 	pushw	x
      0094BB 89               [ 2]  112 	pushw	x
      0094BC 16 05            [ 2]  113 	ldw	y, (0x05, sp)
      0094BE 90 89            [ 2]  114 	pushw	y
      0094C0 CD 8F 0E         [ 4]  115 	call	_eeprom_read
      0094C3 5B 04            [ 2]  116 	addw	sp, #4
      0094C5 85               [ 2]  117 	popw	x
      0094C6 11 0D            [ 1]  118 	cp	a, (0x0d, sp)
      0094C8 23 0B            [ 2]  119 	jrule	00102$
      0094CA C6 00 1B         [ 1]  120 	ld	a, _Is_In_Area_flag_65536_384+0
      0094CD 61               [ 1]  121 	exg	a, yl
      0094CE 4F               [ 1]  122 	clr	a
      0094CF 61               [ 1]  123 	exg	a, yl
      0094D0 AA 01            [ 1]  124 	or	a, #0x01
      0094D2 C7 00 1B         [ 1]  125 	ld	_Is_In_Area_flag_65536_384+0, a
      0094D5                        126 00102$:
                                    127 ;	driver/app.c: 9: if(eeprom_read(rule_address)<=data && data <=eeprom_read(rule_address+1)) flag|=0x02;//置位1
      0094D5 89               [ 2]  128 	pushw	x
      0094D6 1E 03            [ 2]  129 	ldw	x, (0x03, sp)
      0094D8 89               [ 2]  130 	pushw	x
      0094D9 CD 8F 0E         [ 4]  131 	call	_eeprom_read
      0094DC 5B 04            [ 2]  132 	addw	sp, #4
      0094DE 1E 0B            [ 2]  133 	ldw	x, (0x0b, sp)
      0094E0 5C               [ 1]  134 	incw	x
      0094E1 0F 06            [ 1]  135 	clr	(0x06, sp)
      0094E3 0F 05            [ 1]  136 	clr	(0x05, sp)
      0094E5 11 0D            [ 1]  137 	cp	a, (0x0d, sp)
      0094E7 22 1B            [ 1]  138 	jrugt	00104$
      0094E9 89               [ 2]  139 	pushw	x
      0094EA 89               [ 2]  140 	pushw	x
      0094EB 16 09            [ 2]  141 	ldw	y, (0x09, sp)
      0094ED 90 89            [ 2]  142 	pushw	y
      0094EF CD 8F 0E         [ 4]  143 	call	_eeprom_read
      0094F2 5B 04            [ 2]  144 	addw	sp, #4
      0094F4 85               [ 2]  145 	popw	x
      0094F5 11 0D            [ 1]  146 	cp	a, (0x0d, sp)
      0094F7 25 0B            [ 1]  147 	jrc	00104$
      0094F9 C6 00 1B         [ 1]  148 	ld	a, _Is_In_Area_flag_65536_384+0
      0094FC 61               [ 1]  149 	exg	a, yl
      0094FD 4F               [ 1]  150 	clr	a
      0094FE 61               [ 1]  151 	exg	a, yl
      0094FF AA 02            [ 1]  152 	or	a, #0x02
      009501 C7 00 1B         [ 1]  153 	ld	_Is_In_Area_flag_65536_384+0, a
      009504                        154 00104$:
                                    155 ;	driver/app.c: 10: if(eeprom_read(rule_address+1)<data) flag|=0x04;
      009504 89               [ 2]  156 	pushw	x
      009505 1E 07            [ 2]  157 	ldw	x, (0x07, sp)
      009507 89               [ 2]  158 	pushw	x
      009508 CD 8F 0E         [ 4]  159 	call	_eeprom_read
      00950B 5B 04            [ 2]  160 	addw	sp, #4
      00950D 11 0D            [ 1]  161 	cp	a, (0x0d, sp)
      00950F 24 0B            [ 1]  162 	jrnc	00107$
      009511 C6 00 1B         [ 1]  163 	ld	a, _Is_In_Area_flag_65536_384+0
      009514 41               [ 1]  164 	exg	a, xl
      009515 4F               [ 1]  165 	clr	a
      009516 41               [ 1]  166 	exg	a, xl
      009517 AA 04            [ 1]  167 	or	a, #0x04
      009519 C7 00 1B         [ 1]  168 	ld	_Is_In_Area_flag_65536_384+0, a
      00951C                        169 00107$:
                                    170 ;	driver/app.c: 11: if((eeprom_read(rule_address+2)&flag)) return 1;
      00951C 16 0B            [ 2]  171 	ldw	y, (0x0b, sp)
      00951E 72 A9 00 02      [ 2]  172 	addw	y, #0x0002
      009522 5F               [ 1]  173 	clrw	x
      009523 90 89            [ 2]  174 	pushw	y
      009525 89               [ 2]  175 	pushw	x
      009526 CD 8F 0E         [ 4]  176 	call	_eeprom_read
      009529 5B 04            [ 2]  177 	addw	sp, #4
      00952B C4 00 1B         [ 1]  178 	and	a, _Is_In_Area_flag_65536_384+0
      00952E 27 03            [ 1]  179 	jreq	00109$
      009530 A6 01            [ 1]  180 	ld	a, #0x01
                                    181 ;	driver/app.c: 12: else return 0;
      009532 21                     182 	.byte 0x21
      009533                        183 00109$:
      009533 4F               [ 1]  184 	clr	a
      009534                        185 00111$:
                                    186 ;	driver/app.c: 14: }
      009534 5B 08            [ 2]  187 	addw	sp, #8
      009536 81               [ 4]  188 	ret
                                    189 ;	driver/app.c: 15: void app_init()
                                    190 ;	-----------------------------------------
                                    191 ;	 function app_init
                                    192 ;	-----------------------------------------
      009537                        193 _app_init:
                                    194 ;	driver/app.c: 17: beep_off();
      009537 CD 94 95         [ 4]  195 	call	_beep_off
                                    196 ;	driver/app.c: 18: relay_off();
      00953A CD 8A F7         [ 4]  197 	call	_relay_off
                                    198 ;	driver/app.c: 19: OLED_Clear();
      00953D CD A1 9F         [ 4]  199 	call	_OLED_Clear
                                    200 ;	driver/app.c: 21: eeprom_write(1,0);
      009540 4B 00            [ 1]  201 	push	#0x00
      009542 4B 01            [ 1]  202 	push	#0x01
      009544 5F               [ 1]  203 	clrw	x
      009545 89               [ 2]  204 	pushw	x
      009546 4B 00            [ 1]  205 	push	#0x00
      009548 CD 8F 27         [ 4]  206 	call	_eeprom_write
      00954B 5B 05            [ 2]  207 	addw	sp, #5
                                    208 ;	driver/app.c: 22: eeprom_write(2,0);
      00954D 4B 00            [ 1]  209 	push	#0x00
      00954F 4B 02            [ 1]  210 	push	#0x02
      009551 5F               [ 1]  211 	clrw	x
      009552 89               [ 2]  212 	pushw	x
      009553 4B 00            [ 1]  213 	push	#0x00
      009555 CD 8F 27         [ 4]  214 	call	_eeprom_write
      009558 5B 05            [ 2]  215 	addw	sp, #5
                                    216 ;	driver/app.c: 23: eeprom_write(3,0);
      00955A 4B 00            [ 1]  217 	push	#0x00
      00955C 4B 03            [ 1]  218 	push	#0x03
      00955E 5F               [ 1]  219 	clrw	x
      00955F 89               [ 2]  220 	pushw	x
      009560 4B 00            [ 1]  221 	push	#0x00
      009562 CD 8F 27         [ 4]  222 	call	_eeprom_write
      009565 5B 05            [ 2]  223 	addw	sp, #5
                                    224 ;	driver/app.c: 25: }
      009567 81               [ 4]  225 	ret
                                    226 ;	driver/app.c: 26: void app_loop()
                                    227 ;	-----------------------------------------
                                    228 ;	 function app_loop
                                    229 ;	-----------------------------------------
      009568                        230 _app_loop:
      009568 52 7A            [ 2]  231 	sub	sp, #122
                                    232 ;	driver/app.c: 29: status=eeprom_read(2)*256+eeprom_read(3);
      00956A 4B 02            [ 1]  233 	push	#0x02
      00956C 5F               [ 1]  234 	clrw	x
      00956D 89               [ 2]  235 	pushw	x
      00956E 4B 00            [ 1]  236 	push	#0x00
      009570 CD 8F 0E         [ 4]  237 	call	_eeprom_read
      009573 5B 04            [ 2]  238 	addw	sp, #4
      009575 0F 29            [ 1]  239 	clr	(0x29, sp)
      009577 6B 64            [ 1]  240 	ld	(0x64, sp), a
      009579 0F 65            [ 1]  241 	clr	(0x65, sp)
      00957B 4B 03            [ 1]  242 	push	#0x03
      00957D 5F               [ 1]  243 	clrw	x
      00957E 89               [ 2]  244 	pushw	x
      00957F 4B 00            [ 1]  245 	push	#0x00
      009581 CD 8F 0E         [ 4]  246 	call	_eeprom_read
      009584 5B 04            [ 2]  247 	addw	sp, #4
      009586 5F               [ 1]  248 	clrw	x
      009587 97               [ 1]  249 	ld	xl, a
      009588 72 FB 64         [ 2]  250 	addw	x, (0x64, sp)
      00958B CF 00 1C         [ 2]  251 	ldw	_app_loop_status_65536_386+0, x
                                    252 ;	driver/app.c: 30: if(eeprom_read(4))//启用规则
      00958E 4B 04            [ 1]  253 	push	#0x04
      009590 5F               [ 1]  254 	clrw	x
      009591 89               [ 2]  255 	pushw	x
      009592 4B 00            [ 1]  256 	push	#0x00
      009594 CD 8F 0E         [ 4]  257 	call	_eeprom_read
      009597 5B 04            [ 2]  258 	addw	sp, #4
      009599 6B 75            [ 1]  259 	ld	(0x75, sp), a
      00959B 26 03            [ 1]  260 	jrne	00645$
      00959D CC 9A 68         [ 2]  261 	jp	00165$
      0095A0                        262 00645$:
                                    263 ;	driver/app.c: 33: adcH=adc_data.Ain>>8;
      0095A0 CE 00 0E         [ 2]  264 	ldw	x, _adc_data
      0095A3 9E               [ 1]  265 	ld	a, xh
      0095A4 0F 76            [ 1]  266 	clr	(0x76, sp)
      0095A6 C7 00 1E         [ 1]  267 	ld	_app_loop_adcH_131072_387+0, a
                                    268 ;	driver/app.c: 34: adcL=adc_data.Ain&0xff;
      0095A9 9F               [ 1]  269 	ld	a, xl
      0095AA C7 00 1F         [ 1]  270 	ld	_app_loop_adcL_131072_387+0, a
                                    271 ;	driver/app.c: 35: h=ds_time.hour/16*10+ds_time.hour%16;
      0095AD AE 00 01         [ 2]  272 	ldw	x, #_ds_time
      0095B0 E6 04            [ 1]  273 	ld	a, (0x4, x)
      0095B2 6B 02            [ 1]  274 	ld	(0x02, sp), a
      0095B4 0F 01            [ 1]  275 	clr	(0x01, sp)
      0095B6 4B 10            [ 1]  276 	push	#0x10
      0095B8 4B 00            [ 1]  277 	push	#0x00
      0095BA 1E 03            [ 2]  278 	ldw	x, (0x03, sp)
      0095BC 89               [ 2]  279 	pushw	x
      0095BD CD B9 AC         [ 4]  280 	call	__divsint
      0095C0 5B 04            [ 2]  281 	addw	sp, #4
      0095C2 A6 0A            [ 1]  282 	ld	a, #0x0a
      0095C4 42               [ 4]  283 	mul	x, a
      0095C5 41               [ 1]  284 	exg	a, xl
      0095C6 6B 74            [ 1]  285 	ld	(0x74, sp), a
      0095C8 41               [ 1]  286 	exg	a, xl
      0095C9 4B 10            [ 1]  287 	push	#0x10
      0095CB 4B 00            [ 1]  288 	push	#0x00
      0095CD 1E 03            [ 2]  289 	ldw	x, (0x03, sp)
      0095CF 89               [ 2]  290 	pushw	x
      0095D0 CD B9 96         [ 4]  291 	call	__modsint
      0095D3 5B 04            [ 2]  292 	addw	sp, #4
      0095D5 9F               [ 1]  293 	ld	a, xl
      0095D6 1B 74            [ 1]  294 	add	a, (0x74, sp)
      0095D8 C7 00 20         [ 1]  295 	ld	_app_loop_h_131072_387+0, a
                                    296 ;	driver/app.c: 36: m=ds_time.minute/16*10+ds_time.minute%16;
      0095DB AE 00 01         [ 2]  297 	ldw	x, #_ds_time
      0095DE E6 05            [ 1]  298 	ld	a, (0x5, x)
      0095E0 6B 73            [ 1]  299 	ld	(0x73, sp), a
      0095E2 0F 72            [ 1]  300 	clr	(0x72, sp)
      0095E4 4B 10            [ 1]  301 	push	#0x10
      0095E6 4B 00            [ 1]  302 	push	#0x00
      0095E8 1E 74            [ 2]  303 	ldw	x, (0x74, sp)
      0095EA 89               [ 2]  304 	pushw	x
      0095EB CD B9 AC         [ 4]  305 	call	__divsint
      0095EE 5B 04            [ 2]  306 	addw	sp, #4
      0095F0 A6 0A            [ 1]  307 	ld	a, #0x0a
      0095F2 42               [ 4]  308 	mul	x, a
      0095F3 41               [ 1]  309 	exg	a, xl
      0095F4 6B 53            [ 1]  310 	ld	(0x53, sp), a
      0095F6 41               [ 1]  311 	exg	a, xl
      0095F7 4B 10            [ 1]  312 	push	#0x10
      0095F9 4B 00            [ 1]  313 	push	#0x00
      0095FB 1E 74            [ 2]  314 	ldw	x, (0x74, sp)
      0095FD 89               [ 2]  315 	pushw	x
      0095FE CD B9 96         [ 4]  316 	call	__modsint
      009601 5B 04            [ 2]  317 	addw	sp, #4
      009603 9F               [ 1]  318 	ld	a, xl
      009604 1B 53            [ 1]  319 	add	a, (0x53, sp)
      009606 C7 00 21         [ 1]  320 	ld	_app_loop_m_131072_387+0, a
                                    321 ;	driver/app.c: 37: s=ds_time.second/16*10+ds_time.second%16;
      009609 AE 00 01         [ 2]  322 	ldw	x, #_ds_time
      00960C E6 06            [ 1]  323 	ld	a, (0x6, x)
      00960E 6B 52            [ 1]  324 	ld	(0x52, sp), a
      009610 0F 51            [ 1]  325 	clr	(0x51, sp)
      009612 4B 10            [ 1]  326 	push	#0x10
      009614 4B 00            [ 1]  327 	push	#0x00
      009616 1E 53            [ 2]  328 	ldw	x, (0x53, sp)
      009618 89               [ 2]  329 	pushw	x
      009619 CD B9 AC         [ 4]  330 	call	__divsint
      00961C 5B 04            [ 2]  331 	addw	sp, #4
      00961E A6 0A            [ 1]  332 	ld	a, #0x0a
      009620 42               [ 4]  333 	mul	x, a
      009621 41               [ 1]  334 	exg	a, xl
      009622 6B 16            [ 1]  335 	ld	(0x16, sp), a
      009624 41               [ 1]  336 	exg	a, xl
      009625 4B 10            [ 1]  337 	push	#0x10
      009627 4B 00            [ 1]  338 	push	#0x00
      009629 1E 53            [ 2]  339 	ldw	x, (0x53, sp)
      00962B 89               [ 2]  340 	pushw	x
      00962C CD B9 96         [ 4]  341 	call	__modsint
      00962F 5B 04            [ 2]  342 	addw	sp, #4
      009631 9F               [ 1]  343 	ld	a, xl
      009632 1B 16            [ 1]  344 	add	a, (0x16, sp)
      009634 C7 00 22         [ 1]  345 	ld	_app_loop_s_131072_387+0, a
                                    346 ;	driver/app.c: 38: beep_flag=0,relay_flag=0;//准备相应标志位
      009637 72 5F 00 24      [ 1]  347 	clr	_app_loop_beep_flag_131072_387+0
      00963B 72 5F 00 25      [ 1]  348 	clr	_app_loop_relay_flag_131072_387+0
                                    349 ;	driver/app.c: 39: for(i=0;i<16;i++)//共16条规则
      00963F 72 5F 00 23      [ 1]  350 	clr	_app_loop_i_131072_387+0
      009643 AE 00 10         [ 2]  351 	ldw	x, #_adc_data+2
      009646 1F 14            [ 2]  352 	ldw	(0x14, sp), x
      009648                        353 00240$:
                                    354 ;	driver/app.c: 42: baseadd=(u16)32*(i+1);//规则偏移地址
      009648 5F               [ 1]  355 	clrw	x
      009649 C6 00 23         [ 1]  356 	ld	a, _app_loop_i_131072_387+0
      00964C 97               [ 1]  357 	ld	xl, a
      00964D 5C               [ 1]  358 	incw	x
      00964E 58               [ 2]  359 	sllw	x
      00964F 58               [ 2]  360 	sllw	x
      009650 58               [ 2]  361 	sllw	x
      009651 58               [ 2]  362 	sllw	x
      009652 58               [ 2]  363 	sllw	x
                                    364 ;	driver/app.c: 43: if(eeprom_read(baseadd))//当前规则已启用
      009653 CF 00 26         [ 2]  365 	ldw	_app_loop_baseadd_262144_389+0, x
      009656 90 5F            [ 1]  366 	clrw	y
      009658 89               [ 2]  367 	pushw	x
      009659 90 89            [ 2]  368 	pushw	y
      00965B CD 8F 0E         [ 4]  369 	call	_eeprom_read
      00965E 5B 04            [ 2]  370 	addw	sp, #4
      009660 6B 18            [ 1]  371 	ld	(0x18, sp), a
      009662 26 03            [ 1]  372 	jrne	00646$
      009664 CC 9A 3E         [ 2]  373 	jp	00156$
      009667                        374 00646$:
                                    375 ;	driver/app.c: 47: data=h,conbase=1;//当前需要判断的数据，当前条件在规则中的偏移
      009667 55 00 20 00 28   [ 1]  376 	mov	_app_loop_data_327680_390+0, _app_loop_h_131072_387+0
      00966C 35 01 00 29      [ 1]  377 	mov	_app_loop_conbase_327680_390+0, #0x01
                                    378 ;	driver/app.c: 48: if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
      009670 CE 00 26         [ 2]  379 	ldw	x, _app_loop_baseadd_262144_389+0
      009673 5C               [ 1]  380 	incw	x
      009674 5C               [ 1]  381 	incw	x
      009675 5C               [ 1]  382 	incw	x
      009676 51               [ 1]  383 	exgw	x, y
      009677 5F               [ 1]  384 	clrw	x
      009678 90 89            [ 2]  385 	pushw	y
      00967A 89               [ 2]  386 	pushw	x
      00967B CD 8F 0E         [ 4]  387 	call	_eeprom_read
      00967E 5B 04            [ 2]  388 	addw	sp, #4
      009680 4D               [ 1]  389 	tnz	a
      009681 27 45            [ 1]  390 	jreq	00104$
      009683 5F               [ 1]  391 	clrw	x
      009684 C6 00 29         [ 1]  392 	ld	a, _app_loop_conbase_327680_390+0
      009687 97               [ 1]  393 	ld	xl, a
      009688 72 BB 00 26      [ 2]  394 	addw	x, _app_loop_baseadd_262144_389+0
      00968C 90 5F            [ 1]  395 	clrw	y
      00968E 89               [ 2]  396 	pushw	x
      00968F 90 89            [ 2]  397 	pushw	y
      009691 CD 8F 0E         [ 4]  398 	call	_eeprom_read
      009694 5B 04            [ 2]  399 	addw	sp, #4
      009696 6B 17            [ 1]  400 	ld	(0x17, sp), a
      009698 5F               [ 1]  401 	clrw	x
      009699 C6 00 29         [ 1]  402 	ld	a, _app_loop_conbase_327680_390+0
      00969C 97               [ 1]  403 	ld	xl, a
      00969D 72 BB 00 26      [ 2]  404 	addw	x, _app_loop_baseadd_262144_389+0
      0096A1 5C               [ 1]  405 	incw	x
      0096A2 90 5F            [ 1]  406 	clrw	y
      0096A4 89               [ 2]  407 	pushw	x
      0096A5 90 89            [ 2]  408 	pushw	y
      0096A7 CD 8F 0E         [ 4]  409 	call	_eeprom_read
      0096AA 5B 04            [ 2]  410 	addw	sp, #4
      0096AC 11 17            [ 1]  411 	cp	a, (0x17, sp)
      0096AE 25 18            [ 1]  412 	jrc	00104$
                                    413 ;	driver/app.c: 55: if(!Is_In_Area(baseadd+conbase,data)) continue;
      0096B0 5F               [ 1]  414 	clrw	x
      0096B1 C6 00 29         [ 1]  415 	ld	a, _app_loop_conbase_327680_390+0
      0096B4 97               [ 1]  416 	ld	xl, a
      0096B5 72 BB 00 26      [ 2]  417 	addw	x, _app_loop_baseadd_262144_389+0
      0096B9 3B 00 28         [ 1]  418 	push	_app_loop_data_327680_390+0
      0096BC 89               [ 2]  419 	pushw	x
      0096BD CD 94 AE         [ 4]  420 	call	_Is_In_Area
      0096C0 5B 03            [ 2]  421 	addw	sp, #3
      0096C2 4D               [ 1]  422 	tnz	a
      0096C3 26 03            [ 1]  423 	jrne	00649$
      0096C5 CC 9A 3E         [ 2]  424 	jp	00156$
      0096C8                        425 00649$:
      0096C8                        426 00104$:
                                    427 ;	driver/app.c: 60: data=m,conbase=4;//当前需要判断的数据，当前条件在规则中的偏移
      0096C8 55 00 21 00 28   [ 1]  428 	mov	_app_loop_data_327680_390+0, _app_loop_m_131072_387+0
      0096CD 35 04 00 29      [ 1]  429 	mov	_app_loop_conbase_327680_390+0, #0x04
                                    430 ;	driver/app.c: 61: if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
      0096D1 CE 00 26         [ 2]  431 	ldw	x, _app_loop_baseadd_262144_389+0
      0096D4 1C 00 04         [ 2]  432 	addw	x, #0x0004
      0096D7 5C               [ 1]  433 	incw	x
      0096D8 5C               [ 1]  434 	incw	x
      0096D9 51               [ 1]  435 	exgw	x, y
      0096DA 5F               [ 1]  436 	clrw	x
      0096DB 90 89            [ 2]  437 	pushw	y
      0096DD 89               [ 2]  438 	pushw	x
      0096DE CD 8F 0E         [ 4]  439 	call	_eeprom_read
      0096E1 5B 04            [ 2]  440 	addw	sp, #4
      0096E3 4D               [ 1]  441 	tnz	a
      0096E4 27 45            [ 1]  442 	jreq	00109$
      0096E6 5F               [ 1]  443 	clrw	x
      0096E7 C6 00 29         [ 1]  444 	ld	a, _app_loop_conbase_327680_390+0
      0096EA 97               [ 1]  445 	ld	xl, a
      0096EB 72 BB 00 26      [ 2]  446 	addw	x, _app_loop_baseadd_262144_389+0
      0096EF 90 5F            [ 1]  447 	clrw	y
      0096F1 89               [ 2]  448 	pushw	x
      0096F2 90 89            [ 2]  449 	pushw	y
      0096F4 CD 8F 0E         [ 4]  450 	call	_eeprom_read
      0096F7 5B 04            [ 2]  451 	addw	sp, #4
      0096F9 6B 1A            [ 1]  452 	ld	(0x1a, sp), a
      0096FB 5F               [ 1]  453 	clrw	x
      0096FC C6 00 29         [ 1]  454 	ld	a, _app_loop_conbase_327680_390+0
      0096FF 97               [ 1]  455 	ld	xl, a
      009700 72 BB 00 26      [ 2]  456 	addw	x, _app_loop_baseadd_262144_389+0
      009704 5C               [ 1]  457 	incw	x
      009705 90 5F            [ 1]  458 	clrw	y
      009707 89               [ 2]  459 	pushw	x
      009708 90 89            [ 2]  460 	pushw	y
      00970A CD 8F 0E         [ 4]  461 	call	_eeprom_read
      00970D 5B 04            [ 2]  462 	addw	sp, #4
      00970F 11 1A            [ 1]  463 	cp	a, (0x1a, sp)
      009711 25 18            [ 1]  464 	jrc	00109$
                                    465 ;	driver/app.c: 68: if(!Is_In_Area(baseadd+conbase,data)) continue;
      009713 5F               [ 1]  466 	clrw	x
      009714 C6 00 29         [ 1]  467 	ld	a, _app_loop_conbase_327680_390+0
      009717 97               [ 1]  468 	ld	xl, a
      009718 72 BB 00 26      [ 2]  469 	addw	x, _app_loop_baseadd_262144_389+0
      00971C 3B 00 28         [ 1]  470 	push	_app_loop_data_327680_390+0
      00971F 89               [ 2]  471 	pushw	x
      009720 CD 94 AE         [ 4]  472 	call	_Is_In_Area
      009723 5B 03            [ 2]  473 	addw	sp, #3
      009725 4D               [ 1]  474 	tnz	a
      009726 26 03            [ 1]  475 	jrne	00652$
      009728 CC 9A 3E         [ 2]  476 	jp	00156$
      00972B                        477 00652$:
      00972B                        478 00109$:
                                    479 ;	driver/app.c: 73: data=s,conbase=7;//当前需要判断的数据，当前条件在规则中的偏移
      00972B 55 00 22 00 28   [ 1]  480 	mov	_app_loop_data_327680_390+0, _app_loop_s_131072_387+0
      009730 35 07 00 29      [ 1]  481 	mov	_app_loop_conbase_327680_390+0, #0x07
                                    482 ;	driver/app.c: 74: if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
      009734 CE 00 26         [ 2]  483 	ldw	x, _app_loop_baseadd_262144_389+0
      009737 1C 00 07         [ 2]  484 	addw	x, #0x0007
      00973A 5C               [ 1]  485 	incw	x
      00973B 5C               [ 1]  486 	incw	x
      00973C 51               [ 1]  487 	exgw	x, y
      00973D 5F               [ 1]  488 	clrw	x
      00973E 90 89            [ 2]  489 	pushw	y
      009740 89               [ 2]  490 	pushw	x
      009741 CD 8F 0E         [ 4]  491 	call	_eeprom_read
      009744 5B 04            [ 2]  492 	addw	sp, #4
      009746 4D               [ 1]  493 	tnz	a
      009747 27 45            [ 1]  494 	jreq	00114$
      009749 5F               [ 1]  495 	clrw	x
      00974A C6 00 29         [ 1]  496 	ld	a, _app_loop_conbase_327680_390+0
      00974D 97               [ 1]  497 	ld	xl, a
      00974E 72 BB 00 26      [ 2]  498 	addw	x, _app_loop_baseadd_262144_389+0
      009752 90 5F            [ 1]  499 	clrw	y
      009754 89               [ 2]  500 	pushw	x
      009755 90 89            [ 2]  501 	pushw	y
      009757 CD 8F 0E         [ 4]  502 	call	_eeprom_read
      00975A 5B 04            [ 2]  503 	addw	sp, #4
      00975C 6B 19            [ 1]  504 	ld	(0x19, sp), a
      00975E 5F               [ 1]  505 	clrw	x
      00975F C6 00 29         [ 1]  506 	ld	a, _app_loop_conbase_327680_390+0
      009762 97               [ 1]  507 	ld	xl, a
      009763 72 BB 00 26      [ 2]  508 	addw	x, _app_loop_baseadd_262144_389+0
      009767 5C               [ 1]  509 	incw	x
      009768 90 5F            [ 1]  510 	clrw	y
      00976A 89               [ 2]  511 	pushw	x
      00976B 90 89            [ 2]  512 	pushw	y
      00976D CD 8F 0E         [ 4]  513 	call	_eeprom_read
      009770 5B 04            [ 2]  514 	addw	sp, #4
      009772 11 19            [ 1]  515 	cp	a, (0x19, sp)
      009774 25 18            [ 1]  516 	jrc	00114$
                                    517 ;	driver/app.c: 81: if(!Is_In_Area(baseadd+conbase,data)) continue;
      009776 5F               [ 1]  518 	clrw	x
      009777 C6 00 29         [ 1]  519 	ld	a, _app_loop_conbase_327680_390+0
      00977A 97               [ 1]  520 	ld	xl, a
      00977B 72 BB 00 26      [ 2]  521 	addw	x, _app_loop_baseadd_262144_389+0
      00977F 3B 00 28         [ 1]  522 	push	_app_loop_data_327680_390+0
      009782 89               [ 2]  523 	pushw	x
      009783 CD 94 AE         [ 4]  524 	call	_Is_In_Area
      009786 5B 03            [ 2]  525 	addw	sp, #3
      009788 4D               [ 1]  526 	tnz	a
      009789 26 03            [ 1]  527 	jrne	00655$
      00978B CC 9A 3E         [ 2]  528 	jp	00156$
      00978E                        529 00655$:
      00978E                        530 00114$:
                                    531 ;	driver/app.c: 86: data=adcH,conbase=10;//当前需要判断的数据，当前条件在规则中的偏移
      00978E 55 00 1E 00 28   [ 1]  532 	mov	_app_loop_data_327680_390+0, _app_loop_adcH_131072_387+0
      009793 35 0A 00 29      [ 1]  533 	mov	_app_loop_conbase_327680_390+0, #0x0a
                                    534 ;	driver/app.c: 87: if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
      009797 CE 00 26         [ 2]  535 	ldw	x, _app_loop_baseadd_262144_389+0
      00979A 1C 00 0A         [ 2]  536 	addw	x, #0x000a
      00979D 5C               [ 1]  537 	incw	x
      00979E 5C               [ 1]  538 	incw	x
      00979F 51               [ 1]  539 	exgw	x, y
      0097A0 5F               [ 1]  540 	clrw	x
      0097A1 90 89            [ 2]  541 	pushw	y
      0097A3 89               [ 2]  542 	pushw	x
      0097A4 CD 8F 0E         [ 4]  543 	call	_eeprom_read
      0097A7 5B 04            [ 2]  544 	addw	sp, #4
      0097A9 4D               [ 1]  545 	tnz	a
      0097AA 27 45            [ 1]  546 	jreq	00119$
      0097AC 5F               [ 1]  547 	clrw	x
      0097AD C6 00 29         [ 1]  548 	ld	a, _app_loop_conbase_327680_390+0
      0097B0 97               [ 1]  549 	ld	xl, a
      0097B1 72 BB 00 26      [ 2]  550 	addw	x, _app_loop_baseadd_262144_389+0
      0097B5 90 5F            [ 1]  551 	clrw	y
      0097B7 89               [ 2]  552 	pushw	x
      0097B8 90 89            [ 2]  553 	pushw	y
      0097BA CD 8F 0E         [ 4]  554 	call	_eeprom_read
      0097BD 5B 04            [ 2]  555 	addw	sp, #4
      0097BF 6B 1C            [ 1]  556 	ld	(0x1c, sp), a
      0097C1 5F               [ 1]  557 	clrw	x
      0097C2 C6 00 29         [ 1]  558 	ld	a, _app_loop_conbase_327680_390+0
      0097C5 97               [ 1]  559 	ld	xl, a
      0097C6 72 BB 00 26      [ 2]  560 	addw	x, _app_loop_baseadd_262144_389+0
      0097CA 5C               [ 1]  561 	incw	x
      0097CB 90 5F            [ 1]  562 	clrw	y
      0097CD 89               [ 2]  563 	pushw	x
      0097CE 90 89            [ 2]  564 	pushw	y
      0097D0 CD 8F 0E         [ 4]  565 	call	_eeprom_read
      0097D3 5B 04            [ 2]  566 	addw	sp, #4
      0097D5 11 1C            [ 1]  567 	cp	a, (0x1c, sp)
      0097D7 25 18            [ 1]  568 	jrc	00119$
                                    569 ;	driver/app.c: 94: if(!Is_In_Area(baseadd+conbase,data)) continue;
      0097D9 5F               [ 1]  570 	clrw	x
      0097DA C6 00 29         [ 1]  571 	ld	a, _app_loop_conbase_327680_390+0
      0097DD 97               [ 1]  572 	ld	xl, a
      0097DE 72 BB 00 26      [ 2]  573 	addw	x, _app_loop_baseadd_262144_389+0
      0097E2 3B 00 28         [ 1]  574 	push	_app_loop_data_327680_390+0
      0097E5 89               [ 2]  575 	pushw	x
      0097E6 CD 94 AE         [ 4]  576 	call	_Is_In_Area
      0097E9 5B 03            [ 2]  577 	addw	sp, #3
      0097EB 4D               [ 1]  578 	tnz	a
      0097EC 26 03            [ 1]  579 	jrne	00658$
      0097EE CC 9A 3E         [ 2]  580 	jp	00156$
      0097F1                        581 00658$:
      0097F1                        582 00119$:
                                    583 ;	driver/app.c: 99: data=adcL,conbase=13;//当前需要判断的数据，当前条件在规则中的偏移
      0097F1 55 00 1F 00 28   [ 1]  584 	mov	_app_loop_data_327680_390+0, _app_loop_adcL_131072_387+0
      0097F6 35 0D 00 29      [ 1]  585 	mov	_app_loop_conbase_327680_390+0, #0x0d
                                    586 ;	driver/app.c: 100: if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
      0097FA CE 00 26         [ 2]  587 	ldw	x, _app_loop_baseadd_262144_389+0
      0097FD 1C 00 0D         [ 2]  588 	addw	x, #0x000d
      009800 5C               [ 1]  589 	incw	x
      009801 5C               [ 1]  590 	incw	x
      009802 51               [ 1]  591 	exgw	x, y
      009803 5F               [ 1]  592 	clrw	x
      009804 90 89            [ 2]  593 	pushw	y
      009806 89               [ 2]  594 	pushw	x
      009807 CD 8F 0E         [ 4]  595 	call	_eeprom_read
      00980A 5B 04            [ 2]  596 	addw	sp, #4
      00980C 4D               [ 1]  597 	tnz	a
      00980D 27 45            [ 1]  598 	jreq	00124$
      00980F 5F               [ 1]  599 	clrw	x
      009810 C6 00 29         [ 1]  600 	ld	a, _app_loop_conbase_327680_390+0
      009813 97               [ 1]  601 	ld	xl, a
      009814 72 BB 00 26      [ 2]  602 	addw	x, _app_loop_baseadd_262144_389+0
      009818 90 5F            [ 1]  603 	clrw	y
      00981A 89               [ 2]  604 	pushw	x
      00981B 90 89            [ 2]  605 	pushw	y
      00981D CD 8F 0E         [ 4]  606 	call	_eeprom_read
      009820 5B 04            [ 2]  607 	addw	sp, #4
      009822 6B 1B            [ 1]  608 	ld	(0x1b, sp), a
      009824 5F               [ 1]  609 	clrw	x
      009825 C6 00 29         [ 1]  610 	ld	a, _app_loop_conbase_327680_390+0
      009828 97               [ 1]  611 	ld	xl, a
      009829 72 BB 00 26      [ 2]  612 	addw	x, _app_loop_baseadd_262144_389+0
      00982D 5C               [ 1]  613 	incw	x
      00982E 90 5F            [ 1]  614 	clrw	y
      009830 89               [ 2]  615 	pushw	x
      009831 90 89            [ 2]  616 	pushw	y
      009833 CD 8F 0E         [ 4]  617 	call	_eeprom_read
      009836 5B 04            [ 2]  618 	addw	sp, #4
      009838 11 1B            [ 1]  619 	cp	a, (0x1b, sp)
      00983A 25 18            [ 1]  620 	jrc	00124$
                                    621 ;	driver/app.c: 107: if(!Is_In_Area(baseadd+conbase,data)) continue;
      00983C 5F               [ 1]  622 	clrw	x
      00983D C6 00 29         [ 1]  623 	ld	a, _app_loop_conbase_327680_390+0
      009840 97               [ 1]  624 	ld	xl, a
      009841 72 BB 00 26      [ 2]  625 	addw	x, _app_loop_baseadd_262144_389+0
      009845 3B 00 28         [ 1]  626 	push	_app_loop_data_327680_390+0
      009848 89               [ 2]  627 	pushw	x
      009849 CD 94 AE         [ 4]  628 	call	_Is_In_Area
      00984C 5B 03            [ 2]  629 	addw	sp, #3
      00984E 4D               [ 1]  630 	tnz	a
      00984F 26 03            [ 1]  631 	jrne	00661$
      009851 CC 9A 3E         [ 2]  632 	jp	00156$
      009854                        633 00661$:
      009854                        634 00124$:
                                    635 ;	driver/app.c: 111: if(eeprom_read(baseadd+16)) //判断adc数字输入
      009854 CE 00 26         [ 2]  636 	ldw	x, _app_loop_baseadd_262144_389+0
      009857 1C 00 10         [ 2]  637 	addw	x, #0x0010
      00985A 90 5F            [ 1]  638 	clrw	y
      00985C 89               [ 2]  639 	pushw	x
      00985D 90 89            [ 2]  640 	pushw	y
      00985F CD 8F 0E         [ 4]  641 	call	_eeprom_read
      009862 5B 04            [ 2]  642 	addw	sp, #4
      009864 4D               [ 1]  643 	tnz	a
      009865 27 08            [ 1]  644 	jreq	00129$
                                    645 ;	driver/app.c: 113: if(!adc_data.Din) continue;
      009867 1E 14            [ 2]  646 	ldw	x, (0x14, sp)
      009869 F6               [ 1]  647 	ld	a, (x)
      00986A 26 03            [ 1]  648 	jrne	00663$
      00986C CC 9A 3E         [ 2]  649 	jp	00156$
      00986F                        650 00663$:
      00986F                        651 00129$:
                                    652 ;	driver/app.c: 116: data=dh_data.T,conbase=17;//当前需要判断的数据，当前条件在规则中的偏移
      00986F C6 00 08         [ 1]  653 	ld	a, _dh_data
      009872 C7 00 28         [ 1]  654 	ld	_app_loop_data_327680_390+0, a
      009875 35 11 00 29      [ 1]  655 	mov	_app_loop_conbase_327680_390+0, #0x11
                                    656 ;	driver/app.c: 117: if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
      009879 CE 00 26         [ 2]  657 	ldw	x, _app_loop_baseadd_262144_389+0
      00987C 1C 00 11         [ 2]  658 	addw	x, #0x0011
      00987F 5C               [ 1]  659 	incw	x
      009880 5C               [ 1]  660 	incw	x
      009881 51               [ 1]  661 	exgw	x, y
      009882 5F               [ 1]  662 	clrw	x
      009883 90 89            [ 2]  663 	pushw	y
      009885 89               [ 2]  664 	pushw	x
      009886 CD 8F 0E         [ 4]  665 	call	_eeprom_read
      009889 5B 04            [ 2]  666 	addw	sp, #4
      00988B 4D               [ 1]  667 	tnz	a
      00988C 27 45            [ 1]  668 	jreq	00133$
      00988E 5F               [ 1]  669 	clrw	x
      00988F C6 00 29         [ 1]  670 	ld	a, _app_loop_conbase_327680_390+0
      009892 97               [ 1]  671 	ld	xl, a
      009893 72 BB 00 26      [ 2]  672 	addw	x, _app_loop_baseadd_262144_389+0
      009897 90 5F            [ 1]  673 	clrw	y
      009899 89               [ 2]  674 	pushw	x
      00989A 90 89            [ 2]  675 	pushw	y
      00989C CD 8F 0E         [ 4]  676 	call	_eeprom_read
      00989F 5B 04            [ 2]  677 	addw	sp, #4
      0098A1 6B 04            [ 1]  678 	ld	(0x04, sp), a
      0098A3 5F               [ 1]  679 	clrw	x
      0098A4 C6 00 29         [ 1]  680 	ld	a, _app_loop_conbase_327680_390+0
      0098A7 97               [ 1]  681 	ld	xl, a
      0098A8 72 BB 00 26      [ 2]  682 	addw	x, _app_loop_baseadd_262144_389+0
      0098AC 5C               [ 1]  683 	incw	x
      0098AD 90 5F            [ 1]  684 	clrw	y
      0098AF 89               [ 2]  685 	pushw	x
      0098B0 90 89            [ 2]  686 	pushw	y
      0098B2 CD 8F 0E         [ 4]  687 	call	_eeprom_read
      0098B5 5B 04            [ 2]  688 	addw	sp, #4
      0098B7 11 04            [ 1]  689 	cp	a, (0x04, sp)
      0098B9 25 18            [ 1]  690 	jrc	00133$
                                    691 ;	driver/app.c: 125: if(!Is_In_Area(baseadd+conbase,data)) continue;
      0098BB 5F               [ 1]  692 	clrw	x
      0098BC C6 00 29         [ 1]  693 	ld	a, _app_loop_conbase_327680_390+0
      0098BF 97               [ 1]  694 	ld	xl, a
      0098C0 72 BB 00 26      [ 2]  695 	addw	x, _app_loop_baseadd_262144_389+0
      0098C4 3B 00 28         [ 1]  696 	push	_app_loop_data_327680_390+0
      0098C7 89               [ 2]  697 	pushw	x
      0098C8 CD 94 AE         [ 4]  698 	call	_Is_In_Area
      0098CB 5B 03            [ 2]  699 	addw	sp, #3
      0098CD 4D               [ 1]  700 	tnz	a
      0098CE 26 03            [ 1]  701 	jrne	00666$
      0098D0 CC 9A 3E         [ 2]  702 	jp	00156$
      0098D3                        703 00666$:
      0098D3                        704 00133$:
                                    705 ;	driver/app.c: 129: data=dh_data.T1,conbase=20;//当前需要判断的数据，当前条件在规则中的偏移
      0098D3 C6 00 09         [ 1]  706 	ld	a, _dh_data+1
      0098D6 C7 00 28         [ 1]  707 	ld	_app_loop_data_327680_390+0, a
      0098D9 35 14 00 29      [ 1]  708 	mov	_app_loop_conbase_327680_390+0, #0x14
                                    709 ;	driver/app.c: 130: if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
      0098DD CE 00 26         [ 2]  710 	ldw	x, _app_loop_baseadd_262144_389+0
      0098E0 1C 00 14         [ 2]  711 	addw	x, #0x0014
      0098E3 5C               [ 1]  712 	incw	x
      0098E4 5C               [ 1]  713 	incw	x
      0098E5 51               [ 1]  714 	exgw	x, y
      0098E6 5F               [ 1]  715 	clrw	x
      0098E7 90 89            [ 2]  716 	pushw	y
      0098E9 89               [ 2]  717 	pushw	x
      0098EA CD 8F 0E         [ 4]  718 	call	_eeprom_read
      0098ED 5B 04            [ 2]  719 	addw	sp, #4
      0098EF 4D               [ 1]  720 	tnz	a
      0098F0 27 45            [ 1]  721 	jreq	00138$
      0098F2 5F               [ 1]  722 	clrw	x
      0098F3 C6 00 29         [ 1]  723 	ld	a, _app_loop_conbase_327680_390+0
      0098F6 97               [ 1]  724 	ld	xl, a
      0098F7 72 BB 00 26      [ 2]  725 	addw	x, _app_loop_baseadd_262144_389+0
      0098FB 90 5F            [ 1]  726 	clrw	y
      0098FD 89               [ 2]  727 	pushw	x
      0098FE 90 89            [ 2]  728 	pushw	y
      009900 CD 8F 0E         [ 4]  729 	call	_eeprom_read
      009903 5B 04            [ 2]  730 	addw	sp, #4
      009905 6B 03            [ 1]  731 	ld	(0x03, sp), a
      009907 5F               [ 1]  732 	clrw	x
      009908 C6 00 29         [ 1]  733 	ld	a, _app_loop_conbase_327680_390+0
      00990B 97               [ 1]  734 	ld	xl, a
      00990C 72 BB 00 26      [ 2]  735 	addw	x, _app_loop_baseadd_262144_389+0
      009910 5C               [ 1]  736 	incw	x
      009911 90 5F            [ 1]  737 	clrw	y
      009913 89               [ 2]  738 	pushw	x
      009914 90 89            [ 2]  739 	pushw	y
      009916 CD 8F 0E         [ 4]  740 	call	_eeprom_read
      009919 5B 04            [ 2]  741 	addw	sp, #4
      00991B 11 03            [ 1]  742 	cp	a, (0x03, sp)
      00991D 25 18            [ 1]  743 	jrc	00138$
                                    744 ;	driver/app.c: 137: if(!Is_In_Area(baseadd+conbase,data)) continue;
      00991F 5F               [ 1]  745 	clrw	x
      009920 C6 00 29         [ 1]  746 	ld	a, _app_loop_conbase_327680_390+0
      009923 97               [ 1]  747 	ld	xl, a
      009924 72 BB 00 26      [ 2]  748 	addw	x, _app_loop_baseadd_262144_389+0
      009928 3B 00 28         [ 1]  749 	push	_app_loop_data_327680_390+0
      00992B 89               [ 2]  750 	pushw	x
      00992C CD 94 AE         [ 4]  751 	call	_Is_In_Area
      00992F 5B 03            [ 2]  752 	addw	sp, #3
      009931 4D               [ 1]  753 	tnz	a
      009932 26 03            [ 1]  754 	jrne	00669$
      009934 CC 9A 3E         [ 2]  755 	jp	00156$
      009937                        756 00669$:
      009937                        757 00138$:
                                    758 ;	driver/app.c: 142: data=dh_data.W,conbase=23;//当前需要判断的数据，当前条件在规则中的偏移
      009937 C6 00 0A         [ 1]  759 	ld	a, _dh_data+2
      00993A C7 00 28         [ 1]  760 	ld	_app_loop_data_327680_390+0, a
      00993D 35 17 00 29      [ 1]  761 	mov	_app_loop_conbase_327680_390+0, #0x17
                                    762 ;	driver/app.c: 143: if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
      009941 CE 00 26         [ 2]  763 	ldw	x, _app_loop_baseadd_262144_389+0
      009944 1C 00 17         [ 2]  764 	addw	x, #0x0017
      009947 5C               [ 1]  765 	incw	x
      009948 5C               [ 1]  766 	incw	x
      009949 51               [ 1]  767 	exgw	x, y
      00994A 5F               [ 1]  768 	clrw	x
      00994B 90 89            [ 2]  769 	pushw	y
      00994D 89               [ 2]  770 	pushw	x
      00994E CD 8F 0E         [ 4]  771 	call	_eeprom_read
      009951 5B 04            [ 2]  772 	addw	sp, #4
      009953 4D               [ 1]  773 	tnz	a
      009954 27 45            [ 1]  774 	jreq	00143$
      009956 5F               [ 1]  775 	clrw	x
      009957 C6 00 29         [ 1]  776 	ld	a, _app_loop_conbase_327680_390+0
      00995A 97               [ 1]  777 	ld	xl, a
      00995B 72 BB 00 26      [ 2]  778 	addw	x, _app_loop_baseadd_262144_389+0
      00995F 90 5F            [ 1]  779 	clrw	y
      009961 89               [ 2]  780 	pushw	x
      009962 90 89            [ 2]  781 	pushw	y
      009964 CD 8F 0E         [ 4]  782 	call	_eeprom_read
      009967 5B 04            [ 2]  783 	addw	sp, #4
      009969 6B 06            [ 1]  784 	ld	(0x06, sp), a
      00996B 5F               [ 1]  785 	clrw	x
      00996C C6 00 29         [ 1]  786 	ld	a, _app_loop_conbase_327680_390+0
      00996F 97               [ 1]  787 	ld	xl, a
      009970 72 BB 00 26      [ 2]  788 	addw	x, _app_loop_baseadd_262144_389+0
      009974 5C               [ 1]  789 	incw	x
      009975 90 5F            [ 1]  790 	clrw	y
      009977 89               [ 2]  791 	pushw	x
      009978 90 89            [ 2]  792 	pushw	y
      00997A CD 8F 0E         [ 4]  793 	call	_eeprom_read
      00997D 5B 04            [ 2]  794 	addw	sp, #4
      00997F 11 06            [ 1]  795 	cp	a, (0x06, sp)
      009981 25 18            [ 1]  796 	jrc	00143$
                                    797 ;	driver/app.c: 150: if(!Is_In_Area(baseadd+conbase,data)) continue;
      009983 5F               [ 1]  798 	clrw	x
      009984 C6 00 29         [ 1]  799 	ld	a, _app_loop_conbase_327680_390+0
      009987 97               [ 1]  800 	ld	xl, a
      009988 72 BB 00 26      [ 2]  801 	addw	x, _app_loop_baseadd_262144_389+0
      00998C 3B 00 28         [ 1]  802 	push	_app_loop_data_327680_390+0
      00998F 89               [ 2]  803 	pushw	x
      009990 CD 94 AE         [ 4]  804 	call	_Is_In_Area
      009993 5B 03            [ 2]  805 	addw	sp, #3
      009995 4D               [ 1]  806 	tnz	a
      009996 26 03            [ 1]  807 	jrne	00672$
      009998 CC 9A 3E         [ 2]  808 	jp	00156$
      00999B                        809 00672$:
      00999B                        810 00143$:
                                    811 ;	driver/app.c: 155: data=dh_data.W1,conbase=26;//当前需要判断的数据，当前条件在规则中的偏移
      00999B C6 00 0B         [ 1]  812 	ld	a, _dh_data+3
      00999E C7 00 28         [ 1]  813 	ld	_app_loop_data_327680_390+0, a
      0099A1 35 1A 00 29      [ 1]  814 	mov	_app_loop_conbase_327680_390+0, #0x1a
                                    815 ;	driver/app.c: 156: if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
      0099A5 CE 00 26         [ 2]  816 	ldw	x, _app_loop_baseadd_262144_389+0
      0099A8 1C 00 1A         [ 2]  817 	addw	x, #0x001a
      0099AB 5C               [ 1]  818 	incw	x
      0099AC 5C               [ 1]  819 	incw	x
      0099AD 51               [ 1]  820 	exgw	x, y
      0099AE 5F               [ 1]  821 	clrw	x
      0099AF 90 89            [ 2]  822 	pushw	y
      0099B1 89               [ 2]  823 	pushw	x
      0099B2 CD 8F 0E         [ 4]  824 	call	_eeprom_read
      0099B5 5B 04            [ 2]  825 	addw	sp, #4
      0099B7 4D               [ 1]  826 	tnz	a
      0099B8 27 42            [ 1]  827 	jreq	00148$
      0099BA 5F               [ 1]  828 	clrw	x
      0099BB C6 00 29         [ 1]  829 	ld	a, _app_loop_conbase_327680_390+0
      0099BE 97               [ 1]  830 	ld	xl, a
      0099BF 72 BB 00 26      [ 2]  831 	addw	x, _app_loop_baseadd_262144_389+0
      0099C3 90 5F            [ 1]  832 	clrw	y
      0099C5 89               [ 2]  833 	pushw	x
      0099C6 90 89            [ 2]  834 	pushw	y
      0099C8 CD 8F 0E         [ 4]  835 	call	_eeprom_read
      0099CB 5B 04            [ 2]  836 	addw	sp, #4
      0099CD 6B 05            [ 1]  837 	ld	(0x05, sp), a
      0099CF 5F               [ 1]  838 	clrw	x
      0099D0 C6 00 29         [ 1]  839 	ld	a, _app_loop_conbase_327680_390+0
      0099D3 97               [ 1]  840 	ld	xl, a
      0099D4 72 BB 00 26      [ 2]  841 	addw	x, _app_loop_baseadd_262144_389+0
      0099D8 5C               [ 1]  842 	incw	x
      0099D9 90 5F            [ 1]  843 	clrw	y
      0099DB 89               [ 2]  844 	pushw	x
      0099DC 90 89            [ 2]  845 	pushw	y
      0099DE CD 8F 0E         [ 4]  846 	call	_eeprom_read
      0099E1 5B 04            [ 2]  847 	addw	sp, #4
      0099E3 11 05            [ 1]  848 	cp	a, (0x05, sp)
      0099E5 25 15            [ 1]  849 	jrc	00148$
                                    850 ;	driver/app.c: 163: if(!Is_In_Area(baseadd+conbase,data)) continue;
      0099E7 5F               [ 1]  851 	clrw	x
      0099E8 C6 00 29         [ 1]  852 	ld	a, _app_loop_conbase_327680_390+0
      0099EB 97               [ 1]  853 	ld	xl, a
      0099EC 72 BB 00 26      [ 2]  854 	addw	x, _app_loop_baseadd_262144_389+0
      0099F0 3B 00 28         [ 1]  855 	push	_app_loop_data_327680_390+0
      0099F3 89               [ 2]  856 	pushw	x
      0099F4 CD 94 AE         [ 4]  857 	call	_Is_In_Area
      0099F7 5B 03            [ 2]  858 	addw	sp, #3
      0099F9 4D               [ 1]  859 	tnz	a
      0099FA 27 42            [ 1]  860 	jreq	00156$
      0099FC                        861 00148$:
                                    862 ;	driver/app.c: 169: if(eeprom_read(baseadd+30)) beep_flag|=0x01;
      0099FC CE 00 26         [ 2]  863 	ldw	x, _app_loop_baseadd_262144_389+0
      0099FF 1C 00 1E         [ 2]  864 	addw	x, #0x001e
      009A02 90 5F            [ 1]  865 	clrw	y
      009A04 89               [ 2]  866 	pushw	x
      009A05 90 89            [ 2]  867 	pushw	y
      009A07 CD 8F 0E         [ 4]  868 	call	_eeprom_read
      009A0A 5B 04            [ 2]  869 	addw	sp, #4
      009A0C 4D               [ 1]  870 	tnz	a
      009A0D 27 08            [ 1]  871 	jreq	00151$
      009A0F C6 00 24         [ 1]  872 	ld	a, _app_loop_beep_flag_131072_387+0
      009A12 AA 01            [ 1]  873 	or	a, #0x01
      009A14 C7 00 24         [ 1]  874 	ld	_app_loop_beep_flag_131072_387+0, a
      009A17                        875 00151$:
                                    876 ;	driver/app.c: 170: if(eeprom_read(baseadd+31)) relay_flag|=0x01;
      009A17 CE 00 26         [ 2]  877 	ldw	x, _app_loop_baseadd_262144_389+0
      009A1A 1C 00 1F         [ 2]  878 	addw	x, #0x001f
      009A1D 1F 0B            [ 2]  879 	ldw	(0x0b, sp), x
      009A1F 90 93            [ 1]  880 	ldw	y, x
      009A21 17 09            [ 2]  881 	ldw	(0x09, sp), y
      009A23 0F 08            [ 1]  882 	clr	(0x08, sp)
      009A25 0F 07            [ 1]  883 	clr	(0x07, sp)
      009A27 1E 09            [ 2]  884 	ldw	x, (0x09, sp)
      009A29 89               [ 2]  885 	pushw	x
      009A2A 1E 09            [ 2]  886 	ldw	x, (0x09, sp)
      009A2C 89               [ 2]  887 	pushw	x
      009A2D CD 8F 0E         [ 4]  888 	call	_eeprom_read
      009A30 5B 04            [ 2]  889 	addw	sp, #4
      009A32 6B 0F            [ 1]  890 	ld	(0x0f, sp), a
      009A34 27 08            [ 1]  891 	jreq	00156$
      009A36 C6 00 25         [ 1]  892 	ld	a, _app_loop_relay_flag_131072_387+0
      009A39 AA 01            [ 1]  893 	or	a, #0x01
      009A3B C7 00 25         [ 1]  894 	ld	_app_loop_relay_flag_131072_387+0, a
      009A3E                        895 00156$:
                                    896 ;	driver/app.c: 39: for(i=0;i<16;i++)//共16条规则
      009A3E 72 5C 00 23      [ 1]  897 	inc	_app_loop_i_131072_387+0
      009A42 C6 00 23         [ 1]  898 	ld	a, _app_loop_i_131072_387+0
      009A45 A1 10            [ 1]  899 	cp	a, #0x10
      009A47 24 03            [ 1]  900 	jrnc	00678$
      009A49 CC 96 48         [ 2]  901 	jp	00240$
      009A4C                        902 00678$:
                                    903 ;	driver/app.c: 175: if(beep_flag) beep_on(); else beep_off();
      009A4C 72 5D 00 24      [ 1]  904 	tnz	_app_loop_beep_flag_131072_387+0
      009A50 27 05            [ 1]  905 	jreq	00159$
      009A52 CD 94 7C         [ 4]  906 	call	_beep_on
      009A55 20 03            [ 2]  907 	jra	00160$
      009A57                        908 00159$:
      009A57 CD 94 95         [ 4]  909 	call	_beep_off
      009A5A                        910 00160$:
                                    911 ;	driver/app.c: 176: if(relay_flag) relay_on(); else relay_off();
      009A5A 72 5D 00 25      [ 1]  912 	tnz	_app_loop_relay_flag_131072_387+0
      009A5E 27 05            [ 1]  913 	jreq	00162$
      009A60 CD 8A DE         [ 4]  914 	call	_relay_on
      009A63 20 03            [ 2]  915 	jra	00165$
      009A65                        916 00162$:
      009A65 CD 8A F7         [ 4]  917 	call	_relay_off
      009A68                        918 00165$:
                                    919 ;	driver/app.c: 180: if(keycount[0]||keycount[1]||keycount[2]||keycount[3]||keycount[4]) //按键处理
      009A68 C6 00 99         [ 1]  920 	ld	a, _keycount
      009A6B AE 00 9A         [ 2]  921 	ldw	x, #_keycount+1
      009A6E 1F 0D            [ 2]  922 	ldw	(0x0d, sp), x
      009A70 AE 00 9B         [ 2]  923 	ldw	x, #_keycount+2
      009A73 1F 12            [ 2]  924 	ldw	(0x12, sp), x
      009A75 AE 00 9C         [ 2]  925 	ldw	x, #_keycount+3
      009A78 1F 10            [ 2]  926 	ldw	(0x10, sp), x
      009A7A AE 00 9D         [ 2]  927 	ldw	x, #_keycount+4
      009A7D 1F 2D            [ 2]  928 	ldw	(0x2d, sp), x
      009A7F 4D               [ 1]  929 	tnz	a
      009A80 26 17            [ 1]  930 	jrne	00212$
      009A82 1E 0D            [ 2]  931 	ldw	x, (0x0d, sp)
      009A84 F6               [ 1]  932 	ld	a, (x)
      009A85 26 12            [ 1]  933 	jrne	00212$
      009A87 1E 12            [ 2]  934 	ldw	x, (0x12, sp)
      009A89 F6               [ 1]  935 	ld	a, (x)
      009A8A 26 0D            [ 1]  936 	jrne	00212$
      009A8C 1E 10            [ 2]  937 	ldw	x, (0x10, sp)
      009A8E F6               [ 1]  938 	ld	a, (x)
      009A8F 26 08            [ 1]  939 	jrne	00212$
      009A91 1E 2D            [ 2]  940 	ldw	x, (0x2d, sp)
      009A93 F6               [ 1]  941 	ld	a, (x)
      009A94 26 03            [ 1]  942 	jrne	00685$
      009A96 CC 9D BA         [ 2]  943 	jp	00213$
      009A99                        944 00685$:
      009A99                        945 00212$:
                                    946 ;	driver/app.c: 182: OLED_Clear();
      009A99 CD A1 9F         [ 4]  947 	call	_OLED_Clear
                                    948 ;	driver/app.c: 183: if(keycount[0])//浇水按键
      009A9C C6 00 99         [ 1]  949 	ld	a, _keycount
      009A9F 27 3B            [ 1]  950 	jreq	00167$
                                    951 ;	driver/app.c: 186: is_rule_on=eeprom_read(4);//保存规则运行信息
      009AA1 4B 04            [ 1]  952 	push	#0x04
      009AA3 5F               [ 1]  953 	clrw	x
      009AA4 89               [ 2]  954 	pushw	x
      009AA5 4B 00            [ 1]  955 	push	#0x00
      009AA7 CD 8F 0E         [ 4]  956 	call	_eeprom_read
      009AAA 5B 04            [ 2]  957 	addw	sp, #4
      009AAC C7 00 2A         [ 1]  958 	ld	_app_loop_is_rule_on_196608_411+0, a
                                    959 ;	driver/app.c: 187: relay_read()?(eeprom_write(4,is_rule_on),relay_off()):(eeprom_write(4,0),relay_on());
      009AAF CD 8A D2         [ 4]  960 	call	_relay_read
      009AB2 4D               [ 1]  961 	tnz	a
      009AB3 27 13            [ 1]  962 	jreq	00257$
      009AB5 3B 00 2A         [ 1]  963 	push	_app_loop_is_rule_on_196608_411+0
      009AB8 4B 04            [ 1]  964 	push	#0x04
      009ABA 5F               [ 1]  965 	clrw	x
      009ABB 89               [ 2]  966 	pushw	x
      009ABC 4B 00            [ 1]  967 	push	#0x00
      009ABE CD 8F 27         [ 4]  968 	call	_eeprom_write
      009AC1 5B 05            [ 2]  969 	addw	sp, #5
      009AC3 CD 8A F7         [ 4]  970 	call	_relay_off
      009AC6 20 10            [ 2]  971 	jra	00258$
      009AC8                        972 00257$:
      009AC8 4B 00            [ 1]  973 	push	#0x00
      009ACA 4B 04            [ 1]  974 	push	#0x04
      009ACC 5F               [ 1]  975 	clrw	x
      009ACD 89               [ 2]  976 	pushw	x
      009ACE 4B 00            [ 1]  977 	push	#0x00
      009AD0 CD 8F 27         [ 4]  978 	call	_eeprom_write
      009AD3 5B 05            [ 2]  979 	addw	sp, #5
      009AD5 CD 8A DE         [ 4]  980 	call	_relay_on
      009AD8                        981 00258$:
                                    982 ;	driver/app.c: 188: keycount[0]=0;
      009AD8 35 00 00 99      [ 1]  983 	mov	_keycount+0, #0x00
      009ADC                        984 00167$:
                                    985 ;	driver/app.c: 191: if(keycount[1]) //上一级菜单
      009ADC 1E 0D            [ 2]  986 	ldw	x, (0x0d, sp)
      009ADE F6               [ 1]  987 	ld	a, (x)
      009ADF 27 61            [ 1]  988 	jreq	00174$
                                    989 ;	driver/app.c: 193: if(status==0) eeprom_read(4)?eeprom_write(4,0):eeprom_write(4,1);//控制规则总开关
      009AE1 CE 00 1C         [ 2]  990 	ldw	x, _app_loop_status_65536_386+0
      009AE4 26 2A            [ 1]  991 	jrne	00169$
      009AE6 4B 04            [ 1]  992 	push	#0x04
      009AE8 5F               [ 1]  993 	clrw	x
      009AE9 89               [ 2]  994 	pushw	x
      009AEA 4B 00            [ 1]  995 	push	#0x00
      009AEC CD 8F 0E         [ 4]  996 	call	_eeprom_read
      009AEF 5B 04            [ 2]  997 	addw	sp, #4
      009AF1 4D               [ 1]  998 	tnz	a
      009AF2 27 0F            [ 1]  999 	jreq	00259$
      009AF4 4B 00            [ 1] 1000 	push	#0x00
      009AF6 4B 04            [ 1] 1001 	push	#0x04
      009AF8 5F               [ 1] 1002 	clrw	x
      009AF9 89               [ 2] 1003 	pushw	x
      009AFA 4B 00            [ 1] 1004 	push	#0x00
      009AFC CD 8F 27         [ 4] 1005 	call	_eeprom_write
      009AFF 5B 05            [ 2] 1006 	addw	sp, #5
      009B01 20 0D            [ 2] 1007 	jra	00169$
      009B03                       1008 00259$:
      009B03 4B 01            [ 1] 1009 	push	#0x01
      009B05 4B 04            [ 1] 1010 	push	#0x04
      009B07 5F               [ 1] 1011 	clrw	x
      009B08 89               [ 2] 1012 	pushw	x
      009B09 4B 00            [ 1] 1013 	push	#0x00
      009B0B CD 8F 27         [ 4] 1014 	call	_eeprom_write
      009B0E 5B 05            [ 2] 1015 	addw	sp, #5
      009B10                       1016 00169$:
                                   1017 ;	driver/app.c: 194: if(status&0xff) {status=status&0xff00;eeprom_write(3,0);}
      009B10 72 5D 00 1D      [ 1] 1018 	tnz	_app_loop_status_65536_386+1
      009B14 27 18            [ 1] 1019 	jreq	00171$
      009B16 4F               [ 1] 1020 	clr	a
      009B17 97               [ 1] 1021 	ld	xl, a
      009B18 C6 00 1C         [ 1] 1022 	ld	a, _app_loop_status_65536_386+0
      009B1B 95               [ 1] 1023 	ld	xh, a
      009B1C CF 00 1C         [ 2] 1024 	ldw	_app_loop_status_65536_386+0, x
      009B1F 4B 00            [ 1] 1025 	push	#0x00
      009B21 4B 03            [ 1] 1026 	push	#0x03
      009B23 5F               [ 1] 1027 	clrw	x
      009B24 89               [ 2] 1028 	pushw	x
      009B25 4B 00            [ 1] 1029 	push	#0x00
      009B27 CD 8F 27         [ 4] 1030 	call	_eeprom_write
      009B2A 5B 05            [ 2] 1031 	addw	sp, #5
      009B2C 20 11            [ 2] 1032 	jra	00172$
      009B2E                       1033 00171$:
                                   1034 ;	driver/app.c: 195: else {status=0;eeprom_write(2,0);}
      009B2E 5F               [ 1] 1035 	clrw	x
      009B2F CF 00 1C         [ 2] 1036 	ldw	_app_loop_status_65536_386+0, x
      009B32 4B 00            [ 1] 1037 	push	#0x00
      009B34 4B 02            [ 1] 1038 	push	#0x02
      009B36 5F               [ 1] 1039 	clrw	x
      009B37 89               [ 2] 1040 	pushw	x
      009B38 4B 00            [ 1] 1041 	push	#0x00
      009B3A CD 8F 27         [ 4] 1042 	call	_eeprom_write
      009B3D 5B 05            [ 2] 1043 	addw	sp, #5
      009B3F                       1044 00172$:
                                   1045 ;	driver/app.c: 196: keycount[1]=0;
      009B3F 1E 0D            [ 2] 1046 	ldw	x, (0x0d, sp)
      009B41 7F               [ 1] 1047 	clr	(x)
      009B42                       1048 00174$:
                                   1049 ;	driver/app.c: 198: if(keycount[2])//下一级菜单,第三级界面地址加
      009B42 1E 12            [ 2] 1050 	ldw	x, (0x12, sp)
      009B44 F6               [ 1] 1051 	ld	a, (x)
      009B45 27 65            [ 1] 1052 	jreq	00183$
                                   1053 ;	driver/app.c: 200: if(status&0xff00) {
      009B47 0F 2C            [ 1] 1054 	clr	(0x2c, sp)
      009B49 C6 00 1C         [ 1] 1055 	ld	a, _app_loop_status_65536_386+0
      009B4C 6B 2B            [ 1] 1056 	ld	(0x2b, sp), a
      009B4E 1E 2B            [ 2] 1057 	ldw	x, (0x2b, sp)
      009B50 27 3D            [ 1] 1058 	jreq	00180$
                                   1059 ;	driver/app.c: 201: if((status&0xff)==0||(status&0xff)==32)//第三级界面地址在1～32之间
      009B52 C6 00 1D         [ 1] 1060 	ld	a, _app_loop_status_65536_386+1
      009B55 97               [ 1] 1061 	ld	xl, a
      009B56 4F               [ 1] 1062 	clr	a
      009B57 95               [ 1] 1063 	ld	xh, a
      009B58 5D               [ 2] 1064 	tnzw	x
      009B59 27 05            [ 1] 1065 	jreq	00175$
      009B5B A3 00 20         [ 2] 1066 	cpw	x, #0x0020
      009B5E 26 17            [ 1] 1067 	jrne	00176$
      009B60                       1068 00175$:
                                   1069 ;	driver/app.c: 203: status=(status&0xff00)|0x01;
      009B60 1E 2B            [ 2] 1070 	ldw	x, (0x2b, sp)
      009B62 54               [ 2] 1071 	srlw	x
      009B63 99               [ 1] 1072 	scf
      009B64 59               [ 2] 1073 	rlcw	x
      009B65 CF 00 1C         [ 2] 1074 	ldw	_app_loop_status_65536_386+0, x
                                   1075 ;	driver/app.c: 204: eeprom_write(3,1);
      009B68 4B 01            [ 1] 1076 	push	#0x01
      009B6A 4B 03            [ 1] 1077 	push	#0x03
      009B6C 5F               [ 1] 1078 	clrw	x
      009B6D 89               [ 2] 1079 	pushw	x
      009B6E 4B 00            [ 1] 1080 	push	#0x00
      009B70 CD 8F 27         [ 4] 1081 	call	_eeprom_write
      009B73 5B 05            [ 2] 1082 	addw	sp, #5
      009B75 20 32            [ 2] 1083 	jra	00181$
      009B77                       1084 00176$:
                                   1085 ;	driver/app.c: 207: status=status+1;
      009B77 CE 00 1C         [ 2] 1086 	ldw	x, _app_loop_status_65536_386+0
      009B7A 5C               [ 1] 1087 	incw	x
      009B7B CF 00 1C         [ 2] 1088 	ldw	_app_loop_status_65536_386+0, x
                                   1089 ;	driver/app.c: 208: eeprom_write(3,status&0xff);
      009B7E C6 00 1D         [ 1] 1090 	ld	a, _app_loop_status_65536_386+1
      009B81 88               [ 1] 1091 	push	a
      009B82 4B 03            [ 1] 1092 	push	#0x03
      009B84 5F               [ 1] 1093 	clrw	x
      009B85 89               [ 2] 1094 	pushw	x
      009B86 4B 00            [ 1] 1095 	push	#0x00
      009B88 CD 8F 27         [ 4] 1096 	call	_eeprom_write
      009B8B 5B 05            [ 2] 1097 	addw	sp, #5
      009B8D 20 1A            [ 2] 1098 	jra	00181$
      009B8F                       1099 00180$:
                                   1100 ;	driver/app.c: 211: else {status=status|0x0100;eeprom_write(2,1);}
      009B8F C6 00 1D         [ 1] 1101 	ld	a, _app_loop_status_65536_386+1
      009B92 97               [ 1] 1102 	ld	xl, a
      009B93 C6 00 1C         [ 1] 1103 	ld	a, _app_loop_status_65536_386+0
      009B96 AA 01            [ 1] 1104 	or	a, #0x01
      009B98 95               [ 1] 1105 	ld	xh, a
      009B99 CF 00 1C         [ 2] 1106 	ldw	_app_loop_status_65536_386+0, x
      009B9C 4B 01            [ 1] 1107 	push	#0x01
      009B9E 4B 02            [ 1] 1108 	push	#0x02
      009BA0 5F               [ 1] 1109 	clrw	x
      009BA1 89               [ 2] 1110 	pushw	x
      009BA2 4B 00            [ 1] 1111 	push	#0x00
      009BA4 CD 8F 27         [ 4] 1112 	call	_eeprom_write
      009BA7 5B 05            [ 2] 1113 	addw	sp, #5
      009BA9                       1114 00181$:
                                   1115 ;	driver/app.c: 212: keycount[2]=0;
      009BA9 1E 12            [ 2] 1116 	ldw	x, (0x12, sp)
      009BAB 7F               [ 1] 1117 	clr	(x)
      009BAC                       1118 00183$:
                                   1119 ;	driver/app.c: 214: if(keycount[3]) //数值加
      009BAC 1E 10            [ 2] 1120 	ldw	x, (0x10, sp)
      009BAE F6               [ 1] 1121 	ld	a, (x)
      009BAF 26 03            [ 1] 1122 	jrne	00698$
      009BB1 CC 9C B0         [ 2] 1123 	jp	00197$
      009BB4                       1124 00698$:
                                   1125 ;	driver/app.c: 216: if(status==0) {//修改小时数
      009BB4 CE 00 1C         [ 2] 1126 	ldw	x, _app_loop_status_65536_386+0
      009BB7 26 71            [ 1] 1127 	jrne	00187$
                                   1128 ;	driver/app.c: 218: h=ds_time.hour/16*10+ds_time.hour%16;
      009BB9 AE 00 05         [ 2] 1129 	ldw	x, #_ds_time+4
      009BBC 1F 31            [ 2] 1130 	ldw	(0x31, sp), x
      009BBE F6               [ 1] 1131 	ld	a, (x)
      009BBF 6B 30            [ 1] 1132 	ld	(0x30, sp), a
      009BC1 0F 2F            [ 1] 1133 	clr	(0x2f, sp)
      009BC3 4B 10            [ 1] 1134 	push	#0x10
      009BC5 4B 00            [ 1] 1135 	push	#0x00
      009BC7 1E 31            [ 2] 1136 	ldw	x, (0x31, sp)
      009BC9 89               [ 2] 1137 	pushw	x
      009BCA CD B9 AC         [ 4] 1138 	call	__divsint
      009BCD 5B 04            [ 2] 1139 	addw	sp, #4
      009BCF A6 0A            [ 1] 1140 	ld	a, #0x0a
      009BD1 42               [ 4] 1141 	mul	x, a
      009BD2 41               [ 1] 1142 	exg	a, xl
      009BD3 6B 35            [ 1] 1143 	ld	(0x35, sp), a
      009BD5 41               [ 1] 1144 	exg	a, xl
      009BD6 4B 10            [ 1] 1145 	push	#0x10
      009BD8 4B 00            [ 1] 1146 	push	#0x00
      009BDA 1E 31            [ 2] 1147 	ldw	x, (0x31, sp)
      009BDC 89               [ 2] 1148 	pushw	x
      009BDD CD B9 96         [ 4] 1149 	call	__modsint
      009BE0 5B 04            [ 2] 1150 	addw	sp, #4
      009BE2 9F               [ 1] 1151 	ld	a, xl
      009BE3 1B 35            [ 1] 1152 	add	a, (0x35, sp)
      009BE5 C7 00 2B         [ 1] 1153 	ld	_app_loop_h_262144_421+0, a
                                   1154 ;	driver/app.c: 219: h++;
      009BE8 72 5C 00 2B      [ 1] 1155 	inc	_app_loop_h_262144_421+0
                                   1156 ;	driver/app.c: 220: if(h>=24) h=0;
      009BEC C6 00 2B         [ 1] 1157 	ld	a, _app_loop_h_262144_421+0
      009BEF A1 18            [ 1] 1158 	cp	a, #0x18
      009BF1 25 04            [ 1] 1159 	jrc	00185$
      009BF3 72 5F 00 2B      [ 1] 1160 	clr	_app_loop_h_262144_421+0
      009BF7                       1161 00185$:
                                   1162 ;	driver/app.c: 221: ds_time.hour=h/10*16+h%10;
      009BF7 5F               [ 1] 1163 	clrw	x
      009BF8 C6 00 2B         [ 1] 1164 	ld	a, _app_loop_h_262144_421+0
      009BFB 97               [ 1] 1165 	ld	xl, a
      009BFC 89               [ 2] 1166 	pushw	x
      009BFD 4B 0A            [ 1] 1167 	push	#0x0a
      009BFF 4B 00            [ 1] 1168 	push	#0x00
      009C01 89               [ 2] 1169 	pushw	x
      009C02 CD B9 AC         [ 4] 1170 	call	__divsint
      009C05 5B 04            [ 2] 1171 	addw	sp, #4
      009C07 1F 35            [ 2] 1172 	ldw	(0x35, sp), x
      009C09 85               [ 2] 1173 	popw	x
      009C0A 7B 34            [ 1] 1174 	ld	a, (0x34, sp)
      009C0C 4E               [ 1] 1175 	swap	a
      009C0D A4 F0            [ 1] 1176 	and	a, #0xf0
      009C0F 6B 37            [ 1] 1177 	ld	(0x37, sp), a
      009C11 4B 0A            [ 1] 1178 	push	#0x0a
      009C13 4B 00            [ 1] 1179 	push	#0x00
      009C15 89               [ 2] 1180 	pushw	x
      009C16 CD B9 96         [ 4] 1181 	call	__modsint
      009C19 5B 04            [ 2] 1182 	addw	sp, #4
      009C1B 9F               [ 1] 1183 	ld	a, xl
      009C1C 1B 37            [ 1] 1184 	add	a, (0x37, sp)
      009C1E 1E 31            [ 2] 1185 	ldw	x, (0x31, sp)
      009C20 F7               [ 1] 1186 	ld	(x), a
                                   1187 ;	driver/app.c: 222: ds1302_write_time(&ds_time);
      009C21 4B 01            [ 1] 1188 	push	#<_ds_time
      009C23 4B 00            [ 1] 1189 	push	#(_ds_time >> 8)
      009C25 CD 8D 79         [ 4] 1190 	call	_ds1302_write_time
      009C28 5B 02            [ 2] 1191 	addw	sp, #2
      009C2A                       1192 00187$:
                                   1193 ;	driver/app.c: 225: if(status&0xff)//加数值
      009C2A 72 5D 00 1D      [ 1] 1194 	tnz	_app_loop_status_65536_386+1
      009C2E 27 40            [ 1] 1195 	jreq	00194$
                                   1196 ;	driver/app.c: 227: eeprom_write((status>>8)*32+status&0xff-1,eeprom_read((status>>8)*32+status&0xff-1)+1);
      009C30 5F               [ 1] 1197 	clrw	x
      009C31 C6 00 1C         [ 1] 1198 	ld	a, _app_loop_status_65536_386+0
      009C34 97               [ 1] 1199 	ld	xl, a
      009C35 58               [ 2] 1200 	sllw	x
      009C36 58               [ 2] 1201 	sllw	x
      009C37 58               [ 2] 1202 	sllw	x
      009C38 58               [ 2] 1203 	sllw	x
      009C39 58               [ 2] 1204 	sllw	x
      009C3A 72 BB 00 1C      [ 2] 1205 	addw	x, _app_loop_status_65536_386+0
      009C3E 54               [ 2] 1206 	srlw	x
      009C3F 58               [ 2] 1207 	sllw	x
      009C40 4F               [ 1] 1208 	clr	a
      009C41 95               [ 1] 1209 	ld	xh, a
      009C42 90 5F            [ 1] 1210 	clrw	y
      009C44 89               [ 2] 1211 	pushw	x
      009C45 90 89            [ 2] 1212 	pushw	y
      009C47 CD 8F 0E         [ 4] 1213 	call	_eeprom_read
      009C4A 5B 04            [ 2] 1214 	addw	sp, #4
      009C4C 4C               [ 1] 1215 	inc	a
      009C4D 6B 36            [ 1] 1216 	ld	(0x36, sp), a
      009C4F 5F               [ 1] 1217 	clrw	x
      009C50 C6 00 1C         [ 1] 1218 	ld	a, _app_loop_status_65536_386+0
      009C53 97               [ 1] 1219 	ld	xl, a
      009C54 58               [ 2] 1220 	sllw	x
      009C55 58               [ 2] 1221 	sllw	x
      009C56 58               [ 2] 1222 	sllw	x
      009C57 58               [ 2] 1223 	sllw	x
      009C58 58               [ 2] 1224 	sllw	x
      009C59 72 BB 00 1C      [ 2] 1225 	addw	x, _app_loop_status_65536_386+0
      009C5D 54               [ 2] 1226 	srlw	x
      009C5E 58               [ 2] 1227 	sllw	x
      009C5F 4F               [ 1] 1228 	clr	a
      009C60 95               [ 1] 1229 	ld	xh, a
      009C61 90 5F            [ 1] 1230 	clrw	y
      009C63 7B 36            [ 1] 1231 	ld	a, (0x36, sp)
      009C65 88               [ 1] 1232 	push	a
      009C66 89               [ 2] 1233 	pushw	x
      009C67 90 89            [ 2] 1234 	pushw	y
      009C69 CD 8F 27         [ 4] 1235 	call	_eeprom_write
      009C6C 5B 05            [ 2] 1236 	addw	sp, #5
      009C6E 20 3D            [ 2] 1237 	jra	00195$
      009C70                       1238 00194$:
                                   1239 ;	driver/app.c: 229: else if(status&0xff00) //加规则引索
      009C70 4F               [ 1] 1240 	clr	a
      009C71 97               [ 1] 1241 	ld	xl, a
      009C72 C6 00 1C         [ 1] 1242 	ld	a, _app_loop_status_65536_386+0
      009C75 95               [ 1] 1243 	ld	xh, a
      009C76 5D               [ 2] 1244 	tnzw	x
      009C77 27 34            [ 1] 1245 	jreq	00195$
                                   1246 ;	driver/app.c: 231: if((status&0xff00)==0x1000)//共16条规则
      009C79 A3 10 00         [ 2] 1247 	cpw	x, #0x1000
      009C7C 26 15            [ 1] 1248 	jrne	00189$
                                   1249 ;	driver/app.c: 233: status=0x0100;
      009C7E AE 01 00         [ 2] 1250 	ldw	x, #0x0100
      009C81 CF 00 1C         [ 2] 1251 	ldw	_app_loop_status_65536_386+0, x
                                   1252 ;	driver/app.c: 234: eeprom_write(2,1);
      009C84 4B 01            [ 1] 1253 	push	#0x01
      009C86 4B 02            [ 1] 1254 	push	#0x02
      009C88 5F               [ 1] 1255 	clrw	x
      009C89 89               [ 2] 1256 	pushw	x
      009C8A 4B 00            [ 1] 1257 	push	#0x00
      009C8C CD 8F 27         [ 4] 1258 	call	_eeprom_write
      009C8F 5B 05            [ 2] 1259 	addw	sp, #5
      009C91 20 1A            [ 2] 1260 	jra	00195$
      009C93                       1261 00189$:
                                   1262 ;	driver/app.c: 238: status+=0x0100;
      009C93 CE 00 1C         [ 2] 1263 	ldw	x, _app_loop_status_65536_386+0
      009C96 1C 01 00         [ 2] 1264 	addw	x, #0x0100
      009C99 CF 00 1C         [ 2] 1265 	ldw	_app_loop_status_65536_386+0, x
                                   1266 ;	driver/app.c: 239: eeprom_write(2,status>>8);
      009C9C C6 00 1C         [ 1] 1267 	ld	a, _app_loop_status_65536_386+0
      009C9F 0F 3A            [ 1] 1268 	clr	(0x3a, sp)
      009CA1 88               [ 1] 1269 	push	a
      009CA2 4B 02            [ 1] 1270 	push	#0x02
      009CA4 5F               [ 1] 1271 	clrw	x
      009CA5 89               [ 2] 1272 	pushw	x
      009CA6 4B 00            [ 1] 1273 	push	#0x00
      009CA8 CD 8F 27         [ 4] 1274 	call	_eeprom_write
      009CAB 5B 05            [ 2] 1275 	addw	sp, #5
      009CAD                       1276 00195$:
                                   1277 ;	driver/app.c: 242: keycount[3]=0;
      009CAD 1E 10            [ 2] 1278 	ldw	x, (0x10, sp)
      009CAF 7F               [ 1] 1279 	clr	(x)
      009CB0                       1280 00197$:
                                   1281 ;	driver/app.c: 244: if(keycount[4]) //数值减
      009CB0 1E 2D            [ 2] 1282 	ldw	x, (0x2d, sp)
      009CB2 F6               [ 1] 1283 	ld	a, (x)
      009CB3 26 03            [ 1] 1284 	jrne	00706$
      009CB5 CC 9D BA         [ 2] 1285 	jp	00213$
      009CB8                       1286 00706$:
                                   1287 ;	driver/app.c: 246: if(status==0) {//修改分钟数
      009CB8 CE 00 1C         [ 2] 1288 	ldw	x, _app_loop_status_65536_386+0
      009CBB 26 71            [ 1] 1289 	jrne	00201$
                                   1290 ;	driver/app.c: 248: m=ds_time.minute/16*10+ds_time.minute%16;
      009CBD AE 00 06         [ 2] 1291 	ldw	x, #_ds_time+5
      009CC0 1F 38            [ 2] 1292 	ldw	(0x38, sp), x
      009CC2 F6               [ 1] 1293 	ld	a, (x)
      009CC3 6B 3E            [ 1] 1294 	ld	(0x3e, sp), a
      009CC5 0F 3D            [ 1] 1295 	clr	(0x3d, sp)
      009CC7 4B 10            [ 1] 1296 	push	#0x10
      009CC9 4B 00            [ 1] 1297 	push	#0x00
      009CCB 1E 3F            [ 2] 1298 	ldw	x, (0x3f, sp)
      009CCD 89               [ 2] 1299 	pushw	x
      009CCE CD B9 AC         [ 4] 1300 	call	__divsint
      009CD1 5B 04            [ 2] 1301 	addw	sp, #4
      009CD3 A6 0A            [ 1] 1302 	ld	a, #0x0a
      009CD5 42               [ 4] 1303 	mul	x, a
      009CD6 41               [ 1] 1304 	exg	a, xl
      009CD7 6B 3C            [ 1] 1305 	ld	(0x3c, sp), a
      009CD9 41               [ 1] 1306 	exg	a, xl
      009CDA 4B 10            [ 1] 1307 	push	#0x10
      009CDC 4B 00            [ 1] 1308 	push	#0x00
      009CDE 1E 3F            [ 2] 1309 	ldw	x, (0x3f, sp)
      009CE0 89               [ 2] 1310 	pushw	x
      009CE1 CD B9 96         [ 4] 1311 	call	__modsint
      009CE4 5B 04            [ 2] 1312 	addw	sp, #4
      009CE6 9F               [ 1] 1313 	ld	a, xl
      009CE7 1B 3C            [ 1] 1314 	add	a, (0x3c, sp)
      009CE9 C7 00 2C         [ 1] 1315 	ld	_app_loop_m_262144_427+0, a
                                   1316 ;	driver/app.c: 249: m++;
      009CEC 72 5C 00 2C      [ 1] 1317 	inc	_app_loop_m_262144_427+0
                                   1318 ;	driver/app.c: 250: if(m>=60) m=0;
      009CF0 C6 00 2C         [ 1] 1319 	ld	a, _app_loop_m_262144_427+0
      009CF3 A1 3C            [ 1] 1320 	cp	a, #0x3c
      009CF5 25 04            [ 1] 1321 	jrc	00199$
      009CF7 72 5F 00 2C      [ 1] 1322 	clr	_app_loop_m_262144_427+0
      009CFB                       1323 00199$:
                                   1324 ;	driver/app.c: 251: ds_time.minute=m/10*16+m%10;
      009CFB 5F               [ 1] 1325 	clrw	x
      009CFC C6 00 2C         [ 1] 1326 	ld	a, _app_loop_m_262144_427+0
      009CFF 97               [ 1] 1327 	ld	xl, a
      009D00 89               [ 2] 1328 	pushw	x
      009D01 4B 0A            [ 1] 1329 	push	#0x0a
      009D03 4B 00            [ 1] 1330 	push	#0x00
      009D05 89               [ 2] 1331 	pushw	x
      009D06 CD B9 AC         [ 4] 1332 	call	__divsint
      009D09 5B 04            [ 2] 1333 	addw	sp, #4
      009D0B 1F 42            [ 2] 1334 	ldw	(0x42, sp), x
      009D0D 85               [ 2] 1335 	popw	x
      009D0E 7B 41            [ 1] 1336 	ld	a, (0x41, sp)
      009D10 4E               [ 1] 1337 	swap	a
      009D11 A4 F0            [ 1] 1338 	and	a, #0xf0
      009D13 6B 3F            [ 1] 1339 	ld	(0x3f, sp), a
      009D15 4B 0A            [ 1] 1340 	push	#0x0a
      009D17 4B 00            [ 1] 1341 	push	#0x00
      009D19 89               [ 2] 1342 	pushw	x
      009D1A CD B9 96         [ 4] 1343 	call	__modsint
      009D1D 5B 04            [ 2] 1344 	addw	sp, #4
      009D1F 9F               [ 1] 1345 	ld	a, xl
      009D20 1B 3F            [ 1] 1346 	add	a, (0x3f, sp)
      009D22 1E 38            [ 2] 1347 	ldw	x, (0x38, sp)
      009D24 F7               [ 1] 1348 	ld	(x), a
                                   1349 ;	driver/app.c: 252: ds1302_write_time(&ds_time);
      009D25 4B 01            [ 1] 1350 	push	#<_ds_time
      009D27 4B 00            [ 1] 1351 	push	#(_ds_time >> 8)
      009D29 CD 8D 79         [ 4] 1352 	call	_ds1302_write_time
      009D2C 5B 02            [ 2] 1353 	addw	sp, #2
      009D2E                       1354 00201$:
                                   1355 ;	driver/app.c: 254: if(status&0xff)//减数值
      009D2E 90 CE 00 1C      [ 2] 1356 	ldw	y, _app_loop_status_65536_386+0
      009D32 17 43            [ 2] 1357 	ldw	(0x43, sp), y
      009D34 0F 43            [ 1] 1358 	clr	(0x43, sp)
      009D36 1E 43            [ 2] 1359 	ldw	x, (0x43, sp)
      009D38 27 40            [ 1] 1360 	jreq	00208$
                                   1361 ;	driver/app.c: 256: eeprom_write((status>>8)*32+(status&0xff)-1,eeprom_read((status>>8)*32+(status&0xff)-1)-1);
      009D3A 5F               [ 1] 1362 	clrw	x
      009D3B C6 00 1C         [ 1] 1363 	ld	a, _app_loop_status_65536_386+0
      009D3E 97               [ 1] 1364 	ld	xl, a
      009D3F 58               [ 2] 1365 	sllw	x
      009D40 58               [ 2] 1366 	sllw	x
      009D41 58               [ 2] 1367 	sllw	x
      009D42 58               [ 2] 1368 	sllw	x
      009D43 58               [ 2] 1369 	sllw	x
      009D44 72 FB 43         [ 2] 1370 	addw	x, (0x43, sp)
      009D47 5A               [ 2] 1371 	decw	x
      009D48 90 5F            [ 1] 1372 	clrw	y
      009D4A 89               [ 2] 1373 	pushw	x
      009D4B 90 89            [ 2] 1374 	pushw	y
      009D4D CD 8F 0E         [ 4] 1375 	call	_eeprom_read
      009D50 5B 04            [ 2] 1376 	addw	sp, #4
      009D52 4A               [ 1] 1377 	dec	a
      009D53 6B 42            [ 1] 1378 	ld	(0x42, sp), a
      009D55 5F               [ 1] 1379 	clrw	x
      009D56 C6 00 1C         [ 1] 1380 	ld	a, _app_loop_status_65536_386+0
      009D59 97               [ 1] 1381 	ld	xl, a
      009D5A 58               [ 2] 1382 	sllw	x
      009D5B 58               [ 2] 1383 	sllw	x
      009D5C 58               [ 2] 1384 	sllw	x
      009D5D 58               [ 2] 1385 	sllw	x
      009D5E 58               [ 2] 1386 	sllw	x
      009D5F 90 CE 00 1C      [ 2] 1387 	ldw	y, _app_loop_status_65536_386+0
      009D63 17 47            [ 2] 1388 	ldw	(0x47, sp), y
      009D65 0F 47            [ 1] 1389 	clr	(0x47, sp)
      009D67 72 FB 47         [ 2] 1390 	addw	x, (0x47, sp)
      009D6A 5A               [ 2] 1391 	decw	x
      009D6B 90 5F            [ 1] 1392 	clrw	y
      009D6D 7B 42            [ 1] 1393 	ld	a, (0x42, sp)
      009D6F 88               [ 1] 1394 	push	a
      009D70 89               [ 2] 1395 	pushw	x
      009D71 90 89            [ 2] 1396 	pushw	y
      009D73 CD 8F 27         [ 4] 1397 	call	_eeprom_write
      009D76 5B 05            [ 2] 1398 	addw	sp, #5
      009D78 20 3D            [ 2] 1399 	jra	00209$
      009D7A                       1400 00208$:
                                   1401 ;	driver/app.c: 258: else if(status&0xff00) //减规则引索
      009D7A 4F               [ 1] 1402 	clr	a
      009D7B 97               [ 1] 1403 	ld	xl, a
      009D7C C6 00 1C         [ 1] 1404 	ld	a, _app_loop_status_65536_386+0
      009D7F 95               [ 1] 1405 	ld	xh, a
      009D80 5D               [ 2] 1406 	tnzw	x
      009D81 27 34            [ 1] 1407 	jreq	00209$
                                   1408 ;	driver/app.c: 260: if((status&0xff00)==0x0100)//共16条规则
      009D83 A3 01 00         [ 2] 1409 	cpw	x, #0x0100
      009D86 26 15            [ 1] 1410 	jrne	00203$
                                   1411 ;	driver/app.c: 262: status=0x1000;
      009D88 AE 10 00         [ 2] 1412 	ldw	x, #0x1000
      009D8B CF 00 1C         [ 2] 1413 	ldw	_app_loop_status_65536_386+0, x
                                   1414 ;	driver/app.c: 263: eeprom_write(2,0x10);
      009D8E 4B 10            [ 1] 1415 	push	#0x10
      009D90 4B 02            [ 1] 1416 	push	#0x02
      009D92 5F               [ 1] 1417 	clrw	x
      009D93 89               [ 2] 1418 	pushw	x
      009D94 4B 00            [ 1] 1419 	push	#0x00
      009D96 CD 8F 27         [ 4] 1420 	call	_eeprom_write
      009D99 5B 05            [ 2] 1421 	addw	sp, #5
      009D9B 20 1A            [ 2] 1422 	jra	00209$
      009D9D                       1423 00203$:
                                   1424 ;	driver/app.c: 267: status-=0x0100;
      009D9D CE 00 1C         [ 2] 1425 	ldw	x, _app_loop_status_65536_386+0
      009DA0 1D 01 00         [ 2] 1426 	subw	x, #0x0100
      009DA3 CF 00 1C         [ 2] 1427 	ldw	_app_loop_status_65536_386+0, x
                                   1428 ;	driver/app.c: 268: eeprom_write(2,status>>8);
      009DA6 C6 00 1C         [ 1] 1429 	ld	a, _app_loop_status_65536_386+0
      009DA9 0F 45            [ 1] 1430 	clr	(0x45, sp)
      009DAB 88               [ 1] 1431 	push	a
      009DAC 4B 02            [ 1] 1432 	push	#0x02
      009DAE 5F               [ 1] 1433 	clrw	x
      009DAF 89               [ 2] 1434 	pushw	x
      009DB0 4B 00            [ 1] 1435 	push	#0x00
      009DB2 CD 8F 27         [ 4] 1436 	call	_eeprom_write
      009DB5 5B 05            [ 2] 1437 	addw	sp, #5
      009DB7                       1438 00209$:
                                   1439 ;	driver/app.c: 271: keycount[4]=0;
      009DB7 1E 2D            [ 2] 1440 	ldw	x, (0x2d, sp)
      009DB9 7F               [ 1] 1441 	clr	(x)
      009DBA                       1442 00213$:
                                   1443 ;	driver/app.c: 276: if(!eeprom_read(1))//界面显示
      009DBA 4B 01            [ 1] 1444 	push	#0x01
      009DBC 5F               [ 1] 1445 	clrw	x
      009DBD 89               [ 2] 1446 	pushw	x
      009DBE 4B 00            [ 1] 1447 	push	#0x00
      009DC0 CD 8F 0E         [ 4] 1448 	call	_eeprom_read
      009DC3 5B 04            [ 2] 1449 	addw	sp, #4
      009DC5 4D               [ 1] 1450 	tnz	a
      009DC6 27 03            [ 1] 1451 	jreq	00714$
      009DC8 CC A0 89         [ 2] 1452 	jp	00238$
      009DCB                       1453 00714$:
                                   1454 ;	driver/app.c: 279: for(i=0;i<4;i++)//初始化temp
      009DCB 72 5F 00 91      [ 1] 1455 	clr	_app_loop_i_131072_432+0
      009DCF                       1456 00241$:
                                   1457 ;	driver/app.c: 281: sprintf(temp[i],"                ");
      009DCF 90 AE 80 8C      [ 2] 1458 	ldw	y, #___str_0
      009DD3 C6 00 91         [ 1] 1459 	ld	a, _app_loop_i_131072_432+0
      009DD6 97               [ 1] 1460 	ld	xl, a
      009DD7 A6 19            [ 1] 1461 	ld	a, #0x19
      009DD9 42               [ 4] 1462 	mul	x, a
      009DDA 1C 00 2D         [ 2] 1463 	addw	x, #_app_loop_temp_131072_432
      009DDD 90 89            [ 2] 1464 	pushw	y
      009DDF 89               [ 2] 1465 	pushw	x
      009DE0 CD B8 A0         [ 4] 1466 	call	_sprintf
      009DE3 5B 04            [ 2] 1467 	addw	sp, #4
                                   1468 ;	driver/app.c: 279: for(i=0;i<4;i++)//初始化temp
      009DE5 72 5C 00 91      [ 1] 1469 	inc	_app_loop_i_131072_432+0
      009DE9 C6 00 91         [ 1] 1470 	ld	a, _app_loop_i_131072_432+0
      009DEC A1 04            [ 1] 1471 	cp	a, #0x04
      009DEE 25 DF            [ 1] 1472 	jrc	00241$
                                   1473 ;	driver/app.c: 283: sprintf(temp[0],"%2d:%2d:%2d Add:%3d",ds_time.hour/16*10+ds_time.hour%16,ds_time.minute/16*10+ds_time.minute%16,ds_time.second/16*10+ds_time.second%16,eeprom_read(0));
      009DF0 5F               [ 1] 1474 	clrw	x
      009DF1 89               [ 2] 1475 	pushw	x
      009DF2 5F               [ 1] 1476 	clrw	x
      009DF3 89               [ 2] 1477 	pushw	x
      009DF4 CD 8F 0E         [ 4] 1478 	call	_eeprom_read
      009DF7 5B 04            [ 2] 1479 	addw	sp, #4
      009DF9 6B 4C            [ 1] 1480 	ld	(0x4c, sp), a
      009DFB 0F 4B            [ 1] 1481 	clr	(0x4b, sp)
      009DFD C6 00 07         [ 1] 1482 	ld	a, _ds_time+6
      009E00 5F               [ 1] 1483 	clrw	x
      009E01 97               [ 1] 1484 	ld	xl, a
      009E02 89               [ 2] 1485 	pushw	x
      009E03 4B 10            [ 1] 1486 	push	#0x10
      009E05 4B 00            [ 1] 1487 	push	#0x00
      009E07 89               [ 2] 1488 	pushw	x
      009E08 CD B9 AC         [ 4] 1489 	call	__divsint
      009E0B 5B 04            [ 2] 1490 	addw	sp, #4
      009E0D 1F 4B            [ 2] 1491 	ldw	(0x4b, sp), x
      009E0F 58               [ 2] 1492 	sllw	x
      009E10 58               [ 2] 1493 	sllw	x
      009E11 72 FB 4B         [ 2] 1494 	addw	x, (0x4b, sp)
      009E14 58               [ 2] 1495 	sllw	x
      009E15 1F 51            [ 2] 1496 	ldw	(0x51, sp), x
      009E17 85               [ 2] 1497 	popw	x
      009E18 4B 10            [ 1] 1498 	push	#0x10
      009E1A 4B 00            [ 1] 1499 	push	#0x00
      009E1C 89               [ 2] 1500 	pushw	x
      009E1D CD B9 96         [ 4] 1501 	call	__modsint
      009E20 5B 04            [ 2] 1502 	addw	sp, #4
      009E22 72 FB 4F         [ 2] 1503 	addw	x, (0x4f, sp)
      009E25 1F 4D            [ 2] 1504 	ldw	(0x4d, sp), x
      009E27 C6 00 06         [ 1] 1505 	ld	a, _ds_time+5
      009E2A 5F               [ 1] 1506 	clrw	x
      009E2B 97               [ 1] 1507 	ld	xl, a
      009E2C 89               [ 2] 1508 	pushw	x
      009E2D 4B 10            [ 1] 1509 	push	#0x10
      009E2F 4B 00            [ 1] 1510 	push	#0x00
      009E31 89               [ 2] 1511 	pushw	x
      009E32 CD B9 AC         [ 4] 1512 	call	__divsint
      009E35 5B 04            [ 2] 1513 	addw	sp, #4
      009E37 1F 21            [ 2] 1514 	ldw	(0x21, sp), x
      009E39 58               [ 2] 1515 	sllw	x
      009E3A 58               [ 2] 1516 	sllw	x
      009E3B 72 FB 21         [ 2] 1517 	addw	x, (0x21, sp)
      009E3E 58               [ 2] 1518 	sllw	x
      009E3F 1F 1F            [ 2] 1519 	ldw	(0x1f, sp), x
      009E41 85               [ 2] 1520 	popw	x
      009E42 4B 10            [ 1] 1521 	push	#0x10
      009E44 4B 00            [ 1] 1522 	push	#0x00
      009E46 89               [ 2] 1523 	pushw	x
      009E47 CD B9 96         [ 4] 1524 	call	__modsint
      009E4A 5B 04            [ 2] 1525 	addw	sp, #4
      009E4C 72 FB 1D         [ 2] 1526 	addw	x, (0x1d, sp)
      009E4F 1F 23            [ 2] 1527 	ldw	(0x23, sp), x
      009E51 C6 00 05         [ 1] 1528 	ld	a, _ds_time+4
      009E54 5F               [ 1] 1529 	clrw	x
      009E55 97               [ 1] 1530 	ld	xl, a
      009E56 89               [ 2] 1531 	pushw	x
      009E57 4B 10            [ 1] 1532 	push	#0x10
      009E59 4B 00            [ 1] 1533 	push	#0x00
      009E5B 89               [ 2] 1534 	pushw	x
      009E5C CD B9 AC         [ 4] 1535 	call	__divsint
      009E5F 5B 04            [ 2] 1536 	addw	sp, #4
      009E61 1F 23            [ 2] 1537 	ldw	(0x23, sp), x
      009E63 58               [ 2] 1538 	sllw	x
      009E64 58               [ 2] 1539 	sllw	x
      009E65 72 FB 23         [ 2] 1540 	addw	x, (0x23, sp)
      009E68 58               [ 2] 1541 	sllw	x
      009E69 1F 29            [ 2] 1542 	ldw	(0x29, sp), x
      009E6B 85               [ 2] 1543 	popw	x
      009E6C 4B 10            [ 1] 1544 	push	#0x10
      009E6E 4B 00            [ 1] 1545 	push	#0x00
      009E70 89               [ 2] 1546 	pushw	x
      009E71 CD B9 96         [ 4] 1547 	call	__modsint
      009E74 5B 04            [ 2] 1548 	addw	sp, #4
      009E76 72 FB 27         [ 2] 1549 	addw	x, (0x27, sp)
      009E79 51               [ 1] 1550 	exgw	x, y
      009E7A 1E 4B            [ 2] 1551 	ldw	x, (0x4b, sp)
      009E7C 89               [ 2] 1552 	pushw	x
      009E7D 1E 4F            [ 2] 1553 	ldw	x, (0x4f, sp)
      009E7F 89               [ 2] 1554 	pushw	x
      009E80 1E 27            [ 2] 1555 	ldw	x, (0x27, sp)
      009E82 89               [ 2] 1556 	pushw	x
      009E83 90 89            [ 2] 1557 	pushw	y
      009E85 4B 9D            [ 1] 1558 	push	#<___str_1
      009E87 4B 80            [ 1] 1559 	push	#(___str_1 >> 8)
      009E89 4B 2D            [ 1] 1560 	push	#<_app_loop_temp_131072_432
      009E8B 4B 00            [ 1] 1561 	push	#(_app_loop_temp_131072_432 >> 8)
      009E8D CD B8 A0         [ 4] 1562 	call	_sprintf
      009E90 5B 0C            [ 2] 1563 	addw	sp, #12
                                   1564 ;	driver/app.c: 284: sprintf(temp[1],"%2d.%1dC/%2d.%1d%%/%4d",dh_data.T,dh_data.T1&0x0f,dh_data.W,dh_data.W1&0x0f,adc_data.Ain);
      009E92 AE 00 0E         [ 2] 1565 	ldw	x, #_adc_data
      009E95 FE               [ 2] 1566 	ldw	x, (x)
      009E96 1F 25            [ 2] 1567 	ldw	(0x25, sp), x
      009E98 90 AE 00 08      [ 2] 1568 	ldw	y, #_dh_data+0
      009E9C 93               [ 1] 1569 	ldw	x, y
      009E9D E6 03            [ 1] 1570 	ld	a, (0x3, x)
      009E9F 0F 68            [ 1] 1571 	clr	(0x68, sp)
      009EA1 A4 0F            [ 1] 1572 	and	a, #0x0f
      009EA3 6B 67            [ 1] 1573 	ld	(0x67, sp), a
      009EA5 0F 66            [ 1] 1574 	clr	(0x66, sp)
      009EA7 93               [ 1] 1575 	ldw	x, y
      009EA8 E6 02            [ 1] 1576 	ld	a, (0x2, x)
      009EAA 6B 6D            [ 1] 1577 	ld	(0x6d, sp), a
      009EAC 0F 6C            [ 1] 1578 	clr	(0x6c, sp)
      009EAE 93               [ 1] 1579 	ldw	x, y
      009EAF E6 01            [ 1] 1580 	ld	a, (0x1, x)
      009EB1 0F 6A            [ 1] 1581 	clr	(0x6a, sp)
      009EB3 A4 0F            [ 1] 1582 	and	a, #0x0f
      009EB5 6B 71            [ 1] 1583 	ld	(0x71, sp), a
      009EB7 0F 70            [ 1] 1584 	clr	(0x70, sp)
      009EB9 90 F6            [ 1] 1585 	ld	a, (y)
      009EBB 0F 6E            [ 1] 1586 	clr	(0x6e, sp)
      009EBD 90 AE 00 46      [ 2] 1587 	ldw	y, #_app_loop_temp_131072_432+25
      009EC1 1E 25            [ 2] 1588 	ldw	x, (0x25, sp)
      009EC3 89               [ 2] 1589 	pushw	x
      009EC4 1E 68            [ 2] 1590 	ldw	x, (0x68, sp)
      009EC6 89               [ 2] 1591 	pushw	x
      009EC7 1E 70            [ 2] 1592 	ldw	x, (0x70, sp)
      009EC9 89               [ 2] 1593 	pushw	x
      009ECA 1E 76            [ 2] 1594 	ldw	x, (0x76, sp)
      009ECC 89               [ 2] 1595 	pushw	x
      009ECD 88               [ 1] 1596 	push	a
      009ECE 7B 77            [ 1] 1597 	ld	a, (0x77, sp)
      009ED0 88               [ 1] 1598 	push	a
      009ED1 4B B1            [ 1] 1599 	push	#<___str_2
      009ED3 4B 80            [ 1] 1600 	push	#(___str_2 >> 8)
      009ED5 90 89            [ 2] 1601 	pushw	y
      009ED7 CD B8 A0         [ 4] 1602 	call	_sprintf
      009EDA 5B 0E            [ 2] 1603 	addw	sp, #14
                                   1604 ;	driver/app.c: 285: sprintf(temp[2],"B:%s,R:%s",beep_read()?"on":"off",relay_read()?"on":"off");
      009EDC CD 8A D2         [ 4] 1605 	call	_relay_read
      009EDF 4D               [ 1] 1606 	tnz	a
      009EE0 27 05            [ 1] 1607 	jreq	00261$
      009EE2 AE 80 D2         [ 2] 1608 	ldw	x, #___str_4
      009EE5 20 03            [ 2] 1609 	jra	00262$
      009EE7                       1610 00261$:
      009EE7 AE 80 D5         [ 2] 1611 	ldw	x, #___str_5
      009EEA                       1612 00262$:
      009EEA 1F 5E            [ 2] 1613 	ldw	(0x5e, sp), x
      009EEC CD 94 70         [ 4] 1614 	call	_beep_read
      009EEF 4D               [ 1] 1615 	tnz	a
      009EF0 27 07            [ 1] 1616 	jreq	00263$
      009EF2 AE 80 D2         [ 2] 1617 	ldw	x, #___str_4
      009EF5 1F 5C            [ 2] 1618 	ldw	(0x5c, sp), x
      009EF7 20 05            [ 2] 1619 	jra	00264$
      009EF9                       1620 00263$:
      009EF9 AE 80 D5         [ 2] 1621 	ldw	x, #___str_5
      009EFC 1F 5C            [ 2] 1622 	ldw	(0x5c, sp), x
      009EFE                       1623 00264$:
      009EFE 1E 5C            [ 2] 1624 	ldw	x, (0x5c, sp)
      009F00 90 AE 00 5F      [ 2] 1625 	ldw	y, #_app_loop_temp_131072_432+50
      009F04 7B 5F            [ 1] 1626 	ld	a, (0x5f, sp)
      009F06 88               [ 1] 1627 	push	a
      009F07 7B 5F            [ 1] 1628 	ld	a, (0x5f, sp)
      009F09 88               [ 1] 1629 	push	a
      009F0A 89               [ 2] 1630 	pushw	x
      009F0B 4B C8            [ 1] 1631 	push	#<___str_3
      009F0D 4B 80            [ 1] 1632 	push	#(___str_3 >> 8)
      009F0F 90 89            [ 2] 1633 	pushw	y
      009F11 CD B8 A0         [ 4] 1634 	call	_sprintf
      009F14 5B 08            [ 2] 1635 	addw	sp, #8
                                   1636 ;	driver/app.c: 296: sprintf(temp[3],"%s",eeprom_read(4)?"running":"stopped");
      009F16 AE 00 78         [ 2] 1637 	ldw	x, #_app_loop_temp_131072_432+75
      009F19 1F 62            [ 2] 1638 	ldw	(0x62, sp), x
                                   1639 ;	driver/app.c: 286: if(status==0)//主菜单
      009F1B CE 00 1C         [ 2] 1640 	ldw	x, _app_loop_status_65536_386+0
      009F1E 27 03            [ 1] 1641 	jreq	00718$
      009F20 CC 9F 9D         [ 2] 1642 	jp	00235$
      009F23                       1643 00718$:
                                   1644 ;	driver/app.c: 296: sprintf(temp[3],"%s",eeprom_read(4)?"running":"stopped");
      009F23 4B 04            [ 1] 1645 	push	#0x04
      009F25 5F               [ 1] 1646 	clrw	x
      009F26 89               [ 2] 1647 	pushw	x
      009F27 4B 00            [ 1] 1648 	push	#0x00
      009F29 CD 8F 0E         [ 4] 1649 	call	_eeprom_read
      009F2C 5B 04            [ 2] 1650 	addw	sp, #4
      009F2E 4D               [ 1] 1651 	tnz	a
      009F2F 27 07            [ 1] 1652 	jreq	00265$
      009F31 AE 80 DC         [ 2] 1653 	ldw	x, #___str_7
      009F34 1F 60            [ 2] 1654 	ldw	(0x60, sp), x
      009F36 20 05            [ 2] 1655 	jra	00266$
      009F38                       1656 00265$:
      009F38 AE 80 E4         [ 2] 1657 	ldw	x, #___str_8
      009F3B 1F 60            [ 2] 1658 	ldw	(0x60, sp), x
      009F3D                       1659 00266$:
      009F3D 1E 60            [ 2] 1660 	ldw	x, (0x60, sp)
      009F3F 89               [ 2] 1661 	pushw	x
      009F40 4B D9            [ 1] 1662 	push	#<___str_6
      009F42 4B 80            [ 1] 1663 	push	#(___str_6 >> 8)
      009F44 1E 66            [ 2] 1664 	ldw	x, (0x66, sp)
      009F46 89               [ 2] 1665 	pushw	x
      009F47 CD B8 A0         [ 4] 1666 	call	_sprintf
      009F4A 5B 06            [ 2] 1667 	addw	sp, #6
                                   1668 ;	driver/app.c: 297: for(i=0;i<4;i++)//输出显示
      009F4C 72 5F 00 91      [ 1] 1669 	clr	_app_loop_i_131072_432+0
                                   1670 ;	driver/app.c: 300: for(j=0;j<16;j++)
      009F50                       1671 00327$:
      009F50 0F 7A            [ 1] 1672 	clr	(0x7a, sp)
      009F52                       1673 00243$:
                                   1674 ;	driver/app.c: 302: if(temp[i][j]=='\0') temp[i][j]=' ';
      009F52 C6 00 91         [ 1] 1675 	ld	a, _app_loop_i_131072_432+0
      009F55 97               [ 1] 1676 	ld	xl, a
      009F56 A6 19            [ 1] 1677 	ld	a, #0x19
      009F58 42               [ 4] 1678 	mul	x, a
      009F59 1C 00 2D         [ 2] 1679 	addw	x, #_app_loop_temp_131072_432
      009F5C 9F               [ 1] 1680 	ld	a, xl
      009F5D 1B 7A            [ 1] 1681 	add	a, (0x7a, sp)
      009F5F 6B 57            [ 1] 1682 	ld	(0x57, sp), a
      009F61 9E               [ 1] 1683 	ld	a, xh
      009F62 A9 00            [ 1] 1684 	adc	a, #0x00
      009F64 6B 56            [ 1] 1685 	ld	(0x56, sp), a
      009F66 1E 56            [ 2] 1686 	ldw	x, (0x56, sp)
      009F68 F6               [ 1] 1687 	ld	a, (x)
      009F69 26 05            [ 1] 1688 	jrne	00244$
      009F6B 1E 56            [ 2] 1689 	ldw	x, (0x56, sp)
      009F6D A6 20            [ 1] 1690 	ld	a, #0x20
      009F6F F7               [ 1] 1691 	ld	(x), a
      009F70                       1692 00244$:
                                   1693 ;	driver/app.c: 300: for(j=0;j<16;j++)
      009F70 0C 7A            [ 1] 1694 	inc	(0x7a, sp)
      009F72 7B 7A            [ 1] 1695 	ld	a, (0x7a, sp)
      009F74 A1 10            [ 1] 1696 	cp	a, #0x10
      009F76 25 DA            [ 1] 1697 	jrc	00243$
                                   1698 ;	driver/app.c: 304: OLED_ShowString(0,i*2,temp[i]);
      009F78 C6 00 91         [ 1] 1699 	ld	a, _app_loop_i_131072_432+0
      009F7B 97               [ 1] 1700 	ld	xl, a
      009F7C A6 19            [ 1] 1701 	ld	a, #0x19
      009F7E 42               [ 4] 1702 	mul	x, a
      009F7F 1C 00 2D         [ 2] 1703 	addw	x, #_app_loop_temp_131072_432
      009F82 C6 00 91         [ 1] 1704 	ld	a, _app_loop_i_131072_432+0
      009F85 48               [ 1] 1705 	sll	a
      009F86 89               [ 2] 1706 	pushw	x
      009F87 88               [ 1] 1707 	push	a
      009F88 4B 00            [ 1] 1708 	push	#0x00
      009F8A CD A3 24         [ 4] 1709 	call	_OLED_ShowString
      009F8D 5B 04            [ 2] 1710 	addw	sp, #4
                                   1711 ;	driver/app.c: 297: for(i=0;i<4;i++)//输出显示
      009F8F 72 5C 00 91      [ 1] 1712 	inc	_app_loop_i_131072_432+0
      009F93 C6 00 91         [ 1] 1713 	ld	a, _app_loop_i_131072_432+0
      009F96 A1 04            [ 1] 1714 	cp	a, #0x04
      009F98 25 B6            [ 1] 1715 	jrc	00327$
      009F9A CC A0 8C         [ 2] 1716 	jp	00255$
      009F9D                       1717 00235$:
                                   1718 ;	driver/app.c: 307: else if((status&0xff)==0)//规则选择菜单
      009F9D 90 CE 00 1C      [ 2] 1719 	ldw	y, _app_loop_status_65536_386+0
      009FA1 17 54            [ 2] 1720 	ldw	(0x54, sp), y
      009FA3 0F 54            [ 1] 1721 	clr	(0x54, sp)
                                   1722 ;	driver/app.c: 227: eeprom_write((status>>8)*32+status&0xff-1,eeprom_read((status>>8)*32+status&0xff-1)+1);
      009FA5 5F               [ 1] 1723 	clrw	x
      009FA6 C6 00 1C         [ 1] 1724 	ld	a, _app_loop_status_65536_386+0
      009FA9 97               [ 1] 1725 	ld	xl, a
                                   1726 ;	driver/app.c: 307: else if((status&0xff)==0)//规则选择菜单
      009FAA 16 54            [ 2] 1727 	ldw	y, (0x54, sp)
      009FAC 26 5E            [ 1] 1728 	jrne	00232$
                                   1729 ;	driver/app.c: 317: sprintf(temp[3],"rule:%2d",status>>8);
      009FAE 89               [ 2] 1730 	pushw	x
      009FAF 4B EC            [ 1] 1731 	push	#<___str_9
      009FB1 4B 80            [ 1] 1732 	push	#(___str_9 >> 8)
      009FB3 1E 66            [ 2] 1733 	ldw	x, (0x66, sp)
      009FB5 89               [ 2] 1734 	pushw	x
      009FB6 CD B8 A0         [ 4] 1735 	call	_sprintf
      009FB9 5B 06            [ 2] 1736 	addw	sp, #6
                                   1737 ;	driver/app.c: 318: for(i=0;i<4;i++)//输出显示
      009FBB 72 5F 00 91      [ 1] 1738 	clr	_app_loop_i_131072_432+0
                                   1739 ;	driver/app.c: 321: for(j=0;j<16;j++)
      009FBF                       1740 00333$:
      009FBF 0F 79            [ 1] 1741 	clr	(0x79, sp)
      009FC1                       1742 00247$:
                                   1743 ;	driver/app.c: 323: if(temp[i][j]=='\0') temp[i][j]=' ';
      009FC1 C6 00 91         [ 1] 1744 	ld	a, _app_loop_i_131072_432+0
      009FC4 97               [ 1] 1745 	ld	xl, a
      009FC5 A6 19            [ 1] 1746 	ld	a, #0x19
      009FC7 42               [ 4] 1747 	mul	x, a
      009FC8 1C 00 2D         [ 2] 1748 	addw	x, #_app_loop_temp_131072_432
      009FCB 9F               [ 1] 1749 	ld	a, xl
      009FCC 1B 79            [ 1] 1750 	add	a, (0x79, sp)
      009FCE 6B 5B            [ 1] 1751 	ld	(0x5b, sp), a
      009FD0 9E               [ 1] 1752 	ld	a, xh
      009FD1 A9 00            [ 1] 1753 	adc	a, #0x00
      009FD3 6B 5A            [ 1] 1754 	ld	(0x5a, sp), a
      009FD5 1E 5A            [ 2] 1755 	ldw	x, (0x5a, sp)
      009FD7 F6               [ 1] 1756 	ld	a, (x)
      009FD8 26 05            [ 1] 1757 	jrne	00248$
      009FDA 1E 5A            [ 2] 1758 	ldw	x, (0x5a, sp)
      009FDC A6 20            [ 1] 1759 	ld	a, #0x20
      009FDE F7               [ 1] 1760 	ld	(x), a
      009FDF                       1761 00248$:
                                   1762 ;	driver/app.c: 321: for(j=0;j<16;j++)
      009FDF 0C 79            [ 1] 1763 	inc	(0x79, sp)
      009FE1 7B 79            [ 1] 1764 	ld	a, (0x79, sp)
      009FE3 A1 10            [ 1] 1765 	cp	a, #0x10
      009FE5 25 DA            [ 1] 1766 	jrc	00247$
                                   1767 ;	driver/app.c: 325: OLED_ShowString(0,i*2,temp[i]);
      009FE7 C6 00 91         [ 1] 1768 	ld	a, _app_loop_i_131072_432+0
      009FEA 97               [ 1] 1769 	ld	xl, a
      009FEB A6 19            [ 1] 1770 	ld	a, #0x19
      009FED 42               [ 4] 1771 	mul	x, a
      009FEE 1C 00 2D         [ 2] 1772 	addw	x, #_app_loop_temp_131072_432
      009FF1 C6 00 91         [ 1] 1773 	ld	a, _app_loop_i_131072_432+0
      009FF4 48               [ 1] 1774 	sll	a
      009FF5 89               [ 2] 1775 	pushw	x
      009FF6 88               [ 1] 1776 	push	a
      009FF7 4B 00            [ 1] 1777 	push	#0x00
      009FF9 CD A3 24         [ 4] 1778 	call	_OLED_ShowString
      009FFC 5B 04            [ 2] 1779 	addw	sp, #4
                                   1780 ;	driver/app.c: 318: for(i=0;i<4;i++)//输出显示
      009FFE 72 5C 00 91      [ 1] 1781 	inc	_app_loop_i_131072_432+0
      00A002 C6 00 91         [ 1] 1782 	ld	a, _app_loop_i_131072_432+0
      00A005 A1 04            [ 1] 1783 	cp	a, #0x04
      00A007 25 B6            [ 1] 1784 	jrc	00333$
      00A009 CC A0 8C         [ 2] 1785 	jp	00255$
      00A00C                       1786 00232$:
                                   1787 ;	driver/app.c: 339: sprintf(temp[3],"Addr:%2d,Val:%d",(status&0xff)-1,eeprom_read((status>>8)*32+(status&0xff)-1));
      00A00C 58               [ 2] 1788 	sllw	x
      00A00D 58               [ 2] 1789 	sllw	x
      00A00E 58               [ 2] 1790 	sllw	x
      00A00F 58               [ 2] 1791 	sllw	x
      00A010 58               [ 2] 1792 	sllw	x
      00A011 72 FB 54         [ 2] 1793 	addw	x, (0x54, sp)
      00A014 5A               [ 2] 1794 	decw	x
      00A015 90 5F            [ 1] 1795 	clrw	y
      00A017 89               [ 2] 1796 	pushw	x
      00A018 90 89            [ 2] 1797 	pushw	y
      00A01A CD 8F 0E         [ 4] 1798 	call	_eeprom_read
      00A01D 5B 04            [ 2] 1799 	addw	sp, #4
      00A01F 90 5F            [ 1] 1800 	clrw	y
      00A021 90 97            [ 1] 1801 	ld	yl, a
      00A023 C6 00 1D         [ 1] 1802 	ld	a, _app_loop_status_65536_386+1
      00A026 97               [ 1] 1803 	ld	xl, a
      00A027 4F               [ 1] 1804 	clr	a
      00A028 95               [ 1] 1805 	ld	xh, a
      00A029 5A               [ 2] 1806 	decw	x
      00A02A 90 89            [ 2] 1807 	pushw	y
      00A02C 89               [ 2] 1808 	pushw	x
      00A02D 4B F5            [ 1] 1809 	push	#<___str_10
      00A02F 4B 80            [ 1] 1810 	push	#(___str_10 >> 8)
      00A031 1E 68            [ 2] 1811 	ldw	x, (0x68, sp)
      00A033 89               [ 2] 1812 	pushw	x
      00A034 CD B8 A0         [ 4] 1813 	call	_sprintf
      00A037 5B 08            [ 2] 1814 	addw	sp, #8
                                   1815 ;	driver/app.c: 340: for(i=0;i<4;i++)//输出显示
      00A039 72 5F 00 91      [ 1] 1816 	clr	_app_loop_i_131072_432+0
                                   1817 ;	driver/app.c: 343: for(j=0;j<16;j++)
      00A03D                       1818 00338$:
      00A03D 0F 78            [ 1] 1819 	clr	(0x78, sp)
      00A03F                       1820 00251$:
                                   1821 ;	driver/app.c: 345: if(temp[i][j]=='\0') temp[i][j]=' ';
      00A03F C6 00 91         [ 1] 1822 	ld	a, _app_loop_i_131072_432+0
      00A042 97               [ 1] 1823 	ld	xl, a
      00A043 A6 19            [ 1] 1824 	ld	a, #0x19
      00A045 42               [ 4] 1825 	mul	x, a
      00A046 1C 00 2D         [ 2] 1826 	addw	x, #_app_loop_temp_131072_432
      00A049 9F               [ 1] 1827 	ld	a, xl
      00A04A 1B 78            [ 1] 1828 	add	a, (0x78, sp)
      00A04C 6B 59            [ 1] 1829 	ld	(0x59, sp), a
      00A04E 9E               [ 1] 1830 	ld	a, xh
      00A04F A9 00            [ 1] 1831 	adc	a, #0x00
      00A051 6B 58            [ 1] 1832 	ld	(0x58, sp), a
      00A053 1E 58            [ 2] 1833 	ldw	x, (0x58, sp)
      00A055 F6               [ 1] 1834 	ld	a, (x)
      00A056 26 05            [ 1] 1835 	jrne	00252$
      00A058 1E 58            [ 2] 1836 	ldw	x, (0x58, sp)
      00A05A A6 20            [ 1] 1837 	ld	a, #0x20
      00A05C F7               [ 1] 1838 	ld	(x), a
      00A05D                       1839 00252$:
                                   1840 ;	driver/app.c: 343: for(j=0;j<16;j++)
      00A05D 0C 78            [ 1] 1841 	inc	(0x78, sp)
      00A05F 7B 78            [ 1] 1842 	ld	a, (0x78, sp)
      00A061 A1 10            [ 1] 1843 	cp	a, #0x10
      00A063 25 DA            [ 1] 1844 	jrc	00251$
                                   1845 ;	driver/app.c: 347: OLED_ShowString(0,i*2,temp[i]);
      00A065 C6 00 91         [ 1] 1846 	ld	a, _app_loop_i_131072_432+0
      00A068 97               [ 1] 1847 	ld	xl, a
      00A069 A6 19            [ 1] 1848 	ld	a, #0x19
      00A06B 42               [ 4] 1849 	mul	x, a
      00A06C 1C 00 2D         [ 2] 1850 	addw	x, #_app_loop_temp_131072_432
      00A06F C6 00 91         [ 1] 1851 	ld	a, _app_loop_i_131072_432+0
      00A072 48               [ 1] 1852 	sll	a
      00A073 89               [ 2] 1853 	pushw	x
      00A074 88               [ 1] 1854 	push	a
      00A075 4B 00            [ 1] 1855 	push	#0x00
      00A077 CD A3 24         [ 4] 1856 	call	_OLED_ShowString
      00A07A 5B 04            [ 2] 1857 	addw	sp, #4
                                   1858 ;	driver/app.c: 340: for(i=0;i<4;i++)//输出显示
      00A07C 72 5C 00 91      [ 1] 1859 	inc	_app_loop_i_131072_432+0
      00A080 C6 00 91         [ 1] 1860 	ld	a, _app_loop_i_131072_432+0
      00A083 A1 04            [ 1] 1861 	cp	a, #0x04
      00A085 25 B6            [ 1] 1862 	jrc	00338$
      00A087 20 03            [ 2] 1863 	jra	00255$
      00A089                       1864 00238$:
                                   1865 ;	driver/app.c: 352: OLED_Clear();
      00A089 CD A1 9F         [ 4] 1866 	call	_OLED_Clear
      00A08C                       1867 00255$:
                                   1868 ;	driver/app.c: 355: }
      00A08C 5B 7A            [ 2] 1869 	addw	sp, #122
      00A08E 81               [ 4] 1870 	ret
                                   1871 	.area CODE
                                   1872 	.area CONST
      00808C                       1873 ___str_0:
      00808C 20 20 20 20 20 20 20  1874 	.ascii "                "
             20 20 20 20 20 20 20
             20 20
      00809C 00                    1875 	.db 0x00
      00809D                       1876 ___str_1:
      00809D 25 32 64 3A 25 32 64  1877 	.ascii "%2d:%2d:%2d Add:%3d"
             3A 25 32 64 20 41 64
             64 3A 25 33 64
      0080B0 00                    1878 	.db 0x00
      0080B1                       1879 ___str_2:
      0080B1 25 32 64 2E 25 31 64  1880 	.ascii "%2d.%1dC/%2d.%1d%%/%4d"
             43 2F 25 32 64 2E 25
             31 64 25 25 2F 25 34
             64
      0080C7 00                    1881 	.db 0x00
      0080C8                       1882 ___str_3:
      0080C8 42 3A 25 73 2C 52 3A  1883 	.ascii "B:%s,R:%s"
             25 73
      0080D1 00                    1884 	.db 0x00
      0080D2                       1885 ___str_4:
      0080D2 6F 6E                 1886 	.ascii "on"
      0080D4 00                    1887 	.db 0x00
      0080D5                       1888 ___str_5:
      0080D5 6F 66 66              1889 	.ascii "off"
      0080D8 00                    1890 	.db 0x00
      0080D9                       1891 ___str_6:
      0080D9 25 73                 1892 	.ascii "%s"
      0080DB 00                    1893 	.db 0x00
      0080DC                       1894 ___str_7:
      0080DC 72 75 6E 6E 69 6E 67  1895 	.ascii "running"
      0080E3 00                    1896 	.db 0x00
      0080E4                       1897 ___str_8:
      0080E4 73 74 6F 70 70 65 64  1898 	.ascii "stopped"
      0080EB 00                    1899 	.db 0x00
      0080EC                       1900 ___str_9:
      0080EC 72 75 6C 65 3A 25 32  1901 	.ascii "rule:%2d"
             64
      0080F4 00                    1902 	.db 0x00
      0080F5                       1903 ___str_10:
      0080F5 41 64 64 72 3A 25 32  1904 	.ascii "Addr:%2d,Val:%d"
             64 2C 56 61 6C 3A 25
             64
      008104 00                    1905 	.db 0x00
                                   1906 	.area INITIALIZER
                                   1907 	.area CABS (ABS)
