	.cpu cortex-m7
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"SEGGER_RTT.c"
	.text
.Ltext0:
	.section	.data._aTerminalId,"aw"
	.align	2
	.type	_aTerminalId, %object
	.size	_aTerminalId, 16
_aTerminalId:
	.ascii	"0123456789ABCDEF"
	.global	_SEGGER_RTT
	.section	.bss._SEGGER_RTT,"aw",%nobits
	.align	2
	.type	_SEGGER_RTT, %object
	.size	_SEGGER_RTT, 168
_SEGGER_RTT:
	.space	168
	.section	.bss._acUpBuffer,"aw",%nobits
	.align	2
	.type	_acUpBuffer, %object
	.size	_acUpBuffer, 4096
_acUpBuffer:
	.space	4096
	.section	.bss._acDownBuffer,"aw",%nobits
	.align	2
	.type	_acDownBuffer, %object
	.size	_acDownBuffer, 16
_acDownBuffer:
	.space	16
	.section	.bss._ActiveTerminal,"aw",%nobits
	.type	_ActiveTerminal, %object
	.size	_ActiveTerminal, 1
_ActiveTerminal:
	.space	1
	.section .rodata
	.align	2
.LC0:
	.ascii	"Terminal\000"
	.align	2
.LC1:
	.ascii	"RTT\000"
	.align	2
.LC2:
	.ascii	"SEGGER\000"
	.section	.text._DoInit,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	_DoInit, %function
_DoInit:
.LFB0:
	.file 1 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c"
	.loc 1 274 27
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI0:
	sub	sp, sp, #12
