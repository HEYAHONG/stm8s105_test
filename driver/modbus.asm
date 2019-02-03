;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module modbus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _modbus_virtual_read
	.globl _modbus_virtual_write
	.globl _modbus_send
	.globl _beep_off
	.globl _beep_on
	.globl _beep_read
	.globl _eeprom_write
	.globl _eeprom_read
	.globl _ds1302_write_time
	.globl _relay_off
	.globl _relay_on
	.globl _relay_read
	.globl _UART2_GetFlagStatus
	.globl _UART2_SendData8
	.globl _modbus_status
	.globl _modbus_buff
	.globl _CRC16
	.globl _modbus_process
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_modbus_buff::
	.ds 10
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_modbus_status::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	driver/modbus.c: 8: u16 CRC16(u8 *arr_buff,u8 len)
;	-----------------------------------------
;	 function CRC16
;	-----------------------------------------
_CRC16:
	sub	sp, #8
;	driver/modbus.c: 10: u16 crc=0xFFFF;
	ldw	x, #0xffff
	ldw	(0x03, sp), x
;	driver/modbus.c: 12: for ( j=0; j<len;j++)
	ldw	y, (0x0b, sp)
	ldw	(0x01, sp), y
	clr	(0x07, sp)
00109$:
	ld	a, (0x07, sp)
	cp	a, (0x0d, sp)
	jrnc	00105$
;	driver/modbus.c: 14: crc=crc ^*arr_buff++;
	ldw	x, (0x01, sp)
	ld	a, (x)
	ldw	x, (0x01, sp)
	incw	x
	ldw	(0x01, sp), x
	clrw	y
	xor	a, (0x04, sp)
	ld	xl, a
	ld	a, yl
	xor	a, (0x03, sp)
	ld	xh, a
	ldw	(0x03, sp), x
;	driver/modbus.c: 15: for ( i=0; i<8; i++)
	clr	(0x08, sp)
00106$:
;	driver/modbus.c: 19: crc=crc>>1;
	ldw	x, (0x03, sp)
	srlw	x
	ldw	(0x05, sp), x
;	driver/modbus.c: 17: if( ( crc&0x0001) >0)
	ld	a, (0x04, sp)
	srl	a
	jrnc	00102$
;	driver/modbus.c: 19: crc=crc>>1;
	ldw	x, (0x05, sp)
;	driver/modbus.c: 20: crc=crc^ 0xa001;
	ld	a, xl
	xor	a, #0x01
	rlwa	x
	xor	a, #0xa0
	ld	xh, a
	ldw	(0x03, sp), x
	jra	00107$
00102$:
;	driver/modbus.c: 23: crc=crc>>1;
	ldw	y, (0x05, sp)
	ldw	(0x03, sp), y
00107$:
;	driver/modbus.c: 15: for ( i=0; i<8; i++)
	inc	(0x08, sp)
	ld	a, (0x08, sp)
	cp	a, #0x08
	jrc	00106$
;	driver/modbus.c: 12: for ( j=0; j<len;j++)
	inc	(0x07, sp)
	jra	00109$
00105$:
;	driver/modbus.c: 26: return ( crc);
	ldw	x, (0x03, sp)
;	driver/modbus.c: 27: }
	addw	sp, #8
	ret
;	driver/modbus.c: 28: void modbus_send(u8 cnt)
;	-----------------------------------------
;	 function modbus_send
;	-----------------------------------------
_modbus_send:
	push	a
;	driver/modbus.c: 31: for(i=0;i<cnt;i++)
	clr	(0x01, sp)
00106$:
	ld	a, (0x01, sp)
	cp	a, (0x04, sp)
	jrnc	00108$
;	driver/modbus.c: 33: while(( UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET));
00101$:
	push	#0x80
	push	#0x00
	call	_UART2_GetFlagStatus
	addw	sp, #2
	tnz	a
	jreq	00101$
;	driver/modbus.c: 34: UART2_SendData8(modbus_buff[i]);
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	addw	x, #_modbus_buff
	ld	a, (x)
	push	a
	call	_UART2_SendData8
	pop	a
;	driver/modbus.c: 31: for(i=0;i<cnt;i++)
	inc	(0x01, sp)
	jra	00106$
00108$:
;	driver/modbus.c: 36: }
	pop	a
	ret
