;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module app
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Is_In_Area
	.globl _sprintf
	.globl _OLED_ShowString
	.globl _OLED_Clear
	.globl _beep_off
	.globl _beep_on
	.globl _beep_read
	.globl _eeprom_write
	.globl _eeprom_read
	.globl _ds1302_write_time
	.globl _relay_off
	.globl _relay_on
	.globl _relay_read
	.globl _app_init
	.globl _app_loop
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_Is_In_Area_flag_65536_384:
	.ds 1
_app_loop_status_65536_386:
	.ds 2
_app_loop_adcH_131072_387:
	.ds 1
_app_loop_adcL_131072_387:
	.ds 1
_app_loop_h_131072_387:
	.ds 1
_app_loop_m_131072_387:
	.ds 1
_app_loop_s_131072_387:
	.ds 1
_app_loop_i_131072_387:
	.ds 1
_app_loop_beep_flag_131072_387:
	.ds 1
_app_loop_relay_flag_131072_387:
	.ds 1
_app_loop_baseadd_262144_389:
	.ds 2
_app_loop_data_327680_390:
	.ds 1
_app_loop_conbase_327680_390:
	.ds 1
_app_loop_is_rule_on_196608_411:
	.ds 1
_app_loop_h_262144_421:
	.ds 1
_app_loop_m_262144_427:
	.ds 1
_app_loop_temp_131072_432:
	.ds 100
_app_loop_i_131072_432:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
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
;	driver/app.c: 4: u8 Is_In_Area(u16 rule_address,u8 data)
;	-----------------------------------------
;	 function Is_In_Area
;	-----------------------------------------
_Is_In_Area:
	sub	sp, #8
;	driver/app.c: 7: flag=0;
	clr	_Is_In_Area_flag_65536_384+0
;	driver/app.c: 8: if(data<eeprom_read(rule_address)) flag|=0x01;//置位0
	ldw	x, (0x0b, sp)
	clr	(0x02, sp)
	clr	(0x01, sp)
	pushw	x
	pushw	x
	ldw	y, (0x05, sp)
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	popw	x
	cp	a, (0x0d, sp)
	jrule	00102$
	ld	a, _Is_In_Area_flag_65536_384+0
	exg	a, yl
	clr	a
	exg	a, yl
	or	a, #0x01
	ld	_Is_In_Area_flag_65536_384+0, a
00102$:
;	driver/app.c: 9: if(eeprom_read(rule_address)<=data && data <=eeprom_read(rule_address+1)) flag|=0x02;//置位1
	pushw	x
	ldw	x, (0x03, sp)
	pushw	x
	call	_eeprom_read
	addw	sp, #4
	ldw	x, (0x0b, sp)
	incw	x
	clr	(0x06, sp)
	clr	(0x05, sp)
	cp	a, (0x0d, sp)
	jrugt	00104$
	pushw	x
	pushw	x
	ldw	y, (0x09, sp)
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	popw	x
	cp	a, (0x0d, sp)
	jrc	00104$
	ld	a, _Is_In_Area_flag_65536_384+0
	exg	a, yl
	clr	a
	exg	a, yl
	or	a, #0x02
	ld	_Is_In_Area_flag_65536_384+0, a
00104$:
;	driver/app.c: 10: if(eeprom_read(rule_address+1)<data) flag|=0x04;
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	call	_eeprom_read
	addw	sp, #4
	cp	a, (0x0d, sp)
	jrnc	00107$
	ld	a, _Is_In_Area_flag_65536_384+0
	exg	a, xl
	clr	a
	exg	a, xl
	or	a, #0x04
	ld	_Is_In_Area_flag_65536_384+0, a
00107$:
;	driver/app.c: 11: if((eeprom_read(rule_address+2)&flag)) return 1;
	ldw	y, (0x0b, sp)
	addw	y, #0x0002
	clrw	x
	pushw	y
	pushw	x
	call	_eeprom_read
	addw	sp, #4
	and	a, _Is_In_Area_flag_65536_384+0
	jreq	00109$
	ld	a, #0x01
;	driver/app.c: 12: else return 0;
	.byte 0x21
00109$:
	clr	a
00111$:
;	driver/app.c: 14: }
	addw	sp, #8
	ret
;	driver/app.c: 15: void app_init()
;	-----------------------------------------
;	 function app_init
;	-----------------------------------------
_app_init:
;	driver/app.c: 17: beep_off();
	call	_beep_off
;	driver/app.c: 18: relay_off();
	call	_relay_off
;	driver/app.c: 19: OLED_Clear();
	call	_OLED_Clear
;	driver/app.c: 21: eeprom_write(1,0);
	push	#0x00
	push	#0x01
	clrw	x
	pushw	x
	push	#0x00
	call	_eeprom_write
	addw	sp, #5
;	driver/app.c: 22: eeprom_write(2,0);
	push	#0x00
	push	#0x02
	clrw	x
	pushw	x
	push	#0x00
	call	_eeprom_write
	addw	sp, #5
;	driver/app.c: 23: eeprom_write(3,0);
	push	#0x00
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	_eeprom_write
	addw	sp, #5
;	driver/app.c: 25: }
	ret
;	driver/app.c: 26: void app_loop()
;	-----------------------------------------
;	 function app_loop
;	-----------------------------------------
_app_loop:
	sub	sp, #122
;	driver/app.c: 29: status=eeprom_read(2)*256+eeprom_read(3);
	push	#0x02
	clrw	x
	pushw	x
	push	#0x00
	call	_eeprom_read
	addw	sp, #4
	clr	(0x29, sp)
	ld	(0x64, sp), a
	clr	(0x65, sp)
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	_eeprom_read
	addw	sp, #4
	clrw	x
	ld	xl, a
	addw	x, (0x64, sp)
	ldw	_app_loop_status_65536_386+0, x
;	driver/app.c: 30: if(eeprom_read(4))//启用规则
	push	#0x04
	clrw	x
	pushw	x
	push	#0x00
	call	_eeprom_read
	addw	sp, #4
	ld	(0x75, sp), a
	jrne	00645$
	jp	00165$
00645$:
;	driver/app.c: 33: adcH=adc_data.Ain>>8;
	ldw	x, _adc_data
	ld	a, xh
	clr	(0x76, sp)
	ld	_app_loop_adcH_131072_387+0, a
;	driver/app.c: 34: adcL=adc_data.Ain&0xff;
	ld	a, xl
	ld	_app_loop_adcL_131072_387+0, a
