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
                                     16 	.globl _eeprom_read
                                     17 	.globl _ReadADC
                                     18 	.globl _key_init
                                     19 	.globl _ReadDHT12
                                     20 	.globl _ds1302_read_time
                                     21 	.globl _ds1302_check
                                     22 	.globl _ds1302_port_init
                                     23 	.globl _ds1302_port_deinit
                                     24 	.globl _ds1302_active
                                     25 	.globl _Init_UART2
                                     26 	.globl _OLED_ShowString
                                     27 	.globl _OLED_Clear
                                     28 	.globl _OLED_Init
                                     29 	.globl _GPIO_ReadInputPin
                                     30 	.globl _GPIO_WriteReverse
                                     31 	.globl _GPIO_WriteLow
                                     32 	.globl _GPIO_WriteHigh
                                     33 	.globl _GPIO_Init
                                     34 ;--------------------------------------------------------
                                     35 ; ram data
                                     36 ;--------------------------------------------------------
                                     37 	.area DATA
      000001                         38 _main_count_196608_392:
      000001                         39 	.ds 1
                                     40 ;--------------------------------------------------------
                                     41 ; ram data
                                     42 ;--------------------------------------------------------
                                     43 	.area INITIALIZED
                                     44 ;--------------------------------------------------------
                                     45 ; Stack segment in internal ram 
                                     46 ;--------------------------------------------------------
                                     47 	.area	SSEG
      FFFFFF                         48 __start__stack:
      FFFFFF                         49 	.ds	1
                                     50 
                                     51 ;--------------------------------------------------------
                                     52 ; absolute external ram data
                                     53 ;--------------------------------------------------------
                                     54 	.area DABS (ABS)
                                     55 
                                     56 ; default segment ordering for linker
                                     57 	.area HOME
                                     58 	.area GSINIT
                                     59 	.area GSFINAL
                                     60 	.area CONST
                                     61 	.area INITIALIZER
                                     62 	.area CODE
                                     63 
                                     64 ;--------------------------------------------------------
                                     65 ; interrupt vector 
                                     66 ;--------------------------------------------------------
                                     67 	.area HOME
      008000                         68 __interrupt_vect:
      008000 82 00 80 6F             69 	int s_GSINIT ; reset
      008004 82 00 86 FC             70 	int _TRAP_IRQHandler ; trap
      008008 82 00 86 FD             71 	int _TLI_IRQHandler ; int0
      00800C 82 00 86 FE             72 	int _AWU_IRQHandler ; int1
      008010 82 00 86 FF             73 	int _CLK_IRQHandler ; int2
      008014 82 00 87 00             74 	int _EXTI_PORTA_IRQHandler ; int3
      008018 82 00 87 01             75 	int _EXTI_PORTB_IRQHandler ; int4
      00801C 82 00 87 02             76 	int _EXTI_PORTC_IRQHandler ; int5
      008020 82 00 87 03             77 	int _EXTI_PORTD_IRQHandler ; int6
      008024 82 00 87 30             78 	int _EXTI_PORTE_IRQHandler ; int7
      008028 82 00 00 00             79 	int 0x000000 ; int8
      00802C 82 00 00 00             80 	int 0x000000 ; int9
      008030 82 00 87 31             81 	int _SPI_IRQHandler ; int10
      008034 82 00 87 32             82 	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
      008038 82 00 87 33             83 	int _TIM1_CAP_COM_IRQHandler ; int12
      00803C 82 00 87 34             84 	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
      008040 82 00 87 35             85 	int _TIM2_CAP_COM_IRQHandler ; int14
      008044 82 00 00 00             86 	int 0x000000 ; int15
      008048 82 00 00 00             87 	int 0x000000 ; int16
      00804C 82 00 00 00             88 	int 0x000000 ; int17
      008050 82 00 00 00             89 	int 0x000000 ; int18
      008054 82 00 87 38             90 	int _I2C_IRQHandler ; int19
      008058 82 00 87 39             91 	int _UART2_TX_IRQHandler ; int20
      00805C 82 00 87 3A             92 	int _UART2_RX_IRQHandler ; int21
      008060 82 00 87 90             93 	int _ADC1_IRQHandler ; int22
      008064 82 00 87 91             94 	int _TIM4_UPD_OVF_IRQHandler ; int23
      008068 82 00 87 92             95 	int _EEPROM_EEC_IRQHandler ; int24
                                     96 ;--------------------------------------------------------
                                     97 ; global & static initialisations
                                     98 ;--------------------------------------------------------
                                     99 	.area HOME
                                    100 	.area GSINIT
                                    101 	.area GSFINAL
                                    102 	.area GSINIT
      00806F                        103 __sdcc_gs_init_startup:
      00806F                        104 __sdcc_init_data:
                                    105 ; stm8_genXINIT() start
      00806F AE 00 06         [ 2]  106 	ldw x, #l_DATA
      008072 27 07            [ 1]  107 	jreq	00002$
      008074                        108 00001$:
      008074 72 4F 00 00      [ 1]  109 	clr (s_DATA - 1, x)
      008078 5A               [ 2]  110 	decw x
      008079 26 F9            [ 1]  111 	jrne	00001$
      00807B                        112 00002$:
      00807B AE 00 05         [ 2]  113 	ldw	x, #l_INITIALIZER
      00807E 27 09            [ 1]  114 	jreq	00004$
      008080                        115 00003$:
      008080 D6 86 F6         [ 1]  116 	ld	a, (s_INITIALIZER - 1, x)
      008083 D7 00 06         [ 1]  117 	ld	(s_INITIALIZED - 1, x), a
      008086 5A               [ 2]  118 	decw	x
      008087 26 F7            [ 1]  119 	jrne	00003$
      008089                        120 00004$:
                                    121 ; stm8_genXINIT() end
                                    122 ;	main.c: 109: static u8 count=0;
      008089 72 5F 00 01      [ 1]  123 	clr	_main_count_196608_392+0
                                    124 	.area GSFINAL
      00808D CC 80 6C         [ 2]  125 	jp	__sdcc_program_startup
                                    126 ;--------------------------------------------------------
                                    127 ; Home
                                    128 ;--------------------------------------------------------
                                    129 	.area HOME
                                    130 	.area HOME
      00806C                        131 __sdcc_program_startup:
      00806C CC 87 9D         [ 2]  132 	jp	_main
                                    133 ;	return from main will return to caller
                                    134 ;--------------------------------------------------------
                                    135 ; code
                                    136 ;--------------------------------------------------------
                                    137 	.area CODE
                                    138 ;	main.c: 49: void Delay(uint16_t nCount)
                                    139 ;	-----------------------------------------
                                    140 ;	 function Delay
                                    141 ;	-----------------------------------------
      008793                        142 _Delay:
                                    143 ;	main.c: 52: while (nCount != 0)
      008793 1E 03            [ 2]  144 	ldw	x, (0x03, sp)
      008795                        145 00101$:
      008795 5D               [ 2]  146 	tnzw	x
      008796 26 01            [ 1]  147 	jrne	00117$
      008798 81               [ 4]  148 	ret
      008799                        149 00117$:
                                    150 ;	main.c: 54: nCount--;
      008799 5A               [ 2]  151 	decw	x
      00879A 20 F9            [ 2]  152 	jra	00101$
                                    153 ;	main.c: 56: }
      00879C 81               [ 4]  154 	ret
                                    155 ;	main.c: 60: void main(void)
                                    156 ;	-----------------------------------------
                                    157 ;	 function main
                                    158 ;	-----------------------------------------
      00879D                        159 _main:
      00879D 52 4C            [ 2]  160 	sub	sp, #76
                                    161 ;	main.c: 64: GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      00879F 4B E0            [ 1]  162 	push	#0xe0
      0087A1 4B 20            [ 1]  163 	push	#0x20
      0087A3 4B 14            [ 1]  164 	push	#0x14
      0087A5 4B 50            [ 1]  165 	push	#0x50
      0087A7 CD 96 7D         [ 4]  166 	call	_GPIO_Init
      0087AA 5B 04            [ 2]  167 	addw	sp, #4
                                    168 ;	main.c: 65: GPIO_Init(GPIOF,GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
      0087AC 4B 00            [ 1]  169 	push	#0x00
      0087AE 4B 10            [ 1]  170 	push	#0x10
      0087B0 4B 19            [ 1]  171 	push	#0x19
      0087B2 4B 50            [ 1]  172 	push	#0x50
      0087B4 CD 96 7D         [ 4]  173 	call	_GPIO_Init
      0087B7 5B 04            [ 2]  174 	addw	sp, #4
                                    175 ;	main.c: 67: Init_UART2();
      0087B9 CD 90 89         [ 4]  176 	call	_Init_UART2
                                    177 ;	main.c: 68: OLED_Init();
      0087BC CD 94 96         [ 4]  178 	call	_OLED_Init
                                    179 ;	main.c: 69: ds1302_active();
      0087BF CD 90 4F         [ 4]  180 	call	_ds1302_active
                                    181 ;	main.c: 70: key_init();
      0087C2 CD 91 65         [ 4]  182 	call	_key_init
                                    183 ;	main.c: 71: OLED_Clear();
      0087C5 CD 92 DE         [ 4]  184 	call	_OLED_Clear
                                    185 ;	main.c: 73: enableInterrupts(); //使能中断
      0087C8 9A               [ 1]  186 	rim
                                    187 ;	main.c: 75: OLED_ShowString(0,0,"STM8 Started!");
      0087C9 4B 90            [ 1]  188 	push	#<___str_0
      0087CB 4B 80            [ 1]  189 	push	#(___str_0 >> 8)
      0087CD 4B 00            [ 1]  190 	push	#0x00
      0087CF 4B 00            [ 1]  191 	push	#0x00
      0087D1 CD 94 63         [ 4]  192 	call	_OLED_ShowString
      0087D4 5B 04            [ 2]  193 	addw	sp, #4
                                    194 ;	main.c: 76: printf("STM8 Started!\r\n");
      0087D6 4B 9E            [ 1]  195 	push	#<___str_2
      0087D8 4B 80            [ 1]  196 	push	#(___str_2 >> 8)
      0087DA CD A8 76         [ 4]  197 	call	_puts
      0087DD 5B 02            [ 2]  198 	addw	sp, #2
                                    199 ;	main.c: 78: GPIO_Init(GPIOD, GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_FAST);
      0087DF 4B E0            [ 1]  200 	push	#0xe0
      0087E1 4B 80            [ 1]  201 	push	#0x80
      0087E3 4B 0F            [ 1]  202 	push	#0x0f
      0087E5 4B 50            [ 1]  203 	push	#0x50
      0087E7 CD 96 7D         [ 4]  204 	call	_GPIO_Init
      0087EA 5B 04            [ 2]  205 	addw	sp, #4
                                    206 ;	main.c: 79: GPIO_WriteHigh(GPIOD,GPIO_PIN_7);
      0087EC 4B 80            [ 1]  207 	push	#0x80
      0087EE 4B 0F            [ 1]  208 	push	#0x0f
      0087F0 4B 50            [ 1]  209 	push	#0x50
      0087F2 CD 96 F8         [ 4]  210 	call	_GPIO_WriteHigh
      0087F5 5B 03            [ 2]  211 	addw	sp, #3
                                    212 ;	main.c: 80: Delay(0xffff);
      0087F7 4B FF            [ 1]  213 	push	#0xff
      0087F9 4B FF            [ 1]  214 	push	#0xff
      0087FB CD 87 93         [ 4]  215 	call	_Delay
      0087FE 5B 02            [ 2]  216 	addw	sp, #2
                                    217 ;	main.c: 81: GPIO_WriteLow(GPIOD,GPIO_PIN_7);
      008800 4B 80            [ 1]  218 	push	#0x80
      008802 4B 0F            [ 1]  219 	push	#0x0f
      008804 4B 50            [ 1]  220 	push	#0x50
      008806 CD 96 FF         [ 4]  221 	call	_GPIO_WriteLow
      008809 5B 03            [ 2]  222 	addw	sp, #3
                                    223 ;	main.c: 85: while (1)
      00880B                        224 00106$:
                                    225 ;	main.c: 89: sprintf(temp,"V:%4d,S:%1d %d",ReadADC(),GPIO_ReadInputPin(GPIOF,GPIO_PIN_4)==RESET?0:1,eeprom_read(10));
      00880B 4B 0A            [ 1]  226 	push	#0x0a
      00880D 5F               [ 1]  227 	clrw	x
      00880E 89               [ 2]  228 	pushw	x
      00880F 4B 00            [ 1]  229 	push	#0x00
      008811 CD 91 09         [ 4]  230 	call	_eeprom_read
      008814 5B 04            [ 2]  231 	addw	sp, #4
      008816 6B 30            [ 1]  232 	ld	(0x30, sp), a
      008818 0F 2F            [ 1]  233 	clr	(0x2f, sp)
      00881A 4B 10            [ 1]  234 	push	#0x10
      00881C 4B 19            [ 1]  235 	push	#0x19
      00881E 4B 50            [ 1]  236 	push	#0x50
      008820 CD 97 1D         [ 4]  237 	call	_GPIO_ReadInputPin
      008823 5B 03            [ 2]  238 	addw	sp, #3
      008825 4D               [ 1]  239 	tnz	a
      008826 26 05            [ 1]  240 	jrne	00110$
      008828 5F               [ 1]  241 	clrw	x
      008829 1F 45            [ 2]  242 	ldw	(0x45, sp), x
      00882B 20 05            [ 2]  243 	jra	00111$
      00882D                        244 00110$:
      00882D AE 00 01         [ 2]  245 	ldw	x, #0x0001
      008830 1F 45            [ 2]  246 	ldw	(0x45, sp), x
      008832                        247 00111$:
      008832 CD 96 1C         [ 4]  248 	call	_ReadADC
      008835 90 96            [ 1]  249 	ldw	y, sp
      008837 72 A9 00 10      [ 2]  250 	addw	y, #16
      00883B 17 2D            [ 2]  251 	ldw	(0x2d, sp), y
      00883D 7B 30            [ 1]  252 	ld	a, (0x30, sp)
      00883F 88               [ 1]  253 	push	a
      008840 7B 30            [ 1]  254 	ld	a, (0x30, sp)
      008842 88               [ 1]  255 	push	a
      008843 7B 48            [ 1]  256 	ld	a, (0x48, sp)
      008845 88               [ 1]  257 	push	a
      008846 7B 48            [ 1]  258 	ld	a, (0x48, sp)
      008848 88               [ 1]  259 	push	a
      008849 89               [ 2]  260 	pushw	x
      00884A 4B AD            [ 1]  261 	push	#<___str_3
      00884C 4B 80            [ 1]  262 	push	#(___str_3 >> 8)
      00884E 90 89            [ 2]  263 	pushw	y
      008850 CD A7 FC         [ 4]  264 	call	_sprintf
      008853 5B 0A            [ 2]  265 	addw	sp, #10
                                    266 ;	main.c: 90: printf("%s",temp);
      008855 1E 2D            [ 2]  267 	ldw	x, (0x2d, sp)
      008857 89               [ 2]  268 	pushw	x
      008858 4B BC            [ 1]  269 	push	#<___str_4
      00885A 4B 80            [ 1]  270 	push	#(___str_4 >> 8)
      00885C CD A8 B7         [ 4]  271 	call	_printf
      00885F 5B 04            [ 2]  272 	addw	sp, #4
                                    273 ;	main.c: 91: printf("\r\n");
      008861 4B BF            [ 1]  274 	push	#<___str_6
      008863 4B 80            [ 1]  275 	push	#(___str_6 >> 8)
      008865 CD A8 76         [ 4]  276 	call	_puts
      008868 5B 02            [ 2]  277 	addw	sp, #2
                                    278 ;	main.c: 92: OLED_ShowString(0,2,temp);
      00886A 1E 2D            [ 2]  279 	ldw	x, (0x2d, sp)
      00886C 89               [ 2]  280 	pushw	x
      00886D 4B 02            [ 1]  281 	push	#0x02
      00886F 4B 00            [ 1]  282 	push	#0x00
      008871 CD 94 63         [ 4]  283 	call	_OLED_ShowString
      008874 5B 04            [ 2]  284 	addw	sp, #4
                                    285 ;	main.c: 95: ds1302_port_init();
      008876 CD 8D AD         [ 4]  286 	call	_ds1302_port_init
                                    287 ;	main.c: 96: if(ds1302_check())
      008879 CD 8F 0A         [ 4]  288 	call	_ds1302_check
      00887C 6B 2A            [ 1]  289 	ld	(0x2a, sp), a
      00887E 26 03            [ 1]  290 	jrne	00133$
      008880 CC 89 5D         [ 2]  291 	jp	00102$
      008883                        292 00133$:
                                    293 ;	main.c: 100: ds1302_read_time(&ds_time);
      008883 96               [ 1]  294 	ldw	x, sp
      008884 1C 00 09         [ 2]  295 	addw	x, #9
      008887 1F 3B            [ 2]  296 	ldw	(0x3b, sp), x
      008889 89               [ 2]  297 	pushw	x
      00888A CD 8F 22         [ 4]  298 	call	_ds1302_read_time
      00888D 5B 02            [ 2]  299 	addw	sp, #2
                                    300 ;	main.c: 101: sprintf(temp,"%2d/%2d/%2d",ds_time.hour/16*10+ds_time.hour%16,ds_time.minute/16*10+ds_time.minute%16,ds_time.second/16*10+ds_time.second%16);
      00888F 1E 3B            [ 2]  301 	ldw	x, (0x3b, sp)
      008891 E6 06            [ 1]  302 	ld	a, (0x6, x)
      008893 6B 2C            [ 1]  303 	ld	(0x2c, sp), a
      008895 0F 2B            [ 1]  304 	clr	(0x2b, sp)
      008897 4B 10            [ 1]  305 	push	#0x10
      008899 4B 00            [ 1]  306 	push	#0x00
      00889B 1E 2D            [ 2]  307 	ldw	x, (0x2d, sp)
      00889D 89               [ 2]  308 	pushw	x
      00889E CD A9 5F         [ 4]  309 	call	__divsint
      0088A1 5B 04            [ 2]  310 	addw	sp, #4
      0088A3 89               [ 2]  311 	pushw	x
      0088A4 58               [ 2]  312 	sllw	x
      0088A5 58               [ 2]  313 	sllw	x
      0088A6 72 FB 01         [ 2]  314 	addw	x, (1, sp)
      0088A9 58               [ 2]  315 	sllw	x
      0088AA 5B 02            [ 2]  316 	addw	sp, #2
      0088AC 1F 1E            [ 2]  317 	ldw	(0x1e, sp), x
      0088AE 4B 10            [ 1]  318 	push	#0x10
      0088B0 4B 00            [ 1]  319 	push	#0x00
      0088B2 1E 2D            [ 2]  320 	ldw	x, (0x2d, sp)
      0088B4 89               [ 2]  321 	pushw	x
      0088B5 CD A9 49         [ 4]  322 	call	__modsint
      0088B8 5B 04            [ 2]  323 	addw	sp, #4
      0088BA 72 FB 1E         [ 2]  324 	addw	x, (0x1e, sp)
      0088BD 1F 1A            [ 2]  325 	ldw	(0x1a, sp), x
      0088BF 1E 3B            [ 2]  326 	ldw	x, (0x3b, sp)
      0088C1 E6 05            [ 1]  327 	ld	a, (0x5, x)
      0088C3 6B 29            [ 1]  328 	ld	(0x29, sp), a
      0088C5 0F 28            [ 1]  329 	clr	(0x28, sp)
      0088C7 4B 10            [ 1]  330 	push	#0x10
      0088C9 4B 00            [ 1]  331 	push	#0x00
      0088CB 1E 2A            [ 2]  332 	ldw	x, (0x2a, sp)
      0088CD 89               [ 2]  333 	pushw	x
      0088CE CD A9 5F         [ 4]  334 	call	__divsint
      0088D1 5B 04            [ 2]  335 	addw	sp, #4
      0088D3 89               [ 2]  336 	pushw	x
      0088D4 58               [ 2]  337 	sllw	x
      0088D5 58               [ 2]  338 	sllw	x
      0088D6 72 FB 01         [ 2]  339 	addw	x, (1, sp)
      0088D9 58               [ 2]  340 	sllw	x
      0088DA 5B 02            [ 2]  341 	addw	sp, #2
      0088DC 1F 22            [ 2]  342 	ldw	(0x22, sp), x
      0088DE 4B 10            [ 1]  343 	push	#0x10
      0088E0 4B 00            [ 1]  344 	push	#0x00
      0088E2 1E 2A            [ 2]  345 	ldw	x, (0x2a, sp)
      0088E4 89               [ 2]  346 	pushw	x
      0088E5 CD A9 49         [ 4]  347 	call	__modsint
      0088E8 5B 04            [ 2]  348 	addw	sp, #4
      0088EA 72 FB 22         [ 2]  349 	addw	x, (0x22, sp)
      0088ED 1F 20            [ 2]  350 	ldw	(0x20, sp), x
      0088EF 1E 3B            [ 2]  351 	ldw	x, (0x3b, sp)
      0088F1 E6 04            [ 1]  352 	ld	a, (0x4, x)
      0088F3 6B 44            [ 1]  353 	ld	(0x44, sp), a
      0088F5 0F 43            [ 1]  354 	clr	(0x43, sp)
      0088F7 4B 10            [ 1]  355 	push	#0x10
      0088F9 4B 00            [ 1]  356 	push	#0x00
      0088FB 1E 45            [ 2]  357 	ldw	x, (0x45, sp)
      0088FD 89               [ 2]  358 	pushw	x
      0088FE CD A9 5F         [ 4]  359 	call	__divsint
      008901 5B 04            [ 2]  360 	addw	sp, #4
      008903 89               [ 2]  361 	pushw	x
      008904 58               [ 2]  362 	sllw	x
      008905 58               [ 2]  363 	sllw	x
      008906 72 FB 01         [ 2]  364 	addw	x, (1, sp)
      008909 58               [ 2]  365 	sllw	x
      00890A 5B 02            [ 2]  366 	addw	sp, #2
      00890C 1F 26            [ 2]  367 	ldw	(0x26, sp), x
      00890E 4B 10            [ 1]  368 	push	#0x10
      008910 4B 00            [ 1]  369 	push	#0x00
      008912 1E 45            [ 2]  370 	ldw	x, (0x45, sp)
      008914 89               [ 2]  371 	pushw	x
      008915 CD A9 49         [ 4]  372 	call	__modsint
      008918 5B 04            [ 2]  373 	addw	sp, #4
      00891A 72 FB 26         [ 2]  374 	addw	x, (0x26, sp)
      00891D 51               [ 1]  375 	exgw	x, y
      00891E 96               [ 1]  376 	ldw	x, sp
      00891F 1C 00 10         [ 2]  377 	addw	x, #16
      008922 1F 24            [ 2]  378 	ldw	(0x24, sp), x
      008924 7B 1B            [ 1]  379 	ld	a, (0x1b, sp)
      008926 88               [ 1]  380 	push	a
      008927 7B 1B            [ 1]  381 	ld	a, (0x1b, sp)
      008929 88               [ 1]  382 	push	a
      00892A 7B 23            [ 1]  383 	ld	a, (0x23, sp)
      00892C 88               [ 1]  384 	push	a
      00892D 7B 23            [ 1]  385 	ld	a, (0x23, sp)
      00892F 88               [ 1]  386 	push	a
      008930 90 89            [ 2]  387 	pushw	y
      008932 4B C1            [ 1]  388 	push	#<___str_7
      008934 4B 80            [ 1]  389 	push	#(___str_7 >> 8)
      008936 89               [ 2]  390 	pushw	x
      008937 CD A7 FC         [ 4]  391 	call	_sprintf
      00893A 5B 0A            [ 2]  392 	addw	sp, #10
                                    393 ;	main.c: 102: printf("%s",temp);
      00893C 1E 24            [ 2]  394 	ldw	x, (0x24, sp)
      00893E 89               [ 2]  395 	pushw	x
      00893F 4B BC            [ 1]  396 	push	#<___str_4
      008941 4B 80            [ 1]  397 	push	#(___str_4 >> 8)
      008943 CD A8 B7         [ 4]  398 	call	_printf
      008946 5B 04            [ 2]  399 	addw	sp, #4
                                    400 ;	main.c: 103: printf("\r\n");
      008948 4B BF            [ 1]  401 	push	#<___str_6
      00894A 4B 80            [ 1]  402 	push	#(___str_6 >> 8)
      00894C CD A8 76         [ 4]  403 	call	_puts
      00894F 5B 02            [ 2]  404 	addw	sp, #2
                                    405 ;	main.c: 104: OLED_ShowString(0,4,temp);
      008951 1E 24            [ 2]  406 	ldw	x, (0x24, sp)
      008953 89               [ 2]  407 	pushw	x
      008954 4B 04            [ 1]  408 	push	#0x04
      008956 4B 00            [ 1]  409 	push	#0x00
      008958 CD 94 63         [ 4]  410 	call	_OLED_ShowString
      00895B 5B 04            [ 2]  411 	addw	sp, #4
      00895D                        412 00102$:
                                    413 ;	main.c: 106: ds1302_port_deinit();
      00895D CD 8D 85         [ 4]  414 	call	_ds1302_port_deinit
                                    415 ;	main.c: 111: if(count>=2)
      008960 C6 00 01         [ 1]  416 	ld	a, _main_count_196608_392+0
      008963 A1 02            [ 1]  417 	cp	a, #0x02
      008965 24 03            [ 1]  418 	jrnc	00134$
      008967 CC 89 E1         [ 2]  419 	jp	00104$
      00896A                        420 00134$:
                                    421 ;	main.c: 115: ReadDHT12(&data);
      00896A 90 96            [ 1]  422 	ldw	y, sp
      00896C 72 A9 00 15      [ 2]  423 	addw	y, #21
      008970 93               [ 1]  424 	ldw	x, y
      008971 90 89            [ 2]  425 	pushw	y
      008973 89               [ 2]  426 	pushw	x
      008974 CD 8D 2A         [ 4]  427 	call	_ReadDHT12
      008977 5B 02            [ 2]  428 	addw	sp, #2
      008979 90 85            [ 2]  429 	popw	y
                                    430 ;	main.c: 116: sprintf(temp,"%2d.%1dC/%2d.%1d%%/%3d",data.T,data.T1,data.W,data.W1,data.sum);
      00897B 93               [ 1]  431 	ldw	x, y
      00897C E6 04            [ 1]  432 	ld	a, (0x4, x)
      00897E 6B 3A            [ 1]  433 	ld	(0x3a, sp), a
      008980 0F 39            [ 1]  434 	clr	(0x39, sp)
      008982 93               [ 1]  435 	ldw	x, y
      008983 E6 03            [ 1]  436 	ld	a, (0x3, x)
      008985 6B 38            [ 1]  437 	ld	(0x38, sp), a
      008987 0F 37            [ 1]  438 	clr	(0x37, sp)
      008989 93               [ 1]  439 	ldw	x, y
      00898A E6 02            [ 1]  440 	ld	a, (0x2, x)
      00898C 6B 36            [ 1]  441 	ld	(0x36, sp), a
      00898E 0F 35            [ 1]  442 	clr	(0x35, sp)
      008990 93               [ 1]  443 	ldw	x, y
      008991 E6 01            [ 1]  444 	ld	a, (0x1, x)
      008993 6B 34            [ 1]  445 	ld	(0x34, sp), a
      008995 0F 33            [ 1]  446 	clr	(0x33, sp)
      008997 90 F6            [ 1]  447 	ld	a, (y)
      008999 0F 31            [ 1]  448 	clr	(0x31, sp)
      00899B 96               [ 1]  449 	ldw	x, sp
      00899C 5C               [ 1]  450 	incw	x
      00899D 1F 1C            [ 2]  451 	ldw	(0x1c, sp), x
      00899F 90 93            [ 1]  452 	ldw	y, x
      0089A1 1E 39            [ 2]  453 	ldw	x, (0x39, sp)
      0089A3 89               [ 2]  454 	pushw	x
      0089A4 1E 39            [ 2]  455 	ldw	x, (0x39, sp)
      0089A6 89               [ 2]  456 	pushw	x
      0089A7 1E 39            [ 2]  457 	ldw	x, (0x39, sp)
      0089A9 89               [ 2]  458 	pushw	x
      0089AA 1E 39            [ 2]  459 	ldw	x, (0x39, sp)
      0089AC 89               [ 2]  460 	pushw	x
      0089AD 88               [ 1]  461 	push	a
      0089AE 7B 3A            [ 1]  462 	ld	a, (0x3a, sp)
      0089B0 88               [ 1]  463 	push	a
      0089B1 4B CD            [ 1]  464 	push	#<___str_9
      0089B3 4B 80            [ 1]  465 	push	#(___str_9 >> 8)
      0089B5 90 89            [ 2]  466 	pushw	y
      0089B7 CD A7 FC         [ 4]  467 	call	_sprintf
      0089BA 5B 0E            [ 2]  468 	addw	sp, #14
                                    469 ;	main.c: 117: printf("%s",temp);
      0089BC 1E 1C            [ 2]  470 	ldw	x, (0x1c, sp)
      0089BE 89               [ 2]  471 	pushw	x
      0089BF 4B BC            [ 1]  472 	push	#<___str_4
      0089C1 4B 80            [ 1]  473 	push	#(___str_4 >> 8)
      0089C3 CD A8 B7         [ 4]  474 	call	_printf
      0089C6 5B 04            [ 2]  475 	addw	sp, #4
                                    476 ;	main.c: 118: printf("\r\n");
      0089C8 4B BF            [ 1]  477 	push	#<___str_6
      0089CA 4B 80            [ 1]  478 	push	#(___str_6 >> 8)
      0089CC CD A8 76         [ 4]  479 	call	_puts
      0089CF 5B 02            [ 2]  480 	addw	sp, #2
                                    481 ;	main.c: 119: OLED_ShowString(0,6,temp);
      0089D1 1E 1C            [ 2]  482 	ldw	x, (0x1c, sp)
      0089D3 89               [ 2]  483 	pushw	x
      0089D4 4B 06            [ 1]  484 	push	#0x06
      0089D6 4B 00            [ 1]  485 	push	#0x00
      0089D8 CD 94 63         [ 4]  486 	call	_OLED_ShowString
      0089DB 5B 04            [ 2]  487 	addw	sp, #4
                                    488 ;	main.c: 120: count=0;
      0089DD 72 5F 00 01      [ 1]  489 	clr	_main_count_196608_392+0
      0089E1                        490 00104$:
                                    491 ;	main.c: 123: count++;
      0089E1 72 5C 00 01      [ 1]  492 	inc	_main_count_196608_392+0
                                    493 ;	main.c: 127: sprintf(temp,"%2d/%2d/%2d/%2d/%2d",keycount[0],keycount[1],keycount[2],keycount[3],keycount[4]);
      0089E5 90 AE 00 07      [ 2]  494 	ldw	y, #_keycount+0
      0089E9 93               [ 1]  495 	ldw	x, y
      0089EA E6 04            [ 1]  496 	ld	a, (0x4, x)
      0089EC 6B 4A            [ 1]  497 	ld	(0x4a, sp), a
      0089EE 0F 49            [ 1]  498 	clr	(0x49, sp)
      0089F0 93               [ 1]  499 	ldw	x, y
      0089F1 E6 03            [ 1]  500 	ld	a, (0x3, x)
      0089F3 6B 3E            [ 1]  501 	ld	(0x3e, sp), a
      0089F5 0F 3D            [ 1]  502 	clr	(0x3d, sp)
      0089F7 93               [ 1]  503 	ldw	x, y
      0089F8 E6 02            [ 1]  504 	ld	a, (0x2, x)
      0089FA 6B 4C            [ 1]  505 	ld	(0x4c, sp), a
      0089FC 0F 4B            [ 1]  506 	clr	(0x4b, sp)
      0089FE 93               [ 1]  507 	ldw	x, y
      0089FF E6 01            [ 1]  508 	ld	a, (0x1, x)
      008A01 6B 42            [ 1]  509 	ld	(0x42, sp), a
      008A03 0F 41            [ 1]  510 	clr	(0x41, sp)
      008A05 90 F6            [ 1]  511 	ld	a, (y)
      008A07 0F 3F            [ 1]  512 	clr	(0x3f, sp)
      008A09 96               [ 1]  513 	ldw	x, sp
      008A0A 1C 00 06         [ 2]  514 	addw	x, #6
      008A0D 1F 47            [ 2]  515 	ldw	(0x47, sp), x
      008A0F 90 93            [ 1]  516 	ldw	y, x
      008A11 1E 49            [ 2]  517 	ldw	x, (0x49, sp)
      008A13 89               [ 2]  518 	pushw	x
      008A14 1E 3F            [ 2]  519 	ldw	x, (0x3f, sp)
      008A16 89               [ 2]  520 	pushw	x
      008A17 1E 4F            [ 2]  521 	ldw	x, (0x4f, sp)
      008A19 89               [ 2]  522 	pushw	x
      008A1A 1E 47            [ 2]  523 	ldw	x, (0x47, sp)
      008A1C 89               [ 2]  524 	pushw	x
      008A1D 88               [ 1]  525 	push	a
      008A1E 7B 48            [ 1]  526 	ld	a, (0x48, sp)
      008A20 88               [ 1]  527 	push	a
      008A21 4B E4            [ 1]  528 	push	#<___str_11
      008A23 4B 80            [ 1]  529 	push	#(___str_11 >> 8)
      008A25 90 89            [ 2]  530 	pushw	y
      008A27 CD A7 FC         [ 4]  531 	call	_sprintf
      008A2A 5B 0E            [ 2]  532 	addw	sp, #14
                                    533 ;	main.c: 128: printf("%s",temp);
      008A2C 1E 47            [ 2]  534 	ldw	x, (0x47, sp)
      008A2E 89               [ 2]  535 	pushw	x
      008A2F 4B BC            [ 1]  536 	push	#<___str_4
      008A31 4B 80            [ 1]  537 	push	#(___str_4 >> 8)
      008A33 CD A8 B7         [ 4]  538 	call	_printf
      008A36 5B 04            [ 2]  539 	addw	sp, #4
                                    540 ;	main.c: 129: printf("\r\n");
      008A38 4B BF            [ 1]  541 	push	#<___str_6
      008A3A 4B 80            [ 1]  542 	push	#(___str_6 >> 8)
      008A3C CD A8 76         [ 4]  543 	call	_puts
      008A3F 5B 02            [ 2]  544 	addw	sp, #2
                                    545 ;	main.c: 130: OLED_ShowString(0,0,temp);
      008A41 1E 47            [ 2]  546 	ldw	x, (0x47, sp)
      008A43 89               [ 2]  547 	pushw	x
      008A44 4B 00            [ 1]  548 	push	#0x00
      008A46 4B 00            [ 1]  549 	push	#0x00
      008A48 CD 94 63         [ 4]  550 	call	_OLED_ShowString
      008A4B 5B 04            [ 2]  551 	addw	sp, #4
                                    552 ;	main.c: 132: GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
      008A4D 4B 20            [ 1]  553 	push	#0x20
      008A4F 4B 14            [ 1]  554 	push	#0x14
      008A51 4B 50            [ 1]  555 	push	#0x50
      008A53 CD 97 0D         [ 4]  556 	call	_GPIO_WriteReverse
      008A56 5B 03            [ 2]  557 	addw	sp, #3
                                    558 ;	main.c: 133: Delay(0xffff);
      008A58 4B FF            [ 1]  559 	push	#0xff
      008A5A 4B FF            [ 1]  560 	push	#0xff
      008A5C CD 87 93         [ 4]  561 	call	_Delay
      008A5F 5B 02            [ 2]  562 	addw	sp, #2
                                    563 ;	main.c: 136: }
      008A61 CC 88 0B         [ 2]  564 	jp	00106$
                                    565 	.area CODE
                                    566 	.area CONST
      008090                        567 ___str_0:
      008090 53 54 4D 38 20 53 74   568 	.ascii "STM8 Started!"
             61 72 74 65 64 21
      00809D 00                     569 	.db 0x00
      00809E                        570 ___str_2:
      00809E 53 54 4D 38 20 53 74   571 	.ascii "STM8 Started!"
             61 72 74 65 64 21
      0080AB 0D                     572 	.db 0x0d
      0080AC 00                     573 	.db 0x00
      0080AD                        574 ___str_3:
      0080AD 56 3A 25 34 64 2C 53   575 	.ascii "V:%4d,S:%1d %d"
             3A 25 31 64 20 25 64
      0080BB 00                     576 	.db 0x00
      0080BC                        577 ___str_4:
      0080BC 25 73                  578 	.ascii "%s"
      0080BE 00                     579 	.db 0x00
      0080BF                        580 ___str_6:
      0080BF 0D                     581 	.db 0x0d
      0080C0 00                     582 	.db 0x00
      0080C1                        583 ___str_7:
      0080C1 25 32 64 2F 25 32 64   584 	.ascii "%2d/%2d/%2d"
             2F 25 32 64
      0080CC 00                     585 	.db 0x00
      0080CD                        586 ___str_9:
      0080CD 25 32 64 2E 25 31 64   587 	.ascii "%2d.%1dC/%2d.%1d%%/%3d"
             43 2F 25 32 64 2E 25
             31 64 25 25 2F 25 33
             64
      0080E3 00                     588 	.db 0x00
      0080E4                        589 ___str_11:
      0080E4 25 32 64 2F 25 32 64   590 	.ascii "%2d/%2d/%2d/%2d/%2d"
             2F 25 32 64 2F 25 32
             64 2F 25 32 64
      0080F7 00                     591 	.db 0x00
                                    592 	.area INITIALIZER
                                    593 	.area CABS (ABS)
