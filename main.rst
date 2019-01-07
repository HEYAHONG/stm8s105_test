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
      000001                         34 _main_count_196608_388:
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
      008000 82 00 80 6F             65 	int s_GSINIT ; reset
      008004 82 00 86 E0             66 	int _TRAP_IRQHandler ; trap
      008008 82 00 86 E1             67 	int _TLI_IRQHandler ; int0
      00800C 82 00 86 E2             68 	int _AWU_IRQHandler ; int1
      008010 82 00 86 E3             69 	int _CLK_IRQHandler ; int2
      008014 82 00 86 E4             70 	int _EXTI_PORTA_IRQHandler ; int3
      008018 82 00 86 E5             71 	int _EXTI_PORTB_IRQHandler ; int4
      00801C 82 00 86 E6             72 	int _EXTI_PORTC_IRQHandler ; int5
      008020 82 00 86 E7             73 	int _EXTI_PORTD_IRQHandler ; int6
      008024 82 00 86 E8             74 	int _EXTI_PORTE_IRQHandler ; int7
      008028 82 00 00 00             75 	int 0x000000 ; int8
      00802C 82 00 00 00             76 	int 0x000000 ; int9
      008030 82 00 86 E9             77 	int _SPI_IRQHandler ; int10
      008034 82 00 86 EA             78 	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
      008038 82 00 86 EB             79 	int _TIM1_CAP_COM_IRQHandler ; int12
      00803C 82 00 86 EC             80 	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
      008040 82 00 86 ED             81 	int _TIM2_CAP_COM_IRQHandler ; int14
      008044 82 00 00 00             82 	int 0x000000 ; int15
      008048 82 00 00 00             83 	int 0x000000 ; int16
      00804C 82 00 00 00             84 	int 0x000000 ; int17
      008050 82 00 00 00             85 	int 0x000000 ; int18
      008054 82 00 86 F0             86 	int _I2C_IRQHandler ; int19
      008058 82 00 86 F1             87 	int _UART2_TX_IRQHandler ; int20
      00805C 82 00 86 F2             88 	int _UART2_RX_IRQHandler ; int21
      008060 82 00 87 48             89 	int _ADC1_IRQHandler ; int22
      008064 82 00 87 49             90 	int _TIM4_UPD_OVF_IRQHandler ; int23
      008068 82 00 87 4A             91 	int _EEPROM_EEC_IRQHandler ; int24
                                     92 ;--------------------------------------------------------
                                     93 ; global & static initialisations
                                     94 ;--------------------------------------------------------
                                     95 	.area HOME
                                     96 	.area GSINIT
                                     97 	.area GSFINAL
                                     98 	.area GSINIT
      00806F                         99 __sdcc_gs_init_startup:
      00806F                        100 __sdcc_init_data:
                                    101 ; stm8_genXINIT() start
      00806F AE 00 01         [ 2]  102 	ldw x, #l_DATA
      008072 27 07            [ 1]  103 	jreq	00002$
      008074                        104 00001$:
      008074 72 4F 00 00      [ 1]  105 	clr (s_DATA - 1, x)
      008078 5A               [ 2]  106 	decw x
      008079 26 F9            [ 1]  107 	jrne	00001$
      00807B                        108 00002$:
      00807B AE 00 00         [ 2]  109 	ldw	x, #l_INITIALIZER
      00807E 27 09            [ 1]  110 	jreq	00004$
      008080                        111 00003$:
      008080 D6 86 DF         [ 1]  112 	ld	a, (s_INITIALIZER - 1, x)
      008083 D7 00 01         [ 1]  113 	ld	(s_INITIALIZED - 1, x), a
      008086 5A               [ 2]  114 	decw	x
      008087 26 F7            [ 1]  115 	jrne	00003$
      008089                        116 00004$:
                                    117 ; stm8_genXINIT() end
                                    118 ;	main.c: 98: static u8 count=0;
      008089 72 5F 00 01      [ 1]  119 	clr	_main_count_196608_388+0
                                    120 	.area GSFINAL
      00808D CC 80 6C         [ 2]  121 	jp	__sdcc_program_startup
                                    122 ;--------------------------------------------------------
                                    123 ; Home
                                    124 ;--------------------------------------------------------
                                    125 	.area HOME
                                    126 	.area HOME
      00806C                        127 __sdcc_program_startup:
      00806C CC 87 55         [ 2]  128 	jp	_main
                                    129 ;	return from main will return to caller
                                    130 ;--------------------------------------------------------
                                    131 ; code
                                    132 ;--------------------------------------------------------
                                    133 	.area CODE
                                    134 ;	main.c: 47: void Delay(uint16_t nCount)
                                    135 ;	-----------------------------------------
                                    136 ;	 function Delay
                                    137 ;	-----------------------------------------
      00874B                        138 _Delay:
                                    139 ;	main.c: 50: while (nCount != 0)
      00874B 1E 03            [ 2]  140 	ldw	x, (0x03, sp)
      00874D                        141 00101$:
      00874D 5D               [ 2]  142 	tnzw	x
      00874E 26 01            [ 1]  143 	jrne	00117$
      008750 81               [ 4]  144 	ret
      008751                        145 00117$:
                                    146 ;	main.c: 52: nCount--;
      008751 5A               [ 2]  147 	decw	x
      008752 20 F9            [ 2]  148 	jra	00101$
                                    149 ;	main.c: 54: }
      008754 81               [ 4]  150 	ret
                                    151 ;	main.c: 58: void main(void)
                                    152 ;	-----------------------------------------
                                    153 ;	 function main
                                    154 ;	-----------------------------------------
      008755                        155 _main:
      008755 52 3E            [ 2]  156 	sub	sp, #62
                                    157 ;	main.c: 62: GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      008757 4B E0            [ 1]  158 	push	#0xe0
      008759 4B 20            [ 1]  159 	push	#0x20
      00875B 4B 14            [ 1]  160 	push	#0x14
      00875D 4B 50            [ 1]  161 	push	#0x50
      00875F CD 94 C4         [ 4]  162 	call	_GPIO_Init
      008762 5B 04            [ 2]  163 	addw	sp, #4
                                    164 ;	main.c: 63: GPIO_Init(GPIOF,GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
      008764 4B 00            [ 1]  165 	push	#0x00
      008766 4B 10            [ 1]  166 	push	#0x10
      008768 4B 19            [ 1]  167 	push	#0x19
      00876A 4B 50            [ 1]  168 	push	#0x50
      00876C CD 94 C4         [ 4]  169 	call	_GPIO_Init
      00876F 5B 04            [ 2]  170 	addw	sp, #4
                                    171 ;	main.c: 65: Init_UART2();
      008771 CD 8C 91         [ 4]  172 	call	_Init_UART2
                                    173 ;	main.c: 66: OLED_Init();
      008774 CD 92 DD         [ 4]  174 	call	_OLED_Init
                                    175 ;	main.c: 67: ds1302_active();
      008777 CD 8F DB         [ 4]  176 	call	_ds1302_active
                                    177 ;	main.c: 68: OLED_Clear();
      00877A CD 91 25         [ 4]  178 	call	_OLED_Clear
                                    179 ;	main.c: 69: enableInterrupts(); //使能中断
      00877D 9A               [ 1]  180 	rim
                                    181 ;	main.c: 71: OLED_ShowString(0,0,"STM8 Started!");
      00877E 4B 90            [ 1]  182 	push	#<___str_0
      008780 4B 80            [ 1]  183 	push	#(___str_0 >> 8)
      008782 4B 00            [ 1]  184 	push	#0x00
      008784 4B 00            [ 1]  185 	push	#0x00
      008786 CD 92 AA         [ 4]  186 	call	_OLED_ShowString
      008789 5B 04            [ 2]  187 	addw	sp, #4
                                    188 ;	main.c: 72: printf("STM8 Started!\r\n");
      00878B 4B 9E            [ 1]  189 	push	#<___str_2
      00878D 4B 80            [ 1]  190 	push	#(___str_2 >> 8)
      00878F CD A2 FC         [ 4]  191 	call	_puts
      008792 5B 02            [ 2]  192 	addw	sp, #2
                                    193 ;	main.c: 74: while (1)
      008794                        194 00106$:
                                    195 ;	main.c: 78: sprintf(temp,"V:%4d,S:%1d",ReadADC(),GPIO_ReadInputPin(GPIOF,GPIO_PIN_4)==RESET?0:1);
      008794 4B 10            [ 1]  196 	push	#0x10
      008796 4B 19            [ 1]  197 	push	#0x19
      008798 4B 50            [ 1]  198 	push	#0x50
      00879A CD 95 64         [ 4]  199 	call	_GPIO_ReadInputPin
      00879D 5B 03            [ 2]  200 	addw	sp, #3
      00879F 4D               [ 1]  201 	tnz	a
      0087A0 26 05            [ 1]  202 	jrne	00110$
      0087A2 5F               [ 1]  203 	clrw	x
      0087A3 1F 3D            [ 2]  204 	ldw	(0x3d, sp), x
      0087A5 20 05            [ 2]  205 	jra	00111$
      0087A7                        206 00110$:
      0087A7 AE 00 01         [ 2]  207 	ldw	x, #0x0001
      0087AA 1F 3D            [ 2]  208 	ldw	(0x3d, sp), x
      0087AC                        209 00111$:
      0087AC CD 94 63         [ 4]  210 	call	_ReadADC
      0087AF 90 96            [ 1]  211 	ldw	y, sp
      0087B1 72 A9 00 10      [ 2]  212 	addw	y, #16
      0087B5 17 1D            [ 2]  213 	ldw	(0x1d, sp), y
      0087B7 7B 3E            [ 1]  214 	ld	a, (0x3e, sp)
      0087B9 88               [ 1]  215 	push	a
      0087BA 7B 3E            [ 1]  216 	ld	a, (0x3e, sp)
      0087BC 88               [ 1]  217 	push	a
      0087BD 89               [ 2]  218 	pushw	x
      0087BE 4B AD            [ 1]  219 	push	#<___str_3
      0087C0 4B 80            [ 1]  220 	push	#(___str_3 >> 8)
      0087C2 90 89            [ 2]  221 	pushw	y
      0087C4 CD A2 82         [ 4]  222 	call	_sprintf
      0087C7 5B 08            [ 2]  223 	addw	sp, #8
                                    224 ;	main.c: 79: printf("%s",temp);
      0087C9 1E 1D            [ 2]  225 	ldw	x, (0x1d, sp)
      0087CB 89               [ 2]  226 	pushw	x
      0087CC 4B B9            [ 1]  227 	push	#<___str_4
      0087CE 4B 80            [ 1]  228 	push	#(___str_4 >> 8)
      0087D0 CD A3 3D         [ 4]  229 	call	_printf
      0087D3 5B 04            [ 2]  230 	addw	sp, #4
                                    231 ;	main.c: 80: printf("\r\n");
      0087D5 4B BC            [ 1]  232 	push	#<___str_6
      0087D7 4B 80            [ 1]  233 	push	#(___str_6 >> 8)
      0087D9 CD A2 FC         [ 4]  234 	call	_puts
      0087DC 5B 02            [ 2]  235 	addw	sp, #2
                                    236 ;	main.c: 81: OLED_ShowString(0,2,temp);
      0087DE 1E 1D            [ 2]  237 	ldw	x, (0x1d, sp)
      0087E0 89               [ 2]  238 	pushw	x
      0087E1 4B 02            [ 1]  239 	push	#0x02
      0087E3 4B 00            [ 1]  240 	push	#0x00
      0087E5 CD 92 AA         [ 4]  241 	call	_OLED_ShowString
      0087E8 5B 04            [ 2]  242 	addw	sp, #4
                                    243 ;	main.c: 84: ds1302_port_init();
      0087EA CD 8D 39         [ 4]  244 	call	_ds1302_port_init
                                    245 ;	main.c: 85: if(ds1302_check())
      0087ED CD 8E 96         [ 4]  246 	call	_ds1302_check
      0087F0 6B 1C            [ 1]  247 	ld	(0x1c, sp), a
      0087F2 26 03            [ 1]  248 	jrne	00133$
      0087F4 CC 88 D1         [ 2]  249 	jp	00102$
      0087F7                        250 00133$:
                                    251 ;	main.c: 89: ds1302_read_time(&ds_time);
      0087F7 96               [ 1]  252 	ldw	x, sp
      0087F8 1C 00 09         [ 2]  253 	addw	x, #9
      0087FB 1F 33            [ 2]  254 	ldw	(0x33, sp), x
      0087FD 89               [ 2]  255 	pushw	x
      0087FE CD 8E AE         [ 4]  256 	call	_ds1302_read_time
      008801 5B 02            [ 2]  257 	addw	sp, #2
                                    258 ;	main.c: 90: sprintf(temp,"%2d/%2d/%2d",ds_time.hour/16*10+ds_time.hour%16,ds_time.minute/16*10+ds_time.minute%16,ds_time.second/16*10+ds_time.second%16);
      008803 1E 33            [ 2]  259 	ldw	x, (0x33, sp)
      008805 E6 06            [ 1]  260 	ld	a, (0x6, x)
      008807 6B 3C            [ 1]  261 	ld	(0x3c, sp), a
      008809 0F 3B            [ 1]  262 	clr	(0x3b, sp)
      00880B 4B 10            [ 1]  263 	push	#0x10
      00880D 4B 00            [ 1]  264 	push	#0x00
      00880F 1E 3D            [ 2]  265 	ldw	x, (0x3d, sp)
      008811 89               [ 2]  266 	pushw	x
      008812 CD A3 E5         [ 4]  267 	call	__divsint
      008815 5B 04            [ 2]  268 	addw	sp, #4
      008817 89               [ 2]  269 	pushw	x
      008818 58               [ 2]  270 	sllw	x
      008819 58               [ 2]  271 	sllw	x
      00881A 72 FB 01         [ 2]  272 	addw	x, (1, sp)
      00881D 58               [ 2]  273 	sllw	x
      00881E 5B 02            [ 2]  274 	addw	sp, #2
      008820 1F 29            [ 2]  275 	ldw	(0x29, sp), x
      008822 4B 10            [ 1]  276 	push	#0x10
      008824 4B 00            [ 1]  277 	push	#0x00
      008826 1E 3D            [ 2]  278 	ldw	x, (0x3d, sp)
      008828 89               [ 2]  279 	pushw	x
      008829 CD A3 CF         [ 4]  280 	call	__modsint
      00882C 5B 04            [ 2]  281 	addw	sp, #4
      00882E 72 FB 29         [ 2]  282 	addw	x, (0x29, sp)
      008831 1F 2F            [ 2]  283 	ldw	(0x2f, sp), x
      008833 1E 33            [ 2]  284 	ldw	x, (0x33, sp)
      008835 E6 05            [ 1]  285 	ld	a, (0x5, x)
      008837 6B 32            [ 1]  286 	ld	(0x32, sp), a
      008839 0F 31            [ 1]  287 	clr	(0x31, sp)
      00883B 4B 10            [ 1]  288 	push	#0x10
      00883D 4B 00            [ 1]  289 	push	#0x00
      00883F 1E 33            [ 2]  290 	ldw	x, (0x33, sp)
      008841 89               [ 2]  291 	pushw	x
      008842 CD A3 E5         [ 4]  292 	call	__divsint
      008845 5B 04            [ 2]  293 	addw	sp, #4
      008847 89               [ 2]  294 	pushw	x
      008848 58               [ 2]  295 	sllw	x
      008849 58               [ 2]  296 	sllw	x
      00884A 72 FB 01         [ 2]  297 	addw	x, (1, sp)
      00884D 58               [ 2]  298 	sllw	x
      00884E 5B 02            [ 2]  299 	addw	sp, #2
      008850 1F 2B            [ 2]  300 	ldw	(0x2b, sp), x
      008852 4B 10            [ 1]  301 	push	#0x10
      008854 4B 00            [ 1]  302 	push	#0x00
      008856 1E 33            [ 2]  303 	ldw	x, (0x33, sp)
      008858 89               [ 2]  304 	pushw	x
      008859 CD A3 CF         [ 4]  305 	call	__modsint
      00885C 5B 04            [ 2]  306 	addw	sp, #4
      00885E 72 FB 2B         [ 2]  307 	addw	x, (0x2b, sp)
      008861 1F 2D            [ 2]  308 	ldw	(0x2d, sp), x
      008863 1E 33            [ 2]  309 	ldw	x, (0x33, sp)
      008865 E6 04            [ 1]  310 	ld	a, (0x4, x)
      008867 6B 1B            [ 1]  311 	ld	(0x1b, sp), a
      008869 0F 1A            [ 1]  312 	clr	(0x1a, sp)
      00886B 4B 10            [ 1]  313 	push	#0x10
      00886D 4B 00            [ 1]  314 	push	#0x00
      00886F 1E 1C            [ 2]  315 	ldw	x, (0x1c, sp)
      008871 89               [ 2]  316 	pushw	x
      008872 CD A3 E5         [ 4]  317 	call	__divsint
      008875 5B 04            [ 2]  318 	addw	sp, #4
      008877 89               [ 2]  319 	pushw	x
      008878 58               [ 2]  320 	sllw	x
      008879 58               [ 2]  321 	sllw	x
      00887A 72 FB 01         [ 2]  322 	addw	x, (1, sp)
      00887D 58               [ 2]  323 	sllw	x
      00887E 5B 02            [ 2]  324 	addw	sp, #2
      008880 1F 1F            [ 2]  325 	ldw	(0x1f, sp), x
      008882 4B 10            [ 1]  326 	push	#0x10
      008884 4B 00            [ 1]  327 	push	#0x00
      008886 1E 1C            [ 2]  328 	ldw	x, (0x1c, sp)
      008888 89               [ 2]  329 	pushw	x
      008889 CD A3 CF         [ 4]  330 	call	__modsint
      00888C 5B 04            [ 2]  331 	addw	sp, #4
      00888E 72 FB 1F         [ 2]  332 	addw	x, (0x1f, sp)
      008891 51               [ 1]  333 	exgw	x, y
      008892 96               [ 1]  334 	ldw	x, sp
      008893 1C 00 10         [ 2]  335 	addw	x, #16
      008896 1F 39            [ 2]  336 	ldw	(0x39, sp), x
      008898 7B 30            [ 1]  337 	ld	a, (0x30, sp)
      00889A 88               [ 1]  338 	push	a
      00889B 7B 30            [ 1]  339 	ld	a, (0x30, sp)
      00889D 88               [ 1]  340 	push	a
      00889E 7B 30            [ 1]  341 	ld	a, (0x30, sp)
      0088A0 88               [ 1]  342 	push	a
      0088A1 7B 30            [ 1]  343 	ld	a, (0x30, sp)
      0088A3 88               [ 1]  344 	push	a
      0088A4 90 89            [ 2]  345 	pushw	y
      0088A6 4B BE            [ 1]  346 	push	#<___str_7
      0088A8 4B 80            [ 1]  347 	push	#(___str_7 >> 8)
      0088AA 89               [ 2]  348 	pushw	x
      0088AB CD A2 82         [ 4]  349 	call	_sprintf
      0088AE 5B 0A            [ 2]  350 	addw	sp, #10
                                    351 ;	main.c: 91: printf("%s",temp);
      0088B0 1E 39            [ 2]  352 	ldw	x, (0x39, sp)
      0088B2 89               [ 2]  353 	pushw	x
      0088B3 4B B9            [ 1]  354 	push	#<___str_4
      0088B5 4B 80            [ 1]  355 	push	#(___str_4 >> 8)
      0088B7 CD A3 3D         [ 4]  356 	call	_printf
      0088BA 5B 04            [ 2]  357 	addw	sp, #4
                                    358 ;	main.c: 92: printf("\r\n");
      0088BC 4B BC            [ 1]  359 	push	#<___str_6
      0088BE 4B 80            [ 1]  360 	push	#(___str_6 >> 8)
      0088C0 CD A2 FC         [ 4]  361 	call	_puts
      0088C3 5B 02            [ 2]  362 	addw	sp, #2
                                    363 ;	main.c: 93: OLED_ShowString(0,4,temp);
      0088C5 1E 39            [ 2]  364 	ldw	x, (0x39, sp)
      0088C7 89               [ 2]  365 	pushw	x
      0088C8 4B 04            [ 1]  366 	push	#0x04
      0088CA 4B 00            [ 1]  367 	push	#0x00
      0088CC CD 92 AA         [ 4]  368 	call	_OLED_ShowString
      0088CF 5B 04            [ 2]  369 	addw	sp, #4
      0088D1                        370 00102$:
                                    371 ;	main.c: 95: ds1302_port_deinit();
      0088D1 CD 8D 11         [ 4]  372 	call	_ds1302_port_deinit
                                    373 ;	main.c: 100: if(count>=2)
      0088D4 C6 00 01         [ 1]  374 	ld	a, _main_count_196608_388+0
      0088D7 A1 02            [ 1]  375 	cp	a, #0x02
      0088D9 24 03            [ 1]  376 	jrnc	00134$
      0088DB CC 89 55         [ 2]  377 	jp	00104$
      0088DE                        378 00134$:
                                    379 ;	main.c: 104: ReadDHT12(&data);
      0088DE 90 96            [ 1]  380 	ldw	y, sp
      0088E0 72 A9 00 15      [ 2]  381 	addw	y, #21
      0088E4 93               [ 1]  382 	ldw	x, y
      0088E5 90 89            [ 2]  383 	pushw	y
      0088E7 89               [ 2]  384 	pushw	x
      0088E8 CD 8C 36         [ 4]  385 	call	_ReadDHT12
      0088EB 5B 02            [ 2]  386 	addw	sp, #2
      0088ED 90 85            [ 2]  387 	popw	y
                                    388 ;	main.c: 105: sprintf(temp,"%2d.%1dC/%2d.%1d%%/%3d",data.T,data.T1,data.W,data.W1,data.sum);
      0088EF 93               [ 1]  389 	ldw	x, y
      0088F0 E6 04            [ 1]  390 	ld	a, (0x4, x)
      0088F2 6B 38            [ 1]  391 	ld	(0x38, sp), a
      0088F4 0F 37            [ 1]  392 	clr	(0x37, sp)
      0088F6 93               [ 1]  393 	ldw	x, y
      0088F7 E6 03            [ 1]  394 	ld	a, (0x3, x)
      0088F9 6B 28            [ 1]  395 	ld	(0x28, sp), a
      0088FB 0F 27            [ 1]  396 	clr	(0x27, sp)
      0088FD 93               [ 1]  397 	ldw	x, y
      0088FE E6 02            [ 1]  398 	ld	a, (0x2, x)
      008900 6B 26            [ 1]  399 	ld	(0x26, sp), a
      008902 0F 25            [ 1]  400 	clr	(0x25, sp)
      008904 93               [ 1]  401 	ldw	x, y
      008905 E6 01            [ 1]  402 	ld	a, (0x1, x)
      008907 6B 24            [ 1]  403 	ld	(0x24, sp), a
      008909 0F 23            [ 1]  404 	clr	(0x23, sp)
      00890B 90 F6            [ 1]  405 	ld	a, (y)
      00890D 0F 21            [ 1]  406 	clr	(0x21, sp)
      00890F 96               [ 1]  407 	ldw	x, sp
      008910 5C               [ 1]  408 	incw	x
      008911 1F 35            [ 2]  409 	ldw	(0x35, sp), x
      008913 90 93            [ 1]  410 	ldw	y, x
      008915 1E 37            [ 2]  411 	ldw	x, (0x37, sp)
      008917 89               [ 2]  412 	pushw	x
      008918 1E 29            [ 2]  413 	ldw	x, (0x29, sp)
      00891A 89               [ 2]  414 	pushw	x
      00891B 1E 29            [ 2]  415 	ldw	x, (0x29, sp)
      00891D 89               [ 2]  416 	pushw	x
      00891E 1E 29            [ 2]  417 	ldw	x, (0x29, sp)
      008920 89               [ 2]  418 	pushw	x
      008921 88               [ 1]  419 	push	a
      008922 7B 2A            [ 1]  420 	ld	a, (0x2a, sp)
      008924 88               [ 1]  421 	push	a
      008925 4B CA            [ 1]  422 	push	#<___str_9
      008927 4B 80            [ 1]  423 	push	#(___str_9 >> 8)
      008929 90 89            [ 2]  424 	pushw	y
      00892B CD A2 82         [ 4]  425 	call	_sprintf
      00892E 5B 0E            [ 2]  426 	addw	sp, #14
                                    427 ;	main.c: 106: printf("%s",temp);
      008930 1E 35            [ 2]  428 	ldw	x, (0x35, sp)
      008932 89               [ 2]  429 	pushw	x
      008933 4B B9            [ 1]  430 	push	#<___str_4
      008935 4B 80            [ 1]  431 	push	#(___str_4 >> 8)
      008937 CD A3 3D         [ 4]  432 	call	_printf
      00893A 5B 04            [ 2]  433 	addw	sp, #4
                                    434 ;	main.c: 107: printf("\r\n");
      00893C 4B BC            [ 1]  435 	push	#<___str_6
      00893E 4B 80            [ 1]  436 	push	#(___str_6 >> 8)
      008940 CD A2 FC         [ 4]  437 	call	_puts
      008943 5B 02            [ 2]  438 	addw	sp, #2
                                    439 ;	main.c: 108: OLED_ShowString(0,6,temp);
      008945 1E 35            [ 2]  440 	ldw	x, (0x35, sp)
      008947 89               [ 2]  441 	pushw	x
      008948 4B 06            [ 1]  442 	push	#0x06
      00894A 4B 00            [ 1]  443 	push	#0x00
      00894C CD 92 AA         [ 4]  444 	call	_OLED_ShowString
      00894F 5B 04            [ 2]  445 	addw	sp, #4
                                    446 ;	main.c: 109: count=0;
      008951 72 5F 00 01      [ 1]  447 	clr	_main_count_196608_388+0
      008955                        448 00104$:
                                    449 ;	main.c: 112: count++;
      008955 72 5C 00 01      [ 1]  450 	inc	_main_count_196608_388+0
                                    451 ;	main.c: 114: GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
      008959 4B 20            [ 1]  452 	push	#0x20
      00895B 4B 14            [ 1]  453 	push	#0x14
      00895D 4B 50            [ 1]  454 	push	#0x50
      00895F CD 95 54         [ 4]  455 	call	_GPIO_WriteReverse
      008962 5B 03            [ 2]  456 	addw	sp, #3
                                    457 ;	main.c: 115: Delay(0xffff);
      008964 4B FF            [ 1]  458 	push	#0xff
      008966 4B FF            [ 1]  459 	push	#0xff
      008968 CD 87 4B         [ 4]  460 	call	_Delay
      00896B 5B 02            [ 2]  461 	addw	sp, #2
                                    462 ;	main.c: 118: }
      00896D CC 87 94         [ 2]  463 	jp	00106$
                                    464 	.area CODE
                                    465 	.area CONST
      008090                        466 ___str_0:
      008090 53 54 4D 38 20 53 74   467 	.ascii "STM8 Started!"
             61 72 74 65 64 21
      00809D 00                     468 	.db 0x00
      00809E                        469 ___str_2:
      00809E 53 54 4D 38 20 53 74   470 	.ascii "STM8 Started!"
             61 72 74 65 64 21
      0080AB 0D                     471 	.db 0x0d
      0080AC 00                     472 	.db 0x00
      0080AD                        473 ___str_3:
      0080AD 56 3A 25 34 64 2C 53   474 	.ascii "V:%4d,S:%1d"
             3A 25 31 64
      0080B8 00                     475 	.db 0x00
      0080B9                        476 ___str_4:
      0080B9 25 73                  477 	.ascii "%s"
      0080BB 00                     478 	.db 0x00
      0080BC                        479 ___str_6:
      0080BC 0D                     480 	.db 0x0d
      0080BD 00                     481 	.db 0x00
      0080BE                        482 ___str_7:
      0080BE 25 32 64 2F 25 32 64   483 	.ascii "%2d/%2d/%2d"
             2F 25 32 64
      0080C9 00                     484 	.db 0x00
      0080CA                        485 ___str_9:
      0080CA 25 32 64 2E 25 31 64   486 	.ascii "%2d.%1dC/%2d.%1d%%/%3d"
             43 2F 25 32 64 2E 25
             31 64 25 25 2F 25 33
             64
      0080E0 00                     487 	.db 0x00
                                    488 	.area INITIALIZER
                                    489 	.area CABS (ABS)
