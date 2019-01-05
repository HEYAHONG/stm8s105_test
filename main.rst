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
                                     17 	.globl _ds1302_read_time
                                     18 	.globl _ds1302_check
                                     19 	.globl _ds1302_port_init
                                     20 	.globl _ds1302_port_deinit
                                     21 	.globl _ds1302_active
                                     22 	.globl _Init_UART2
                                     23 	.globl _OLED_ShowString
                                     24 	.globl _OLED_Clear
                                     25 	.globl _OLED_Init
                                     26 	.globl _GPIO_ReadInputPin
                                     27 	.globl _GPIO_WriteReverse
                                     28 	.globl _GPIO_Init
                                     29 ;--------------------------------------------------------
                                     30 ; ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area DATA
                                     33 ;--------------------------------------------------------
                                     34 ; ram data
                                     35 ;--------------------------------------------------------
                                     36 	.area INITIALIZED
                                     37 ;--------------------------------------------------------
                                     38 ; Stack segment in internal ram 
                                     39 ;--------------------------------------------------------
                                     40 	.area	SSEG
      FFFFFF                         41 __start__stack:
      FFFFFF                         42 	.ds	1
                                     43 
                                     44 ;--------------------------------------------------------
                                     45 ; absolute external ram data
                                     46 ;--------------------------------------------------------
                                     47 	.area DABS (ABS)
                                     48 
                                     49 ; default segment ordering for linker
                                     50 	.area HOME
                                     51 	.area GSINIT
                                     52 	.area GSFINAL
                                     53 	.area CONST
                                     54 	.area INITIALIZER
                                     55 	.area CODE
                                     56 
                                     57 ;--------------------------------------------------------
                                     58 ; interrupt vector 
                                     59 ;--------------------------------------------------------
                                     60 	.area HOME
      008000                         61 __interrupt_vect:
      008000 82 00 80 07             62 	int s_GSINIT ; reset
                                     63 ;--------------------------------------------------------
                                     64 ; global & static initialisations
                                     65 ;--------------------------------------------------------
                                     66 	.area HOME
                                     67 	.area GSINIT
                                     68 	.area GSFINAL
                                     69 	.area GSINIT
      008007                         70 __sdcc_gs_init_startup:
      008007                         71 __sdcc_init_data:
                                     72 ; stm8_genXINIT() start
      008007 AE 00 00         [ 2]   73 	ldw x, #l_DATA
      00800A 27 07            [ 1]   74 	jreq	00002$
      00800C                         75 00001$:
      00800C 72 4F 00 00      [ 1]   76 	clr (s_DATA - 1, x)
      008010 5A               [ 2]   77 	decw x
      008011 26 F9            [ 1]   78 	jrne	00001$
      008013                         79 00002$:
      008013 AE 00 00         [ 2]   80 	ldw	x, #l_INITIALIZER
      008016 27 09            [ 1]   81 	jreq	00004$
      008018                         82 00003$:
      008018 D6 86 5C         [ 1]   83 	ld	a, (s_INITIALIZER - 1, x)
      00801B D7 00 00         [ 1]   84 	ld	(s_INITIALIZED - 1, x), a
      00801E 5A               [ 2]   85 	decw	x
      00801F 26 F7            [ 1]   86 	jrne	00003$
      008021                         87 00004$:
                                     88 ; stm8_genXINIT() end
                                     89 	.area GSFINAL
      008021 CC 80 04         [ 2]   90 	jp	__sdcc_program_startup
                                     91 ;--------------------------------------------------------
                                     92 ; Home
                                     93 ;--------------------------------------------------------
                                     94 	.area HOME
                                     95 	.area HOME
      008004                         96 __sdcc_program_startup:
      008004 CC 86 7D         [ 2]   97 	jp	_main
                                     98 ;	return from main will return to caller
                                     99 ;--------------------------------------------------------
                                    100 ; code
                                    101 ;--------------------------------------------------------
                                    102 	.area CODE
                                    103 ;	main.c: 46: void Delay(uint16_t nCount)
                                    104 ;	-----------------------------------------
                                    105 ;	 function Delay
                                    106 ;	-----------------------------------------
      008673                        107 _Delay:
                                    108 ;	main.c: 49: while (nCount != 0)
      008673 1E 03            [ 2]  109 	ldw	x, (0x03, sp)
      008675                        110 00101$:
      008675 5D               [ 2]  111 	tnzw	x
      008676 26 01            [ 1]  112 	jrne	00117$
      008678 81               [ 4]  113 	ret
      008679                        114 00117$:
                                    115 ;	main.c: 51: nCount--;
      008679 5A               [ 2]  116 	decw	x
      00867A 20 F9            [ 2]  117 	jra	00101$
                                    118 ;	main.c: 53: }
      00867C 81               [ 4]  119 	ret
                                    120 ;	main.c: 57: void main(void)
                                    121 ;	-----------------------------------------
                                    122 ;	 function main
                                    123 ;	-----------------------------------------
      00867D                        124 _main:
      00867D 52 27            [ 2]  125 	sub	sp, #39
                                    126 ;	main.c: 61: GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      00867F 4B E0            [ 1]  127 	push	#0xe0
      008681 4B 20            [ 1]  128 	push	#0x20
      008683 4B 14            [ 1]  129 	push	#0x14
      008685 4B 50            [ 1]  130 	push	#0x50
      008687 CD 90 4B         [ 4]  131 	call	_GPIO_Init
      00868A 5B 04            [ 2]  132 	addw	sp, #4
                                    133 ;	main.c: 62: GPIO_Init(GPIOF,GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
      00868C 4B 00            [ 1]  134 	push	#0x00
      00868E 4B 10            [ 1]  135 	push	#0x10
      008690 4B 19            [ 1]  136 	push	#0x19
      008692 4B 50            [ 1]  137 	push	#0x50
      008694 CD 90 4B         [ 4]  138 	call	_GPIO_Init
      008697 5B 04            [ 2]  139 	addw	sp, #4
                                    140 ;	main.c: 64: Init_UART2();
      008699 CD 87 E6         [ 4]  141 	call	_Init_UART2
                                    142 ;	main.c: 65: OLED_Init();
      00869C CD 8E 64         [ 4]  143 	call	_OLED_Init
                                    144 ;	main.c: 66: ds1302_active();
      00869F CD 8B 62         [ 4]  145 	call	_ds1302_active
                                    146 ;	main.c: 67: OLED_Clear();
      0086A2 CD 8C AC         [ 4]  147 	call	_OLED_Clear
                                    148 ;	main.c: 68: enableInterrupts(); //使能中断
      0086A5 9A               [ 1]  149 	rim
                                    150 ;	main.c: 70: OLED_ShowString(0,0,"STM8 Started!");
      0086A6 4B 24            [ 1]  151 	push	#<___str_0
      0086A8 4B 80            [ 1]  152 	push	#(___str_0 >> 8)
      0086AA 4B 00            [ 1]  153 	push	#0x00
      0086AC 4B 00            [ 1]  154 	push	#0x00
      0086AE CD 8E 31         [ 4]  155 	call	_OLED_ShowString
      0086B1 5B 04            [ 2]  156 	addw	sp, #4
                                    157 ;	main.c: 71: printf("STM8 Started!\r\n");
      0086B3 4B 32            [ 1]  158 	push	#<___str_2
      0086B5 4B 80            [ 1]  159 	push	#(___str_2 >> 8)
      0086B7 CD 9E 83         [ 4]  160 	call	_puts
      0086BA 5B 02            [ 2]  161 	addw	sp, #2
                                    162 ;	main.c: 73: while (1)
      0086BC                        163 00104$:
                                    164 ;	main.c: 77: sprintf(temp,"V:%4d,S:%1d",ReadADC(),GPIO_ReadInputPin(GPIOF,GPIO_PIN_4)==RESET?0:1);
      0086BC 4B 10            [ 1]  165 	push	#0x10
      0086BE 4B 19            [ 1]  166 	push	#0x19
      0086C0 4B 50            [ 1]  167 	push	#0x50
      0086C2 CD 90 EB         [ 4]  168 	call	_GPIO_ReadInputPin
      0086C5 5B 03            [ 2]  169 	addw	sp, #3
      0086C7 4D               [ 1]  170 	tnz	a
      0086C8 26 05            [ 1]  171 	jrne	00108$
      0086CA 5F               [ 1]  172 	clrw	x
      0086CB 1F 1A            [ 2]  173 	ldw	(0x1a, sp), x
      0086CD 20 05            [ 2]  174 	jra	00109$
      0086CF                        175 00108$:
      0086CF AE 00 01         [ 2]  176 	ldw	x, #0x0001
      0086D2 1F 1A            [ 2]  177 	ldw	(0x1a, sp), x
      0086D4                        178 00109$:
      0086D4 CD 8F EA         [ 4]  179 	call	_ReadADC
      0086D7 90 96            [ 1]  180 	ldw	y, sp
      0086D9 72 A9 00 08      [ 2]  181 	addw	y, #8
      0086DD 17 20            [ 2]  182 	ldw	(0x20, sp), y
      0086DF 7B 1B            [ 1]  183 	ld	a, (0x1b, sp)
      0086E1 88               [ 1]  184 	push	a
      0086E2 7B 1B            [ 1]  185 	ld	a, (0x1b, sp)
      0086E4 88               [ 1]  186 	push	a
      0086E5 89               [ 2]  187 	pushw	x
      0086E6 4B 41            [ 1]  188 	push	#<___str_3
      0086E8 4B 80            [ 1]  189 	push	#(___str_3 >> 8)
      0086EA 90 89            [ 2]  190 	pushw	y
      0086EC CD 9E 09         [ 4]  191 	call	_sprintf
      0086EF 5B 08            [ 2]  192 	addw	sp, #8
                                    193 ;	main.c: 78: printf("%s",temp);
      0086F1 1E 20            [ 2]  194 	ldw	x, (0x20, sp)
      0086F3 89               [ 2]  195 	pushw	x
      0086F4 4B 4D            [ 1]  196 	push	#<___str_4
      0086F6 4B 80            [ 1]  197 	push	#(___str_4 >> 8)
      0086F8 CD 9E C4         [ 4]  198 	call	_printf
      0086FB 5B 04            [ 2]  199 	addw	sp, #4
                                    200 ;	main.c: 79: printf("\r\n");
      0086FD 4B 50            [ 1]  201 	push	#<___str_6
      0086FF 4B 80            [ 1]  202 	push	#(___str_6 >> 8)
      008701 CD 9E 83         [ 4]  203 	call	_puts
      008704 5B 02            [ 2]  204 	addw	sp, #2
                                    205 ;	main.c: 80: OLED_ShowString(0,2,temp);
      008706 1E 20            [ 2]  206 	ldw	x, (0x20, sp)
      008708 89               [ 2]  207 	pushw	x
      008709 4B 02            [ 1]  208 	push	#0x02
      00870B 4B 00            [ 1]  209 	push	#0x00
      00870D CD 8E 31         [ 4]  210 	call	_OLED_ShowString
      008710 5B 04            [ 2]  211 	addw	sp, #4
                                    212 ;	main.c: 83: ds1302_port_init();
      008712 CD 88 AE         [ 4]  213 	call	_ds1302_port_init
                                    214 ;	main.c: 84: if(ds1302_check())
      008715 CD 8A 1D         [ 4]  215 	call	_ds1302_check
      008718 4D               [ 1]  216 	tnz	a
      008719 26 03            [ 1]  217 	jrne	00126$
      00871B CC 87 CC         [ 2]  218 	jp	00102$
      00871E                        219 00126$:
                                    220 ;	main.c: 88: ds1302_read_time(&ds_time);
      00871E 96               [ 1]  221 	ldw	x, sp
      00871F 5C               [ 1]  222 	incw	x
      008720 1F 26            [ 2]  223 	ldw	(0x26, sp), x
      008722 89               [ 2]  224 	pushw	x
      008723 CD 8A 35         [ 4]  225 	call	_ds1302_read_time
      008726 5B 02            [ 2]  226 	addw	sp, #2
                                    227 ;	main.c: 89: sprintf(temp,"%2d/%2d/%2d",ds_time.hour,ds_time.minute/16*10+ds_time.minute%16,ds_time.second/16*10+ds_time.second%16);
      008728 1E 26            [ 2]  228 	ldw	x, (0x26, sp)
      00872A E6 06            [ 1]  229 	ld	a, (0x6, x)
      00872C 6B 23            [ 1]  230 	ld	(0x23, sp), a
      00872E 0F 22            [ 1]  231 	clr	(0x22, sp)
      008730 4B 10            [ 1]  232 	push	#0x10
      008732 4B 00            [ 1]  233 	push	#0x00
      008734 1E 24            [ 2]  234 	ldw	x, (0x24, sp)
      008736 89               [ 2]  235 	pushw	x
      008737 CD 9F 6C         [ 4]  236 	call	__divsint
      00873A 5B 04            [ 2]  237 	addw	sp, #4
      00873C 89               [ 2]  238 	pushw	x
      00873D 58               [ 2]  239 	sllw	x
      00873E 58               [ 2]  240 	sllw	x
      00873F 72 FB 01         [ 2]  241 	addw	x, (1, sp)
      008742 58               [ 2]  242 	sllw	x
      008743 5B 02            [ 2]  243 	addw	sp, #2
      008745 1F 14            [ 2]  244 	ldw	(0x14, sp), x
      008747 4B 10            [ 1]  245 	push	#0x10
      008749 4B 00            [ 1]  246 	push	#0x00
      00874B 1E 24            [ 2]  247 	ldw	x, (0x24, sp)
      00874D 89               [ 2]  248 	pushw	x
      00874E CD 9F 56         [ 4]  249 	call	__modsint
      008751 5B 04            [ 2]  250 	addw	sp, #4
      008753 72 FB 14         [ 2]  251 	addw	x, (0x14, sp)
      008756 1F 24            [ 2]  252 	ldw	(0x24, sp), x
      008758 1E 26            [ 2]  253 	ldw	x, (0x26, sp)
      00875A E6 05            [ 1]  254 	ld	a, (0x5, x)
      00875C 6B 1F            [ 1]  255 	ld	(0x1f, sp), a
      00875E 0F 1E            [ 1]  256 	clr	(0x1e, sp)
      008760 4B 10            [ 1]  257 	push	#0x10
      008762 4B 00            [ 1]  258 	push	#0x00
      008764 1E 20            [ 2]  259 	ldw	x, (0x20, sp)
      008766 89               [ 2]  260 	pushw	x
      008767 CD 9F 6C         [ 4]  261 	call	__divsint
      00876A 5B 04            [ 2]  262 	addw	sp, #4
      00876C 89               [ 2]  263 	pushw	x
      00876D 58               [ 2]  264 	sllw	x
      00876E 58               [ 2]  265 	sllw	x
      00876F 72 FB 01         [ 2]  266 	addw	x, (1, sp)
      008772 58               [ 2]  267 	sllw	x
      008773 5B 02            [ 2]  268 	addw	sp, #2
      008775 1F 1C            [ 2]  269 	ldw	(0x1c, sp), x
      008777 4B 10            [ 1]  270 	push	#0x10
      008779 4B 00            [ 1]  271 	push	#0x00
      00877B 1E 20            [ 2]  272 	ldw	x, (0x20, sp)
      00877D 89               [ 2]  273 	pushw	x
      00877E CD 9F 56         [ 4]  274 	call	__modsint
      008781 5B 04            [ 2]  275 	addw	sp, #4
      008783 72 FB 1C         [ 2]  276 	addw	x, (0x1c, sp)
      008786 1F 18            [ 2]  277 	ldw	(0x18, sp), x
      008788 1E 26            [ 2]  278 	ldw	x, (0x26, sp)
      00878A E6 04            [ 1]  279 	ld	a, (0x4, x)
      00878C 0F 16            [ 1]  280 	clr	(0x16, sp)
      00878E 96               [ 1]  281 	ldw	x, sp
      00878F 1C 00 08         [ 2]  282 	addw	x, #8
      008792 1F 12            [ 2]  283 	ldw	(0x12, sp), x
      008794 90 93            [ 1]  284 	ldw	y, x
      008796 1E 24            [ 2]  285 	ldw	x, (0x24, sp)
      008798 89               [ 2]  286 	pushw	x
      008799 1E 1A            [ 2]  287 	ldw	x, (0x1a, sp)
      00879B 89               [ 2]  288 	pushw	x
      00879C 88               [ 1]  289 	push	a
      00879D 7B 1B            [ 1]  290 	ld	a, (0x1b, sp)
      00879F 88               [ 1]  291 	push	a
      0087A0 4B 52            [ 1]  292 	push	#<___str_7
      0087A2 4B 80            [ 1]  293 	push	#(___str_7 >> 8)
      0087A4 90 89            [ 2]  294 	pushw	y
      0087A6 CD 9E 09         [ 4]  295 	call	_sprintf
      0087A9 5B 0A            [ 2]  296 	addw	sp, #10
                                    297 ;	main.c: 90: printf("%s",temp);
      0087AB 1E 12            [ 2]  298 	ldw	x, (0x12, sp)
      0087AD 89               [ 2]  299 	pushw	x
      0087AE 4B 4D            [ 1]  300 	push	#<___str_4
      0087B0 4B 80            [ 1]  301 	push	#(___str_4 >> 8)
      0087B2 CD 9E C4         [ 4]  302 	call	_printf
      0087B5 5B 04            [ 2]  303 	addw	sp, #4
                                    304 ;	main.c: 91: printf("\r\n");
      0087B7 4B 50            [ 1]  305 	push	#<___str_6
      0087B9 4B 80            [ 1]  306 	push	#(___str_6 >> 8)
      0087BB CD 9E 83         [ 4]  307 	call	_puts
      0087BE 5B 02            [ 2]  308 	addw	sp, #2
                                    309 ;	main.c: 92: OLED_ShowString(0,4,temp);
      0087C0 1E 12            [ 2]  310 	ldw	x, (0x12, sp)
      0087C2 89               [ 2]  311 	pushw	x
      0087C3 4B 04            [ 1]  312 	push	#0x04
      0087C5 4B 00            [ 1]  313 	push	#0x00
      0087C7 CD 8E 31         [ 4]  314 	call	_OLED_ShowString
      0087CA 5B 04            [ 2]  315 	addw	sp, #4
      0087CC                        316 00102$:
                                    317 ;	main.c: 94: ds1302_port_deinit();
      0087CC CD 88 86         [ 4]  318 	call	_ds1302_port_deinit
                                    319 ;	main.c: 96: GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
      0087CF 4B 20            [ 1]  320 	push	#0x20
      0087D1 4B 14            [ 1]  321 	push	#0x14
      0087D3 4B 50            [ 1]  322 	push	#0x50
      0087D5 CD 90 DB         [ 4]  323 	call	_GPIO_WriteReverse
      0087D8 5B 03            [ 2]  324 	addw	sp, #3
                                    325 ;	main.c: 97: Delay(0xffff);
      0087DA 4B FF            [ 1]  326 	push	#0xff
      0087DC 4B FF            [ 1]  327 	push	#0xff
      0087DE CD 86 73         [ 4]  328 	call	_Delay
      0087E1 5B 02            [ 2]  329 	addw	sp, #2
                                    330 ;	main.c: 100: }
      0087E3 CC 86 BC         [ 2]  331 	jp	00104$
                                    332 	.area CODE
                                    333 	.area CONST
      008024                        334 ___str_0:
      008024 53 54 4D 38 20 53 74   335 	.ascii "STM8 Started!"
             61 72 74 65 64 21
      008031 00                     336 	.db 0x00
      008032                        337 ___str_2:
      008032 53 54 4D 38 20 53 74   338 	.ascii "STM8 Started!"
             61 72 74 65 64 21
      00803F 0D                     339 	.db 0x0d
      008040 00                     340 	.db 0x00
      008041                        341 ___str_3:
      008041 56 3A 25 34 64 2C 53   342 	.ascii "V:%4d,S:%1d"
             3A 25 31 64
      00804C 00                     343 	.db 0x00
      00804D                        344 ___str_4:
      00804D 25 73                  345 	.ascii "%s"
      00804F 00                     346 	.db 0x00
      008050                        347 ___str_6:
      008050 0D                     348 	.db 0x0d
      008051 00                     349 	.db 0x00
      008052                        350 ___str_7:
      008052 25 32 64 2F 25 32 64   351 	.ascii "%2d/%2d/%2d"
             2F 25 32 64
      00805D 00                     352 	.db 0x00
                                    353 	.area INITIALIZER
                                    354 	.area CABS (ABS)
