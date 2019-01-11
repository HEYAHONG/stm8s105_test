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
                                     18 	.globl _GPIO_Init
                                     19 	.globl _Init_UART2
                                     20 	.globl _UART2_Send_Char
                                     21 	.globl _UART2_Send_STR
                                     22 ;--------------------------------------------------------
                                     23 ; ram data
                                     24 ;--------------------------------------------------------
                                     25 	.area DATA
                                     26 ;--------------------------------------------------------
                                     27 ; ram data
                                     28 ;--------------------------------------------------------
                                     29 	.area INITIALIZED
                                     30 ;--------------------------------------------------------
                                     31 ; absolute external ram data
                                     32 ;--------------------------------------------------------
                                     33 	.area DABS (ABS)
                                     34 
                                     35 ; default segment ordering for linker
                                     36 	.area HOME
                                     37 	.area GSINIT
                                     38 	.area GSFINAL
                                     39 	.area CONST
                                     40 	.area INITIALIZER
                                     41 	.area CODE
                                     42 
                                     43 ;--------------------------------------------------------
                                     44 ; global & static initialisations
                                     45 ;--------------------------------------------------------
                                     46 	.area HOME
                                     47 	.area GSINIT
                                     48 	.area GSFINAL
                                     49 	.area GSINIT
                                     50 ;--------------------------------------------------------
                                     51 ; Home
                                     52 ;--------------------------------------------------------
                                     53 	.area HOME
                                     54 	.area HOME
                                     55 ;--------------------------------------------------------
                                     56 ; code
                                     57 ;--------------------------------------------------------
                                     58 	.area CODE
                                     59 ;	driver/uart.c: 4: void Init_UART2(void)
                                     60 ;	-----------------------------------------
                                     61 ;	 function Init_UART2
                                     62 ;	-----------------------------------------
      008F9F                         63 _Init_UART2:
                                     64 ;	driver/uart.c: 6: UART2_DeInit();
      008F9F CD 9E FF         [ 4]   65 	call	_UART2_DeInit
                                     66 ;	driver/uart.c: 7: GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_OD_LOW_FAST);
      008FA2 4B A0            [ 1]   67 	push	#0xa0
      008FA4 4B 20            [ 1]   68 	push	#0x20
      008FA6 4B 0F            [ 1]   69 	push	#0x0f
      008FA8 4B 50            [ 1]   70 	push	#0x50
      008FAA CD 96 17         [ 4]   71 	call	_GPIO_Init
      008FAD 5B 04            [ 2]   72 	addw	sp, #4
                                     73 ;	driver/uart.c: 8: GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);
      008FAF 4B 40            [ 1]   74 	push	#0x40
      008FB1 4B 40            [ 1]   75 	push	#0x40
      008FB3 4B 0F            [ 1]   76 	push	#0x0f
      008FB5 4B 50            [ 1]   77 	push	#0x50
      008FB7 CD 96 17         [ 4]   78 	call	_GPIO_Init
      008FBA 5B 04            [ 2]   79 	addw	sp, #4
                                     80 ;	driver/uart.c: 10: UART2_Init((u32)115200, UART2_WORDLENGTH_8D, UART2_STOPBITS_1,
      008FBC 4B 0C            [ 1]   81 	push	#0x0c
      008FBE 4B 80            [ 1]   82 	push	#0x80
      008FC0 4B 00            [ 1]   83 	push	#0x00
      008FC2 4B 00            [ 1]   84 	push	#0x00
      008FC4 4B 00            [ 1]   85 	push	#0x00
      008FC6 4B 00            [ 1]   86 	push	#0x00
      008FC8 4B C2            [ 1]   87 	push	#0xc2
      008FCA 4B 01            [ 1]   88 	push	#0x01
      008FCC 4B 00            [ 1]   89 	push	#0x00
      008FCE CD 9F 26         [ 4]   90 	call	_UART2_Init
      008FD1 5B 09            [ 2]   91 	addw	sp, #9
                                     92 ;	driver/uart.c: 13: UART2_ITConfig(UART2_IT_RXNE_OR, ENABLE);
      008FD3 4B 01            [ 1]   93 	push	#0x01
      008FD5 4B 05            [ 1]   94 	push	#0x05
      008FD7 4B 02            [ 1]   95 	push	#0x02
      008FD9 CD A0 9E         [ 4]   96 	call	_UART2_ITConfig
      008FDC 5B 03            [ 2]   97 	addw	sp, #3
                                     98 ;	driver/uart.c: 15: UART2_Cmd(ENABLE);
      008FDE 4B 01            [ 1]   99 	push	#0x01
      008FE0 CD A0 8B         [ 4]  100 	call	_UART2_Cmd
      008FE3 84               [ 1]  101 	pop	a
                                    102 ;	driver/uart.c: 16: }
      008FE4 81               [ 4]  103 	ret
                                    104 ;	driver/uart.c: 18: void UART2_Send_Char(uint8_t dat)
                                    105 ;	-----------------------------------------
                                    106 ;	 function UART2_Send_Char
                                    107 ;	-----------------------------------------
      008FE5                        108 _UART2_Send_Char:
                                    109 ;	driver/uart.c: 20: while(( UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET));
      008FE5                        110 00101$:
      008FE5 4B 80            [ 1]  111 	push	#0x80
      008FE7 4B 00            [ 1]  112 	push	#0x00
      008FE9 CD A2 7A         [ 4]  113 	call	_UART2_GetFlagStatus
      008FEC 5B 02            [ 2]  114 	addw	sp, #2
      008FEE 4D               [ 1]  115 	tnz	a
      008FEF 27 F4            [ 1]  116 	jreq	00101$
                                    117 ;	driver/uart.c: 22: UART2_SendData8(dat);
      008FF1 7B 03            [ 1]  118 	ld	a, (0x03, sp)
      008FF3 88               [ 1]  119 	push	a
      008FF4 CD A2 32         [ 4]  120 	call	_UART2_SendData8
      008FF7 84               [ 1]  121 	pop	a
                                    122 ;	driver/uart.c: 24: }
      008FF8 81               [ 4]  123 	ret
                                    124 ;	driver/uart.c: 26: void UART2_Send_STR(unsigned char * src)
                                    125 ;	-----------------------------------------
                                    126 ;	 function UART2_Send_STR
                                    127 ;	-----------------------------------------
      008FF9                        128 _UART2_Send_STR:
                                    129 ;	driver/uart.c: 28: while(*src !='\0')
      008FF9 1E 03            [ 2]  130 	ldw	x, (0x03, sp)
      008FFB                        131 00101$:
      008FFB F6               [ 1]  132 	ld	a, (x)
      008FFC 26 01            [ 1]  133 	jrne	00117$
      008FFE 81               [ 4]  134 	ret
      008FFF                        135 00117$:
                                    136 ;	driver/uart.c: 30: UART2_Send_Char(*src++);
      008FFF 5C               [ 1]  137 	incw	x
      009000 89               [ 2]  138 	pushw	x
      009001 88               [ 1]  139 	push	a
      009002 CD 8F E5         [ 4]  140 	call	_UART2_Send_Char
      009005 84               [ 1]  141 	pop	a
      009006 85               [ 2]  142 	popw	x
      009007 20 F2            [ 2]  143 	jra	00101$
                                    144 ;	driver/uart.c: 32: }
      009009 81               [ 4]  145 	ret
                                    146 ;	driver/uart.c: 33: int putchar(int dat) //support printf function
                                    147 ;	-----------------------------------------
                                    148 ;	 function putchar
                                    149 ;	-----------------------------------------
      00900A                        150 _putchar:
                                    151 ;	driver/uart.c: 40: return 0;
      00900A 5F               [ 1]  152 	clrw	x
                                    153 ;	driver/uart.c: 41: }
      00900B 81               [ 4]  154 	ret
                                    155 	.area CODE
                                    156 	.area CONST
                                    157 	.area INITIALIZER
                                    158 	.area CABS (ABS)
