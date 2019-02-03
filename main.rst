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
                                     13 	.globl _app_loop
                                     14 	.globl _app_init
                                     15 	.globl _driver_loop
                                     16 	.globl _driver_init
                                     17 ;--------------------------------------------------------
                                     18 ; ram data
                                     19 ;--------------------------------------------------------
                                     20 	.area DATA
                                     21 ;--------------------------------------------------------
                                     22 ; ram data
                                     23 ;--------------------------------------------------------
                                     24 	.area INITIALIZED
                                     25 ;--------------------------------------------------------
                                     26 ; Stack segment in internal ram 
                                     27 ;--------------------------------------------------------
                                     28 	.area	SSEG
      FFFFFF                         29 __start__stack:
      FFFFFF                         30 	.ds	1
                                     31 
                                     32 ;--------------------------------------------------------
                                     33 ; absolute external ram data
                                     34 ;--------------------------------------------------------
                                     35 	.area DABS (ABS)
                                     36 
                                     37 ; default segment ordering for linker
                                     38 	.area HOME
                                     39 	.area GSINIT
                                     40 	.area GSFINAL
                                     41 	.area CONST
                                     42 	.area INITIALIZER
                                     43 	.area CODE
                                     44 
                                     45 ;--------------------------------------------------------
                                     46 ; interrupt vector 
                                     47 ;--------------------------------------------------------
                                     48 	.area HOME
      008000                         49 __interrupt_vect:
      008000 82 00 80 6F             50 	int s_GSINIT ; reset
      008004 82 00 8E 41             51 	int _TRAP_IRQHandler ; trap
      008008 82 00 8E 42             52 	int _TLI_IRQHandler ; int0
      00800C 82 00 8E 43             53 	int _AWU_IRQHandler ; int1
      008010 82 00 8E 44             54 	int _CLK_IRQHandler ; int2
      008014 82 00 8E 45             55 	int _EXTI_PORTA_IRQHandler ; int3
      008018 82 00 8E 46             56 	int _EXTI_PORTB_IRQHandler ; int4
      00801C 82 00 8E 47             57 	int _EXTI_PORTC_IRQHandler ; int5
      008020 82 00 8E 48             58 	int _EXTI_PORTD_IRQHandler ; int6
      008024 82 00 8E 74             59 	int _EXTI_PORTE_IRQHandler ; int7
      008028 82 00 00 00             60 	int 0x000000 ; int8
      00802C 82 00 00 00             61 	int 0x000000 ; int9
      008030 82 00 8E 75             62 	int _SPI_IRQHandler ; int10
      008034 82 00 8E 76             63 	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
      008038 82 00 8E 77             64 	int _TIM1_CAP_COM_IRQHandler ; int12
      00803C 82 00 8E 78             65 	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
      008040 82 00 8E 79             66 	int _TIM2_CAP_COM_IRQHandler ; int14
      008044 82 00 00 00             67 	int 0x000000 ; int15
      008048 82 00 00 00             68 	int 0x000000 ; int16
      00804C 82 00 00 00             69 	int 0x000000 ; int17
      008050 82 00 00 00             70 	int 0x000000 ; int18
      008054 82 00 8E 7C             71 	int _I2C_IRQHandler ; int19
      008058 82 00 8E 7D             72 	int _UART2_TX_IRQHandler ; int20
      00805C 82 00 8E 7E             73 	int _UART2_RX_IRQHandler ; int21
      008060 82 00 8F 0B             74 	int _ADC1_IRQHandler ; int22
      008064 82 00 8F 0C             75 	int _TIM4_UPD_OVF_IRQHandler ; int23
      008068 82 00 8F 0D             76 	int _EEPROM_EEC_IRQHandler ; int24
                                     77 ;--------------------------------------------------------
                                     78 ; global & static initialisations
                                     79 ;--------------------------------------------------------
                                     80 	.area HOME
                                     81 	.area GSINIT
                                     82 	.area GSFINAL
                                     83 	.area GSINIT
      00806F                         84 __sdcc_gs_init_startup:
      00806F                         85 __sdcc_init_data:
                                     86 ; stm8_genXINIT() start
      00806F AE 00 96         [ 2]   87 	ldw x, #l_DATA
      008072 27 07            [ 1]   88 	jreq	00002$
      008074                         89 00001$:
      008074 72 4F 00 00      [ 1]   90 	clr (s_DATA - 1, x)
      008078 5A               [ 2]   91 	decw x
      008079 26 F9            [ 1]   92 	jrne	00001$
      00807B                         93 00002$:
      00807B AE 00 07         [ 2]   94 	ldw	x, #l_INITIALIZER
      00807E 27 09            [ 1]   95 	jreq	00004$
      008080                         96 00003$:
      008080 D6 87 03         [ 1]   97 	ld	a, (s_INITIALIZER - 1, x)
      008083 D7 00 96         [ 1]   98 	ld	(s_INITIALIZED - 1, x), a
      008086 5A               [ 2]   99 	decw	x
      008087 26 F7            [ 1]  100 	jrne	00003$
      008089                        101 00004$:
                                    102 ; stm8_genXINIT() end
                                    103 	.area GSFINAL
      008089 CC 80 6C         [ 2]  104 	jp	__sdcc_program_startup
                                    105 ;--------------------------------------------------------
                                    106 ; Home
                                    107 ;--------------------------------------------------------
                                    108 	.area HOME
                                    109 	.area HOME
      00806C                        110 __sdcc_program_startup:
      00806C CC 87 32         [ 2]  111 	jp	_main
                                    112 ;	return from main will return to caller
                                    113 ;--------------------------------------------------------
                                    114 ; code
                                    115 ;--------------------------------------------------------
                                    116 	.area CODE
                                    117 ;	main.c: 5: void Delay(u32 i)
                                    118 ;	-----------------------------------------
                                    119 ;	 function Delay
                                    120 ;	-----------------------------------------
      00870B                        121 _Delay:
      00870B 52 08            [ 2]  122 	sub	sp, #8
                                    123 ;	main.c: 7: while(i--);
      00870D 16 0B            [ 2]  124 	ldw	y, (0x0b, sp)
      00870F 17 05            [ 2]  125 	ldw	(0x05, sp), y
      008711 16 0D            [ 2]  126 	ldw	y, (0x0d, sp)
      008713                        127 00101$:
      008713 1E 05            [ 2]  128 	ldw	x, (0x05, sp)
      008715 1F 01            [ 2]  129 	ldw	(0x01, sp), x
      008717 93               [ 1]  130 	ldw	x, y
      008718 72 A2 00 01      [ 2]  131 	subw	y, #0x0001
      00871C 7B 06            [ 1]  132 	ld	a, (0x06, sp)
      00871E A2 00            [ 1]  133 	sbc	a, #0x00
      008720 6B 06            [ 1]  134 	ld	(0x06, sp), a
      008722 7B 05            [ 1]  135 	ld	a, (0x05, sp)
      008724 A2 00            [ 1]  136 	sbc	a, #0x00
      008726 6B 05            [ 1]  137 	ld	(0x05, sp), a
      008728 5D               [ 2]  138 	tnzw	x
      008729 26 E8            [ 1]  139 	jrne	00101$
      00872B 1E 01            [ 2]  140 	ldw	x, (0x01, sp)
      00872D 26 E4            [ 1]  141 	jrne	00101$
                                    142 ;	main.c: 8: }
      00872F 5B 08            [ 2]  143 	addw	sp, #8
      008731 81               [ 4]  144 	ret
                                    145 ;	main.c: 9: int main()
                                    146 ;	-----------------------------------------
                                    147 ;	 function main
                                    148 ;	-----------------------------------------
      008732                        149 _main:
                                    150 ;	main.c: 11: driver_init();
      008732 CD 8A 64         [ 4]  151 	call	_driver_init
                                    152 ;	main.c: 12: app_init();
      008735 CD 95 37         [ 4]  153 	call	_app_init
                                    154 ;	main.c: 13: while(1)
      008738                        155 00102$:
                                    156 ;	main.c: 15: driver_loop();
      008738 CD 8A 78         [ 4]  157 	call	_driver_loop
                                    158 ;	main.c: 16: app_loop();
      00873B CD 95 68         [ 4]  159 	call	_app_loop
      00873E 20 F8            [ 2]  160 	jra	00102$
                                    161 ;	main.c: 19: }
      008740 81               [ 4]  162 	ret
                                    163 	.area CODE
                                    164 	.area CONST
                                    165 	.area INITIALIZER
                                    166 	.area CABS (ABS)
