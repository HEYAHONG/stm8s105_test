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
                                     17 	.globl _key_init
                                     18 	.globl _ReadDHT12
                                     19 	.globl _ds1302_read_time
                                     20 	.globl _ds1302_check
                                     21 	.globl _ds1302_port_init
                                     22 	.globl _ds1302_port_deinit
                                     23 	.globl _ds1302_active
                                     24 	.globl _Init_UART2
                                     25 	.globl _OLED_ShowString
                                     26 	.globl _OLED_Clear
                                     27 	.globl _OLED_Init
                                     28 	.globl _GPIO_ReadInputPin
                                     29 	.globl _GPIO_WriteReverse
                                     30 	.globl _GPIO_WriteLow
                                     31 	.globl _GPIO_WriteHigh
                                     32 	.globl _GPIO_Init
                                     33 ;--------------------------------------------------------
                                     34 ; ram data
                                     35 ;--------------------------------------------------------
                                     36 	.area DATA
      000001                         37 _main_count_196608_390:
      000001                         38 	.ds 1
                                     39 ;--------------------------------------------------------
                                     40 ; ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area INITIALIZED
                                     43 ;--------------------------------------------------------
                                     44 ; Stack segment in internal ram 
                                     45 ;--------------------------------------------------------
                                     46 	.area	SSEG
      FFFFFF                         47 __start__stack:
      FFFFFF                         48 	.ds	1
                                     49 
                                     50 ;--------------------------------------------------------
                                     51 ; absolute external ram data
                                     52 ;--------------------------------------------------------
                                     53 	.area DABS (ABS)
                                     54 
                                     55 ; default segment ordering for linker
                                     56 	.area HOME
                                     57 	.area GSINIT
                                     58 	.area GSFINAL
                                     59 	.area CONST
                                     60 	.area INITIALIZER
                                     61 	.area CODE
                                     62 
                                     63 ;--------------------------------------------------------
                                     64 ; interrupt vector 
                                     65 ;--------------------------------------------------------
                                     66 	.area HOME
      008000                         67 __interrupt_vect:
      008000 82 00 80 6F             68 	int s_GSINIT ; reset
      008004 82 00 86 F9             69 	int _TRAP_IRQHandler ; trap
      008008 82 00 86 FA             70 	int _TLI_IRQHandler ; int0
      00800C 82 00 86 FB             71 	int _AWU_IRQHandler ; int1
      008010 82 00 86 FC             72 	int _CLK_IRQHandler ; int2
      008014 82 00 86 FD             73 	int _EXTI_PORTA_IRQHandler ; int3
      008018 82 00 86 FE             74 	int _EXTI_PORTB_IRQHandler ; int4
      00801C 82 00 86 FF             75 	int _EXTI_PORTC_IRQHandler ; int5
      008020 82 00 87 00             76 	int _EXTI_PORTD_IRQHandler ; int6
      008024 82 00 87 2D             77 	int _EXTI_PORTE_IRQHandler ; int7
      008028 82 00 00 00             78 	int 0x000000 ; int8
      00802C 82 00 00 00             79 	int 0x000000 ; int9
      008030 82 00 87 2E             80 	int _SPI_IRQHandler ; int10
      008034 82 00 87 2F             81 	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
      008038 82 00 87 30             82 	int _TIM1_CAP_COM_IRQHandler ; int12
      00803C 82 00 87 31             83 	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
      008040 82 00 87 32             84 	int _TIM2_CAP_COM_IRQHandler ; int14
      008044 82 00 00 00             85 	int 0x000000 ; int15
      008048 82 00 00 00             86 	int 0x000000 ; int16
      00804C 82 00 00 00             87 	int 0x000000 ; int17
      008050 82 00 00 00             88 	int 0x000000 ; int18
      008054 82 00 87 35             89 	int _I2C_IRQHandler ; int19
      008058 82 00 87 36             90 	int _UART2_TX_IRQHandler ; int20
      00805C 82 00 87 37             91 	int _UART2_RX_IRQHandler ; int21
      008060 82 00 87 8D             92 	int _ADC1_IRQHandler ; int22
      008064 82 00 87 8E             93 	int _TIM4_UPD_OVF_IRQHandler ; int23
      008068 82 00 87 8F             94 	int _EEPROM_EEC_IRQHandler ; int24
                                     95 ;--------------------------------------------------------
                                     96 ; global & static initialisations
                                     97 ;--------------------------------------------------------
                                     98 	.area HOME
                                     99 	.area GSINIT
                                    100 	.area GSFINAL
                                    101 	.area GSINIT
      00806F                        102 __sdcc_gs_init_startup:
      00806F                        103 __sdcc_init_data:
                                    104 ; stm8_genXINIT() start
      00806F AE 00 01         [ 2]  105 	ldw x, #l_DATA
      008072 27 07            [ 1]  106 	jreq	00002$
      008074                        107 00001$:
      008074 72 4F 00 00      [ 1]  108 	clr (s_DATA - 1, x)
      008078 5A               [ 2]  109 	decw x
      008079 26 F9            [ 1]  110 	jrne	00001$
      00807B                        111 00002$:
      00807B AE 00 05         [ 2]  112 	ldw	x, #l_INITIALIZER
      00807E 27 09            [ 1]  113 	jreq	00004$
      008080                        114 00003$:
      008080 D6 86 F3         [ 1]  115 	ld	a, (s_INITIALIZER - 1, x)
      008083 D7 00 01         [ 1]  116 	ld	(s_INITIALIZED - 1, x), a
      008086 5A               [ 2]  117 	decw	x
      008087 26 F7            [ 1]  118 	jrne	00003$
      008089                        119 00004$:
                                    120 ; stm8_genXINIT() end
                                    121 ;	main.c: 107: static u8 count=0;
      008089 72 5F 00 01      [ 1]  122 	clr	_main_count_196608_390+0
                                    123 	.area GSFINAL
      00808D CC 80 6C         [ 2]  124 	jp	__sdcc_program_startup
                                    125 ;--------------------------------------------------------
                                    126 ; Home
                                    127 ;--------------------------------------------------------
                                    128 	.area HOME
                                    129 	.area HOME
      00806C                        130 __sdcc_program_startup:
      00806C CC 87 9A         [ 2]  131 	jp	_main
                                    132 ;	return from main will return to caller
                                    133 ;--------------------------------------------------------
                                    134 ; code
                                    135 ;--------------------------------------------------------
                                    136 	.area CODE
                                    137 ;	main.c: 48: void Delay(uint16_t nCount)
                                    138 ;	-----------------------------------------
                                    139 ;	 function Delay
                                    140 ;	-----------------------------------------
      008790                        141 _Delay:
                                    142 ;	main.c: 51: while (nCount != 0)
      008790 1E 03            [ 2]  143 	ldw	x, (0x03, sp)
      008792                        144 00101$:
      008792 5D               [ 2]  145 	tnzw	x
      008793 26 01            [ 1]  146 	jrne	00117$
      008795 81               [ 4]  147 	ret
      008796                        148 00117$:
                                    149 ;	main.c: 53: nCount--;
      008796 5A               [ 2]  150 	decw	x
      008797 20 F9            [ 2]  151 	jra	00101$
                                    152 ;	main.c: 55: }
      008799 81               [ 4]  153 	ret
                                    154 ;	main.c: 59: void main(void)
                                    155 ;	-----------------------------------------
                                    156 ;	 function main
                                    157 ;	-----------------------------------------
      00879A                        158 _main:
      00879A 52 4A            [ 2]  159 	sub	sp, #74
                                    160 ;	main.c: 63: GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      00879C 4B E0            [ 1]  161 	push	#0xe0
      00879E 4B 20            [ 1]  162 	push	#0x20
      0087A0 4B 14            [ 1]  163 	push	#0x14
      0087A2 4B 50            [ 1]  164 	push	#0x50
      0087A4 CD 96 09         [ 4]  165 	call	_GPIO_Init
      0087A7 5B 04            [ 2]  166 	addw	sp, #4
                                    167 ;	main.c: 64: GPIO_Init(GPIOF,GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
      0087A9 4B 00            [ 1]  168 	push	#0x00
      0087AB 4B 10            [ 1]  169 	push	#0x10
      0087AD 4B 19            [ 1]  170 	push	#0x19
      0087AF 4B 50            [ 1]  171 	push	#0x50
      0087B1 CD 96 09         [ 4]  172 	call	_GPIO_Init
      0087B4 5B 04            [ 2]  173 	addw	sp, #4
                                    174 ;	main.c: 66: Init_UART2();
      0087B6 CD 8D 6D         [ 4]  175 	call	_Init_UART2
                                    176 ;	main.c: 67: OLED_Init();
      0087B9 CD 94 22         [ 4]  177 	call	_OLED_Init
                                    178 ;	main.c: 68: ds1302_active();
      0087BC CD 91 20         [ 4]  179 	call	_ds1302_active
                                    180 ;	main.c: 69: key_init();
      0087BF CD 8D ED         [ 4]  181 	call	_key_init
                                    182 ;	main.c: 70: OLED_Clear();
      0087C2 CD 92 6A         [ 4]  183 	call	_OLED_Clear
                                    184 ;	main.c: 71: enableInterrupts(); //使能中断
      0087C5 9A               [ 1]  185 	rim
                                    186 ;	main.c: 73: OLED_ShowString(0,0,"STM8 Started!");
      0087C6 4B 90            [ 1]  187 	push	#<___str_0
      0087C8 4B 80            [ 1]  188 	push	#(___str_0 >> 8)
      0087CA 4B 00            [ 1]  189 	push	#0x00
      0087CC 4B 00            [ 1]  190 	push	#0x00
      0087CE CD 93 EF         [ 4]  191 	call	_OLED_ShowString
      0087D1 5B 04            [ 2]  192 	addw	sp, #4
                                    193 ;	main.c: 74: printf("STM8 Started!\r\n");
      0087D3 4B 9E            [ 1]  194 	push	#<___str_2
      0087D5 4B 80            [ 1]  195 	push	#(___str_2 >> 8)
      0087D7 CD A5 38         [ 4]  196 	call	_puts
      0087DA 5B 02            [ 2]  197 	addw	sp, #2
                                    198 ;	main.c: 76: GPIO_Init(GPIOD, GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_FAST);
      0087DC 4B E0            [ 1]  199 	push	#0xe0
      0087DE 4B 80            [ 1]  200 	push	#0x80
      0087E0 4B 0F            [ 1]  201 	push	#0x0f
      0087E2 4B 50            [ 1]  202 	push	#0x50
      0087E4 CD 96 09         [ 4]  203 	call	_GPIO_Init
      0087E7 5B 04            [ 2]  204 	addw	sp, #4
                                    205 ;	main.c: 77: GPIO_WriteHigh(GPIOD,GPIO_PIN_7);
      0087E9 4B 80            [ 1]  206 	push	#0x80
      0087EB 4B 0F            [ 1]  207 	push	#0x0f
      0087ED 4B 50            [ 1]  208 	push	#0x50
      0087EF CD 96 84         [ 4]  209 	call	_GPIO_WriteHigh
      0087F2 5B 03            [ 2]  210 	addw	sp, #3
                                    211 ;	main.c: 78: Delay(0xffff);
      0087F4 4B FF            [ 1]  212 	push	#0xff
      0087F6 4B FF            [ 1]  213 	push	#0xff
      0087F8 CD 87 90         [ 4]  214 	call	_Delay
      0087FB 5B 02            [ 2]  215 	addw	sp, #2
                                    216 ;	main.c: 79: GPIO_WriteLow(GPIOD,GPIO_PIN_7);
      0087FD 4B 80            [ 1]  217 	push	#0x80
      0087FF 4B 0F            [ 1]  218 	push	#0x0f
      008801 4B 50            [ 1]  219 	push	#0x50
      008803 CD 96 8B         [ 4]  220 	call	_GPIO_WriteLow
      008806 5B 03            [ 2]  221 	addw	sp, #3
                                    222 ;	main.c: 83: while (1)
      008808                        223 00106$:
                                    224 ;	main.c: 87: sprintf(temp,"V:%4d,S:%1d",ReadADC(),GPIO_ReadInputPin(GPIOF,GPIO_PIN_4)==RESET?0:1);
      008808 4B 10            [ 1]  225 	push	#0x10
      00880A 4B 19            [ 1]  226 	push	#0x19
      00880C 4B 50            [ 1]  227 	push	#0x50
      00880E CD 96 A9         [ 4]  228 	call	_GPIO_ReadInputPin
      008811 5B 03            [ 2]  229 	addw	sp, #3
      008813 4D               [ 1]  230 	tnz	a
      008814 26 05            [ 1]  231 	jrne	00110$
      008816 5F               [ 1]  232 	clrw	x
      008817 1F 1A            [ 2]  233 	ldw	(0x1a, sp), x
      008819 20 05            [ 2]  234 	jra	00111$
      00881B                        235 00110$:
      00881B AE 00 01         [ 2]  236 	ldw	x, #0x0001
      00881E 1F 1A            [ 2]  237 	ldw	(0x1a, sp), x
      008820                        238 00111$:
      008820 CD 95 A8         [ 4]  239 	call	_ReadADC
      008823 90 96            [ 1]  240 	ldw	y, sp
      008825 72 A9 00 10      [ 2]  241 	addw	y, #16
      008829 17 32            [ 2]  242 	ldw	(0x32, sp), y
      00882B 7B 1B            [ 1]  243 	ld	a, (0x1b, sp)
      00882D 88               [ 1]  244 	push	a
      00882E 7B 1B            [ 1]  245 	ld	a, (0x1b, sp)
      008830 88               [ 1]  246 	push	a
      008831 89               [ 2]  247 	pushw	x
      008832 4B AD            [ 1]  248 	push	#<___str_3
      008834 4B 80            [ 1]  249 	push	#(___str_3 >> 8)
      008836 90 89            [ 2]  250 	pushw	y
      008838 CD A4 BE         [ 4]  251 	call	_sprintf
      00883B 5B 08            [ 2]  252 	addw	sp, #8
                                    253 ;	main.c: 88: printf("%s",temp);
      00883D 1E 32            [ 2]  254 	ldw	x, (0x32, sp)
      00883F 89               [ 2]  255 	pushw	x
      008840 4B B9            [ 1]  256 	push	#<___str_4
      008842 4B 80            [ 1]  257 	push	#(___str_4 >> 8)
      008844 CD A5 79         [ 4]  258 	call	_printf
      008847 5B 04            [ 2]  259 	addw	sp, #4
                                    260 ;	main.c: 89: printf("\r\n");
      008849 4B BC            [ 1]  261 	push	#<___str_6
      00884B 4B 80            [ 1]  262 	push	#(___str_6 >> 8)
      00884D CD A5 38         [ 4]  263 	call	_puts
      008850 5B 02            [ 2]  264 	addw	sp, #2
                                    265 ;	main.c: 90: OLED_ShowString(0,2,temp);
      008852 1E 32            [ 2]  266 	ldw	x, (0x32, sp)
      008854 89               [ 2]  267 	pushw	x
      008855 4B 02            [ 1]  268 	push	#0x02
      008857 4B 00            [ 1]  269 	push	#0x00
      008859 CD 93 EF         [ 4]  270 	call	_OLED_ShowString
      00885C 5B 04            [ 2]  271 	addw	sp, #4
                                    272 ;	main.c: 93: ds1302_port_init();
      00885E CD 8E 7E         [ 4]  273 	call	_ds1302_port_init
                                    274 ;	main.c: 94: if(ds1302_check())
      008861 CD 8F DB         [ 4]  275 	call	_ds1302_check
      008864 6B 42            [ 1]  276 	ld	(0x42, sp), a
      008866 26 03            [ 1]  277 	jrne	00133$
      008868 CC 89 45         [ 2]  278 	jp	00102$
      00886B                        279 00133$:
                                    280 ;	main.c: 98: ds1302_read_time(&ds_time);
      00886B 96               [ 1]  281 	ldw	x, sp
      00886C 1C 00 09         [ 2]  282 	addw	x, #9
      00886F 1F 26            [ 2]  283 	ldw	(0x26, sp), x
      008871 89               [ 2]  284 	pushw	x
      008872 CD 8F F3         [ 4]  285 	call	_ds1302_read_time
      008875 5B 02            [ 2]  286 	addw	sp, #2
                                    287 ;	main.c: 99: sprintf(temp,"%2d/%2d/%2d",ds_time.hour/16*10+ds_time.hour%16,ds_time.minute/16*10+ds_time.minute%16,ds_time.second/16*10+ds_time.second%16);
      008877 1E 26            [ 2]  288 	ldw	x, (0x26, sp)
      008879 E6 06            [ 1]  289 	ld	a, (0x6, x)
      00887B 6B 41            [ 1]  290 	ld	(0x41, sp), a
      00887D 0F 40            [ 1]  291 	clr	(0x40, sp)
      00887F 4B 10            [ 1]  292 	push	#0x10
      008881 4B 00            [ 1]  293 	push	#0x00
      008883 1E 42            [ 2]  294 	ldw	x, (0x42, sp)
      008885 89               [ 2]  295 	pushw	x
      008886 CD A6 21         [ 4]  296 	call	__divsint
      008889 5B 04            [ 2]  297 	addw	sp, #4
      00888B 89               [ 2]  298 	pushw	x
      00888C 58               [ 2]  299 	sllw	x
      00888D 58               [ 2]  300 	sllw	x
      00888E 72 FB 01         [ 2]  301 	addw	x, (1, sp)
      008891 58               [ 2]  302 	sllw	x
      008892 5B 02            [ 2]  303 	addw	sp, #2
      008894 1F 3E            [ 2]  304 	ldw	(0x3e, sp), x
      008896 4B 10            [ 1]  305 	push	#0x10
      008898 4B 00            [ 1]  306 	push	#0x00
      00889A 1E 42            [ 2]  307 	ldw	x, (0x42, sp)
      00889C 89               [ 2]  308 	pushw	x
      00889D CD A6 0B         [ 4]  309 	call	__modsint
      0088A0 5B 04            [ 2]  310 	addw	sp, #4
      0088A2 72 FB 3E         [ 2]  311 	addw	x, (0x3e, sp)
      0088A5 1F 1E            [ 2]  312 	ldw	(0x1e, sp), x
      0088A7 1E 26            [ 2]  313 	ldw	x, (0x26, sp)
      0088A9 E6 05            [ 1]  314 	ld	a, (0x5, x)
      0088AB 6B 1D            [ 1]  315 	ld	(0x1d, sp), a
      0088AD 0F 1C            [ 1]  316 	clr	(0x1c, sp)
      0088AF 4B 10            [ 1]  317 	push	#0x10
      0088B1 4B 00            [ 1]  318 	push	#0x00
      0088B3 1E 1E            [ 2]  319 	ldw	x, (0x1e, sp)
      0088B5 89               [ 2]  320 	pushw	x
      0088B6 CD A6 21         [ 4]  321 	call	__divsint
      0088B9 5B 04            [ 2]  322 	addw	sp, #4
      0088BB 89               [ 2]  323 	pushw	x
      0088BC 58               [ 2]  324 	sllw	x
      0088BD 58               [ 2]  325 	sllw	x
      0088BE 72 FB 01         [ 2]  326 	addw	x, (1, sp)
      0088C1 58               [ 2]  327 	sllw	x
      0088C2 5B 02            [ 2]  328 	addw	sp, #2
      0088C4 1F 30            [ 2]  329 	ldw	(0x30, sp), x
      0088C6 4B 10            [ 1]  330 	push	#0x10
      0088C8 4B 00            [ 1]  331 	push	#0x00
      0088CA 1E 1E            [ 2]  332 	ldw	x, (0x1e, sp)
      0088CC 89               [ 2]  333 	pushw	x
      0088CD CD A6 0B         [ 4]  334 	call	__modsint
      0088D0 5B 04            [ 2]  335 	addw	sp, #4
      0088D2 72 FB 30         [ 2]  336 	addw	x, (0x30, sp)
      0088D5 1F 2E            [ 2]  337 	ldw	(0x2e, sp), x
      0088D7 1E 26            [ 2]  338 	ldw	x, (0x26, sp)
      0088D9 E6 04            [ 1]  339 	ld	a, (0x4, x)
      0088DB 6B 25            [ 1]  340 	ld	(0x25, sp), a
      0088DD 0F 24            [ 1]  341 	clr	(0x24, sp)
      0088DF 4B 10            [ 1]  342 	push	#0x10
      0088E1 4B 00            [ 1]  343 	push	#0x00
      0088E3 1E 26            [ 2]  344 	ldw	x, (0x26, sp)
      0088E5 89               [ 2]  345 	pushw	x
      0088E6 CD A6 21         [ 4]  346 	call	__divsint
      0088E9 5B 04            [ 2]  347 	addw	sp, #4
      0088EB 89               [ 2]  348 	pushw	x
      0088EC 58               [ 2]  349 	sllw	x
      0088ED 58               [ 2]  350 	sllw	x
      0088EE 72 FB 01         [ 2]  351 	addw	x, (1, sp)
      0088F1 58               [ 2]  352 	sllw	x
      0088F2 5B 02            [ 2]  353 	addw	sp, #2
      0088F4 1F 22            [ 2]  354 	ldw	(0x22, sp), x
      0088F6 4B 10            [ 1]  355 	push	#0x10
      0088F8 4B 00            [ 1]  356 	push	#0x00
      0088FA 1E 26            [ 2]  357 	ldw	x, (0x26, sp)
      0088FC 89               [ 2]  358 	pushw	x
      0088FD CD A6 0B         [ 4]  359 	call	__modsint
      008900 5B 04            [ 2]  360 	addw	sp, #4
      008902 72 FB 22         [ 2]  361 	addw	x, (0x22, sp)
      008905 51               [ 1]  362 	exgw	x, y
      008906 96               [ 1]  363 	ldw	x, sp
      008907 1C 00 10         [ 2]  364 	addw	x, #16
      00890A 1F 20            [ 2]  365 	ldw	(0x20, sp), x
      00890C 7B 1F            [ 1]  366 	ld	a, (0x1f, sp)
      00890E 88               [ 1]  367 	push	a
      00890F 7B 1F            [ 1]  368 	ld	a, (0x1f, sp)
      008911 88               [ 1]  369 	push	a
      008912 7B 31            [ 1]  370 	ld	a, (0x31, sp)
      008914 88               [ 1]  371 	push	a
      008915 7B 31            [ 1]  372 	ld	a, (0x31, sp)
      008917 88               [ 1]  373 	push	a
      008918 90 89            [ 2]  374 	pushw	y
      00891A 4B BE            [ 1]  375 	push	#<___str_7
      00891C 4B 80            [ 1]  376 	push	#(___str_7 >> 8)
      00891E 89               [ 2]  377 	pushw	x
      00891F CD A4 BE         [ 4]  378 	call	_sprintf
      008922 5B 0A            [ 2]  379 	addw	sp, #10
                                    380 ;	main.c: 100: printf("%s",temp);
      008924 1E 20            [ 2]  381 	ldw	x, (0x20, sp)
      008926 89               [ 2]  382 	pushw	x
      008927 4B B9            [ 1]  383 	push	#<___str_4
      008929 4B 80            [ 1]  384 	push	#(___str_4 >> 8)
      00892B CD A5 79         [ 4]  385 	call	_printf
      00892E 5B 04            [ 2]  386 	addw	sp, #4
                                    387 ;	main.c: 101: printf("\r\n");
      008930 4B BC            [ 1]  388 	push	#<___str_6
      008932 4B 80            [ 1]  389 	push	#(___str_6 >> 8)
      008934 CD A5 38         [ 4]  390 	call	_puts
      008937 5B 02            [ 2]  391 	addw	sp, #2
                                    392 ;	main.c: 102: OLED_ShowString(0,4,temp);
      008939 1E 20            [ 2]  393 	ldw	x, (0x20, sp)
      00893B 89               [ 2]  394 	pushw	x
      00893C 4B 04            [ 1]  395 	push	#0x04
      00893E 4B 00            [ 1]  396 	push	#0x00
      008940 CD 93 EF         [ 4]  397 	call	_OLED_ShowString
      008943 5B 04            [ 2]  398 	addw	sp, #4
      008945                        399 00102$:
                                    400 ;	main.c: 104: ds1302_port_deinit();
      008945 CD 8E 56         [ 4]  401 	call	_ds1302_port_deinit
                                    402 ;	main.c: 109: if(count>=2)
      008948 C6 00 01         [ 1]  403 	ld	a, _main_count_196608_390+0
      00894B A1 02            [ 1]  404 	cp	a, #0x02
      00894D 24 03            [ 1]  405 	jrnc	00134$
      00894F CC 89 C9         [ 2]  406 	jp	00104$
      008952                        407 00134$:
                                    408 ;	main.c: 113: ReadDHT12(&data);
      008952 90 96            [ 1]  409 	ldw	y, sp
      008954 72 A9 00 15      [ 2]  410 	addw	y, #21
      008958 93               [ 1]  411 	ldw	x, y
      008959 90 89            [ 2]  412 	pushw	y
      00895B 89               [ 2]  413 	pushw	x
      00895C CD 8D 12         [ 4]  414 	call	_ReadDHT12
      00895F 5B 02            [ 2]  415 	addw	sp, #2
      008961 90 85            [ 2]  416 	popw	y
                                    417 ;	main.c: 114: sprintf(temp,"%2d.%1dC/%2d.%1d%%/%3d",data.T,data.T1,data.W,data.W1,data.sum);
      008963 93               [ 1]  418 	ldw	x, y
      008964 E6 04            [ 1]  419 	ld	a, (0x4, x)
      008966 6B 2D            [ 1]  420 	ld	(0x2d, sp), a
      008968 0F 2C            [ 1]  421 	clr	(0x2c, sp)
      00896A 93               [ 1]  422 	ldw	x, y
      00896B E6 03            [ 1]  423 	ld	a, (0x3, x)
      00896D 6B 2B            [ 1]  424 	ld	(0x2b, sp), a
      00896F 0F 2A            [ 1]  425 	clr	(0x2a, sp)
      008971 93               [ 1]  426 	ldw	x, y
      008972 E6 02            [ 1]  427 	ld	a, (0x2, x)
      008974 6B 29            [ 1]  428 	ld	(0x29, sp), a
      008976 0F 28            [ 1]  429 	clr	(0x28, sp)
      008978 93               [ 1]  430 	ldw	x, y
      008979 E6 01            [ 1]  431 	ld	a, (0x1, x)
      00897B 6B 3D            [ 1]  432 	ld	(0x3d, sp), a
      00897D 0F 3C            [ 1]  433 	clr	(0x3c, sp)
      00897F 90 F6            [ 1]  434 	ld	a, (y)
      008981 0F 3A            [ 1]  435 	clr	(0x3a, sp)
      008983 96               [ 1]  436 	ldw	x, sp
      008984 5C               [ 1]  437 	incw	x
      008985 1F 38            [ 2]  438 	ldw	(0x38, sp), x
      008987 90 93            [ 1]  439 	ldw	y, x
      008989 1E 2C            [ 2]  440 	ldw	x, (0x2c, sp)
      00898B 89               [ 2]  441 	pushw	x
      00898C 1E 2C            [ 2]  442 	ldw	x, (0x2c, sp)
      00898E 89               [ 2]  443 	pushw	x
      00898F 1E 2C            [ 2]  444 	ldw	x, (0x2c, sp)
      008991 89               [ 2]  445 	pushw	x
      008992 1E 42            [ 2]  446 	ldw	x, (0x42, sp)
      008994 89               [ 2]  447 	pushw	x
      008995 88               [ 1]  448 	push	a
      008996 7B 43            [ 1]  449 	ld	a, (0x43, sp)
      008998 88               [ 1]  450 	push	a
      008999 4B CA            [ 1]  451 	push	#<___str_9
      00899B 4B 80            [ 1]  452 	push	#(___str_9 >> 8)
      00899D 90 89            [ 2]  453 	pushw	y
      00899F CD A4 BE         [ 4]  454 	call	_sprintf
      0089A2 5B 0E            [ 2]  455 	addw	sp, #14
                                    456 ;	main.c: 115: printf("%s",temp);
      0089A4 1E 38            [ 2]  457 	ldw	x, (0x38, sp)
      0089A6 89               [ 2]  458 	pushw	x
      0089A7 4B B9            [ 1]  459 	push	#<___str_4
      0089A9 4B 80            [ 1]  460 	push	#(___str_4 >> 8)
      0089AB CD A5 79         [ 4]  461 	call	_printf
      0089AE 5B 04            [ 2]  462 	addw	sp, #4
                                    463 ;	main.c: 116: printf("\r\n");
      0089B0 4B BC            [ 1]  464 	push	#<___str_6
      0089B2 4B 80            [ 1]  465 	push	#(___str_6 >> 8)
      0089B4 CD A5 38         [ 4]  466 	call	_puts
      0089B7 5B 02            [ 2]  467 	addw	sp, #2
                                    468 ;	main.c: 117: OLED_ShowString(0,6,temp);
      0089B9 1E 38            [ 2]  469 	ldw	x, (0x38, sp)
      0089BB 89               [ 2]  470 	pushw	x
      0089BC 4B 06            [ 1]  471 	push	#0x06
      0089BE 4B 00            [ 1]  472 	push	#0x00
      0089C0 CD 93 EF         [ 4]  473 	call	_OLED_ShowString
      0089C3 5B 04            [ 2]  474 	addw	sp, #4
                                    475 ;	main.c: 118: count=0;
      0089C5 72 5F 00 01      [ 1]  476 	clr	_main_count_196608_390+0
      0089C9                        477 00104$:
                                    478 ;	main.c: 121: count++;
      0089C9 72 5C 00 01      [ 1]  479 	inc	_main_count_196608_390+0
                                    480 ;	main.c: 125: sprintf(temp,"%2d/%2d/%2d/%2d/%2d",keycount[0],keycount[1],keycount[2],keycount[3],keycount[4]);
      0089CD 90 AE 00 02      [ 2]  481 	ldw	y, #_keycount+0
      0089D1 93               [ 1]  482 	ldw	x, y
      0089D2 E6 04            [ 1]  483 	ld	a, (0x4, x)
      0089D4 6B 37            [ 1]  484 	ld	(0x37, sp), a
      0089D6 0F 36            [ 1]  485 	clr	(0x36, sp)
      0089D8 93               [ 1]  486 	ldw	x, y
      0089D9 E6 03            [ 1]  487 	ld	a, (0x3, x)
      0089DB 6B 35            [ 1]  488 	ld	(0x35, sp), a
      0089DD 0F 34            [ 1]  489 	clr	(0x34, sp)
      0089DF 93               [ 1]  490 	ldw	x, y
      0089E0 E6 02            [ 1]  491 	ld	a, (0x2, x)
      0089E2 6B 4A            [ 1]  492 	ld	(0x4a, sp), a
      0089E4 0F 49            [ 1]  493 	clr	(0x49, sp)
      0089E6 93               [ 1]  494 	ldw	x, y
      0089E7 E6 01            [ 1]  495 	ld	a, (0x1, x)
      0089E9 6B 48            [ 1]  496 	ld	(0x48, sp), a
      0089EB 0F 47            [ 1]  497 	clr	(0x47, sp)
      0089ED 90 F6            [ 1]  498 	ld	a, (y)
      0089EF 0F 45            [ 1]  499 	clr	(0x45, sp)
      0089F1 96               [ 1]  500 	ldw	x, sp
      0089F2 1C 00 06         [ 2]  501 	addw	x, #6
      0089F5 1F 43            [ 2]  502 	ldw	(0x43, sp), x
      0089F7 90 93            [ 1]  503 	ldw	y, x
      0089F9 1E 36            [ 2]  504 	ldw	x, (0x36, sp)
      0089FB 89               [ 2]  505 	pushw	x
      0089FC 1E 36            [ 2]  506 	ldw	x, (0x36, sp)
      0089FE 89               [ 2]  507 	pushw	x
      0089FF 1E 4D            [ 2]  508 	ldw	x, (0x4d, sp)
      008A01 89               [ 2]  509 	pushw	x
      008A02 1E 4D            [ 2]  510 	ldw	x, (0x4d, sp)
      008A04 89               [ 2]  511 	pushw	x
      008A05 88               [ 1]  512 	push	a
      008A06 7B 4E            [ 1]  513 	ld	a, (0x4e, sp)
      008A08 88               [ 1]  514 	push	a
      008A09 4B E1            [ 1]  515 	push	#<___str_11
      008A0B 4B 80            [ 1]  516 	push	#(___str_11 >> 8)
      008A0D 90 89            [ 2]  517 	pushw	y
      008A0F CD A4 BE         [ 4]  518 	call	_sprintf
      008A12 5B 0E            [ 2]  519 	addw	sp, #14
                                    520 ;	main.c: 126: printf("%s",temp);
      008A14 1E 43            [ 2]  521 	ldw	x, (0x43, sp)
      008A16 89               [ 2]  522 	pushw	x
      008A17 4B B9            [ 1]  523 	push	#<___str_4
      008A19 4B 80            [ 1]  524 	push	#(___str_4 >> 8)
      008A1B CD A5 79         [ 4]  525 	call	_printf
      008A1E 5B 04            [ 2]  526 	addw	sp, #4
                                    527 ;	main.c: 127: printf("\r\n");
      008A20 4B BC            [ 1]  528 	push	#<___str_6
      008A22 4B 80            [ 1]  529 	push	#(___str_6 >> 8)
      008A24 CD A5 38         [ 4]  530 	call	_puts
      008A27 5B 02            [ 2]  531 	addw	sp, #2
                                    532 ;	main.c: 128: OLED_ShowString(0,0,temp);
      008A29 1E 43            [ 2]  533 	ldw	x, (0x43, sp)
      008A2B 89               [ 2]  534 	pushw	x
      008A2C 4B 00            [ 1]  535 	push	#0x00
      008A2E 4B 00            [ 1]  536 	push	#0x00
      008A30 CD 93 EF         [ 4]  537 	call	_OLED_ShowString
      008A33 5B 04            [ 2]  538 	addw	sp, #4
                                    539 ;	main.c: 130: GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
      008A35 4B 20            [ 1]  540 	push	#0x20
      008A37 4B 14            [ 1]  541 	push	#0x14
      008A39 4B 50            [ 1]  542 	push	#0x50
      008A3B CD 96 99         [ 4]  543 	call	_GPIO_WriteReverse
      008A3E 5B 03            [ 2]  544 	addw	sp, #3
                                    545 ;	main.c: 131: Delay(0xffff);
      008A40 4B FF            [ 1]  546 	push	#0xff
      008A42 4B FF            [ 1]  547 	push	#0xff
      008A44 CD 87 90         [ 4]  548 	call	_Delay
      008A47 5B 02            [ 2]  549 	addw	sp, #2
                                    550 ;	main.c: 134: }
      008A49 CC 88 08         [ 2]  551 	jp	00106$
                                    552 	.area CODE
                                    553 	.area CONST
      008090                        554 ___str_0:
      008090 53 54 4D 38 20 53 74   555 	.ascii "STM8 Started!"
             61 72 74 65 64 21
      00809D 00                     556 	.db 0x00
      00809E                        557 ___str_2:
      00809E 53 54 4D 38 20 53 74   558 	.ascii "STM8 Started!"
             61 72 74 65 64 21
      0080AB 0D                     559 	.db 0x0d
      0080AC 00                     560 	.db 0x00
      0080AD                        561 ___str_3:
      0080AD 56 3A 25 34 64 2C 53   562 	.ascii "V:%4d,S:%1d"
             3A 25 31 64
      0080B8 00                     563 	.db 0x00
      0080B9                        564 ___str_4:
      0080B9 25 73                  565 	.ascii "%s"
      0080BB 00                     566 	.db 0x00
      0080BC                        567 ___str_6:
      0080BC 0D                     568 	.db 0x0d
      0080BD 00                     569 	.db 0x00
      0080BE                        570 ___str_7:
      0080BE 25 32 64 2F 25 32 64   571 	.ascii "%2d/%2d/%2d"
             2F 25 32 64
      0080C9 00                     572 	.db 0x00
      0080CA                        573 ___str_9:
      0080CA 25 32 64 2E 25 31 64   574 	.ascii "%2d.%1dC/%2d.%1d%%/%3d"
             43 2F 25 32 64 2E 25
             31 64 25 25 2F 25 33
             64
      0080E0 00                     575 	.db 0x00
      0080E1                        576 ___str_11:
      0080E1 25 32 64 2F 25 32 64   577 	.ascii "%2d/%2d/%2d/%2d/%2d"
             2F 25 32 64 2F 25 32
             64 2F 25 32 64
      0080F4 00                     578 	.db 0x00
                                    579 	.area INITIALIZER
                                    580 	.area CABS (ABS)