;	driver/modbus.c: 38: void modbus_virtual_write(u32 address,u8 data)//虚拟地址写
;	-----------------------------------------
;	 function modbus_virtual_write
;	-----------------------------------------
_modbus_virtual_write:
;	driver/modbus.c: 40: switch(address)
	ldw	x, (0x05, sp)
	cpw	x, #0x0406
	jrne	00151$
	ldw	x, (0x03, sp)
	jreq	00101$
00151$:
	ldw	x, (0x05, sp)
	cpw	x, #0x0407
	jrne	00154$
	ldw	x, (0x03, sp)
	jreq	00102$
00154$:
	ldw	x, (0x05, sp)
	cpw	x, #0x0408
	jrne	00157$
	ldw	x, (0x03, sp)
	jreq	00103$
00157$:
	ldw	x, (0x05, sp)
	cpw	x, #0x042e
	jrne	00160$
	ldw	x, (0x03, sp)
	jreq	00104$
00160$:
	ldw	x, (0x05, sp)
	cpw	x, #0x0438
	jrne	00163$
	ldw	x, (0x03, sp)
	jreq	00108$
00163$:
	ret
;	driver/modbus.c: 42: case 1030:
00101$:
;	driver/modbus.c: 43: ds_time.hour=data;ds1302_write_time(&ds_time);break;
	ldw	x, #_ds_time+4
	ld	a, (0x07, sp)
	ld	(x), a
	push	#<_ds_time
	push	#(_ds_time >> 8)
	call	_ds1302_write_time
	addw	sp, #2
	ret
;	driver/modbus.c: 44: case 1031:
00102$:
;	driver/modbus.c: 45: ds_time.minute=data;ds1302_write_time(&ds_time);break;
	ldw	x, #_ds_time+5
	ld	a, (0x07, sp)
	ld	(x), a
	push	#<_ds_time
	push	#(_ds_time >> 8)
	call	_ds1302_write_time
	addw	sp, #2
	ret
;	driver/modbus.c: 46: case 1032:
00103$:
;	driver/modbus.c: 47: ds_time.second=data;ds1302_write_time(&ds_time);break;
	ldw	x, #_ds_time+6
	ld	a, (0x07, sp)
	ld	(x), a
	push	#<_ds_time
	push	#(_ds_time >> 8)
	call	_ds1302_write_time
	addw	sp, #2
	ret
;	driver/modbus.c: 48: case 1070:
00104$:
;	driver/modbus.c: 49: if(data) beep_on(); else beep_off();break;
	tnz	(0x07, sp)
	jreq	00106$
	jp	_beep_on
00106$:
	jp	_beep_off
;	driver/modbus.c: 50: case 1080:
00108$:
;	driver/modbus.c: 51: if(data) relay_on(); else relay_off();break;
	tnz	(0x07, sp)
	jreq	00110$
	jp	_relay_on
00110$:
;	driver/modbus.c: 52: }
;	driver/modbus.c: 53: }
	jp	_relay_off
;	driver/modbus.c: 54: void modbus_virtual_read(u32 address)//虚拟地址读取
;	-----------------------------------------
;	 function modbus_virtual_read
;	-----------------------------------------
_modbus_virtual_read:
;	driver/modbus.c: 56: switch(address)
	ldw	x, (0x05, sp)
	cpw	x, #0x0406
	jrne	00213$
	ldw	x, (0x03, sp)
	jrne	00213$
	jp	00101$
00213$:
	ldw	x, (0x05, sp)
	cpw	x, #0x0407
	jrne	00216$
	ldw	x, (0x03, sp)
	jrne	00216$
	jp	00102$
00216$:
	ldw	x, (0x05, sp)
	cpw	x, #0x0408
	jrne	00219$
	ldw	x, (0x03, sp)
	jrne	00219$
	jp	00103$
00219$:
	ldw	x, (0x05, sp)
	cpw	x, #0x0410
	jrne	00222$
	ldw	x, (0x03, sp)
	jrne	00222$
	jp	00104$
00222$:
	ldw	x, (0x05, sp)
	cpw	x, #0x0411
	jrne	00225$
	ldw	x, (0x03, sp)
	jrne	00225$
	jp	00105$
00225$:
	ldw	x, (0x05, sp)
	cpw	x, #0x0412
	jrne	00228$
	ldw	x, (0x03, sp)
	jrne	00228$
	jp	00106$
00228$:
	ldw	x, (0x05, sp)
	cpw	x, #0x041a
	jrne	00231$
	ldw	x, (0x03, sp)
	jrne	00231$
	jp	00107$
