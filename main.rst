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
                                     21 	.globl _Init_UART2
                                     22 	.globl _OLED_ShowString
                                     23 	.globl _OLED_Clear
                                     24 	.globl _OLED_Init
                                     25 	.globl _GPIO_ReadInputPin
                                     26 	.globl _GPIO_WriteReverse
                                     27 	.globl _GPIO_Init
                                     28 ;--------------------------------------------------------
                                     29 ; ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area DATA
                                     32 ;--------------------------------------------------------
                                     33 ; ram data
                                     34 ;--------------------------------------------------------
                                     35 	.area INITIALIZED
                                     36 ;--------------------------------------------------------
                                     37 ; Stack segment in internal ram 
                                     38 ;--------------------------------------------------------
                                     39 	.area	SSEG
      FFFFFF                         40 __start__stack:
      FFFFFF                         41 	.ds	1
                                     42 
                                     43 ;--------------------------------------------------------
                                     44 ; absolute external ram data
                                     45 ;--------------------------------------------------------
                                     46 	.area DABS (ABS)
                                     47 
                                     48 ; default segment ordering for linker
                                     49 	.area HOME
                                     50 	.area GSINIT
                                     51 	.area GSFINAL
                                     52 	.area CONST
                                     53 	.area INITIALIZER
                                     54 	.area CODE
                                     55 
                                     56 ;--------------------------------------------------------
                                     57 ; interrupt vector 
                                     58 ;--------------------------------------------------------
                                     59 	.area HOME
      008000                         60 __interrupt_vect:
      008000 82 00 80 07             61 	int s_GSINIT ; reset
                                     62 ;--------------------------------------------------------
                                     63 ; global & static initialisations
                                     64 ;--------------------------------------------------------
                                     65 	.area HOME
                                     66 	.area GSINIT
                                     67 	.area GSFINAL
                                     68 	.area GSINIT
      008007                         69 __sdcc_gs_init_startup:
      008007                         70 __sdcc_init_data:
                                     71 ; stm8_genXINIT() start
      008007 AE 00 00         [ 2]   72 	ldw x, #l_DATA
      00800A 27 07            [ 1]   73 	jreq	00002$
      00800C                         74 00001$:
      00800C 72 4F 00 00      [ 1]   75 	clr (s_DATA - 1, x)
      008010 5A               [ 2]   76 	decw x
      008011 26 F9            [ 1]   77 	jrne	00001$
      008013                         78 00002$:
      008013 AE 00 00         [ 2]   79 	ldw	x, #l_INITIALIZER
      008016 27 09            [ 1]   80 	jreq	00004$
      008018                         81 00003$:
      008018 D6 86 5C         [ 1]   82 	ld	a, (s_INITIALIZER - 1, x)
      00801B D7 00 00         [ 1]   83 	ld	(s_INITIALIZED - 1, x), a
      00801E 5A               [ 2]   84 	decw	x
      00801F 26 F7            [ 1]   85 	jrne	00003$
      008021                         86 00004$:
                                     87 ; stm8_genXINIT() end
                                     88 	.area GSFINAL
      008021 CC 80 04         [ 2]   89 	jp	__sdcc_program_startup
                                     90 ;--------------------------------------------------------
                                     91 ; Home
                                     92 ;--------------------------------------------------------
                                     93 	.area HOME
                                     94 	.area HOME
      008004                         95 __sdcc_program_startup:
      008004 CC 86 7D         [ 2]   96 	jp	_main
                                     97 ;	return from main will return to caller
                                     98 ;--------------------------------------------------------
                                     99 ; code
                                    100 ;--------------------------------------------------------
                                    101 	.area CODE
                                    102 ;	main.c: 46: void Delay(uint16_t nCount)
                                    103 ;	-----------------------------------------
                                    104 ;	 function Delay
                                    105 ;	-----------------------------------------
      008673                        106 _Delay:
                                    107 ;	main.c: 49: while (nCount != 0)
      008673 1E 03            [ 2]  108 	ldw	x, (0x03, sp)
      008675                        109 00101$:
      008675 5D               [ 2]  110 	tnzw	x
      008676 26 01            [ 1]  111 	jrne	00117$
      008678 81               [ 4]  112 	ret
      008679                        113 00117$:
                                    114 ;	main.c: 51: nCount--;
      008679 5A               [ 2]  115 	decw	x
      00867A 20 F9            [ 2]  116 	jra	00101$
                                    117 ;	main.c: 53: }
      00867C 81               [ 4]  118 	ret
                                    119 ;	main.c: 57: void main(void)
                                    120 ;	-----------------------------------------
                                    121 ;	 function main
                                    122 ;	-----------------------------------------
      00867D                        123 _main:
      00867D 52 27            [ 2]  124 	sub	sp, #39
                                    125 ;	main.c: 61: GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      00867F 4B E0            [ 1]  126 	push	#0xe0
      008681 4B 20            [ 1]  127 	push	#0x20
      008683 4B 14            [ 1]  128 	push	#0x14
      008685 4B 50            [ 1]  129 	push	#0x50
      008687 CD 90 0E         [ 4]  130 	call	_GPIO_Init
      00868A 5B 04            [ 2]  131 	addw	sp, #4
                                    132 ;	main.c: 62: GPIO_Init(GPIOF,GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
      00868C 4B 00            [ 1]  133 	push	#0x00
      00868E 4B 10            [ 1]  134 	push	#0x10
      008690 4B 19            [ 1]  135 	push	#0x19
      008692 4B 50            [ 1]  136 	push	#0x50
      008694 CD 90 0E         [ 4]  137 	call	_GPIO_Init
      008697 5B 04            [ 2]  138 	addw	sp, #4
                                    139 ;	main.c: 64: Init_UART2();
      008699 CD 87 E3         [ 4]  140 	call	_Init_UART2
                                    141 ;	main.c: 65: OLED_Init();
      00869C CD 8E 27         [ 4]  142 	call	_OLED_Init
                                    143 ;	main.c: 66: OLED_Clear();
      00869F CD 8C 6F         [ 4]  144 	call	_OLED_Clear
                                    145 ;	main.c: 67: enableInterrupts(); //使能中断
      0086A2 9A               [ 1]  146 	rim
                                    147 ;	main.c: 69: OLED_ShowString(0,0,"STM8 Started!");
      0086A3 4B 24            [ 1]  148 	push	#<___str_0
      0086A5 4B 80            [ 1]  149 	push	#(___str_0 >> 8)
      0086A7 4B 00            [ 1]  150 	push	#0x00
      0086A9 4B 00            [ 1]  151 	push	#0x00
      0086AB CD 8D F4         [ 4]  152 	call	_OLED_ShowString
      0086AE 5B 04            [ 2]  153 	addw	sp, #4
                                    154 ;	main.c: 70: printf("STM8 Started!\r\n");
      0086B0 4B 32            [ 1]  155 	push	#<___str_2
      0086B2 4B 80            [ 1]  156 	push	#(___str_2 >> 8)
      0086B4 CD 9E 46         [ 4]  157 	call	_puts
      0086B7 5B 02            [ 2]  158 	addw	sp, #2
                                    159 ;	main.c: 72: while (1)
      0086B9                        160 00104$:
                                    161 ;	main.c: 76: sprintf(temp,"V:%4d,S:%1d",ReadADC(),GPIO_ReadInputPin(GPIOF,GPIO_PIN_4)==RESET?0:1);
      0086B9 4B 10            [ 1]  162 	push	#0x10
      0086BB 4B 19            [ 1]  163 	push	#0x19
      0086BD 4B 50            [ 1]  164 	push	#0x50
      0086BF CD 90 AE         [ 4]  165 	call	_GPIO_ReadInputPin
      0086C2 5B 03            [ 2]  166 	addw	sp, #3
      0086C4 4D               [ 1]  167 	tnz	a
      0086C5 26 05            [ 1]  168 	jrne	00108$
      0086C7 5F               [ 1]  169 	clrw	x
      0086C8 1F 1E            [ 2]  170 	ldw	(0x1e, sp), x
      0086CA 20 05            [ 2]  171 	jra	00109$
      0086CC                        172 00108$:
      0086CC AE 00 01         [ 2]  173 	ldw	x, #0x0001
      0086CF 1F 1E            [ 2]  174 	ldw	(0x1e, sp), x
      0086D1                        175 00109$:
      0086D1 CD 8F AD         [ 4]  176 	call	_ReadADC
      0086D4 90 96            [ 1]  177 	ldw	y, sp
      0086D6 72 A9 00 08      [ 2]  178 	addw	y, #8
      0086DA 17 20            [ 2]  179 	ldw	(0x20, sp), y
      0086DC 7B 1F            [ 1]  180 	ld	a, (0x1f, sp)
      0086DE 88               [ 1]  181 	push	a
      0086DF 7B 1F            [ 1]  182 	ld	a, (0x1f, sp)
      0086E1 88               [ 1]  183 	push	a
      0086E2 89               [ 2]  184 	pushw	x
      0086E3 4B 41            [ 1]  185 	push	#<___str_3
      0086E5 4B 80            [ 1]  186 	push	#(___str_3 >> 8)
      0086E7 90 89            [ 2]  187 	pushw	y
      0086E9 CD 9D CC         [ 4]  188 	call	_sprintf
      0086EC 5B 08            [ 2]  189 	addw	sp, #8
                                    190 ;	main.c: 77: printf("%s",temp);
      0086EE 1E 20            [ 2]  191 	ldw	x, (0x20, sp)
      0086F0 89               [ 2]  192 	pushw	x
      0086F1 4B 4D            [ 1]  193 	push	#<___str_4
      0086F3 4B 80            [ 1]  194 	push	#(___str_4 >> 8)
      0086F5 CD 9E 87         [ 4]  195 	call	_printf
      0086F8 5B 04            [ 2]  196 	addw	sp, #4
                                    197 ;	main.c: 78: printf("\r\n");
      0086FA 4B 50            [ 1]  198 	push	#<___str_6
      0086FC 4B 80            [ 1]  199 	push	#(___str_6 >> 8)
      0086FE CD 9E 46         [ 4]  200 	call	_puts
      008701 5B 02            [ 2]  201 	addw	sp, #2
                                    202 ;	main.c: 79: OLED_ShowString(0,2,temp);
      008703 1E 20            [ 2]  203 	ldw	x, (0x20, sp)
      008705 89               [ 2]  204 	pushw	x
      008706 4B 02            [ 1]  205 	push	#0x02
      008708 4B 00            [ 1]  206 	push	#0x00
      00870A CD 8D F4         [ 4]  207 	call	_OLED_ShowString
      00870D 5B 04            [ 2]  208 	addw	sp, #4
                                    209 ;	main.c: 82: ds1302_port_init();
      00870F CD 88 AB         [ 4]  210 	call	_ds1302_port_init
                                    211 ;	main.c: 83: if(ds1302_check())
      008712 CD 8A 1A         [ 4]  212 	call	_ds1302_check
      008715 4D               [ 1]  213 	tnz	a
      008716 26 03            [ 1]  214 	jrne	00126$
      008718 CC 87 C9         [ 2]  215 	jp	00102$
      00871B                        216 00126$:
                                    217 ;	main.c: 87: ds1302_read_time(&ds_time);
      00871B 96               [ 1]  218 	ldw	x, sp
      00871C 5C               [ 1]  219 	incw	x
      00871D 1F 26            [ 2]  220 	ldw	(0x26, sp), x
      00871F 89               [ 2]  221 	pushw	x
      008720 CD 8A 32         [ 4]  222 	call	_ds1302_read_time
      008723 5B 02            [ 2]  223 	addw	sp, #2
                                    224 ;	main.c: 88: sprintf(temp,"%2d/%2d/%2d",ds_time.hour,ds_time.minute/16*10+ds_time.minute%16,ds_time.second/16*10+ds_time.second%16);
      008725 1E 26            [ 2]  225 	ldw	x, (0x26, sp)
      008727 E6 06            [ 1]  226 	ld	a, (0x6, x)
      008729 6B 1D            [ 1]  227 	ld	(0x1d, sp), a
      00872B 0F 1C            [ 1]  228 	clr	(0x1c, sp)
      00872D 4B 10            [ 1]  229 	push	#0x10
      00872F 4B 00            [ 1]  230 	push	#0x00
      008731 1E 1E            [ 2]  231 	ldw	x, (0x1e, sp)
      008733 89               [ 2]  232 	pushw	x
      008734 CD 9F 2F         [ 4]  233 	call	__divsint
      008737 5B 04            [ 2]  234 	addw	sp, #4
      008739 89               [ 2]  235 	pushw	x
      00873A 58               [ 2]  236 	sllw	x
      00873B 58               [ 2]  237 	sllw	x
      00873C 72 FB 01         [ 2]  238 	addw	x, (1, sp)
      00873F 58               [ 2]  239 	sllw	x
      008740 5B 02            [ 2]  240 	addw	sp, #2
      008742 1F 22            [ 2]  241 	ldw	(0x22, sp), x
      008744 4B 10            [ 1]  242 	push	#0x10
      008746 4B 00            [ 1]  243 	push	#0x00
      008748 1E 1E            [ 2]  244 	ldw	x, (0x1e, sp)
      00874A 89               [ 2]  245 	pushw	x
      00874B CD 9F 19         [ 4]  246 	call	__modsint
      00874E 5B 04            [ 2]  247 	addw	sp, #4
      008750 72 FB 22         [ 2]  248 	addw	x, (0x22, sp)
      008753 1F 24            [ 2]  249 	ldw	(0x24, sp), x
      008755 1E 26            [ 2]  250 	ldw	x, (0x26, sp)
      008757 E6 05            [ 1]  251 	ld	a, (0x5, x)
      008759 6B 19            [ 1]  252 	ld	(0x19, sp), a
      00875B 0F 18            [ 1]  253 	clr	(0x18, sp)
      00875D 4B 10            [ 1]  254 	push	#0x10
      00875F 4B 00            [ 1]  255 	push	#0x00
      008761 1E 1A            [ 2]  256 	ldw	x, (0x1a, sp)
      008763 89               [ 2]  257 	pushw	x
      008764 CD 9F 2F         [ 4]  258 	call	__divsint
      008767 5B 04            [ 2]  259 	addw	sp, #4
      008769 89               [ 2]  260 	pushw	x
      00876A 58               [ 2]  261 	sllw	x
      00876B 58               [ 2]  262 	sllw	x
      00876C 72 FB 01         [ 2]  263 	addw	x, (1, sp)
      00876F 58               [ 2]  264 	sllw	x
      008770 5B 02            [ 2]  265 	addw	sp, #2
      008772 1F 16            [ 2]  266 	ldw	(0x16, sp), x
      008774 4B 10            [ 1]  267 	push	#0x10
      008776 4B 00            [ 1]  268 	push	#0x00
      008778 1E 1A            [ 2]  269 	ldw	x, (0x1a, sp)
      00877A 89               [ 2]  270 	pushw	x
      00877B CD 9F 19         [ 4]  271 	call	__modsint
      00877E 5B 04            [ 2]  272 	addw	sp, #4
      008780 72 FB 16         [ 2]  273 	addw	x, (0x16, sp)
      008783 1F 14            [ 2]  274 	ldw	(0x14, sp), x
      008785 1E 26            [ 2]  275 	ldw	x, (0x26, sp)
      008787 E6 04            [ 1]  276 	ld	a, (0x4, x)
      008789 0F 12            [ 1]  277 	clr	(0x12, sp)
      00878B 96               [ 1]  278 	ldw	x, sp
      00878C 1C 00 08         [ 2]  279 	addw	x, #8
      00878F 1F 1A            [ 2]  280 	ldw	(0x1a, sp), x
      008791 90 93            [ 1]  281 	ldw	y, x
      008793 1E 24            [ 2]  282 	ldw	x, (0x24, sp)
      008795 89               [ 2]  283 	pushw	x
      008796 1E 16            [ 2]  284 	ldw	x, (0x16, sp)
      008798 89               [ 2]  285 	pushw	x
      008799 88               [ 1]  286 	push	a
      00879A 7B 17            [ 1]  287 	ld	a, (0x17, sp)
      00879C 88               [ 1]  288 	push	a
      00879D 4B 52            [ 1]  289 	push	#<___str_7
      00879F 4B 80            [ 1]  290 	push	#(___str_7 >> 8)
      0087A1 90 89            [ 2]  291 	pushw	y
      0087A3 CD 9D CC         [ 4]  292 	call	_sprintf
      0087A6 5B 0A            [ 2]  293 	addw	sp, #10
                                    294 ;	main.c: 89: printf("%s",temp);
      0087A8 1E 1A            [ 2]  295 	ldw	x, (0x1a, sp)
      0087AA 89               [ 2]  296 	pushw	x
      0087AB 4B 4D            [ 1]  297 	push	#<___str_4
      0087AD 4B 80            [ 1]  298 	push	#(___str_4 >> 8)
      0087AF CD 9E 87         [ 4]  299 	call	_printf
      0087B2 5B 04            [ 2]  300 	addw	sp, #4
                                    301 ;	main.c: 90: printf("\r\n");
      0087B4 4B 50            [ 1]  302 	push	#<___str_6
      0087B6 4B 80            [ 1]  303 	push	#(___str_6 >> 8)
      0087B8 CD 9E 46         [ 4]  304 	call	_puts
      0087BB 5B 02            [ 2]  305 	addw	sp, #2
                                    306 ;	main.c: 91: OLED_ShowString(0,4,temp);
      0087BD 1E 1A            [ 2]  307 	ldw	x, (0x1a, sp)
      0087BF 89               [ 2]  308 	pushw	x
      0087C0 4B 04            [ 1]  309 	push	#0x04
      0087C2 4B 00            [ 1]  310 	push	#0x00
      0087C4 CD 8D F4         [ 4]  311 	call	_OLED_ShowString
      0087C7 5B 04            [ 2]  312 	addw	sp, #4
      0087C9                        313 00102$:
                                    314 ;	main.c: 93: ds1302_port_deinit();
      0087C9 CD 88 83         [ 4]  315 	call	_ds1302_port_deinit
                                    316 ;	main.c: 95: GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
      0087CC 4B 20            [ 1]  317 	push	#0x20
      0087CE 4B 14            [ 1]  318 	push	#0x14
      0087D0 4B 50            [ 1]  319 	push	#0x50
      0087D2 CD 90 9E         [ 4]  320 	call	_GPIO_WriteReverse
      0087D5 5B 03            [ 2]  321 	addw	sp, #3
                                    322 ;	main.c: 96: Delay(0xffff);
      0087D7 4B FF            [ 1]  323 	push	#0xff
      0087D9 4B FF            [ 1]  324 	push	#0xff
      0087DB CD 86 73         [ 4]  325 	call	_Delay
      0087DE 5B 02            [ 2]  326 	addw	sp, #2
                                    327 ;	main.c: 99: }
      0087E0 CC 86 B9         [ 2]  328 	jp	00104$
                                    329 	.area CODE
                                    330 	.area CONST
      008024                        331 ___str_0:
      008024 53 54 4D 38 20 53 74   332 	.ascii "STM8 Started!"
             61 72 74 65 64 21
      008031 00                     333 	.db 0x00
      008032                        334 ___str_2:
      008032 53 54 4D 38 20 53 74   335 	.ascii "STM8 Started!"
             61 72 74 65 64 21
      00803F 0D                     336 	.db 0x0d
      008040 00                     337 	.db 0x00
      008041                        338 ___str_3:
      008041 56 3A 25 34 64 2C 53   339 	.ascii "V:%4d,S:%1d"
             3A 25 31 64
      00804C 00                     340 	.db 0x00
      00804D                        341 ___str_4:
      00804D 25 73                  342 	.ascii "%s"
      00804F 00                     343 	.db 0x00
      008050                        344 ___str_6:
      008050 0D                     345 	.db 0x0d
      008051 00                     346 	.db 0x00
      008052                        347 ___str_7:
      008052 25 32 64 2F 25 32 64   348 	.ascii "%2d/%2d/%2d"
             2F 25 32 64
      00805D 00                     349 	.db 0x00
                                    350 	.area INITIALIZER
                                    351 	.area CABS (ABS)
