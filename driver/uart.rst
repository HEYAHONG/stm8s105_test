                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module uart
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _putchar
                                     12 	.globl _UART2_GetFlagStatus
                                     13 	.globl _UART2_SendData8
                                     14 	.globl _UART2_ITConfig
                                     15 	.globl _UART2_Cmd
                                     16 	.globl _UART2_Init
                                     17 	.globl _UART2_DeInit
                                     18 	.globl _ITC_SetSoftwarePriority
                                     19 	.globl _GPIO_Init
                                     20 	.globl _Init_UART2
                                     21 	.globl _UART2_Send_Char
                                     22 	.globl _UART2_Send_STR
                                     23 ;--------------------------------------------------------
                                     24 ; ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area DATA
                                     27 ;--------------------------------------------------------
                                     28 ; ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area INITIALIZED
                                     31 ;--------------------------------------------------------
                                     32 ; absolute external ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area DABS (ABS)
                                     35 
                                     36 ; default segment ordering for linker
                                     37 	.area HOME
                                     38 	.area GSINIT
                                     39 	.area GSFINAL
                                     40 	.area CONST
                                     41 	.area INITIALIZER
                                     42 	.area CODE
                                     43 
                                     44 ;--------------------------------------------------------
                                     45 ; global & static initialisations
                                     46 ;--------------------------------------------------------
                                     47 	.area HOME
                                     48 	.area GSINIT
                                     49 	.area GSFINAL
                                     50 	.area GSINIT
                                     51 ;--------------------------------------------------------
                                     52 ; Home
                                     53 ;--------------------------------------------------------
                                     54 	.area HOME
                                     55 	.area HOME
                                     56 ;--------------------------------------------------------
                                     57 ; code
                                     58 ;--------------------------------------------------------
                                     59 	.area CODE
                                     60 ;	driver/uart.c: 4: void Init_UART2(void)
                                     61 ;	-----------------------------------------
                                     62 ;	 function Init_UART2
                                     63 ;	-----------------------------------------
      008B10                         64 _Init_UART2:
                                     65 ;	driver/uart.c: 6: UART2_DeInit();
      008B10 CD B0 09         [ 4]   66 	call	_UART2_DeInit
                                     67 ;	driver/uart.c: 7: GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_OD_LOW_FAST);
      008B13 4B A0            [ 1]   68 	push	#0xa0
      008B15 4B 20            [ 1]   69 	push	#0x20
      008B17 4B 0F            [ 1]   70 	push	#0x0f
      008B19 4B 50            [ 1]   71 	push	#0x50
      008B1B CD A5 60         [ 4]   72 	call	_GPIO_Init
      008B1E 5B 04            [ 2]   73 	addw	sp, #4
                                     74 ;	driver/uart.c: 8: GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);
      008B20 4B 40            [ 1]   75 	push	#0x40
      008B22 4B 40            [ 1]   76 	push	#0x40
      008B24 4B 0F            [ 1]   77 	push	#0x0f
      008B26 4B 50            [ 1]   78 	push	#0x50
      008B28 CD A5 60         [ 4]   79 	call	_GPIO_Init
      008B2B 5B 04            [ 2]   80 	addw	sp, #4
                                     81 ;	driver/uart.c: 10: UART2_Init((u32)9600, UART2_WORDLENGTH_8D, UART2_STOPBITS_1,
      008B2D 4B 0C            [ 1]   82 	push	#0x0c
      008B2F 4B 80            [ 1]   83 	push	#0x80
      008B31 4B 00            [ 1]   84 	push	#0x00
      008B33 4B 00            [ 1]   85 	push	#0x00
      008B35 4B 00            [ 1]   86 	push	#0x00
      008B37 4B 80            [ 1]   87 	push	#0x80
      008B39 4B 25            [ 1]   88 	push	#0x25
      008B3B 5F               [ 1]   89 	clrw	x
      008B3C 89               [ 2]   90 	pushw	x
      008B3D CD B0 30         [ 4]   91 	call	_UART2_Init
      008B40 5B 09            [ 2]   92 	addw	sp, #9
                                     93 ;	driver/uart.c: 13: UART2_ITConfig(UART2_IT_RXNE, ENABLE);
      008B42 4B 01            [ 1]   94 	push	#0x01
      008B44 4B 55            [ 1]   95 	push	#0x55
      008B46 4B 02            [ 1]   96 	push	#0x02
      008B48 CD B1 A8         [ 4]   97 	call	_UART2_ITConfig
      008B4B 5B 03            [ 2]   98 	addw	sp, #3
                                     99 ;	driver/uart.c: 14: ITC_SetSoftwarePriority(ITC_IRQ_UART2_RX, ITC_PRIORITYLEVEL_3);
      008B4D 4B 03            [ 1]  100 	push	#0x03
      008B4F 4B 15            [ 1]  101 	push	#0x15
      008B51 CD A6 F8         [ 4]  102 	call	_ITC_SetSoftwarePriority
      008B54 5B 02            [ 2]  103 	addw	sp, #2
                                    104 ;	driver/uart.c: 15: UART2_Cmd(ENABLE);
      008B56 4B 01            [ 1]  105 	push	#0x01
      008B58 CD B1 95         [ 4]  106 	call	_UART2_Cmd
      008B5B 84               [ 1]  107 	pop	a
                                    108 ;	driver/uart.c: 16: }
      008B5C 81               [ 4]  109 	ret
                                    110 ;	driver/uart.c: 18: void UART2_Send_Char(uint8_t dat)
                                    111 ;	-----------------------------------------
                                    112 ;	 function UART2_Send_Char
                                    113 ;	-----------------------------------------
      008B5D                        114 _UART2_Send_Char:
                                    115 ;	driver/uart.c: 20: while(( UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET));
      008B5D                        116 00101$:
      008B5D 4B 80            [ 1]  117 	push	#0x80
      008B5F 4B 00            [ 1]  118 	push	#0x00
      008B61 CD B3 84         [ 4]  119 	call	_UART2_GetFlagStatus
      008B64 5B 02            [ 2]  120 	addw	sp, #2
      008B66 4D               [ 1]  121 	tnz	a
      008B67 27 F4            [ 1]  122 	jreq	00101$
                                    123 ;	driver/uart.c: 22: UART2_SendData8(dat);
      008B69 7B 03            [ 1]  124 	ld	a, (0x03, sp)
      008B6B 88               [ 1]  125 	push	a
      008B6C CD B3 3C         [ 4]  126 	call	_UART2_SendData8
      008B6F 84               [ 1]  127 	pop	a
                                    128 ;	driver/uart.c: 24: }
      008B70 81               [ 4]  129 	ret
                                    130 ;	driver/uart.c: 26: void UART2_Send_STR(unsigned char * src)
                                    131 ;	-----------------------------------------
                                    132 ;	 function UART2_Send_STR
                                    133 ;	-----------------------------------------
      008B71                        134 _UART2_Send_STR:
                                    135 ;	driver/uart.c: 28: while(*src !='\0')
      008B71 1E 03            [ 2]  136 	ldw	x, (0x03, sp)
      008B73                        137 00101$:
      008B73 F6               [ 1]  138 	ld	a, (x)
      008B74 26 01            [ 1]  139 	jrne	00117$
      008B76 81               [ 4]  140 	ret
      008B77                        141 00117$:
                                    142 ;	driver/uart.c: 30: UART2_Send_Char(*src++);
      008B77 5C               [ 1]  143 	incw	x
      008B78 89               [ 2]  144 	pushw	x
      008B79 88               [ 1]  145 	push	a
      008B7A CD 8B 5D         [ 4]  146 	call	_UART2_Send_Char
      008B7D 84               [ 1]  147 	pop	a
      008B7E 85               [ 2]  148 	popw	x
      008B7F 20 F2            [ 2]  149 	jra	00101$
                                    150 ;	driver/uart.c: 32: }
      008B81 81               [ 4]  151 	ret
                                    152 ;	driver/uart.c: 33: int putchar(int dat) //support printf function
                                    153 ;	-----------------------------------------
                                    154 ;	 function putchar
                                    155 ;	-----------------------------------------
      008B82                        156 _putchar:
                                    157 ;	driver/uart.c: 40: return 0;
      008B82 5F               [ 1]  158 	clrw	x
                                    159 ;	driver/uart.c: 41: }
      008B83 81               [ 4]  160 	ret
                                    161 	.area CODE
                                    162 	.area CONST
                                    163 	.area INITIALIZER
                                    164 	.area CABS (ABS)
