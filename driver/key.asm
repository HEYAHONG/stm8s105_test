;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module key
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _GPIO_ReadInputPin
	.globl _GPIO_Init
	.globl _EXTI_SetTLISensitivity
	.globl _EXTI_SetExtIntSensitivity
	.globl _keycount
	.globl _key_init
	.globl _key_read
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_keycount::
	.ds 5
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
;	driver/key.c: 4: void key_init()
;	-----------------------------------------
;	 function key_init
;	-----------------------------------------
_key_init:
;	driver/key.c: 6: GPIO_Init(GPIOD,GPIO_PIN_0,GPIO_MODE_IN_PU_IT);
	push	#0x60
	push	#0x01
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/key.c: 7: GPIO_Init(GPIOD,GPIO_PIN_1,GPIO_MODE_IN_PU_IT);
	push	#0x60
	push	#0x02
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/key.c: 8: GPIO_Init(GPIOD,GPIO_PIN_2,GPIO_MODE_IN_PU_IT);
	push	#0x60
	push	#0x04
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/key.c: 9: GPIO_Init(GPIOD,GPIO_PIN_3,GPIO_MODE_IN_PU_IT);
	push	#0x60
	push	#0x08
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/key.c: 10: GPIO_Init(GPIOD,GPIO_PIN_4,GPIO_MODE_IN_PU_IT);
	push	#0x60
	push	#0x10
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/key.c: 11: EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD,EXTI_SENSITIVITY_FALL_ONLY);
	push	#0x02
	push	#0x03
	call	_EXTI_SetExtIntSensitivity
	addw	sp, #2
;	driver/key.c: 12: EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
	push	#0x00
	call	_EXTI_SetTLISensitivity
	pop	a
;	driver/key.c: 13: }
	ret
;	driver/key.c: 14: BitStatus key_read(u8 num)
;	-----------------------------------------
;	 function key_read
;	-----------------------------------------
_key_read:
;	driver/key.c: 17: return GPIO_ReadInputPin(GPIOD,GPIO_PIN_0 << num);
	ld	a, #0x01
	push	a
	ld	a, (0x04, sp)
	jreq	00104$
00103$:
	sll	(1, sp)
	dec	a
	jrne	00103$
00104$:
	pop	a
	push	a
	push	#0x0f
	push	#0x50
	call	_GPIO_ReadInputPin
	addw	sp, #3
;	driver/key.c: 19: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
__xinit__keycount:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.area CABS (ABS)