00231$:
	ldw	x, (0x05, sp)
	cpw	x, #0x041b
	jrne	00234$
	ldw	x, (0x03, sp)
	jrne	00234$
	jp	00108$
00234$:
	ldw	x, (0x05, sp)
	cpw	x, #0x041c
	jrne	00237$
	ldw	x, (0x03, sp)
	jrne	00237$
	jp	00109$
00237$:
	ldw	x, (0x05, sp)
	cpw	x, #0x041d
	jrne	00240$
	ldw	x, (0x03, sp)
	jrne	00240$
	jp	00110$
00240$:
	ldw	x, (0x05, sp)
	cpw	x, #0x041e
	jrne	00243$
	ldw	x, (0x03, sp)
	jrne	00243$
	jp	00111$
00243$:
	ldw	x, (0x05, sp)
	cpw	x, #0x0424
	jrne	00246$
	ldw	x, (0x03, sp)
	jrne	00246$
	jp	00112$
00246$:
	ldw	x, (0x05, sp)
	cpw	x, #0x0425
	jrne	00249$
	ldw	x, (0x03, sp)
	jrne	00249$
	jp	00113$
00249$:
	ldw	x, (0x05, sp)
	cpw	x, #0x0426
	jrne	00252$
	ldw	x, (0x03, sp)
	jrne	00252$
	jp	00114$
00252$:
	ldw	x, (0x05, sp)
	cpw	x, #0x0427
	jrne	00255$
	ldw	x, (0x03, sp)
	jrne	00255$
	jp	00115$
00255$:
	ldw	x, (0x05, sp)
	cpw	x, #0x0428
	jrne	00258$
	ldw	x, (0x03, sp)
	jrne	00258$
	jp	00116$
00258$:
	ldw	x, (0x05, sp)
	cpw	x, #0x042e
	jrne	00261$
	ldw	x, (0x03, sp)
	jrne	00261$
	jp	00117$
00261$:
	ldw	x, (0x05, sp)
	cpw	x, #0x0438
	jrne	00264$
	ldw	x, (0x03, sp)
	jrne	00264$
	jp	00118$
00264$:
	ret
;	driver/modbus.c: 58: case 1030:
00101$:
;	driver/modbus.c: 59: modbus_buff[4]=ds_time.hour;break;
	ldw	x, #_modbus_buff+4
	ldw	y, #_ds_time+4
	ld	a, (y)
	ld	(x), a
	ret
;	driver/modbus.c: 60: case 1031:
00102$:
;	driver/modbus.c: 61: modbus_buff[4]=ds_time.minute;break;
	ldw	x, #_modbus_buff+4
	ldw	y, #_ds_time+5
	ld	a, (y)
	ld	(x), a
	ret
;	driver/modbus.c: 62: case 1032:
00103$:
;	driver/modbus.c: 63: modbus_buff[4]=ds_time.second;break;
	ldw	x, #_modbus_buff+4
	ldw	y, #_ds_time+6
	ld	a, (y)
	ld	(x), a
	ret
;	driver/modbus.c: 64: case 1040:
00104$:
;	driver/modbus.c: 65: modbus_buff[4]=(adc_data.Ain&0xff00)>>8;break;
	ldw	x, #_modbus_buff+4
	ldw	y, _adc_data
	ld	a, yh
	ld	(x), a
	ret
;	driver/modbus.c: 66: case 1041:
00105$:
;	driver/modbus.c: 67: modbus_buff[4]=adc_data.Ain&0xff;break;
	ldw	x, #_modbus_buff+4
	ld	a, _adc_data+1
	ld	(x), a
	ret
;	driver/modbus.c: 68: case 1042:
00106$:
;	driver/modbus.c: 69: modbus_buff[4]=adc_data.Din;break;
	ldw	x, #_modbus_buff+4
	ldw	y, #_adc_data+2
	ld	a, (y)
	ld	(x), a
	ret
;	driver/modbus.c: 70: case 1050:
00107$:
;	driver/modbus.c: 71: modbus_buff[4]=dh_data.W;break;
	ldw	x, #_modbus_buff+4
	ldw	y, #_dh_data+2
	ld	a, (y)
	ld	(x), a
	ret
;	driver/modbus.c: 72: case 1051:
00108$:
;	driver/modbus.c: 73: modbus_buff[4]=dh_data.W1;break;
	ldw	x, #_modbus_buff+4
	ldw	y, #_dh_data+3
	ld	a, (y)
	ld	(x), a
	ret
