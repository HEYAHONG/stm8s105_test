;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module stm8s_itc
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ITC_GetCPUCC
	.globl _ITC_DeInit
	.globl _ITC_GetSoftIntStatus
	.globl _ITC_GetSoftwarePriority
	.globl _ITC_SetSoftwarePriority
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
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
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 50: uint8_t ITC_GetCPUCC(void)
;	-----------------------------------------
;	 function ITC_GetCPUCC
;	-----------------------------------------
_ITC_GetCPUCC:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 62: __asm__("push cc");
	push	cc
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 63: __asm__("pop a"); /* Ignore compiler warning, the returned value is in A register */
	pop	a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 65: }
	ret
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 83: void ITC_DeInit(void)
;	-----------------------------------------
;	 function ITC_DeInit
;	-----------------------------------------
_ITC_DeInit:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 85: ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
	mov	0x7f70+0, #0xff
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 86: ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
	mov	0x7f71+0, #0xff
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 87: ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
	mov	0x7f72+0, #0xff
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 88: ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
	mov	0x7f73+0, #0xff
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 89: ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
	mov	0x7f74+0, #0xff
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 90: ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
	mov	0x7f75+0, #0xff
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 91: ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
	mov	0x7f76+0, #0xff
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 92: ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
	mov	0x7f77+0, #0xff
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 93: }
	ret
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 100: uint8_t ITC_GetSoftIntStatus(void)
;	-----------------------------------------
;	 function ITC_GetSoftIntStatus
;	-----------------------------------------
_ITC_GetSoftIntStatus:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 102: return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
	call	_ITC_GetCPUCC
	and	a, #0x28
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 103: }
	ret
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 110: ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
;	-----------------------------------------
;	 function ITC_GetSoftwarePriority
;	-----------------------------------------
_ITC_GetSoftwarePriority:
	sub	sp, #3
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 112: uint8_t Value = 0;
	clr	(0x01, sp)
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 119: Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
	ld	a, (0x06, sp)
	clrw	y
	and	a, #0x03
	sll	a
	ld	(0x02, sp), a
	ld	a, #0x03
	ld	(0x03, sp), a
	ld	a, (0x02, sp)
	jreq	00132$
00131$:
	sll	(0x03, sp)
	dec	a
	jrne	00131$
00132$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 121: switch (IrqNum)
	ld	a, (0x06, sp)
	cp	a, #0x18
	jrule	00133$
	jp	00123$
00133$:
	clrw	x
	ld	a, (0x06, sp)
	ld	xl, a
	sllw	x
	ldw	x, (#00134$, x)
	jp	(x)
00134$:
	.dw	#00104$
	.dw	#00104$
	.dw	#00104$
	.dw	#00104$
	.dw	#00108$
	.dw	#00108$
	.dw	#00108$
	.dw	#00108$
	.dw	#00123$
	.dw	#00123$
	.dw	#00110$
	.dw	#00110$
	.dw	#00114$
	.dw	#00114$
	.dw	#00114$
	.dw	#00114$
	.dw	#00116$
	.dw	#00123$
	.dw	#00123$
	.dw	#00116$
	.dw	#00120$
	.dw	#00120$
	.dw	#00120$
	.dw	#00120$
	.dw	#00121$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 126: case ITC_IRQ_PORTA:
00104$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 127: Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
	ld	a, 0x7f70
	and	a, (0x03, sp)
	ld	(0x01, sp), a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 128: break;
	jra	00123$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 133: case ITC_IRQ_PORTE:
00108$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 134: Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
	ld	a, 0x7f71
	and	a, (0x03, sp)
	ld	(0x01, sp), a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 135: break;
	jra	00123$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 145: case ITC_IRQ_TIM1_OVF:
00110$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 146: Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
	ld	a, 0x7f72
	and	a, (0x03, sp)
	ld	(0x01, sp), a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 147: break;
	jra	00123$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 157: case ITC_IRQ_TIM3_OVF:
00114$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 158: Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
	ld	a, 0x7f73
	and	a, (0x03, sp)
	ld	(0x01, sp), a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 159: break;
	jra	00123$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 171: case ITC_IRQ_I2C:
00116$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 172: Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
	ld	a, 0x7f74
	and	a, (0x03, sp)
	ld	(0x01, sp), a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 173: break;
	jra	00123$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 192: case ITC_IRQ_TIM4_OVF:
00120$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 194: Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
	ld	a, 0x7f75
	and	a, (0x03, sp)
	ld	(0x01, sp), a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 195: break;
	jra	00123$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 197: case ITC_IRQ_EEPROM_EEC:
00121$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 198: Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
	ld	a, 0x7f76
	and	a, (0x03, sp)
	ld	(0x01, sp), a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 203: }
00123$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 205: Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
	ld	a, (0x01, sp)
	push	a
	ld	a, (0x03, sp)
	jreq	00136$
