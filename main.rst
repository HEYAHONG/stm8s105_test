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
                                     16 	.globl _driver_init
                                     17 	.globl _OLED_ShowString
                                     18 	.globl _eeprom_read
                                     19 	.globl _ds1302_read_time
                                     20 	.globl _ReadDHT12
                                     21 	.globl _ReadADC
                                     22 	.globl _GPIO_ReadInputPin
                                     23 	.globl _GPIO_WriteReverse
                                     24 	.globl _GPIO_WriteLow
                                     25 	.globl _GPIO_WriteHigh
                                     26 	.globl _GPIO_Init
                                     27 ;--------------------------------------------------------
                                     28 ; ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area DATA
      000001                         31 _main_count_196608_392:
      000001                         32 	.ds 1
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
      008000 82 00 80 6F             62 	int s_GSINIT ; reset
      008004 82 00 90 0C             63 	int _TRAP_IRQHandler ; trap
      008008 82 00 90 0D             64 	int _TLI_IRQHandler ; int0
      00800C 82 00 90 0E             65 	int _AWU_IRQHandler ; int1
      008010 82 00 90 0F             66 	int _CLK_IRQHandler ; int2
      008014 82 00 90 10             67 	int _EXTI_PORTA_IRQHandler ; int3
      008018 82 00 90 11             68 	int _EXTI_PORTB_IRQHandler ; int4
      00801C 82 00 90 12             69 	int _EXTI_PORTC_IRQHandler ; int5
      008020 82 00 90 13             70 	int _EXTI_PORTD_IRQHandler ; int6
      008024 82 00 90 40             71 	int _EXTI_PORTE_IRQHandler ; int7
      008028 82 00 00 00             72 	int 0x000000 ; int8
      00802C 82 00 00 00             73 	int 0x000000 ; int9
      008030 82 00 90 41             74 	int _SPI_IRQHandler ; int10
      008034 82 00 90 42             75 	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
      008038 82 00 90 43             76 	int _TIM1_CAP_COM_IRQHandler ; int12
      00803C 82 00 90 44             77 	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
      008040 82 00 90 45             78 	int _TIM2_CAP_COM_IRQHandler ; int14
      008044 82 00 00 00             79 	int 0x000000 ; int15
      008048 82 00 00 00             80 	int 0x000000 ; int16
      00804C 82 00 00 00             81 	int 0x000000 ; int17
      008050 82 00 00 00             82 	int 0x000000 ; int18
      008054 82 00 90 48             83 	int _I2C_IRQHandler ; int19
      008058 82 00 90 49             84 	int _UART2_TX_IRQHandler ; int20
      00805C 82 00 90 4A             85 	int _UART2_RX_IRQHandler ; int21
      008060 82 00 90 A0             86 	int _ADC1_IRQHandler ; int22
      008064 82 00 90 A1             87 	int _TIM4_UPD_OVF_IRQHandler ; int23
      008068 82 00 90 A2             88 	int _EEPROM_EEC_IRQHandler ; int24
                                     89 ;--------------------------------------------------------
                                     90 ; global & static initialisations
                                     91 ;--------------------------------------------------------
                                     92 	.area HOME
                                     93 	.area GSINIT
                                     94 	.area GSFINAL
                                     95 	.area GSINIT
      00806F                         96 __sdcc_gs_init_startup:
      00806F                         97 __sdcc_init_data:
                                     98 ; stm8_genXINIT() start
      00806F AE 00 06         [ 2]   99 	ldw x, #l_DATA
      008072 27 07            [ 1]  100 	jreq	00002$
      008074                        101 00001$:
      008074 72 4F 00 00      [ 1]  102 	clr (s_DATA - 1, x)
      008078 5A               [ 2]  103 	decw x
      008079 26 F9            [ 1]  104 	jrne	00001$
      00807B                        105 00002$:
      00807B AE 00 05         [ 2]  106 	ldw	x, #l_INITIALIZER
      00807E 27 09            [ 1]  107 	jreq	00004$
      008080                        108 00003$:
      008080 D6 86 F6         [ 1]  109 	ld	a, (s_INITIALIZER - 1, x)
      008083 D7 00 06         [ 1]  110 	ld	(s_INITIALIZED - 1, x), a
      008086 5A               [ 2]  111 	decw	x
      008087 26 F7            [ 1]  112 	jrne	00003$
      008089                        113 00004$:
                                    114 ; stm8_genXINIT() end
                                    115 ;	main.c: 112: static u8 count=0;
      008089 72 5F 00 01      [ 1]  116 	clr	_main_count_196608_392+0
                                    117 	.area GSFINAL
      00808D CC 80 6C         [ 2]  118 	jp	__sdcc_program_startup
                                    119 ;--------------------------------------------------------
                                    120 ; Home
                                    121 ;--------------------------------------------------------
                                    122 	.area HOME
                                    123 	.area HOME
      00806C                        124 __sdcc_program_startup:
      00806C CC 87 06         [ 2]  125 	jp	_main
                                    126 ;	return from main will return to caller
                                    127 ;--------------------------------------------------------
                                    128 ; code
                                    129 ;--------------------------------------------------------
                                    130 	.area CODE
                                    131 ;	main.c: 51: void Delay(uint16_t nCount)
                                    132 ;	-----------------------------------------
                                    133 ;	 function Delay
                                    134 ;	-----------------------------------------
      0086FC                        135 _Delay:
                                    136 ;	main.c: 54: while (nCount != 0)
      0086FC 1E 03            [ 2]  137 	ldw	x, (0x03, sp)
      0086FE                        138 00101$:
      0086FE 5D               [ 2]  139 	tnzw	x
      0086FF 26 01            [ 1]  140 	jrne	00117$
      008701 81               [ 4]  141 	ret
      008702                        142 00117$:
                                    143 ;	main.c: 56: nCount--;
      008702 5A               [ 2]  144 	decw	x
      008703 20 F9            [ 2]  145 	jra	00101$
                                    146 ;	main.c: 58: }
      008705 81               [ 4]  147 	ret
                                    148 ;	main.c: 62: void main(void)
                                    149 ;	-----------------------------------------
                                    150 ;	 function main
                                    151 ;	-----------------------------------------
      008706                        152 _main:
      008706 52 4B            [ 2]  153 	sub	sp, #75
                                    154 ;	main.c: 66: GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      008708 4B E0            [ 1]  155 	push	#0xe0
      00870A 4B 20            [ 1]  156 	push	#0x20
      00870C 4B 14            [ 1]  157 	push	#0x14
      00870E 4B 50            [ 1]  158 	push	#0x50
      008710 CD 96 17         [ 4]  159 	call	_GPIO_Init
      008713 5B 04            [ 2]  160 	addw	sp, #4
                                    161 ;	main.c: 67: GPIO_Init(GPIOF,GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
      008715 4B 00            [ 1]  162 	push	#0x00
      008717 4B 10            [ 1]  163 	push	#0x10
      008719 4B 19            [ 1]  164 	push	#0x19
      00871B 4B 50            [ 1]  165 	push	#0x50
      00871D CD 96 17         [ 4]  166 	call	_GPIO_Init
      008720 5B 04            [ 2]  167 	addw	sp, #4
                                    168 ;	main.c: 68: driver_init(); //驱动初始化
      008722 CD 8F 8E         [ 4]  169 	call	_driver_init
                                    170 ;	main.c: 78: OLED_ShowString(0,0,"STM8 Started!");
      008725 4B 90            [ 1]  171 	push	#<___str_0
      008727 4B 80            [ 1]  172 	push	#(___str_0 >> 8)
      008729 4B 00            [ 1]  173 	push	#0x00
      00872B 4B 00            [ 1]  174 	push	#0x00
      00872D CD 93 A1         [ 4]  175 	call	_OLED_ShowString
      008730 5B 04            [ 2]  176 	addw	sp, #4
                                    177 ;	main.c: 79: printf("STM8 Started!\r\n");
      008732 4B 9E            [ 1]  178 	push	#<___str_2
      008734 4B 80            [ 1]  179 	push	#(___str_2 >> 8)
      008736 CD A8 10         [ 4]  180 	call	_puts
      008739 5B 02            [ 2]  181 	addw	sp, #2
                                    182 ;	main.c: 81: GPIO_Init(GPIOD, GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_FAST);
      00873B 4B E0            [ 1]  183 	push	#0xe0
      00873D 4B 80            [ 1]  184 	push	#0x80
      00873F 4B 0F            [ 1]  185 	push	#0x0f
      008741 4B 50            [ 1]  186 	push	#0x50
      008743 CD 96 17         [ 4]  187 	call	_GPIO_Init
      008746 5B 04            [ 2]  188 	addw	sp, #4
                                    189 ;	main.c: 82: GPIO_WriteHigh(GPIOD,GPIO_PIN_7);
      008748 4B 80            [ 1]  190 	push	#0x80
      00874A 4B 0F            [ 1]  191 	push	#0x0f
      00874C 4B 50            [ 1]  192 	push	#0x50
      00874E CD 96 92         [ 4]  193 	call	_GPIO_WriteHigh
      008751 5B 03            [ 2]  194 	addw	sp, #3
                                    195 ;	main.c: 83: Delay(0xffff);
      008753 4B FF            [ 1]  196 	push	#0xff
      008755 4B FF            [ 1]  197 	push	#0xff
      008757 CD 86 FC         [ 4]  198 	call	_Delay
      00875A 5B 02            [ 2]  199 	addw	sp, #2
                                    200 ;	main.c: 84: GPIO_WriteLow(GPIOD,GPIO_PIN_7);
      00875C 4B 80            [ 1]  201 	push	#0x80
      00875E 4B 0F            [ 1]  202 	push	#0x0f
      008760 4B 50            [ 1]  203 	push	#0x50
      008762 CD 96 99         [ 4]  204 	call	_GPIO_WriteLow
      008765 5B 03            [ 2]  205 	addw	sp, #3
                                    206 ;	main.c: 88: while (1)
      008767                        207 00104$:
                                    208 ;	main.c: 92: sprintf(temp,"V:%4d,S:%1d %d",ReadADC(),GPIO_ReadInputPin(GPIOF,GPIO_PIN_4)==RESET?0:1,eeprom_read(10));
      008767 4B 0A            [ 1]  209 	push	#0x0a
      008769 5F               [ 1]  210 	clrw	x
      00876A 89               [ 2]  211 	pushw	x
      00876B 4B 00            [ 1]  212 	push	#0x00
      00876D CD 95 5A         [ 4]  213 	call	_eeprom_read
      008770 5B 04            [ 2]  214 	addw	sp, #4
      008772 6B 3F            [ 1]  215 	ld	(0x3f, sp), a
      008774 0F 3E            [ 1]  216 	clr	(0x3e, sp)
      008776 4B 10            [ 1]  217 	push	#0x10
      008778 4B 19            [ 1]  218 	push	#0x19
      00877A 4B 50            [ 1]  219 	push	#0x50
      00877C CD 96 B7         [ 4]  220 	call	_GPIO_ReadInputPin
      00877F 5B 03            [ 2]  221 	addw	sp, #3
      008781 4D               [ 1]  222 	tnz	a
      008782 26 05            [ 1]  223 	jrne	00108$
      008784 5F               [ 1]  224 	clrw	x
      008785 1F 2C            [ 2]  225 	ldw	(0x2c, sp), x
      008787 20 05            [ 2]  226 	jra	00109$
      008789                        227 00108$:
      008789 AE 00 01         [ 2]  228 	ldw	x, #0x0001
      00878C 1F 2C            [ 2]  229 	ldw	(0x2c, sp), x
      00878E                        230 00109$:
      00878E CD 95 B6         [ 4]  231 	call	_ReadADC
      008791 90 96            [ 1]  232 	ldw	y, sp
      008793 72 A9 00 10      [ 2]  233 	addw	y, #16
      008797 17 44            [ 2]  234 	ldw	(0x44, sp), y
      008799 7B 3F            [ 1]  235 	ld	a, (0x3f, sp)
      00879B 88               [ 1]  236 	push	a
      00879C 7B 3F            [ 1]  237 	ld	a, (0x3f, sp)
      00879E 88               [ 1]  238 	push	a
      00879F 7B 2F            [ 1]  239 	ld	a, (0x2f, sp)
      0087A1 88               [ 1]  240 	push	a
      0087A2 7B 2F            [ 1]  241 	ld	a, (0x2f, sp)
      0087A4 88               [ 1]  242 	push	a
      0087A5 89               [ 2]  243 	pushw	x
      0087A6 4B AD            [ 1]  244 	push	#<___str_3
      0087A8 4B 80            [ 1]  245 	push	#(___str_3 >> 8)
      0087AA 90 89            [ 2]  246 	pushw	y
      0087AC CD A7 96         [ 4]  247 	call	_sprintf
      0087AF 5B 0A            [ 2]  248 	addw	sp, #10
                                    249 ;	main.c: 93: printf("%s",temp);
      0087B1 1E 44            [ 2]  250 	ldw	x, (0x44, sp)
      0087B3 89               [ 2]  251 	pushw	x
      0087B4 4B BC            [ 1]  252 	push	#<___str_4
      0087B6 4B 80            [ 1]  253 	push	#(___str_4 >> 8)
      0087B8 CD A8 51         [ 4]  254 	call	_printf
      0087BB 5B 04            [ 2]  255 	addw	sp, #4
                                    256 ;	main.c: 94: printf("\r\n");
      0087BD 4B BF            [ 1]  257 	push	#<___str_6
      0087BF 4B 80            [ 1]  258 	push	#(___str_6 >> 8)
      0087C1 CD A8 10         [ 4]  259 	call	_puts
      0087C4 5B 02            [ 2]  260 	addw	sp, #2
                                    261 ;	main.c: 95: OLED_ShowString(0,2,temp);
      0087C6 1E 44            [ 2]  262 	ldw	x, (0x44, sp)
      0087C8 89               [ 2]  263 	pushw	x
      0087C9 4B 02            [ 1]  264 	push	#0x02
      0087CB 4B 00            [ 1]  265 	push	#0x00
      0087CD CD 93 A1         [ 4]  266 	call	_OLED_ShowString
      0087D0 5B 04            [ 2]  267 	addw	sp, #4
                                    268 ;	main.c: 103: ds1302_read_time(&ds_time);
      0087D2 96               [ 1]  269 	ldw	x, sp
      0087D3 1C 00 09         [ 2]  270 	addw	x, #9
      0087D6 1F 1A            [ 2]  271 	ldw	(0x1a, sp), x
      0087D8 89               [ 2]  272 	pushw	x
      0087D9 CD 8E 56         [ 4]  273 	call	_ds1302_read_time
      0087DC 5B 02            [ 2]  274 	addw	sp, #2
                                    275 ;	main.c: 104: sprintf(temp,"%2d/%2d/%2d",ds_time.hour/16*10+ds_time.hour%16,ds_time.minute/16*10+ds_time.minute%16,ds_time.second/16*10+ds_time.second%16);
      0087DE 1E 1A            [ 2]  276 	ldw	x, (0x1a, sp)
      0087E0 E6 06            [ 1]  277 	ld	a, (0x6, x)
      0087E2 6B 43            [ 1]  278 	ld	(0x43, sp), a
      0087E4 0F 42            [ 1]  279 	clr	(0x42, sp)
      0087E6 4B 10            [ 1]  280 	push	#0x10
      0087E8 4B 00            [ 1]  281 	push	#0x00
      0087EA 1E 44            [ 2]  282 	ldw	x, (0x44, sp)
      0087EC 89               [ 2]  283 	pushw	x
      0087ED CD A8 F9         [ 4]  284 	call	__divsint
      0087F0 5B 04            [ 2]  285 	addw	sp, #4
      0087F2 89               [ 2]  286 	pushw	x
      0087F3 58               [ 2]  287 	sllw	x
      0087F4 58               [ 2]  288 	sllw	x
      0087F5 72 FB 01         [ 2]  289 	addw	x, (1, sp)
      0087F8 58               [ 2]  290 	sllw	x
      0087F9 5B 02            [ 2]  291 	addw	sp, #2
      0087FB 1F 40            [ 2]  292 	ldw	(0x40, sp), x
      0087FD 4B 10            [ 1]  293 	push	#0x10
      0087FF 4B 00            [ 1]  294 	push	#0x00
      008801 1E 44            [ 2]  295 	ldw	x, (0x44, sp)
      008803 89               [ 2]  296 	pushw	x
      008804 CD A8 E3         [ 4]  297 	call	__modsint
      008807 5B 04            [ 2]  298 	addw	sp, #4
      008809 72 FB 40         [ 2]  299 	addw	x, (0x40, sp)
      00880C 1F 2A            [ 2]  300 	ldw	(0x2a, sp), x
      00880E 1E 1A            [ 2]  301 	ldw	x, (0x1a, sp)
      008810 E6 05            [ 1]  302 	ld	a, (0x5, x)
      008812 6B 3D            [ 1]  303 	ld	(0x3d, sp), a
      008814 0F 3C            [ 1]  304 	clr	(0x3c, sp)
      008816 4B 10            [ 1]  305 	push	#0x10
      008818 4B 00            [ 1]  306 	push	#0x00
      00881A 1E 3E            [ 2]  307 	ldw	x, (0x3e, sp)
      00881C 89               [ 2]  308 	pushw	x
      00881D CD A8 F9         [ 4]  309 	call	__divsint
      008820 5B 04            [ 2]  310 	addw	sp, #4
      008822 89               [ 2]  311 	pushw	x
      008823 58               [ 2]  312 	sllw	x
      008824 58               [ 2]  313 	sllw	x
      008825 72 FB 01         [ 2]  314 	addw	x, (1, sp)
      008828 58               [ 2]  315 	sllw	x
      008829 5B 02            [ 2]  316 	addw	sp, #2
      00882B 1F 3A            [ 2]  317 	ldw	(0x3a, sp), x
      00882D 4B 10            [ 1]  318 	push	#0x10
      00882F 4B 00            [ 1]  319 	push	#0x00
      008831 1E 3E            [ 2]  320 	ldw	x, (0x3e, sp)
      008833 89               [ 2]  321 	pushw	x
      008834 CD A8 E3         [ 4]  322 	call	__modsint
      008837 5B 04            [ 2]  323 	addw	sp, #4
      008839 72 FB 3A         [ 2]  324 	addw	x, (0x3a, sp)
      00883C 1F 30            [ 2]  325 	ldw	(0x30, sp), x
      00883E 1E 1A            [ 2]  326 	ldw	x, (0x1a, sp)
      008840 E6 04            [ 1]  327 	ld	a, (0x4, x)
      008842 6B 2F            [ 1]  328 	ld	(0x2f, sp), a
      008844 0F 2E            [ 1]  329 	clr	(0x2e, sp)
      008846 4B 10            [ 1]  330 	push	#0x10
      008848 4B 00            [ 1]  331 	push	#0x00
      00884A 1E 30            [ 2]  332 	ldw	x, (0x30, sp)
      00884C 89               [ 2]  333 	pushw	x
      00884D CD A8 F9         [ 4]  334 	call	__divsint
      008850 5B 04            [ 2]  335 	addw	sp, #4
      008852 89               [ 2]  336 	pushw	x
      008853 58               [ 2]  337 	sllw	x
      008854 58               [ 2]  338 	sllw	x
      008855 72 FB 01         [ 2]  339 	addw	x, (1, sp)
      008858 58               [ 2]  340 	sllw	x
      008859 5B 02            [ 2]  341 	addw	sp, #2
      00885B 1F 34            [ 2]  342 	ldw	(0x34, sp), x
      00885D 4B 10            [ 1]  343 	push	#0x10
      00885F 4B 00            [ 1]  344 	push	#0x00
      008861 1E 30            [ 2]  345 	ldw	x, (0x30, sp)
      008863 89               [ 2]  346 	pushw	x
      008864 CD A8 E3         [ 4]  347 	call	__modsint
      008867 5B 04            [ 2]  348 	addw	sp, #4
      008869 72 FB 34         [ 2]  349 	addw	x, (0x34, sp)
      00886C 51               [ 1]  350 	exgw	x, y
      00886D 96               [ 1]  351 	ldw	x, sp
      00886E 1C 00 10         [ 2]  352 	addw	x, #16
      008871 1F 32            [ 2]  353 	ldw	(0x32, sp), x
      008873 7B 2B            [ 1]  354 	ld	a, (0x2b, sp)
      008875 88               [ 1]  355 	push	a
      008876 7B 2B            [ 1]  356 	ld	a, (0x2b, sp)
      008878 88               [ 1]  357 	push	a
      008879 7B 33            [ 1]  358 	ld	a, (0x33, sp)
      00887B 88               [ 1]  359 	push	a
      00887C 7B 33            [ 1]  360 	ld	a, (0x33, sp)
      00887E 88               [ 1]  361 	push	a
      00887F 90 89            [ 2]  362 	pushw	y
      008881 4B C1            [ 1]  363 	push	#<___str_7
      008883 4B 80            [ 1]  364 	push	#(___str_7 >> 8)
      008885 89               [ 2]  365 	pushw	x
      008886 CD A7 96         [ 4]  366 	call	_sprintf
      008889 5B 0A            [ 2]  367 	addw	sp, #10
                                    368 ;	main.c: 105: printf("%s",temp);
      00888B 1E 32            [ 2]  369 	ldw	x, (0x32, sp)
      00888D 89               [ 2]  370 	pushw	x
      00888E 4B BC            [ 1]  371 	push	#<___str_4
      008890 4B 80            [ 1]  372 	push	#(___str_4 >> 8)
      008892 CD A8 51         [ 4]  373 	call	_printf
      008895 5B 04            [ 2]  374 	addw	sp, #4
                                    375 ;	main.c: 106: printf("\r\n");
      008897 4B BF            [ 1]  376 	push	#<___str_6
      008899 4B 80            [ 1]  377 	push	#(___str_6 >> 8)
      00889B CD A8 10         [ 4]  378 	call	_puts
      00889E 5B 02            [ 2]  379 	addw	sp, #2
                                    380 ;	main.c: 107: OLED_ShowString(0,4,temp);
      0088A0 1E 32            [ 2]  381 	ldw	x, (0x32, sp)
      0088A2 89               [ 2]  382 	pushw	x
      0088A3 4B 04            [ 1]  383 	push	#0x04
      0088A5 4B 00            [ 1]  384 	push	#0x00
      0088A7 CD 93 A1         [ 4]  385 	call	_OLED_ShowString
      0088AA 5B 04            [ 2]  386 	addw	sp, #4
                                    387 ;	main.c: 114: if(count>=2)
      0088AC C6 00 01         [ 1]  388 	ld	a, _main_count_196608_392+0
      0088AF A1 02            [ 1]  389 	cp	a, #0x02
      0088B1 24 03            [ 1]  390 	jrnc	00126$
      0088B3 CC 89 2D         [ 2]  391 	jp	00102$
      0088B6                        392 00126$:
                                    393 ;	main.c: 118: ReadDHT12(&data);
      0088B6 90 96            [ 1]  394 	ldw	y, sp
      0088B8 72 A9 00 15      [ 2]  395 	addw	y, #21
      0088BC 93               [ 1]  396 	ldw	x, y
      0088BD 90 89            [ 2]  397 	pushw	y
      0088BF 89               [ 2]  398 	pushw	x
      0088C0 CD 8C 76         [ 4]  399 	call	_ReadDHT12
      0088C3 5B 02            [ 2]  400 	addw	sp, #2
      0088C5 90 85            [ 2]  401 	popw	y
                                    402 ;	main.c: 119: sprintf(temp,"%2d.%1dC/%2d.%1d%%/%3d",data.T,data.T1,data.W,data.W1,data.sum);
      0088C7 93               [ 1]  403 	ldw	x, y
      0088C8 E6 04            [ 1]  404 	ld	a, (0x4, x)
      0088CA 6B 29            [ 1]  405 	ld	(0x29, sp), a
      0088CC 0F 28            [ 1]  406 	clr	(0x28, sp)
      0088CE 93               [ 1]  407 	ldw	x, y
      0088CF E6 03            [ 1]  408 	ld	a, (0x3, x)
      0088D1 6B 27            [ 1]  409 	ld	(0x27, sp), a
      0088D3 0F 26            [ 1]  410 	clr	(0x26, sp)
      0088D5 93               [ 1]  411 	ldw	x, y
      0088D6 E6 02            [ 1]  412 	ld	a, (0x2, x)
      0088D8 6B 25            [ 1]  413 	ld	(0x25, sp), a
      0088DA 0F 24            [ 1]  414 	clr	(0x24, sp)
      0088DC 93               [ 1]  415 	ldw	x, y
      0088DD E6 01            [ 1]  416 	ld	a, (0x1, x)
      0088DF 6B 4B            [ 1]  417 	ld	(0x4b, sp), a
      0088E1 0F 4A            [ 1]  418 	clr	(0x4a, sp)
      0088E3 90 F6            [ 1]  419 	ld	a, (y)
      0088E5 0F 48            [ 1]  420 	clr	(0x48, sp)
      0088E7 96               [ 1]  421 	ldw	x, sp
      0088E8 5C               [ 1]  422 	incw	x
      0088E9 1F 46            [ 2]  423 	ldw	(0x46, sp), x
      0088EB 90 93            [ 1]  424 	ldw	y, x
      0088ED 1E 28            [ 2]  425 	ldw	x, (0x28, sp)
      0088EF 89               [ 2]  426 	pushw	x
      0088F0 1E 28            [ 2]  427 	ldw	x, (0x28, sp)
      0088F2 89               [ 2]  428 	pushw	x
      0088F3 1E 28            [ 2]  429 	ldw	x, (0x28, sp)
      0088F5 89               [ 2]  430 	pushw	x
      0088F6 1E 50            [ 2]  431 	ldw	x, (0x50, sp)
      0088F8 89               [ 2]  432 	pushw	x
      0088F9 88               [ 1]  433 	push	a
      0088FA 7B 51            [ 1]  434 	ld	a, (0x51, sp)
      0088FC 88               [ 1]  435 	push	a
      0088FD 4B CD            [ 1]  436 	push	#<___str_9
      0088FF 4B 80            [ 1]  437 	push	#(___str_9 >> 8)
      008901 90 89            [ 2]  438 	pushw	y
      008903 CD A7 96         [ 4]  439 	call	_sprintf
      008906 5B 0E            [ 2]  440 	addw	sp, #14
                                    441 ;	main.c: 120: printf("%s",temp);
      008908 1E 46            [ 2]  442 	ldw	x, (0x46, sp)
      00890A 89               [ 2]  443 	pushw	x
      00890B 4B BC            [ 1]  444 	push	#<___str_4
      00890D 4B 80            [ 1]  445 	push	#(___str_4 >> 8)
      00890F CD A8 51         [ 4]  446 	call	_printf
      008912 5B 04            [ 2]  447 	addw	sp, #4
                                    448 ;	main.c: 121: printf("\r\n");
      008914 4B BF            [ 1]  449 	push	#<___str_6
      008916 4B 80            [ 1]  450 	push	#(___str_6 >> 8)
      008918 CD A8 10         [ 4]  451 	call	_puts
      00891B 5B 02            [ 2]  452 	addw	sp, #2
                                    453 ;	main.c: 122: OLED_ShowString(0,6,temp);
      00891D 1E 46            [ 2]  454 	ldw	x, (0x46, sp)
      00891F 89               [ 2]  455 	pushw	x
      008920 4B 06            [ 1]  456 	push	#0x06
      008922 4B 00            [ 1]  457 	push	#0x00
      008924 CD 93 A1         [ 4]  458 	call	_OLED_ShowString
      008927 5B 04            [ 2]  459 	addw	sp, #4
                                    460 ;	main.c: 123: count=0;
      008929 72 5F 00 01      [ 1]  461 	clr	_main_count_196608_392+0
      00892D                        462 00102$:
                                    463 ;	main.c: 126: count++;
      00892D 72 5C 00 01      [ 1]  464 	inc	_main_count_196608_392+0
                                    465 ;	main.c: 130: sprintf(temp,"%2d/%2d/%2d/%2d/%2d",keycount[0],keycount[1],keycount[2],keycount[3],keycount[4]);
      008931 90 AE 00 07      [ 2]  466 	ldw	y, #_keycount+0
      008935 93               [ 1]  467 	ldw	x, y
      008936 E6 04            [ 1]  468 	ld	a, (0x4, x)
      008938 6B 23            [ 1]  469 	ld	(0x23, sp), a
      00893A 0F 22            [ 1]  470 	clr	(0x22, sp)
      00893C 93               [ 1]  471 	ldw	x, y
      00893D E6 03            [ 1]  472 	ld	a, (0x3, x)
      00893F 6B 21            [ 1]  473 	ld	(0x21, sp), a
      008941 0F 20            [ 1]  474 	clr	(0x20, sp)
      008943 93               [ 1]  475 	ldw	x, y
      008944 E6 02            [ 1]  476 	ld	a, (0x2, x)
      008946 6B 1F            [ 1]  477 	ld	(0x1f, sp), a
      008948 0F 1E            [ 1]  478 	clr	(0x1e, sp)
      00894A 93               [ 1]  479 	ldw	x, y
      00894B E6 01            [ 1]  480 	ld	a, (0x1, x)
      00894D 6B 1D            [ 1]  481 	ld	(0x1d, sp), a
      00894F 0F 1C            [ 1]  482 	clr	(0x1c, sp)
      008951 90 F6            [ 1]  483 	ld	a, (y)
      008953 0F 38            [ 1]  484 	clr	(0x38, sp)
      008955 96               [ 1]  485 	ldw	x, sp
      008956 1C 00 06         [ 2]  486 	addw	x, #6
      008959 1F 36            [ 2]  487 	ldw	(0x36, sp), x
      00895B 90 93            [ 1]  488 	ldw	y, x
      00895D 1E 22            [ 2]  489 	ldw	x, (0x22, sp)
      00895F 89               [ 2]  490 	pushw	x
      008960 1E 22            [ 2]  491 	ldw	x, (0x22, sp)
      008962 89               [ 2]  492 	pushw	x
      008963 1E 22            [ 2]  493 	ldw	x, (0x22, sp)
      008965 89               [ 2]  494 	pushw	x
      008966 1E 22            [ 2]  495 	ldw	x, (0x22, sp)
      008968 89               [ 2]  496 	pushw	x
      008969 88               [ 1]  497 	push	a
      00896A 7B 41            [ 1]  498 	ld	a, (0x41, sp)
      00896C 88               [ 1]  499 	push	a
      00896D 4B E4            [ 1]  500 	push	#<___str_11
      00896F 4B 80            [ 1]  501 	push	#(___str_11 >> 8)
      008971 90 89            [ 2]  502 	pushw	y
      008973 CD A7 96         [ 4]  503 	call	_sprintf
      008976 5B 0E            [ 2]  504 	addw	sp, #14
                                    505 ;	main.c: 131: printf("%s",temp);
      008978 1E 36            [ 2]  506 	ldw	x, (0x36, sp)
      00897A 89               [ 2]  507 	pushw	x
      00897B 4B BC            [ 1]  508 	push	#<___str_4
      00897D 4B 80            [ 1]  509 	push	#(___str_4 >> 8)
      00897F CD A8 51         [ 4]  510 	call	_printf
      008982 5B 04            [ 2]  511 	addw	sp, #4
                                    512 ;	main.c: 132: printf("\r\n");
      008984 4B BF            [ 1]  513 	push	#<___str_6
      008986 4B 80            [ 1]  514 	push	#(___str_6 >> 8)
      008988 CD A8 10         [ 4]  515 	call	_puts
      00898B 5B 02            [ 2]  516 	addw	sp, #2
                                    517 ;	main.c: 133: OLED_ShowString(0,0,temp);
      00898D 1E 36            [ 2]  518 	ldw	x, (0x36, sp)
      00898F 89               [ 2]  519 	pushw	x
      008990 4B 00            [ 1]  520 	push	#0x00
      008992 4B 00            [ 1]  521 	push	#0x00
      008994 CD 93 A1         [ 4]  522 	call	_OLED_ShowString
      008997 5B 04            [ 2]  523 	addw	sp, #4
                                    524 ;	main.c: 135: GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
      008999 4B 20            [ 1]  525 	push	#0x20
      00899B 4B 14            [ 1]  526 	push	#0x14
      00899D 4B 50            [ 1]  527 	push	#0x50
      00899F CD 96 A7         [ 4]  528 	call	_GPIO_WriteReverse
      0089A2 5B 03            [ 2]  529 	addw	sp, #3
                                    530 ;	main.c: 136: Delay(0xffff);
      0089A4 4B FF            [ 1]  531 	push	#0xff
      0089A6 4B FF            [ 1]  532 	push	#0xff
      0089A8 CD 86 FC         [ 4]  533 	call	_Delay
      0089AB 5B 02            [ 2]  534 	addw	sp, #2
                                    535 ;	main.c: 139: }
      0089AD CC 87 67         [ 2]  536 	jp	00104$
                                    537 	.area CODE
                                    538 	.area CONST
      008090                        539 ___str_0:
      008090 53 54 4D 38 20 53 74   540 	.ascii "STM8 Started!"
             61 72 74 65 64 21
      00809D 00                     541 	.db 0x00
      00809E                        542 ___str_2:
      00809E 53 54 4D 38 20 53 74   543 	.ascii "STM8 Started!"
             61 72 74 65 64 21
      0080AB 0D                     544 	.db 0x0d
      0080AC 00                     545 	.db 0x00
      0080AD                        546 ___str_3:
      0080AD 56 3A 25 34 64 2C 53   547 	.ascii "V:%4d,S:%1d %d"
             3A 25 31 64 20 25 64
      0080BB 00                     548 	.db 0x00
      0080BC                        549 ___str_4:
      0080BC 25 73                  550 	.ascii "%s"
      0080BE 00                     551 	.db 0x00
      0080BF                        552 ___str_6:
      0080BF 0D                     553 	.db 0x0d
      0080C0 00                     554 	.db 0x00
      0080C1                        555 ___str_7:
      0080C1 25 32 64 2F 25 32 64   556 	.ascii "%2d/%2d/%2d"
             2F 25 32 64
      0080CC 00                     557 	.db 0x00
      0080CD                        558 ___str_9:
      0080CD 25 32 64 2E 25 31 64   559 	.ascii "%2d.%1dC/%2d.%1d%%/%3d"
             43 2F 25 32 64 2E 25
             31 64 25 25 2F 25 33
             64
      0080E3 00                     560 	.db 0x00
      0080E4                        561 ___str_11:
      0080E4 25 32 64 2F 25 32 64   562 	.ascii "%2d/%2d/%2d/%2d/%2d"
             2F 25 32 64 2F 25 32
             64 2F 25 32 64
      0080F7 00                     563 	.db 0x00
                                    564 	.area INITIALIZER
                                    565 	.area CABS (ABS)