;	driver/modbus.c: 74: case 1052:
00109$:
;	driver/modbus.c: 75: modbus_buff[4]=dh_data.T;break;
	ldw	x, #_modbus_buff+4
	ld	a, _dh_data
	ld	(x), a
	ret
;	driver/modbus.c: 76: case 1053:
00110$:
;	driver/modbus.c: 77: modbus_buff[4]=dh_data.T1;break;
	ldw	x, #_modbus_buff+4
	ldw	y, #_dh_data+1
	ld	a, (y)
	ld	(x), a
	ret
;	driver/modbus.c: 78: case 1054:
00111$:
;	driver/modbus.c: 79: modbus_buff[4]=dh_data.sum;break;
	ldw	x, #_modbus_buff+4
	ldw	y, #_dh_data+4
	ld	a, (y)
	ld	(x), a
	ret
;	driver/modbus.c: 80: case 1060:
00112$:
;	driver/modbus.c: 81: modbus_buff[4]=keycount[0];break;
	ldw	x, #_modbus_buff+4
	ld	a, _keycount
	ld	(x), a
	ret
;	driver/modbus.c: 82: case 1061:
00113$:
;	driver/modbus.c: 83: modbus_buff[4]=keycount[1];break;
	ldw	x, #_modbus_buff+4
	ldw	y, #_keycount+1
	ld	a, (y)
	ld	(x), a
	ret
;	driver/modbus.c: 84: case 1062:
00114$:
;	driver/modbus.c: 85: modbus_buff[4]=keycount[2];break;
	ldw	x, #_modbus_buff+4
	ldw	y, #_keycount+2
	ld	a, (y)
	ld	(x), a
	ret
;	driver/modbus.c: 86: case 1063:
00115$:
;	driver/modbus.c: 87: modbus_buff[4]=keycount[3];break;
	ldw	x, #_modbus_buff+4
	ldw	y, #_keycount+3
	ld	a, (y)
	ld	(x), a
	ret
;	driver/modbus.c: 88: case 1064:
00116$:
;	driver/modbus.c: 89: modbus_buff[4]=keycount[4];break;
	ldw	x, #_modbus_buff+4
	ldw	y, #_keycount+4
	ld	a, (y)
	ld	(x), a
	ret
;	driver/modbus.c: 90: case 1070:
00117$:
;	driver/modbus.c: 91: modbus_buff[4]=beep_read();break;
	ldw	x, #_modbus_buff+4
	pushw	x
	call	_beep_read
	popw	x
	ld	(x), a
	ret
;	driver/modbus.c: 92: case 1080:
00118$:
;	driver/modbus.c: 93: modbus_buff[4]=relay_read();break;
	ldw	x, #_modbus_buff+4
	pushw	x
	call	_relay_read
	popw	x
	ld	(x), a
;	driver/modbus.c: 95: }
;	driver/modbus.c: 97: }
	ret
;	driver/modbus.c: 99: void modbus_process()
;	-----------------------------------------
;	 function modbus_process
;	-----------------------------------------
_modbus_process:
	sub	sp, #64
;	driver/modbus.c: 104: if(CRC16(modbus_buff,6)!=(((u16)modbus_buff[6])+(u16)(modbus_buff[7])*256))
	push	#0x06
	push	#<_modbus_buff
	push	#(_modbus_buff >> 8)
	call	_CRC16
	addw	sp, #3
	ldw	(0x19, sp), x
	ldw	x, #_modbus_buff+6
	ldw	(0x1d, sp), x
	ld	a, (x)
	ld	(0x1c, sp), a
	clr	(0x1b, sp)
	ldw	x, #_modbus_buff+7
	ldw	(0x10, sp), x
	ld	a, (x)
	ld	xl, a
	clr	a
	rlwa	x
	addw	x, (0x1b, sp)
	ldw	(0x0e, sp), x
	ldw	x, (0x19, sp)
	cpw	x, (0x0e, sp)
	jreq	00102$
;	driver/modbus.c: 105: return;
	jp	00119$
00102$:
;	driver/modbus.c: 108: if(modbus_buff[0]==0)//从站地址为0时仅支持06代码（单寄存器）
	ld	a, _modbus_buff
	ld	(0x21, sp), a
;	driver/modbus.c: 110: if(modbus_buff[1]==06)// 写单个寄存器（8位）
	ldw	x, #_modbus_buff+1
	ldw	(0x1f, sp), x
