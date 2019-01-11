                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module key
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _GPIO_ReadInputPin
                                     12 	.globl _GPIO_Init
                                     13 	.globl _EXTI_SetTLISensitivity
                                     14 	.globl _EXTI_SetExtIntSensitivity
                                     15 	.globl _keycount
                                     16 	.globl _key_init
                                     17 	.globl _key_read
                                     18 ;--------------------------------------------------------
                                     19 ; ram data
                                     20 ;--------------------------------------------------------
                                     21 	.area DATA
                                     22 ;--------------------------------------------------------
                                     23 ; ram data
                                     24 ;--------------------------------------------------------
                                     25 	.area INITIALIZED
      000007                         26 _keycount::
      000007                         27 	.ds 5
                                     28 ;--------------------------------------------------------
                                     29 ; absolute external ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area DABS (ABS)
                                     32 
                                     33 ; default segment ordering for linker
                                     34 	.area HOME
                                     35 	.area GSINIT
                                     36 	.area GSFINAL
                                     37 	.area CONST
                                     38 	.area INITIALIZER
                                     39 	.area CODE
                                     40 
                                     41 ;--------------------------------------------------------
                                     42 ; global & static initialisations
                                     43 ;--------------------------------------------------------
                                     44 	.area HOME
                                     45 	.area GSINIT
                                     46 	.area GSFINAL
                                     47 	.area GSINIT
                                     48 ;--------------------------------------------------------
                                     49 ; Home
                                     50 ;--------------------------------------------------------
                                     51 	.area HOME
                                     52 	.area HOME
                                     53 ;--------------------------------------------------------
                                     54 ; code
                                     55 ;--------------------------------------------------------
                                     56 	.area CODE
                                     57 ;	driver/key.c: 4: void key_init()
                                     58 ;	-----------------------------------------
                                     59 ;	 function key_init
                                     60 ;	-----------------------------------------
      0090A3                         61 _key_init:
                                     62 ;	driver/key.c: 6: GPIO_Init(GPIOD,GPIO_PIN_0,GPIO_MODE_IN_PU_IT);
      0090A3 4B 60            [ 1]   63 	push	#0x60
      0090A5 4B 01            [ 1]   64 	push	#0x01
      0090A7 4B 0F            [ 1]   65 	push	#0x0f
      0090A9 4B 50            [ 1]   66 	push	#0x50
      0090AB CD 96 17         [ 4]   67 	call	_GPIO_Init
      0090AE 5B 04            [ 2]   68 	addw	sp, #4
                                     69 ;	driver/key.c: 7: GPIO_Init(GPIOD,GPIO_PIN_1,GPIO_MODE_IN_PU_IT);
      0090B0 4B 60            [ 1]   70 	push	#0x60
      0090B2 4B 02            [ 1]   71 	push	#0x02
      0090B4 4B 0F            [ 1]   72 	push	#0x0f
      0090B6 4B 50            [ 1]   73 	push	#0x50
      0090B8 CD 96 17         [ 4]   74 	call	_GPIO_Init
      0090BB 5B 04            [ 2]   75 	addw	sp, #4
                                     76 ;	driver/key.c: 8: GPIO_Init(GPIOD,GPIO_PIN_2,GPIO_MODE_IN_PU_IT);
      0090BD 4B 60            [ 1]   77 	push	#0x60
      0090BF 4B 04            [ 1]   78 	push	#0x04
      0090C1 4B 0F            [ 1]   79 	push	#0x0f
      0090C3 4B 50            [ 1]   80 	push	#0x50
      0090C5 CD 96 17         [ 4]   81 	call	_GPIO_Init
      0090C8 5B 04            [ 2]   82 	addw	sp, #4
                                     83 ;	driver/key.c: 9: GPIO_Init(GPIOD,GPIO_PIN_3,GPIO_MODE_IN_PU_IT);
      0090CA 4B 60            [ 1]   84 	push	#0x60
      0090CC 4B 08            [ 1]   85 	push	#0x08
      0090CE 4B 0F            [ 1]   86 	push	#0x0f
      0090D0 4B 50            [ 1]   87 	push	#0x50
      0090D2 CD 96 17         [ 4]   88 	call	_GPIO_Init
      0090D5 5B 04            [ 2]   89 	addw	sp, #4
                                     90 ;	driver/key.c: 10: GPIO_Init(GPIOD,GPIO_PIN_4,GPIO_MODE_IN_PU_IT);
      0090D7 4B 60            [ 1]   91 	push	#0x60
      0090D9 4B 10            [ 1]   92 	push	#0x10
      0090DB 4B 0F            [ 1]   93 	push	#0x0f
      0090DD 4B 50            [ 1]   94 	push	#0x50
      0090DF CD 96 17         [ 4]   95 	call	_GPIO_Init
      0090E2 5B 04            [ 2]   96 	addw	sp, #4
                                     97 ;	driver/key.c: 11: EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD,EXTI_SENSITIVITY_FALL_ONLY);
      0090E4 4B 02            [ 1]   98 	push	#0x02
      0090E6 4B 03            [ 1]   99 	push	#0x03
      0090E8 CD 99 AD         [ 4]  100 	call	_EXTI_SetExtIntSensitivity
      0090EB 5B 02            [ 2]  101 	addw	sp, #2
                                    102 ;	driver/key.c: 12: EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
      0090ED 4B 00            [ 1]  103 	push	#0x00
      0090EF CD 9A 3F         [ 4]  104 	call	_EXTI_SetTLISensitivity
      0090F2 84               [ 1]  105 	pop	a
                                    106 ;	driver/key.c: 13: }
      0090F3 81               [ 4]  107 	ret
                                    108 ;	driver/key.c: 14: BitStatus key_read(u8 num)
                                    109 ;	-----------------------------------------
                                    110 ;	 function key_read
                                    111 ;	-----------------------------------------
      0090F4                        112 _key_read:
                                    113 ;	driver/key.c: 17: return GPIO_ReadInputPin(GPIOD,GPIO_PIN_0 << num);
      0090F4 A6 01            [ 1]  114 	ld	a, #0x01
      0090F6 88               [ 1]  115 	push	a
      0090F7 7B 04            [ 1]  116 	ld	a, (0x04, sp)
      0090F9 27 05            [ 1]  117 	jreq	00104$
      0090FB                        118 00103$:
      0090FB 08 01            [ 1]  119 	sll	(1, sp)
      0090FD 4A               [ 1]  120 	dec	a
      0090FE 26 FB            [ 1]  121 	jrne	00103$
      009100                        122 00104$:
      009100 84               [ 1]  123 	pop	a
      009101 88               [ 1]  124 	push	a
      009102 4B 0F            [ 1]  125 	push	#0x0f
      009104 4B 50            [ 1]  126 	push	#0x50
      009106 CD 96 B7         [ 4]  127 	call	_GPIO_ReadInputPin
      009109 5B 03            [ 2]  128 	addw	sp, #3
                                    129 ;	driver/key.c: 19: }
      00910B 81               [ 4]  130 	ret
                                    131 	.area CODE
                                    132 	.area CONST
                                    133 	.area INITIALIZER
      0086F7                        134 __xinit__keycount:
      0086F7 00                     135 	.db #0x00	; 0
      0086F8 00                     136 	.db #0x00	; 0
      0086F9 00                     137 	.db #0x00	; 0
      0086FA 00                     138 	.db #0x00	; 0
      0086FB 00                     139 	.db #0x00	; 0
                                    140 	.area CABS (ABS)
