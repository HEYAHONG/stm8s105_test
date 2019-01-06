                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _Delay
                                     13 	.globl _puts
                                     14 	.globl _sprintf
                                     15 	.globl _printf
                                     16 	.globl _ReadADC
                                     17 	.globl _ReadDHT12
                                     18 	.globl _ds1302_read_time
                                     19 	.globl _ds1302_check
                                     20 	.globl _ds1302_port_init
                                     21 	.globl _ds1302_port_deinit
                                     22 	.globl _ds1302_active
                                     23 	.globl _Init_UART2
                                     24 	.globl _OLED_ShowString
                                     25 	.globl _OLED_Clear
                                     26 	.globl _OLED_Init
                                     27 	.globl _GPIO_ReadInputPin
                                     28 	.globl _GPIO_WriteReverse
                                     29 	.globl _GPIO_Init
                                     30 ;--------------------------------------------------------
                                     31 ; ram data
                                     32 ;--------------------------------------------------------
                                     33 	.area DATA
      000001                         34 _main_count_196608_387:
      000001                         35 	.ds 1
                                     36 ;--------------------------------------------------------
                                     37 ; ram data
                                     38 ;--------------------------------------------------------
                                     39 	.area INITIALIZED
                                     40 ;--------------------------------------------------------
                                     41 ; Stack segment in internal ram 
                                     42 ;--------------------------------------------------------
                                     43 	.area	SSEG
      FFFFFF                         44 __start__stack:
      FFFFFF                         45 	.ds	1
                                     46 
                                     47 ;--------------------------------------------------------
                                     48 ; absolute external ram data
                                     49 ;--------------------------------------------------------
                                     50 	.area DABS (ABS)
                                     51 
                                     52 ; default segment ordering for linker
                                     53 	.area HOME
                                     54 	.area GSINIT
                                     55 	.area GSFINAL
                                     56 	.area CONST
                                     57 	.area INITIALIZER
                                     58 	.area CODE
                                     59 
                                     60 ;--------------------------------------------------------
                                     61 ; interrupt vector 
                                     62 ;--------------------------------------------------------
                                     63 	.area HOME
      008000                         64 __interrupt_vect:
      008000 82 00 80 07             65 	int s_GSINIT ; reset
                                     66 ;--------------------------------------------------------
                                     67 ; global & static initialisations
                                     68 ;--------------------------------------------------------
                                     69 	.area HOME
                                     70 	.area GSINIT
                                     71 	.area GSFINAL
                                     72 	.area GSINIT
      008007                         73 __sdcc_gs_init_startup:
      008007                         74 __sdcc_init_data:
                                     75 ; stm8_genXINIT() start
      008007 AE 00 01         [ 2]   76 	ldw x, #l_DATA
      00800A 27 07            [ 1]   77 	jreq	00002$
      00800C                         78 00001$:
      00800C 72 4F 00 00      [ 1]   79 	clr (s_DATA - 1, x)
      008010 5A               [ 2]   80 	decw x
      008011 26 F9            [ 1]   81 	jrne	00001$
      008013                         82 00002$:
      008013 AE 00 00         [ 2]   83 	ldw	x, #l_INITIALIZER
      008016 27 09            [ 1]   84 	jreq	00004$
      008018                         85 00003$:
      008018 D6 86 77         [ 1]   86 	ld	a, (s_INITIALIZER - 1, x)
      00801B D7 00 01         [ 1]   87 	ld	(s_INITIALIZED - 1, x), a
      00801E 5A               [ 2]   88 	decw	x
      00801F 26 F7            [ 1]   89 	jrne	00003$
      008021                         90 00004$:
                                     91 ; stm8_genXINIT() end
                                     92 ;	main.c: 98: static u8 count=0;
      008021 72 5F 00 01      [ 1]   93 	clr	_main_count_196608_387+0
                                     94 	.area GSFINAL
      008025 CC 80 04         [ 2]   95 	jp	__sdcc_program_startup
                                     96 ;--------------------------------------------------------
                                     97 ; Home
                                     98 ;--------------------------------------------------------
                                     99 	.area HOME
                                    100 	.area HOME
      008004                        101 __sdcc_program_startup:
      008004 CC 86 98         [ 2]  102 	jp	_main
                                    103 ;	return from main will return to caller
                                    104 ;--------------------------------------------------------
                                    105 ; code
                                    106 ;--------------------------------------------------------
                                    107 	.area CODE
                                    108 ;	main.c: 47: void Delay(uint16_t nCount)
                                    109 ;	-----------------------------------------
                                    110 ;	 function Delay
                                    111 ;	-----------------------------------------
      00868E                        112 _Delay:
                                    113 ;	main.c: 50: while (nCount != 0)
      00868E 1E 03            [ 2]  114 	ldw	x, (0x03, sp)
      008690                        115 00101$:
      008690 5D               [ 2]  116 	tnzw	x
      008691 26 01            [ 1]  117 	jrne	00117$
      008693 81               [ 4]  118 	ret
      008694                        119 00117$:
                                    120 ;	main.c: 52: nCount--;
      008694 5A               [ 2]  121 	decw	x
      008695 20 F9            [ 2]  122 	jra	00101$
                                    123 ;	main.c: 54: }
      008697 81               [ 4]  124 	ret
                                    125 ;	main.c: 58: void main(void)
                                    126 ;	-----------------------------------------
                                    127 ;	 function main
                                    128 ;	-----------------------------------------
      008698                        129 _main:
      008698 52 3A            [ 2]  130 	sub	sp, #58
                                    131 ;	main.c: 62: GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      00869A 4B E0            [ 1]  132 	push	#0xe0
      00869C 4B 20            [ 1]  133 	push	#0x20
      00869E 4B 14            [ 1]  134 	push	#0x14
      0086A0 4B 50            [ 1]  135 	push	#0x50
      0086A2 CD 94 10         [ 4]  136 	call	_GPIO_Init
      0086A5 5B 04            [ 2]  137 	addw	sp, #4
                                    138 ;	main.c: 63: GPIO_Init(GPIOF,GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
      0086A7 4B 00            [ 1]  139 	push	#0x00
      0086A9 4B 10            [ 1]  140 	push	#0x10
      0086AB 4B 19            [ 1]  141 	push	#0x19
      0086AD 4B 50            [ 1]  142 	push	#0x50
      0086AF CD 94 10         [ 4]  143 	call	_GPIO_Init
      0086B2 5B 04            [ 2]  144 	addw	sp, #4
                                    145 ;	main.c: 65: Init_UART2();
      0086B4 CD 8B AB         [ 4]  146 	call	_Init_UART2
                                    147 ;	main.c: 66: OLED_Init();
      0086B7 CD 92 29         [ 4]  148 	call	_OLED_Init
                                    149 ;	main.c: 67: ds1302_active();
      0086BA CD 8F 27         [ 4]  150 	call	_ds1302_active
                                    151 ;	main.c: 68: OLED_Clear();
      0086BD CD 90 71         [ 4]  152 	call	_OLED_Clear
                                    153 ;	main.c: 69: enableInterrupts(); //使能中断
      0086C0 9A               [ 1]  154 	rim
                                    155 ;	main.c: 71: OLED_ShowString(0,0,"STM8 Started!");
      0086C1 4B 28            [ 1]  156 	push	#<___str_0
      0086C3 4B 80            [ 1]  157 	push	#(___str_0 >> 8)
      0086C5 4B 00            [ 1]  158 	push	#0x00
      0086C7 4B 00            [ 1]  159 	push	#0x00
      0086C9 CD 91 F6         [ 4]  160 	call	_OLED_ShowString
      0086CC 5B 04            [ 2]  161 	addw	sp, #4
                                    162 ;	main.c: 72: printf("STM8 Started!\r\n");
      0086CE 4B 36            [ 1]  163 	push	#<___str_2
      0086D0 4B 80            [ 1]  164 	push	#(___str_2 >> 8)
      0086D2 CD A2 48         [ 4]  165 	call	_puts
      0086D5 5B 02            [ 2]  166 	addw	sp, #2
                                    167 ;	main.c: 74: while (1)
      0086D7                        168 00106$:
                                    169 ;	main.c: 78: sprintf(temp,"V:%4d,S:%1d",ReadADC(),GPIO_ReadInputPin(GPIOF,GPIO_PIN_4)==RESET?0:1);
      0086D7 4B 10            [ 1]  170 	push	#0x10
      0086D9 4B 19            [ 1]  171 	push	#0x19
      0086DB 4B 50            [ 1]  172 	push	#0x50
      0086DD CD 94 B0         [ 4]  173 	call	_GPIO_ReadInputPin
      0086E0 5B 03            [ 2]  174 	addw	sp, #3
      0086E2 4D               [ 1]  175 	tnz	a
      0086E3 26 05            [ 1]  176 	jrne	00110$
      0086E5 5F               [ 1]  177 	clrw	x
      0086E6 1F 2F            [ 2]  178 	ldw	(0x2f, sp), x
      0086E8 20 05            [ 2]  179 	jra	00111$
      0086EA                        180 00110$:
      0086EA AE 00 01         [ 2]  181 	ldw	x, #0x0001
      0086ED 1F 2F            [ 2]  182 	ldw	(0x2f, sp), x
      0086EF                        183 00111$:
      0086EF CD 93 AF         [ 4]  184 	call	_ReadADC
      0086F2 90 96            [ 1]  185 	ldw	y, sp
      0086F4 72 A9 00 10      [ 2]  186 	addw	y, #16
      0086F8 17 2B            [ 2]  187 	ldw	(0x2b, sp), y
      0086FA 7B 30            [ 1]  188 	ld	a, (0x30, sp)
      0086FC 88               [ 1]  189 	push	a
      0086FD 7B 30            [ 1]  190 	ld	a, (0x30, sp)
      0086FF 88               [ 1]  191 	push	a
      008700 89               [ 2]  192 	pushw	x
      008701 4B 45            [ 1]  193 	push	#<___str_3
      008703 4B 80            [ 1]  194 	push	#(___str_3 >> 8)
      008705 90 89            [ 2]  195 	pushw	y
      008707 CD A1 CE         [ 4]  196 	call	_sprintf
      00870A 5B 08            [ 2]  197 	addw	sp, #8
                                    198 ;	main.c: 79: printf("%s",temp);
      00870C 1E 2B            [ 2]  199 	ldw	x, (0x2b, sp)
      00870E 89               [ 2]  200 	pushw	x
      00870F 4B 51            [ 1]  201 	push	#<___str_4
      008711 4B 80            [ 1]  202 	push	#(___str_4 >> 8)
      008713 CD A2 89         [ 4]  203 	call	_printf
      008716 5B 04            [ 2]  204 	addw	sp, #4
                                    205 ;	main.c: 80: printf("\r\n");
      008718 4B 54            [ 1]  206 	push	#<___str_6
      00871A 4B 80            [ 1]  207 	push	#(___str_6 >> 8)
      00871C CD A2 48         [ 4]  208 	call	_puts
      00871F 5B 02            [ 2]  209 	addw	sp, #2
                                    210 ;	main.c: 81: OLED_ShowString(0,2,temp);
      008721 1E 2B            [ 2]  211 	ldw	x, (0x2b, sp)
      008723 89               [ 2]  212 	pushw	x
      008724 4B 02            [ 1]  213 	push	#0x02
      008726 4B 00            [ 1]  214 	push	#0x00
      008728 CD 91 F6         [ 4]  215 	call	_OLED_ShowString
      00872B 5B 04            [ 2]  216 	addw	sp, #4
                                    217 ;	main.c: 84: ds1302_port_init();
      00872D CD 8C 73         [ 4]  218 	call	_ds1302_port_init
                                    219 ;	main.c: 85: if(ds1302_check())
      008730 CD 8D E2         [ 4]  220 	call	_ds1302_check
      008733 6B 26            [ 1]  221 	ld	(0x26, sp), a
      008735 26 03            [ 1]  222 	jrne	00133$
      008737 CC 87 EB         [ 2]  223 	jp	00102$
      00873A                        224 00133$:
                                    225 ;	main.c: 89: ds1302_read_time(&ds_time);
      00873A 96               [ 1]  226 	ldw	x, sp
      00873B 1C 00 09         [ 2]  227 	addw	x, #9
      00873E 1F 2D            [ 2]  228 	ldw	(0x2d, sp), x
      008740 89               [ 2]  229 	pushw	x
      008741 CD 8D FA         [ 4]  230 	call	_ds1302_read_time
      008744 5B 02            [ 2]  231 	addw	sp, #2
                                    232 ;	main.c: 90: sprintf(temp,"%2d/%2d/%2d",ds_time.hour,ds_time.minute/16*10+ds_time.minute%16,ds_time.second/16*10+ds_time.second%16);
      008746 1E 2D            [ 2]  233 	ldw	x, (0x2d, sp)
      008748 E6 06            [ 1]  234 	ld	a, (0x6, x)
      00874A 6B 1B            [ 1]  235 	ld	(0x1b, sp), a
      00874C 0F 1A            [ 1]  236 	clr	(0x1a, sp)
      00874E 4B 10            [ 1]  237 	push	#0x10
      008750 4B 00            [ 1]  238 	push	#0x00
      008752 1E 1C            [ 2]  239 	ldw	x, (0x1c, sp)
      008754 89               [ 2]  240 	pushw	x
      008755 CD A3 31         [ 4]  241 	call	__divsint
      008758 5B 04            [ 2]  242 	addw	sp, #4
      00875A 89               [ 2]  243 	pushw	x
      00875B 58               [ 2]  244 	sllw	x
      00875C 58               [ 2]  245 	sllw	x
      00875D 72 FB 01         [ 2]  246 	addw	x, (1, sp)
      008760 58               [ 2]  247 	sllw	x
      008761 5B 02            [ 2]  248 	addw	sp, #2
      008763 1F 37            [ 2]  249 	ldw	(0x37, sp), x
      008765 4B 10            [ 1]  250 	push	#0x10
      008767 4B 00            [ 1]  251 	push	#0x00
      008769 1E 1C            [ 2]  252 	ldw	x, (0x1c, sp)
      00876B 89               [ 2]  253 	pushw	x
      00876C CD A3 1B         [ 4]  254 	call	__modsint
      00876F 5B 04            [ 2]  255 	addw	sp, #4
      008771 72 FB 37         [ 2]  256 	addw	x, (0x37, sp)
      008774 1F 27            [ 2]  257 	ldw	(0x27, sp), x
      008776 1E 2D            [ 2]  258 	ldw	x, (0x2d, sp)
      008778 E6 05            [ 1]  259 	ld	a, (0x5, x)
      00877A 6B 3A            [ 1]  260 	ld	(0x3a, sp), a
      00877C 0F 39            [ 1]  261 	clr	(0x39, sp)
      00877E 4B 10            [ 1]  262 	push	#0x10
      008780 4B 00            [ 1]  263 	push	#0x00
      008782 1E 3B            [ 2]  264 	ldw	x, (0x3b, sp)
      008784 89               [ 2]  265 	pushw	x
      008785 CD A3 31         [ 4]  266 	call	__divsint
      008788 5B 04            [ 2]  267 	addw	sp, #4
      00878A 89               [ 2]  268 	pushw	x
      00878B 58               [ 2]  269 	sllw	x
      00878C 58               [ 2]  270 	sllw	x
      00878D 72 FB 01         [ 2]  271 	addw	x, (1, sp)
      008790 58               [ 2]  272 	sllw	x
      008791 5B 02            [ 2]  273 	addw	sp, #2
      008793 1F 29            [ 2]  274 	ldw	(0x29, sp), x
      008795 4B 10            [ 1]  275 	push	#0x10
      008797 4B 00            [ 1]  276 	push	#0x00
      008799 1E 3B            [ 2]  277 	ldw	x, (0x3b, sp)
      00879B 89               [ 2]  278 	pushw	x
      00879C CD A3 1B         [ 4]  279 	call	__modsint
      00879F 5B 04            [ 2]  280 	addw	sp, #4
      0087A1 72 FB 29         [ 2]  281 	addw	x, (0x29, sp)
      0087A4 16 2D            [ 2]  282 	ldw	y, (0x2d, sp)
      0087A6 90 E6 04         [ 1]  283 	ld	a, (0x4, y)
      0087A9 6B 25            [ 1]  284 	ld	(0x25, sp), a
      0087AB 0F 24            [ 1]  285 	clr	(0x24, sp)
      0087AD 90 96            [ 1]  286 	ldw	y, sp
      0087AF 72 A9 00 10      [ 2]  287 	addw	y, #16
      0087B3 17 35            [ 2]  288 	ldw	(0x35, sp), y
      0087B5 7B 28            [ 1]  289 	ld	a, (0x28, sp)
      0087B7 88               [ 1]  290 	push	a
      0087B8 7B 28            [ 1]  291 	ld	a, (0x28, sp)
      0087BA 88               [ 1]  292 	push	a
      0087BB 89               [ 2]  293 	pushw	x
      0087BC 1E 28            [ 2]  294 	ldw	x, (0x28, sp)
      0087BE 89               [ 2]  295 	pushw	x
      0087BF 4B 56            [ 1]  296 	push	#<___str_7
      0087C1 4B 80            [ 1]  297 	push	#(___str_7 >> 8)
      0087C3 90 89            [ 2]  298 	pushw	y
      0087C5 CD A1 CE         [ 4]  299 	call	_sprintf
      0087C8 5B 0A            [ 2]  300 	addw	sp, #10
                                    301 ;	main.c: 91: printf("%s",temp);
      0087CA 1E 35            [ 2]  302 	ldw	x, (0x35, sp)
      0087CC 89               [ 2]  303 	pushw	x
      0087CD 4B 51            [ 1]  304 	push	#<___str_4
      0087CF 4B 80            [ 1]  305 	push	#(___str_4 >> 8)
      0087D1 CD A2 89         [ 4]  306 	call	_printf
      0087D4 5B 04            [ 2]  307 	addw	sp, #4
                                    308 ;	main.c: 92: printf("\r\n");
      0087D6 4B 54            [ 1]  309 	push	#<___str_6
      0087D8 4B 80            [ 1]  310 	push	#(___str_6 >> 8)
      0087DA CD A2 48         [ 4]  311 	call	_puts
      0087DD 5B 02            [ 2]  312 	addw	sp, #2
                                    313 ;	main.c: 93: OLED_ShowString(0,4,temp);
      0087DF 1E 35            [ 2]  314 	ldw	x, (0x35, sp)
      0087E1 89               [ 2]  315 	pushw	x
      0087E2 4B 04            [ 1]  316 	push	#0x04
      0087E4 4B 00            [ 1]  317 	push	#0x00
      0087E6 CD 91 F6         [ 4]  318 	call	_OLED_ShowString
      0087E9 5B 04            [ 2]  319 	addw	sp, #4
      0087EB                        320 00102$:
                                    321 ;	main.c: 95: ds1302_port_deinit();
      0087EB CD 8C 4B         [ 4]  322 	call	_ds1302_port_deinit
                                    323 ;	main.c: 100: if(count>=4)
      0087EE C6 00 01         [ 1]  324 	ld	a, _main_count_196608_387+0
      0087F1 A1 04            [ 1]  325 	cp	a, #0x04
      0087F3 24 03            [ 1]  326 	jrnc	00134$
      0087F5 CC 88 6F         [ 2]  327 	jp	00104$
      0087F8                        328 00134$:
                                    329 ;	main.c: 104: ReadDHT12(&data);
      0087F8 90 96            [ 1]  330 	ldw	y, sp
      0087FA 72 A9 00 15      [ 2]  331 	addw	y, #21
      0087FE 93               [ 1]  332 	ldw	x, y
      0087FF 90 89            [ 2]  333 	pushw	y
      008801 89               [ 2]  334 	pushw	x
      008802 CD 8B 50         [ 4]  335 	call	_ReadDHT12
      008805 5B 02            [ 2]  336 	addw	sp, #2
      008807 90 85            [ 2]  337 	popw	y
                                    338 ;	main.c: 105: sprintf(temp,"%2d.%1dC/%2d.%1d%%/%3d",data.T,data.T1,data.W,data.W1,data.sum);
      008809 93               [ 1]  339 	ldw	x, y
      00880A E6 04            [ 1]  340 	ld	a, (0x4, x)
      00880C 6B 34            [ 1]  341 	ld	(0x34, sp), a
      00880E 0F 33            [ 1]  342 	clr	(0x33, sp)
      008810 93               [ 1]  343 	ldw	x, y
      008811 E6 03            [ 1]  344 	ld	a, (0x3, x)
      008813 6B 32            [ 1]  345 	ld	(0x32, sp), a
      008815 0F 31            [ 1]  346 	clr	(0x31, sp)
      008817 93               [ 1]  347 	ldw	x, y
      008818 E6 02            [ 1]  348 	ld	a, (0x2, x)
      00881A 6B 23            [ 1]  349 	ld	(0x23, sp), a
      00881C 0F 22            [ 1]  350 	clr	(0x22, sp)
      00881E 93               [ 1]  351 	ldw	x, y
      00881F E6 01            [ 1]  352 	ld	a, (0x1, x)
      008821 6B 21            [ 1]  353 	ld	(0x21, sp), a
      008823 0F 20            [ 1]  354 	clr	(0x20, sp)
      008825 90 F6            [ 1]  355 	ld	a, (y)
      008827 0F 1E            [ 1]  356 	clr	(0x1e, sp)
      008829 96               [ 1]  357 	ldw	x, sp
      00882A 5C               [ 1]  358 	incw	x
      00882B 1F 1C            [ 2]  359 	ldw	(0x1c, sp), x
      00882D 90 93            [ 1]  360 	ldw	y, x
      00882F 1E 33            [ 2]  361 	ldw	x, (0x33, sp)
      008831 89               [ 2]  362 	pushw	x
      008832 1E 33            [ 2]  363 	ldw	x, (0x33, sp)
      008834 89               [ 2]  364 	pushw	x
      008835 1E 26            [ 2]  365 	ldw	x, (0x26, sp)
      008837 89               [ 2]  366 	pushw	x
      008838 1E 26            [ 2]  367 	ldw	x, (0x26, sp)
      00883A 89               [ 2]  368 	pushw	x
      00883B 88               [ 1]  369 	push	a
      00883C 7B 27            [ 1]  370 	ld	a, (0x27, sp)
      00883E 88               [ 1]  371 	push	a
      00883F 4B 62            [ 1]  372 	push	#<___str_9
      008841 4B 80            [ 1]  373 	push	#(___str_9 >> 8)
      008843 90 89            [ 2]  374 	pushw	y
      008845 CD A1 CE         [ 4]  375 	call	_sprintf
      008848 5B 0E            [ 2]  376 	addw	sp, #14
                                    377 ;	main.c: 106: printf("%s",temp);
      00884A 1E 1C            [ 2]  378 	ldw	x, (0x1c, sp)
      00884C 89               [ 2]  379 	pushw	x
      00884D 4B 51            [ 1]  380 	push	#<___str_4
      00884F 4B 80            [ 1]  381 	push	#(___str_4 >> 8)
      008851 CD A2 89         [ 4]  382 	call	_printf
      008854 5B 04            [ 2]  383 	addw	sp, #4
                                    384 ;	main.c: 107: printf("\r\n");
      008856 4B 54            [ 1]  385 	push	#<___str_6
      008858 4B 80            [ 1]  386 	push	#(___str_6 >> 8)
      00885A CD A2 48         [ 4]  387 	call	_puts
      00885D 5B 02            [ 2]  388 	addw	sp, #2
                                    389 ;	main.c: 108: OLED_ShowString(0,6,temp);
      00885F 1E 1C            [ 2]  390 	ldw	x, (0x1c, sp)
      008861 89               [ 2]  391 	pushw	x
      008862 4B 06            [ 1]  392 	push	#0x06
      008864 4B 00            [ 1]  393 	push	#0x00
      008866 CD 91 F6         [ 4]  394 	call	_OLED_ShowString
      008869 5B 04            [ 2]  395 	addw	sp, #4
                                    396 ;	main.c: 109: count=0;
      00886B 72 5F 00 01      [ 1]  397 	clr	_main_count_196608_387+0
      00886F                        398 00104$:
                                    399 ;	main.c: 112: count++;
      00886F 72 5C 00 01      [ 1]  400 	inc	_main_count_196608_387+0
                                    401 ;	main.c: 114: GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
      008873 4B 20            [ 1]  402 	push	#0x20
      008875 4B 14            [ 1]  403 	push	#0x14
      008877 4B 50            [ 1]  404 	push	#0x50
      008879 CD 94 A0         [ 4]  405 	call	_GPIO_WriteReverse
      00887C 5B 03            [ 2]  406 	addw	sp, #3
                                    407 ;	main.c: 115: Delay(0xffff);
      00887E 4B FF            [ 1]  408 	push	#0xff
      008880 4B FF            [ 1]  409 	push	#0xff
      008882 CD 86 8E         [ 4]  410 	call	_Delay
      008885 5B 02            [ 2]  411 	addw	sp, #2
                                    412 ;	main.c: 118: }
      008887 CC 86 D7         [ 2]  413 	jp	00106$
                                    414 	.area CODE
                                    415 	.area CONST
      008028                        416 ___str_0:
      008028 53 54 4D 38 20 53 74   417 	.ascii "STM8 Started!"
             61 72 74 65 64 21
      008035 00                     418 	.db 0x00
      008036                        419 ___str_2:
      008036 53 54 4D 38 20 53 74   420 	.ascii "STM8 Started!"
             61 72 74 65 64 21
      008043 0D                     421 	.db 0x0d
      008044 00                     422 	.db 0x00
      008045                        423 ___str_3:
      008045 56 3A 25 34 64 2C 53   424 	.ascii "V:%4d,S:%1d"
             3A 25 31 64
      008050 00                     425 	.db 0x00
      008051                        426 ___str_4:
      008051 25 73                  427 	.ascii "%s"
      008053 00                     428 	.db 0x00
      008054                        429 ___str_6:
      008054 0D                     430 	.db 0x0d
      008055 00                     431 	.db 0x00
      008056                        432 ___str_7:
      008056 25 32 64 2F 25 32 64   433 	.ascii "%2d/%2d/%2d"
             2F 25 32 64
      008061 00                     434 	.db 0x00
      008062                        435 ___str_9:
      008062 25 32 64 2E 25 31 64   436 	.ascii "%2d.%1dC/%2d.%1d%%/%3d"
             43 2F 25 32 64 2E 25
             31 64 25 25 2F 25 33
             64
      008078 00                     437 	.db 0x00
                                    438 	.area INITIALIZER
                                    439 	.area CABS (ABS)