;	driver/app.c: 35: h=ds_time.hour/16*10+ds_time.hour%16;
	ldw	x, #_ds_time
	ld	a, (0x4, x)
	ld	(0x02, sp), a
	clr	(0x01, sp)
	push	#0x10
	push	#0x00
	ldw	x, (0x03, sp)
	pushw	x
	call	__divsint
	addw	sp, #4
	ld	a, #0x0a
	mul	x, a
	exg	a, xl
	ld	(0x74, sp), a
	exg	a, xl
	push	#0x10
	push	#0x00
	ldw	x, (0x03, sp)
	pushw	x
	call	__modsint
	addw	sp, #4
	ld	a, xl
	add	a, (0x74, sp)
	ld	_app_loop_h_131072_387+0, a
;	driver/app.c: 36: m=ds_time.minute/16*10+ds_time.minute%16;
	ldw	x, #_ds_time
	ld	a, (0x5, x)
	ld	(0x73, sp), a
	clr	(0x72, sp)
	push	#0x10
	push	#0x00
	ldw	x, (0x74, sp)
	pushw	x
	call	__divsint
	addw	sp, #4
	ld	a, #0x0a
	mul	x, a
	exg	a, xl
	ld	(0x53, sp), a
	exg	a, xl
	push	#0x10
	push	#0x00
	ldw	x, (0x74, sp)
	pushw	x
	call	__modsint
	addw	sp, #4
	ld	a, xl
	add	a, (0x53, sp)
	ld	_app_loop_m_131072_387+0, a
;	driver/app.c: 37: s=ds_time.second/16*10+ds_time.second%16;
	ldw	x, #_ds_time
	ld	a, (0x6, x)
	ld	(0x52, sp), a
	clr	(0x51, sp)
	push	#0x10
	push	#0x00
	ldw	x, (0x53, sp)
	pushw	x
	call	__divsint
	addw	sp, #4
	ld	a, #0x0a
	mul	x, a
	exg	a, xl
	ld	(0x16, sp), a
	exg	a, xl
	push	#0x10
	push	#0x00
	ldw	x, (0x53, sp)
	pushw	x
	call	__modsint
	addw	sp, #4
	ld	a, xl
	add	a, (0x16, sp)
	ld	_app_loop_s_131072_387+0, a
;	driver/app.c: 38: beep_flag=0,relay_flag=0;//准备相应标志位
	clr	_app_loop_beep_flag_131072_387+0
	clr	_app_loop_relay_flag_131072_387+0
;	driver/app.c: 39: for(i=0;i<16;i++)//共16条规则
	clr	_app_loop_i_131072_387+0
	ldw	x, #_adc_data+2
	ldw	(0x14, sp), x
00240$:
;	driver/app.c: 42: baseadd=(u16)32*(i+1);//规则偏移地址
	clrw	x
	ld	a, _app_loop_i_131072_387+0
	ld	xl, a
	incw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
;	driver/app.c: 43: if(eeprom_read(baseadd))//当前规则已启用
	ldw	_app_loop_baseadd_262144_389+0, x
	clrw	y
	pushw	x
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	ld	(0x18, sp), a
	jrne	00646$
	jp	00156$
00646$:
;	driver/app.c: 47: data=h,conbase=1;//当前需要判断的数据，当前条件在规则中的偏移
	mov	_app_loop_data_327680_390+0, _app_loop_h_131072_387+0
	mov	_app_loop_conbase_327680_390+0, #0x01
;	driver/app.c: 48: if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
	ldw	x, _app_loop_baseadd_262144_389+0
	incw	x
	incw	x
	incw	x
	exgw	x, y
	clrw	x
	pushw	y
	pushw	x
	call	_eeprom_read
	addw	sp, #4
	tnz	a
	jreq	00104$
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	clrw	y
	pushw	x
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	ld	(0x17, sp), a
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	incw	x
	clrw	y
	pushw	x
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	cp	a, (0x17, sp)
	jrc	00104$
;	driver/app.c: 55: if(!Is_In_Area(baseadd+conbase,data)) continue;
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	push	_app_loop_data_327680_390+0
	pushw	x
	call	_Is_In_Area
	addw	sp, #3
	tnz	a
	jrne	00649$
	jp	00156$
00649$:
00104$:
;	driver/app.c: 60: data=m,conbase=4;//当前需要判断的数据，当前条件在规则中的偏移
	mov	_app_loop_data_327680_390+0, _app_loop_m_131072_387+0
	mov	_app_loop_conbase_327680_390+0, #0x04
;	driver/app.c: 61: if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
	ldw	x, _app_loop_baseadd_262144_389+0
	addw	x, #0x0004
	incw	x
	incw	x
	exgw	x, y
	clrw	x
	pushw	y
	pushw	x
	call	_eeprom_read
	addw	sp, #4
	tnz	a
	jreq	00109$
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	clrw	y
	pushw	x
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	ld	(0x1a, sp), a
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	incw	x
	clrw	y
	pushw	x
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	cp	a, (0x1a, sp)
	jrc	00109$
;	driver/app.c: 68: if(!Is_In_Area(baseadd+conbase,data)) continue;
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	push	_app_loop_data_327680_390+0
	pushw	x
	call	_Is_In_Area
	addw	sp, #3
	tnz	a
	jrne	00652$
	jp	00156$
00652$:
00109$:
;	driver/app.c: 73: data=s,conbase=7;//当前需要判断的数据，当前条件在规则中的偏移
	mov	_app_loop_data_327680_390+0, _app_loop_s_131072_387+0
	mov	_app_loop_conbase_327680_390+0, #0x07
;	driver/app.c: 74: if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
	ldw	x, _app_loop_baseadd_262144_389+0
	addw	x, #0x0007
	incw	x
	incw	x
	exgw	x, y
	clrw	x
	pushw	y
	pushw	x
	call	_eeprom_read
	addw	sp, #4
	tnz	a
	jreq	00114$
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	clrw	y
	pushw	x
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	ld	(0x19, sp), a
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	incw	x
	clrw	y
	pushw	x
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	cp	a, (0x19, sp)
	jrc	00114$
;	driver/app.c: 81: if(!Is_In_Area(baseadd+conbase,data)) continue;
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	push	_app_loop_data_327680_390+0
	pushw	x
	call	_Is_In_Area
	addw	sp, #3
	tnz	a
	jrne	00655$
	jp	00156$
00655$:
00114$:
;	driver/app.c: 86: data=adcH,conbase=10;//当前需要判断的数据，当前条件在规则中的偏移
	mov	_app_loop_data_327680_390+0, _app_loop_adcH_131072_387+0
	mov	_app_loop_conbase_327680_390+0, #0x0a
