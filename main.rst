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
                                     17 	.globl _Init_UART2
                                     18 	.globl _OLED_ShowString
                                     19 	.globl _OLED_Clear
                                     20 	.globl _OLED_Init
                                     21 	.globl _GPIO_ReadInputPin
                                     22 	.globl _GPIO_WriteReverse
                                     23 	.globl _GPIO_Init
                                     24 ;--------------------------------------------------------
                                     25 ; ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area DATA
                                     28 ;--------------------------------------------------------
                                     29 ; ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area INITIALIZED
                                     32 ;--------------------------------------------------------
                                     33 ; Stack segment in internal ram 
                                     34 ;--------------------------------------------------------
                                     35 	.area	SSEG
      FFFFFF                         36 __start__stack:
      FFFFFF                         37 	.ds	1
                                     38 
                                     39 ;--------------------------------------------------------
                                     40 ; absolute external ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area DABS (ABS)
                                     43 
                                     44 ; default segment ordering for linker
                                     45 	.area HOME
                                     46 	.area GSINIT
                                     47 	.area GSFINAL
                                     48 	.area CONST
                                     49 	.area INITIALIZER
                                     50 	.area CODE
                                     51 
                                     52 ;--------------------------------------------------------
                                     53 ; interrupt vector 
                                     54 ;--------------------------------------------------------
                                     55 	.area HOME
      008000                         56 __interrupt_vect:
      008000 82 00 80 07             57 	int s_GSINIT ; reset
                                     58 ;--------------------------------------------------------
                                     59 ; global & static initialisations
                                     60 ;--------------------------------------------------------
                                     61 	.area HOME
                                     62 	.area GSINIT
                                     63 	.area GSFINAL
                                     64 	.area GSINIT
      008007                         65 __sdcc_gs_init_startup:
      008007                         66 __sdcc_init_data:
                                     67 ; stm8_genXINIT() start
      008007 AE 00 00         [ 2]   68 	ldw x, #l_DATA
      00800A 27 07            [ 1]   69 	jreq	00002$
      00800C                         70 00001$:
      00800C 72 4F 00 00      [ 1]   71 	clr (s_DATA - 1, x)
      008010 5A               [ 2]   72 	decw x
      008011 26 F9            [ 1]   73 	jrne	00001$
      008013                         74 00002$:
      008013 AE 00 00         [ 2]   75 	ldw	x, #l_INITIALIZER
      008016 27 09            [ 1]   76 	jreq	00004$
      008018                         77 00003$:
      008018 D6 86 50         [ 1]   78 	ld	a, (s_INITIALIZER - 1, x)
      00801B D7 00 00         [ 1]   79 	ld	(s_INITIALIZED - 1, x), a
      00801E 5A               [ 2]   80 	decw	x
      00801F 26 F7            [ 1]   81 	jrne	00003$
      008021                         82 00004$:
                                     83 ; stm8_genXINIT() end
                                     84 	.area GSFINAL
      008021 CC 80 04         [ 2]   85 	jp	__sdcc_program_startup
                                     86 ;--------------------------------------------------------
                                     87 ; Home
                                     88 ;--------------------------------------------------------
                                     89 	.area HOME
                                     90 	.area HOME
      008004                         91 __sdcc_program_startup:
      008004 CC 86 71         [ 2]   92 	jp	_main
                                     93 ;	return from main will return to caller
                                     94 ;--------------------------------------------------------
                                     95 ; code
                                     96 ;--------------------------------------------------------
                                     97 	.area CODE
                                     98 ;	main.c: 44: void Delay(uint16_t nCount)
                                     99 ;	-----------------------------------------
                                    100 ;	 function Delay
                                    101 ;	-----------------------------------------
      008667                        102 _Delay:
                                    103 ;	main.c: 47: while (nCount != 0)
      008667 1E 03            [ 2]  104 	ldw	x, (0x03, sp)
      008669                        105 00101$:
      008669 5D               [ 2]  106 	tnzw	x
      00866A 26 01            [ 1]  107 	jrne	00117$
      00866C 81               [ 4]  108 	ret
      00866D                        109 00117$:
                                    110 ;	main.c: 49: nCount--;
      00866D 5A               [ 2]  111 	decw	x
      00866E 20 F9            [ 2]  112 	jra	00101$
                                    113 ;	main.c: 51: }
      008670 81               [ 4]  114 	ret
                                    115 ;	main.c: 55: void main(void)
                                    116 ;	-----------------------------------------
                                    117 ;	 function main
                                    118 ;	-----------------------------------------
      008671                        119 _main:
      008671 52 0E            [ 2]  120 	sub	sp, #14
                                    121 ;	main.c: 59: GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      008673 4B E0            [ 1]  122 	push	#0xe0
      008675 4B 20            [ 1]  123 	push	#0x20
      008677 4B 14            [ 1]  124 	push	#0x14
      008679 4B 50            [ 1]  125 	push	#0x50
      00867B CD 8C 4C         [ 4]  126 	call	_GPIO_Init
      00867E 5B 04            [ 2]  127 	addw	sp, #4
                                    128 ;	main.c: 60: GPIO_Init(GPIOF,GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
      008680 4B 00            [ 1]  129 	push	#0x00
      008682 4B 10            [ 1]  130 	push	#0x10
      008684 4B 19            [ 1]  131 	push	#0x19
      008686 4B 50            [ 1]  132 	push	#0x50
      008688 CD 8C 4C         [ 4]  133 	call	_GPIO_Init
      00868B 5B 04            [ 2]  134 	addw	sp, #4
                                    135 ;	main.c: 62: Init_UART2();
      00868D CD 87 1A         [ 4]  136 	call	_Init_UART2
                                    137 ;	main.c: 63: OLED_Init();
      008690 CD 8A 62         [ 4]  138 	call	_OLED_Init
                                    139 ;	main.c: 64: OLED_Clear();
      008693 CD 88 AA         [ 4]  140 	call	_OLED_Clear
                                    141 ;	main.c: 65: enableInterrupts(); //使能中断
      008696 9A               [ 1]  142 	rim
                                    143 ;	main.c: 67: OLED_ShowString(0,0,"STM8 Started!");
      008697 4B 24            [ 1]  144 	push	#<___str_0
      008699 4B 80            [ 1]  145 	push	#(___str_0 >> 8)
      00869B 4B 00            [ 1]  146 	push	#0x00
      00869D 4B 00            [ 1]  147 	push	#0x00
      00869F CD 8A 2F         [ 4]  148 	call	_OLED_ShowString
      0086A2 5B 04            [ 2]  149 	addw	sp, #4
                                    150 ;	main.c: 68: printf("STM8 Started!\r\n");
      0086A4 4B 32            [ 1]  151 	push	#<___str_2
      0086A6 4B 80            [ 1]  152 	push	#(___str_2 >> 8)
      0086A8 CD 9A 84         [ 4]  153 	call	_puts
      0086AB 5B 02            [ 2]  154 	addw	sp, #2
                                    155 ;	main.c: 70: while (1)
      0086AD                        156 00102$:
                                    157 ;	main.c: 74: sprintf(temp,"V:%4d,S:%1d",ReadADC(),GPIO_ReadInputPin(GPIOF,GPIO_PIN_4)==RESET?0:1);
      0086AD 4B 10            [ 1]  158 	push	#0x10
      0086AF 4B 19            [ 1]  159 	push	#0x19
      0086B1 4B 50            [ 1]  160 	push	#0x50
      0086B3 CD 8C EC         [ 4]  161 	call	_GPIO_ReadInputPin
      0086B6 5B 03            [ 2]  162 	addw	sp, #3
      0086B8 4D               [ 1]  163 	tnz	a
      0086B9 26 05            [ 1]  164 	jrne	00106$
      0086BB 5F               [ 1]  165 	clrw	x
      0086BC 1F 0B            [ 2]  166 	ldw	(0x0b, sp), x
      0086BE 20 05            [ 2]  167 	jra	00107$
      0086C0                        168 00106$:
      0086C0 AE 00 01         [ 2]  169 	ldw	x, #0x0001
      0086C3 1F 0B            [ 2]  170 	ldw	(0x0b, sp), x
      0086C5                        171 00107$:
      0086C5 CD 8B E8         [ 4]  172 	call	_ReadADC
      0086C8 90 96            [ 1]  173 	ldw	y, sp
      0086CA 90 5C            [ 1]  174 	incw	y
      0086CC 17 0D            [ 2]  175 	ldw	(0x0d, sp), y
      0086CE 7B 0C            [ 1]  176 	ld	a, (0x0c, sp)
      0086D0 88               [ 1]  177 	push	a
      0086D1 7B 0C            [ 1]  178 	ld	a, (0x0c, sp)
      0086D3 88               [ 1]  179 	push	a
      0086D4 89               [ 2]  180 	pushw	x
      0086D5 4B 41            [ 1]  181 	push	#<___str_3
      0086D7 4B 80            [ 1]  182 	push	#(___str_3 >> 8)
      0086D9 90 89            [ 2]  183 	pushw	y
      0086DB CD 9A 0A         [ 4]  184 	call	_sprintf
      0086DE 5B 08            [ 2]  185 	addw	sp, #8
                                    186 ;	main.c: 75: printf("%s",temp);
      0086E0 1E 0D            [ 2]  187 	ldw	x, (0x0d, sp)
      0086E2 89               [ 2]  188 	pushw	x
      0086E3 4B 4D            [ 1]  189 	push	#<___str_4
      0086E5 4B 80            [ 1]  190 	push	#(___str_4 >> 8)
      0086E7 CD 9A C5         [ 4]  191 	call	_printf
      0086EA 5B 04            [ 2]  192 	addw	sp, #4
                                    193 ;	main.c: 76: printf("\r\n");
      0086EC 4B 50            [ 1]  194 	push	#<___str_6
      0086EE 4B 80            [ 1]  195 	push	#(___str_6 >> 8)
      0086F0 CD 9A 84         [ 4]  196 	call	_puts
      0086F3 5B 02            [ 2]  197 	addw	sp, #2
                                    198 ;	main.c: 77: OLED_ShowString(0,2,temp);
      0086F5 1E 0D            [ 2]  199 	ldw	x, (0x0d, sp)
      0086F7 89               [ 2]  200 	pushw	x
      0086F8 4B 02            [ 1]  201 	push	#0x02
      0086FA 4B 00            [ 1]  202 	push	#0x00
      0086FC CD 8A 2F         [ 4]  203 	call	_OLED_ShowString
      0086FF 5B 04            [ 2]  204 	addw	sp, #4
                                    205 ;	main.c: 78: GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
      008701 4B 20            [ 1]  206 	push	#0x20
      008703 4B 14            [ 1]  207 	push	#0x14
      008705 4B 50            [ 1]  208 	push	#0x50
      008707 CD 8C DC         [ 4]  209 	call	_GPIO_WriteReverse
      00870A 5B 03            [ 2]  210 	addw	sp, #3
                                    211 ;	main.c: 79: Delay(0xffff);
      00870C 4B FF            [ 1]  212 	push	#0xff
      00870E 4B FF            [ 1]  213 	push	#0xff
      008710 CD 86 67         [ 4]  214 	call	_Delay
      008713 5B 02            [ 2]  215 	addw	sp, #2
      008715 20 96            [ 2]  216 	jra	00102$
                                    217 ;	main.c: 82: }
      008717 5B 0E            [ 2]  218 	addw	sp, #14
      008719 81               [ 4]  219 	ret
                                    220 	.area CODE
                                    221 	.area CONST
      008024                        222 ___str_0:
      008024 53 54 4D 38 20 53 74   223 	.ascii "STM8 Started!"
             61 72 74 65 64 21
      008031 00                     224 	.db 0x00
      008032                        225 ___str_2:
      008032 53 54 4D 38 20 53 74   226 	.ascii "STM8 Started!"
             61 72 74 65 64 21
      00803F 0D                     227 	.db 0x0d
      008040 00                     228 	.db 0x00
      008041                        229 ___str_3:
      008041 56 3A 25 34 64 2C 53   230 	.ascii "V:%4d,S:%1d"
             3A 25 31 64
      00804C 00                     231 	.db 0x00
      00804D                        232 ___str_4:
      00804D 25 73                  233 	.ascii "%s"
      00804F 00                     234 	.db 0x00
      008050                        235 ___str_6:
      008050 0D                     236 	.db 0x0d
      008051 00                     237 	.db 0x00
                                    238 	.area INITIALIZER
                                    239 	.area CABS (ABS)
