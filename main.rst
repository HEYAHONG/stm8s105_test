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
                                     16 	.globl _Init_UART2
                                     17 	.globl _OLED_ShowString
                                     18 	.globl _OLED_Clear
                                     19 	.globl _OLED_Init
                                     20 	.globl _key_init
                                     21 	.globl _eeprom_read
                                     22 	.globl _ds1302_read_time
                                     23 	.globl _ds1302_active
                                     24 	.globl _ReadDHT12
                                     25 	.globl _ReadADC
                                     26 	.globl _GPIO_ReadInputPin
                                     27 	.globl _GPIO_WriteReverse
                                     28 	.globl _GPIO_WriteLow
                                     29 	.globl _GPIO_WriteHigh
                                     30 	.globl _GPIO_Init
                                     31 ;--------------------------------------------------------
                                     32 ; ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area DATA
      000001                         35 _main_count_196608_392:
      000001                         36 	.ds 1
                                     37 ;--------------------------------------------------------
                                     38 ; ram data
                                     39 ;--------------------------------------------------------
                                     40 	.area INITIALIZED
                                     41 ;--------------------------------------------------------
                                     42 ; Stack segment in internal ram 
                                     43 ;--------------------------------------------------------
                                     44 	.area	SSEG
      FFFFFF                         45 __start__stack:
      FFFFFF                         46 	.ds	1
                                     47 
                                     48 ;--------------------------------------------------------
                                     49 ; absolute external ram data
                                     50 ;--------------------------------------------------------
                                     51 	.area DABS (ABS)
                                     52 
                                     53 ; default segment ordering for linker
                                     54 	.area HOME
                                     55 	.area GSINIT
                                     56 	.area GSFINAL
                                     57 	.area CONST
                                     58 	.area INITIALIZER
                                     59 	.area CODE
                                     60 
                                     61 ;--------------------------------------------------------
                                     62 ; interrupt vector 
                                     63 ;--------------------------------------------------------
                                     64 	.area HOME
      008000                         65 __interrupt_vect:
      008000 82 00 80 6F             66 	int s_GSINIT ; reset
      008004 82 00 90 1B             67 	int _TRAP_IRQHandler ; trap
      008008 82 00 90 1C             68 	int _TLI_IRQHandler ; int0
      00800C 82 00 90 1D             69 	int _AWU_IRQHandler ; int1
      008010 82 00 90 1E             70 	int _CLK_IRQHandler ; int2
      008014 82 00 90 1F             71 	int _EXTI_PORTA_IRQHandler ; int3
      008018 82 00 90 20             72 	int _EXTI_PORTB_IRQHandler ; int4
      00801C 82 00 90 21             73 	int _EXTI_PORTC_IRQHandler ; int5
      008020 82 00 90 22             74 	int _EXTI_PORTD_IRQHandler ; int6
      008024 82 00 90 4F             75 	int _EXTI_PORTE_IRQHandler ; int7
      008028 82 00 00 00             76 	int 0x000000 ; int8
      00802C 82 00 00 00             77 	int 0x000000 ; int9
      008030 82 00 90 50             78 	int _SPI_IRQHandler ; int10
      008034 82 00 90 51             79 	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
      008038 82 00 90 52             80 	int _TIM1_CAP_COM_IRQHandler ; int12
      00803C 82 00 90 53             81 	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
      008040 82 00 90 54             82 	int _TIM2_CAP_COM_IRQHandler ; int14
      008044 82 00 00 00             83 	int 0x000000 ; int15
      008048 82 00 00 00             84 	int 0x000000 ; int16
      00804C 82 00 00 00             85 	int 0x000000 ; int17
      008050 82 00 00 00             86 	int 0x000000 ; int18
      008054 82 00 90 57             87 	int _I2C_IRQHandler ; int19
      008058 82 00 90 58             88 	int _UART2_TX_IRQHandler ; int20
      00805C 82 00 90 59             89 	int _UART2_RX_IRQHandler ; int21
      008060 82 00 90 AF             90 	int _ADC1_IRQHandler ; int22
      008064 82 00 90 B0             91 	int _TIM4_UPD_OVF_IRQHandler ; int23
      008068 82 00 90 B1             92 	int _EEPROM_EEC_IRQHandler ; int24
                                     93 ;--------------------------------------------------------
                                     94 ; global & static initialisations
                                     95 ;--------------------------------------------------------
                                     96 	.area HOME
                                     97 	.area GSINIT
                                     98 	.area GSFINAL
                                     99 	.area GSINIT
      00806F                        100 __sdcc_gs_init_startup:
      00806F                        101 __sdcc_init_data:
                                    102 ; stm8_genXINIT() start
      00806F AE 00 06         [ 2]  103 	ldw x, #l_DATA
      008072 27 07            [ 1]  104 	jreq	00002$
      008074                        105 00001$:
      008074 72 4F 00 00      [ 1]  106 	clr (s_DATA - 1, x)
      008078 5A               [ 2]  107 	decw x
      008079 26 F9            [ 1]  108 	jrne	00001$
      00807B                        109 00002$:
      00807B AE 00 05         [ 2]  110 	ldw	x, #l_INITIALIZER
      00807E 27 09            [ 1]  111 	jreq	00004$
      008080                        112 00003$:
      008080 D6 86 F6         [ 1]  113 	ld	a, (s_INITIALIZER - 1, x)
      008083 D7 00 06         [ 1]  114 	ld	(s_INITIALIZED - 1, x), a
      008086 5A               [ 2]  115 	decw	x
      008087 26 F7            [ 1]  116 	jrne	00003$
      008089                        117 00004$:
                                    118 ; stm8_genXINIT() end
                                    119 ;	main.c: 111: static u8 count=0;
      008089 72 5F 00 01      [ 1]  120 	clr	_main_count_196608_392+0
                                    121 	.area GSFINAL
      00808D CC 80 6C         [ 2]  122 	jp	__sdcc_program_startup
                                    123 ;--------------------------------------------------------
                                    124 ; Home
                                    125 ;--------------------------------------------------------
                                    126 	.area HOME
                                    127 	.area HOME
      00806C                        128 __sdcc_program_startup:
      00806C CC 87 06         [ 2]  129 	jp	_main
                                    130 ;	return from main will return to caller
                                    131 ;--------------------------------------------------------
                                    132 ; code
                                    133 ;--------------------------------------------------------
                                    134 	.area CODE
                                    135 ;	main.c: 51: void Delay(uint16_t nCount)
                                    136 ;	-----------------------------------------
                                    137 ;	 function Delay
                                    138 ;	-----------------------------------------
      0086FC                        139 _Delay:
                                    140 ;	main.c: 54: while (nCount != 0)
      0086FC 1E 03            [ 2]  141 	ldw	x, (0x03, sp)
      0086FE                        142 00101$:
      0086FE 5D               [ 2]  143 	tnzw	x
      0086FF 26 01            [ 1]  144 	jrne	00117$
      008701 81               [ 4]  145 	ret
      008702                        146 00117$:
                                    147 ;	main.c: 56: nCount--;
      008702 5A               [ 2]  148 	decw	x
      008703 20 F9            [ 2]  149 	jra	00101$
                                    150 ;	main.c: 58: }
      008705 81               [ 4]  151 	ret
                                    152 ;	main.c: 62: void main(void)
                                    153 ;	-----------------------------------------
                                    154 ;	 function main
                                    155 ;	-----------------------------------------
      008706                        156 _main:
      008706 52 4B            [ 2]  157 	sub	sp, #75
                                    158 ;	main.c: 66: GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      008708 4B E0            [ 1]  159 	push	#0xe0
      00870A 4B 20            [ 1]  160 	push	#0x20
      00870C 4B 14            [ 1]  161 	push	#0x14
      00870E 4B 50            [ 1]  162 	push	#0x50
      008710 CD 96 26         [ 4]  163 	call	_GPIO_Init
      008713 5B 04            [ 2]  164 	addw	sp, #4
                                    165 ;	main.c: 67: GPIO_Init(GPIOF,GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
      008715 4B 00            [ 1]  166 	push	#0x00
      008717 4B 10            [ 1]  167 	push	#0x10
      008719 4B 19            [ 1]  168 	push	#0x19
      00871B 4B 50            [ 1]  169 	push	#0x50
      00871D CD 96 26         [ 4]  170 	call	_GPIO_Init
      008720 5B 04            [ 2]  171 	addw	sp, #4
                                    172 ;	main.c: 69: Init_UART2();
      008722 CD 8F 9B         [ 4]  173 	call	_Init_UART2
                                    174 ;	main.c: 70: OLED_Init();
      008725 CD 93 E3         [ 4]  175 	call	_OLED_Init
                                    176 ;	main.c: 71: ds1302_active();
      008728 CD 8F 61         [ 4]  177 	call	_ds1302_active
                                    178 ;	main.c: 72: key_init();
      00872B CD 90 B2         [ 4]  179 	call	_key_init
                                    180 ;	main.c: 73: OLED_Clear();
      00872E CD 92 2B         [ 4]  181 	call	_OLED_Clear
                                    182 ;	main.c: 75: enableInterrupts(); //使能中断
      008731 9A               [ 1]  183 	rim
                                    184 ;	main.c: 77: OLED_ShowString(0,0,"STM8 Started!");
      008732 4B 90            [ 1]  185 	push	#<___str_0
      008734 4B 80            [ 1]  186 	push	#(___str_0 >> 8)
      008736 4B 00            [ 1]  187 	push	#0x00
      008738 4B 00            [ 1]  188 	push	#0x00
      00873A CD 93 B0         [ 4]  189 	call	_OLED_ShowString
      00873D 5B 04            [ 2]  190 	addw	sp, #4
                                    191 ;	main.c: 78: printf("STM8 Started!\r\n");
      00873F 4B 9E            [ 1]  192 	push	#<___str_2
      008741 4B 80            [ 1]  193 	push	#(___str_2 >> 8)
      008743 CD A8 1F         [ 4]  194 	call	_puts
      008746 5B 02            [ 2]  195 	addw	sp, #2
                                    196 ;	main.c: 80: GPIO_Init(GPIOD, GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_FAST);
      008748 4B E0            [ 1]  197 	push	#0xe0
      00874A 4B 80            [ 1]  198 	push	#0x80
      00874C 4B 0F            [ 1]  199 	push	#0x0f
      00874E 4B 50            [ 1]  200 	push	#0x50
      008750 CD 96 26         [ 4]  201 	call	_GPIO_Init
      008753 5B 04            [ 2]  202 	addw	sp, #4
                                    203 ;	main.c: 81: GPIO_WriteHigh(GPIOD,GPIO_PIN_7);
      008755 4B 80            [ 1]  204 	push	#0x80
      008757 4B 0F            [ 1]  205 	push	#0x0f
      008759 4B 50            [ 1]  206 	push	#0x50
      00875B CD 96 A1         [ 4]  207 	call	_GPIO_WriteHigh
      00875E 5B 03            [ 2]  208 	addw	sp, #3
                                    209 ;	main.c: 82: Delay(0xffff);
      008760 4B FF            [ 1]  210 	push	#0xff
      008762 4B FF            [ 1]  211 	push	#0xff
      008764 CD 86 FC         [ 4]  212 	call	_Delay
      008767 5B 02            [ 2]  213 	addw	sp, #2
                                    214 ;	main.c: 83: GPIO_WriteLow(GPIOD,GPIO_PIN_7);
      008769 4B 80            [ 1]  215 	push	#0x80
      00876B 4B 0F            [ 1]  216 	push	#0x0f
      00876D 4B 50            [ 1]  217 	push	#0x50
      00876F CD 96 A8         [ 4]  218 	call	_GPIO_WriteLow
      008772 5B 03            [ 2]  219 	addw	sp, #3
                                    220 ;	main.c: 87: while (1)
      008774                        221 00104$:
                                    222 ;	main.c: 91: sprintf(temp,"V:%4d,S:%1d %d",ReadADC(),GPIO_ReadInputPin(GPIOF,GPIO_PIN_4)==RESET?0:1,eeprom_read(10));
      008774 4B 0A            [ 1]  223 	push	#0x0a
      008776 5F               [ 1]  224 	clrw	x
      008777 89               [ 2]  225 	pushw	x
      008778 4B 00            [ 1]  226 	push	#0x00
      00877A CD 95 69         [ 4]  227 	call	_eeprom_read
      00877D 5B 04            [ 2]  228 	addw	sp, #4
      00877F 6B 3D            [ 1]  229 	ld	(0x3d, sp), a
      008781 0F 3C            [ 1]  230 	clr	(0x3c, sp)
      008783 4B 10            [ 1]  231 	push	#0x10
      008785 4B 19            [ 1]  232 	push	#0x19
      008787 4B 50            [ 1]  233 	push	#0x50
      008789 CD 96 C6         [ 4]  234 	call	_GPIO_ReadInputPin
      00878C 5B 03            [ 2]  235 	addw	sp, #3
      00878E 4D               [ 1]  236 	tnz	a
      00878F 26 05            [ 1]  237 	jrne	00108$
      008791 5F               [ 1]  238 	clrw	x
      008792 1F 1A            [ 2]  239 	ldw	(0x1a, sp), x
      008794 20 05            [ 2]  240 	jra	00109$
      008796                        241 00108$:
      008796 AE 00 01         [ 2]  242 	ldw	x, #0x0001
      008799 1F 1A            [ 2]  243 	ldw	(0x1a, sp), x
      00879B                        244 00109$:
      00879B CD 95 C5         [ 4]  245 	call	_ReadADC
      00879E 90 96            [ 1]  246 	ldw	y, sp
      0087A0 72 A9 00 10      [ 2]  247 	addw	y, #16
      0087A4 17 4A            [ 2]  248 	ldw	(0x4a, sp), y
      0087A6 7B 3D            [ 1]  249 	ld	a, (0x3d, sp)
      0087A8 88               [ 1]  250 	push	a
      0087A9 7B 3D            [ 1]  251 	ld	a, (0x3d, sp)
      0087AB 88               [ 1]  252 	push	a
      0087AC 7B 1D            [ 1]  253 	ld	a, (0x1d, sp)
      0087AE 88               [ 1]  254 	push	a
      0087AF 7B 1D            [ 1]  255 	ld	a, (0x1d, sp)
      0087B1 88               [ 1]  256 	push	a
      0087B2 89               [ 2]  257 	pushw	x
      0087B3 4B AD            [ 1]  258 	push	#<___str_3
      0087B5 4B 80            [ 1]  259 	push	#(___str_3 >> 8)
      0087B7 90 89            [ 2]  260 	pushw	y
      0087B9 CD A7 A5         [ 4]  261 	call	_sprintf
      0087BC 5B 0A            [ 2]  262 	addw	sp, #10
                                    263 ;	main.c: 92: printf("%s",temp);
      0087BE 1E 4A            [ 2]  264 	ldw	x, (0x4a, sp)
      0087C0 89               [ 2]  265 	pushw	x
      0087C1 4B BC            [ 1]  266 	push	#<___str_4
      0087C3 4B 80            [ 1]  267 	push	#(___str_4 >> 8)
      0087C5 CD A8 60         [ 4]  268 	call	_printf
      0087C8 5B 04            [ 2]  269 	addw	sp, #4
                                    270 ;	main.c: 93: printf("\r\n");
      0087CA 4B BF            [ 1]  271 	push	#<___str_6
      0087CC 4B 80            [ 1]  272 	push	#(___str_6 >> 8)
      0087CE CD A8 1F         [ 4]  273 	call	_puts
      0087D1 5B 02            [ 2]  274 	addw	sp, #2
                                    275 ;	main.c: 94: OLED_ShowString(0,2,temp);
      0087D3 1E 4A            [ 2]  276 	ldw	x, (0x4a, sp)
      0087D5 89               [ 2]  277 	pushw	x
      0087D6 4B 02            [ 1]  278 	push	#0x02
      0087D8 4B 00            [ 1]  279 	push	#0x00
      0087DA CD 93 B0         [ 4]  280 	call	_OLED_ShowString
      0087DD 5B 04            [ 2]  281 	addw	sp, #4
                                    282 ;	main.c: 102: ds1302_read_time(&ds_time);
      0087DF 96               [ 1]  283 	ldw	x, sp
      0087E0 1C 00 09         [ 2]  284 	addw	x, #9
      0087E3 1F 40            [ 2]  285 	ldw	(0x40, sp), x
      0087E5 89               [ 2]  286 	pushw	x
      0087E6 CD 8E 63         [ 4]  287 	call	_ds1302_read_time
      0087E9 5B 02            [ 2]  288 	addw	sp, #2
                                    289 ;	main.c: 103: sprintf(temp,"%2d/%2d/%2d",ds_time.hour/16*10+ds_time.hour%16,ds_time.minute/16*10+ds_time.minute%16,ds_time.second/16*10+ds_time.second%16);
      0087EB 1E 40            [ 2]  290 	ldw	x, (0x40, sp)
      0087ED E6 06            [ 1]  291 	ld	a, (0x6, x)
      0087EF 6B 3F            [ 1]  292 	ld	(0x3f, sp), a
      0087F1 0F 3E            [ 1]  293 	clr	(0x3e, sp)
      0087F3 4B 10            [ 1]  294 	push	#0x10
      0087F5 4B 00            [ 1]  295 	push	#0x00
      0087F7 1E 40            [ 2]  296 	ldw	x, (0x40, sp)
      0087F9 89               [ 2]  297 	pushw	x
      0087FA CD A9 08         [ 4]  298 	call	__divsint
      0087FD 5B 04            [ 2]  299 	addw	sp, #4
      0087FF 89               [ 2]  300 	pushw	x
      008800 58               [ 2]  301 	sllw	x
      008801 58               [ 2]  302 	sllw	x
      008802 72 FB 01         [ 2]  303 	addw	x, (1, sp)
      008805 58               [ 2]  304 	sllw	x
      008806 5B 02            [ 2]  305 	addw	sp, #2
      008808 1F 24            [ 2]  306 	ldw	(0x24, sp), x
      00880A 4B 10            [ 1]  307 	push	#0x10
      00880C 4B 00            [ 1]  308 	push	#0x00
      00880E 1E 40            [ 2]  309 	ldw	x, (0x40, sp)
      008810 89               [ 2]  310 	pushw	x
      008811 CD A8 F2         [ 4]  311 	call	__modsint
      008814 5B 04            [ 2]  312 	addw	sp, #4
      008816 72 FB 24         [ 2]  313 	addw	x, (0x24, sp)
      008819 1F 28            [ 2]  314 	ldw	(0x28, sp), x
      00881B 1E 40            [ 2]  315 	ldw	x, (0x40, sp)
      00881D E6 05            [ 1]  316 	ld	a, (0x5, x)
      00881F 6B 27            [ 1]  317 	ld	(0x27, sp), a
      008821 0F 26            [ 1]  318 	clr	(0x26, sp)
      008823 4B 10            [ 1]  319 	push	#0x10
      008825 4B 00            [ 1]  320 	push	#0x00
      008827 1E 28            [ 2]  321 	ldw	x, (0x28, sp)
      008829 89               [ 2]  322 	pushw	x
      00882A CD A9 08         [ 4]  323 	call	__divsint
      00882D 5B 04            [ 2]  324 	addw	sp, #4
      00882F 89               [ 2]  325 	pushw	x
      008830 58               [ 2]  326 	sllw	x
      008831 58               [ 2]  327 	sllw	x
      008832 72 FB 01         [ 2]  328 	addw	x, (1, sp)
      008835 58               [ 2]  329 	sllw	x
      008836 5B 02            [ 2]  330 	addw	sp, #2
      008838 1F 32            [ 2]  331 	ldw	(0x32, sp), x
      00883A 4B 10            [ 1]  332 	push	#0x10
      00883C 4B 00            [ 1]  333 	push	#0x00
      00883E 1E 28            [ 2]  334 	ldw	x, (0x28, sp)
      008840 89               [ 2]  335 	pushw	x
      008841 CD A8 F2         [ 4]  336 	call	__modsint
      008844 5B 04            [ 2]  337 	addw	sp, #4
      008846 72 FB 32         [ 2]  338 	addw	x, (0x32, sp)
      008849 1F 30            [ 2]  339 	ldw	(0x30, sp), x
      00884B 1E 40            [ 2]  340 	ldw	x, (0x40, sp)
      00884D E6 04            [ 1]  341 	ld	a, (0x4, x)
      00884F 6B 3B            [ 1]  342 	ld	(0x3b, sp), a
      008851 0F 3A            [ 1]  343 	clr	(0x3a, sp)
      008853 4B 10            [ 1]  344 	push	#0x10
      008855 4B 00            [ 1]  345 	push	#0x00
      008857 1E 3C            [ 2]  346 	ldw	x, (0x3c, sp)
      008859 89               [ 2]  347 	pushw	x
      00885A CD A9 08         [ 4]  348 	call	__divsint
      00885D 5B 04            [ 2]  349 	addw	sp, #4
      00885F 89               [ 2]  350 	pushw	x
      008860 58               [ 2]  351 	sllw	x
      008861 58               [ 2]  352 	sllw	x
      008862 72 FB 01         [ 2]  353 	addw	x, (1, sp)
      008865 58               [ 2]  354 	sllw	x
      008866 5B 02            [ 2]  355 	addw	sp, #2
      008868 1F 38            [ 2]  356 	ldw	(0x38, sp), x
      00886A 4B 10            [ 1]  357 	push	#0x10
      00886C 4B 00            [ 1]  358 	push	#0x00
      00886E 1E 3C            [ 2]  359 	ldw	x, (0x3c, sp)
      008870 89               [ 2]  360 	pushw	x
      008871 CD A8 F2         [ 4]  361 	call	__modsint
      008874 5B 04            [ 2]  362 	addw	sp, #4
      008876 72 FB 38         [ 2]  363 	addw	x, (0x38, sp)
      008879 51               [ 1]  364 	exgw	x, y
      00887A 96               [ 1]  365 	ldw	x, sp
      00887B 1C 00 10         [ 2]  366 	addw	x, #16
      00887E 1F 36            [ 2]  367 	ldw	(0x36, sp), x
      008880 7B 29            [ 1]  368 	ld	a, (0x29, sp)
      008882 88               [ 1]  369 	push	a
      008883 7B 29            [ 1]  370 	ld	a, (0x29, sp)
      008885 88               [ 1]  371 	push	a
      008886 7B 33            [ 1]  372 	ld	a, (0x33, sp)
      008888 88               [ 1]  373 	push	a
      008889 7B 33            [ 1]  374 	ld	a, (0x33, sp)
      00888B 88               [ 1]  375 	push	a
      00888C 90 89            [ 2]  376 	pushw	y
      00888E 4B C1            [ 1]  377 	push	#<___str_7
      008890 4B 80            [ 1]  378 	push	#(___str_7 >> 8)
      008892 89               [ 2]  379 	pushw	x
      008893 CD A7 A5         [ 4]  380 	call	_sprintf
      008896 5B 0A            [ 2]  381 	addw	sp, #10
                                    382 ;	main.c: 104: printf("%s",temp);
      008898 1E 36            [ 2]  383 	ldw	x, (0x36, sp)
      00889A 89               [ 2]  384 	pushw	x
      00889B 4B BC            [ 1]  385 	push	#<___str_4
      00889D 4B 80            [ 1]  386 	push	#(___str_4 >> 8)
      00889F CD A8 60         [ 4]  387 	call	_printf
      0088A2 5B 04            [ 2]  388 	addw	sp, #4
                                    389 ;	main.c: 105: printf("\r\n");
      0088A4 4B BF            [ 1]  390 	push	#<___str_6
      0088A6 4B 80            [ 1]  391 	push	#(___str_6 >> 8)
      0088A8 CD A8 1F         [ 4]  392 	call	_puts
      0088AB 5B 02            [ 2]  393 	addw	sp, #2
                                    394 ;	main.c: 106: OLED_ShowString(0,4,temp);
      0088AD 1E 36            [ 2]  395 	ldw	x, (0x36, sp)
      0088AF 89               [ 2]  396 	pushw	x
      0088B0 4B 04            [ 1]  397 	push	#0x04
      0088B2 4B 00            [ 1]  398 	push	#0x00
      0088B4 CD 93 B0         [ 4]  399 	call	_OLED_ShowString
      0088B7 5B 04            [ 2]  400 	addw	sp, #4
                                    401 ;	main.c: 113: if(count>=2)
      0088B9 C6 00 01         [ 1]  402 	ld	a, _main_count_196608_392+0
      0088BC A1 02            [ 1]  403 	cp	a, #0x02
      0088BE 24 03            [ 1]  404 	jrnc	00126$
      0088C0 CC 89 3A         [ 2]  405 	jp	00102$
      0088C3                        406 00126$:
                                    407 ;	main.c: 117: ReadDHT12(&data);
      0088C3 90 96            [ 1]  408 	ldw	y, sp
      0088C5 72 A9 00 15      [ 2]  409 	addw	y, #21
      0088C9 93               [ 1]  410 	ldw	x, y
      0088CA 90 89            [ 2]  411 	pushw	y
      0088CC 89               [ 2]  412 	pushw	x
      0088CD CD 8C 83         [ 4]  413 	call	_ReadDHT12
      0088D0 5B 02            [ 2]  414 	addw	sp, #2
      0088D2 90 85            [ 2]  415 	popw	y
                                    416 ;	main.c: 118: sprintf(temp,"%2d.%1dC/%2d.%1d%%/%3d",data.T,data.T1,data.W,data.W1,data.sum);
      0088D4 93               [ 1]  417 	ldw	x, y
      0088D5 E6 04            [ 1]  418 	ld	a, (0x4, x)
      0088D7 6B 35            [ 1]  419 	ld	(0x35, sp), a
      0088D9 0F 34            [ 1]  420 	clr	(0x34, sp)
      0088DB 93               [ 1]  421 	ldw	x, y
      0088DC E6 03            [ 1]  422 	ld	a, (0x3, x)
      0088DE 6B 2F            [ 1]  423 	ld	(0x2f, sp), a
      0088E0 0F 2E            [ 1]  424 	clr	(0x2e, sp)
      0088E2 93               [ 1]  425 	ldw	x, y
      0088E3 E6 02            [ 1]  426 	ld	a, (0x2, x)
      0088E5 6B 2D            [ 1]  427 	ld	(0x2d, sp), a
      0088E7 0F 2C            [ 1]  428 	clr	(0x2c, sp)
      0088E9 93               [ 1]  429 	ldw	x, y
      0088EA E6 01            [ 1]  430 	ld	a, (0x1, x)
      0088EC 6B 2B            [ 1]  431 	ld	(0x2b, sp), a
      0088EE 0F 2A            [ 1]  432 	clr	(0x2a, sp)
      0088F0 90 F6            [ 1]  433 	ld	a, (y)
      0088F2 0F 22            [ 1]  434 	clr	(0x22, sp)
      0088F4 96               [ 1]  435 	ldw	x, sp
      0088F5 5C               [ 1]  436 	incw	x
      0088F6 1F 20            [ 2]  437 	ldw	(0x20, sp), x
      0088F8 90 93            [ 1]  438 	ldw	y, x
      0088FA 1E 34            [ 2]  439 	ldw	x, (0x34, sp)
      0088FC 89               [ 2]  440 	pushw	x
      0088FD 1E 30            [ 2]  441 	ldw	x, (0x30, sp)
      0088FF 89               [ 2]  442 	pushw	x
      008900 1E 30            [ 2]  443 	ldw	x, (0x30, sp)
      008902 89               [ 2]  444 	pushw	x
      008903 1E 30            [ 2]  445 	ldw	x, (0x30, sp)
      008905 89               [ 2]  446 	pushw	x
      008906 88               [ 1]  447 	push	a
      008907 7B 2B            [ 1]  448 	ld	a, (0x2b, sp)
      008909 88               [ 1]  449 	push	a
      00890A 4B CD            [ 1]  450 	push	#<___str_9
      00890C 4B 80            [ 1]  451 	push	#(___str_9 >> 8)
      00890E 90 89            [ 2]  452 	pushw	y
      008910 CD A7 A5         [ 4]  453 	call	_sprintf
      008913 5B 0E            [ 2]  454 	addw	sp, #14
                                    455 ;	main.c: 119: printf("%s",temp);
      008915 1E 20            [ 2]  456 	ldw	x, (0x20, sp)
      008917 89               [ 2]  457 	pushw	x
      008918 4B BC            [ 1]  458 	push	#<___str_4
      00891A 4B 80            [ 1]  459 	push	#(___str_4 >> 8)
      00891C CD A8 60         [ 4]  460 	call	_printf
      00891F 5B 04            [ 2]  461 	addw	sp, #4
                                    462 ;	main.c: 120: printf("\r\n");
      008921 4B BF            [ 1]  463 	push	#<___str_6
      008923 4B 80            [ 1]  464 	push	#(___str_6 >> 8)
      008925 CD A8 1F         [ 4]  465 	call	_puts
      008928 5B 02            [ 2]  466 	addw	sp, #2
                                    467 ;	main.c: 121: OLED_ShowString(0,6,temp);
      00892A 1E 20            [ 2]  468 	ldw	x, (0x20, sp)
      00892C 89               [ 2]  469 	pushw	x
      00892D 4B 06            [ 1]  470 	push	#0x06
      00892F 4B 00            [ 1]  471 	push	#0x00
      008931 CD 93 B0         [ 4]  472 	call	_OLED_ShowString
      008934 5B 04            [ 2]  473 	addw	sp, #4
                                    474 ;	main.c: 122: count=0;
      008936 72 5F 00 01      [ 1]  475 	clr	_main_count_196608_392+0
      00893A                        476 00102$:
                                    477 ;	main.c: 125: count++;
      00893A 72 5C 00 01      [ 1]  478 	inc	_main_count_196608_392+0
                                    479 ;	main.c: 129: sprintf(temp,"%2d/%2d/%2d/%2d/%2d",keycount[0],keycount[1],keycount[2],keycount[3],keycount[4]);
      00893E 90 AE 00 07      [ 2]  480 	ldw	y, #_keycount+0
      008942 93               [ 1]  481 	ldw	x, y
      008943 E6 04            [ 1]  482 	ld	a, (0x4, x)
      008945 6B 1F            [ 1]  483 	ld	(0x1f, sp), a
      008947 0F 1E            [ 1]  484 	clr	(0x1e, sp)
      008949 93               [ 1]  485 	ldw	x, y
      00894A E6 03            [ 1]  486 	ld	a, (0x3, x)
      00894C 6B 1D            [ 1]  487 	ld	(0x1d, sp), a
      00894E 0F 1C            [ 1]  488 	clr	(0x1c, sp)
      008950 93               [ 1]  489 	ldw	x, y
      008951 E6 02            [ 1]  490 	ld	a, (0x2, x)
      008953 6B 49            [ 1]  491 	ld	(0x49, sp), a
      008955 0F 48            [ 1]  492 	clr	(0x48, sp)
      008957 93               [ 1]  493 	ldw	x, y
      008958 E6 01            [ 1]  494 	ld	a, (0x1, x)
      00895A 6B 47            [ 1]  495 	ld	(0x47, sp), a
      00895C 0F 46            [ 1]  496 	clr	(0x46, sp)
      00895E 90 F6            [ 1]  497 	ld	a, (y)
      008960 0F 44            [ 1]  498 	clr	(0x44, sp)
      008962 96               [ 1]  499 	ldw	x, sp
      008963 1C 00 06         [ 2]  500 	addw	x, #6
      008966 1F 42            [ 2]  501 	ldw	(0x42, sp), x
      008968 90 93            [ 1]  502 	ldw	y, x
      00896A 1E 1E            [ 2]  503 	ldw	x, (0x1e, sp)
      00896C 89               [ 2]  504 	pushw	x
      00896D 1E 1E            [ 2]  505 	ldw	x, (0x1e, sp)
      00896F 89               [ 2]  506 	pushw	x
      008970 1E 4C            [ 2]  507 	ldw	x, (0x4c, sp)
      008972 89               [ 2]  508 	pushw	x
      008973 1E 4C            [ 2]  509 	ldw	x, (0x4c, sp)
      008975 89               [ 2]  510 	pushw	x
      008976 88               [ 1]  511 	push	a
      008977 7B 4D            [ 1]  512 	ld	a, (0x4d, sp)
      008979 88               [ 1]  513 	push	a
      00897A 4B E4            [ 1]  514 	push	#<___str_11
      00897C 4B 80            [ 1]  515 	push	#(___str_11 >> 8)
      00897E 90 89            [ 2]  516 	pushw	y
      008980 CD A7 A5         [ 4]  517 	call	_sprintf
      008983 5B 0E            [ 2]  518 	addw	sp, #14
                                    519 ;	main.c: 130: printf("%s",temp);
      008985 1E 42            [ 2]  520 	ldw	x, (0x42, sp)
      008987 89               [ 2]  521 	pushw	x
      008988 4B BC            [ 1]  522 	push	#<___str_4
      00898A 4B 80            [ 1]  523 	push	#(___str_4 >> 8)
      00898C CD A8 60         [ 4]  524 	call	_printf
      00898F 5B 04            [ 2]  525 	addw	sp, #4
                                    526 ;	main.c: 131: printf("\r\n");
      008991 4B BF            [ 1]  527 	push	#<___str_6
      008993 4B 80            [ 1]  528 	push	#(___str_6 >> 8)
      008995 CD A8 1F         [ 4]  529 	call	_puts
      008998 5B 02            [ 2]  530 	addw	sp, #2
                                    531 ;	main.c: 132: OLED_ShowString(0,0,temp);
      00899A 1E 42            [ 2]  532 	ldw	x, (0x42, sp)
      00899C 89               [ 2]  533 	pushw	x
      00899D 4B 00            [ 1]  534 	push	#0x00
      00899F 4B 00            [ 1]  535 	push	#0x00
      0089A1 CD 93 B0         [ 4]  536 	call	_OLED_ShowString
      0089A4 5B 04            [ 2]  537 	addw	sp, #4
                                    538 ;	main.c: 134: GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
      0089A6 4B 20            [ 1]  539 	push	#0x20
      0089A8 4B 14            [ 1]  540 	push	#0x14
      0089AA 4B 50            [ 1]  541 	push	#0x50
      0089AC CD 96 B6         [ 4]  542 	call	_GPIO_WriteReverse
      0089AF 5B 03            [ 2]  543 	addw	sp, #3
                                    544 ;	main.c: 135: Delay(0xffff);
      0089B1 4B FF            [ 1]  545 	push	#0xff
      0089B3 4B FF            [ 1]  546 	push	#0xff
      0089B5 CD 86 FC         [ 4]  547 	call	_Delay
      0089B8 5B 02            [ 2]  548 	addw	sp, #2
                                    549 ;	main.c: 138: }
      0089BA CC 87 74         [ 2]  550 	jp	00104$
                                    551 	.area CODE
                                    552 	.area CONST
      008090                        553 ___str_0:
      008090 53 54 4D 38 20 53 74   554 	.ascii "STM8 Started!"
             61 72 74 65 64 21
      00809D 00                     555 	.db 0x00
      00809E                        556 ___str_2:
      00809E 53 54 4D 38 20 53 74   557 	.ascii "STM8 Started!"
             61 72 74 65 64 21
      0080AB 0D                     558 	.db 0x0d
      0080AC 00                     559 	.db 0x00
      0080AD                        560 ___str_3:
      0080AD 56 3A 25 34 64 2C 53   561 	.ascii "V:%4d,S:%1d %d"
             3A 25 31 64 20 25 64
      0080BB 00                     562 	.db 0x00
      0080BC                        563 ___str_4:
      0080BC 25 73                  564 	.ascii "%s"
      0080BE 00                     565 	.db 0x00
      0080BF                        566 ___str_6:
      0080BF 0D                     567 	.db 0x0d
      0080C0 00                     568 	.db 0x00
      0080C1                        569 ___str_7:
      0080C1 25 32 64 2F 25 32 64   570 	.ascii "%2d/%2d/%2d"
             2F 25 32 64
      0080CC 00                     571 	.db 0x00
      0080CD                        572 ___str_9:
      0080CD 25 32 64 2E 25 31 64   573 	.ascii "%2d.%1dC/%2d.%1d%%/%3d"
             43 2F 25 32 64 2E 25
             31 64 25 25 2F 25 33
             64
      0080E3 00                     574 	.db 0x00
      0080E4                        575 ___str_11:
      0080E4 25 32 64 2F 25 32 64   576 	.ascii "%2d/%2d/%2d/%2d/%2d"
             2F 25 32 64 2F 25 32
             64 2F 25 32 64
      0080F7 00                     577 	.db 0x00
                                    578 	.area INITIALIZER
                                    579 	.area CABS (ABS)
