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
                                     11 	.globl _ITC_SetSoftwarePriority
                                     12 	.globl _GPIO_ReadInputPin
                                     13 	.globl _GPIO_Init
                                     14 	.globl _EXTI_SetTLISensitivity
                                     15 	.globl _EXTI_SetExtIntSensitivity
                                     16 	.globl _keycount
                                     17 	.globl _key_init
                                     18 	.globl _key_read
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area DATA
                                     23 ;--------------------------------------------------------
                                     24 ; ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area INITIALIZED
      000099                         27 _keycount::
      000099                         28 	.ds 5
                                     29 ;--------------------------------------------------------
                                     30 ; absolute external ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area DABS (ABS)
                                     33 
                                     34 ; default segment ordering for linker
                                     35 	.area HOME
                                     36 	.area GSINIT
                                     37 	.area GSFINAL
                                     38 	.area CONST
                                     39 	.area INITIALIZER
                                     40 	.area CODE
                                     41 
                                     42 ;--------------------------------------------------------
                                     43 ; global & static initialisations
                                     44 ;--------------------------------------------------------
                                     45 	.area HOME
                                     46 	.area GSINIT
                                     47 	.area GSFINAL
                                     48 	.area GSINIT
                                     49 ;--------------------------------------------------------
                                     50 ; Home
                                     51 ;--------------------------------------------------------
                                     52 	.area HOME
                                     53 	.area HOME
                                     54 ;--------------------------------------------------------
                                     55 ; code
                                     56 ;--------------------------------------------------------
                                     57 	.area CODE
                                     58 ;	driver/key.c: 4: void key_init()
                                     59 ;	-----------------------------------------
                                     60 ;	 function key_init
                                     61 ;	-----------------------------------------
      0093F0                         62 _key_init:
                                     63 ;	driver/key.c: 6: GPIO_Init(GPIOD,GPIO_PIN_0,GPIO_MODE_IN_FL_IT);
      0093F0 4B 20            [ 1]   64 	push	#0x20
      0093F2 4B 01            [ 1]   65 	push	#0x01
      0093F4 4B 0F            [ 1]   66 	push	#0x0f
      0093F6 4B 50            [ 1]   67 	push	#0x50
      0093F8 CD A5 60         [ 4]   68 	call	_GPIO_Init
      0093FB 5B 04            [ 2]   69 	addw	sp, #4
                                     70 ;	driver/key.c: 7: GPIO_Init(GPIOD,GPIO_PIN_1,GPIO_MODE_IN_FL_IT);
      0093FD 4B 20            [ 1]   71 	push	#0x20
      0093FF 4B 02            [ 1]   72 	push	#0x02
      009401 4B 0F            [ 1]   73 	push	#0x0f
      009403 4B 50            [ 1]   74 	push	#0x50
      009405 CD A5 60         [ 4]   75 	call	_GPIO_Init
      009408 5B 04            [ 2]   76 	addw	sp, #4
                                     77 ;	driver/key.c: 8: GPIO_Init(GPIOD,GPIO_PIN_2,GPIO_MODE_IN_FL_IT);
      00940A 4B 20            [ 1]   78 	push	#0x20
      00940C 4B 04            [ 1]   79 	push	#0x04
      00940E 4B 0F            [ 1]   80 	push	#0x0f
      009410 4B 50            [ 1]   81 	push	#0x50
      009412 CD A5 60         [ 4]   82 	call	_GPIO_Init
      009415 5B 04            [ 2]   83 	addw	sp, #4
                                     84 ;	driver/key.c: 9: GPIO_Init(GPIOD,GPIO_PIN_3,GPIO_MODE_IN_FL_IT);
      009417 4B 20            [ 1]   85 	push	#0x20
      009419 4B 08            [ 1]   86 	push	#0x08
      00941B 4B 0F            [ 1]   87 	push	#0x0f
      00941D 4B 50            [ 1]   88 	push	#0x50
      00941F CD A5 60         [ 4]   89 	call	_GPIO_Init
      009422 5B 04            [ 2]   90 	addw	sp, #4
                                     91 ;	driver/key.c: 10: GPIO_Init(GPIOD,GPIO_PIN_4,GPIO_MODE_IN_FL_IT);
      009424 4B 20            [ 1]   92 	push	#0x20
      009426 4B 10            [ 1]   93 	push	#0x10
      009428 4B 0F            [ 1]   94 	push	#0x0f
      00942A 4B 50            [ 1]   95 	push	#0x50
      00942C CD A5 60         [ 4]   96 	call	_GPIO_Init
      00942F 5B 04            [ 2]   97 	addw	sp, #4
                                     98 ;	driver/key.c: 11: EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD,EXTI_SENSITIVITY_FALL_ONLY);
      009431 4B 02            [ 1]   99 	push	#0x02
      009433 4B 03            [ 1]  100 	push	#0x03
      009435 CD AA B7         [ 4]  101 	call	_EXTI_SetExtIntSensitivity
      009438 5B 02            [ 2]  102 	addw	sp, #2
                                    103 ;	driver/key.c: 12: EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
      00943A 4B 00            [ 1]  104 	push	#0x00
      00943C CD AB 49         [ 4]  105 	call	_EXTI_SetTLISensitivity
      00943F 84               [ 1]  106 	pop	a
                                    107 ;	driver/key.c: 13: ITC_SetSoftwarePriority(ITC_IRQ_PORTD,ITC_PRIORITYLEVEL_1);
      009440 4B 01            [ 1]  108 	push	#0x01
      009442 4B 06            [ 1]  109 	push	#0x06
      009444 CD A6 F8         [ 4]  110 	call	_ITC_SetSoftwarePriority
      009447 5B 02            [ 2]  111 	addw	sp, #2
                                    112 ;	driver/key.c: 14: }
      009449 81               [ 4]  113 	ret
                                    114 ;	driver/key.c: 15: BitStatus key_read(u8 num)
                                    115 ;	-----------------------------------------
                                    116 ;	 function key_read
                                    117 ;	-----------------------------------------
      00944A                        118 _key_read:
                                    119 ;	driver/key.c: 18: return GPIO_ReadInputPin(GPIOD,GPIO_PIN_0 << num);
      00944A A6 01            [ 1]  120 	ld	a, #0x01
      00944C 88               [ 1]  121 	push	a
      00944D 7B 04            [ 1]  122 	ld	a, (0x04, sp)
      00944F 27 05            [ 1]  123 	jreq	00104$
      009451                        124 00103$:
      009451 08 01            [ 1]  125 	sll	(1, sp)
      009453 4A               [ 1]  126 	dec	a
      009454 26 FB            [ 1]  127 	jrne	00103$
      009456                        128 00104$:
      009456 84               [ 1]  129 	pop	a
      009457 88               [ 1]  130 	push	a
      009458 4B 0F            [ 1]  131 	push	#0x0f
      00945A 4B 50            [ 1]  132 	push	#0x50
      00945C CD A6 00         [ 4]  133 	call	_GPIO_ReadInputPin
      00945F 5B 03            [ 2]  134 	addw	sp, #3
                                    135 ;	driver/key.c: 20: }
      009461 81               [ 4]  136 	ret
                                    137 	.area CODE
                                    138 	.area CONST
                                    139 	.area INITIALIZER
      008706                        140 __xinit__keycount:
      008706 00                     141 	.db #0x00	; 0
      008707 00                     142 	.db #0x00	; 0
      008708 00                     143 	.db #0x00	; 0
      008709 00                     144 	.db #0x00	; 0
      00870A 00                     145 	.db #0x00	; 0
                                    146 	.area CABS (ABS)
