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
      000002                         26 _keycount::
      000002                         27 	.ds 5
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
      008DED                         61 _key_init:
                                     62 ;	driver/key.c: 5: GPIO_Init(GPIOD,GPIO_PIN_0,GPIO_MODE_IN_PU_IT);
      008DED 4B 60            [ 1]   63 	push	#0x60
      008DEF 4B 01            [ 1]   64 	push	#0x01
      008DF1 4B 0F            [ 1]   65 	push	#0x0f
      008DF3 4B 50            [ 1]   66 	push	#0x50
      008DF5 CD 96 09         [ 4]   67 	call	_GPIO_Init
      008DF8 5B 04            [ 2]   68 	addw	sp, #4
                                     69 ;	driver/key.c: 6: GPIO_Init(GPIOD,GPIO_PIN_1,GPIO_MODE_IN_PU_IT);
      008DFA 4B 60            [ 1]   70 	push	#0x60
      008DFC 4B 02            [ 1]   71 	push	#0x02
      008DFE 4B 0F            [ 1]   72 	push	#0x0f
      008E00 4B 50            [ 1]   73 	push	#0x50
      008E02 CD 96 09         [ 4]   74 	call	_GPIO_Init
      008E05 5B 04            [ 2]   75 	addw	sp, #4
                                     76 ;	driver/key.c: 7: GPIO_Init(GPIOD,GPIO_PIN_2,GPIO_MODE_IN_PU_IT);
      008E07 4B 60            [ 1]   77 	push	#0x60
      008E09 4B 04            [ 1]   78 	push	#0x04
      008E0B 4B 0F            [ 1]   79 	push	#0x0f
      008E0D 4B 50            [ 1]   80 	push	#0x50
      008E0F CD 96 09         [ 4]   81 	call	_GPIO_Init
      008E12 5B 04            [ 2]   82 	addw	sp, #4
                                     83 ;	driver/key.c: 8: GPIO_Init(GPIOD,GPIO_PIN_3,GPIO_MODE_IN_PU_IT);
      008E14 4B 60            [ 1]   84 	push	#0x60
      008E16 4B 08            [ 1]   85 	push	#0x08
      008E18 4B 0F            [ 1]   86 	push	#0x0f
      008E1A 4B 50            [ 1]   87 	push	#0x50
      008E1C CD 96 09         [ 4]   88 	call	_GPIO_Init
      008E1F 5B 04            [ 2]   89 	addw	sp, #4
                                     90 ;	driver/key.c: 9: GPIO_Init(GPIOD,GPIO_PIN_4,GPIO_MODE_IN_PU_IT);
      008E21 4B 60            [ 1]   91 	push	#0x60
      008E23 4B 10            [ 1]   92 	push	#0x10
      008E25 4B 0F            [ 1]   93 	push	#0x0f
      008E27 4B 50            [ 1]   94 	push	#0x50
      008E29 CD 96 09         [ 4]   95 	call	_GPIO_Init
      008E2C 5B 04            [ 2]   96 	addw	sp, #4
                                     97 ;	driver/key.c: 10: EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD,EXTI_SENSITIVITY_FALL_ONLY);
      008E2E 4B 02            [ 1]   98 	push	#0x02
      008E30 4B 03            [ 1]   99 	push	#0x03
      008E32 CD 96 D5         [ 4]  100 	call	_EXTI_SetExtIntSensitivity
      008E35 5B 02            [ 2]  101 	addw	sp, #2
                                    102 ;	driver/key.c: 11: EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
      008E37 4B 00            [ 1]  103 	push	#0x00
      008E39 CD 97 67         [ 4]  104 	call	_EXTI_SetTLISensitivity
      008E3C 84               [ 1]  105 	pop	a
                                    106 ;	driver/key.c: 12: }
      008E3D 81               [ 4]  107 	ret
                                    108 ;	driver/key.c: 13: BitStatus key_read(u8 num)
                                    109 ;	-----------------------------------------
                                    110 ;	 function key_read
                                    111 ;	-----------------------------------------
      008E3E                        112 _key_read:
                                    113 ;	driver/key.c: 16: return GPIO_ReadInputPin(GPIOD,GPIO_PIN_0 << num);
      008E3E A6 01            [ 1]  114 	ld	a, #0x01
      008E40 88               [ 1]  115 	push	a
      008E41 7B 04            [ 1]  116 	ld	a, (0x04, sp)
      008E43 27 05            [ 1]  117 	jreq	00104$
      008E45                        118 00103$:
      008E45 08 01            [ 1]  119 	sll	(1, sp)
      008E47 4A               [ 1]  120 	dec	a
      008E48 26 FB            [ 1]  121 	jrne	00103$
      008E4A                        122 00104$:
      008E4A 84               [ 1]  123 	pop	a
      008E4B 88               [ 1]  124 	push	a
      008E4C 4B 0F            [ 1]  125 	push	#0x0f
      008E4E 4B 50            [ 1]  126 	push	#0x50
      008E50 CD 96 A9         [ 4]  127 	call	_GPIO_ReadInputPin
      008E53 5B 03            [ 2]  128 	addw	sp, #3
                                    129 ;	driver/key.c: 18: }
      008E55 81               [ 4]  130 	ret
                                    131 	.area CODE
                                    132 	.area CONST
                                    133 	.area INITIALIZER
      0086F4                        134 __xinit__keycount:
      0086F4 00                     135 	.db #0x00	; 0
      0086F5 00                     136 	.db #0x00	; 0
      0086F6 00                     137 	.db #0x00	; 0
      0086F7 00                     138 	.db #0x00	; 0
      0086F8 00                     139 	.db #0x00	; 0
                                    140 	.area CABS (ABS)