;	driver/modbus.c: 113: address=(u32)modbus_buff[3]+modbus_buff[2]*256;
	ldw	x, #_modbus_buff+3
	ldw	(0x24, sp), x
	ldw	x, #_modbus_buff+2
	ldw	(0x22, sp), x
;	driver/modbus.c: 114: if(address <1024) eeprom_write(address,modbus_buff[5]);
	ldw	x, #_modbus_buff+5
	ldw	(0x0c, sp), x
;	driver/modbus.c: 108: if(modbus_buff[0]==0)//从站地址为0时仅支持06代码（单寄存器）
	tnz	(0x21, sp)
	jrne	00108$
;	driver/modbus.c: 110: if(modbus_buff[1]==06)// 写单个寄存器（8位）
	ldw	x, (0x1f, sp)
	ld	a, (x)
	cp	a, #0x06
	jreq	00172$
	jp	00119$
00172$:
;	driver/modbus.c: 113: address=(u32)modbus_buff[3]+modbus_buff[2]*256;
	ldw	x, (0x24, sp)
	ld	a, (x)
	ld	(0x0b, sp), a
	ld	a, (0x0b, sp)
	ld	(0x18, sp), a
	clr	(0x17, sp)
	clr	(0x16, sp)
	clr	(0x15, sp)
	ldw	x, (0x22, sp)
	ld	a, (x)
	ld	(0x14, sp), a
	ld	a, (0x14, sp)
	ld	(0x13, sp), a
	clr	(0x12, sp)
	ld	a, (0x13, sp)
	ld	(0x33, sp), a
	clr	(0x34, sp)
	ldw	y, (0x33, sp)
	ldw	(0x31, sp), y
	ld	a, (0x31, sp)
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x30, sp), a
	ld	(0x2f, sp), a
	ldw	x, (0x17, sp)
	addw	x, (0x31, sp)
	ldw	(0x3b, sp), x
	ld	a, (0x16, sp)
	adc	a, (0x30, sp)
	ld	(0x3a, sp), a
	ld	a, (0x15, sp)
	adc	a, (0x2f, sp)
	ld	(0x39, sp), a
	ldw	y, (0x3a, sp)
	ldw	(0x3a, sp), y
;	driver/modbus.c: 114: if(address <1024) eeprom_write(address,modbus_buff[5]);
	ldw	x, (0x3b, sp)
	cpw	x, #0x0400
	ld	a, (0x3a, sp)
	sbc	a, #0x00
	ld	a, (0x39, sp)
	sbc	a, #0x00
	jrc	00173$
	jp	00119$
00173$:
	ldw	x, (0x0c, sp)
	ld	a, (x)
	push	a
	ldw	x, (0x3c, sp)
	pushw	x
	ldw	x, (0x3c, sp)
	pushw	x
	call	_eeprom_write
	addw	sp, #5
;	driver/modbus.c: 116: return;
	jp	00119$
00108$:
;	driver/modbus.c: 119: if(modbus_buff[0]==eeprom_read(0)) //当地址为本机地址时
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	call	_eeprom_read
	addw	sp, #4
	ld	(0x2e, sp), a
	ld	a, (0x21, sp)
	cp	a, (0x2e, sp)
	jreq	00176$
	jp	00119$
00176$:
;	driver/modbus.c: 121: if(modbus_buff[1]==06) // 写单个寄存器
	ldw	x, (0x1f, sp)
	ld	a, (x)
	cp	a, #0x06
	jrne	00112$
;	driver/modbus.c: 124: address=(u32)modbus_buff[3]+modbus_buff[2]*256;
	ldw	x, (0x24, sp)
	ld	a, (x)
	ld	(0x2d, sp), a
	clr	(0x2c, sp)
	clrw	y
	ldw	x, (0x22, sp)
	ld	a, (x)
	ld	xh, a
	clr	a
	ld	xl, a
	ld	a, xh
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x27, sp), a
	ld	(0x26, sp), a
	addw	x, (0x2c, sp)
	ld	a, yl
	adc	a, (0x27, sp)
	rlwa	y
	adc	a, (0x26, sp)
	ldw	(0x37, sp), x
	ld	yh, a
;	driver/modbus.c: 125: if(address <1024) eeprom_write(address,modbus_buff[5]);
	ldw	x, (0x37, sp)
	cpw	x, #0x0400
	ld	a, yl
	sbc	a, #0x00
	ld	a, yh
	sbc	a, #0x00
	jrnc	00110$
	ldw	x, (0x0c, sp)
	ld	a, (x)
	pushw	y
	push	a
	ldw	x, (0x3a, sp)
	pushw	x
	pushw	y
	call	_eeprom_write
	addw	sp, #5
	popw	y
