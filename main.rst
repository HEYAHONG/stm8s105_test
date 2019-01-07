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
      008004 CC 86 D3         [ 2]  102 	jp	_main
                                    103 ;	return from main will return to caller
                                    104 ;--------------------------------------------------------
                                    105 ; code
                                    106 ;--------------------------------------------------------
                                    107 	.area CODE
                                    108 ;	main.c: 47: void Delay(uint16_t nCount)
                                    109 ;	-----------------------------------------
                                    110 ;	 function Delay
                                    111 ;	-----------------------------------------
      0086C9                        112 _Delay:
                                    113 ;	main.c: 50: while (nCount != 0)
      0086C9 1E 03            [ 2]  114 	ldw	x, (0x03, sp)
      0086CB                        115 00101$:
      0086CB 5D               [ 2]  116 	tnzw	x
      0086CC 26 01            [ 1]  117 	jrne	00117$
      0086CE 81               [ 4]  118 	ret
      0086CF                        119 00117$:
                                    120 ;	main.c: 52: nCount--;
      0086CF 5A               [ 2]  121 	decw	x
      0086D0 20 F9            [ 2]  122 	jra	00101$
                                    123 ;	main.c: 54: }
      0086D2 81               [ 4]  124 	ret
                                    125 ;	main.c: 58: void main(void)
                                    126 ;	-----------------------------------------
                                    127 ;	 function main
                                    128 ;	-----------------------------------------
      0086D3                        129 _main:
      0086D3 52 3E            [ 2]  130 	sub	sp, #62
                                    131 ;	main.c: 62: GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      0086D5 4B E0            [ 1]  132 	push	#0xe0
      0086D7 4B 20            [ 1]  133 	push	#0x20
      0086D9 4B 14            [ 1]  134 	push	#0x14
      0086DB 4B 50            [ 1]  135 	push	#0x50
      0086DD CD 94 42         [ 4]  136 	call	_GPIO_Init
      0086E0 5B 04            [ 2]  137 	addw	sp, #4
                                    138 ;	main.c: 63: GPIO_Init(GPIOF,GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
      0086E2 4B 00            [ 1]  139 	push	#0x00
      0086E4 4B 10            [ 1]  140 	push	#0x10
      0086E6 4B 19            [ 1]  141 	push	#0x19
      0086E8 4B 50            [ 1]  142 	push	#0x50
      0086EA CD 94 42         [ 4]  143 	call	_GPIO_Init
      0086ED 5B 04            [ 2]  144 	addw	sp, #4
                                    145 ;	main.c: 65: Init_UART2();
      0086EF CD 8C 0F         [ 4]  146 	call	_Init_UART2
                                    147 ;	main.c: 66: OLED_Init();
      0086F2 CD 92 5B         [ 4]  148 	call	_OLED_Init
                                    149 ;	main.c: 67: ds1302_active();
      0086F5 CD 8F 59         [ 4]  150 	call	_ds1302_active
                                    151 ;	main.c: 68: OLED_Clear();
      0086F8 CD 90 A3         [ 4]  152 	call	_OLED_Clear
                                    153 ;	main.c: 69: enableInterrupts(); //使能中断
      0086FB 9A               [ 1]  154 	rim
                                    155 ;	main.c: 71: OLED_ShowString(0,0,"STM8 Started!");
      0086FC 4B 28            [ 1]  156 	push	#<___str_0
      0086FE 4B 80            [ 1]  157 	push	#(___str_0 >> 8)
      008700 4B 00            [ 1]  158 	push	#0x00
      008702 4B 00            [ 1]  159 	push	#0x00
      008704 CD 92 28         [ 4]  160 	call	_OLED_ShowString
      008707 5B 04            [ 2]  161 	addw	sp, #4
                                    162 ;	main.c: 72: printf("STM8 Started!\r\n");
      008709 4B 36            [ 1]  163 	push	#<___str_2
      00870B 4B 80            [ 1]  164 	push	#(___str_2 >> 8)
      00870D CD A2 7A         [ 4]  165 	call	_puts
      008710 5B 02            [ 2]  166 	addw	sp, #2
                                    167 ;	main.c: 74: while (1)
      008712                        168 00106$:
                                    169 ;	main.c: 78: sprintf(temp,"V:%4d,S:%1d",ReadADC(),GPIO_ReadInputPin(GPIOF,GPIO_PIN_4)==RESET?0:1);
      008712 4B 10            [ 1]  170 	push	#0x10
      008714 4B 19            [ 1]  171 	push	#0x19
      008716 4B 50            [ 1]  172 	push	#0x50
      008718 CD 94 E2         [ 4]  173 	call	_GPIO_ReadInputPin
      00871B 5B 03            [ 2]  174 	addw	sp, #3
      00871D 4D               [ 1]  175 	tnz	a
      00871E 26 05            [ 1]  176 	jrne	00110$
      008720 5F               [ 1]  177 	clrw	x
      008721 1F 3D            [ 2]  178 	ldw	(0x3d, sp), x
      008723 20 05            [ 2]  179 	jra	00111$
      008725                        180 00110$:
      008725 AE 00 01         [ 2]  181 	ldw	x, #0x0001
      008728 1F 3D            [ 2]  182 	ldw	(0x3d, sp), x
      00872A                        183 00111$:
      00872A CD 93 E1         [ 4]  184 	call	_ReadADC
      00872D 90 96            [ 1]  185 	ldw	y, sp
      00872F 72 A9 00 10      [ 2]  186 	addw	y, #16
      008733 17 34            [ 2]  187 	ldw	(0x34, sp), y
      008735 7B 3E            [ 1]  188 	ld	a, (0x3e, sp)
      008737 88               [ 1]  189 	push	a
      008738 7B 3E            [ 1]  190 	ld	a, (0x3e, sp)
      00873A 88               [ 1]  191 	push	a
      00873B 89               [ 2]  192 	pushw	x
      00873C 4B 45            [ 1]  193 	push	#<___str_3
      00873E 4B 80            [ 1]  194 	push	#(___str_3 >> 8)
      008740 90 89            [ 2]  195 	pushw	y
      008742 CD A2 00         [ 4]  196 	call	_sprintf
      008745 5B 08            [ 2]  197 	addw	sp, #8
                                    198 ;	main.c: 79: printf("%s",temp);
      008747 1E 34            [ 2]  199 	ldw	x, (0x34, sp)
      008749 89               [ 2]  200 	pushw	x
      00874A 4B 51            [ 1]  201 	push	#<___str_4
      00874C 4B 80            [ 1]  202 	push	#(___str_4 >> 8)
      00874E CD A2 BB         [ 4]  203 	call	_printf
      008751 5B 04            [ 2]  204 	addw	sp, #4
                                    205 ;	main.c: 80: printf("\r\n");
      008753 4B 54            [ 1]  206 	push	#<___str_6
      008755 4B 80            [ 1]  207 	push	#(___str_6 >> 8)
      008757 CD A2 7A         [ 4]  208 	call	_puts
      00875A 5B 02            [ 2]  209 	addw	sp, #2
                                    210 ;	main.c: 81: OLED_ShowString(0,2,temp);
      00875C 1E 34            [ 2]  211 	ldw	x, (0x34, sp)
      00875E 89               [ 2]  212 	pushw	x
      00875F 4B 02            [ 1]  213 	push	#0x02
      008761 4B 00            [ 1]  214 	push	#0x00
      008763 CD 92 28         [ 4]  215 	call	_OLED_ShowString
      008766 5B 04            [ 2]  216 	addw	sp, #4
                                    217 ;	main.c: 84: ds1302_port_init();
      008768 CD 8C B7         [ 4]  218 	call	_ds1302_port_init
                                    219 ;	main.c: 85: if(ds1302_check())
      00876B CD 8E 14         [ 4]  220 	call	_ds1302_check
      00876E 6B 3C            [ 1]  221 	ld	(0x3c, sp), a
      008770 26 03            [ 1]  222 	jrne	00133$
      008772 CC 88 4F         [ 2]  223 	jp	00102$
      008775                        224 00133$:
                                    225 ;	main.c: 89: ds1302_read_time(&ds_time);
      008775 96               [ 1]  226 	ldw	x, sp
      008776 1C 00 09         [ 2]  227 	addw	x, #9
      008779 1F 1E            [ 2]  228 	ldw	(0x1e, sp), x
      00877B 89               [ 2]  229 	pushw	x
      00877C CD 8E 2C         [ 4]  230 	call	_ds1302_read_time
      00877F 5B 02            [ 2]  231 	addw	sp, #2
                                    232 ;	main.c: 90: sprintf(temp,"%2d/%2d/%2d",ds_time.hour/16*10+ds_time.hour%16,ds_time.minute/16*10+ds_time.minute%16,ds_time.second/16*10+ds_time.second%16);
      008781 1E 1E            [ 2]  233 	ldw	x, (0x1e, sp)
      008783 E6 06            [ 1]  234 	ld	a, (0x6, x)
      008785 6B 2B            [ 1]  235 	ld	(0x2b, sp), a
      008787 0F 2A            [ 1]  236 	clr	(0x2a, sp)
      008789 4B 10            [ 1]  237 	push	#0x10
      00878B 4B 00            [ 1]  238 	push	#0x00
      00878D 1E 2C            [ 2]  239 	ldw	x, (0x2c, sp)
      00878F 89               [ 2]  240 	pushw	x
      008790 CD A3 63         [ 4]  241 	call	__divsint
      008793 5B 04            [ 2]  242 	addw	sp, #4
      008795 89               [ 2]  243 	pushw	x
      008796 58               [ 2]  244 	sllw	x
      008797 58               [ 2]  245 	sllw	x
      008798 72 FB 01         [ 2]  246 	addw	x, (1, sp)
      00879B 58               [ 2]  247 	sllw	x
      00879C 5B 02            [ 2]  248 	addw	sp, #2
      00879E 1F 30            [ 2]  249 	ldw	(0x30, sp), x
      0087A0 4B 10            [ 1]  250 	push	#0x10
      0087A2 4B 00            [ 1]  251 	push	#0x00
      0087A4 1E 2C            [ 2]  252 	ldw	x, (0x2c, sp)
      0087A6 89               [ 2]  253 	pushw	x
      0087A7 CD A3 4D         [ 4]  254 	call	__modsint
      0087AA 5B 04            [ 2]  255 	addw	sp, #4
      0087AC 72 FB 30         [ 2]  256 	addw	x, (0x30, sp)
      0087AF 1F 32            [ 2]  257 	ldw	(0x32, sp), x
      0087B1 1E 1E            [ 2]  258 	ldw	x, (0x1e, sp)
      0087B3 E6 05            [ 1]  259 	ld	a, (0x5, x)
      0087B5 6B 2D            [ 1]  260 	ld	(0x2d, sp), a
      0087B7 0F 2C            [ 1]  261 	clr	(0x2c, sp)
      0087B9 4B 10            [ 1]  262 	push	#0x10
      0087BB 4B 00            [ 1]  263 	push	#0x00
      0087BD 1E 2E            [ 2]  264 	ldw	x, (0x2e, sp)
      0087BF 89               [ 2]  265 	pushw	x
      0087C0 CD A3 63         [ 4]  266 	call	__divsint
      0087C3 5B 04            [ 2]  267 	addw	sp, #4
      0087C5 89               [ 2]  268 	pushw	x
      0087C6 58               [ 2]  269 	sllw	x
      0087C7 58               [ 2]  270 	sllw	x
      0087C8 72 FB 01         [ 2]  271 	addw	x, (1, sp)
      0087CB 58               [ 2]  272 	sllw	x
      0087CC 5B 02            [ 2]  273 	addw	sp, #2
      0087CE 1F 2E            [ 2]  274 	ldw	(0x2e, sp), x
      0087D0 4B 10            [ 1]  275 	push	#0x10
      0087D2 4B 00            [ 1]  276 	push	#0x00
      0087D4 1E 2E            [ 2]  277 	ldw	x, (0x2e, sp)
      0087D6 89               [ 2]  278 	pushw	x
      0087D7 CD A3 4D         [ 4]  279 	call	__modsint
      0087DA 5B 04            [ 2]  280 	addw	sp, #4
      0087DC 72 FB 2E         [ 2]  281 	addw	x, (0x2e, sp)
      0087DF 1F 24            [ 2]  282 	ldw	(0x24, sp), x
      0087E1 1E 1E            [ 2]  283 	ldw	x, (0x1e, sp)
      0087E3 E6 04            [ 1]  284 	ld	a, (0x4, x)
      0087E5 6B 23            [ 1]  285 	ld	(0x23, sp), a
      0087E7 0F 22            [ 1]  286 	clr	(0x22, sp)
      0087E9 4B 10            [ 1]  287 	push	#0x10
      0087EB 4B 00            [ 1]  288 	push	#0x00
      0087ED 1E 24            [ 2]  289 	ldw	x, (0x24, sp)
      0087EF 89               [ 2]  290 	pushw	x
      0087F0 CD A3 63         [ 4]  291 	call	__divsint
      0087F3 5B 04            [ 2]  292 	addw	sp, #4
      0087F5 89               [ 2]  293 	pushw	x
      0087F6 58               [ 2]  294 	sllw	x
      0087F7 58               [ 2]  295 	sllw	x
      0087F8 72 FB 01         [ 2]  296 	addw	x, (1, sp)
      0087FB 58               [ 2]  297 	sllw	x
      0087FC 5B 02            [ 2]  298 	addw	sp, #2
      0087FE 1F 20            [ 2]  299 	ldw	(0x20, sp), x
      008800 4B 10            [ 1]  300 	push	#0x10
      008802 4B 00            [ 1]  301 	push	#0x00
      008804 1E 24            [ 2]  302 	ldw	x, (0x24, sp)
      008806 89               [ 2]  303 	pushw	x
      008807 CD A3 4D         [ 4]  304 	call	__modsint
      00880A 5B 04            [ 2]  305 	addw	sp, #4
      00880C 72 FB 20         [ 2]  306 	addw	x, (0x20, sp)
      00880F 51               [ 1]  307 	exgw	x, y
      008810 96               [ 1]  308 	ldw	x, sp
      008811 1C 00 10         [ 2]  309 	addw	x, #16
      008814 1F 1C            [ 2]  310 	ldw	(0x1c, sp), x
      008816 7B 33            [ 1]  311 	ld	a, (0x33, sp)
      008818 88               [ 1]  312 	push	a
      008819 7B 33            [ 1]  313 	ld	a, (0x33, sp)
      00881B 88               [ 1]  314 	push	a
      00881C 7B 27            [ 1]  315 	ld	a, (0x27, sp)
      00881E 88               [ 1]  316 	push	a
      00881F 7B 27            [ 1]  317 	ld	a, (0x27, sp)
      008821 88               [ 1]  318 	push	a
      008822 90 89            [ 2]  319 	pushw	y
      008824 4B 56            [ 1]  320 	push	#<___str_7
      008826 4B 80            [ 1]  321 	push	#(___str_7 >> 8)
      008828 89               [ 2]  322 	pushw	x
      008829 CD A2 00         [ 4]  323 	call	_sprintf
      00882C 5B 0A            [ 2]  324 	addw	sp, #10
                                    325 ;	main.c: 91: printf("%s",temp);
      00882E 1E 1C            [ 2]  326 	ldw	x, (0x1c, sp)
      008830 89               [ 2]  327 	pushw	x
      008831 4B 51            [ 1]  328 	push	#<___str_4
      008833 4B 80            [ 1]  329 	push	#(___str_4 >> 8)
      008835 CD A2 BB         [ 4]  330 	call	_printf
      008838 5B 04            [ 2]  331 	addw	sp, #4
                                    332 ;	main.c: 92: printf("\r\n");
      00883A 4B 54            [ 1]  333 	push	#<___str_6
      00883C 4B 80            [ 1]  334 	push	#(___str_6 >> 8)
      00883E CD A2 7A         [ 4]  335 	call	_puts
      008841 5B 02            [ 2]  336 	addw	sp, #2
                                    337 ;	main.c: 93: OLED_ShowString(0,4,temp);
      008843 1E 1C            [ 2]  338 	ldw	x, (0x1c, sp)
      008845 89               [ 2]  339 	pushw	x
      008846 4B 04            [ 1]  340 	push	#0x04
      008848 4B 00            [ 1]  341 	push	#0x00
      00884A CD 92 28         [ 4]  342 	call	_OLED_ShowString
      00884D 5B 04            [ 2]  343 	addw	sp, #4
      00884F                        344 00102$:
                                    345 ;	main.c: 95: ds1302_port_deinit();
      00884F CD 8C 8F         [ 4]  346 	call	_ds1302_port_deinit
                                    347 ;	main.c: 100: if(count>=2)
      008852 C6 00 01         [ 1]  348 	ld	a, _main_count_196608_387+0
      008855 A1 02            [ 1]  349 	cp	a, #0x02
      008857 24 03            [ 1]  350 	jrnc	00134$
      008859 CC 88 D3         [ 2]  351 	jp	00104$
      00885C                        352 00134$:
                                    353 ;	main.c: 104: ReadDHT12(&data);
      00885C 90 96            [ 1]  354 	ldw	y, sp
      00885E 72 A9 00 15      [ 2]  355 	addw	y, #21
      008862 93               [ 1]  356 	ldw	x, y
      008863 90 89            [ 2]  357 	pushw	y
      008865 89               [ 2]  358 	pushw	x
      008866 CD 8B B4         [ 4]  359 	call	_ReadDHT12
      008869 5B 02            [ 2]  360 	addw	sp, #2
      00886B 90 85            [ 2]  361 	popw	y
                                    362 ;	main.c: 105: sprintf(temp,"%2d.%1dC/%2d.%1d%%/%3d",data.T,data.T1,data.W,data.W1,data.sum);
      00886D 93               [ 1]  363 	ldw	x, y
      00886E E6 04            [ 1]  364 	ld	a, (0x4, x)
      008870 6B 1B            [ 1]  365 	ld	(0x1b, sp), a
      008872 0F 1A            [ 1]  366 	clr	(0x1a, sp)
      008874 93               [ 1]  367 	ldw	x, y
      008875 E6 03            [ 1]  368 	ld	a, (0x3, x)
      008877 6B 3B            [ 1]  369 	ld	(0x3b, sp), a
      008879 0F 3A            [ 1]  370 	clr	(0x3a, sp)
      00887B 93               [ 1]  371 	ldw	x, y
      00887C E6 02            [ 1]  372 	ld	a, (0x2, x)
      00887E 6B 39            [ 1]  373 	ld	(0x39, sp), a
      008880 0F 38            [ 1]  374 	clr	(0x38, sp)
      008882 93               [ 1]  375 	ldw	x, y
      008883 E6 01            [ 1]  376 	ld	a, (0x1, x)
      008885 6B 37            [ 1]  377 	ld	(0x37, sp), a
      008887 0F 36            [ 1]  378 	clr	(0x36, sp)
      008889 90 F6            [ 1]  379 	ld	a, (y)
      00888B 0F 28            [ 1]  380 	clr	(0x28, sp)
      00888D 96               [ 1]  381 	ldw	x, sp
      00888E 5C               [ 1]  382 	incw	x
      00888F 1F 26            [ 2]  383 	ldw	(0x26, sp), x
      008891 90 93            [ 1]  384 	ldw	y, x
      008893 1E 1A            [ 2]  385 	ldw	x, (0x1a, sp)
      008895 89               [ 2]  386 	pushw	x
      008896 1E 3C            [ 2]  387 	ldw	x, (0x3c, sp)
      008898 89               [ 2]  388 	pushw	x
      008899 1E 3C            [ 2]  389 	ldw	x, (0x3c, sp)
      00889B 89               [ 2]  390 	pushw	x
      00889C 1E 3C            [ 2]  391 	ldw	x, (0x3c, sp)
      00889E 89               [ 2]  392 	pushw	x
      00889F 88               [ 1]  393 	push	a
      0088A0 7B 31            [ 1]  394 	ld	a, (0x31, sp)
      0088A2 88               [ 1]  395 	push	a
      0088A3 4B 62            [ 1]  396 	push	#<___str_9
      0088A5 4B 80            [ 1]  397 	push	#(___str_9 >> 8)
      0088A7 90 89            [ 2]  398 	pushw	y
      0088A9 CD A2 00         [ 4]  399 	call	_sprintf
      0088AC 5B 0E            [ 2]  400 	addw	sp, #14
                                    401 ;	main.c: 106: printf("%s",temp);
      0088AE 1E 26            [ 2]  402 	ldw	x, (0x26, sp)
      0088B0 89               [ 2]  403 	pushw	x
      0088B1 4B 51            [ 1]  404 	push	#<___str_4
      0088B3 4B 80            [ 1]  405 	push	#(___str_4 >> 8)
      0088B5 CD A2 BB         [ 4]  406 	call	_printf
      0088B8 5B 04            [ 2]  407 	addw	sp, #4
                                    408 ;	main.c: 107: printf("\r\n");
      0088BA 4B 54            [ 1]  409 	push	#<___str_6
      0088BC 4B 80            [ 1]  410 	push	#(___str_6 >> 8)
      0088BE CD A2 7A         [ 4]  411 	call	_puts
      0088C1 5B 02            [ 2]  412 	addw	sp, #2
                                    413 ;	main.c: 108: OLED_ShowString(0,6,temp);
      0088C3 1E 26            [ 2]  414 	ldw	x, (0x26, sp)
      0088C5 89               [ 2]  415 	pushw	x
      0088C6 4B 06            [ 1]  416 	push	#0x06
      0088C8 4B 00            [ 1]  417 	push	#0x00
      0088CA CD 92 28         [ 4]  418 	call	_OLED_ShowString
      0088CD 5B 04            [ 2]  419 	addw	sp, #4
                                    420 ;	main.c: 109: count=0;
      0088CF 72 5F 00 01      [ 1]  421 	clr	_main_count_196608_387+0
      0088D3                        422 00104$:
                                    423 ;	main.c: 112: count++;
      0088D3 72 5C 00 01      [ 1]  424 	inc	_main_count_196608_387+0
                                    425 ;	main.c: 114: GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
      0088D7 4B 20            [ 1]  426 	push	#0x20
      0088D9 4B 14            [ 1]  427 	push	#0x14
      0088DB 4B 50            [ 1]  428 	push	#0x50
      0088DD CD 94 D2         [ 4]  429 	call	_GPIO_WriteReverse
      0088E0 5B 03            [ 2]  430 	addw	sp, #3
                                    431 ;	main.c: 115: Delay(0xffff);
      0088E2 4B FF            [ 1]  432 	push	#0xff
      0088E4 4B FF            [ 1]  433 	push	#0xff
      0088E6 CD 86 C9         [ 4]  434 	call	_Delay
      0088E9 5B 02            [ 2]  435 	addw	sp, #2
                                    436 ;	main.c: 118: }
      0088EB CC 87 12         [ 2]  437 	jp	00106$
                                    438 	.area CODE
                                    439 	.area CONST
      008028                        440 ___str_0:
      008028 53 54 4D 38 20 53 74   441 	.ascii "STM8 Started!"
             61 72 74 65 64 21
      008035 00                     442 	.db 0x00
      008036                        443 ___str_2:
      008036 53 54 4D 38 20 53 74   444 	.ascii "STM8 Started!"
             61 72 74 65 64 21
      008043 0D                     445 	.db 0x0d
      008044 00                     446 	.db 0x00
      008045                        447 ___str_3:
      008045 56 3A 25 34 64 2C 53   448 	.ascii "V:%4d,S:%1d"
             3A 25 31 64
      008050 00                     449 	.db 0x00
      008051                        450 ___str_4:
      008051 25 73                  451 	.ascii "%s"
      008053 00                     452 	.db 0x00
      008054                        453 ___str_6:
      008054 0D                     454 	.db 0x0d
      008055 00                     455 	.db 0x00
      008056                        456 ___str_7:
      008056 25 32 64 2F 25 32 64   457 	.ascii "%2d/%2d/%2d"
             2F 25 32 64
      008061 00                     458 	.db 0x00
      008062                        459 ___str_9:
      008062 25 32 64 2E 25 31 64   460 	.ascii "%2d.%1dC/%2d.%1d%%/%3d"
             43 2F 25 32 64 2E 25
             31 64 25 25 2F 25 33
             64
      008078 00                     461 	.db 0x00
                                    462 	.area INITIALIZER
                                    463 	.area CABS (ABS)