.LCFI1:
	.loc 1 279 5
	ldr	r3, .L2
	str	r3, [sp, #4]
	.loc 1 280 25
	ldr	r3, [sp, #4]
	movs	r2, #3
	str	r2, [r3, #16]
	.loc 1 281 25
	ldr	r3, [sp, #4]
	movs	r2, #3
	str	r2, [r3, #20]
	.loc 1 285 27
	ldr	r3, [sp, #4]
	ldr	r2, .L2+4
	str	r2, [r3, #24]
	.loc 1 286 27
	ldr	r3, [sp, #4]
	ldr	r2, .L2+8
	str	r2, [r3, #28]
	.loc 1 287 27
	ldr	r3, [sp, #4]
	mov	r2, #4096
	str	r2, [r3, #32]
	.loc 1 288 27
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #40]
	.loc 1 289 27
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #36]
	.loc 1 290 27
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #44]
	.loc 1 294 29
	ldr	r3, [sp, #4]
	ldr	r2, .L2+4
	str	r2, [r3, #96]
	.loc 1 295 29
	ldr	r3, [sp, #4]
	ldr	r2, .L2+12
	str	r2, [r3, #100]
	.loc 1 296 29
	ldr	r3, [sp, #4]
	movs	r2, #16
	str	r2, [r3, #104]
	.loc 1 297 29
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #112]
	.loc 1 298 29
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #108]
	.loc 1 299 29
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #116]
	.loc 1 305 3
	ldr	r3, [sp, #4]
	adds	r3, r3, #7
	ldr	r1, .L2+16
	mov	r0, r3
	bl	strcpy
	.loc 1 306 3
	ldr	r3, [sp, #4]
	ldr	r1, .L2+20
	mov	r0, r3
	bl	strcpy
	.loc 1 307 14
	ldr	r3, [sp, #4]
	movs	r2, #32
	strb	r2, [r3, #6]
	.loc 1 308 1
	nop
	add	sp, sp, #12
.LCFI2:
	@ sp needed
	ldr	pc, [sp], #4
.L3:
	.align	2
.L2:
	.word	_SEGGER_RTT
	.word	.LC0
	.word	_acUpBuffer
	.word	_acDownBuffer
	.word	.LC1
	.word	.LC2
.LFE0:
	.size	_DoInit, .-_DoInit
	.section	.text._WriteBlocking,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	_WriteBlocking, %function
_WriteBlocking:
.LFB1:
	.loc 1 329 101
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI3:
	sub	sp, sp, #36
.LCFI4:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 340 19
	movs	r3, #0
	str	r3, [sp, #24]
	.loc 1 341 9
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #12]
	str	r3, [sp, #20]
.L8:
	.loc 1 343 11
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #16]
	str	r3, [sp, #16]
	.loc 1 344 8
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #20]
	cmp	r2, r3
	bls	.L5
	.loc 1 345 31
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #20]
	subs	r3, r2, r3
	.loc 1 345 23
	subs	r3, r3, #1
	str	r3, [sp, #28]
	b	.L6
.L5:
	.loc 1 347 30
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #8]
	.loc 1 347 62
	ldr	r1, [sp, #16]
	ldr	r3, [sp, #20]
	subs	r3, r1, r3
	.loc 1 347 45
	add	r3, r3, r2
	.loc 1 347 23
	subs	r3, r3, #1
	str	r3, [sp, #28]
.L6:
	.loc 1 349 23
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #8]
	ldr	r3, [sp, #20]
	subs	r3, r2, r3
	.loc 1 349 21
	ldr	r2, [sp, #28]
	cmp	r3, r2
	it	cs
	movcs	r3, r2
	str	r3, [sp, #28]
	.loc 1 350 21
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #4]
	cmp	r3, r2
	it	cs
	movcs	r3, r2
	str	r3, [sp, #28]
	.loc 1 360 5
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #4]
	ldr	r3, [sp, #20]
	add	r3, r3, r2
	ldr	r2, [sp, #28]
	ldr	r1, [sp, #8]
	mov	r0, r3
	bl	memcpy
	.loc 1 361 21
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #28]
	add	r3, r3, r2
	str	r3, [sp, #24]
	.loc 1 362 21
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #28]
	add	r3, r3, r2
	str	r3, [sp, #8]
	.loc 1 363 21
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #28]
	subs	r3, r2, r3
	str	r3, [sp, #4]
	.loc 1 364 21
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #28]
	add	r3, r3, r2
	str	r3, [sp, #20]
	.loc 1 366 23
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #8]
	.loc 1 366 8
	ldr	r2, [sp, #20]
	cmp	r2, r3
	bne	.L7
	.loc 1 367 13
	movs	r3, #0
	str	r3, [sp, #20]
.L7:
	.loc 1 369 18
	ldr	r3, [sp, #12]
	ldr	r2, [sp, #20]
	str	r2, [r3, #12]
	.loc 1 370 3
	ldr	r3, [sp, #4]
	cmp	r3, #0
	bne	.L8
	.loc 1 372 10
	ldr	r3, [sp, #24]
	.loc 1 373 1
	mov	r0, r3
	add	sp, sp, #36
.LCFI5:
	@ sp needed
	ldr	pc, [sp], #4
.LFE1:
	.size	_WriteBlocking, .-_WriteBlocking
	.section	.text._WriteNoCheck,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	_WriteNoCheck, %function
_WriteNoCheck:
.LFB2:
	.loc 1 393 94
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI6:
	sub	sp, sp, #36
.LCFI7:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 401 9
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #12]
	str	r3, [sp, #28]
	.loc 1 402 14
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #8]
	.loc 1 402 7
	ldr	r3, [sp, #28]
	subs	r3, r2, r3
	str	r3, [sp, #24]
	.loc 1 403 6
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #4]
	cmp	r2, r3
	bls	.L11
	.loc 1 415 5
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #4]
	ldr	r3, [sp, #28]
	add	r3, r3, r2
	ldr	r2, [sp, #4]
	ldr	r1, [sp, #8]
	mov	r0, r3
	bl	memcpy
	.loc 1 416 26
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #4]
	add	r2, r2, r3
	.loc 1 416 18
	ldr	r3, [sp, #12]
	str	r2, [r3, #12]
	.loc 1 442 1
	b	.L13
.L11:
	.loc 1 435 20
	ldr	r3, [sp, #24]
	str	r3, [sp, #20]
	.loc 1 436 5
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #4]
	ldr	r3, [sp, #28]
	add	r3, r3, r2
	ldr	r2, [sp, #20]
	ldr	r1, [sp, #8]
	mov	r0, r3
	bl	memcpy
	.loc 1 437 20
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #24]
	subs	r3, r2, r3
	str	r3, [sp, #20]
	.loc 1 438 5
	ldr	r3, [sp, #12]
	ldr	r0, [r3, #4]
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #24]
	add	r3, r3, r2
	ldr	r2, [sp, #20]
	mov	r1, r3
	bl	memcpy
	.loc 1 439 18
	ldr	r3, [sp, #12]
	ldr	r2, [sp, #20]
	str	r2, [r3, #12]
.L13:
	.loc 1 442 1
	nop
	add	sp, sp, #36
.LCFI8:
	@ sp needed
	ldr	pc, [sp], #4
.LFE2:
	.size	_WriteNoCheck, .-_WriteNoCheck
	.section	.text._PostTerminalSwitch,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	_PostTerminalSwitch, %function
_PostTerminalSwitch:
.LFB3:
	.loc 1 457 88
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI9:
	sub	sp, sp, #20
.LCFI10:
	str	r0, [sp, #4]
	mov	r3, r1
	strb	r3, [sp, #3]
	.loc 1 460 9
	movs	r3, #255
	strb	r3, [sp, #12]
	.loc 1 461 23
	ldrb	r3, [sp, #3]	@ zero_extendqisi2
	ldr	r2, .L15
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	.loc 1 461 9
	strb	r3, [sp, #13]
	.loc 1 462 3
	add	r3, sp, #12
	movs	r2, #2
	mov	r1, r3
	ldr	r0, [sp, #4]
	bl	_WriteBlocking
	.loc 1 463 1
	nop
	add	sp, sp, #20
.LCFI11:
	@ sp needed
	ldr	pc, [sp], #4
.L16:
	.align	2
.L15:
	.word	_aTerminalId
.LFE3:
	.size	_PostTerminalSwitch, .-_PostTerminalSwitch
	.section	.text._GetAvailWriteSpace,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	_GetAvailWriteSpace, %function
_GetAvailWriteSpace:
.LFB4:
	.loc 1 479 66
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #24
.LCFI12:
	str	r0, [sp, #4]
	.loc 1 487 9
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	str	r3, [sp, #16]
	.loc 1 488 9
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	str	r3, [sp, #12]
	.loc 1 489 6
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #12]
	cmp	r2, r3
	bhi	.L18
	.loc 1 490 14
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #8]
	.loc 1 490 34
	ldr	r3, [sp, #12]
	subs	r2, r2, r3
	.loc 1 490 42
	ldr	r3, [sp, #16]
	add	r3, r3, r2
	.loc 1 490 7
	subs	r3, r3, #1
	str	r3, [sp, #20]
	b	.L19
.L18:
	.loc 1 492 15
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #12]
	subs	r3, r2, r3
	.loc 1 492 7
	subs	r3, r3, #1
	str	r3, [sp, #20]
.L19:
	.loc 1 494 10
	ldr	r3, [sp, #20]
	.loc 1 495 1
	mov	r0, r3
	add	sp, sp, #24
.LCFI13:
	@ sp needed
	bx	lr
.LFE4:
	.size	_GetAvailWriteSpace, .-_GetAvailWriteSpace
	.section	.text.SEGGER_RTT_ReadUpBufferNoLock,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_ReadUpBufferNoLock
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_ReadUpBufferNoLock, %function
SEGGER_RTT_ReadUpBufferNoLock:
.LFB5:
	.loc 1 525 96
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI14:
	sub	sp, sp, #44
.LCFI15:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 536 3
	ldr	r3, .L27
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L22
	.loc 1 536 3 is_stmt 0 discriminator 1
	bl	_DoInit
.L22:
	.loc 1 537 9 is_stmt 1
	ldr	r3, [sp, #12]
	adds	r2, r3, #1
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	ldr	r2, .L27
	add	r3, r3, r2
	str	r3, [sp, #24]
	.loc 1 538 11
	ldr	r3, [sp, #8]
	str	r3, [sp, #28]
	.loc 1 539 9
	ldr	r3, [sp, #24]
	ldr	r3, [r3, #16]
	str	r3, [sp, #32]
	.loc 1 540 9
	ldr	r3, [sp, #24]
	ldr	r3, [r3, #12]
	str	r3, [sp, #20]
	.loc 1 541 16
	movs	r3, #0
	str	r3, [sp, #36]
	.loc 1 545 6
	ldr	r2, [sp, #32]
	ldr	r3, [sp, #20]
	cmp	r2, r3
	bls	.L23
	.loc 1 546 24
	ldr	r3, [sp, #24]
	ldr	r2, [r3, #8]
	.loc 1 546 17
	ldr	r3, [sp, #32]
	subs	r3, r2, r3
	str	r3, [sp, #16]
	.loc 1 547 17
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #4]
	cmp	r3, r2
	it	cs
	movcs	r3, r2
	str	r3, [sp, #16]
	.loc 1 557 5
	ldr	r3, [sp, #24]
	ldr	r2, [r3, #4]
	ldr	r3, [sp, #32]
	add	r3, r3, r2
	ldr	r2, [sp, #16]
	mov	r1, r3
	ldr	r0, [sp, #28]
	bl	memcpy
	.loc 1 558 18
	ldr	r2, [sp, #36]
	ldr	r3, [sp, #16]
	add	r3, r3, r2
	str	r3, [sp, #36]
	.loc 1 559 18
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #16]
	add	r3, r3, r2
	str	r3, [sp, #28]
	.loc 1 560 18
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #16]
	subs	r3, r2, r3
	str	r3, [sp, #4]
	.loc 1 561 18
	ldr	r2, [sp, #32]
	ldr	r3, [sp, #16]
	add	r3, r3, r2
	str	r3, [sp, #32]
	.loc 1 566 23
	ldr	r3, [sp, #24]
	ldr	r3, [r3, #8]
	.loc 1 566 8
	ldr	r2, [sp, #32]
	cmp	r2, r3
	bne	.L23
	.loc 1 567 13
	movs	r3, #0
	str	r3, [sp, #32]
.L23:
	.loc 1 573 15
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #32]
	subs	r3, r2, r3
	str	r3, [sp, #16]
	.loc 1 574 15
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #4]
	cmp	r3, r2
	it	cs
	movcs	r3, r2
	str	r3, [sp, #16]
	.loc 1 575 6
	ldr	r3, [sp, #16]
	cmp	r3, #0
	beq	.L24
	.loc 1 585 5
	ldr	r3, [sp, #24]
	ldr	r2, [r3, #4]
	ldr	r3, [sp, #32]
	add	r3, r3, r2
	ldr	r2, [sp, #16]
	mov	r1, r3
	ldr	r0, [sp, #28]
	bl	memcpy
	.loc 1 586 18
	ldr	r2, [sp, #36]
	ldr	r3, [sp, #16]
	add	r3, r3, r2
	str	r3, [sp, #36]
	.loc 1 587 18
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #16]
	add	r3, r3, r2
	str	r3, [sp, #28]
	.loc 1 588 18
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #16]
	subs	r3, r2, r3
	str	r3, [sp, #4]
	.loc 1 589 18
	ldr	r2, [sp, #32]
	ldr	r3, [sp, #16]
	add	r3, r3, r2
	str	r3, [sp, #32]
.L24:
	.loc 1 595 6
	ldr	r3, [sp, #36]
	cmp	r3, #0
	beq	.L25
	.loc 1 596 18
	ldr	r3, [sp, #24]
	ldr	r2, [sp, #32]
	str	r2, [r3, #16]
.L25:
	.loc 1 599 10
	ldr	r3, [sp, #36]
	.loc 1 600 1
	mov	r0, r3
	add	sp, sp, #44
.LCFI16:
	@ sp needed
	ldr	pc, [sp], #4
.L28:
	.align	2
.L27:
	.word	_SEGGER_RTT
.LFE5:
	.size	SEGGER_RTT_ReadUpBufferNoLock, .-SEGGER_RTT_ReadUpBufferNoLock
	.section	.text.SEGGER_RTT_ReadNoLock,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_ReadNoLock
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_ReadNoLock, %function
SEGGER_RTT_ReadNoLock:
.LFB6:
	.loc 1 619 88
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI17:
	sub	sp, sp, #44
.LCFI18:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 630 3
	ldr	r3, .L35
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L30
	.loc 1 630 3 is_stmt 0 discriminator 1
	bl	_DoInit
.L30:
	.loc 1 631 9 is_stmt 1
	ldr	r2, [sp, #12]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	adds	r3, r3, #96
	ldr	r2, .L35
	add	r3, r3, r2
	str	r3, [sp, #24]
	.loc 1 632 11
	ldr	r3, [sp, #8]
	str	r3, [sp, #28]
	.loc 1 633 9
	ldr	r3, [sp, #24]
	ldr	r3, [r3, #16]
	str	r3, [sp, #32]
	.loc 1 634 9
	ldr	r3, [sp, #24]
	ldr	r3, [r3, #12]
	str	r3, [sp, #20]
	.loc 1 635 16
	movs	r3, #0
	str	r3, [sp, #36]
	.loc 1 639 6
	ldr	r2, [sp, #32]
	ldr	r3, [sp, #20]
	cmp	r2, r3
	bls	.L31
	.loc 1 640 24
	ldr	r3, [sp, #24]
	ldr	r2, [r3, #8]
	.loc 1 640 17
	ldr	r3, [sp, #32]
	subs	r3, r2, r3
	str	r3, [sp, #16]
	.loc 1 641 17
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #4]
	cmp	r3, r2
	it	cs
	movcs	r3, r2
	str	r3, [sp, #16]
	.loc 1 651 5
	ldr	r3, [sp, #24]
	ldr	r2, [r3, #4]
	ldr	r3, [sp, #32]
	add	r3, r3, r2
	ldr	r2, [sp, #16]
	mov	r1, r3
	ldr	r0, [sp, #28]
	bl	memcpy
	.loc 1 652 18
	ldr	r2, [sp, #36]
	ldr	r3, [sp, #16]
	add	r3, r3, r2
	str	r3, [sp, #36]
	.loc 1 653 18
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #16]
	add	r3, r3, r2
	str	r3, [sp, #28]
	.loc 1 654 18
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #16]
	subs	r3, r2, r3
	str	r3, [sp, #4]
	.loc 1 655 18
	ldr	r2, [sp, #32]
	ldr	r3, [sp, #16]
	add	r3, r3, r2
	str	r3, [sp, #32]
	.loc 1 660 23
	ldr	r3, [sp, #24]
	ldr	r3, [r3, #8]
	.loc 1 660 8
	ldr	r2, [sp, #32]
	cmp	r2, r3
	bne	.L31
	.loc 1 661 13
	movs	r3, #0
	str	r3, [sp, #32]
.L31:
	.loc 1 667 15
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #32]
	subs	r3, r2, r3
	str	r3, [sp, #16]
	.loc 1 668 15
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #4]
	cmp	r3, r2
	it	cs
	movcs	r3, r2
	str	r3, [sp, #16]
	.loc 1 669 6
	ldr	r3, [sp, #16]
	cmp	r3, #0
	beq	.L32
	.loc 1 679 5
	ldr	r3, [sp, #24]
	ldr	r2, [r3, #4]
	ldr	r3, [sp, #32]
	add	r3, r3, r2
	ldr	r2, [sp, #16]
	mov	r1, r3
	ldr	r0, [sp, #28]
	bl	memcpy
	.loc 1 680 18
	ldr	r2, [sp, #36]
	ldr	r3, [sp, #16]
	add	r3, r3, r2
	str	r3, [sp, #36]
	.loc 1 681 18
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #16]
	add	r3, r3, r2
	str	r3, [sp, #28]
	.loc 1 682 18
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #16]
	subs	r3, r2, r3
	str	r3, [sp, #4]
	.loc 1 683 18
	ldr	r2, [sp, #32]
	ldr	r3, [sp, #16]
	add	r3, r3, r2
	str	r3, [sp, #32]
.L32:
	.loc 1 686 6
	ldr	r3, [sp, #36]
	cmp	r3, #0
	beq	.L33
	.loc 1 687 18
	ldr	r3, [sp, #24]
	ldr	r2, [sp, #32]
	str	r2, [r3, #16]
.L33:
	.loc 1 690 10
	ldr	r3, [sp, #36]
	.loc 1 691 1
	mov	r0, r3
	add	sp, sp, #44
.LCFI19:
	@ sp needed
	ldr	pc, [sp], #4
.L36:
	.align	2
.L35:
	.word	_SEGGER_RTT
.LFE6:
	.size	SEGGER_RTT_ReadNoLock, .-SEGGER_RTT_ReadNoLock
	.section	.text.SEGGER_RTT_ReadUpBuffer,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_ReadUpBuffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_ReadUpBuffer, %function
SEGGER_RTT_ReadUpBuffer:
.LFB7:
	.loc 1 718 92
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI20:
	sub	sp, sp, #28
.LCFI21:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
.LBB2:
	.loc 1 721 3
	.syntax unified
@ 721 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #20]
	.loc 1 725 18
	ldr	r2, [sp, #4]
	ldr	r1, [sp, #8]
	ldr	r0, [sp, #12]
	bl	SEGGER_RTT_ReadUpBufferNoLock
	str	r0, [sp, #16]
	.loc 1 729 3
	ldr	r3, [sp, #20]
	.syntax unified
@ 729 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
.LBE2:
	.loc 1 731 10
	ldr	r3, [sp, #16]
	.loc 1 732 1
	mov	r0, r3
	add	sp, sp, #28
.LCFI22:
	@ sp needed
	ldr	pc, [sp], #4
.LFE7:
	.size	SEGGER_RTT_ReadUpBuffer, .-SEGGER_RTT_ReadUpBuffer
	.section	.text.SEGGER_RTT_Read,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_Read
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_Read, %function
SEGGER_RTT_Read:
.LFB8:
	.loc 1 750 84
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI23:
	sub	sp, sp, #28
.LCFI24:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
.LBB3:
	.loc 1 753 3
	.syntax unified
@ 753 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #20]
	.loc 1 757 18
	ldr	r2, [sp, #4]
	ldr	r1, [sp, #8]
	ldr	r0, [sp, #12]
	bl	SEGGER_RTT_ReadNoLock
	str	r0, [sp, #16]
	.loc 1 761 3
	ldr	r3, [sp, #20]
	.syntax unified
@ 761 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
.LBE3:
	.loc 1 763 10
	ldr	r3, [sp, #16]
	.loc 1 764 1
	mov	r0, r3
	add	sp, sp, #28
.LCFI25:
	@ sp needed
	ldr	pc, [sp], #4
.LFE8:
	.size	SEGGER_RTT_Read, .-SEGGER_RTT_Read
	.section	.text.SEGGER_RTT_WriteWithOverwriteNoLock,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_WriteWithOverwriteNoLock
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_WriteWithOverwriteNoLock, %function
SEGGER_RTT_WriteWithOverwriteNoLock:
.LFB9:
	.loc 1 789 104
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI26:
	sub	sp, sp, #36
.LCFI27:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 797 9
	ldr	r3, [sp, #8]
	str	r3, [sp, #28]
	.loc 1 801 9
	ldr	r3, [sp, #12]
	adds	r2, r3, #1
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	ldr	r2, .L51
	add	r3, r3, r2
	str	r3, [sp, #20]
	.loc 1 805 12
	ldr	r3, [sp, #20]
	ldr	r2, [r3, #12]
	.loc 1 805 28
	ldr	r3, [sp, #20]
	ldr	r3, [r3, #16]
	.loc 1 805 6
	cmp	r2, r3
	bne	.L42
	.loc 1 806 18
	ldr	r3, [sp, #20]
	ldr	r3, [r3, #8]
	.loc 1 806 11
	subs	r3, r3, #1
	str	r3, [sp, #24]
	b	.L43
.L42:
	.loc 1 807 20
	ldr	r3, [sp, #20]
	ldr	r2, [r3, #12]
	.loc 1 807 35
	ldr	r3, [sp, #20]
	ldr	r3, [r3, #16]
	.loc 1 807 13
	cmp	r2, r3
	bcs	.L44
	.loc 1 808 18
	ldr	r3, [sp, #20]
	ldr	r2, [r3, #16]
	.loc 1 808 33
	ldr	r3, [sp, #20]
	ldr	r3, [r3, #12]
	.loc 1 808 26
	subs	r3, r2, r3
	.loc 1 808 11
	subs	r3, r3, #1
	str	r3, [sp, #24]
	b	.L43
.L44:
	.loc 1 810 18
	ldr	r3, [sp, #20]
	ldr	r2, [r3, #16]
	.loc 1 810 33
	ldr	r3, [sp, #20]
	ldr	r3, [r3, #12]
	.loc 1 810 26
	subs	r2, r2, r3
	.loc 1 810 53
	ldr	r3, [sp, #20]
	ldr	r3, [r3, #8]
	.loc 1 810 46
	add	r3, r3, r2
	.loc 1 810 11
	subs	r3, r3, #1
	str	r3, [sp, #24]
.L43:
	.loc 1 812 6
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #24]
	cmp	r2, r3
	bls	.L45
	.loc 1 813 18
	ldr	r3, [sp, #20]
	ldr	r2, [r3, #16]
	.loc 1 813 31
	ldr	r1, [sp, #4]
	ldr	r3, [sp, #24]
	subs	r3, r1, r3
	.loc 1 813 18
	add	r2, r2, r3
	ldr	r3, [sp, #20]
	str	r2, [r3, #16]
	.loc 1 814 11
	b	.L46
.L47:
	.loc 1 815 20
	ldr	r3, [sp, #20]
	ldr	r2, [r3, #16]
	.loc 1 815 28
	ldr	r3, [sp, #20]
	ldr	r3, [r3, #8]
	.loc 1 815 20
	subs	r2, r2, r3
	ldr	r3, [sp, #20]
	str	r2, [r3, #16]
.L46:
	.loc 1 814 17
	ldr	r3, [sp, #20]
	ldr	r2, [r3, #16]
	.loc 1 814 33
	ldr	r3, [sp, #20]
	ldr	r3, [r3, #8]
	.loc 1 814 11
	cmp	r2, r3
	bcs	.L47
.L45:
	.loc 1 821 16
	ldr	r3, [sp, #20]
	ldr	r2, [r3, #8]
	.loc 1 821 38
	ldr	r3, [sp, #20]
	ldr	r3, [r3, #12]
	.loc 1 821 9
	subs	r3, r2, r3
	str	r3, [sp, #24]
.L50:
	.loc 1 823 8
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #4]
	cmp	r2, r3
	bls	.L48
	.loc 1 835 7
	ldr	r3, [sp, #20]
	ldr	r2, [r3, #4]
	ldr	r3, [sp, #20]
	ldr	r3, [r3, #12]
	add	r3, r3, r2
	ldr	r2, [sp, #4]
	ldr	r1, [sp, #28]
	mov	r0, r3
	bl	memcpy
	.loc 1 836 20
	ldr	r3, [sp, #20]
	ldr	r2, [r3, #12]
	ldr	r3, [sp, #4]
	add	r2, r2, r3
	ldr	r3, [sp, #20]
	str	r2, [r3, #12]
	.loc 1 838 7
	b	.L49
.L48:
	.loc 1 851 7
	ldr	r3, [sp, #20]
	ldr	r2, [r3, #4]
	ldr	r3, [sp, #20]
	ldr	r3, [r3, #12]
	add	r3, r3, r2
	ldr	r2, [sp, #24]
	ldr	r1, [sp, #28]
	mov	r0, r3
	bl	memcpy
	.loc 1 852 13
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #24]
	add	r3, r3, r2
	str	r3, [sp, #28]
	.loc 1 853 20
	ldr	r3, [sp, #20]
	movs	r2, #0
	str	r2, [r3, #12]
	.loc 1 854 16
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #24]
	subs	r3, r2, r3
	str	r3, [sp, #4]
	.loc 1 856 21
	ldr	r3, [sp, #20]
	ldr	r3, [r3, #8]
	.loc 1 856 13
	subs	r3, r3, #1
	str	r3, [sp, #24]
	.loc 1 858 3
	ldr	r3, [sp, #4]
	cmp	r3, #0
	bne	.L50
	.loc 1 859 1
	nop
.L49:
	nop
	add	sp, sp, #36
.LCFI28:
	@ sp needed
	ldr	pc, [sp], #4
.L52:
	.align	2
.L51:
	.word	_SEGGER_RTT
.LFE9:
	.size	SEGGER_RTT_WriteWithOverwriteNoLock, .-SEGGER_RTT_WriteWithOverwriteNoLock
	.section	.text.SEGGER_RTT_WriteDownBufferNoLock,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_WriteDownBufferNoLock
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_WriteDownBufferNoLock, %function
SEGGER_RTT_WriteDownBufferNoLock:
.LFB10:
	.loc 1 973 105
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI29:
	sub	sp, sp, #36
.LCFI30:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 979 9
	ldr	r3, [sp, #8]
	str	r3, [sp, #24]
	.loc 1 984 9
	ldr	r2, [sp, #12]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	adds	r3, r3, #96
	ldr	r2, .L62
	add	r3, r3, r2
	str	r3, [sp, #20]
	.loc 1 988 16
	ldr	r3, [sp, #20]
	ldr	r3, [r3, #20]
	.loc 1 988 3
	cmp	r3, #2
	beq	.L54
	cmp	r3, #2
	bhi	.L55
	cmp	r3, #0
	beq	.L56
	cmp	r3, #1
	beq	.L57
	b	.L55
.L56:
	.loc 1 994 13
	ldr	r0, [sp, #20]
	bl	_GetAvailWriteSpace
	str	r0, [sp, #16]
	.loc 1 995 8
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #4]
	cmp	r2, r3
	bcs	.L58
	.loc 1 996 14
	movs	r3, #0
	str	r3, [sp, #28]
	.loc 1 1001 5
	b	.L60
.L58:
	.loc 1 998 14
	ldr	r3, [sp, #4]
	str	r3, [sp, #28]
	.loc 1 999 7
	ldr	r2, [sp, #4]
	ldr	r1, [sp, #24]
	ldr	r0, [sp, #20]
	bl	_WriteNoCheck
	.loc 1 1001 5
	b	.L60
.L57:
	.loc 1 1006 13
	ldr	r0, [sp, #20]
	bl	_GetAvailWriteSpace
	str	r0, [sp, #16]
	.loc 1 1007 12
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #16]
	cmp	r3, r2
	it	cs
	movcs	r3, r2
	str	r3, [sp, #28]
	.loc 1 1008 5
	ldr	r2, [sp, #28]
	ldr	r1, [sp, #24]
	ldr	r0, [sp, #20]
	bl	_WriteNoCheck
	.loc 1 1009 5
	b	.L60
.L54:
	.loc 1 1014 14
	ldr	r2, [sp, #4]
	ldr	r1, [sp, #24]
	ldr	r0, [sp, #20]
	bl	_WriteBlocking
	str	r0, [sp, #28]
	.loc 1 1015 5
	b	.L60
.L55:
	.loc 1 1017 12
	movs	r3, #0
	str	r3, [sp, #28]
	.loc 1 1018 5
	nop
.L60:
	.loc 1 1023 10
	ldr	r3, [sp, #28]
	.loc 1 1024 1
	mov	r0, r3
	add	sp, sp, #36
.LCFI31:
	@ sp needed
	ldr	pc, [sp], #4
.L63:
	.align	2
.L62:
	.word	_SEGGER_RTT
.LFE10:
	.size	SEGGER_RTT_WriteDownBufferNoLock, .-SEGGER_RTT_WriteDownBufferNoLock
	.section	.text.SEGGER_RTT_WriteNoLock,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_WriteNoLock
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_WriteNoLock, %function
SEGGER_RTT_WriteNoLock:
.LFB11:
	.loc 1 1049 95
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI32:
	sub	sp, sp, #36
.LCFI33:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 1055 9
	ldr	r3, [sp, #8]
	str	r3, [sp, #24]
	.loc 1 1059 9
	ldr	r3, [sp, #12]
	adds	r2, r3, #1
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	ldr	r2, .L73
	add	r3, r3, r2
	str	r3, [sp, #20]
	.loc 1 1063 16
	ldr	r3, [sp, #20]
	ldr	r3, [r3, #20]
	.loc 1 1063 3
	cmp	r3, #2
	beq	.L65
	cmp	r3, #2
	bhi	.L66
	cmp	r3, #0
	beq	.L67
	cmp	r3, #1
	beq	.L68
	b	.L66
.L67:
	.loc 1 1069 13
	ldr	r0, [sp, #20]
	bl	_GetAvailWriteSpace
	str	r0, [sp, #16]
	.loc 1 1070 8
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #4]
	cmp	r2, r3
	bcs	.L69
	.loc 1 1071 14
	movs	r3, #0
	str	r3, [sp, #28]
	.loc 1 1076 5
	b	.L71
.L69:
	.loc 1 1073 14
	ldr	r3, [sp, #4]
	str	r3, [sp, #28]
	.loc 1 1074 7
	ldr	r2, [sp, #4]
	ldr	r1, [sp, #24]
	ldr	r0, [sp, #20]
	bl	_WriteNoCheck
	.loc 1 1076 5
	b	.L71
.L68:
	.loc 1 1081 13
	ldr	r0, [sp, #20]
	bl	_GetAvailWriteSpace
	str	r0, [sp, #16]
	.loc 1 1082 12
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #16]
	cmp	r3, r2
	it	cs
	movcs	r3, r2
	str	r3, [sp, #28]
	.loc 1 1083 5
	ldr	r2, [sp, #28]
	ldr	r1, [sp, #24]
	ldr	r0, [sp, #20]
	bl	_WriteNoCheck
	.loc 1 1084 5
	b	.L71
.L65:
	.loc 1 1089 14
	ldr	r2, [sp, #4]
	ldr	r1, [sp, #24]
	ldr	r0, [sp, #20]
	bl	_WriteBlocking
	str	r0, [sp, #28]
	.loc 1 1090 5
	b	.L71
.L66:
	.loc 1 1092 12
	movs	r3, #0
	str	r3, [sp, #28]
	.loc 1 1093 5
	nop
.L71:
	.loc 1 1098 10
	ldr	r3, [sp, #28]
	.loc 1 1099 1
	mov	r0, r3
	add	sp, sp, #36
.LCFI34:
	@ sp needed
	ldr	pc, [sp], #4
.L74:
	.align	2
.L73:
	.word	_SEGGER_RTT
.LFE11:
	.size	SEGGER_RTT_WriteNoLock, .-SEGGER_RTT_WriteNoLock
	.section	.text.SEGGER_RTT_WriteDownBuffer,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_WriteDownBuffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_WriteDownBuffer, %function
SEGGER_RTT_WriteDownBuffer:
.LFB12:
	.loc 1 1126 99
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI35:
	sub	sp, sp, #28
.LCFI36:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 1129 3
	ldr	r3, .L78
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L76
	.loc 1 1129 3 is_stmt 0 discriminator 1
	bl	_DoInit
.L76:
.LBB4:
	.loc 1 1130 3 is_stmt 1
	.syntax unified
@ 1130 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #20]
	.loc 1 1134 12
	ldr	r2, [sp, #4]
	ldr	r1, [sp, #8]
	ldr	r0, [sp, #12]
	bl	SEGGER_RTT_WriteDownBufferNoLock
	str	r0, [sp, #16]
	.loc 1 1138 3
	ldr	r3, [sp, #20]
	.syntax unified
@ 1138 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
.LBE4:
	.loc 1 1140 10
	ldr	r3, [sp, #16]
	.loc 1 1141 1
	mov	r0, r3
	add	sp, sp, #28
.LCFI37:
	@ sp needed
	ldr	pc, [sp], #4
.L79:
	.align	2
.L78:
	.word	_SEGGER_RTT
.LFE12:
	.size	SEGGER_RTT_WriteDownBuffer, .-SEGGER_RTT_WriteDownBuffer
	.section	.text.SEGGER_RTT_Write,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_Write
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_Write, %function
SEGGER_RTT_Write:
.LFB13:
	.loc 1 1162 89
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI38:
	sub	sp, sp, #28
.LCFI39:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 1165 3
	ldr	r3, .L83
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L81
	.loc 1 1165 3 is_stmt 0 discriminator 1
	bl	_DoInit
.L81:
.LBB5:
	.loc 1 1166 3 is_stmt 1
	.syntax unified
@ 1166 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #20]
	.loc 1 1170 12
	ldr	r2, [sp, #4]
	ldr	r1, [sp, #8]
	ldr	r0, [sp, #12]
	bl	SEGGER_RTT_WriteNoLock
	str	r0, [sp, #16]
	.loc 1 1174 3
	ldr	r3, [sp, #20]
	.syntax unified
@ 1174 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
.LBE5:
	.loc 1 1176 10
	ldr	r3, [sp, #16]
	.loc 1 1177 1
	mov	r0, r3
	add	sp, sp, #28
.LCFI40:
	@ sp needed
	ldr	pc, [sp], #4
.L84:
	.align	2
.L83:
	.word	_SEGGER_RTT
.LFE13:
	.size	SEGGER_RTT_Write, .-SEGGER_RTT_Write
	.section	.text.SEGGER_RTT_WriteString,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_WriteString
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_WriteString, %function
SEGGER_RTT_WriteString:
.LFB14:
	.loc 1 1199 70
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI41:
	sub	sp, sp, #20
.LCFI42:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 1202 9
	ldr	r0, [sp]
	bl	strlen
	str	r0, [sp, #12]
	.loc 1 1203 10
	ldr	r2, [sp, #12]
	ldr	r1, [sp]
	ldr	r0, [sp, #4]
	bl	SEGGER_RTT_Write
	mov	r3, r0
	.loc 1 1204 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI43:
	@ sp needed
	ldr	pc, [sp], #4
.LFE14:
	.size	SEGGER_RTT_WriteString, .-SEGGER_RTT_WriteString
	.section	.text.SEGGER_RTT_PutCharSkipNoLock,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_PutCharSkipNoLock
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_PutCharSkipNoLock, %function
SEGGER_RTT_PutCharSkipNoLock:
.LFB15:
	.loc 1 1229 69
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #24
.LCFI44:
	str	r0, [sp, #4]
	mov	r3, r1
	strb	r3, [sp, #3]
	.loc 1 1236 9
	ldr	r3, [sp, #4]
	adds	r2, r3, #1
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	ldr	r2, .L92
	add	r3, r3, r2
	str	r3, [sp, #12]
	.loc 1 1240 16
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #12]
	.loc 1 1240 9
	adds	r3, r3, #1
	str	r3, [sp, #20]
	.loc 1 1241 21
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #8]
	.loc 1 1241 6
	ldr	r2, [sp, #20]
	cmp	r2, r3
	bne	.L88
	.loc 1 1242 11
	movs	r3, #0
	str	r3, [sp, #20]
.L88:
	.loc 1 1247 21
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #16]
	.loc 1 1247 6
	ldr	r2, [sp, #20]
	cmp	r2, r3
	beq	.L89
	.loc 1 1248 10
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #4]
	.loc 1 1248 25
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #12]
	.loc 1 1248 19
	add	r3, r3, r2
	.loc 1 1248 34
	ldrb	r2, [sp, #3]
	strb	r2, [r3]
	.loc 1 1249 18
	ldr	r3, [sp, #12]
	ldr	r2, [sp, #20]
	str	r2, [r3, #12]
	.loc 1 1250 12
	movs	r3, #1
	str	r3, [sp, #16]
	b	.L90
.L89:
	.loc 1 1252 12
	movs	r3, #0
	str	r3, [sp, #16]
.L90:
	.loc 1 1255 10
	ldr	r3, [sp, #16]
	.loc 1 1256 1
	mov	r0, r3
	add	sp, sp, #24
.LCFI45:
	@ sp needed
	bx	lr
.L93:
	.align	2
.L92:
	.word	_SEGGER_RTT
.LFE15:
	.size	SEGGER_RTT_PutCharSkipNoLock, .-SEGGER_RTT_PutCharSkipNoLock
	.section	.text.SEGGER_RTT_PutCharSkip,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_PutCharSkip
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_PutCharSkip, %function
SEGGER_RTT_PutCharSkip:
.LFB16:
	.loc 1 1276 63
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI46:
	sub	sp, sp, #28
.LCFI47:
	str	r0, [sp, #4]
	mov	r3, r1
	strb	r3, [sp, #3]
	.loc 1 1283 3
	ldr	r3, .L100
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L95
	.loc 1 1283 3 is_stmt 0 discriminator 1
	bl	_DoInit
.L95:
.LBB6:
	.loc 1 1284 3 is_stmt 1
	.syntax unified
@ 1284 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #12]
	.loc 1 1288 9
	ldr	r3, [sp, #4]
	adds	r2, r3, #1
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	ldr	r2, .L100
	add	r3, r3, r2
	str	r3, [sp, #8]
	.loc 1 1292 16
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #12]
	.loc 1 1292 9
	adds	r3, r3, #1
	str	r3, [sp, #20]
	.loc 1 1293 21
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #8]
	.loc 1 1293 6
	ldr	r2, [sp, #20]
	cmp	r2, r3
	bne	.L96
	.loc 1 1294 11
	movs	r3, #0
	str	r3, [sp, #20]
.L96:
	.loc 1 1299 21
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #16]
	.loc 1 1299 6
	ldr	r2, [sp, #20]
	cmp	r2, r3
	beq	.L97
	.loc 1 1300 10
	ldr	r3, [sp, #8]
	ldr	r2, [r3, #4]
	.loc 1 1300 25
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #12]
	.loc 1 1300 19
	add	r3, r3, r2
	.loc 1 1300 34
	ldrb	r2, [sp, #3]
	strb	r2, [r3]
	.loc 1 1301 18
	ldr	r3, [sp, #8]
	ldr	r2, [sp, #20]
	str	r2, [r3, #12]
	.loc 1 1302 12
	movs	r3, #1
	str	r3, [sp, #16]
	b	.L98
.L97:
	.loc 1 1304 12
	movs	r3, #0
	str	r3, [sp, #16]
.L98:
	.loc 1 1309 3
	ldr	r3, [sp, #12]
	.syntax unified
@ 1309 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
.LBE6:
	.loc 1 1311 10
	ldr	r3, [sp, #16]
	.loc 1 1312 1
	mov	r0, r3
	add	sp, sp, #28
.LCFI48:
	@ sp needed
	ldr	pc, [sp], #4
.L101:
	.align	2
.L100:
	.word	_SEGGER_RTT
.LFE16:
	.size	SEGGER_RTT_PutCharSkip, .-SEGGER_RTT_PutCharSkip
	.section	.text.SEGGER_RTT_PutChar,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_PutChar
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_PutChar, %function
SEGGER_RTT_PutChar:
.LFB17:
	.loc 1 1332 59
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI49:
	sub	sp, sp, #28
.LCFI50:
	str	r0, [sp, #4]
	mov	r3, r1
	strb	r3, [sp, #3]
	.loc 1 1339 3
	ldr	r3, .L110
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L103
	.loc 1 1339 3 is_stmt 0 discriminator 1
	bl	_DoInit
.L103:
.LBB7:
	.loc 1 1340 3 is_stmt 1
	.syntax unified
@ 1340 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #12]
	.loc 1 1344 9
	ldr	r3, [sp, #4]
	adds	r2, r3, #1
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	ldr	r2, .L110
	add	r3, r3, r2
	str	r3, [sp, #8]
	.loc 1 1348 16
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #12]
	.loc 1 1348 9
	adds	r3, r3, #1
	str	r3, [sp, #20]
	.loc 1 1349 21
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #8]
	.loc 1 1349 6
	ldr	r2, [sp, #20]
	cmp	r2, r3
	bne	.L104
	.loc 1 1350 11
	movs	r3, #0
	str	r3, [sp, #20]
.L104:
	.loc 1 1355 12
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #20]
	.loc 1 1355 6
	cmp	r3, #2
	bne	.L105
	.loc 1 1356 11
	nop
.L106:
	.loc 1 1356 26 discriminator 1
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #16]
	.loc 1 1356 11 discriminator 1
	ldr	r2, [sp, #20]
	cmp	r2, r3
	beq	.L106
.L105:
	.loc 1 1363 21
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #16]
	.loc 1 1363 6
	ldr	r2, [sp, #20]
	cmp	r2, r3
	beq	.L107
	.loc 1 1364 10
	ldr	r3, [sp, #8]
	ldr	r2, [r3, #4]
	.loc 1 1364 25
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #12]
	.loc 1 1364 19
	add	r3, r3, r2
	.loc 1 1364 34
	ldrb	r2, [sp, #3]
	strb	r2, [r3]
	.loc 1 1365 18
	ldr	r3, [sp, #8]
	ldr	r2, [sp, #20]
	str	r2, [r3, #12]
	.loc 1 1366 12
	movs	r3, #1
	str	r3, [sp, #16]
	b	.L108
.L107:
	.loc 1 1368 12
	movs	r3, #0
	str	r3, [sp, #16]
.L108:
	.loc 1 1373 3
	ldr	r3, [sp, #12]
	.syntax unified
@ 1373 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
.LBE7:
	.loc 1 1375 10
	ldr	r3, [sp, #16]
	.loc 1 1376 1
	mov	r0, r3
	add	sp, sp, #28
.LCFI51:
	@ sp needed
	ldr	pc, [sp], #4
.L111:
	.align	2
.L110:
	.word	_SEGGER_RTT
.LFE17:
	.size	SEGGER_RTT_PutChar, .-SEGGER_RTT_PutChar
	.section	.text.SEGGER_RTT_GetKey,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_GetKey
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_GetKey, %function
SEGGER_RTT_GetKey:
.LFB18:
	.loc 1 1393 29
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI52:
	sub	sp, sp, #12
.LCFI53:
	.loc 1 1397 12
	add	r3, sp, #3
	movs	r2, #1
	mov	r1, r3
	movs	r0, #0
	bl	SEGGER_RTT_Read
	mov	r3, r0
	.loc 1 1397 5
	str	r3, [sp, #4]
	.loc 1 1398 6
	ldr	r3, [sp, #4]
	cmp	r3, #1
	bne	.L113
	.loc 1 1399 9
	ldrb	r3, [sp, #3]	@ zero_extendqisi2
	.loc 1 1399 7
	str	r3, [sp, #4]
	b	.L114
.L113:
	.loc 1 1401 7
	mov	r3, #-1
	str	r3, [sp, #4]
.L114:
	.loc 1 1403 10
	ldr	r3, [sp, #4]
	.loc 1 1404 1
	mov	r0, r3
	add	sp, sp, #12
.LCFI54:
	@ sp needed
	ldr	pc, [sp], #4
.LFE18:
	.size	SEGGER_RTT_GetKey, .-SEGGER_RTT_GetKey
	.section	.text.SEGGER_RTT_WaitKey,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_WaitKey
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_WaitKey, %function
SEGGER_RTT_WaitKey:
.LFB19:
	.loc 1 1421 30
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI55:
	sub	sp, sp, #12
.LCFI56:
.L117:
	.loc 1 1425 9 discriminator 1
	bl	SEGGER_RTT_GetKey
	str	r0, [sp, #4]
	.loc 1 1426 3 discriminator 1
	ldr	r3, [sp, #4]
	cmp	r3, #0
	blt	.L117
	.loc 1 1427 10
	ldr	r3, [sp, #4]
	.loc 1 1428 1
	mov	r0, r3
	add	sp, sp, #12
.LCFI57:
	@ sp needed
	ldr	pc, [sp], #4
.LFE19:
	.size	SEGGER_RTT_WaitKey, .-SEGGER_RTT_WaitKey
	.section	.text.SEGGER_RTT_HasKey,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_HasKey
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_HasKey, %function
SEGGER_RTT_HasKey:
.LFB20:
	.loc 1 1444 29
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI58:
	sub	sp, sp, #12
.LCFI59:
	.loc 1 1448 3
	ldr	r3, .L124
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L120
	.loc 1 1448 3 is_stmt 0 discriminator 1
	bl	_DoInit
.L120:
	.loc 1 1449 9 is_stmt 1
	ldr	r3, .L124
	ldr	r3, [r3, #112]
	str	r3, [sp]
	.loc 1 1450 36
	ldr	r3, .L124
	ldr	r3, [r3, #108]
	.loc 1 1450 6
	ldr	r2, [sp]
	cmp	r2, r3
	beq	.L121
	.loc 1 1451 7
	movs	r3, #1
	str	r3, [sp, #4]
	b	.L122
.L121:
	.loc 1 1453 7
	movs	r3, #0
	str	r3, [sp, #4]
.L122:
	.loc 1 1455 10
	ldr	r3, [sp, #4]
	.loc 1 1456 1
	mov	r0, r3
	add	sp, sp, #12
.LCFI60:
	@ sp needed
	ldr	pc, [sp], #4
.L125:
	.align	2
.L124:
	.word	_SEGGER_RTT
.LFE20:
	.size	SEGGER_RTT_HasKey, .-SEGGER_RTT_HasKey
	.section	.text.SEGGER_RTT_HasData,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_HasData
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_HasData, %function
SEGGER_RTT_HasData:
.LFB21:
	.loc 1 1470 51
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
.LCFI61:
	str	r0, [sp, #4]
	.loc 1 1474 9
	ldr	r2, [sp, #4]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	adds	r3, r3, #96
	ldr	r2, .L128
	add	r3, r3, r2
	str	r3, [sp, #12]
	.loc 1 1475 5
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #12]
	str	r3, [sp, #8]
	.loc 1 1476 19
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #16]
	.loc 1 1476 12
	ldr	r2, [sp, #8]
	subs	r3, r2, r3
	.loc 1 1477 1
	mov	r0, r3
	add	sp, sp, #16
.LCFI62:
	@ sp needed
	bx	lr
.L129:
	.align	2
.L128:
	.word	_SEGGER_RTT
.LFE21:
	.size	SEGGER_RTT_HasData, .-SEGGER_RTT_HasData
	.section	.text.SEGGER_RTT_HasDataUp,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_HasDataUp
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_HasDataUp, %function
SEGGER_RTT_HasDataUp:
.LFB22:
	.loc 1 1491 53
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
.LCFI63:
	str	r0, [sp, #4]
	.loc 1 1495 9
	ldr	r3, [sp, #4]
	adds	r2, r3, #1
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	ldr	r2, .L132
	add	r3, r3, r2
	str	r3, [sp, #12]
	.loc 1 1496 5
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #16]
	str	r3, [sp, #8]
	.loc 1 1497 15
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #12]
	.loc 1 1497 23
	ldr	r3, [sp, #8]
	subs	r3, r2, r3
	.loc 1 1498 1
	mov	r0, r3
	add	sp, sp, #16
.LCFI64:
	@ sp needed
	bx	lr
.L133:
	.align	2
.L132:
	.word	_SEGGER_RTT
.LFE22:
	.size	SEGGER_RTT_HasDataUp, .-SEGGER_RTT_HasDataUp
	.section	.text.SEGGER_RTT_AllocDownBuffer,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_AllocDownBuffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_AllocDownBuffer, %function
SEGGER_RTT_AllocDownBuffer:
.LFB23:
	.loc 1 1519 103
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI65:
	sub	sp, sp, #28
.LCFI66:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	.loc 1 1522 3
	ldr	r3, .L143
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L135
	.loc 1 1522 3 is_stmt 0 discriminator 1
	bl	_DoInit
.L135:
.LBB8:
	.loc 1 1523 3 is_stmt 1
	.syntax unified
@ 1523 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #16]
	.loc 1 1524 15
	movs	r3, #0
	str	r3, [sp, #20]
.L138:
	.loc 1 1526 39
	ldr	r1, .L143
	ldr	r2, [sp, #20]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #100
	ldr	r3, [r3]
	.loc 1 1526 8
	cmp	r3, #0
	beq	.L142
	.loc 1 1529 16
	ldr	r3, [sp, #20]
	adds	r3, r3, #1
	str	r3, [sp, #20]
	.loc 1 1530 37
	ldr	r3, .L143
	ldr	r3, [r3, #20]
	.loc 1 1530 3
	ldr	r2, [sp, #20]
	cmp	r2, r3
	blt	.L138
	b	.L137
.L142:
	.loc 1 1527 7
	nop
.L137:
	.loc 1 1531 32
	ldr	r3, .L143
	ldr	r3, [r3, #20]
	.loc 1 1531 6
	ldr	r2, [sp, #20]
	cmp	r2, r3
	bge	.L139
	.loc 1 1532 49
	ldr	r1, .L143
	ldr	r2, [sp, #20]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #96
	ldr	r2, [sp, #12]
	str	r2, [r3]
	.loc 1 1533 49
	ldr	r1, .L143
	ldr	r2, [sp, #20]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #100
	ldr	r2, [sp, #8]
	str	r2, [r3]
	.loc 1 1534 49
	ldr	r1, .L143
	ldr	r2, [sp, #20]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #104
	ldr	r2, [sp, #4]
	str	r2, [r3]
	.loc 1 1535 49
	ldr	r1, .L143
	ldr	r2, [sp, #20]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #112
	movs	r2, #0
	str	r2, [r3]
	.loc 1 1536 49
	ldr	r1, .L143
	ldr	r2, [sp, #20]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #108
	movs	r2, #0
	str	r2, [r3]
	.loc 1 1537 49
	ldr	r1, .L143
	ldr	r2, [sp, #20]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #116
	ldr	r2, [sp]
	str	r2, [r3]
	b	.L140
.L139:
	.loc 1 1539 17
	mov	r3, #-1
	str	r3, [sp, #20]
.L140:
	.loc 1 1541 3
	ldr	r3, [sp, #16]
	.syntax unified
@ 1541 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
.LBE8:
	.loc 1 1542 10
	ldr	r3, [sp, #20]
	.loc 1 1543 1
	mov	r0, r3
	add	sp, sp, #28
.LCFI67:
	@ sp needed
	ldr	pc, [sp], #4
.L144:
	.align	2
.L143:
	.word	_SEGGER_RTT
.LFE23:
	.size	SEGGER_RTT_AllocDownBuffer, .-SEGGER_RTT_AllocDownBuffer
	.section	.text.SEGGER_RTT_AllocUpBuffer,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_AllocUpBuffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_AllocUpBuffer, %function
SEGGER_RTT_AllocUpBuffer:
.LFB24:
	.loc 1 1564 101
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI68:
	sub	sp, sp, #28
.LCFI69:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	.loc 1 1567 3
	ldr	r3, .L154
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L146
	.loc 1 1567 3 is_stmt 0 discriminator 1
	bl	_DoInit
.L146:
.LBB9:
	.loc 1 1568 3 is_stmt 1
	.syntax unified
@ 1568 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #16]
	.loc 1 1569 15
	movs	r3, #0
	str	r3, [sp, #20]
.L149:
	.loc 1 1571 37
	ldr	r1, .L154
	ldr	r3, [sp, #20]
	adds	r2, r3, #1
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #4
	ldr	r3, [r3]
	.loc 1 1571 8
	cmp	r3, #0
	beq	.L153
	.loc 1 1574 16
	ldr	r3, [sp, #20]
	adds	r3, r3, #1
	str	r3, [sp, #20]
	.loc 1 1575 37
	ldr	r3, .L154
	ldr	r3, [r3, #16]
	.loc 1 1575 3
	ldr	r2, [sp, #20]
	cmp	r2, r3
	blt	.L149
	b	.L148
.L153:
	.loc 1 1572 7
	nop
.L148:
	.loc 1 1576 32
	ldr	r3, .L154
	ldr	r3, [r3, #16]
	.loc 1 1576 6
	ldr	r2, [sp, #20]
	cmp	r2, r3
	bge	.L150
	.loc 1 1577 47
	ldr	r1, .L154
	ldr	r3, [sp, #20]
	adds	r2, r3, #1
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	ldr	r2, [sp, #12]
	str	r2, [r3]
	.loc 1 1578 47
	ldr	r1, .L154
	ldr	r3, [sp, #20]
	adds	r2, r3, #1
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #4
	ldr	r2, [sp, #8]
	str	r2, [r3]
	.loc 1 1579 47
	ldr	r1, .L154
	ldr	r2, [sp, #20]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #32
	ldr	r2, [sp, #4]
	str	r2, [r3]
	.loc 1 1580 47
	ldr	r1, .L154
	ldr	r2, [sp, #20]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #40
	movs	r2, #0
	str	r2, [r3]
	.loc 1 1581 47
	ldr	r1, .L154
	ldr	r2, [sp, #20]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #36
	movs	r2, #0
	str	r2, [r3]
	.loc 1 1582 47
	ldr	r1, .L154
	ldr	r2, [sp, #20]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #44
	ldr	r2, [sp]
	str	r2, [r3]
	b	.L151
.L150:
	.loc 1 1584 17
	mov	r3, #-1
	str	r3, [sp, #20]
.L151:
	.loc 1 1586 3
	ldr	r3, [sp, #16]
	.syntax unified
@ 1586 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
.LBE9:
	.loc 1 1587 10
	ldr	r3, [sp, #20]
	.loc 1 1588 1
	mov	r0, r3
	add	sp, sp, #28
.LCFI70:
	@ sp needed
	ldr	pc, [sp], #4
.L155:
	.align	2
.L154:
	.word	_SEGGER_RTT
.LFE24:
	.size	SEGGER_RTT_AllocUpBuffer, .-SEGGER_RTT_AllocUpBuffer
	.section	.text.SEGGER_RTT_ConfigUpBuffer,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_ConfigUpBuffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_ConfigUpBuffer, %function
SEGGER_RTT_ConfigUpBuffer:
.LFB25:
	.loc 1 1615 124
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI71:
	sub	sp, sp, #28
.LCFI72:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	.loc 1 1618 3
	ldr	r3, .L162
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L157
	.loc 1 1618 3 is_stmt 0 discriminator 1
	bl	_DoInit
.L157:
	.loc 1 1619 42 is_stmt 1
	ldr	r3, .L162
	ldr	r3, [r3, #16]
	.loc 1 1619 21
	mov	r2, r3
	.loc 1 1619 6
	ldr	r3, [sp, #12]
	cmp	r3, r2
	bcs	.L158
.LBB10:
	.loc 1 1620 5
	.syntax unified
@ 1620 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #16]
	.loc 1 1621 8
	ldr	r3, [sp, #12]
	cmp	r3, #0
	beq	.L159
	.loc 1 1622 49
	ldr	r1, .L162
	ldr	r3, [sp, #12]
	adds	r2, r3, #1
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	ldr	r2, [sp, #8]
	str	r2, [r3]
	.loc 1 1623 49
	ldr	r1, .L162
	ldr	r3, [sp, #12]
	adds	r2, r3, #1
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #4
	ldr	r2, [sp, #4]
	str	r2, [r3]
	.loc 1 1624 49
	ldr	r1, .L162
	ldr	r2, [sp, #12]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #32
	ldr	r2, [sp]
	str	r2, [r3]
	.loc 1 1625 49
	ldr	r1, .L162
	ldr	r2, [sp, #12]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #40
	movs	r2, #0
	str	r2, [r3]
	.loc 1 1626 49
	ldr	r1, .L162
	ldr	r2, [sp, #12]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #36
	movs	r2, #0
	str	r2, [r3]
.L159:
	.loc 1 1628 49
	ldr	r1, .L162
	ldr	r2, [sp, #12]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #44
	ldr	r2, [sp, #32]
	str	r2, [r3]
	.loc 1 1629 5
	ldr	r3, [sp, #16]
	.syntax unified
@ 1629 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
.LBE10:
	.loc 1 1630 7
	movs	r3, #0
	str	r3, [sp, #20]
	b	.L160
.L158:
	.loc 1 1632 7
	mov	r3, #-1
	str	r3, [sp, #20]
.L160:
	.loc 1 1634 10
	ldr	r3, [sp, #20]
	.loc 1 1635 1
	mov	r0, r3
	add	sp, sp, #28
.LCFI73:
	@ sp needed
	ldr	pc, [sp], #4
.L163:
	.align	2
.L162:
	.word	_SEGGER_RTT
.LFE25:
	.size	SEGGER_RTT_ConfigUpBuffer, .-SEGGER_RTT_ConfigUpBuffer
	.section	.text.SEGGER_RTT_ConfigDownBuffer,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_ConfigDownBuffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_ConfigDownBuffer, %function
SEGGER_RTT_ConfigDownBuffer:
.LFB26:
	.loc 1 1662 126
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI74:
	sub	sp, sp, #28
.LCFI75:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	.loc 1 1665 3
	ldr	r3, .L170
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L165
	.loc 1 1665 3 is_stmt 0 discriminator 1
	bl	_DoInit
.L165:
	.loc 1 1666 42 is_stmt 1
	ldr	r3, .L170
	ldr	r3, [r3, #20]
	.loc 1 1666 21
	mov	r2, r3
	.loc 1 1666 6
	ldr	r3, [sp, #12]
	cmp	r3, r2
	bcs	.L166
.LBB11:
	.loc 1 1667 5
	.syntax unified
@ 1667 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #16]
	.loc 1 1668 8
	ldr	r3, [sp, #12]
	cmp	r3, #0
	beq	.L167
	.loc 1 1669 51
	ldr	r1, .L170
	ldr	r2, [sp, #12]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #96
	ldr	r2, [sp, #8]
	str	r2, [r3]
	.loc 1 1670 51
	ldr	r1, .L170
	ldr	r2, [sp, #12]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #100
	ldr	r2, [sp, #4]
	str	r2, [r3]
	.loc 1 1671 51
	ldr	r1, .L170
	ldr	r2, [sp, #12]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #104
	ldr	r2, [sp]
	str	r2, [r3]
	.loc 1 1672 51
	ldr	r1, .L170
	ldr	r2, [sp, #12]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #112
	movs	r2, #0
	str	r2, [r3]
	.loc 1 1673 51
	ldr	r1, .L170
	ldr	r2, [sp, #12]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #108
	movs	r2, #0
	str	r2, [r3]
.L167:
	.loc 1 1675 51
	ldr	r1, .L170
	ldr	r2, [sp, #12]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #116
	ldr	r2, [sp, #32]
	str	r2, [r3]
	.loc 1 1676 5
	ldr	r3, [sp, #16]
	.syntax unified
@ 1676 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
.LBE11:
	.loc 1 1677 7
	movs	r3, #0
	str	r3, [sp, #20]
	b	.L168
.L166:
	.loc 1 1679 7
	mov	r3, #-1
	str	r3, [sp, #20]
.L168:
	.loc 1 1681 10
	ldr	r3, [sp, #20]
	.loc 1 1682 1
	mov	r0, r3
	add	sp, sp, #28
.LCFI76:
	@ sp needed
	ldr	pc, [sp], #4
.L171:
	.align	2
.L170:
	.word	_SEGGER_RTT
.LFE26:
	.size	SEGGER_RTT_ConfigDownBuffer, .-SEGGER_RTT_ConfigDownBuffer
	.section	.text.SEGGER_RTT_SetNameUpBuffer,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_SetNameUpBuffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_SetNameUpBuffer, %function
SEGGER_RTT_SetNameUpBuffer:
.LFB27:
	.loc 1 1700 73
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI77:
	sub	sp, sp, #20
.LCFI78:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 1703 3
	ldr	r3, .L177
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L173
	.loc 1 1703 3 is_stmt 0 discriminator 1
	bl	_DoInit
.L173:
	.loc 1 1704 42 is_stmt 1
	ldr	r3, .L177
	ldr	r3, [r3, #16]
	.loc 1 1704 21
	mov	r2, r3
	.loc 1 1704 6
	ldr	r3, [sp, #4]
	cmp	r3, r2
	bcs	.L174
.LBB12:
	.loc 1 1705 5
	.syntax unified
@ 1705 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #8]
	.loc 1 1706 40
	ldr	r1, .L177
	ldr	r3, [sp, #4]
	adds	r2, r3, #1
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	ldr	r2, [sp]
	str	r2, [r3]
	.loc 1 1707 5
	ldr	r3, [sp, #8]
	.syntax unified
@ 1707 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
.LBE12:
	.loc 1 1708 7
	movs	r3, #0
	str	r3, [sp, #12]
	b	.L175
.L174:
	.loc 1 1710 7
	mov	r3, #-1
	str	r3, [sp, #12]
.L175:
	.loc 1 1712 10
	ldr	r3, [sp, #12]
	.loc 1 1713 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI79:
	@ sp needed
	ldr	pc, [sp], #4
.L178:
	.align	2
.L177:
	.word	_SEGGER_RTT
.LFE27:
	.size	SEGGER_RTT_SetNameUpBuffer, .-SEGGER_RTT_SetNameUpBuffer
	.section	.text.SEGGER_RTT_SetNameDownBuffer,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_SetNameDownBuffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_SetNameDownBuffer, %function
SEGGER_RTT_SetNameDownBuffer:
.LFB28:
	.loc 1 1731 75
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI80:
	sub	sp, sp, #20
.LCFI81:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 1734 3
	ldr	r3, .L184
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L180
	.loc 1 1734 3 is_stmt 0 discriminator 1
	bl	_DoInit
.L180:
	.loc 1 1735 42 is_stmt 1
	ldr	r3, .L184
	ldr	r3, [r3, #20]
	.loc 1 1735 21
	mov	r2, r3
	.loc 1 1735 6
	ldr	r3, [sp, #4]
	cmp	r3, r2
	bcs	.L181
.LBB13:
	.loc 1 1736 5
	.syntax unified
@ 1736 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #8]
	.loc 1 1737 42
	ldr	r1, .L184
	ldr	r2, [sp, #4]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #96
	ldr	r2, [sp]
	str	r2, [r3]
	.loc 1 1738 5
	ldr	r3, [sp, #8]
	.syntax unified
@ 1738 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
.LBE13:
	.loc 1 1739 7
	movs	r3, #0
	str	r3, [sp, #12]
	b	.L182
.L181:
	.loc 1 1741 7
	mov	r3, #-1
	str	r3, [sp, #12]
.L182:
	.loc 1 1743 10
	ldr	r3, [sp, #12]
	.loc 1 1744 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI82:
	@ sp needed
	ldr	pc, [sp], #4
.L185:
	.align	2
.L184:
	.word	_SEGGER_RTT
.LFE28:
	.size	SEGGER_RTT_SetNameDownBuffer, .-SEGGER_RTT_SetNameDownBuffer
	.section	.text.SEGGER_RTT_SetFlagsUpBuffer,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_SetFlagsUpBuffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_SetFlagsUpBuffer, %function
SEGGER_RTT_SetFlagsUpBuffer:
.LFB29:
	.loc 1 1762 71
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI83:
	sub	sp, sp, #20
.LCFI84:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 1765 3
	ldr	r3, .L191
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L187
	.loc 1 1765 3 is_stmt 0 discriminator 1
	bl	_DoInit
.L187:
	.loc 1 1766 42 is_stmt 1
	ldr	r3, .L191
	ldr	r3, [r3, #16]
	.loc 1 1766 21
	mov	r2, r3
	.loc 1 1766 6
	ldr	r3, [sp, #4]
	cmp	r3, r2
	bcs	.L188
.LBB14:
	.loc 1 1767 5
	.syntax unified
@ 1767 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #8]
	.loc 1 1768 40
	ldr	r1, .L191
	ldr	r2, [sp, #4]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #44
	ldr	r2, [sp]
	str	r2, [r3]
	.loc 1 1769 5
	ldr	r3, [sp, #8]
	.syntax unified
@ 1769 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
.LBE14:
	.loc 1 1770 7
	movs	r3, #0
	str	r3, [sp, #12]
	b	.L189
.L188:
	.loc 1 1772 7
	mov	r3, #-1
	str	r3, [sp, #12]
.L189:
	.loc 1 1774 10
	ldr	r3, [sp, #12]
	.loc 1 1775 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI85:
	@ sp needed
	ldr	pc, [sp], #4
.L192:
	.align	2
.L191:
	.word	_SEGGER_RTT
.LFE29:
	.size	SEGGER_RTT_SetFlagsUpBuffer, .-SEGGER_RTT_SetFlagsUpBuffer
	.section	.text.SEGGER_RTT_SetFlagsDownBuffer,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_SetFlagsDownBuffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_SetFlagsDownBuffer, %function
SEGGER_RTT_SetFlagsDownBuffer:
.LFB30:
	.loc 1 1793 73
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI86:
	sub	sp, sp, #20
.LCFI87:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 1796 3
	ldr	r3, .L198
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L194
	.loc 1 1796 3 is_stmt 0 discriminator 1
	bl	_DoInit
.L194:
	.loc 1 1797 42 is_stmt 1
	ldr	r3, .L198
	ldr	r3, [r3, #20]
	.loc 1 1797 21
	mov	r2, r3
	.loc 1 1797 6
	ldr	r3, [sp, #4]
	cmp	r3, r2
	bcs	.L195
.LBB15:
	.loc 1 1798 5
	.syntax unified
@ 1798 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #8]
	.loc 1 1799 42
	ldr	r1, .L198
	ldr	r2, [sp, #4]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #116
	ldr	r2, [sp]
	str	r2, [r3]
	.loc 1 1800 5
	ldr	r3, [sp, #8]
	.syntax unified
@ 1800 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
.LBE15:
	.loc 1 1801 7
	movs	r3, #0
	str	r3, [sp, #12]
	b	.L196
.L195:
	.loc 1 1803 7
	mov	r3, #-1
	str	r3, [sp, #12]
.L196:
	.loc 1 1805 10
	ldr	r3, [sp, #12]
	.loc 1 1806 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI88:
	@ sp needed
	ldr	pc, [sp], #4
.L199:
	.align	2
.L198:
	.word	_SEGGER_RTT
.LFE30:
	.size	SEGGER_RTT_SetFlagsDownBuffer, .-SEGGER_RTT_SetFlagsDownBuffer
	.section	.text.SEGGER_RTT_Init,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_Init, %function
SEGGER_RTT_Init:
.LFB31:
	.loc 1 1817 29
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
.LCFI89:
	.loc 1 1818 3
	bl	_DoInit
	.loc 1 1819 1
	nop
	pop	{r3, pc}
.LFE31:
	.size	SEGGER_RTT_Init, .-SEGGER_RTT_Init
	.section	.text.SEGGER_RTT_SetTerminal,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_SetTerminal
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_SetTerminal, %function
SEGGER_RTT_SetTerminal:
.LFB32:
	.loc 1 1835 55
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI90:
	sub	sp, sp, #36
.LCFI91:
	mov	r3, r0
	strb	r3, [sp, #7]
	.loc 1 1841 3
	ldr	r3, .L209
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L202
	.loc 1 1841 3 is_stmt 0 discriminator 1
	bl	_DoInit
.L202:
	.loc 1 1843 5 is_stmt 1
	movs	r3, #0
	str	r3, [sp, #28]
	.loc 1 1844 9
	movs	r3, #255
	strb	r3, [sp, #12]
	.loc 1 1845 6
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	cmp	r3, #15
	bhi	.L203
	.loc 1 1846 25
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	ldr	r2, .L209+4
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	.loc 1 1846 11
	strb	r3, [sp, #13]
	.loc 1 1847 11
	ldr	r3, .L209+8
	str	r3, [sp, #24]
.LBB16:
	.loc 1 1848 5
	.syntax unified
@ 1848 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #20]
	.loc 1 1849 15
	ldr	r3, [sp, #24]
	ldr	r3, [r3, #20]
	.loc 1 1849 23
	and	r3, r3, #3
	.loc 1 1849 8
	cmp	r3, #2
	bne	.L204
	.loc 1 1850 23
	ldr	r2, .L209+12
	ldrb	r3, [sp, #7]
	strb	r3, [r2]
	.loc 1 1851 7
	add	r3, sp, #12
	movs	r2, #2
	mov	r1, r3
	ldr	r0, [sp, #24]
	bl	_WriteBlocking
	b	.L205
.L204:
	.loc 1 1853 15
	ldr	r0, [sp, #24]
	bl	_GetAvailWriteSpace
	str	r0, [sp, #16]
	.loc 1 1854 10
	ldr	r3, [sp, #16]
	cmp	r3, #1
	bls	.L206
	.loc 1 1855 25
	ldr	r2, .L209+12
	ldrb	r3, [sp, #7]
	strb	r3, [r2]
	.loc 1 1856 9
	add	r3, sp, #12
	movs	r2, #2
	mov	r1, r3
	ldr	r0, [sp, #24]
	bl	_WriteNoCheck
	b	.L205
.L206:
	.loc 1 1858 11
	mov	r3, #-1
	str	r3, [sp, #28]
.L205:
	.loc 1 1861 5
	ldr	r3, [sp, #20]
	.syntax unified
@ 1861 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
.LBE16:
	b	.L207
.L203:
	.loc 1 1863 7
	mov	r3, #-1
	str	r3, [sp, #28]
.L207:
	.loc 1 1865 10
	ldr	r3, [sp, #28]
	.loc 1 1866 1
	mov	r0, r3
	add	sp, sp, #36
.LCFI92:
	@ sp needed
	ldr	pc, [sp], #4
.L210:
	.align	2
.L209:
	.word	_SEGGER_RTT
	.word	_aTerminalId
	.word	_SEGGER_RTT+24
	.word	_ActiveTerminal
.LFE32:
	.size	SEGGER_RTT_SetTerminal, .-SEGGER_RTT_SetTerminal
	.section	.text.SEGGER_RTT_TerminalOut,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_TerminalOut
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_TerminalOut, %function
SEGGER_RTT_TerminalOut:
.LFB33:
	.loc 1 1885 70
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI93:
	sub	sp, sp, #36
.LCFI94:
	mov	r3, r0
	str	r1, [sp]
	strb	r3, [sp, #7]
	.loc 1 1891 3
	ldr	r3, .L225
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L212
	.loc 1 1891 3 is_stmt 0 discriminator 1
	bl	_DoInit
.L212:
	.loc 1 1895 6 is_stmt 1
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	cmp	r3, #15
	bhi	.L213
	.loc 1 1899 11
	ldr	r3, .L225+4
	str	r3, [sp, #24]
	.loc 1 1904 15
	ldr	r0, [sp]
	bl	strlen
	str	r0, [sp, #20]
.LBB17:
	.loc 1 1908 5
	.syntax unified
@ 1908 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #16]
	.loc 1 1909 13
	ldr	r0, [sp, #24]
	bl	_GetAvailWriteSpace
	str	r0, [sp, #12]
	.loc 1 1910 18
	ldr	r3, [sp, #24]
	ldr	r3, [r3, #20]
	.loc 1 1910 26
	and	r3, r3, #3
	.loc 1 1910 5
	cmp	r3, #2
	beq	.L214
	cmp	r3, #2
	bhi	.L215
	cmp	r3, #0
	beq	.L216
	cmp	r3, #1
	beq	.L217
	b	.L215
.L216:
	.loc 1 1916 28
	ldr	r3, [sp, #20]
	adds	r3, r3, #4
	.loc 1 1916 10
	ldr	r2, [sp, #12]
	cmp	r2, r3
	bcs	.L218
	.loc 1 1917 16
	movs	r3, #0
	str	r3, [sp, #28]
	.loc 1 1923 7
	b	.L220
.L218:
	.loc 1 1919 9
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, [sp, #24]
	bl	_PostTerminalSwitch
	.loc 1 1920 23
	ldr	r2, [sp, #20]
	ldr	r1, [sp]
	ldr	r0, [sp, #24]
	bl	_WriteBlocking
	mov	r3, r0
	.loc 1 1920 16
	str	r3, [sp, #28]
	.loc 1 1921 9
	ldr	r3, .L225+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, [sp, #24]
	bl	_PostTerminalSwitch
	.loc 1 1923 7
	b	.L220
.L217:
	.loc 1 1930 10
	ldr	r3, [sp, #12]
	cmp	r3, #3
	bhi	.L221
	.loc 1 1931 16
	mov	r3, #-1
	str	r3, [sp, #28]
	.loc 1 1937 7
	b	.L220
.L221:
	.loc 1 1933 9
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, [sp, #24]
	bl	_PostTerminalSwitch
	.loc 1 1934 66
	ldr	r3, [sp, #12]
	subs	r2, r3, #4
	.loc 1 1934 23
	ldr	r3, [sp, #20]
	cmp	r3, r2
	it	cs
	movcs	r3, r2
	mov	r2, r3
	ldr	r1, [sp]
	ldr	r0, [sp, #24]
	bl	_WriteBlocking
	mov	r3, r0
	.loc 1 1934 16
	str	r3, [sp, #28]
	.loc 1 1935 9
	ldr	r3, .L225+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, [sp, #24]
	bl	_PostTerminalSwitch
	.loc 1 1937 7
	b	.L220
.L214:
	.loc 1 1942 7
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, [sp, #24]
	bl	_PostTerminalSwitch
	.loc 1 1943 21
	ldr	r2, [sp, #20]
	ldr	r1, [sp]
	ldr	r0, [sp, #24]
	bl	_WriteBlocking
	mov	r3, r0
	.loc 1 1943 14
	str	r3, [sp, #28]
	.loc 1 1944 7
	ldr	r3, .L225+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, [sp, #24]
	bl	_PostTerminalSwitch
	.loc 1 1945 7
	b	.L220
.L215:
	.loc 1 1947 14
	mov	r3, #-1
	str	r3, [sp, #28]
	.loc 1 1948 7
	nop
.L220:
	.loc 1 1953 5
	ldr	r3, [sp, #16]
	.syntax unified
@ 1953 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
.LBE17:
	b	.L223
.L213:
	.loc 1 1955 12
	mov	r3, #-1
	str	r3, [sp, #28]
.L223:
	.loc 1 1957 10
	ldr	r3, [sp, #28]
	.loc 1 1958 1
	mov	r0, r3
	add	sp, sp, #36
.LCFI95:
	@ sp needed
	ldr	pc, [sp], #4
.L226:
	.align	2
.L225:
	.word	_SEGGER_RTT
	.word	_SEGGER_RTT+24
	.word	_ActiveTerminal
.LFE33:
	.size	SEGGER_RTT_TerminalOut, .-SEGGER_RTT_TerminalOut
	.section	.text.SEGGER_RTT_GetAvailWriteSpace,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_GetAvailWriteSpace
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_GetAvailWriteSpace, %function
SEGGER_RTT_GetAvailWriteSpace:
.LFB34:
	.loc 1 1973 62
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI96:
	sub	sp, sp, #12
.LCFI97:
	str	r0, [sp, #4]
	.loc 1 1974 10
	ldr	r3, [sp, #4]
	adds	r2, r3, #1
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	ldr	r2, .L229
	add	r3, r3, r2
	mov	r0, r3
	bl	_GetAvailWriteSpace
	mov	r3, r0
	.loc 1 1975 1
	mov	r0, r3
	add	sp, sp, #12
.LCFI98:
	@ sp needed
	ldr	pc, [sp], #4
.L230:
	.align	2
.L229:
	.word	_SEGGER_RTT
.LFE34:
	.size	SEGGER_RTT_GetAvailWriteSpace, .-SEGGER_RTT_GetAvailWriteSpace
	.section	.text.SEGGER_RTT_GetBytesInBuffer,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_GetBytesInBuffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_GetBytesInBuffer, %function
SEGGER_RTT_GetBytesInBuffer:
.LFB35:
	.loc 1 1991 60
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #24
.LCFI99:
	str	r0, [sp, #4]
	.loc 1 1999 9
	ldr	r1, .L235
	ldr	r2, [sp, #4]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #40
	ldr	r3, [r3]
	str	r3, [sp, #16]
	.loc 1 2000 9
	ldr	r1, .L235
	ldr	r2, [sp, #4]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #36
	ldr	r3, [r3]
	str	r3, [sp, #12]
	.loc 1 2001 6
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #12]
	cmp	r2, r3
	bhi	.L232
	.loc 1 2002 7
	ldr	r2, [sp, #12]
	ldr	r3, [sp, #16]
	subs	r3, r2, r3
	str	r3, [sp, #20]
	b	.L233
.L232:
	.loc 1 2004 37
	ldr	r1, .L235
	ldr	r2, [sp, #4]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #32
	ldr	r2, [r3]
	.loc 1 2004 51
	ldr	r1, [sp, #16]
	ldr	r3, [sp, #12]
	subs	r3, r1, r3
	.loc 1 2004 7
	add	r3, r3, r2
	str	r3, [sp, #20]
.L233:
	.loc 1 2006 10
	ldr	r3, [sp, #20]
	.loc 1 2007 1
	mov	r0, r3
	add	sp, sp, #24
.LCFI100:
	@ sp needed
	bx	lr
.L236:
	.align	2
.L235:
	.word	_SEGGER_RTT
.LFE35:
	.size	SEGGER_RTT_GetBytesInBuffer, .-SEGGER_RTT_GetBytesInBuffer
	.section	.debug_frame,"",%progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x3
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 -4
	.uleb128 0xe
	.byte	0xc
	.uleb128 0xd
	.uleb128 0
	.align	2
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x4
	.4byte	.LCFI0-.LFB0
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI3-.LFB1
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI6-.LFB2
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI9-.LFB3
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI12-.LFB4
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI14-.LFB5
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI15-.LCFI14
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x4
	.4byte	.LCFI17-.LFB6
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI18-.LCFI17
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.4byte	.LCFI19-.LCFI18
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.byte	0x4
	.4byte	.LCFI20-.LFB7
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI21-.LCFI20
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI22-.LCFI21
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.byte	0x4
	.4byte	.LCFI23-.LFB8
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI24-.LCFI23
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI25-.LCFI24
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI26-.LFB9
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI27-.LCFI26
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI28-.LCFI27
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.byte	0x4
	.4byte	.LCFI29-.LFB10
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI30-.LCFI29
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI31-.LCFI30
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.byte	0x4
	.4byte	.LCFI32-.LFB11
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI33-.LCFI32
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI34-.LCFI33
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.byte	0x4
	.4byte	.LCFI35-.LFB12
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI36-.LCFI35
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI37-.LCFI36
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.byte	0x4
	.4byte	.LCFI38-.LFB13
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI39-.LCFI38
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI40-.LCFI39
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.byte	0x4
	.4byte	.LCFI41-.LFB14
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI42-.LCFI41
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI43-.LCFI42
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.byte	0x4
	.4byte	.LCFI44-.LFB15
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI45-.LCFI44
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.byte	0x4
	.4byte	.LCFI46-.LFB16
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI47-.LCFI46
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI48-.LCFI47
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.byte	0x4
	.4byte	.LCFI49-.LFB17
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI50-.LCFI49
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI51-.LCFI50
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.byte	0x4
	.4byte	.LCFI52-.LFB18
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI53-.LCFI52
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI54-.LCFI53
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.byte	0x4
	.4byte	.LCFI55-.LFB19
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI56-.LCFI55
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI57-.LCFI56
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.byte	0x4
	.4byte	.LCFI58-.LFB20
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI59-.LCFI58
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI60-.LCFI59
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE40:
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x4
	.4byte	.LCFI61-.LFB21
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI62-.LCFI61
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE42:
.LSFDE44:
	.4byte	.LEFDE44-.LASFDE44
.LASFDE44:
	.4byte	.Lframe0
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x4
	.4byte	.LCFI63-.LFB22
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI64-.LCFI63
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE44:
.LSFDE46:
	.4byte	.LEFDE46-.LASFDE46
.LASFDE46:
	.4byte	.Lframe0
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.byte	0x4
	.4byte	.LCFI65-.LFB23
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI66-.LCFI65
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI67-.LCFI66
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE46:
.LSFDE48:
	.4byte	.LEFDE48-.LASFDE48
.LASFDE48:
	.4byte	.Lframe0
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.byte	0x4
	.4byte	.LCFI68-.LFB24
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI69-.LCFI68
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI70-.LCFI69
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE48:
.LSFDE50:
	.4byte	.LEFDE50-.LASFDE50
.LASFDE50:
	.4byte	.Lframe0
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.byte	0x4
	.4byte	.LCFI71-.LFB25
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI72-.LCFI71
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI73-.LCFI72
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE50:
.LSFDE52:
	.4byte	.LEFDE52-.LASFDE52
.LASFDE52:
	.4byte	.Lframe0
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.byte	0x4
	.4byte	.LCFI74-.LFB26
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI75-.LCFI74
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI76-.LCFI75
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE52:
.LSFDE54:
	.4byte	.LEFDE54-.LASFDE54
.LASFDE54:
	.4byte	.Lframe0
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.byte	0x4
	.4byte	.LCFI77-.LFB27
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI78-.LCFI77
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI79-.LCFI78
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE54:
.LSFDE56:
	.4byte	.LEFDE56-.LASFDE56
.LASFDE56:
	.4byte	.Lframe0
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.byte	0x4
	.4byte	.LCFI80-.LFB28
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI81-.LCFI80
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI82-.LCFI81
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE56:
.LSFDE58:
	.4byte	.LEFDE58-.LASFDE58
.LASFDE58:
	.4byte	.Lframe0
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.byte	0x4
	.4byte	.LCFI83-.LFB29
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI84-.LCFI83
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI85-.LCFI84
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE58:
.LSFDE60:
	.4byte	.LEFDE60-.LASFDE60
.LASFDE60:
	.4byte	.Lframe0
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.byte	0x4
	.4byte	.LCFI86-.LFB30
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI87-.LCFI86
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI88-.LCFI87
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE60:
.LSFDE62:
	.4byte	.LEFDE62-.LASFDE62
.LASFDE62:
	.4byte	.Lframe0
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.byte	0x4
	.4byte	.LCFI89-.LFB31
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE62:
.LSFDE64:
	.4byte	.LEFDE64-.LASFDE64
.LASFDE64:
	.4byte	.Lframe0
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.byte	0x4
	.4byte	.LCFI90-.LFB32
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI91-.LCFI90
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI92-.LCFI91
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE64:
.LSFDE66:
	.4byte	.LEFDE66-.LASFDE66
.LASFDE66:
	.4byte	.Lframe0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x4
	.4byte	.LCFI93-.LFB33
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI94-.LCFI93
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI95-.LCFI94
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE66:
.LSFDE68:
	.4byte	.LEFDE68-.LASFDE68
.LASFDE68:
	.4byte	.Lframe0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.byte	0x4
	.4byte	.LCFI96-.LFB34
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI97-.LCFI96
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI98-.LCFI97
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE68:
.LSFDE70:
	.4byte	.LEFDE70-.LASFDE70
.LASFDE70:
	.4byte	.Lframe0
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.byte	0x4
	.4byte	.LCFI99-.LFB35
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI100-.LCFI99
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE70:
	.text
.Letext0:
	.file 2 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x115b
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF640
	.byte	0xc
	.4byte	.LASF641
	.4byte	.LASF642
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.4byte	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.4byte	.LASF568
	.uleb128 0x5
	.byte	0x4
	.4byte	0x3f
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF569
	.uleb128 0x6
	.4byte	0x3f
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF570
	.uleb128 0x7
	.4byte	0x4b
	.uleb128 0x5
	.byte	0x4
	.4byte	0x46
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF571
	.uleb128 0x4
	.byte	0x2
	.byte	0x7
	.4byte	.LASF572
	.uleb128 0x4
	.byte	0x8
	.byte	0x5
	.4byte	.LASF573
	.uleb128 0x8
	.byte	0x18
	.byte	0x2
	.byte	0x8b
	.byte	0x9
	.4byte	0xca
	.uleb128 0x9
	.4byte	.LASF574
	.byte	0x2
	.byte	0x8c
	.byte	0x16
	.4byte	0x57
	.byte	0
	.uleb128 0x9
	.4byte	.LASF575
	.byte	0x2
	.byte	0x8d
	.byte	0x16
	.4byte	0x39
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF576
	.byte	0x2
	.byte	0x8e
	.byte	0x16
	.4byte	0x4b
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF577
	.byte	0x2
	.byte	0x8f
	.byte	0x16
	.4byte	0x4b
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF578
	.byte	0x2
	.byte	0x90
	.byte	0x16
	.4byte	0x52
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF579
	.byte	0x2
	.byte	0x91
	.byte	0x16
	.4byte	0x4b
	.byte	0x14
	.byte	0
	.uleb128 0xa
	.4byte	.LASF580
	.byte	0x2
	.byte	0x92
	.byte	0x3
	.4byte	0x72
	.uleb128 0x8
	.byte	0x18
	.byte	0x2
	.byte	0x98
	.byte	0x9
	.4byte	0x12e
	.uleb128 0x9
	.4byte	.LASF574
	.byte	0x2
	.byte	0x99
	.byte	0x16
	.4byte	0x57
	.byte	0
	.uleb128 0x9
	.4byte	.LASF575
	.byte	0x2
	.byte	0x9a
	.byte	0x16
	.4byte	0x39
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF576
	.byte	0x2
	.byte	0x9b
	.byte	0x16
	.4byte	0x4b
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF577
	.byte	0x2
	.byte	0x9c
	.byte	0x16
	.4byte	0x52
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF578
	.byte	0x2
	.byte	0x9d
	.byte	0x16
	.4byte	0x4b
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF579
	.byte	0x2
	.byte	0x9e
	.byte	0x16
	.4byte	0x4b
	.byte	0x14
	.byte	0
	.uleb128 0xa
	.4byte	.LASF581
	.byte	0x2
	.byte	0x9f
	.byte	0x3
	.4byte	0xd6
	.uleb128 0x8
	.byte	0xa8
	.byte	0x2
	.byte	0xa6
	.byte	0x9
	.4byte	0x185
	.uleb128 0x9
	.4byte	.LASF582
	.byte	0x2
	.byte	0xa7
	.byte	0x1b
	.4byte	0x185
	.byte	0
	.uleb128 0x9
	.4byte	.LASF583
	.byte	0x2
	.byte	0xa8
	.byte	0x1b
	.4byte	0x2b
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF584
	.byte	0x2
	.byte	0xa9
	.byte	0x1b
	.4byte	0x2b
	.byte	0x14
	.uleb128 0xb
	.ascii	"aUp\000"
	.byte	0x2
	.byte	0xaa
	.byte	0x1b
	.4byte	0x195
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF585
	.byte	0x2
	.byte	0xab
	.byte	0x1b
	.4byte	0x1a5
	.byte	0x60
	.byte	0
	.uleb128 0xc
	.4byte	0x3f
	.4byte	0x195
	.uleb128 0xd
	.4byte	0x4b
	.byte	0xf
	.byte	0
	.uleb128 0xc
	.4byte	0xca
	.4byte	0x1a5
	.uleb128 0xd
	.4byte	0x4b
	.byte	0x2
	.byte	0
	.uleb128 0xc
	.4byte	0x12e
	.4byte	0x1b5
	.uleb128 0xd
	.4byte	0x4b
	.byte	0x2
	.byte	0
	.uleb128 0xa
	.4byte	.LASF586
	.byte	0x2
	.byte	0xac
	.byte	0x3
	.4byte	0x13a
	.uleb128 0xe
	.4byte	.LASF643
	.byte	0x2
	.byte	0xb4
	.byte	0x16
	.4byte	0x1b5
	.uleb128 0xc
	.4byte	0x5d
	.4byte	0x1dd
	.uleb128 0xd
	.4byte	0x4b
	.byte	0xf
	.byte	0
	.uleb128 0xf
	.4byte	.LASF587
	.byte	0x1
	.byte	0xed
	.byte	0x16
	.4byte	0x1cd
	.uleb128 0x5
	.byte	0x3
	.4byte	_aTerminalId
	.uleb128 0x10
	.4byte	0x1c1
	.byte	0x1
	.byte	0xf8
	.byte	0x1
	.uleb128 0x5
	.byte	0x3
	.4byte	_SEGGER_RTT
	.uleb128 0xc
	.4byte	0x3f
	.4byte	0x20e
	.uleb128 0x11
	.4byte	0x4b
	.2byte	0xfff
	.byte	0
	.uleb128 0xf
	.4byte	.LASF588
	.byte	0x1
	.byte	0xfa
	.byte	0x1
	.4byte	0x1fd
	.uleb128 0x5
	.byte	0x3
	.4byte	_acUpBuffer
	.uleb128 0xf
	.4byte	.LASF589
	.byte	0x1
	.byte	0xfb
	.byte	0x1
	.4byte	0x185
	.uleb128 0x5
	.byte	0x3
	.4byte	_acDownBuffer
	.uleb128 0xf
	.4byte	.LASF590
	.byte	0x1
	.byte	0xfd
	.byte	0x16
	.4byte	0x5d
	.uleb128 0x5
	.byte	0x3
	.4byte	_ActiveTerminal
	.uleb128 0x12
	.4byte	.LASF591
	.byte	0x1
	.2byte	0x7c7
	.byte	0xa
	.4byte	0x4b
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x29e
	.uleb128 0x13
	.4byte	.LASF593
	.byte	0x1
	.2byte	0x7c7
	.byte	0x2f
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LASF578
	.byte	0x1
	.2byte	0x7c8
	.byte	0xc
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x14
	.4byte	.LASF577
	.byte	0x1
	.2byte	0x7c9
	.byte	0xc
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.ascii	"r\000"
	.byte	0x1
	.2byte	0x7ca
	.byte	0xc
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x16
	.4byte	.LASF592
	.byte	0x1
	.2byte	0x7b5
	.byte	0xa
	.4byte	0x4b
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2ca
	.uleb128 0x13
	.4byte	.LASF593
	.byte	0x1
	.2byte	0x7b5
	.byte	0x32
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x16
	.4byte	.LASF594
	.byte	0x1
	.2byte	0x75d
	.byte	0x5
	.4byte	0x2b
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x35e
	.uleb128 0x13
	.4byte	.LASF595
	.byte	0x1
	.2byte	0x75d
	.byte	0x2b
	.4byte	0x5d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -33
	.uleb128 0x17
	.ascii	"s\000"
	.byte	0x1
	.2byte	0x75d
	.byte	0x43
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x14
	.4byte	.LASF596
	.byte	0x1
	.2byte	0x75e
	.byte	0x19
	.4byte	0x2b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF597
	.byte	0x1
	.2byte	0x75f
	.byte	0x19
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LASF598
	.byte	0x1
	.2byte	0x760
	.byte	0x19
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.4byte	.LASF599
	.byte	0x1
	.2byte	0x761
	.byte	0x19
	.4byte	0x35e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x18
	.4byte	.LBB17
	.4byte	.LBE17-.LBB17
	.uleb128 0x14
	.4byte	.LASF600
	.byte	0x1
	.2byte	0x774
	.byte	0x5
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.4byte	0xca
	.uleb128 0x16
	.4byte	.LASF601
	.byte	0x1
	.2byte	0x72b
	.byte	0x5
	.4byte	0x2b
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3e7
	.uleb128 0x13
	.4byte	.LASF595
	.byte	0x1
	.2byte	0x72b
	.byte	0x2b
	.4byte	0x5d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -33
	.uleb128 0x15
	.ascii	"ac\000"
	.byte	0x1
	.2byte	0x72c
	.byte	0x19
	.4byte	0x3e7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.4byte	.LASF599
	.byte	0x1
	.2byte	0x72d
	.byte	0x19
	.4byte	0x35e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x14
	.4byte	.LASF598
	.byte	0x1
	.2byte	0x72e
	.byte	0xc
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x15
	.ascii	"r\000"
	.byte	0x1
	.2byte	0x72f
	.byte	0x7
	.4byte	0x2b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x18
	.4byte	.LBB16
	.4byte	.LBE16-.LBB16
	.uleb128 0x14
	.4byte	.LASF600
	.byte	0x1
	.2byte	0x738
	.byte	0x5
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	0x5d
	.4byte	0x3f7
	.uleb128 0xd
	.4byte	0x4b
	.byte	0x1
	.byte	0
	.uleb128 0x19
	.4byte	.LASF644
	.byte	0x1
	.2byte	0x719
	.byte	0x6
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x16
	.4byte	.LASF602
	.byte	0x1
	.2byte	0x701
	.byte	0x5
	.4byte	0x2b
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x46e
	.uleb128 0x13
	.4byte	.LASF593
	.byte	0x1
	.2byte	0x701
	.byte	0x2c
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.4byte	.LASF579
	.byte	0x1
	.2byte	0x701
	.byte	0x42
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x15
	.ascii	"r\000"
	.byte	0x1
	.2byte	0x702
	.byte	0x7
	.4byte	0x2b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x18
	.4byte	.LBB15
	.4byte	.LBE15-.LBB15
	.uleb128 0x14
	.4byte	.LASF600
	.byte	0x1
	.2byte	0x706
	.byte	0x5
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF603
	.byte	0x1
	.2byte	0x6e2
	.byte	0x5
	.4byte	0x2b
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4d2
	.uleb128 0x13
	.4byte	.LASF593
	.byte	0x1
	.2byte	0x6e2
	.byte	0x2a
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.4byte	.LASF579
	.byte	0x1
	.2byte	0x6e2
	.byte	0x40
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x15
	.ascii	"r\000"
	.byte	0x1
	.2byte	0x6e3
	.byte	0x7
	.4byte	0x2b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x18
	.4byte	.LBB14
	.4byte	.LBE14-.LBB14
	.uleb128 0x14
	.4byte	.LASF600
	.byte	0x1
	.2byte	0x6e7
	.byte	0x5
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF604
	.byte	0x1
	.2byte	0x6c3
	.byte	0x5
	.4byte	0x2b
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x536
	.uleb128 0x13
	.4byte	.LASF593
	.byte	0x1
	.2byte	0x6c3
	.byte	0x2b
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.4byte	.LASF574
	.byte	0x1
	.2byte	0x6c3
	.byte	0x44
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x15
	.ascii	"r\000"
	.byte	0x1
	.2byte	0x6c4
	.byte	0x7
	.4byte	0x2b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x18
	.4byte	.LBB13
	.4byte	.LBE13-.LBB13
	.uleb128 0x14
	.4byte	.LASF600
	.byte	0x1
	.2byte	0x6c8
	.byte	0x5
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF605
	.byte	0x1
	.2byte	0x6a4
	.byte	0x5
	.4byte	0x2b
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x59a
	.uleb128 0x13
	.4byte	.LASF593
	.byte	0x1
	.2byte	0x6a4
	.byte	0x29
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.4byte	.LASF574
	.byte	0x1
	.2byte	0x6a4
	.byte	0x42
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x15
	.ascii	"r\000"
	.byte	0x1
	.2byte	0x6a5
	.byte	0x7
	.4byte	0x2b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x18
	.4byte	.LBB12
	.4byte	.LBE12-.LBB12
	.uleb128 0x14
	.4byte	.LASF600
	.byte	0x1
	.2byte	0x6a9
	.byte	0x5
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF606
	.byte	0x1
	.2byte	0x67e
	.byte	0x5
	.4byte	0x2b
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x62e
	.uleb128 0x13
	.4byte	.LASF593
	.byte	0x1
	.2byte	0x67e
	.byte	0x2a
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.4byte	.LASF574
	.byte	0x1
	.2byte	0x67e
	.byte	0x43
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.4byte	.LASF575
	.byte	0x1
	.2byte	0x67e
	.byte	0x50
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.4byte	.LASF607
	.byte	0x1
	.2byte	0x67e
	.byte	0x62
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x13
	.4byte	.LASF579
	.byte	0x1
	.2byte	0x67e
	.byte	0x77
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.ascii	"r\000"
	.byte	0x1
	.2byte	0x67f
	.byte	0x7
	.4byte	0x2b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x18
	.4byte	.LBB11
	.4byte	.LBE11-.LBB11
	.uleb128 0x14
	.4byte	.LASF600
	.byte	0x1
	.2byte	0x683
	.byte	0x5
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF608
	.byte	0x1
	.2byte	0x64f
	.byte	0x5
	.4byte	0x2b
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6c2
	.uleb128 0x13
	.4byte	.LASF593
	.byte	0x1
	.2byte	0x64f
	.byte	0x28
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.4byte	.LASF574
	.byte	0x1
	.2byte	0x64f
	.byte	0x41
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.4byte	.LASF575
	.byte	0x1
	.2byte	0x64f
	.byte	0x4e
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.4byte	.LASF607
	.byte	0x1
	.2byte	0x64f
	.byte	0x60
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x13
	.4byte	.LASF579
	.byte	0x1
	.2byte	0x64f
	.byte	0x75
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.ascii	"r\000"
	.byte	0x1
	.2byte	0x650
	.byte	0x7
	.4byte	0x2b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x18
	.4byte	.LBB10
	.4byte	.LBE10-.LBB10
	.uleb128 0x14
	.4byte	.LASF600
	.byte	0x1
	.2byte	0x654
	.byte	0x5
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF609
	.byte	0x1
	.2byte	0x61c
	.byte	0x5
	.4byte	0x2b
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x748
	.uleb128 0x13
	.4byte	.LASF574
	.byte	0x1
	.2byte	0x61c
	.byte	0x2a
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.4byte	.LASF575
	.byte	0x1
	.2byte	0x61c
	.byte	0x37
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.4byte	.LASF607
	.byte	0x1
	.2byte	0x61c
	.byte	0x49
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.4byte	.LASF579
	.byte	0x1
	.2byte	0x61c
	.byte	0x5e
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.4byte	.LASF593
	.byte	0x1
	.2byte	0x61d
	.byte	0x7
	.4byte	0x2b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x18
	.4byte	.LBB9
	.4byte	.LBE9-.LBB9
	.uleb128 0x14
	.4byte	.LASF600
	.byte	0x1
	.2byte	0x620
	.byte	0x3
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF610
	.byte	0x1
	.2byte	0x5ef
	.byte	0x5
	.4byte	0x2b
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7ce
	.uleb128 0x13
	.4byte	.LASF574
	.byte	0x1
	.2byte	0x5ef
	.byte	0x2c
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.4byte	.LASF575
	.byte	0x1
	.2byte	0x5ef
	.byte	0x39
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.4byte	.LASF607
	.byte	0x1
	.2byte	0x5ef
	.byte	0x4b
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.4byte	.LASF579
	.byte	0x1
	.2byte	0x5ef
	.byte	0x60
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.4byte	.LASF593
	.byte	0x1
	.2byte	0x5f0
	.byte	0x7
	.4byte	0x2b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x18
	.4byte	.LBB8
	.4byte	.LBE8-.LBB8
	.uleb128 0x14
	.4byte	.LASF600
	.byte	0x1
	.2byte	0x5f3
	.byte	0x3
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	.LASF611
	.byte	0x1
	.2byte	0x5d3
	.byte	0xa
	.4byte	0x4b
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x818
	.uleb128 0x13
	.4byte	.LASF593
	.byte	0x1
	.2byte	0x5d3
	.byte	0x28
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF599
	.byte	0x1
	.2byte	0x5d4
	.byte	0x19
	.4byte	0x35e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x15
	.ascii	"v\000"
	.byte	0x1
	.2byte	0x5d5
	.byte	0x1b
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x12
	.4byte	.LASF612
	.byte	0x1
	.2byte	0x5be
	.byte	0xa
	.4byte	0x4b
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x862
	.uleb128 0x13
	.4byte	.LASF593
	.byte	0x1
	.2byte	0x5be
	.byte	0x26
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF599
	.byte	0x1
	.2byte	0x5bf
	.byte	0x1b
	.4byte	0x862
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x15
	.ascii	"v\000"
	.byte	0x1
	.2byte	0x5c0
	.byte	0x1b
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.4byte	0x12e
	.uleb128 0x16
	.4byte	.LASF613
	.byte	0x1
	.2byte	0x5a4
	.byte	0x5
	.4byte	0x2b
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8a2
	.uleb128 0x14
	.4byte	.LASF578
	.byte	0x1
	.2byte	0x5a5
	.byte	0xc
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x15
	.ascii	"r\000"
	.byte	0x1
	.2byte	0x5a6
	.byte	0x7
	.4byte	0x2b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x16
	.4byte	.LASF614
	.byte	0x1
	.2byte	0x58d
	.byte	0x5
	.4byte	0x2b
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8cc
	.uleb128 0x15
	.ascii	"r\000"
	.byte	0x1
	.2byte	0x58e
	.byte	0x7
	.4byte	0x2b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x16
	.4byte	.LASF615
	.byte	0x1
	.2byte	0x571
	.byte	0x5
	.4byte	0x2b
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x904
	.uleb128 0x15
	.ascii	"c\000"
	.byte	0x1
	.2byte	0x572
	.byte	0x8
	.4byte	0x3f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x15
	.ascii	"r\000"
	.byte	0x1
	.2byte	0x573
	.byte	0x7
	.4byte	0x2b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x16
	.4byte	.LASF616
	.byte	0x1
	.2byte	0x534
	.byte	0xa
	.4byte	0x4b
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x988
	.uleb128 0x13
	.4byte	.LASF593
	.byte	0x1
	.2byte	0x534
	.byte	0x26
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x17
	.ascii	"c\000"
	.byte	0x1
	.2byte	0x534
	.byte	0x38
	.4byte	0x3f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x14
	.4byte	.LASF599
	.byte	0x1
	.2byte	0x535
	.byte	0x19
	.4byte	0x35e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.4byte	.LASF577
	.byte	0x1
	.2byte	0x536
	.byte	0x19
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF596
	.byte	0x1
	.2byte	0x537
	.byte	0x19
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x18
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.uleb128 0x14
	.4byte	.LASF600
	.byte	0x1
	.2byte	0x53c
	.byte	0x3
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF617
	.byte	0x1
	.2byte	0x4fc
	.byte	0xa
	.4byte	0x4b
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa0c
	.uleb128 0x13
	.4byte	.LASF593
	.byte	0x1
	.2byte	0x4fc
	.byte	0x2a
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x17
	.ascii	"c\000"
	.byte	0x1
	.2byte	0x4fc
	.byte	0x3c
	.4byte	0x3f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x14
	.4byte	.LASF599
	.byte	0x1
	.2byte	0x4fd
	.byte	0x19
	.4byte	0x35e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.4byte	.LASF577
	.byte	0x1
	.2byte	0x4fe
	.byte	0x19
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF596
	.byte	0x1
	.2byte	0x4ff
	.byte	0x19
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x18
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.uleb128 0x14
	.4byte	.LASF600
	.byte	0x1
	.2byte	0x504
	.byte	0x3
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	.LASF618
	.byte	0x1
	.2byte	0x4cd
	.byte	0xa
	.4byte	0x4b
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa76
	.uleb128 0x13
	.4byte	.LASF593
	.byte	0x1
	.2byte	0x4cd
	.byte	0x30
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x17
	.ascii	"c\000"
	.byte	0x1
	.2byte	0x4cd
	.byte	0x42
	.4byte	0x3f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x14
	.4byte	.LASF599
	.byte	0x1
	.2byte	0x4ce
	.byte	0x19
	.4byte	0x35e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF577
	.byte	0x1
	.2byte	0x4cf
	.byte	0x19
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x14
	.4byte	.LASF596
	.byte	0x1
	.2byte	0x4d0
	.byte	0x19
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x16
	.4byte	.LASF619
	.byte	0x1
	.2byte	0x4af
	.byte	0xa
	.4byte	0x4b
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xac0
	.uleb128 0x13
	.4byte	.LASF593
	.byte	0x1
	.2byte	0x4af
	.byte	0x2a
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x17
	.ascii	"s\000"
	.byte	0x1
	.2byte	0x4af
	.byte	0x43
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x15
	.ascii	"Len\000"
	.byte	0x1
	.2byte	0x4b0
	.byte	0xc
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x16
	.4byte	.LASF620
	.byte	0x1
	.2byte	0x48a
	.byte	0xa
	.4byte	0x4b
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb36
	.uleb128 0x13
	.4byte	.LASF593
	.byte	0x1
	.2byte	0x48a
	.byte	0x24
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.4byte	.LASF575
	.byte	0x1
	.2byte	0x48a
	.byte	0x3d
	.4byte	0xb36
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.4byte	.LASF621
	.byte	0x1
	.2byte	0x48a
	.byte	0x4f
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.4byte	.LASF596
	.byte	0x1
	.2byte	0x48b
	.byte	0xc
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x18
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.uleb128 0x14
	.4byte	.LASF600
	.byte	0x1
	.2byte	0x48e
	.byte	0x3
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.4byte	0xb3c
	.uleb128 0x1a
	.uleb128 0x16
	.4byte	.LASF622
	.byte	0x1
	.2byte	0x466
	.byte	0xa
	.4byte	0x4b
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbb3
	.uleb128 0x13
	.4byte	.LASF593
	.byte	0x1
	.2byte	0x466
	.byte	0x2e
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.4byte	.LASF575
	.byte	0x1
	.2byte	0x466
	.byte	0x47
	.4byte	0xb36
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.4byte	.LASF621
	.byte	0x1
	.2byte	0x466
	.byte	0x59
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.4byte	.LASF596
	.byte	0x1
	.2byte	0x467
	.byte	0xc
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x18
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x14
	.4byte	.LASF600
	.byte	0x1
	.2byte	0x46a
	.byte	0x3
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF623
	.byte	0x1
	.2byte	0x419
	.byte	0xa
	.4byte	0x4b
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc3f
	.uleb128 0x13
	.4byte	.LASF593
	.byte	0x1
	.2byte	0x419
	.byte	0x2a
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.4byte	.LASF575
	.byte	0x1
	.2byte	0x419
	.byte	0x43
	.4byte	0xb36
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x13
	.4byte	.LASF621
	.byte	0x1
	.2byte	0x419
	.byte	0x55
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x14
	.4byte	.LASF596
	.byte	0x1
	.2byte	0x41a
	.byte	0x19
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF598
	.byte	0x1
	.2byte	0x41b
	.byte	0x19
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.4byte	.LASF624
	.byte	0x1
	.2byte	0x41c
	.byte	0x19
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x14
	.4byte	.LASF599
	.byte	0x1
	.2byte	0x41d
	.byte	0x19
	.4byte	0x35e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x16
	.4byte	.LASF625
	.byte	0x1
	.2byte	0x3cd
	.byte	0xa
	.4byte	0x4b
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xccb
	.uleb128 0x13
	.4byte	.LASF593
	.byte	0x1
	.2byte	0x3cd
	.byte	0x34
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.4byte	.LASF575
	.byte	0x1
	.2byte	0x3cd
	.byte	0x4d
	.4byte	0xb36
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x13
	.4byte	.LASF621
	.byte	0x1
	.2byte	0x3cd
	.byte	0x5f
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x14
	.4byte	.LASF596
	.byte	0x1
	.2byte	0x3ce
	.byte	0x1b
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF598
	.byte	0x1
	.2byte	0x3cf
	.byte	0x1b
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.4byte	.LASF624
	.byte	0x1
	.2byte	0x3d0
	.byte	0x1b
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x14
	.4byte	.LASF599
	.byte	0x1
	.2byte	0x3d1
	.byte	0x1b
	.4byte	0x35e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF645
	.byte	0x1
	.2byte	0x315
	.byte	0x6
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd43
	.uleb128 0x13
	.4byte	.LASF593
	.byte	0x1
	.2byte	0x315
	.byte	0x33
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.4byte	.LASF575
	.byte	0x1
	.2byte	0x315
	.byte	0x4c
	.4byte	0xb36
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x13
	.4byte	.LASF621
	.byte	0x1
	.2byte	0x315
	.byte	0x5e
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x14
	.4byte	.LASF624
	.byte	0x1
	.2byte	0x316
	.byte	0x19
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF599
	.byte	0x1
	.2byte	0x317
	.byte	0x19
	.4byte	0x35e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LASF598
	.byte	0x1
	.2byte	0x318
	.byte	0x19
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x16
	.4byte	.LASF626
	.byte	0x1
	.2byte	0x2ee
	.byte	0xa
	.4byte	0x4b
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xdb9
	.uleb128 0x13
	.4byte	.LASF593
	.byte	0x1
	.2byte	0x2ee
	.byte	0x23
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.4byte	.LASF575
	.byte	0x1
	.2byte	0x2ee
	.byte	0x36
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.4byte	.LASF607
	.byte	0x1
	.2byte	0x2ee
	.byte	0x48
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.4byte	.LASF627
	.byte	0x1
	.2byte	0x2ef
	.byte	0xc
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x18
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x14
	.4byte	.LASF600
	.byte	0x1
	.2byte	0x2f1
	.byte	0x3
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF628
	.byte	0x1
	.2byte	0x2ce
	.byte	0xa
	.4byte	0x4b
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe2f
	.uleb128 0x13
	.4byte	.LASF593
	.byte	0x1
	.2byte	0x2ce
	.byte	0x2b
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.4byte	.LASF575
	.byte	0x1
	.2byte	0x2ce
	.byte	0x3e
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.4byte	.LASF607
	.byte	0x1
	.2byte	0x2ce
	.byte	0x50
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.4byte	.LASF627
	.byte	0x1
	.2byte	0x2cf
	.byte	0xc
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x18
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x14
	.4byte	.LASF600
	.byte	0x1
	.2byte	0x2d1
	.byte	0x3
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF629
	.byte	0x1
	.2byte	0x26b
	.byte	0xa
	.4byte	0x4b
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xedb
	.uleb128 0x13
	.4byte	.LASF593
	.byte	0x1
	.2byte	0x26b
	.byte	0x29
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x13
	.4byte	.LASF624
	.byte	0x1
	.2byte	0x26b
	.byte	0x3c
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x13
	.4byte	.LASF607
	.byte	0x1
	.2byte	0x26b
	.byte	0x4c
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x14
	.4byte	.LASF630
	.byte	0x1
	.2byte	0x26c
	.byte	0x1b
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.4byte	.LASF627
	.byte	0x1
	.2byte	0x26d
	.byte	0x1b
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF578
	.byte	0x1
	.2byte	0x26e
	.byte	0x1b
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x14
	.4byte	.LASF577
	.byte	0x1
	.2byte	0x26f
	.byte	0x1b
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.4byte	.LASF575
	.byte	0x1
	.2byte	0x270
	.byte	0x1b
	.4byte	0xedb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LASF599
	.byte	0x1
	.2byte	0x271
	.byte	0x1b
	.4byte	0x862
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.4byte	0x5d
	.uleb128 0x16
	.4byte	.LASF631
	.byte	0x1
	.2byte	0x20d
	.byte	0xa
	.4byte	0x4b
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf8d
	.uleb128 0x13
	.4byte	.LASF593
	.byte	0x1
	.2byte	0x20d
	.byte	0x31
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x13
	.4byte	.LASF624
	.byte	0x1
	.2byte	0x20d
	.byte	0x44
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x13
	.4byte	.LASF607
	.byte	0x1
	.2byte	0x20d
	.byte	0x54
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x14
	.4byte	.LASF630
	.byte	0x1
	.2byte	0x20e
	.byte	0x1b
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.4byte	.LASF627
	.byte	0x1
	.2byte	0x20f
	.byte	0x1b
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF578
	.byte	0x1
	.2byte	0x210
	.byte	0x1b
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x14
	.4byte	.LASF577
	.byte	0x1
	.2byte	0x211
	.byte	0x1b
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.4byte	.LASF575
	.byte	0x1
	.2byte	0x212
	.byte	0x1b
	.4byte	0xedb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LASF599
	.byte	0x1
	.2byte	0x213
	.byte	0x1b
	.4byte	0x35e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF635
	.byte	0x1
	.2byte	0x1df
	.byte	0x11
	.4byte	0x4b
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xfe7
	.uleb128 0x13
	.4byte	.LASF599
	.byte	0x1
	.2byte	0x1df
	.byte	0x3b
	.4byte	0x35e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LASF578
	.byte	0x1
	.2byte	0x1e0
	.byte	0xc
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x14
	.4byte	.LASF577
	.byte	0x1
	.2byte	0x1e1
	.byte	0xc
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.ascii	"r\000"
	.byte	0x1
	.2byte	0x1e2
	.byte	0xc
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF632
	.byte	0x1
	.2byte	0x1c9
	.byte	0xd
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x102e
	.uleb128 0x13
	.4byte	.LASF599
	.byte	0x1
	.2byte	0x1c9
	.byte	0x37
	.4byte	0x35e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.4byte	.LASF595
	.byte	0x1
	.2byte	0x1c9
	.byte	0x4c
	.4byte	0x5d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x15
	.ascii	"ac\000"
	.byte	0x1
	.2byte	0x1ca
	.byte	0x11
	.4byte	0x3e7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF633
	.byte	0x1
	.2byte	0x189
	.byte	0xd
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x10a6
	.uleb128 0x13
	.4byte	.LASF599
	.byte	0x1
	.2byte	0x189
	.byte	0x31
	.4byte	0x35e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.4byte	.LASF624
	.byte	0x1
	.2byte	0x189
	.byte	0x44
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x13
	.4byte	.LASF621
	.byte	0x1
	.2byte	0x189
	.byte	0x54
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x14
	.4byte	.LASF634
	.byte	0x1
	.2byte	0x18a
	.byte	0xc
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LASF577
	.byte	0x1
	.2byte	0x18b
	.byte	0xc
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.ascii	"Rem\000"
	.byte	0x1
	.2byte	0x18c
	.byte	0xc
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF636
	.byte	0x1
	.2byte	0x149
	.byte	0x11
	.4byte	0x4b
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1132
	.uleb128 0x13
	.4byte	.LASF599
	.byte	0x1
	.2byte	0x149
	.byte	0x36
	.4byte	0x35e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.4byte	.LASF575
	.byte	0x1
	.2byte	0x149
	.byte	0x49
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x13
	.4byte	.LASF621
	.byte	0x1
	.2byte	0x149
	.byte	0x5b
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x14
	.4byte	.LASF637
	.byte	0x1
	.2byte	0x14a
	.byte	0xc
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF638
	.byte	0x1
	.2byte	0x14b
	.byte	0xc
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x14
	.4byte	.LASF578
	.byte	0x1
	.2byte	0x14c
	.byte	0xc
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.4byte	.LASF577
	.byte	0x1
	.2byte	0x14d
	.byte	0xc
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF639
	.byte	0x1
	.2byte	0x112
	.byte	0xd
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1158
	.uleb128 0x15
	.ascii	"p\000"
	.byte	0x1
	.2byte	0x113
	.byte	0x12
	.4byte	0x1158
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.4byte	0x1b5
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x2134
	.uleb128 0x19
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.uleb128 0x2119
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x47d
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x115f
	.4byte	0x1dd
	.ascii	"_aTerminalId\000"
	.4byte	0x1ef
	.ascii	"_SEGGER_RTT\000"
	.4byte	0x20e
	.ascii	"_acUpBuffer\000"
	.4byte	0x220
	.ascii	"_acDownBuffer\000"
	.4byte	0x232
	.ascii	"_ActiveTerminal\000"
	.4byte	0x20e
	.ascii	"_acUpBuffer\000"
	.4byte	0x220
	.ascii	"_acDownBuffer\000"
	.4byte	0x232
	.ascii	"_ActiveTerminal\000"
	.4byte	0x1ef
	.ascii	"_SEGGER_RTT\000"
	.4byte	0x244
	.ascii	"SEGGER_RTT_GetBytesInBuffer\000"
	.4byte	0x29e
	.ascii	"SEGGER_RTT_GetAvailWriteSpace\000"
	.4byte	0x2ca
	.ascii	"SEGGER_RTT_TerminalOut\000"
	.4byte	0x364
	.ascii	"SEGGER_RTT_SetTerminal\000"
	.4byte	0x3f7
	.ascii	"SEGGER_RTT_Init\000"
	.4byte	0x40a
	.ascii	"SEGGER_RTT_SetFlagsDownBuffer\000"
	.4byte	0x46e
	.ascii	"SEGGER_RTT_SetFlagsUpBuffer\000"
	.4byte	0x4d2
	.ascii	"SEGGER_RTT_SetNameDownBuffer\000"
	.4byte	0x536
	.ascii	"SEGGER_RTT_SetNameUpBuffer\000"
	.4byte	0x59a
	.ascii	"SEGGER_RTT_ConfigDownBuffer\000"
	.4byte	0x62e
	.ascii	"SEGGER_RTT_ConfigUpBuffer\000"
	.4byte	0x6c2
	.ascii	"SEGGER_RTT_AllocUpBuffer\000"
	.4byte	0x748
	.ascii	"SEGGER_RTT_AllocDownBuffer\000"
	.4byte	0x7ce
	.ascii	"SEGGER_RTT_HasDataUp\000"
	.4byte	0x818
	.ascii	"SEGGER_RTT_HasData\000"
	.4byte	0x868
	.ascii	"SEGGER_RTT_HasKey\000"
	.4byte	0x8a2
	.ascii	"SEGGER_RTT_WaitKey\000"
	.4byte	0x8cc
	.ascii	"SEGGER_RTT_GetKey\000"
	.4byte	0x904
	.ascii	"SEGGER_RTT_PutChar\000"
	.4byte	0x988
	.ascii	"SEGGER_RTT_PutCharSkip\000"
	.4byte	0xa0c
	.ascii	"SEGGER_RTT_PutCharSkipNoLock\000"
	.4byte	0xa76
	.ascii	"SEGGER_RTT_WriteString\000"
	.4byte	0xac0
	.ascii	"SEGGER_RTT_Write\000"
	.4byte	0xb3d
	.ascii	"SEGGER_RTT_WriteDownBuffer\000"
	.4byte	0xbb3
	.ascii	"SEGGER_RTT_WriteNoLock\000"
	.4byte	0xc3f
	.ascii	"SEGGER_RTT_WriteDownBufferNoLock\000"
	.4byte	0xccb
	.ascii	"SEGGER_RTT_WriteWithOverwriteNoLock\000"
	.4byte	0xd43
	.ascii	"SEGGER_RTT_Read\000"
	.4byte	0xdb9
	.ascii	"SEGGER_RTT_ReadUpBuffer\000"
	.4byte	0xe2f
	.ascii	"SEGGER_RTT_ReadNoLock\000"
	.4byte	0xee1
	.ascii	"SEGGER_RTT_ReadUpBufferNoLock\000"
	.4byte	0xf8d
	.ascii	"_GetAvailWriteSpace\000"
	.4byte	0xfe7
	.ascii	"_PostTerminalSwitch\000"
	.4byte	0x102e
	.ascii	"_WriteNoCheck\000"
	.4byte	0x10a6
	.ascii	"_WriteBlocking\000"
	.4byte	0x1132
	.ascii	"_DoInit\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0xbe
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x115f
	.4byte	0x2b
	.ascii	"int\000"
	.4byte	0x32
	.ascii	"long int\000"
	.4byte	0x3f
	.ascii	"char\000"
	.4byte	0x4b
	.ascii	"unsigned int\000"
	.4byte	0x5d
	.ascii	"unsigned char\000"
	.4byte	0x64
	.ascii	"short unsigned int\000"
	.4byte	0x6b
	.ascii	"long long int\000"
	.4byte	0xca
	.ascii	"SEGGER_RTT_BUFFER_UP\000"
	.4byte	0x12e
	.ascii	"SEGGER_RTT_BUFFER_DOWN\000"
	.4byte	0x1b5
	.ascii	"SEGGER_RTT_CB\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x134
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LFB3
	.4byte	.LFE3
	.4byte	.LFB4
	.4byte	.LFE4
	.4byte	.LFB5
	.4byte	.LFE5
	.4byte	.LFB6
	.4byte	.LFE6
	.4byte	.LFB7
	.4byte	.LFE7
	.4byte	.LFB8
	.4byte	.LFE8
	.4byte	.LFB9
	.4byte	.LFE9
	.4byte	.LFB10
	.4byte	.LFE10
	.4byte	.LFB11
	.4byte	.LFE11
	.4byte	.LFB12
	.4byte	.LFE12
	.4byte	.LFB13
	.4byte	.LFE13
	.4byte	.LFB14
	.4byte	.LFE14
	.4byte	.LFB15
	.4byte	.LFE15
	.4byte	.LFB16
	.4byte	.LFE16
	.4byte	.LFB17
	.4byte	.LFE17
	.4byte	.LFB18
	.4byte	.LFE18
	.4byte	.LFB19
	.4byte	.LFE19
	.4byte	.LFB20
	.4byte	.LFE20
	.4byte	.LFB21
	.4byte	.LFE21
	.4byte	.LFB22
	.4byte	.LFE22
	.4byte	.LFB23
	.4byte	.LFE23
	.4byte	.LFB24
	.4byte	.LFE24
	.4byte	.LFB25
	.4byte	.LFE25
	.4byte	.LFB26
	.4byte	.LFE26
	.4byte	.LFB27
	.4byte	.LFE27
	.4byte	.LFB28
	.4byte	.LFE28
	.4byte	.LFB29
	.4byte	.LFE29
	.4byte	.LFB30
	.4byte	.LFE30
	.4byte	.LFB31
	.4byte	.LFE31
	.4byte	.LFB32
	.4byte	.LFE32
	.4byte	.LFB33
	.4byte	.LFE33
	.4byte	.LFB34
	.4byte	.LFE34
	.4byte	.LFB35
	.4byte	.LFE35
	.4byte	0
	.4byte	0
	.section	.debug_macro,"",%progbits
.Ldebug_macro0:
	.2byte	0x4
	.byte	0x2
	.4byte	.Ldebug_line0
	.byte	0x7
	.4byte	.Ldebug_macro2
	.byte	0x3
	.uleb128 0
	.uleb128 0x1
	.byte	0x3
	.uleb128 0x4c
	.uleb128 0x2
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF463
	.file 3 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT_Conf.h"
	.byte	0x3
	.uleb128 0x3c
	.uleb128 0x3
	.byte	0x7
	.4byte	.Ldebug_macro3
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro4
	.file 4 "/usr/share/crossworks_for_arm_4.8/include/stdlib.h"
	.byte	0x3
	.uleb128 0x76
	.uleb128 0x4
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF478
	.file 5 "/usr/share/crossworks_for_arm_4.8/include/__crossworks.h"
	.byte	0x3
	.uleb128 0xe
	.uleb128 0x5
	.byte	0x7
	.4byte	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro6
	.byte	0x4
	.file 6 "/usr/share/crossworks_for_arm_4.8/include/stdarg.h"
	.byte	0x3
	.uleb128 0x77
	.uleb128 0x6
	.byte	0x7
	.4byte	.Ldebug_macro7
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro8
	.byte	0x4
	.file 7 "/usr/share/crossworks_for_arm_4.8/include/string.h"
	.byte	0x3
	.uleb128 0x4e
	.uleb128 0x7
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF553
	.byte	0x4
	.byte	0x5
	.uleb128 0x6e
	.4byte	.LASF554
	.byte	0x5
	.uleb128 0x72
	.4byte	.LASF555
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF556
	.byte	0x5
	.uleb128 0x86
	.4byte	.LASF557
	.byte	0x5
	.uleb128 0x91
	.4byte	.LASF558
	.byte	0x5
	.uleb128 0x96
	.4byte	.LASF559
	.byte	0x5
	.uleb128 0x9a
	.4byte	.LASF560
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF561
	.byte	0x5
	.uleb128 0xc9
	.4byte	.LASF562
	.byte	0x5
	.uleb128 0xd0
	.4byte	.LASF563
	.byte	0x5
	.uleb128 0xd6
	.4byte	.LASF564
	.byte	0x5
	.uleb128 0xdd
	.4byte	.LASF565
	.byte	0x5
	.uleb128 0xe3
	.4byte	.LASF566
	.byte	0x5
	.uleb128 0x10f
	.4byte	.LASF567
	.byte	0x4
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.0.2b915612bc8179838c1319f8e005565f,comdat
.Ldebug_macro2:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0
	.4byte	.LASF0
	.byte	0x5
	.uleb128 0
	.4byte	.LASF1
	.byte	0x5
	.uleb128 0
	.4byte	.LASF2
	.byte	0x5
	.uleb128 0
	.4byte	.LASF3
	.byte	0x5
	.uleb128 0
	.4byte	.LASF4
	.byte	0x5
	.uleb128 0
	.4byte	.LASF5
	.byte	0x5
	.uleb128 0
	.4byte	.LASF6
	.byte	0x5
	.uleb128 0
	.4byte	.LASF7
	.byte	0x5
	.uleb128 0
	.4byte	.LASF8
	.byte	0x5
	.uleb128 0
	.4byte	.LASF9
	.byte	0x5
	.uleb128 0
	.4byte	.LASF10
	.byte	0x5
	.uleb128 0
	.4byte	.LASF11
	.byte	0x5
	.uleb128 0
	.4byte	.LASF12
	.byte	0x5
	.uleb128 0
	.4byte	.LASF13
	.byte	0x5
	.uleb128 0
	.4byte	.LASF14
	.byte	0x5
	.uleb128 0
	.4byte	.LASF15
	.byte	0x5
	.uleb128 0
	.4byte	.LASF16
	.byte	0x5
	.uleb128 0
	.4byte	.LASF17
	.byte	0x5
	.uleb128 0
	.4byte	.LASF18
	.byte	0x5
	.uleb128 0
	.4byte	.LASF19
	.byte	0x5
	.uleb128 0
	.4byte	.LASF20
	.byte	0x5
	.uleb128 0
	.4byte	.LASF21
	.byte	0x5
	.uleb128 0
	.4byte	.LASF22
	.byte	0x5
	.uleb128 0
	.4byte	.LASF23
	.byte	0x5
	.uleb128 0
	.4byte	.LASF24
	.byte	0x5
	.uleb128 0
	.4byte	.LASF25
	.byte	0x5
	.uleb128 0
	.4byte	.LASF26
	.byte	0x5
	.uleb128 0
	.4byte	.LASF27
	.byte	0x5
	.uleb128 0
	.4byte	.LASF28
	.byte	0x5
	.uleb128 0
	.4byte	.LASF29
	.byte	0x5
	.uleb128 0
	.4byte	.LASF30
	.byte	0x5
	.uleb128 0
	.4byte	.LASF31
	.byte	0x5
	.uleb128 0
	.4byte	.LASF32
	.byte	0x5
	.uleb128 0
	.4byte	.LASF33
	.byte	0x5
	.uleb128 0
	.4byte	.LASF34
	.byte	0x5
	.uleb128 0
	.4byte	.LASF35
	.byte	0x5
	.uleb128 0
	.4byte	.LASF36
	.byte	0x5
	.uleb128 0
	.4byte	.LASF37
	.byte	0x5
	.uleb128 0
	.4byte	.LASF38
	.byte	0x5
	.uleb128 0
	.4byte	.LASF39
	.byte	0x5
	.uleb128 0
	.4byte	.LASF40
	.byte	0x5
	.uleb128 0
	.4byte	.LASF41
	.byte	0x5
	.uleb128 0
	.4byte	.LASF42
	.byte	0x5
	.uleb128 0
	.4byte	.LASF43
	.byte	0x5
	.uleb128 0
	.4byte	.LASF44
	.byte	0x5
	.uleb128 0
	.4byte	.LASF45
	.byte	0x5
	.uleb128 0
	.4byte	.LASF46
	.byte	0x5
	.uleb128 0
	.4byte	.LASF47
	.byte	0x5
	.uleb128 0
	.4byte	.LASF48
	.byte	0x5
	.uleb128 0
	.4byte	.LASF49
	.byte	0x5
	.uleb128 0
	.4byte	.LASF50
	.byte	0x5
	.uleb128 0
	.4byte	.LASF51
	.byte	0x5
	.uleb128 0
	.4byte	.LASF52
	.byte	0x5
	.uleb128 0
	.4byte	.LASF53
	.byte	0x5
	.uleb128 0
	.4byte	.LASF54
	.byte	0x5
	.uleb128 0
	.4byte	.LASF55
	.byte	0x5
	.uleb128 0
	.4byte	.LASF56
	.byte	0x5
	.uleb128 0
	.4byte	.LASF57
	.byte	0x5
	.uleb128 0
	.4byte	.LASF58
	.byte	0x5
	.uleb128 0
	.4byte	.LASF59
	.byte	0x5
	.uleb128 0
	.4byte	.LASF60
	.byte	0x5
	.uleb128 0
	.4byte	.LASF61
	.byte	0x5
	.uleb128 0
	.4byte	.LASF62
	.byte	0x5
	.uleb128 0
	.4byte	.LASF63
	.byte	0x5
	.uleb128 0
	.4byte	.LASF64
	.byte	0x5
	.uleb128 0
	.4byte	.LASF65
	.byte	0x5
	.uleb128 0
	.4byte	.LASF66
	.byte	0x5
	.uleb128 0
	.4byte	.LASF67
	.byte	0x5
	.uleb128 0
	.4byte	.LASF68
	.byte	0x5
	.uleb128 0
	.4byte	.LASF69
	.byte	0x5
	.uleb128 0
	.4byte	.LASF70
	.byte	0x5
	.uleb128 0
	.4byte	.LASF71
	.byte	0x5
	.uleb128 0
	.4byte	.LASF72
	.byte	0x5
	.uleb128 0
	.4byte	.LASF73
	.byte	0x5
	.uleb128 0
	.4byte	.LASF74
	.byte	0x5
	.uleb128 0
	.4byte	.LASF75
	.byte	0x5
	.uleb128 0
	.4byte	.LASF76
	.byte	0x5
	.uleb128 0
	.4byte	.LASF77
	.byte	0x5
	.uleb128 0
	.4byte	.LASF78
	.byte	0x5
	.uleb128 0
	.4byte	.LASF79
	.byte	0x5
	.uleb128 0
	.4byte	.LASF80
	.byte	0x5
	.uleb128 0
	.4byte	.LASF81
	.byte	0x5
	.uleb128 0
	.4byte	.LASF82
	.byte	0x5
	.uleb128 0
	.4byte	.LASF83
	.byte	0x5
	.uleb128 0
	.4byte	.LASF84
	.byte	0x5
	.uleb128 0
	.4byte	.LASF85
	.byte	0x5
	.uleb128 0
	.4byte	.LASF86
	.byte	0x5
	.uleb128 0
	.4byte	.LASF87
	.byte	0x5
	.uleb128 0
	.4byte	.LASF88
	.byte	0x5
	.uleb128 0
	.4byte	.LASF89
	.byte	0x5
	.uleb128 0
	.4byte	.LASF90
	.byte	0x5
	.uleb128 0
	.4byte	.LASF91
	.byte	0x5
	.uleb128 0
	.4byte	.LASF92
	.byte	0x5
	.uleb128 0
	.4byte	.LASF93
	.byte	0x5
	.uleb128 0
	.4byte	.LASF94
	.byte	0x5
	.uleb128 0
	.4byte	.LASF95
	.byte	0x5
	.uleb128 0
	.4byte	.LASF96
	.byte	0x5
	.uleb128 0
	.4byte	.LASF97
	.byte	0x5
	.uleb128 0
	.4byte	.LASF98
	.byte	0x5
	.uleb128 0
	.4byte	.LASF99
	.byte	0x5
	.uleb128 0
	.4byte	.LASF100
	.byte	0x5
	.uleb128 0
	.4byte	.LASF101
	.byte	0x5
	.uleb128 0
	.4byte	.LASF102
	.byte	0x5
	.uleb128 0
	.4byte	.LASF103
	.byte	0x5
	.uleb128 0
	.4byte	.LASF104
	.byte	0x5
	.uleb128 0
	.4byte	.LASF105
	.byte	0x5
	.uleb128 0
	.4byte	.LASF106
	.byte	0x5
	.uleb128 0
	.4byte	.LASF107
	.byte	0x5
	.uleb128 0
	.4byte	.LASF108
	.byte	0x5
	.uleb128 0
	.4byte	.LASF109
	.byte	0x5
	.uleb128 0
	.4byte	.LASF110
	.byte	0x5
	.uleb128 0
	.4byte	.LASF111
	.byte	0x5
	.uleb128 0
	.4byte	.LASF112
	.byte	0x5
	.uleb128 0
	.4byte	.LASF113
	.byte	0x5
	.uleb128 0
	.4byte	.LASF114
	.byte	0x5
	.uleb128 0
	.4byte	.LASF115
	.byte	0x5
	.uleb128 0
	.4byte	.LASF116
	.byte	0x5
	.uleb128 0
	.4byte	.LASF117
	.byte	0x5
	.uleb128 0
	.4byte	.LASF118
	.byte	0x5
	.uleb128 0
	.4byte	.LASF119
	.byte	0x5
	.uleb128 0
	.4byte	.LASF120
	.byte	0x5
	.uleb128 0
	.4byte	.LASF121
	.byte	0x5
	.uleb128 0
	.4byte	.LASF122
	.byte	0x5
	.uleb128 0
	.4byte	.LASF123
	.byte	0x5
	.uleb128 0
	.4byte	.LASF124
	.byte	0x5
	.uleb128 0
	.4byte	.LASF125
	.byte	0x5
	.uleb128 0
	.4byte	.LASF126
	.byte	0x5
	.uleb128 0
	.4byte	.LASF127
	.byte	0x5
	.uleb128 0
	.4byte	.LASF128
	.byte	0x5
	.uleb128 0
	.4byte	.LASF129
	.byte	0x5
	.uleb128 0
	.4byte	.LASF130
	.byte	0x5
	.uleb128 0
	.4byte	.LASF131
	.byte	0x5
	.uleb128 0
	.4byte	.LASF132
	.byte	0x5
	.uleb128 0
	.4byte	.LASF133
	.byte	0x5
	.uleb128 0
	.4byte	.LASF134
	.byte	0x5
	.uleb128 0
	.4byte	.LASF135
	.byte	0x5
	.uleb128 0
	.4byte	.LASF136
	.byte	0x5
	.uleb128 0
	.4byte	.LASF137
	.byte	0x5
	.uleb128 0
	.4byte	.LASF138
	.byte	0x5
	.uleb128 0
	.4byte	.LASF139
	.byte	0x5
	.uleb128 0
	.4byte	.LASF140
	.byte	0x5
	.uleb128 0
	.4byte	.LASF141
	.byte	0x5
	.uleb128 0
	.4byte	.LASF142
	.byte	0x5
	.uleb128 0
	.4byte	.LASF143
	.byte	0x5
	.uleb128 0
	.4byte	.LASF144
	.byte	0x5
	.uleb128 0
	.4byte	.LASF145
	.byte	0x5
	.uleb128 0
	.4byte	.LASF146
	.byte	0x5
	.uleb128 0
	.4byte	.LASF147
	.byte	0x5
	.uleb128 0
	.4byte	.LASF148
	.byte	0x5
	.uleb128 0
	.4byte	.LASF149
	.byte	0x5
	.uleb128 0
	.4byte	.LASF150
	.byte	0x5
	.uleb128 0
	.4byte	.LASF151
	.byte	0x5
	.uleb128 0
	.4byte	.LASF152
	.byte	0x5
	.uleb128 0
	.4byte	.LASF153
	.byte	0x5
	.uleb128 0
	.4byte	.LASF154
	.byte	0x5
	.uleb128 0
	.4byte	.LASF155
	.byte	0x5
	.uleb128 0
	.4byte	.LASF156
	.byte	0x5
	.uleb128 0
	.4byte	.LASF157
	.byte	0x5
	.uleb128 0
	.4byte	.LASF158
	.byte	0x5
	.uleb128 0
	.4byte	.LASF159
	.byte	0x5
	.uleb128 0
	.4byte	.LASF160
	.byte	0x5
	.uleb128 0
	.4byte	.LASF161
	.byte	0x5
	.uleb128 0
	.4byte	.LASF162
	.byte	0x5
	.uleb128 0
	.4byte	.LASF163
	.byte	0x5
	.uleb128 0
	.4byte	.LASF164
	.byte	0x5
	.uleb128 0
	.4byte	.LASF165
	.byte	0x5
	.uleb128 0
	.4byte	.LASF166
	.byte	0x5
	.uleb128 0
	.4byte	.LASF167
	.byte	0x5
	.uleb128 0
	.4byte	.LASF168
	.byte	0x5
	.uleb128 0
	.4byte	.LASF169
	.byte	0x5
	.uleb128 0
	.4byte	.LASF170
	.byte	0x5
	.uleb128 0
	.4byte	.LASF171
	.byte	0x5
	.uleb128 0
	.4byte	.LASF172
	.byte	0x5
	.uleb128 0
	.4byte	.LASF173
	.byte	0x5
	.uleb128 0
	.4byte	.LASF174
	.byte	0x5
	.uleb128 0
	.4byte	.LASF175
	.byte	0x5
	.uleb128 0
	.4byte	.LASF176
	.byte	0x5
	.uleb128 0
	.4byte	.LASF177
	.byte	0x5
	.uleb128 0
	.4byte	.LASF178
	.byte	0x5
	.uleb128 0
	.4byte	.LASF179
	.byte	0x5
	.uleb128 0
	.4byte	.LASF180
	.byte	0x5
	.uleb128 0
	.4byte	.LASF181
	.byte	0x5
	.uleb128 0
	.4byte	.LASF182
	.byte	0x5
	.uleb128 0
	.4byte	.LASF183
	.byte	0x5
	.uleb128 0
	.4byte	.LASF184
	.byte	0x5
	.uleb128 0
	.4byte	.LASF185
	.byte	0x5
	.uleb128 0
	.4byte	.LASF186
	.byte	0x5
	.uleb128 0
	.4byte	.LASF187
	.byte	0x5
	.uleb128 0
	.4byte	.LASF188
	.byte	0x5
	.uleb128 0
	.4byte	.LASF189
	.byte	0x5
	.uleb128 0
	.4byte	.LASF190
	.byte	0x5
	.uleb128 0
	.4byte	.LASF191
	.byte	0x5
	.uleb128 0
	.4byte	.LASF192
	.byte	0x5
	.uleb128 0
	.4byte	.LASF193
	.byte	0x5
	.uleb128 0
	.4byte	.LASF194
	.byte	0x5
	.uleb128 0
	.4byte	.LASF195
	.byte	0x5
	.uleb128 0
	.4byte	.LASF196
	.byte	0x5
	.uleb128 0
	.4byte	.LASF197
	.byte	0x5
	.uleb128 0
	.4byte	.LASF198
	.byte	0x5
	.uleb128 0
	.4byte	.LASF199
	.byte	0x5
	.uleb128 0
	.4byte	.LASF200
	.byte	0x5
	.uleb128 0
	.4byte	.LASF201
	.byte	0x5
	.uleb128 0
	.4byte	.LASF202
	.byte	0x5
	.uleb128 0
	.4byte	.LASF203
	.byte	0x5
	.uleb128 0
	.4byte	.LASF204
	.byte	0x5
	.uleb128 0
	.4byte	.LASF205
	.byte	0x5
	.uleb128 0
	.4byte	.LASF206
	.byte	0x5
	.uleb128 0
	.4byte	.LASF207
	.byte	0x5
	.uleb128 0
	.4byte	.LASF208
	.byte	0x5
	.uleb128 0
	.4byte	.LASF209
	.byte	0x5
	.uleb128 0
	.4byte	.LASF210
	.byte	0x5
	.uleb128 0
	.4byte	.LASF211
	.byte	0x5
	.uleb128 0
	.4byte	.LASF212
	.byte	0x5
	.uleb128 0
	.4byte	.LASF213
	.byte	0x5
	.uleb128 0
	.4byte	.LASF214
	.byte	0x5
	.uleb128 0
	.4byte	.LASF215
	.byte	0x5
	.uleb128 0
	.4byte	.LASF216
	.byte	0x5
	.uleb128 0
	.4byte	.LASF217
	.byte	0x5
	.uleb128 0
	.4byte	.LASF218
	.byte	0x5
	.uleb128 0
	.4byte	.LASF219
	.byte	0x5
	.uleb128 0
	.4byte	.LASF220
	.byte	0x5
	.uleb128 0
	.4byte	.LASF221
	.byte	0x5
	.uleb128 0
	.4byte	.LASF222
	.byte	0x5
	.uleb128 0
	.4byte	.LASF223
	.byte	0x5
	.uleb128 0
	.4byte	.LASF224
	.byte	0x5
	.uleb128 0
	.4byte	.LASF225
	.byte	0x5
	.uleb128 0
	.4byte	.LASF226
	.byte	0x5
	.uleb128 0
	.4byte	.LASF227
	.byte	0x5
	.uleb128 0
	.4byte	.LASF228
	.byte	0x5
	.uleb128 0
	.4byte	.LASF229
	.byte	0x5
	.uleb128 0
	.4byte	.LASF230
	.byte	0x5
	.uleb128 0
	.4byte	.LASF231
	.byte	0x5
	.uleb128 0
	.4byte	.LASF232
	.byte	0x5
	.uleb128 0
	.4byte	.LASF233
	.byte	0x5
	.uleb128 0
	.4byte	.LASF234
	.byte	0x5
	.uleb128 0
	.4byte	.LASF235
	.byte	0x5
	.uleb128 0
	.4byte	.LASF236
	.byte	0x5
	.uleb128 0
	.4byte	.LASF237
	.byte	0x5
	.uleb128 0
	.4byte	.LASF238
	.byte	0x5
	.uleb128 0
	.4byte	.LASF239
	.byte	0x5
	.uleb128 0
	.4byte	.LASF240
	.byte	0x5
	.uleb128 0
	.4byte	.LASF241
	.byte	0x5
	.uleb128 0
	.4byte	.LASF242
	.byte	0x5
	.uleb128 0
	.4byte	.LASF243
	.byte	0x5
	.uleb128 0
	.4byte	.LASF244
	.byte	0x5
	.uleb128 0
	.4byte	.LASF245
	.byte	0x5
	.uleb128 0
	.4byte	.LASF246
	.byte	0x5
	.uleb128 0
	.4byte	.LASF247
	.byte	0x5
	.uleb128 0
	.4byte	.LASF248
	.byte	0x5
	.uleb128 0
	.4byte	.LASF249
	.byte	0x5
	.uleb128 0
	.4byte	.LASF250
	.byte	0x5
	.uleb128 0
	.4byte	.LASF251
	.byte	0x5
	.uleb128 0
	.4byte	.LASF252
	.byte	0x5
	.uleb128 0
	.4byte	.LASF253
	.byte	0x5
	.uleb128 0
	.4byte	.LASF254
	.byte	0x5
	.uleb128 0
	.4byte	.LASF255
	.byte	0x5
	.uleb128 0
	.4byte	.LASF256
	.byte	0x5
	.uleb128 0
	.4byte	.LASF257
	.byte	0x5
	.uleb128 0
	.4byte	.LASF258
	.byte	0x5
	.uleb128 0
	.4byte	.LASF259
	.byte	0x5
	.uleb128 0
	.4byte	.LASF260
	.byte	0x5
	.uleb128 0
	.4byte	.LASF261
	.byte	0x5
	.uleb128 0
	.4byte	.LASF262
	.byte	0x5
	.uleb128 0
	.4byte	.LASF263
	.byte	0x5
	.uleb128 0
	.4byte	.LASF264
	.byte	0x5
	.uleb128 0
	.4byte	.LASF265
	.byte	0x5
	.uleb128 0
	.4byte	.LASF266
	.byte	0x5
	.uleb128 0
	.4byte	.LASF267
	.byte	0x5
	.uleb128 0
	.4byte	.LASF268
	.byte	0x5
	.uleb128 0
	.4byte	.LASF269
	.byte	0x5
	.uleb128 0
	.4byte	.LASF270
	.byte	0x5
	.uleb128 0
	.4byte	.LASF271
	.byte	0x5
	.uleb128 0
	.4byte	.LASF272
	.byte	0x5
	.uleb128 0
	.4byte	.LASF273
	.byte	0x5
	.uleb128 0
	.4byte	.LASF274
	.byte	0x5
	.uleb128 0
	.4byte	.LASF275
	.byte	0x5
	.uleb128 0
	.4byte	.LASF276
	.byte	0x5
	.uleb128 0
	.4byte	.LASF277
	.byte	0x5
	.uleb128 0
	.4byte	.LASF278
	.byte	0x5
	.uleb128 0
	.4byte	.LASF279
	.byte	0x5
	.uleb128 0
	.4byte	.LASF280
	.byte	0x5
	.uleb128 0
	.4byte	.LASF281
	.byte	0x5
	.uleb128 0
	.4byte	.LASF282
	.byte	0x5
	.uleb128 0
	.4byte	.LASF283
	.byte	0x5
	.uleb128 0
	.4byte	.LASF284
	.byte	0x5
	.uleb128 0
	.4byte	.LASF285
	.byte	0x5
	.uleb128 0
	.4byte	.LASF286
	.byte	0x5
	.uleb128 0
	.4byte	.LASF287
	.byte	0x5
	.uleb128 0
	.4byte	.LASF288
	.byte	0x5
	.uleb128 0
	.4byte	.LASF289
	.byte	0x5
	.uleb128 0
	.4byte	.LASF290
	.byte	0x5
	.uleb128 0
	.4byte	.LASF291
	.byte	0x5
	.uleb128 0
	.4byte	.LASF292
	.byte	0x5
	.uleb128 0
	.4byte	.LASF293
	.byte	0x5
	.uleb128 0
	.4byte	.LASF294
	.byte	0x5
	.uleb128 0
	.4byte	.LASF295
	.byte	0x5
	.uleb128 0
	.4byte	.LASF296
	.byte	0x5
	.uleb128 0
	.4byte	.LASF297
	.byte	0x5
	.uleb128 0
	.4byte	.LASF298
	.byte	0x5
	.uleb128 0
	.4byte	.LASF299
	.byte	0x5
	.uleb128 0
	.4byte	.LASF300
	.byte	0x5
	.uleb128 0
	.4byte	.LASF301
	.byte	0x5
	.uleb128 0
	.4byte	.LASF302
	.byte	0x5
	.uleb128 0
	.4byte	.LASF303
	.byte	0x5
	.uleb128 0
	.4byte	.LASF304
	.byte	0x5
	.uleb128 0
	.4byte	.LASF305
	.byte	0x5
	.uleb128 0
	.4byte	.LASF306
	.byte	0x5
	.uleb128 0
	.4byte	.LASF307
	.byte	0x5
	.uleb128 0
	.4byte	.LASF308
	.byte	0x5
	.uleb128 0
	.4byte	.LASF309
	.byte	0x5
	.uleb128 0
	.4byte	.LASF310
	.byte	0x5
	.uleb128 0
	.4byte	.LASF311
	.byte	0x5
	.uleb128 0
	.4byte	.LASF312
	.byte	0x5
	.uleb128 0
	.4byte	.LASF313
	.byte	0x5
	.uleb128 0
	.4byte	.LASF314
	.byte	0x5
	.uleb128 0
	.4byte	.LASF315
	.byte	0x5
	.uleb128 0
	.4byte	.LASF316
	.byte	0x5
	.uleb128 0
	.4byte	.LASF317
	.byte	0x5
	.uleb128 0
	.4byte	.LASF318
	.byte	0x5
	.uleb128 0
	.4byte	.LASF319
	.byte	0x5
	.uleb128 0
	.4byte	.LASF320
	.byte	0x5
	.uleb128 0
	.4byte	.LASF321
	.byte	0x5
	.uleb128 0
	.4byte	.LASF322
	.byte	0x5
	.uleb128 0
	.4byte	.LASF323
	.byte	0x5
	.uleb128 0
	.4byte	.LASF324
	.byte	0x5
	.uleb128 0
	.4byte	.LASF325
	.byte	0x5
	.uleb128 0
	.4byte	.LASF326
	.byte	0x5
	.uleb128 0
	.4byte	.LASF327
	.byte	0x5
	.uleb128 0
	.4byte	.LASF328
	.byte	0x5
	.uleb128 0
	.4byte	.LASF329
	.byte	0x5
	.uleb128 0
	.4byte	.LASF330
	.byte	0x5
	.uleb128 0
	.4byte	.LASF331
	.byte	0x5
	.uleb128 0
	.4byte	.LASF332
	.byte	0x5
	.uleb128 0
	.4byte	.LASF333
	.byte	0x5
	.uleb128 0
	.4byte	.LASF334
	.byte	0x5
	.uleb128 0
	.4byte	.LASF335
	.byte	0x5
	.uleb128 0
	.4byte	.LASF336
	.byte	0x5
	.uleb128 0
	.4byte	.LASF337
	.byte	0x5
	.uleb128 0
	.4byte	.LASF338
	.byte	0x5
	.uleb128 0
	.4byte	.LASF339
	.byte	0x5
	.uleb128 0
	.4byte	.LASF340
	.byte	0x5
	.uleb128 0
	.4byte	.LASF341
	.byte	0x5
	.uleb128 0
	.4byte	.LASF342
	.byte	0x5
	.uleb128 0
	.4byte	.LASF343
	.byte	0x5
	.uleb128 0
	.4byte	.LASF344
	.byte	0x5
	.uleb128 0
	.4byte	.LASF345
	.byte	0x5
	.uleb128 0
	.4byte	.LASF346
	.byte	0x5
	.uleb128 0
	.4byte	.LASF347
	.byte	0x5
	.uleb128 0
	.4byte	.LASF348
	.byte	0x5
	.uleb128 0
	.4byte	.LASF349
	.byte	0x5
	.uleb128 0
	.4byte	.LASF350
	.byte	0x5
	.uleb128 0
	.4byte	.LASF351
	.byte	0x5
	.uleb128 0
	.4byte	.LASF352
	.byte	0x5
	.uleb128 0
	.4byte	.LASF353
	.byte	0x5
	.uleb128 0
	.4byte	.LASF354
	.byte	0x5
	.uleb128 0
	.4byte	.LASF355
	.byte	0x5
	.uleb128 0
	.4byte	.LASF356
	.byte	0x5
	.uleb128 0
	.4byte	.LASF357
	.byte	0x5
	.uleb128 0
	.4byte	.LASF358
	.byte	0x5
	.uleb128 0
	.4byte	.LASF359
	.byte	0x5
	.uleb128 0
	.4byte	.LASF360
	.byte	0x5
	.uleb128 0
	.4byte	.LASF361
	.byte	0x5
	.uleb128 0
	.4byte	.LASF362
	.byte	0x5
	.uleb128 0
	.4byte	.LASF363
	.byte	0x5
	.uleb128 0
	.4byte	.LASF364
	.byte	0x5
	.uleb128 0
	.4byte	.LASF365
	.byte	0x5
	.uleb128 0
	.4byte	.LASF366
	.byte	0x5
	.uleb128 0
	.4byte	.LASF367
	.byte	0x5
	.uleb128 0
	.4byte	.LASF368
	.byte	0x5
	.uleb128 0
	.4byte	.LASF369
	.byte	0x5
	.uleb128 0
	.4byte	.LASF370
	.byte	0x5
	.uleb128 0
	.4byte	.LASF371
	.byte	0x5
	.uleb128 0
	.4byte	.LASF372
	.byte	0x5
	.uleb128 0
	.4byte	.LASF373
	.byte	0x5
	.uleb128 0
	.4byte	.LASF374
	.byte	0x5
	.uleb128 0
	.4byte	.LASF375
	.byte	0x5
	.uleb128 0
	.4byte	.LASF376
	.byte	0x5
	.uleb128 0
	.4byte	.LASF377
	.byte	0x5
	.uleb128 0
	.4byte	.LASF378
	.byte	0x5
	.uleb128 0
	.4byte	.LASF379
	.byte	0x5
	.uleb128 0
	.4byte	.LASF380
	.byte	0x5
	.uleb128 0
	.4byte	.LASF381
	.byte	0x5
	.uleb128 0
	.4byte	.LASF382
	.byte	0x5
	.uleb128 0
	.4byte	.LASF383
	.byte	0x5
	.uleb128 0
	.4byte	.LASF384
	.byte	0x5
	.uleb128 0
	.4byte	.LASF385
	.byte	0x6
	.uleb128 0
	.4byte	.LASF386
	.byte	0x5
	.uleb128 0
	.4byte	.LASF387
	.byte	0x6
	.uleb128 0
	.4byte	.LASF388
	.byte	0x6
	.uleb128 0
	.4byte	.LASF389
	.byte	0x6
	.uleb128 0
	.4byte	.LASF390
	.byte	0x6
	.uleb128 0
	.4byte	.LASF391
	.byte	0x5
	.uleb128 0
	.4byte	.LASF392
	.byte	0x6
	.uleb128 0
	.4byte	.LASF393
	.byte	0x6
	.uleb128 0
	.4byte	.LASF394
	.byte	0x6
	.uleb128 0
	.4byte	.LASF395
	.byte	0x5
	.uleb128 0
	.4byte	.LASF396
	.byte	0x5
	.uleb128 0
	.4byte	.LASF397
	.byte	0x6
	.uleb128 0
	.4byte	.LASF398
	.byte	0x5
	.uleb128 0
	.4byte	.LASF399
	.byte	0x5
	.uleb128 0
	.4byte	.LASF400
	.byte	0x5
	.uleb128 0
	.4byte	.LASF401
	.byte	0x6
	.uleb128 0
	.4byte	.LASF402
	.byte	0x5
	.uleb128 0
	.4byte	.LASF403
	.byte	0x5
	.uleb128 0
	.4byte	.LASF404
	.byte	0x6
	.uleb128 0
	.4byte	.LASF405
	.byte	0x5
	.uleb128 0
	.4byte	.LASF406
	.byte	0x5
	.uleb128 0
	.4byte	.LASF407
	.byte	0x5
	.uleb128 0
	.4byte	.LASF408
	.byte	0x5
	.uleb128 0
	.4byte	.LASF409
	.byte	0x5
	.uleb128 0
	.4byte	.LASF410
	.byte	0x5
	.uleb128 0
	.4byte	.LASF411
	.byte	0x6
	.uleb128 0
	.4byte	.LASF412
	.byte	0x5
	.uleb128 0
	.4byte	.LASF413
	.byte	0x5
	.uleb128 0
	.4byte	.LASF414
	.byte	0x5
	.uleb128 0
	.4byte	.LASF415
	.byte	0x6
	.uleb128 0
	.4byte	.LASF416
	.byte	0x5
	.uleb128 0
	.4byte	.LASF417
	.byte	0x6
	.uleb128 0
	.4byte	.LASF418
	.byte	0x6
	.uleb128 0
	.4byte	.LASF419
	.byte	0x6
	.uleb128 0
	.4byte	.LASF420
	.byte	0x6
	.uleb128 0
	.4byte	.LASF421
	.byte	0x6
	.uleb128 0
	.4byte	.LASF422
	.byte	0x6
	.uleb128 0
	.4byte	.LASF423
	.byte	0x5
	.uleb128 0
	.4byte	.LASF424
	.byte	0x6
	.uleb128 0
	.4byte	.LASF425
	.byte	0x6
	.uleb128 0
	.4byte	.LASF426
	.byte	0x6
	.uleb128 0
	.4byte	.LASF427
	.byte	0x5
	.uleb128 0
	.4byte	.LASF428
	.byte	0x5
	.uleb128 0
	.4byte	.LASF429
	.byte	0x5
	.uleb128 0
	.4byte	.LASF430
	.byte	0x5
	.uleb128 0
	.4byte	.LASF431
	.byte	0x6
	.uleb128 0
	.4byte	.LASF432
	.byte	0x5
	.uleb128 0
	.4byte	.LASF433
	.byte	0x5
	.uleb128 0
	.4byte	.LASF434
	.byte	0x5
	.uleb128 0
	.4byte	.LASF435
	.byte	0x6
	.uleb128 0
	.4byte	.LASF436
	.byte	0x5
	.uleb128 0
	.4byte	.LASF437
	.byte	0x6
	.uleb128 0
	.4byte	.LASF438
	.byte	0x6
	.uleb128 0
	.4byte	.LASF439
	.byte	0x6
	.uleb128 0
	.4byte	.LASF440
	.byte	0x6
	.uleb128 0
	.4byte	.LASF441
	.byte	0x6
	.uleb128 0
	.4byte	.LASF442
	.byte	0x6
	.uleb128 0
	.4byte	.LASF443
	.byte	0x5
	.uleb128 0
	.4byte	.LASF444
	.byte	0x5
	.uleb128 0
	.4byte	.LASF445
	.byte	0x5
	.uleb128 0
	.4byte	.LASF446
	.byte	0x5
	.uleb128 0
	.4byte	.LASF429
	.byte	0x5
	.uleb128 0
	.4byte	.LASF447
	.byte	0x5
	.uleb128 0
	.4byte	.LASF448
	.byte	0x5
	.uleb128 0
	.4byte	.LASF449
	.byte	0x5
	.uleb128 0
	.4byte	.LASF450
	.byte	0x5
	.uleb128 0
	.4byte	.LASF451
	.byte	0x5
	.uleb128 0
	.4byte	.LASF452
	.byte	0x5
	.uleb128 0
	.4byte	.LASF453
	.byte	0x5
	.uleb128 0
	.4byte	.LASF454
	.byte	0x5
	.uleb128 0
	.4byte	.LASF455
	.byte	0x5
	.uleb128 0
	.4byte	.LASF456
	.byte	0x5
	.uleb128 0
	.4byte	.LASF457
	.byte	0x5
	.uleb128 0
	.4byte	.LASF458
	.byte	0x5
	.uleb128 0
	.4byte	.LASF459
	.byte	0x5
	.uleb128 0
	.4byte	.LASF460
	.byte	0x5
	.uleb128 0
	.4byte	.LASF461
	.byte	0x5
	.uleb128 0
	.4byte	.LASF462
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.SEGGER_RTT_Conf.h.58.89f13d1e29c781bace0d99cbd8ef8a57,comdat
.Ldebug_macro3:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF464
	.byte	0x5
	.uleb128 0x47
	.4byte	.LASF465
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF466
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF467
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF468
	.byte	0x5
	.uleb128 0x57
	.4byte	.LASF469
	.byte	0x5
	.uleb128 0x5b
	.4byte	.LASF470
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF471
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF472
	.byte	0x5
	.uleb128 0xa1
	.4byte	.LASF473
	.byte	0x5
	.uleb128 0xab
	.4byte	.LASF474
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.SEGGER_RTT.h.74.8b16a1f6367fd629ed3defc70261a896,comdat
.Ldebug_macro4:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF475
	.byte	0x5
	.uleb128 0x59
	.4byte	.LASF476
	.byte	0x5
	.uleb128 0x6f
	.4byte	.LASF477
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.__crossworks.h.12.efc3e96636a4739fb7ba08de04b37a44,comdat
.Ldebug_macro5:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF479
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF480
	.byte	0x6
	.uleb128 0x22
	.4byte	.LASF481
	.byte	0x5
	.uleb128 0x24
	.4byte	.LASF482
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF483
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF484
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF485
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF480
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF486
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF487
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF488
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF489
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF490
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF491
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF492
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF493
	.byte	0x5
	.uleb128 0x52
	.4byte	.LASF494
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF495
	.byte	0x5
	.uleb128 0x54
	.4byte	.LASF496
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF497
	.byte	0x5
	.uleb128 0x58
	.4byte	.LASF498
	.byte	0x5
	.uleb128 0xbd
	.4byte	.LASF499
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdlib.h.21.79f2798ff32ed81b7b6992b9aebf6885,comdat
.Ldebug_macro6:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x15
	.4byte	.LASF500
	.byte	0x5
	.uleb128 0x1a
	.4byte	.LASF501
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF502
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF503
	.byte	0x5
	.uleb128 0x2e
	.4byte	.LASF504
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF505
	.byte	0x5
	.uleb128 0x40
	.4byte	.LASF506
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdarg.h.12.a89c9d5912eac084f1d66b8d4dfd0560,comdat
.Ldebug_macro7:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF507
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF508
	.byte	0x5
	.uleb128 0x29
	.4byte	.LASF509
	.byte	0x5
	.uleb128 0x2c
	.4byte	.LASF510
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF511
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.SEGGER_RTT.h.221.22791d6295d11a6eb24007a756181587,comdat
.Ldebug_macro8:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xdd
	.4byte	.LASF512
	.byte	0x5
	.uleb128 0xe0
	.4byte	.LASF513
	.byte	0x5
	.uleb128 0xee
	.4byte	.LASF514
	.byte	0x5
	.uleb128 0x112
	.4byte	.LASF515
	.byte	0x5
	.uleb128 0x113
	.4byte	.LASF516
	.byte	0x5
	.uleb128 0x114
	.4byte	.LASF517
	.byte	0x5
	.uleb128 0x115
	.4byte	.LASF518
	.byte	0x5
	.uleb128 0x11b
	.4byte	.LASF519
	.byte	0x5
	.uleb128 0x11c
	.4byte	.LASF520
	.byte	0x5
	.uleb128 0x11e
	.4byte	.LASF521
	.byte	0x5
	.uleb128 0x11f
	.4byte	.LASF522
	.byte	0x5
	.uleb128 0x120
	.4byte	.LASF523
	.byte	0x5
	.uleb128 0x121
	.4byte	.LASF524
	.byte	0x5
	.uleb128 0x122
	.4byte	.LASF525
	.byte	0x5
	.uleb128 0x123
	.4byte	.LASF526
	.byte	0x5
	.uleb128 0x124
	.4byte	.LASF527
	.byte	0x5
	.uleb128 0x125
	.4byte	.LASF528
	.byte	0x5
	.uleb128 0x127
	.4byte	.LASF529
	.byte	0x5
	.uleb128 0x128
	.4byte	.LASF530
	.byte	0x5
	.uleb128 0x129
	.4byte	.LASF531
	.byte	0x5
	.uleb128 0x12a
	.4byte	.LASF532
	.byte	0x5
	.uleb128 0x12b
	.4byte	.LASF533
	.byte	0x5
	.uleb128 0x12c
	.4byte	.LASF534
	.byte	0x5
	.uleb128 0x12d
	.4byte	.LASF535
	.byte	0x5
	.uleb128 0x12e
	.4byte	.LASF536
	.byte	0x5
	.uleb128 0x130
	.4byte	.LASF537
	.byte	0x5
	.uleb128 0x131
	.4byte	.LASF538
	.byte	0x5
	.uleb128 0x132
	.4byte	.LASF539
	.byte	0x5
	.uleb128 0x133
	.4byte	.LASF540
	.byte	0x5
	.uleb128 0x134
	.4byte	.LASF541
	.byte	0x5
	.uleb128 0x135
	.4byte	.LASF542
	.byte	0x5
	.uleb128 0x136
	.4byte	.LASF543
	.byte	0x5
	.uleb128 0x137
	.4byte	.LASF544
	.byte	0x5
	.uleb128 0x139
	.4byte	.LASF545
	.byte	0x5
	.uleb128 0x13a
	.4byte	.LASF546
	.byte	0x5
	.uleb128 0x13b
	.4byte	.LASF547
	.byte	0x5
	.uleb128 0x13c
	.4byte	.LASF548
	.byte	0x5
	.uleb128 0x13d
	.4byte	.LASF549
	.byte	0x5
	.uleb128 0x13e
	.4byte	.LASF550
	.byte	0x5
	.uleb128 0x13f
	.4byte	.LASF551
	.byte	0x5
	.uleb128 0x140
	.4byte	.LASF552
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF477:
	.ascii	"RTT_USE_ASM (1)\000"
.LASF93:
	.ascii	"__SIG_ATOMIC_MAX__ 0x7fffffff\000"
.LASF224:
	.ascii	"__FLT64_HAS_QUIET_NAN__ 1\000"
.LASF258:
	.ascii	"__UFRACT_IBIT__ 0\000"
.LASF207:
	.ascii	"__FLT32_HAS_INFINITY__ 1\000"
.LASF628:
	.ascii	"SEGGER_RTT_ReadUpBuffer\000"
.LASF61:
	.ascii	"__UINT_FAST8_TYPE__ unsigned int\000"
.LASF214:
	.ascii	"__FLT64_MAX_EXP__ 1024\000"
.LASF321:
	.ascii	"__ULLACCUM_EPSILON__ 0x1P-32ULLK\000"
.LASF526:
	.ascii	"RTT_CTRL_TEXT_MAGENTA \"\\x1B[2;35m\"\000"
.LASF230:
	.ascii	"__FLT32X_MAX_EXP__ 1024\000"
.LASF127:
	.ascii	"__INT_FAST16_WIDTH__ 32\000"
.LASF376:
	.ascii	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1\000"
.LASF478:
	.ascii	"__stdlib_H \000"
.LASF311:
	.ascii	"__ULACCUM_EPSILON__ 0x1P-32ULK\000"
.LASF498:
	.ascii	"__RAL_WCHAR_T __WCHAR_TYPE__\000"
.LASF201:
	.ascii	"__FLT32_MAX__ 1.1\000"
.LASF194:
	.ascii	"__FLT32_MANT_DIG__ 24\000"
.LASF285:
	.ascii	"__SACCUM_MAX__ 0X7FFFP-7HK\000"
.LASF117:
	.ascii	"__UINT8_C(c) c\000"
.LASF425:
	.ascii	"__ARM_NEON__\000"
.LASF381:
	.ascii	"__SIZEOF_WINT_T__ 4\000"
.LASF462:
	.ascii	"STARTUP_FROM_RESET 1\000"
.LASF323:
	.ascii	"__QQ_IBIT__ 0\000"
.LASF597:
	.ascii	"FragLen\000"
.LASF625:
	.ascii	"SEGGER_RTT_WriteDownBufferNoLock\000"
.LASF457:
	.ascii	"__SAM_E_FAMILY 1\000"
.LASF232:
	.ascii	"__FLT32X_DECIMAL_DIG__ 17\000"
.LASF606:
	.ascii	"SEGGER_RTT_ConfigDownBuffer\000"
.LASF163:
	.ascii	"__DBL_MIN_EXP__ (-1021)\000"
.LASF83:
	.ascii	"__LONG_LONG_WIDTH__ 64\000"
.LASF580:
	.ascii	"SEGGER_RTT_BUFFER_UP\000"
.LASF369:
	.ascii	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2\000"
.LASF439:
	.ascii	"__ARM_FEATURE_CDE_COPROC\000"
.LASF401:
	.ascii	"__ARM_SIZEOF_WCHAR_T 4\000"
.LASF418:
	.ascii	"__ARM_FP16_FORMAT_IEEE\000"
.LASF391:
	.ascii	"__ARM_FEATURE_COMPLEX\000"
.LASF273:
	.ascii	"__LLFRACT_IBIT__ 0\000"
.LASF134:
	.ascii	"__UINT_FAST32_MAX__ 0xffffffffU\000"
.LASF249:
	.ascii	"__USFRACT_MIN__ 0.0UHR\000"
.LASF535:
	.ascii	"RTT_CTRL_TEXT_BRIGHT_CYAN \"\\x1B[1;36m\"\000"
.LASF523:
	.ascii	"RTT_CTRL_TEXT_GREEN \"\\x1B[2;32m\"\000"
.LASF6:
	.ascii	"__GNUC_MINOR__ 2\000"
.LASF392:
	.ascii	"__ARM_32BIT_STATE 1\000"
.LASF609:
	.ascii	"SEGGER_RTT_AllocUpBuffer\000"
.LASF541:
	.ascii	"RTT_CTRL_BG_BLUE \"\\x1B[24;44m\"\000"
.LASF435:
	.ascii	"__ARM_ASM_SYNTAX_UNIFIED__ 1\000"
.LASF476:
	.ascii	"_CORE_HAS_RTT_ASM_SUPPORT 1\000"
.LASF570:
	.ascii	"unsigned int\000"
.LASF579:
	.ascii	"Flags\000"
.LASF596:
	.ascii	"Status\000"
.LASF119:
	.ascii	"__UINT16_C(c) c\000"
.LASF23:
	.ascii	"__SIZEOF_SIZE_T__ 4\000"
.LASF38:
	.ascii	"__CHAR16_TYPE__ short unsigned int\000"
.LASF22:
	.ascii	"__SIZEOF_LONG_DOUBLE__ 8\000"
.LASF152:
	.ascii	"__FLT_MAX__ 1.1\000"
.LASF124:
	.ascii	"__INT_FAST8_MAX__ 0x7fffffff\000"
.LASF27:
	.ascii	"__ORDER_BIG_ENDIAN__ 4321\000"
.LASF280:
	.ascii	"__ULLFRACT_MAX__ 0XFFFFFFFFFFFFFFFFP-64ULLR\000"
.LASF590:
	.ascii	"_ActiveTerminal\000"
.LASF638:
	.ascii	"NumBytesWritten\000"
.LASF383:
	.ascii	"__ARM_FEATURE_DSP 1\000"
.LASF440:
	.ascii	"__ARM_FEATURE_MATMUL_INT8\000"
.LASF356:
	.ascii	"__UTA_FBIT__ 64\000"
.LASF161:
	.ascii	"__DBL_MANT_DIG__ 53\000"
.LASF56:
	.ascii	"__UINT_LEAST64_TYPE__ long long unsigned int\000"
.LASF236:
	.ascii	"__FLT32X_EPSILON__ 1.1\000"
.LASF75:
	.ascii	"__WINT_MAX__ 0xffffffffU\000"
.LASF12:
	.ascii	"__ATOMIC_RELEASE 3\000"
.LASF33:
	.ascii	"__PTRDIFF_TYPE__ int\000"
.LASF363:
	.ascii	"__CHAR_UNSIGNED__ 1\000"
.LASF578:
	.ascii	"RdOff\000"
.LASF42:
	.ascii	"__INT16_TYPE__ short int\000"
.LASF388:
	.ascii	"__ARM_FEATURE_QRDMX\000"
.LASF342:
	.ascii	"__HA_FBIT__ 7\000"
.LASF178:
	.ascii	"__LDBL_DIG__ 15\000"
.LASF235:
	.ascii	"__FLT32X_MIN__ 1.1\000"
.LASF313:
	.ascii	"__LLACCUM_IBIT__ 32\000"
.LASF10:
	.ascii	"__ATOMIC_SEQ_CST 5\000"
.LASF19:
	.ascii	"__SIZEOF_SHORT__ 2\000"
.LASF544:
	.ascii	"RTT_CTRL_BG_WHITE \"\\x1B[24;47m\"\000"
.LASF632:
	.ascii	"_PostTerminalSwitch\000"
.LASF188:
	.ascii	"__LDBL_EPSILON__ 1.1\000"
.LASF49:
	.ascii	"__INT_LEAST8_TYPE__ signed char\000"
.LASF589:
	.ascii	"_acDownBuffer\000"
.LASF557:
	.ascii	"STRCPY(pDest,pSrc,NumBytes) strcpy((pDest), (pSrc))"
	.ascii	"\000"
.LASF91:
	.ascii	"__UINTMAX_C(c) c ## ULL\000"
.LASF464:
	.ascii	"SEGGER_RTT_CONF_H \000"
.LASF575:
	.ascii	"pBuffer\000"
.LASF29:
	.ascii	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF197:
	.ascii	"__FLT32_MIN_10_EXP__ (-37)\000"
.LASF263:
	.ascii	"__LFRACT_IBIT__ 0\000"
.LASF497:
	.ascii	"__CTYPE_PRINT (__CTYPE_BLANK | __CTYPE_PUNCT | __CT"
	.ascii	"YPE_UPPER | __CTYPE_LOWER | __CTYPE_DIGIT)\000"
.LASF543:
	.ascii	"RTT_CTRL_BG_CYAN \"\\x1B[24;46m\"\000"
.LASF531:
	.ascii	"RTT_CTRL_TEXT_BRIGHT_GREEN \"\\x1B[1;32m\"\000"
.LASF406:
	.ascii	"__ARM_ARCH 7\000"
.LASF3:
	.ascii	"__STDC_UTF_32__ 1\000"
.LASF107:
	.ascii	"__INT_LEAST16_MAX__ 0x7fff\000"
.LASF620:
	.ascii	"SEGGER_RTT_Write\000"
.LASF68:
	.ascii	"__SCHAR_MAX__ 0x7f\000"
.LASF318:
	.ascii	"__ULLACCUM_IBIT__ 32\000"
.LASF398:
	.ascii	"__ARM_FEATURE_NUMERIC_MAXMIN\000"
.LASF278:
	.ascii	"__ULLFRACT_IBIT__ 0\000"
.LASF211:
	.ascii	"__FLT64_DIG__ 15\000"
.LASF9:
	.ascii	"__ATOMIC_RELAXED 0\000"
.LASF384:
	.ascii	"__ARM_FEATURE_QBIT 1\000"
.LASF423:
	.ascii	"__ARM_FEATURE_FP16_FML\000"
.LASF78:
	.ascii	"__SIZE_MAX__ 0xffffffffU\000"
.LASF304:
	.ascii	"__LACCUM_MIN__ (-0X1P31LK-0X1P31LK)\000"
.LASF320:
	.ascii	"__ULLACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULLK\000"
.LASF309:
	.ascii	"__ULACCUM_MIN__ 0.0ULK\000"
.LASF479:
	.ascii	"__crossworks_H \000"
.LASF511:
	.ascii	"va_end(ap) __builtin_va_end(ap)\000"
.LASF158:
	.ascii	"__FLT_HAS_INFINITY__ 1\000"
.LASF386:
	.ascii	"__ARM_FEATURE_CRYPTO\000"
.LASF517:
	.ascii	"SEGGER_RTT_MODE_BLOCK_IF_FIFO_FULL (2)\000"
.LASF53:
	.ascii	"__UINT_LEAST8_TYPE__ unsigned char\000"
.LASF355:
	.ascii	"__UDA_IBIT__ 32\000"
.LASF525:
	.ascii	"RTT_CTRL_TEXT_BLUE \"\\x1B[2;34m\"\000"
.LASF60:
	.ascii	"__INT_FAST64_TYPE__ long long int\000"
.LASF524:
	.ascii	"RTT_CTRL_TEXT_YELLOW \"\\x1B[2;33m\"\000"
.LASF105:
	.ascii	"__INT8_C(c) c\000"
.LASF209:
	.ascii	"__FP_FAST_FMAF32 1\000"
.LASF432:
	.ascii	"__FDPIC__\000"
.LASF237:
	.ascii	"__FLT32X_DENORM_MIN__ 1.1\000"
.LASF109:
	.ascii	"__INT_LEAST16_WIDTH__ 16\000"
.LASF599:
	.ascii	"pRing\000"
.LASF509:
	.ascii	"va_arg __builtin_va_arg\000"
.LASF319:
	.ascii	"__ULLACCUM_MIN__ 0.0ULLK\000"
.LASF645:
	.ascii	"SEGGER_RTT_WriteWithOverwriteNoLock\000"
.LASF390:
	.ascii	"__ARM_FEATURE_DOTPROD\000"
.LASF426:
	.ascii	"__ARM_NEON\000"
.LASF593:
	.ascii	"BufferIndex\000"
.LASF394:
	.ascii	"__ARM_FEATURE_CMSE\000"
.LASF66:
	.ascii	"__UINTPTR_TYPE__ unsigned int\000"
.LASF155:
	.ascii	"__FLT_EPSILON__ 1.1\000"
.LASF206:
	.ascii	"__FLT32_HAS_DENORM__ 1\000"
.LASF481:
	.ascii	"__RAL_SIZE_T\000"
.LASF364:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1\000"
.LASF506:
	.ascii	"MB_CUR_MAX __RAL_mb_max(&__RAL_global_locale)\000"
.LASF345:
	.ascii	"__SA_IBIT__ 16\000"
.LASF275:
	.ascii	"__LLFRACT_MAX__ 0X7FFFFFFFFFFFFFFFP-63LLR\000"
.LASF130:
	.ascii	"__INT_FAST64_MAX__ 0x7fffffffffffffffLL\000"
.LASF160:
	.ascii	"__FP_FAST_FMAF 1\000"
.LASF146:
	.ascii	"__FLT_DIG__ 6\000"
.LASF126:
	.ascii	"__INT_FAST16_MAX__ 0x7fffffff\000"
.LASF367:
	.ascii	"__GCC_ATOMIC_BOOL_LOCK_FREE 2\000"
.LASF365:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1\000"
.LASF461:
	.ascii	"__TCM_CONFIG__ 0\000"
.LASF642:
	.ascii	"/home/tommy/Documents/CrossWorks Projects/Executabl"
	.ascii	"e_1\000"
.LASF400:
	.ascii	"__ARM_SIZEOF_MINIMAL_ENUM 1\000"
.LASF508:
	.ascii	"va_start(v,l) __builtin_va_start((v),l)\000"
.LASF516:
	.ascii	"SEGGER_RTT_MODE_NO_BLOCK_TRIM (1)\000"
.LASF456:
	.ascii	"__SAME70Q21B__ 1\000"
.LASF291:
	.ascii	"__USACCUM_EPSILON__ 0x1P-8UHK\000"
.LASF463:
	.ascii	"SEGGER_RTT_H \000"
.LASF77:
	.ascii	"__PTRDIFF_MAX__ 0x7fffffff\000"
.LASF208:
	.ascii	"__FLT32_HAS_QUIET_NAN__ 1\000"
.LASF118:
	.ascii	"__UINT_LEAST16_MAX__ 0xffff\000"
.LASF260:
	.ascii	"__UFRACT_MAX__ 0XFFFFP-16UR\000"
.LASF245:
	.ascii	"__SFRACT_MAX__ 0X7FP-7HR\000"
.LASF470:
	.ascii	"SEGGER_RTT_MODE_DEFAULT SEGGER_RTT_MODE_NO_BLOCK_SK"
	.ascii	"IP\000"
.LASF431:
	.ascii	"__ARM_EABI__ 1\000"
.LASF116:
	.ascii	"__UINT_LEAST8_MAX__ 0xff\000"
.LASF537:
	.ascii	"RTT_CTRL_BG_BLACK \"\\x1B[24;40m\"\000"
.LASF99:
	.ascii	"__INT64_MAX__ 0x7fffffffffffffffLL\000"
.LASF548:
	.ascii	"RTT_CTRL_BG_BRIGHT_YELLOW \"\\x1B[4;43m\"\000"
.LASF96:
	.ascii	"__INT8_MAX__ 0x7f\000"
.LASF271:
	.ascii	"__ULFRACT_EPSILON__ 0x1P-32ULR\000"
.LASF51:
	.ascii	"__INT_LEAST32_TYPE__ long int\000"
.LASF268:
	.ascii	"__ULFRACT_IBIT__ 0\000"
.LASF312:
	.ascii	"__LLACCUM_FBIT__ 31\000"
.LASF122:
	.ascii	"__UINT_LEAST64_MAX__ 0xffffffffffffffffULL\000"
.LASF144:
	.ascii	"__FLT_RADIX__ 2\000"
.LASF279:
	.ascii	"__ULLFRACT_MIN__ 0.0ULLR\000"
.LASF175:
	.ascii	"__DBL_HAS_QUIET_NAN__ 1\000"
.LASF299:
	.ascii	"__UACCUM_MIN__ 0.0UK\000"
.LASF492:
	.ascii	"__CTYPE_BLANK 0x40\000"
.LASF266:
	.ascii	"__LFRACT_EPSILON__ 0x1P-31LR\000"
.LASF57:
	.ascii	"__INT_FAST8_TYPE__ int\000"
.LASF223:
	.ascii	"__FLT64_HAS_INFINITY__ 1\000"
.LASF569:
	.ascii	"char\000"
.LASF205:
	.ascii	"__FLT32_DENORM_MIN__ 1.1\000"
.LASF421:
	.ascii	"__ARM_FEATURE_FP16_SCALAR_ARITHMETIC\000"
.LASF595:
	.ascii	"TerminalId\000"
.LASF486:
	.ascii	"__CTYPE_UPPER 0x01\000"
.LASF282:
	.ascii	"__SACCUM_FBIT__ 7\000"
.LASF34:
	.ascii	"__WCHAR_TYPE__ unsigned int\000"
.LASF203:
	.ascii	"__FLT32_MIN__ 1.1\000"
.LASF403:
	.ascii	"__ARM_ARCH_PROFILE 77\000"
.LASF594:
	.ascii	"SEGGER_RTT_TerminalOut\000"
.LASF446:
	.ascii	"__SIZEOF_WCHAR_T 4\000"
.LASF254:
	.ascii	"__FRACT_MIN__ (-0.5R-0.5R)\000"
.LASF226:
	.ascii	"__FLT32X_MANT_DIG__ 53\000"
.LASF373:
	.ascii	"__GCC_ATOMIC_INT_LOCK_FREE 2\000"
.LASF88:
	.ascii	"__INTMAX_MAX__ 0x7fffffffffffffffLL\000"
.LASF74:
	.ascii	"__WCHAR_MIN__ 0U\000"
.LASF293:
	.ascii	"__ACCUM_IBIT__ 16\000"
.LASF115:
	.ascii	"__INT_LEAST64_WIDTH__ 64\000"
.LASF601:
	.ascii	"SEGGER_RTT_SetTerminal\000"
.LASF215:
	.ascii	"__FLT64_MAX_10_EXP__ 308\000"
.LASF283:
	.ascii	"__SACCUM_IBIT__ 8\000"
.LASF382:
	.ascii	"__SIZEOF_PTRDIFF_T__ 4\000"
.LASF379:
	.ascii	"__PRAGMA_REDEFINE_EXTNAME 1\000"
.LASF244:
	.ascii	"__SFRACT_MIN__ (-0.5HR-0.5HR)\000"
.LASF353:
	.ascii	"__USA_IBIT__ 16\000"
.LASF510:
	.ascii	"va_copy(d,s) __builtin_va_copy((d),(s))\000"
.LASF527:
	.ascii	"RTT_CTRL_TEXT_CYAN \"\\x1B[2;36m\"\000"
.LASF433:
	.ascii	"__ARM_ARCH_EXT_IDIV__ 1\000"
.LASF539:
	.ascii	"RTT_CTRL_BG_GREEN \"\\x1B[24;42m\"\000"
.LASF387:
	.ascii	"__ARM_FEATURE_UNALIGNED 1\000"
.LASF455:
	.ascii	"__THUMB 1\000"
.LASF480:
	.ascii	"__THREAD __thread\000"
.LASF290:
	.ascii	"__USACCUM_MAX__ 0XFFFFP-8UHK\000"
.LASF121:
	.ascii	"__UINT32_C(c) c ## UL\000"
.LASF354:
	.ascii	"__UDA_FBIT__ 32\000"
.LASF618:
	.ascii	"SEGGER_RTT_PutCharSkipNoLock\000"
.LASF585:
	.ascii	"aDown\000"
.LASF447:
	.ascii	"__CROSSWORKS_ARM 1\000"
.LASF624:
	.ascii	"pData\000"
.LASF411:
	.ascii	"__THUMBEL__ 1\000"
.LASF187:
	.ascii	"__LDBL_MIN__ 1.1\000"
.LASF536:
	.ascii	"RTT_CTRL_TEXT_BRIGHT_WHITE \"\\x1B[1;37m\"\000"
.LASF347:
	.ascii	"__DA_IBIT__ 32\000"
.LASF25:
	.ascii	"__BIGGEST_ALIGNMENT__ 8\000"
.LASF605:
	.ascii	"SEGGER_RTT_SetNameUpBuffer\000"
.LASF308:
	.ascii	"__ULACCUM_IBIT__ 32\000"
.LASF250:
	.ascii	"__USFRACT_MAX__ 0XFFP-8UHR\000"
.LASF132:
	.ascii	"__UINT_FAST8_MAX__ 0xffffffffU\000"
.LASF592:
	.ascii	"SEGGER_RTT_GetAvailWriteSpace\000"
.LASF378:
	.ascii	"__HAVE_SPECULATION_SAFE_VALUE 1\000"
.LASF314:
	.ascii	"__LLACCUM_MIN__ (-0X1P31LLK-0X1P31LLK)\000"
.LASF588:
	.ascii	"_acUpBuffer\000"
.LASF344:
	.ascii	"__SA_FBIT__ 15\000"
.LASF213:
	.ascii	"__FLT64_MIN_10_EXP__ (-307)\000"
.LASF563:
	.ascii	"SEGGER_RTT_CB_ALIGN(Var) Var\000"
.LASF70:
	.ascii	"__INT_MAX__ 0x7fffffff\000"
.LASF600:
	.ascii	"LockState\000"
.LASF533:
	.ascii	"RTT_CTRL_TEXT_BRIGHT_BLUE \"\\x1B[1;34m\"\000"
.LASF286:
	.ascii	"__SACCUM_EPSILON__ 0x1P-7HK\000"
.LASF241:
	.ascii	"__FP_FAST_FMAF32x 1\000"
.LASF610:
	.ascii	"SEGGER_RTT_AllocDownBuffer\000"
.LASF58:
	.ascii	"__INT_FAST16_TYPE__ int\000"
.LASF487:
	.ascii	"__CTYPE_LOWER 0x02\000"
.LASF200:
	.ascii	"__FLT32_DECIMAL_DIG__ 9\000"
.LASF518:
	.ascii	"SEGGER_RTT_MODE_MASK (3)\000"
.LASF46:
	.ascii	"__UINT16_TYPE__ short unsigned int\000"
.LASF450:
	.ascii	"__CROSSWORKS_MAJOR_VERSION 4\000"
.LASF84:
	.ascii	"__WCHAR_WIDTH__ 32\000"
.LASF360:
	.ascii	"__GNUC_STDC_INLINE__ 1\000"
.LASF335:
	.ascii	"__UHQ_IBIT__ 0\000"
.LASF257:
	.ascii	"__UFRACT_FBIT__ 16\000"
.LASF397:
	.ascii	"__ARM_FEATURE_CLZ 1\000"
.LASF72:
	.ascii	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL\000"
.LASF493:
	.ascii	"__CTYPE_XDIGIT 0x80\000"
.LASF44:
	.ascii	"__INT64_TYPE__ long long int\000"
.LASF150:
	.ascii	"__FLT_MAX_10_EXP__ 38\000"
.LASF613:
	.ascii	"SEGGER_RTT_HasKey\000"
.LASF315:
	.ascii	"__LLACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LLK\000"
.LASF26:
	.ascii	"__ORDER_LITTLE_ENDIAN__ 1234\000"
.LASF316:
	.ascii	"__LLACCUM_EPSILON__ 0x1P-31LLK\000"
.LASF289:
	.ascii	"__USACCUM_MIN__ 0.0UHK\000"
.LASF623:
	.ascii	"SEGGER_RTT_WriteNoLock\000"
.LASF361:
	.ascii	"__NO_INLINE__ 1\000"
.LASF643:
	.ascii	"_SEGGER_RTT\000"
.LASF269:
	.ascii	"__ULFRACT_MIN__ 0.0ULR\000"
.LASF145:
	.ascii	"__FLT_MANT_DIG__ 24\000"
.LASF405:
	.ascii	"__ARM_ARCH\000"
.LASF216:
	.ascii	"__FLT64_DECIMAL_DIG__ 17\000"
.LASF358:
	.ascii	"__REGISTER_PREFIX__ \000"
.LASF552:
	.ascii	"RTT_CTRL_BG_BRIGHT_WHITE \"\\x1B[4;47m\"\000"
.LASF196:
	.ascii	"__FLT32_MIN_EXP__ (-125)\000"
.LASF436:
	.ascii	"__ARM_FEATURE_COPROC\000"
.LASF591:
	.ascii	"SEGGER_RTT_GetBytesInBuffer\000"
.LASF298:
	.ascii	"__UACCUM_IBIT__ 16\000"
.LASF133:
	.ascii	"__UINT_FAST16_MAX__ 0xffffffffU\000"
.LASF62:
	.ascii	"__UINT_FAST16_TYPE__ unsigned int\000"
.LASF489:
	.ascii	"__CTYPE_SPACE 0x08\000"
.LASF164:
	.ascii	"__DBL_MIN_10_EXP__ (-307)\000"
.LASF288:
	.ascii	"__USACCUM_IBIT__ 8\000"
.LASF327:
	.ascii	"__SQ_IBIT__ 0\000"
.LASF67:
	.ascii	"__GXX_ABI_VERSION 1014\000"
.LASF195:
	.ascii	"__FLT32_DIG__ 6\000"
.LASF496:
	.ascii	"__CTYPE_GRAPH (__CTYPE_PUNCT | __CTYPE_UPPER | __CT"
	.ascii	"YPE_LOWER | __CTYPE_DIGIT)\000"
.LASF222:
	.ascii	"__FLT64_HAS_DENORM__ 1\000"
.LASF141:
	.ascii	"__FLT_EVAL_METHOD__ 0\000"
.LASF238:
	.ascii	"__FLT32X_HAS_DENORM__ 1\000"
.LASF504:
	.ascii	"EXIT_FAILURE 1\000"
.LASF113:
	.ascii	"__INT_LEAST64_MAX__ 0x7fffffffffffffffLL\000"
.LASF549:
	.ascii	"RTT_CTRL_BG_BRIGHT_BLUE \"\\x1B[4;44m\"\000"
.LASF221:
	.ascii	"__FLT64_DENORM_MIN__ 1.1\000"
.LASF637:
	.ascii	"NumBytesToWrite\000"
.LASF371:
	.ascii	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2\000"
.LASF607:
	.ascii	"BufferSize\000"
.LASF459:
	.ascii	"FLASH_PLACEMENT 1\000"
.LASF272:
	.ascii	"__LLFRACT_FBIT__ 63\000"
.LASF106:
	.ascii	"__INT_LEAST8_WIDTH__ 8\000"
.LASF352:
	.ascii	"__USA_FBIT__ 16\000"
.LASF100:
	.ascii	"__UINT8_MAX__ 0xff\000"
.LASF449:
	.ascii	"__HEAP_SIZE__ 4096\000"
.LASF101:
	.ascii	"__UINT16_MAX__ 0xffff\000"
.LASF454:
	.ascii	"DEBUG 1\000"
.LASF154:
	.ascii	"__FLT_MIN__ 1.1\000"
.LASF495:
	.ascii	"__CTYPE_ALNUM (__CTYPE_UPPER | __CTYPE_LOWER | __CT"
	.ascii	"YPE_DIGIT)\000"
.LASF8:
	.ascii	"__VERSION__ \"10.2.1 20201103 (release)\"\000"
.LASF483:
	.ascii	"__RAL_SIZE_MAX 4294967295UL\000"
.LASF1:
	.ascii	"__STDC_VERSION__ 201112L\000"
.LASF92:
	.ascii	"__INTMAX_WIDTH__ 64\000"
.LASF438:
	.ascii	"__ARM_FEATURE_CDE\000"
.LASF262:
	.ascii	"__LFRACT_FBIT__ 31\000"
.LASF488:
	.ascii	"__CTYPE_DIGIT 0x04\000"
.LASF555:
	.ascii	"SEGGER_RTT_BUFFER_ALIGNMENT 0\000"
.LASF50:
	.ascii	"__INT_LEAST16_TYPE__ short int\000"
.LASF198:
	.ascii	"__FLT32_MAX_EXP__ 128\000"
.LASF139:
	.ascii	"__GCC_IEC_559 2\000"
.LASF546:
	.ascii	"RTT_CTRL_BG_BRIGHT_RED \"\\x1B[4;41m\"\000"
.LASF453:
	.ascii	"__GNU_LINKER 1\000"
.LASF162:
	.ascii	"__DBL_DIG__ 15\000"
.LASF581:
	.ascii	"SEGGER_RTT_BUFFER_DOWN\000"
.LASF104:
	.ascii	"__INT_LEAST8_MAX__ 0x7f\000"
.LASF412:
	.ascii	"__ARM_ARCH_ISA_THUMB\000"
.LASF302:
	.ascii	"__LACCUM_FBIT__ 31\000"
.LASF341:
	.ascii	"__UTQ_IBIT__ 0\000"
.LASF172:
	.ascii	"__DBL_DENORM_MIN__ ((double)1.1)\000"
.LASF374:
	.ascii	"__GCC_ATOMIC_LONG_LOCK_FREE 2\000"
.LASF227:
	.ascii	"__FLT32X_DIG__ 15\000"
.LASF296:
	.ascii	"__ACCUM_EPSILON__ 0x1P-15K\000"
.LASF338:
	.ascii	"__UDQ_FBIT__ 64\000"
.LASF186:
	.ascii	"__LDBL_NORM_MAX__ 1.1\000"
.LASF343:
	.ascii	"__HA_IBIT__ 8\000"
.LASF562:
	.ascii	"SEGGER_RTT_PUT_SECTION(Var,Section) Var\000"
.LASF413:
	.ascii	"__ARM_ARCH_ISA_THUMB 2\000"
.LASF574:
	.ascii	"sName\000"
.LASF340:
	.ascii	"__UTQ_FBIT__ 128\000"
.LASF153:
	.ascii	"__FLT_NORM_MAX__ 1.1\000"
.LASF573:
	.ascii	"long long int\000"
.LASF24:
	.ascii	"__CHAR_BIT__ 8\000"
.LASF416:
	.ascii	"__ARM_FP\000"
.LASF137:
	.ascii	"__INTPTR_WIDTH__ 32\000"
.LASF292:
	.ascii	"__ACCUM_FBIT__ 15\000"
.LASF15:
	.ascii	"__FINITE_MATH_ONLY__ 0\000"
.LASF612:
	.ascii	"SEGGER_RTT_HasData\000"
.LASF404:
	.ascii	"__arm__ 1\000"
.LASF303:
	.ascii	"__LACCUM_IBIT__ 32\000"
.LASF554:
	.ascii	"SEGGER_RTT_ALIGNMENT 0\000"
.LASF177:
	.ascii	"__LDBL_MANT_DIG__ 53\000"
.LASF331:
	.ascii	"__TQ_IBIT__ 0\000"
.LASF350:
	.ascii	"__UHA_FBIT__ 8\000"
.LASF627:
	.ascii	"NumBytesRead\000"
.LASF408:
	.ascii	"__GCC_ASM_FLAG_OUTPUTS__ 1\000"
.LASF583:
	.ascii	"MaxNumUpBuffers\000"
.LASF512:
	.ascii	"SEGGER_RTT_HASDATA(n) (_SEGGER_RTT.aDown[n].WrOff -"
	.ascii	" _SEGGER_RTT.aDown[n].RdOff)\000"
.LASF513:
	.ascii	"SEGGER_RTT_WriteSkipNoLock SEGGER_RTT_ASM_WriteSkip"
	.ascii	"NoLock\000"
.LASF202:
	.ascii	"__FLT32_NORM_MAX__ 1.1\000"
.LASF528:
	.ascii	"RTT_CTRL_TEXT_WHITE \"\\x1B[2;37m\"\000"
.LASF445:
	.ascii	"__ELF__ 1\000"
.LASF402:
	.ascii	"__ARM_ARCH_PROFILE\000"
.LASF310:
	.ascii	"__ULACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULK\000"
.LASF108:
	.ascii	"__INT16_C(c) c\000"
.LASF189:
	.ascii	"__LDBL_DENORM_MIN__ 1.1\000"
.LASF103:
	.ascii	"__UINT64_MAX__ 0xffffffffffffffffULL\000"
.LASF577:
	.ascii	"WrOff\000"
.LASF128:
	.ascii	"__INT_FAST32_MAX__ 0x7fffffff\000"
.LASF171:
	.ascii	"__DBL_EPSILON__ ((double)1.1)\000"
.LASF11:
	.ascii	"__ATOMIC_ACQUIRE 2\000"
.LASF451:
	.ascii	"__CROSSWORKS_MINOR_VERSION 8\000"
.LASF465:
	.ascii	"SEGGER_RTT_MAX_NUM_UP_BUFFERS (3)\000"
.LASF437:
	.ascii	"__ARM_FEATURE_COPROC 15\000"
.LASF0:
	.ascii	"__STDC__ 1\000"
.LASF494:
	.ascii	"__CTYPE_ALPHA (__CTYPE_UPPER | __CTYPE_LOWER)\000"
.LASF17:
	.ascii	"__SIZEOF_LONG__ 4\000"
.LASF165:
	.ascii	"__DBL_MAX_EXP__ 1024\000"
.LASF14:
	.ascii	"__ATOMIC_CONSUME 1\000"
.LASF474:
	.ascii	"SEGGER_RTT_UNLOCK() __asm volatile (\"msr   basepri"
	.ascii	", %0  \\n\\t\" : : \"r\" (LockState) : ); }\000"
.LASF129:
	.ascii	"__INT_FAST32_WIDTH__ 32\000"
.LASF443:
	.ascii	"__ARM_BF16_FORMAT_ALTERNATIVE\000"
.LASF35:
	.ascii	"__WINT_TYPE__ unsigned int\000"
.LASF452:
	.ascii	"__CROSSWORKS_REVISION 0\000"
.LASF71:
	.ascii	"__LONG_MAX__ 0x7fffffffL\000"
.LASF97:
	.ascii	"__INT16_MAX__ 0x7fff\000"
.LASF267:
	.ascii	"__ULFRACT_FBIT__ 32\000"
.LASF79:
	.ascii	"__SCHAR_WIDTH__ 8\000"
.LASF560:
	.ascii	"MAX(a,b) (((a) > (b)) ? (a) : (b))\000"
.LASF294:
	.ascii	"__ACCUM_MIN__ (-0X1P15K-0X1P15K)\000"
.LASF21:
	.ascii	"__SIZEOF_DOUBLE__ 8\000"
.LASF7:
	.ascii	"__GNUC_PATCHLEVEL__ 1\000"
.LASF346:
	.ascii	"__DA_FBIT__ 31\000"
.LASF255:
	.ascii	"__FRACT_MAX__ 0X7FFFP-15R\000"
.LASF76:
	.ascii	"__WINT_MIN__ 0U\000"
.LASF307:
	.ascii	"__ULACCUM_FBIT__ 32\000"
.LASF259:
	.ascii	"__UFRACT_MIN__ 0.0UR\000"
.LASF427:
	.ascii	"__ARM_NEON_FP\000"
.LASF2:
	.ascii	"__STDC_UTF_16__ 1\000"
.LASF253:
	.ascii	"__FRACT_IBIT__ 0\000"
.LASF305:
	.ascii	"__LACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LK\000"
.LASF348:
	.ascii	"__TA_FBIT__ 63\000"
.LASF191:
	.ascii	"__LDBL_HAS_INFINITY__ 1\000"
.LASF64:
	.ascii	"__UINT_FAST64_TYPE__ long long unsigned int\000"
.LASF102:
	.ascii	"__UINT32_MAX__ 0xffffffffUL\000"
.LASF140:
	.ascii	"__GCC_IEC_559_COMPLEX 2\000"
.LASF193:
	.ascii	"__FP_FAST_FMAL 1\000"
.LASF179:
	.ascii	"__LDBL_MIN_EXP__ (-1021)\000"
.LASF558:
	.ascii	"SEGGER_RTT_MEMCPY(pDest,pSrc,NumBytes) memcpy((pDes"
	.ascii	"t), (pSrc), (NumBytes))\000"
.LASF277:
	.ascii	"__ULLFRACT_FBIT__ 64\000"
.LASF380:
	.ascii	"__SIZEOF_WCHAR_T__ 4\000"
.LASF30:
	.ascii	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF295:
	.ascii	"__ACCUM_MAX__ 0X7FFFFFFFP-15K\000"
.LASF87:
	.ascii	"__SIZE_WIDTH__ 32\000"
.LASF385:
	.ascii	"__ARM_FEATURE_SAT 1\000"
.LASF529:
	.ascii	"RTT_CTRL_TEXT_BRIGHT_BLACK \"\\x1B[1;30m\"\000"
.LASF94:
	.ascii	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)\000"
.LASF276:
	.ascii	"__LLFRACT_EPSILON__ 0x1P-63LLR\000"
.LASF475:
	.ascii	"_CC_HAS_RTT_ASM_SUPPORT 1\000"
.LASF556:
	.ascii	"STRLEN(a) strlen((a))\000"
.LASF621:
	.ascii	"NumBytes\000"
.LASF550:
	.ascii	"RTT_CTRL_BG_BRIGHT_MAGENTA \"\\x1B[4;45m\"\000"
.LASF82:
	.ascii	"__LONG_WIDTH__ 32\000"
.LASF242:
	.ascii	"__SFRACT_FBIT__ 7\000"
.LASF39:
	.ascii	"__CHAR32_TYPE__ long unsigned int\000"
.LASF243:
	.ascii	"__SFRACT_IBIT__ 0\000"
.LASF602:
	.ascii	"SEGGER_RTT_SetFlagsDownBuffer\000"
.LASF396:
	.ascii	"__ARM_FEATURE_LDREX 7\000"
.LASF325:
	.ascii	"__HQ_IBIT__ 0\000"
.LASF466:
	.ascii	"SEGGER_RTT_MAX_NUM_DOWN_BUFFERS (3)\000"
.LASF469:
	.ascii	"SEGGER_RTT_PRINTF_BUFFER_SIZE (64u)\000"
.LASF359:
	.ascii	"__USER_LABEL_PREFIX__ \000"
.LASF473:
	.ascii	"SEGGER_RTT_LOCK() { unsigned int LockState; __asm v"
	.ascii	"olatile (\"mrs   %0, basepri  \\n\\t\" \"mov   r1, "
	.ascii	"%1       \\n\\t\" \"msr   basepri, r1  \\n\\t\" : \""
	.ascii	"=r\" (LockState) : \"i\"(SEGGER_RTT_MAX_INTERRUPT_P"
	.ascii	"RIORITY) : \"r1\" );\000"
.LASF629:
	.ascii	"SEGGER_RTT_ReadNoLock\000"
.LASF55:
	.ascii	"__UINT_LEAST32_TYPE__ long unsigned int\000"
.LASF328:
	.ascii	"__DQ_FBIT__ 63\000"
.LASF611:
	.ascii	"SEGGER_RTT_HasDataUp\000"
.LASF95:
	.ascii	"__SIG_ATOMIC_WIDTH__ 32\000"
.LASF491:
	.ascii	"__CTYPE_CNTRL 0x20\000"
.LASF442:
	.ascii	"__ARM_FEATURE_BF16_VECTOR_ARITHMETIC\000"
.LASF69:
	.ascii	"__SHRT_MAX__ 0x7fff\000"
.LASF420:
	.ascii	"__ARM_FP16_ARGS\000"
.LASF28:
	.ascii	"__ORDER_PDP_ENDIAN__ 3412\000"
.LASF54:
	.ascii	"__UINT_LEAST16_TYPE__ short unsigned int\000"
.LASF5:
	.ascii	"__GNUC__ 10\000"
.LASF582:
	.ascii	"acID\000"
.LASF151:
	.ascii	"__FLT_DECIMAL_DIG__ 9\000"
.LASF98:
	.ascii	"__INT32_MAX__ 0x7fffffffL\000"
.LASF85:
	.ascii	"__WINT_WIDTH__ 32\000"
.LASF514:
	.ascii	"SEGGER_RTT_HASDATA_UP(n) (_SEGGER_RTT.aUp[n].WrOff "
	.ascii	"- _SEGGER_RTT.aUp[n].RdOff)\000"
.LASF332:
	.ascii	"__UQQ_FBIT__ 8\000"
.LASF337:
	.ascii	"__USQ_IBIT__ 0\000"
.LASF16:
	.ascii	"__SIZEOF_INT__ 4\000"
.LASF616:
	.ascii	"SEGGER_RTT_PutChar\000"
.LASF458:
	.ascii	"ARM_MATH_CM7 1\000"
.LASF617:
	.ascii	"SEGGER_RTT_PutCharSkip\000"
.LASF339:
	.ascii	"__UDQ_IBIT__ 0\000"
.LASF261:
	.ascii	"__UFRACT_EPSILON__ 0x1P-16UR\000"
.LASF551:
	.ascii	"RTT_CTRL_BG_BRIGHT_CYAN \"\\x1B[4;46m\"\000"
.LASF334:
	.ascii	"__UHQ_FBIT__ 16\000"
.LASF43:
	.ascii	"__INT32_TYPE__ long int\000"
.LASF229:
	.ascii	"__FLT32X_MIN_10_EXP__ (-307)\000"
.LASF441:
	.ascii	"__ARM_FEATURE_BF16_SCALAR_ARITHMETIC\000"
.LASF568:
	.ascii	"long int\000"
.LASF434:
	.ascii	"__ARM_FEATURE_IDIV 1\000"
.LASF608:
	.ascii	"SEGGER_RTT_ConfigUpBuffer\000"
.LASF635:
	.ascii	"_GetAvailWriteSpace\000"
.LASF326:
	.ascii	"__SQ_FBIT__ 31\000"
.LASF519:
	.ascii	"RTT_CTRL_RESET \"\\x1B[0m\"\000"
.LASF264:
	.ascii	"__LFRACT_MIN__ (-0.5LR-0.5LR)\000"
.LASF176:
	.ascii	"__FP_FAST_FMA 1\000"
.LASF460:
	.ascii	"__USE_CRYSTAL_OSCILLATOR__ 1\000"
.LASF641:
	.ascii	"/home/tommy/Documents/CrossWorks Projects/Executabl"
	.ascii	"e_1/SEGGER/RTT/SEGGER_RTT.c\000"
.LASF485:
	.ascii	"__CODE \000"
.LASF120:
	.ascii	"__UINT_LEAST32_MAX__ 0xffffffffUL\000"
.LASF301:
	.ascii	"__UACCUM_EPSILON__ 0x1P-16UK\000"
.LASF192:
	.ascii	"__LDBL_HAS_QUIET_NAN__ 1\000"
.LASF41:
	.ascii	"__INT8_TYPE__ signed char\000"
.LASF225:
	.ascii	"__FP_FAST_FMAF64 1\000"
.LASF566:
	.ascii	"SEGGER_RTT_PUT_BUFFER_SECTION(Var) Var\000"
.LASF639:
	.ascii	"_DoInit\000"
.LASF184:
	.ascii	"__LDBL_DECIMAL_DIG__ 17\000"
.LASF545:
	.ascii	"RTT_CTRL_BG_BRIGHT_BLACK \"\\x1B[4;40m\"\000"
.LASF587:
	.ascii	"_aTerminalId\000"
.LASF534:
	.ascii	"RTT_CTRL_TEXT_BRIGHT_MAGENTA \"\\x1B[1;35m\"\000"
.LASF567:
	.ascii	"INIT() do { if (_SEGGER_RTT.acID[0] == '\\0') { _Do"
	.ascii	"Init(); } } while (0)\000"
.LASF330:
	.ascii	"__TQ_FBIT__ 127\000"
.LASF251:
	.ascii	"__USFRACT_EPSILON__ 0x1P-8UHR\000"
.LASF586:
	.ascii	"SEGGER_RTT_CB\000"
.LASF135:
	.ascii	"__UINT_FAST64_MAX__ 0xffffffffffffffffULL\000"
.LASF644:
	.ascii	"SEGGER_RTT_Init\000"
.LASF247:
	.ascii	"__USFRACT_FBIT__ 8\000"
.LASF114:
	.ascii	"__INT64_C(c) c ## LL\000"
.LASF324:
	.ascii	"__HQ_FBIT__ 15\000"
.LASF217:
	.ascii	"__FLT64_MAX__ 1.1\000"
.LASF351:
	.ascii	"__UHA_IBIT__ 8\000"
.LASF399:
	.ascii	"__ARM_FEATURE_SIMD32 1\000"
.LASF73:
	.ascii	"__WCHAR_MAX__ 0xffffffffU\000"
.LASF18:
	.ascii	"__SIZEOF_LONG_LONG__ 8\000"
.LASF45:
	.ascii	"__UINT8_TYPE__ unsigned char\000"
.LASF80:
	.ascii	"__SHRT_WIDTH__ 16\000"
.LASF559:
	.ascii	"MIN(a,b) (((a) < (b)) ? (a) : (b))\000"
.LASF52:
	.ascii	"__INT_LEAST64_TYPE__ long long int\000"
.LASF564:
	.ascii	"SEGGER_RTT_BUFFER_ALIGN(Var) Var\000"
.LASF503:
	.ascii	"EXIT_SUCCESS 0\000"
.LASF47:
	.ascii	"__UINT32_TYPE__ long unsigned int\000"
.LASF180:
	.ascii	"__LDBL_MIN_10_EXP__ (-307)\000"
.LASF472:
	.ascii	"SEGGER_RTT_MAX_INTERRUPT_PRIORITY (0x20)\000"
.LASF233:
	.ascii	"__FLT32X_MAX__ 1.1\000"
.LASF553:
	.ascii	"__string_H \000"
.LASF31:
	.ascii	"__SIZEOF_POINTER__ 4\000"
.LASF300:
	.ascii	"__UACCUM_MAX__ 0XFFFFFFFFP-16UK\000"
.LASF415:
	.ascii	"__VFP_FP__ 1\000"
.LASF270:
	.ascii	"__ULFRACT_MAX__ 0XFFFFFFFFP-32ULR\000"
.LASF614:
	.ascii	"SEGGER_RTT_WaitKey\000"
.LASF86:
	.ascii	"__PTRDIFF_WIDTH__ 32\000"
.LASF414:
	.ascii	"__ARMEL__ 1\000"
.LASF284:
	.ascii	"__SACCUM_MIN__ (-0X1P7HK-0X1P7HK)\000"
.LASF81:
	.ascii	"__INT_WIDTH__ 32\000"
.LASF377:
	.ascii	"__GCC_ATOMIC_POINTER_LOCK_FREE 2\000"
.LASF123:
	.ascii	"__UINT64_C(c) c ## ULL\000"
.LASF540:
	.ascii	"RTT_CTRL_BG_YELLOW \"\\x1B[24;43m\"\000"
.LASF306:
	.ascii	"__LACCUM_EPSILON__ 0x1P-31LK\000"
.LASF246:
	.ascii	"__SFRACT_EPSILON__ 0x1P-7HR\000"
.LASF468:
	.ascii	"BUFFER_SIZE_DOWN (16)\000"
.LASF333:
	.ascii	"__UQQ_IBIT__ 0\000"
.LASF448:
	.ascii	"__ARM_ARCH_FPV5_D16__ 1\000"
.LASF336:
	.ascii	"__USQ_FBIT__ 32\000"
.LASF634:
	.ascii	"NumBytesAtOnce\000"
.LASF370:
	.ascii	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2\000"
.LASF576:
	.ascii	"SizeOfBuffer\000"
.LASF156:
	.ascii	"__FLT_DENORM_MIN__ 1.1\000"
.LASF256:
	.ascii	"__FRACT_EPSILON__ 0x1P-15R\000"
.LASF4:
	.ascii	"__STDC_HOSTED__ 1\000"
.LASF622:
	.ascii	"SEGGER_RTT_WriteDownBuffer\000"
.LASF422:
	.ascii	"__ARM_FEATURE_FP16_VECTOR_ARITHMETIC\000"
.LASF136:
	.ascii	"__INTPTR_MAX__ 0x7fffffff\000"
.LASF626:
	.ascii	"SEGGER_RTT_Read\000"
.LASF170:
	.ascii	"__DBL_MIN__ ((double)1.1)\000"
.LASF234:
	.ascii	"__FLT32X_NORM_MAX__ 1.1\000"
.LASF484:
	.ascii	"__RAL_PTRDIFF_T int\000"
.LASF505:
	.ascii	"RAND_MAX 32767\000"
.LASF530:
	.ascii	"RTT_CTRL_TEXT_BRIGHT_RED \"\\x1B[1;31m\"\000"
.LASF375:
	.ascii	"__GCC_ATOMIC_LLONG_LOCK_FREE 1\000"
.LASF366:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1\000"
.LASF149:
	.ascii	"__FLT_MAX_EXP__ 128\000"
.LASF13:
	.ascii	"__ATOMIC_ACQ_REL 4\000"
.LASF444:
	.ascii	"__GXX_TYPEINFO_EQUALITY_INLINE 0\000"
.LASF571:
	.ascii	"unsigned char\000"
.LASF37:
	.ascii	"__UINTMAX_TYPE__ long long unsigned int\000"
.LASF482:
	.ascii	"__RAL_SIZE_T unsigned\000"
.LASF507:
	.ascii	"__stdarg_H \000"
.LASF65:
	.ascii	"__INTPTR_TYPE__ int\000"
.LASF430:
	.ascii	"__ARM_PCS_VFP 1\000"
.LASF143:
	.ascii	"__DEC_EVAL_METHOD__ 2\000"
.LASF204:
	.ascii	"__FLT32_EPSILON__ 1.1\000"
.LASF248:
	.ascii	"__USFRACT_IBIT__ 0\000"
.LASF542:
	.ascii	"RTT_CTRL_BG_MAGENTA \"\\x1B[24;45m\"\000"
.LASF112:
	.ascii	"__INT_LEAST32_WIDTH__ 32\000"
.LASF598:
	.ascii	"Avail\000"
.LASF410:
	.ascii	"__thumb2__ 1\000"
.LASF63:
	.ascii	"__UINT_FAST32_TYPE__ unsigned int\000"
.LASF471:
	.ascii	"SEGGER_RTT_MEMCPY_USE_BYTELOOP 0\000"
.LASF604:
	.ascii	"SEGGER_RTT_SetNameDownBuffer\000"
.LASF329:
	.ascii	"__DQ_IBIT__ 0\000"
.LASF502:
	.ascii	"NULL 0\000"
.LASF32:
	.ascii	"__SIZE_TYPE__ unsigned int\000"
.LASF565:
	.ascii	"SEGGER_RTT_PUT_CB_SECTION(Var) Var\000"
.LASF532:
	.ascii	"RTT_CTRL_TEXT_BRIGHT_YELLOW \"\\x1B[1;33m\"\000"
.LASF317:
	.ascii	"__ULLACCUM_FBIT__ 32\000"
.LASF500:
	.ascii	"__RAL_SIZE_T_DEFINED \000"
.LASF212:
	.ascii	"__FLT64_MIN_EXP__ (-1021)\000"
.LASF561:
	.ascii	"SEGGER_RTT_ALIGN(Var,Alignment) Var\000"
.LASF252:
	.ascii	"__FRACT_FBIT__ 15\000"
.LASF372:
	.ascii	"__GCC_ATOMIC_SHORT_LOCK_FREE 2\000"
.LASF630:
	.ascii	"NumBytesRem\000"
.LASF357:
	.ascii	"__UTA_IBIT__ 64\000"
.LASF501:
	.ascii	"__RAL_WCHAR_T_DEFINED \000"
.LASF148:
	.ascii	"__FLT_MIN_10_EXP__ (-37)\000"
.LASF228:
	.ascii	"__FLT32X_MIN_EXP__ (-1021)\000"
.LASF619:
	.ascii	"SEGGER_RTT_WriteString\000"
.LASF142:
	.ascii	"__FLT_EVAL_METHOD_TS_18661_3__ 0\000"
.LASF174:
	.ascii	"__DBL_HAS_INFINITY__ 1\000"
.LASF168:
	.ascii	"__DBL_MAX__ ((double)1.1)\000"
.LASF59:
	.ascii	"__INT_FAST32_TYPE__ int\000"
.LASF159:
	.ascii	"__FLT_HAS_QUIET_NAN__ 1\000"
.LASF584:
	.ascii	"MaxNumDownBuffers\000"
.LASF36:
	.ascii	"__INTMAX_TYPE__ long long int\000"
.LASF515:
	.ascii	"SEGGER_RTT_MODE_NO_BLOCK_SKIP (0)\000"
.LASF522:
	.ascii	"RTT_CTRL_TEXT_RED \"\\x1B[2;31m\"\000"
.LASF89:
	.ascii	"__INTMAX_C(c) c ## LL\000"
.LASF521:
	.ascii	"RTT_CTRL_TEXT_BLACK \"\\x1B[2;30m\"\000"
.LASF393:
	.ascii	"__ARM_FEATURE_MVE\000"
.LASF407:
	.ascii	"__APCS_32__ 1\000"
.LASF220:
	.ascii	"__FLT64_EPSILON__ 1.1\000"
.LASF297:
	.ascii	"__UACCUM_FBIT__ 16\000"
.LASF48:
	.ascii	"__UINT64_TYPE__ long long unsigned int\000"
.LASF240:
	.ascii	"__FLT32X_HAS_QUIET_NAN__ 1\000"
.LASF166:
	.ascii	"__DBL_MAX_10_EXP__ 308\000"
.LASF218:
	.ascii	"__FLT64_NORM_MAX__ 1.1\000"
.LASF520:
	.ascii	"RTT_CTRL_CLEAR \"\\x1B[2J\"\000"
.LASF572:
	.ascii	"short unsigned int\000"
.LASF368:
	.ascii	"__GCC_ATOMIC_CHAR_LOCK_FREE 2\000"
.LASF349:
	.ascii	"__TA_IBIT__ 64\000"
.LASF20:
	.ascii	"__SIZEOF_FLOAT__ 4\000"
.LASF631:
	.ascii	"SEGGER_RTT_ReadUpBufferNoLock\000"
.LASF615:
	.ascii	"SEGGER_RTT_GetKey\000"
.LASF239:
	.ascii	"__FLT32X_HAS_INFINITY__ 1\000"
.LASF125:
	.ascii	"__INT_FAST8_WIDTH__ 32\000"
.LASF181:
	.ascii	"__LDBL_MAX_EXP__ 1024\000"
.LASF147:
	.ascii	"__FLT_MIN_EXP__ (-125)\000"
.LASF490:
	.ascii	"__CTYPE_PUNCT 0x10\000"
.LASF409:
	.ascii	"__thumb__ 1\000"
.LASF636:
	.ascii	"_WriteBlocking\000"
.LASF183:
	.ascii	"__DECIMAL_DIG__ 17\000"
.LASF428:
	.ascii	"__THUMB_INTERWORK__ 1\000"
.LASF111:
	.ascii	"__INT32_C(c) c ## L\000"
.LASF547:
	.ascii	"RTT_CTRL_BG_BRIGHT_GREEN \"\\x1B[4;42m\"\000"
.LASF362:
	.ascii	"__STRICT_ANSI__ 1\000"
.LASF419:
	.ascii	"__ARM_FP16_FORMAT_ALTERNATIVE\000"
.LASF538:
	.ascii	"RTT_CTRL_BG_RED \"\\x1B[24;41m\"\000"
.LASF182:
	.ascii	"__LDBL_MAX_10_EXP__ 308\000"
.LASF231:
	.ascii	"__FLT32X_MAX_10_EXP__ 308\000"
.LASF138:
	.ascii	"__UINTPTR_MAX__ 0xffffffffU\000"
.LASF173:
	.ascii	"__DBL_HAS_DENORM__ 1\000"
.LASF467:
	.ascii	"BUFFER_SIZE_UP (4096)\000"
.LASF389:
	.ascii	"__ARM_FEATURE_CRC32\000"
.LASF199:
	.ascii	"__FLT32_MAX_10_EXP__ 38\000"
.LASF322:
	.ascii	"__QQ_FBIT__ 7\000"
.LASF265:
	.ascii	"__LFRACT_MAX__ 0X7FFFFFFFP-31LR\000"
.LASF429:
	.ascii	"__ARM_ARCH_7EM__ 1\000"
.LASF603:
	.ascii	"SEGGER_RTT_SetFlagsUpBuffer\000"
.LASF110:
	.ascii	"__INT_LEAST32_MAX__ 0x7fffffffL\000"
.LASF185:
	.ascii	"__LDBL_MAX__ 1.1\000"
.LASF633:
	.ascii	"_WriteNoCheck\000"
.LASF640:
	.ascii	"GNU C11 10.2.1 20201103 (release) -fmessage-length="
	.ascii	"0 -mcpu=cortex-m7 -mlittle-endian -mfloat-abi=hard "
	.ascii	"-mfpu=fpv5-d16 -mthumb -mtp=soft -munaligned-access"
	.ascii	" -std=c11 -g3 -gpubnames -O0 -fomit-frame-pointer -"
	.ascii	"fno-dwarf2-cfi-asm -fno-builtin -ffunction-sections"
	.ascii	" -fdata-sections -fshort-enums -fno-common\000"
.LASF417:
	.ascii	"__ARM_FP 14\000"
.LASF90:
	.ascii	"__UINTMAX_MAX__ 0xffffffffffffffffULL\000"
.LASF40:
	.ascii	"__SIG_ATOMIC_TYPE__ int\000"
.LASF499:
	.ascii	"__MAX_CATEGORY 5\000"
.LASF274:
	.ascii	"__LLFRACT_MIN__ (-0.5LLR-0.5LLR)\000"
.LASF219:
	.ascii	"__FLT64_MIN__ 1.1\000"
.LASF424:
	.ascii	"__ARM_FEATURE_FMA 1\000"
.LASF281:
	.ascii	"__ULLFRACT_EPSILON__ 0x1P-64ULLR\000"
.LASF190:
	.ascii	"__LDBL_HAS_DENORM__ 1\000"
.LASF395:
	.ascii	"__ARM_FEATURE_LDREX\000"
.LASF169:
	.ascii	"__DBL_NORM_MAX__ ((double)1.1)\000"
.LASF210:
	.ascii	"__FLT64_MANT_DIG__ 53\000"
.LASF287:
	.ascii	"__USACCUM_FBIT__ 8\000"
.LASF157:
	.ascii	"__FLT_HAS_DENORM__ 1\000"
.LASF131:
	.ascii	"__INT_FAST64_WIDTH__ 64\000"
.LASF167:
	.ascii	"__DBL_DECIMAL_DIG__ 17\000"
	.ident	"GCC: (GNU) 10.2.1 20201103 (release)"