00110$:
;	driver/modbus.c: 126: modbus_virtual_write(address,modbus_buff[5]);
	ldw	x, (0x0c, sp)
	ld	a, (x)
	push	a
	ldw	x, (0x38, sp)
	pushw	x
	pushw	y
	call	_modbus_virtual_write
	addw	sp, #5
;	driver/modbus.c: 128: u16 crc=CRC16(modbus_buff,6);
	push	#0x06
	push	#<_modbus_buff
	push	#(_modbus_buff >> 8)
	call	_CRC16
	addw	sp, #3
;	driver/modbus.c: 129: modbus_buff[6]=crc&0xff;
	ld	a, xl
	ldw	y, (0x1d, sp)
	ld	(y), a
;	driver/modbus.c: 130: modbus_buff[7]=crc>>8;
	ld	a, xh
	ldw	x, (0x10, sp)
	ld	(x), a
;	driver/modbus.c: 133: modbus_send(8);
	push	#0x08
	call	_modbus_send
	pop	a
00112$:
;	driver/modbus.c: 137: if(modbus_buff[1]==03) // 读单个寄存器
	ldw	x, (0x1f, sp)
	ld	a, (x)
	cp	a, #0x03
	jreq	00183$
	jp	00119$
00183$:
;	driver/modbus.c: 140: address=(u32)modbus_buff[3]+modbus_buff[2]*256;
	ldw	x, (0x24, sp)
	ld	a, (x)
	ld	(0x0a, sp), a
	clr	(0x09, sp)
	clr	(0x08, sp)
	clr	(0x07, sp)
	ldw	x, (0x22, sp)
	ld	a, (x)
	ld	xl, a
	clr	a
	rlwa	x
	ld	a, xh
	rlc	a
	clr	a
	sbc	a, #0x00
	push	a
	ld	(0x04, sp), a
	pop	a
	addw	x, (0x09, sp)
	adc	a, (0x08, sp)
	ld	yl, a
	ld	a, (0x03, sp)
	adc	a, (0x07, sp)
	ld	yh, a
	ldw	(0x3d, sp), y
;	driver/modbus.c: 141: if(address <1024) {
	cpw	x, #0x0400
	ld	a, (0x3e, sp)
	sbc	a, #0x00
	ld	a, (0x3d, sp)
	sbc	a, #0x00
	jrnc	00114$
;	driver/modbus.c: 142: modbus_buff[4]=eeprom_read(address);
	ld	a, #<_modbus_buff
	add	a, #0x04
	ld	(0x02, sp), a
	ld	a, #(_modbus_buff >> 8)
	adc	a, #0x00
	ld	(0x01, sp), a
	pushw	x
	pushw	x
	ldw	y, (0x41, sp)
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	popw	x
	ldw	y, (0x01, sp)
	ld	(y), a
00114$:
;	driver/modbus.c: 145: modbus_virtual_read(address);
	pushw	x
	ldw	x, (0x3f, sp)
	pushw	x
	call	_modbus_virtual_read
	addw	sp, #4
;	driver/modbus.c: 146: modbus_buff[3]=0;
	ldw	x, (0x24, sp)
	clr	(x)
;	driver/modbus.c: 147: modbus_buff[2]=2;// 字节数
	ldw	x, (0x22, sp)
	ld	a, #0x02
	ld	(x), a
;	driver/modbus.c: 149: u16 crc=CRC16(modbus_buff,5);
	push	#0x05
	push	#<_modbus_buff
	push	#(_modbus_buff >> 8)
	call	_CRC16
	addw	sp, #3
;	driver/modbus.c: 150: modbus_buff[5]=crc&0xff;
	ld	a, xl
	ldw	y, (0x0c, sp)
	ld	(y), a
;	driver/modbus.c: 151: modbus_buff[6]=crc>>8;
	ld	a, xh
	ldw	x, (0x1d, sp)
	ld	(x), a
;	driver/modbus.c: 154: modbus_send(7);
	push	#0x07
	call	_modbus_send
	pop	a
00119$:
;	driver/modbus.c: 157: }
	addw	sp, #64
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
__xinit__modbus_status:
	.db #0x00	; 0
	.area CABS (ABS)
