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
                                     21 	.globl _GPIO_WriteReverse
                                     22 	.globl _GPIO_Init
                                     23 ;--------------------------------------------------------
                                     24 ; ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area DATA
                                     27 ;--------------------------------------------------------
                                     28 ; ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area INITIALIZED
                                     31 ;--------------------------------------------------------
                                     32 ; Stack segment in internal ram 
                                     33 ;--------------------------------------------------------
                                     34 	.area	SSEG
      FFFFFF                         35 __start__stack:
      FFFFFF                         36 	.ds	1
                                     37 
                                     38 ;--------------------------------------------------------
                                     39 ; absolute external ram data
                                     40 ;--------------------------------------------------------
                                     41 	.area DABS (ABS)
                                     42 
                                     43 ; default segment ordering for linker
                                     44 	.area HOME
                                     45 	.area GSINIT
                                     46 	.area GSFINAL
                                     47 	.area CONST
                                     48 	.area INITIALIZER
                                     49 	.area CODE
                                     50 
                                     51 ;--------------------------------------------------------
                                     52 ; interrupt vector 
                                     53 ;--------------------------------------------------------
                                     54 	.area HOME
      008000                         55 __interrupt_vect:
      008000 82 00 80 07             56 	int s_GSINIT ; reset
                                     57 ;--------------------------------------------------------
                                     58 ; global & static initialisations
                                     59 ;--------------------------------------------------------
                                     60 	.area HOME
                                     61 	.area GSINIT
                                     62 	.area GSFINAL
                                     63 	.area GSINIT
      008007                         64 __sdcc_gs_init_startup:
      008007                         65 __sdcc_init_data:
                                     66 ; stm8_genXINIT() start
      008007 AE 00 00         [ 2]   67 	ldw x, #l_DATA
      00800A 27 07            [ 1]   68 	jreq	00002$
      00800C                         69 00001$:
      00800C 72 4F 00 00      [ 1]   70 	clr (s_DATA - 1, x)
      008010 5A               [ 2]   71 	decw x
      008011 26 F9            [ 1]   72 	jrne	00001$
      008013                         73 00002$:
      008013 AE 00 00         [ 2]   74 	ldw	x, #l_INITIALIZER
      008016 27 09            [ 1]   75 	jreq	00004$
      008018                         76 00003$:
      008018 D6 86 46         [ 1]   77 	ld	a, (s_INITIALIZER - 1, x)
      00801B D7 00 00         [ 1]   78 	ld	(s_INITIALIZED - 1, x), a
      00801E 5A               [ 2]   79 	decw	x
      00801F 26 F7            [ 1]   80 	jrne	00003$
      008021                         81 00004$:
                                     82 ; stm8_genXINIT() end
                                     83 	.area GSFINAL
      008021 CC 80 04         [ 2]   84 	jp	__sdcc_program_startup
                                     85 ;--------------------------------------------------------
                                     86 ; Home
                                     87 ;--------------------------------------------------------
                                     88 	.area HOME
                                     89 	.area HOME
      008004                         90 __sdcc_program_startup:
      008004 CC 86 67         [ 2]   91 	jp	_main
                                     92 ;	return from main will return to caller
                                     93 ;--------------------------------------------------------
                                     94 ; code
                                     95 ;--------------------------------------------------------
                                     96 	.area CODE
                                     97 ;	main.c: 44: void Delay(uint16_t nCount)
                                     98 ;	-----------------------------------------
                                     99 ;	 function Delay
                                    100 ;	-----------------------------------------
      00865D                        101 _Delay:
                                    102 ;	main.c: 47: while (nCount != 0)
      00865D 1E 03            [ 2]  103 	ldw	x, (0x03, sp)
      00865F                        104 00101$:
      00865F 5D               [ 2]  105 	tnzw	x
      008660 26 01            [ 1]  106 	jrne	00117$
      008662 81               [ 4]  107 	ret
      008663                        108 00117$:
                                    109 ;	main.c: 49: nCount--;
      008663 5A               [ 2]  110 	decw	x
      008664 20 F9            [ 2]  111 	jra	00101$
                                    112 ;	main.c: 51: }
      008666 81               [ 4]  113 	ret
                                    114 ;	main.c: 55: void main(void)
                                    115 ;	-----------------------------------------
                                    116 ;	 function main
                                    117 ;	-----------------------------------------
      008667                        118 _main:
      008667 52 0C            [ 2]  119 	sub	sp, #12
                                    120 ;	main.c: 59: GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      008669 4B E0            [ 1]  121 	push	#0xe0
      00866B 4B 20            [ 1]  122 	push	#0x20
      00866D 4B 14            [ 1]  123 	push	#0x14
      00866F 4B 50            [ 1]  124 	push	#0x50
      008671 CD 8C 0E         [ 4]  125 	call	_GPIO_Init
      008674 5B 04            [ 2]  126 	addw	sp, #4
                                    127 ;	main.c: 61: Init_UART2();
      008676 CD 86 DC         [ 4]  128 	call	_Init_UART2
                                    129 ;	main.c: 62: OLED_Init();
      008679 CD 8A 24         [ 4]  130 	call	_OLED_Init
                                    131 ;	main.c: 63: OLED_Clear();
      00867C CD 88 6C         [ 4]  132 	call	_OLED_Clear
                                    133 ;	main.c: 64: enableInterrupts(); //使能中断
      00867F 9A               [ 1]  134 	rim
                                    135 ;	main.c: 66: OLED_ShowString(0,0,"STM8 Started!");
      008680 4B 24            [ 1]  136 	push	#<___str_0
      008682 4B 80            [ 1]  137 	push	#(___str_0 >> 8)
      008684 4B 00            [ 1]  138 	push	#0x00
      008686 4B 00            [ 1]  139 	push	#0x00
      008688 CD 89 F1         [ 4]  140 	call	_OLED_ShowString
      00868B 5B 04            [ 2]  141 	addw	sp, #4
                                    142 ;	main.c: 67: printf("STM8 Started!\r\n");
      00868D 4B 32            [ 1]  143 	push	#<___str_2
      00868F 4B 80            [ 1]  144 	push	#(___str_2 >> 8)
      008691 CD 9A 46         [ 4]  145 	call	_puts
      008694 5B 02            [ 2]  146 	addw	sp, #2
                                    147 ;	main.c: 69: while (1)
      008696                        148 00102$:
                                    149 ;	main.c: 73: sprintf(temp,"%4d",ReadADC());
      008696 CD 8B AA         [ 4]  150 	call	_ReadADC
      008699 90 96            [ 1]  151 	ldw	y, sp
      00869B 90 5C            [ 1]  152 	incw	y
      00869D 17 0B            [ 2]  153 	ldw	(0x0b, sp), y
      00869F 89               [ 2]  154 	pushw	x
      0086A0 4B 41            [ 1]  155 	push	#<___str_3
      0086A2 4B 80            [ 1]  156 	push	#(___str_3 >> 8)
      0086A4 90 89            [ 2]  157 	pushw	y
      0086A6 CD 99 CC         [ 4]  158 	call	_sprintf
      0086A9 5B 06            [ 2]  159 	addw	sp, #6
                                    160 ;	main.c: 74: printf("%s",temp);
      0086AB 1E 0B            [ 2]  161 	ldw	x, (0x0b, sp)
      0086AD 89               [ 2]  162 	pushw	x
      0086AE 4B 45            [ 1]  163 	push	#<___str_4
      0086B0 4B 80            [ 1]  164 	push	#(___str_4 >> 8)
      0086B2 CD 9A 87         [ 4]  165 	call	_printf
      0086B5 5B 04            [ 2]  166 	addw	sp, #4
                                    167 ;	main.c: 75: OLED_ShowString(0,2,temp);
      0086B7 1E 0B            [ 2]  168 	ldw	x, (0x0b, sp)
      0086B9 89               [ 2]  169 	pushw	x
      0086BA 4B 02            [ 1]  170 	push	#0x02
      0086BC 4B 00            [ 1]  171 	push	#0x00
      0086BE CD 89 F1         [ 4]  172 	call	_OLED_ShowString
      0086C1 5B 04            [ 2]  173 	addw	sp, #4
                                    174 ;	main.c: 76: GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
      0086C3 4B 20            [ 1]  175 	push	#0x20
      0086C5 4B 14            [ 1]  176 	push	#0x14
      0086C7 4B 50            [ 1]  177 	push	#0x50
      0086C9 CD 8C 9E         [ 4]  178 	call	_GPIO_WriteReverse
      0086CC 5B 03            [ 2]  179 	addw	sp, #3
                                    180 ;	main.c: 77: Delay(0xffff);
      0086CE 4B FF            [ 1]  181 	push	#0xff
      0086D0 4B FF            [ 1]  182 	push	#0xff
      0086D2 CD 86 5D         [ 4]  183 	call	_Delay
      0086D5 5B 02            [ 2]  184 	addw	sp, #2
      0086D7 20 BD            [ 2]  185 	jra	00102$
                                    186 ;	main.c: 80: }
      0086D9 5B 0C            [ 2]  187 	addw	sp, #12
      0086DB 81               [ 4]  188 	ret
                                    189 	.area CODE
                                    190 	.area CONST
      008024                        191 ___str_0:
      008024 53 54 4D 38 20 53 74   192 	.ascii "STM8 Started!"
             61 72 74 65 64 21
      008031 00                     193 	.db 0x00
      008032                        194 ___str_2:
      008032 53 54 4D 38 20 53 74   195 	.ascii "STM8 Started!"
             61 72 74 65 64 21
      00803F 0D                     196 	.db 0x0d
      008040 00                     197 	.db 0x00
      008041                        198 ___str_3:
      008041 25 34 64               199 	.ascii "%4d"
      008044 00                     200 	.db 0x00
      008045                        201 ___str_4:
      008045 25 73                  202 	.ascii "%s"
      008047 00                     203 	.db 0x00
                                    204 	.area INITIALIZER
                                    205 	.area CABS (ABS)
