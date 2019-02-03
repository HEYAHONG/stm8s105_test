                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module driver_common
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _OLED_Clear
                                     12 	.globl _OLED_Init
                                     13 	.globl _beep_init
                                     14 	.globl _Init_UART2
                                     15 	.globl _key_init
                                     16 	.globl _ds1302_read_time
                                     17 	.globl _ds1302_active
                                     18 	.globl _ReadDHT12
                                     19 	.globl _ReadADC
                                     20 	.globl _ReadDin
                                     21 	.globl _adc_data
                                     22 	.globl _dh_data
                                     23 	.globl _ds_time
                                     24 	.globl _driver_init
                                     25 	.globl _driver_loop
                                     26 ;--------------------------------------------------------
                                     27 ; ram data
                                     28 ;--------------------------------------------------------
                                     29 	.area DATA
      000001                         30 _ds_time::
      000001                         31 	.ds 7
      000008                         32 _dh_data::
      000008                         33 	.ds 5
      00000D                         34 _last_read_dh_time:
      00000D                         35 	.ds 1
      00000E                         36 _adc_data::
      00000E                         37 	.ds 3
                                     38 ;--------------------------------------------------------
                                     39 ; ram data
                                     40 ;--------------------------------------------------------
                                     41 	.area INITIALIZED
                                     42 ;--------------------------------------------------------
                                     43 ; absolute external ram data
                                     44 ;--------------------------------------------------------
                                     45 	.area DABS (ABS)
                                     46 
                                     47 ; default segment ordering for linker
                                     48 	.area HOME
                                     49 	.area GSINIT
                                     50 	.area GSFINAL
                                     51 	.area CONST
                                     52 	.area INITIALIZER
                                     53 	.area CODE
                                     54 
                                     55 ;--------------------------------------------------------
                                     56 ; global & static initialisations
                                     57 ;--------------------------------------------------------
                                     58 	.area HOME
                                     59 	.area GSINIT
                                     60 	.area GSFINAL
                                     61 	.area GSINIT
                                     62 ;--------------------------------------------------------
                                     63 ; Home
                                     64 ;--------------------------------------------------------
                                     65 	.area HOME
                                     66 	.area HOME
                                     67 ;--------------------------------------------------------
                                     68 ; code
                                     69 ;--------------------------------------------------------
                                     70 	.area CODE
                                     71 ;	driver/driver_common.c: 2: void driver_init()
                                     72 ;	-----------------------------------------
                                     73 ;	 function driver_init
                                     74 ;	-----------------------------------------
      008A64                         75 _driver_init:
                                     76 ;	driver/driver_common.c: 4: key_init();
      008A64 CD 93 F0         [ 4]   77 	call	_key_init
                                     78 ;	driver/driver_common.c: 5: beep_init();
      008A67 CD 94 62         [ 4]   79 	call	_beep_init
                                     80 ;	driver/driver_common.c: 7: Init_UART2();
      008A6A CD 8B 10         [ 4]   81 	call	_Init_UART2
                                     82 ;	driver/driver_common.c: 8: OLED_Init();
      008A6D CD A3 57         [ 4]   83 	call	_OLED_Init
                                     84 ;	driver/driver_common.c: 9: OLED_Clear();
      008A70 CD A1 9F         [ 4]   85 	call	_OLED_Clear
                                     86 ;	driver/driver_common.c: 10: ds1302_active();
      008A73 CD 8E 07         [ 4]   87 	call	_ds1302_active
                                     88 ;	driver/driver_common.c: 11: enableInterrupts(); 
      008A76 9A               [ 1]   89 	rim
                                     90 ;	driver/driver_common.c: 12: }
      008A77 81               [ 4]   91 	ret
                                     92 ;	driver/driver_common.c: 21: void driver_loop()
                                     93 ;	-----------------------------------------
                                     94 ;	 function driver_loop
                                     95 ;	-----------------------------------------
      008A78                         96 _driver_loop:
      008A78 52 06            [ 2]   97 	sub	sp, #6
                                     98 ;	driver/driver_common.c: 23: ds1302_read_time(&ds_time);
      008A7A 4B 01            [ 1]   99 	push	#<_ds_time
      008A7C 4B 00            [ 1]  100 	push	#(_ds_time >> 8)
      008A7E CD 8D 09         [ 4]  101 	call	_ds1302_read_time
      008A81 5B 02            [ 2]  102 	addw	sp, #2
                                    103 ;	driver/driver_common.c: 26: if(ds_time.second/3 != last_read_dh_time/3)
      008A83 AE 00 07         [ 2]  104 	ldw	x, #_ds_time+6
      008A86 1F 03            [ 2]  105 	ldw	(0x03, sp), x
      008A88 F6               [ 1]  106 	ld	a, (x)
      008A89 5F               [ 1]  107 	clrw	x
      008A8A 97               [ 1]  108 	ld	xl, a
      008A8B 4B 03            [ 1]  109 	push	#0x03
      008A8D 4B 00            [ 1]  110 	push	#0x00
      008A8F 89               [ 2]  111 	pushw	x
      008A90 CD B9 AC         [ 4]  112 	call	__divsint
      008A93 5B 04            [ 2]  113 	addw	sp, #4
      008A95 1F 01            [ 2]  114 	ldw	(0x01, sp), x
      008A97 5F               [ 1]  115 	clrw	x
      008A98 C6 00 0D         [ 1]  116 	ld	a, _last_read_dh_time+0
      008A9B 97               [ 1]  117 	ld	xl, a
      008A9C 4B 03            [ 1]  118 	push	#0x03
      008A9E 4B 00            [ 1]  119 	push	#0x00
      008AA0 89               [ 2]  120 	pushw	x
      008AA1 CD B9 AC         [ 4]  121 	call	__divsint
      008AA4 5B 04            [ 2]  122 	addw	sp, #4
      008AA6 1F 05            [ 2]  123 	ldw	(0x05, sp), x
      008AA8 1E 01            [ 2]  124 	ldw	x, (0x01, sp)
      008AAA 13 05            [ 2]  125 	cpw	x, (0x05, sp)
      008AAC 27 0F            [ 1]  126 	jreq	00102$
                                    127 ;	driver/driver_common.c: 28: ReadDHT12(&dh_data);
      008AAE 4B 08            [ 1]  128 	push	#<_dh_data
      008AB0 4B 00            [ 1]  129 	push	#(_dh_data >> 8)
      008AB2 CD 8A 09         [ 4]  130 	call	_ReadDHT12
      008AB5 5B 02            [ 2]  131 	addw	sp, #2
                                    132 ;	driver/driver_common.c: 29: last_read_dh_time=ds_time.second;
      008AB7 1E 03            [ 2]  133 	ldw	x, (0x03, sp)
      008AB9 F6               [ 1]  134 	ld	a, (x)
      008ABA C7 00 0D         [ 1]  135 	ld	_last_read_dh_time+0, a
      008ABD                        136 00102$:
                                    137 ;	driver/driver_common.c: 33: adc_data.Ain=ReadADC();
      008ABD CD A4 DD         [ 4]  138 	call	_ReadADC
      008AC0 90 AE 00 0E      [ 2]  139 	ldw	y, #_adc_data
      008AC4 90 FF            [ 2]  140 	ldw	(y), x
                                    141 ;	driver/driver_common.c: 34: adc_data.Din=ReadDin();
      008AC6 AE 00 10         [ 2]  142 	ldw	x, #_adc_data+2
      008AC9 89               [ 2]  143 	pushw	x
      008ACA CD A5 38         [ 4]  144 	call	_ReadDin
      008ACD 85               [ 2]  145 	popw	x
      008ACE F7               [ 1]  146 	ld	(x), a
                                    147 ;	driver/driver_common.c: 35: }
      008ACF 5B 06            [ 2]  148 	addw	sp, #6
      008AD1 81               [ 4]  149 	ret
                                    150 	.area CODE
                                    151 	.area CONST
                                    152 	.area INITIALIZER
                                    153 	.area CABS (ABS)
