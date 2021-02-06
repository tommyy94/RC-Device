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
	.file	"SEGGER_RTT_printf.c"
	.text
.Ltext0:
	.section	.text._StoreChar,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	_StoreChar, %function
_StoreChar:
.LFB0:
	.file 1 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT_printf.c"
	.loc 1 111 60
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI0:
	sub	sp, sp, #20
.LCFI1:
	str	r0, [sp, #4]
	mov	r3, r1
	strb	r3, [sp, #3]
	.loc 1 114 7
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #8]
	str	r3, [sp, #12]
	.loc 1 115 12
	ldr	r3, [sp, #12]
	adds	r2, r3, #1
	.loc 1 115 22
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]
	.loc 1 115 6
	cmp	r2, r3
	bhi	.L2
	.loc 1 116 8
	ldr	r3, [sp, #4]
	ldr	r2, [r3]
	.loc 1 116 18
	ldr	r3, [sp, #12]
	add	r3, r3, r2
	.loc 1 116 25
	ldrb	r2, [sp, #3]
	strb	r2, [r3]
	.loc 1 117 18
	ldr	r3, [sp, #12]
	adds	r2, r3, #1
	.loc 1 117 12
	ldr	r3, [sp, #4]
	str	r2, [r3, #8]
	.loc 1 118 6
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	.loc 1 118 19
	adds	r2, r3, #1
	ldr	r3, [sp, #4]
	str	r2, [r3, #12]
.L2:
	.loc 1 123 8
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #8]
	.loc 1 123 18
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]
	.loc 1 123 6
	cmp	r2, r3
	bne	.L5
	.loc 1 124 9
	ldr	r3, [sp, #4]
	ldr	r0, [r3, #16]
	.loc 1 124 46
	ldr	r3, [sp, #4]
	ldr	r1, [r3]
	.loc 1 124 9
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #8]
	mov	r2, r3
	bl	SEGGER_RTT_Write
	mov	r2, r0
	.loc 1 124 69
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #8]
	.loc 1 124 8
	cmp	r2, r3
	beq	.L4
	.loc 1 125 22
	ldr	r3, [sp, #4]
	mov	r2, #-1
	str	r2, [r3, #12]
	.loc 1 130 1
	b	.L5
.L4:
	.loc 1 127 14
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #8]
.L5:
	.loc 1 130 1
	nop
	add	sp, sp, #20
.LCFI2:
	@ sp needed
	ldr	pc, [sp], #4
.LFE0:
	.size	_StoreChar, .-_StoreChar
	.section	.text._PrintUnsigned,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	_PrintUnsigned, %function
_PrintUnsigned:
.LFB1:
	.loc 1 136 156
	@ args = 8, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI3:
	sub	sp, sp, #44
.LCFI4:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	.loc 1 144 10
	ldr	r3, [sp, #8]
	str	r3, [sp, #32]
	.loc 1 145 9
	movs	r3, #1
	str	r3, [sp, #36]
	.loc 1 149 9
	movs	r3, #1
	str	r3, [sp, #28]
	.loc 1 150 9
	b	.L7
.L8:
	.loc 1 151 12
	ldr	r2, [sp, #32]
	ldr	r3, [sp, #4]
	udiv	r3, r2, r3
	str	r3, [sp, #32]
	.loc 1 152 10
	ldr	r3, [sp, #28]
	adds	r3, r3, #1
	str	r3, [sp, #28]
.L7:
	.loc 1 150 9
	ldr	r2, [sp, #32]
	ldr	r3, [sp, #4]
	cmp	r2, r3
	bcs	.L8
	.loc 1 154 6
	ldr	r2, [sp]
	ldr	r3, [sp, #28]
	cmp	r2, r3
	bls	.L9
	.loc 1 155 11
	ldr	r3, [sp]
	str	r3, [sp, #28]
.L9:
	.loc 1 160 20
	ldr	r3, [sp, #52]
	and	r3, r3, #1
	.loc 1 160 6
	cmp	r3, #0
	bne	.L10
	.loc 1 161 8
	ldr	r3, [sp, #48]
	cmp	r3, #0
	beq	.L10
	.loc 1 162 25
	ldr	r3, [sp, #52]
	and	r3, r3, #2
	.loc 1 162 10
	cmp	r3, #0
	beq	.L11
	.loc 1 162 74 discriminator 1
	ldr	r3, [sp]
	cmp	r3, #0
	bne	.L11
	.loc 1 163 11
	movs	r3, #48
	strb	r3, [sp, #27]
	b	.L12
.L11:
	.loc 1 165 11
	movs	r3, #32
	strb	r3, [sp, #27]
.L12:
	.loc 1 167 13
	b	.L13
.L14:
	.loc 1 168 19
	ldr	r3, [sp, #48]
	subs	r3, r3, #1
	str	r3, [sp, #48]
	.loc 1 169 9
	ldrb	r3, [sp, #27]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, [sp, #12]
	bl	_StoreChar
	.loc 1 170 24
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #12]
	.loc 1 170 12
	cmp	r3, #0
	blt	.L25
.L13:
	.loc 1 167 13
	ldr	r3, [sp, #48]
	cmp	r3, #0
	beq	.L10
	.loc 1 167 33 discriminator 1
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #48]
	cmp	r2, r3
	bcc	.L14
	b	.L10
.L25:
	.loc 1 171 11
	nop
.L10:
	.loc 1 176 18
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #12]
	.loc 1 176 6
	cmp	r3, #0
	blt	.L26
.L19:
	.loc 1 183 10
	ldr	r3, [sp]
	cmp	r3, #1
	bls	.L16
	.loc 1 184 18
	ldr	r3, [sp]
	subs	r3, r3, #1
	str	r3, [sp]
	b	.L17
.L16:
	.loc 1 186 13
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #36]
	udiv	r3, r2, r3
	str	r3, [sp, #20]
	.loc 1 187 12
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #4]
	cmp	r2, r3
	bcs	.L17
	.loc 1 188 11
	b	.L18
.L17:
	.loc 1 191 13
	ldr	r3, [sp, #36]
	ldr	r2, [sp, #4]
	mul	r3, r2, r3
	str	r3, [sp, #36]
	.loc 1 183 10
	b	.L19
.L18:
	.loc 1 197 11
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #36]
	udiv	r3, r2, r3
	str	r3, [sp, #20]
	.loc 1 198 16
	ldr	r3, [sp, #20]
	ldr	r2, [sp, #36]
	mul	r3, r2, r3
	.loc 1 198 9
	ldr	r2, [sp, #8]
	subs	r3, r2, r3
	str	r3, [sp, #8]
	.loc 1 199 7
	ldr	r2, .L29
	ldr	r3, [sp, #20]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, [sp, #12]
	bl	_StoreChar
	.loc 1 200 22
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #12]
	.loc 1 200 10
	cmp	r3, #0
	blt	.L27
	.loc 1 203 13
	ldr	r2, [sp, #36]
	ldr	r3, [sp, #4]
	udiv	r3, r2, r3
	str	r3, [sp, #36]
	.loc 1 204 5
	ldr	r3, [sp, #36]
	cmp	r3, #0
	bne	.L18
	b	.L21
.L27:
	.loc 1 201 9
	nop
.L21:
	.loc 1 208 22
	ldr	r3, [sp, #52]
	and	r3, r3, #1
	.loc 1 208 8
	cmp	r3, #0
	beq	.L26
	.loc 1 209 10
	ldr	r3, [sp, #48]
	cmp	r3, #0
	beq	.L26
	.loc 1 210 15
	b	.L22
.L23:
	.loc 1 211 21
	ldr	r3, [sp, #48]
	subs	r3, r3, #1
	str	r3, [sp, #48]
	.loc 1 212 11
	movs	r1, #32
	ldr	r0, [sp, #12]
	bl	_StoreChar
	.loc 1 213 26
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #12]
	.loc 1 213 14
	cmp	r3, #0
	blt	.L28
.L22:
	.loc 1 210 15
	ldr	r3, [sp, #48]
	cmp	r3, #0
	beq	.L26
	.loc 1 210 35 discriminator 1
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #48]
	cmp	r2, r3
	bcc	.L23
	.loc 1 220 1
	b	.L26
.L28:
	.loc 1 214 13
	nop
.L26:
	.loc 1 220 1
	nop
	add	sp, sp, #44
.LCFI5:
	@ sp needed
	ldr	pc, [sp], #4
.L30:
	.align	2
.L29:
	.word	_aV2C.0
.LFE1:
	.size	_PrintUnsigned, .-_PrintUnsigned
	.section	.text._PrintInt,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	_PrintInt, %function
_PrintInt:
.LFB2:
	.loc 1 226 146
	@ args = 8, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI6:
	sub	sp, sp, #36
.LCFI7:
	str	r0, [sp, #20]
	str	r1, [sp, #16]
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	.loc 1 230 10
	ldr	r3, [sp, #16]
	cmp	r3, #0
	it	lt
	rsblt	r3, r3, #0
	str	r3, [sp, #24]
	.loc 1 235 9
	movs	r3, #1
	str	r3, [sp, #28]
	.loc 1 236 9
	b	.L32
.L33:
	.loc 1 237 24
	ldr	r3, [sp, #12]
	.loc 1 237 12
	ldr	r2, [sp, #24]
	sdiv	r3, r2, r3
	str	r3, [sp, #24]
	.loc 1 238 10
	ldr	r3, [sp, #28]
	adds	r3, r3, #1
	str	r3, [sp, #28]
.L32:
	.loc 1 236 20
	ldr	r3, [sp, #12]
	.loc 1 236 9
	ldr	r2, [sp, #24]
	cmp	r2, r3
	bge	.L33
	.loc 1 240 6
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #28]
	cmp	r2, r3
	bls	.L34
	.loc 1 241 11
	ldr	r3, [sp, #8]
	str	r3, [sp, #28]
.L34:
	.loc 1 243 6
	ldr	r3, [sp, #40]
	cmp	r3, #0
	beq	.L35
	.loc 1 243 25 discriminator 1
	ldr	r3, [sp, #16]
	cmp	r3, #0
	blt	.L36
	.loc 1 243 54 discriminator 2
	ldr	r3, [sp, #44]
	and	r3, r3, #4
	.loc 1 243 37 discriminator 2
	cmp	r3, #0
	beq	.L35
.L36:
	.loc 1 244 15
	ldr	r3, [sp, #40]
	subs	r3, r3, #1
	str	r3, [sp, #40]
.L35:
	.loc 1 250 22
	ldr	r3, [sp, #44]
	and	r3, r3, #2
	.loc 1 250 6
	cmp	r3, #0
	beq	.L37
	.loc 1 250 53 discriminator 2
	ldr	r3, [sp, #8]
	cmp	r3, #0
	beq	.L38
.L37:
	.loc 1 250 92 discriminator 3
	ldr	r3, [sp, #44]
	and	r3, r3, #1
	.loc 1 250 75 discriminator 3
	cmp	r3, #0
	bne	.L38
	.loc 1 251 8
	ldr	r3, [sp, #40]
	cmp	r3, #0
	beq	.L38
	.loc 1 252 13
	b	.L39
.L40:
	.loc 1 253 19
	ldr	r3, [sp, #40]
	subs	r3, r3, #1
	str	r3, [sp, #40]
	.loc 1 254 9
	movs	r1, #32
	ldr	r0, [sp, #20]
	bl	_StoreChar
	.loc 1 255 24
	ldr	r3, [sp, #20]
	ldr	r3, [r3, #12]
	.loc 1 255 12
	cmp	r3, #0
	blt	.L47
.L39:
	.loc 1 252 13
	ldr	r3, [sp, #40]
	cmp	r3, #0
	beq	.L38
	.loc 1 252 33 discriminator 1
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #40]
	cmp	r2, r3
	bcc	.L40
	b	.L38
.L47:
	.loc 1 256 11
	nop
.L38:
	.loc 1 264 18
	ldr	r3, [sp, #20]
	ldr	r3, [r3, #12]
	.loc 1 264 6
	cmp	r3, #0
	blt	.L48
	.loc 1 265 8
	ldr	r3, [sp, #16]
	cmp	r3, #0
	bge	.L42
	.loc 1 266 9
	ldr	r3, [sp, #16]
	rsbs	r3, r3, #0
	str	r3, [sp, #16]
	.loc 1 267 7
	movs	r1, #45
	ldr	r0, [sp, #20]
	bl	_StoreChar
	b	.L43
.L42:
	.loc 1 268 29
	ldr	r3, [sp, #44]
	and	r3, r3, #4
	.loc 1 268 15
	cmp	r3, #0
	beq	.L43
	.loc 1 269 7
	movs	r1, #43
	ldr	r0, [sp, #20]
	bl	_StoreChar
.L43:
	.loc 1 273 20
	ldr	r3, [sp, #20]
	ldr	r3, [r3, #12]
	.loc 1 273 8
	cmp	r3, #0
	blt	.L48
	.loc 1 277 25
	ldr	r3, [sp, #44]
	and	r3, r3, #2
	.loc 1 277 10
	cmp	r3, #0
	beq	.L44
	.loc 1 277 91 discriminator 1
	ldr	r3, [sp, #44]
	and	r3, r3, #1
	.loc 1 277 74 discriminator 1
	cmp	r3, #0
	bne	.L44
	.loc 1 277 126 discriminator 2
	ldr	r3, [sp, #8]
	cmp	r3, #0
	bne	.L44
	.loc 1 278 12
	ldr	r3, [sp, #40]
	cmp	r3, #0
	beq	.L44
	.loc 1 279 17
	b	.L45
.L46:
	.loc 1 280 23
	ldr	r3, [sp, #40]
	subs	r3, r3, #1
	str	r3, [sp, #40]
	.loc 1 281 13
	movs	r1, #48
	ldr	r0, [sp, #20]
	bl	_StoreChar
	.loc 1 282 28
	ldr	r3, [sp, #20]
	ldr	r3, [r3, #12]
	.loc 1 282 16
	cmp	r3, #0
	blt	.L49
.L45:
	.loc 1 279 17
	ldr	r3, [sp, #40]
	cmp	r3, #0
	beq	.L44
	.loc 1 279 37 discriminator 1
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #40]
	cmp	r2, r3
	bcc	.L46
	b	.L44
.L49:
	.loc 1 283 15
	nop
.L44:
	.loc 1 288 22
	ldr	r3, [sp, #20]
	ldr	r3, [r3, #12]
	.loc 1 288 10
	cmp	r3, #0
	blt	.L48
	.loc 1 292 9
	ldr	r1, [sp, #16]
	ldr	r3, [sp, #44]
	str	r3, [sp, #4]
	ldr	r3, [sp, #40]
	str	r3, [sp]
	ldr	r3, [sp, #8]
	ldr	r2, [sp, #12]
	ldr	r0, [sp, #20]
	bl	_PrintUnsigned
.L48:
	.loc 1 296 1
	nop
	add	sp, sp, #36
.LCFI8:
	@ sp needed
	ldr	pc, [sp], #4
.LFE2:
	.size	_PrintInt, .-_PrintInt
	.section	.text.SEGGER_RTT_vprintf,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_vprintf
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_vprintf, %function
SEGGER_RTT_vprintf:
.LFB3:
	.loc 1 321 90
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI9:
	sub	sp, sp, #140
.LCFI10:
	str	r0, [sp, #20]
	str	r1, [sp, #16]
	str	r2, [sp, #12]
	.loc 1 330 29
	add	r3, sp, #24
	str	r3, [sp, #88]
	.loc 1 331 29
	movs	r3, #64
	str	r3, [sp, #92]
	.loc 1 332 29
	movs	r3, #0
	str	r3, [sp, #96]
	.loc 1 333 29
	ldr	r3, [sp, #20]
	str	r3, [sp, #104]
	.loc 1 334 29
	movs	r3, #0
	str	r3, [sp, #100]
.L83:
	.loc 1 337 7
	ldr	r3, [sp, #16]
	ldrb	r3, [r3]
	strb	r3, [sp, #135]
	.loc 1 338 12
	ldr	r3, [sp, #16]
	adds	r3, r3, #1
	str	r3, [sp, #16]
	.loc 1 339 8
	ldrb	r3, [sp, #135]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L88
	.loc 1 342 8
	ldrb	r3, [sp, #135]	@ zero_extendqisi2
	cmp	r3, #37
	bne	.L53
	.loc 1 346 19
	movs	r3, #0
	str	r3, [sp, #120]
	.loc 1 347 9
	movs	r3, #1
	str	r3, [sp, #128]
.L61:
	.loc 1 349 11
	ldr	r3, [sp, #16]
	ldrb	r3, [r3]
	strb	r3, [sp, #135]
	.loc 1 350 9
	ldrb	r3, [sp, #135]	@ zero_extendqisi2
	subs	r3, r3, #35
	cmp	r3, #13
	bhi	.L54
	adr	r2, .L56
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L56:
	.word	.L59+1
	.word	.L54+1
	.word	.L54+1
	.word	.L54+1
	.word	.L54+1
	.word	.L54+1
	.word	.L54+1
	.word	.L54+1
	.word	.L58+1
	.word	.L54+1
	.word	.L57+1
	.word	.L54+1
	.word	.L54+1
	.word	.L55+1
	.p2align 1
.L57:
	.loc 1 351 31
	ldr	r3, [sp, #120]
	orr	r3, r3, #1
	str	r3, [sp, #120]
	.loc 1 351 67
	ldr	r3, [sp, #16]
	adds	r3, r3, #1
	str	r3, [sp, #16]
	.loc 1 351 9
	b	.L60
.L55:
	.loc 1 352 31
	ldr	r3, [sp, #120]
	orr	r3, r3, #2
	str	r3, [sp, #120]
	.loc 1 352 67
	ldr	r3, [sp, #16]
	adds	r3, r3, #1
	str	r3, [sp, #16]
	.loc 1 352 9
	b	.L60
.L58:
	.loc 1 353 31
	ldr	r3, [sp, #120]
	orr	r3, r3, #4
	str	r3, [sp, #120]
	.loc 1 353 67
	ldr	r3, [sp, #16]
	adds	r3, r3, #1
	str	r3, [sp, #16]
	.loc 1 353 9
	b	.L60
.L59:
	.loc 1 354 31
	ldr	r3, [sp, #120]
	orr	r3, r3, #8
	str	r3, [sp, #120]
	.loc 1 354 67
	ldr	r3, [sp, #16]
	adds	r3, r3, #1
	str	r3, [sp, #16]
	.loc 1 354 9
	b	.L60
.L54:
	.loc 1 355 21
	movs	r3, #0
	str	r3, [sp, #128]
	.loc 1 355 9
	nop
.L60:
	.loc 1 357 7
	ldr	r3, [sp, #128]
	cmp	r3, #0
	bne	.L61
	.loc 1 361 18
	movs	r3, #0
	str	r3, [sp, #116]
.L63:
	.loc 1 363 11
	ldr	r3, [sp, #16]
	ldrb	r3, [r3]
	strb	r3, [sp, #135]
	.loc 1 364 12
	ldrb	r3, [sp, #135]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L62
	.loc 1 364 23 discriminator 1
	ldrb	r3, [sp, #135]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L62
	.loc 1 367 16
	ldr	r3, [sp, #16]
	adds	r3, r3, #1
	str	r3, [sp, #16]
	.loc 1 368 34
	ldr	r2, [sp, #116]
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r3, r3, #1
	mov	r2, r3
	.loc 1 368 44
	ldrb	r3, [sp, #135]	@ zero_extendqisi2
	.loc 1 368 41
	add	r3, r3, r2
	.loc 1 368 20
	subs	r3, r3, #48
	str	r3, [sp, #116]
	.loc 1 363 11
	b	.L63
.L62:
	.loc 1 374 17
	movs	r3, #0
	str	r3, [sp, #124]
	.loc 1 375 9
	ldr	r3, [sp, #16]
	ldrb	r3, [r3]
	strb	r3, [sp, #135]
	.loc 1 376 10
	ldrb	r3, [sp, #135]	@ zero_extendqisi2
	cmp	r3, #46
	bne	.L64
	.loc 1 377 16
	ldr	r3, [sp, #16]
	adds	r3, r3, #1
	str	r3, [sp, #16]
.L65:
	.loc 1 379 13
	ldr	r3, [sp, #16]
	ldrb	r3, [r3]
	strb	r3, [sp, #135]
	.loc 1 380 14
	ldrb	r3, [sp, #135]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L64
	.loc 1 380 25 discriminator 1
	ldrb	r3, [sp, #135]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L64
	.loc 1 383 18
	ldr	r3, [sp, #16]
	adds	r3, r3, #1
	str	r3, [sp, #16]
	.loc 1 384 33
	ldr	r2, [sp, #124]
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r3, r3, #1
	mov	r2, r3
	.loc 1 384 42
	ldrb	r3, [sp, #135]	@ zero_extendqisi2
	.loc 1 384 39
	add	r3, r3, r2
	.loc 1 384 21
	subs	r3, r3, #48
	str	r3, [sp, #124]
	.loc 1 379 13
	b	.L65
.L64:
	.loc 1 390 9
	ldr	r3, [sp, #16]
	ldrb	r3, [r3]
	strb	r3, [sp, #135]
.L68:
	.loc 1 392 12
	ldrb	r3, [sp, #135]	@ zero_extendqisi2
	cmp	r3, #108
	beq	.L66
	.loc 1 392 24 discriminator 1
	ldrb	r3, [sp, #135]	@ zero_extendqisi2
	cmp	r3, #104
	bne	.L67
.L66:
	.loc 1 393 18
	ldr	r3, [sp, #16]
	adds	r3, r3, #1
	str	r3, [sp, #16]
	.loc 1 394 13
	ldr	r3, [sp, #16]
	ldrb	r3, [r3]
	strb	r3, [sp, #135]
	.loc 1 392 12
	b	.L68
.L67:
	.loc 1 402 7
	ldrb	r3, [sp, #135]	@ zero_extendqisi2
	cmp	r3, #37
	beq	.L69
	cmp	r3, #37
	blt	.L89
	cmp	r3, #120
	bgt	.L89
	cmp	r3, #88
	blt	.L89
	subs	r3, r3, #88
	cmp	r3, #32
	bhi	.L89
	adr	r2, .L72
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L72:
	.word	.L71+1
	.word	.L89+1
	.word	.L89+1
	.word	.L89+1
	.word	.L89+1
	.word	.L89+1
	.word	.L89+1
	.word	.L89+1
	.word	.L89+1
	.word	.L89+1
	.word	.L89+1
	.word	.L77+1
	.word	.L76+1
	.word	.L89+1
	.word	.L89+1
	.word	.L89+1
	.word	.L89+1
	.word	.L89+1
	.word	.L89+1
	.word	.L89+1
	.word	.L89+1
	.word	.L89+1
	.word	.L89+1
	.word	.L89+1
	.word	.L75+1
	.word	.L89+1
	.word	.L89+1
	.word	.L74+1
	.word	.L89+1
	.word	.L73+1
	.word	.L89+1
	.word	.L89+1
	.word	.L71+1
	.p2align 1
.L77:
.LBB2:
	.loc 1 405 11
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	adds	r1, r3, #4
	ldr	r2, [sp, #12]
	str	r1, [r2]
	ldr	r3, [r3]
	str	r3, [sp, #128]
	.loc 1 406 12
	ldr	r3, [sp, #128]
	strb	r3, [sp, #111]
	.loc 1 407 9
	ldrb	r2, [sp, #111]	@ zero_extendqisi2
	add	r3, sp, #88
	mov	r1, r2
	mov	r0, r3
	bl	_StoreChar
	.loc 1 408 9
	b	.L78
.L76:
.LBE2:
	.loc 1 411 11
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	adds	r1, r3, #4
	ldr	r2, [sp, #12]
	str	r1, [r2]
	ldr	r3, [r3]
	str	r3, [sp, #128]
	.loc 1 412 9
	add	r0, sp, #88
	ldr	r3, [sp, #120]
	str	r3, [sp, #4]
	ldr	r3, [sp, #116]
	str	r3, [sp]
	ldr	r3, [sp, #124]
	movs	r2, #10
	ldr	r1, [sp, #128]
	bl	_PrintInt
	.loc 1 413 9
	b	.L78
.L73:
	.loc 1 415 11
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	adds	r1, r3, #4
	ldr	r2, [sp, #12]
	str	r1, [r2]
	ldr	r3, [r3]
	str	r3, [sp, #128]
	.loc 1 416 9
	ldr	r1, [sp, #128]
	add	r0, sp, #88
	ldr	r3, [sp, #120]
	str	r3, [sp, #4]
	ldr	r3, [sp, #116]
	str	r3, [sp]
	ldr	r3, [sp, #124]
	movs	r2, #10
	bl	_PrintUnsigned
	.loc 1 417 9
	b	.L78
.L71:
	.loc 1 420 11
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	adds	r1, r3, #4
	ldr	r2, [sp, #12]
	str	r1, [r2]
	ldr	r3, [r3]
	str	r3, [sp, #128]
	.loc 1 421 9
	ldr	r1, [sp, #128]
	add	r0, sp, #88
	ldr	r3, [sp, #120]
	str	r3, [sp, #4]
	ldr	r3, [sp, #116]
	str	r3, [sp]
	ldr	r3, [sp, #124]
	movs	r2, #16
	bl	_PrintUnsigned
	.loc 1 422 9
	b	.L78
.L74:
.LBB3:
	.loc 1 425 24
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	adds	r1, r3, #4
	ldr	r2, [sp, #12]
	str	r1, [r2]
	ldr	r3, [r3]
	str	r3, [sp, #112]
.L81:
	.loc 1 427 15
	ldr	r3, [sp, #112]
	ldrb	r3, [r3]
	strb	r3, [sp, #135]
	.loc 1 428 14
	ldr	r3, [sp, #112]
	adds	r3, r3, #1
	str	r3, [sp, #112]
	.loc 1 429 16
	ldrb	r3, [sp, #135]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L90
	.loc 1 432 12
	ldrb	r2, [sp, #135]	@ zero_extendqisi2
	add	r3, sp, #88
	mov	r1, r2
	mov	r0, r3
	bl	_StoreChar
	.loc 1 433 30
	ldr	r3, [sp, #100]
	.loc 1 433 11
	cmp	r3, #0
	bge	.L81
.LBE3:
	.loc 1 435 9
	b	.L78
.L90:
.LBB4:
	.loc 1 430 15
	nop
.LBE4:
	.loc 1 435 9
	b	.L78
.L75:
	.loc 1 437 11
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	adds	r1, r3, #4
	ldr	r2, [sp, #12]
	str	r1, [r2]
	ldr	r3, [r3]
	str	r3, [sp, #128]
	.loc 1 438 9
	ldr	r1, [sp, #128]
	add	r0, sp, #88
	movs	r3, #0
	str	r3, [sp, #4]
	movs	r3, #8
	str	r3, [sp]
	movs	r3, #8
	movs	r2, #16
	bl	_PrintUnsigned
	.loc 1 439 9
	b	.L78
.L69:
	.loc 1 441 9
	add	r3, sp, #88
	movs	r1, #37
	mov	r0, r3
	bl	_StoreChar
	.loc 1 442 9
	b	.L78
.L89:
	.loc 1 444 9
	nop
.L78:
	.loc 1 446 14
	ldr	r3, [sp, #16]
	adds	r3, r3, #1
	str	r3, [sp, #16]
	b	.L82
.L53:
	.loc 1 448 7
	ldrb	r2, [sp, #135]	@ zero_extendqisi2
	add	r3, sp, #88
	mov	r1, r2
	mov	r0, r3
	bl	_StoreChar
.L82:
	.loc 1 450 22
	ldr	r3, [sp, #100]
	.loc 1 450 3
	cmp	r3, #0
	bge	.L83
	b	.L52
.L88:
	.loc 1 340 7
	nop
.L52:
	.loc 1 452 17
	ldr	r3, [sp, #100]
	.loc 1 452 6
	cmp	r3, #0
	ble	.L84
	.loc 1 456 19
	ldr	r3, [sp, #96]
	.loc 1 456 8
	cmp	r3, #0
	beq	.L85
	.loc 1 457 7
	ldr	r2, [sp, #96]
	add	r3, sp, #24
	mov	r1, r3
	ldr	r0, [sp, #20]
	bl	SEGGER_RTT_Write
.L85:
	.loc 1 459 28
	ldr	r3, [sp, #100]
	.loc 1 459 46
	ldr	r2, [sp, #96]
	.loc 1 459 28
	add	r3, r3, r2
	str	r3, [sp, #100]
.L84:
	.loc 1 461 20
	ldr	r3, [sp, #100]
	.loc 1 462 1
	mov	r0, r3
	add	sp, sp, #140
.LCFI11:
	@ sp needed
	ldr	pc, [sp], #4
.LFE3:
	.size	SEGGER_RTT_vprintf, .-SEGGER_RTT_vprintf
	.section	.text.SEGGER_RTT_printf,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_printf
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	SEGGER_RTT_printf, %function
SEGGER_RTT_printf:
.LFB4:
	.loc 1 495 72
	@ args = 4, pretend = 12, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 1
	push	{r1, r2, r3}
.LCFI12:
	push	{lr}
.LCFI13:
	sub	sp, sp, #16
.LCFI14:
	str	r0, [sp, #4]
	.loc 1 499 3
	add	r3, sp, #24
	str	r3, [sp, #8]
	.loc 1 500 7
	add	r3, sp, #8
	mov	r2, r3
	ldr	r1, [sp, #20]
	ldr	r0, [sp, #4]
	bl	SEGGER_RTT_vprintf
	str	r0, [sp, #12]
	.loc 1 502 10
	ldr	r3, [sp, #12]
	.loc 1 503 1
	mov	r0, r3
	add	sp, sp, #16
.LCFI15:
	@ sp needed
	ldr	lr, [sp], #4
.LCFI16:
	add	sp, sp, #12
.LCFI17:
	bx	lr
.LFE4:
	.size	SEGGER_RTT_printf, .-SEGGER_RTT_printf
	.section	.rodata._aV2C.0,"a"
	.align	2
	.type	_aV2C.0, %object
	.size	_aV2C.0, 16
_aV2C.0:
	.ascii	"0123456789ABCDEF"
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
	.uleb128 0x18
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
	.uleb128 0x30
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
	.uleb128 0x90
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
	.uleb128 0xc
	.byte	0x81
	.uleb128 0x3
	.byte	0x82
	.uleb128 0x2
	.byte	0x83
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0x10
	.byte	0x8e
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI14-.LCFI13
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI15-.LCFI14
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
	.byte	0xce
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.4byte	.LCFI17-.LCFI16
	.byte	0xc3
	.byte	0xc2
	.byte	0xc1
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE8:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_4.8/include/__crossworks.h"
	.file 3 "/usr/share/crossworks_for_arm_4.8/include/stdarg.h"
	.file 4 "<built-in>"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x3fc
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF589
	.byte	0xc
	.4byte	.LASF590
	.4byte	.LASF591
	.4byte	.Ldebug_ranges0+0x18
	.4byte	0
	.4byte	.Ldebug_line0
	.4byte	.Ldebug_macro0
	.uleb128 0x2
	.4byte	.LASF563
	.byte	0x2
	.byte	0x2b
	.byte	0x1b
	.4byte	0x35
	.uleb128 0x3
	.4byte	.LASF563
	.byte	0x4
	.byte	0x4
	.byte	0
	.4byte	0x4c
	.uleb128 0x4
	.4byte	.LASF592
	.4byte	0x4c
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x7
	.byte	0x4
	.byte	0x5
	.4byte	.LASF557
	.uleb128 0x8
	.byte	0x4
	.4byte	0x62
	.uleb128 0x7
	.byte	0x1
	.byte	0x8
	.4byte	.LASF558
	.uleb128 0x9
	.4byte	0x62
	.uleb128 0x7
	.byte	0x4
	.byte	0x7
	.4byte	.LASF559
	.uleb128 0x8
	.byte	0x4
	.4byte	0x69
	.uleb128 0x7
	.byte	0x1
	.byte	0x8
	.4byte	.LASF560
	.uleb128 0x7
	.byte	0x2
	.byte	0x7
	.4byte	.LASF561
	.uleb128 0x7
	.byte	0x8
	.byte	0x5
	.4byte	.LASF562
	.uleb128 0x2
	.4byte	.LASF564
	.byte	0x3
	.byte	0x24
	.byte	0x13
	.4byte	0x29
	.uleb128 0xa
	.byte	0x14
	.byte	0x1
	.byte	0x54
	.byte	0x9
	.4byte	0xe7
	.uleb128 0xb
	.4byte	.LASF565
	.byte	0x1
	.byte	0x55
	.byte	0xd
	.4byte	0x5c
	.byte	0
	.uleb128 0xb
	.4byte	.LASF566
	.byte	0x1
	.byte	0x56
	.byte	0xd
	.4byte	0x6e
	.byte	0x4
	.uleb128 0xc
	.ascii	"Cnt\000"
	.byte	0x1
	.byte	0x57
	.byte	0xd
	.4byte	0x6e
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF567
	.byte	0x1
	.byte	0x59
	.byte	0x9
	.4byte	0x4e
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF568
	.byte	0x1
	.byte	0x5b
	.byte	0xc
	.4byte	0x6e
	.byte	0x10
	.byte	0
	.uleb128 0x2
	.4byte	.LASF569
	.byte	0x1
	.byte	0x5c
	.byte	0x3
	.4byte	0x9c
	.uleb128 0xd
	.4byte	.LASF573
	.byte	0x1
	.2byte	0x1ef
	.byte	0x5
	.4byte	0x4e
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x14e
	.uleb128 0xe
	.4byte	.LASF570
	.byte	0x1
	.2byte	0x1ef
	.byte	0x20
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xe
	.4byte	.LASF571
	.byte	0x1
	.2byte	0x1ef
	.byte	0x3a
	.4byte	0x75
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xf
	.uleb128 0x10
	.ascii	"r\000"
	.byte	0x1
	.2byte	0x1f0
	.byte	0x7
	.4byte	0x4e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	.LASF572
	.byte	0x1
	.2byte	0x1f1
	.byte	0xb
	.4byte	0x90
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xd
	.4byte	.LASF574
	.byte	0x1
	.2byte	0x141
	.byte	0x5
	.4byte	0x4e
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x23b
	.uleb128 0xe
	.4byte	.LASF570
	.byte	0x1
	.2byte	0x141
	.byte	0x21
	.4byte	0x6e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -124
	.uleb128 0xe
	.4byte	.LASF571
	.byte	0x1
	.2byte	0x141
	.byte	0x3b
	.4byte	0x75
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0xe
	.4byte	.LASF575
	.byte	0x1
	.2byte	0x141
	.byte	0x4e
	.4byte	0x23b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -132
	.uleb128 0x10
	.ascii	"c\000"
	.byte	0x1
	.2byte	0x142
	.byte	0x8
	.4byte	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x11
	.4byte	.LASF576
	.byte	0x1
	.2byte	0x143
	.byte	0x1a
	.4byte	0xe7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x10
	.ascii	"v\000"
	.byte	0x1
	.2byte	0x144
	.byte	0x7
	.4byte	0x4e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x11
	.4byte	.LASF577
	.byte	0x1
	.2byte	0x145
	.byte	0xc
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	.LASF578
	.byte	0x1
	.2byte	0x146
	.byte	0xc
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.4byte	.LASF579
	.byte	0x1
	.2byte	0x147
	.byte	0xc
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.4byte	.LASF580
	.byte	0x1
	.2byte	0x148
	.byte	0x8
	.4byte	0x241
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x12
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0x226
	.uleb128 0x10
	.ascii	"c0\000"
	.byte	0x1
	.2byte	0x194
	.byte	0xe
	.4byte	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -33
	.byte	0
	.uleb128 0x13
	.4byte	.Ldebug_ranges0+0
	.uleb128 0x10
	.ascii	"s\000"
	.byte	0x1
	.2byte	0x1a9
	.byte	0x18
	.4byte	0x75
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x90
	.uleb128 0x14
	.4byte	0x62
	.4byte	0x251
	.uleb128 0x15
	.4byte	0x6e
	.byte	0x3f
	.byte	0
	.uleb128 0x16
	.4byte	.LASF585
	.byte	0x1
	.byte	0xe2
	.byte	0xd
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2de
	.uleb128 0x17
	.4byte	.LASF581
	.byte	0x1
	.byte	0xe2
	.byte	0x30
	.4byte	0x2de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x18
	.ascii	"v\000"
	.byte	0x1
	.byte	0xe2
	.byte	0x41
	.4byte	0x4e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x17
	.4byte	.LASF582
	.byte	0x1
	.byte	0xe2
	.byte	0x4d
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x17
	.4byte	.LASF577
	.byte	0x1
	.byte	0xe2
	.byte	0x5c
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x17
	.4byte	.LASF579
	.byte	0x1
	.byte	0xe2
	.byte	0x70
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.4byte	.LASF578
	.byte	0x1
	.byte	0xe2
	.byte	0x85
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x19
	.4byte	.LASF583
	.byte	0x1
	.byte	0xe3
	.byte	0xc
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x19
	.4byte	.LASF584
	.byte	0x1
	.byte	0xe4
	.byte	0x7
	.4byte	0x4e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0xe7
	.uleb128 0x16
	.4byte	.LASF586
	.byte	0x1
	.byte	0x88
	.byte	0xd
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3ae
	.uleb128 0x17
	.4byte	.LASF581
	.byte	0x1
	.byte	0x88
	.byte	0x35
	.4byte	0x2de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x18
	.ascii	"v\000"
	.byte	0x1
	.byte	0x88
	.byte	0x4b
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x17
	.4byte	.LASF582
	.byte	0x1
	.byte	0x88
	.byte	0x57
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x17
	.4byte	.LASF577
	.byte	0x1
	.byte	0x88
	.byte	0x66
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x17
	.4byte	.LASF579
	.byte	0x1
	.byte	0x88
	.byte	0x7a
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.4byte	.LASF578
	.byte	0x1
	.byte	0x88
	.byte	0x8f
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x19
	.4byte	.LASF587
	.byte	0x1
	.byte	0x89
	.byte	0x15
	.4byte	0x3be
	.uleb128 0x5
	.byte	0x3
	.4byte	_aV2C.0
	.uleb128 0x1a
	.ascii	"Div\000"
	.byte	0x1
	.byte	0x8a
	.byte	0xc
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x19
	.4byte	.LASF588
	.byte	0x1
	.byte	0x8b
	.byte	0xc
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x19
	.4byte	.LASF584
	.byte	0x1
	.byte	0x8c
	.byte	0xc
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x19
	.4byte	.LASF583
	.byte	0x1
	.byte	0x8d
	.byte	0xc
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.ascii	"c\000"
	.byte	0x1
	.byte	0x8e
	.byte	0x8
	.4byte	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.byte	0
	.uleb128 0x14
	.4byte	0x69
	.4byte	0x3be
	.uleb128 0x15
	.4byte	0x6e
	.byte	0xf
	.byte	0
	.uleb128 0x9
	.4byte	0x3ae
	.uleb128 0x1b
	.4byte	.LASF593
	.byte	0x1
	.byte	0x6f
	.byte	0xd
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x18
	.ascii	"p\000"
	.byte	0x1
	.byte	0x6f
	.byte	0x31
	.4byte	0x2de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x18
	.ascii	"c\000"
	.byte	0x1
	.byte	0x6f
	.byte	0x39
	.4byte	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x1a
	.ascii	"Cnt\000"
	.byte	0x1
	.byte	0x70
	.byte	0xc
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
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
	.uleb128 0x3
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
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
	.uleb128 0x17
	.uleb128 0x5
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
	.uleb128 0x18
	.uleb128 0x5
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0x34
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
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
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x6b
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x400
	.4byte	0xf3
	.ascii	"SEGGER_RTT_printf\000"
	.4byte	0x14e
	.ascii	"SEGGER_RTT_vprintf\000"
	.4byte	0x251
	.ascii	"_PrintInt\000"
	.4byte	0x2e4
	.ascii	"_PrintUnsigned\000"
	.4byte	0x3c3
	.ascii	"_StoreChar\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0xbb
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x400
	.4byte	0x35
	.ascii	"__va_list\000"
	.4byte	0x29
	.ascii	"__va_list\000"
	.4byte	0x4e
	.ascii	"int\000"
	.4byte	0x55
	.ascii	"long int\000"
	.4byte	0x62
	.ascii	"char\000"
	.4byte	0x6e
	.ascii	"unsigned int\000"
	.4byte	0x7b
	.ascii	"unsigned char\000"
	.4byte	0x82
	.ascii	"short unsigned int\000"
	.4byte	0x89
	.ascii	"long long int\000"
	.4byte	0x90
	.ascii	"va_list\000"
	.4byte	0xe7
	.ascii	"SEGGER_RTT_PRINTF_DESC\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x3c
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
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LBB3
	.4byte	.LBE3
	.4byte	.LBB4
	.4byte	.LBE4
	.4byte	0
	.4byte	0
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
	.file 5 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT.h"
	.byte	0x3
	.uleb128 0x36
	.uleb128 0x5
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF463
	.file 6 "/home/tommy/Documents/CrossWorks Projects/Executable_1/SEGGER/RTT/SEGGER_RTT_Conf.h"
	.byte	0x3
	.uleb128 0x3c
	.uleb128 0x6
	.byte	0x7
	.4byte	.Ldebug_macro3
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro4
	.file 7 "/usr/share/crossworks_for_arm_4.8/include/stdlib.h"
	.byte	0x3
	.uleb128 0x76
	.uleb128 0x7
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF478
	.byte	0x3
	.uleb128 0xe
	.uleb128 0x2
	.byte	0x7
	.4byte	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro6
	.byte	0x4
	.byte	0x3
	.uleb128 0x77
	.uleb128 0x3
	.byte	0x7
	.4byte	.Ldebug_macro7
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro8
	.byte	0x4
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF553
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF554
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF555
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF556
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
.LASF61:
	.ascii	"__UINT_FAST8_TYPE__ unsigned int\000"
.LASF214:
	.ascii	"__FLT64_MAX_EXP__ 1024\000"
.LASF526:
	.ascii	"RTT_CTRL_TEXT_MAGENTA \"\\x1B[2;35m\"\000"
.LASF410:
	.ascii	"__thumb2__ 1\000"
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
.LASF558:
	.ascii	"char\000"
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
.LASF339:
	.ascii	"__UDQ_IBIT__ 0\000"
.LASF232:
	.ascii	"__FLT32X_DECIMAL_DIG__ 17\000"
.LASF163:
	.ascii	"__DBL_MIN_EXP__ (-1021)\000"
.LASF83:
	.ascii	"__LONG_LONG_WIDTH__ 64\000"
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
.LASF520:
	.ascii	"RTT_CTRL_CLEAR \"\\x1B[2J\"\000"
.LASF541:
	.ascii	"RTT_CTRL_BG_BLUE \"\\x1B[24;44m\"\000"
.LASF435:
	.ascii	"__ARM_ASM_SYNTAX_UNIFIED__ 1\000"
.LASF476:
	.ascii	"_CORE_HAS_RTT_ASM_SUPPORT 1\000"
.LASF559:
	.ascii	"unsigned int\000"
.LASF386:
	.ascii	"__ARM_FEATURE_CRYPTO\000"
.LASF119:
	.ascii	"__UINT16_C(c) c\000"
.LASF19:
	.ascii	"__SIZEOF_SHORT__ 2\000"
.LASF38:
	.ascii	"__CHAR16_TYPE__ short unsigned int\000"
.LASF519:
	.ascii	"RTT_CTRL_RESET \"\\x1B[0m\"\000"
.LASF22:
	.ascii	"__SIZEOF_LONG_DOUBLE__ 8\000"
.LASF320:
	.ascii	"__ULLACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULLK\000"
.LASF152:
	.ascii	"__FLT_MAX__ 1.1\000"
.LASF124:
	.ascii	"__INT_FAST8_MAX__ 0x7fffffff\000"
.LASF27:
	.ascii	"__ORDER_BIG_ENDIAN__ 4321\000"
.LASF280:
	.ascii	"__ULLFRACT_MAX__ 0XFFFFFFFFFFFFFFFFP-64ULLR\000"
.LASF383:
	.ascii	"__ARM_FEATURE_DSP 1\000"
.LASF450:
	.ascii	"__CROSSWORKS_MAJOR_VERSION 4\000"
.LASF356:
	.ascii	"__UTA_FBIT__ 64\000"
.LASF161:
	.ascii	"__DBL_MANT_DIG__ 53\000"
.LASF56:
	.ascii	"__UINT_LEAST64_TYPE__ long long unsigned int\000"
.LASF236:
	.ascii	"__FLT32X_EPSILON__ 1.1\000"
.LASF70:
	.ascii	"__INT_MAX__ 0x7fffffff\000"
.LASF12:
	.ascii	"__ATOMIC_RELEASE 3\000"
.LASF33:
	.ascii	"__PTRDIFF_TYPE__ int\000"
.LASF208:
	.ascii	"__FLT32_HAS_QUIET_NAN__ 1\000"
.LASF579:
	.ascii	"FieldWidth\000"
.LASF42:
	.ascii	"__INT16_TYPE__ short int\000"
.LASF388:
	.ascii	"__ARM_FEATURE_QRDMX\000"
.LASF178:
	.ascii	"__LDBL_DIG__ 15\000"
.LASF235:
	.ascii	"__FLT32X_MIN__ 1.1\000"
.LASF556:
	.ascii	"FORMAT_FLAG_ALTERNATE (1u << 3)\000"
.LASF313:
	.ascii	"__LLACCUM_IBIT__ 32\000"
.LASF10:
	.ascii	"__ATOMIC_SEQ_CST 5\000"
.LASF219:
	.ascii	"__FLT64_MIN__ 1.1\000"
.LASF517:
	.ascii	"SEGGER_RTT_MODE_BLOCK_IF_FIFO_FULL (2)\000"
.LASF188:
	.ascii	"__LDBL_EPSILON__ 1.1\000"
.LASF49:
	.ascii	"__INT_LEAST8_TYPE__ signed char\000"
.LASF210:
	.ascii	"__FLT64_MANT_DIG__ 53\000"
.LASF91:
	.ascii	"__UINTMAX_C(c) c ## ULL\000"
.LASF464:
	.ascii	"SEGGER_RTT_CONF_H \000"
.LASF565:
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
.LASF574:
	.ascii	"SEGGER_RTT_vprintf\000"
.LASF107:
	.ascii	"__INT_LEAST16_MAX__ 0x7fff\000"
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
.LASF174:
	.ascii	"__DBL_HAS_INFINITY__ 1\000"
.LASF423:
	.ascii	"__ARM_FEATURE_FP16_FML\000"
.LASF78:
	.ascii	"__SIZE_MAX__ 0xffffffffU\000"
.LASF567:
	.ascii	"ReturnValue\000"
.LASF304:
	.ascii	"__LACCUM_MIN__ (-0X1P31LK-0X1P31LK)\000"
.LASF569:
	.ascii	"SEGGER_RTT_PRINTF_DESC\000"
.LASF309:
	.ascii	"__ULACCUM_MIN__ 0.0ULK\000"
.LASF479:
	.ascii	"__crossworks_H \000"
.LASF511:
	.ascii	"va_end(ap) __builtin_va_end(ap)\000"
.LASF158:
	.ascii	"__FLT_HAS_INFINITY__ 1\000"
.LASF546:
	.ascii	"RTT_CTRL_BG_BRIGHT_RED \"\\x1B[4;41m\"\000"
.LASF53:
	.ascii	"__UINT_LEAST8_TYPE__ unsigned char\000"
.LASF355:
	.ascii	"__UDA_IBIT__ 32\000"
.LASF525:
	.ascii	"RTT_CTRL_TEXT_BLUE \"\\x1B[2;34m\"\000"
.LASF60:
	.ascii	"__INT_FAST64_TYPE__ long long int\000"
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
.LASF319:
	.ascii	"__ULLACCUM_MIN__ 0.0ULLK\000"
.LASF456:
	.ascii	"__SAME70Q21B__ 1\000"
.LASF390:
	.ascii	"__ARM_FEATURE_DOTPROD\000"
.LASF426:
	.ascii	"__ARM_NEON\000"
.LASF570:
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
.LASF591:
	.ascii	"/home/tommy/Documents/CrossWorks Projects/Executabl"
	.ascii	"e_1\000"
.LASF400:
	.ascii	"__ARM_SIZEOF_MINIMAL_ENUM 1\000"
.LASF572:
	.ascii	"ParamList\000"
.LASF508:
	.ascii	"va_start(v,l) __builtin_va_start((v),l)\000"
.LASF516:
	.ascii	"SEGGER_RTT_MODE_NO_BLOCK_TRIM (1)\000"
.LASF460:
	.ascii	"__USE_CRYSTAL_OSCILLATOR__ 1\000"
.LASF291:
	.ascii	"__USACCUM_EPSILON__ 0x1P-8UHK\000"
.LASF568:
	.ascii	"RTTBufferIndex\000"
.LASF77:
	.ascii	"__PTRDIFF_MAX__ 0x7fffffff\000"
.LASF580:
	.ascii	"acBuffer\000"
.LASF310:
	.ascii	"__ULACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULK\000"
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
.LASF587:
	.ascii	"_aV2C\000"
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
.LASF205:
	.ascii	"__FLT32_DENORM_MIN__ 1.1\000"
.LASF421:
	.ascii	"__ARM_FEATURE_FP16_SCALAR_ARITHMETIC\000"
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
.LASF446:
	.ascii	"__SIZEOF_WCHAR_T 4\000"
.LASF254:
	.ascii	"__FRACT_MIN__ (-0.5R-0.5R)\000"
.LASF483:
	.ascii	"__RAL_SIZE_MAX 4294967295UL\000"
.LASF373:
	.ascii	"__GCC_ATOMIC_INT_LOCK_FREE 2\000"
.LASF88:
	.ascii	"__INTMAX_MAX__ 0x7fffffffffffffffLL\000"
.LASF301:
	.ascii	"__UACCUM_EPSILON__ 0x1P-16UK\000"
.LASF293:
	.ascii	"__ACCUM_IBIT__ 16\000"
.LASF329:
	.ascii	"__DQ_IBIT__ 0\000"
.LASF215:
	.ascii	"__FLT64_MAX_10_EXP__ 308\000"
.LASF26:
	.ascii	"__ORDER_LITTLE_ENDIAN__ 1234\000"
.LASF382:
	.ascii	"__SIZEOF_PTRDIFF_T__ 4\000"
.LASF379:
	.ascii	"__PRAGMA_REDEFINE_EXTNAME 1\000"
.LASF244:
	.ascii	"__SFRACT_MIN__ (-0.5HR-0.5HR)\000"
.LASF171:
	.ascii	"__DBL_EPSILON__ ((double)1.1)\000"
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
.LASF20:
	.ascii	"__SIZEOF_FLOAT__ 4\000"
.LASF480:
	.ascii	"__THREAD __thread\000"
.LASF290:
	.ascii	"__USACCUM_MAX__ 0XFFFFP-8UHK\000"
.LASF121:
	.ascii	"__UINT32_C(c) c ## UL\000"
.LASF354:
	.ascii	"__UDA_FBIT__ 32\000"
.LASF444:
	.ascii	"__GXX_TYPEINFO_EQUALITY_INLINE 0\000"
.LASF447:
	.ascii	"__CROSSWORKS_ARM 1\000"
.LASF411:
	.ascii	"__THUMBEL__ 1\000"
.LASF187:
	.ascii	"__LDBL_MIN__ 1.1\000"
.LASF536:
	.ascii	"RTT_CTRL_TEXT_BRIGHT_WHITE \"\\x1B[1;37m\"\000"
.LASF142:
	.ascii	"__FLT_EVAL_METHOD_TS_18661_3__ 0\000"
.LASF25:
	.ascii	"__BIGGEST_ALIGNMENT__ 8\000"
.LASF303:
	.ascii	"__LACCUM_IBIT__ 32\000"
.LASF496:
	.ascii	"__CTYPE_GRAPH (__CTYPE_PUNCT | __CTYPE_UPPER | __CT"
	.ascii	"YPE_LOWER | __CTYPE_DIGIT)\000"
.LASF250:
	.ascii	"__USFRACT_MAX__ 0XFFP-8UHR\000"
.LASF132:
	.ascii	"__UINT_FAST8_MAX__ 0xffffffffU\000"
.LASF378:
	.ascii	"__HAVE_SPECULATION_SAFE_VALUE 1\000"
.LASF314:
	.ascii	"__LLACCUM_MIN__ (-0X1P31LLK-0X1P31LLK)\000"
.LASF344:
	.ascii	"__SA_FBIT__ 15\000"
.LASF213:
	.ascii	"__FLT64_MIN_10_EXP__ (-307)\000"
.LASF422:
	.ascii	"__ARM_FEATURE_FP16_VECTOR_ARITHMETIC\000"
.LASF286:
	.ascii	"__SACCUM_EPSILON__ 0x1P-7HK\000"
.LASF241:
	.ascii	"__FP_FAST_FMAF32x 1\000"
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
.LASF585:
	.ascii	"_PrintInt\000"
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
.LASF315:
	.ascii	"__LLACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LLK\000"
.LASF316:
	.ascii	"__LLACCUM_EPSILON__ 0x1P-31LLK\000"
.LASF289:
	.ascii	"__USACCUM_MIN__ 0.0UHK\000"
.LASF226:
	.ascii	"__FLT32X_MANT_DIG__ 53\000"
.LASF361:
	.ascii	"__NO_INLINE__ 1\000"
.LASF436:
	.ascii	"__ARM_FEATURE_COPROC\000"
.LASF269:
	.ascii	"__ULFRACT_MIN__ 0.0ULR\000"
.LASF145:
	.ascii	"__FLT_MANT_DIG__ 24\000"
.LASF405:
	.ascii	"__ARM_ARCH\000"
.LASF216:
	.ascii	"__FLT64_DECIMAL_DIG__ 17\000"
.LASF552:
	.ascii	"RTT_CTRL_BG_BRIGHT_WHITE \"\\x1B[4;47m\"\000"
.LASF358:
	.ascii	"__REGISTER_PREFIX__ \000"
.LASF575:
	.ascii	"pParamList\000"
.LASF196:
	.ascii	"__FLT32_MIN_EXP__ (-125)\000"
.LASF506:
	.ascii	"MB_CUR_MAX __RAL_mb_max(&__RAL_global_locale)\000"
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
.LASF586:
	.ascii	"_PrintUnsigned\000"
.LASF252:
	.ascii	"__FRACT_FBIT__ 15\000"
.LASF222:
	.ascii	"__FLT64_HAS_DENORM__ 1\000"
.LASF141:
	.ascii	"__FLT_EVAL_METHOD__ 0\000"
.LASF238:
	.ascii	"__FLT32X_HAS_DENORM__ 1\000"
.LASF544:
	.ascii	"RTT_CTRL_BG_WHITE \"\\x1B[24;47m\"\000"
.LASF113:
	.ascii	"__INT_LEAST64_MAX__ 0x7fffffffffffffffLL\000"
.LASF549:
	.ascii	"RTT_CTRL_BG_BRIGHT_BLUE \"\\x1B[4;44m\"\000"
.LASF221:
	.ascii	"__FLT64_DENORM_MIN__ 1.1\000"
.LASF371:
	.ascii	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2\000"
.LASF566:
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
.LASF8:
	.ascii	"__VERSION__ \"10.2.1 20201103 (release)\"\000"
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
.LASF50:
	.ascii	"__INT_LEAST16_TYPE__ short int\000"
.LASF198:
	.ascii	"__FLT32_MAX_EXP__ 128\000"
.LASF139:
	.ascii	"__GCC_IEC_559 2\000"
.LASF40:
	.ascii	"__SIG_ATOMIC_TYPE__ int\000"
.LASF162:
	.ascii	"__DBL_DIG__ 15\000"
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
.LASF564:
	.ascii	"va_list\000"
.LASF413:
	.ascii	"__ARM_ARCH_ISA_THUMB 2\000"
.LASF195:
	.ascii	"__FLT32_DIG__ 6\000"
.LASF340:
	.ascii	"__UTQ_FBIT__ 128\000"
.LASF153:
	.ascii	"__FLT_NORM_MAX__ 1.1\000"
.LASF562:
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
.LASF285:
	.ascii	"__SACCUM_MAX__ 0X7FFFP-7HK\000"
.LASF404:
	.ascii	"__arm__ 1\000"
.LASF177:
	.ascii	"__LDBL_MANT_DIG__ 53\000"
.LASF331:
	.ascii	"__TQ_IBIT__ 0\000"
.LASF350:
	.ascii	"__UHA_FBIT__ 8\000"
.LASF408:
	.ascii	"__GCC_ASM_FLAG_OUTPUTS__ 1\000"
.LASF512:
	.ascii	"SEGGER_RTT_HASDATA(n) (_SEGGER_RTT.aDown[n].WrOff -"
	.ascii	" _SEGGER_RTT.aDown[n].RdOff)\000"
.LASF513:
	.ascii	"SEGGER_RTT_WriteSkipNoLock SEGGER_RTT_ASM_WriteSkip"
	.ascii	"NoLock\000"
.LASF202:
	.ascii	"__FLT32_NORM_MAX__ 1.1\000"
.LASF445:
	.ascii	"__ELF__ 1\000"
.LASF524:
	.ascii	"RTT_CTRL_TEXT_YELLOW \"\\x1B[2;33m\"\000"
.LASF108:
	.ascii	"__INT16_C(c) c\000"
.LASF384:
	.ascii	"__ARM_FEATURE_QBIT 1\000"
.LASF103:
	.ascii	"__UINT64_MAX__ 0xffffffffffffffffULL\000"
.LASF305:
	.ascii	"__LACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LK\000"
.LASF128:
	.ascii	"__INT_FAST32_MAX__ 0x7fffffff\000"
.LASF592:
	.ascii	"__ap\000"
.LASF11:
	.ascii	"__ATOMIC_ACQUIRE 2\000"
.LASF584:
	.ascii	"Number\000"
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
.LASF294:
	.ascii	"__ACCUM_MIN__ (-0X1P15K-0X1P15K)\000"
.LASF21:
	.ascii	"__SIZEOF_DOUBLE__ 8\000"
.LASF7:
	.ascii	"__GNUC_PATCHLEVEL__ 1\000"
.LASF346:
	.ascii	"__DA_FBIT__ 31\000"
.LASF186:
	.ascii	"__LDBL_NORM_MAX__ 1.1\000"
.LASF255:
	.ascii	"__FRACT_MAX__ 0X7FFFP-15R\000"
.LASF76:
	.ascii	"__WINT_MIN__ 0U\000"
.LASF307:
	.ascii	"__ULACCUM_FBIT__ 32\000"
.LASF259:
	.ascii	"__UFRACT_MIN__ 0.0UR\000"
.LASF555:
	.ascii	"FORMAT_FLAG_PRINT_SIGN (1u << 2)\000"
.LASF427:
	.ascii	"__ARM_NEON_FP\000"
.LASF2:
	.ascii	"__STDC_UTF_16__ 1\000"
.LASF253:
	.ascii	"__FRACT_IBIT__ 0\000"
.LASF583:
	.ascii	"Width\000"
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
.LASF277:
	.ascii	"__ULLFRACT_FBIT__ 64\000"
.LASF380:
	.ascii	"__SIZEOF_WCHAR_T__ 4\000"
.LASF115:
	.ascii	"__INT_LEAST64_WIDTH__ 64\000"
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
.LASF82:
	.ascii	"__LONG_WIDTH__ 32\000"
.LASF242:
	.ascii	"__SFRACT_FBIT__ 7\000"
.LASF39:
	.ascii	"__CHAR32_TYPE__ long unsigned int\000"
.LASF243:
	.ascii	"__SFRACT_IBIT__ 0\000"
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
.LASF484:
	.ascii	"__RAL_PTRDIFF_T int\000"
.LASF55:
	.ascii	"__UINT_LEAST32_TYPE__ long unsigned int\000"
.LASF328:
	.ascii	"__DQ_FBIT__ 63\000"
.LASF37:
	.ascii	"__UINTMAX_TYPE__ long long unsigned int\000"
.LASF463:
	.ascii	"SEGGER_RTT_H \000"
.LASF396:
	.ascii	"__ARM_FEATURE_LDREX 7\000"
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
.LASF327:
	.ascii	"__SQ_IBIT__ 0\000"
.LASF5:
	.ascii	"__GNUC__ 10\000"
.LASF451:
	.ascii	"__CROSSWORKS_MINOR_VERSION 8\000"
.LASF151:
	.ascii	"__FLT_DECIMAL_DIG__ 9\000"
.LASF98:
	.ascii	"__INT32_MAX__ 0x7fffffffL\000"
.LASF453:
	.ascii	"__GNU_LINKER 1\000"
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
.LASF528:
	.ascii	"RTT_CTRL_TEXT_WHITE \"\\x1B[2;37m\"\000"
.LASF67:
	.ascii	"__GXX_ABI_VERSION 1014\000"
.LASF458:
	.ascii	"ARM_MATH_CM7 1\000"
.LASF180:
	.ascii	"__LDBL_MIN_10_EXP__ (-307)\000"
.LASF545:
	.ascii	"RTT_CTRL_BG_BRIGHT_BLACK \"\\x1B[4;40m\"\000"
.LASF261:
	.ascii	"__UFRACT_EPSILON__ 0x1P-16UR\000"
.LASF306:
	.ascii	"__LACCUM_EPSILON__ 0x1P-31LK\000"
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
.LASF557:
	.ascii	"long int\000"
.LASF434:
	.ascii	"__ARM_FEATURE_IDIV 1\000"
.LASF181:
	.ascii	"__LDBL_MAX_EXP__ 1024\000"
.LASF326:
	.ascii	"__SQ_FBIT__ 31\000"
.LASF588:
	.ascii	"Digit\000"
.LASF264:
	.ascii	"__LFRACT_MIN__ (-0.5LR-0.5LR)\000"
.LASF176:
	.ascii	"__FP_FAST_FMA 1\000"
.LASF550:
	.ascii	"RTT_CTRL_BG_BRIGHT_MAGENTA \"\\x1B[4;45m\"\000"
.LASF485:
	.ascii	"__CODE \000"
.LASF573:
	.ascii	"SEGGER_RTT_printf\000"
.LASF409:
	.ascii	"__thumb__ 1\000"
.LASF192:
	.ascii	"__LDBL_HAS_QUIET_NAN__ 1\000"
.LASF41:
	.ascii	"__INT8_TYPE__ signed char\000"
.LASF225:
	.ascii	"__FP_FAST_FMAF64 1\000"
.LASF184:
	.ascii	"__LDBL_DECIMAL_DIG__ 17\000"
.LASF534:
	.ascii	"RTT_CTRL_TEXT_BRIGHT_MAGENTA \"\\x1B[1;35m\"\000"
.LASF330:
	.ascii	"__TQ_FBIT__ 127\000"
.LASF251:
	.ascii	"__USFRACT_EPSILON__ 0x1P-8UHR\000"
.LASF353:
	.ascii	"__USA_IBIT__ 16\000"
.LASF553:
	.ascii	"FORMAT_FLAG_LEFT_JUSTIFY (1u << 0)\000"
.LASF363:
	.ascii	"__CHAR_UNSIGNED__ 1\000"
.LASF135:
	.ascii	"__UINT_FAST64_MAX__ 0xffffffffffffffffULL\000"
.LASF134:
	.ascii	"__UINT_FAST32_MAX__ 0xffffffffU\000"
.LASF247:
	.ascii	"__USFRACT_FBIT__ 8\000"
.LASF114:
	.ascii	"__INT64_C(c) c ## LL\000"
.LASF324:
	.ascii	"__HQ_FBIT__ 15\000"
.LASF217:
	.ascii	"__FLT64_MAX__ 1.1\000"
.LASF576:
	.ascii	"BufferDesc\000"
.LASF73:
	.ascii	"__WCHAR_MAX__ 0xffffffffU\000"
.LASF18:
	.ascii	"__SIZEOF_LONG_LONG__ 8\000"
.LASF45:
	.ascii	"__UINT8_TYPE__ unsigned char\000"
.LASF80:
	.ascii	"__SHRT_WIDTH__ 16\000"
.LASF52:
	.ascii	"__INT_LEAST64_TYPE__ long long int\000"
.LASF503:
	.ascii	"EXIT_SUCCESS 0\000"
.LASF47:
	.ascii	"__UINT32_TYPE__ long unsigned int\000"
.LASF593:
	.ascii	"_StoreChar\000"
.LASF472:
	.ascii	"SEGGER_RTT_MAX_INTERRUPT_PRIORITY (0x20)\000"
.LASF233:
	.ascii	"__FLT32X_MAX__ 1.1\000"
.LASF31:
	.ascii	"__SIZEOF_POINTER__ 4\000"
.LASF300:
	.ascii	"__UACCUM_MAX__ 0XFFFFFFFFP-16UK\000"
.LASF399:
	.ascii	"__ARM_FEATURE_SIMD32 1\000"
.LASF415:
	.ascii	"__VFP_FP__ 1\000"
.LASF270:
	.ascii	"__ULFRACT_MAX__ 0XFFFFFFFFP-32ULR\000"
.LASF582:
	.ascii	"Base\000"
.LASF342:
	.ascii	"__HA_FBIT__ 7\000"
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
.LASF370:
	.ascii	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2\000"
.LASF563:
	.ascii	"__va_list\000"
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
.LASF343:
	.ascii	"__HA_IBIT__ 8\000"
.LASF571:
	.ascii	"sFormat\000"
.LASF156:
	.ascii	"__FLT_DENORM_MIN__ 1.1\000"
.LASF23:
	.ascii	"__SIZEOF_SIZE_T__ 4\000"
.LASF256:
	.ascii	"__FRACT_EPSILON__ 0x1P-15R\000"
.LASF4:
	.ascii	"__STDC_HOSTED__ 1\000"
.LASF136:
	.ascii	"__INTPTR_MAX__ 0x7fffffff\000"
.LASF170:
	.ascii	"__DBL_MIN__ ((double)1.1)\000"
.LASF234:
	.ascii	"__FLT32X_NORM_MAX__ 1.1\000"
.LASF505:
	.ascii	"RAND_MAX 32767\000"
.LASF532:
	.ascii	"RTT_CTRL_TEXT_BRIGHT_YELLOW \"\\x1B[1;33m\"\000"
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
.LASF120:
	.ascii	"__UINT_LEAST32_MAX__ 0xffffffffUL\000"
.LASF560:
	.ascii	"unsigned char\000"
.LASF533:
	.ascii	"RTT_CTRL_TEXT_BRIGHT_BLUE \"\\x1B[1;34m\"\000"
.LASF482:
	.ascii	"__RAL_SIZE_T unsigned\000"
.LASF347:
	.ascii	"__DA_IBIT__ 32\000"
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
.LASF504:
	.ascii	"EXIT_FAILURE 1\000"
.LASF63:
	.ascii	"__UINT_FAST32_TYPE__ unsigned int\000"
.LASF471:
	.ascii	"SEGGER_RTT_MEMCPY_USE_BYTELOOP 0\000"
.LASF189:
	.ascii	"__LDBL_DENORM_MIN__ 1.1\000"
.LASF402:
	.ascii	"__ARM_ARCH_PROFILE\000"
.LASF502:
	.ascii	"NULL 0\000"
.LASF32:
	.ascii	"__SIZE_TYPE__ unsigned int\000"
.LASF457:
	.ascii	"__SAM_E_FAMILY 1\000"
.LASF317:
	.ascii	"__ULLACCUM_FBIT__ 32\000"
.LASF500:
	.ascii	"__RAL_SIZE_T_DEFINED \000"
.LASF212:
	.ascii	"__FLT64_MIN_EXP__ (-1021)\000"
.LASF578:
	.ascii	"FormatFlags\000"
.LASF495:
	.ascii	"__CTYPE_ALNUM (__CTYPE_UPPER | __CTYPE_LOWER | __CT"
	.ascii	"YPE_DIGIT)\000"
.LASF357:
	.ascii	"__UTA_IBIT__ 64\000"
.LASF501:
	.ascii	"__RAL_WCHAR_T_DEFINED \000"
.LASF148:
	.ascii	"__FLT_MIN_10_EXP__ (-37)\000"
.LASF228:
	.ascii	"__FLT32X_MIN_EXP__ (-1021)\000"
.LASF74:
	.ascii	"__WCHAR_MIN__ 0U\000"
.LASF308:
	.ascii	"__ULACCUM_IBIT__ 32\000"
.LASF465:
	.ascii	"SEGGER_RTT_MAX_NUM_UP_BUFFERS (3)\000"
.LASF168:
	.ascii	"__DBL_MAX__ ((double)1.1)\000"
.LASF59:
	.ascii	"__INT_FAST32_TYPE__ int\000"
.LASF283:
	.ascii	"__SACCUM_IBIT__ 8\000"
.LASF159:
	.ascii	"__FLT_HAS_QUIET_NAN__ 1\000"
.LASF75:
	.ascii	"__WINT_MAX__ 0xffffffffU\000"
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
.LASF561:
	.ascii	"short unsigned int\000"
.LASF368:
	.ascii	"__GCC_ATOMIC_CHAR_LOCK_FREE 2\000"
.LASF349:
	.ascii	"__TA_IBIT__ 64\000"
.LASF322:
	.ascii	"__QQ_FBIT__ 7\000"
.LASF509:
	.ascii	"va_arg __builtin_va_arg\000"
.LASF239:
	.ascii	"__FLT32X_HAS_INFINITY__ 1\000"
.LASF54:
	.ascii	"__UINT_LEAST16_TYPE__ short unsigned int\000"
.LASF351:
	.ascii	"__UHA_IBIT__ 8\000"
.LASF125:
	.ascii	"__INT_FAST8_WIDTH__ 32\000"
.LASF147:
	.ascii	"__FLT_MIN_EXP__ (-125)\000"
.LASF554:
	.ascii	"FORMAT_FLAG_PAD_ZERO (1u << 1)\000"
.LASF490:
	.ascii	"__CTYPE_PUNCT 0x10\000"
.LASF440:
	.ascii	"__ARM_FEATURE_MATMUL_INT8\000"
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
.LASF3:
	.ascii	"__STDC_UTF_32__ 1\000"
.LASF372:
	.ascii	"__GCC_ATOMIC_SHORT_LOCK_FREE 2\000"
.LASF265:
	.ascii	"__LFRACT_MAX__ 0X7FFFFFFFP-31LR\000"
.LASF429:
	.ascii	"__ARM_ARCH_7EM__ 1\000"
.LASF110:
	.ascii	"__INT_LEAST32_MAX__ 0x7fffffffL\000"
.LASF185:
	.ascii	"__LDBL_MAX__ 1.1\000"
.LASF589:
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
.LASF581:
	.ascii	"pBufferDesc\000"
.LASF499:
	.ascii	"__MAX_CATEGORY 5\000"
.LASF274:
	.ascii	"__LLFRACT_MIN__ (-0.5LLR-0.5LLR)\000"
.LASF590:
	.ascii	"/home/tommy/Documents/CrossWorks Projects/Executabl"
	.ascii	"e_1/SEGGER/RTT/SEGGER_RTT_printf.c\000"
.LASF424:
	.ascii	"__ARM_FEATURE_FMA 1\000"
.LASF281:
	.ascii	"__ULLFRACT_EPSILON__ 0x1P-64ULLR\000"
.LASF190:
	.ascii	"__LDBL_HAS_DENORM__ 1\000"
.LASF577:
	.ascii	"NumDigits\000"
.LASF118:
	.ascii	"__UINT_LEAST16_MAX__ 0xffff\000"
.LASF395:
	.ascii	"__ARM_FEATURE_LDREX\000"
.LASF169:
	.ascii	"__DBL_NORM_MAX__ ((double)1.1)\000"
.LASF321:
	.ascii	"__ULLACCUM_EPSILON__ 0x1P-32ULLK\000"
.LASF287:
	.ascii	"__USACCUM_FBIT__ 8\000"
.LASF157:
	.ascii	"__FLT_HAS_DENORM__ 1\000"
.LASF131:
	.ascii	"__INT_FAST64_WIDTH__ 64\000"
.LASF167:
	.ascii	"__DBL_DECIMAL_DIG__ 17\000"
	.ident	"GCC: (GNU) 10.2.1 20201103 (release)"
