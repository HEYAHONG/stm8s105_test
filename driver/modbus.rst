                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module modbus
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _modbus_virtual_read
                                     12 	.globl _modbus_virtual_write
                                     13 	.globl _modbus_send
                                     14 	.globl _beep_off
                                     15 	.globl _beep_on
                                     16 	.globl _beep_read
                                     17 	.globl _eeprom_write
                                     18 	.globl _eeprom_read
                                     19 	.globl _ds1302_write_time
                                     20 	.globl _relay_off
                                     21 	.globl _relay_on
                                     22 	.globl _relay_read
                                     23 	.globl _UART2_GetFlagStatus
                                     24 	.globl _UART2_SendData8
                                     25 	.globl _modbus_status
                                     26 	.globl _modbus_buff
                                     27 	.globl _CRC16
                                     28 	.globl _modbus_process
                                     29 ;--------------------------------------------------------
                                     30 ; ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area DATA
      000011                         33 _modbus_buff::
      000011                         34 	.ds 10
                                     35 ;--------------------------------------------------------
                                     36 ; ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area INITIALIZED
      000098                         39 _modbus_status::
      000098                         40 	.ds 1
                                     41 ;--------------------------------------------------------
                                     42 ; absolute external ram data
                                     43 ;--------------------------------------------------------
                                     44 	.area DABS (ABS)
                                     45 
                                     46 ; default segment ordering for linker
                                     47 	.area HOME
                                     48 	.area GSINIT
                                     49 	.area GSFINAL
                                     50 	.area CONST
                                     51 	.area INITIALIZER
                                     52 	.area CODE
                                     53 
                                     54 ;--------------------------------------------------------
                                     55 ; global & static initialisations
                                     56 ;--------------------------------------------------------
                                     57 	.area HOME
                                     58 	.area GSINIT
                                     59 	.area GSFINAL
                                     60 	.area GSINIT
                                     61 ;--------------------------------------------------------
                                     62 ; Home
                                     63 ;--------------------------------------------------------
                                     64 	.area HOME
                                     65 	.area HOME
                                     66 ;--------------------------------------------------------
                                     67 ; code
                                     68 ;--------------------------------------------------------
                                     69 	.area CODE
                                     70 ;	driver/modbus.c: 8: u16 CRC16(u8 *arr_buff,u8 len)
                                     71 ;	-----------------------------------------
                                     72 ;	 function CRC16
                                     73 ;	-----------------------------------------
      008F6A                         74 _CRC16:
      008F6A 52 08            [ 2]   75 	sub	sp, #8
                                     76 ;	driver/modbus.c: 10: u16 crc=0xFFFF;
      008F6C AE FF FF         [ 2]   77 	ldw	x, #0xffff
      008F6F 1F 03            [ 2]   78 	ldw	(0x03, sp), x
                                     79 ;	driver/modbus.c: 12: for ( j=0; j<len;j++)
      008F71 16 0B            [ 2]   80 	ldw	y, (0x0b, sp)
      008F73 17 01            [ 2]   81 	ldw	(0x01, sp), y
      008F75 0F 07            [ 1]   82 	clr	(0x07, sp)
      008F77                         83 00109$:
      008F77 7B 07            [ 1]   84 	ld	a, (0x07, sp)
      008F79 11 0D            [ 1]   85 	cp	a, (0x0d, sp)
      008F7B 24 3D            [ 1]   86 	jrnc	00105$
                                     87 ;	driver/modbus.c: 14: crc=crc ^*arr_buff++;
      008F7D 1E 01            [ 2]   88 	ldw	x, (0x01, sp)
      008F7F F6               [ 1]   89 	ld	a, (x)
      008F80 1E 01            [ 2]   90 	ldw	x, (0x01, sp)
      008F82 5C               [ 1]   91 	incw	x
      008F83 1F 01            [ 2]   92 	ldw	(0x01, sp), x
      008F85 90 5F            [ 1]   93 	clrw	y
      008F87 18 04            [ 1]   94 	xor	a, (0x04, sp)
      008F89 97               [ 1]   95 	ld	xl, a
      008F8A 90 9F            [ 1]   96 	ld	a, yl
      008F8C 18 03            [ 1]   97 	xor	a, (0x03, sp)
      008F8E 95               [ 1]   98 	ld	xh, a
      008F8F 1F 03            [ 2]   99 	ldw	(0x03, sp), x
                                    100 ;	driver/modbus.c: 15: for ( i=0; i<8; i++)
      008F91 0F 08            [ 1]  101 	clr	(0x08, sp)
      008F93                        102 00106$:
                                    103 ;	driver/modbus.c: 19: crc=crc>>1;
      008F93 1E 03            [ 2]  104 	ldw	x, (0x03, sp)
      008F95 54               [ 2]  105 	srlw	x
      008F96 1F 05            [ 2]  106 	ldw	(0x05, sp), x
                                    107 ;	driver/modbus.c: 17: if( ( crc&0x0001) >0)
      008F98 7B 04            [ 1]  108 	ld	a, (0x04, sp)
      008F9A 44               [ 1]  109 	srl	a
      008F9B 24 0D            [ 1]  110 	jrnc	00102$
                                    111 ;	driver/modbus.c: 19: crc=crc>>1;
      008F9D 1E 05            [ 2]  112 	ldw	x, (0x05, sp)
                                    113 ;	driver/modbus.c: 20: crc=crc^ 0xa001;
      008F9F 9F               [ 1]  114 	ld	a, xl
      008FA0 A8 01            [ 1]  115 	xor	a, #0x01
      008FA2 02               [ 1]  116 	rlwa	x
      008FA3 A8 A0            [ 1]  117 	xor	a, #0xa0
      008FA5 95               [ 1]  118 	ld	xh, a
      008FA6 1F 03            [ 2]  119 	ldw	(0x03, sp), x
      008FA8 20 04            [ 2]  120 	jra	00107$
      008FAA                        121 00102$:
                                    122 ;	driver/modbus.c: 23: crc=crc>>1;
      008FAA 16 05            [ 2]  123 	ldw	y, (0x05, sp)
      008FAC 17 03            [ 2]  124 	ldw	(0x03, sp), y
      008FAE                        125 00107$:
                                    126 ;	driver/modbus.c: 15: for ( i=0; i<8; i++)
      008FAE 0C 08            [ 1]  127 	inc	(0x08, sp)
      008FB0 7B 08            [ 1]  128 	ld	a, (0x08, sp)
      008FB2 A1 08            [ 1]  129 	cp	a, #0x08
      008FB4 25 DD            [ 1]  130 	jrc	00106$
                                    131 ;	driver/modbus.c: 12: for ( j=0; j<len;j++)
      008FB6 0C 07            [ 1]  132 	inc	(0x07, sp)
      008FB8 20 BD            [ 2]  133 	jra	00109$
      008FBA                        134 00105$:
                                    135 ;	driver/modbus.c: 26: return ( crc);
      008FBA 1E 03            [ 2]  136 	ldw	x, (0x03, sp)
                                    137 ;	driver/modbus.c: 27: }
      008FBC 5B 08            [ 2]  138 	addw	sp, #8
      008FBE 81               [ 4]  139 	ret
                                    140 ;	driver/modbus.c: 28: void modbus_send(u8 cnt)
                                    141 ;	-----------------------------------------
                                    142 ;	 function modbus_send
                                    143 ;	-----------------------------------------
      008FBF                        144 _modbus_send:
      008FBF 88               [ 1]  145 	push	a
                                    146 ;	driver/modbus.c: 31: for(i=0;i<cnt;i++)
      008FC0 0F 01            [ 1]  147 	clr	(0x01, sp)
      008FC2                        148 00106$:
      008FC2 7B 01            [ 1]  149 	ld	a, (0x01, sp)
      008FC4 11 04            [ 1]  150 	cp	a, (0x04, sp)
      008FC6 24 1D            [ 1]  151 	jrnc	00108$
                                    152 ;	driver/modbus.c: 33: while(( UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET));
      008FC8                        153 00101$:
      008FC8 4B 80            [ 1]  154 	push	#0x80
      008FCA 4B 00            [ 1]  155 	push	#0x00
      008FCC CD B3 84         [ 4]  156 	call	_UART2_GetFlagStatus
      008FCF 5B 02            [ 2]  157 	addw	sp, #2
      008FD1 4D               [ 1]  158 	tnz	a
      008FD2 27 F4            [ 1]  159 	jreq	00101$
                                    160 ;	driver/modbus.c: 34: UART2_SendData8(modbus_buff[i]);
      008FD4 5F               [ 1]  161 	clrw	x
      008FD5 7B 01            [ 1]  162 	ld	a, (0x01, sp)
      008FD7 97               [ 1]  163 	ld	xl, a
      008FD8 1C 00 11         [ 2]  164 	addw	x, #_modbus_buff
      008FDB F6               [ 1]  165 	ld	a, (x)
      008FDC 88               [ 1]  166 	push	a
      008FDD CD B3 3C         [ 4]  167 	call	_UART2_SendData8
      008FE0 84               [ 1]  168 	pop	a
                                    169 ;	driver/modbus.c: 31: for(i=0;i<cnt;i++)
      008FE1 0C 01            [ 1]  170 	inc	(0x01, sp)
      008FE3 20 DD            [ 2]  171 	jra	00106$
      008FE5                        172 00108$:
                                    173 ;	driver/modbus.c: 36: }
      008FE5 84               [ 1]  174 	pop	a
      008FE6 81               [ 4]  175 	ret
                                    176 ;	driver/modbus.c: 38: void modbus_virtual_write(u32 address,u8 data)//虚拟地址写
                                    177 ;	-----------------------------------------
                                    178 ;	 function modbus_virtual_write
                                    179 ;	-----------------------------------------
      008FE7                        180 _modbus_virtual_write:
                                    181 ;	driver/modbus.c: 40: switch(address)
      008FE7 1E 05            [ 2]  182 	ldw	x, (0x05, sp)
      008FE9 A3 04 06         [ 2]  183 	cpw	x, #0x0406
      008FEC 26 04            [ 1]  184 	jrne	00151$
      008FEE 1E 03            [ 2]  185 	ldw	x, (0x03, sp)
      008FF0 27 2D            [ 1]  186 	jreq	00101$
      008FF2                        187 00151$:
      008FF2 1E 05            [ 2]  188 	ldw	x, (0x05, sp)
      008FF4 A3 04 07         [ 2]  189 	cpw	x, #0x0407
      008FF7 26 04            [ 1]  190 	jrne	00154$
      008FF9 1E 03            [ 2]  191 	ldw	x, (0x03, sp)
      008FFB 27 32            [ 1]  192 	jreq	00102$
      008FFD                        193 00154$:
      008FFD 1E 05            [ 2]  194 	ldw	x, (0x05, sp)
      008FFF A3 04 08         [ 2]  195 	cpw	x, #0x0408
      009002 26 04            [ 1]  196 	jrne	00157$
      009004 1E 03            [ 2]  197 	ldw	x, (0x03, sp)
      009006 27 37            [ 1]  198 	jreq	00103$
      009008                        199 00157$:
      009008 1E 05            [ 2]  200 	ldw	x, (0x05, sp)
      00900A A3 04 2E         [ 2]  201 	cpw	x, #0x042e
      00900D 26 04            [ 1]  202 	jrne	00160$
      00900F 1E 03            [ 2]  203 	ldw	x, (0x03, sp)
      009011 27 3C            [ 1]  204 	jreq	00104$
      009013                        205 00160$:
      009013 1E 05            [ 2]  206 	ldw	x, (0x05, sp)
      009015 A3 04 38         [ 2]  207 	cpw	x, #0x0438
      009018 26 04            [ 1]  208 	jrne	00163$
      00901A 1E 03            [ 2]  209 	ldw	x, (0x03, sp)
      00901C 27 3B            [ 1]  210 	jreq	00108$
      00901E                        211 00163$:
      00901E 81               [ 4]  212 	ret
                                    213 ;	driver/modbus.c: 42: case 1030:
      00901F                        214 00101$:
                                    215 ;	driver/modbus.c: 43: ds_time.hour=data;ds1302_write_time(&ds_time);break;
      00901F AE 00 05         [ 2]  216 	ldw	x, #_ds_time+4
      009022 7B 07            [ 1]  217 	ld	a, (0x07, sp)
      009024 F7               [ 1]  218 	ld	(x), a
      009025 4B 01            [ 1]  219 	push	#<_ds_time
      009027 4B 00            [ 1]  220 	push	#(_ds_time >> 8)
      009029 CD 8D 79         [ 4]  221 	call	_ds1302_write_time
      00902C 5B 02            [ 2]  222 	addw	sp, #2
      00902E 81               [ 4]  223 	ret
                                    224 ;	driver/modbus.c: 44: case 1031:
      00902F                        225 00102$:
                                    226 ;	driver/modbus.c: 45: ds_time.minute=data;ds1302_write_time(&ds_time);break;
      00902F AE 00 06         [ 2]  227 	ldw	x, #_ds_time+5
      009032 7B 07            [ 1]  228 	ld	a, (0x07, sp)
      009034 F7               [ 1]  229 	ld	(x), a
      009035 4B 01            [ 1]  230 	push	#<_ds_time
      009037 4B 00            [ 1]  231 	push	#(_ds_time >> 8)
      009039 CD 8D 79         [ 4]  232 	call	_ds1302_write_time
      00903C 5B 02            [ 2]  233 	addw	sp, #2
      00903E 81               [ 4]  234 	ret
                                    235 ;	driver/modbus.c: 46: case 1032:
      00903F                        236 00103$:
                                    237 ;	driver/modbus.c: 47: ds_time.second=data;ds1302_write_time(&ds_time);break;
      00903F AE 00 07         [ 2]  238 	ldw	x, #_ds_time+6
      009042 7B 07            [ 1]  239 	ld	a, (0x07, sp)
      009044 F7               [ 1]  240 	ld	(x), a
      009045 4B 01            [ 1]  241 	push	#<_ds_time
      009047 4B 00            [ 1]  242 	push	#(_ds_time >> 8)
      009049 CD 8D 79         [ 4]  243 	call	_ds1302_write_time
      00904C 5B 02            [ 2]  244 	addw	sp, #2
      00904E 81               [ 4]  245 	ret
                                    246 ;	driver/modbus.c: 48: case 1070:
      00904F                        247 00104$:
                                    248 ;	driver/modbus.c: 49: if(data) beep_on(); else beep_off();break;
      00904F 0D 07            [ 1]  249 	tnz	(0x07, sp)
      009051 27 03            [ 1]  250 	jreq	00106$
      009053 CC 94 7C         [ 2]  251 	jp	_beep_on
      009056                        252 00106$:
      009056 CC 94 95         [ 2]  253 	jp	_beep_off
                                    254 ;	driver/modbus.c: 50: case 1080:
      009059                        255 00108$:
                                    256 ;	driver/modbus.c: 51: if(data) relay_on(); else relay_off();break;
      009059 0D 07            [ 1]  257 	tnz	(0x07, sp)
      00905B 27 03            [ 1]  258 	jreq	00110$
      00905D CC 8A DE         [ 2]  259 	jp	_relay_on
      009060                        260 00110$:
                                    261 ;	driver/modbus.c: 52: }
                                    262 ;	driver/modbus.c: 53: }
      009060 CC 8A F7         [ 2]  263 	jp	_relay_off
                                    264 ;	driver/modbus.c: 54: void modbus_virtual_read(u32 address)//虚拟地址读取
                                    265 ;	-----------------------------------------
                                    266 ;	 function modbus_virtual_read
                                    267 ;	-----------------------------------------
      009063                        268 _modbus_virtual_read:
                                    269 ;	driver/modbus.c: 56: switch(address)
      009063 1E 05            [ 2]  270 	ldw	x, (0x05, sp)
      009065 A3 04 06         [ 2]  271 	cpw	x, #0x0406
      009068 26 07            [ 1]  272 	jrne	00213$
      00906A 1E 03            [ 2]  273 	ldw	x, (0x03, sp)
      00906C 26 03            [ 1]  274 	jrne	00213$
      00906E CC 91 60         [ 2]  275 	jp	00101$
      009071                        276 00213$:
      009071 1E 05            [ 2]  277 	ldw	x, (0x05, sp)
      009073 A3 04 07         [ 2]  278 	cpw	x, #0x0407
      009076 26 07            [ 1]  279 	jrne	00216$
      009078 1E 03            [ 2]  280 	ldw	x, (0x03, sp)
      00907A 26 03            [ 1]  281 	jrne	00216$
      00907C CC 91 6B         [ 2]  282 	jp	00102$
      00907F                        283 00216$:
      00907F 1E 05            [ 2]  284 	ldw	x, (0x05, sp)
      009081 A3 04 08         [ 2]  285 	cpw	x, #0x0408
      009084 26 07            [ 1]  286 	jrne	00219$
      009086 1E 03            [ 2]  287 	ldw	x, (0x03, sp)
      009088 26 03            [ 1]  288 	jrne	00219$
      00908A CC 91 76         [ 2]  289 	jp	00103$
      00908D                        290 00219$:
      00908D 1E 05            [ 2]  291 	ldw	x, (0x05, sp)
      00908F A3 04 10         [ 2]  292 	cpw	x, #0x0410
      009092 26 07            [ 1]  293 	jrne	00222$
      009094 1E 03            [ 2]  294 	ldw	x, (0x03, sp)
      009096 26 03            [ 1]  295 	jrne	00222$
      009098 CC 91 81         [ 2]  296 	jp	00104$
      00909B                        297 00222$:
      00909B 1E 05            [ 2]  298 	ldw	x, (0x05, sp)
      00909D A3 04 11         [ 2]  299 	cpw	x, #0x0411
      0090A0 26 07            [ 1]  300 	jrne	00225$
      0090A2 1E 03            [ 2]  301 	ldw	x, (0x03, sp)
      0090A4 26 03            [ 1]  302 	jrne	00225$
      0090A6 CC 91 8C         [ 2]  303 	jp	00105$
      0090A9                        304 00225$:
      0090A9 1E 05            [ 2]  305 	ldw	x, (0x05, sp)
      0090AB A3 04 12         [ 2]  306 	cpw	x, #0x0412
      0090AE 26 07            [ 1]  307 	jrne	00228$
      0090B0 1E 03            [ 2]  308 	ldw	x, (0x03, sp)
      0090B2 26 03            [ 1]  309 	jrne	00228$
      0090B4 CC 91 94         [ 2]  310 	jp	00106$
      0090B7                        311 00228$:
      0090B7 1E 05            [ 2]  312 	ldw	x, (0x05, sp)
      0090B9 A3 04 1A         [ 2]  313 	cpw	x, #0x041a
      0090BC 26 07            [ 1]  314 	jrne	00231$
      0090BE 1E 03            [ 2]  315 	ldw	x, (0x03, sp)
      0090C0 26 03            [ 1]  316 	jrne	00231$
      0090C2 CC 91 9F         [ 2]  317 	jp	00107$
      0090C5                        318 00231$:
      0090C5 1E 05            [ 2]  319 	ldw	x, (0x05, sp)
      0090C7 A3 04 1B         [ 2]  320 	cpw	x, #0x041b
      0090CA 26 07            [ 1]  321 	jrne	00234$
      0090CC 1E 03            [ 2]  322 	ldw	x, (0x03, sp)
      0090CE 26 03            [ 1]  323 	jrne	00234$
      0090D0 CC 91 AA         [ 2]  324 	jp	00108$
      0090D3                        325 00234$:
      0090D3 1E 05            [ 2]  326 	ldw	x, (0x05, sp)
      0090D5 A3 04 1C         [ 2]  327 	cpw	x, #0x041c
      0090D8 26 07            [ 1]  328 	jrne	00237$
      0090DA 1E 03            [ 2]  329 	ldw	x, (0x03, sp)
      0090DC 26 03            [ 1]  330 	jrne	00237$
      0090DE CC 91 B5         [ 2]  331 	jp	00109$
      0090E1                        332 00237$:
      0090E1 1E 05            [ 2]  333 	ldw	x, (0x05, sp)
      0090E3 A3 04 1D         [ 2]  334 	cpw	x, #0x041d
      0090E6 26 07            [ 1]  335 	jrne	00240$
      0090E8 1E 03            [ 2]  336 	ldw	x, (0x03, sp)
      0090EA 26 03            [ 1]  337 	jrne	00240$
      0090EC CC 91 BD         [ 2]  338 	jp	00110$
      0090EF                        339 00240$:
      0090EF 1E 05            [ 2]  340 	ldw	x, (0x05, sp)
      0090F1 A3 04 1E         [ 2]  341 	cpw	x, #0x041e
      0090F4 26 07            [ 1]  342 	jrne	00243$
      0090F6 1E 03            [ 2]  343 	ldw	x, (0x03, sp)
      0090F8 26 03            [ 1]  344 	jrne	00243$
      0090FA CC 91 C8         [ 2]  345 	jp	00111$
      0090FD                        346 00243$:
      0090FD 1E 05            [ 2]  347 	ldw	x, (0x05, sp)
      0090FF A3 04 24         [ 2]  348 	cpw	x, #0x0424
      009102 26 07            [ 1]  349 	jrne	00246$
      009104 1E 03            [ 2]  350 	ldw	x, (0x03, sp)
      009106 26 03            [ 1]  351 	jrne	00246$
      009108 CC 91 D3         [ 2]  352 	jp	00112$
      00910B                        353 00246$:
      00910B 1E 05            [ 2]  354 	ldw	x, (0x05, sp)
      00910D A3 04 25         [ 2]  355 	cpw	x, #0x0425
      009110 26 07            [ 1]  356 	jrne	00249$
      009112 1E 03            [ 2]  357 	ldw	x, (0x03, sp)
      009114 26 03            [ 1]  358 	jrne	00249$
      009116 CC 91 DB         [ 2]  359 	jp	00113$
      009119                        360 00249$:
      009119 1E 05            [ 2]  361 	ldw	x, (0x05, sp)
      00911B A3 04 26         [ 2]  362 	cpw	x, #0x0426
      00911E 26 07            [ 1]  363 	jrne	00252$
      009120 1E 03            [ 2]  364 	ldw	x, (0x03, sp)
      009122 26 03            [ 1]  365 	jrne	00252$
      009124 CC 91 E6         [ 2]  366 	jp	00114$
      009127                        367 00252$:
      009127 1E 05            [ 2]  368 	ldw	x, (0x05, sp)
      009129 A3 04 27         [ 2]  369 	cpw	x, #0x0427
      00912C 26 07            [ 1]  370 	jrne	00255$
      00912E 1E 03            [ 2]  371 	ldw	x, (0x03, sp)
      009130 26 03            [ 1]  372 	jrne	00255$
      009132 CC 91 F1         [ 2]  373 	jp	00115$
      009135                        374 00255$:
      009135 1E 05            [ 2]  375 	ldw	x, (0x05, sp)
      009137 A3 04 28         [ 2]  376 	cpw	x, #0x0428
      00913A 26 07            [ 1]  377 	jrne	00258$
      00913C 1E 03            [ 2]  378 	ldw	x, (0x03, sp)
      00913E 26 03            [ 1]  379 	jrne	00258$
      009140 CC 91 FC         [ 2]  380 	jp	00116$
      009143                        381 00258$:
      009143 1E 05            [ 2]  382 	ldw	x, (0x05, sp)
      009145 A3 04 2E         [ 2]  383 	cpw	x, #0x042e
      009148 26 07            [ 1]  384 	jrne	00261$
      00914A 1E 03            [ 2]  385 	ldw	x, (0x03, sp)
      00914C 26 03            [ 1]  386 	jrne	00261$
      00914E CC 92 07         [ 2]  387 	jp	00117$
      009151                        388 00261$:
      009151 1E 05            [ 2]  389 	ldw	x, (0x05, sp)
      009153 A3 04 38         [ 2]  390 	cpw	x, #0x0438
      009156 26 07            [ 1]  391 	jrne	00264$
      009158 1E 03            [ 2]  392 	ldw	x, (0x03, sp)
      00915A 26 03            [ 1]  393 	jrne	00264$
      00915C CC 92 11         [ 2]  394 	jp	00118$
      00915F                        395 00264$:
      00915F 81               [ 4]  396 	ret
                                    397 ;	driver/modbus.c: 58: case 1030:
      009160                        398 00101$:
                                    399 ;	driver/modbus.c: 59: modbus_buff[4]=ds_time.hour;break;
      009160 AE 00 15         [ 2]  400 	ldw	x, #_modbus_buff+4
      009163 90 AE 00 05      [ 2]  401 	ldw	y, #_ds_time+4
      009167 90 F6            [ 1]  402 	ld	a, (y)
      009169 F7               [ 1]  403 	ld	(x), a
      00916A 81               [ 4]  404 	ret
                                    405 ;	driver/modbus.c: 60: case 1031:
      00916B                        406 00102$:
                                    407 ;	driver/modbus.c: 61: modbus_buff[4]=ds_time.minute;break;
      00916B AE 00 15         [ 2]  408 	ldw	x, #_modbus_buff+4
      00916E 90 AE 00 06      [ 2]  409 	ldw	y, #_ds_time+5
      009172 90 F6            [ 1]  410 	ld	a, (y)
      009174 F7               [ 1]  411 	ld	(x), a
      009175 81               [ 4]  412 	ret
                                    413 ;	driver/modbus.c: 62: case 1032:
      009176                        414 00103$:
                                    415 ;	driver/modbus.c: 63: modbus_buff[4]=ds_time.second;break;
      009176 AE 00 15         [ 2]  416 	ldw	x, #_modbus_buff+4
      009179 90 AE 00 07      [ 2]  417 	ldw	y, #_ds_time+6
      00917D 90 F6            [ 1]  418 	ld	a, (y)
      00917F F7               [ 1]  419 	ld	(x), a
      009180 81               [ 4]  420 	ret
                                    421 ;	driver/modbus.c: 64: case 1040:
      009181                        422 00104$:
                                    423 ;	driver/modbus.c: 65: modbus_buff[4]=(adc_data.Ain&0xff00)>>8;break;
      009181 AE 00 15         [ 2]  424 	ldw	x, #_modbus_buff+4
      009184 90 CE 00 0E      [ 2]  425 	ldw	y, _adc_data
      009188 90 9E            [ 1]  426 	ld	a, yh
      00918A F7               [ 1]  427 	ld	(x), a
      00918B 81               [ 4]  428 	ret
                                    429 ;	driver/modbus.c: 66: case 1041:
      00918C                        430 00105$:
                                    431 ;	driver/modbus.c: 67: modbus_buff[4]=adc_data.Ain&0xff;break;
      00918C AE 00 15         [ 2]  432 	ldw	x, #_modbus_buff+4
      00918F C6 00 0F         [ 1]  433 	ld	a, _adc_data+1
      009192 F7               [ 1]  434 	ld	(x), a
      009193 81               [ 4]  435 	ret
                                    436 ;	driver/modbus.c: 68: case 1042:
      009194                        437 00106$:
                                    438 ;	driver/modbus.c: 69: modbus_buff[4]=adc_data.Din;break;
      009194 AE 00 15         [ 2]  439 	ldw	x, #_modbus_buff+4
      009197 90 AE 00 10      [ 2]  440 	ldw	y, #_adc_data+2
      00919B 90 F6            [ 1]  441 	ld	a, (y)
      00919D F7               [ 1]  442 	ld	(x), a
      00919E 81               [ 4]  443 	ret
                                    444 ;	driver/modbus.c: 70: case 1050:
      00919F                        445 00107$:
                                    446 ;	driver/modbus.c: 71: modbus_buff[4]=dh_data.W;break;
      00919F AE 00 15         [ 2]  447 	ldw	x, #_modbus_buff+4
      0091A2 90 AE 00 0A      [ 2]  448 	ldw	y, #_dh_data+2
      0091A6 90 F6            [ 1]  449 	ld	a, (y)
      0091A8 F7               [ 1]  450 	ld	(x), a
      0091A9 81               [ 4]  451 	ret
                                    452 ;	driver/modbus.c: 72: case 1051:
      0091AA                        453 00108$:
                                    454 ;	driver/modbus.c: 73: modbus_buff[4]=dh_data.W1;break;
      0091AA AE 00 15         [ 2]  455 	ldw	x, #_modbus_buff+4
      0091AD 90 AE 00 0B      [ 2]  456 	ldw	y, #_dh_data+3
      0091B1 90 F6            [ 1]  457 	ld	a, (y)
      0091B3 F7               [ 1]  458 	ld	(x), a
      0091B4 81               [ 4]  459 	ret
                                    460 ;	driver/modbus.c: 74: case 1052:
      0091B5                        461 00109$:
                                    462 ;	driver/modbus.c: 75: modbus_buff[4]=dh_data.T;break;
      0091B5 AE 00 15         [ 2]  463 	ldw	x, #_modbus_buff+4
      0091B8 C6 00 08         [ 1]  464 	ld	a, _dh_data
      0091BB F7               [ 1]  465 	ld	(x), a
      0091BC 81               [ 4]  466 	ret
                                    467 ;	driver/modbus.c: 76: case 1053:
      0091BD                        468 00110$:
                                    469 ;	driver/modbus.c: 77: modbus_buff[4]=dh_data.T1;break;
      0091BD AE 00 15         [ 2]  470 	ldw	x, #_modbus_buff+4
      0091C0 90 AE 00 09      [ 2]  471 	ldw	y, #_dh_data+1
      0091C4 90 F6            [ 1]  472 	ld	a, (y)
      0091C6 F7               [ 1]  473 	ld	(x), a
      0091C7 81               [ 4]  474 	ret
                                    475 ;	driver/modbus.c: 78: case 1054:
      0091C8                        476 00111$:
                                    477 ;	driver/modbus.c: 79: modbus_buff[4]=dh_data.sum;break;
      0091C8 AE 00 15         [ 2]  478 	ldw	x, #_modbus_buff+4
      0091CB 90 AE 00 0C      [ 2]  479 	ldw	y, #_dh_data+4
      0091CF 90 F6            [ 1]  480 	ld	a, (y)
      0091D1 F7               [ 1]  481 	ld	(x), a
      0091D2 81               [ 4]  482 	ret
                                    483 ;	driver/modbus.c: 80: case 1060:
      0091D3                        484 00112$:
                                    485 ;	driver/modbus.c: 81: modbus_buff[4]=keycount[0];break;
      0091D3 AE 00 15         [ 2]  486 	ldw	x, #_modbus_buff+4
      0091D6 C6 00 99         [ 1]  487 	ld	a, _keycount
      0091D9 F7               [ 1]  488 	ld	(x), a
      0091DA 81               [ 4]  489 	ret
                                    490 ;	driver/modbus.c: 82: case 1061:
      0091DB                        491 00113$:
                                    492 ;	driver/modbus.c: 83: modbus_buff[4]=keycount[1];break;
      0091DB AE 00 15         [ 2]  493 	ldw	x, #_modbus_buff+4
      0091DE 90 AE 00 9A      [ 2]  494 	ldw	y, #_keycount+1
      0091E2 90 F6            [ 1]  495 	ld	a, (y)
      0091E4 F7               [ 1]  496 	ld	(x), a
      0091E5 81               [ 4]  497 	ret
                                    498 ;	driver/modbus.c: 84: case 1062:
      0091E6                        499 00114$:
                                    500 ;	driver/modbus.c: 85: modbus_buff[4]=keycount[2];break;
      0091E6 AE 00 15         [ 2]  501 	ldw	x, #_modbus_buff+4
      0091E9 90 AE 00 9B      [ 2]  502 	ldw	y, #_keycount+2
      0091ED 90 F6            [ 1]  503 	ld	a, (y)
      0091EF F7               [ 1]  504 	ld	(x), a
      0091F0 81               [ 4]  505 	ret
                                    506 ;	driver/modbus.c: 86: case 1063:
      0091F1                        507 00115$:
                                    508 ;	driver/modbus.c: 87: modbus_buff[4]=keycount[3];break;
      0091F1 AE 00 15         [ 2]  509 	ldw	x, #_modbus_buff+4
      0091F4 90 AE 00 9C      [ 2]  510 	ldw	y, #_keycount+3
      0091F8 90 F6            [ 1]  511 	ld	a, (y)
      0091FA F7               [ 1]  512 	ld	(x), a
      0091FB 81               [ 4]  513 	ret
                                    514 ;	driver/modbus.c: 88: case 1064:
      0091FC                        515 00116$:
                                    516 ;	driver/modbus.c: 89: modbus_buff[4]=keycount[4];break;
      0091FC AE 00 15         [ 2]  517 	ldw	x, #_modbus_buff+4
      0091FF 90 AE 00 9D      [ 2]  518 	ldw	y, #_keycount+4
      009203 90 F6            [ 1]  519 	ld	a, (y)
      009205 F7               [ 1]  520 	ld	(x), a
      009206 81               [ 4]  521 	ret
                                    522 ;	driver/modbus.c: 90: case 1070:
      009207                        523 00117$:
                                    524 ;	driver/modbus.c: 91: modbus_buff[4]=beep_read();break;
      009207 AE 00 15         [ 2]  525 	ldw	x, #_modbus_buff+4
      00920A 89               [ 2]  526 	pushw	x
      00920B CD 94 70         [ 4]  527 	call	_beep_read
      00920E 85               [ 2]  528 	popw	x
      00920F F7               [ 1]  529 	ld	(x), a
      009210 81               [ 4]  530 	ret
                                    531 ;	driver/modbus.c: 92: case 1080:
      009211                        532 00118$:
                                    533 ;	driver/modbus.c: 93: modbus_buff[4]=relay_read();break;
      009211 AE 00 15         [ 2]  534 	ldw	x, #_modbus_buff+4
      009214 89               [ 2]  535 	pushw	x
      009215 CD 8A D2         [ 4]  536 	call	_relay_read
      009218 85               [ 2]  537 	popw	x
      009219 F7               [ 1]  538 	ld	(x), a
                                    539 ;	driver/modbus.c: 95: }
                                    540 ;	driver/modbus.c: 97: }
      00921A 81               [ 4]  541 	ret
                                    542 ;	driver/modbus.c: 99: void modbus_process()
                                    543 ;	-----------------------------------------
                                    544 ;	 function modbus_process
                                    545 ;	-----------------------------------------
      00921B                        546 _modbus_process:
      00921B 52 40            [ 2]  547 	sub	sp, #64
                                    548 ;	driver/modbus.c: 104: if(CRC16(modbus_buff,6)!=(((u16)modbus_buff[6])+(u16)(modbus_buff[7])*256))
      00921D 4B 06            [ 1]  549 	push	#0x06
      00921F 4B 11            [ 1]  550 	push	#<_modbus_buff
      009221 4B 00            [ 1]  551 	push	#(_modbus_buff >> 8)
      009223 CD 8F 6A         [ 4]  552 	call	_CRC16
      009226 5B 03            [ 2]  553 	addw	sp, #3
      009228 1F 19            [ 2]  554 	ldw	(0x19, sp), x
      00922A AE 00 17         [ 2]  555 	ldw	x, #_modbus_buff+6
      00922D 1F 1D            [ 2]  556 	ldw	(0x1d, sp), x
      00922F F6               [ 1]  557 	ld	a, (x)
      009230 6B 1C            [ 1]  558 	ld	(0x1c, sp), a
      009232 0F 1B            [ 1]  559 	clr	(0x1b, sp)
      009234 AE 00 18         [ 2]  560 	ldw	x, #_modbus_buff+7
      009237 1F 10            [ 2]  561 	ldw	(0x10, sp), x
      009239 F6               [ 1]  562 	ld	a, (x)
      00923A 97               [ 1]  563 	ld	xl, a
      00923B 4F               [ 1]  564 	clr	a
      00923C 02               [ 1]  565 	rlwa	x
      00923D 72 FB 1B         [ 2]  566 	addw	x, (0x1b, sp)
      009240 1F 0E            [ 2]  567 	ldw	(0x0e, sp), x
      009242 1E 19            [ 2]  568 	ldw	x, (0x19, sp)
      009244 13 0E            [ 2]  569 	cpw	x, (0x0e, sp)
      009246 27 03            [ 1]  570 	jreq	00102$
                                    571 ;	driver/modbus.c: 105: return;
      009248 CC 93 ED         [ 2]  572 	jp	00119$
      00924B                        573 00102$:
                                    574 ;	driver/modbus.c: 108: if(modbus_buff[0]==0)//从站地址为0时仅支持06代码（单寄存器）
      00924B C6 00 11         [ 1]  575 	ld	a, _modbus_buff
      00924E 6B 21            [ 1]  576 	ld	(0x21, sp), a
                                    577 ;	driver/modbus.c: 110: if(modbus_buff[1]==06)// 写单个寄存器（8位）
      009250 AE 00 12         [ 2]  578 	ldw	x, #_modbus_buff+1
      009253 1F 1F            [ 2]  579 	ldw	(0x1f, sp), x
                                    580 ;	driver/modbus.c: 113: address=(u32)modbus_buff[3]+modbus_buff[2]*256;
      009255 AE 00 14         [ 2]  581 	ldw	x, #_modbus_buff+3
      009258 1F 24            [ 2]  582 	ldw	(0x24, sp), x
      00925A AE 00 13         [ 2]  583 	ldw	x, #_modbus_buff+2
      00925D 1F 22            [ 2]  584 	ldw	(0x22, sp), x
                                    585 ;	driver/modbus.c: 114: if(address <1024) eeprom_write(address,modbus_buff[5]);
      00925F AE 00 16         [ 2]  586 	ldw	x, #_modbus_buff+5
      009262 1F 0C            [ 2]  587 	ldw	(0x0c, sp), x
                                    588 ;	driver/modbus.c: 108: if(modbus_buff[0]==0)//从站地址为0时仅支持06代码（单寄存器）
      009264 0D 21            [ 1]  589 	tnz	(0x21, sp)
      009266 26 73            [ 1]  590 	jrne	00108$
                                    591 ;	driver/modbus.c: 110: if(modbus_buff[1]==06)// 写单个寄存器（8位）
      009268 1E 1F            [ 2]  592 	ldw	x, (0x1f, sp)
      00926A F6               [ 1]  593 	ld	a, (x)
      00926B A1 06            [ 1]  594 	cp	a, #0x06
      00926D 27 03            [ 1]  595 	jreq	00172$
      00926F CC 93 ED         [ 2]  596 	jp	00119$
      009272                        597 00172$:
                                    598 ;	driver/modbus.c: 113: address=(u32)modbus_buff[3]+modbus_buff[2]*256;
      009272 1E 24            [ 2]  599 	ldw	x, (0x24, sp)
      009274 F6               [ 1]  600 	ld	a, (x)
      009275 6B 0B            [ 1]  601 	ld	(0x0b, sp), a
      009277 7B 0B            [ 1]  602 	ld	a, (0x0b, sp)
      009279 6B 18            [ 1]  603 	ld	(0x18, sp), a
      00927B 0F 17            [ 1]  604 	clr	(0x17, sp)
      00927D 0F 16            [ 1]  605 	clr	(0x16, sp)
      00927F 0F 15            [ 1]  606 	clr	(0x15, sp)
      009281 1E 22            [ 2]  607 	ldw	x, (0x22, sp)
      009283 F6               [ 1]  608 	ld	a, (x)
      009284 6B 14            [ 1]  609 	ld	(0x14, sp), a
      009286 7B 14            [ 1]  610 	ld	a, (0x14, sp)
      009288 6B 13            [ 1]  611 	ld	(0x13, sp), a
      00928A 0F 12            [ 1]  612 	clr	(0x12, sp)
      00928C 7B 13            [ 1]  613 	ld	a, (0x13, sp)
      00928E 6B 33            [ 1]  614 	ld	(0x33, sp), a
      009290 0F 34            [ 1]  615 	clr	(0x34, sp)
      009292 16 33            [ 2]  616 	ldw	y, (0x33, sp)
      009294 17 31            [ 2]  617 	ldw	(0x31, sp), y
      009296 7B 31            [ 1]  618 	ld	a, (0x31, sp)
      009298 49               [ 1]  619 	rlc	a
      009299 4F               [ 1]  620 	clr	a
      00929A A2 00            [ 1]  621 	sbc	a, #0x00
      00929C 6B 30            [ 1]  622 	ld	(0x30, sp), a
      00929E 6B 2F            [ 1]  623 	ld	(0x2f, sp), a
      0092A0 1E 17            [ 2]  624 	ldw	x, (0x17, sp)
      0092A2 72 FB 31         [ 2]  625 	addw	x, (0x31, sp)
      0092A5 1F 3B            [ 2]  626 	ldw	(0x3b, sp), x
      0092A7 7B 16            [ 1]  627 	ld	a, (0x16, sp)
      0092A9 19 30            [ 1]  628 	adc	a, (0x30, sp)
      0092AB 6B 3A            [ 1]  629 	ld	(0x3a, sp), a
      0092AD 7B 15            [ 1]  630 	ld	a, (0x15, sp)
      0092AF 19 2F            [ 1]  631 	adc	a, (0x2f, sp)
      0092B1 6B 39            [ 1]  632 	ld	(0x39, sp), a
      0092B3 16 3A            [ 2]  633 	ldw	y, (0x3a, sp)
      0092B5 17 3A            [ 2]  634 	ldw	(0x3a, sp), y
                                    635 ;	driver/modbus.c: 114: if(address <1024) eeprom_write(address,modbus_buff[5]);
      0092B7 1E 3B            [ 2]  636 	ldw	x, (0x3b, sp)
      0092B9 A3 04 00         [ 2]  637 	cpw	x, #0x0400
      0092BC 7B 3A            [ 1]  638 	ld	a, (0x3a, sp)
      0092BE A2 00            [ 1]  639 	sbc	a, #0x00
      0092C0 7B 39            [ 1]  640 	ld	a, (0x39, sp)
      0092C2 A2 00            [ 1]  641 	sbc	a, #0x00
      0092C4 25 03            [ 1]  642 	jrc	00173$
      0092C6 CC 93 ED         [ 2]  643 	jp	00119$
      0092C9                        644 00173$:
      0092C9 1E 0C            [ 2]  645 	ldw	x, (0x0c, sp)
      0092CB F6               [ 1]  646 	ld	a, (x)
      0092CC 88               [ 1]  647 	push	a
      0092CD 1E 3C            [ 2]  648 	ldw	x, (0x3c, sp)
      0092CF 89               [ 2]  649 	pushw	x
      0092D0 1E 3C            [ 2]  650 	ldw	x, (0x3c, sp)
      0092D2 89               [ 2]  651 	pushw	x
      0092D3 CD 8F 27         [ 4]  652 	call	_eeprom_write
      0092D6 5B 05            [ 2]  653 	addw	sp, #5
                                    654 ;	driver/modbus.c: 116: return;
      0092D8 CC 93 ED         [ 2]  655 	jp	00119$
      0092DB                        656 00108$:
                                    657 ;	driver/modbus.c: 119: if(modbus_buff[0]==eeprom_read(0)) //当地址为本机地址时
      0092DB 5F               [ 1]  658 	clrw	x
      0092DC 89               [ 2]  659 	pushw	x
      0092DD 5F               [ 1]  660 	clrw	x
      0092DE 89               [ 2]  661 	pushw	x
      0092DF CD 8F 0E         [ 4]  662 	call	_eeprom_read
      0092E2 5B 04            [ 2]  663 	addw	sp, #4
      0092E4 6B 2E            [ 1]  664 	ld	(0x2e, sp), a
      0092E6 7B 21            [ 1]  665 	ld	a, (0x21, sp)
      0092E8 11 2E            [ 1]  666 	cp	a, (0x2e, sp)
      0092EA 27 03            [ 1]  667 	jreq	00176$
      0092EC CC 93 ED         [ 2]  668 	jp	00119$
      0092EF                        669 00176$:
                                    670 ;	driver/modbus.c: 121: if(modbus_buff[1]==06) // 写单个寄存器
      0092EF 1E 1F            [ 2]  671 	ldw	x, (0x1f, sp)
      0092F1 F6               [ 1]  672 	ld	a, (x)
      0092F2 A1 06            [ 1]  673 	cp	a, #0x06
      0092F4 26 70            [ 1]  674 	jrne	00112$
                                    675 ;	driver/modbus.c: 124: address=(u32)modbus_buff[3]+modbus_buff[2]*256;
      0092F6 1E 24            [ 2]  676 	ldw	x, (0x24, sp)
      0092F8 F6               [ 1]  677 	ld	a, (x)
      0092F9 6B 2D            [ 1]  678 	ld	(0x2d, sp), a
      0092FB 0F 2C            [ 1]  679 	clr	(0x2c, sp)
      0092FD 90 5F            [ 1]  680 	clrw	y
      0092FF 1E 22            [ 2]  681 	ldw	x, (0x22, sp)
      009301 F6               [ 1]  682 	ld	a, (x)
      009302 95               [ 1]  683 	ld	xh, a
      009303 4F               [ 1]  684 	clr	a
      009304 97               [ 1]  685 	ld	xl, a
      009305 9E               [ 1]  686 	ld	a, xh
      009306 49               [ 1]  687 	rlc	a
      009307 4F               [ 1]  688 	clr	a
      009308 A2 00            [ 1]  689 	sbc	a, #0x00
      00930A 6B 27            [ 1]  690 	ld	(0x27, sp), a
      00930C 6B 26            [ 1]  691 	ld	(0x26, sp), a
      00930E 72 FB 2C         [ 2]  692 	addw	x, (0x2c, sp)
      009311 90 9F            [ 1]  693 	ld	a, yl
      009313 19 27            [ 1]  694 	adc	a, (0x27, sp)
      009315 90 02            [ 1]  695 	rlwa	y
      009317 19 26            [ 1]  696 	adc	a, (0x26, sp)
      009319 1F 37            [ 2]  697 	ldw	(0x37, sp), x
      00931B 90 95            [ 1]  698 	ld	yh, a
                                    699 ;	driver/modbus.c: 125: if(address <1024) eeprom_write(address,modbus_buff[5]);
      00931D 1E 37            [ 2]  700 	ldw	x, (0x37, sp)
      00931F A3 04 00         [ 2]  701 	cpw	x, #0x0400
      009322 90 9F            [ 1]  702 	ld	a, yl
      009324 A2 00            [ 1]  703 	sbc	a, #0x00
      009326 90 9E            [ 1]  704 	ld	a, yh
      009328 A2 00            [ 1]  705 	sbc	a, #0x00
      00932A 24 12            [ 1]  706 	jrnc	00110$
      00932C 1E 0C            [ 2]  707 	ldw	x, (0x0c, sp)
      00932E F6               [ 1]  708 	ld	a, (x)
      00932F 90 89            [ 2]  709 	pushw	y
      009331 88               [ 1]  710 	push	a
      009332 1E 3A            [ 2]  711 	ldw	x, (0x3a, sp)
      009334 89               [ 2]  712 	pushw	x
      009335 90 89            [ 2]  713 	pushw	y
      009337 CD 8F 27         [ 4]  714 	call	_eeprom_write
      00933A 5B 05            [ 2]  715 	addw	sp, #5
      00933C 90 85            [ 2]  716 	popw	y
      00933E                        717 00110$:
                                    718 ;	driver/modbus.c: 126: modbus_virtual_write(address,modbus_buff[5]);
      00933E 1E 0C            [ 2]  719 	ldw	x, (0x0c, sp)
      009340 F6               [ 1]  720 	ld	a, (x)
      009341 88               [ 1]  721 	push	a
      009342 1E 38            [ 2]  722 	ldw	x, (0x38, sp)
      009344 89               [ 2]  723 	pushw	x
      009345 90 89            [ 2]  724 	pushw	y
      009347 CD 8F E7         [ 4]  725 	call	_modbus_virtual_write
      00934A 5B 05            [ 2]  726 	addw	sp, #5
                                    727 ;	driver/modbus.c: 128: u16 crc=CRC16(modbus_buff,6);
      00934C 4B 06            [ 1]  728 	push	#0x06
      00934E 4B 11            [ 1]  729 	push	#<_modbus_buff
      009350 4B 00            [ 1]  730 	push	#(_modbus_buff >> 8)
      009352 CD 8F 6A         [ 4]  731 	call	_CRC16
      009355 5B 03            [ 2]  732 	addw	sp, #3
                                    733 ;	driver/modbus.c: 129: modbus_buff[6]=crc&0xff;
      009357 9F               [ 1]  734 	ld	a, xl
      009358 16 1D            [ 2]  735 	ldw	y, (0x1d, sp)
      00935A 90 F7            [ 1]  736 	ld	(y), a
                                    737 ;	driver/modbus.c: 130: modbus_buff[7]=crc>>8;
      00935C 9E               [ 1]  738 	ld	a, xh
      00935D 1E 10            [ 2]  739 	ldw	x, (0x10, sp)
      00935F F7               [ 1]  740 	ld	(x), a
                                    741 ;	driver/modbus.c: 133: modbus_send(8);
      009360 4B 08            [ 1]  742 	push	#0x08
      009362 CD 8F BF         [ 4]  743 	call	_modbus_send
      009365 84               [ 1]  744 	pop	a
      009366                        745 00112$:
                                    746 ;	driver/modbus.c: 137: if(modbus_buff[1]==03) // 读单个寄存器
      009366 1E 1F            [ 2]  747 	ldw	x, (0x1f, sp)
      009368 F6               [ 1]  748 	ld	a, (x)
      009369 A1 03            [ 1]  749 	cp	a, #0x03
      00936B 27 03            [ 1]  750 	jreq	00183$
      00936D CC 93 ED         [ 2]  751 	jp	00119$
      009370                        752 00183$:
                                    753 ;	driver/modbus.c: 140: address=(u32)modbus_buff[3]+modbus_buff[2]*256;
      009370 1E 24            [ 2]  754 	ldw	x, (0x24, sp)
      009372 F6               [ 1]  755 	ld	a, (x)
      009373 6B 0A            [ 1]  756 	ld	(0x0a, sp), a
      009375 0F 09            [ 1]  757 	clr	(0x09, sp)
      009377 0F 08            [ 1]  758 	clr	(0x08, sp)
      009379 0F 07            [ 1]  759 	clr	(0x07, sp)
      00937B 1E 22            [ 2]  760 	ldw	x, (0x22, sp)
      00937D F6               [ 1]  761 	ld	a, (x)
      00937E 97               [ 1]  762 	ld	xl, a
      00937F 4F               [ 1]  763 	clr	a
      009380 02               [ 1]  764 	rlwa	x
      009381 9E               [ 1]  765 	ld	a, xh
      009382 49               [ 1]  766 	rlc	a
      009383 4F               [ 1]  767 	clr	a
      009384 A2 00            [ 1]  768 	sbc	a, #0x00
      009386 88               [ 1]  769 	push	a
      009387 6B 04            [ 1]  770 	ld	(0x04, sp), a
      009389 84               [ 1]  771 	pop	a
      00938A 72 FB 09         [ 2]  772 	addw	x, (0x09, sp)
      00938D 19 08            [ 1]  773 	adc	a, (0x08, sp)
      00938F 90 97            [ 1]  774 	ld	yl, a
      009391 7B 03            [ 1]  775 	ld	a, (0x03, sp)
      009393 19 07            [ 1]  776 	adc	a, (0x07, sp)
      009395 90 95            [ 1]  777 	ld	yh, a
      009397 17 3D            [ 2]  778 	ldw	(0x3d, sp), y
                                    779 ;	driver/modbus.c: 141: if(address <1024) {
      009399 A3 04 00         [ 2]  780 	cpw	x, #0x0400
      00939C 7B 3E            [ 1]  781 	ld	a, (0x3e, sp)
      00939E A2 00            [ 1]  782 	sbc	a, #0x00
      0093A0 7B 3D            [ 1]  783 	ld	a, (0x3d, sp)
      0093A2 A2 00            [ 1]  784 	sbc	a, #0x00
      0093A4 24 1C            [ 1]  785 	jrnc	00114$
                                    786 ;	driver/modbus.c: 142: modbus_buff[4]=eeprom_read(address);
      0093A6 A6 11            [ 1]  787 	ld	a, #<_modbus_buff
      0093A8 AB 04            [ 1]  788 	add	a, #0x04
      0093AA 6B 02            [ 1]  789 	ld	(0x02, sp), a
      0093AC A6 00            [ 1]  790 	ld	a, #(_modbus_buff >> 8)
      0093AE A9 00            [ 1]  791 	adc	a, #0x00
      0093B0 6B 01            [ 1]  792 	ld	(0x01, sp), a
      0093B2 89               [ 2]  793 	pushw	x
      0093B3 89               [ 2]  794 	pushw	x
      0093B4 16 41            [ 2]  795 	ldw	y, (0x41, sp)
      0093B6 90 89            [ 2]  796 	pushw	y
      0093B8 CD 8F 0E         [ 4]  797 	call	_eeprom_read
      0093BB 5B 04            [ 2]  798 	addw	sp, #4
      0093BD 85               [ 2]  799 	popw	x
      0093BE 16 01            [ 2]  800 	ldw	y, (0x01, sp)
      0093C0 90 F7            [ 1]  801 	ld	(y), a
      0093C2                        802 00114$:
                                    803 ;	driver/modbus.c: 145: modbus_virtual_read(address);
      0093C2 89               [ 2]  804 	pushw	x
      0093C3 1E 3F            [ 2]  805 	ldw	x, (0x3f, sp)
      0093C5 89               [ 2]  806 	pushw	x
      0093C6 CD 90 63         [ 4]  807 	call	_modbus_virtual_read
      0093C9 5B 04            [ 2]  808 	addw	sp, #4
                                    809 ;	driver/modbus.c: 146: modbus_buff[3]=0;
      0093CB 1E 24            [ 2]  810 	ldw	x, (0x24, sp)
      0093CD 7F               [ 1]  811 	clr	(x)
                                    812 ;	driver/modbus.c: 147: modbus_buff[2]=2;// 字节数
      0093CE 1E 22            [ 2]  813 	ldw	x, (0x22, sp)
      0093D0 A6 02            [ 1]  814 	ld	a, #0x02
      0093D2 F7               [ 1]  815 	ld	(x), a
                                    816 ;	driver/modbus.c: 149: u16 crc=CRC16(modbus_buff,5);
      0093D3 4B 05            [ 1]  817 	push	#0x05
      0093D5 4B 11            [ 1]  818 	push	#<_modbus_buff
      0093D7 4B 00            [ 1]  819 	push	#(_modbus_buff >> 8)
      0093D9 CD 8F 6A         [ 4]  820 	call	_CRC16
      0093DC 5B 03            [ 2]  821 	addw	sp, #3
                                    822 ;	driver/modbus.c: 150: modbus_buff[5]=crc&0xff;
      0093DE 9F               [ 1]  823 	ld	a, xl
      0093DF 16 0C            [ 2]  824 	ldw	y, (0x0c, sp)
      0093E1 90 F7            [ 1]  825 	ld	(y), a
                                    826 ;	driver/modbus.c: 151: modbus_buff[6]=crc>>8;
      0093E3 9E               [ 1]  827 	ld	a, xh
      0093E4 1E 1D            [ 2]  828 	ldw	x, (0x1d, sp)
      0093E6 F7               [ 1]  829 	ld	(x), a
                                    830 ;	driver/modbus.c: 154: modbus_send(7);
      0093E7 4B 07            [ 1]  831 	push	#0x07
      0093E9 CD 8F BF         [ 4]  832 	call	_modbus_send
      0093EC 84               [ 1]  833 	pop	a
      0093ED                        834 00119$:
                                    835 ;	driver/modbus.c: 157: }
      0093ED 5B 40            [ 2]  836 	addw	sp, #64
      0093EF 81               [ 4]  837 	ret
                                    838 	.area CODE
                                    839 	.area CONST
                                    840 	.area INITIALIZER
      008705                        841 __xinit__modbus_status:
      008705 00                     842 	.db #0x00	; 0
                                    843 	.area CABS (ABS)
