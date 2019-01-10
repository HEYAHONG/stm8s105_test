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
                                     59 ;	driver/uart.c: 3: void Init_UART2(void)
                                     60 ;	-----------------------------------------
                                     61 ;	 function Init_UART2
                                     62 ;	-----------------------------------------
      009089                         63 _Init_UART2:
                                     64 ;	driver/uart.c: 5: UART2_DeInit();
      009089 CD 9F 65         [ 4]   65 	call	_UART2_DeInit
                                     66 ;	driver/uart.c: 6: GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_OD_LOW_FAST);
      00908C 4B A0            [ 1]   67 	push	#0xa0
      00908E 4B 20            [ 1]   68 	push	#0x20
      009090 4B 0F            [ 1]   69 	push	#0x0f
      009092 4B 50            [ 1]   70 	push	#0x50
      009094 CD 96 7D         [ 4]   71 	call	_GPIO_Init
      009097 5B 04            [ 2]   72 	addw	sp, #4
                                     73 ;	driver/uart.c: 7: GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);
      009099 4B 40            [ 1]   74 	push	#0x40
      00909B 4B 40            [ 1]   75 	push	#0x40
      00909D 4B 0F            [ 1]   76 	push	#0x0f
      00909F 4B 50            [ 1]   77 	push	#0x50
      0090A1 CD 96 7D         [ 4]   78 	call	_GPIO_Init
      0090A4 5B 04            [ 2]   79 	addw	sp, #4
                                     80 ;	driver/uart.c: 9: UART2_Init((u32)115200, UART2_WORDLENGTH_8D, UART2_STOPBITS_1,
      0090A6 4B 0C            [ 1]   81 	push	#0x0c
      0090A8 4B 80            [ 1]   82 	push	#0x80
      0090AA 4B 00            [ 1]   83 	push	#0x00
      0090AC 4B 00            [ 1]   84 	push	#0x00
      0090AE 4B 00            [ 1]   85 	push	#0x00
      0090B0 4B 00            [ 1]   86 	push	#0x00
      0090B2 4B C2            [ 1]   87 	push	#0xc2
      0090B4 4B 01            [ 1]   88 	push	#0x01
      0090B6 4B 00            [ 1]   89 	push	#0x00
      0090B8 CD 9F 8C         [ 4]   90 	call	_UART2_Init
      0090BB 5B 09            [ 2]   91 	addw	sp, #9
                                     92 ;	driver/uart.c: 12: UART2_ITConfig(UART2_IT_RXNE_OR, ENABLE);
      0090BD 4B 01            [ 1]   93 	push	#0x01
      0090BF 4B 05            [ 1]   94 	push	#0x05
      0090C1 4B 02            [ 1]   95 	push	#0x02
      0090C3 CD A1 04         [ 4]   96 	call	_UART2_ITConfig
      0090C6 5B 03            [ 2]   97 	addw	sp, #3
                                     98 ;	driver/uart.c: 14: UART2_Cmd(ENABLE);
      0090C8 4B 01            [ 1]   99 	push	#0x01
      0090CA CD A0 F1         [ 4]  100 	call	_UART2_Cmd
      0090CD 84               [ 1]  101 	pop	a
                                    102 ;	driver/uart.c: 15: }
      0090CE 81               [ 4]  103 	ret
                                    104 ;	driver/uart.c: 17: void UART2_Send_Char(uint8_t dat)
                                    105 ;	-----------------------------------------
                                    106 ;	 function UART2_Send_Char
                                    107 ;	-----------------------------------------
      0090CF                        108 _UART2_Send_Char:
                                    109 ;	driver/uart.c: 19: while(( UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET));
      0090CF                        110 00101$:
      0090CF 4B 80            [ 1]  111 	push	#0x80
      0090D1 4B 00            [ 1]  112 	push	#0x00
      0090D3 CD A2 E0         [ 4]  113 	call	_UART2_GetFlagStatus
      0090D6 5B 02            [ 2]  114 	addw	sp, #2
      0090D8 4D               [ 1]  115 	tnz	a
      0090D9 27 F4            [ 1]  116 	jreq	00101$
                                    117 ;	driver/uart.c: 21: UART2_SendData8(dat);
      0090DB 7B 03            [ 1]  118 	ld	a, (0x03, sp)
      0090DD 88               [ 1]  119 	push	a
      0090DE CD A2 98         [ 4]  120 	call	_UART2_SendData8
      0090E1 84               [ 1]  121 	pop	a
                                    122 ;	driver/uart.c: 23: }
      0090E2 81               [ 4]  123 	ret
                                    124 ;	driver/uart.c: 25: void UART2_Send_STR(unsigned char * src)
                                    125 ;	-----------------------------------------
                                    126 ;	 function UART2_Send_STR
                                    127 ;	-----------------------------------------
      0090E3                        128 _UART2_Send_STR:
                                    129 ;	driver/uart.c: 27: while(*src !='\0')
      0090E3 1E 03            [ 2]  130 	ldw	x, (0x03, sp)
      0090E5                        131 00101$:
      0090E5 F6               [ 1]  132 	ld	a, (x)
      0090E6 26 01            [ 1]  133 	jrne	00117$
      0090E8 81               [ 4]  134 	ret
      0090E9                        135 00117$:
                                    136 ;	driver/uart.c: 29: UART2_Send_Char(*src++);
      0090E9 5C               [ 1]  137 	incw	x
      0090EA 89               [ 2]  138 	pushw	x
      0090EB 88               [ 1]  139 	push	a
      0090EC CD 90 CF         [ 4]  140 	call	_UART2_Send_Char
      0090EF 84               [ 1]  141 	pop	a
      0090F0 85               [ 2]  142 	popw	x
      0090F1 20 F2            [ 2]  143 	jra	00101$
                                    144 ;	driver/uart.c: 31: }
      0090F3 81               [ 4]  145 	ret
                                    146 ;	driver/uart.c: 32: int putchar(int dat) //support printf function
                                    147 ;	-----------------------------------------
                                    148 ;	 function putchar
                                    149 ;	-----------------------------------------
      0090F4                        150 _putchar:
                                    151 ;	driver/uart.c: 34: while(( UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET));
      0090F4                        152 00101$:
      0090F4 4B 80            [ 1]  153 	push	#0x80
      0090F6 4B 00            [ 1]  154 	push	#0x00
      0090F8 CD A2 E0         [ 4]  155 	call	_UART2_GetFlagStatus
      0090FB 5B 02            [ 2]  156 	addw	sp, #2
      0090FD 4D               [ 1]  157 	tnz	a
      0090FE 27 F4            [ 1]  158 	jreq	00101$
                                    159 ;	driver/uart.c: 36: UART2_SendData8((u8)dat);
      009100 7B 04            [ 1]  160 	ld	a, (0x04, sp)
      009102 88               [ 1]  161 	push	a
      009103 CD A2 98         [ 4]  162 	call	_UART2_SendData8
      009106 84               [ 1]  163 	pop	a
                                    164 ;	driver/uart.c: 37: return 0;
      009107 5F               [ 1]  165 	clrw	x
                                    166 ;	driver/uart.c: 38: }
      009108 81               [ 4]  167 	ret
                                    168 	.area CODE
                                    169 	.area CONST
                                    170 	.area INITIALIZER
                                    171 	.area CABS (ABS)