00135$:
	srl	(1, sp)
	dec	a
	jrne	00135$
00136$:
	pop	a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 207: return((ITC_PriorityLevel_TypeDef)Value);
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 208: }
	addw	sp, #3
	ret
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 223: void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
;	-----------------------------------------
;	 function ITC_SetSoftwarePriority
;	-----------------------------------------
_ITC_SetSoftwarePriority:
	sub	sp, #2
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 237: Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
	ld	a, (0x05, sp)
	clrw	y
	and	a, #0x03
	ld	xl, a
	sllw	x
	ld	a, #0x03
	push	a
	ld	a, xl
	tnz	a
	jreq	00132$
00131$:
	sll	(1, sp)
	dec	a
	jrne	00131$
00132$:
	pop	a
	cpl	a
	ld	(0x02, sp), a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 240: NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
	ld	a, (0x06, sp)
	push	a
	ld	a, xl
	tnz	a
	jreq	00134$
00133$:
	sll	(1, sp)
	dec	a
	jrne	00133$
00134$:
	pop	a
	ld	(0x01, sp), a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 242: switch (IrqNum)
	ld	a, (0x05, sp)
	cp	a, #0x18
	jrule	00135$
	jp	00124$
00135$:
	clrw	x
	ld	a, (0x05, sp)
	ld	xl, a
	sllw	x
	ldw	x, (#00136$, x)
	jp	(x)
00136$:
	.dw	#00104$
	.dw	#00104$
	.dw	#00104$
	.dw	#00104$
	.dw	#00108$
	.dw	#00108$
	.dw	#00108$
	.dw	#00108$
	.dw	#00124$
	.dw	#00124$
	.dw	#00110$
	.dw	#00110$
	.dw	#00114$
	.dw	#00114$
	.dw	#00114$
	.dw	#00114$
	.dw	#00116$
	.dw	#00124$
	.dw	#00124$
	.dw	#00116$
	.dw	#00120$
	.dw	#00120$
	.dw	#00120$
	.dw	#00120$
	.dw	#00121$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 247: case ITC_IRQ_PORTA:
00104$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 248: ITC->ISPR1 &= Mask;
	ld	a, 0x7f70
	and	a, (0x02, sp)
	ld	0x7f70, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 249: ITC->ISPR1 |= NewPriority;
	ld	a, 0x7f70
	or	a, (0x01, sp)
	ld	0x7f70, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 250: break;
	jra	00124$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 255: case ITC_IRQ_PORTE:
00108$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 256: ITC->ISPR2 &= Mask;
	ld	a, 0x7f71
	and	a, (0x02, sp)
	ld	0x7f71, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 257: ITC->ISPR2 |= NewPriority;
	ld	a, 0x7f71
	or	a, (0x01, sp)
	ld	0x7f71, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 258: break;
	jra	00124$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 268: case ITC_IRQ_TIM1_OVF:
00110$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 269: ITC->ISPR3 &= Mask;
	ld	a, 0x7f72
	and	a, (0x02, sp)
	ld	0x7f72, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 270: ITC->ISPR3 |= NewPriority;
	ld	a, 0x7f72
	or	a, (0x01, sp)
	ld	0x7f72, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 271: break;
	jra	00124$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 281: case ITC_IRQ_TIM3_OVF:
00114$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 282: ITC->ISPR4 &= Mask;
	ld	a, 0x7f73
	and	a, (0x02, sp)
	ld	0x7f73, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 283: ITC->ISPR4 |= NewPriority;
	ld	a, 0x7f73
	or	a, (0x01, sp)
	ld	0x7f73, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 284: break;
	jra	00124$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 296: case ITC_IRQ_I2C:
00116$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 297: ITC->ISPR5 &= Mask;
	ld	a, 0x7f74
	and	a, (0x02, sp)
	ld	0x7f74, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 298: ITC->ISPR5 |= NewPriority;
	ld	a, 0x7f74
	or	a, (0x01, sp)
	ld	0x7f74, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 299: break;
	jra	00124$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 321: case ITC_IRQ_TIM4_OVF:
00120$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 323: ITC->ISPR6 &= Mask;
	ld	a, 0x7f75
	and	a, (0x02, sp)
	ld	0x7f75, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 324: ITC->ISPR6 |= NewPriority;
	ld	a, 0x7f75
	or	a, (0x01, sp)
	ld	0x7f75, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 325: break;
	jra	00124$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 327: case ITC_IRQ_EEPROM_EEC:
00121$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 328: ITC->ISPR7 &= Mask;
	ld	a, 0x7f76
	and	a, (0x02, sp)
	ld	0x7f76, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 329: ITC->ISPR7 |= NewPriority;
	ld	a, 0x7f76
	or	a, (0x01, sp)
	ld	0x7f76, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 334: }
00124$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_itc.c: 335: }
	addw	sp, #2
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