;	driver/app.c: 87: if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
	ldw	x, _app_loop_baseadd_262144_389+0
	addw	x, #0x000a
	incw	x
	incw	x
	exgw	x, y
	clrw	x
	pushw	y
	pushw	x
	call	_eeprom_read
	addw	sp, #4
	tnz	a
	jreq	00119$
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	clrw	y
	pushw	x
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	ld	(0x1c, sp), a
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	incw	x
	clrw	y
	pushw	x
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	cp	a, (0x1c, sp)
	jrc	00119$
;	driver/app.c: 94: if(!Is_In_Area(baseadd+conbase,data)) continue;
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	push	_app_loop_data_327680_390+0
	pushw	x
	call	_Is_In_Area
	addw	sp, #3
	tnz	a
	jrne	00658$
	jp	00156$
00658$:
00119$:
;	driver/app.c: 99: data=adcL,conbase=13;//当前需要判断的数据，当前条件在规则中的偏移
	mov	_app_loop_data_327680_390+0, _app_loop_adcL_131072_387+0
	mov	_app_loop_conbase_327680_390+0, #0x0d
;	driver/app.c: 100: if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
	ldw	x, _app_loop_baseadd_262144_389+0
	addw	x, #0x000d
	incw	x
	incw	x
	exgw	x, y
	clrw	x
	pushw	y
	pushw	x
	call	_eeprom_read
	addw	sp, #4
	tnz	a
	jreq	00124$
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	clrw	y
	pushw	x
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	ld	(0x1b, sp), a
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	incw	x
	clrw	y
	pushw	x
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	cp	a, (0x1b, sp)
	jrc	00124$
;	driver/app.c: 107: if(!Is_In_Area(baseadd+conbase,data)) continue;
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	push	_app_loop_data_327680_390+0
	pushw	x
	call	_Is_In_Area
	addw	sp, #3
	tnz	a
	jrne	00661$
	jp	00156$
00661$:
00124$:
;	driver/app.c: 111: if(eeprom_read(baseadd+16)) //判断adc数字输入
	ldw	x, _app_loop_baseadd_262144_389+0
	addw	x, #0x0010
	clrw	y
	pushw	x
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	tnz	a
	jreq	00129$
;	driver/app.c: 113: if(!adc_data.Din) continue;
	ldw	x, (0x14, sp)
	ld	a, (x)
	jrne	00663$
	jp	00156$
00663$:
00129$:
;	driver/app.c: 116: data=dh_data.T,conbase=17;//当前需要判断的数据，当前条件在规则中的偏移
	ld	a, _dh_data
	ld	_app_loop_data_327680_390+0, a
	mov	_app_loop_conbase_327680_390+0, #0x11
;	driver/app.c: 117: if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
	ldw	x, _app_loop_baseadd_262144_389+0
	addw	x, #0x0011
	incw	x
	incw	x
	exgw	x, y
	clrw	x
	pushw	y
	pushw	x
	call	_eeprom_read
	addw	sp, #4
	tnz	a
	jreq	00133$
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	clrw	y
	pushw	x
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	ld	(0x04, sp), a
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	incw	x
	clrw	y
	pushw	x
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	cp	a, (0x04, sp)
	jrc	00133$
;	driver/app.c: 125: if(!Is_In_Area(baseadd+conbase,data)) continue;
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	push	_app_loop_data_327680_390+0
	pushw	x
	call	_Is_In_Area
	addw	sp, #3
	tnz	a
	jrne	00666$
	jp	00156$
00666$:
00133$:
;	driver/app.c: 129: data=dh_data.T1,conbase=20;//当前需要判断的数据，当前条件在规则中的偏移
	ld	a, _dh_data+1
	ld	_app_loop_data_327680_390+0, a
	mov	_app_loop_conbase_327680_390+0, #0x14
;	driver/app.c: 130: if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
	ldw	x, _app_loop_baseadd_262144_389+0
	addw	x, #0x0014
	incw	x
	incw	x
	exgw	x, y
	clrw	x
	pushw	y
	pushw	x
	call	_eeprom_read
	addw	sp, #4
	tnz	a
	jreq	00138$
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	clrw	y
	pushw	x
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	ld	(0x03, sp), a
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	incw	x
	clrw	y
	pushw	x
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	cp	a, (0x03, sp)
	jrc	00138$
;	driver/app.c: 137: if(!Is_In_Area(baseadd+conbase,data)) continue;
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	push	_app_loop_data_327680_390+0
	pushw	x
	call	_Is_In_Area
	addw	sp, #3
	tnz	a
	jrne	00669$
	jp	00156$
00669$:
00138$:
;	driver/app.c: 142: data=dh_data.W,conbase=23;//当前需要判断的数据，当前条件在规则中的偏移
	ld	a, _dh_data+2
	ld	_app_loop_data_327680_390+0, a
	mov	_app_loop_conbase_327680_390+0, #0x17
;	driver/app.c: 143: if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
	ldw	x, _app_loop_baseadd_262144_389+0
	addw	x, #0x0017
	incw	x
	incw	x
	exgw	x, y
	clrw	x
	pushw	y
	pushw	x
	call	_eeprom_read
	addw	sp, #4
	tnz	a
	jreq	00143$
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	clrw	y
	pushw	x
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	ld	(0x06, sp), a
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	incw	x
	clrw	y
	pushw	x
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	cp	a, (0x06, sp)
	jrc	00143$
;	driver/app.c: 150: if(!Is_In_Area(baseadd+conbase,data)) continue;
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	push	_app_loop_data_327680_390+0
	pushw	x
	call	_Is_In_Area
	addw	sp, #3
	tnz	a
	jrne	00672$
	jp	00156$
00672$:
00143$:
;	driver/app.c: 155: data=dh_data.W1,conbase=26;//当前需要判断的数据，当前条件在规则中的偏移
	ld	a, _dh_data+3
	ld	_app_loop_data_327680_390+0, a
	mov	_app_loop_conbase_327680_390+0, #0x1a
;	driver/app.c: 156: if(eeprom_read(baseadd+conbase+2) && eeprom_read(baseadd+conbase)<=eeprom_read(baseadd+conbase+1))           //当前规则已启用
	ldw	x, _app_loop_baseadd_262144_389+0
	addw	x, #0x001a
	incw	x
	incw	x
	exgw	x, y
	clrw	x
	pushw	y
	pushw	x
	call	_eeprom_read
	addw	sp, #4
	tnz	a
	jreq	00148$
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	clrw	y
	pushw	x
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	ld	(0x05, sp), a
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	incw	x
	clrw	y
	pushw	x
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	cp	a, (0x05, sp)
	jrc	00148$
