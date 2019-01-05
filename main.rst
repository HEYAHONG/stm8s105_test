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
                                     12 	.globl _UART2_Send_STR
                                     13 	.globl _UART2_Send_Char
                                     14 	.globl _Init_UART2
                                     15 	.globl _Delay
                                     16 	.globl _puts
                                     17 	.globl _sprintf
                                     18 	.globl _printf
                                     19 	.globl _ReadADC
                                     20 	.globl _OLED_ShowString
                                     21 	.globl _OLED_Clear
                                     22 	.globl _OLED_Init
                                     23 	.globl _UART2_GetFlagStatus
                                     24 	.globl _UART2_SendData8
                                     25 	.globl _UART2_ITConfig
                                     26 	.globl _UART2_Cmd
                                     27 	.globl _UART2_Init
                                     28 	.globl _UART2_DeInit
                                     29 	.globl _GPIO_WriteReverse
                                     30 	.globl _GPIO_Init
                                     31 	.globl _putchar
                                     32 ;--------------------------------------------------------
                                     33 ; ram data
                                     34 ;--------------------------------------------------------
                                     35 	.area DATA
                                     36 ;--------------------------------------------------------
                                     37 ; ram data
                                     38 ;--------------------------------------------------------
                                     39 	.area INITIALIZED
                                     40 ;--------------------------------------------------------
                                     41 ; Stack segment in internal ram 
                                     42 ;--------------------------------------------------------
                                     43 	.area	SSEG
      FFFFFF                         44 __start__stack:
      FFFFFF                         45 	.ds	1
                                     46 
                                     47 ;--------------------------------------------------------
                                     48 ; absolute external ram data
                                     49 ;--------------------------------------------------------
                                     50 	.area DABS (ABS)
                                     51 
                                     52 ; default segment ordering for linker
                                     53 	.area HOME
                                     54 	.area GSINIT
                                     55 	.area GSFINAL
                                     56 	.area CONST
                                     57 	.area INITIALIZER
                                     58 	.area CODE
                                     59 
                                     60 ;--------------------------------------------------------
                                     61 ; interrupt vector 
                                     62 ;--------------------------------------------------------
                                     63 	.area HOME
      008000                         64 __interrupt_vect:
      008000 82 00 80 07             65 	int s_GSINIT ; reset
                                     66 ;--------------------------------------------------------
                                     67 ; global & static initialisations
                                     68 ;--------------------------------------------------------
                                     69 	.area HOME
                                     70 	.area GSINIT
                                     71 	.area GSFINAL
                                     72 	.area GSINIT
      008007                         73 __sdcc_gs_init_startup:
      008007                         74 __sdcc_init_data:
                                     75 ; stm8_genXINIT() start
      008007 AE 00 00         [ 2]   76 	ldw x, #l_DATA
      00800A 27 07            [ 1]   77 	jreq	00002$
      00800C                         78 00001$:
      00800C 72 4F 00 00      [ 1]   79 	clr (s_DATA - 1, x)
      008010 5A               [ 2]   80 	decw x
      008011 26 F9            [ 1]   81 	jrne	00001$
      008013                         82 00002$:
      008013 AE 00 00         [ 2]   83 	ldw	x, #l_INITIALIZER
      008016 27 09            [ 1]   84 	jreq	00004$
      008018                         85 00003$:
      008018 D6 88 06         [ 1]   86 	ld	a, (s_INITIALIZER - 1, x)
      00801B D7 00 00         [ 1]   87 	ld	(s_INITIALIZED - 1, x), a
      00801E 5A               [ 2]   88 	decw	x
      00801F 26 F7            [ 1]   89 	jrne	00003$
      008021                         90 00004$:
                                     91 ; stm8_genXINIT() end
                                     92 	.area GSFINAL
      008021 CC 80 04         [ 2]   93 	jp	__sdcc_program_startup
                                     94 ;--------------------------------------------------------
                                     95 ; Home
                                     96 ;--------------------------------------------------------
                                     97 	.area HOME
                                     98 	.area HOME
      008004                         99 __sdcc_program_startup:
      008004 CC 88 8D         [ 2]  100 	jp	_main
                                    101 ;	return from main will return to caller
                                    102 ;--------------------------------------------------------
                                    103 ; code
                                    104 ;--------------------------------------------------------
                                    105 	.area CODE
                                    106 ;	main.c: 43: void Delay(uint16_t nCount)
                                    107 ;	-----------------------------------------
                                    108 ;	 function Delay
                                    109 ;	-----------------------------------------
      00881D                        110 _Delay:
                                    111 ;	main.c: 46: while (nCount != 0)
      00881D 1E 03            [ 2]  112 	ldw	x, (0x03, sp)
      00881F                        113 00101$:
      00881F 5D               [ 2]  114 	tnzw	x
      008820 26 01            [ 1]  115 	jrne	00117$
      008822 81               [ 4]  116 	ret
      008823                        117 00117$:
                                    118 ;	main.c: 48: nCount--;
      008823 5A               [ 2]  119 	decw	x
      008824 20 F9            [ 2]  120 	jra	00101$
                                    121 ;	main.c: 50: }
      008826 81               [ 4]  122 	ret
                                    123 ;	main.c: 51: void Init_UART2(void)
                                    124 ;	-----------------------------------------
                                    125 ;	 function Init_UART2
                                    126 ;	-----------------------------------------
      008827                        127 _Init_UART2:
                                    128 ;	main.c: 53: UART2_DeInit();
      008827 CD 93 8E         [ 4]  129 	call	_UART2_DeInit
                                    130 ;	main.c: 54: UART2_Init((u32)115200, UART2_WORDLENGTH_8D, UART2_STOPBITS_1,
      00882A 4B 0C            [ 1]  131 	push	#0x0c
      00882C 4B 80            [ 1]  132 	push	#0x80
      00882E 4B 00            [ 1]  133 	push	#0x00
      008830 4B 00            [ 1]  134 	push	#0x00
      008832 4B 00            [ 1]  135 	push	#0x00
      008834 4B 00            [ 1]  136 	push	#0x00
      008836 4B C2            [ 1]  137 	push	#0xc2
      008838 4B 01            [ 1]  138 	push	#0x01
      00883A 4B 00            [ 1]  139 	push	#0x00
      00883C CD 93 B5         [ 4]  140 	call	_UART2_Init
      00883F 5B 09            [ 2]  141 	addw	sp, #9
                                    142 ;	main.c: 57: UART2_ITConfig(UART2_IT_RXNE_OR, ENABLE);
      008841 4B 01            [ 1]  143 	push	#0x01
      008843 4B 05            [ 1]  144 	push	#0x05
      008845 4B 02            [ 1]  145 	push	#0x02
      008847 CD 95 2D         [ 4]  146 	call	_UART2_ITConfig
      00884A 5B 03            [ 2]  147 	addw	sp, #3
                                    148 ;	main.c: 59: UART2_Cmd(ENABLE);
      00884C 4B 01            [ 1]  149 	push	#0x01
      00884E CD 95 1A         [ 4]  150 	call	_UART2_Cmd
      008851 84               [ 1]  151 	pop	a
                                    152 ;	main.c: 60: }
      008852 81               [ 4]  153 	ret
                                    154 ;	main.c: 62: void UART2_Send_Char(uint8_t dat)
                                    155 ;	-----------------------------------------
                                    156 ;	 function UART2_Send_Char
                                    157 ;	-----------------------------------------
      008853                        158 _UART2_Send_Char:
                                    159 ;	main.c: 64: while(( UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET));
      008853                        160 00101$:
      008853 4B 80            [ 1]  161 	push	#0x80
      008855 4B 00            [ 1]  162 	push	#0x00
      008857 CD 97 09         [ 4]  163 	call	_UART2_GetFlagStatus
      00885A 5B 02            [ 2]  164 	addw	sp, #2
      00885C 4D               [ 1]  165 	tnz	a
      00885D 27 F4            [ 1]  166 	jreq	00101$
                                    167 ;	main.c: 66: UART2_SendData8(dat);
      00885F 7B 03            [ 1]  168 	ld	a, (0x03, sp)
      008861 88               [ 1]  169 	push	a
      008862 CD 96 C1         [ 4]  170 	call	_UART2_SendData8
      008865 84               [ 1]  171 	pop	a
                                    172 ;	main.c: 68: }
      008866 81               [ 4]  173 	ret
                                    174 ;	main.c: 70: void UART2_Send_STR(unsigned char * src)
                                    175 ;	-----------------------------------------
                                    176 ;	 function UART2_Send_STR
                                    177 ;	-----------------------------------------
      008867                        178 _UART2_Send_STR:
                                    179 ;	main.c: 72: while(*src !='\0')
      008867 1E 03            [ 2]  180 	ldw	x, (0x03, sp)
      008869                        181 00101$:
      008869 F6               [ 1]  182 	ld	a, (x)
      00886A 26 01            [ 1]  183 	jrne	00117$
      00886C 81               [ 4]  184 	ret
      00886D                        185 00117$:
                                    186 ;	main.c: 74: UART2_Send_Char(*src++);
      00886D 5C               [ 1]  187 	incw	x
      00886E 89               [ 2]  188 	pushw	x
      00886F 88               [ 1]  189 	push	a
      008870 CD 88 53         [ 4]  190 	call	_UART2_Send_Char
      008873 84               [ 1]  191 	pop	a
      008874 85               [ 2]  192 	popw	x
      008875 20 F2            [ 2]  193 	jra	00101$
                                    194 ;	main.c: 76: }
      008877 81               [ 4]  195 	ret
                                    196 ;	main.c: 77: int putchar(int dat) //support printf function
                                    197 ;	-----------------------------------------
                                    198 ;	 function putchar
                                    199 ;	-----------------------------------------
      008878                        200 _putchar:
                                    201 ;	main.c: 79: while(( UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET));
      008878                        202 00101$:
      008878 4B 80            [ 1]  203 	push	#0x80
      00887A 4B 00            [ 1]  204 	push	#0x00
      00887C CD 97 09         [ 4]  205 	call	_UART2_GetFlagStatus
      00887F 5B 02            [ 2]  206 	addw	sp, #2
      008881 4D               [ 1]  207 	tnz	a
      008882 27 F4            [ 1]  208 	jreq	00101$
                                    209 ;	main.c: 81: UART2_SendData8((u8)dat);
      008884 7B 04            [ 1]  210 	ld	a, (0x04, sp)
      008886 88               [ 1]  211 	push	a
      008887 CD 96 C1         [ 4]  212 	call	_UART2_SendData8
      00888A 84               [ 1]  213 	pop	a
                                    214 ;	main.c: 82: return 0;
      00888B 5F               [ 1]  215 	clrw	x
                                    216 ;	main.c: 83: }
      00888C 81               [ 4]  217 	ret
                                    218 ;	main.c: 86: void main(void)
                                    219 ;	-----------------------------------------
                                    220 ;	 function main
                                    221 ;	-----------------------------------------
      00888D                        222 _main:
      00888D 52 0C            [ 2]  223 	sub	sp, #12
                                    224 ;	main.c: 90: GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
      00888F 4B E0            [ 1]  225 	push	#0xe0
      008891 4B 20            [ 1]  226 	push	#0x20
      008893 4B 14            [ 1]  227 	push	#0x14
      008895 4B 50            [ 1]  228 	push	#0x50
      008897 CD 8E 67         [ 4]  229 	call	_GPIO_Init
      00889A 5B 04            [ 2]  230 	addw	sp, #4
                                    231 ;	main.c: 92: Init_UART2();
      00889C CD 88 27         [ 4]  232 	call	_Init_UART2
                                    233 ;	main.c: 93: OLED_Init();
      00889F CD 8C 7D         [ 4]  234 	call	_OLED_Init
                                    235 ;	main.c: 94: OLED_Clear();
      0088A2 CD 8A 12         [ 4]  236 	call	_OLED_Clear
                                    237 ;	main.c: 95: enableInterrupts(); //使能中断
      0088A5 9A               [ 1]  238 	rim
                                    239 ;	main.c: 97: OLED_ShowString(0,0,"STM8 Started!");
      0088A6 4B 24            [ 1]  240 	push	#<___str_0
      0088A8 4B 80            [ 1]  241 	push	#(___str_0 >> 8)
      0088AA 4B 00            [ 1]  242 	push	#0x00
      0088AC 4B 00            [ 1]  243 	push	#0x00
      0088AE CD 8B 97         [ 4]  244 	call	_OLED_ShowString
      0088B1 5B 04            [ 2]  245 	addw	sp, #4
                                    246 ;	main.c: 98: printf("STM8 Started!\r\n");
      0088B3 4B 32            [ 1]  247 	push	#<___str_2
      0088B5 4B 80            [ 1]  248 	push	#(___str_2 >> 8)
      0088B7 CD 9C 9F         [ 4]  249 	call	_puts
      0088BA 5B 02            [ 2]  250 	addw	sp, #2
                                    251 ;	main.c: 100: while (1)
      0088BC                        252 00102$:
                                    253 ;	main.c: 104: sprintf(temp,"%4d",ReadADC());
      0088BC CD 8E 03         [ 4]  254 	call	_ReadADC
      0088BF 90 96            [ 1]  255 	ldw	y, sp
      0088C1 90 5C            [ 1]  256 	incw	y
      0088C3 17 0B            [ 2]  257 	ldw	(0x0b, sp), y
      0088C5 89               [ 2]  258 	pushw	x
      0088C6 4B 41            [ 1]  259 	push	#<___str_3
      0088C8 4B 80            [ 1]  260 	push	#(___str_3 >> 8)
      0088CA 90 89            [ 2]  261 	pushw	y
      0088CC CD 9C 25         [ 4]  262 	call	_sprintf
      0088CF 5B 06            [ 2]  263 	addw	sp, #6
                                    264 ;	main.c: 105: printf("%s",temp);
      0088D1 1E 0B            [ 2]  265 	ldw	x, (0x0b, sp)
      0088D3 89               [ 2]  266 	pushw	x
      0088D4 4B 45            [ 1]  267 	push	#<___str_4
      0088D6 4B 80            [ 1]  268 	push	#(___str_4 >> 8)
      0088D8 CD 9C E0         [ 4]  269 	call	_printf
      0088DB 5B 04            [ 2]  270 	addw	sp, #4
                                    271 ;	main.c: 106: OLED_ShowString(0,2,temp);
      0088DD 1E 0B            [ 2]  272 	ldw	x, (0x0b, sp)
      0088DF 89               [ 2]  273 	pushw	x
      0088E0 4B 02            [ 1]  274 	push	#0x02
      0088E2 4B 00            [ 1]  275 	push	#0x00
      0088E4 CD 8B 97         [ 4]  276 	call	_OLED_ShowString
      0088E7 5B 04            [ 2]  277 	addw	sp, #4
                                    278 ;	main.c: 107: GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
      0088E9 4B 20            [ 1]  279 	push	#0x20
      0088EB 4B 14            [ 1]  280 	push	#0x14
      0088ED 4B 50            [ 1]  281 	push	#0x50
      0088EF CD 8E F7         [ 4]  282 	call	_GPIO_WriteReverse
      0088F2 5B 03            [ 2]  283 	addw	sp, #3
                                    284 ;	main.c: 108: Delay(0xffff);
      0088F4 4B FF            [ 1]  285 	push	#0xff
      0088F6 4B FF            [ 1]  286 	push	#0xff
      0088F8 CD 88 1D         [ 4]  287 	call	_Delay
      0088FB 5B 02            [ 2]  288 	addw	sp, #2
      0088FD 20 BD            [ 2]  289 	jra	00102$
                                    290 ;	main.c: 111: }
      0088FF 5B 0C            [ 2]  291 	addw	sp, #12
      008901 81               [ 4]  292 	ret
                                    293 	.area CODE
                                    294 	.area CONST
      008024                        295 ___str_0:
      008024 53 54 4D 38 20 53 74   296 	.ascii "STM8 Started!"
             61 72 74 65 64 21
      008031 00                     297 	.db 0x00
      008032                        298 ___str_2:
      008032 53 54 4D 38 20 53 74   299 	.ascii "STM8 Started!"
             61 72 74 65 64 21
      00803F 0D                     300 	.db 0x0d
      008040 00                     301 	.db 0x00
      008041                        302 ___str_3:
      008041 25 34 64               303 	.ascii "%4d"
      008044 00                     304 	.db 0x00
      008045                        305 ___str_4:
      008045 25 73                  306 	.ascii "%s"
      008047 00                     307 	.db 0x00
                                    308 	.area INITIALIZER
                                    309 	.area CABS (ABS)
