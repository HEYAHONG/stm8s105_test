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
                                     29 	.globl _GPIO_WriteLow
                                     30 	.globl _GPIO_WriteHigh
                                     31 	.globl _GPIO_Init
                                     32 ;--------------------------------------------------------
                                     33 ; ram data
                                     34 ;--------------------------------------------------------
                                     35 	.area DATA
      000001                         36 _main_count_196608_389:
      000001                         37 	.ds 1
                                     38 ;--------------------------------------------------------
                                     39 ; ram data
                                     40 ;--------------------------------------------------------
                                     41 	.area INITIALIZED
                                     42 ;--------------------------------------------------------
                                     43 ; Stack segment in internal ram 
                                     44 ;--------------------------------------------------------
                                     45 	.area	SSEG
      FFFFFF                         46 __start__stack:
      FFFFFF                         47 	.ds	1
                                     48 
                                     49 ;--------------------------------------------------------
                                     50 ; absolute external ram data
                                     51 ;--------------------------------------------------------
                                     52 	.area DABS (ABS)
                                     53 
                                     54 ; default segment ordering for linker
                                     55 	.area HOME
                                     56 	.area GSINIT
                                     57 	.area GSFINAL
                                     58 	.area CONST
                                     59 	.area INITIALIZER
                                     60 	.area CODE
                                     61 
                                     62 ;--------------------------------------------------------
                                     63 ; interrupt vector 
                                     64 ;--------------------------------------------------------
                                     65 	.area HOME
      008000                         66 __interrupt_vect:
      008000 82 00 80 6F             67 	int s_GSINIT ; reset
      008004 82 00 86 E0             68 	int _TRAP_IRQHandler ; trap
      008008 82 00 86 E1             69 	int _TLI_IRQHandler ; int0
      00800C 82 00 86 E2             70 	int _AWU_IRQHandler ; int1
      008010 82 00 86 E3             71 	int _CLK_IRQHandler ; int2
      008014 82 00 86 E4             72 	int _EXTI_PORTA_IRQHandler ; int3
      008018 82 00 86 E5             73 	int _EXTI_PORTB_IRQHandler ; int4
      00801C 82 00 86 E6             74 	int _EXTI_PORTC_IRQHandler ; int5
      008020 82 00 86 E7             75 	int _EXTI_PORTD_IRQHandler ; int6
      008024 82 00 86 E8             76 	int _EXTI_PORTE_IRQHandler ; int7
      008028 82 00 00 00             77 	int 0x000000 ; int8
      00802C 82 00 00 00             78 	int 0x000000 ; int9
      008030 82 00 86 E9             79 	int _SPI_IRQHandler ; int10
      008034 82 00 86 EA             80 	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
      008038 82 00 86 EB             81 	int _TIM1_CAP_COM_IRQHandler ; int12
      00803C 82 00 86 EC             82 	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
      008040 82 00 86 ED             83 	int _TIM2_CAP_COM_IRQHandler ; int14
      008044 82 00 00 00             84 	int 0x000000 ; int15
      008048 82 00 00 00             85 	int 0x000000 ; int16
      00804C 82 00 00 00             86 	int 0x000000 ; int17
      008050 82 00 00 00             87 	int 0x000000 ; int18
      008054 82 00 86 F0             88 	int _I2C_IRQHandler ; int19
      008058 82 00 86 F1             89 	int _UART2_TX_IRQHandler ; int20
      00805C 82 00 86 F2             90 	int _UART2_RX_IRQHandler ; int21
      008060 82 00 87 48             91 	int _ADC1_IRQHandler ; int22
      008064 82 00 87 49             92 	int _TIM4_UPD_OVF_IRQHandler ; int23
      008068 82 00 87 4A             93 	int _EEPROM_EEC_IRQHandler ; int24
                                     94 ;--------------------------------------------------------
                                     95 ; global & static initialisations
                                     96 ;--------------------------------------------------------
                                     97 	.area HOME
                                     98 	.area GSINIT
                                     99 	.area GSFINAL
                                    100 	.area GSINIT
      00806F                        101 __sdcc_gs_init_startup:
      00806F                        102 __sdcc_init_data:
                                    103 ; stm8_genXINIT() start
      00806F AE 00 01         [ 2]  104 	ldw x, #l_DATA
      008072 27 07            [ 1]  105 	jreq	00002$
      008074                        106 00001$:
      008074 72 4F 00 00      [ 1]  107 	clr (s_DATA - 1, x)
      008078 5A               [ 2]  108 	decw x
      008079 26 F9            [ 1]  109 	jrne	00001$
      00807B                        110 00002$:
      00807B AE 00 00         [ 2]  111 	ldw	x, #l_INITIALIZER
      00807E 27 09            [ 1]  112 	jreq	00004$
      008080                        113 00003$:
      008080 D6 86 DF         [ 1]  114 	ld	a, (s_INITIALIZER - 1, x)
      008083 D7 00 01         [ 1]  115 	ld	(s_INITIALIZED - 1, x), a
      008086 5A               [ 2]  116 	decw	x
      008087 26 F7            [ 1]  117 	jrne	00003$
      008089                        118 00004$:
                                    119 ; stm8_genXINIT() end
                                    120 ;	main.c: 105: static u8 count=0;
      008089 72 5F 00 01      [ 1]  121 	clr	_main_count_196608_389+0
                                    122 	.area GSFINAL
      00808D CC 80 6C         [ 2]  123 	jp	__sdcc_program_startup
                                    124 ;--------------------------------------------------------
                                    125 ; Home
                                    126 ;--------------------------------------------------------
                                    127 	.area HOME
                                    128 	.area HOME
      00806C                        129 __sdcc_program_startup:
      00806C CC 87 55         [ 2]  130 	jp	_main
                                    131 ;	return from main will return to caller
                                    132 ;--------------------------------------------------------
                                    133 ; code
                                    134 ;--------------------------------------------------------
                                    135 	.area CODE
                                    136 ;	main.c: 47: void Delay(uint16_t nCount)
                                    137 ;	-----------------------------------------
                                    138 ;	 function Delay
                                    139 ;	-----------------------------------------
      00874B                        140 _Delay:
                                    141 ;	main.c: 50: while (nCount != 0)
      00874B 1E 03            [ 2]  142 	ldw	x, (0x03, sp)
      00874D                        143 00101$:
      00874D 5D               [ 2]  144 	tnzw	x
      00874E 26 01            [ 1]  145 	jrne	00117$
      008750 81               [ 4]  146 	ret
      008751                        147 00117$:
                                    148 ;	main.c: 52: nCount--;
      008751 5A               [ 2]  149 	decw	x
      008752 20 F9            [ 2]  150 	jra	00101$
                                    151 ;	main.c: 54: }
      008754 81               [ 4]  152 	ret
                                    153 ;	main.c: 58: void main(void)
                                    154 ;	-----------------------------------------
                                    155 ;	 function main
                                    156 ;	-----------------------------------------
      008755                        157 _main:
      008755 52 3E            [ 2]  158 	sub	sp, #62
                                    159 ;	main.c: 62: GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      008757 4B E0            [ 1]  160 	push	#0xe0
      008759 4B 20            [ 1]  161 	push	#0x20
      00875B 4B 14            [ 1]  162 	push	#0x14
      00875D 4B 50            [ 1]  163 	push	#0x50
      00875F CD 94 F0         [ 4]  164 	call	_GPIO_Init
      008762 5B 04            [ 2]  165 	addw	sp, #4
                                    166 ;	main.c: 63: GPIO_Init(GPIOF,GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
      008764 4B 00            [ 1]  167 	push	#0x00
      008766 4B 10            [ 1]  168 	push	#0x10
      008768 4B 19            [ 1]  169 	push	#0x19
      00876A 4B 50            [ 1]  170 	push	#0x50
      00876C CD 94 F0         [ 4]  171 	call	_GPIO_Init
      00876F 5B 04            [ 2]  172 	addw	sp, #4
                                    173 ;	main.c: 65: Init_UART2();
      008771 CD 8C BD         [ 4]  174 	call	_Init_UART2
                                    175 ;	main.c: 66: OLED_Init();
      008774 CD 93 09         [ 4]  176 	call	_OLED_Init
                                    177 ;	main.c: 67: ds1302_active();
      008777 CD 90 07         [ 4]  178 	call	_ds1302_active
                                    179 ;	main.c: 68: OLED_Clear();
      00877A CD 91 51         [ 4]  180 	call	_OLED_Clear
                                    181 ;	main.c: 69: enableInterrupts(); //使能中断
      00877D 9A               [ 1]  182 	rim
                                    183 ;	main.c: 71: OLED_ShowString(0,0,"STM8 Started!");
      00877E 4B 90            [ 1]  184 	push	#<___str_0
      008780 4B 80            [ 1]  185 	push	#(___str_0 >> 8)
      008782 4B 00            [ 1]  186 	push	#0x00
      008784 4B 00            [ 1]  187 	push	#0x00
      008786 CD 92 D6         [ 4]  188 	call	_OLED_ShowString
      008789 5B 04            [ 2]  189 	addw	sp, #4
                                    190 ;	main.c: 72: printf("STM8 Started!\r\n");
      00878B 4B 9E            [ 1]  191 	push	#<___str_2
      00878D 4B 80            [ 1]  192 	push	#(___str_2 >> 8)
      00878F CD A3 28         [ 4]  193 	call	_puts
      008792 5B 02            [ 2]  194 	addw	sp, #2
                                    195 ;	main.c: 74: GPIO_Init(GPIOD, GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_FAST);
      008794 4B E0            [ 1]  196 	push	#0xe0
      008796 4B 80            [ 1]  197 	push	#0x80
      008798 4B 0F            [ 1]  198 	push	#0x0f
      00879A 4B 50            [ 1]  199 	push	#0x50
      00879C CD 94 F0         [ 4]  200 	call	_GPIO_Init
      00879F 5B 04            [ 2]  201 	addw	sp, #4
                                    202 ;	main.c: 75: GPIO_WriteHigh(GPIOD,GPIO_PIN_7);
      0087A1 4B 80            [ 1]  203 	push	#0x80
      0087A3 4B 0F            [ 1]  204 	push	#0x0f
      0087A5 4B 50            [ 1]  205 	push	#0x50
      0087A7 CD 95 6B         [ 4]  206 	call	_GPIO_WriteHigh
      0087AA 5B 03            [ 2]  207 	addw	sp, #3
                                    208 ;	main.c: 76: Delay(0xffff);
      0087AC 4B FF            [ 1]  209 	push	#0xff
      0087AE 4B FF            [ 1]  210 	push	#0xff
      0087B0 CD 87 4B         [ 4]  211 	call	_Delay
      0087B3 5B 02            [ 2]  212 	addw	sp, #2
                                    213 ;	main.c: 77: GPIO_WriteLow(GPIOD,GPIO_PIN_7);
      0087B5 4B 80            [ 1]  214 	push	#0x80
      0087B7 4B 0F            [ 1]  215 	push	#0x0f
      0087B9 4B 50            [ 1]  216 	push	#0x50
      0087BB CD 95 72         [ 4]  217 	call	_GPIO_WriteLow
      0087BE 5B 03            [ 2]  218 	addw	sp, #3
                                    219 ;	main.c: 81: while (1)
      0087C0                        220 00106$:
                                    221 ;	main.c: 85: sprintf(temp,"V:%4d,S:%1d",ReadADC(),GPIO_ReadInputPin(GPIOF,GPIO_PIN_4)==RESET?0:1);
      0087C0 4B 10            [ 1]  222 	push	#0x10
      0087C2 4B 19            [ 1]  223 	push	#0x19
      0087C4 4B 50            [ 1]  224 	push	#0x50
      0087C6 CD 95 90         [ 4]  225 	call	_GPIO_ReadInputPin
      0087C9 5B 03            [ 2]  226 	addw	sp, #3
      0087CB 4D               [ 1]  227 	tnz	a
      0087CC 26 05            [ 1]  228 	jrne	00110$
      0087CE 5F               [ 1]  229 	clrw	x
      0087CF 1F 31            [ 2]  230 	ldw	(0x31, sp), x
      0087D1 20 05            [ 2]  231 	jra	00111$
      0087D3                        232 00110$:
      0087D3 AE 00 01         [ 2]  233 	ldw	x, #0x0001
      0087D6 1F 31            [ 2]  234 	ldw	(0x31, sp), x
      0087D8                        235 00111$:
      0087D8 CD 94 8F         [ 4]  236 	call	_ReadADC
      0087DB 90 96            [ 1]  237 	ldw	y, sp
      0087DD 72 A9 00 10      [ 2]  238 	addw	y, #16
      0087E1 17 27            [ 2]  239 	ldw	(0x27, sp), y
      0087E3 7B 32            [ 1]  240 	ld	a, (0x32, sp)
      0087E5 88               [ 1]  241 	push	a
      0087E6 7B 32            [ 1]  242 	ld	a, (0x32, sp)
      0087E8 88               [ 1]  243 	push	a
      0087E9 89               [ 2]  244 	pushw	x
      0087EA 4B AD            [ 1]  245 	push	#<___str_3
      0087EC 4B 80            [ 1]  246 	push	#(___str_3 >> 8)
      0087EE 90 89            [ 2]  247 	pushw	y
      0087F0 CD A2 AE         [ 4]  248 	call	_sprintf
      0087F3 5B 08            [ 2]  249 	addw	sp, #8
                                    250 ;	main.c: 86: printf("%s",temp);
      0087F5 1E 27            [ 2]  251 	ldw	x, (0x27, sp)
      0087F7 89               [ 2]  252 	pushw	x
      0087F8 4B B9            [ 1]  253 	push	#<___str_4
      0087FA 4B 80            [ 1]  254 	push	#(___str_4 >> 8)
      0087FC CD A3 69         [ 4]  255 	call	_printf
      0087FF 5B 04            [ 2]  256 	addw	sp, #4
                                    257 ;	main.c: 87: printf("\r\n");
      008801 4B BC            [ 1]  258 	push	#<___str_6
      008803 4B 80            [ 1]  259 	push	#(___str_6 >> 8)
      008805 CD A3 28         [ 4]  260 	call	_puts
      008808 5B 02            [ 2]  261 	addw	sp, #2
                                    262 ;	main.c: 88: OLED_ShowString(0,2,temp);
      00880A 1E 27            [ 2]  263 	ldw	x, (0x27, sp)
      00880C 89               [ 2]  264 	pushw	x
      00880D 4B 02            [ 1]  265 	push	#0x02
      00880F 4B 00            [ 1]  266 	push	#0x00
      008811 CD 92 D6         [ 4]  267 	call	_OLED_ShowString
      008814 5B 04            [ 2]  268 	addw	sp, #4
                                    269 ;	main.c: 91: ds1302_port_init();
      008816 CD 8D 65         [ 4]  270 	call	_ds1302_port_init
                                    271 ;	main.c: 92: if(ds1302_check())
      008819 CD 8E C2         [ 4]  272 	call	_ds1302_check
      00881C 6B 22            [ 1]  273 	ld	(0x22, sp), a
      00881E 26 03            [ 1]  274 	jrne	00133$
      008820 CC 88 FD         [ 2]  275 	jp	00102$
      008823                        276 00133$:
                                    277 ;	main.c: 96: ds1302_read_time(&ds_time);
      008823 96               [ 1]  278 	ldw	x, sp
      008824 1C 00 09         [ 2]  279 	addw	x, #9
      008827 1F 2D            [ 2]  280 	ldw	(0x2d, sp), x
      008829 89               [ 2]  281 	pushw	x
      00882A CD 8E DA         [ 4]  282 	call	_ds1302_read_time
      00882D 5B 02            [ 2]  283 	addw	sp, #2
                                    284 ;	main.c: 97: sprintf(temp,"%2d/%2d/%2d",ds_time.hour/16*10+ds_time.hour%16,ds_time.minute/16*10+ds_time.minute%16,ds_time.second/16*10+ds_time.second%16);
      00882F 1E 2D            [ 2]  285 	ldw	x, (0x2d, sp)
      008831 E6 06            [ 1]  286 	ld	a, (0x6, x)
      008833 6B 30            [ 1]  287 	ld	(0x30, sp), a
      008835 0F 2F            [ 1]  288 	clr	(0x2f, sp)
      008837 4B 10            [ 1]  289 	push	#0x10
      008839 4B 00            [ 1]  290 	push	#0x00
      00883B 1E 31            [ 2]  291 	ldw	x, (0x31, sp)
      00883D 89               [ 2]  292 	pushw	x
      00883E CD A4 11         [ 4]  293 	call	__divsint
      008841 5B 04            [ 2]  294 	addw	sp, #4
      008843 89               [ 2]  295 	pushw	x
      008844 58               [ 2]  296 	sllw	x
      008845 58               [ 2]  297 	sllw	x
      008846 72 FB 01         [ 2]  298 	addw	x, (1, sp)
      008849 58               [ 2]  299 	sllw	x
      00884A 5B 02            [ 2]  300 	addw	sp, #2
      00884C 1F 39            [ 2]  301 	ldw	(0x39, sp), x
      00884E 4B 10            [ 1]  302 	push	#0x10
      008850 4B 00            [ 1]  303 	push	#0x00
      008852 1E 31            [ 2]  304 	ldw	x, (0x31, sp)
      008854 89               [ 2]  305 	pushw	x
      008855 CD A3 FB         [ 4]  306 	call	__modsint
      008858 5B 04            [ 2]  307 	addw	sp, #4
      00885A 72 FB 39         [ 2]  308 	addw	x, (0x39, sp)
      00885D 1F 29            [ 2]  309 	ldw	(0x29, sp), x
      00885F 1E 2D            [ 2]  310 	ldw	x, (0x2d, sp)
      008861 E6 05            [ 1]  311 	ld	a, (0x5, x)
      008863 6B 2C            [ 1]  312 	ld	(0x2c, sp), a
      008865 0F 2B            [ 1]  313 	clr	(0x2b, sp)
      008867 4B 10            [ 1]  314 	push	#0x10
      008869 4B 00            [ 1]  315 	push	#0x00
      00886B 1E 2D            [ 2]  316 	ldw	x, (0x2d, sp)
      00886D 89               [ 2]  317 	pushw	x
      00886E CD A4 11         [ 4]  318 	call	__divsint
      008871 5B 04            [ 2]  319 	addw	sp, #4
      008873 89               [ 2]  320 	pushw	x
      008874 58               [ 2]  321 	sllw	x
      008875 58               [ 2]  322 	sllw	x
      008876 72 FB 01         [ 2]  323 	addw	x, (1, sp)
      008879 58               [ 2]  324 	sllw	x
      00887A 5B 02            [ 2]  325 	addw	sp, #2
      00887C 1F 1A            [ 2]  326 	ldw	(0x1a, sp), x
      00887E 4B 10            [ 1]  327 	push	#0x10
      008880 4B 00            [ 1]  328 	push	#0x00
      008882 1E 2D            [ 2]  329 	ldw	x, (0x2d, sp)
      008884 89               [ 2]  330 	pushw	x
      008885 CD A3 FB         [ 4]  331 	call	__modsint
      008888 5B 04            [ 2]  332 	addw	sp, #4
      00888A 72 FB 1A         [ 2]  333 	addw	x, (0x1a, sp)
      00888D 1F 23            [ 2]  334 	ldw	(0x23, sp), x
      00888F 1E 2D            [ 2]  335 	ldw	x, (0x2d, sp)
      008891 E6 04            [ 1]  336 	ld	a, (0x4, x)
      008893 6B 26            [ 1]  337 	ld	(0x26, sp), a
      008895 0F 25            [ 1]  338 	clr	(0x25, sp)
      008897 4B 10            [ 1]  339 	push	#0x10
      008899 4B 00            [ 1]  340 	push	#0x00
      00889B 1E 27            [ 2]  341 	ldw	x, (0x27, sp)
      00889D 89               [ 2]  342 	pushw	x
      00889E CD A4 11         [ 4]  343 	call	__divsint
      0088A1 5B 04            [ 2]  344 	addw	sp, #4
      0088A3 89               [ 2]  345 	pushw	x
      0088A4 58               [ 2]  346 	sllw	x
      0088A5 58               [ 2]  347 	sllw	x
      0088A6 72 FB 01         [ 2]  348 	addw	x, (1, sp)
      0088A9 58               [ 2]  349 	sllw	x
      0088AA 5B 02            [ 2]  350 	addw	sp, #2
      0088AC 1F 3D            [ 2]  351 	ldw	(0x3d, sp), x
      0088AE 4B 10            [ 1]  352 	push	#0x10
      0088B0 4B 00            [ 1]  353 	push	#0x00
      0088B2 1E 27            [ 2]  354 	ldw	x, (0x27, sp)
      0088B4 89               [ 2]  355 	pushw	x
      0088B5 CD A3 FB         [ 4]  356 	call	__modsint
      0088B8 5B 04            [ 2]  357 	addw	sp, #4
      0088BA 72 FB 3D         [ 2]  358 	addw	x, (0x3d, sp)
      0088BD 51               [ 1]  359 	exgw	x, y
      0088BE 96               [ 1]  360 	ldw	x, sp
      0088BF 1C 00 10         [ 2]  361 	addw	x, #16
      0088C2 1F 3B            [ 2]  362 	ldw	(0x3b, sp), x
      0088C4 7B 2A            [ 1]  363 	ld	a, (0x2a, sp)
      0088C6 88               [ 1]  364 	push	a
      0088C7 7B 2A            [ 1]  365 	ld	a, (0x2a, sp)
      0088C9 88               [ 1]  366 	push	a
      0088CA 7B 26            [ 1]  367 	ld	a, (0x26, sp)
      0088CC 88               [ 1]  368 	push	a
      0088CD 7B 26            [ 1]  369 	ld	a, (0x26, sp)
      0088CF 88               [ 1]  370 	push	a
      0088D0 90 89            [ 2]  371 	pushw	y
      0088D2 4B BE            [ 1]  372 	push	#<___str_7
      0088D4 4B 80            [ 1]  373 	push	#(___str_7 >> 8)
      0088D6 89               [ 2]  374 	pushw	x
      0088D7 CD A2 AE         [ 4]  375 	call	_sprintf
      0088DA 5B 0A            [ 2]  376 	addw	sp, #10
                                    377 ;	main.c: 98: printf("%s",temp);
      0088DC 1E 3B            [ 2]  378 	ldw	x, (0x3b, sp)
      0088DE 89               [ 2]  379 	pushw	x
      0088DF 4B B9            [ 1]  380 	push	#<___str_4
      0088E1 4B 80            [ 1]  381 	push	#(___str_4 >> 8)
      0088E3 CD A3 69         [ 4]  382 	call	_printf
      0088E6 5B 04            [ 2]  383 	addw	sp, #4
                                    384 ;	main.c: 99: printf("\r\n");
      0088E8 4B BC            [ 1]  385 	push	#<___str_6
      0088EA 4B 80            [ 1]  386 	push	#(___str_6 >> 8)
      0088EC CD A3 28         [ 4]  387 	call	_puts
      0088EF 5B 02            [ 2]  388 	addw	sp, #2
                                    389 ;	main.c: 100: OLED_ShowString(0,4,temp);
      0088F1 1E 3B            [ 2]  390 	ldw	x, (0x3b, sp)
      0088F3 89               [ 2]  391 	pushw	x
      0088F4 4B 04            [ 1]  392 	push	#0x04
      0088F6 4B 00            [ 1]  393 	push	#0x00
      0088F8 CD 92 D6         [ 4]  394 	call	_OLED_ShowString
      0088FB 5B 04            [ 2]  395 	addw	sp, #4
      0088FD                        396 00102$:
                                    397 ;	main.c: 102: ds1302_port_deinit();
      0088FD CD 8D 3D         [ 4]  398 	call	_ds1302_port_deinit
                                    399 ;	main.c: 107: if(count>=2)
      008900 C6 00 01         [ 1]  400 	ld	a, _main_count_196608_389+0
      008903 A1 02            [ 1]  401 	cp	a, #0x02
      008905 24 03            [ 1]  402 	jrnc	00134$
      008907 CC 89 81         [ 2]  403 	jp	00104$
      00890A                        404 00134$:
                                    405 ;	main.c: 111: ReadDHT12(&data);
      00890A 90 96            [ 1]  406 	ldw	y, sp
      00890C 72 A9 00 15      [ 2]  407 	addw	y, #21
      008910 93               [ 1]  408 	ldw	x, y
      008911 90 89            [ 2]  409 	pushw	y
      008913 89               [ 2]  410 	pushw	x
      008914 CD 8C 62         [ 4]  411 	call	_ReadDHT12
      008917 5B 02            [ 2]  412 	addw	sp, #2
      008919 90 85            [ 2]  413 	popw	y
                                    414 ;	main.c: 112: sprintf(temp,"%2d.%1dC/%2d.%1d%%/%3d",data.T,data.T1,data.W,data.W1,data.sum);
      00891B 93               [ 1]  415 	ldw	x, y
      00891C E6 04            [ 1]  416 	ld	a, (0x4, x)
      00891E 6B 21            [ 1]  417 	ld	(0x21, sp), a
      008920 0F 20            [ 1]  418 	clr	(0x20, sp)
      008922 93               [ 1]  419 	ldw	x, y
      008923 E6 03            [ 1]  420 	ld	a, (0x3, x)
      008925 6B 1F            [ 1]  421 	ld	(0x1f, sp), a
      008927 0F 1E            [ 1]  422 	clr	(0x1e, sp)
      008929 93               [ 1]  423 	ldw	x, y
      00892A E6 02            [ 1]  424 	ld	a, (0x2, x)
      00892C 6B 1D            [ 1]  425 	ld	(0x1d, sp), a
      00892E 0F 1C            [ 1]  426 	clr	(0x1c, sp)
      008930 93               [ 1]  427 	ldw	x, y
      008931 E6 01            [ 1]  428 	ld	a, (0x1, x)
      008933 6B 38            [ 1]  429 	ld	(0x38, sp), a
      008935 0F 37            [ 1]  430 	clr	(0x37, sp)
      008937 90 F6            [ 1]  431 	ld	a, (y)
      008939 0F 35            [ 1]  432 	clr	(0x35, sp)
      00893B 96               [ 1]  433 	ldw	x, sp
      00893C 5C               [ 1]  434 	incw	x
      00893D 1F 33            [ 2]  435 	ldw	(0x33, sp), x
      00893F 90 93            [ 1]  436 	ldw	y, x
      008941 1E 20            [ 2]  437 	ldw	x, (0x20, sp)
      008943 89               [ 2]  438 	pushw	x
      008944 1E 20            [ 2]  439 	ldw	x, (0x20, sp)
      008946 89               [ 2]  440 	pushw	x
      008947 1E 20            [ 2]  441 	ldw	x, (0x20, sp)
      008949 89               [ 2]  442 	pushw	x
      00894A 1E 3D            [ 2]  443 	ldw	x, (0x3d, sp)
      00894C 89               [ 2]  444 	pushw	x
      00894D 88               [ 1]  445 	push	a
      00894E 7B 3E            [ 1]  446 	ld	a, (0x3e, sp)
      008950 88               [ 1]  447 	push	a
      008951 4B CA            [ 1]  448 	push	#<___str_9
      008953 4B 80            [ 1]  449 	push	#(___str_9 >> 8)
      008955 90 89            [ 2]  450 	pushw	y
      008957 CD A2 AE         [ 4]  451 	call	_sprintf
      00895A 5B 0E            [ 2]  452 	addw	sp, #14
                                    453 ;	main.c: 113: printf("%s",temp);
      00895C 1E 33            [ 2]  454 	ldw	x, (0x33, sp)
      00895E 89               [ 2]  455 	pushw	x
      00895F 4B B9            [ 1]  456 	push	#<___str_4
      008961 4B 80            [ 1]  457 	push	#(___str_4 >> 8)
      008963 CD A3 69         [ 4]  458 	call	_printf
      008966 5B 04            [ 2]  459 	addw	sp, #4
                                    460 ;	main.c: 114: printf("\r\n");
      008968 4B BC            [ 1]  461 	push	#<___str_6
      00896A 4B 80            [ 1]  462 	push	#(___str_6 >> 8)
      00896C CD A3 28         [ 4]  463 	call	_puts
      00896F 5B 02            [ 2]  464 	addw	sp, #2
                                    465 ;	main.c: 115: OLED_ShowString(0,6,temp);
      008971 1E 33            [ 2]  466 	ldw	x, (0x33, sp)
      008973 89               [ 2]  467 	pushw	x
      008974 4B 06            [ 1]  468 	push	#0x06
      008976 4B 00            [ 1]  469 	push	#0x00
      008978 CD 92 D6         [ 4]  470 	call	_OLED_ShowString
      00897B 5B 04            [ 2]  471 	addw	sp, #4
                                    472 ;	main.c: 116: count=0;
      00897D 72 5F 00 01      [ 1]  473 	clr	_main_count_196608_389+0
      008981                        474 00104$:
                                    475 ;	main.c: 119: count++;
      008981 72 5C 00 01      [ 1]  476 	inc	_main_count_196608_389+0
                                    477 ;	main.c: 121: GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
      008985 4B 20            [ 1]  478 	push	#0x20
      008987 4B 14            [ 1]  479 	push	#0x14
      008989 4B 50            [ 1]  480 	push	#0x50
      00898B CD 95 80         [ 4]  481 	call	_GPIO_WriteReverse
      00898E 5B 03            [ 2]  482 	addw	sp, #3
                                    483 ;	main.c: 122: Delay(0xffff);
      008990 4B FF            [ 1]  484 	push	#0xff
      008992 4B FF            [ 1]  485 	push	#0xff
      008994 CD 87 4B         [ 4]  486 	call	_Delay
      008997 5B 02            [ 2]  487 	addw	sp, #2
                                    488 ;	main.c: 125: }
      008999 CC 87 C0         [ 2]  489 	jp	00106$
                                    490 	.area CODE
                                    491 	.area CONST
      008090                        492 ___str_0:
      008090 53 54 4D 38 20 53 74   493 	.ascii "STM8 Started!"
             61 72 74 65 64 21
      00809D 00                     494 	.db 0x00
      00809E                        495 ___str_2:
      00809E 53 54 4D 38 20 53 74   496 	.ascii "STM8 Started!"
             61 72 74 65 64 21
      0080AB 0D                     497 	.db 0x0d
      0080AC 00                     498 	.db 0x00
      0080AD                        499 ___str_3:
      0080AD 56 3A 25 34 64 2C 53   500 	.ascii "V:%4d,S:%1d"
             3A 25 31 64
      0080B8 00                     501 	.db 0x00
      0080B9                        502 ___str_4:
      0080B9 25 73                  503 	.ascii "%s"
      0080BB 00                     504 	.db 0x00
      0080BC                        505 ___str_6:
      0080BC 0D                     506 	.db 0x0d
      0080BD 00                     507 	.db 0x00
      0080BE                        508 ___str_7:
      0080BE 25 32 64 2F 25 32 64   509 	.ascii "%2d/%2d/%2d"
             2F 25 32 64
      0080C9 00                     510 	.db 0x00
      0080CA                        511 ___str_9:
      0080CA 25 32 64 2E 25 31 64   512 	.ascii "%2d.%1dC/%2d.%1d%%/%3d"
             43 2F 25 32 64 2E 25
             31 64 25 25 2F 25 33
             64
      0080E0 00                     513 	.db 0x00
                                    514 	.area INITIALIZER
                                    515 	.area CABS (ABS)
