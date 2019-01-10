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
                                     57 ;	driver/key.c: 3: void key_init()
                                     58 ;	-----------------------------------------
                                     59 ;	 function key_init
                                     60 ;	-----------------------------------------
      009165                         61 _key_init:
                                     62 ;	driver/key.c: 5: GPIO_Init(GPIOD,GPIO_PIN_0,GPIO_MODE_IN_PU_IT);
      009165 4B 60            [ 1]   63 	push	#0x60
      009167 4B 01            [ 1]   64 	push	#0x01
      009169 4B 0F            [ 1]   65 	push	#0x0f
      00916B 4B 50            [ 1]   66 	push	#0x50
      00916D CD 96 7D         [ 4]   67 	call	_GPIO_Init
      009170 5B 04            [ 2]   68 	addw	sp, #4
                                     69 ;	driver/key.c: 6: GPIO_Init(GPIOD,GPIO_PIN_1,GPIO_MODE_IN_PU_IT);
      009172 4B 60            [ 1]   70 	push	#0x60
      009174 4B 02            [ 1]   71 	push	#0x02
      009176 4B 0F            [ 1]   72 	push	#0x0f
      009178 4B 50            [ 1]   73 	push	#0x50
      00917A CD 96 7D         [ 4]   74 	call	_GPIO_Init
      00917D 5B 04            [ 2]   75 	addw	sp, #4
                                     76 ;	driver/key.c: 7: GPIO_Init(GPIOD,GPIO_PIN_2,GPIO_MODE_IN_PU_IT);
      00917F 4B 60            [ 1]   77 	push	#0x60
      009181 4B 04            [ 1]   78 	push	#0x04
      009183 4B 0F            [ 1]   79 	push	#0x0f
      009185 4B 50            [ 1]   80 	push	#0x50
      009187 CD 96 7D         [ 4]   81 	call	_GPIO_Init
      00918A 5B 04            [ 2]   82 	addw	sp, #4
                                     83 ;	driver/key.c: 8: GPIO_Init(GPIOD,GPIO_PIN_3,GPIO_MODE_IN_PU_IT);
      00918C 4B 60            [ 1]   84 	push	#0x60
      00918E 4B 08            [ 1]   85 	push	#0x08
      009190 4B 0F            [ 1]   86 	push	#0x0f
      009192 4B 50            [ 1]   87 	push	#0x50
      009194 CD 96 7D         [ 4]   88 	call	_GPIO_Init
      009197 5B 04            [ 2]   89 	addw	sp, #4
                                     90 ;	driver/key.c: 9: GPIO_Init(GPIOD,GPIO_PIN_4,GPIO_MODE_IN_PU_IT);
      009199 4B 60            [ 1]   91 	push	#0x60
      00919B 4B 10            [ 1]   92 	push	#0x10
      00919D 4B 0F            [ 1]   93 	push	#0x0f
      00919F 4B 50            [ 1]   94 	push	#0x50
      0091A1 CD 96 7D         [ 4]   95 	call	_GPIO_Init
      0091A4 5B 04            [ 2]   96 	addw	sp, #4
                                     97 ;	driver/key.c: 10: EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD,EXTI_SENSITIVITY_FALL_ONLY);
      0091A6 4B 02            [ 1]   98 	push	#0x02
      0091A8 4B 03            [ 1]   99 	push	#0x03
      0091AA CD 9A 13         [ 4]  100 	call	_EXTI_SetExtIntSensitivity
      0091AD 5B 02            [ 2]  101 	addw	sp, #2
                                    102 ;	driver/key.c: 11: EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
      0091AF 4B 00            [ 1]  103 	push	#0x00
      0091B1 CD 9A A5         [ 4]  104 	call	_EXTI_SetTLISensitivity
      0091B4 84               [ 1]  105 	pop	a
                                    106 ;	driver/key.c: 12: }
      0091B5 81               [ 4]  107 	ret
                                    108 ;	driver/key.c: 13: BitStatus key_read(u8 num)
                                    109 ;	-----------------------------------------
                                    110 ;	 function key_read
                                    111 ;	-----------------------------------------
      0091B6                        112 _key_read:
                                    113 ;	driver/key.c: 16: return GPIO_ReadInputPin(GPIOD,GPIO_PIN_0 << num);
      0091B6 A6 01            [ 1]  114 	ld	a, #0x01
      0091B8 88               [ 1]  115 	push	a
      0091B9 7B 04            [ 1]  116 	ld	a, (0x04, sp)
      0091BB 27 05            [ 1]  117 	jreq	00104$
      0091BD                        118 00103$:
      0091BD 08 01            [ 1]  119 	sll	(1, sp)
      0091BF 4A               [ 1]  120 	dec	a
      0091C0 26 FB            [ 1]  121 	jrne	00103$
      0091C2                        122 00104$:
      0091C2 84               [ 1]  123 	pop	a
      0091C3 88               [ 1]  124 	push	a
      0091C4 4B 0F            [ 1]  125 	push	#0x0f
      0091C6 4B 50            [ 1]  126 	push	#0x50
      0091C8 CD 97 1D         [ 4]  127 	call	_GPIO_ReadInputPin
      0091CB 5B 03            [ 2]  128 	addw	sp, #3
                                    129 ;	driver/key.c: 18: }
      0091CD 81               [ 4]  130 	ret
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
