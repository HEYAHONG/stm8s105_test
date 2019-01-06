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
      008BAB                         63 _Init_UART2:
                                     64 ;	driver/uart.c: 5: UART2_DeInit();
      008BAB CD 99 37         [ 4]   65 	call	_UART2_DeInit
                                     66 ;	driver/uart.c: 6: GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_OD_LOW_FAST);
      008BAE 4B A0            [ 1]   67 	push	#0xa0
      008BB0 4B 20            [ 1]   68 	push	#0x20
      008BB2 4B 0F            [ 1]   69 	push	#0x0f
      008BB4 4B 50            [ 1]   70 	push	#0x50
      008BB6 CD 94 10         [ 4]   71 	call	_GPIO_Init
      008BB9 5B 04            [ 2]   72 	addw	sp, #4
                                     73 ;	driver/uart.c: 7: GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);
      008BBB 4B 00            [ 1]   74 	push	#0x00
      008BBD 4B 40            [ 1]   75 	push	#0x40
      008BBF 4B 0F            [ 1]   76 	push	#0x0f
      008BC1 4B 50            [ 1]   77 	push	#0x50
      008BC3 CD 94 10         [ 4]   78 	call	_GPIO_Init
      008BC6 5B 04            [ 2]   79 	addw	sp, #4
                                     80 ;	driver/uart.c: 9: UART2_Init((u32)115200, UART2_WORDLENGTH_8D, UART2_STOPBITS_1,
      008BC8 4B 0C            [ 1]   81 	push	#0x0c
      008BCA 4B 80            [ 1]   82 	push	#0x80
      008BCC 4B 00            [ 1]   83 	push	#0x00
      008BCE 4B 00            [ 1]   84 	push	#0x00
      008BD0 4B 00            [ 1]   85 	push	#0x00
      008BD2 4B 00            [ 1]   86 	push	#0x00
      008BD4 4B C2            [ 1]   87 	push	#0xc2
      008BD6 4B 01            [ 1]   88 	push	#0x01
      008BD8 4B 00            [ 1]   89 	push	#0x00
      008BDA CD 99 5E         [ 4]   90 	call	_UART2_Init
      008BDD 5B 09            [ 2]   91 	addw	sp, #9
                                     92 ;	driver/uart.c: 12: UART2_ITConfig(UART2_IT_RXNE_OR, ENABLE);
      008BDF 4B 01            [ 1]   93 	push	#0x01
      008BE1 4B 05            [ 1]   94 	push	#0x05
      008BE3 4B 02            [ 1]   95 	push	#0x02
      008BE5 CD 9A D6         [ 4]   96 	call	_UART2_ITConfig
      008BE8 5B 03            [ 2]   97 	addw	sp, #3
                                     98 ;	driver/uart.c: 14: UART2_Cmd(ENABLE);
      008BEA 4B 01            [ 1]   99 	push	#0x01
      008BEC CD 9A C3         [ 4]  100 	call	_UART2_Cmd
      008BEF 84               [ 1]  101 	pop	a
                                    102 ;	driver/uart.c: 15: }
      008BF0 81               [ 4]  103 	ret
                                    104 ;	driver/uart.c: 17: void UART2_Send_Char(uint8_t dat)
                                    105 ;	-----------------------------------------
                                    106 ;	 function UART2_Send_Char
                                    107 ;	-----------------------------------------
      008BF1                        108 _UART2_Send_Char:
                                    109 ;	driver/uart.c: 19: while(( UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET));
      008BF1                        110 00101$:
      008BF1 4B 80            [ 1]  111 	push	#0x80
      008BF3 4B 00            [ 1]  112 	push	#0x00
      008BF5 CD 9C B2         [ 4]  113 	call	_UART2_GetFlagStatus
      008BF8 5B 02            [ 2]  114 	addw	sp, #2
      008BFA 4D               [ 1]  115 	tnz	a
      008BFB 27 F4            [ 1]  116 	jreq	00101$
                                    117 ;	driver/uart.c: 21: UART2_SendData8(dat);
      008BFD 7B 03            [ 1]  118 	ld	a, (0x03, sp)
      008BFF 88               [ 1]  119 	push	a
      008C00 CD 9C 6A         [ 4]  120 	call	_UART2_SendData8
      008C03 84               [ 1]  121 	pop	a
                                    122 ;	driver/uart.c: 23: }
      008C04 81               [ 4]  123 	ret
                                    124 ;	driver/uart.c: 25: void UART2_Send_STR(unsigned char * src)
                                    125 ;	-----------------------------------------
                                    126 ;	 function UART2_Send_STR
                                    127 ;	-----------------------------------------
      008C05                        128 _UART2_Send_STR:
                                    129 ;	driver/uart.c: 27: while(*src !='\0')
      008C05 1E 03            [ 2]  130 	ldw	x, (0x03, sp)
      008C07                        131 00101$:
      008C07 F6               [ 1]  132 	ld	a, (x)
      008C08 26 01            [ 1]  133 	jrne	00117$
      008C0A 81               [ 4]  134 	ret
      008C0B                        135 00117$:
                                    136 ;	driver/uart.c: 29: UART2_Send_Char(*src++);
      008C0B 5C               [ 1]  137 	incw	x
      008C0C 89               [ 2]  138 	pushw	x
      008C0D 88               [ 1]  139 	push	a
      008C0E CD 8B F1         [ 4]  140 	call	_UART2_Send_Char
      008C11 84               [ 1]  141 	pop	a
      008C12 85               [ 2]  142 	popw	x
      008C13 20 F2            [ 2]  143 	jra	00101$
                                    144 ;	driver/uart.c: 31: }
      008C15 81               [ 4]  145 	ret
                                    146 ;	driver/uart.c: 32: int putchar(int dat) //support printf function
                                    147 ;	-----------------------------------------
                                    148 ;	 function putchar
                                    149 ;	-----------------------------------------
      008C16                        150 _putchar:
                                    151 ;	driver/uart.c: 34: while(( UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET));
      008C16                        152 00101$:
      008C16 4B 80            [ 1]  153 	push	#0x80
      008C18 4B 00            [ 1]  154 	push	#0x00
      008C1A CD 9C B2         [ 4]  155 	call	_UART2_GetFlagStatus
      008C1D 5B 02            [ 2]  156 	addw	sp, #2
      008C1F 4D               [ 1]  157 	tnz	a
      008C20 27 F4            [ 1]  158 	jreq	00101$
                                    159 ;	driver/uart.c: 36: UART2_SendData8((u8)dat);
      008C22 7B 04            [ 1]  160 	ld	a, (0x04, sp)
      008C24 88               [ 1]  161 	push	a
      008C25 CD 9C 6A         [ 4]  162 	call	_UART2_SendData8
      008C28 84               [ 1]  163 	pop	a
                                    164 ;	driver/uart.c: 37: return 0;
      008C29 5F               [ 1]  165 	clrw	x
                                    166 ;	driver/uart.c: 38: }
      008C2A 81               [ 4]  167 	ret
                                    168 	.area CODE
                                    169 	.area CONST
                                    170 	.area INITIALIZER
                                    171 	.area CABS (ABS)