;	driver/app.c: 163: if(!Is_In_Area(baseadd+conbase,data)) continue;
	clrw	x
	ld	a, _app_loop_conbase_327680_390+0
	ld	xl, a
	addw	x, _app_loop_baseadd_262144_389+0
	push	_app_loop_data_327680_390+0
	pushw	x
	call	_Is_In_Area
	addw	sp, #3
	tnz	a
	jreq	00156$
00148$:
;	driver/app.c: 169: if(eeprom_read(baseadd+30)) beep_flag|=0x01;
	ldw	x, _app_loop_baseadd_262144_389+0
	addw	x, #0x001e
	clrw	y
	pushw	x
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	tnz	a
	jreq	00151$
	ld	a, _app_loop_beep_flag_131072_387+0
	or	a, #0x01
	ld	_app_loop_beep_flag_131072_387+0, a
00151$:
;	driver/app.c: 170: if(eeprom_read(baseadd+31)) relay_flag|=0x01;
	ldw	x, _app_loop_baseadd_262144_389+0
	addw	x, #0x001f
	ldw	(0x0b, sp), x
	ldw	y, x
	ldw	(0x09, sp), y
	clr	(0x08, sp)
	clr	(0x07, sp)
	ldw	x, (0x09, sp)
	pushw	x
	ldw	x, (0x09, sp)
	pushw	x
	call	_eeprom_read
	addw	sp, #4
	ld	(0x0f, sp), a
	jreq	00156$
	ld	a, _app_loop_relay_flag_131072_387+0
	or	a, #0x01
	ld	_app_loop_relay_flag_131072_387+0, a
00156$:
;	driver/app.c: 39: for(i=0;i<16;i++)//共16条规则
	inc	_app_loop_i_131072_387+0
	ld	a, _app_loop_i_131072_387+0
	cp	a, #0x10
	jrnc	00678$
	jp	00240$
00678$:
;	driver/app.c: 175: if(beep_flag) beep_on(); else beep_off();
	tnz	_app_loop_beep_flag_131072_387+0
	jreq	00159$
	call	_beep_on
	jra	00160$
00159$:
	call	_beep_off
00160$:
;	driver/app.c: 176: if(relay_flag) relay_on(); else relay_off();
	tnz	_app_loop_relay_flag_131072_387+0
	jreq	00162$
	call	_relay_on
	jra	00165$
00162$:
	call	_relay_off
00165$:
;	driver/app.c: 180: if(keycount[0]||keycount[1]||keycount[2]||keycount[3]||keycount[4]) //按键处理
	ld	a, _keycount
	ldw	x, #_keycount+1
	ldw	(0x0d, sp), x
	ldw	x, #_keycount+2
	ldw	(0x12, sp), x
	ldw	x, #_keycount+3
	ldw	(0x10, sp), x
	ldw	x, #_keycount+4
	ldw	(0x2d, sp), x
	tnz	a
	jrne	00212$
	ldw	x, (0x0d, sp)
	ld	a, (x)
	jrne	00212$
	ldw	x, (0x12, sp)
	ld	a, (x)
	jrne	00212$
	ldw	x, (0x10, sp)
	ld	a, (x)
	jrne	00212$
	ldw	x, (0x2d, sp)
	ld	a, (x)
	jrne	00685$
	jp	00213$
00685$:
00212$:
;	driver/app.c: 182: OLED_Clear();
	call	_OLED_Clear
;	driver/app.c: 183: if(keycount[0])//浇水按键
	ld	a, _keycount
	jreq	00167$
;	driver/app.c: 186: is_rule_on=eeprom_read(4);//保存规则运行信息
	push	#0x04
	clrw	x
	pushw	x
	push	#0x00
	call	_eeprom_read
	addw	sp, #4
	ld	_app_loop_is_rule_on_196608_411+0, a
;	driver/app.c: 187: relay_read()?(eeprom_write(4,is_rule_on),relay_off()):(eeprom_write(4,0),relay_on());
	call	_relay_read
	tnz	a
	jreq	00257$
	push	_app_loop_is_rule_on_196608_411+0
	push	#0x04
	clrw	x
	pushw	x
	push	#0x00
	call	_eeprom_write
	addw	sp, #5
	call	_relay_off
	jra	00258$
00257$:
	push	#0x00
	push	#0x04
	clrw	x
	pushw	x
	push	#0x00
	call	_eeprom_write
	addw	sp, #5
	call	_relay_on
00258$:
;	driver/app.c: 188: keycount[0]=0;
	mov	_keycount+0, #0x00
00167$:
;	driver/app.c: 191: if(keycount[1]) //上一级菜单
	ldw	x, (0x0d, sp)
	ld	a, (x)
	jreq	00174$
;	driver/app.c: 193: if(status==0) eeprom_read(4)?eeprom_write(4,0):eeprom_write(4,1);//控制规则总开关
	ldw	x, _app_loop_status_65536_386+0
	jrne	00169$
	push	#0x04
	clrw	x
	pushw	x
	push	#0x00
	call	_eeprom_read
	addw	sp, #4
	tnz	a
	jreq	00259$
	push	#0x00
	push	#0x04
	clrw	x
	pushw	x
	push	#0x00
	call	_eeprom_write
	addw	sp, #5
	jra	00169$
00259$:
	push	#0x01
	push	#0x04
	clrw	x
	pushw	x
	push	#0x00
	call	_eeprom_write
	addw	sp, #5
00169$:
;	driver/app.c: 194: if(status&0xff) {status=status&0xff00;eeprom_write(3,0);}
	tnz	_app_loop_status_65536_386+1
	jreq	00171$
	clr	a
	ld	xl, a
	ld	a, _app_loop_status_65536_386+0
	ld	xh, a
	ldw	_app_loop_status_65536_386+0, x
	push	#0x00
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	_eeprom_write
	addw	sp, #5
	jra	00172$
00171$:
;	driver/app.c: 195: else {status=0;eeprom_write(2,0);}
	clrw	x
	ldw	_app_loop_status_65536_386+0, x
	push	#0x00
	push	#0x02
	clrw	x
	pushw	x
	push	#0x00
	call	_eeprom_write
	addw	sp, #5
00172$:
;	driver/app.c: 196: keycount[1]=0;
	ldw	x, (0x0d, sp)
	clr	(x)
00174$:
;	driver/app.c: 198: if(keycount[2])//下一级菜单,第三级界面地址加
	ldw	x, (0x12, sp)
	ld	a, (x)
	jreq	00183$
;	driver/app.c: 200: if(status&0xff00) {
	clr	(0x2c, sp)
	ld	a, _app_loop_status_65536_386+0
	ld	(0x2b, sp), a
	ldw	x, (0x2b, sp)
	jreq	00180$
;	driver/app.c: 201: if((status&0xff)==0||(status&0xff)==32)//第三级界面地址在1～32之间
	ld	a, _app_loop_status_65536_386+1
	ld	xl, a
	clr	a
	ld	xh, a
	tnzw	x
	jreq	00175$
	cpw	x, #0x0020
	jrne	00176$
00175$:
;	driver/app.c: 203: status=(status&0xff00)|0x01;
	ldw	x, (0x2b, sp)
	srlw	x
	scf
	rlcw	x
	ldw	_app_loop_status_65536_386+0, x
;	driver/app.c: 204: eeprom_write(3,1);
	push	#0x01
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	_eeprom_write
	addw	sp, #5
	jra	00181$
00176$:
;	driver/app.c: 207: status=status+1;
	ldw	x, _app_loop_status_65536_386+0
	incw	x
	ldw	_app_loop_status_65536_386+0, x
;	driver/app.c: 208: eeprom_write(3,status&0xff);
	ld	a, _app_loop_status_65536_386+1
	push	a
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	_eeprom_write
	addw	sp, #5
	jra	00181$
00180$:
;	driver/app.c: 211: else {status=status|0x0100;eeprom_write(2,1);}
	ld	a, _app_loop_status_65536_386+1
	ld	xl, a
	ld	a, _app_loop_status_65536_386+0
	or	a, #0x01
	ld	xh, a
	ldw	_app_loop_status_65536_386+0, x
	push	#0x01
	push	#0x02
	clrw	x
	pushw	x
	push	#0x00
	call	_eeprom_write
	addw	sp, #5
00181$:
;	driver/app.c: 212: keycount[2]=0;
	ldw	x, (0x12, sp)
	clr	(x)
00183$:
;	driver/app.c: 214: if(keycount[3]) //数值加
	ldw	x, (0x10, sp)
	ld	a, (x)
	jrne	00698$
	jp	00197$
00698$:
;	driver/app.c: 216: if(status==0) {//修改小时数
	ldw	x, _app_loop_status_65536_386+0
	jrne	00187$
;	driver/app.c: 218: h=ds_time.hour/16*10+ds_time.hour%16;
	ldw	x, #_ds_time+4
	ldw	(0x31, sp), x
	ld	a, (x)
	ld	(0x30, sp), a
	clr	(0x2f, sp)
	push	#0x10
	push	#0x00
	ldw	x, (0x31, sp)
	pushw	x
	call	__divsint
	addw	sp, #4
	ld	a, #0x0a
	mul	x, a
	exg	a, xl
	ld	(0x35, sp), a
	exg	a, xl
	push	#0x10
	push	#0x00
	ldw	x, (0x31, sp)
	pushw	x
	call	__modsint
	addw	sp, #4
	ld	a, xl
	add	a, (0x35, sp)
	ld	_app_loop_h_262144_421+0, a
;	driver/app.c: 219: h++;
	inc	_app_loop_h_262144_421+0
;	driver/app.c: 220: if(h>=24) h=0;
	ld	a, _app_loop_h_262144_421+0
	cp	a, #0x18
	jrc	00185$
	clr	_app_loop_h_262144_421+0
00185$:
;	driver/app.c: 221: ds_time.hour=h/10*16+h%10;
	clrw	x
	ld	a, _app_loop_h_262144_421+0
	ld	xl, a
	pushw	x
	push	#0x0a
	push	#0x00
	pushw	x
	call	__divsint
	addw	sp, #4
	ldw	(0x35, sp), x
	popw	x
	ld	a, (0x34, sp)
	swap	a
	and	a, #0xf0
	ld	(0x37, sp), a
	push	#0x0a
	push	#0x00
	pushw	x
	call	__modsint
	addw	sp, #4
	ld	a, xl
	add	a, (0x37, sp)
	ldw	x, (0x31, sp)
	ld	(x), a
;	driver/app.c: 222: ds1302_write_time(&ds_time);
	push	#<_ds_time
	push	#(_ds_time >> 8)
	call	_ds1302_write_time
	addw	sp, #2
00187$:
;	driver/app.c: 225: if(status&0xff)//加数值
	tnz	_app_loop_status_65536_386+1
	jreq	00194$
;	driver/app.c: 227: eeprom_write((status>>8)*32+status&0xff-1,eeprom_read((status>>8)*32+status&0xff-1)+1);
	clrw	x
	ld	a, _app_loop_status_65536_386+0
	ld	xl, a
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	addw	x, _app_loop_status_65536_386+0
	srlw	x
	sllw	x
	clr	a
	ld	xh, a
	clrw	y
	pushw	x
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	inc	a
	ld	(0x36, sp), a
	clrw	x
	ld	a, _app_loop_status_65536_386+0
	ld	xl, a
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	addw	x, _app_loop_status_65536_386+0
	srlw	x
	sllw	x
	clr	a
	ld	xh, a
	clrw	y
	ld	a, (0x36, sp)
	push	a
	pushw	x
	pushw	y
	call	_eeprom_write
	addw	sp, #5
	jra	00195$
00194$:
;	driver/app.c: 229: else if(status&0xff00) //加规则引索
	clr	a
	ld	xl, a
	ld	a, _app_loop_status_65536_386+0
	ld	xh, a
	tnzw	x
	jreq	00195$
;	driver/app.c: 231: if((status&0xff00)==0x1000)//共16条规则
	cpw	x, #0x1000
	jrne	00189$
;	driver/app.c: 233: status=0x0100;
	ldw	x, #0x0100
	ldw	_app_loop_status_65536_386+0, x
;	driver/app.c: 234: eeprom_write(2,1);
	push	#0x01
	push	#0x02
	clrw	x
	pushw	x
	push	#0x00
	call	_eeprom_write
	addw	sp, #5
	jra	00195$
00189$:
;	driver/app.c: 238: status+=0x0100;
	ldw	x, _app_loop_status_65536_386+0
	addw	x, #0x0100
	ldw	_app_loop_status_65536_386+0, x
;	driver/app.c: 239: eeprom_write(2,status>>8);
	ld	a, _app_loop_status_65536_386+0
	clr	(0x3a, sp)
	push	a
	push	#0x02
	clrw	x
	pushw	x
	push	#0x00
	call	_eeprom_write
	addw	sp, #5
00195$:
;	driver/app.c: 242: keycount[3]=0;
	ldw	x, (0x10, sp)
	clr	(x)
00197$:
;	driver/app.c: 244: if(keycount[4]) //数值减
	ldw	x, (0x2d, sp)
	ld	a, (x)
	jrne	00706$
	jp	00213$
00706$:
;	driver/app.c: 246: if(status==0) {//修改分钟数
	ldw	x, _app_loop_status_65536_386+0
	jrne	00201$
;	driver/app.c: 248: m=ds_time.minute/16*10+ds_time.minute%16;
	ldw	x, #_ds_time+5
	ldw	(0x38, sp), x
	ld	a, (x)
	ld	(0x3e, sp), a
	clr	(0x3d, sp)
	push	#0x10
	push	#0x00
	ldw	x, (0x3f, sp)
	pushw	x
	call	__divsint
	addw	sp, #4
	ld	a, #0x0a
	mul	x, a
	exg	a, xl
	ld	(0x3c, sp), a
	exg	a, xl
	push	#0x10
	push	#0x00
	ldw	x, (0x3f, sp)
	pushw	x
	call	__modsint
	addw	sp, #4
	ld	a, xl
	add	a, (0x3c, sp)
	ld	_app_loop_m_262144_427+0, a
;	driver/app.c: 249: m++;
	inc	_app_loop_m_262144_427+0
;	driver/app.c: 250: if(m>=60) m=0;
	ld	a, _app_loop_m_262144_427+0
	cp	a, #0x3c
	jrc	00199$
	clr	_app_loop_m_262144_427+0
00199$:
;	driver/app.c: 251: ds_time.minute=m/10*16+m%10;
	clrw	x
	ld	a, _app_loop_m_262144_427+0
	ld	xl, a
	pushw	x
	push	#0x0a
	push	#0x00
	pushw	x
	call	__divsint
	addw	sp, #4
	ldw	(0x42, sp), x
	popw	x
	ld	a, (0x41, sp)
	swap	a
	and	a, #0xf0
	ld	(0x3f, sp), a
	push	#0x0a
	push	#0x00
	pushw	x
	call	__modsint
	addw	sp, #4
	ld	a, xl
	add	a, (0x3f, sp)
	ldw	x, (0x38, sp)
	ld	(x), a
;	driver/app.c: 252: ds1302_write_time(&ds_time);
	push	#<_ds_time
	push	#(_ds_time >> 8)
	call	_ds1302_write_time
	addw	sp, #2
00201$:
;	driver/app.c: 254: if(status&0xff)//减数值
	ldw	y, _app_loop_status_65536_386+0
	ldw	(0x43, sp), y
	clr	(0x43, sp)
	ldw	x, (0x43, sp)
	jreq	00208$
;	driver/app.c: 256: eeprom_write((status>>8)*32+(status&0xff)-1,eeprom_read((status>>8)*32+(status&0xff)-1)-1);
	clrw	x
	ld	a, _app_loop_status_65536_386+0
	ld	xl, a
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	addw	x, (0x43, sp)
	decw	x
	clrw	y
	pushw	x
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	dec	a
	ld	(0x42, sp), a
	clrw	x
	ld	a, _app_loop_status_65536_386+0
	ld	xl, a
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	ldw	y, _app_loop_status_65536_386+0
	ldw	(0x47, sp), y
	clr	(0x47, sp)
	addw	x, (0x47, sp)
	decw	x
	clrw	y
	ld	a, (0x42, sp)
	push	a
	pushw	x
	pushw	y
	call	_eeprom_write
	addw	sp, #5
	jra	00209$
00208$:
;	driver/app.c: 258: else if(status&0xff00) //减规则引索
	clr	a
	ld	xl, a
	ld	a, _app_loop_status_65536_386+0
	ld	xh, a
	tnzw	x
	jreq	00209$
;	driver/app.c: 260: if((status&0xff00)==0x0100)//共16条规则
	cpw	x, #0x0100
	jrne	00203$
;	driver/app.c: 262: status=0x1000;
	ldw	x, #0x1000
	ldw	_app_loop_status_65536_386+0, x
;	driver/app.c: 263: eeprom_write(2,0x10);
	push	#0x10
	push	#0x02
	clrw	x
	pushw	x
	push	#0x00
	call	_eeprom_write
	addw	sp, #5
	jra	00209$
00203$:
;	driver/app.c: 267: status-=0x0100;
	ldw	x, _app_loop_status_65536_386+0
	subw	x, #0x0100
	ldw	_app_loop_status_65536_386+0, x
;	driver/app.c: 268: eeprom_write(2,status>>8);
	ld	a, _app_loop_status_65536_386+0
	clr	(0x45, sp)
	push	a
	push	#0x02
	clrw	x
	pushw	x
	push	#0x00
	call	_eeprom_write
	addw	sp, #5
00209$:
;	driver/app.c: 271: keycount[4]=0;
	ldw	x, (0x2d, sp)
	clr	(x)
00213$:
;	driver/app.c: 276: if(!eeprom_read(1))//界面显示
	push	#0x01
	clrw	x
	pushw	x
	push	#0x00
	call	_eeprom_read
	addw	sp, #4
	tnz	a
	jreq	00714$
	jp	00238$
00714$:
;	driver/app.c: 279: for(i=0;i<4;i++)//初始化temp
	clr	_app_loop_i_131072_432+0
00241$:
;	driver/app.c: 281: sprintf(temp[i],"                ");
	ldw	y, #___str_0
	ld	a, _app_loop_i_131072_432+0
	ld	xl, a
	ld	a, #0x19
	mul	x, a
	addw	x, #_app_loop_temp_131072_432
	pushw	y
	pushw	x
	call	_sprintf
	addw	sp, #4
;	driver/app.c: 279: for(i=0;i<4;i++)//初始化temp
	inc	_app_loop_i_131072_432+0
	ld	a, _app_loop_i_131072_432+0
	cp	a, #0x04
	jrc	00241$
;	driver/app.c: 283: sprintf(temp[0],"%2d:%2d:%2d Add:%3d",ds_time.hour/16*10+ds_time.hour%16,ds_time.minute/16*10+ds_time.minute%16,ds_time.second/16*10+ds_time.second%16,eeprom_read(0));
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	call	_eeprom_read
	addw	sp, #4
	ld	(0x4c, sp), a
	clr	(0x4b, sp)
	ld	a, _ds_time+6
	clrw	x
	ld	xl, a
	pushw	x
	push	#0x10
	push	#0x00
	pushw	x
	call	__divsint
	addw	sp, #4
	ldw	(0x4b, sp), x
	sllw	x
	sllw	x
	addw	x, (0x4b, sp)
	sllw	x
	ldw	(0x51, sp), x
	popw	x
	push	#0x10
	push	#0x00
	pushw	x
	call	__modsint
	addw	sp, #4
	addw	x, (0x4f, sp)
	ldw	(0x4d, sp), x
	ld	a, _ds_time+5
	clrw	x
	ld	xl, a
	pushw	x
	push	#0x10
	push	#0x00
	pushw	x
	call	__divsint
	addw	sp, #4
	ldw	(0x21, sp), x
	sllw	x
	sllw	x
	addw	x, (0x21, sp)
	sllw	x
	ldw	(0x1f, sp), x
	popw	x
	push	#0x10
	push	#0x00
	pushw	x
	call	__modsint
	addw	sp, #4
	addw	x, (0x1d, sp)
	ldw	(0x23, sp), x
	ld	a, _ds_time+4
	clrw	x
	ld	xl, a
	pushw	x
	push	#0x10
	push	#0x00
	pushw	x
	call	__divsint
	addw	sp, #4
	ldw	(0x23, sp), x
	sllw	x
	sllw	x
	addw	x, (0x23, sp)
	sllw	x
	ldw	(0x29, sp), x
	popw	x
	push	#0x10
	push	#0x00
	pushw	x
	call	__modsint
	addw	sp, #4
	addw	x, (0x27, sp)
	exgw	x, y
	ldw	x, (0x4b, sp)
	pushw	x
	ldw	x, (0x4f, sp)
	pushw	x
	ldw	x, (0x27, sp)
	pushw	x
	pushw	y
	push	#<___str_1
	push	#(___str_1 >> 8)
	push	#<_app_loop_temp_131072_432
	push	#(_app_loop_temp_131072_432 >> 8)
	call	_sprintf
	addw	sp, #12
;	driver/app.c: 284: sprintf(temp[1],"%2d.%1dC/%2d.%1d%%/%4d",dh_data.T,dh_data.T1&0x0f,dh_data.W,dh_data.W1&0x0f,adc_data.Ain);
	ldw	x, #_adc_data
	ldw	x, (x)
	ldw	(0x25, sp), x
	ldw	y, #_dh_data+0
	ldw	x, y
	ld	a, (0x3, x)
	clr	(0x68, sp)
	and	a, #0x0f
	ld	(0x67, sp), a
	clr	(0x66, sp)
	ldw	x, y
	ld	a, (0x2, x)
	ld	(0x6d, sp), a
	clr	(0x6c, sp)
	ldw	x, y
	ld	a, (0x1, x)
	clr	(0x6a, sp)
	and	a, #0x0f
	ld	(0x71, sp), a
	clr	(0x70, sp)
	ld	a, (y)
	clr	(0x6e, sp)
	ldw	y, #_app_loop_temp_131072_432+25
	ldw	x, (0x25, sp)
	pushw	x
	ldw	x, (0x68, sp)
	pushw	x
	ldw	x, (0x70, sp)
	pushw	x
	ldw	x, (0x76, sp)
	pushw	x
	push	a
	ld	a, (0x77, sp)
	push	a
	push	#<___str_2
	push	#(___str_2 >> 8)
	pushw	y
	call	_sprintf
	addw	sp, #14
;	driver/app.c: 285: sprintf(temp[2],"B:%s,R:%s",beep_read()?"on":"off",relay_read()?"on":"off");
	call	_relay_read
	tnz	a
	jreq	00261$
	ldw	x, #___str_4
	jra	00262$
00261$:
	ldw	x, #___str_5
00262$:
	ldw	(0x5e, sp), x
	call	_beep_read
	tnz	a
	jreq	00263$
	ldw	x, #___str_4
	ldw	(0x5c, sp), x
	jra	00264$
00263$:
	ldw	x, #___str_5
	ldw	(0x5c, sp), x
00264$:
	ldw	x, (0x5c, sp)
	ldw	y, #_app_loop_temp_131072_432+50
	ld	a, (0x5f, sp)
	push	a
	ld	a, (0x5f, sp)
	push	a
	pushw	x
	push	#<___str_3
	push	#(___str_3 >> 8)
	pushw	y
	call	_sprintf
	addw	sp, #8
;	driver/app.c: 296: sprintf(temp[3],"%s",eeprom_read(4)?"running":"stopped");
	ldw	x, #_app_loop_temp_131072_432+75
	ldw	(0x62, sp), x
;	driver/app.c: 286: if(status==0)//主菜单
	ldw	x, _app_loop_status_65536_386+0
	jreq	00718$
	jp	00235$
00718$:
;	driver/app.c: 296: sprintf(temp[3],"%s",eeprom_read(4)?"running":"stopped");
	push	#0x04
	clrw	x
	pushw	x
	push	#0x00
	call	_eeprom_read
	addw	sp, #4
	tnz	a
	jreq	00265$
	ldw	x, #___str_7
	ldw	(0x60, sp), x
	jra	00266$
00265$:
	ldw	x, #___str_8
	ldw	(0x60, sp), x
00266$:
	ldw	x, (0x60, sp)
	pushw	x
	push	#<___str_6
	push	#(___str_6 >> 8)
	ldw	x, (0x66, sp)
	pushw	x
	call	_sprintf
	addw	sp, #6
;	driver/app.c: 297: for(i=0;i<4;i++)//输出显示
	clr	_app_loop_i_131072_432+0
;	driver/app.c: 300: for(j=0;j<16;j++)
00327$:
	clr	(0x7a, sp)
00243$:
;	driver/app.c: 302: if(temp[i][j]=='\0') temp[i][j]=' ';
	ld	a, _app_loop_i_131072_432+0
	ld	xl, a
	ld	a, #0x19
	mul	x, a
	addw	x, #_app_loop_temp_131072_432
	ld	a, xl
	add	a, (0x7a, sp)
	ld	(0x57, sp), a
	ld	a, xh
	adc	a, #0x00
	ld	(0x56, sp), a
	ldw	x, (0x56, sp)
	ld	a, (x)
	jrne	00244$
	ldw	x, (0x56, sp)
	ld	a, #0x20
	ld	(x), a
00244$:
;	driver/app.c: 300: for(j=0;j<16;j++)
	inc	(0x7a, sp)
	ld	a, (0x7a, sp)
	cp	a, #0x10
	jrc	00243$
;	driver/app.c: 304: OLED_ShowString(0,i*2,temp[i]);
	ld	a, _app_loop_i_131072_432+0
	ld	xl, a
	ld	a, #0x19
	mul	x, a
	addw	x, #_app_loop_temp_131072_432
	ld	a, _app_loop_i_131072_432+0
	sll	a
	pushw	x
	push	a
	push	#0x00
	call	_OLED_ShowString
	addw	sp, #4
;	driver/app.c: 297: for(i=0;i<4;i++)//输出显示
	inc	_app_loop_i_131072_432+0
	ld	a, _app_loop_i_131072_432+0
	cp	a, #0x04
	jrc	00327$
	jp	00255$
00235$:
;	driver/app.c: 307: else if((status&0xff)==0)//规则选择菜单
	ldw	y, _app_loop_status_65536_386+0
	ldw	(0x54, sp), y
	clr	(0x54, sp)
;	driver/app.c: 227: eeprom_write((status>>8)*32+status&0xff-1,eeprom_read((status>>8)*32+status&0xff-1)+1);
	clrw	x
	ld	a, _app_loop_status_65536_386+0
	ld	xl, a
;	driver/app.c: 307: else if((status&0xff)==0)//规则选择菜单
	ldw	y, (0x54, sp)
	jrne	00232$
;	driver/app.c: 317: sprintf(temp[3],"rule:%2d",status>>8);
	pushw	x
	push	#<___str_9
	push	#(___str_9 >> 8)
	ldw	x, (0x66, sp)
	pushw	x
	call	_sprintf
	addw	sp, #6
;	driver/app.c: 318: for(i=0;i<4;i++)//输出显示
	clr	_app_loop_i_131072_432+0
;	driver/app.c: 321: for(j=0;j<16;j++)
00333$:
	clr	(0x79, sp)
00247$:
;	driver/app.c: 323: if(temp[i][j]=='\0') temp[i][j]=' ';
	ld	a, _app_loop_i_131072_432+0
	ld	xl, a
	ld	a, #0x19
	mul	x, a
	addw	x, #_app_loop_temp_131072_432
	ld	a, xl
	add	a, (0x79, sp)
	ld	(0x5b, sp), a
	ld	a, xh
	adc	a, #0x00
	ld	(0x5a, sp), a
	ldw	x, (0x5a, sp)
	ld	a, (x)
	jrne	00248$
	ldw	x, (0x5a, sp)
	ld	a, #0x20
	ld	(x), a
00248$:
;	driver/app.c: 321: for(j=0;j<16;j++)
	inc	(0x79, sp)
	ld	a, (0x79, sp)
	cp	a, #0x10
	jrc	00247$
;	driver/app.c: 325: OLED_ShowString(0,i*2,temp[i]);
	ld	a, _app_loop_i_131072_432+0
	ld	xl, a
	ld	a, #0x19
	mul	x, a
	addw	x, #_app_loop_temp_131072_432
	ld	a, _app_loop_i_131072_432+0
	sll	a
	pushw	x
	push	a
	push	#0x00
	call	_OLED_ShowString
	addw	sp, #4
;	driver/app.c: 318: for(i=0;i<4;i++)//输出显示
	inc	_app_loop_i_131072_432+0
	ld	a, _app_loop_i_131072_432+0
	cp	a, #0x04
	jrc	00333$
	jp	00255$
00232$:
;	driver/app.c: 339: sprintf(temp[3],"Addr:%2d,Val:%d",(status&0xff)-1,eeprom_read((status>>8)*32+(status&0xff)-1));
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	addw	x, (0x54, sp)
	decw	x
	clrw	y
	pushw	x
	pushw	y
	call	_eeprom_read
	addw	sp, #4
	clrw	y
	ld	yl, a
	ld	a, _app_loop_status_65536_386+1
	ld	xl, a
	clr	a
	ld	xh, a
	decw	x
	pushw	y
	pushw	x
	push	#<___str_10
	push	#(___str_10 >> 8)
	ldw	x, (0x68, sp)
	pushw	x
	call	_sprintf
	addw	sp, #8
;	driver/app.c: 340: for(i=0;i<4;i++)//输出显示
	clr	_app_loop_i_131072_432+0
;	driver/app.c: 343: for(j=0;j<16;j++)
00338$:
	clr	(0x78, sp)
00251$:
;	driver/app.c: 345: if(temp[i][j]=='\0') temp[i][j]=' ';
	ld	a, _app_loop_i_131072_432+0
	ld	xl, a
	ld	a, #0x19
	mul	x, a
	addw	x, #_app_loop_temp_131072_432
	ld	a, xl
	add	a, (0x78, sp)
	ld	(0x59, sp), a
	ld	a, xh
	adc	a, #0x00
	ld	(0x58, sp), a
	ldw	x, (0x58, sp)
	ld	a, (x)
	jrne	00252$
	ldw	x, (0x58, sp)
	ld	a, #0x20
	ld	(x), a
00252$:
;	driver/app.c: 343: for(j=0;j<16;j++)
	inc	(0x78, sp)
	ld	a, (0x78, sp)
	cp	a, #0x10
	jrc	00251$
;	driver/app.c: 347: OLED_ShowString(0,i*2,temp[i]);
	ld	a, _app_loop_i_131072_432+0
	ld	xl, a
	ld	a, #0x19
	mul	x, a
	addw	x, #_app_loop_temp_131072_432
	ld	a, _app_loop_i_131072_432+0
	sll	a
	pushw	x
	push	a
	push	#0x00
	call	_OLED_ShowString
	addw	sp, #4
;	driver/app.c: 340: for(i=0;i<4;i++)//输出显示
	inc	_app_loop_i_131072_432+0
	ld	a, _app_loop_i_131072_432+0
	cp	a, #0x04
	jrc	00338$
	jra	00255$
00238$:
;	driver/app.c: 352: OLED_Clear();
	call	_OLED_Clear
00255$:
;	driver/app.c: 355: }
	addw	sp, #122
	ret
	.area CODE
	.area CONST
___str_0:
	.ascii "                "
	.db 0x00
___str_1:
	.ascii "%2d:%2d:%2d Add:%3d"
	.db 0x00
___str_2:
	.ascii "%2d.%1dC/%2d.%1d%%/%4d"
	.db 0x00
___str_3:
	.ascii "B:%s,R:%s"
	.db 0x00
___str_4:
	.ascii "on"
	.db 0x00
___str_5:
	.ascii "off"
	.db 0x00
___str_6:
	.ascii "%s"
	.db 0x00
___str_7:
	.ascii "running"
	.db 0x00
___str_8:
	.ascii "stopped"
	.db 0x00
___str_9:
	.ascii "rule:%2d"
	.db 0x00
___str_10:
	.ascii "Addr:%2d,Val:%d"
	.db 0x00
	.area INITIALIZER
	.area CABS (ABS)
