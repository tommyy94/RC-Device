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
	.file	"ff.c"
	.text
.Ltext0:
	.section	.bss.FatFs,"aw",%nobits
	.align	2
	.type	FatFs, %object
	.size	FatFs, 20
FatFs:
	.space	20
	.section	.bss.Fsid,"aw",%nobits
	.align	1
	.type	Fsid, %object
	.size	Fsid, 2
Fsid:
	.space	2
	.section	.bss.CurrVol,"aw",%nobits
	.type	CurrVol, %object
	.size	CurrVol, 1
CurrVol:
	.space	1
	.section	.rodata.ExCvt,"a"
	.align	2
	.type	ExCvt, %object
	.size	ExCvt, 128
ExCvt:
	.ascii	"CUEAAAACEEEIIIAAE\222\222OOOUUYOUO\234O\236\237AIOU"
	.ascii	"\245\245\246\247\250\251\252\253\254\255\256\257\260"
	.ascii	"\261\262\263\264AAA\270\271\272\273\274\275\276\277"
	.ascii	"\300\301\302\303\304\305AA\310\311\312\313\314\315\316"
	.ascii	"\317\321\321EEEIIII\331\332\333\334\335I\337O\341OO"
	.ascii	"OO\346\350\350UUUYY\356\357\360\361\362\363\364\365"
	.ascii	"\366\367\370\371\372\373\374\375\376\377"
	.section	.text.mem_cpy,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	mem_cpy, %function
mem_cpy:
.LFB0:
	.file 1 "/home/tommy/Documents/CrossWorks Projects/Executable_1/Device/Middleware/fatfs/src/ff.c"
	.loc 1 486 53
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #24
.LCFI0:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 487 11
	ldr	r3, [sp, #12]
	str	r3, [sp, #20]
	.loc 1 488 17
	ldr	r3, [sp, #8]
	str	r3, [sp, #16]
	.loc 1 497 11
	b	.L2
.L3:
	.loc 1 498 18
	ldr	r2, [sp, #16]
	adds	r3, r2, #1
	str	r3, [sp, #16]
	.loc 1 498 11
	ldr	r3, [sp, #20]
	adds	r1, r3, #1
	str	r1, [sp, #20]
	.loc 1 498 16
	ldrb	r2, [r2]	@ zero_extendqisi2
	.loc 1 498 14
	strb	r2, [r3]
.L2:
	.loc 1 497 15
	ldr	r3, [sp, #4]
	subs	r2, r3, #1
	str	r2, [sp, #4]
	.loc 1 497 11
	cmp	r3, #0
	bne	.L3
	.loc 1 499 1
	nop
	nop
	add	sp, sp, #24
.LCFI1:
	@ sp needed
	bx	lr
.LFE0:
	.size	mem_cpy, .-mem_cpy
	.section	.text.mem_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	mem_set, %function
mem_set:
.LFB1:
	.loc 1 503 45
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #24
.LCFI2:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 504 11
	ldr	r3, [sp, #12]
	str	r3, [sp, #20]
	.loc 1 506 11
	b	.L5
.L6:
	.loc 1 507 11
	ldr	r3, [sp, #20]
	adds	r2, r3, #1
	str	r2, [sp, #20]
	.loc 1 507 16
	ldr	r2, [sp, #8]
	uxtb	r2, r2
	.loc 1 507 14
	strb	r2, [r3]
.L5:
	.loc 1 506 15
	ldr	r3, [sp, #4]
	subs	r2, r3, #1
	str	r2, [sp, #4]
	.loc 1 506 11
	cmp	r3, #0
	bne	.L6
	.loc 1 508 1
	nop
	nop
	add	sp, sp, #24
.LCFI3:
	@ sp needed
	bx	lr
.LFE1:
	.size	mem_set, .-mem_set
	.section	.text.mem_cmp,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	mem_cmp, %function
mem_cmp:
.LFB2:
	.loc 1 512 58
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #32
.LCFI4:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 513 17
	ldr	r3, [sp, #12]
	str	r3, [sp, #28]
	.loc 1 513 41
	ldr	r3, [sp, #8]
	str	r3, [sp, #24]
	.loc 1 514 9
	movs	r3, #0
	str	r3, [sp, #20]
	.loc 1 516 11
	nop
.L9:
	.loc 1 516 15 discriminator 2
	ldr	r3, [sp, #4]
	subs	r2, r3, #1
	str	r2, [sp, #4]
	.loc 1 516 11 discriminator 2
	cmp	r3, #0
	beq	.L8
	.loc 1 516 28 discriminator 1
	ldr	r3, [sp, #28]
	adds	r2, r3, #1
	str	r2, [sp, #28]
	.loc 1 516 26 discriminator 1
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	.loc 1 516 35 discriminator 1
	ldr	r3, [sp, #24]
	adds	r2, r3, #1
	str	r2, [sp, #24]
	.loc 1 516 33 discriminator 1
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 516 24 discriminator 1
	subs	r3, r1, r3
	str	r3, [sp, #20]
	.loc 1 516 18 discriminator 1
	ldr	r3, [sp, #20]
	cmp	r3, #0
	beq	.L9
.L8:
	.loc 1 517 12
	ldr	r3, [sp, #20]
	.loc 1 518 1
	mov	r0, r3
	add	sp, sp, #32
.LCFI5:
	@ sp needed
	bx	lr
.LFE2:
	.size	mem_cmp, .-mem_cmp
	.section	.text.chk_chr,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	chk_chr, %function
chk_chr:
.LFB3:
	.loc 1 522 40
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
.LCFI6:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 523 11
	b	.L12
.L14:
	.loc 1 523 36 discriminator 3
	ldr	r3, [sp, #4]
	adds	r3, r3, #1
	str	r3, [sp, #4]
.L12:
	.loc 1 523 12 discriminator 1
	ldr	r3, [sp, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 523 11 discriminator 1
	cmp	r3, #0
	beq	.L13
	.loc 1 523 20 discriminator 2
	ldr	r3, [sp, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	.loc 1 523 17 discriminator 2
	ldr	r3, [sp]
	cmp	r3, r2
	bne	.L14
.L13:
	.loc 1 524 12
	ldr	r3, [sp, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 525 1
	mov	r0, r3
	add	sp, sp, #8
.LCFI7:
	@ sp needed
	bx	lr
.LFE3:
	.size	chk_chr, .-chk_chr
	.section	.text.sync_window,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	sync_window, %function
sync_window:
.LFB4:
	.loc 1 666 1
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI8:
	sub	sp, sp, #28
.LCFI9:
	str	r0, [sp, #4]
	.loc 1 669 13
	movs	r3, #0
	strb	r3, [sp, #15]
	.loc 1 671 11
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	.loc 1 671 8
	cmp	r3, #0
	beq	.L17
	.loc 1 672 15
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #48]
	str	r3, [sp, #20]
	.loc 1 673 13
	ldr	r3, [sp, #4]
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	.loc 1 673 35
	ldr	r3, [sp, #4]
	add	r1, r3, #52
	.loc 1 673 13
	movs	r3, #1
	ldr	r2, [sp, #20]
	bl	disk_write
	mov	r3, r0
	.loc 1 673 12
	cmp	r3, #0
	beq	.L18
	.loc 1 674 17
	movs	r3, #1
	strb	r3, [sp, #15]
	b	.L17
.L18:
	.loc 1 676 23
	ldr	r3, [sp, #4]
	movs	r2, #0
	strb	r2, [r3, #4]
	.loc 1 677 27
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #36]
	.loc 1 677 23
	ldr	r2, [sp, #20]
	subs	r2, r2, r3
	.loc 1 677 41
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #28]
	.loc 1 677 16
	cmp	r2, r3
	bcs	.L17
	.loc 1 678 29
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	.loc 1 678 25
	str	r3, [sp, #16]
	.loc 1 678 17
	b	.L19
.L20:
	.loc 1 679 32 discriminator 3
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #28]
	.loc 1 679 27 discriminator 3
	ldr	r2, [sp, #20]
	add	r3, r3, r2
	str	r3, [sp, #20]
	.loc 1 680 21 discriminator 3
	ldr	r3, [sp, #4]
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	.loc 1 680 43 discriminator 3
	ldr	r3, [sp, #4]
	add	r1, r3, #52
	.loc 1 680 21 discriminator 3
	movs	r3, #1
	ldr	r2, [sp, #20]
	bl	disk_write
	.loc 1 678 50 discriminator 3
	ldr	r3, [sp, #16]
	subs	r3, r3, #1
	str	r3, [sp, #16]
.L19:
	.loc 1 678 17 discriminator 1
	ldr	r3, [sp, #16]
	cmp	r3, #1
	bhi	.L20
.L17:
	.loc 1 685 12
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	.loc 1 686 1
	mov	r0, r3
	add	sp, sp, #28
.LCFI10:
	@ sp needed
	ldr	pc, [sp], #4
.LFE4:
	.size	sync_window, .-sync_window
	.section	.text.move_window,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	move_window, %function
move_window:
.LFB5:
	.loc 1 694 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI11:
	sub	sp, sp, #20
.LCFI12:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 695 13
	movs	r3, #0
	strb	r3, [sp, #15]
	.loc 1 697 21
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #48]
	.loc 1 697 8
	ldr	r2, [sp]
	cmp	r2, r3
	beq	.L23
	.loc 1 699 15
	ldr	r0, [sp, #4]
	bl	sync_window
	mov	r3, r0
	strb	r3, [sp, #15]
	.loc 1 701 12
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L23
	.loc 1 702 17
	ldr	r3, [sp, #4]
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	.loc 1 702 38
	ldr	r3, [sp, #4]
	add	r1, r3, #52
	.loc 1 702 17
	movs	r3, #1
	ldr	r2, [sp]
	bl	disk_read
	mov	r3, r0
	.loc 1 702 16
	cmp	r3, #0
	beq	.L24
	.loc 1 703 24
	mov	r3, #-1
	str	r3, [sp]
	.loc 1 704 21
	movs	r3, #1
	strb	r3, [sp, #15]
.L24:
	.loc 1 706 25
	ldr	r3, [sp, #4]
	ldr	r2, [sp]
	str	r2, [r3, #48]
.L23:
	.loc 1 709 12
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	.loc 1 710 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI13:
	@ sp needed
	ldr	pc, [sp], #4
.LFE5:
	.size	move_window, .-move_window
	.section	.text.sync_fs,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	sync_fs, %function
sync_fs:
.LFB6:
	.loc 1 720 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI14:
	sub	sp, sp, #20
.LCFI15:
	str	r0, [sp, #4]
	.loc 1 723 11
	ldr	r0, [sp, #4]
	bl	sync_window
	mov	r3, r0
	strb	r3, [sp, #15]
	.loc 1 724 8
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L27
	.loc 1 726 15
	ldr	r3, [sp, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 726 12
	cmp	r3, #3
	bne	.L28
	.loc 1 726 42 discriminator 1
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	.loc 1 726 37 discriminator 1
	cmp	r3, #1
	bne	.L28
	.loc 1 728 23
	ldr	r3, [sp, #4]
	adds	r3, r3, #52
	.loc 1 728 13
	mov	r2, #512
	movs	r1, #0
	mov	r0, r3
	bl	mem_set
	.loc 1 729 13
	ldr	r3, [sp, #4]
	movs	r2, #85
	strb	r2, [r3, #562]
	ldr	r3, [sp, #4]
	movs	r2, #170
	strb	r2, [r3, #563]
	.loc 1 730 13
	ldr	r3, [sp, #4]
	movs	r2, #82
	strb	r2, [r3, #52]
	ldr	r3, [sp, #4]
	movs	r2, #82
	strb	r2, [r3, #53]
	ldr	r3, [sp, #4]
	movs	r2, #97
	strb	r2, [r3, #54]
	ldr	r3, [sp, #4]
	movs	r2, #65
	strb	r2, [r3, #55]
	.loc 1 731 13
	ldr	r3, [sp, #4]
	movs	r2, #114
	strb	r2, [r3, #536]
	ldr	r3, [sp, #4]
	movs	r2, #114
	strb	r2, [r3, #537]
	ldr	r3, [sp, #4]
	movs	r2, #65
	strb	r2, [r3, #538]
	ldr	r3, [sp, #4]
	movs	r2, #97
	strb	r2, [r3, #539]
	.loc 1 732 13
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	uxtb	r2, r3
	ldr	r3, [sp, #4]
	strb	r2, [r3, #540]
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	uxth	r3, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	uxtb	r2, r3
	ldr	r3, [sp, #4]
	strb	r2, [r3, #541]
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	lsrs	r3, r3, #16
	uxtb	r2, r3
	ldr	r3, [sp, #4]
	strb	r2, [r3, #542]
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	lsrs	r3, r3, #24
	uxtb	r2, r3
	ldr	r3, [sp, #4]
	strb	r2, [r3, #543]
	.loc 1 733 13
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	uxtb	r2, r3
	ldr	r3, [sp, #4]
	strb	r2, [r3, #544]
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	uxth	r3, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	uxtb	r2, r3
	ldr	r3, [sp, #4]
	strb	r2, [r3, #545]
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	lsrs	r3, r3, #16
	uxtb	r2, r3
	ldr	r3, [sp, #4]
	strb	r2, [r3, #546]
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	lsrs	r3, r3, #24
	uxtb	r2, r3
	ldr	r3, [sp, #4]
	strb	r2, [r3, #547]
	.loc 1 735 29
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #32]
	.loc 1 735 39
	adds	r2, r3, #1
	.loc 1 735 25
	ldr	r3, [sp, #4]
	str	r2, [r3, #48]
	.loc 1 736 13
	ldr	r3, [sp, #4]
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	.loc 1 736 35
	ldr	r3, [sp, #4]
	add	r1, r3, #52
	.loc 1 736 44
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #48]
	.loc 1 736 13
	movs	r3, #1
	bl	disk_write
	.loc 1 737 26
	ldr	r3, [sp, #4]
	movs	r2, #0
	strb	r2, [r3, #5]
.L28:
	.loc 1 740 13
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl	disk_ioctl
	mov	r3, r0
	.loc 1 740 12
	cmp	r3, #0
	beq	.L27
	.loc 1 741 17
	movs	r3, #1
	strb	r3, [sp, #15]
.L27:
	.loc 1 744 12
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	.loc 1 745 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI16:
	@ sp needed
	ldr	pc, [sp], #4
.LFE6:
	.size	sync_fs, .-sync_fs
	.section	.text.clust2sect,"ax",%progbits
	.align	1
	.global	clust2sect
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	clust2sect, %function
clust2sect:
.LFB7:
	.loc 1 757 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
.LCFI17:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 758 10
	ldr	r3, [sp]
	subs	r3, r3, #2
	str	r3, [sp]
	.loc 1 759 19
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #24]
	.loc 1 759 30
	subs	r3, r3, #2
	.loc 1 759 8
	ldr	r2, [sp]
	cmp	r2, r3
	bcc	.L31
	.loc 1 759 42 discriminator 1
	movs	r3, #0
	b	.L32
.L31:
	.loc 1 760 21
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	mov	r2, r3
	.loc 1 760 17
	ldr	r3, [sp]
	mul	r2, r3, r2
	.loc 1 760 33
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #44]
	.loc 1 760 29
	add	r3, r3, r2
.L32:
	.loc 1 761 1
	mov	r0, r3
	add	sp, sp, #8
.LCFI18:
	@ sp needed
	bx	lr
.LFE7:
	.size	clust2sect, .-clust2sect
	.section	.text.get_fat,"ax",%progbits
	.align	1
	.global	get_fat
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	get_fat, %function
get_fat:
.LFB8:
	.loc 1 772 1
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI19:
	sub	sp, sp, #28
.LCFI20:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 777 8
	ldr	r3, [sp]
	cmp	r3, #1
	bls	.L34
	.loc 1 777 31 discriminator 1
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #24]
	.loc 1 777 18 discriminator 1
	ldr	r2, [sp]
	cmp	r2, r3
	bcc	.L35
.L34:
	.loc 1 778 13
	movs	r3, #1
	str	r3, [sp, #20]
	b	.L36
.L35:
	.loc 1 781 13
	mov	r3, #-1
	str	r3, [sp, #20]
	.loc 1 783 19
	ldr	r3, [sp, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 783 9
	cmp	r3, #3
	beq	.L37
	cmp	r3, #3
	bgt	.L38
	cmp	r3, #1
	beq	.L39
	cmp	r3, #2
	beq	.L40
	b	.L38
.L39:
	.loc 1 785 16
	ldr	r3, [sp]
	str	r3, [sp, #12]
	.loc 1 785 39
	ldr	r3, [sp, #12]
	lsrs	r3, r3, #1
	.loc 1 785 33
	ldr	r2, [sp, #12]
	add	r3, r3, r2
	str	r3, [sp, #12]
	.loc 1 786 35
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #36]
	.loc 1 786 51
	ldr	r3, [sp, #12]
	lsrs	r3, r3, #9
	.loc 1 786 17
	add	r3, r3, r2
	mov	r1, r3
	ldr	r0, [sp, #4]
	bl	move_window
	mov	r3, r0
	.loc 1 786 16
	cmp	r3, #0
	bne	.L48
	.loc 1 787 28
	ldr	r3, [sp, #12]
	adds	r2, r3, #1
	str	r2, [sp, #12]
	.loc 1 787 31
	ubfx	r3, r3, #0, #9
	.loc 1 787 25
	ldr	r2, [sp, #4]
	add	r3, r3, r2
	ldrb	r3, [r3, #52]	@ zero_extendqisi2
	.loc 1 787 16
	str	r3, [sp, #8]
	.loc 1 788 35
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #36]
	.loc 1 788 51
	ldr	r3, [sp, #12]
	lsrs	r3, r3, #9
	.loc 1 788 17
	add	r3, r3, r2
	mov	r1, r3
	ldr	r0, [sp, #4]
	bl	move_window
	mov	r3, r0
	.loc 1 788 16
	cmp	r3, #0
	bne	.L49
	.loc 1 789 30
	ldr	r3, [sp, #12]
	ubfx	r3, r3, #0, #9
	.loc 1 789 26
	ldr	r2, [sp, #4]
	add	r3, r3, r2
	ldrb	r3, [r3, #52]	@ zero_extendqisi2
	.loc 1 789 40
	lsls	r3, r3, #8
	mov	r2, r3
	.loc 1 789 16
	ldr	r3, [sp, #8]
	orrs	r3, r3, r2
	str	r3, [sp, #8]
	.loc 1 790 24
	ldr	r3, [sp]
	and	r3, r3, #1
	.loc 1 790 38
	cmp	r3, #0
	beq	.L43
	.loc 1 790 38 is_stmt 0 discriminator 1
	ldr	r3, [sp, #8]
	lsrs	r3, r3, #4
	b	.L44
.L43:
	.loc 1 790 38 discriminator 2
	ldr	r3, [sp, #8]
	ubfx	r3, r3, #0, #12
.L44:
	.loc 1 790 17 is_stmt 1 discriminator 4
	str	r3, [sp, #20]
	.loc 1 791 13 discriminator 4
	b	.L36
.L40:
	.loc 1 794 35
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #36]
	.loc 1 794 53
	ldr	r3, [sp]
	lsrs	r3, r3, #8
	.loc 1 794 17
	add	r3, r3, r2
	mov	r1, r3
	ldr	r0, [sp, #4]
	bl	move_window
	mov	r3, r0
	.loc 1 794 16
	cmp	r3, #0
	bne	.L50
	.loc 1 795 31
	ldr	r3, [sp]
	lsls	r3, r3, #1
	.loc 1 795 35
	and	r3, r3, #510
	.loc 1 795 15
	adds	r3, r3, #48
	ldr	r2, [sp, #4]
	add	r3, r3, r2
	adds	r3, r3, #4
	str	r3, [sp, #16]
	.loc 1 796 19
	ldr	r3, [sp, #16]
	adds	r3, r3, #1
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsls	r3, r3, #8
	sxth	r2, r3
	ldr	r3, [sp, #16]
	ldrb	r3, [r3]	@ zero_extendqisi2
	sxth	r3, r3
	orrs	r3, r3, r2
	sxth	r3, r3
	uxth	r3, r3
	.loc 1 796 17
	str	r3, [sp, #20]
	.loc 1 797 13
	b	.L36
.L37:
	.loc 1 800 35
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #36]
	.loc 1 800 53
	ldr	r3, [sp]
	lsrs	r3, r3, #7
	.loc 1 800 17
	add	r3, r3, r2
	mov	r1, r3
	ldr	r0, [sp, #4]
	bl	move_window
	mov	r3, r0
	.loc 1 800 16
	cmp	r3, #0
	bne	.L51
	.loc 1 801 31
	ldr	r3, [sp]
	lsls	r3, r3, #2
	.loc 1 801 35
	and	r3, r3, #508
	.loc 1 801 15
	adds	r3, r3, #48
	ldr	r2, [sp, #4]
	add	r3, r3, r2
	adds	r3, r3, #4
	str	r3, [sp, #16]
	.loc 1 802 19
	ldr	r3, [sp, #16]
	adds	r3, r3, #3
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsls	r2, r3, #24
	ldr	r3, [sp, #16]
	adds	r3, r3, #2
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsls	r3, r3, #16
	orrs	r3, r3, r2
	ldr	r2, [sp, #16]
	adds	r2, r2, #1
	ldrb	r2, [r2]	@ zero_extendqisi2
	lsls	r2, r2, #8
	orrs	r3, r3, r2
	ldr	r2, [sp, #16]
	ldrb	r2, [r2]	@ zero_extendqisi2
	orrs	r3, r3, r2
	.loc 1 802 17
	bic	r3, r3, #-268435456
	str	r3, [sp, #20]
	.loc 1 803 13
	b	.L36
.L38:
	.loc 1 806 17
	movs	r3, #1
	str	r3, [sp, #20]
	b	.L36
.L48:
	.loc 1 786 13
	nop
	b	.L36
.L49:
	.loc 1 788 13
	nop
	b	.L36
.L50:
	.loc 1 794 13
	nop
	b	.L36
.L51:
	.loc 1 800 13
	nop
.L36:
	.loc 1 810 12
	ldr	r3, [sp, #20]
	.loc 1 811 1
	mov	r0, r3
	add	sp, sp, #28
.LCFI21:
	@ sp needed
	ldr	pc, [sp], #4
.LFE8:
	.size	get_fat, .-get_fat
	.section	.text.put_fat,"ax",%progbits
	.align	1
	.global	put_fat
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	put_fat, %function
put_fat:
.LFB9:
	.loc 1 824 1
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI22:
	sub	sp, sp, #36
.LCFI23:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 829 8
	ldr	r3, [sp, #8]
	cmp	r3, #1
	bls	.L53
	.loc 1 829 31 discriminator 1
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #24]
	.loc 1 829 18 discriminator 1
	ldr	r2, [sp, #8]
	cmp	r2, r3
	bcc	.L54
.L53:
	.loc 1 830 13
	movs	r3, #2
	strb	r3, [sp, #31]
	b	.L55
.L54:
	.loc 1 833 19
	ldr	r3, [sp, #12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 833 9
	cmp	r3, #3
	beq	.L56
	cmp	r3, #3
	bgt	.L57
	cmp	r3, #1
	beq	.L58
	cmp	r3, #2
	beq	.L59
	b	.L57
.L58:
	.loc 1 835 16
	ldr	r3, [sp, #8]
	str	r3, [sp, #20]
	.loc 1 835 39
	ldr	r3, [sp, #20]
	lsrs	r3, r3, #1
	.loc 1 835 33
	ldr	r2, [sp, #20]
	add	r3, r3, r2
	str	r3, [sp, #20]
	.loc 1 836 37
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #36]
	.loc 1 836 53
	ldr	r3, [sp, #20]
	lsrs	r3, r3, #9
	.loc 1 836 19
	add	r3, r3, r2
	mov	r1, r3
	ldr	r0, [sp, #12]
	bl	move_window
	mov	r3, r0
	strb	r3, [sp, #31]
	.loc 1 837 16
	ldrb	r3, [sp, #31]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L69
	.loc 1 838 28
	ldr	r3, [sp, #20]
	adds	r2, r3, #1
	str	r2, [sp, #20]
	.loc 1 838 31
	ubfx	r3, r3, #0, #9
	.loc 1 838 15
	adds	r3, r3, #48
	ldr	r2, [sp, #12]
	add	r3, r3, r2
	adds	r3, r3, #4
	str	r3, [sp, #24]
	.loc 1 839 24
	ldr	r3, [sp, #8]
	and	r3, r3, #1
	.loc 1 839 16
	cmp	r3, #0
	beq	.L61
	.loc 1 839 33 discriminator 1
	ldr	r3, [sp, #24]
	ldrb	r3, [r3]	@ zero_extendqisi2
	sxtb	r3, r3
	.loc 1 839 36 discriminator 1
	and	r3, r3, #15
	sxtb	r2, r3
	.loc 1 839 47 discriminator 1
	ldr	r3, [sp, #4]
	uxtb	r3, r3
	.loc 1 839 57 discriminator 1
	lsls	r3, r3, #4
	.loc 1 839 44 discriminator 1
	sxtb	r3, r3
	orrs	r3, r3, r2
	sxtb	r3, r3
	.loc 1 839 16 discriminator 1
	uxtb	r3, r3
	b	.L62
.L61:
	.loc 1 839 16 is_stmt 0 discriminator 2
	ldr	r3, [sp, #4]
	uxtb	r3, r3
.L62:
	.loc 1 839 16 discriminator 4
	ldr	r2, [sp, #24]
	strb	r3, [r2]
	.loc 1 840 23 is_stmt 1 discriminator 4
	ldr	r3, [sp, #12]
	movs	r2, #1
	strb	r2, [r3, #4]
	.loc 1 841 37 discriminator 4
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #36]
	.loc 1 841 53 discriminator 4
	ldr	r3, [sp, #20]
	lsrs	r3, r3, #9
	.loc 1 841 19 discriminator 4
	add	r3, r3, r2
	mov	r1, r3
	ldr	r0, [sp, #12]
	bl	move_window
	mov	r3, r0
	strb	r3, [sp, #31]
	.loc 1 842 16 discriminator 4
	ldrb	r3, [sp, #31]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L70
	.loc 1 843 29
	ldr	r3, [sp, #20]
	ubfx	r3, r3, #0, #9
	.loc 1 843 15
	adds	r3, r3, #48
	ldr	r2, [sp, #12]
	add	r3, r3, r2
	adds	r3, r3, #4
	str	r3, [sp, #24]
	.loc 1 844 24
	ldr	r3, [sp, #8]
	and	r3, r3, #1
	.loc 1 844 16
	cmp	r3, #0
	beq	.L64
	.loc 1 844 42 discriminator 1
	ldr	r3, [sp, #4]
	lsrs	r3, r3, #4
	.loc 1 844 16 discriminator 1
	uxtb	r3, r3
	b	.L65
.L64:
	.loc 1 844 52 discriminator 2
	ldr	r3, [sp, #24]
	ldrb	r3, [r3]	@ zero_extendqisi2
	sxtb	r3, r3
	.loc 1 844 55 discriminator 2
	bic	r3, r3, #15
	sxtb	r2, r3
	.loc 1 844 77 discriminator 2
	ldr	r3, [sp, #4]
	lsrs	r3, r3, #8
	.loc 1 844 66 discriminator 2
	sxtb	r3, r3
	.loc 1 844 83 discriminator 2
	and	r3, r3, #15
	sxtb	r3, r3
	.loc 1 844 63 discriminator 2
	orrs	r3, r3, r2
	sxtb	r3, r3
	.loc 1 844 16 discriminator 2
	uxtb	r3, r3
.L65:
	.loc 1 844 16 is_stmt 0 discriminator 4
	ldr	r2, [sp, #24]
	strb	r3, [r2]
	.loc 1 845 23 is_stmt 1 discriminator 4
	ldr	r3, [sp, #12]
	movs	r2, #1
	strb	r2, [r3, #4]
	.loc 1 846 13 discriminator 4
	b	.L55
.L59:
	.loc 1 849 37
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #36]
	.loc 1 849 55
	ldr	r3, [sp, #8]
	lsrs	r3, r3, #8
	.loc 1 849 19
	add	r3, r3, r2
	mov	r1, r3
	ldr	r0, [sp, #12]
	bl	move_window
	mov	r3, r0
	strb	r3, [sp, #31]
	.loc 1 850 16
	ldrb	r3, [sp, #31]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L71
	.loc 1 851 31
	ldr	r3, [sp, #8]
	lsls	r3, r3, #1
	.loc 1 851 35
	and	r3, r3, #510
	.loc 1 851 15
	adds	r3, r3, #48
	ldr	r2, [sp, #12]
	add	r3, r3, r2
	adds	r3, r3, #4
	str	r3, [sp, #24]
	.loc 1 852 13
	ldr	r3, [sp, #4]
	uxtb	r2, r3
	ldr	r3, [sp, #24]
	strb	r2, [r3]
	ldr	r3, [sp, #4]
	uxth	r3, r3
	lsrs	r3, r3, #8
	uxth	r2, r3
	ldr	r3, [sp, #24]
	adds	r3, r3, #1
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 853 23
	ldr	r3, [sp, #12]
	movs	r2, #1
	strb	r2, [r3, #4]
	.loc 1 854 13
	b	.L55
.L56:
	.loc 1 857 37
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #36]
	.loc 1 857 55
	ldr	r3, [sp, #8]
	lsrs	r3, r3, #7
	.loc 1 857 19
	add	r3, r3, r2
	mov	r1, r3
	ldr	r0, [sp, #12]
	bl	move_window
	mov	r3, r0
	strb	r3, [sp, #31]
	.loc 1 858 16
	ldrb	r3, [sp, #31]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L72
	.loc 1 859 31
	ldr	r3, [sp, #8]
	lsls	r3, r3, #2
	.loc 1 859 35
	and	r3, r3, #508
	.loc 1 859 15
	adds	r3, r3, #48
	ldr	r2, [sp, #12]
	add	r3, r3, r2
	adds	r3, r3, #4
	str	r3, [sp, #24]
	.loc 1 860 20
	ldr	r3, [sp, #24]
	adds	r3, r3, #3
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsls	r2, r3, #24
	ldr	r3, [sp, #24]
	adds	r3, r3, #2
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsls	r3, r3, #16
	orrs	r3, r3, r2
	ldr	r2, [sp, #24]
	adds	r2, r2, #1
	ldrb	r2, [r2]	@ zero_extendqisi2
	lsls	r2, r2, #8
	orrs	r3, r3, r2
	ldr	r2, [sp, #24]
	ldrb	r2, [r2]	@ zero_extendqisi2
	orrs	r3, r3, r2
	.loc 1 860 32
	and	r3, r3, #-268435456
	.loc 1 860 17
	ldr	r2, [sp, #4]
	orrs	r3, r3, r2
	str	r3, [sp, #4]
	.loc 1 861 13
	ldr	r3, [sp, #4]
	uxtb	r2, r3
	ldr	r3, [sp, #24]
	strb	r2, [r3]
	ldr	r3, [sp, #4]
	uxth	r3, r3
	lsrs	r3, r3, #8
	uxth	r2, r3
	ldr	r3, [sp, #24]
	adds	r3, r3, #1
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #4]
	lsrs	r2, r3, #16
	ldr	r3, [sp, #24]
	adds	r3, r3, #2
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #4]
	lsrs	r2, r3, #24
	ldr	r3, [sp, #24]
	adds	r3, r3, #3
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 862 23
	ldr	r3, [sp, #12]
	movs	r2, #1
	strb	r2, [r3, #4]
	.loc 1 863 13
	b	.L55
.L57:
	.loc 1 866 17
	movs	r3, #2
	strb	r3, [sp, #31]
	b	.L55
.L69:
	.loc 1 837 13
	nop
	b	.L55
.L70:
	.loc 1 842 13
	nop
	b	.L55
.L71:
	.loc 1 850 13
	nop
	b	.L55
.L72:
	.loc 1 858 13
	nop
.L55:
	.loc 1 870 12
	ldrb	r3, [sp, #31]	@ zero_extendqisi2
	.loc 1 871 1
	mov	r0, r3
	add	sp, sp, #36
.LCFI24:
	@ sp needed
	ldr	pc, [sp], #4
.LFE9:
	.size	put_fat, .-put_fat
	.section	.text.remove_chain,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	remove_chain, %function
remove_chain:
.LFB10:
	.loc 1 883 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI25:
	sub	sp, sp, #20
.LCFI26:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 890 8
	ldr	r3, [sp]
	cmp	r3, #1
	bls	.L74
	.loc 1 890 31 discriminator 1
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #24]
	.loc 1 890 18 discriminator 1
	ldr	r2, [sp]
	cmp	r2, r3
	bcc	.L75
.L74:
	.loc 1 891 13
	movs	r3, #2
	strb	r3, [sp, #15]
	b	.L76
.L75:
	.loc 1 894 13
	movs	r3, #0
	strb	r3, [sp, #15]
	.loc 1 895 15
	b	.L77
.L83:
	.loc 1 896 19
	ldr	r1, [sp]
	ldr	r0, [sp, #4]
	bl	get_fat
	str	r0, [sp, #8]
	.loc 1 897 16
	ldr	r3, [sp, #8]
	cmp	r3, #0
	beq	.L85
	.loc 1 898 16
	ldr	r3, [sp, #8]
	cmp	r3, #1
	bne	.L79
	.loc 1 898 33 discriminator 1
	movs	r3, #2
	strb	r3, [sp, #15]
	.loc 1 898 13 discriminator 1
	b	.L76
.L79:
	.loc 1 899 16
	ldr	r3, [sp, #8]
	cmp	r3, #-1
	bne	.L80
	.loc 1 899 42 discriminator 1
	movs	r3, #1
	strb	r3, [sp, #15]
	.loc 1 899 13 discriminator 1
	b	.L76
.L80:
	.loc 1 900 19
	movs	r2, #0
	ldr	r1, [sp]
	ldr	r0, [sp, #4]
	bl	put_fat
	mov	r3, r0
	strb	r3, [sp, #15]
	.loc 1 901 16
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L86
	.loc 1 902 19
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	.loc 1 902 16
	cmp	r3, #-1
	beq	.L82
	.loc 1 903 19
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	.loc 1 903 31
	adds	r2, r3, #1
	ldr	r3, [sp, #4]
	str	r2, [r3, #16]
	.loc 1 904 30
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	orr	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, [sp, #4]
	strb	r2, [r3, #5]
.L82:
	.loc 1 916 18
	ldr	r3, [sp, #8]
	str	r3, [sp]
.L77:
	.loc 1 895 25
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #24]
	.loc 1 895 15
	ldr	r2, [sp]
	cmp	r2, r3
	bcc	.L83
	b	.L76
.L85:
	.loc 1 897 13
	nop
	b	.L76
.L86:
	.loc 1 901 13
	nop
.L76:
	.loc 1 920 12
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	.loc 1 921 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI27:
	@ sp needed
	ldr	pc, [sp], #4
.LFE10:
	.size	remove_chain, .-remove_chain
	.section	.text.create_chain,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	create_chain, %function
create_chain:
.LFB11:
	.loc 1 933 1
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI28:
	sub	sp, sp, #28
.LCFI29:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 937 8
	ldr	r3, [sp]
	cmp	r3, #0
	bne	.L88
	.loc 1 938 13
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	str	r3, [sp, #16]
	.loc 1 939 12
	ldr	r3, [sp, #16]
	cmp	r3, #0
	beq	.L89
	.loc 1 939 30 discriminator 2
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #24]
	.loc 1 939 18 discriminator 2
	ldr	r2, [sp, #16]
	cmp	r2, r3
	bcc	.L90
.L89:
	.loc 1 939 46 discriminator 3
	movs	r3, #1
	str	r3, [sp, #16]
	b	.L90
.L88:
	.loc 1 942 14
	ldr	r1, [sp]
	ldr	r0, [sp, #4]
	bl	get_fat
	str	r0, [sp, #8]
	.loc 1 943 12
	ldr	r3, [sp, #8]
	cmp	r3, #1
	bhi	.L91
	.loc 1 943 28 discriminator 1
	movs	r3, #1
	b	.L92
.L91:
	.loc 1 944 12
	ldr	r3, [sp, #8]
	cmp	r3, #-1
	bne	.L93
	.loc 1 944 38 discriminator 1
	ldr	r3, [sp, #8]
	b	.L92
.L93:
	.loc 1 945 20
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #24]
	.loc 1 945 12
	ldr	r2, [sp, #8]
	cmp	r2, r3
	bcs	.L94
	.loc 1 945 39 discriminator 1
	ldr	r3, [sp, #8]
	b	.L92
.L94:
	.loc 1 946 13
	ldr	r3, [sp]
	str	r3, [sp, #16]
.L90:
	.loc 1 949 9
	ldr	r3, [sp, #16]
	str	r3, [sp, #20]
.L101:
	.loc 1 951 12
	ldr	r3, [sp, #20]
	adds	r3, r3, #1
	str	r3, [sp, #20]
	.loc 1 952 22
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #24]
	.loc 1 952 12
	ldr	r2, [sp, #20]
	cmp	r2, r3
	bcc	.L95
	.loc 1 953 17
	movs	r3, #2
	str	r3, [sp, #20]
	.loc 1 954 16
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #16]
	cmp	r2, r3
	bls	.L95
	.loc 1 954 35 discriminator 1
	movs	r3, #0
	b	.L92
.L95:
	.loc 1 956 14
	ldr	r1, [sp, #20]
	ldr	r0, [sp, #4]
	bl	get_fat
	str	r0, [sp, #8]
	.loc 1 957 12
	ldr	r3, [sp, #8]
	cmp	r3, #0
	beq	.L108
	.loc 1 958 12
	ldr	r3, [sp, #8]
	cmp	r3, #-1
	beq	.L98
	.loc 1 958 30 discriminator 1
	ldr	r3, [sp, #8]
	cmp	r3, #1
	bne	.L99
.L98:
	.loc 1 959 20
	ldr	r3, [sp, #8]
	b	.L92
.L99:
	.loc 1 960 12
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #16]
	cmp	r2, r3
	bne	.L101
	.loc 1 960 32 discriminator 1
	movs	r3, #0
	b	.L92
.L108:
	.loc 1 957 9
	nop
	.loc 1 963 11
	mvn	r2, #-268435456
	ldr	r1, [sp, #20]
	ldr	r0, [sp, #4]
	bl	put_fat
	mov	r3, r0
	strb	r3, [sp, #15]
	.loc 1 964 8
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L102
	.loc 1 964 22 discriminator 1
	ldr	r3, [sp]
	cmp	r3, #0
	beq	.L102
	.loc 1 965 15
	ldr	r2, [sp, #20]
	ldr	r1, [sp]
	ldr	r0, [sp, #4]
	bl	put_fat
	mov	r3, r0
	strb	r3, [sp, #15]
.L102:
	.loc 1 967 8
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L103
	.loc 1 968 24
	ldr	r3, [sp, #4]
	ldr	r2, [sp, #20]
	str	r2, [r3, #12]
	.loc 1 969 15
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	.loc 1 969 12
	cmp	r3, #-1
	beq	.L104
	.loc 1 970 15
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	.loc 1 970 27
	subs	r2, r3, #1
	ldr	r3, [sp, #4]
	str	r2, [r3, #16]
	.loc 1 971 26
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	orr	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, [sp, #4]
	strb	r2, [r3, #5]
	b	.L104
.L103:
	.loc 1 974 49
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L105
	.loc 1 974 49 is_stmt 0 discriminator 1
	mov	r3, #-1
	b	.L106
.L105:
	.loc 1 974 49 discriminator 2
	movs	r3, #1
.L106:
	.loc 1 974 13 is_stmt 1 discriminator 4
	str	r3, [sp, #20]
.L104:
	.loc 1 977 12
	ldr	r3, [sp, #20]
.L92:
	.loc 1 978 1
	mov	r0, r3
	add	sp, sp, #28
.LCFI30:
	@ sp needed
	ldr	pc, [sp], #4
.LFE11:
	.size	create_chain, .-create_chain
	.section	.text.clmt_clust,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	clmt_clust, %function
clmt_clust:
.LFB12:
	.loc 1 991 1
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #24
.LCFI31:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 994 13
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #36]
	.loc 1 994 9
	adds	r3, r3, #4
	str	r3, [sp, #16]
	.loc 1 995 14
	ldr	r3, [sp]
	lsrs	r3, r3, #9
	.loc 1 995 31
	ldr	r2, [sp, #4]
	ldr	r2, [r2]
	.loc 1 995 35
	ldrb	r2, [r2, #2]	@ zero_extendqisi2
	.loc 1 995 8
	udiv	r3, r3, r2
	str	r3, [sp, #20]
.L114:
	.loc 1 997 19
	ldr	r3, [sp, #16]
	adds	r2, r3, #4
	str	r2, [sp, #16]
	.loc 1 997 13
	ldr	r3, [r3]
	str	r3, [sp, #12]
	.loc 1 998 12
	ldr	r3, [sp, #12]
	cmp	r3, #0
	bne	.L110
	.loc 1 998 26 discriminator 1
	movs	r3, #0
	b	.L111
.L110:
	.loc 1 999 12
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #12]
	cmp	r2, r3
	bcc	.L116
	.loc 1 1000 12
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #12]
	subs	r3, r2, r3
	str	r3, [sp, #20]
	.loc 1 1000 23
	ldr	r3, [sp, #16]
	adds	r3, r3, #4
	str	r3, [sp, #16]
	.loc 1 997 13
	b	.L114
.L116:
	.loc 1 999 9
	nop
	.loc 1 1002 17
	ldr	r3, [sp, #16]
	ldr	r2, [r3]
	.loc 1 1002 15
	ldr	r3, [sp, #20]
	add	r3, r3, r2
.L111:
	.loc 1 1003 1
	mov	r0, r3
	add	sp, sp, #24
.LCFI32:
	@ sp needed
	bx	lr
.LFE12:
	.size	clmt_clust, .-clmt_clust
	.section	.text.dir_sdi,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	dir_sdi, %function
dir_sdi:
.LFB13:
	.loc 1 1015 1
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI33:
	sub	sp, sp, #28
.LCFI34:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 1019 17
	ldr	r3, [sp]
	uxth	r2, r3
	.loc 1 1019 15
	ldr	r3, [sp, #4]
	strh	r2, [r3, #6]	@ movhi
	.loc 1 1020 10
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #8]
	str	r3, [sp, #20]
	.loc 1 1021 8
	ldr	r3, [sp, #20]
	cmp	r3, #1
	beq	.L118
	.loc 1 1021 32 discriminator 1
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 1021 36 discriminator 1
	ldr	r3, [r3, #24]
	.loc 1 1021 19 discriminator 1
	ldr	r2, [sp, #20]
	cmp	r2, r3
	bcc	.L119
.L118:
	.loc 1 1022 16
	movs	r3, #2
	b	.L120
.L119:
	.loc 1 1023 8
	ldr	r3, [sp, #20]
	cmp	r3, #0
	bne	.L121
	.loc 1 1023 20 discriminator 1
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 1023 24 discriminator 1
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 1023 15 discriminator 1
	cmp	r3, #3
	bne	.L121
	.loc 1 1024 18
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 1024 14
	ldr	r3, [r3, #40]
	str	r3, [sp, #20]
.L121:
	.loc 1 1026 8
	ldr	r3, [sp, #20]
	cmp	r3, #0
	bne	.L122
	.loc 1 1027 22
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 1027 26
	ldrh	r3, [r3, #8]
	mov	r2, r3
	.loc 1 1027 12
	ldr	r3, [sp]
	cmp	r3, r2
	bcc	.L123
	.loc 1 1028 20
	movs	r3, #2
	b	.L120
.L123:
	.loc 1 1029 18
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 1029 14
	ldr	r3, [r3, #40]
	str	r3, [sp, #16]
	b	.L124
.L122:
	.loc 1 1032 39
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 1032 43
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	.loc 1 1032 12
	lsls	r3, r3, #4
	str	r3, [sp, #12]
	.loc 1 1033 15
	b	.L125
.L129:
	.loc 1 1034 20
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	ldr	r1, [sp, #20]
	mov	r0, r3
	bl	get_fat
	str	r0, [sp, #20]
	.loc 1 1035 16
	ldr	r3, [sp, #20]
	cmp	r3, #-1
	bne	.L126
	.loc 1 1035 44 discriminator 1
	movs	r3, #1
	b	.L120
.L126:
	.loc 1 1036 16
	ldr	r3, [sp, #20]
	cmp	r3, #1
	bls	.L127
	.loc 1 1036 39 discriminator 1
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 1036 43 discriminator 1
	ldr	r3, [r3, #24]
	.loc 1 1036 26 discriminator 1
	ldr	r2, [sp, #20]
	cmp	r2, r3
	bcc	.L128
.L127:
	.loc 1 1037 24
	movs	r3, #2
	b	.L120
.L128:
	.loc 1 1038 17
	ldr	r2, [sp]
	ldr	r3, [sp, #12]
	subs	r3, r2, r3
	str	r3, [sp]
.L125:
	.loc 1 1033 15
	ldr	r2, [sp]
	ldr	r3, [sp, #12]
	cmp	r2, r3
	bcs	.L129
	.loc 1 1040 16
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	ldr	r1, [sp, #20]
	mov	r0, r3
	bl	clust2sect
	str	r0, [sp, #16]
.L124:
	.loc 1 1042 15
	ldr	r3, [sp, #4]
	ldr	r2, [sp, #20]
	str	r2, [r3, #12]
	.loc 1 1043 8
	ldr	r3, [sp, #16]
	cmp	r3, #0
	bne	.L130
	.loc 1 1043 23 discriminator 1
	movs	r3, #2
	b	.L120
.L130:
	.loc 1 1044 27
	ldr	r3, [sp]
	lsrs	r2, r3, #4
	.loc 1 1044 21
	ldr	r3, [sp, #16]
	add	r2, r2, r3
	.loc 1 1044 14
	ldr	r3, [sp, #4]
	str	r2, [r3, #16]
	.loc 1 1045 17
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 1045 15
	add	r2, r3, #52
	.loc 1 1045 34
	ldr	r3, [sp]
	and	r3, r3, #15
	.loc 1 1045 60
	lsls	r3, r3, #5
	.loc 1 1045 27
	add	r2, r2, r3
	.loc 1 1045 13
	ldr	r3, [sp, #4]
	str	r2, [r3, #20]
	.loc 1 1047 12
	movs	r3, #0
.L120:
	.loc 1 1048 1
	mov	r0, r3
	add	sp, sp, #28
.LCFI35:
	@ sp needed
	ldr	pc, [sp], #4
.LFE13:
	.size	dir_sdi, .-dir_sdi
	.section	.text.dir_next,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	dir_next, %function
dir_next:
.LFB14:
	.loc 1 1059 1
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
.LCFI36:
	sub	sp, sp, #24
.LCFI37:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 1066 11
	ldr	r3, [sp, #4]
	ldrh	r3, [r3, #6]
	.loc 1 1066 19
	adds	r3, r3, #1
	.loc 1 1066 7
	str	r3, [sp, #12]
	.loc 1 1067 13
	ldr	r3, [sp, #12]
	uxth	r3, r3
	.loc 1 1067 8
	cmp	r3, #0
	beq	.L132
	.loc 1 1067 29 discriminator 1
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	.loc 1 1067 23 discriminator 1
	cmp	r3, #0
	bne	.L133
.L132:
	.loc 1 1068 16
	movs	r3, #4
	b	.L134
.L133:
	.loc 1 1070 13
	ldr	r3, [sp, #12]
	and	r3, r3, #15
	.loc 1 1070 8
	cmp	r3, #0
	bne	.L135
	.loc 1 1071 11
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	.loc 1 1071 17
	adds	r2, r3, #1
	ldr	r3, [sp, #4]
	str	r2, [r3, #16]
	.loc 1 1073 16
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	.loc 1 1073 12
	cmp	r3, #0
	bne	.L136
	.loc 1 1074 24
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 1074 28
	ldrh	r3, [r3, #8]
	mov	r2, r3
	.loc 1 1074 16
	ldr	r3, [sp, #12]
	cmp	r3, r2
	bcc	.L135
	.loc 1 1075 24
	movs	r3, #4
	b	.L134
.L136:
	.loc 1 1078 21
	ldr	r3, [sp, #12]
	lsrs	r3, r3, #4
	.loc 1 1078 52
	ldr	r2, [sp, #4]
	ldr	r2, [r2]
	.loc 1 1078 56
	ldrb	r2, [r2, #2]	@ zero_extendqisi2
	.loc 1 1078 64
	subs	r2, r2, #1
	.loc 1 1078 47
	ands	r3, r3, r2
	.loc 1 1078 16
	cmp	r3, #0
	bne	.L135
	.loc 1 1079 24
	ldr	r3, [sp, #4]
	ldr	r2, [r3]
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	mov	r1, r3
	mov	r0, r2
	bl	get_fat
	str	r0, [sp, #20]
	.loc 1 1080 20
	ldr	r3, [sp, #20]
	cmp	r3, #1
	bhi	.L137
	.loc 1 1080 39 discriminator 1
	movs	r3, #2
	b	.L134
.L137:
	.loc 1 1081 20
	ldr	r3, [sp, #20]
	cmp	r3, #-1
	bne	.L138
	.loc 1 1081 48 discriminator 1
	movs	r3, #1
	b	.L134
.L138:
	.loc 1 1082 31
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 1082 35
	ldr	r3, [r3, #24]
	.loc 1 1082 20
	ldr	r2, [sp, #20]
	cmp	r2, r3
	bcc	.L139
	.loc 1 1084 24
	ldr	r3, [sp]
	cmp	r3, #0
	bne	.L140
	.loc 1 1084 42 discriminator 1
	movs	r3, #4
	b	.L134
.L140:
	.loc 1 1085 28
	ldr	r3, [sp, #4]
	ldr	r2, [r3]
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	mov	r1, r3
	mov	r0, r2
	bl	create_chain
	str	r0, [sp, #20]
	.loc 1 1086 24
	ldr	r3, [sp, #20]
	cmp	r3, #0
	bne	.L141
	.loc 1 1086 43 discriminator 1
	movs	r3, #7
	b	.L134
.L141:
	.loc 1 1087 24
	ldr	r3, [sp, #20]
	cmp	r3, #1
	bne	.L142
	.loc 1 1087 43 discriminator 1
	movs	r3, #2
	b	.L134
.L142:
	.loc 1 1088 24
	ldr	r3, [sp, #20]
	cmp	r3, #-1
	bne	.L143
	.loc 1 1088 52 discriminator 1
	movs	r3, #1
	b	.L134
.L143:
	.loc 1 1090 25
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	mov	r0, r3
	bl	sync_window
	mov	r3, r0
	.loc 1 1090 24
	cmp	r3, #0
	beq	.L144
	.loc 1 1090 53 discriminator 1
	movs	r3, #1
	b	.L134
.L144:
	.loc 1 1091 31
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 1091 35
	adds	r3, r3, #52
	.loc 1 1091 21
	mov	r2, #512
	movs	r1, #0
	mov	r0, r3
	bl	mem_set
	.loc 1 1092 39
	ldr	r3, [sp, #4]
	ldr	r2, [r3]
	.loc 1 1092 23
	ldr	r3, [sp, #4]
	ldr	r4, [r3]
	.loc 1 1092 39
	ldr	r1, [sp, #20]
	mov	r0, r2
	bl	clust2sect
	mov	r3, r0
	.loc 1 1092 37
	str	r3, [r4, #48]
	.loc 1 1093 28
	movs	r3, #0
	str	r3, [sp, #16]
	.loc 1 1093 21
	b	.L145
.L147:
	.loc 1 1094 27
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 1094 39
	movs	r2, #1
	strb	r2, [r3, #4]
	.loc 1 1095 29
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	mov	r0, r3
	bl	sync_window
	mov	r3, r0
	.loc 1 1095 28
	cmp	r3, #0
	beq	.L146
	.loc 1 1095 57 discriminator 1
	movs	r3, #1
	b	.L134
.L146:
	.loc 1 1096 27 discriminator 2
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 1096 31 discriminator 2
	ldr	r2, [r3, #48]
	.loc 1 1096 40 discriminator 2
	adds	r2, r2, #1
	str	r2, [r3, #48]
	.loc 1 1093 53 discriminator 2
	ldr	r3, [sp, #16]
	adds	r3, r3, #1
	str	r3, [sp, #16]
.L145:
	.loc 1 1093 39 discriminator 1
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 1093 43 discriminator 1
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	mov	r2, r3
	.loc 1 1093 21 discriminator 1
	ldr	r3, [sp, #16]
	cmp	r3, r2
	bcc	.L147
	.loc 1 1098 23
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 1098 37
	ldr	r1, [r3, #48]
	.loc 1 1098 23
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 1098 37
	ldr	r2, [sp, #16]
	subs	r2, r1, r2
	str	r2, [r3, #48]
.L139:
	.loc 1 1104 27
	ldr	r3, [sp, #4]
	ldr	r2, [sp, #20]
	str	r2, [r3, #12]
	.loc 1 1105 28
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	ldr	r1, [sp, #20]
	mov	r0, r3
	bl	clust2sect
	mov	r2, r0
	.loc 1 1105 26
	ldr	r3, [sp, #4]
	str	r2, [r3, #16]
.L135:
	.loc 1 1110 17
	ldr	r3, [sp, #12]
	uxth	r2, r3
	.loc 1 1110 15
	ldr	r3, [sp, #4]
	strh	r2, [r3, #6]	@ movhi
	.loc 1 1111 17
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 1111 15
	add	r2, r3, #52
	.loc 1 1111 32
	ldr	r3, [sp, #12]
	and	r3, r3, #15
	.loc 1 1111 58
	lsls	r3, r3, #5
	.loc 1 1111 27
	add	r2, r2, r3
	.loc 1 1111 13
	ldr	r3, [sp, #4]
	str	r2, [r3, #20]
	.loc 1 1113 12
	movs	r3, #0
.L134:
	.loc 1 1114 1
	mov	r0, r3
	add	sp, sp, #24
.LCFI38:
	@ sp needed
	pop	{r4, pc}
.LFE14:
	.size	dir_next, .-dir_next
	.section	.text.dir_alloc,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	dir_alloc, %function
dir_alloc:
.LFB15:
	.loc 1 1126 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI39:
	sub	sp, sp, #20
.LCFI40:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 1130 11
	movs	r1, #0
	ldr	r0, [sp, #4]
	bl	dir_sdi
	mov	r3, r0
	strb	r3, [sp, #15]
	.loc 1 1131 8
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L149
	.loc 1 1132 11
	movs	r3, #0
	str	r3, [sp, #8]
.L155:
	.loc 1 1134 19
	ldr	r3, [sp, #4]
	ldr	r2, [r3]
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	mov	r1, r3
	mov	r0, r2
	bl	move_window
	mov	r3, r0
	strb	r3, [sp, #15]
	.loc 1 1135 16
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L158
	.loc 1 1136 19
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #20]
	.loc 1 1136 24
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 1136 16
	cmp	r3, #229
	beq	.L151
	.loc 1 1136 41 discriminator 1
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #20]
	.loc 1 1136 46 discriminator 1
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 1136 36 discriminator 1
	cmp	r3, #0
	bne	.L152
.L151:
	.loc 1 1137 20
	ldr	r3, [sp, #8]
	adds	r3, r3, #1
	str	r3, [sp, #8]
	ldr	r2, [sp, #8]
	ldr	r3, [sp]
	cmp	r2, r3
	bne	.L154
	.loc 1 1137 17
	b	.L149
.L152:
	.loc 1 1139 19
	movs	r3, #0
	str	r3, [sp, #8]
.L154:
	.loc 1 1141 19
	movs	r1, #1
	ldr	r0, [sp, #4]
	bl	dir_next
	mov	r3, r0
	strb	r3, [sp, #15]
	.loc 1 1142 9
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L155
	b	.L149
.L158:
	.loc 1 1135 13
	nop
.L149:
	.loc 1 1144 8
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L156
	.loc 1 1144 32 discriminator 1
	movs	r3, #7
	strb	r3, [sp, #15]
.L156:
	.loc 1 1145 12
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	.loc 1 1146 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI41:
	@ sp needed
	ldr	pc, [sp], #4
.LFE15:
	.size	dir_alloc, .-dir_alloc
	.section	.text.ld_clust,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	ld_clust, %function
ld_clust:
.LFB16:
	.loc 1 1158 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
.LCFI42:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 1161 10
	ldr	r3, [sp]
	adds	r3, r3, #26
	adds	r3, r3, #1
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsls	r3, r3, #8
	sxth	r2, r3
	ldr	r3, [sp]
	adds	r3, r3, #26
	ldrb	r3, [r3]	@ zero_extendqisi2
	sxth	r3, r3
	orrs	r3, r3, r2
	sxth	r3, r3
	uxth	r3, r3
	.loc 1 1161 8
	str	r3, [sp, #12]
	.loc 1 1162 11
	ldr	r3, [sp, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 1162 8
	cmp	r3, #3
	bne	.L160
	.loc 1 1163 22
	ldr	r3, [sp]
	adds	r3, r3, #20
	adds	r3, r3, #1
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsls	r3, r3, #8
	sxth	r2, r3
	ldr	r3, [sp]
	adds	r3, r3, #20
	ldrb	r3, [r3]	@ zero_extendqisi2
	sxth	r3, r3
	orrs	r3, r3, r2
	sxth	r3, r3
	uxth	r3, r3
	.loc 1 1163 51
	lsls	r3, r3, #16
	.loc 1 1163 12
	ldr	r2, [sp, #12]
	orrs	r3, r3, r2
	str	r3, [sp, #12]
.L160:
	.loc 1 1165 12
	ldr	r3, [sp, #12]
	.loc 1 1166 1
	mov	r0, r3
	add	sp, sp, #16
.LCFI43:
	@ sp needed
	bx	lr
.LFE16:
	.size	ld_clust, .-ld_clust
	.section	.text.st_clust,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	st_clust, %function
st_clust:
.LFB17:
	.loc 1 1174 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
.LCFI44:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 1175 5
	ldr	r3, [sp, #4]
	adds	r3, r3, #26
	ldr	r2, [sp]
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp]
	uxth	r3, r3
	lsrs	r3, r3, #8
	uxth	r2, r3
	ldr	r3, [sp, #4]
	adds	r3, r3, #27
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 1176 5
	ldr	r3, [sp]
	lsrs	r2, r3, #16
	ldr	r3, [sp, #4]
	adds	r3, r3, #20
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp]
	lsrs	r3, r3, #16
	uxth	r3, r3
	lsrs	r3, r3, #8
	uxth	r2, r3
	ldr	r3, [sp, #4]
	adds	r3, r3, #21
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 1177 1
	nop
	add	sp, sp, #8
.LCFI45:
	@ sp needed
	bx	lr
.LFE17:
	.size	st_clust, .-st_clust
	.section	.text.dir_find,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	dir_find, %function
dir_find:
.LFB18:
	.loc 1 1359 1
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI46:
	sub	sp, sp, #28
.LCFI47:
	str	r0, [sp, #4]
	.loc 1 1366 11
	movs	r1, #0
	ldr	r0, [sp, #4]
	bl	dir_sdi
	mov	r3, r0
	strb	r3, [sp, #23]
	.loc 1 1367 8
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L164
	.loc 1 1367 30 discriminator 1
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	b	.L165
.L164:
	.loc 1 1373 15
	ldr	r3, [sp, #4]
	ldr	r2, [r3]
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	mov	r1, r3
	mov	r0, r2
	bl	move_window
	mov	r3, r0
	strb	r3, [sp, #23]
	.loc 1 1374 12
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L170
	.loc 1 1375 13
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #20]
	str	r3, [sp, #16]
	.loc 1 1376 11
	ldr	r3, [sp, #16]
	ldrb	r3, [r3]
	strb	r3, [sp, #15]
	.loc 1 1377 12
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L168
	.loc 1 1377 27 discriminator 1
	movs	r3, #4
	strb	r3, [sp, #23]
	.loc 1 1377 9 discriminator 1
	b	.L167
.L168:
	.loc 1 1400 18
	ldr	r3, [sp, #16]
	adds	r3, r3, #11
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 1400 29
	and	r3, r3, #8
	.loc 1 1400 12
	cmp	r3, #0
	bne	.L169
	.loc 1 1400 58 discriminator 1
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #24]
	.loc 1 1400 43 discriminator 1
	movs	r2, #11
	mov	r1, r3
	ldr	r0, [sp, #16]
	bl	mem_cmp
	mov	r3, r0
	.loc 1 1400 39 discriminator 1
	cmp	r3, #0
	beq	.L171
.L169:
	.loc 1 1403 15
	movs	r1, #0
	ldr	r0, [sp, #4]
	bl	dir_next
	mov	r3, r0
	strb	r3, [sp, #23]
	.loc 1 1404 5
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L164
	b	.L167
.L170:
	.loc 1 1374 9
	nop
	b	.L167
.L171:
	.loc 1 1401 13
	nop
.L167:
	.loc 1 1406 12
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
.L165:
	.loc 1 1407 1
	mov	r0, r3
	add	sp, sp, #28
.LCFI48:
	@ sp needed
	ldr	pc, [sp], #4
.LFE18:
	.size	dir_find, .-dir_find
	.section	.text.dir_read,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	dir_read, %function
dir_read:
.LFB19:
	.loc 1 1418 1
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI49:
	sub	sp, sp, #28
.LCFI50:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 1425 9
	movs	r3, #4
	strb	r3, [sp, #23]
	.loc 1 1426 11
	b	.L173
.L178:
	.loc 1 1427 15
	ldr	r3, [sp, #4]
	ldr	r2, [r3]
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	mov	r1, r3
	mov	r0, r2
	bl	move_window
	mov	r3, r0
	strb	r3, [sp, #23]
	.loc 1 1428 12
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L181
	.loc 1 1429 13
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #20]
	str	r3, [sp, #16]
	.loc 1 1430 11
	ldr	r3, [sp, #16]
	ldrb	r3, [r3]
	strb	r3, [sp, #15]
	.loc 1 1431 12
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L176
	.loc 1 1431 27 discriminator 1
	movs	r3, #4
	strb	r3, [sp, #23]
	.loc 1 1431 9 discriminator 1
	b	.L175
.L176:
	.loc 1 1432 16
	ldr	r3, [sp, #16]
	adds	r3, r3, #11
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 1432 11
	and	r3, r3, #63
	strb	r3, [sp, #14]
	.loc 1 1452 12
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #229
	beq	.L177
	.loc 1 1452 50 discriminator 1
	ldrb	r3, [sp, #14]	@ zero_extendqisi2
	cmp	r3, #15
	beq	.L177
	.loc 1 1452 77 discriminator 2
	ldrb	r3, [sp, #14]	@ zero_extendqisi2
	bic	r3, r3, #32
	.loc 1 1452 68 discriminator 2
	cmp	r3, #8
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r2, r3
	.loc 1 1452 65 discriminator 2
	ldr	r3, [sp]
	cmp	r3, r2
	beq	.L182
.L177:
	.loc 1 1455 15
	movs	r1, #0
	ldr	r0, [sp, #4]
	bl	dir_next
	mov	r3, r0
	strb	r3, [sp, #23]
	.loc 1 1456 12
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L183
.L173:
	.loc 1 1426 14
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	.loc 1 1426 11
	cmp	r3, #0
	bne	.L178
	b	.L175
.L181:
	.loc 1 1428 9
	nop
	b	.L175
.L182:
	.loc 1 1453 13
	nop
	b	.L175
.L183:
	.loc 1 1456 9
	nop
.L175:
	.loc 1 1459 8
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L179
	.loc 1 1459 32 discriminator 1
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #16]
.L179:
	.loc 1 1461 12
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	.loc 1 1462 1
	mov	r0, r3
	add	sp, sp, #28
.LCFI51:
	@ sp needed
	ldr	pc, [sp], #4
.LFE19:
	.size	dir_read, .-dir_read
	.section	.text.dir_register,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	dir_register, %function
dir_register:
.LFB20:
	.loc 1 1473 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI52:
	sub	sp, sp, #20
.LCFI53:
	str	r0, [sp, #4]
	.loc 1 1520 11
	movs	r1, #1
	ldr	r0, [sp, #4]
	bl	dir_alloc
	mov	r3, r0
	strb	r3, [sp, #15]
	.loc 1 1523 8
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L185
	.loc 1 1524 15
	ldr	r3, [sp, #4]
	ldr	r2, [r3]
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	mov	r1, r3
	mov	r0, r2
	bl	move_window
	mov	r3, r0
	strb	r3, [sp, #15]
	.loc 1 1525 12
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L185
	.loc 1 1526 23
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #20]
	.loc 1 1526 13
	movs	r2, #32
	movs	r1, #0
	mov	r0, r3
	bl	mem_set
	.loc 1 1527 23
	ldr	r3, [sp, #4]
	ldr	r0, [r3, #20]
	.loc 1 1527 32
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #24]
	.loc 1 1527 13
	movs	r2, #11
	mov	r1, r3
	bl	mem_cpy
	.loc 1 1531 15
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 1531 27
	movs	r2, #1
	strb	r2, [r3, #4]
.L185:
	.loc 1 1535 12
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	.loc 1 1536 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI54:
	@ sp needed
	ldr	pc, [sp], #4
.LFE20:
	.size	dir_register, .-dir_register
	.section	.text.dir_remove,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	dir_remove, %function
dir_remove:
.LFB21:
	.loc 1 1547 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI55:
	sub	sp, sp, #20
.LCFI56:
	str	r0, [sp, #4]
	.loc 1 1568 25
	ldr	r3, [sp, #4]
	ldrh	r3, [r3, #6]
	.loc 1 1568 11
	mov	r1, r3
	ldr	r0, [sp, #4]
	bl	dir_sdi
	mov	r3, r0
	strb	r3, [sp, #15]
	.loc 1 1569 8
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L188
	.loc 1 1570 15
	ldr	r3, [sp, #4]
	ldr	r2, [r3]
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	mov	r1, r3
	mov	r0, r2
	bl	move_window
	mov	r3, r0
	strb	r3, [sp, #15]
	.loc 1 1571 12
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L188
	.loc 1 1572 23
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #20]
	.loc 1 1572 13
	movs	r2, #32
	movs	r1, #0
	mov	r0, r3
	bl	mem_set
	.loc 1 1573 16
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #20]
	.loc 1 1573 22
	movs	r2, #229
	strb	r2, [r3]
	.loc 1 1574 15
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 1574 27
	movs	r2, #1
	strb	r2, [r3, #4]
.L188:
	.loc 1 1579 12
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	.loc 1 1580 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI57:
	@ sp needed
	ldr	pc, [sp], #4
.LFE21:
	.size	dir_remove, .-dir_remove
	.section	.text.get_fileinfo,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	get_fileinfo, %function
get_fileinfo:
.LFB22:
	.loc 1 1592 1
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #24
.LCFI58:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 1600 7
	ldr	r3, [sp]
	adds	r3, r3, #9
	str	r3, [sp, #16]
	.loc 1 1601 11
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	.loc 1 1601 8
	cmp	r3, #0
	beq	.L191
	.loc 1 1602 13
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #20]
	str	r3, [sp, #8]
	.loc 1 1603 11
	movs	r3, #0
	str	r3, [sp, #20]
	.loc 1 1604 15
	b	.L192
.L196:
	.loc 1 1605 29
	ldr	r3, [sp, #20]
	adds	r2, r3, #1
	str	r2, [sp, #20]
	.loc 1 1605 27
	ldr	r2, [sp, #8]
	add	r3, r3, r2
	.loc 1 1605 15
	ldrb	r3, [r3]
	strb	r3, [sp, #15]
	.loc 1 1606 16
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #32
	bne	.L193
	.loc 1 1606 13 discriminator 1
	b	.L192
.L193:
	.loc 1 1607 16
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #5
	bne	.L194
	.loc 1 1607 31 discriminator 1
	movs	r3, #229
	strb	r3, [sp, #15]
.L194:
	.loc 1 1608 16
	ldr	r3, [sp, #20]
	cmp	r3, #9
	bne	.L195
	.loc 1 1608 27 discriminator 1
	ldr	r3, [sp, #16]
	adds	r2, r3, #1
	str	r2, [sp, #16]
	.loc 1 1608 30 discriminator 1
	movs	r2, #46
	strb	r2, [r3]
.L195:
	.loc 1 1619 15
	ldr	r3, [sp, #16]
	adds	r2, r3, #1
	str	r2, [sp, #16]
	.loc 1 1619 18
	ldrb	r2, [sp, #15]
	strb	r2, [r3]
.L192:
	.loc 1 1604 15
	ldr	r3, [sp, #20]
	cmp	r3, #10
	bls	.L196
	.loc 1 1621 22
	ldr	r3, [sp, #8]
	ldrb	r2, [r3, #11]	@ zero_extendqisi2
	ldr	r3, [sp]
	strb	r2, [r3, #8]
	.loc 1 1622 22
	ldr	r3, [sp, #8]
	adds	r3, r3, #31
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsls	r2, r3, #24
	ldr	r3, [sp, #8]
	adds	r3, r3, #30
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsls	r3, r3, #16
	orrs	r3, r3, r2
	ldr	r2, [sp, #8]
	adds	r2, r2, #29
	ldrb	r2, [r2]	@ zero_extendqisi2
	lsls	r2, r2, #8
	orrs	r3, r3, r2
	ldr	r2, [sp, #8]
	adds	r2, r2, #28
	ldrb	r2, [r2]	@ zero_extendqisi2
	orrs	r2, r2, r3
	.loc 1 1622 20
	ldr	r3, [sp]
	str	r2, [r3]
	.loc 1 1623 22
	ldr	r3, [sp, #8]
	adds	r3, r3, #25
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsls	r3, r3, #8
	sxth	r2, r3
	ldr	r3, [sp, #8]
	adds	r3, r3, #24
	ldrb	r3, [r3]	@ zero_extendqisi2
	sxth	r3, r3
	orrs	r3, r3, r2
	sxth	r3, r3
	uxth	r2, r3
	.loc 1 1623 20
	ldr	r3, [sp]
	strh	r2, [r3, #4]	@ movhi
	.loc 1 1624 22
	ldr	r3, [sp, #8]
	adds	r3, r3, #23
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsls	r3, r3, #8
	sxth	r2, r3
	ldr	r3, [sp, #8]
	adds	r3, r3, #22
	ldrb	r3, [r3]	@ zero_extendqisi2
	sxth	r3, r3
	orrs	r3, r3, r2
	sxth	r3, r3
	uxth	r2, r3
	.loc 1 1624 20
	ldr	r3, [sp]
	strh	r2, [r3, #6]	@ movhi
.L191:
	.loc 1 1626 8
	ldr	r3, [sp, #16]
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 1647 1
	nop
	add	sp, sp, #24
.LCFI59:
	@ sp needed
	bx	lr
.LFE22:
	.size	get_fileinfo, .-get_fileinfo
	.section .rodata
	.align	2
.LC0:
	.ascii	"\"*+,:;<=>?[]|\177\000"
	.section	.text.create_name,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	create_name, %function
create_name:
.LFB23:
	.loc 1 1724 1
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI60:
	sub	sp, sp, #36
.LCFI61:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 1850 12
	ldr	r3, [sp]
	ldr	r3, [r3]
	str	r3, [sp, #12]
	.loc 1 1850 5
	b	.L198
.L199:
	.loc 1 1850 47 discriminator 5
	ldr	r3, [sp, #12]
	adds	r3, r3, #1
	str	r3, [sp, #12]
.L198:
	.loc 1 1850 21 discriminator 1
	ldr	r3, [sp, #12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 1850 5 discriminator 1
	cmp	r3, #47
	beq	.L199
	.loc 1 1850 34 discriminator 4
	ldr	r3, [sp, #12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 1850 31 discriminator 4
	cmp	r3, #92
	beq	.L199
	.loc 1 1851 9
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #24]
	str	r3, [sp, #8]
	.loc 1 1852 5
	movs	r2, #11
	movs	r1, #32
	ldr	r0, [sp, #8]
	bl	mem_set
	.loc 1 1853 16
	movs	r3, #0
	strb	r3, [sp, #31]
	.loc 1 1853 12
	movs	r3, #0
	str	r3, [sp, #16]
	.loc 1 1853 8
	ldr	r3, [sp, #16]
	str	r3, [sp, #20]
	.loc 1 1853 24
	movs	r3, #8
	str	r3, [sp, #24]
	.loc 1 1855 10
	ldr	r2, [sp, #12]
	ldr	r3, [sp, #20]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 1855 8
	cmp	r3, #46
	bne	.L200
.L202:
	.loc 1 1857 27
	ldr	r3, [sp, #20]
	adds	r2, r3, #1
	str	r2, [sp, #20]
	.loc 1 1857 24
	ldr	r2, [sp, #12]
	add	r3, r3, r2
	.loc 1 1857 15
	ldrb	r3, [r3]
	strb	r3, [sp, #30]
	.loc 1 1858 16
	ldrb	r3, [sp, #30]	@ zero_extendqisi2
	cmp	r3, #46
	bne	.L201
	.loc 1 1858 26 discriminator 1
	ldr	r3, [sp, #20]
	cmp	r3, #2
	bhi	.L201
	.loc 1 1859 18
	ldr	r3, [sp, #16]
	adds	r2, r3, #1
	str	r2, [sp, #16]
	.loc 1 1859 16
	ldr	r2, [sp, #8]
	add	r3, r3, r2
	.loc 1 1859 22
	ldrb	r2, [sp, #30]
	strb	r2, [r3]
	.loc 1 1857 15
	b	.L202
.L201:
	.loc 1 1861 12
	ldrb	r3, [sp, #30]	@ zero_extendqisi2
	cmp	r3, #47
	beq	.L203
	.loc 1 1861 22 discriminator 1
	ldrb	r3, [sp, #30]	@ zero_extendqisi2
	cmp	r3, #92
	beq	.L203
	.loc 1 1861 35 discriminator 2
	ldrb	r3, [sp, #30]	@ zero_extendqisi2
	cmp	r3, #32
	bls	.L203
	.loc 1 1861 54 discriminator 3
	movs	r3, #6
	b	.L204
.L203:
	.loc 1 1862 17
	ldr	r2, [sp, #12]
	ldr	r3, [sp, #20]
	add	r2, r2, r3
	.loc 1 1862 15
	ldr	r3, [sp]
	str	r2, [r3]
	.loc 1 1863 21
	ldrb	r3, [sp, #30]	@ zero_extendqisi2
	cmp	r3, #32
	bhi	.L205
	.loc 1 1863 21 is_stmt 0 discriminator 1
	movs	r2, #36
	b	.L206
.L205:
	.loc 1 1863 21 discriminator 2
	movs	r2, #32
.L206:
	.loc 1 1863 12 is_stmt 1 discriminator 4
	ldr	r3, [sp, #8]
	adds	r3, r3, #11
	.loc 1 1863 21 discriminator 4
	strb	r2, [r3]
	.loc 1 1864 16 discriminator 4
	movs	r3, #0
	b	.L204
.L200:
	.loc 1 1868 23
	ldr	r3, [sp, #20]
	adds	r2, r3, #1
	str	r2, [sp, #20]
	.loc 1 1868 20
	ldr	r2, [sp, #12]
	add	r3, r3, r2
	.loc 1 1868 11
	ldrb	r3, [r3]
	strb	r3, [sp, #30]
	.loc 1 1869 12
	ldrb	r3, [sp, #30]	@ zero_extendqisi2
	cmp	r3, #32
	bls	.L207
	.loc 1 1869 22 discriminator 1
	ldrb	r3, [sp, #30]	@ zero_extendqisi2
	cmp	r3, #47
	beq	.L207
	.loc 1 1869 34 discriminator 2
	ldrb	r3, [sp, #30]	@ zero_extendqisi2
	cmp	r3, #92
	beq	.L207
	.loc 1 1870 12
	ldrb	r3, [sp, #30]	@ zero_extendqisi2
	cmp	r3, #46
	beq	.L208
	.loc 1 1870 22 discriminator 1
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #24]
	cmp	r2, r3
	bcc	.L209
.L208:
	.loc 1 1871 16
	ldr	r3, [sp, #24]
	cmp	r3, #8
	bne	.L210
	.loc 1 1871 25 discriminator 2
	ldrb	r3, [sp, #30]	@ zero_extendqisi2
	cmp	r3, #46
	beq	.L211
.L210:
	.loc 1 1871 45 discriminator 3
	movs	r3, #6
	b	.L204
.L211:
	.loc 1 1872 15
	movs	r3, #8
	str	r3, [sp, #16]
	.loc 1 1872 23
	movs	r3, #11
	str	r3, [sp, #24]
	.loc 1 1873 15
	ldrb	r3, [sp, #31]
	lsls	r3, r3, #2
	strb	r3, [sp, #31]
	.loc 1 1873 13
	b	.L212
.L209:
	.loc 1 1875 15
	ldrsb	r3, [sp, #30]
	.loc 1 1875 12
	cmp	r3, #0
	bge	.L213
	.loc 1 1876 15
	ldrb	r3, [sp, #31]
	orr	r3, r3, #3
	strb	r3, [sp, #31]
	.loc 1 1878 25
	ldrb	r3, [sp, #30]	@ zero_extendqisi2
	subs	r3, r3, #128
	.loc 1 1878 15
	ldr	r2, .L224
	ldrb	r3, [r2, r3]
	strb	r3, [sp, #30]
.L213:
	.loc 1 1892 17
	ldrb	r3, [sp, #30]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, .L224+4
	bl	chk_chr
	mov	r3, r0
	.loc 1 1892 16
	cmp	r3, #0
	beq	.L214
	.loc 1 1893 24
	movs	r3, #6
	b	.L204
.L214:
	.loc 1 1894 16
	ldrb	r3, [sp, #30]	@ zero_extendqisi2
	cmp	r3, #64
	bls	.L215
	.loc 1 1894 17 discriminator 1
	ldrb	r3, [sp, #30]	@ zero_extendqisi2
	cmp	r3, #90
	bhi	.L215
	.loc 1 1895 19
	ldrb	r3, [sp, #31]
	orr	r3, r3, #2
	strb	r3, [sp, #31]
	b	.L216
.L215:
	.loc 1 1897 20
	ldrb	r3, [sp, #30]	@ zero_extendqisi2
	cmp	r3, #96
	bls	.L216
	.loc 1 1897 21 discriminator 1
	ldrb	r3, [sp, #30]	@ zero_extendqisi2
	cmp	r3, #122
	bhi	.L216
	.loc 1 1898 23
	ldrb	r3, [sp, #31]
	orr	r3, r3, #1
	strb	r3, [sp, #31]
	.loc 1 1898 31
	ldrb	r3, [sp, #30]
	subs	r3, r3, #32
	strb	r3, [sp, #30]
.L216:
	.loc 1 1901 18
	ldr	r3, [sp, #16]
	adds	r2, r3, #1
	str	r2, [sp, #16]
	.loc 1 1901 16
	ldr	r2, [sp, #8]
	add	r3, r3, r2
	.loc 1 1901 22
	ldrb	r2, [sp, #30]
	strb	r2, [r3]
.L212:
	.loc 1 1868 11
	b	.L200
.L207:
	.loc 1 1904 13
	ldr	r2, [sp, #12]
	ldr	r3, [sp, #20]
	add	r2, r2, r3
	.loc 1 1904 11
	ldr	r3, [sp]
	str	r2, [r3]
	.loc 1 1905 7
	ldrb	r3, [sp, #30]	@ zero_extendqisi2
	cmp	r3, #32
	bhi	.L217
	.loc 1 1905 7 is_stmt 0 discriminator 1
	movs	r3, #4
	b	.L218
.L217:
	.loc 1 1905 7 discriminator 2
	movs	r3, #0
.L218:
	.loc 1 1905 7 discriminator 4
	strb	r3, [sp, #30]
	.loc 1 1907 8 is_stmt 1 discriminator 4
	ldr	r3, [sp, #16]
	cmp	r3, #0
	bne	.L219
	.loc 1 1907 20 discriminator 1
	movs	r3, #6
	b	.L204
.L219:
	.loc 1 1908 12
	ldr	r3, [sp, #8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 1908 8
	cmp	r3, #229
	bne	.L220
	.loc 1 1908 32 discriminator 1
	ldr	r3, [sp, #8]
	movs	r2, #5
	strb	r2, [r3]
.L220:
	.loc 1 1910 8
	ldr	r3, [sp, #24]
	cmp	r3, #8
	bne	.L221
	.loc 1 1910 20 discriminator 1
	ldrb	r3, [sp, #31]
	lsls	r3, r3, #2
	strb	r3, [sp, #31]
.L221:
	.loc 1 1911 12
	ldrb	r3, [sp, #31]	@ zero_extendqisi2
	and	r3, r3, #3
	.loc 1 1911 8
	cmp	r3, #1
	bne	.L222
	.loc 1 1911 31 discriminator 1
	ldrb	r3, [sp, #30]
	orr	r3, r3, #16
	strb	r3, [sp, #30]
.L222:
	.loc 1 1912 12
	ldrb	r3, [sp, #31]	@ zero_extendqisi2
	and	r3, r3, #12
	.loc 1 1912 8
	cmp	r3, #4
	bne	.L223
	.loc 1 1912 31 discriminator 1
	ldrb	r3, [sp, #30]
	orr	r3, r3, #8
	strb	r3, [sp, #30]
.L223:
	.loc 1 1914 8
	ldr	r3, [sp, #8]
	adds	r3, r3, #11
	.loc 1 1914 17
	ldrb	r2, [sp, #30]
	strb	r2, [r3]
	.loc 1 1916 12
	movs	r3, #0
.L204:
	.loc 1 1918 1
	mov	r0, r3
	add	sp, sp, #36
.LCFI62:
	@ sp needed
	ldr	pc, [sp], #4
.L225:
	.align	2
.L224:
	.word	ExCvt
	.word	.LC0
.LFE23:
	.size	create_name, .-create_name
	.section	.text.follow_path,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	follow_path, %function
follow_path:
.LFB24:
	.loc 1 1929 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI63:
	sub	sp, sp, #20
.LCFI64:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 1934 9
	ldr	r3, [sp]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 1934 8
	cmp	r3, #47
	beq	.L227
	.loc 1 1934 25 discriminator 1
	ldr	r3, [sp]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 1934 22 discriminator 1
	cmp	r3, #92
	bne	.L228
.L227:
	.loc 1 1935 13
	ldr	r3, [sp]
	adds	r3, r3, #1
	str	r3, [sp]
	.loc 1 1935 31
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #8]
	b	.L229
.L228:
	.loc 1 1937 24
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 1937 28
	ldr	r2, [r3, #20]
	.loc 1 1937 20
	ldr	r3, [sp, #4]
	str	r2, [r3, #8]
.L229:
	.loc 1 1945 15
	ldr	r3, [sp]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 1945 8
	cmp	r3, #31
	bhi	.L230
	.loc 1 1946 15
	movs	r1, #0
	ldr	r0, [sp, #4]
	bl	dir_sdi
	mov	r3, r0
	strb	r3, [sp, #15]
	.loc 1 1947 17
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #20]
	b	.L231
.L230:
	.loc 1 1950 19
	mov	r3, sp
	mov	r1, r3
	ldr	r0, [sp, #4]
	bl	create_name
	mov	r3, r0
	strb	r3, [sp, #15]
	.loc 1 1951 16
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L241
	.loc 1 1952 19
	ldr	r0, [sp, #4]
	bl	dir_find
	mov	r3, r0
	strb	r3, [sp, #15]
	.loc 1 1953 20
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #24]
	.loc 1 1953 16
	ldrb	r3, [r3, #11]
	strb	r3, [sp, #14]
	.loc 1 1954 16
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L233
	.loc 1 1955 20
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L242
	.loc 1 1956 42
	ldrb	r3, [sp, #14]	@ zero_extendqisi2
	and	r3, r3, #32
	.loc 1 1956 24
	cmp	r3, #0
	beq	.L235
	.loc 1 1957 36
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #8]
	.loc 1 1957 49
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #20]
	.loc 1 1958 34
	ldrb	r3, [sp, #14]	@ zero_extendqisi2
	and	r3, r3, #4
	.loc 1 1958 28
	cmp	r3, #0
	beq	.L243
	.loc 1 1959 29
	movs	r3, #0
	strb	r3, [sp, #15]
	.loc 1 1964 17
	b	.L242
.L235:
	.loc 1 1961 34
	ldrb	r3, [sp, #14]	@ zero_extendqisi2
	and	r3, r3, #4
	.loc 1 1961 28
	cmp	r3, #0
	bne	.L242
	.loc 1 1961 50 discriminator 1
	movs	r3, #5
	strb	r3, [sp, #15]
	.loc 1 1964 17 discriminator 1
	b	.L242
.L233:
	.loc 1 1966 20
	ldrb	r3, [sp, #14]	@ zero_extendqisi2
	and	r3, r3, #4
	.loc 1 1966 16
	cmp	r3, #0
	bne	.L244
	.loc 1 1967 17
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #20]
	str	r3, [sp, #8]
	.loc 1 1968 22
	ldr	r3, [sp, #8]
	adds	r3, r3, #11
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 1968 33
	and	r3, r3, #16
	.loc 1 1968 16
	cmp	r3, #0
	bne	.L239
	.loc 1 1969 21
	movs	r3, #5
	strb	r3, [sp, #15]
	.loc 1 1969 17
	b	.L231
.L239:
	.loc 1 1971 26
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	ldr	r1, [sp, #8]
	mov	r0, r3
	bl	ld_clust
	mov	r2, r0
	.loc 1 1971 24
	ldr	r3, [sp, #4]
	str	r2, [r3, #8]
	b	.L230
.L243:
	.loc 1 1958 25
	nop
	.loc 1 1950 17
	b	.L230
.L241:
	.loc 1 1951 13
	nop
	b	.L231
.L242:
	.loc 1 1964 17
	nop
	b	.L231
.L244:
	.loc 1 1966 13
	nop
.L231:
	.loc 1 1975 12
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	.loc 1 1976 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI65:
	@ sp needed
	ldr	pc, [sp], #4
.LFE24:
	.size	follow_path, .-follow_path
	.section	.text.get_ldnumber,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	get_ldnumber, %function
get_ldnumber:
.LFB25:
	.loc 1 1986 1
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #24
.LCFI66:
	str	r0, [sp, #4]
	.loc 1 1989 9
	mov	r3, #-1
	str	r3, [sp, #16]
	.loc 1 1997 9
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 1997 8
	cmp	r3, #0
	beq	.L246
	.loc 1 1998 17
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	str	r3, [sp, #20]
	.loc 1 1998 9
	b	.L247
.L249:
	.loc 1 1998 79 discriminator 4
	ldr	r3, [sp, #20]
	adds	r3, r3, #1
	str	r3, [sp, #20]
.L247:
	.loc 1 1998 32 discriminator 1
	ldr	r3, [sp, #20]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 1998 9 discriminator 1
	cmp	r3, #32
	bls	.L248
	.loc 1 1998 65 discriminator 3
	ldr	r3, [sp, #20]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 1998 62 discriminator 3
	cmp	r3, #58
	bne	.L249
.L248:
	.loc 1 1999 13
	ldr	r3, [sp, #20]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 1999 12
	cmp	r3, #58
	bne	.L250
	.loc 1 2000 16
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	str	r3, [sp, #12]
	.loc 1 2001 20
	ldr	r3, [sp, #12]
	adds	r2, r3, #1
	str	r2, [sp, #12]
	.loc 1 2001 17
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 2001 23
	subs	r3, r3, #48
	.loc 1 2001 15
	str	r3, [sp, #8]
	.loc 1 2002 16
	ldr	r3, [sp, #8]
	cmp	r3, #9
	bhi	.L251
	.loc 1 2002 24 discriminator 1
	ldr	r2, [sp, #12]
	ldr	r3, [sp, #20]
	cmp	r2, r3
	bne	.L251
	.loc 1 2003 20
	ldr	r3, [sp, #8]
	cmp	r3, #4
	bhi	.L251
	.loc 1 2004 25
	ldr	r3, [sp, #8]
	str	r3, [sp, #16]
	.loc 1 2005 27
	ldr	r3, [sp, #20]
	adds	r3, r3, #1
	str	r3, [sp, #20]
	ldr	r3, [sp, #4]
	ldr	r2, [sp, #20]
	str	r2, [r3]
.L251:
	.loc 1 2024 20
	ldr	r3, [sp, #16]
	b	.L252
.L250:
	.loc 1 2027 13
	ldr	r3, .L253
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [sp, #16]
.L246:
	.loc 1 2032 12
	ldr	r3, [sp, #16]
.L252:
	.loc 1 2033 1
	mov	r0, r3
	add	sp, sp, #24
.LCFI67:
	@ sp needed
	bx	lr
.L254:
	.align	2
.L253:
	.word	CurrVol
.LFE25:
	.size	get_ldnumber, .-get_ldnumber
	.section	.text.check_fs,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	check_fs, %function
check_fs:
.LFB26:
	.loc 1 2044 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI68:
	sub	sp, sp, #12
.LCFI69:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 2045 15
	ldr	r3, [sp, #4]
	movs	r2, #0
	strb	r2, [r3, #4]
	.loc 1 2045 32
	ldr	r3, [sp, #4]
	mov	r2, #-1
	str	r2, [r3, #48]
	.loc 1 2046 9
	ldr	r1, [sp]
	ldr	r0, [sp, #4]
	bl	move_window
	mov	r3, r0
	.loc 1 2046 8
	cmp	r3, #0
	beq	.L256
	.loc 1 2047 16
	movs	r3, #3
	b	.L257
.L256:
	.loc 1 2049 9
	ldr	r3, [sp, #4]
	addw	r3, r3, #562
	adds	r3, r3, #1
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsls	r3, r3, #8
	sxth	r2, r3
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #562]	@ zero_extendqisi2
	sxth	r3, r3
	orrs	r3, r3, r2
	sxth	r3, r3
	.loc 1 2049 8
	ldr	r2, .L261
	cmp	r3, r2
	beq	.L258
	.loc 1 2050 16
	movs	r3, #2
	b	.L257
.L258:
	.loc 1 2052 10
	ldr	r3, [sp, #4]
	adds	r3, r3, #106
	adds	r3, r3, #3
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsls	r2, r3, #24
	ldr	r3, [sp, #4]
	adds	r3, r3, #106
	adds	r3, r3, #2
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsls	r3, r3, #16
	orrs	r3, r3, r2
	ldr	r2, [sp, #4]
	adds	r2, r2, #106
	adds	r2, r2, #1
	ldrb	r2, [r2]	@ zero_extendqisi2
	lsls	r2, r2, #8
	orrs	r3, r3, r2
	ldr	r2, [sp, #4]
	ldrb	r2, [r2, #106]	@ zero_extendqisi2
	orrs	r3, r3, r2
	.loc 1 2052 44
	bic	r3, r3, #-16777216
	.loc 1 2052 8
	ldr	r2, .L261+4
	cmp	r3, r2
	bne	.L259
	.loc 1 2053 16
	movs	r3, #0
	b	.L257
.L259:
	.loc 1 2054 10
	ldr	r3, [sp, #4]
	adds	r3, r3, #134
	adds	r3, r3, #3
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsls	r2, r3, #24
	ldr	r3, [sp, #4]
	adds	r3, r3, #134
	adds	r3, r3, #2
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsls	r3, r3, #16
	orrs	r3, r3, r2
	ldr	r2, [sp, #4]
	adds	r2, r2, #134
	adds	r2, r2, #1
	ldrb	r2, [r2]	@ zero_extendqisi2
	lsls	r2, r2, #8
	orrs	r3, r3, r2
	ldr	r2, [sp, #4]
	ldrb	r2, [r2, #134]	@ zero_extendqisi2
	orrs	r3, r3, r2
	.loc 1 2054 46
	bic	r3, r3, #-16777216
	.loc 1 2054 8
	ldr	r2, .L261+4
	cmp	r3, r2
	bne	.L260
	.loc 1 2055 16
	movs	r3, #0
	b	.L257
.L260:
	.loc 1 2057 12
	movs	r3, #1
.L257:
	.loc 1 2058 1
	mov	r0, r3
	add	sp, sp, #12
.LCFI70:
	@ sp needed
	ldr	pc, [sp], #4
.L262:
	.align	2
.L261:
	.word	-21931
	.word	5521734
.LFE26:
	.size	check_fs, .-check_fs
	.section	.text.find_volume,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	find_volume, %function
find_volume:
.LFB27:
	.loc 1 2070 1
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI71:
	sub	sp, sp, #92
.LCFI72:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	mov	r3, r2
	strb	r3, [sp, #7]
	.loc 1 2080 10
	ldr	r3, [sp, #12]
	movs	r2, #0
	str	r2, [r3]
	.loc 1 2081 11
	ldr	r0, [sp, #8]
	bl	get_ldnumber
	str	r0, [sp, #60]
	.loc 1 2082 8
	ldr	r3, [sp, #60]
	cmp	r3, #0
	bge	.L264
	.loc 1 2082 25 discriminator 1
	movs	r3, #11
	b	.L302
.L264:
	.loc 1 2085 8
	ldr	r2, .L303
	ldr	r3, [sp, #60]
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [sp, #56]
	.loc 1 2086 8
	ldr	r3, [sp, #56]
	cmp	r3, #0
	bne	.L266
	.loc 1 2086 21 discriminator 1
	movs	r3, #12
	b	.L302
.L266:
	.loc 1 2089 10
	ldr	r3, [sp, #12]
	ldr	r2, [sp, #56]
	str	r2, [r3]
	.loc 1 2091 11
	ldr	r3, [sp, #56]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 2091 8
	cmp	r3, #0
	beq	.L267
	.loc 1 2092 16
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	mov	r0, r3
	bl	disk_status
	mov	r3, r0
	strb	r3, [sp, #55]
	.loc 1 2093 20
	ldrb	r3, [sp, #55]	@ zero_extendqisi2
	and	r3, r3, #1
	.loc 1 2093 12
	cmp	r3, #0
	bne	.L267
	.loc 1 2094 16
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L268
	.loc 1 2094 49 discriminator 1
	ldrb	r3, [sp, #55]	@ zero_extendqisi2
	and	r3, r3, #4
	.loc 1 2094 40 discriminator 1
	cmp	r3, #0
	beq	.L268
	.loc 1 2095 24
	movs	r3, #10
	b	.L302
.L268:
	.loc 1 2096 20
	movs	r3, #0
	b	.L302
.L267:
	.loc 1 2103 17
	ldr	r3, [sp, #56]
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 2104 15
	ldr	r3, [sp, #60]
	uxtb	r2, r3
	.loc 1 2104 13
	ldr	r3, [sp, #56]
	strb	r2, [r3, #1]
	.loc 1 2105 12
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	mov	r0, r3
	bl	disk_initialize
	mov	r3, r0
	strb	r3, [sp, #55]
	.loc 1 2106 14
	ldrb	r3, [sp, #55]	@ zero_extendqisi2
	and	r3, r3, #1
	.loc 1 2106 8
	cmp	r3, #0
	beq	.L269
	.loc 1 2107 16
	movs	r3, #3
	b	.L302
.L269:
	.loc 1 2108 8
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L270
	.loc 1 2108 41 discriminator 1
	ldrb	r3, [sp, #55]	@ zero_extendqisi2
	and	r3, r3, #4
	.loc 1 2108 32 discriminator 1
	cmp	r3, #0
	beq	.L270
	.loc 1 2109 16
	movs	r3, #10
	b	.L302
.L270:
	.loc 1 2115 11
	movs	r3, #0
	str	r3, [sp, #80]
	.loc 1 2116 11
	ldr	r1, [sp, #80]
	ldr	r0, [sp, #56]
	bl	check_fs
	mov	r3, r0
	strb	r3, [sp, #87]
	.loc 1 2117 8
	ldrb	r3, [sp, #87]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L271
	.loc 1 2118 16
	movs	r3, #0
	str	r3, [sp, #64]
	.loc 1 2118 9
	b	.L272
.L275:
	.loc 1 2119 18
	ldr	r3, [sp, #56]
	add	r2, r3, #52
	.loc 1 2119 42
	ldr	r3, [sp, #64]
	lsls	r3, r3, #4
	.loc 1 2119 38
	add	r3, r3, #446
	.loc 1 2119 16
	add	r3, r3, r2
	str	r3, [sp, #48]
	.loc 1 2120 23
	ldr	r3, [sp, #48]
	adds	r3, r3, #4
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 2120 46
	cmp	r3, #0
	beq	.L273
	.loc 1 2120 29 discriminator 1
	ldr	r3, [sp, #48]
	adds	r3, r3, #11
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsls	r2, r3, #24
	ldr	r3, [sp, #48]
	adds	r3, r3, #10
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsls	r3, r3, #16
	orrs	r3, r3, r2
	ldr	r2, [sp, #48]
	adds	r2, r2, #9
	ldrb	r2, [r2]	@ zero_extendqisi2
	lsls	r2, r2, #8
	orrs	r3, r3, r2
	ldr	r2, [sp, #48]
	adds	r2, r2, #8
	ldrb	r2, [r2]	@ zero_extendqisi2
	.loc 1 2120 46 discriminator 1
	orrs	r2, r2, r3
	b	.L274
.L273:
	.loc 1 2120 46 is_stmt 0 discriminator 2
	movs	r2, #0
.L274:
	.loc 1 2120 19 is_stmt 1 discriminator 4
	ldr	r3, [sp, #64]
	lsls	r3, r3, #2
	add	r1, sp, #88
	add	r3, r3, r1
	str	r2, [r3, #-68]
	.loc 1 2118 29 discriminator 4
	ldr	r3, [sp, #64]
	adds	r3, r3, #1
	str	r3, [sp, #64]
.L272:
	.loc 1 2118 9 discriminator 2
	ldr	r3, [sp, #64]
	cmp	r3, #3
	bls	.L275
	.loc 1 2122 11
	movs	r3, #0
	str	r3, [sp, #64]
	.loc 1 2123 12
	ldr	r3, [sp, #64]
	cmp	r3, #0
	beq	.L279
	.loc 1 2123 17 discriminator 1
	ldr	r3, [sp, #64]
	subs	r3, r3, #1
	str	r3, [sp, #64]
.L279:
	.loc 1 2125 19
	ldr	r3, [sp, #64]
	lsls	r3, r3, #2
	add	r2, sp, #88
	add	r3, r3, r2
	ldr	r3, [r3, #-68]
	str	r3, [sp, #80]
	.loc 1 2126 17
	ldr	r3, [sp, #80]
	cmp	r3, #0
	beq	.L277
	.loc 1 2126 27 discriminator 1
	ldr	r1, [sp, #80]
	ldr	r0, [sp, #56]
	bl	check_fs
	mov	r3, r0
	b	.L278
.L277:
	.loc 1 2126 17 discriminator 2
	movs	r3, #2
.L278:
	.loc 1 2126 17 is_stmt 0 discriminator 4
	strb	r3, [sp, #87]
	.loc 1 2127 9 is_stmt 1 discriminator 4
	ldrb	r3, [sp, #87]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L271
	.loc 1 2127 37 discriminator 1
	ldr	r3, [sp, #64]
	adds	r3, r3, #1
	str	r3, [sp, #64]
	ldr	r3, [sp, #64]
	cmp	r3, #3
	bls	.L279
.L271:
	.loc 1 2129 8
	ldrb	r3, [sp, #87]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L280
	.loc 1 2129 26 discriminator 1
	movs	r3, #1
	b	.L302
.L280:
	.loc 1 2130 8
	ldrb	r3, [sp, #87]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L281
	.loc 1 2130 21 discriminator 1
	movs	r3, #13
	b	.L302
.L281:
	.loc 1 2134 9
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #64]	@ zero_extendqisi2
	lsls	r3, r3, #8
	sxth	r2, r3
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #63]	@ zero_extendqisi2
	sxth	r3, r3
	orrs	r3, r3, r2
	sxth	r3, r3
	.loc 1 2134 8
	cmp	r3, #512
	beq	.L282
	.loc 1 2135 16
	movs	r3, #13
	b	.L302
.L282:
	.loc 1 2137 14
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #75]	@ zero_extendqisi2
	lsls	r3, r3, #8
	sxth	r2, r3
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #74]	@ zero_extendqisi2
	sxth	r3, r3
	orrs	r3, r3, r2
	sxth	r3, r3
	uxth	r3, r3
	.loc 1 2137 12
	str	r3, [sp, #76]
	.loc 1 2138 8
	ldr	r3, [sp, #76]
	cmp	r3, #0
	bne	.L283
	.loc 1 2138 27 discriminator 1
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #91]	@ zero_extendqisi2
	lsls	r2, r3, #24
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #90]	@ zero_extendqisi2
	lsls	r3, r3, #16
	orrs	r3, r3, r2
	ldr	r2, [sp, #56]
	ldrb	r2, [r2, #89]	@ zero_extendqisi2
	lsls	r2, r2, #8
	orrs	r3, r3, r2
	ldr	r2, [sp, #56]
	ldrb	r2, [r2, #88]	@ zero_extendqisi2
	.loc 1 2138 25 discriminator 1
	orrs	r3, r3, r2
	str	r3, [sp, #76]
.L283:
	.loc 1 2139 15
	ldr	r3, [sp, #56]
	ldr	r2, [sp, #76]
	str	r2, [r3, #28]
	.loc 1 2141 25
	ldr	r3, [sp, #56]
	ldrb	r2, [r3, #68]	@ zero_extendqisi2
	.loc 1 2141 16
	ldr	r3, [sp, #56]
	strb	r2, [r3, #3]
	.loc 1 2142 11
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	.loc 1 2142 8
	cmp	r3, #1
	beq	.L284
	.loc 1 2142 30 discriminator 1
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	.loc 1 2142 25 discriminator 1
	cmp	r3, #2
	beq	.L284
	.loc 1 2143 16
	movs	r3, #13
	b	.L302
.L284:
	.loc 1 2144 17
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	mov	r2, r3
	.loc 1 2144 12
	ldr	r3, [sp, #76]
	mul	r3, r2, r3
	str	r3, [sp, #76]
	.loc 1 2146 24
	ldr	r3, [sp, #56]
	ldrb	r2, [r3, #65]	@ zero_extendqisi2
	.loc 1 2146 15
	ldr	r3, [sp, #56]
	strb	r2, [r3, #2]
	.loc 1 2147 12
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	.loc 1 2147 8
	cmp	r3, #0
	beq	.L285
	.loc 1 2147 26 discriminator 1
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	mov	r2, r3
	.loc 1 2147 39 discriminator 1
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	.loc 1 2147 47 discriminator 1
	subs	r3, r3, #1
	.loc 1 2147 34 discriminator 1
	ands	r3, r3, r2
	.loc 1 2147 20 discriminator 1
	cmp	r3, #0
	beq	.L286
.L285:
	.loc 1 2148 16
	movs	r3, #13
	b	.L302
.L286:
	.loc 1 2150 21
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #70]	@ zero_extendqisi2
	lsls	r3, r3, #8
	sxth	r2, r3
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #69]	@ zero_extendqisi2
	sxth	r3, r3
	orrs	r3, r3, r2
	sxth	r3, r3
	uxth	r2, r3
	.loc 1 2150 19
	ldr	r3, [sp, #56]
	strh	r2, [r3, #8]	@ movhi
	.loc 1 2151 11
	ldr	r3, [sp, #56]
	ldrh	r3, [r3, #8]
	.loc 1 2151 9
	and	r3, r3, #15
	uxth	r3, r3
	.loc 1 2151 8
	cmp	r3, #0
	beq	.L287
	.loc 1 2152 16
	movs	r3, #13
	b	.L302
.L304:
	.align	2
.L303:
	.word	FatFs
.L287:
	.loc 1 2154 13
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #72]	@ zero_extendqisi2
	lsls	r3, r3, #8
	sxth	r2, r3
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #71]	@ zero_extendqisi2
	sxth	r3, r3
	orrs	r3, r3, r2
	sxth	r3, r3
	uxth	r3, r3
	.loc 1 2154 11
	str	r3, [sp, #72]
	.loc 1 2155 8
	ldr	r3, [sp, #72]
	cmp	r3, #0
	bne	.L288
	.loc 1 2155 25 discriminator 1
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #87]	@ zero_extendqisi2
	lsls	r2, r3, #24
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #86]	@ zero_extendqisi2
	lsls	r3, r3, #16
	orrs	r3, r3, r2
	ldr	r2, [sp, #56]
	ldrb	r2, [r2, #85]	@ zero_extendqisi2
	lsls	r2, r2, #8
	orrs	r3, r3, r2
	ldr	r2, [sp, #56]
	ldrb	r2, [r2, #84]	@ zero_extendqisi2
	.loc 1 2155 23 discriminator 1
	orrs	r3, r3, r2
	str	r3, [sp, #72]
.L288:
	.loc 1 2157 12
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #67]	@ zero_extendqisi2
	lsls	r3, r3, #8
	sxth	r2, r3
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #66]	@ zero_extendqisi2
	sxth	r3, r3
	orrs	r3, r3, r2
	sxth	r3, r3
	.loc 1 2157 10
	strh	r3, [sp, #46]	@ movhi
	.loc 1 2158 8
	ldrh	r3, [sp, #46]
	cmp	r3, #0
	bne	.L289
	.loc 1 2158 23 discriminator 1
	movs	r3, #13
	b	.L302
.L289:
	.loc 1 2161 19
	ldrh	r2, [sp, #46]
	ldr	r3, [sp, #76]
	add	r3, r3, r2
	.loc 1 2161 32
	ldr	r2, [sp, #56]
	ldrh	r2, [r2, #8]
	.loc 1 2161 44
	lsrs	r2, r2, #4
	uxth	r2, r2
	.loc 1 2161 12
	add	r3, r3, r2
	str	r3, [sp, #40]
	.loc 1 2162 8
	ldr	r2, [sp, #72]
	ldr	r3, [sp, #40]
	cmp	r2, r3
	bcs	.L290
	.loc 1 2162 32 discriminator 1
	movs	r3, #13
	b	.L302
.L290:
	.loc 1 2163 20
	ldr	r2, [sp, #72]
	ldr	r3, [sp, #40]
	subs	r3, r2, r3
	.loc 1 2163 34
	ldr	r2, [sp, #56]
	ldrb	r2, [r2, #2]	@ zero_extendqisi2
	.loc 1 2163 11
	udiv	r3, r3, r2
	str	r3, [sp, #36]
	.loc 1 2164 8
	ldr	r3, [sp, #36]
	cmp	r3, #0
	bne	.L291
	.loc 1 2164 24 discriminator 1
	movs	r3, #13
	b	.L302
.L291:
	.loc 1 2165 9
	movs	r3, #1
	strb	r3, [sp, #87]
	.loc 1 2166 8
	ldr	r3, [sp, #36]
	movw	r2, #4085
	cmp	r3, r2
	bls	.L292
	.loc 1 2166 33 discriminator 1
	movs	r3, #2
	strb	r3, [sp, #87]
.L292:
	.loc 1 2167 8
	ldr	r3, [sp, #36]
	movw	r2, #65525
	cmp	r3, r2
	bls	.L293
	.loc 1 2167 33 discriminator 1
	movs	r3, #3
	strb	r3, [sp, #87]
.L293:
	.loc 1 2170 26
	ldr	r3, [sp, #36]
	adds	r2, r3, #2
	.loc 1 2170 18
	ldr	r3, [sp, #56]
	str	r2, [r3, #24]
	.loc 1 2171 17
	ldr	r3, [sp, #56]
	ldr	r2, [sp, #80]
	str	r2, [r3, #32]
	.loc 1 2172 25
	ldrh	r2, [sp, #46]
	ldr	r3, [sp, #80]
	add	r2, r2, r3
	.loc 1 2172 17
	ldr	r3, [sp, #56]
	str	r2, [r3, #36]
	.loc 1 2173 26
	ldr	r2, [sp, #80]
	ldr	r3, [sp, #40]
	add	r2, r2, r3
	.loc 1 2173 18
	ldr	r3, [sp, #56]
	str	r2, [r3, #44]
	.loc 1 2174 8
	ldrb	r3, [sp, #87]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L294
	.loc 1 2175 15
	ldr	r3, [sp, #56]
	ldrh	r3, [r3, #8]
	.loc 1 2175 12
	cmp	r3, #0
	beq	.L295
	.loc 1 2175 35 discriminator 1
	movs	r3, #13
	b	.L302
.L295:
	.loc 1 2176 23
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #99]	@ zero_extendqisi2
	lsls	r2, r3, #24
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #98]	@ zero_extendqisi2
	lsls	r3, r3, #16
	orrs	r3, r3, r2
	ldr	r2, [sp, #56]
	ldrb	r2, [r2, #97]	@ zero_extendqisi2
	lsls	r2, r2, #8
	orrs	r3, r3, r2
	ldr	r2, [sp, #56]
	ldrb	r2, [r2, #96]	@ zero_extendqisi2
	orrs	r2, r2, r3
	.loc 1 2176 21
	ldr	r3, [sp, #56]
	str	r2, [r3, #40]
	.loc 1 2177 20
	ldr	r3, [sp, #56]
	ldr	r3, [r3, #24]
	.loc 1 2177 16
	lsls	r3, r3, #2
	str	r3, [sp, #68]
	b	.L296
.L294:
	.loc 1 2179 16
	ldr	r3, [sp, #56]
	ldrh	r3, [r3, #8]
	.loc 1 2179 12
	cmp	r3, #0
	bne	.L297
	.loc 1 2179 39 discriminator 1
	movs	r3, #13
	b	.L302
.L297:
	.loc 1 2180 25
	ldr	r3, [sp, #56]
	ldr	r2, [r3, #36]
	.loc 1 2180 35
	ldr	r3, [sp, #76]
	add	r2, r2, r3
	.loc 1 2180 21
	ldr	r3, [sp, #56]
	str	r2, [r3, #40]
	.loc 1 2182 30
	ldrb	r3, [sp, #87]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L298
	.loc 1 2182 15 discriminator 1
	ldr	r3, [sp, #56]
	ldr	r3, [r3, #24]
	.loc 1 2182 30 discriminator 1
	lsls	r3, r3, #1
	b	.L299
.L298:
	.loc 1 2182 34 discriminator 2
	ldr	r3, [sp, #56]
	ldr	r2, [r3, #24]
	.loc 1 2182 45 discriminator 2
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	.loc 1 2182 49 discriminator 2
	lsrs	r2, r3, #1
	.loc 1 2182 58 discriminator 2
	ldr	r3, [sp, #56]
	ldr	r3, [r3, #24]
	.loc 1 2182 69 discriminator 2
	and	r3, r3, #1
	.loc 1 2182 30 discriminator 2
	add	r3, r3, r2
.L299:
	.loc 1 2181 16
	str	r3, [sp, #68]
.L296:
	.loc 1 2184 11
	ldr	r3, [sp, #56]
	ldr	r2, [r3, #28]
	.loc 1 2184 29
	ldr	r3, [sp, #68]
	addw	r3, r3, #511
	.loc 1 2184 45
	lsrs	r3, r3, #9
	.loc 1 2184 8
	cmp	r2, r3
	bcs	.L300
	.loc 1 2185 16
	movs	r3, #13
	b	.L302
.L300:
	.loc 1 2189 37
	ldr	r3, [sp, #56]
	mov	r2, #-1
	str	r2, [r3, #16]
	.loc 1 2189 24
	ldr	r3, [sp, #56]
	ldr	r2, [r3, #16]
	.loc 1 2189 20
	ldr	r3, [sp, #56]
	str	r2, [r3, #12]
	.loc 1 2192 18
	ldr	r3, [sp, #56]
	movs	r2, #128
	strb	r2, [r3, #5]
	.loc 1 2194 8
	ldrb	r3, [sp, #87]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L301
	.loc 1 2195 12
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #101]	@ zero_extendqisi2
	lsls	r3, r3, #8
	sxth	r2, r3
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #100]	@ zero_extendqisi2
	sxth	r3, r3
	orrs	r3, r3, r2
	sxth	r3, r3
	.loc 1 2195 9
	cmp	r3, #1
	bne	.L301
	.loc 1 2196 12
	ldr	r3, [sp, #80]
	adds	r3, r3, #1
	mov	r1, r3
	ldr	r0, [sp, #56]
	bl	move_window
	mov	r3, r0
	.loc 1 2196 9
	cmp	r3, #0
	bne	.L301
	.loc 1 2198 22
	ldr	r3, [sp, #56]
	movs	r2, #0
	strb	r2, [r3, #5]
	.loc 1 2199 13
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #563]	@ zero_extendqisi2
	lsls	r3, r3, #8
	sxth	r2, r3
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #562]	@ zero_extendqisi2
	sxth	r3, r3
	orrs	r3, r3, r2
	sxth	r3, r3
	.loc 1 2199 12
	ldr	r2, .L305
	cmp	r3, r2
	bne	.L301
	.loc 1 2200 16
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #55]	@ zero_extendqisi2
	lsls	r2, r3, #24
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #54]	@ zero_extendqisi2
	lsls	r3, r3, #16
	orrs	r3, r3, r2
	ldr	r2, [sp, #56]
	ldrb	r2, [r2, #53]	@ zero_extendqisi2
	lsls	r2, r2, #8
	orrs	r3, r3, r2
	ldr	r2, [sp, #56]
	ldrb	r2, [r2, #52]	@ zero_extendqisi2
	orrs	r3, r3, r2
	.loc 1 2200 13
	ldr	r2, .L305+4
	cmp	r3, r2
	bne	.L301
	.loc 1 2201 16
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #539]	@ zero_extendqisi2
	lsls	r2, r3, #24
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #538]	@ zero_extendqisi2
	lsls	r3, r3, #16
	orrs	r3, r3, r2
	ldr	r2, [sp, #56]
	ldrb	r2, [r2, #537]	@ zero_extendqisi2
	lsls	r2, r2, #8
	orrs	r3, r3, r2
	ldr	r2, [sp, #56]
	ldrb	r2, [r2, #536]	@ zero_extendqisi2
	orrs	r3, r3, r2
	.loc 1 2201 13
	ldr	r2, .L305+8
	cmp	r3, r2
	bne	.L301
	.loc 1 2204 30
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #543]	@ zero_extendqisi2
	lsls	r2, r3, #24
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #542]	@ zero_extendqisi2
	lsls	r3, r3, #16
	orrs	r3, r3, r2
	ldr	r2, [sp, #56]
	ldrb	r2, [r2, #541]	@ zero_extendqisi2
	lsls	r2, r2, #8
	orrs	r3, r3, r2
	ldr	r2, [sp, #56]
	ldrb	r2, [r2, #540]	@ zero_extendqisi2
	orrs	r2, r2, r3
	.loc 1 2204 28
	ldr	r3, [sp, #56]
	str	r2, [r3, #16]
	.loc 1 2207 30
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #547]	@ zero_extendqisi2
	lsls	r2, r3, #24
	ldr	r3, [sp, #56]
	ldrb	r3, [r3, #546]	@ zero_extendqisi2
	lsls	r3, r3, #16
	orrs	r3, r3, r2
	ldr	r2, [sp, #56]
	ldrb	r2, [r2, #545]	@ zero_extendqisi2
	lsls	r2, r2, #8
	orrs	r3, r3, r2
	ldr	r2, [sp, #56]
	ldrb	r2, [r2, #544]	@ zero_extendqisi2
	orrs	r2, r2, r3
	.loc 1 2207 28
	ldr	r3, [sp, #56]
	str	r2, [r3, #12]
.L301:
	.loc 1 2213 17
	ldr	r3, [sp, #56]
	ldrb	r2, [sp, #87]
	strb	r2, [r3]
	.loc 1 2214 14
	ldr	r3, .L305+12
	ldrh	r3, [r3]
	adds	r3, r3, #1
	uxth	r2, r3
	.loc 1 2214 12
	ldr	r3, .L305+12
	strh	r2, [r3]	@ movhi
	ldr	r3, .L305+12
	ldrh	r2, [r3]
	ldr	r3, [sp, #56]
	strh	r2, [r3, #6]	@ movhi
	.loc 1 2216 14
	ldr	r3, [sp, #56]
	movs	r2, #0
	str	r2, [r3, #20]
	.loc 1 2222 12
	movs	r3, #0
.L302:
	.loc 1 2223 1 discriminator 1
	mov	r0, r3
	add	sp, sp, #92
.LCFI73:
	@ sp needed
	ldr	pc, [sp], #4
.L306:
	.align	2
.L305:
	.word	-21931
	.word	1096897106
	.word	1631679090
	.word	Fsid
.LFE27:
	.size	find_volume, .-find_volume
	.section	.text.validate,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	validate, %function
validate:
.LFB28:
	.loc 1 2233 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI74:
	sub	sp, sp, #20
.LCFI75:
	str	r0, [sp, #4]
	.loc 1 2234 10
	ldr	r3, [sp, #4]
	str	r3, [sp, #12]
	.loc 1 2236 8
	ldr	r3, [sp, #12]
	cmp	r3, #0
	beq	.L308
	.loc 1 2236 21 discriminator 1
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	.loc 1 2236 14 discriminator 1
	cmp	r3, #0
	beq	.L308
	.loc 1 2236 33 discriminator 2
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	.loc 1 2236 37 discriminator 2
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 2236 26 discriminator 2
	cmp	r3, #0
	beq	.L308
	.loc 1 2236 53 discriminator 3
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	.loc 1 2236 57 discriminator 3
	ldrh	r2, [r3, #6]
	.loc 1 2236 68 discriminator 3
	ldr	r3, [sp, #12]
	ldrh	r3, [r3, #4]
	.loc 1 2236 47 discriminator 3
	cmp	r2, r3
	bne	.L308
	.loc 1 2236 92 discriminator 4
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	.loc 1 2236 77 discriminator 4
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	mov	r0, r3
	bl	disk_status
	mov	r3, r0
	.loc 1 2236 103 discriminator 4
	and	r3, r3, #1
	.loc 1 2236 73 discriminator 4
	cmp	r3, #0
	beq	.L309
.L308:
	.loc 1 2237 16
	movs	r3, #9
	b	.L310
.L309:
	.loc 1 2241 12
	movs	r3, #0
.L310:
	.loc 1 2242 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI76:
	@ sp needed
	ldr	pc, [sp], #4
.LFE28:
	.size	validate, .-validate
	.section	.text.f_mount,"ax",%progbits
	.align	1
	.global	f_mount
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	f_mount, %function
f_mount:
.LFB29:
	.loc 1 2259 1
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI77:
	sub	sp, sp, #36
.LCFI78:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	mov	r3, r2
	strb	r3, [sp, #7]
	.loc 1 2263 18
	ldr	r3, [sp, #8]
	str	r3, [sp, #16]
	.loc 1 2265 11
	add	r3, sp, #16
	mov	r0, r3
	bl	get_ldnumber
	str	r0, [sp, #28]
	.loc 1 2266 8
	ldr	r3, [sp, #28]
	cmp	r3, #0
	bge	.L312
	.loc 1 2266 25 discriminator 1
	movs	r3, #11
	b	.L318
.L312:
	.loc 1 2267 9
	ldr	r2, .L319
	ldr	r3, [sp, #28]
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [sp, #24]
	.loc 1 2269 8
	ldr	r3, [sp, #24]
	cmp	r3, #0
	beq	.L314
	.loc 1 2276 22
	ldr	r3, [sp, #24]
	movs	r2, #0
	strb	r2, [r3]
.L314:
	.loc 1 2279 9
	ldr	r3, [sp, #12]
	.loc 1 2279 8
	cmp	r3, #0
	beq	.L315
	.loc 1 2280 11
	ldr	r3, [sp, #12]
	.loc 1 2280 21
	movs	r2, #0
	strb	r2, [r3]
.L315:
	.loc 1 2285 16
	ldr	r2, [sp, #12]
	ldr	r1, .L319
	ldr	r3, [sp, #28]
	str	r2, [r1, r3, lsl #2]
	.loc 1 2287 9
	ldr	r3, [sp, #12]
	.loc 1 2287 8
	cmp	r3, #0
	beq	.L316
	.loc 1 2287 13 discriminator 2
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L317
.L316:
	.loc 1 2287 33 discriminator 3
	movs	r3, #0
	b	.L318
.L317:
	.loc 1 2289 11
	add	r1, sp, #8
	add	r3, sp, #12
	movs	r2, #0
	mov	r0, r3
	bl	find_volume
	mov	r3, r0
	strb	r3, [sp, #23]
	.loc 1 2290 5
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
.L318:
	.loc 1 2291 1 discriminator 1
	mov	r0, r3
	add	sp, sp, #36
.LCFI79:
	@ sp needed
	ldr	pc, [sp], #4
.L320:
	.align	2
.L319:
	.word	FatFs
.LFE29:
	.size	f_mount, .-f_mount
	.section	.text.f_open,"ax",%progbits
	.align	1
	.global	f_open
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	f_open, %function
f_open:
.LFB30:
	.loc 1 2302 1
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI80:
	sub	sp, sp, #76
.LCFI81:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	mov	r3, r2
	strb	r3, [sp, #7]
	.loc 1 2311 8
	ldr	r3, [sp, #12]
	cmp	r3, #0
	bne	.L322
	.loc 1 2311 21 discriminator 1
	movs	r3, #9
	b	.L335
.L322:
	.loc 1 2312 12
	ldr	r3, [sp, #12]
	movs	r2, #0
	str	r2, [r3]
	.loc 1 2316 10
	ldrb	r3, [sp, #7]
	and	r3, r3, #31
	strb	r3, [sp, #7]
	.loc 1 2317 11
	ldrb	r3, [sp, #7]
	bic	r3, r3, #1
	uxtb	r2, r3
	add	r1, sp, #8
	add	r3, sp, #28
	mov	r0, r3
	bl	find_volume
	mov	r3, r0
	strb	r3, [sp, #71]
	.loc 1 2322 8
	ldrb	r3, [sp, #71]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L324
	.loc 1 2323 9
	add	r3, sp, #16
	str	r3, [sp, #52]
	.loc 1 2324 15
	ldr	r2, [sp, #8]
	add	r3, sp, #28
	mov	r1, r2
	mov	r0, r3
	bl	follow_path
	mov	r3, r0
	strb	r3, [sp, #71]
	.loc 1 2325 13
	ldr	r3, [sp, #48]
	str	r3, [sp, #64]
	.loc 1 2327 12
	ldrb	r3, [sp, #71]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L325
	.loc 1 2328 16
	ldr	r3, [sp, #64]
	cmp	r3, #0
	bne	.L325
	.loc 1 2329 21
	movs	r3, #6
	strb	r3, [sp, #71]
.L325:
	.loc 1 2336 18
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	and	r3, r3, #28
	.loc 1 2336 12
	cmp	r3, #0
	beq	.L326
	.loc 1 2337 16
	ldrb	r3, [sp, #71]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L327
	.loc 1 2338 20
	ldrb	r3, [sp, #71]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L328
	.loc 1 2342 27
	add	r3, sp, #28
	mov	r0, r3
	bl	dir_register
	mov	r3, r0
	strb	r3, [sp, #71]
.L328:
	.loc 1 2344 22
	ldrb	r3, [sp, #7]
	orr	r3, r3, #8
	strb	r3, [sp, #7]
	.loc 1 2345 21
	ldr	r3, [sp, #48]
	str	r3, [sp, #64]
	b	.L329
.L327:
	.loc 1 2348 24
	ldr	r3, [sp, #64]
	adds	r3, r3, #11
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 2348 35
	and	r3, r3, #17
	.loc 1 2348 20
	cmp	r3, #0
	beq	.L330
	.loc 1 2349 25
	movs	r3, #7
	strb	r3, [sp, #71]
	b	.L329
.L330:
	.loc 1 2351 30
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	and	r3, r3, #4
	.loc 1 2351 24
	cmp	r3, #0
	beq	.L329
	.loc 1 2352 29
	movs	r3, #8
	strb	r3, [sp, #71]
.L329:
	.loc 1 2355 16
	ldrb	r3, [sp, #71]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L331
	.loc 1 2355 39 discriminator 1
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	and	r3, r3, #8
	.loc 1 2355 30 discriminator 1
	cmp	r3, #0
	beq	.L331
	.loc 1 2356 22
	bl	get_fattime
	str	r0, [sp, #60]
	.loc 1 2357 17
	ldr	r3, [sp, #64]
	adds	r3, r3, #14
	ldr	r2, [sp, #60]
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #60]
	uxth	r3, r3
	lsrs	r3, r3, #8
	uxth	r2, r3
	ldr	r3, [sp, #64]
	adds	r3, r3, #15
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #60]
	lsrs	r2, r3, #16
	ldr	r3, [sp, #64]
	adds	r3, r3, #16
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #60]
	lsrs	r2, r3, #24
	ldr	r3, [sp, #64]
	adds	r3, r3, #17
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 2358 17
	ldr	r3, [sp, #64]
	adds	r3, r3, #22
	ldr	r2, [sp, #60]
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #60]
	uxth	r3, r3
	lsrs	r3, r3, #8
	uxth	r2, r3
	ldr	r3, [sp, #64]
	adds	r3, r3, #23
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #60]
	lsrs	r2, r3, #16
	ldr	r3, [sp, #64]
	adds	r3, r3, #24
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #60]
	lsrs	r2, r3, #24
	ldr	r3, [sp, #64]
	adds	r3, r3, #25
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 2359 20
	ldr	r3, [sp, #64]
	adds	r3, r3, #11
	.loc 1 2359 31
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 2360 17
	ldr	r3, [sp, #64]
	adds	r3, r3, #28
	movs	r2, #0
	strb	r2, [r3]
	ldr	r3, [sp, #64]
	adds	r3, r3, #29
	movs	r2, #0
	strb	r2, [r3]
	ldr	r3, [sp, #64]
	adds	r3, r3, #30
	movs	r2, #0
	strb	r2, [r3]
	ldr	r3, [sp, #64]
	adds	r3, r3, #31
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 2361 22
	ldr	r3, [sp, #28]
	ldr	r1, [sp, #64]
	mov	r0, r3
	bl	ld_clust
	str	r0, [sp, #56]
	.loc 1 2362 17
	movs	r1, #0
	ldr	r0, [sp, #64]
	bl	st_clust
	.loc 1 2363 19
	ldr	r3, [sp, #28]
	.loc 1 2363 30
	movs	r2, #1
	strb	r2, [r3, #4]
	.loc 1 2364 20
	ldr	r3, [sp, #56]
	cmp	r3, #0
	beq	.L331
	.loc 1 2365 28
	ldr	r3, [sp, #28]
	.loc 1 2365 24
	ldr	r3, [r3, #48]
	str	r3, [sp, #60]
	.loc 1 2366 27
	ldr	r3, [sp, #28]
	ldr	r1, [sp, #56]
	mov	r0, r3
	bl	remove_chain
	mov	r3, r0
	strb	r3, [sp, #71]
	.loc 1 2367 24
	ldrb	r3, [sp, #71]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L331
	.loc 1 2368 27
	ldr	r3, [sp, #28]
	.loc 1 2368 48
	ldr	r2, [sp, #56]
	subs	r2, r2, #1
	.loc 1 2368 43
	str	r2, [r3, #12]
	.loc 1 2369 31
	ldr	r3, [sp, #28]
	ldr	r1, [sp, #60]
	mov	r0, r3
	bl	move_window
	mov	r3, r0
	strb	r3, [sp, #71]
	b	.L331
.L326:
	.loc 1 2375 16
	ldrb	r3, [sp, #71]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L331
	.loc 1 2376 24
	ldr	r3, [sp, #64]
	adds	r3, r3, #11
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 2376 35
	and	r3, r3, #16
	.loc 1 2376 20
	cmp	r3, #0
	beq	.L332
	.loc 1 2377 25
	movs	r3, #4
	strb	r3, [sp, #71]
	b	.L331
.L332:
	.loc 1 2379 31
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	and	r3, r3, #2
	.loc 1 2379 24
	cmp	r3, #0
	beq	.L331
	.loc 1 2379 50 discriminator 1
	ldr	r3, [sp, #64]
	adds	r3, r3, #11
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 2379 61 discriminator 1
	and	r3, r3, #1
	.loc 1 2379 43 discriminator 1
	cmp	r3, #0
	beq	.L331
	.loc 1 2380 29
	movs	r3, #7
	strb	r3, [sp, #71]
.L331:
	.loc 1 2384 12
	ldrb	r3, [sp, #71]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L333
	.loc 1 2385 22
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	and	r3, r3, #8
	.loc 1 2385 16
	cmp	r3, #0
	beq	.L334
	.loc 1 2386 22
	ldrb	r3, [sp, #7]
	orr	r3, r3, #32
	strb	r3, [sp, #7]
.L334:
	.loc 1 2387 30
	ldr	r3, [sp, #28]
	.loc 1 2387 33
	ldr	r2, [r3, #48]
	.loc 1 2387 26
	ldr	r3, [sp, #12]
	str	r2, [r3, #28]
	.loc 1 2388 25
	ldr	r3, [sp, #12]
	ldr	r2, [sp, #64]
	str	r2, [r3, #32]
.L333:
	.loc 1 2408 12
	ldrb	r3, [sp, #71]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L324
	.loc 1 2409 22
	ldr	r3, [sp, #12]
	ldrb	r2, [sp, #7]
	strb	r2, [r3, #6]
	.loc 1 2410 21
	ldr	r3, [sp, #12]
	movs	r2, #0
	strb	r2, [r3, #7]
	.loc 1 2411 26
	ldr	r3, [sp, #28]
	ldr	r1, [sp, #64]
	mov	r0, r3
	bl	ld_clust
	mov	r2, r0
	.loc 1 2411 24
	ldr	r3, [sp, #12]
	str	r2, [r3, #16]
	.loc 1 2412 25
	ldr	r3, [sp, #64]
	adds	r3, r3, #31
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsls	r2, r3, #24
	ldr	r3, [sp, #64]
	adds	r3, r3, #30
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsls	r3, r3, #16
	orrs	r3, r3, r2
	ldr	r2, [sp, #64]
	adds	r2, r2, #29
	ldrb	r2, [r2]	@ zero_extendqisi2
	lsls	r2, r2, #8
	orrs	r3, r3, r2
	ldr	r2, [sp, #64]
	adds	r2, r2, #28
	ldrb	r2, [r2]	@ zero_extendqisi2
	orrs	r2, r2, r3
	.loc 1 2412 23
	ldr	r3, [sp, #12]
	str	r2, [r3, #12]
	.loc 1 2413 22
	ldr	r3, [sp, #12]
	movs	r2, #0
	str	r2, [r3, #8]
	.loc 1 2414 23
	ldr	r3, [sp, #12]
	movs	r2, #0
	str	r2, [r3, #24]
	.loc 1 2416 23
	ldr	r3, [sp, #12]
	movs	r2, #0
	str	r2, [r3, #36]
	.loc 1 2418 24
	ldr	r2, [sp, #28]
	.loc 1 2418 20
	ldr	r3, [sp, #12]
	str	r2, [r3]
	.loc 1 2419 24
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	.loc 1 2419 28
	ldrh	r2, [r3, #6]
	.loc 1 2419 20
	ldr	r3, [sp, #12]
	strh	r2, [r3, #4]	@ movhi
.L324:
	.loc 1 2423 5
	ldrb	r3, [sp, #71]	@ zero_extendqisi2
.L335:
	.loc 1 2424 1 discriminator 1
	mov	r0, r3
	add	sp, sp, #76
.LCFI82:
	@ sp needed
	ldr	pc, [sp], #4
.LFE30:
	.size	f_open, .-f_open
	.section	.text.f_read,"ax",%progbits
	.align	1
	.global	f_read
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	f_read, %function
f_read:
.LFB31:
	.loc 1 2436 1
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI83:
	sub	sp, sp, #52
.LCFI84:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	.loc 1 2440 18
	ldr	r3, [sp, #8]
	str	r3, [sp, #32]
	.loc 1 2442 9
	ldr	r3, [sp]
	movs	r2, #0
	str	r2, [r3]
	.loc 1 2444 11
	ldr	r0, [sp, #12]
	bl	validate
	mov	r3, r0
	strb	r3, [sp, #31]
	.loc 1 2445 8
	ldrb	r3, [sp, #31]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L337
	.loc 1 2445 23 discriminator 1
	ldrb	r3, [sp, #31]	@ zero_extendqisi2
	b	.L338
.L337:
	.loc 1 2446 11
	ldr	r3, [sp, #12]
	ldrb	r3, [r3, #7]	@ zero_extendqisi2
	.loc 1 2446 8
	cmp	r3, #0
	beq	.L339
	.loc 1 2447 9
	ldr	r3, [sp, #12]
	ldrb	r3, [r3, #7]	@ zero_extendqisi2
	b	.L338
.L339:
	.loc 1 2448 13
	ldr	r3, [sp, #12]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	.loc 1 2448 20
	and	r3, r3, #1
	.loc 1 2448 8
	cmp	r3, #0
	bne	.L340
	.loc 1 2449 9
	movs	r3, #7
	b	.L338
.L340:
	.loc 1 2450 16
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #12]
	.loc 1 2450 28
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #8]
	.loc 1 2450 12
	subs	r3, r2, r3
	str	r3, [sp, #24]
	.loc 1 2451 8
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #24]
	cmp	r2, r3
	bls	.L342
	.loc 1 2451 27 discriminator 1
	ldr	r3, [sp, #24]
	str	r3, [sp, #4]
	.loc 1 2453 5 discriminator 1
	b	.L342
.L360:
	.loc 1 2455 16
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #8]
	.loc 1 2455 23
	ubfx	r3, r3, #0, #9
	.loc 1 2455 12
	cmp	r3, #0
	bne	.L343
	.loc 1 2456 30
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #8]
	.loc 1 2456 37
	lsrs	r3, r3, #9
	.loc 1 2456 21
	uxtb	r2, r3
	.loc 1 2456 55
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	.loc 1 2456 59
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	.loc 1 2456 67
	subs	r3, r3, #1
	uxtb	r3, r3
	.loc 1 2456 19
	ands	r3, r3, r2
	strb	r3, [sp, #23]
	.loc 1 2457 16
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L344
	.loc 1 2458 23
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #8]
	.loc 1 2458 20
	cmp	r3, #0
	bne	.L345
	.loc 1 2459 26
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #16]
	str	r3, [sp, #44]
	b	.L346
.L345:
	.loc 1 2462 27
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #36]
	.loc 1 2462 24
	cmp	r3, #0
	beq	.L347
	.loc 1 2463 32
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #8]
	mov	r1, r3
	ldr	r0, [sp, #12]
	bl	clmt_clust
	str	r0, [sp, #44]
	b	.L346
.L347:
	.loc 1 2466 32
	ldr	r3, [sp, #12]
	ldr	r2, [r3]
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #20]
	mov	r1, r3
	mov	r0, r2
	bl	get_fat
	str	r0, [sp, #44]
.L346:
	.loc 1 2468 20
	ldr	r3, [sp, #44]
	cmp	r3, #1
	bhi	.L348
	.loc 1 2468 31 discriminator 1
	ldr	r3, [sp, #12]
	movs	r2, #2
	strb	r2, [r3, #7]
	movs	r3, #2
	b	.L338
.L348:
	.loc 1 2469 20
	ldr	r3, [sp, #44]
	cmp	r3, #-1
	bne	.L349
	.loc 1 2469 41 discriminator 1
	ldr	r3, [sp, #12]
	movs	r2, #1
	strb	r2, [r3, #7]
	movs	r3, #1
	b	.L338
.L349:
	.loc 1 2470 27
	ldr	r3, [sp, #12]
	ldr	r2, [sp, #44]
	str	r2, [r3, #20]
.L344:
	.loc 1 2472 20
	ldr	r3, [sp, #12]
	ldr	r2, [r3]
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #20]
	mov	r1, r3
	mov	r0, r2
	bl	clust2sect
	str	r0, [sp, #16]
	.loc 1 2473 16
	ldr	r3, [sp, #16]
	cmp	r3, #0
	bne	.L350
	.loc 1 2473 24 discriminator 1
	ldr	r3, [sp, #12]
	movs	r2, #2
	strb	r2, [r3, #7]
	movs	r3, #2
	b	.L338
.L350:
	.loc 1 2474 18
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	ldr	r2, [sp, #16]
	add	r3, r3, r2
	str	r3, [sp, #16]
	.loc 1 2475 16
	ldr	r3, [sp, #4]
	lsrs	r3, r3, #9
	str	r3, [sp, #36]
	.loc 1 2476 16
	ldr	r3, [sp, #36]
	cmp	r3, #0
	beq	.L351
	.loc 1 2477 27
	ldrb	r2, [sp, #23]	@ zero_extendqisi2
	ldr	r3, [sp, #36]
	add	r3, r3, r2
	.loc 1 2477 36
	ldr	r2, [sp, #12]
	ldr	r2, [r2]
	.loc 1 2477 40
	ldrb	r2, [r2, #2]	@ zero_extendqisi2
	.loc 1 2477 20
	cmp	r3, r2
	bls	.L352
	.loc 1 2478 28
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	.loc 1 2478 32
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	mov	r2, r3
	.loc 1 2478 40
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	subs	r3, r2, r3
	.loc 1 2478 24
	str	r3, [sp, #36]
.L352:
	.loc 1 2479 33
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	.loc 1 2479 21
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	ldr	r3, [sp, #36]
	uxtb	r3, r3
	ldr	r2, [sp, #16]
	ldr	r1, [sp, #32]
	bl	disk_read
	mov	r3, r0
	.loc 1 2479 20
	cmp	r3, #0
	beq	.L353
	.loc 1 2480 21
	ldr	r3, [sp, #12]
	movs	r2, #1
	strb	r2, [r3, #7]
	movs	r3, #1
	b	.L338
.L353:
	.loc 1 2486 24
	ldr	r3, [sp, #12]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	.loc 1 2486 31
	and	r3, r3, #64
	.loc 1 2486 20
	cmp	r3, #0
	beq	.L354
	.loc 1 2486 49 discriminator 1
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #24]
	.loc 1 2486 57 discriminator 1
	ldr	r3, [sp, #16]
	subs	r3, r2, r3
	.loc 1 2486 44 discriminator 1
	ldr	r2, [sp, #36]
	cmp	r2, r3
	bls	.L354
	.loc 1 2487 41
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #24]
	.loc 1 2487 49
	ldr	r3, [sp, #16]
	subs	r3, r2, r3
	.loc 1 2487 57
	lsls	r3, r3, #9
	.loc 1 2487 35
	ldr	r2, [sp, #32]
	adds	r0, r2, r3
	.loc 1 2487 74
	ldr	r3, [sp, #12]
	adds	r3, r3, #40
	.loc 1 2487 21
	mov	r2, #512
	mov	r1, r3
	bl	mem_cpy
.L354:
	.loc 1 2490 22
	ldr	r3, [sp, #36]
	lsls	r3, r3, #9
	str	r3, [sp, #40]
	.loc 1 2491 17
	b	.L355
.L351:
	.loc 1 2494 19
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #24]
	.loc 1 2494 16
	ldr	r2, [sp, #16]
	cmp	r2, r3
	beq	.L356
	.loc 1 2496 23
	ldr	r3, [sp, #12]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	.loc 1 2496 30
	and	r3, r3, #64
	.loc 1 2496 20
	cmp	r3, #0
	beq	.L357
	.loc 1 2497 38
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	.loc 1 2497 25
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	.loc 1 2497 51
	ldr	r3, [sp, #12]
	add	r1, r3, #40
	.loc 1 2497 60
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #24]
	.loc 1 2497 25
	movs	r3, #1
	bl	disk_write
	mov	r3, r0
	.loc 1 2497 24
	cmp	r3, #0
	beq	.L358
	.loc 1 2498 25
	ldr	r3, [sp, #12]
	movs	r2, #1
	strb	r2, [r3, #7]
	movs	r3, #1
	b	.L338
.L358:
	.loc 1 2499 30
	ldr	r3, [sp, #12]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	bic	r3, r3, #64
	uxtb	r2, r3
	ldr	r3, [sp, #12]
	strb	r2, [r3, #6]
.L357:
	.loc 1 2502 33
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	.loc 1 2502 21
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	.loc 1 2502 46
	ldr	r3, [sp, #12]
	add	r1, r3, #40
	.loc 1 2502 21
	movs	r3, #1
	ldr	r2, [sp, #16]
	bl	disk_read
	mov	r3, r0
	.loc 1 2502 20
	cmp	r3, #0
	beq	.L356
	.loc 1 2503 21
	ldr	r3, [sp, #12]
	movs	r2, #1
	strb	r2, [r3, #7]
	movs	r3, #1
	b	.L338
.L356:
	.loc 1 2506 23
	ldr	r3, [sp, #12]
	ldr	r2, [sp, #16]
	str	r2, [r3, #24]
.L343:
	.loc 1 2508 38
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #8]
	.loc 1 2508 45
	ubfx	r3, r3, #0, #9
	.loc 1 2508 14
	rsb	r3, r3, #512
	str	r3, [sp, #40]
	.loc 1 2509 12
	ldr	r2, [sp, #40]
	ldr	r3, [sp, #4]
	cmp	r2, r3
	bls	.L359
	.loc 1 2509 30 discriminator 1
	ldr	r3, [sp, #4]
	str	r3, [sp, #40]
.L359:
	.loc 1 2515 35
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #8]
	.loc 1 2515 42
	ubfx	r3, r3, #0, #9
	.loc 1 2515 24
	adds	r3, r3, #40
	ldr	r2, [sp, #12]
	add	r3, r3, r2
	.loc 1 2515 9
	ldr	r2, [sp, #40]
	mov	r1, r3
	ldr	r0, [sp, #32]
	bl	mem_cpy
.L355:
	.loc 1 2454 15
	ldr	r2, [sp, #32]
	ldr	r3, [sp, #40]
	add	r3, r3, r2
	str	r3, [sp, #32]
	.loc 1 2454 33
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #8]
	ldr	r3, [sp, #40]
	add	r2, r2, r3
	ldr	r3, [sp, #12]
	str	r2, [r3, #8]
	.loc 1 2454 46
	ldr	r3, [sp]
	ldr	r2, [r3]
	ldr	r3, [sp, #40]
	add	r2, r2, r3
	ldr	r3, [sp]
	str	r2, [r3]
	.loc 1 2454 59
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #40]
	subs	r3, r2, r3
	str	r3, [sp, #4]
.L342:
	.loc 1 2453 5
	ldr	r3, [sp, #4]
	cmp	r3, #0
	bne	.L360
	.loc 1 2519 5
	movs	r3, #0
.L338:
	.loc 1 2520 1
	mov	r0, r3
	add	sp, sp, #52
.LCFI85:
	@ sp needed
	ldr	pc, [sp], #4
.LFE31:
	.size	f_read, .-f_read
	.section	.text.f_write,"ax",%progbits
	.align	1
	.global	f_write
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	f_write, %function
f_write:
.LFB32:
	.loc 1 2533 1
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI86:
	sub	sp, sp, #44
.LCFI87:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	.loc 1 2537 17
	ldr	r3, [sp, #8]
	str	r3, [sp, #24]
	.loc 1 2540 9
	ldr	r3, [sp]
	movs	r2, #0
	str	r2, [r3]
	.loc 1 2542 11
	ldr	r0, [sp, #12]
	bl	validate
	mov	r3, r0
	strb	r3, [sp, #23]
	.loc 1 2543 8
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L362
	.loc 1 2543 23 discriminator 1
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	b	.L363
.L362:
	.loc 1 2544 11
	ldr	r3, [sp, #12]
	ldrb	r3, [r3, #7]	@ zero_extendqisi2
	.loc 1 2544 8
	cmp	r3, #0
	beq	.L364
	.loc 1 2545 9
	ldr	r3, [sp, #12]
	ldrb	r3, [r3, #7]	@ zero_extendqisi2
	b	.L363
.L364:
	.loc 1 2546 13
	ldr	r3, [sp, #12]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	.loc 1 2546 20
	and	r3, r3, #2
	.loc 1 2546 8
	cmp	r3, #0
	bne	.L365
	.loc 1 2547 9
	movs	r3, #7
	b	.L363
.L365:
	.loc 1 2548 11
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #8]
	.loc 1 2548 18
	ldr	r3, [sp, #4]
	add	r2, r2, r3
	.loc 1 2548 28
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #8]
	.loc 1 2548 8
	cmp	r2, r3
	bcs	.L367
	.loc 1 2548 40 discriminator 1
	movs	r3, #0
	str	r3, [sp, #4]
	.loc 1 2550 5 discriminator 1
	b	.L367
.L387:
	.loc 1 2552 16
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #8]
	.loc 1 2552 23
	ubfx	r3, r3, #0, #9
	.loc 1 2552 12
	cmp	r3, #0
	bne	.L368
	.loc 1 2553 30
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #8]
	.loc 1 2553 37
	lsrs	r3, r3, #9
	.loc 1 2553 21
	uxtb	r2, r3
	.loc 1 2553 55
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	.loc 1 2553 59
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	.loc 1 2553 67
	subs	r3, r3, #1
	uxtb	r3, r3
	.loc 1 2553 19
	ands	r3, r3, r2
	strb	r3, [sp, #22]
	.loc 1 2554 16
	ldrb	r3, [sp, #22]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L369
	.loc 1 2555 23
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #8]
	.loc 1 2555 20
	cmp	r3, #0
	bne	.L370
	.loc 1 2556 26
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #16]
	str	r3, [sp, #36]
	.loc 1 2557 24
	ldr	r3, [sp, #36]
	cmp	r3, #0
	bne	.L371
	.loc 1 2558 32
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	movs	r1, #0
	mov	r0, r3
	bl	create_chain
	str	r0, [sp, #36]
	b	.L371
.L370:
	.loc 1 2561 27
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #36]
	.loc 1 2561 24
	cmp	r3, #0
	beq	.L372
	.loc 1 2562 32
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #8]
	mov	r1, r3
	ldr	r0, [sp, #12]
	bl	clmt_clust
	str	r0, [sp, #36]
	b	.L371
.L372:
	.loc 1 2565 32
	ldr	r3, [sp, #12]
	ldr	r2, [r3]
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #20]
	mov	r1, r3
	mov	r0, r2
	bl	create_chain
	str	r0, [sp, #36]
.L371:
	.loc 1 2567 20
	ldr	r3, [sp, #36]
	cmp	r3, #0
	beq	.L389
	.loc 1 2568 20
	ldr	r3, [sp, #36]
	cmp	r3, #1
	bne	.L375
	.loc 1 2568 32 discriminator 1
	ldr	r3, [sp, #12]
	movs	r2, #2
	strb	r2, [r3, #7]
	movs	r3, #2
	b	.L363
.L375:
	.loc 1 2569 20
	ldr	r3, [sp, #36]
	cmp	r3, #-1
	bne	.L376
	.loc 1 2569 41 discriminator 1
	ldr	r3, [sp, #12]
	movs	r2, #1
	strb	r2, [r3, #7]
	movs	r3, #1
	b	.L363
.L376:
	.loc 1 2570 27
	ldr	r3, [sp, #12]
	ldr	r2, [sp, #36]
	str	r2, [r3, #20]
	.loc 1 2571 23
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #16]
	.loc 1 2571 20
	cmp	r3, #0
	bne	.L369
	.loc 1 2571 49 discriminator 1
	ldr	r3, [sp, #12]
	ldr	r2, [sp, #36]
	str	r2, [r3, #16]
.L369:
	.loc 1 2577 19
	ldr	r3, [sp, #12]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	.loc 1 2577 26
	and	r3, r3, #64
	.loc 1 2577 16
	cmp	r3, #0
	beq	.L377
	.loc 1 2578 34
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	.loc 1 2578 21
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	.loc 1 2578 47
	ldr	r3, [sp, #12]
	add	r1, r3, #40
	.loc 1 2578 56
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #24]
	.loc 1 2578 21
	movs	r3, #1
	bl	disk_write
	mov	r3, r0
	.loc 1 2578 20
	cmp	r3, #0
	beq	.L378
	.loc 1 2579 21
	ldr	r3, [sp, #12]
	movs	r2, #1
	strb	r2, [r3, #7]
	movs	r3, #1
	b	.L363
.L378:
	.loc 1 2580 26
	ldr	r3, [sp, #12]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	bic	r3, r3, #64
	uxtb	r2, r3
	ldr	r3, [sp, #12]
	strb	r2, [r3, #6]
.L377:
	.loc 1 2583 20
	ldr	r3, [sp, #12]
	ldr	r2, [r3]
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #20]
	mov	r1, r3
	mov	r0, r2
	bl	clust2sect
	str	r0, [sp, #16]
	.loc 1 2584 16
	ldr	r3, [sp, #16]
	cmp	r3, #0
	bne	.L379
	.loc 1 2584 24 discriminator 1
	ldr	r3, [sp, #12]
	movs	r2, #2
	strb	r2, [r3, #7]
	movs	r3, #2
	b	.L363
.L379:
	.loc 1 2585 18
	ldrb	r3, [sp, #22]	@ zero_extendqisi2
	ldr	r2, [sp, #16]
	add	r3, r3, r2
	str	r3, [sp, #16]
	.loc 1 2586 16
	ldr	r3, [sp, #4]
	lsrs	r3, r3, #9
	str	r3, [sp, #28]
	.loc 1 2587 16
	ldr	r3, [sp, #28]
	cmp	r3, #0
	beq	.L380
	.loc 1 2588 27
	ldrb	r2, [sp, #22]	@ zero_extendqisi2
	ldr	r3, [sp, #28]
	add	r3, r3, r2
	.loc 1 2588 36
	ldr	r2, [sp, #12]
	ldr	r2, [r2]
	.loc 1 2588 40
	ldrb	r2, [r2, #2]	@ zero_extendqisi2
	.loc 1 2588 20
	cmp	r3, r2
	bls	.L381
	.loc 1 2589 28
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	.loc 1 2589 32
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	mov	r2, r3
	.loc 1 2589 40
	ldrb	r3, [sp, #22]	@ zero_extendqisi2
	subs	r3, r2, r3
	.loc 1 2589 24
	str	r3, [sp, #28]
.L381:
	.loc 1 2590 34
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	.loc 1 2590 21
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	ldr	r3, [sp, #28]
	uxtb	r3, r3
	ldr	r2, [sp, #16]
	ldr	r1, [sp, #24]
	bl	disk_write
	mov	r3, r0
	.loc 1 2590 20
	cmp	r3, #0
	beq	.L382
	.loc 1 2591 21
	ldr	r3, [sp, #12]
	movs	r2, #1
	strb	r2, [r3, #7]
	movs	r3, #1
	b	.L363
.L382:
	.loc 1 2599 23
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #24]
	.loc 1 2599 31
	ldr	r3, [sp, #16]
	subs	r3, r2, r3
	.loc 1 2599 20
	ldr	r2, [sp, #28]
	cmp	r2, r3
	bls	.L383
	.loc 1 2600 31
	ldr	r3, [sp, #12]
	add	r0, r3, #40
	.loc 1 2600 50
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #24]
	.loc 1 2600 58
	ldr	r3, [sp, #16]
	subs	r3, r2, r3
	.loc 1 2600 66
	lsls	r3, r3, #9
	.loc 1 2600 44
	ldr	r2, [sp, #24]
	add	r3, r3, r2
	.loc 1 2600 21
	mov	r2, #512
	mov	r1, r3
	bl	mem_cpy
	.loc 1 2601 30
	ldr	r3, [sp, #12]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	bic	r3, r3, #64
	uxtb	r2, r3
	ldr	r3, [sp, #12]
	strb	r2, [r3, #6]
.L383:
	.loc 1 2605 22
	ldr	r3, [sp, #28]
	lsls	r3, r3, #9
	str	r3, [sp, #32]
	.loc 1 2606 17
	b	.L384
.L380:
	.loc 1 2614 19
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #24]
	.loc 1 2614 16
	ldr	r2, [sp, #16]
	cmp	r2, r3
	beq	.L385
	.loc 1 2615 23
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #8]
	.loc 1 2615 34
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #12]
	.loc 1 2615 20
	cmp	r2, r3
	bcs	.L385
	.loc 1 2616 33 discriminator 1
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	.loc 1 2616 21 discriminator 1
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	.loc 1 2616 46 discriminator 1
	ldr	r3, [sp, #12]
	add	r1, r3, #40
	.loc 1 2616 21 discriminator 1
	movs	r3, #1
	ldr	r2, [sp, #16]
	bl	disk_read
	mov	r3, r0
	.loc 1 2615 42 discriminator 1
	cmp	r3, #0
	beq	.L385
	.loc 1 2617 25
	ldr	r3, [sp, #12]
	movs	r2, #1
	strb	r2, [r3, #7]
	movs	r3, #1
	b	.L363
.L385:
	.loc 1 2620 23
	ldr	r3, [sp, #12]
	ldr	r2, [sp, #16]
	str	r2, [r3, #24]
.L368:
	.loc 1 2622 38
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #8]
	.loc 1 2622 45
	ubfx	r3, r3, #0, #9
	.loc 1 2622 14
	rsb	r3, r3, #512
	str	r3, [sp, #32]
	.loc 1 2623 12
	ldr	r2, [sp, #32]
	ldr	r3, [sp, #4]
	cmp	r2, r3
	bls	.L386
	.loc 1 2623 30 discriminator 1
	ldr	r3, [sp, #4]
	str	r3, [sp, #32]
.L386:
	.loc 1 2630 28
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #8]
	.loc 1 2630 35
	ubfx	r3, r3, #0, #9
	.loc 1 2630 17
	adds	r3, r3, #40
	ldr	r2, [sp, #12]
	add	r3, r3, r2
	.loc 1 2630 9
	ldr	r2, [sp, #32]
	ldr	r1, [sp, #24]
	mov	r0, r3
	bl	mem_cpy
	.loc 1 2631 18
	ldr	r3, [sp, #12]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	orr	r3, r3, #64
	uxtb	r2, r3
	ldr	r3, [sp, #12]
	strb	r2, [r3, #6]
.L384:
	.loc 1 2551 15
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #32]
	add	r3, r3, r2
	str	r3, [sp, #24]
	.loc 1 2551 33
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #8]
	ldr	r3, [sp, #32]
	add	r2, r2, r3
	ldr	r3, [sp, #12]
	str	r2, [r3, #8]
	.loc 1 2551 46
	ldr	r3, [sp]
	ldr	r2, [r3]
	ldr	r3, [sp, #32]
	add	r2, r2, r3
	ldr	r3, [sp]
	str	r2, [r3]
	.loc 1 2551 59
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #32]
	subs	r3, r2, r3
	str	r3, [sp, #4]
.L367:
	.loc 1 2550 5
	ldr	r3, [sp, #4]
	cmp	r3, #0
	bne	.L387
	b	.L374
.L389:
	.loc 1 2567 17
	nop
.L374:
	.loc 1 2635 11
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #8]
	.loc 1 2635 22
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #12]
	.loc 1 2635 8
	cmp	r2, r3
	bls	.L388
	.loc 1 2635 45 discriminator 1
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #8]
	.loc 1 2635 41 discriminator 1
	ldr	r3, [sp, #12]
	str	r2, [r3, #12]
.L388:
	.loc 1 2636 14
	ldr	r3, [sp, #12]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	orr	r3, r3, #32
	uxtb	r2, r3
	ldr	r3, [sp, #12]
	strb	r2, [r3, #6]
	.loc 1 2638 5
	movs	r3, #0
.L363:
	.loc 1 2639 1
	mov	r0, r3
	add	sp, sp, #44
.LCFI88:
	@ sp needed
	ldr	pc, [sp], #4
.LFE32:
	.size	f_write, .-f_write
	.section	.text.f_sync,"ax",%progbits
	.align	1
	.global	f_sync
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	f_sync, %function
f_sync:
.LFB33:
	.loc 1 2648 1
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI89:
	sub	sp, sp, #28
.LCFI90:
	str	r0, [sp, #4]
	.loc 1 2653 11
	ldr	r0, [sp, #4]
	bl	validate
	mov	r3, r0
	strb	r3, [sp, #23]
	.loc 1 2654 8
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L391
	.loc 1 2655 15
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	.loc 1 2655 22
	and	r3, r3, #32
	.loc 1 2655 12
	cmp	r3, #0
	beq	.L391
	.loc 1 2657 19
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	.loc 1 2657 26
	and	r3, r3, #64
	.loc 1 2657 16
	cmp	r3, #0
	beq	.L392
	.loc 1 2658 34
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 2658 21
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	.loc 1 2658 47
	ldr	r3, [sp, #4]
	add	r1, r3, #40
	.loc 1 2658 56
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #24]
	.loc 1 2658 21
	movs	r3, #1
	bl	disk_write
	mov	r3, r0
	.loc 1 2658 20
	cmp	r3, #0
	beq	.L393
	.loc 1 2659 21
	movs	r3, #1
	b	.L394
.L393:
	.loc 1 2660 26
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	bic	r3, r3, #64
	uxtb	r2, r3
	ldr	r3, [sp, #4]
	strb	r2, [r3, #6]
.L392:
	.loc 1 2664 19
	ldr	r3, [sp, #4]
	ldr	r2, [r3]
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #28]
	mov	r1, r3
	mov	r0, r2
	bl	move_window
	mov	r3, r0
	strb	r3, [sp, #23]
	.loc 1 2665 16
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L391
	.loc 1 2666 21
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #32]
	str	r3, [sp, #16]
	.loc 1 2667 31
	ldr	r3, [sp, #16]
	adds	r3, r3, #11
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [sp, #16]
	adds	r3, r3, #11
	orr	r2, r2, #32
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 2668 17
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #12]
	ldr	r3, [sp, #16]
	adds	r3, r3, #28
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	uxth	r3, r3
	lsrs	r3, r3, #8
	uxth	r2, r3
	ldr	r3, [sp, #16]
	adds	r3, r3, #29
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	lsrs	r2, r3, #16
	ldr	r3, [sp, #16]
	adds	r3, r3, #30
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	lsrs	r2, r3, #24
	ldr	r3, [sp, #16]
	adds	r3, r3, #31
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 2669 17
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	mov	r1, r3
	ldr	r0, [sp, #16]
	bl	st_clust
	.loc 1 2670 22
	bl	get_fattime
	str	r0, [sp, #12]
	.loc 1 2671 17
	ldr	r3, [sp, #16]
	adds	r3, r3, #22
	ldr	r2, [sp, #12]
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #12]
	uxth	r3, r3
	lsrs	r3, r3, #8
	uxth	r2, r3
	ldr	r3, [sp, #16]
	adds	r3, r3, #23
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #12]
	lsrs	r2, r3, #16
	ldr	r3, [sp, #16]
	adds	r3, r3, #24
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #12]
	lsrs	r2, r3, #24
	ldr	r3, [sp, #16]
	adds	r3, r3, #25
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 2672 17
	ldr	r3, [sp, #16]
	adds	r3, r3, #18
	movs	r2, #0
	strb	r2, [r3]
	ldr	r3, [sp, #16]
	adds	r3, r3, #19
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 2673 26
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	bic	r3, r3, #32
	uxtb	r2, r3
	ldr	r3, [sp, #4]
	strb	r2, [r3, #6]
	.loc 1 2674 19
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 2674 31
	movs	r2, #1
	strb	r2, [r3, #4]
	.loc 1 2675 23
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	mov	r0, r3
	bl	sync_fs
	mov	r3, r0
	strb	r3, [sp, #23]
.L391:
	.loc 1 2680 5
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
.L394:
	.loc 1 2681 1
	mov	r0, r3
	add	sp, sp, #28
.LCFI91:
	@ sp needed
	ldr	pc, [sp], #4
.LFE33:
	.size	f_sync, .-f_sync
	.section	.text.f_close,"ax",%progbits
	.align	1
	.global	f_close
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	f_close, %function
f_close:
.LFB34:
	.loc 1 2692 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI92:
	sub	sp, sp, #20
.LCFI93:
	str	r0, [sp, #4]
	.loc 1 2696 11
	ldr	r0, [sp, #4]
	bl	f_sync
	mov	r3, r0
	strb	r3, [sp, #15]
	.loc 1 2697 8
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L396
	.loc 1 2700 15
	ldr	r0, [sp, #4]
	bl	validate
	mov	r3, r0
	strb	r3, [sp, #15]
	.loc 1 2701 12
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L396
	.loc 1 2709 24
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3]
.L396:
	.loc 1 2715 12
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	.loc 1 2716 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI94:
	@ sp needed
	ldr	pc, [sp], #4
.LFE34:
	.size	f_close, .-f_close
	.section	.text.f_chdrive,"ax",%progbits
	.align	1
	.global	f_chdrive
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	f_chdrive, %function
f_chdrive:
.LFB35:
	.loc 1 2727 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI95:
	sub	sp, sp, #20
.LCFI96:
	str	r0, [sp, #4]
	.loc 1 2730 11
	add	r3, sp, #4
	mov	r0, r3
	bl	get_ldnumber
	str	r0, [sp, #12]
	.loc 1 2731 8
	ldr	r3, [sp, #12]
	cmp	r3, #0
	bge	.L399
	.loc 1 2731 25 discriminator 1
	movs	r3, #11
	b	.L400
.L399:
	.loc 1 2733 15
	ldr	r3, [sp, #12]
	uxtb	r2, r3
	.loc 1 2733 13
	ldr	r3, .L401
	strb	r2, [r3]
	.loc 1 2735 12
	movs	r3, #0
.L400:
	.loc 1 2736 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI97:
	@ sp needed
	ldr	pc, [sp], #4
.L402:
	.align	2
.L401:
	.word	CurrVol
.LFE35:
	.size	f_chdrive, .-f_chdrive
	.section	.text.f_chdir,"ax",%progbits
	.align	1
	.global	f_chdir
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	f_chdir, %function
f_chdir:
.LFB36:
	.loc 1 2742 1
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
.LCFI98:
	sub	sp, sp, #56
.LCFI99:
	str	r0, [sp, #4]
	.loc 1 2748 11
	add	r1, sp, #4
	add	r3, sp, #24
	movs	r2, #0
	mov	r0, r3
	bl	find_volume
	mov	r3, r0
	strb	r3, [sp, #55]
	.loc 1 2749 8
	ldrb	r3, [sp, #55]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L404
	.loc 1 2750 9
	add	r3, sp, #12
	str	r3, [sp, #48]
	.loc 1 2751 15
	ldr	r2, [sp, #4]
	add	r3, sp, #24
	mov	r1, r2
	mov	r0, r3
	bl	follow_path
	mov	r3, r0
	strb	r3, [sp, #55]
	.loc 1 2753 12
	ldrb	r3, [sp, #55]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L405
	.loc 1 2754 20
	ldr	r3, [sp, #44]
	.loc 1 2754 16
	cmp	r3, #0
	bne	.L406
	.loc 1 2755 19
	ldr	r3, [sp, #24]
	.loc 1 2755 33
	ldr	r2, [sp, #32]
	.loc 1 2755 29
	str	r2, [r3, #20]
	b	.L405
.L406:
	.loc 1 2757 23
	ldr	r3, [sp, #44]
	.loc 1 2757 27
	adds	r3, r3, #11
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 2757 38
	and	r3, r3, #16
	.loc 1 2757 20
	cmp	r3, #0
	beq	.L407
	.loc 1 2758 35
	ldr	r3, [sp, #24]
	.loc 1 2758 53
	ldr	r2, [sp, #44]
	.loc 1 2758 23
	ldr	r4, [sp, #24]
	.loc 1 2758 35
	mov	r1, r2
	mov	r0, r3
	bl	ld_clust
	mov	r3, r0
	.loc 1 2758 33
	str	r3, [r4, #20]
	b	.L405
.L407:
	.loc 1 2760 25
	movs	r3, #5
	strb	r3, [sp, #55]
.L405:
	.loc 1 2763 12
	ldrb	r3, [sp, #55]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L404
	.loc 1 2763 36 discriminator 1
	movs	r3, #5
	strb	r3, [sp, #55]
.L404:
	.loc 1 2766 5
	ldrb	r3, [sp, #55]	@ zero_extendqisi2
	.loc 1 2767 1
	mov	r0, r3
	add	sp, sp, #56
.LCFI100:
	@ sp needed
	pop	{r4, pc}
.LFE36:
	.size	f_chdir, .-f_chdir
	.section	.text.f_getcwd,"ax",%progbits
	.align	1
	.global	f_getcwd
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	f_getcwd, %function
f_getcwd:
.LFB37:
	.loc 1 2774 1
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI101:
	sub	sp, sp, #100
.LCFI102:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 2783 5
	ldr	r3, [sp, #4]
	.loc 1 2783 11
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 2785 11
	add	r1, sp, #4
	add	r3, sp, #48
	movs	r2, #0
	mov	r0, r3
	bl	find_volume
	mov	r3, r0
	strb	r3, [sp, #95]
	.loc 1 2786 8
	ldrb	r3, [sp, #95]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L410
	.loc 1 2787 9
	add	r3, sp, #12
	str	r3, [sp, #72]
	.loc 1 2788 11
	ldr	r3, [sp]
	str	r3, [sp, #88]
	.loc 1 2789 23
	ldr	r3, [sp, #48]
	.loc 1 2789 26
	ldr	r3, [r3, #20]
	.loc 1 2789 19
	str	r3, [sp, #56]
	.loc 1 2790 15
	b	.L411
.L426:
	.loc 1 2791 19
	add	r3, sp, #48
	movs	r1, #1
	mov	r0, r3
	bl	dir_sdi
	mov	r3, r0
	strb	r3, [sp, #95]
	.loc 1 2792 16
	ldrb	r3, [sp, #95]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L430
	.loc 1 2793 19
	add	r3, sp, #48
	movs	r1, #0
	mov	r0, r3
	bl	dir_read
	mov	r3, r0
	strb	r3, [sp, #95]
	.loc 1 2794 16
	ldrb	r3, [sp, #95]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L431
	.loc 1 2795 25
	ldr	r3, [sp, #48]
	.loc 1 2795 43
	ldr	r2, [sp, #68]
	.loc 1 2795 25
	mov	r1, r2
	mov	r0, r3
	bl	ld_clust
	mov	r3, r0
	.loc 1 2795 23
	str	r3, [sp, #56]
	.loc 1 2796 19
	add	r3, sp, #48
	movs	r1, #0
	mov	r0, r3
	bl	dir_sdi
	mov	r3, r0
	strb	r3, [sp, #95]
	.loc 1 2797 16
	ldrb	r3, [sp, #95]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L432
.L415:
	.loc 1 2799 23
	add	r3, sp, #48
	movs	r1, #0
	mov	r0, r3
	bl	dir_read
	mov	r3, r0
	strb	r3, [sp, #95]
	.loc 1 2800 20
	ldrb	r3, [sp, #95]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L433
	.loc 1 2801 28
	ldr	r3, [sp, #48]
	.loc 1 2801 46
	ldr	r2, [sp, #68]
	.loc 1 2801 28
	mov	r1, r2
	mov	r0, r3
	bl	ld_clust
	mov	r2, r0
	.loc 1 2801 20
	ldr	r3, [sp, #76]
	cmp	r3, r2
	beq	.L434
	.loc 1 2802 23
	add	r3, sp, #48
	movs	r1, #0
	mov	r0, r3
	bl	dir_next
	mov	r3, r0
	strb	r3, [sp, #95]
	.loc 1 2803 13
	ldrb	r3, [sp, #95]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L415
	b	.L417
.L433:
	.loc 1 2800 17
	nop
	b	.L417
.L434:
	.loc 1 2801 17
	nop
.L417:
	.loc 1 2804 16
	ldrb	r3, [sp, #95]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L419
	.loc 1 2804 40 discriminator 1
	movs	r3, #2
	strb	r3, [sp, #95]
.L419:
	.loc 1 2805 16
	ldrb	r3, [sp, #95]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L435
	.loc 1 2810 13
	add	r2, sp, #24
	add	r3, sp, #48
	mov	r1, r2
	mov	r0, r3
	bl	get_fileinfo
	.loc 1 2811 16
	add	r3, sp, #24
	adds	r3, r3, #9
	str	r3, [sp, #80]
	.loc 1 2815 20
	movs	r3, #0
	str	r3, [sp, #84]
	.loc 1 2815 13
	b	.L421
.L422:
	.loc 1 2815 33 discriminator 3
	ldr	r3, [sp, #84]
	adds	r3, r3, #1
	str	r3, [sp, #84]
.L421:
	.loc 1 2815 27 discriminator 1
	ldr	r2, [sp, #80]
	ldr	r3, [sp, #84]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 2815 13 discriminator 1
	cmp	r3, #0
	bne	.L422
	.loc 1 2816 23
	ldr	r3, [sp, #84]
	adds	r3, r3, #3
	.loc 1 2816 16
	ldr	r2, [sp, #88]
	cmp	r2, r3
	bcs	.L424
	.loc 1 2817 21
	movs	r3, #17
	strb	r3, [sp, #95]
	.loc 1 2817 17
	b	.L413
.L425:
	.loc 1 2819 33 discriminator 2
	ldr	r3, [sp, #84]
	subs	r3, r3, #1
	str	r3, [sp, #84]
	.loc 1 2819 37 discriminator 2
	ldr	r2, [sp, #80]
	ldr	r3, [sp, #84]
	add	r2, r2, r3
	.loc 1 2819 27 discriminator 2
	ldr	r1, [sp, #4]
	.loc 1 2819 33 discriminator 2
	ldr	r3, [sp, #88]
	subs	r3, r3, #1
	str	r3, [sp, #88]
	.loc 1 2819 27 discriminator 2
	ldr	r3, [sp, #88]
	add	r3, r3, r1
	.loc 1 2819 37 discriminator 2
	ldrb	r2, [r2]	@ zero_extendqisi2
	.loc 1 2819 33 discriminator 2
	strb	r2, [r3]
.L424:
	.loc 1 2819 19 discriminator 1
	ldr	r3, [sp, #84]
	cmp	r3, #0
	bne	.L425
	.loc 1 2820 17
	ldr	r2, [sp, #4]
	.loc 1 2820 23
	ldr	r3, [sp, #88]
	subs	r3, r3, #1
	str	r3, [sp, #88]
	.loc 1 2820 17
	ldr	r3, [sp, #88]
	add	r3, r3, r2
	.loc 1 2820 23
	movs	r2, #47
	strb	r2, [r3]
.L411:
	.loc 1 2790 21
	ldr	r3, [sp, #56]
	str	r3, [sp, #76]
	.loc 1 2790 15
	ldr	r3, [sp, #76]
	cmp	r3, #0
	bne	.L426
	b	.L413
.L430:
	.loc 1 2792 13
	nop
	b	.L413
.L431:
	.loc 1 2794 13
	nop
	b	.L413
.L432:
	.loc 1 2797 13
	nop
	b	.L413
.L435:
	.loc 1 2805 13
	nop
.L413:
	.loc 1 2822 12
	ldr	r3, [sp, #4]
	str	r3, [sp, #80]
	.loc 1 2823 12
	ldrb	r3, [sp, #95]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L427
	.loc 1 2825 25
	ldr	r3, .L436
	ldrb	r2, [r3]	@ zero_extendqisi2
	.loc 1 2825 16
	ldr	r3, [sp, #80]
	adds	r1, r3, #1
	str	r1, [sp, #80]
	.loc 1 2825 25
	adds	r2, r2, #48
	uxtb	r2, r2
	.loc 1 2825 19
	strb	r2, [r3]
	.loc 1 2826 16
	ldr	r3, [sp, #80]
	adds	r2, r3, #1
	str	r2, [sp, #80]
	.loc 1 2826 19
	movs	r2, #58
	strb	r2, [r3]
	.loc 1 2828 16
	ldr	r2, [sp, #88]
	ldr	r3, [sp]
	cmp	r2, r3
	bne	.L428
	.loc 1 2829 20
	ldr	r3, [sp, #80]
	adds	r2, r3, #1
	str	r2, [sp, #80]
	.loc 1 2829 23
	movs	r2, #47
	strb	r2, [r3]
	b	.L427
.L428:
	.loc 1 2832 33 discriminator 1
	ldr	r2, [sp, #4]
	.loc 1 2832 35 discriminator 1
	ldr	r3, [sp, #88]
	adds	r1, r3, #1
	str	r1, [sp, #88]
	.loc 1 2832 33 discriminator 1
	add	r2, r2, r3
	.loc 1 2832 24 discriminator 1
	ldr	r3, [sp, #80]
	adds	r1, r3, #1
	str	r1, [sp, #80]
	.loc 1 2832 33 discriminator 1
	ldrb	r2, [r2]	@ zero_extendqisi2
	.loc 1 2832 27 discriminator 1
	strb	r2, [r3]
	.loc 1 2833 17 discriminator 1
	ldr	r2, [sp, #88]
	ldr	r3, [sp]
	cmp	r2, r3
	bcc	.L428
.L427:
	.loc 1 2836 13
	ldr	r3, [sp, #80]
	movs	r2, #0
	strb	r2, [r3]
.L410:
	.loc 1 2840 5
	ldrb	r3, [sp, #95]	@ zero_extendqisi2
	.loc 1 2841 1
	mov	r0, r3
	add	sp, sp, #100
.LCFI103:
	@ sp needed
	ldr	pc, [sp], #4
.L437:
	.align	2
.L436:
	.word	CurrVol
.LFE37:
	.size	f_getcwd, .-f_getcwd
	.section	.text.f_lseek,"ax",%progbits
	.align	1
	.global	f_lseek
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	f_lseek, %function
f_lseek:
.LFB38:
	.loc 1 2854 1
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI104:
	sub	sp, sp, #68
.LCFI105:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 2861 11
	ldr	r0, [sp, #4]
	bl	validate
	mov	r3, r0
	strb	r3, [sp, #63]
	.loc 1 2862 8
	ldrb	r3, [sp, #63]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L439
	.loc 1 2862 23 discriminator 1
	ldrb	r3, [sp, #63]	@ zero_extendqisi2
	b	.L440
.L439:
	.loc 1 2863 11
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #7]	@ zero_extendqisi2
	.loc 1 2863 8
	cmp	r3, #0
	beq	.L441
	.loc 1 2864 9
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #7]	@ zero_extendqisi2
	b	.L440
.L441:
	.loc 1 2867 11
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #36]
	.loc 1 2867 8
	cmp	r3, #0
	beq	.L442
	.loc 1 2868 12
	ldr	r3, [sp]
	cmp	r3, #-1
	bne	.L443
	.loc 1 2869 17
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #36]
	str	r3, [sp, #36]
	.loc 1 2870 24
	ldr	r3, [sp, #36]
	adds	r2, r3, #4
	str	r2, [sp, #36]
	.loc 1 2870 18
	ldr	r3, [r3]
	str	r3, [sp, #20]
	.loc 1 2870 33
	movs	r3, #2
	str	r3, [sp, #40]
	.loc 1 2871 16
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	str	r3, [sp, #48]
	.loc 1 2872 16
	ldr	r3, [sp, #48]
	cmp	r3, #0
	beq	.L444
.L449:
	.loc 1 2875 25
	ldr	r3, [sp, #48]
	str	r3, [sp, #16]
	.loc 1 2875 35
	movs	r3, #0
	str	r3, [sp, #44]
	.loc 1 2875 45
	ldr	r3, [sp, #40]
	adds	r3, r3, #2
	str	r3, [sp, #40]
.L447:
	.loc 1 2877 29
	ldr	r3, [sp, #48]
	str	r3, [sp, #12]
	.loc 1 2877 38
	ldr	r3, [sp, #44]
	adds	r3, r3, #1
	str	r3, [sp, #44]
	.loc 1 2878 30
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	ldr	r1, [sp, #48]
	mov	r0, r3
	bl	get_fat
	str	r0, [sp, #48]
	.loc 1 2879 28
	ldr	r3, [sp, #48]
	cmp	r3, #1
	bhi	.L445
	.loc 1 2879 38 discriminator 1
	ldr	r3, [sp, #4]
	movs	r2, #2
	strb	r2, [r3, #7]
	movs	r3, #2
	b	.L440
.L445:
	.loc 1 2880 28
	ldr	r3, [sp, #48]
	cmp	r3, #-1
	bne	.L446
	.loc 1 2880 47 discriminator 1
	ldr	r3, [sp, #4]
	movs	r2, #1
	strb	r2, [r3, #7]
	movs	r3, #1
	b	.L440
.L446:
	.loc 1 2881 40
	ldr	r3, [sp, #12]
	adds	r3, r3, #1
	.loc 1 2881 21
	ldr	r2, [sp, #48]
	cmp	r2, r3
	beq	.L447
	.loc 1 2882 24
	ldr	r2, [sp, #40]
	ldr	r3, [sp, #20]
	cmp	r2, r3
	bhi	.L448
	.loc 1 2883 29
	ldr	r3, [sp, #36]
	adds	r2, r3, #4
	str	r2, [sp, #36]
	.loc 1 2883 32
	ldr	r2, [sp, #44]
	str	r2, [r3]
	.loc 1 2883 43
	ldr	r3, [sp, #36]
	adds	r2, r3, #4
	str	r2, [sp, #36]
	.loc 1 2883 46
	ldr	r2, [sp, #16]
	str	r2, [r3]
.L448:
	.loc 1 2885 33
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 2885 37
	ldr	r3, [r3, #24]
	.loc 1 2885 17
	ldr	r2, [sp, #48]
	cmp	r2, r3
	bcc	.L449
.L444:
	.loc 1 2887 16
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #36]
	.loc 1 2887 24
	ldr	r2, [sp, #40]
	str	r2, [r3]
	.loc 1 2888 16
	ldr	r2, [sp, #40]
	ldr	r3, [sp, #20]
	cmp	r2, r3
	bhi	.L450
	.loc 1 2889 22
	ldr	r3, [sp, #36]
	movs	r2, #0
	str	r2, [r3]
	b	.L451
.L450:
	.loc 1 2891 21
	movs	r3, #17
	strb	r3, [sp, #63]
	b	.L451
.L443:
	.loc 1 2894 25
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	.loc 1 2894 16
	ldr	r2, [sp]
	cmp	r2, r3
	bls	.L452
	.loc 1 2895 21
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	str	r3, [sp]
.L452:
	.loc 1 2896 22
	ldr	r3, [sp, #4]
	ldr	r2, [sp]
	str	r2, [r3, #8]
	.loc 1 2897 16
	ldr	r3, [sp]
	cmp	r3, #0
	beq	.L451
	.loc 1 2898 29
	ldr	r3, [sp]
	subs	r3, r3, #1
	mov	r1, r3
	ldr	r0, [sp, #4]
	bl	clmt_clust
	mov	r2, r0
	.loc 1 2898 27
	ldr	r3, [sp, #4]
	str	r2, [r3, #20]
	.loc 1 2899 23
	ldr	r3, [sp, #4]
	ldr	r2, [r3]
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #20]
	mov	r1, r3
	mov	r0, r2
	bl	clust2sect
	str	r0, [sp, #24]
	.loc 1 2900 20
	ldr	r3, [sp, #24]
	cmp	r3, #0
	bne	.L453
	.loc 1 2900 27 discriminator 1
	ldr	r3, [sp, #4]
	movs	r2, #2
	strb	r2, [r3, #7]
	movs	r3, #2
	b	.L440
.L453:
	.loc 1 2901 29
	ldr	r3, [sp]
	subs	r3, r3, #1
	.loc 1 2901 34
	lsrs	r3, r3, #9
	.loc 1 2901 52
	ldr	r2, [sp, #4]
	ldr	r2, [r2]
	.loc 1 2901 56
	ldrb	r2, [r2, #2]	@ zero_extendqisi2
	.loc 1 2901 64
	subs	r2, r2, #1
	.loc 1 2901 47
	ands	r3, r3, r2
	.loc 1 2901 21
	ldr	r2, [sp, #24]
	add	r3, r3, r2
	str	r3, [sp, #24]
	.loc 1 2902 23
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #8]
	.loc 1 2902 30
	ubfx	r3, r3, #0, #9
	.loc 1 2902 20
	cmp	r3, #0
	beq	.L451
	.loc 1 2902 55 discriminator 1
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #24]
	.loc 1 2902 43 discriminator 1
	ldr	r2, [sp, #24]
	cmp	r2, r3
	beq	.L451
	.loc 1 2905 27
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	.loc 1 2905 34
	and	r3, r3, #64
	.loc 1 2905 24
	cmp	r3, #0
	beq	.L454
	.loc 1 2906 42
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 2906 29
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	.loc 1 2906 55
	ldr	r3, [sp, #4]
	add	r1, r3, #40
	.loc 1 2906 64
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #24]
	.loc 1 2906 29
	movs	r3, #1
	bl	disk_write
	mov	r3, r0
	.loc 1 2906 28
	cmp	r3, #0
	beq	.L455
	.loc 1 2907 29
	ldr	r3, [sp, #4]
	movs	r2, #1
	strb	r2, [r3, #7]
	movs	r3, #1
	b	.L440
.L455:
	.loc 1 2908 34
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	bic	r3, r3, #64
	uxtb	r2, r3
	ldr	r3, [sp, #4]
	strb	r2, [r3, #6]
.L454:
	.loc 1 2911 37
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 2911 25
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	.loc 1 2911 50
	ldr	r3, [sp, #4]
	add	r1, r3, #40
	.loc 1 2911 25
	movs	r3, #1
	ldr	r2, [sp, #24]
	bl	disk_read
	mov	r3, r0
	.loc 1 2911 24
	cmp	r3, #0
	beq	.L456
	.loc 1 2912 25
	ldr	r3, [sp, #4]
	movs	r2, #1
	strb	r2, [r3, #7]
	movs	r3, #1
	b	.L440
.L456:
	.loc 1 2914 31
	ldr	r3, [sp, #4]
	ldr	r2, [sp, #24]
	str	r2, [r3, #24]
	b	.L451
.L442:
	.loc 1 2923 21
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	.loc 1 2923 12
	ldr	r2, [sp]
	cmp	r2, r3
	bls	.L457
	.loc 1 2925 21
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	.loc 1 2925 28
	and	r3, r3, #2
	.loc 1 2925 14
	cmp	r3, #0
	bne	.L457
	.loc 1 2927 19
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	str	r3, [sp]
.L457:
	.loc 1 2929 15
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #8]
	str	r3, [sp, #32]
	.loc 1 2930 26
	movs	r3, #0
	str	r3, [sp, #52]
	.loc 1 2930 18
	ldr	r3, [sp, #4]
	ldr	r2, [sp, #52]
	str	r2, [r3, #8]
	.loc 1 2931 12
	ldr	r3, [sp]
	cmp	r3, #0
	beq	.L458
	.loc 1 2932 28
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 2932 32
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	.loc 1 2932 17
	lsls	r3, r3, #9
	str	r3, [sp, #28]
	.loc 1 2933 16
	ldr	r3, [sp, #32]
	cmp	r3, #0
	beq	.L459
	.loc 1 2934 22 discriminator 1
	ldr	r3, [sp]
	subs	r2, r3, #1
	.loc 1 2934 27 discriminator 1
	ldr	r3, [sp, #28]
	udiv	r2, r2, r3
	.loc 1 2934 43 discriminator 1
	ldr	r3, [sp, #32]
	subs	r1, r3, #1
	.loc 1 2934 48 discriminator 1
	ldr	r3, [sp, #28]
	udiv	r3, r1, r3
	.loc 1 2933 27 discriminator 1
	cmp	r2, r3
	bcc	.L459
	.loc 1 2935 35
	ldr	r3, [sp, #32]
	subs	r2, r3, #1
	.loc 1 2935 42
	ldr	r3, [sp, #28]
	rsbs	r3, r3, #0
	.loc 1 2935 40
	ands	r2, r2, r3
	.loc 1 2935 26
	ldr	r3, [sp, #4]
	str	r2, [r3, #8]
	.loc 1 2936 26
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #8]
	.loc 1 2936 21
	ldr	r2, [sp]
	subs	r3, r2, r3
	str	r3, [sp]
	.loc 1 2937 22
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #20]
	str	r3, [sp, #56]
	b	.L460
.L459:
	.loc 1 2939 22
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	str	r3, [sp, #56]
	.loc 1 2941 20
	ldr	r3, [sp, #56]
	cmp	r3, #0
	bne	.L461
	.loc 1 2942 28
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	movs	r1, #0
	mov	r0, r3
	bl	create_chain
	str	r0, [sp, #56]
	.loc 1 2943 24
	ldr	r3, [sp, #56]
	cmp	r3, #1
	bne	.L462
	.loc 1 2943 36 discriminator 1
	ldr	r3, [sp, #4]
	movs	r2, #2
	strb	r2, [r3, #7]
	movs	r3, #2
	b	.L440
.L462:
	.loc 1 2944 24
	ldr	r3, [sp, #56]
	cmp	r3, #-1
	bne	.L463
	.loc 1 2944 45 discriminator 1
	ldr	r3, [sp, #4]
	movs	r2, #1
	strb	r2, [r3, #7]
	movs	r3, #1
	b	.L440
.L463:
	.loc 1 2945 32
	ldr	r3, [sp, #4]
	ldr	r2, [sp, #56]
	str	r2, [r3, #16]
.L461:
	.loc 1 2948 27
	ldr	r3, [sp, #4]
	ldr	r2, [sp, #56]
	str	r2, [r3, #20]
.L460:
	.loc 1 2950 16
	ldr	r3, [sp, #56]
	cmp	r3, #0
	beq	.L458
	.loc 1 2951 23
	b	.L464
.L471:
	.loc 1 2953 27
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	.loc 1 2953 34
	and	r3, r3, #2
	.loc 1 2953 24
	cmp	r3, #0
	beq	.L465
	.loc 1 2954 32
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	ldr	r1, [sp, #56]
	mov	r0, r3
	bl	create_chain
	str	r0, [sp, #56]
	.loc 1 2955 28
	ldr	r3, [sp, #56]
	cmp	r3, #0
	bne	.L466
	.loc 1 2956 33
	ldr	r3, [sp, #28]
	str	r3, [sp]
	.loc 1 2956 29
	b	.L467
.L465:
	.loc 1 2960 32
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	ldr	r1, [sp, #56]
	mov	r0, r3
	bl	get_fat
	str	r0, [sp, #56]
.L466:
	.loc 1 2961 24
	ldr	r3, [sp, #56]
	cmp	r3, #-1
	bne	.L468
	.loc 1 2961 45 discriminator 1
	ldr	r3, [sp, #4]
	movs	r2, #1
	strb	r2, [r3, #7]
	movs	r3, #1
	b	.L440
.L468:
	.loc 1 2962 24
	ldr	r3, [sp, #56]
	cmp	r3, #1
	bls	.L469
	.loc 1 2962 48 discriminator 2
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 2962 52 discriminator 2
	ldr	r3, [r3, #24]
	.loc 1 2962 35 discriminator 2
	ldr	r2, [sp, #56]
	cmp	r2, r3
	bcc	.L470
.L469:
	.loc 1 2962 64 discriminator 3
	ldr	r3, [sp, #4]
	movs	r2, #2
	strb	r2, [r3, #7]
	movs	r3, #2
	b	.L440
.L470:
	.loc 1 2963 31
	ldr	r3, [sp, #4]
	ldr	r2, [sp, #56]
	str	r2, [r3, #20]
	.loc 1 2964 30
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #8]
	ldr	r3, [sp, #28]
	add	r2, r2, r3
	ldr	r3, [sp, #4]
	str	r2, [r3, #8]
	.loc 1 2965 25
	ldr	r2, [sp]
	ldr	r3, [sp, #28]
	subs	r3, r2, r3
	str	r3, [sp]
.L464:
	.loc 1 2951 23
	ldr	r2, [sp]
	ldr	r3, [sp, #28]
	cmp	r2, r3
	bhi	.L471
.L467:
	.loc 1 2967 26
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #8]
	ldr	r3, [sp]
	add	r2, r2, r3
	ldr	r3, [sp, #4]
	str	r2, [r3, #8]
	.loc 1 2968 25
	ldr	r3, [sp]
	ubfx	r3, r3, #0, #9
	.loc 1 2968 20
	cmp	r3, #0
	beq	.L458
	.loc 1 2969 29
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	ldr	r1, [sp, #56]
	mov	r0, r3
	bl	clust2sect
	str	r0, [sp, #52]
	.loc 1 2970 24
	ldr	r3, [sp, #52]
	cmp	r3, #0
	bne	.L472
	.loc 1 2970 33 discriminator 1
	ldr	r3, [sp, #4]
	movs	r2, #2
	strb	r2, [r3, #7]
	movs	r3, #2
	b	.L440
.L472:
	.loc 1 2971 34
	ldr	r3, [sp]
	lsrs	r3, r3, #9
	.loc 1 2971 27
	ldr	r2, [sp, #52]
	add	r3, r3, r2
	str	r3, [sp, #52]
.L458:
	.loc 1 2975 15
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #8]
	.loc 1 2975 22
	ubfx	r3, r3, #0, #9
	.loc 1 2975 12
	cmp	r3, #0
	beq	.L473
	.loc 1 2975 49 discriminator 1
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #24]
	.loc 1 2975 35 discriminator 1
	ldr	r2, [sp, #52]
	cmp	r2, r3
	beq	.L473
	.loc 1 2978 19
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	.loc 1 2978 26
	and	r3, r3, #64
	.loc 1 2978 16
	cmp	r3, #0
	beq	.L474
	.loc 1 2979 34
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 2979 21
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	.loc 1 2979 47
	ldr	r3, [sp, #4]
	add	r1, r3, #40
	.loc 1 2979 56
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #24]
	.loc 1 2979 21
	movs	r3, #1
	bl	disk_write
	mov	r3, r0
	.loc 1 2979 20
	cmp	r3, #0
	beq	.L475
	.loc 1 2980 21
	ldr	r3, [sp, #4]
	movs	r2, #1
	strb	r2, [r3, #7]
	movs	r3, #1
	b	.L440
.L475:
	.loc 1 2981 26
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	bic	r3, r3, #64
	uxtb	r2, r3
	ldr	r3, [sp, #4]
	strb	r2, [r3, #6]
.L474:
	.loc 1 2984 29
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 2984 17
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	.loc 1 2984 42
	ldr	r3, [sp, #4]
	add	r1, r3, #40
	.loc 1 2984 17
	movs	r3, #1
	ldr	r2, [sp, #52]
	bl	disk_read
	mov	r3, r0
	.loc 1 2984 16
	cmp	r3, #0
	beq	.L476
	.loc 1 2985 17
	ldr	r3, [sp, #4]
	movs	r2, #1
	strb	r2, [r3, #7]
	movs	r3, #1
	b	.L440
.L476:
	.loc 1 2987 23
	ldr	r3, [sp, #4]
	ldr	r2, [sp, #52]
	str	r2, [r3, #24]
.L473:
	.loc 1 2990 15
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #8]
	.loc 1 2990 26
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	.loc 1 2990 12
	cmp	r2, r3
	bls	.L451
	.loc 1 2991 27
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #8]
	.loc 1 2991 23
	ldr	r3, [sp, #4]
	str	r2, [r3, #12]
	.loc 1 2992 22
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	orr	r3, r3, #32
	uxtb	r2, r3
	ldr	r3, [sp, #4]
	strb	r2, [r3, #6]
.L451:
	.loc 1 2997 5
	ldrb	r3, [sp, #63]	@ zero_extendqisi2
.L440:
	.loc 1 2998 1
	mov	r0, r3
	add	sp, sp, #68
.LCFI106:
	@ sp needed
	ldr	pc, [sp], #4
.LFE38:
	.size	f_lseek, .-f_lseek
	.section	.text.f_opendir,"ax",%progbits
	.align	1
	.global	f_opendir
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	f_opendir, %function
f_opendir:
.LFB39:
	.loc 1 3009 1
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI107:
	sub	sp, sp, #36
.LCFI108:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 3014 8
	ldr	r3, [sp, #4]
	cmp	r3, #0
	bne	.L478
	.loc 1 3014 21 discriminator 1
	movs	r3, #9
	b	.L485
.L478:
	.loc 1 3017 11
	mov	r1, sp
	add	r3, sp, #24
	movs	r2, #0
	mov	r0, r3
	bl	find_volume
	mov	r3, r0
	strb	r3, [sp, #31]
	.loc 1 3018 8
	ldrb	r3, [sp, #31]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L480
	.loc 1 3019 16
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #4]
	str	r2, [r3]
	.loc 1 3020 9
	ldr	r3, [sp, #4]
	add	r2, sp, #12
	str	r2, [r3, #24]
	.loc 1 3021 15
	ldr	r3, [sp]
	mov	r1, r3
	ldr	r0, [sp, #4]
	bl	follow_path
	mov	r3, r0
	strb	r3, [sp, #31]
	.loc 1 3023 12
	ldrb	r3, [sp, #31]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L481
	.loc 1 3024 19
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #20]
	.loc 1 3024 16
	cmp	r3, #0
	beq	.L482
	.loc 1 3025 23
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #20]
	.loc 1 3025 28
	adds	r3, r3, #11
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 3025 39
	and	r3, r3, #16
	.loc 1 3025 20
	cmp	r3, #0
	beq	.L483
	.loc 1 3026 34
	ldr	r2, [sp, #24]
	.loc 1 3026 49
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #20]
	.loc 1 3026 34
	mov	r1, r3
	mov	r0, r2
	bl	ld_clust
	mov	r2, r0
	.loc 1 3026 32
	ldr	r3, [sp, #4]
	str	r2, [r3, #8]
	b	.L482
.L483:
	.loc 1 3028 25
	movs	r3, #5
	strb	r3, [sp, #31]
.L482:
	.loc 1 3030 16
	ldrb	r3, [sp, #31]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L481
	.loc 1 3031 28
	ldr	r3, [sp, #24]
	ldrh	r2, [r3, #6]
	.loc 1 3031 24
	ldr	r3, [sp, #4]
	strh	r2, [r3, #4]	@ movhi
	.loc 1 3032 23
	movs	r1, #0
	ldr	r0, [sp, #4]
	bl	dir_sdi
	mov	r3, r0
	strb	r3, [sp, #31]
.L481:
	.loc 1 3046 12
	ldrb	r3, [sp, #31]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L480
	.loc 1 3046 36 discriminator 1
	movs	r3, #5
	strb	r3, [sp, #31]
.L480:
	.loc 1 3048 8
	ldrb	r3, [sp, #31]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L484
	.loc 1 3048 30 discriminator 1
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3]
.L484:
	.loc 1 3050 5
	ldrb	r3, [sp, #31]	@ zero_extendqisi2
.L485:
	.loc 1 3051 1 discriminator 1
	mov	r0, r3
	add	sp, sp, #36
.LCFI109:
	@ sp needed
	ldr	pc, [sp], #4
.LFE39:
	.size	f_opendir, .-f_opendir
	.section	.text.f_closedir,"ax",%progbits
	.align	1
	.global	f_closedir
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	f_closedir, %function
f_closedir:
.LFB40:
	.loc 1 3060 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI110:
	sub	sp, sp, #20
.LCFI111:
	str	r0, [sp, #4]
	.loc 1 3063 11
	ldr	r0, [sp, #4]
	bl	validate
	mov	r3, r0
	strb	r3, [sp, #15]
	.loc 1 3064 8
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L487
	.loc 1 3073 20
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3]
.L487:
	.loc 1 3078 12
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	.loc 1 3079 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI112:
	@ sp needed
	ldr	pc, [sp], #4
.LFE40:
	.size	f_closedir, .-f_closedir
	.section	.text.f_readdir,"ax",%progbits
	.align	1
	.global	f_readdir
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	f_readdir, %function
f_readdir:
.LFB41:
	.loc 1 3089 1
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI113:
	sub	sp, sp, #28
.LCFI114:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 3093 11
	ldr	r0, [sp, #4]
	bl	validate
	mov	r3, r0
	strb	r3, [sp, #23]
	.loc 1 3094 8
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L490
	.loc 1 3095 12
	ldr	r3, [sp]
	cmp	r3, #0
	bne	.L491
	.loc 1 3096 19
	movs	r1, #0
	ldr	r0, [sp, #4]
	bl	dir_sdi
	mov	r3, r0
	strb	r3, [sp, #23]
	b	.L490
.L491:
	.loc 1 3098 13
	ldr	r3, [sp, #4]
	add	r2, sp, #8
	str	r2, [r3, #24]
	.loc 1 3099 19
	movs	r1, #0
	ldr	r0, [sp, #4]
	bl	dir_read
	mov	r3, r0
	strb	r3, [sp, #23]
	.loc 1 3100 16
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L492
	.loc 1 3101 26
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #16]
	.loc 1 3102 21
	movs	r3, #0
	strb	r3, [sp, #23]
.L492:
	.loc 1 3104 16
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L490
	.loc 1 3105 17
	ldr	r1, [sp]
	ldr	r0, [sp, #4]
	bl	get_fileinfo
	.loc 1 3106 23
	movs	r1, #0
	ldr	r0, [sp, #4]
	bl	dir_next
	mov	r3, r0
	strb	r3, [sp, #23]
	.loc 1 3107 20
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L490
	.loc 1 3108 30
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #16]
	.loc 1 3109 25
	movs	r3, #0
	strb	r3, [sp, #23]
.L490:
	.loc 1 3116 5
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	.loc 1 3117 1
	mov	r0, r3
	add	sp, sp, #28
.LCFI115:
	@ sp needed
	ldr	pc, [sp], #4
.LFE41:
	.size	f_readdir, .-f_readdir
	.section	.text.f_stat,"ax",%progbits
	.align	1
	.global	f_stat
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	f_stat, %function
f_stat:
.LFB42:
	.loc 1 3174 1
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI116:
	sub	sp, sp, #60
.LCFI117:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 3180 11
	add	r1, sp, #4
	add	r3, sp, #24
	movs	r2, #0
	mov	r0, r3
	bl	find_volume
	mov	r3, r0
	strb	r3, [sp, #55]
	.loc 1 3181 8
	ldrb	r3, [sp, #55]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L495
	.loc 1 3182 9
	add	r3, sp, #12
	str	r3, [sp, #48]
	.loc 1 3183 15
	ldr	r2, [sp, #4]
	add	r3, sp, #24
	mov	r1, r2
	mov	r0, r3
	bl	follow_path
	mov	r3, r0
	strb	r3, [sp, #55]
	.loc 1 3184 12
	ldrb	r3, [sp, #55]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L495
	.loc 1 3185 19
	ldr	r3, [sp, #44]
	.loc 1 3185 16
	cmp	r3, #0
	beq	.L496
	.loc 1 3186 20
	ldr	r3, [sp]
	cmp	r3, #0
	beq	.L495
	.loc 1 3186 26 discriminator 1
	add	r3, sp, #24
	ldr	r1, [sp]
	mov	r0, r3
	bl	get_fileinfo
	b	.L495
.L496:
	.loc 1 3188 21
	movs	r3, #6
	strb	r3, [sp, #55]
.L495:
	.loc 1 3194 5
	ldrb	r3, [sp, #55]	@ zero_extendqisi2
	.loc 1 3195 1
	mov	r0, r3
	add	sp, sp, #60
.LCFI118:
	@ sp needed
	ldr	pc, [sp], #4
.LFE42:
	.size	f_stat, .-f_stat
	.section	.text.f_getfree,"ax",%progbits
	.align	1
	.global	f_getfree
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	f_getfree, %function
f_getfree:
.LFB43:
	.loc 1 3207 1
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI119:
	sub	sp, sp, #60
.LCFI120:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 3215 11
	add	r3, sp, #12
	movs	r2, #0
	mov	r1, r3
	ldr	r0, [sp, #4]
	bl	find_volume
	mov	r3, r0
	strb	r3, [sp, #55]
	.loc 1 3216 8
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	str	r3, [sp, #28]
	.loc 1 3217 8
	ldrb	r3, [sp, #55]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L499
	.loc 1 3219 15
	ldr	r3, [sp, #28]
	ldr	r2, [r3, #16]
	.loc 1 3219 33
	ldr	r3, [sp, #28]
	ldr	r3, [r3, #24]
	.loc 1 3219 44
	subs	r3, r3, #2
	.loc 1 3219 12
	cmp	r2, r3
	bhi	.L500
	.loc 1 3220 24
	ldr	r3, [sp, #28]
	ldr	r2, [r3, #16]
	.loc 1 3220 20
	ldr	r3, [sp, #8]
	str	r2, [r3]
	b	.L499
.L500:
	.loc 1 3223 17
	ldr	r3, [sp, #28]
	ldrb	r3, [r3]
	strb	r3, [sp, #27]
	.loc 1 3224 19
	movs	r3, #0
	str	r3, [sp, #48]
	.loc 1 3225 16
	ldrb	r3, [sp, #27]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L501
	.loc 1 3226 22
	movs	r3, #2
	str	r3, [sp, #44]
.L506:
	.loc 1 3228 28
	ldr	r1, [sp, #44]
	ldr	r0, [sp, #28]
	bl	get_fat
	str	r0, [sp, #20]
	.loc 1 3229 24
	ldr	r3, [sp, #20]
	cmp	r3, #-1
	bne	.L502
	.loc 1 3229 51 discriminator 1
	movs	r3, #1
	strb	r3, [sp, #55]
	.loc 1 3229 21 discriminator 1
	b	.L507
.L502:
	.loc 1 3230 24
	ldr	r3, [sp, #20]
	cmp	r3, #1
	bne	.L504
	.loc 1 3230 42 discriminator 1
	movs	r3, #2
	strb	r3, [sp, #55]
	.loc 1 3230 21 discriminator 1
	b	.L507
.L504:
	.loc 1 3231 24
	ldr	r3, [sp, #20]
	cmp	r3, #0
	bne	.L505
	.loc 1 3231 41 discriminator 1
	ldr	r3, [sp, #48]
	adds	r3, r3, #1
	str	r3, [sp, #48]
.L505:
	.loc 1 3232 17
	ldr	r3, [sp, #44]
	adds	r3, r3, #1
	str	r3, [sp, #44]
	.loc 1 3232 37
	ldr	r3, [sp, #28]
	ldr	r3, [r3, #24]
	.loc 1 3232 17
	ldr	r2, [sp, #44]
	cmp	r2, r3
	bcc	.L506
	b	.L507
.L501:
	.loc 1 3234 22
	ldr	r3, [sp, #28]
	ldr	r3, [r3, #24]
	str	r3, [sp, #44]
	.loc 1 3234 43
	ldr	r3, [sp, #28]
	ldr	r3, [r3, #36]
	str	r3, [sp, #40]
	.loc 1 3235 19
	movs	r3, #0
	str	r3, [sp, #36]
	.loc 1 3235 26
	movs	r3, #0
	str	r3, [sp, #32]
.L514:
	.loc 1 3237 24
	ldr	r3, [sp, #36]
	cmp	r3, #0
	bne	.L508
	.loc 1 3238 31
	ldr	r3, [sp, #40]
	adds	r2, r3, #1
	str	r2, [sp, #40]
	mov	r1, r3
	ldr	r0, [sp, #28]
	bl	move_window
	mov	r3, r0
	strb	r3, [sp, #55]
	.loc 1 3239 28
	ldrb	r3, [sp, #55]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L516
	.loc 1 3240 27
	ldr	r3, [sp, #28]
	adds	r3, r3, #52
	str	r3, [sp, #32]
	.loc 1 3241 27
	mov	r3, #512
	str	r3, [sp, #36]
.L508:
	.loc 1 3243 24
	ldrb	r3, [sp, #27]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L510
	.loc 1 3244 29
	ldr	r3, [sp, #32]
	adds	r3, r3, #1
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsls	r3, r3, #8
	sxth	r2, r3
	ldr	r3, [sp, #32]
	ldrb	r3, [r3]	@ zero_extendqisi2
	sxth	r3, r3
	orrs	r3, r3, r2
	sxth	r3, r3
	.loc 1 3244 28
	cmp	r3, #0
	bne	.L511
	.loc 1 3244 51 discriminator 1
	ldr	r3, [sp, #48]
	adds	r3, r3, #1
	str	r3, [sp, #48]
.L511:
	.loc 1 3245 27
	ldr	r3, [sp, #32]
	adds	r3, r3, #2
	str	r3, [sp, #32]
	.loc 1 3245 35
	ldr	r3, [sp, #36]
	subs	r3, r3, #2
	str	r3, [sp, #36]
	b	.L512
.L510:
	.loc 1 3247 30
	ldr	r3, [sp, #32]
	adds	r3, r3, #3
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsls	r2, r3, #24
	ldr	r3, [sp, #32]
	adds	r3, r3, #2
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsls	r3, r3, #16
	orrs	r3, r3, r2
	ldr	r2, [sp, #32]
	adds	r2, r2, #1
	ldrb	r2, [r2]	@ zero_extendqisi2
	lsls	r2, r2, #8
	orrs	r3, r3, r2
	ldr	r2, [sp, #32]
	ldrb	r2, [r2]	@ zero_extendqisi2
	orrs	r3, r3, r2
	.loc 1 3247 42
	bic	r3, r3, #-268435456
	.loc 1 3247 28
	cmp	r3, #0
	bne	.L513
	.loc 1 3247 67 discriminator 1
	ldr	r3, [sp, #48]
	adds	r3, r3, #1
	str	r3, [sp, #48]
.L513:
	.loc 1 3248 27
	ldr	r3, [sp, #32]
	adds	r3, r3, #4
	str	r3, [sp, #32]
	.loc 1 3248 35
	ldr	r3, [sp, #36]
	subs	r3, r3, #4
	str	r3, [sp, #36]
.L512:
	.loc 1 3250 17
	ldr	r3, [sp, #44]
	subs	r3, r3, #1
	str	r3, [sp, #44]
	ldr	r3, [sp, #44]
	cmp	r3, #0
	bne	.L514
	b	.L507
.L516:
	.loc 1 3239 25
	nop
.L507:
	.loc 1 3252 28
	ldr	r3, [sp, #28]
	ldr	r2, [sp, #48]
	str	r2, [r3, #16]
	.loc 1 3253 26
	ldr	r3, [sp, #28]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	orr	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, [sp, #28]
	strb	r2, [r3, #5]
	.loc 1 3254 20
	ldr	r3, [sp, #8]
	ldr	r2, [sp, #48]
	str	r2, [r3]
.L499:
	.loc 1 3257 5
	ldrb	r3, [sp, #55]	@ zero_extendqisi2
	.loc 1 3258 1
	mov	r0, r3
	add	sp, sp, #60
.LCFI121:
	@ sp needed
	ldr	pc, [sp], #4
.LFE43:
	.size	f_getfree, .-f_getfree
	.section	.text.f_truncate,"ax",%progbits
	.align	1
	.global	f_truncate
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	f_truncate, %function
f_truncate:
.LFB44:
	.loc 1 3267 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI122:
	sub	sp, sp, #20
.LCFI123:
	str	r0, [sp, #4]
	.loc 1 3271 11
	ldr	r0, [sp, #4]
	bl	validate
	mov	r3, r0
	strb	r3, [sp, #15]
	.loc 1 3272 8
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L518
	.loc 1 3273 15
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #7]	@ zero_extendqisi2
	.loc 1 3273 12
	cmp	r3, #0
	beq	.L519
	.loc 1 3274 17
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #7]
	strb	r3, [sp, #15]
	b	.L518
.L519:
	.loc 1 3276 21
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	.loc 1 3276 28
	and	r3, r3, #2
	.loc 1 3276 16
	cmp	r3, #0
	bne	.L518
	.loc 1 3277 21
	movs	r3, #7
	strb	r3, [sp, #15]
.L518:
	.loc 1 3280 8
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L520
	.loc 1 3281 15
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #12]
	.loc 1 3281 27
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #8]
	.loc 1 3281 12
	cmp	r2, r3
	bls	.L521
	.loc 1 3282 27
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #8]
	.loc 1 3282 23
	ldr	r3, [sp, #4]
	str	r2, [r3, #12]
	.loc 1 3283 22
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	orr	r3, r3, #32
	uxtb	r2, r3
	ldr	r3, [sp, #4]
	strb	r2, [r3, #6]
	.loc 1 3284 19
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #8]
	.loc 1 3284 16
	cmp	r3, #0
	bne	.L522
	.loc 1 3285 23
	ldr	r3, [sp, #4]
	ldr	r2, [r3]
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	mov	r1, r3
	mov	r0, r2
	bl	remove_chain
	mov	r3, r0
	strb	r3, [sp, #15]
	.loc 1 3286 28
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #16]
	b	.L523
.L522:
	.loc 1 3288 23
	ldr	r3, [sp, #4]
	ldr	r2, [r3]
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #20]
	mov	r1, r3
	mov	r0, r2
	bl	get_fat
	str	r0, [sp, #8]
	.loc 1 3289 21
	movs	r3, #0
	strb	r3, [sp, #15]
	.loc 1 3290 20
	ldr	r3, [sp, #8]
	cmp	r3, #-1
	bne	.L524
	.loc 1 3290 44 discriminator 1
	movs	r3, #1
	strb	r3, [sp, #15]
.L524:
	.loc 1 3291 20
	ldr	r3, [sp, #8]
	cmp	r3, #1
	bne	.L525
	.loc 1 3291 35 discriminator 1
	movs	r3, #2
	strb	r3, [sp, #15]
.L525:
	.loc 1 3292 20
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L523
	.loc 1 3292 45 discriminator 1
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 3292 49 discriminator 1
	ldr	r3, [r3, #24]
	.loc 1 3292 34 discriminator 1
	ldr	r2, [sp, #8]
	cmp	r2, r3
	bcs	.L523
	.loc 1 3293 27
	ldr	r3, [sp, #4]
	ldr	r0, [r3]
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #20]
	mvn	r2, #-268435456
	mov	r1, r3
	bl	put_fat
	mov	r3, r0
	strb	r3, [sp, #15]
	.loc 1 3294 24
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L523
	.loc 1 3294 45 discriminator 1
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	ldr	r1, [sp, #8]
	mov	r0, r3
	bl	remove_chain
	mov	r3, r0
	strb	r3, [sp, #15]
.L523:
	.loc 1 3298 16
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L521
	.loc 1 3298 36 discriminator 1
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	.loc 1 3298 43 discriminator 1
	and	r3, r3, #64
	.loc 1 3298 30 discriminator 1
	cmp	r3, #0
	beq	.L521
	.loc 1 3299 34
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 3299 21
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	.loc 1 3299 47
	ldr	r3, [sp, #4]
	add	r1, r3, #40
	.loc 1 3299 56
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #24]
	.loc 1 3299 21
	movs	r3, #1
	bl	disk_write
	mov	r3, r0
	.loc 1 3299 20
	cmp	r3, #0
	beq	.L526
	.loc 1 3300 25
	movs	r3, #1
	strb	r3, [sp, #15]
	b	.L521
.L526:
	.loc 1 3302 30
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	bic	r3, r3, #64
	uxtb	r2, r3
	ldr	r3, [sp, #4]
	strb	r2, [r3, #6]
.L521:
	.loc 1 3306 12
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L520
	.loc 1 3306 35 discriminator 1
	ldr	r3, [sp, #4]
	ldrb	r2, [sp, #15]
	strb	r2, [r3, #7]
.L520:
	.loc 1 3309 5
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	.loc 1 3310 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI124:
	@ sp needed
	ldr	pc, [sp], #4
.LFE44:
	.size	f_truncate, .-f_truncate
	.section	.text.f_unlink,"ax",%progbits
	.align	1
	.global	f_unlink
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	f_unlink, %function
f_unlink:
.LFB45:
	.loc 1 3319 1
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI125:
	sub	sp, sp, #92
.LCFI126:
	str	r0, [sp, #4]
	.loc 1 3323 11
	movs	r3, #0
	str	r3, [sp, #80]
	.loc 1 3327 11
	add	r1, sp, #4
	add	r3, sp, #48
	movs	r2, #1
	mov	r0, r3
	bl	find_volume
	mov	r3, r0
	strb	r3, [sp, #87]
	.loc 1 3328 8
	ldrb	r3, [sp, #87]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L529
	.loc 1 3329 9
	add	r3, sp, #8
	str	r3, [sp, #72]
	.loc 1 3330 15
	ldr	r2, [sp, #4]
	add	r3, sp, #48
	mov	r1, r2
	mov	r0, r3
	bl	follow_path
	mov	r3, r0
	strb	r3, [sp, #87]
	.loc 1 3331 12
	ldrb	r3, [sp, #87]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L530
	.loc 1 3331 45 discriminator 1
	ldr	r3, [sp, #72]
	.loc 1 3331 48 discriminator 1
	adds	r3, r3, #11
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 3331 57 discriminator 1
	and	r3, r3, #32
	.loc 1 3331 39 discriminator 1
	cmp	r3, #0
	beq	.L530
	.loc 1 3332 17
	movs	r3, #6
	strb	r3, [sp, #87]
.L530:
	.loc 1 3336 12
	ldrb	r3, [sp, #87]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L529
	.loc 1 3337 17
	ldr	r3, [sp, #68]
	str	r3, [sp, #76]
	.loc 1 3338 16
	ldr	r3, [sp, #76]
	cmp	r3, #0
	bne	.L531
	.loc 1 3339 21
	movs	r3, #6
	strb	r3, [sp, #87]
	b	.L532
.L531:
	.loc 1 3341 24
	ldr	r3, [sp, #76]
	adds	r3, r3, #11
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 3341 35
	and	r3, r3, #1
	.loc 1 3341 20
	cmp	r3, #0
	beq	.L532
	.loc 1 3342 25
	movs	r3, #7
	strb	r3, [sp, #87]
.L532:
	.loc 1 3344 16
	ldrb	r3, [sp, #87]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L533
	.loc 1 3345 25
	ldr	r3, [sp, #48]
	ldr	r1, [sp, #76]
	mov	r0, r3
	bl	ld_clust
	str	r0, [sp, #80]
	.loc 1 3346 20
	ldr	r3, [sp, #80]
	cmp	r3, #0
	beq	.L533
	.loc 1 3346 34 discriminator 1
	ldr	r3, [sp, #76]
	adds	r3, r3, #11
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 3346 45 discriminator 1
	and	r3, r3, #16
	.loc 1 3346 27 discriminator 1
	cmp	r3, #0
	beq	.L533
	.loc 1 3348 36
	ldr	r3, [sp, #48]
	.loc 1 3348 39
	ldr	r3, [r3, #20]
	.loc 1 3348 24
	ldr	r2, [sp, #80]
	cmp	r2, r3
	bne	.L534
	.loc 1 3349 29
	movs	r3, #7
	strb	r3, [sp, #87]
	b	.L533
.L534:
	.loc 1 3353 25
	add	r1, sp, #48
	add	r3, sp, #20
	movs	r2, #28
	mov	r0, r3
	bl	mem_cpy
	.loc 1 3354 36
	ldr	r3, [sp, #80]
	str	r3, [sp, #28]
	.loc 1 3355 31
	add	r3, sp, #20
	movs	r1, #2
	mov	r0, r3
	bl	dir_sdi
	mov	r3, r0
	strb	r3, [sp, #87]
	.loc 1 3356 28
	ldrb	r3, [sp, #87]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L533
	.loc 1 3357 35
	add	r3, sp, #20
	movs	r1, #0
	mov	r0, r3
	bl	dir_read
	mov	r3, r0
	strb	r3, [sp, #87]
	.loc 1 3358 32
	ldrb	r3, [sp, #87]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L535
	.loc 1 3358 51 discriminator 1
	movs	r3, #7
	strb	r3, [sp, #87]
.L535:
	.loc 1 3359 32
	ldrb	r3, [sp, #87]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L533
	.loc 1 3359 56 discriminator 1
	movs	r3, #0
	strb	r3, [sp, #87]
.L533:
	.loc 1 3364 16
	ldrb	r3, [sp, #87]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L529
	.loc 1 3365 23
	add	r3, sp, #48
	mov	r0, r3
	bl	dir_remove
	mov	r3, r0
	strb	r3, [sp, #87]
	.loc 1 3366 20
	ldrb	r3, [sp, #87]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L536
	.loc 1 3366 34 discriminator 1
	ldr	r3, [sp, #80]
	cmp	r3, #0
	beq	.L536
	.loc 1 3367 27
	ldr	r3, [sp, #48]
	ldr	r1, [sp, #80]
	mov	r0, r3
	bl	remove_chain
	mov	r3, r0
	strb	r3, [sp, #87]
.L536:
	.loc 1 3368 20
	ldrb	r3, [sp, #87]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L529
	.loc 1 3368 41 discriminator 1
	ldr	r3, [sp, #48]
	mov	r0, r3
	bl	sync_fs
	mov	r3, r0
	strb	r3, [sp, #87]
.L529:
	.loc 1 3374 5
	ldrb	r3, [sp, #87]	@ zero_extendqisi2
	.loc 1 3375 1
	mov	r0, r3
	add	sp, sp, #92
.LCFI127:
	@ sp needed
	ldr	pc, [sp], #4
.LFE45:
	.size	f_unlink, .-f_unlink
	.section	.text.f_mkdir,"ax",%progbits
	.align	1
	.global	f_mkdir
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	f_mkdir, %function
f_mkdir:
.LFB46:
	.loc 1 3384 1
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI128:
	sub	sp, sp, #76
.LCFI129:
	str	r0, [sp, #4]
	.loc 1 3388 31
	bl	get_fattime
	str	r0, [sp, #56]
	.loc 1 3392 11
	add	r1, sp, #4
	add	r3, sp, #20
	movs	r2, #1
	mov	r0, r3
	bl	find_volume
	mov	r3, r0
	strb	r3, [sp, #71]
	.loc 1 3393 8
	ldrb	r3, [sp, #71]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L539
	.loc 1 3394 9
	add	r3, sp, #8
	str	r3, [sp, #44]
	.loc 1 3395 15
	ldr	r2, [sp, #4]
	add	r3, sp, #20
	mov	r1, r2
	mov	r0, r3
	bl	follow_path
	mov	r3, r0
	strb	r3, [sp, #71]
	.loc 1 3396 12
	ldrb	r3, [sp, #71]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L540
	.loc 1 3396 31 discriminator 1
	movs	r3, #8
	strb	r3, [sp, #71]
.L540:
	.loc 1 3397 12
	ldrb	r3, [sp, #71]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L541
	.loc 1 3397 50 discriminator 1
	ldr	r3, [sp, #44]
	.loc 1 3397 53 discriminator 1
	adds	r3, r3, #11
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 3397 62 discriminator 1
	and	r3, r3, #32
	.loc 1 3397 44 discriminator 1
	cmp	r3, #0
	beq	.L541
	.loc 1 3398 17
	movs	r3, #6
	strb	r3, [sp, #71]
.L541:
	.loc 1 3399 12
	ldrb	r3, [sp, #71]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L539
	.loc 1 3400 19
	ldr	r3, [sp, #20]
	movs	r1, #0
	mov	r0, r3
	bl	create_chain
	str	r0, [sp, #52]
	.loc 1 3401 17
	movs	r3, #0
	strb	r3, [sp, #71]
	.loc 1 3402 16
	ldr	r3, [sp, #52]
	cmp	r3, #0
	bne	.L542
	.loc 1 3402 31 discriminator 1
	movs	r3, #7
	strb	r3, [sp, #71]
.L542:
	.loc 1 3403 16
	ldr	r3, [sp, #52]
	cmp	r3, #1
	bne	.L543
	.loc 1 3403 31 discriminator 1
	movs	r3, #2
	strb	r3, [sp, #71]
.L543:
	.loc 1 3404 16
	ldr	r3, [sp, #52]
	cmp	r3, #-1
	bne	.L544
	.loc 1 3404 40 discriminator 1
	movs	r3, #1
	strb	r3, [sp, #71]
.L544:
	.loc 1 3405 16
	ldrb	r3, [sp, #71]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L545
	.loc 1 3406 23
	ldr	r3, [sp, #20]
	mov	r0, r3
	bl	sync_window
	mov	r3, r0
	strb	r3, [sp, #71]
.L545:
	.loc 1 3407 16
	ldrb	r3, [sp, #71]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L546
	.loc 1 3408 23
	ldr	r3, [sp, #20]
	ldr	r1, [sp, #52]
	mov	r0, r3
	bl	clust2sect
	str	r0, [sp, #64]
	.loc 1 3409 25
	ldr	r3, [sp, #20]
	.loc 1 3409 21
	adds	r3, r3, #52
	str	r3, [sp, #48]
	.loc 1 3410 17
	mov	r2, #512
	movs	r1, #0
	ldr	r0, [sp, #48]
	bl	mem_set
	.loc 1 3411 17
	movs	r2, #11
	movs	r1, #32
	ldr	r0, [sp, #48]
	bl	mem_set
	.loc 1 3412 31
	ldr	r3, [sp, #48]
	movs	r2, #46
	strb	r2, [r3]
	.loc 1 3413 20
	ldr	r3, [sp, #48]
	adds	r3, r3, #11
	.loc 1 3413 31
	movs	r2, #16
	strb	r2, [r3]
	.loc 1 3414 17
	ldr	r3, [sp, #48]
	adds	r3, r3, #22
	ldr	r2, [sp, #56]
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #56]
	uxth	r3, r3
	lsrs	r3, r3, #8
	uxth	r2, r3
	ldr	r3, [sp, #48]
	adds	r3, r3, #23
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #56]
	lsrs	r2, r3, #16
	ldr	r3, [sp, #48]
	adds	r3, r3, #24
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #56]
	lsrs	r2, r3, #24
	ldr	r3, [sp, #48]
	adds	r3, r3, #25
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 3415 17
	ldr	r1, [sp, #52]
	ldr	r0, [sp, #48]
	bl	st_clust
	.loc 1 3416 29
	ldr	r3, [sp, #48]
	adds	r3, r3, #32
	.loc 1 3416 17
	movs	r2, #32
	ldr	r1, [sp, #48]
	mov	r0, r3
	bl	mem_cpy
	.loc 1 3417 20
	ldr	r3, [sp, #48]
	adds	r3, r3, #33
	.loc 1 3417 34
	movs	r2, #46
	strb	r2, [r3]
	.loc 1 3417 45
	ldr	r3, [sp, #28]
	str	r3, [sp, #60]
	.loc 1 3418 23
	ldr	r3, [sp, #20]
	.loc 1 3418 26
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 3418 20
	cmp	r3, #3
	bne	.L547
	.loc 1 3418 60 discriminator 1
	ldr	r3, [sp, #20]
	.loc 1 3418 63 discriminator 1
	ldr	r3, [r3, #40]
	.loc 1 3418 48 discriminator 1
	ldr	r2, [sp, #60]
	cmp	r2, r3
	bne	.L547
	.loc 1 3419 25
	movs	r3, #0
	str	r3, [sp, #60]
.L547:
	.loc 1 3420 17
	ldr	r3, [sp, #48]
	adds	r3, r3, #32
	ldr	r1, [sp, #60]
	mov	r0, r3
	bl	st_clust
	.loc 1 3421 28
	ldr	r3, [sp, #20]
	.loc 1 3421 24
	ldrb	r3, [r3, #2]
	strb	r3, [sp, #70]
	.loc 1 3421 17
	b	.L548
.L550:
	.loc 1 3422 41
	ldr	r3, [sp, #64]
	adds	r2, r3, #1
	str	r2, [sp, #64]
	.loc 1 3422 23
	ldr	r2, [sp, #20]
	.loc 1 3422 36
	str	r3, [r2, #48]
	.loc 1 3423 23
	ldr	r3, [sp, #20]
	.loc 1 3423 34
	movs	r2, #1
	strb	r2, [r3, #4]
	.loc 1 3424 27
	ldr	r3, [sp, #20]
	mov	r0, r3
	bl	sync_window
	mov	r3, r0
	strb	r3, [sp, #71]
	.loc 1 3425 24
	ldrb	r3, [sp, #71]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L554
	.loc 1 3426 21 discriminator 2
	mov	r2, #512
	movs	r1, #0
	ldr	r0, [sp, #48]
	bl	mem_set
	.loc 1 3421 44 discriminator 2
	ldrb	r3, [sp, #70]	@ zero_extendqisi2
	subs	r3, r3, #1
	strb	r3, [sp, #70]
.L548:
	.loc 1 3421 17 discriminator 1
	ldrb	r3, [sp, #70]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L550
	b	.L546
.L554:
	.loc 1 3425 21
	nop
.L546:
	.loc 1 3429 16
	ldrb	r3, [sp, #71]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L551
	.loc 1 3429 37 discriminator 1
	add	r3, sp, #20
	mov	r0, r3
	bl	dir_register
	mov	r3, r0
	strb	r3, [sp, #71]
.L551:
	.loc 1 3430 16
	ldrb	r3, [sp, #71]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L552
	.loc 1 3431 17
	ldr	r3, [sp, #20]
	ldr	r1, [sp, #52]
	mov	r0, r3
	bl	remove_chain
	b	.L539
.L552:
	.loc 1 3433 21
	ldr	r3, [sp, #40]
	str	r3, [sp, #48]
	.loc 1 3434 20
	ldr	r3, [sp, #48]
	adds	r3, r3, #11
	.loc 1 3434 31
	movs	r2, #16
	strb	r2, [r3]
	.loc 1 3435 17
	ldr	r3, [sp, #48]
	adds	r3, r3, #22
	ldr	r2, [sp, #56]
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #56]
	uxth	r3, r3
	lsrs	r3, r3, #8
	uxth	r2, r3
	ldr	r3, [sp, #48]
	adds	r3, r3, #23
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #56]
	lsrs	r2, r3, #16
	ldr	r3, [sp, #48]
	adds	r3, r3, #24
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #56]
	lsrs	r2, r3, #24
	ldr	r3, [sp, #48]
	adds	r3, r3, #25
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 3436 17
	ldr	r1, [sp, #52]
	ldr	r0, [sp, #48]
	bl	st_clust
	.loc 1 3437 19
	ldr	r3, [sp, #20]
	.loc 1 3437 30
	movs	r2, #1
	strb	r2, [r3, #4]
	.loc 1 3438 23
	ldr	r3, [sp, #20]
	mov	r0, r3
	bl	sync_fs
	mov	r3, r0
	strb	r3, [sp, #71]
.L539:
	.loc 1 3444 5
	ldrb	r3, [sp, #71]	@ zero_extendqisi2
	.loc 1 3445 1
	mov	r0, r3
	add	sp, sp, #76
.LCFI130:
	@ sp needed
	ldr	pc, [sp], #4
.LFE46:
	.size	f_mkdir, .-f_mkdir
	.section	.text.f_chmod,"ax",%progbits
	.align	1
	.global	f_chmod
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	f_chmod, %function
f_chmod:
.LFB47:
	.loc 1 3456 1
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI131:
	sub	sp, sp, #60
.LCFI132:
	str	r0, [sp, #4]
	mov	r3, r1
	strb	r3, [sp, #3]
	mov	r3, r2
	strb	r3, [sp, #2]
	.loc 1 3462 11
	add	r1, sp, #4
	add	r3, sp, #20
	movs	r2, #1
	mov	r0, r3
	bl	find_volume
	mov	r3, r0
	strb	r3, [sp, #55]
	.loc 1 3463 8
	ldrb	r3, [sp, #55]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L556
	.loc 1 3464 9
	add	r3, sp, #8
	str	r3, [sp, #44]
	.loc 1 3465 15
	ldr	r2, [sp, #4]
	add	r3, sp, #20
	mov	r1, r2
	mov	r0, r3
	bl	follow_path
	mov	r3, r0
	strb	r3, [sp, #55]
	.loc 1 3467 12
	ldrb	r3, [sp, #55]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L557
	.loc 1 3467 45 discriminator 1
	ldr	r3, [sp, #44]
	.loc 1 3467 48 discriminator 1
	adds	r3, r3, #11
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 3467 57 discriminator 1
	and	r3, r3, #32
	.loc 1 3467 39 discriminator 1
	cmp	r3, #0
	beq	.L557
	.loc 1 3468 17
	movs	r3, #6
	strb	r3, [sp, #55]
.L557:
	.loc 1 3469 12
	ldrb	r3, [sp, #55]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L556
	.loc 1 3470 17
	ldr	r3, [sp, #40]
	str	r3, [sp, #48]
	.loc 1 3471 16
	ldr	r3, [sp, #48]
	cmp	r3, #0
	bne	.L558
	.loc 1 3472 21
	movs	r3, #6
	strb	r3, [sp, #55]
	b	.L556
.L558:
	.loc 1 3474 22
	ldrb	r3, [sp, #2]
	and	r3, r3, #39
	strb	r3, [sp, #2]
	.loc 1 3475 31
	ldrb	r2, [sp, #3]
	ldrb	r3, [sp, #2]
	ands	r3, r3, r2
	uxtb	r1, r3
	.loc 1 3475 53
	ldr	r3, [sp, #48]
	adds	r3, r3, #11
	ldrb	r2, [r3]	@ zero_extendqisi2
	.loc 1 3475 66
	ldrb	r3, [sp, #2]
	mvns	r3, r3
	uxtb	r3, r3
	.loc 1 3475 31
	ands	r3, r3, r2
	uxtb	r2, r3
	.loc 1 3475 20
	ldr	r3, [sp, #48]
	adds	r3, r3, #11
	.loc 1 3475 31
	orrs	r2, r2, r1
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 3476 19
	ldr	r3, [sp, #20]
	.loc 1 3476 30
	movs	r2, #1
	strb	r2, [r3, #4]
	.loc 1 3477 23
	ldr	r3, [sp, #20]
	mov	r0, r3
	bl	sync_fs
	mov	r3, r0
	strb	r3, [sp, #55]
.L556:
	.loc 1 3482 5
	ldrb	r3, [sp, #55]	@ zero_extendqisi2
	.loc 1 3483 1
	mov	r0, r3
	add	sp, sp, #60
.LCFI133:
	@ sp needed
	ldr	pc, [sp], #4
.LFE47:
	.size	f_chmod, .-f_chmod
	.section	.text.f_rename,"ax",%progbits
	.align	1
	.global	f_rename
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	f_rename, %function
f_rename:
.LFB48:
	.loc 1 3493 1
	@ args = 0, pretend = 0, frame = 112
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
.LCFI134:
	sub	sp, sp, #112
.LCFI135:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 3501 11
	add	r1, sp, #4
	add	r3, sp, #72
	movs	r2, #1
	mov	r0, r3
	bl	find_volume
	mov	r3, r0
	strb	r3, [sp, #111]
	.loc 1 3502 8
	ldrb	r3, [sp, #111]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L561
	.loc 1 3503 21
	ldr	r3, [sp, #72]
	.loc 1 3503 16
	str	r3, [sp, #44]
	.loc 1 3504 9
	add	r3, sp, #8
	str	r3, [sp, #96]
	.loc 1 3505 15
	ldr	r2, [sp, #4]
	add	r3, sp, #72
	mov	r1, r2
	mov	r0, r3
	bl	follow_path
	mov	r3, r0
	strb	r3, [sp, #111]
	.loc 1 3506 12
	ldrb	r3, [sp, #111]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L562
	.loc 1 3506 46 discriminator 1
	ldr	r3, [sp, #96]
	.loc 1 3506 49 discriminator 1
	adds	r3, r3, #11
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 3506 58 discriminator 1
	and	r3, r3, #32
	.loc 1 3506 39 discriminator 1
	cmp	r3, #0
	beq	.L562
	.loc 1 3507 17
	movs	r3, #6
	strb	r3, [sp, #111]
.L562:
	.loc 1 3511 12
	ldrb	r3, [sp, #111]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L561
	.loc 1 3512 21
	ldr	r3, [sp, #92]
	.loc 1 3512 16
	cmp	r3, #0
	bne	.L563
	.loc 1 3513 21
	movs	r3, #4
	strb	r3, [sp, #111]
	b	.L561
.L563:
	.loc 1 3515 33
	ldr	r3, [sp, #92]
	.loc 1 3515 38
	add	r1, r3, #11
	.loc 1 3515 17
	add	r3, sp, #20
	movs	r2, #21
	mov	r0, r3
	bl	mem_cpy
	.loc 1 3516 17
	add	r1, sp, #72
	add	r3, sp, #44
	movs	r2, #28
	mov	r0, r3
	bl	mem_cpy
	.loc 1 3517 21
	mov	r3, sp
	mov	r0, r3
	bl	get_ldnumber
	mov	r3, r0
	.loc 1 3517 20
	cmp	r3, #0
	blt	.L564
	.loc 1 3518 27
	ldr	r2, [sp]
	add	r3, sp, #44
	mov	r1, r2
	mov	r0, r3
	bl	follow_path
	mov	r3, r0
	strb	r3, [sp, #111]
	b	.L565
.L564:
	.loc 1 3520 25
	movs	r3, #11
	strb	r3, [sp, #111]
.L565:
	.loc 1 3521 20
	ldrb	r3, [sp, #111]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L566
	.loc 1 3521 39 discriminator 1
	movs	r3, #8
	strb	r3, [sp, #111]
.L566:
	.loc 1 3522 20
	ldrb	r3, [sp, #111]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L561
	.loc 1 3523 27
	add	r3, sp, #44
	mov	r0, r3
	bl	dir_register
	mov	r3, r0
	strb	r3, [sp, #111]
	.loc 1 3524 24
	ldrb	r3, [sp, #111]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L561
	.loc 1 3526 29
	ldr	r3, [sp, #64]
	str	r3, [sp, #104]
	.loc 1 3527 37
	ldr	r3, [sp, #104]
	add	r0, r3, #13
	.loc 1 3527 25
	add	r3, sp, #20
	adds	r3, r3, #2
	movs	r2, #19
	mov	r1, r3
	bl	mem_cpy
	.loc 1 3528 44
	ldrb	r2, [sp, #20]	@ zero_extendqisi2
	.loc 1 3528 28
	ldr	r3, [sp, #104]
	adds	r3, r3, #11
	.loc 1 3528 39
	orr	r2, r2, #32
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 3529 28
	ldr	r3, [sp, #72]
	.loc 1 3529 39
	movs	r2, #1
	strb	r2, [r3, #4]
	.loc 1 3530 33
	ldr	r3, [sp, #104]
	adds	r3, r3, #11
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 3530 44
	and	r3, r3, #16
	.loc 1 3530 28
	cmp	r3, #0
	beq	.L567
	.loc 1 3530 60 discriminator 1
	ldr	r2, [sp, #80]
	.loc 1 3530 74 discriminator 1
	ldr	r3, [sp, #52]
	.loc 1 3530 54 discriminator 1
	cmp	r2, r3
	beq	.L567
	.loc 1 3531 34
	ldr	r4, [sp, #72]
	ldr	r3, [sp, #72]
	ldr	r1, [sp, #104]
	mov	r0, r3
	bl	ld_clust
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	clust2sect
	str	r0, [sp, #100]
	.loc 1 3532 32
	ldr	r3, [sp, #100]
	cmp	r3, #0
	bne	.L568
	.loc 1 3533 37
	movs	r3, #2
	strb	r3, [sp, #111]
	b	.L567
.L568:
	.loc 1 3535 39
	ldr	r3, [sp, #72]
	ldr	r1, [sp, #100]
	mov	r0, r3
	bl	move_window
	mov	r3, r0
	strb	r3, [sp, #111]
	.loc 1 3536 42
	ldr	r3, [sp, #72]
	.loc 1 3536 39
	adds	r3, r3, #52
	.loc 1 3536 37
	adds	r3, r3, #32
	str	r3, [sp, #104]
	.loc 1 3537 36
	ldrb	r3, [sp, #111]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L567
	.loc 1 3537 56 discriminator 1
	ldr	r3, [sp, #104]
	adds	r3, r3, #1
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 3537 50 discriminator 1
	cmp	r3, #46
	bne	.L567
	.loc 1 3538 37
	ldr	r3, [sp, #52]
	mov	r1, r3
	ldr	r0, [sp, #104]
	bl	st_clust
	.loc 1 3539 40
	ldr	r3, [sp, #72]
	.loc 1 3539 51
	movs	r2, #1
	strb	r2, [r3, #4]
.L567:
	.loc 1 3543 28
	ldrb	r3, [sp, #111]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L561
	.loc 1 3544 35
	add	r3, sp, #72
	mov	r0, r3
	bl	dir_remove
	mov	r3, r0
	strb	r3, [sp, #111]
	.loc 1 3545 32
	ldrb	r3, [sp, #111]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L561
	.loc 1 3546 39
	ldr	r3, [sp, #72]
	mov	r0, r3
	bl	sync_fs
	mov	r3, r0
	strb	r3, [sp, #111]
.L561:
	.loc 1 3556 5
	ldrb	r3, [sp, #111]	@ zero_extendqisi2
	.loc 1 3557 1
	mov	r0, r3
	add	sp, sp, #112
.LCFI136:
	@ sp needed
	pop	{r4, pc}
.LFE48:
	.size	f_rename, .-f_rename
	.section	.text.f_utime,"ax",%progbits
	.align	1
	.global	f_utime
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	f_utime, %function
f_utime:
.LFB49:
	.loc 1 3567 1
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI137:
	sub	sp, sp, #60
.LCFI138:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 3574 11
	add	r1, sp, #4
	add	r3, sp, #20
	movs	r2, #1
	mov	r0, r3
	bl	find_volume
	mov	r3, r0
	strb	r3, [sp, #55]
	.loc 1 3575 8
	ldrb	r3, [sp, #55]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L571
	.loc 1 3576 9
	add	r3, sp, #8
	str	r3, [sp, #44]
	.loc 1 3577 15
	ldr	r2, [sp, #4]
	add	r3, sp, #20
	mov	r1, r2
	mov	r0, r3
	bl	follow_path
	mov	r3, r0
	strb	r3, [sp, #55]
	.loc 1 3579 12
	ldrb	r3, [sp, #55]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L572
	.loc 1 3579 45 discriminator 1
	ldr	r3, [sp, #44]
	.loc 1 3579 48 discriminator 1
	adds	r3, r3, #11
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 3579 57 discriminator 1
	and	r3, r3, #32
	.loc 1 3579 39 discriminator 1
	cmp	r3, #0
	beq	.L572
	.loc 1 3580 17
	movs	r3, #6
	strb	r3, [sp, #55]
.L572:
	.loc 1 3581 12
	ldrb	r3, [sp, #55]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L571
	.loc 1 3582 17
	ldr	r3, [sp, #40]
	str	r3, [sp, #48]
	.loc 1 3583 16
	ldr	r3, [sp, #48]
	cmp	r3, #0
	bne	.L573
	.loc 1 3584 21
	movs	r3, #6
	strb	r3, [sp, #55]
	b	.L571
.L573:
	.loc 1 3586 17
	ldr	r3, [sp]
	ldrh	r2, [r3, #6]
	ldr	r3, [sp, #48]
	adds	r3, r3, #22
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp]
	ldrh	r3, [r3, #6]
	lsrs	r3, r3, #8
	uxth	r2, r3
	ldr	r3, [sp, #48]
	adds	r3, r3, #23
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 3587 17
	ldr	r3, [sp]
	ldrh	r2, [r3, #4]
	ldr	r3, [sp, #48]
	adds	r3, r3, #24
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp]
	ldrh	r3, [r3, #4]
	lsrs	r3, r3, #8
	uxth	r2, r3
	ldr	r3, [sp, #48]
	adds	r3, r3, #25
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 3588 19
	ldr	r3, [sp, #20]
	.loc 1 3588 30
	movs	r2, #1
	strb	r2, [r3, #4]
	.loc 1 3589 23
	ldr	r3, [sp, #20]
	mov	r0, r3
	bl	sync_fs
	mov	r3, r0
	strb	r3, [sp, #55]
.L571:
	.loc 1 3594 5
	ldrb	r3, [sp, #55]	@ zero_extendqisi2
	.loc 1 3595 1
	mov	r0, r3
	add	sp, sp, #60
.LCFI139:
	@ sp needed
	ldr	pc, [sp], #4
.LFE49:
	.size	f_utime, .-f_utime
	.section .rodata
	.align	2
.LC1:
	.ascii	"\353\376\220MSDOS5.0\000"
	.align	2
.LC2:
	.ascii	"NO NAME    FAT32   \000"
	.align	2
.LC3:
	.ascii	"NO NAME    FAT     \000"
	.section	.text.f_mkfs,"ax",%progbits
	.align	1
	.global	f_mkfs
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	f_mkfs, %function
f_mkfs:
.LFB50:
	.loc 1 3828 1
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI140:
	sub	sp, sp, #100
.LCFI141:
	str	r0, [sp, #12]
	mov	r3, r1
	str	r2, [sp, #4]
	strb	r3, [sp, #11]
	.loc 1 3844 8
	ldrb	r3, [sp, #11]	@ zero_extendqisi2
	cmp	r3, #1
	bls	.L576
	.loc 1 3844 25 discriminator 1
	movs	r3, #19
	b	.L638
.L576:
	.loc 1 3845 11
	add	r3, sp, #12
	mov	r0, r3
	bl	get_ldnumber
	str	r0, [sp, #52]
	.loc 1 3846 8
	ldr	r3, [sp, #52]
	cmp	r3, #0
	bge	.L578
	.loc 1 3846 25 discriminator 1
	movs	r3, #11
	b	.L638
.L578:
	.loc 1 3847 8
	ldr	r2, .L640
	ldr	r3, [sp, #52]
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [sp, #48]
	.loc 1 3848 8
	ldr	r3, [sp, #48]
	cmp	r3, #0
	bne	.L579
	.loc 1 3848 21 discriminator 1
	movs	r3, #12
	b	.L638
.L579:
	.loc 1 3849 17
	ldr	r3, [sp, #48]
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 3850 10
	ldr	r3, [sp, #52]
	strb	r3, [sp, #83]
	.loc 1 3851 10
	movs	r3, #0
	strb	r3, [sp, #82]
	.loc 1 3854 12
	ldrb	r3, [sp, #83]	@ zero_extendqisi2
	mov	r0, r3
	bl	disk_initialize
	mov	r3, r0
	strb	r3, [sp, #81]
	.loc 1 3855 14
	ldrb	r3, [sp, #81]	@ zero_extendqisi2
	and	r3, r3, #1
	.loc 1 3855 8
	cmp	r3, #0
	beq	.L580
	.loc 1 3855 35 discriminator 1
	movs	r3, #3
	b	.L638
.L580:
	.loc 1 3856 14
	ldrb	r3, [sp, #81]	@ zero_extendqisi2
	and	r3, r3, #4
	.loc 1 3856 8
	cmp	r3, #0
	beq	.L581
	.loc 1 3856 36 discriminator 1
	movs	r3, #10
	b	.L638
.L581:
	.loc 1 3871 13
	add	r2, sp, #20
	ldrb	r3, [sp, #83]	@ zero_extendqisi2
	movs	r1, #1
	mov	r0, r3
	bl	disk_ioctl
	mov	r3, r0
	.loc 1 3871 12
	cmp	r3, #0
	bne	.L582
	.loc 1 3871 75 discriminator 1
	ldr	r3, [sp, #20]
	.loc 1 3871 66 discriminator 1
	cmp	r3, #127
	bhi	.L583
.L582:
	.loc 1 3872 20
	movs	r3, #1
	b	.L638
.L583:
	.loc 1 3873 27
	ldrb	r3, [sp, #11]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L584
	.loc 1 3873 27 is_stmt 0 discriminator 1
	movs	r3, #0
	b	.L585
.L584:
	.loc 1 3873 27 discriminator 2
	movs	r3, #63
.L585:
	.loc 1 3873 15 is_stmt 1 discriminator 4
	str	r3, [sp, #88]
	.loc 1 3874 15 discriminator 4
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #88]
	subs	r3, r2, r3
	str	r3, [sp, #20]
	.loc 1 3877 18 discriminator 4
	ldr	r3, [sp, #4]
	subs	r2, r3, #1
	.loc 1 3877 12 discriminator 4
	ldr	r3, [sp, #4]
	ands	r3, r3, r2
	.loc 1 3877 8 discriminator 4
	cmp	r3, #0
	beq	.L586
	.loc 1 3877 27 discriminator 1
	movs	r3, #0
	str	r3, [sp, #4]
.L586:
	.loc 1 3878 8
	ldr	r3, [sp, #4]
	cmp	r3, #0
	bne	.L587
	.loc 1 3879 20
	ldr	r3, [sp, #20]
	.loc 1 3879 12
	ldr	r2, .L640+4
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #7
	str	r3, [sp, #84]
	.loc 1 3880 16
	movs	r3, #0
	str	r3, [sp, #92]
	.loc 1 3880 9
	b	.L588
.L589:
	.loc 1 3880 35 discriminator 3
	ldr	r3, [sp, #92]
	adds	r3, r3, #1
	str	r3, [sp, #92]
.L588:
	.loc 1 3880 29 discriminator 1
	ldr	r2, .L640+8
	ldr	r3, [sp, #92]
	ldrh	r3, [r2, r3, lsl #1]
	mov	r2, r3
	.loc 1 3880 9 discriminator 1
	ldr	r3, [sp, #84]
	cmp	r3, r2
	bcc	.L589
	.loc 1 3881 17
	ldr	r2, .L640+12
	ldr	r3, [sp, #92]
	ldrh	r3, [r2, r3, lsl #1]
	.loc 1 3881 12
	str	r3, [sp, #4]
.L587:
	.loc 1 3883 8
	ldr	r3, [sp, #4]
	cmp	r3, #512
	bcc	.L590
	.loc 1 3883 27 discriminator 1
	ldr	r3, [sp, #4]
	lsrs	r3, r3, #9
	str	r3, [sp, #4]
.L590:
	.loc 1 3884 8
	ldr	r3, [sp, #4]
	cmp	r3, #0
	bne	.L591
	.loc 1 3884 17 discriminator 1
	movs	r3, #1
	str	r3, [sp, #4]
.L591:
	.loc 1 3885 8
	ldr	r3, [sp, #4]
	cmp	r3, #128
	bls	.L592
	.loc 1 3885 22 discriminator 1
	movs	r3, #128
	str	r3, [sp, #4]
.L592:
	.loc 1 3888 20
	ldr	r2, [sp, #20]
	.loc 1 3888 12
	ldr	r3, [sp, #4]
	udiv	r3, r2, r3
	str	r3, [sp, #40]
	.loc 1 3889 9
	movs	r3, #1
	strb	r3, [sp, #47]
	.loc 1 3890 8
	ldr	r3, [sp, #40]
	movw	r2, #4085
	cmp	r3, r2
	bls	.L593
	.loc 1 3890 34 discriminator 1
	movs	r3, #2
	strb	r3, [sp, #47]
.L593:
	.loc 1 3891 8
	ldr	r3, [sp, #40]
	movw	r2, #65525
	cmp	r3, r2
	bls	.L594
	.loc 1 3891 34 discriminator 1
	movs	r3, #3
	strb	r3, [sp, #47]
.L594:
	.loc 1 3894 8
	ldrb	r3, [sp, #47]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L595
	.loc 1 3895 35
	ldr	r3, [sp, #40]
	adds	r3, r3, #130
	lsls	r3, r3, #2
	.loc 1 3895 44
	subs	r3, r3, #1
	.loc 1 3895 15
	lsrs	r3, r3, #9
	str	r3, [sp, #60]
	.loc 1 3896 15
	movs	r3, #32
	str	r3, [sp, #64]
	.loc 1 3897 15
	movs	r3, #0
	str	r3, [sp, #56]
	b	.L596
.L595:
	.loc 1 3899 62
	ldrb	r3, [sp, #47]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L597
	.loc 1 3899 45 discriminator 1
	ldr	r2, [sp, #40]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	.loc 1 3899 49 discriminator 1
	adds	r3, r3, #1
	.loc 1 3899 54 discriminator 1
	lsrs	r3, r3, #1
	.loc 1 3899 62 discriminator 1
	adds	r3, r3, #3
	b	.L598
.L597:
	.loc 1 3899 77 discriminator 2
	ldr	r3, [sp, #40]
	adds	r3, r3, #2
	.loc 1 3899 62 discriminator 2
	lsls	r3, r3, #1
.L598:
	.loc 1 3899 15 discriminator 4
	str	r3, [sp, #60]
	.loc 1 3900 33 discriminator 4
	ldr	r3, [sp, #60]
	addw	r3, r3, #511
	.loc 1 3900 15 discriminator 4
	lsrs	r3, r3, #9
	str	r3, [sp, #60]
	.loc 1 3901 15 discriminator 4
	movs	r3, #1
	str	r3, [sp, #64]
	.loc 1 3902 15 discriminator 4
	movs	r3, #32
	str	r3, [sp, #56]
.L596:
	.loc 1 3904 11
	ldr	r2, [sp, #88]
	ldr	r3, [sp, #64]
	add	r3, r3, r2
	str	r3, [sp, #68]
	.loc 1 3905 11
	ldr	r2, [sp, #68]
	ldr	r3, [sp, #60]
	add	r3, r3, r2
	str	r3, [sp, #36]
	.loc 1 3906 12
	ldr	r2, [sp, #36]
	ldr	r3, [sp, #56]
	add	r3, r3, r2
	str	r3, [sp, #32]
	.loc 1 3907 24
	ldr	r2, [sp, #32]
	ldr	r3, [sp, #4]
	add	r2, r2, r3
	.loc 1 3907 29
	ldr	r3, [sp, #88]
	subs	r2, r2, r3
	.loc 1 3907 15
	ldr	r3, [sp, #20]
	.loc 1 3907 8
	cmp	r2, r3
	bls	.L599
	.loc 1 3907 45 discriminator 1
	movs	r3, #14
	b	.L638
.L599:
	.loc 1 3910 9
	add	r2, sp, #24
	ldrb	r3, [sp, #83]	@ zero_extendqisi2
	movs	r1, #3
	mov	r0, r3
	bl	disk_ioctl
	mov	r3, r0
	.loc 1 3910 8
	cmp	r3, #0
	bne	.L600
	.loc 1 3910 59 discriminator 2
	ldr	r3, [sp, #24]
	.loc 1 3910 56 discriminator 2
	cmp	r3, #0
	beq	.L600
	.loc 1 3910 67 discriminator 4
	ldr	r3, [sp, #24]
	.loc 1 3910 62 discriminator 4
	cmp	r3, #32768
	bls	.L601
.L600:
	.loc 1 3910 78 discriminator 5
	movs	r3, #1
	str	r3, [sp, #24]
.L601:
	.loc 1 3911 17
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #32]
	add	r3, r3, r2
	.loc 1 3911 21
	subs	r2, r3, #1
	.loc 1 3911 28
	ldr	r3, [sp, #24]
	rsbs	r3, r3, #0
	.loc 1 3911 26
	ands	r3, r3, r2
	.loc 1 3911 7
	str	r3, [sp, #24]
	.loc 1 3912 22
	ldr	r2, [sp, #24]
	.loc 1 3912 12
	ldr	r3, [sp, #32]
	subs	r3, r2, r3
	.loc 1 3912 7
	str	r3, [sp, #24]
	.loc 1 3913 8
	ldrb	r3, [sp, #47]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L602
	.loc 1 3914 15
	ldr	r3, [sp, #24]
	ldr	r2, [sp, #64]
	add	r3, r3, r2
	str	r3, [sp, #64]
	.loc 1 3915 15
	ldr	r3, [sp, #24]
	ldr	r2, [sp, #68]
	add	r3, r3, r2
	str	r3, [sp, #68]
	b	.L603
.L602:
	.loc 1 3917 15
	ldr	r3, [sp, #24]
	ldr	r2, [sp, #60]
	add	r3, r3, r2
	str	r3, [sp, #60]
.L603:
	.loc 1 3921 21
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #64]
	subs	r2, r2, r3
	.loc 1 3921 29
	ldr	r3, [sp, #60]
	subs	r2, r2, r3
	.loc 1 3921 46
	ldr	r3, [sp, #56]
	subs	r2, r2, r3
	.loc 1 3921 12
	ldr	r3, [sp, #4]
	udiv	r3, r2, r3
	str	r3, [sp, #40]
	.loc 1 3922 8
	ldrb	r3, [sp, #47]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L604
	.loc 1 3922 29 discriminator 1
	ldr	r3, [sp, #40]
	movw	r2, #4085
	cmp	r3, r2
	bls	.L605
.L604:
	.loc 1 3923 9
	ldrb	r3, [sp, #47]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L606
	.loc 1 3923 29 discriminator 1
	ldr	r3, [sp, #40]
	movw	r2, #65525
	cmp	r3, r2
	bhi	.L606
.L605:
	.loc 1 3924 16
	movs	r3, #14
	b	.L638
.L606:
	.loc 1 3927 8
	ldrb	r3, [sp, #47]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L607
	.loc 1 3928 13
	movs	r3, #12
	strb	r3, [sp, #79]
	b	.L639
.L607:
	.loc 1 3930 12
	ldrb	r3, [sp, #47]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L609
	.loc 1 3930 38 discriminator 1
	ldr	r3, [sp, #20]
	.loc 1 3930 29 discriminator 1
	cmp	r3, #65536
	bcs	.L609
	.loc 1 3931 17
	movs	r3, #1
	strb	r3, [sp, #79]
	b	.L639
.L609:
	.loc 1 3933 26
	ldr	r3, [sp, #20]
	.loc 1 3933 17
	cmp	r3, #65536
	bcs	.L610
	.loc 1 3933 17 is_stmt 0 discriminator 1
	movs	r3, #4
	b	.L611
.L610:
	.loc 1 3933 17 discriminator 2
	movs	r3, #6
.L611:
	.loc 1 3933 17 discriminator 4
	strb	r3, [sp, #79]
.L639:
	.loc 1 3945 12 is_stmt 1
	ldrb	r3, [sp, #11]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L612
	.loc 1 3946 16
	movs	r3, #240
	strb	r3, [sp, #80]
	b	.L613
.L641:
	.align	2
.L640:
	.word	FatFs
	.word	274877907
	.word	vst.1
	.word	cst.0
.L612:
	.loc 1 3948 23
	ldr	r3, [sp, #48]
	adds	r3, r3, #52
	.loc 1 3948 13
	mov	r2, #512
	movs	r1, #0
	mov	r0, r3
	bl	mem_set
	.loc 1 3949 19
	ldr	r3, [sp, #48]
	adds	r3, r3, #52
	.loc 1 3949 17
	add	r3, r3, #446
	str	r3, [sp, #28]
	.loc 1 3950 16
	ldr	r3, [sp, #28]
	adds	r3, r3, #1
	.loc 1 3950 20
	movs	r2, #1
	strb	r2, [r3]
	.loc 1 3951 16
	ldr	r3, [sp, #28]
	adds	r3, r3, #2
	.loc 1 3951 20
	movs	r2, #1
	strb	r2, [r3]
	.loc 1 3952 16
	ldr	r3, [sp, #28]
	adds	r3, r3, #3
	.loc 1 3952 20
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 3953 16
	ldr	r3, [sp, #28]
	adds	r3, r3, #4
	.loc 1 3953 20
	ldrb	r2, [sp, #79]
	strb	r2, [r3]
	.loc 1 3954 16
	ldr	r3, [sp, #28]
	adds	r3, r3, #5
	.loc 1 3954 20
	movs	r2, #254
	strb	r2, [r3]
	.loc 1 3955 24
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #88]
	add	r2, r2, r3
	.loc 1 3955 38
	ldr	r3, .L642
	umull	r1, r3, r3, r2
	subs	r2, r2, r3
	lsrs	r2, r2, #1
	add	r3, r3, r2
	lsrs	r3, r3, #13
	.loc 1 3955 15
	str	r3, [sp, #24]
	.loc 1 3956 31
	ldr	r3, [sp, #24]
	lsrs	r3, r3, #2
	.loc 1 3956 22
	uxtb	r2, r3
	.loc 1 3956 16
	ldr	r3, [sp, #28]
	adds	r3, r3, #6
	.loc 1 3956 22
	orr	r2, r2, #63
	uxtb	r2, r2
	.loc 1 3956 20
	strb	r2, [r3]
	.loc 1 3957 22
	ldr	r2, [sp, #24]
	.loc 1 3957 16
	ldr	r3, [sp, #28]
	adds	r3, r3, #7
	.loc 1 3957 22
	uxtb	r2, r2
	.loc 1 3957 20
	strb	r2, [r3]
	.loc 1 3958 13
	ldr	r3, [sp, #28]
	adds	r3, r3, #8
	movs	r2, #63
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	adds	r3, r3, #9
	movs	r2, #0
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	adds	r3, r3, #10
	movs	r2, #0
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	adds	r3, r3, #11
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 3959 13
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #28]
	adds	r3, r3, #12
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #20]
	uxth	r3, r3
	lsrs	r3, r3, #8
	uxth	r2, r3
	ldr	r3, [sp, #28]
	adds	r3, r3, #13
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #20]
	lsrs	r2, r3, #16
	ldr	r3, [sp, #28]
	adds	r3, r3, #14
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #20]
	lsrs	r2, r3, #24
	ldr	r3, [sp, #28]
	adds	r3, r3, #15
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 3960 13
	ldr	r3, [sp, #48]
	movs	r2, #85
	strb	r2, [r3, #562]
	ldr	r3, [sp, #48]
	movs	r2, #170
	strb	r2, [r3, #563]
	.loc 1 3961 36
	ldr	r3, [sp, #48]
	add	r1, r3, #52
	.loc 1 3961 17
	ldrb	r0, [sp, #83]	@ zero_extendqisi2
	movs	r3, #1
	movs	r2, #0
	bl	disk_write
	mov	r3, r0
	.loc 1 3961 16
	cmp	r3, #0
	beq	.L614
	.loc 1 3962 24
	movs	r3, #1
	b	.L638
.L614:
	.loc 1 3963 16
	movs	r3, #248
	strb	r3, [sp, #80]
.L613:
	.loc 1 3968 9
	ldr	r3, [sp, #48]
	adds	r3, r3, #52
	str	r3, [sp, #28]
	.loc 1 3969 5
	mov	r2, #512
	movs	r1, #0
	ldr	r0, [sp, #28]
	bl	mem_set
	.loc 1 3970 5
	movs	r2, #11
	ldr	r1, .L642+4
	ldr	r0, [sp, #28]
	bl	mem_cpy
	.loc 1 3971 7
	mov	r3, #512
	str	r3, [sp, #92]
	.loc 1 3972 5
	ldr	r3, [sp, #28]
	adds	r3, r3, #11
	ldr	r2, [sp, #92]
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #92]
	uxth	r3, r3
	lsrs	r3, r3, #8
	uxth	r2, r3
	ldr	r3, [sp, #28]
	adds	r3, r3, #12
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 3973 8
	ldr	r3, [sp, #28]
	adds	r3, r3, #13
	.loc 1 3973 27
	ldr	r2, [sp, #4]
	uxtb	r2, r2
	.loc 1 3973 25
	strb	r2, [r3]
	.loc 1 3974 5
	ldr	r3, [sp, #28]
	adds	r3, r3, #14
	ldr	r2, [sp, #64]
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #64]
	uxth	r3, r3
	lsrs	r3, r3, #8
	uxth	r2, r3
	ldr	r3, [sp, #28]
	adds	r3, r3, #15
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 3975 8
	ldr	r3, [sp, #28]
	adds	r3, r3, #16
	.loc 1 3975 22
	movs	r2, #1
	strb	r2, [r3]
	.loc 1 3976 31
	ldrb	r3, [sp, #47]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L615
	.loc 1 3976 31 is_stmt 0 discriminator 1
	movs	r3, #0
	b	.L616
.L615:
	.loc 1 3976 31 discriminator 2
	mov	r3, #512
.L616:
	.loc 1 3976 7 is_stmt 1 discriminator 4
	str	r3, [sp, #92]
	.loc 1 3977 5 discriminator 4
	ldr	r3, [sp, #28]
	adds	r3, r3, #17
	ldr	r2, [sp, #92]
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #92]
	uxth	r3, r3
	lsrs	r3, r3, #8
	uxth	r2, r3
	ldr	r3, [sp, #28]
	adds	r3, r3, #18
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 3978 15 discriminator 4
	ldr	r3, [sp, #20]
	.loc 1 3978 8 discriminator 4
	cmp	r3, #65536
	bcs	.L617
	.loc 1 3979 9
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #28]
	adds	r3, r3, #19
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #20]
	uxth	r3, r3
	lsrs	r3, r3, #8
	uxth	r2, r3
	ldr	r3, [sp, #28]
	adds	r3, r3, #20
	uxtb	r2, r2
	strb	r2, [r3]
	b	.L618
.L643:
	.align	2
.L642:
	.word	85284443
	.word	.LC1
.L617:
	.loc 1 3981 9
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #28]
	adds	r3, r3, #32
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #20]
	uxth	r3, r3
	lsrs	r3, r3, #8
	uxth	r2, r3
	ldr	r3, [sp, #28]
	adds	r3, r3, #33
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #20]
	lsrs	r2, r3, #16
	ldr	r3, [sp, #28]
	adds	r3, r3, #34
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #20]
	lsrs	r2, r3, #24
	ldr	r3, [sp, #28]
	adds	r3, r3, #35
	uxtb	r2, r2
	strb	r2, [r3]
.L618:
	.loc 1 3983 8
	ldr	r3, [sp, #28]
	adds	r3, r3, #21
	.loc 1 3983 20
	ldrb	r2, [sp, #80]
	strb	r2, [r3]
	.loc 1 3984 5
	ldr	r3, [sp, #28]
	adds	r3, r3, #24
	movs	r2, #63
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	adds	r3, r3, #25
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 3985 5
	ldr	r3, [sp, #28]
	adds	r3, r3, #26
	movs	r2, #255
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	adds	r3, r3, #27
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 3986 5
	ldr	r3, [sp, #28]
	adds	r3, r3, #28
	ldr	r2, [sp, #88]
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #88]
	uxth	r3, r3
	lsrs	r3, r3, #8
	uxth	r2, r3
	ldr	r3, [sp, #28]
	adds	r3, r3, #29
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #88]
	lsrs	r2, r3, #16
	ldr	r3, [sp, #28]
	adds	r3, r3, #30
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #88]
	lsrs	r2, r3, #24
	ldr	r3, [sp, #28]
	adds	r3, r3, #31
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 3987 9
	bl	get_fattime
	mov	r3, r0
	.loc 1 3987 7
	str	r3, [sp, #24]
	.loc 1 3988 8
	ldrb	r3, [sp, #47]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L619
	.loc 1 3989 9
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #28]
	adds	r3, r3, #67
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #24]
	uxth	r3, r3
	lsrs	r3, r3, #8
	uxth	r2, r3
	ldr	r3, [sp, #28]
	adds	r3, r3, #68
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #24]
	lsrs	r2, r3, #16
	ldr	r3, [sp, #28]
	adds	r3, r3, #69
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #24]
	lsrs	r2, r3, #24
	ldr	r3, [sp, #28]
	adds	r3, r3, #70
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 3990 9
	ldr	r3, [sp, #28]
	adds	r3, r3, #36
	ldr	r2, [sp, #60]
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #60]
	uxth	r3, r3
	lsrs	r3, r3, #8
	uxth	r2, r3
	ldr	r3, [sp, #28]
	adds	r3, r3, #37
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #60]
	lsrs	r2, r3, #16
	ldr	r3, [sp, #28]
	adds	r3, r3, #38
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #60]
	lsrs	r2, r3, #24
	ldr	r3, [sp, #28]
	adds	r3, r3, #39
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 3991 9
	ldr	r3, [sp, #28]
	adds	r3, r3, #44
	movs	r2, #2
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	adds	r3, r3, #45
	movs	r2, #0
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	adds	r3, r3, #46
	movs	r2, #0
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	adds	r3, r3, #47
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 3992 9
	ldr	r3, [sp, #28]
	adds	r3, r3, #48
	movs	r2, #1
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	adds	r3, r3, #49
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 3993 9
	ldr	r3, [sp, #28]
	adds	r3, r3, #50
	movs	r2, #6
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	adds	r3, r3, #51
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 3994 12
	ldr	r3, [sp, #28]
	adds	r3, r3, #64
	.loc 1 3994 26
	movs	r2, #128
	strb	r2, [r3]
	.loc 1 3995 12
	ldr	r3, [sp, #28]
	adds	r3, r3, #66
	.loc 1 3995 27
	movs	r2, #41
	strb	r2, [r3]
	.loc 1 3996 21
	ldr	r3, [sp, #28]
	adds	r3, r3, #71
	.loc 1 3996 9
	movs	r2, #19
	ldr	r1, .L644
	mov	r0, r3
	bl	mem_cpy
	b	.L620
.L619:
	.loc 1 3998 9
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #28]
	adds	r3, r3, #39
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #24]
	uxth	r3, r3
	lsrs	r3, r3, #8
	uxth	r2, r3
	ldr	r3, [sp, #28]
	adds	r3, r3, #40
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #24]
	lsrs	r2, r3, #16
	ldr	r3, [sp, #28]
	adds	r3, r3, #41
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #24]
	lsrs	r2, r3, #24
	ldr	r3, [sp, #28]
	adds	r3, r3, #42
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 3999 9
	ldr	r3, [sp, #28]
	adds	r3, r3, #22
	ldr	r2, [sp, #60]
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #60]
	uxth	r3, r3
	lsrs	r3, r3, #8
	uxth	r2, r3
	ldr	r3, [sp, #28]
	adds	r3, r3, #23
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 4000 12
	ldr	r3, [sp, #28]
	adds	r3, r3, #36
	.loc 1 4000 24
	movs	r2, #128
	strb	r2, [r3]
	.loc 1 4001 12
	ldr	r3, [sp, #28]
	adds	r3, r3, #38
	.loc 1 4001 25
	movs	r2, #41
	strb	r2, [r3]
	.loc 1 4002 21
	ldr	r3, [sp, #28]
	adds	r3, r3, #43
	.loc 1 4002 9
	movs	r2, #19
	ldr	r1, .L644+4
	mov	r0, r3
	bl	mem_cpy
.L620:
	.loc 1 4004 5
	ldr	r3, [sp, #28]
	add	r3, r3, #510
	movs	r2, #85
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	addw	r3, r3, #511
	movs	r2, #170
	strb	r2, [r3]
	.loc 1 4005 9
	ldrb	r0, [sp, #83]	@ zero_extendqisi2
	movs	r3, #1
	ldr	r2, [sp, #88]
	ldr	r1, [sp, #28]
	bl	disk_write
	mov	r3, r0
	.loc 1 4005 8
	cmp	r3, #0
	beq	.L621
	.loc 1 4006 16
	movs	r3, #1
	b	.L638
.L621:
	.loc 1 4007 8
	ldrb	r3, [sp, #47]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L622
	.loc 1 4008 37
	ldr	r3, [sp, #88]
	adds	r2, r3, #6
	.loc 1 4008 9
	ldrb	r0, [sp, #83]	@ zero_extendqisi2
	movs	r3, #1
	ldr	r1, [sp, #28]
	bl	disk_write
.L622:
	.loc 1 4011 11
	ldr	r3, [sp, #68]
	str	r3, [sp, #72]
	.loc 1 4012 12
	movs	r3, #0
	str	r3, [sp, #92]
	.loc 1 4012 5
	b	.L623
.L632:
	.loc 1 4013 9
	mov	r2, #512
	movs	r1, #0
	ldr	r0, [sp, #28]
	bl	mem_set
	.loc 1 4014 11
	ldrb	r3, [sp, #80]	@ zero_extendqisi2
	str	r3, [sp, #24]
	.loc 1 4015 12
	ldrb	r3, [sp, #47]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L624
	.loc 1 4016 49
	ldrb	r3, [sp, #47]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L625
	.loc 1 4016 49 is_stmt 0 discriminator 1
	ldr	r2, .L644+8
	b	.L626
.L625:
	.loc 1 4016 49 discriminator 2
	mvn	r2, #255
.L626:
	.loc 1 4016 15 is_stmt 1 discriminator 4
	ldr	r3, [sp, #24]
	orrs	r3, r3, r2
	str	r3, [sp, #24]
	.loc 1 4017 13 discriminator 4
	ldr	r3, [sp, #24]
	uxtb	r2, r3
	ldr	r3, [sp, #28]
	strb	r2, [r3]
	ldr	r3, [sp, #24]
	uxth	r3, r3
	lsrs	r3, r3, #8
	uxth	r2, r3
	ldr	r3, [sp, #28]
	adds	r3, r3, #1
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #24]
	lsrs	r2, r3, #16
	ldr	r3, [sp, #28]
	adds	r3, r3, #2
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #24]
	lsrs	r2, r3, #24
	ldr	r3, [sp, #28]
	adds	r3, r3, #3
	uxtb	r2, r2
	strb	r2, [r3]
	b	.L627
.L624:
	.loc 1 4019 15
	ldr	r3, [sp, #24]
	orn	r3, r3, #255
	str	r3, [sp, #24]
	.loc 1 4020 13
	ldr	r3, [sp, #24]
	uxtb	r2, r3
	ldr	r3, [sp, #28]
	strb	r2, [r3]
	ldr	r3, [sp, #24]
	uxth	r3, r3
	lsrs	r3, r3, #8
	uxth	r2, r3
	ldr	r3, [sp, #28]
	adds	r3, r3, #1
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #24]
	lsrs	r2, r3, #16
	ldr	r3, [sp, #28]
	adds	r3, r3, #2
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #24]
	lsrs	r2, r3, #24
	ldr	r3, [sp, #28]
	adds	r3, r3, #3
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 4021 13
	ldr	r3, [sp, #28]
	adds	r3, r3, #4
	movs	r2, #255
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	adds	r3, r3, #5
	movs	r2, #255
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	adds	r3, r3, #6
	movs	r2, #255
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	adds	r3, r3, #7
	movs	r2, #255
	strb	r2, [r3]
	.loc 1 4022 13
	ldr	r3, [sp, #28]
	adds	r3, r3, #8
	movs	r2, #255
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	adds	r3, r3, #9
	movs	r2, #255
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	adds	r3, r3, #10
	movs	r2, #255
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	adds	r3, r3, #11
	movs	r2, #15
	strb	r2, [r3]
.L627:
	.loc 1 4024 13
	ldr	r2, [sp, #72]
	adds	r3, r2, #1
	str	r3, [sp, #72]
	ldrb	r0, [sp, #83]	@ zero_extendqisi2
	movs	r3, #1
	ldr	r1, [sp, #28]
	bl	disk_write
	mov	r3, r0
	.loc 1 4024 12
	cmp	r3, #0
	beq	.L628
	.loc 1 4025 20
	movs	r3, #1
	b	.L638
.L628:
	.loc 1 4026 9
	mov	r2, #512
	movs	r1, #0
	ldr	r0, [sp, #28]
	bl	mem_set
	.loc 1 4027 16
	movs	r3, #1
	str	r3, [sp, #24]
	.loc 1 4027 9
	b	.L629
.L631:
	.loc 1 4028 17
	ldr	r2, [sp, #72]
	adds	r3, r2, #1
	str	r3, [sp, #72]
	ldrb	r0, [sp, #83]	@ zero_extendqisi2
	movs	r3, #1
	ldr	r1, [sp, #28]
	bl	disk_write
	mov	r3, r0
	.loc 1 4028 16
	cmp	r3, #0
	beq	.L630
	.loc 1 4029 24
	movs	r3, #1
	b	.L638
.L630:
	.loc 1 4027 33 discriminator 2
	ldr	r3, [sp, #24]
	adds	r3, r3, #1
	str	r3, [sp, #24]
.L629:
	.loc 1 4027 23 discriminator 1
	ldr	r3, [sp, #24]
	.loc 1 4027 9 discriminator 1
	ldr	r2, [sp, #60]
	cmp	r2, r3
	bhi	.L631
	.loc 1 4012 30 discriminator 2
	ldr	r3, [sp, #92]
	adds	r3, r3, #1
	str	r3, [sp, #92]
.L623:
	.loc 1 4012 5 discriminator 1
	ldr	r3, [sp, #92]
	cmp	r3, #0
	beq	.L632
	.loc 1 4034 32
	ldrb	r3, [sp, #47]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L633
	.loc 1 4034 32 is_stmt 0 discriminator 1
	ldr	r3, [sp, #4]
	b	.L634
.L633:
	.loc 1 4034 32 discriminator 2
	ldr	r3, [sp, #56]
.L634:
	.loc 1 4034 7 is_stmt 1 discriminator 4
	str	r3, [sp, #92]
.L636:
	.loc 1 4036 13
	ldr	r2, [sp, #72]
	adds	r3, r2, #1
	str	r3, [sp, #72]
	ldrb	r0, [sp, #83]	@ zero_extendqisi2
	movs	r3, #1
	ldr	r1, [sp, #28]
	bl	disk_write
	mov	r3, r0
	.loc 1 4036 12
	cmp	r3, #0
	beq	.L635
	.loc 1 4037 20
	movs	r3, #1
	b	.L638
.L645:
	.align	2
.L644:
	.word	.LC2
	.word	.LC3
	.word	16776960
.L635:
	.loc 1 4038 5
	ldr	r3, [sp, #92]
	subs	r3, r3, #1
	str	r3, [sp, #92]
	ldr	r3, [sp, #92]
	cmp	r3, #0
	bne	.L636
	.loc 1 4048 8
	ldrb	r3, [sp, #47]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L637
	.loc 1 4049 9
	ldr	r3, [sp, #28]
	movs	r2, #82
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	adds	r3, r3, #1
	movs	r2, #82
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	adds	r3, r3, #2
	movs	r2, #97
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	adds	r3, r3, #3
	movs	r2, #65
	strb	r2, [r3]
	.loc 1 4050 9
	ldr	r3, [sp, #28]
	add	r3, r3, #484
	movs	r2, #114
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	addw	r3, r3, #485
	movs	r2, #114
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	add	r3, r3, #486
	movs	r2, #65
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	addw	r3, r3, #487
	movs	r2, #97
	strb	r2, [r3]
	.loc 1 4051 9
	ldr	r3, [sp, #40]
	uxtb	r2, r3
	ldr	r3, [sp, #28]
	add	r3, r3, #488
	subs	r2, r2, #1
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #40]
	uxth	r3, r3
	subs	r3, r3, #1
	uxth	r3, r3
	lsrs	r3, r3, #8
	uxth	r2, r3
	ldr	r3, [sp, #28]
	addw	r3, r3, #489
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #40]
	subs	r3, r3, #1
	lsrs	r2, r3, #16
	ldr	r3, [sp, #28]
	add	r3, r3, #490
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [sp, #40]
	subs	r3, r3, #1
	lsrs	r2, r3, #24
	ldr	r3, [sp, #28]
	addw	r3, r3, #491
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 4052 9
	ldr	r3, [sp, #28]
	add	r3, r3, #492
	movs	r2, #2
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	addw	r3, r3, #493
	movs	r2, #0
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	add	r3, r3, #494
	movs	r2, #0
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	addw	r3, r3, #495
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 4053 9
	ldr	r3, [sp, #28]
	add	r3, r3, #510
	movs	r2, #85
	strb	r2, [r3]
	ldr	r3, [sp, #28]
	addw	r3, r3, #511
	movs	r2, #170
	strb	r2, [r3]
	.loc 1 4054 37
	ldr	r3, [sp, #88]
	adds	r2, r3, #1
	.loc 1 4054 9
	ldrb	r0, [sp, #83]	@ zero_extendqisi2
	movs	r3, #1
	ldr	r1, [sp, #28]
	bl	disk_write
	.loc 1 4055 37
	ldr	r3, [sp, #88]
	adds	r2, r3, #7
	.loc 1 4055 9
	ldrb	r0, [sp, #83]	@ zero_extendqisi2
	movs	r3, #1
	ldr	r1, [sp, #28]
	bl	disk_write
.L637:
	.loc 1 4058 13
	ldrb	r3, [sp, #83]	@ zero_extendqisi2
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl	disk_ioctl
	mov	r3, r0
	.loc 1 4058 63
	cmp	r3, #0
	ite	ne
	movne	r3, #1
	moveq	r3, #0
	uxtb	r3, r3
.L638:
	.loc 1 4059 1 discriminator 1
	mov	r0, r3
	add	sp, sp, #100
.LCFI142:
	@ sp needed
	ldr	pc, [sp], #4
.LFE50:
	.size	f_mkfs, .-f_mkfs
	.section	.text.f_gets,"ax",%progbits
	.align	1
	.global	f_gets
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	f_gets, %function
f_gets:
.LFB51:
	.loc 1 4139 1
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI143:
	sub	sp, sp, #36
.LCFI144:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 4140 9
	movs	r3, #0
	str	r3, [sp, #28]
	.loc 1 4141 15
	ldr	r3, [sp, #12]
	str	r3, [sp, #24]
	.loc 1 4145 11
	b	.L647
.L650:
	.loc 1 4190 9
	add	r3, sp, #16
	add	r1, sp, #20
	movs	r2, #1
	ldr	r0, [sp, #4]
	bl	f_read
	.loc 1 4191 16
	ldr	r3, [sp, #16]
	.loc 1 4191 12
	cmp	r3, #1
	bne	.L654
	.loc 1 4192 11
	ldrb	r3, [sp, #20]
	strb	r3, [sp, #23]
	.loc 1 4195 11
	ldr	r3, [sp, #24]
	adds	r2, r3, #1
	str	r2, [sp, #24]
	.loc 1 4195 14
	ldrb	r2, [sp, #23]
	strb	r2, [r3]
	.loc 1 4196 10
	ldr	r3, [sp, #28]
	adds	r3, r3, #1
	str	r3, [sp, #28]
	.loc 1 4197 12
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	cmp	r3, #10
	beq	.L655
.L647:
	.loc 1 4145 20
	ldr	r3, [sp, #8]
	subs	r3, r3, #1
	.loc 1 4145 11
	ldr	r2, [sp, #28]
	cmp	r2, r3
	blt	.L650
	b	.L649
.L654:
	.loc 1 4191 9
	nop
	b	.L649
.L655:
	.loc 1 4197 9
	nop
.L649:
	.loc 1 4199 8
	ldr	r3, [sp, #24]
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 4200 21
	ldr	r3, [sp, #28]
	cmp	r3, #0
	beq	.L651
	.loc 1 4200 21 is_stmt 0 discriminator 1
	ldr	r3, [sp, #12]
	b	.L653
.L651:
	.loc 1 4200 21 discriminator 2
	movs	r3, #0
.L653:
	.loc 1 4201 1 is_stmt 1
	mov	r0, r3
	add	sp, sp, #36
.LCFI145:
	@ sp needed
	ldr	pc, [sp], #4
.LFE51:
	.size	f_gets, .-f_gets
	.section	.text.putc_bfd,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	putc_bfd, %function
putc_bfd:
.LFB52:
	.loc 1 4220 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI146:
	sub	sp, sp, #20
.LCFI147:
	str	r0, [sp, #4]
	mov	r3, r1
	strb	r3, [sp, #3]
	.loc 1 4227 7
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]
	str	r3, [sp, #12]
	.loc 1 4228 8
	ldr	r3, [sp, #12]
	cmp	r3, #0
	blt	.L662
	.loc 1 4257 14
	ldr	r3, [sp, #12]
	adds	r2, r3, #1
	str	r2, [sp, #12]
	.loc 1 4257 18
	ldr	r2, [sp, #4]
	add	r3, r3, r2
	ldrb	r2, [sp, #3]
	strb	r2, [r3, #12]
	.loc 1 4260 8
	ldr	r3, [sp, #12]
	cmp	r3, #60
	ble	.L659
	.loc 1 4261 9
	ldr	r3, [sp, #4]
	ldr	r0, [r3]
	.loc 1 4261 27
	ldr	r3, [sp, #4]
	add	r1, r3, #12
	.loc 1 4261 9
	ldr	r2, [sp, #12]
	add	r3, sp, #8
	bl	f_write
	.loc 1 4262 17
	ldr	r2, [sp, #8]
	.loc 1 4262 20
	ldr	r3, [sp, #12]
	.loc 1 4262 33
	cmp	r2, r3
	bne	.L660
	.loc 1 4262 33 is_stmt 0 discriminator 1
	movs	r3, #0
	b	.L661
.L660:
	.loc 1 4262 33 discriminator 2
	mov	r3, #-1
.L661:
	.loc 1 4262 11 is_stmt 1 discriminator 4
	str	r3, [sp, #12]
.L659:
	.loc 1 4264 13
	ldr	r3, [sp, #4]
	ldr	r2, [sp, #12]
	str	r2, [r3, #4]
	.loc 1 4265 7
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #8]
	.loc 1 4265 13
	adds	r2, r3, #1
	ldr	r3, [sp, #4]
	str	r2, [r3, #8]
	b	.L656
.L662:
	.loc 1 4228 16
	nop
.L656:
	.loc 1 4266 1
	add	sp, sp, #20
.LCFI148:
	@ sp needed
	ldr	pc, [sp], #4
.LFE52:
	.size	putc_bfd, .-putc_bfd
	.section	.text.f_putc,"ax",%progbits
	.align	1
	.global	f_putc
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	f_putc, %function
f_putc:
.LFB53:
	.loc 1 4272 1
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
.LCFI149:
	sub	sp, sp, #88
.LCFI150:
	mov	r3, r0
	str	r1, [sp]
	strb	r3, [sp, #7]
	.loc 1 4276 11
	ldr	r3, [sp]
	str	r3, [sp, #12]
	.loc 1 4277 22
	movs	r3, #0
	str	r3, [sp, #16]
	.loc 1 4277 17
	ldr	r3, [sp, #16]
	.loc 1 4277 13
	str	r3, [sp, #20]
	.loc 1 4279 5
	ldrb	r2, [sp, #7]	@ zero_extendqisi2
	add	r3, sp, #12
	mov	r1, r2
	mov	r0, r3
	bl	putc_bfd
	.loc 1 4281 14
	ldr	r3, [sp, #16]
	.loc 1 4281 8
	cmp	r3, #0
	blt	.L664
	.loc 1 4282 12
	ldr	r0, [sp, #12]
	.loc 1 4282 43
	ldr	r3, [sp, #16]
	.loc 1 4282 12
	mov	r4, r3
	add	r2, sp, #8
	add	r3, sp, #12
	add	r1, r3, #12
	mov	r3, r2
	mov	r2, r4
	bl	f_write
	mov	r3, r0
	.loc 1 4282 9
	cmp	r3, #0
	bne	.L664
	.loc 1 4283 20
	ldr	r3, [sp, #16]
	.loc 1 4283 25
	ldr	r2, [sp, #8]
	.loc 1 4283 9
	cmp	r3, r2
	bne	.L664
	.loc 1 4283 41 discriminator 1
	ldr	r3, [sp, #20]
	b	.L666
.L664:
	.loc 1 4284 12
	mov	r3, #-1
.L666:
	.loc 1 4285 1 discriminator 1
	mov	r0, r3
	add	sp, sp, #88
.LCFI151:
	@ sp needed
	pop	{r4, pc}
.LFE53:
	.size	f_putc, .-f_putc
	.section	.text.f_puts,"ax",%progbits
	.align	1
	.global	f_puts
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	f_puts, %function
f_puts:
.LFB54:
	.loc 1 4295 1
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
.LCFI152:
	sub	sp, sp, #88
.LCFI153:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 4299 11
	ldr	r3, [sp]
	str	r3, [sp, #12]
	.loc 1 4300 22
	movs	r3, #0
	str	r3, [sp, #16]
	.loc 1 4300 17
	ldr	r3, [sp, #16]
	.loc 1 4300 13
	str	r3, [sp, #20]
	.loc 1 4302 11
	b	.L668
.L669:
	.loc 1 4303 27
	ldr	r3, [sp, #4]
	adds	r2, r3, #1
	str	r2, [sp, #4]
	.loc 1 4303 9
	ldrb	r2, [r3]	@ zero_extendqisi2
	add	r3, sp, #12
	mov	r1, r2
	mov	r0, r3
	bl	putc_bfd
.L668:
	.loc 1 4302 12
	ldr	r3, [sp, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 4302 11
	cmp	r3, #0
	bne	.L669
	.loc 1 4305 14
	ldr	r3, [sp, #16]
	.loc 1 4305 8
	cmp	r3, #0
	blt	.L670
	.loc 1 4306 12
	ldr	r0, [sp, #12]
	.loc 1 4306 43
	ldr	r3, [sp, #16]
	.loc 1 4306 12
	mov	r4, r3
	add	r2, sp, #8
	add	r3, sp, #12
	add	r1, r3, #12
	mov	r3, r2
	mov	r2, r4
	bl	f_write
	mov	r3, r0
	.loc 1 4306 9
	cmp	r3, #0
	bne	.L670
	.loc 1 4307 20
	ldr	r3, [sp, #16]
	.loc 1 4307 25
	ldr	r2, [sp, #8]
	.loc 1 4307 9
	cmp	r3, r2
	bne	.L670
	.loc 1 4307 41 discriminator 1
	ldr	r3, [sp, #20]
	b	.L672
.L670:
	.loc 1 4308 12
	mov	r3, #-1
.L672:
	.loc 1 4309 1 discriminator 1
	mov	r0, r3
	add	sp, sp, #88
.LCFI154:
	@ sp needed
	pop	{r4, pc}
.LFE54:
	.size	f_puts, .-f_puts
	.section	.text.f_printf,"ax",%progbits
	.align	1
	.global	f_printf
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	f_printf, %function
f_printf:
.LFB55:
	.loc 1 4320 1
	@ args = 4, pretend = 12, frame = 136
	@ frame_needed = 0, uses_anonymous_args = 1
	push	{r1, r2, r3}
.LCFI155:
	push	{r4, lr}
.LCFI156:
	sub	sp, sp, #140
.LCFI157:
	str	r0, [sp, #4]
	.loc 1 4328 11
	ldr	r3, [sp, #4]
	str	r3, [sp, #8]
	.loc 1 4329 22
	movs	r3, #0
	str	r3, [sp, #12]
	.loc 1 4329 17
	ldr	r3, [sp, #12]
	.loc 1 4329 13
	str	r3, [sp, #16]
	.loc 1 4331 5
	add	r3, sp, #152
	str	r3, [sp, #104]
.L724:
	.loc 1 4334 17
	ldr	r3, [sp, #148]
	adds	r2, r3, #1
	str	r2, [sp, #148]
	.loc 1 4334 11
	ldrb	r3, [r3]
	strb	r3, [sp, #115]
	.loc 1 4335 12
	ldrb	r3, [sp, #115]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L728
	.loc 1 4336 12
	ldrb	r3, [sp, #115]	@ zero_extendqisi2
	cmp	r3, #37
	beq	.L676
	.loc 1 4337 13
	ldrb	r2, [sp, #115]	@ zero_extendqisi2
	add	r3, sp, #8
	mov	r1, r2
	mov	r0, r3
	bl	putc_bfd
	.loc 1 4338 13
	b	.L677
.L676:
	.loc 1 4340 15
	movs	r3, #0
	strb	r3, [sp, #135]
	.loc 1 4340 11
	movs	r3, #0
	str	r3, [sp, #120]
	.loc 1 4341 17
	ldr	r3, [sp, #148]
	adds	r2, r3, #1
	str	r2, [sp, #148]
	.loc 1 4341 11
	ldrb	r3, [r3]
	strb	r3, [sp, #115]
	.loc 1 4342 12
	ldrb	r3, [sp, #115]	@ zero_extendqisi2
	cmp	r3, #48
	bne	.L678
	.loc 1 4343 15
	movs	r3, #1
	strb	r3, [sp, #135]
	.loc 1 4343 28
	ldr	r3, [sp, #148]
	adds	r2, r3, #1
	str	r2, [sp, #148]
	.loc 1 4343 22
	ldrb	r3, [r3]
	strb	r3, [sp, #115]
	b	.L680
.L678:
	.loc 1 4345 16
	ldrb	r3, [sp, #115]	@ zero_extendqisi2
	cmp	r3, #45
	bne	.L680
	.loc 1 4346 19
	movs	r3, #2
	strb	r3, [sp, #135]
	.loc 1 4346 32
	ldr	r3, [sp, #148]
	adds	r2, r3, #1
	str	r2, [sp, #148]
	.loc 1 4346 26
	ldrb	r3, [r3]
	strb	r3, [sp, #115]
	.loc 1 4349 15
	b	.L680
.L682:
	.loc 1 4350 19
	ldr	r2, [sp, #120]
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r3, r3, #1
	mov	r2, r3
	.loc 1 4350 24
	ldrb	r3, [sp, #115]	@ zero_extendqisi2
	add	r3, r3, r2
	.loc 1 4350 15
	subs	r3, r3, #48
	str	r3, [sp, #120]
	.loc 1 4351 21
	ldr	r3, [sp, #148]
	adds	r2, r3, #1
	str	r2, [sp, #148]
	.loc 1 4351 15
	ldrb	r3, [r3]
	strb	r3, [sp, #115]
.L680:
	.loc 1 4349 15
	ldrb	r3, [sp, #115]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L681
	.loc 1 4349 16 discriminator 1
	ldrb	r3, [sp, #115]	@ zero_extendqisi2
	cmp	r3, #57
	bls	.L682
.L681:
	.loc 1 4353 12
	ldrb	r3, [sp, #115]	@ zero_extendqisi2
	cmp	r3, #108
	beq	.L683
	.loc 1 4353 22 discriminator 1
	ldrb	r3, [sp, #115]	@ zero_extendqisi2
	cmp	r3, #76
	bne	.L684
.L683:
	.loc 1 4354 15
	ldrb	r3, [sp, #135]
	orr	r3, r3, #4
	strb	r3, [sp, #135]
	.loc 1 4354 29
	ldr	r3, [sp, #148]
	adds	r2, r3, #1
	str	r2, [sp, #148]
	.loc 1 4354 23
	ldrb	r3, [r3]
	strb	r3, [sp, #115]
.L684:
	.loc 1 4356 12
	ldrb	r3, [sp, #115]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L729
	.loc 1 4357 11
	ldrb	r3, [sp, #115]
	strb	r3, [sp, #114]
	.loc 1 4358 12
	ldrb	r3, [sp, #114]	@ zero_extendqisi2
	cmp	r3, #96
	bls	.L686
	.loc 1 4358 13 discriminator 1
	ldrb	r3, [sp, #114]	@ zero_extendqisi2
	cmp	r3, #122
	bhi	.L686
	.loc 1 4358 27 discriminator 2
	ldrb	r3, [sp, #114]
	subs	r3, r3, #32
	strb	r3, [sp, #114]
.L686:
	.loc 1 4359 9
	ldrb	r3, [sp, #114]	@ zero_extendqisi2
	subs	r3, r3, #66
	cmp	r3, #22
	bhi	.L687
	adr	r2, .L689
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L689:
	.word	.L694+1
	.word	.L693+1
	.word	.L690+1
	.word	.L687+1
	.word	.L687+1
	.word	.L687+1
	.word	.L687+1
	.word	.L687+1
	.word	.L687+1
	.word	.L687+1
	.word	.L687+1
	.word	.L687+1
	.word	.L687+1
	.word	.L692+1
	.word	.L687+1
	.word	.L687+1
	.word	.L687+1
	.word	.L691+1
	.word	.L687+1
	.word	.L690+1
	.word	.L687+1
	.word	.L687+1
	.word	.L688+1
	.p2align 1
.L691:
	.loc 1 4361 15
	ldr	r3, [sp, #104]
	adds	r2, r3, #4
	str	r2, [sp, #104]
	ldr	r3, [r3]
	str	r3, [sp, #108]
	.loc 1 4362 20
	movs	r3, #0
	str	r3, [sp, #124]
	.loc 1 4362 13
	b	.L695
.L696:
	.loc 1 4362 32 discriminator 3
	ldr	r3, [sp, #124]
	adds	r3, r3, #1
	str	r3, [sp, #124]
.L695:
	.loc 1 4362 26 discriminator 1
	ldr	r2, [sp, #108]
	ldr	r3, [sp, #124]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 4362 13 discriminator 1
	cmp	r3, #0
	bne	.L696
	.loc 1 4363 21
	ldrb	r3, [sp, #135]	@ zero_extendqisi2
	and	r3, r3, #2
	.loc 1 4363 16
	cmp	r3, #0
	bne	.L700
	.loc 1 4364 23
	b	.L698
.L699:
	.loc 1 4364 33 discriminator 2
	add	r3, sp, #8
	movs	r1, #32
	mov	r0, r3
	bl	putc_bfd
.L698:
	.loc 1 4364 25 discriminator 1
	ldr	r3, [sp, #124]
	adds	r2, r3, #1
	str	r2, [sp, #124]
	.loc 1 4364 23 discriminator 1
	ldr	r2, [sp, #120]
	cmp	r2, r3
	bhi	.L699
	.loc 1 4366 19
	b	.L700
.L701:
	.loc 1 4366 40 discriminator 2
	ldr	r3, [sp, #108]
	adds	r2, r3, #1
	str	r2, [sp, #108]
	.loc 1 4366 24 discriminator 2
	ldrb	r2, [r3]	@ zero_extendqisi2
	add	r3, sp, #8
	mov	r1, r2
	mov	r0, r3
	bl	putc_bfd
.L700:
	.loc 1 4366 20 discriminator 1
	ldr	r3, [sp, #108]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 4366 19 discriminator 1
	cmp	r3, #0
	bne	.L701
	.loc 1 4367 19
	b	.L702
.L703:
	.loc 1 4367 29 discriminator 2
	add	r3, sp, #8
	movs	r1, #32
	mov	r0, r3
	bl	putc_bfd
.L702:
	.loc 1 4367 21 discriminator 1
	ldr	r3, [sp, #124]
	adds	r2, r3, #1
	str	r2, [sp, #124]
	.loc 1 4367 19 discriminator 1
	ldr	r2, [sp, #120]
	cmp	r2, r3
	bhi	.L703
	.loc 1 4368 13
	b	.L677
.L693:
	.loc 1 4370 46
	ldr	r3, [sp, #104]
	adds	r2, r3, #4
	str	r2, [sp, #104]
	ldr	r3, [r3]
	.loc 1 4370 13
	uxtb	r2, r3
	add	r3, sp, #8
	mov	r1, r2
	mov	r0, r3
	bl	putc_bfd
	b	.L677
.L694:
	.loc 1 4372 15
	movs	r3, #2
	strb	r3, [sp, #134]
	.loc 1 4372 13
	b	.L704
.L692:
	.loc 1 4374 15
	movs	r3, #8
	strb	r3, [sp, #134]
	.loc 1 4374 13
	b	.L704
.L690:
	.loc 1 4377 15
	movs	r3, #10
	strb	r3, [sp, #134]
	.loc 1 4377 13
	b	.L704
.L688:
	.loc 1 4379 15
	movs	r3, #16
	strb	r3, [sp, #134]
	.loc 1 4379 13
	b	.L704
.L687:
	.loc 1 4381 13
	ldrb	r2, [sp, #115]	@ zero_extendqisi2
	add	r3, sp, #8
	mov	r1, r2
	mov	r0, r3
	bl	putc_bfd
	b	.L677
.L704:
	.loc 1 4385 16
	ldrb	r3, [sp, #135]	@ zero_extendqisi2
	and	r3, r3, #4
	.loc 1 4385 48
	cmp	r3, #0
	beq	.L705
	.loc 1 4385 42
	ldr	r3, [sp, #104]
	adds	r2, r3, #4
	str	r2, [sp, #104]
	ldr	r3, [r3]
	b	.L706
.L705:
	.loc 1 4385 94 discriminator 2
	ldrb	r3, [sp, #114]	@ zero_extendqisi2
	cmp	r3, #68
	bne	.L707
	.loc 1 4385 89
	ldr	r3, [sp, #104]
	adds	r2, r3, #4
	str	r2, [sp, #104]
	ldr	r3, [r3]
	b	.L706
.L707:
	.loc 1 4385 94
	ldr	r3, [sp, #104]
	adds	r2, r3, #4
	str	r2, [sp, #104]
	ldr	r3, [r3]
.L706:
	.loc 1 4385 11 discriminator 8
	str	r3, [sp, #116]
	.loc 1 4386 12 discriminator 8
	ldrb	r3, [sp, #114]	@ zero_extendqisi2
	cmp	r3, #68
	bne	.L709
	.loc 1 4386 22 discriminator 1
	ldr	r3, [sp, #116]
	cmp	r3, #0
	bge	.L709
	.loc 1 4387 15
	ldr	r3, [sp, #116]
	rsbs	r3, r3, #0
	str	r3, [sp, #116]
	.loc 1 4388 15
	ldrb	r3, [sp, #135]
	orr	r3, r3, #8
	strb	r3, [sp, #135]
.L709:
	.loc 1 4390 11
	movs	r3, #0
	str	r3, [sp, #128]
.L714:
	.loc 1 4392 27
	ldrb	r2, [sp, #134]	@ zero_extendqisi2
	ldr	r3, [sp, #116]
	udiv	r1, r3, r2
	mul	r2, r1, r2
	subs	r3, r3, r2
	.loc 1 4392 15
	strb	r3, [sp, #114]
	.loc 1 4392 35
	ldrb	r3, [sp, #134]	@ zero_extendqisi2
	ldr	r2, [sp, #116]
	udiv	r3, r2, r3
	str	r3, [sp, #116]
	.loc 1 4393 16
	ldrb	r3, [sp, #114]	@ zero_extendqisi2
	cmp	r3, #9
	bls	.L710
	.loc 1 4393 26 discriminator 1
	ldrb	r3, [sp, #115]	@ zero_extendqisi2
	cmp	r3, #120
	bne	.L711
	.loc 1 4393 26 is_stmt 0 discriminator 2
	movs	r2, #39
	b	.L712
.L711:
	.loc 1 4393 26 discriminator 3
	movs	r2, #7
.L712:
	.loc 1 4393 26 discriminator 5
	ldrb	r3, [sp, #114]
	add	r3, r3, r2
	strb	r3, [sp, #114]
.L710:
	.loc 1 4394 16 is_stmt 1
	ldr	r3, [sp, #128]
	adds	r2, r3, #1
	str	r2, [sp, #128]
	.loc 1 4394 24
	ldrb	r2, [sp, #114]
	adds	r2, r2, #48
	uxtb	r2, r2
	.loc 1 4394 20
	add	r1, sp, #136
	add	r3, r3, r1
	strb	r2, [r3, #-52]
	.loc 1 4395 9
	ldr	r3, [sp, #116]
	cmp	r3, #0
	beq	.L713
	.loc 1 4395 20 discriminator 1
	ldr	r3, [sp, #128]
	cmp	r3, #15
	bls	.L714
.L713:
	.loc 1 4396 15
	ldrb	r3, [sp, #135]	@ zero_extendqisi2
	and	r3, r3, #8
	.loc 1 4396 12
	cmp	r3, #0
	beq	.L715
	.loc 1 4396 23 discriminator 1
	ldr	r3, [sp, #128]
	adds	r2, r3, #1
	str	r2, [sp, #128]
	.loc 1 4396 27 discriminator 1
	add	r2, sp, #136
	add	r3, r3, r2
	movs	r2, #45
	strb	r2, [r3, #-52]
.L715:
	.loc 1 4397 11
	ldr	r3, [sp, #128]
	str	r3, [sp, #124]
	.loc 1 4397 23
	ldrb	r3, [sp, #135]	@ zero_extendqisi2
	and	r3, r3, #1
	.loc 1 4397 18
	cmp	r3, #0
	beq	.L716
	.loc 1 4397 18 is_stmt 0 discriminator 1
	movs	r3, #48
	b	.L717
.L716:
	.loc 1 4397 18 discriminator 2
	movs	r3, #32
.L717:
	.loc 1 4397 18 discriminator 4
	strb	r3, [sp, #114]
	.loc 1 4398 15 is_stmt 1 discriminator 4
	b	.L718
.L720:
	.loc 1 4398 37 discriminator 3
	ldrb	r2, [sp, #114]	@ zero_extendqisi2
	add	r3, sp, #8
	mov	r1, r2
	mov	r0, r3
	bl	putc_bfd
.L718:
	.loc 1 4398 20 discriminator 1
	ldrb	r3, [sp, #135]	@ zero_extendqisi2
	and	r3, r3, #2
	.loc 1 4398 15 discriminator 1
	cmp	r3, #0
	bne	.L721
	.loc 1 4398 29 discriminator 2
	ldr	r3, [sp, #124]
	adds	r2, r3, #1
	str	r2, [sp, #124]
	.loc 1 4398 25 discriminator 2
	ldr	r2, [sp, #120]
	cmp	r2, r3
	bhi	.L720
.L721:
	.loc 1 4399 12 discriminator 1
	ldr	r3, [sp, #128]
	subs	r3, r3, #1
	str	r3, [sp, #128]
	add	r2, sp, #84
	ldr	r3, [sp, #128]
	add	r3, r3, r2
	ldrb	r2, [r3]	@ zero_extendqisi2
	add	r3, sp, #8
	mov	r1, r2
	mov	r0, r3
	bl	putc_bfd
	.loc 1 4399 9 discriminator 1
	ldr	r3, [sp, #128]
	cmp	r3, #0
	bne	.L721
	.loc 1 4400 15
	b	.L722
.L723:
	.loc 1 4400 25 discriminator 2
	ldrb	r2, [sp, #114]	@ zero_extendqisi2
	add	r3, sp, #8
	mov	r1, r2
	mov	r0, r3
	bl	putc_bfd
.L722:
	.loc 1 4400 17 discriminator 1
	ldr	r3, [sp, #124]
	adds	r2, r3, #1
	str	r2, [sp, #124]
	.loc 1 4400 15 discriminator 1
	ldr	r2, [sp, #120]
	cmp	r2, r3
	bhi	.L723
.L677:
	.loc 1 4334 11
	b	.L724
.L728:
	.loc 1 4335 9
	nop
	b	.L675
.L729:
	.loc 1 4356 9
	nop
.L675:
	.loc 1 4405 14
	ldr	r3, [sp, #12]
	.loc 1 4405 8
	cmp	r3, #0
	blt	.L725
	.loc 1 4406 12
	ldr	r0, [sp, #8]
	.loc 1 4406 43
	ldr	r3, [sp, #12]
	.loc 1 4406 12
	mov	r4, r3
	add	r2, sp, #100
	add	r3, sp, #8
	add	r1, r3, #12
	mov	r3, r2
	mov	r2, r4
	bl	f_write
	mov	r3, r0
	.loc 1 4406 9
	cmp	r3, #0
	bne	.L725
	.loc 1 4407 20
	ldr	r3, [sp, #12]
	.loc 1 4407 25
	ldr	r2, [sp, #100]
	.loc 1 4407 9
	cmp	r3, r2
	bne	.L725
	.loc 1 4407 41 discriminator 1
	ldr	r3, [sp, #16]
	b	.L727
.L725:
	.loc 1 4408 12
	mov	r3, #-1
.L727:
	.loc 1 4409 1 discriminator 1
	mov	r0, r3
	add	sp, sp, #140
.LCFI158:
	@ sp needed
	pop	{r4, lr}
.LCFI159:
	add	sp, sp, #12
.LCFI160:
	bx	lr
.LFE55:
	.size	f_printf, .-f_printf
	.section	.rodata.vst.1,"a"
	.align	2
	.type	vst.1, %object
	.size	vst.1, 22
vst.1:
	.short	1024
	.short	512
	.short	256
	.short	128
	.short	64
	.short	32
	.short	16
	.short	8
	.short	4
	.short	2
	.short	0
	.section	.rodata.cst.0,"a"
	.align	2
	.type	cst.0, %object
	.size	cst.0, 22
cst.0:
	.short	-32768
	.short	16384
	.short	8192
	.short	4096
	.short	2048
	.short	16384
	.short	8192
	.short	4096
	.short	2048
	.short	1024
	.short	512
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
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI2-.LFB1
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI4-.LFB2
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI6-.LFB3
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI8-.LFB4
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI9-.LCFI8
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI11-.LFB5
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI12-.LCFI11
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
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
	.4byte	.LCFI14-.LFB6
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI15-.LCFI14
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
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
	.4byte	.LCFI17-.LFB7
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI18-.LCFI17
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.byte	0x4
	.4byte	.LCFI19-.LFB8
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI20-.LCFI19
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI21-.LCFI20
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
	.4byte	.LCFI22-.LFB9
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI23-.LCFI22
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI24-.LCFI23
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
	.4byte	.LCFI25-.LFB10
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI26-.LCFI25
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI27-.LCFI26
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
	.4byte	.LCFI28-.LFB11
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI29-.LCFI28
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI30-.LCFI29
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
	.4byte	.LCFI31-.LFB12
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI32-.LCFI31
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.byte	0x4
	.4byte	.LCFI33-.LFB13
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI34-.LCFI33
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI35-.LCFI34
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
	.4byte	.LCFI36-.LFB14
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI37-.LCFI36
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI38-.LCFI37
	.byte	0xe
	.uleb128 0x8
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.byte	0x4
	.4byte	.LCFI39-.LFB15
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI40-.LCFI39
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI41-.LCFI40
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.byte	0x4
	.4byte	.LCFI42-.LFB16
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI43-.LCFI42
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.byte	0x4
	.4byte	.LCFI44-.LFB17
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI45-.LCFI44
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.byte	0x4
	.4byte	.LCFI46-.LFB18
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
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.byte	0x4
	.4byte	.LCFI49-.LFB19
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
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.byte	0x4
	.4byte	.LCFI52-.LFB20
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI53-.LCFI52
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI54-.LCFI53
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
	.4byte	.LCFI55-.LFB21
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI56-.LCFI55
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI57-.LCFI56
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE42:
.LSFDE44:
	.4byte	.LEFDE44-.LASFDE44
.LASFDE44:
	.4byte	.Lframe0
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x4
	.4byte	.LCFI58-.LFB22
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI59-.LCFI58
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
	.4byte	.LCFI60-.LFB23
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI61-.LCFI60
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI62-.LCFI61
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
	.4byte	.LCFI63-.LFB24
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI64-.LCFI63
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI65-.LCFI64
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
	.4byte	.LCFI66-.LFB25
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI67-.LCFI66
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE50:
.LSFDE52:
	.4byte	.LEFDE52-.LASFDE52
.LASFDE52:
	.4byte	.Lframe0
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.byte	0x4
	.4byte	.LCFI68-.LFB26
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI69-.LCFI68
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI70-.LCFI69
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
	.4byte	.LCFI71-.LFB27
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI72-.LCFI71
	.byte	0xe
	.uleb128 0x60
	.byte	0x4
	.4byte	.LCFI73-.LCFI72
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
	.4byte	.LCFI74-.LFB28
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI75-.LCFI74
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI76-.LCFI75
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
	.4byte	.LCFI77-.LFB29
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI78-.LCFI77
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI79-.LCFI78
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
	.4byte	.LCFI80-.LFB30
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI81-.LCFI80
	.byte	0xe
	.uleb128 0x50
	.byte	0x4
	.4byte	.LCFI82-.LCFI81
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
	.4byte	.LCFI83-.LFB31
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI84-.LCFI83
	.byte	0xe
	.uleb128 0x38
	.byte	0x4
	.4byte	.LCFI85-.LCFI84
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE62:
.LSFDE64:
	.4byte	.LEFDE64-.LASFDE64
.LASFDE64:
	.4byte	.Lframe0
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.byte	0x4
	.4byte	.LCFI86-.LFB32
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI87-.LCFI86
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.4byte	.LCFI88-.LCFI87
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
	.4byte	.LCFI89-.LFB33
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI90-.LCFI89
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI91-.LCFI90
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
	.4byte	.LCFI92-.LFB34
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI93-.LCFI92
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI94-.LCFI93
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
	.4byte	.LCFI95-.LFB35
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI96-.LCFI95
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI97-.LCFI96
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE70:
.LSFDE72:
	.4byte	.LEFDE72-.LASFDE72
.LASFDE72:
	.4byte	.Lframe0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.byte	0x4
	.4byte	.LCFI98-.LFB36
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI99-.LCFI98
	.byte	0xe
	.uleb128 0x40
	.byte	0x4
	.4byte	.LCFI100-.LCFI99
	.byte	0xe
	.uleb128 0x8
	.align	2
.LEFDE72:
.LSFDE74:
	.4byte	.LEFDE74-.LASFDE74
.LASFDE74:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.byte	0x4
	.4byte	.LCFI101-.LFB37
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI102-.LCFI101
	.byte	0xe
	.uleb128 0x68
	.byte	0x4
	.4byte	.LCFI103-.LCFI102
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE74:
.LSFDE76:
	.4byte	.LEFDE76-.LASFDE76
.LASFDE76:
	.4byte	.Lframe0
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x4
	.4byte	.LCFI104-.LFB38
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI105-.LCFI104
	.byte	0xe
	.uleb128 0x48
	.byte	0x4
	.4byte	.LCFI106-.LCFI105
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE76:
.LSFDE78:
	.4byte	.LEFDE78-.LASFDE78
.LASFDE78:
	.4byte	.Lframe0
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.byte	0x4
	.4byte	.LCFI107-.LFB39
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI108-.LCFI107
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI109-.LCFI108
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE78:
.LSFDE80:
	.4byte	.LEFDE80-.LASFDE80
.LASFDE80:
	.4byte	.Lframe0
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.byte	0x4
	.4byte	.LCFI110-.LFB40
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI111-.LCFI110
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI112-.LCFI111
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE80:
.LSFDE82:
	.4byte	.LEFDE82-.LASFDE82
.LASFDE82:
	.4byte	.Lframe0
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.byte	0x4
	.4byte	.LCFI113-.LFB41
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI114-.LCFI113
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI115-.LCFI114
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE82:
.LSFDE84:
	.4byte	.LEFDE84-.LASFDE84
.LASFDE84:
	.4byte	.Lframe0
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.byte	0x4
	.4byte	.LCFI116-.LFB42
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI117-.LCFI116
	.byte	0xe
	.uleb128 0x40
	.byte	0x4
	.4byte	.LCFI118-.LCFI117
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE84:
.LSFDE86:
	.4byte	.LEFDE86-.LASFDE86
.LASFDE86:
	.4byte	.Lframe0
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.byte	0x4
	.4byte	.LCFI119-.LFB43
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI120-.LCFI119
	.byte	0xe
	.uleb128 0x40
	.byte	0x4
	.4byte	.LCFI121-.LCFI120
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE86:
.LSFDE88:
	.4byte	.LEFDE88-.LASFDE88
.LASFDE88:
	.4byte	.Lframe0
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.byte	0x4
	.4byte	.LCFI122-.LFB44
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI123-.LCFI122
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI124-.LCFI123
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE88:
.LSFDE90:
	.4byte	.LEFDE90-.LASFDE90
.LASFDE90:
	.4byte	.Lframe0
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.byte	0x4
	.4byte	.LCFI125-.LFB45
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI126-.LCFI125
	.byte	0xe
	.uleb128 0x60
	.byte	0x4
	.4byte	.LCFI127-.LCFI126
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE90:
.LSFDE92:
	.4byte	.LEFDE92-.LASFDE92
.LASFDE92:
	.4byte	.Lframe0
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.byte	0x4
	.4byte	.LCFI128-.LFB46
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI129-.LCFI128
	.byte	0xe
	.uleb128 0x50
	.byte	0x4
	.4byte	.LCFI130-.LCFI129
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE92:
.LSFDE94:
	.4byte	.LEFDE94-.LASFDE94
.LASFDE94:
	.4byte	.Lframe0
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.byte	0x4
	.4byte	.LCFI131-.LFB47
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI132-.LCFI131
	.byte	0xe
	.uleb128 0x40
	.byte	0x4
	.4byte	.LCFI133-.LCFI132
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE94:
.LSFDE96:
	.4byte	.LEFDE96-.LASFDE96
.LASFDE96:
	.4byte	.Lframe0
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.byte	0x4
	.4byte	.LCFI134-.LFB48
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI135-.LCFI134
	.byte	0xe
	.uleb128 0x78
	.byte	0x4
	.4byte	.LCFI136-.LCFI135
	.byte	0xe
	.uleb128 0x8
	.align	2
.LEFDE96:
.LSFDE98:
	.4byte	.LEFDE98-.LASFDE98
.LASFDE98:
	.4byte	.Lframe0
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.byte	0x4
	.4byte	.LCFI137-.LFB49
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI138-.LCFI137
	.byte	0xe
	.uleb128 0x40
	.byte	0x4
	.4byte	.LCFI139-.LCFI138
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE98:
.LSFDE100:
	.4byte	.LEFDE100-.LASFDE100
.LASFDE100:
	.4byte	.Lframe0
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.byte	0x4
	.4byte	.LCFI140-.LFB50
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI141-.LCFI140
	.byte	0xe
	.uleb128 0x68
	.byte	0x4
	.4byte	.LCFI142-.LCFI141
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE100:
.LSFDE102:
	.4byte	.LEFDE102-.LASFDE102
.LASFDE102:
	.4byte	.Lframe0
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.byte	0x4
	.4byte	.LCFI143-.LFB51
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI144-.LCFI143
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI145-.LCFI144
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE102:
.LSFDE104:
	.4byte	.LEFDE104-.LASFDE104
.LASFDE104:
	.4byte	.Lframe0
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.byte	0x4
	.4byte	.LCFI146-.LFB52
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI147-.LCFI146
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI148-.LCFI147
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE104:
.LSFDE106:
	.4byte	.LEFDE106-.LASFDE106
.LASFDE106:
	.4byte	.Lframe0
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.byte	0x4
	.4byte	.LCFI149-.LFB53
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI150-.LCFI149
	.byte	0xe
	.uleb128 0x60
	.byte	0x4
	.4byte	.LCFI151-.LCFI150
	.byte	0xe
	.uleb128 0x8
	.align	2
.LEFDE106:
.LSFDE108:
	.4byte	.LEFDE108-.LASFDE108
.LASFDE108:
	.4byte	.Lframe0
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.byte	0x4
	.4byte	.LCFI152-.LFB54
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI153-.LCFI152
	.byte	0xe
	.uleb128 0x60
	.byte	0x4
	.4byte	.LCFI154-.LCFI153
	.byte	0xe
	.uleb128 0x8
	.align	2
.LEFDE108:
.LSFDE110:
	.4byte	.LEFDE110-.LASFDE110
.LASFDE110:
	.4byte	.Lframe0
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.byte	0x4
	.4byte	.LCFI155-.LFB55
	.byte	0xe
	.uleb128 0xc
	.byte	0x81
	.uleb128 0x3
	.byte	0x82
	.uleb128 0x2
	.byte	0x83
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI156-.LCFI155
	.byte	0xe
	.uleb128 0x14
	.byte	0x84
	.uleb128 0x5
	.byte	0x8e
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI157-.LCFI156
	.byte	0xe
	.uleb128 0xa0
	.byte	0x4
	.4byte	.LCFI158-.LCFI157
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.4byte	.LCFI159-.LCFI158
	.byte	0xce
	.byte	0xc4
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.4byte	.LCFI160-.LCFI159
	.byte	0xc3
	.byte	0xc2
	.byte	0xc1
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE110:
	.text
.Letext0:
	.file 2 "/home/tommy/Documents/CrossWorks Projects/Executable_1/Device/Middleware/fatfs/src/integer.h"
	.file 3 "/home/tommy/Documents/CrossWorks Projects/Executable_1/Device/Middleware/fatfs/src/ff.h"
	.file 4 "/usr/share/crossworks_for_arm_4.8/include/stdint.h"
	.file 5 "/home/tommy/Documents/CrossWorks Projects/Executable_1/Device/Middleware/diskio/diskio.h"
	.file 6 "/usr/share/crossworks_for_arm_4.8/include/__crossworks.h"
	.file 7 "/usr/share/crossworks_for_arm_4.8/include/stdarg.h"
	.file 8 "<built-in>"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x211f
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF955
	.byte	0xc
	.4byte	.LASF956
	.4byte	.LASF957
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.4byte	.Ldebug_macro0
	.uleb128 0x2
	.4byte	.LASF773
	.byte	0x2
	.byte	0x10
	.byte	0x17
	.4byte	0x3a
	.uleb128 0x3
	.4byte	0x29
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF771
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.4byte	.LASF772
	.uleb128 0x2
	.4byte	.LASF774
	.byte	0x2
	.byte	0x14
	.byte	0x18
	.4byte	0x59
	.uleb128 0x3
	.4byte	0x48
	.uleb128 0x4
	.byte	0x2
	.byte	0x7
	.4byte	.LASF775
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.4byte	.LASF776
	.byte	0x2
	.byte	0x19
	.byte	0x16
	.4byte	0x73
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF777
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.4byte	.LASF778
	.uleb128 0x2
	.4byte	.LASF779
	.byte	0x2
	.byte	0x1d
	.byte	0x17
	.4byte	0x8d
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF780
	.uleb128 0x2
	.4byte	.LASF781
	.byte	0x3
	.byte	0x3e
	.byte	0xe
	.4byte	0xa5
	.uleb128 0x3
	.4byte	0x94
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF782
	.uleb128 0x3
	.4byte	0xa5
	.uleb128 0x6
	.2byte	0x234
	.byte	0x3
	.byte	0x47
	.byte	0x9
	.4byte	0x1b2
	.uleb128 0x7
	.4byte	.LASF783
	.byte	0x3
	.byte	0x48
	.byte	0x7
	.4byte	0x29
	.byte	0
	.uleb128 0x8
	.ascii	"drv\000"
	.byte	0x3
	.byte	0x49
	.byte	0x7
	.4byte	0x29
	.byte	0x1
	.uleb128 0x7
	.4byte	.LASF784
	.byte	0x3
	.byte	0x4a
	.byte	0x7
	.4byte	0x29
	.byte	0x2
	.uleb128 0x7
	.4byte	.LASF785
	.byte	0x3
	.byte	0x4b
	.byte	0x7
	.4byte	0x29
	.byte	0x3
	.uleb128 0x7
	.4byte	.LASF786
	.byte	0x3
	.byte	0x4c
	.byte	0x7
	.4byte	0x29
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF787
	.byte	0x3
	.byte	0x4d
	.byte	0x7
	.4byte	0x29
	.byte	0x5
	.uleb128 0x8
	.ascii	"id\000"
	.byte	0x3
	.byte	0x4e
	.byte	0x7
	.4byte	0x48
	.byte	0x6
	.uleb128 0x7
	.4byte	.LASF788
	.byte	0x3
	.byte	0x4f
	.byte	0x7
	.4byte	0x48
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF789
	.byte	0x3
	.byte	0x57
	.byte	0x8
	.4byte	0x81
	.byte	0xc
	.uleb128 0x7
	.4byte	.LASF790
	.byte	0x3
	.byte	0x58
	.byte	0x8
	.4byte	0x81
	.byte	0x10
	.uleb128 0x7
	.4byte	.LASF791
	.byte	0x3
	.byte	0x5b
	.byte	0x8
	.4byte	0x81
	.byte	0x14
	.uleb128 0x7
	.4byte	.LASF792
	.byte	0x3
	.byte	0x5d
	.byte	0x8
	.4byte	0x81
	.byte	0x18
	.uleb128 0x7
	.4byte	.LASF793
	.byte	0x3
	.byte	0x5e
	.byte	0x8
	.4byte	0x81
	.byte	0x1c
	.uleb128 0x7
	.4byte	.LASF794
	.byte	0x3
	.byte	0x5f
	.byte	0x8
	.4byte	0x81
	.byte	0x20
	.uleb128 0x7
	.4byte	.LASF795
	.byte	0x3
	.byte	0x60
	.byte	0x8
	.4byte	0x81
	.byte	0x24
	.uleb128 0x7
	.4byte	.LASF796
	.byte	0x3
	.byte	0x61
	.byte	0x8
	.4byte	0x81
	.byte	0x28
	.uleb128 0x7
	.4byte	.LASF797
	.byte	0x3
	.byte	0x62
	.byte	0x8
	.4byte	0x81
	.byte	0x2c
	.uleb128 0x7
	.4byte	.LASF798
	.byte	0x3
	.byte	0x63
	.byte	0x8
	.4byte	0x81
	.byte	0x30
	.uleb128 0x8
	.ascii	"win\000"
	.byte	0x3
	.byte	0x64
	.byte	0x7
	.4byte	0x1b2
	.byte	0x34
	.byte	0
	.uleb128 0x9
	.4byte	0x29
	.4byte	0x1c3
	.uleb128 0xa
	.4byte	0x73
	.2byte	0x1ff
	.byte	0
	.uleb128 0x2
	.4byte	.LASF799
	.byte	0x3
	.byte	0x65
	.byte	0x3
	.4byte	0xb1
	.uleb128 0x6
	.2byte	0x228
	.byte	0x3
	.byte	0x69
	.byte	0x9
	.4byte	0x281
	.uleb128 0x8
	.ascii	"fs\000"
	.byte	0x3
	.byte	0x6a
	.byte	0x9
	.4byte	0x281
	.byte	0
	.uleb128 0x8
	.ascii	"id\000"
	.byte	0x3
	.byte	0x6b
	.byte	0x7
	.4byte	0x48
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF800
	.byte	0x3
	.byte	0x6c
	.byte	0x7
	.4byte	0x29
	.byte	0x6
	.uleb128 0x8
	.ascii	"err\000"
	.byte	0x3
	.byte	0x6d
	.byte	0x7
	.4byte	0x29
	.byte	0x7
	.uleb128 0x7
	.4byte	.LASF801
	.byte	0x3
	.byte	0x6e
	.byte	0x8
	.4byte	0x81
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF793
	.byte	0x3
	.byte	0x6f
	.byte	0x8
	.4byte	0x81
	.byte	0xc
	.uleb128 0x7
	.4byte	.LASF802
	.byte	0x3
	.byte	0x70
	.byte	0x8
	.4byte	0x81
	.byte	0x10
	.uleb128 0x7
	.4byte	.LASF803
	.byte	0x3
	.byte	0x71
	.byte	0x8
	.4byte	0x81
	.byte	0x14
	.uleb128 0x7
	.4byte	.LASF804
	.byte	0x3
	.byte	0x72
	.byte	0x8
	.4byte	0x81
	.byte	0x18
	.uleb128 0x7
	.4byte	.LASF805
	.byte	0x3
	.byte	0x74
	.byte	0x8
	.4byte	0x81
	.byte	0x1c
	.uleb128 0x7
	.4byte	.LASF806
	.byte	0x3
	.byte	0x75
	.byte	0x8
	.4byte	0x287
	.byte	0x20
	.uleb128 0x7
	.4byte	.LASF807
	.byte	0x3
	.byte	0x78
	.byte	0x9
	.4byte	0x28d
	.byte	0x24
	.uleb128 0x8
	.ascii	"buf\000"
	.byte	0x3
	.byte	0x7e
	.byte	0x7
	.4byte	0x1b2
	.byte	0x28
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x1c3
	.uleb128 0xb
	.byte	0x4
	.4byte	0x29
	.uleb128 0xb
	.byte	0x4
	.4byte	0x81
	.uleb128 0xc
	.ascii	"FIL\000"
	.byte	0x3
	.byte	0x80
	.byte	0x3
	.4byte	0x1cf
	.uleb128 0xd
	.byte	0x1c
	.byte	0x3
	.byte	0x84
	.byte	0x9
	.4byte	0x30e
	.uleb128 0x8
	.ascii	"fs\000"
	.byte	0x3
	.byte	0x85
	.byte	0x9
	.4byte	0x281
	.byte	0
	.uleb128 0x8
	.ascii	"id\000"
	.byte	0x3
	.byte	0x86
	.byte	0x7
	.4byte	0x48
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF808
	.byte	0x3
	.byte	0x87
	.byte	0x7
	.4byte	0x48
	.byte	0x6
	.uleb128 0x7
	.4byte	.LASF802
	.byte	0x3
	.byte	0x88
	.byte	0x8
	.4byte	0x81
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF803
	.byte	0x3
	.byte	0x89
	.byte	0x8
	.4byte	0x81
	.byte	0xc
	.uleb128 0x7
	.4byte	.LASF809
	.byte	0x3
	.byte	0x8a
	.byte	0x8
	.4byte	0x81
	.byte	0x10
	.uleb128 0x8
	.ascii	"dir\000"
	.byte	0x3
	.byte	0x8b
	.byte	0x8
	.4byte	0x287
	.byte	0x14
	.uleb128 0x8
	.ascii	"fn\000"
	.byte	0x3
	.byte	0x8c
	.byte	0x8
	.4byte	0x287
	.byte	0x18
	.byte	0
	.uleb128 0xc
	.ascii	"DIR\000"
	.byte	0x3
	.byte	0x97
	.byte	0x3
	.4byte	0x29f
	.uleb128 0xd
	.byte	0x18
	.byte	0x3
	.byte	0x9b
	.byte	0x9
	.4byte	0x365
	.uleb128 0x7
	.4byte	.LASF793
	.byte	0x3
	.byte	0x9c
	.byte	0x8
	.4byte	0x81
	.byte	0
	.uleb128 0x7
	.4byte	.LASF810
	.byte	0x3
	.byte	0x9d
	.byte	0x7
	.4byte	0x48
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF811
	.byte	0x3
	.byte	0x9e
	.byte	0x7
	.4byte	0x48
	.byte	0x6
	.uleb128 0x7
	.4byte	.LASF812
	.byte	0x3
	.byte	0x9f
	.byte	0x7
	.4byte	0x29
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF813
	.byte	0x3
	.byte	0xa0
	.byte	0x8
	.4byte	0x365
	.byte	0x9
	.byte	0
	.uleb128 0x9
	.4byte	0x94
	.4byte	0x375
	.uleb128 0xe
	.4byte	0x73
	.byte	0xc
	.byte	0
	.uleb128 0x2
	.4byte	.LASF814
	.byte	0x3
	.byte	0xa5
	.byte	0x3
	.4byte	0x31a
	.uleb128 0x3
	.4byte	0x375
	.uleb128 0xf
	.byte	0x7
	.byte	0x1
	.4byte	0x3a
	.byte	0x3
	.byte	0xa9
	.byte	0xe
	.4byte	0x40d
	.uleb128 0x10
	.4byte	.LASF815
	.byte	0
	.uleb128 0x10
	.4byte	.LASF816
	.byte	0x1
	.uleb128 0x10
	.4byte	.LASF817
	.byte	0x2
	.uleb128 0x10
	.4byte	.LASF818
	.byte	0x3
	.uleb128 0x10
	.4byte	.LASF819
	.byte	0x4
	.uleb128 0x10
	.4byte	.LASF820
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF821
	.byte	0x6
	.uleb128 0x10
	.4byte	.LASF822
	.byte	0x7
	.uleb128 0x10
	.4byte	.LASF823
	.byte	0x8
	.uleb128 0x10
	.4byte	.LASF824
	.byte	0x9
	.uleb128 0x10
	.4byte	.LASF825
	.byte	0xa
	.uleb128 0x10
	.4byte	.LASF826
	.byte	0xb
	.uleb128 0x10
	.4byte	.LASF827
	.byte	0xc
	.uleb128 0x10
	.4byte	.LASF828
	.byte	0xd
	.uleb128 0x10
	.4byte	.LASF829
	.byte	0xe
	.uleb128 0x10
	.4byte	.LASF830
	.byte	0xf
	.uleb128 0x10
	.4byte	.LASF831
	.byte	0x10
	.uleb128 0x10
	.4byte	.LASF832
	.byte	0x11
	.uleb128 0x10
	.4byte	.LASF833
	.byte	0x12
	.uleb128 0x10
	.4byte	.LASF834
	.byte	0x13
	.byte	0
	.uleb128 0x2
	.4byte	.LASF835
	.byte	0x3
	.byte	0xbe
	.byte	0x3
	.4byte	0x386
	.uleb128 0x4
	.byte	0x1
	.byte	0x6
	.4byte	.LASF836
	.uleb128 0x2
	.4byte	.LASF837
	.byte	0x4
	.byte	0xf
	.byte	0x1c
	.4byte	0x3a
	.uleb128 0x4
	.byte	0x8
	.byte	0x5
	.4byte	.LASF838
	.uleb128 0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF839
	.uleb128 0x2
	.4byte	.LASF840
	.byte	0x5
	.byte	0x55
	.byte	0x13
	.4byte	0x420
	.uleb128 0x2
	.4byte	.LASF841
	.byte	0x5
	.byte	0x56
	.byte	0x13
	.4byte	0x43a
	.uleb128 0xf
	.byte	0x7
	.byte	0x1
	.4byte	0x3a
	.byte	0x5
	.byte	0x59
	.byte	0xe
	.4byte	0x47f
	.uleb128 0x10
	.4byte	.LASF842
	.byte	0
	.uleb128 0x10
	.4byte	.LASF843
	.byte	0x1
	.uleb128 0x10
	.4byte	.LASF844
	.byte	0x2
	.uleb128 0x10
	.4byte	.LASF845
	.byte	0x3
	.uleb128 0x10
	.4byte	.LASF846
	.byte	0x4
	.byte	0
	.uleb128 0x9
	.4byte	0x281
	.4byte	0x48f
	.uleb128 0xe
	.4byte	0x73
	.byte	0x4
	.byte	0
	.uleb128 0x11
	.4byte	.LASF847
	.byte	0x1
	.2byte	0x1b1
	.byte	0xf
	.4byte	0x47f
	.uleb128 0x5
	.byte	0x3
	.4byte	FatFs
	.uleb128 0x11
	.4byte	.LASF848
	.byte	0x1
	.2byte	0x1b2
	.byte	0xd
	.4byte	0x48
	.uleb128 0x5
	.byte	0x3
	.4byte	Fsid
	.uleb128 0x11
	.4byte	.LASF849
	.byte	0x1
	.2byte	0x1b5
	.byte	0xd
	.4byte	0x29
	.uleb128 0x5
	.byte	0x3
	.4byte	CurrVol
	.uleb128 0x9
	.4byte	0x35
	.4byte	0x4d8
	.uleb128 0xe
	.4byte	0x73
	.byte	0x7f
	.byte	0
	.uleb128 0x3
	.4byte	0x4c8
	.uleb128 0x11
	.4byte	.LASF850
	.byte	0x1
	.2byte	0x1d7
	.byte	0x13
	.4byte	0x4d8
	.uleb128 0x5
	.byte	0x3
	.4byte	ExCvt
	.uleb128 0x2
	.4byte	.LASF851
	.byte	0x6
	.byte	0x2b
	.byte	0x1b
	.4byte	0x4fc
	.uleb128 0x12
	.4byte	.LASF851
	.byte	0x4
	.byte	0x8
	.byte	0
	.4byte	0x513
	.uleb128 0x13
	.4byte	.LASF958
	.4byte	0x513
	.byte	0
	.byte	0
	.uleb128 0x14
	.byte	0x4
	.uleb128 0xb
	.byte	0x4
	.4byte	0xac
	.uleb128 0x2
	.4byte	.LASF852
	.byte	0x7
	.byte	0x24
	.byte	0x13
	.4byte	0x4f0
	.uleb128 0x15
	.byte	0x4c
	.byte	0x1
	.2byte	0x1071
	.byte	0x9
	.4byte	0x569
	.uleb128 0x16
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x1072
	.byte	0xa
	.4byte	0x569
	.byte	0
	.uleb128 0x16
	.ascii	"idx\000"
	.byte	0x1
	.2byte	0x1073
	.byte	0x9
	.4byte	0x60
	.byte	0x4
	.uleb128 0x17
	.4byte	.LASF853
	.byte	0x1
	.2byte	0x1073
	.byte	0xe
	.4byte	0x60
	.byte	0x8
	.uleb128 0x16
	.ascii	"buf\000"
	.byte	0x1
	.2byte	0x1074
	.byte	0xa
	.4byte	0x56f
	.byte	0xc
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x293
	.uleb128 0x9
	.4byte	0x29
	.4byte	0x57f
	.uleb128 0xe
	.4byte	0x73
	.byte	0x3f
	.byte	0
	.uleb128 0x18
	.4byte	.LASF854
	.byte	0x1
	.2byte	0x1075
	.byte	0x3
	.4byte	0x527
	.uleb128 0x19
	.4byte	.LASF855
	.byte	0x1
	.2byte	0x10db
	.byte	0x5
	.4byte	0x60
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x685
	.uleb128 0x1a
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x10dc
	.byte	0xa
	.4byte	0x569
	.uleb128 0x3
	.byte	0x91
	.sleb128 -156
	.uleb128 0x1a
	.ascii	"fmt\000"
	.byte	0x1
	.2byte	0x10dd
	.byte	0x12
	.4byte	0x685
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1b
	.uleb128 0x1c
	.ascii	"arp\000"
	.byte	0x1
	.2byte	0x10e1
	.byte	0xd
	.4byte	0x51b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1c
	.ascii	"f\000"
	.byte	0x1
	.2byte	0x10e2
	.byte	0xa
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x1c
	.ascii	"r\000"
	.byte	0x1
	.2byte	0x10e2
	.byte	0xd
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0x1c
	.ascii	"nw\000"
	.byte	0x1
	.2byte	0x10e3
	.byte	0xa
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1c
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x10e3
	.byte	0xe
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.ascii	"j\000"
	.byte	0x1
	.2byte	0x10e3
	.byte	0x11
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1c
	.ascii	"w\000"
	.byte	0x1
	.2byte	0x10e3
	.byte	0x14
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.ascii	"v\000"
	.byte	0x1
	.2byte	0x10e4
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1c
	.ascii	"c\000"
	.byte	0x1
	.2byte	0x10e5
	.byte	0xb
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -45
	.uleb128 0x1c
	.ascii	"d\000"
	.byte	0x1
	.2byte	0x10e5
	.byte	0xe
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -46
	.uleb128 0x1c
	.ascii	"s\000"
	.byte	0x1
	.2byte	0x10e5
	.byte	0x11
	.4byte	0x68b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x1c
	.ascii	"p\000"
	.byte	0x1
	.2byte	0x10e5
	.byte	0x19
	.4byte	0x69b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1c
	.ascii	"pb\000"
	.byte	0x1
	.2byte	0x10e6
	.byte	0xd
	.4byte	0x57f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0xa0
	.uleb128 0x9
	.4byte	0x94
	.4byte	0x69b
	.uleb128 0xe
	.4byte	0x73
	.byte	0xf
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x94
	.uleb128 0x19
	.4byte	.LASF856
	.byte	0x1
	.2byte	0x10c3
	.byte	0x5
	.4byte	0x60
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6fe
	.uleb128 0x1a
	.ascii	"str\000"
	.byte	0x1
	.2byte	0x10c4
	.byte	0x12
	.4byte	0x685
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0x1a
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x10c5
	.byte	0xa
	.4byte	0x569
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1c
	.ascii	"pb\000"
	.byte	0x1
	.2byte	0x10c8
	.byte	0xd
	.4byte	0x57f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x1c
	.ascii	"nw\000"
	.byte	0x1
	.2byte	0x10c9
	.byte	0xa
	.4byte	0x67
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.byte	0
	.uleb128 0x19
	.4byte	.LASF857
	.byte	0x1
	.2byte	0x10ac
	.byte	0x5
	.4byte	0x60
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x759
	.uleb128 0x1a
	.ascii	"c\000"
	.byte	0x1
	.2byte	0x10ad
	.byte	0xb
	.4byte	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -89
	.uleb128 0x1a
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x10ae
	.byte	0xa
	.4byte	0x569
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1c
	.ascii	"pb\000"
	.byte	0x1
	.2byte	0x10b1
	.byte	0xd
	.4byte	0x57f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x1c
	.ascii	"nw\000"
	.byte	0x1
	.2byte	0x10b2
	.byte	0xa
	.4byte	0x67
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF929
	.byte	0x1
	.2byte	0x1078
	.byte	0x6
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7ab
	.uleb128 0x1a
	.ascii	"pb\000"
	.byte	0x1
	.2byte	0x1079
	.byte	0xe
	.4byte	0x7ab
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.ascii	"c\000"
	.byte	0x1
	.2byte	0x107a
	.byte	0xb
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x1c
	.ascii	"bw\000"
	.byte	0x1
	.2byte	0x107d
	.byte	0xa
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x107e
	.byte	0x9
	.4byte	0x60
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x57f
	.uleb128 0x19
	.4byte	.LASF858
	.byte	0x1
	.2byte	0x1026
	.byte	0x8
	.4byte	0x69b
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x843
	.uleb128 0x1e
	.4byte	.LASF859
	.byte	0x1
	.2byte	0x1027
	.byte	0xc
	.4byte	0x69b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1a
	.ascii	"len\000"
	.byte	0x1
	.2byte	0x1028
	.byte	0x9
	.4byte	0x60
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1a
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x1029
	.byte	0xa
	.4byte	0x569
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1c
	.ascii	"n\000"
	.byte	0x1
	.2byte	0x102c
	.byte	0x9
	.4byte	0x60
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1c
	.ascii	"c\000"
	.byte	0x1
	.2byte	0x102d
	.byte	0xb
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x1c
	.ascii	"p\000"
	.byte	0x1
	.2byte	0x102d
	.byte	0xf
	.4byte	0x69b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.ascii	"s\000"
	.byte	0x1
	.2byte	0x102e
	.byte	0xa
	.4byte	0x843
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x102f
	.byte	0xa
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x9
	.4byte	0x29
	.4byte	0x853
	.uleb128 0xe
	.4byte	0x73
	.byte	0x1
	.byte	0
	.uleb128 0x19
	.4byte	.LASF860
	.byte	0x1
	.2byte	0xeef
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa25
	.uleb128 0x1e
	.4byte	.LASF861
	.byte	0x1
	.2byte	0xef0
	.byte	0x12
	.4byte	0x685
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0x1a
	.ascii	"sfd\000"
	.byte	0x1
	.2byte	0xef1
	.byte	0xa
	.4byte	0x29
	.uleb128 0x3
	.byte	0x91
	.sleb128 -93
	.uleb128 0x1a
	.ascii	"au\000"
	.byte	0x1
	.2byte	0xef2
	.byte	0xa
	.4byte	0x67
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x1c
	.ascii	"vst\000"
	.byte	0x1
	.2byte	0xef5
	.byte	0x17
	.4byte	0xa35
	.uleb128 0x5
	.byte	0x3
	.4byte	vst.1
	.uleb128 0x1c
	.ascii	"cst\000"
	.byte	0x1
	.2byte	0xef6
	.byte	0x17
	.4byte	0xa35
	.uleb128 0x5
	.byte	0x3
	.4byte	cst.0
	.uleb128 0x1c
	.ascii	"vol\000"
	.byte	0x1
	.2byte	0xef7
	.byte	0x9
	.4byte	0x60
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1c
	.ascii	"fmt\000"
	.byte	0x1
	.2byte	0xef8
	.byte	0xa
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -57
	.uleb128 0x1c
	.ascii	"md\000"
	.byte	0x1
	.2byte	0xef8
	.byte	0xf
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.ascii	"sys\000"
	.byte	0x1
	.2byte	0xef8
	.byte	0x13
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x1c
	.ascii	"tbl\000"
	.byte	0x1
	.2byte	0xef8
	.byte	0x19
	.4byte	0x287
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x11
	.4byte	.LASF862
	.byte	0x1
	.2byte	0xef8
	.byte	0x1e
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x11
	.4byte	.LASF863
	.byte	0x1
	.2byte	0xef8
	.byte	0x24
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x11
	.4byte	.LASF864
	.byte	0x1
	.2byte	0xef9
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1c
	.ascii	"vs\000"
	.byte	0x1
	.2byte	0xef9
	.byte	0x13
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.ascii	"n\000"
	.byte	0x1
	.2byte	0xef9
	.byte	0x17
	.4byte	0x81
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x11
	.4byte	.LASF865
	.byte	0x1
	.2byte	0xef9
	.byte	0x1a
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.ascii	"i\000"
	.byte	0x1
	.2byte	0xefa
	.byte	0xa
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x11
	.4byte	.LASF866
	.byte	0x1
	.2byte	0xefb
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x11
	.4byte	.LASF867
	.byte	0x1
	.2byte	0xefb
	.byte	0x12
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x11
	.4byte	.LASF868
	.byte	0x1
	.2byte	0xefb
	.byte	0x19
	.4byte	0x81
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x11
	.4byte	.LASF869
	.byte	0x1
	.2byte	0xefb
	.byte	0x20
	.4byte	0x81
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x11
	.4byte	.LASF870
	.byte	0x1
	.2byte	0xefc
	.byte	0xb
	.4byte	0x81
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x11
	.4byte	.LASF871
	.byte	0x1
	.2byte	0xefc
	.byte	0x12
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x11
	.4byte	.LASF872
	.byte	0x1
	.2byte	0xefc
	.byte	0x19
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x11
	.4byte	.LASF873
	.byte	0x1
	.2byte	0xefc
	.byte	0x20
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1c
	.ascii	"fs\000"
	.byte	0x1
	.2byte	0xefd
	.byte	0xc
	.4byte	0x281
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x11
	.4byte	.LASF874
	.byte	0x1
	.2byte	0xefe
	.byte	0xd
	.4byte	0x446
	.uleb128 0x2
	.byte	0x91
	.sleb128 -23
	.byte	0
	.uleb128 0x9
	.4byte	0x54
	.4byte	0xa35
	.uleb128 0xe
	.4byte	0x73
	.byte	0xa
	.byte	0
	.uleb128 0x3
	.4byte	0xa25
	.uleb128 0x19
	.4byte	.LASF875
	.byte	0x1
	.2byte	0xdeb
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xab5
	.uleb128 0x1e
	.4byte	.LASF861
	.byte	0x1
	.2byte	0xdec
	.byte	0x12
	.4byte	0x685
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1a
	.ascii	"fno\000"
	.byte	0x1
	.2byte	0xded
	.byte	0x14
	.4byte	0xab5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0xdf0
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1c
	.ascii	"dj\000"
	.byte	0x1
	.2byte	0xdf1
	.byte	0x9
	.4byte	0x30e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1c
	.ascii	"dir\000"
	.byte	0x1
	.2byte	0xdf2
	.byte	0xb
	.4byte	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.ascii	"sfn\000"
	.byte	0x1
	.2byte	0xdf3
	.byte	0x5
	.4byte	0xabb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x381
	.uleb128 0x9
	.4byte	0x29
	.4byte	0xacb
	.uleb128 0xe
	.4byte	0x73
	.byte	0xb
	.byte	0
	.uleb128 0x19
	.4byte	.LASF876
	.byte	0x1
	.2byte	0xda1
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb7b
	.uleb128 0x1e
	.4byte	.LASF877
	.byte	0x1
	.2byte	0xda2
	.byte	0x12
	.4byte	0x685
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.uleb128 0x1e
	.4byte	.LASF878
	.byte	0x1
	.2byte	0xda3
	.byte	0x12
	.4byte	0x685
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0xda6
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1c
	.ascii	"djo\000"
	.byte	0x1
	.2byte	0xda7
	.byte	0x9
	.4byte	0x30e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1c
	.ascii	"djn\000"
	.byte	0x1
	.2byte	0xda7
	.byte	0xe
	.4byte	0x30e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x1c
	.ascii	"buf\000"
	.byte	0x1
	.2byte	0xda8
	.byte	0xa
	.4byte	0xb7b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x1c
	.ascii	"dir\000"
	.byte	0x1
	.2byte	0xda8
	.byte	0x14
	.4byte	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.ascii	"dw\000"
	.byte	0x1
	.2byte	0xda9
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.ascii	"sfn\000"
	.byte	0x1
	.2byte	0xdaa
	.byte	0x5
	.4byte	0xabb
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.byte	0
	.uleb128 0x9
	.4byte	0x29
	.4byte	0xb8b
	.uleb128 0xe
	.4byte	0x73
	.byte	0x14
	.byte	0
	.uleb128 0x19
	.4byte	.LASF879
	.byte	0x1
	.2byte	0xd7b
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc16
	.uleb128 0x1e
	.4byte	.LASF861
	.byte	0x1
	.2byte	0xd7c
	.byte	0x12
	.4byte	0x685
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1e
	.4byte	.LASF880
	.byte	0x1
	.2byte	0xd7d
	.byte	0xa
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -61
	.uleb128 0x1e
	.4byte	.LASF881
	.byte	0x1
	.2byte	0xd7e
	.byte	0xa
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -62
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0xd81
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1c
	.ascii	"dj\000"
	.byte	0x1
	.2byte	0xd82
	.byte	0x9
	.4byte	0x30e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1c
	.ascii	"dir\000"
	.byte	0x1
	.2byte	0xd83
	.byte	0xb
	.4byte	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.ascii	"sfn\000"
	.byte	0x1
	.2byte	0xd84
	.byte	0x5
	.4byte	0xabb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x19
	.4byte	.LASF882
	.byte	0x1
	.2byte	0xd35
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xcd0
	.uleb128 0x1e
	.4byte	.LASF861
	.byte	0x1
	.2byte	0xd36
	.byte	0x12
	.4byte	0x685
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0xd39
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1c
	.ascii	"dj\000"
	.byte	0x1
	.2byte	0xd3a
	.byte	0x9
	.4byte	0x30e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1c
	.ascii	"dir\000"
	.byte	0x1
	.2byte	0xd3b
	.byte	0xb
	.4byte	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.ascii	"n\000"
	.byte	0x1
	.2byte	0xd3b
	.byte	0x10
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x1c
	.ascii	"dsc\000"
	.byte	0x1
	.2byte	0xd3c
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.ascii	"dcl\000"
	.byte	0x1
	.2byte	0xd3c
	.byte	0x10
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.ascii	"pcl\000"
	.byte	0x1
	.2byte	0xd3c
	.byte	0x15
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.ascii	"tm\000"
	.byte	0x1
	.2byte	0xd3c
	.byte	0x1a
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.ascii	"sfn\000"
	.byte	0x1
	.2byte	0xd3d
	.byte	0x5
	.4byte	0xabb
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.byte	0
	.uleb128 0x19
	.4byte	.LASF883
	.byte	0x1
	.2byte	0xcf4
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd5e
	.uleb128 0x1e
	.4byte	.LASF861
	.byte	0x1
	.2byte	0xcf5
	.byte	0x12
	.4byte	0x685
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0xcf8
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1c
	.ascii	"dj\000"
	.byte	0x1
	.2byte	0xcf9
	.byte	0x9
	.4byte	0x30e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1c
	.ascii	"sdj\000"
	.byte	0x1
	.2byte	0xcf9
	.byte	0xd
	.4byte	0x30e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x1c
	.ascii	"dir\000"
	.byte	0x1
	.2byte	0xcfa
	.byte	0xb
	.4byte	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	.LASF884
	.byte	0x1
	.2byte	0xcfb
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.ascii	"sfn\000"
	.byte	0x1
	.2byte	0xcfc
	.byte	0x5
	.4byte	0xabb
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.byte	0
	.uleb128 0x19
	.4byte	.LASF885
	.byte	0x1
	.2byte	0xcc0
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xda9
	.uleb128 0x1a
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0xcc1
	.byte	0xa
	.4byte	0x569
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0xcc4
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1c
	.ascii	"ncl\000"
	.byte	0x1
	.2byte	0xcc5
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x19
	.4byte	.LASF886
	.byte	0x1
	.2byte	0xc82
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe80
	.uleb128 0x1e
	.4byte	.LASF861
	.byte	0x1
	.2byte	0xc83
	.byte	0x12
	.4byte	0x685
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1e
	.4byte	.LASF887
	.byte	0x1
	.2byte	0xc84
	.byte	0xc
	.4byte	0x28d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1e
	.4byte	.LASF888
	.byte	0x1
	.2byte	0xc85
	.byte	0xd
	.4byte	0xe80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0xc88
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1c
	.ascii	"fs\000"
	.byte	0x1
	.2byte	0xc89
	.byte	0xc
	.4byte	0x281
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x11
	.4byte	.LASF889
	.byte	0x1
	.2byte	0xc8a
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x11
	.4byte	.LASF890
	.byte	0x1
	.2byte	0xc8a
	.byte	0x12
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	.LASF809
	.byte	0x1
	.2byte	0xc8a
	.byte	0x18
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.4byte	.LASF874
	.byte	0x1
	.2byte	0xc8a
	.byte	0x1e
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1c
	.ascii	"i\000"
	.byte	0x1
	.2byte	0xc8b
	.byte	0xa
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.ascii	"fat\000"
	.byte	0x1
	.2byte	0xc8c
	.byte	0xa
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -37
	.uleb128 0x1c
	.ascii	"p\000"
	.byte	0x1
	.2byte	0xc8c
	.byte	0x10
	.4byte	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x281
	.uleb128 0x19
	.4byte	.LASF891
	.byte	0x1
	.2byte	0xc62
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xef1
	.uleb128 0x1e
	.4byte	.LASF861
	.byte	0x1
	.2byte	0xc63
	.byte	0x12
	.4byte	0x685
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1a
	.ascii	"fno\000"
	.byte	0x1
	.2byte	0xc64
	.byte	0xe
	.4byte	0xef1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0xc67
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1c
	.ascii	"dj\000"
	.byte	0x1
	.2byte	0xc68
	.byte	0x9
	.4byte	0x30e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.ascii	"sfn\000"
	.byte	0x1
	.2byte	0xc69
	.byte	0x5
	.4byte	0xabb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x375
	.uleb128 0x19
	.4byte	.LASF892
	.byte	0x1
	.2byte	0xc0d
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf52
	.uleb128 0x1a
	.ascii	"dp\000"
	.byte	0x1
	.2byte	0xc0e
	.byte	0xa
	.4byte	0xf52
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1a
	.ascii	"fno\000"
	.byte	0x1
	.2byte	0xc0f
	.byte	0xe
	.4byte	0xef1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0xc12
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1c
	.ascii	"sfn\000"
	.byte	0x1
	.2byte	0xc13
	.byte	0x5
	.4byte	0xabb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x30e
	.uleb128 0x19
	.4byte	.LASF893
	.byte	0x1
	.2byte	0xbf1
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf93
	.uleb128 0x1a
	.ascii	"dp\000"
	.byte	0x1
	.2byte	0xbf2
	.byte	0xa
	.4byte	0xf52
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0xbf5
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x19
	.4byte	.LASF894
	.byte	0x1
	.2byte	0xbbd
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xffd
	.uleb128 0x1a
	.ascii	"dp\000"
	.byte	0x1
	.2byte	0xbbe
	.byte	0xa
	.4byte	0xf52
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1e
	.4byte	.LASF861
	.byte	0x1
	.2byte	0xbbf
	.byte	0x12
	.4byte	0x685
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0xbc2
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1c
	.ascii	"fs\000"
	.byte	0x1
	.2byte	0xbc3
	.byte	0xc
	.4byte	0x281
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.ascii	"sfn\000"
	.byte	0x1
	.2byte	0xbc4
	.byte	0x5
	.4byte	0xabb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x19
	.4byte	.LASF895
	.byte	0x1
	.2byte	0xb22
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1109
	.uleb128 0x1a
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0xb23
	.byte	0xa
	.4byte	0x569
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x1a
	.ascii	"ofs\000"
	.byte	0x1
	.2byte	0xb24
	.byte	0xb
	.4byte	0x81
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0xb27
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x11
	.4byte	.LASF890
	.byte	0x1
	.2byte	0xb28
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.ascii	"bcs\000"
	.byte	0x1
	.2byte	0xb28
	.byte	0x11
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x11
	.4byte	.LASF896
	.byte	0x1
	.2byte	0xb28
	.byte	0x16
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	.LASF897
	.byte	0x1
	.2byte	0xb28
	.byte	0x1d
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.ascii	"cl\000"
	.byte	0x1
	.2byte	0xb2a
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.ascii	"pcl\000"
	.byte	0x1
	.2byte	0xb2a
	.byte	0xf
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1c
	.ascii	"ncl\000"
	.byte	0x1
	.2byte	0xb2a
	.byte	0x14
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.ascii	"tcl\000"
	.byte	0x1
	.2byte	0xb2a
	.byte	0x19
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1c
	.ascii	"dsc\000"
	.byte	0x1
	.2byte	0xb2a
	.byte	0x1e
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x11
	.4byte	.LASF898
	.byte	0x1
	.2byte	0xb2a
	.byte	0x23
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x11
	.4byte	.LASF899
	.byte	0x1
	.2byte	0xb2a
	.byte	0x29
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.ascii	"tbl\000"
	.byte	0x1
	.2byte	0xb2a
	.byte	0x30
	.4byte	0x28d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x19
	.4byte	.LASF900
	.byte	0x1
	.2byte	0xad2
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x11c3
	.uleb128 0x1e
	.4byte	.LASF859
	.byte	0x1
	.2byte	0xad3
	.byte	0xc
	.4byte	0x69b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x1a
	.ascii	"len\000"
	.byte	0x1
	.2byte	0xad4
	.byte	0xa
	.4byte	0x67
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0xad7
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1c
	.ascii	"dj\000"
	.byte	0x1
	.2byte	0xad8
	.byte	0x9
	.4byte	0x30e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1c
	.ascii	"i\000"
	.byte	0x1
	.2byte	0xad9
	.byte	0xa
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.ascii	"n\000"
	.byte	0x1
	.2byte	0xad9
	.byte	0xd
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.ascii	"ccl\000"
	.byte	0x1
	.2byte	0xada
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.ascii	"tp\000"
	.byte	0x1
	.2byte	0xadb
	.byte	0xc
	.4byte	0x69b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.ascii	"fno\000"
	.byte	0x1
	.2byte	0xadc
	.byte	0xd
	.4byte	0x375
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1c
	.ascii	"sfn\000"
	.byte	0x1
	.2byte	0xadd
	.byte	0x5
	.4byte	0xabb
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.byte	0
	.uleb128 0x19
	.4byte	.LASF901
	.byte	0x1
	.2byte	0xab3
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x121e
	.uleb128 0x1e
	.4byte	.LASF861
	.byte	0x1
	.2byte	0xab4
	.byte	0x12
	.4byte	0x685
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0xab7
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1c
	.ascii	"dj\000"
	.byte	0x1
	.2byte	0xab8
	.byte	0x9
	.4byte	0x30e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.ascii	"sfn\000"
	.byte	0x1
	.2byte	0xab9
	.byte	0x5
	.4byte	0xabb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.uleb128 0x19
	.4byte	.LASF902
	.byte	0x1
	.2byte	0xaa4
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x125a
	.uleb128 0x1e
	.4byte	.LASF861
	.byte	0x1
	.2byte	0xaa5
	.byte	0x12
	.4byte	0x685
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.ascii	"vol\000"
	.byte	0x1
	.2byte	0xaa8
	.byte	0x9
	.4byte	0x60
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x19
	.4byte	.LASF903
	.byte	0x1
	.2byte	0xa81
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1295
	.uleb128 0x1a
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0xa82
	.byte	0xa
	.4byte	0x569
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0xa85
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x19
	.4byte	.LASF904
	.byte	0x1
	.2byte	0xa55
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x12ef
	.uleb128 0x1a
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0xa56
	.byte	0xa
	.4byte	0x569
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0xa59
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1c
	.ascii	"tm\000"
	.byte	0x1
	.2byte	0xa5a
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.ascii	"dir\000"
	.byte	0x1
	.2byte	0xa5b
	.byte	0xb
	.4byte	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x19
	.4byte	.LASF905
	.byte	0x1
	.2byte	0x9df
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x13b8
	.uleb128 0x1a
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x9e0
	.byte	0xa
	.4byte	0x569
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1e
	.4byte	.LASF859
	.byte	0x1
	.2byte	0x9e1
	.byte	0x11
	.4byte	0x13b8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1a
	.ascii	"btw\000"
	.byte	0x1
	.2byte	0x9e2
	.byte	0xa
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1a
	.ascii	"bw\000"
	.byte	0x1
	.2byte	0x9e3
	.byte	0xb
	.4byte	0x13bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0x9e6
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x11
	.4byte	.LASF890
	.byte	0x1
	.2byte	0x9e7
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x11
	.4byte	.LASF809
	.byte	0x1
	.2byte	0x9e7
	.byte	0x11
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x11
	.4byte	.LASF906
	.byte	0x1
	.2byte	0x9e8
	.byte	0xa
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.ascii	"cc\000"
	.byte	0x1
	.2byte	0x9e8
	.byte	0x10
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	.LASF907
	.byte	0x1
	.2byte	0x9e9
	.byte	0x11
	.4byte	0x13c5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.4byte	.LASF908
	.byte	0x1
	.2byte	0x9ea
	.byte	0xa
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x13be
	.uleb128 0x1f
	.uleb128 0xb
	.byte	0x4
	.4byte	0x67
	.uleb128 0xb
	.byte	0x4
	.4byte	0x35
	.uleb128 0x19
	.4byte	.LASF909
	.byte	0x1
	.2byte	0x97e
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x14a4
	.uleb128 0x1a
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x97f
	.byte	0xa
	.4byte	0x569
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1e
	.4byte	.LASF859
	.byte	0x1
	.2byte	0x980
	.byte	0xb
	.4byte	0x513
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1a
	.ascii	"btr\000"
	.byte	0x1
	.2byte	0x981
	.byte	0xa
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1a
	.ascii	"br\000"
	.byte	0x1
	.2byte	0x982
	.byte	0xb
	.4byte	0x13bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0x985
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x11
	.4byte	.LASF890
	.byte	0x1
	.2byte	0x986
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x11
	.4byte	.LASF809
	.byte	0x1
	.2byte	0x986
	.byte	0x11
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x11
	.4byte	.LASF910
	.byte	0x1
	.2byte	0x986
	.byte	0x17
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x11
	.4byte	.LASF911
	.byte	0x1
	.2byte	0x987
	.byte	0xa
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.ascii	"cc\000"
	.byte	0x1
	.2byte	0x987
	.byte	0x10
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	.LASF908
	.byte	0x1
	.2byte	0x988
	.byte	0xa
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -33
	.uleb128 0x11
	.4byte	.LASF912
	.byte	0x1
	.2byte	0x988
	.byte	0x12
	.4byte	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x19
	.4byte	.LASF913
	.byte	0x1
	.2byte	0x8f9
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x154f
	.uleb128 0x1a
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x8fa
	.byte	0xa
	.4byte	0x569
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x1e
	.4byte	.LASF861
	.byte	0x1
	.2byte	0x8fb
	.byte	0x12
	.4byte	0x685
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1e
	.4byte	.LASF914
	.byte	0x1
	.2byte	0x8fc
	.byte	0xa
	.4byte	0x29
	.uleb128 0x3
	.byte	0x91
	.sleb128 -73
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0x8ff
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1c
	.ascii	"dj\000"
	.byte	0x1
	.2byte	0x900
	.byte	0x9
	.4byte	0x30e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1c
	.ascii	"dir\000"
	.byte	0x1
	.2byte	0x901
	.byte	0xb
	.4byte	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.ascii	"sfn\000"
	.byte	0x1
	.2byte	0x902
	.byte	0x5
	.4byte	0xabb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1c
	.ascii	"dw\000"
	.byte	0x1
	.2byte	0x904
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.ascii	"cl\000"
	.byte	0x1
	.2byte	0x904
	.byte	0xf
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x19
	.4byte	.LASF915
	.byte	0x1
	.2byte	0x8ce
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x15d9
	.uleb128 0x1a
	.ascii	"fs\000"
	.byte	0x1
	.2byte	0x8cf
	.byte	0xc
	.4byte	0x281
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1e
	.4byte	.LASF861
	.byte	0x1
	.2byte	0x8d0
	.byte	0x12
	.4byte	0x685
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1a
	.ascii	"opt\000"
	.byte	0x1
	.2byte	0x8d1
	.byte	0xa
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -33
	.uleb128 0x1c
	.ascii	"cfs\000"
	.byte	0x1
	.2byte	0x8d4
	.byte	0xc
	.4byte	0x281
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.ascii	"vol\000"
	.byte	0x1
	.2byte	0x8d5
	.byte	0x9
	.4byte	0x60
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0x8d6
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x1c
	.ascii	"rp\000"
	.byte	0x1
	.2byte	0x8d7
	.byte	0x12
	.4byte	0x685
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x20
	.4byte	.LASF916
	.byte	0x1
	.2byte	0x8b6
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1615
	.uleb128 0x1a
	.ascii	"obj\000"
	.byte	0x1
	.2byte	0x8b7
	.byte	0xb
	.4byte	0x513
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.ascii	"fil\000"
	.byte	0x1
	.2byte	0x8ba
	.byte	0xa
	.4byte	0x569
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x20
	.4byte	.LASF917
	.byte	0x1
	.2byte	0x811
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1740
	.uleb128 0x1a
	.ascii	"rfs\000"
	.byte	0x1
	.2byte	0x812
	.byte	0xd
	.4byte	0xe80
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x1e
	.4byte	.LASF861
	.byte	0x1
	.2byte	0x813
	.byte	0x13
	.4byte	0x1740
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1e
	.4byte	.LASF918
	.byte	0x1
	.2byte	0x814
	.byte	0xa
	.4byte	0x29
	.uleb128 0x3
	.byte	0x91
	.sleb128 -89
	.uleb128 0x1c
	.ascii	"fmt\000"
	.byte	0x1
	.2byte	0x817
	.byte	0xa
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1c
	.ascii	"pt\000"
	.byte	0x1
	.2byte	0x817
	.byte	0x10
	.4byte	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1c
	.ascii	"vol\000"
	.byte	0x1
	.2byte	0x818
	.byte	0x9
	.4byte	0x60
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x11
	.4byte	.LASF874
	.byte	0x1
	.2byte	0x819
	.byte	0xd
	.4byte	0x446
	.uleb128 0x2
	.byte	0x91
	.sleb128 -41
	.uleb128 0x11
	.4byte	.LASF919
	.byte	0x1
	.2byte	0x81a
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x11
	.4byte	.LASF920
	.byte	0x1
	.2byte	0x81a
	.byte	0x12
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	.LASF921
	.byte	0x1
	.2byte	0x81a
	.byte	0x1a
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.4byte	.LASF922
	.byte	0x1
	.2byte	0x81a
	.byte	0x21
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x11
	.4byte	.LASF887
	.byte	0x1
	.2byte	0x81a
	.byte	0x29
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x11
	.4byte	.LASF923
	.byte	0x1
	.2byte	0x81a
	.byte	0x30
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.ascii	"br\000"
	.byte	0x1
	.2byte	0x81a
	.byte	0x38
	.4byte	0x1746
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x11
	.4byte	.LASF924
	.byte	0x1
	.2byte	0x81b
	.byte	0xa
	.4byte	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -50
	.uleb128 0x1c
	.ascii	"fs\000"
	.byte	0x1
	.2byte	0x81c
	.byte	0xc
	.4byte	0x281
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x81d
	.byte	0xa
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x685
	.uleb128 0x9
	.4byte	0x81
	.4byte	0x1756
	.uleb128 0xe
	.4byte	0x73
	.byte	0x3
	.byte	0
	.uleb128 0x20
	.4byte	.LASF925
	.byte	0x1
	.2byte	0x7f8
	.byte	0x6
	.4byte	0x29
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1791
	.uleb128 0x1a
	.ascii	"fs\000"
	.byte	0x1
	.2byte	0x7f9
	.byte	0xc
	.4byte	0x281
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1e
	.4byte	.LASF809
	.byte	0x1
	.2byte	0x7fa
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x21
	.4byte	.LASF926
	.byte	0x1
	.2byte	0x7bf
	.byte	0x5
	.4byte	0x60
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x17f9
	.uleb128 0x1e
	.4byte	.LASF861
	.byte	0x1
	.2byte	0x7c0
	.byte	0x13
	.4byte	0x1740
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.ascii	"tp\000"
	.byte	0x1
	.2byte	0x7c3
	.byte	0x12
	.4byte	0x685
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1c
	.ascii	"tt\000"
	.byte	0x1
	.2byte	0x7c3
	.byte	0x17
	.4byte	0x685
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x1c
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x7c4
	.byte	0xa
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.ascii	"vol\000"
	.byte	0x1
	.2byte	0x7c5
	.byte	0x9
	.4byte	0x60
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x20
	.4byte	.LASF927
	.byte	0x1
	.2byte	0x785
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1863
	.uleb128 0x1a
	.ascii	"dp\000"
	.byte	0x1
	.2byte	0x786
	.byte	0xa
	.4byte	0xf52
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1e
	.4byte	.LASF861
	.byte	0x1
	.2byte	0x787
	.byte	0x12
	.4byte	0x685
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0x78a
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1c
	.ascii	"dir\000"
	.byte	0x1
	.2byte	0x78b
	.byte	0xb
	.4byte	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.ascii	"ns\000"
	.byte	0x1
	.2byte	0x78b
	.byte	0x10
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x20
	.4byte	.LASF928
	.byte	0x1
	.2byte	0x6b8
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x190f
	.uleb128 0x1a
	.ascii	"dp\000"
	.byte	0x1
	.2byte	0x6b9
	.byte	0xa
	.4byte	0xf52
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1e
	.4byte	.LASF861
	.byte	0x1
	.2byte	0x6ba
	.byte	0x13
	.4byte	0x1740
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.ascii	"b\000"
	.byte	0x1
	.2byte	0x735
	.byte	0xa
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1c
	.ascii	"c\000"
	.byte	0x1
	.2byte	0x735
	.byte	0xd
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x22
	.ascii	"d\000"
	.byte	0x1
	.2byte	0x735
	.byte	0x10
	.4byte	0x29
	.uleb128 0x1c
	.ascii	"sfn\000"
	.byte	0x1
	.2byte	0x735
	.byte	0x14
	.4byte	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.ascii	"ni\000"
	.byte	0x1
	.2byte	0x736
	.byte	0xa
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.ascii	"si\000"
	.byte	0x1
	.2byte	0x736
	.byte	0xe
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x736
	.byte	0x12
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.ascii	"p\000"
	.byte	0x1
	.2byte	0x737
	.byte	0x11
	.4byte	0x515
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x23
	.4byte	.LASF930
	.byte	0x1
	.2byte	0x634
	.byte	0x6
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1980
	.uleb128 0x1a
	.ascii	"dp\000"
	.byte	0x1
	.2byte	0x635
	.byte	0xa
	.4byte	0xf52
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.ascii	"fno\000"
	.byte	0x1
	.2byte	0x636
	.byte	0xe
	.4byte	0xef1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x639
	.byte	0xa
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x1c
	.ascii	"p\000"
	.byte	0x1
	.2byte	0x63a
	.byte	0xc
	.4byte	0x69b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x1c
	.ascii	"c\000"
	.byte	0x1
	.2byte	0x63a
	.byte	0xf
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1c
	.ascii	"dir\000"
	.byte	0x1
	.2byte	0x63b
	.byte	0xb
	.4byte	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x20
	.4byte	.LASF931
	.byte	0x1
	.2byte	0x608
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x19bb
	.uleb128 0x1a
	.ascii	"dp\000"
	.byte	0x1
	.2byte	0x609
	.byte	0xa
	.4byte	0xf52
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0x60c
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x20
	.4byte	.LASF932
	.byte	0x1
	.2byte	0x5be
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x19f6
	.uleb128 0x1a
	.ascii	"dp\000"
	.byte	0x1
	.2byte	0x5bf
	.byte	0xa
	.4byte	0xf52
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0x5c2
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x20
	.4byte	.LASF933
	.byte	0x1
	.2byte	0x586
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1a6d
	.uleb128 0x1a
	.ascii	"dp\000"
	.byte	0x1
	.2byte	0x587
	.byte	0xa
	.4byte	0xf52
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1a
	.ascii	"vol\000"
	.byte	0x1
	.2byte	0x588
	.byte	0x9
	.4byte	0x60
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0x58b
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1c
	.ascii	"a\000"
	.byte	0x1
	.2byte	0x58c
	.byte	0xa
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x1c
	.ascii	"c\000"
	.byte	0x1
	.2byte	0x58c
	.byte	0xd
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x1c
	.ascii	"dir\000"
	.byte	0x1
	.2byte	0x58c
	.byte	0x11
	.4byte	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x20
	.4byte	.LASF934
	.byte	0x1
	.2byte	0x54c
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1ac6
	.uleb128 0x1a
	.ascii	"dp\000"
	.byte	0x1
	.2byte	0x54d
	.byte	0xa
	.4byte	0xf52
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0x550
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1c
	.ascii	"c\000"
	.byte	0x1
	.2byte	0x551
	.byte	0xa
	.4byte	0x29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x1c
	.ascii	"dir\000"
	.byte	0x1
	.2byte	0x551
	.byte	0xe
	.4byte	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x23
	.4byte	.LASF935
	.byte	0x1
	.2byte	0x492
	.byte	0x6
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1afd
	.uleb128 0x1a
	.ascii	"dir\000"
	.byte	0x1
	.2byte	0x493
	.byte	0xb
	.4byte	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x1a
	.ascii	"cl\000"
	.byte	0x1
	.2byte	0x494
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x21
	.4byte	.LASF936
	.byte	0x1
	.2byte	0x482
	.byte	0x7
	.4byte	0x81
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1b47
	.uleb128 0x1a
	.ascii	"fs\000"
	.byte	0x1
	.2byte	0x483
	.byte	0xc
	.4byte	0x281
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1a
	.ascii	"dir\000"
	.byte	0x1
	.2byte	0x484
	.byte	0x11
	.4byte	0x13c5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.ascii	"cl\000"
	.byte	0x1
	.2byte	0x487
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x20
	.4byte	.LASF937
	.byte	0x1
	.2byte	0x462
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1ba0
	.uleb128 0x1a
	.ascii	"dp\000"
	.byte	0x1
	.2byte	0x463
	.byte	0xa
	.4byte	0xf52
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1e
	.4byte	.LASF938
	.byte	0x1
	.2byte	0x464
	.byte	0xa
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0x467
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1c
	.ascii	"n\000"
	.byte	0x1
	.2byte	0x468
	.byte	0xa
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x20
	.4byte	.LASF939
	.byte	0x1
	.2byte	0x41f
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1c07
	.uleb128 0x1a
	.ascii	"dp\000"
	.byte	0x1
	.2byte	0x420
	.byte	0xa
	.4byte	0xf52
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1e
	.4byte	.LASF940
	.byte	0x1
	.2byte	0x421
	.byte	0x9
	.4byte	0x60
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x11
	.4byte	.LASF890
	.byte	0x1
	.2byte	0x424
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1c
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x425
	.byte	0xa
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.ascii	"c\000"
	.byte	0x1
	.2byte	0x427
	.byte	0xa
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x20
	.4byte	.LASF941
	.byte	0x1
	.2byte	0x3f3
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1c71
	.uleb128 0x1a
	.ascii	"dp\000"
	.byte	0x1
	.2byte	0x3f4
	.byte	0xa
	.4byte	0xf52
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1a
	.ascii	"idx\000"
	.byte	0x1
	.2byte	0x3f5
	.byte	0xa
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x11
	.4byte	.LASF890
	.byte	0x1
	.2byte	0x3f8
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x11
	.4byte	.LASF809
	.byte	0x1
	.2byte	0x3f8
	.byte	0x11
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.ascii	"ic\000"
	.byte	0x1
	.2byte	0x3f9
	.byte	0xa
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x21
	.4byte	.LASF942
	.byte	0x1
	.2byte	0x3db
	.byte	0x7
	.4byte	0x81
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1cdb
	.uleb128 0x1a
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x3dc
	.byte	0xa
	.4byte	0x569
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.ascii	"ofs\000"
	.byte	0x1
	.2byte	0x3dd
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.ascii	"cl\000"
	.byte	0x1
	.2byte	0x3e0
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x1c
	.ascii	"ncl\000"
	.byte	0x1
	.2byte	0x3e0
	.byte	0xf
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1c
	.ascii	"tbl\000"
	.byte	0x1
	.2byte	0x3e0
	.byte	0x15
	.4byte	0x28d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x20
	.4byte	.LASF943
	.byte	0x1
	.2byte	0x3a1
	.byte	0x7
	.4byte	0x81
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1d55
	.uleb128 0x1a
	.ascii	"fs\000"
	.byte	0x1
	.2byte	0x3a2
	.byte	0xc
	.4byte	0x281
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1e
	.4byte	.LASF890
	.byte	0x1
	.2byte	0x3a3
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.ascii	"cs\000"
	.byte	0x1
	.2byte	0x3a6
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.ascii	"ncl\000"
	.byte	0x1
	.2byte	0x3a6
	.byte	0xf
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1c
	.ascii	"scl\000"
	.byte	0x1
	.2byte	0x3a6
	.byte	0x14
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0x3a7
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x20
	.4byte	.LASF944
	.byte	0x1
	.2byte	0x36f
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1db0
	.uleb128 0x1a
	.ascii	"fs\000"
	.byte	0x1
	.2byte	0x370
	.byte	0xc
	.4byte	0x281
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1e
	.4byte	.LASF890
	.byte	0x1
	.2byte	0x371
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0x374
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1c
	.ascii	"nxt\000"
	.byte	0x1
	.2byte	0x375
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x19
	.4byte	.LASF945
	.byte	0x1
	.2byte	0x333
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1e28
	.uleb128 0x1a
	.ascii	"fs\000"
	.byte	0x1
	.2byte	0x334
	.byte	0xc
	.4byte	0x281
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1e
	.4byte	.LASF890
	.byte	0x1
	.2byte	0x335
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1a
	.ascii	"val\000"
	.byte	0x1
	.2byte	0x336
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1c
	.ascii	"bc\000"
	.byte	0x1
	.2byte	0x339
	.byte	0xa
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.ascii	"p\000"
	.byte	0x1
	.2byte	0x33a
	.byte	0xb
	.4byte	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0x33b
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x19
	.4byte	.LASF946
	.byte	0x1
	.2byte	0x300
	.byte	0x7
	.4byte	0x81
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1e9f
	.uleb128 0x1a
	.ascii	"fs\000"
	.byte	0x1
	.2byte	0x301
	.byte	0xc
	.4byte	0x281
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1e
	.4byte	.LASF890
	.byte	0x1
	.2byte	0x302
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.ascii	"wc\000"
	.byte	0x1
	.2byte	0x305
	.byte	0xa
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.ascii	"bc\000"
	.byte	0x1
	.2byte	0x305
	.byte	0xe
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.ascii	"p\000"
	.byte	0x1
	.2byte	0x306
	.byte	0xb
	.4byte	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.ascii	"val\000"
	.byte	0x1
	.2byte	0x307
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x24
	.4byte	.LASF947
	.byte	0x1
	.2byte	0x2f1
	.byte	0x7
	.4byte	0x81
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1eda
	.uleb128 0x1a
	.ascii	"fs\000"
	.byte	0x1
	.2byte	0x2f2
	.byte	0xc
	.4byte	0x281
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x1e
	.4byte	.LASF890
	.byte	0x1
	.2byte	0x2f3
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x20
	.4byte	.LASF948
	.byte	0x1
	.2byte	0x2cd
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1f15
	.uleb128 0x1a
	.ascii	"fs\000"
	.byte	0x1
	.2byte	0x2ce
	.byte	0xc
	.4byte	0x281
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0x2d1
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x20
	.4byte	.LASF949
	.byte	0x1
	.2byte	0x2b2
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1f60
	.uleb128 0x1a
	.ascii	"fs\000"
	.byte	0x1
	.2byte	0x2b3
	.byte	0xc
	.4byte	0x281
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1e
	.4byte	.LASF950
	.byte	0x1
	.2byte	0x2b4
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0x2b7
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x20
	.4byte	.LASF951
	.byte	0x1
	.2byte	0x297
	.byte	0x9
	.4byte	0x40d
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1fba
	.uleb128 0x1a
	.ascii	"fs\000"
	.byte	0x1
	.2byte	0x298
	.byte	0xc
	.4byte	0x281
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.4byte	.LASF865
	.byte	0x1
	.2byte	0x29b
	.byte	0xb
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1c
	.ascii	"nf\000"
	.byte	0x1
	.2byte	0x29c
	.byte	0xa
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.2byte	0x29d
	.byte	0xd
	.4byte	0x40d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x21
	.4byte	.LASF952
	.byte	0x1
	.2byte	0x20a
	.byte	0x5
	.4byte	0x60
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1ff6
	.uleb128 0x1a
	.ascii	"str\000"
	.byte	0x1
	.2byte	0x20a
	.byte	0x1a
	.4byte	0x515
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x1a
	.ascii	"chr\000"
	.byte	0x1
	.2byte	0x20a
	.byte	0x23
	.4byte	0x60
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x21
	.4byte	.LASF953
	.byte	0x1
	.2byte	0x200
	.byte	0x5
	.4byte	0x60
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x206c
	.uleb128 0x1a
	.ascii	"dst\000"
	.byte	0x1
	.2byte	0x200
	.byte	0x1a
	.4byte	0x13b8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.ascii	"src\000"
	.byte	0x1
	.2byte	0x200
	.byte	0x2b
	.4byte	0x13b8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.ascii	"cnt\000"
	.byte	0x1
	.2byte	0x200
	.byte	0x35
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.ascii	"d\000"
	.byte	0x1
	.2byte	0x201
	.byte	0x11
	.4byte	0x13c5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x1c
	.ascii	"s\000"
	.byte	0x1
	.2byte	0x201
	.byte	0x29
	.4byte	0x13c5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x1c
	.ascii	"r\000"
	.byte	0x1
	.2byte	0x202
	.byte	0x9
	.4byte	0x60
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x23
	.4byte	.LASF954
	.byte	0x1
	.2byte	0x1f7
	.byte	0x6
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x20c2
	.uleb128 0x1a
	.ascii	"dst\000"
	.byte	0x1
	.2byte	0x1f7
	.byte	0x15
	.4byte	0x513
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1a
	.ascii	"val\000"
	.byte	0x1
	.2byte	0x1f7
	.byte	0x1e
	.4byte	0x60
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1a
	.ascii	"cnt\000"
	.byte	0x1
	.2byte	0x1f7
	.byte	0x28
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.ascii	"d\000"
	.byte	0x1
	.2byte	0x1f8
	.byte	0xb
	.4byte	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x25
	.4byte	.LASF959
	.byte	0x1
	.2byte	0x1e6
	.byte	0x6
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1a
	.ascii	"dst\000"
	.byte	0x1
	.2byte	0x1e6
	.byte	0x15
	.4byte	0x513
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1a
	.ascii	"src\000"
	.byte	0x1
	.2byte	0x1e6
	.byte	0x26
	.4byte	0x13b8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1a
	.ascii	"cnt\000"
	.byte	0x1
	.2byte	0x1e6
	.byte	0x30
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.ascii	"d\000"
	.byte	0x1
	.2byte	0x1e7
	.byte	0xb
	.4byte	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x1c
	.ascii	"s\000"
	.byte	0x1
	.2byte	0x1e8
	.byte	0x11
	.4byte	0x13c5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x6
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0x5
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x16
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
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x10
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x16
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
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x1f
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
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
	.byte	0
	.byte	0
	.uleb128 0x23
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x4f2
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x2123
	.4byte	0x394
	.ascii	"FR_OK\000"
	.4byte	0x39a
	.ascii	"FR_DISK_ERR\000"
	.4byte	0x3a0
	.ascii	"FR_INT_ERR\000"
	.4byte	0x3a6
	.ascii	"FR_NOT_READY\000"
	.4byte	0x3ac
	.ascii	"FR_NO_FILE\000"
	.4byte	0x3b2
	.ascii	"FR_NO_PATH\000"
	.4byte	0x3b8
	.ascii	"FR_INVALID_NAME\000"
	.4byte	0x3be
	.ascii	"FR_DENIED\000"
	.4byte	0x3c4
	.ascii	"FR_EXIST\000"
	.4byte	0x3ca
	.ascii	"FR_INVALID_OBJECT\000"
	.4byte	0x3d0
	.ascii	"FR_WRITE_PROTECTED\000"
	.4byte	0x3d6
	.ascii	"FR_INVALID_DRIVE\000"
	.4byte	0x3dc
	.ascii	"FR_NOT_ENABLED\000"
	.4byte	0x3e2
	.ascii	"FR_NO_FILESYSTEM\000"
	.4byte	0x3e8
	.ascii	"FR_MKFS_ABORTED\000"
	.4byte	0x3ee
	.ascii	"FR_TIMEOUT\000"
	.4byte	0x3f4
	.ascii	"FR_LOCKED\000"
	.4byte	0x3fa
	.ascii	"FR_NOT_ENOUGH_CORE\000"
	.4byte	0x400
	.ascii	"FR_TOO_MANY_OPEN_FILES\000"
	.4byte	0x406
	.ascii	"FR_INVALID_PARAMETER\000"
	.4byte	0x460
	.ascii	"RES_OK\000"
	.4byte	0x466
	.ascii	"RES_ERROR\000"
	.4byte	0x46c
	.ascii	"RES_WRPRT\000"
	.4byte	0x472
	.ascii	"RES_NOTRDY\000"
	.4byte	0x478
	.ascii	"RES_PARERR\000"
	.4byte	0x48f
	.ascii	"FatFs\000"
	.4byte	0x4a2
	.ascii	"Fsid\000"
	.4byte	0x4b5
	.ascii	"CurrVol\000"
	.4byte	0x4dd
	.ascii	"ExCvt\000"
	.4byte	0x48f
	.ascii	"FatFs\000"
	.4byte	0x4a2
	.ascii	"Fsid\000"
	.4byte	0x4b5
	.ascii	"CurrVol\000"
	.4byte	0x58c
	.ascii	"f_printf\000"
	.4byte	0x6a1
	.ascii	"f_puts\000"
	.4byte	0x6fe
	.ascii	"f_putc\000"
	.4byte	0x759
	.ascii	"putc_bfd\000"
	.4byte	0x7b1
	.ascii	"f_gets\000"
	.4byte	0x853
	.ascii	"f_mkfs\000"
	.4byte	0xa3a
	.ascii	"f_utime\000"
	.4byte	0xacb
	.ascii	"f_rename\000"
	.4byte	0xb8b
	.ascii	"f_chmod\000"
	.4byte	0xc16
	.ascii	"f_mkdir\000"
	.4byte	0xcd0
	.ascii	"f_unlink\000"
	.4byte	0xd5e
	.ascii	"f_truncate\000"
	.4byte	0xda9
	.ascii	"f_getfree\000"
	.4byte	0xe86
	.ascii	"f_stat\000"
	.4byte	0xef7
	.ascii	"f_readdir\000"
	.4byte	0xf58
	.ascii	"f_closedir\000"
	.4byte	0xf93
	.ascii	"f_opendir\000"
	.4byte	0xffd
	.ascii	"f_lseek\000"
	.4byte	0x1109
	.ascii	"f_getcwd\000"
	.4byte	0x11c3
	.ascii	"f_chdir\000"
	.4byte	0x121e
	.ascii	"f_chdrive\000"
	.4byte	0x125a
	.ascii	"f_close\000"
	.4byte	0x1295
	.ascii	"f_sync\000"
	.4byte	0x12ef
	.ascii	"f_write\000"
	.4byte	0x13cb
	.ascii	"f_read\000"
	.4byte	0x14a4
	.ascii	"f_open\000"
	.4byte	0x154f
	.ascii	"f_mount\000"
	.4byte	0x15d9
	.ascii	"validate\000"
	.4byte	0x1615
	.ascii	"find_volume\000"
	.4byte	0x1756
	.ascii	"check_fs\000"
	.4byte	0x1791
	.ascii	"get_ldnumber\000"
	.4byte	0x17f9
	.ascii	"follow_path\000"
	.4byte	0x1863
	.ascii	"create_name\000"
	.4byte	0x190f
	.ascii	"get_fileinfo\000"
	.4byte	0x1980
	.ascii	"dir_remove\000"
	.4byte	0x19bb
	.ascii	"dir_register\000"
	.4byte	0x19f6
	.ascii	"dir_read\000"
	.4byte	0x1a6d
	.ascii	"dir_find\000"
	.4byte	0x1ac6
	.ascii	"st_clust\000"
	.4byte	0x1afd
	.ascii	"ld_clust\000"
	.4byte	0x1b47
	.ascii	"dir_alloc\000"
	.4byte	0x1ba0
	.ascii	"dir_next\000"
	.4byte	0x1c07
	.ascii	"dir_sdi\000"
	.4byte	0x1c71
	.ascii	"clmt_clust\000"
	.4byte	0x1cdb
	.ascii	"create_chain\000"
	.4byte	0x1d55
	.ascii	"remove_chain\000"
	.4byte	0x1db0
	.ascii	"put_fat\000"
	.4byte	0x1e28
	.ascii	"get_fat\000"
	.4byte	0x1e9f
	.ascii	"clust2sect\000"
	.4byte	0x1eda
	.ascii	"sync_fs\000"
	.4byte	0x1f15
	.ascii	"move_window\000"
	.4byte	0x1f60
	.ascii	"sync_window\000"
	.4byte	0x1fba
	.ascii	"chk_chr\000"
	.4byte	0x1ff6
	.ascii	"mem_cmp\000"
	.4byte	0x206c
	.ascii	"mem_set\000"
	.4byte	0x20c2
	.ascii	"mem_cpy\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x182
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x2123
	.4byte	0x3a
	.ascii	"unsigned char\000"
	.4byte	0x29
	.ascii	"BYTE\000"
	.4byte	0x41
	.ascii	"short int\000"
	.4byte	0x59
	.ascii	"short unsigned int\000"
	.4byte	0x48
	.ascii	"WORD\000"
	.4byte	0x60
	.ascii	"int\000"
	.4byte	0x73
	.ascii	"unsigned int\000"
	.4byte	0x67
	.ascii	"UINT\000"
	.4byte	0x7a
	.ascii	"long int\000"
	.4byte	0x8d
	.ascii	"long unsigned int\000"
	.4byte	0x81
	.ascii	"DWORD\000"
	.4byte	0xa5
	.ascii	"char\000"
	.4byte	0x94
	.ascii	"TCHAR\000"
	.4byte	0x1c3
	.ascii	"FATFS\000"
	.4byte	0x293
	.ascii	"FIL\000"
	.4byte	0x30e
	.ascii	"DIR\000"
	.4byte	0x375
	.ascii	"FILINFO\000"
	.4byte	0x40d
	.ascii	"FRESULT\000"
	.4byte	0x419
	.ascii	"signed char\000"
	.4byte	0x420
	.ascii	"uint8_t\000"
	.4byte	0x42c
	.ascii	"long long int\000"
	.4byte	0x433
	.ascii	"long long unsigned int\000"
	.4byte	0x43a
	.ascii	"dstatus_t\000"
	.4byte	0x446
	.ascii	"DSTATUS\000"
	.4byte	0x4fc
	.ascii	"__va_list\000"
	.4byte	0x4f0
	.ascii	"__va_list\000"
	.4byte	0x51b
	.ascii	"va_list\000"
	.4byte	0x57f
	.ascii	"putbuff\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1d4
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
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
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
	.4byte	.LFB36
	.4byte	.LFE36
	.4byte	.LFB37
	.4byte	.LFE37
	.4byte	.LFB38
	.4byte	.LFE38
	.4byte	.LFB39
	.4byte	.LFE39
	.4byte	.LFB40
	.4byte	.LFE40
	.4byte	.LFB41
	.4byte	.LFE41
	.4byte	.LFB42
	.4byte	.LFE42
	.4byte	.LFB43
	.4byte	.LFE43
	.4byte	.LFB44
	.4byte	.LFE44
	.4byte	.LFB45
	.4byte	.LFE45
	.4byte	.LFB46
	.4byte	.LFE46
	.4byte	.LFB47
	.4byte	.LFE47
	.4byte	.LFB48
	.4byte	.LFE48
	.4byte	.LFB49
	.4byte	.LFE49
	.4byte	.LFB50
	.4byte	.LFE50
	.4byte	.LFB51
	.4byte	.LFE51
	.4byte	.LFB52
	.4byte	.LFE52
	.4byte	.LFB53
	.4byte	.LFE53
	.4byte	.LFB54
	.4byte	.LFE54
	.4byte	.LFB55
	.4byte	.LFE55
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
	.uleb128 0x12
	.uleb128 0x3
	.byte	0x5
	.uleb128 0x13
	.4byte	.LASF463
	.file 9 "/home/tommy/Documents/CrossWorks Projects/Executable_1/Device/Middleware/fatfs/src/ffconf.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x9
	.file 10 "/home/tommy/Documents/CrossWorks Projects/Executable_1/Device/Config/conf_fatfs.h"
	.byte	0x3
	.uleb128 0x4
	.uleb128 0xa
	.byte	0x7
	.4byte	.Ldebug_macro3
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0x2
	.byte	0x5
	.uleb128 0x6
	.4byte	.LASF500
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro4
	.byte	0x4
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x5
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF536
	.byte	0x3
	.uleb128 0x28
	.uleb128 0x4
	.byte	0x7
	.4byte	.Ldebug_macro5
	.byte	0x4
	.file 11 "/home/tommy/Documents/CrossWorks Projects/Executable_1/Device/Middleware/ASF/hal/utils/include/err_codes.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0xb
	.byte	0x7
	.4byte	.Ldebug_macro6
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro7
	.byte	0x4
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF659
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF660
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF661
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF662
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF663
	.byte	0x5
	.uleb128 0xac
	.4byte	.LASF664
	.byte	0x5
	.uleb128 0xad
	.4byte	.LASF665
	.byte	0x5
	.uleb128 0x13b
	.4byte	.LASF666
	.byte	0x5
	.uleb128 0x13c
	.4byte	.LASF667
	.byte	0x5
	.uleb128 0x13d
	.4byte	.LASF668
	.byte	0x5
	.uleb128 0x14f
	.4byte	.LASF669
	.byte	0x5
	.uleb128 0x150
	.4byte	.LASF670
	.byte	0x5
	.uleb128 0x155
	.4byte	.LASF671
	.byte	0x5
	.uleb128 0x156
	.4byte	.LASF672
	.byte	0x5
	.uleb128 0x157
	.4byte	.LASF673
	.byte	0x5
	.uleb128 0x158
	.4byte	.LASF674
	.byte	0x5
	.uleb128 0x159
	.4byte	.LASF675
	.byte	0x5
	.uleb128 0x15a
	.4byte	.LASF676
	.byte	0x5
	.uleb128 0x15b
	.4byte	.LASF677
	.byte	0x5
	.uleb128 0x15e
	.4byte	.LASF678
	.byte	0x5
	.uleb128 0x15f
	.4byte	.LASF679
	.byte	0x5
	.uleb128 0x165
	.4byte	.LASF680
	.byte	0x5
	.uleb128 0x166
	.4byte	.LASF681
	.byte	0x5
	.uleb128 0x167
	.4byte	.LASF682
	.byte	0x5
	.uleb128 0x168
	.4byte	.LASF683
	.byte	0x5
	.uleb128 0x169
	.4byte	.LASF684
	.byte	0x5
	.uleb128 0x16a
	.4byte	.LASF685
	.byte	0x5
	.uleb128 0x16b
	.4byte	.LASF686
	.byte	0x5
	.uleb128 0x16c
	.4byte	.LASF687
	.byte	0x5
	.uleb128 0x16d
	.4byte	.LASF688
	.byte	0x5
	.uleb128 0x16e
	.4byte	.LASF689
	.byte	0x5
	.uleb128 0x16f
	.4byte	.LASF690
	.byte	0x5
	.uleb128 0x170
	.4byte	.LASF691
	.byte	0x5
	.uleb128 0x171
	.4byte	.LASF692
	.byte	0x5
	.uleb128 0x172
	.4byte	.LASF693
	.byte	0x5
	.uleb128 0x173
	.4byte	.LASF694
	.byte	0x5
	.uleb128 0x174
	.4byte	.LASF695
	.byte	0x5
	.uleb128 0x175
	.4byte	.LASF696
	.byte	0x5
	.uleb128 0x176
	.4byte	.LASF697
	.byte	0x5
	.uleb128 0x177
	.4byte	.LASF698
	.byte	0x5
	.uleb128 0x178
	.4byte	.LASF699
	.byte	0x5
	.uleb128 0x179
	.4byte	.LASF700
	.byte	0x5
	.uleb128 0x17a
	.4byte	.LASF701
	.byte	0x5
	.uleb128 0x17b
	.4byte	.LASF702
	.byte	0x5
	.uleb128 0x17c
	.4byte	.LASF703
	.byte	0x5
	.uleb128 0x17d
	.4byte	.LASF704
	.byte	0x5
	.uleb128 0x17e
	.4byte	.LASF705
	.byte	0x5
	.uleb128 0x17f
	.4byte	.LASF706
	.byte	0x5
	.uleb128 0x180
	.4byte	.LASF707
	.byte	0x5
	.uleb128 0x181
	.4byte	.LASF708
	.byte	0x5
	.uleb128 0x182
	.4byte	.LASF709
	.byte	0x5
	.uleb128 0x183
	.4byte	.LASF710
	.byte	0x5
	.uleb128 0x184
	.4byte	.LASF711
	.byte	0x5
	.uleb128 0x185
	.4byte	.LASF712
	.byte	0x5
	.uleb128 0x186
	.4byte	.LASF713
	.byte	0x5
	.uleb128 0x187
	.4byte	.LASF714
	.byte	0x5
	.uleb128 0x188
	.4byte	.LASF715
	.byte	0x5
	.uleb128 0x189
	.4byte	.LASF716
	.byte	0x5
	.uleb128 0x18a
	.4byte	.LASF717
	.byte	0x5
	.uleb128 0x18b
	.4byte	.LASF718
	.byte	0x5
	.uleb128 0x18d
	.4byte	.LASF719
	.byte	0x5
	.uleb128 0x18e
	.4byte	.LASF720
	.byte	0x5
	.uleb128 0x18f
	.4byte	.LASF721
	.byte	0x5
	.uleb128 0x190
	.4byte	.LASF722
	.byte	0x5
	.uleb128 0x191
	.4byte	.LASF723
	.byte	0x5
	.uleb128 0x192
	.4byte	.LASF724
	.byte	0x5
	.uleb128 0x193
	.4byte	.LASF725
	.byte	0x5
	.uleb128 0x194
	.4byte	.LASF726
	.byte	0x5
	.uleb128 0x195
	.4byte	.LASF727
	.byte	0x5
	.uleb128 0x196
	.4byte	.LASF728
	.byte	0x5
	.uleb128 0x197
	.4byte	.LASF729
	.byte	0x5
	.uleb128 0x198
	.4byte	.LASF730
	.byte	0x5
	.uleb128 0x199
	.4byte	.LASF731
	.byte	0x5
	.uleb128 0x19a
	.4byte	.LASF732
	.byte	0x5
	.uleb128 0x19b
	.4byte	.LASF733
	.byte	0x5
	.uleb128 0x19c
	.4byte	.LASF734
	.byte	0x5
	.uleb128 0x19d
	.4byte	.LASF735
	.byte	0x5
	.uleb128 0x19e
	.4byte	.LASF736
	.byte	0x5
	.uleb128 0x19f
	.4byte	.LASF737
	.byte	0x5
	.uleb128 0x1a0
	.4byte	.LASF738
	.byte	0x5
	.uleb128 0x1a1
	.4byte	.LASF739
	.byte	0x5
	.uleb128 0x1bd
	.4byte	.LASF740
	.byte	0x5
	.uleb128 0x1be
	.4byte	.LASF741
	.byte	0x5
	.uleb128 0x1bf
	.4byte	.LASF742
	.byte	0x5
	.uleb128 0xeec
	.4byte	.LASF743
	.byte	0x5
	.uleb128 0xeed
	.4byte	.LASF744
	.byte	0x3
	.uleb128 0x106c
	.uleb128 0x7
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF745
	.byte	0x3
	.uleb128 0xf
	.uleb128 0x6
	.byte	0x7
	.4byte	.Ldebug_macro8
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro9
	.byte	0x4
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
	.section	.debug_macro,"G",%progbits,wm4.conf_fatfs.h.3.2b1ac254e6e56cdb19fdb67145e3d52b,comdat
.Ldebug_macro3:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3
	.4byte	.LASF464
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF465
	.byte	0x5
	.uleb128 0x16
	.4byte	.LASF466
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF467
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF468
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF469
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF470
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF471
	.byte	0x5
	.uleb128 0x44
	.4byte	.LASF472
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF473
	.byte	0x5
	.uleb128 0x59
	.4byte	.LASF474
	.byte	0x5
	.uleb128 0x64
	.4byte	.LASF475
	.byte	0x5
	.uleb128 0x6f
	.4byte	.LASF476
	.byte	0x5
	.uleb128 0x76
	.4byte	.LASF477
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF478
	.byte	0x5
	.uleb128 0x7f
	.4byte	.LASF479
	.byte	0x5
	.uleb128 0x86
	.4byte	.LASF480
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF481
	.byte	0x5
	.uleb128 0x94
	.4byte	.LASF482
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF483
	.byte	0x5
	.uleb128 0xc7
	.4byte	.LASF484
	.byte	0x5
	.uleb128 0xce
	.4byte	.LASF485
	.byte	0x5
	.uleb128 0xd7
	.4byte	.LASF486
	.byte	0x5
	.uleb128 0xe2
	.4byte	.LASF487
	.byte	0x5
	.uleb128 0xec
	.4byte	.LASF488
	.byte	0x5
	.uleb128 0xf9
	.4byte	.LASF489
	.byte	0x5
	.uleb128 0xfc
	.4byte	.LASF490
	.byte	0x5
	.uleb128 0xfd
	.4byte	.LASF491
	.byte	0x5
	.uleb128 0xfe
	.4byte	.LASF492
	.byte	0x5
	.uleb128 0x104
	.4byte	.LASF493
	.byte	0x5
	.uleb128 0x10b
	.4byte	.LASF494
	.byte	0x5
	.uleb128 0x112
	.4byte	.LASF495
	.byte	0x5
	.uleb128 0x119
	.4byte	.LASF496
	.byte	0x5
	.uleb128 0x120
	.4byte	.LASF497
	.byte	0x5
	.uleb128 0x127
	.4byte	.LASF498
	.byte	0x5
	.uleb128 0x12e
	.4byte	.LASF499
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.ff.h.43.937289338d060a01ed4be062a1c2f204,comdat
.Ldebug_macro4:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF501
	.byte	0x5
	.uleb128 0x2c
	.4byte	.LASF502
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF503
	.byte	0x5
	.uleb128 0x40
	.4byte	.LASF504
	.byte	0x5
	.uleb128 0xe4
	.4byte	.LASF505
	.byte	0x5
	.uleb128 0xe5
	.4byte	.LASF506
	.byte	0x5
	.uleb128 0xe6
	.4byte	.LASF507
	.byte	0x5
	.uleb128 0xe7
	.4byte	.LASF508
	.byte	0x5
	.uleb128 0xe8
	.4byte	.LASF509
	.byte	0x5
	.uleb128 0xe9
	.4byte	.LASF510
	.byte	0x5
	.uleb128 0xec
	.4byte	.LASF511
	.byte	0x5
	.uleb128 0x10e
	.4byte	.LASF512
	.byte	0x5
	.uleb128 0x10f
	.4byte	.LASF513
	.byte	0x5
	.uleb128 0x112
	.4byte	.LASF514
	.byte	0x5
	.uleb128 0x113
	.4byte	.LASF515
	.byte	0x5
	.uleb128 0x114
	.4byte	.LASF516
	.byte	0x5
	.uleb128 0x115
	.4byte	.LASF517
	.byte	0x5
	.uleb128 0x116
	.4byte	.LASF518
	.byte	0x5
	.uleb128 0x117
	.4byte	.LASF519
	.byte	0x5
	.uleb128 0x11c
	.4byte	.LASF520
	.byte	0x5
	.uleb128 0x11d
	.4byte	.LASF521
	.byte	0x5
	.uleb128 0x11e
	.4byte	.LASF522
	.byte	0x5
	.uleb128 0x122
	.4byte	.LASF523
	.byte	0x5
	.uleb128 0x123
	.4byte	.LASF524
	.byte	0x5
	.uleb128 0x124
	.4byte	.LASF525
	.byte	0x5
	.uleb128 0x125
	.4byte	.LASF526
	.byte	0x5
	.uleb128 0x126
	.4byte	.LASF527
	.byte	0x5
	.uleb128 0x127
	.4byte	.LASF528
	.byte	0x5
	.uleb128 0x128
	.4byte	.LASF529
	.byte	0x5
	.uleb128 0x129
	.4byte	.LASF530
	.byte	0x5
	.uleb128 0x12c
	.4byte	.LASF531
	.byte	0x5
	.uleb128 0x137
	.4byte	.LASF532
	.byte	0x5
	.uleb128 0x138
	.4byte	.LASF533
	.byte	0x5
	.uleb128 0x139
	.4byte	.LASF534
	.byte	0x5
	.uleb128 0x13a
	.4byte	.LASF535
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdint.h.12.d2ee4a35a2f8e2c572adfb49535917eb,comdat
.Ldebug_macro5:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF537
	.byte	0x5
	.uleb128 0x5e
	.4byte	.LASF538
	.byte	0x5
	.uleb128 0x60
	.4byte	.LASF539
	.byte	0x5
	.uleb128 0x61
	.4byte	.LASF540
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF541
	.byte	0x5
	.uleb128 0x65
	.4byte	.LASF542
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF543
	.byte	0x5
	.uleb128 0x68
	.4byte	.LASF544
	.byte	0x5
	.uleb128 0x69
	.4byte	.LASF545
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF546
	.byte	0x5
	.uleb128 0x6c
	.4byte	.LASF547
	.byte	0x5
	.uleb128 0x6d
	.4byte	.LASF548
	.byte	0x5
	.uleb128 0x6e
	.4byte	.LASF549
	.byte	0x5
	.uleb128 0x70
	.4byte	.LASF550
	.byte	0x5
	.uleb128 0x71
	.4byte	.LASF551
	.byte	0x5
	.uleb128 0x72
	.4byte	.LASF552
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF553
	.byte	0x5
	.uleb128 0x76
	.4byte	.LASF554
	.byte	0x5
	.uleb128 0x77
	.4byte	.LASF555
	.byte	0x5
	.uleb128 0x78
	.4byte	.LASF556
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF557
	.byte	0x5
	.uleb128 0x7a
	.4byte	.LASF558
	.byte	0x5
	.uleb128 0x7b
	.4byte	.LASF559
	.byte	0x5
	.uleb128 0x7c
	.4byte	.LASF560
	.byte	0x5
	.uleb128 0x7d
	.4byte	.LASF561
	.byte	0x5
	.uleb128 0x7e
	.4byte	.LASF562
	.byte	0x5
	.uleb128 0x7f
	.4byte	.LASF563
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF564
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF565
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF566
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF567
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF568
	.byte	0x5
	.uleb128 0x86
	.4byte	.LASF569
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF570
	.byte	0x5
	.uleb128 0x88
	.4byte	.LASF571
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF572
	.byte	0x5
	.uleb128 0x8a
	.4byte	.LASF573
	.byte	0x5
	.uleb128 0x8b
	.4byte	.LASF574
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF575
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF576
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF577
	.byte	0x5
	.uleb128 0x93
	.4byte	.LASF578
	.byte	0x5
	.uleb128 0x94
	.4byte	.LASF579
	.byte	0x5
	.uleb128 0x96
	.4byte	.LASF580
	.byte	0x5
	.uleb128 0x97
	.4byte	.LASF581
	.byte	0x5
	.uleb128 0x98
	.4byte	.LASF582
	.byte	0x5
	.uleb128 0xa8
	.4byte	.LASF583
	.byte	0x5
	.uleb128 0xa9
	.4byte	.LASF584
	.byte	0x5
	.uleb128 0xaa
	.4byte	.LASF585
	.byte	0x5
	.uleb128 0xab
	.4byte	.LASF586
	.byte	0x5
	.uleb128 0xac
	.4byte	.LASF587
	.byte	0x5
	.uleb128 0xad
	.4byte	.LASF588
	.byte	0x5
	.uleb128 0xae
	.4byte	.LASF589
	.byte	0x5
	.uleb128 0xaf
	.4byte	.LASF590
	.byte	0x5
	.uleb128 0xb1
	.4byte	.LASF591
	.byte	0x5
	.uleb128 0xb2
	.4byte	.LASF592
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF593
	.byte	0x5
	.uleb128 0xbd
	.4byte	.LASF594
	.byte	0x5
	.uleb128 0xc8
	.4byte	.LASF595
	.byte	0x5
	.uleb128 0xc9
	.4byte	.LASF596
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.err_codes.h.38.38523347db215877ebfe19fe7fd8435c,comdat
.Ldebug_macro6:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF597
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF598
	.byte	0x5
	.uleb128 0x29
	.4byte	.LASF599
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF600
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF601
	.byte	0x5
	.uleb128 0x2c
	.4byte	.LASF602
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF603
	.byte	0x5
	.uleb128 0x2e
	.4byte	.LASF604
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF605
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF606
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF607
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF608
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF609
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF610
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF611
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF612
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF613
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF614
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF615
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF616
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF617
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF618
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF619
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF620
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF621
	.byte	0x5
	.uleb128 0x40
	.4byte	.LASF622
	.byte	0x5
	.uleb128 0x41
	.4byte	.LASF623
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF624
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF625
	.byte	0x5
	.uleb128 0x44
	.4byte	.LASF626
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF627
	.byte	0x5
	.uleb128 0x46
	.4byte	.LASF628
	.byte	0x5
	.uleb128 0x47
	.4byte	.LASF629
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.diskio.h.48.38813cf4771ea4fb5c8125f88bdb5f89,comdat
.Ldebug_macro7:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF630
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF631
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF632
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF633
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF634
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF635
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF636
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF637
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF638
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF639
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF640
	.byte	0x5
	.uleb128 0x41
	.4byte	.LASF641
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF642
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF643
	.byte	0x5
	.uleb128 0x46
	.4byte	.LASF644
	.byte	0x5
	.uleb128 0x47
	.4byte	.LASF645
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF646
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF647
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF648
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF649
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF650
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF651
	.byte	0x5
	.uleb128 0x52
	.4byte	.LASF652
	.byte	0x5
	.uleb128 0x62
	.4byte	.LASF653
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF654
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF655
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF656
	.byte	0x5
	.uleb128 0x6c
	.4byte	.LASF657
	.byte	0x5
	.uleb128 0x6d
	.4byte	.LASF658
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.__crossworks.h.12.efc3e96636a4739fb7ba08de04b37a44,comdat
.Ldebug_macro8:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF746
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF747
	.byte	0x6
	.uleb128 0x22
	.4byte	.LASF748
	.byte	0x5
	.uleb128 0x24
	.4byte	.LASF749
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF750
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF751
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF752
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF747
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF753
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF754
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF755
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF756
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF757
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF758
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF759
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF760
	.byte	0x5
	.uleb128 0x52
	.4byte	.LASF761
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF762
	.byte	0x5
	.uleb128 0x54
	.4byte	.LASF763
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF764
	.byte	0x5
	.uleb128 0x58
	.4byte	.LASF765
	.byte	0x5
	.uleb128 0xbd
	.4byte	.LASF766
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdarg.h.38.564172f90da00503aa97831786d1173a,comdat
.Ldebug_macro9:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF767
	.byte	0x5
	.uleb128 0x29
	.4byte	.LASF768
	.byte	0x5
	.uleb128 0x2c
	.4byte	.LASF769
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF770
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF225:
	.ascii	"__FP_FAST_FMAF64 1\000"
.LASF350:
	.ascii	"__UHA_FBIT__ 8\000"
.LASF473:
	.ascii	"_USE_LABEL 0x0\000"
.LASF745:
	.ascii	"__stdarg_H \000"
.LASF447:
	.ascii	"__CROSSWORKS_ARM 1\000"
.LASF371:
	.ascii	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2\000"
.LASF363:
	.ascii	"__CHAR_UNSIGNED__ 1\000"
.LASF477:
	.ascii	"_STR_VOLUME_ID 0\000"
.LASF735:
	.ascii	"LDIR_FstClusLO 26\000"
.LASF819:
	.ascii	"FR_NO_FILE\000"
.LASF223:
	.ascii	"__FLT64_HAS_INFINITY__ 1\000"
.LASF747:
	.ascii	"__THREAD __thread\000"
.LASF314:
	.ascii	"__LLACCUM_MIN__ (-0X1P31LLK-0X1P31LLK)\000"
.LASF6:
	.ascii	"__GNUC_MINOR__ 2\000"
.LASF936:
	.ascii	"ld_clust\000"
.LASF306:
	.ascii	"__LACCUM_EPSILON__ 0x1P-31LK\000"
.LASF77:
	.ascii	"__PTRDIFF_MAX__ 0x7fffffff\000"
.LASF801:
	.ascii	"fptr\000"
.LASF695:
	.ascii	"BS_NTres 37\000"
.LASF698:
	.ascii	"BS_VolLab 43\000"
.LASF89:
	.ascii	"__INTMAX_C(c) c ## LL\000"
.LASF219:
	.ascii	"__FLT64_MIN__ 1.1\000"
.LASF721:
	.ascii	"DIR_NTres 12\000"
.LASF88:
	.ascii	"__INTMAX_MAX__ 0x7fffffffffffffffLL\000"
.LASF331:
	.ascii	"__TQ_IBIT__ 0\000"
.LASF675:
	.ascii	"NS_BODY 0x08\000"
.LASF228:
	.ascii	"__FLT32X_MIN_EXP__ (-1021)\000"
.LASF513:
	.ascii	"FA_OPEN_EXISTING 0x00\000"
.LASF868:
	.ascii	"b_dir\000"
.LASF14:
	.ascii	"__ATOMIC_CONSUME 1\000"
.LASF307:
	.ascii	"__ULACCUM_FBIT__ 32\000"
.LASF73:
	.ascii	"__WCHAR_MAX__ 0xffffffffU\000"
.LASF145:
	.ascii	"__FLT_MANT_DIG__ 24\000"
.LASF638:
	.ascii	"GET_SECTOR_SIZE 2\000"
.LASF18:
	.ascii	"__SIZEOF_LONG_LONG__ 8\000"
.LASF166:
	.ascii	"__DBL_MAX_10_EXP__ 308\000"
.LASF456:
	.ascii	"__SAME70Q21B__ 1\000"
.LASF254:
	.ascii	"__FRACT_MIN__ (-0.5R-0.5R)\000"
.LASF742:
	.ascii	"FREE_BUF() \000"
.LASF552:
	.ascii	"UINTMAX_MAX 18446744073709551615ULL\000"
.LASF290:
	.ascii	"__USACCUM_MAX__ 0XFFFFP-8UHK\000"
.LASF242:
	.ascii	"__SFRACT_FBIT__ 7\000"
.LASF861:
	.ascii	"path\000"
.LASF521:
	.ascii	"FS_FAT16 2\000"
.LASF441:
	.ascii	"__ARM_FEATURE_BF16_SCALAR_ARITHMETIC\000"
.LASF327:
	.ascii	"__SQ_IBIT__ 0\000"
.LASF28:
	.ascii	"__ORDER_PDP_ENDIAN__ 3412\000"
.LASF844:
	.ascii	"RES_WRPRT\000"
.LASF853:
	.ascii	"nchr\000"
.LASF176:
	.ascii	"__FP_FAST_FMA 1\000"
.LASF157:
	.ascii	"__FLT_HAS_DENORM__ 1\000"
.LASF41:
	.ascii	"__INT8_TYPE__ signed char\000"
.LASF403:
	.ascii	"__ARM_ARCH_PROFILE 77\000"
.LASF500:
	.ascii	"_FF_INTEGER \000"
.LASF289:
	.ascii	"__USACCUM_MIN__ 0.0UHK\000"
.LASF926:
	.ascii	"get_ldnumber\000"
.LASF200:
	.ascii	"__FLT32_DECIMAL_DIG__ 9\000"
.LASF183:
	.ascii	"__DECIMAL_DIG__ 17\000"
.LASF179:
	.ascii	"__LDBL_MIN_EXP__ (-1021)\000"
.LASF177:
	.ascii	"__LDBL_MANT_DIG__ 53\000"
.LASF631:
	.ascii	"DISKIO_MMC 1\000"
.LASF117:
	.ascii	"__UINT8_C(c) c\000"
.LASF528:
	.ascii	"AM_DIR 0x10\000"
.LASF42:
	.ascii	"__INT16_TYPE__ short int\000"
.LASF587:
	.ascii	"INT32_C(x) (x ##L)\000"
.LASF578:
	.ascii	"PTRDIFF_MAX INT32_MAX\000"
.LASF749:
	.ascii	"__RAL_SIZE_T unsigned\000"
.LASF550:
	.ascii	"INTMAX_MIN (-9223372036854775807LL-1)\000"
.LASF667:
	.ascii	"IsLower(c) (((c)>='a')&&((c)<='z'))\000"
.LASF918:
	.ascii	"wmode\000"
.LASF584:
	.ascii	"UINT8_C(x) (x ##U)\000"
.LASF505:
	.ascii	"f_eof(fp) ((int)((fp)->fptr == (fp)->fsize))\000"
.LASF859:
	.ascii	"buff\000"
.LASF450:
	.ascii	"__CROSSWORKS_MAJOR_VERSION 4\000"
.LASF619:
	.ascii	"ERR_SAMPLERATE_UNAVAILABLE -21\000"
.LASF767:
	.ascii	"va_start(v,l) __builtin_va_start((v),l)\000"
.LASF646:
	.ascii	"MMC_GET_CID 12\000"
.LASF4:
	.ascii	"__STDC_HOSTED__ 1\000"
.LASF917:
	.ascii	"find_volume\000"
.LASF793:
	.ascii	"fsize\000"
.LASF581:
	.ascii	"INTPTR_MAX INT32_MAX\000"
.LASF895:
	.ascii	"f_lseek\000"
.LASF60:
	.ascii	"__INT_FAST64_TYPE__ long long int\000"
.LASF437:
	.ascii	"__ARM_FEATURE_COPROC 15\000"
.LASF634:
	.ascii	"STA_NODISK 0x02\000"
.LASF927:
	.ascii	"follow_path\000"
.LASF948:
	.ascii	"sync_fs\000"
.LASF461:
	.ascii	"__TCM_CONFIG__ 0\000"
.LASF781:
	.ascii	"TCHAR\000"
.LASF669:
	.ascii	"IsDBCS1(c) 0\000"
.LASF753:
	.ascii	"__CTYPE_UPPER 0x01\000"
.LASF250:
	.ascii	"__USFRACT_MAX__ 0XFFP-8UHR\000"
.LASF209:
	.ascii	"__FP_FAST_FMAF32 1\000"
.LASF138:
	.ascii	"__UINTPTR_MAX__ 0xffffffffU\000"
.LASF196:
	.ascii	"__FLT32_MIN_EXP__ (-125)\000"
.LASF526:
	.ascii	"AM_VOL 0x08\000"
.LASF663:
	.ascii	"GET_FATTIME() get_fattime()\000"
.LASF874:
	.ascii	"stat\000"
.LASF848:
	.ascii	"Fsid\000"
.LASF538:
	.ascii	"UINT8_MAX 255\000"
.LASF516:
	.ascii	"FA_CREATE_ALWAYS 0x08\000"
.LASF834:
	.ascii	"FR_INVALID_PARAMETER\000"
.LASF213:
	.ascii	"__FLT64_MIN_10_EXP__ (-307)\000"
.LASF496:
	.ascii	"_FS_REENTRANT 0\000"
.LASF540:
	.ascii	"INT8_MIN (-128)\000"
.LASF131:
	.ascii	"__INT_FAST64_WIDTH__ 64\000"
.LASF571:
	.ascii	"INT_FAST32_MAX INT32_MAX\000"
.LASF920:
	.ascii	"fasize\000"
.LASF246:
	.ascii	"__SFRACT_EPSILON__ 0x1P-7HR\000"
.LASF949:
	.ascii	"move_window\000"
.LASF111:
	.ascii	"__INT32_C(c) c ## L\000"
.LASF27:
	.ascii	"__ORDER_BIG_ENDIAN__ 4321\000"
.LASF326:
	.ascii	"__SQ_FBIT__ 31\000"
.LASF217:
	.ascii	"__FLT64_MAX__ 1.1\000"
.LASF356:
	.ascii	"__UTA_FBIT__ 64\000"
.LASF606:
	.ascii	"ERR_TIMEOUT -8\000"
.LASF906:
	.ascii	"wcnt\000"
.LASF334:
	.ascii	"__UHQ_FBIT__ 16\000"
.LASF212:
	.ascii	"__FLT64_MIN_EXP__ (-1021)\000"
.LASF913:
	.ascii	"f_open\000"
.LASF857:
	.ascii	"f_putc\000"
.LASF236:
	.ascii	"__FLT32X_EPSILON__ 1.1\000"
.LASF132:
	.ascii	"__UINT_FAST8_MAX__ 0xffffffffU\000"
.LASF656:
	.ascii	"SECTOR_SIZE_1024 2\000"
.LASF454:
	.ascii	"DEBUG 1\000"
.LASF152:
	.ascii	"__FLT_MAX__ 1.1\000"
.LASF303:
	.ascii	"__LACCUM_IBIT__ 32\000"
.LASF746:
	.ascii	"__crossworks_H \000"
.LASF462:
	.ascii	"STARTUP_FROM_RESET 1\000"
.LASF652:
	.ascii	"NAND_FORMAT 30\000"
.LASF856:
	.ascii	"f_puts\000"
.LASF773:
	.ascii	"BYTE\000"
.LASF922:
	.ascii	"sysect\000"
.LASF821:
	.ascii	"FR_INVALID_NAME\000"
.LASF415:
	.ascii	"__VFP_FP__ 1\000"
.LASF673:
	.ascii	"NS_LFN 0x02\000"
.LASF274:
	.ascii	"__LLFRACT_MIN__ (-0.5LLR-0.5LLR)\000"
.LASF136:
	.ascii	"__INTPTR_MAX__ 0x7fffffff\000"
.LASF160:
	.ascii	"__FP_FAST_FMAF 1\000"
.LASF705:
	.ascii	"BPB_BkBootSec 50\000"
.LASF475:
	.ascii	"_MIN_SS 512\000"
.LASF133:
	.ascii	"__UINT_FAST16_MAX__ 0xffffffffU\000"
.LASF887:
	.ascii	"nclst\000"
.LASF957:
	.ascii	"/home/tommy/Documents/CrossWorks Projects/Executabl"
	.ascii	"e_1\000"
.LASF860:
	.ascii	"f_mkfs\000"
.LASF677:
	.ascii	"NS_DOT 0x20\000"
.LASF854:
	.ascii	"putbuff\000"
.LASF497:
	.ascii	"_FS_TIMEOUT 1000\000"
.LASF449:
	.ascii	"__HEAP_SIZE__ 4096\000"
.LASF204:
	.ascii	"__FLT32_EPSILON__ 1.1\000"
.LASF919:
	.ascii	"bsect\000"
.LASF259:
	.ascii	"__UFRACT_MIN__ 0.0UR\000"
.LASF796:
	.ascii	"dirbase\000"
.LASF428:
	.ascii	"__THUMB_INTERWORK__ 1\000"
.LASF843:
	.ascii	"RES_ERROR\000"
.LASF790:
	.ascii	"free_clust\000"
.LASF239:
	.ascii	"__FLT32X_HAS_INFINITY__ 1\000"
.LASF579:
	.ascii	"SIZE_MAX INT32_MAX\000"
.LASF925:
	.ascii	"check_fs\000"
.LASF515:
	.ascii	"FA_CREATE_NEW 0x04\000"
.LASF53:
	.ascii	"__UINT_LEAST8_TYPE__ unsigned char\000"
.LASF615:
	.ascii	"ERR_DENIED -17\000"
.LASF883:
	.ascii	"f_unlink\000"
.LASF292:
	.ascii	"__ACCUM_FBIT__ 15\000"
.LASF727:
	.ascii	"DIR_WrtTime 22\000"
.LASF680:
	.ascii	"BS_jmpBoot 0\000"
.LASF298:
	.ascii	"__UACCUM_IBIT__ 16\000"
.LASF778:
	.ascii	"long int\000"
.LASF811:
	.ascii	"ftime\000"
.LASF491:
	.ascii	"_NORTC_MDAY 1\000"
.LASF235:
	.ascii	"__FLT32X_MIN__ 1.1\000"
.LASF130:
	.ascii	"__INT_FAST64_MAX__ 0x7fffffffffffffffLL\000"
.LASF232:
	.ascii	"__FLT32X_DECIMAL_DIG__ 17\000"
.LASF752:
	.ascii	"__CODE \000"
.LASF240:
	.ascii	"__FLT32X_HAS_QUIET_NAN__ 1\000"
.LASF723:
	.ascii	"DIR_CrtTime 14\000"
.LASF659:
	.ascii	"ENTER_FF(fs) \000"
.LASF199:
	.ascii	"__FLT32_MAX_10_EXP__ 38\000"
.LASF676:
	.ascii	"NS_EXT 0x10\000"
.LASF127:
	.ascii	"__INT_FAST16_WIDTH__ 32\000"
.LASF57:
	.ascii	"__INT_FAST8_TYPE__ int\000"
.LASF354:
	.ascii	"__UDA_FBIT__ 32\000"
.LASF215:
	.ascii	"__FLT64_MAX_10_EXP__ 308\000"
.LASF291:
	.ascii	"__USACCUM_EPSILON__ 0x1P-8UHK\000"
.LASF91:
	.ascii	"__UINTMAX_C(c) c ## ULL\000"
.LASF704:
	.ascii	"BPB_FSInfo 48\000"
.LASF31:
	.ascii	"__SIZEOF_POINTER__ 4\000"
.LASF49:
	.ascii	"__INT_LEAST8_TYPE__ signed char\000"
.LASF547:
	.ascii	"INT64_MIN (-9223372036854775807LL-1)\000"
.LASF367:
	.ascii	"__GCC_ATOMIC_BOOL_LOCK_FREE 2\000"
.LASF956:
	.ascii	"/home/tommy/Documents/CrossWorks Projects/Executabl"
	.ascii	"e_1/Device/Middleware/fatfs/src/ff.c\000"
.LASF425:
	.ascii	"__ARM_NEON__\000"
.LASF198:
	.ascii	"__FLT32_MAX_EXP__ 128\000"
.LASF873:
	.ascii	"n_dir\000"
.LASF348:
	.ascii	"__TA_FBIT__ 63\000"
.LASF867:
	.ascii	"b_fat\000"
.LASF280:
	.ascii	"__ULLFRACT_MAX__ 0XFFFFFFFFFFFFFFFFP-64ULLR\000"
.LASF715:
	.ascii	"FSI_Nxt_Free 492\000"
.LASF216:
	.ascii	"__FLT64_DECIMAL_DIG__ 17\000"
.LASF702:
	.ascii	"BPB_FSVer 42\000"
.LASF825:
	.ascii	"FR_WRITE_PROTECTED\000"
.LASF229:
	.ascii	"__FLT32X_MIN_10_EXP__ (-307)\000"
.LASF445:
	.ascii	"__ELF__ 1\000"
.LASF39:
	.ascii	"__CHAR32_TYPE__ long unsigned int\000"
.LASF422:
	.ascii	"__ARM_FEATURE_FP16_VECTOR_ARITHMETIC\000"
.LASF549:
	.ascii	"UINT64_MAX 18446744073709551615ULL\000"
.LASF134:
	.ascii	"__UINT_FAST32_MAX__ 0xffffffffU\000"
.LASF149:
	.ascii	"__FLT_MAX_EXP__ 128\000"
.LASF17:
	.ascii	"__SIZEOF_LONG__ 4\000"
.LASF653:
	.ascii	"SECTOR_SIZE 512\000"
.LASF754:
	.ascii	"__CTYPE_LOWER 0x02\000"
.LASF21:
	.ascii	"__SIZEOF_DOUBLE__ 8\000"
.LASF112:
	.ascii	"__INT_LEAST32_WIDTH__ 32\000"
.LASF817:
	.ascii	"FR_INT_ERR\000"
.LASF577:
	.ascii	"PTRDIFF_MIN INT32_MIN\000"
.LASF940:
	.ascii	"stretch\000"
.LASF725:
	.ascii	"DIR_LstAccDate 18\000"
.LASF946:
	.ascii	"get_fat\000"
.LASF574:
	.ascii	"UINT_FAST16_MAX UINT32_MAX\000"
.LASF708:
	.ascii	"BS_BootSig32 66\000"
.LASF916:
	.ascii	"validate\000"
.LASF148:
	.ascii	"__FLT_MIN_10_EXP__ (-37)\000"
.LASF151:
	.ascii	"__FLT_DECIMAL_DIG__ 9\000"
.LASF409:
	.ascii	"__thumb__ 1\000"
.LASF570:
	.ascii	"INT_FAST16_MAX INT32_MAX\000"
.LASF865:
	.ascii	"wsect\000"
.LASF48:
	.ascii	"__UINT64_TYPE__ long long unsigned int\000"
.LASF837:
	.ascii	"uint8_t\000"
.LASF424:
	.ascii	"__ARM_FEATURE_FMA 1\000"
.LASF188:
	.ascii	"__LDBL_EPSILON__ 1.1\000"
.LASF360:
	.ascii	"__GNUC_STDC_INLINE__ 1\000"
.LASF252:
	.ascii	"__FRACT_FBIT__ 15\000"
.LASF7:
	.ascii	"__GNUC_PATCHLEVEL__ 1\000"
.LASF370:
	.ascii	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2\000"
.LASF118:
	.ascii	"__UINT_LEAST16_MAX__ 0xffff\000"
.LASF649:
	.ascii	"ATA_GET_REV 20\000"
.LASF805:
	.ascii	"dir_sect\000"
.LASF846:
	.ascii	"RES_PARERR\000"
.LASF686:
	.ascii	"BPB_RootEntCnt 17\000"
.LASF146:
	.ascii	"__FLT_DIG__ 6\000"
.LASF833:
	.ascii	"FR_TOO_MANY_OPEN_FILES\000"
.LASF63:
	.ascii	"__UINT_FAST32_TYPE__ unsigned int\000"
.LASF771:
	.ascii	"unsigned char\000"
.LASF3:
	.ascii	"__STDC_UTF_32__ 1\000"
.LASF20:
	.ascii	"__SIZEOF_FLOAT__ 4\000"
.LASF283:
	.ascii	"__SACCUM_IBIT__ 8\000"
.LASF150:
	.ascii	"__FLT_MAX_10_EXP__ 38\000"
.LASF655:
	.ascii	"SECTOR_SIZE_512 1\000"
.LASF255:
	.ascii	"__FRACT_MAX__ 0X7FFFP-15R\000"
.LASF719:
	.ascii	"DIR_Name 0\000"
.LASF869:
	.ascii	"b_data\000"
.LASF10:
	.ascii	"__ATOMIC_SEQ_CST 5\000"
.LASF520:
	.ascii	"FS_FAT12 1\000"
.LASF451:
	.ascii	"__CROSSWORKS_MINOR_VERSION 8\000"
.LASF471:
	.ascii	"_USE_FASTSEEK 0x1\000"
.LASF483:
	.ascii	"_CODE_PAGE 850\000"
.LASF783:
	.ascii	"fs_type\000"
.LASF904:
	.ascii	"f_sync\000"
.LASF591:
	.ascii	"INTMAX_C(x) (x ##LL)\000"
.LASF165:
	.ascii	"__DBL_MAX_EXP__ 1024\000"
.LASF818:
	.ascii	"FR_NOT_READY\000"
.LASF330:
	.ascii	"__TQ_FBIT__ 127\000"
.LASF932:
	.ascii	"dir_register\000"
.LASF589:
	.ascii	"INT64_C(x) (x ##LL)\000"
.LASF522:
	.ascii	"FS_FAT32 3\000"
.LASF172:
	.ascii	"__DBL_DENORM_MIN__ ((double)1.1)\000"
.LASF875:
	.ascii	"f_utime\000"
.LASF542:
	.ascii	"INT16_MIN (-32767-1)\000"
.LASF410:
	.ascii	"__thumb2__ 1\000"
.LASF317:
	.ascii	"__ULLACCUM_FBIT__ 32\000"
.LASF744:
	.ascii	"N_FATS 1\000"
.LASF362:
	.ascii	"__STRICT_ANSI__ 1\000"
.LASF897:
	.ascii	"ifptr\000"
.LASF683:
	.ascii	"BPB_SecPerClus 13\000"
.LASF468:
	.ascii	"_USE_STRFUNC 0x1\000"
.LASF22:
	.ascii	"__SIZEOF_LONG_DOUBLE__ 8\000"
.LASF379:
	.ascii	"__PRAGMA_REDEFINE_EXTNAME 1\000"
.LASF34:
	.ascii	"__WCHAR_TYPE__ unsigned int\000"
.LASF782:
	.ascii	"char\000"
.LASF195:
	.ascii	"__FLT32_DIG__ 6\000"
.LASF365:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1\000"
.LASF943:
	.ascii	"create_chain\000"
.LASF519:
	.ascii	"FA__DIRTY 0x40\000"
.LASF64:
	.ascii	"__UINT_FAST64_TYPE__ long long unsigned int\000"
.LASF600:
	.ascii	"ERR_NO_CHANGE -2\000"
.LASF896:
	.ascii	"nsect\000"
.LASF909:
	.ascii	"f_read\000"
.LASF697:
	.ascii	"BS_VolID 39\000"
.LASF432:
	.ascii	"__FDPIC__\000"
.LASF792:
	.ascii	"n_fatent\000"
.LASF237:
	.ascii	"__FLT32X_DENORM_MIN__ 1.1\000"
.LASF543:
	.ascii	"INT16_MAX 32767\000"
.LASF864:
	.ascii	"n_clst\000"
.LASF248:
	.ascii	"__USFRACT_IBIT__ 0\000"
.LASF629:
	.ascii	"ERR_WRONG_LENGTH -31\000"
.LASF249:
	.ascii	"__USFRACT_MIN__ 0.0UHR\000"
.LASF642:
	.ascii	"CTRL_LOCK 6\000"
.LASF446:
	.ascii	"__SIZEOF_WCHAR_T 4\000"
.LASF426:
	.ascii	"__ARM_NEON\000"
.LASF641:
	.ascii	"CTRL_POWER 5\000"
.LASF100:
	.ascii	"__UINT8_MAX__ 0xff\000"
.LASF181:
	.ascii	"__LDBL_MAX_EXP__ 1024\000"
.LASF494:
	.ascii	"_FS_TINY 0\000"
.LASF822:
	.ascii	"FR_DENIED\000"
.LASF660:
	.ascii	"LEAVE_FF(fs,res) return res\000"
.LASF173:
	.ascii	"__DBL_HAS_DENORM__ 1\000"
.LASF880:
	.ascii	"attr\000"
.LASF510:
	.ascii	"f_rewinddir(dp) f_readdir((dp), 0)\000"
.LASF757:
	.ascii	"__CTYPE_PUNCT 0x10\000"
.LASF346:
	.ascii	"__DA_FBIT__ 31\000"
.LASF67:
	.ascii	"__GXX_ABI_VERSION 1014\000"
.LASF460:
	.ascii	"__USE_CRYSTAL_OSCILLATOR__ 1\000"
.LASF107:
	.ascii	"__INT_LEAST16_MAX__ 0x7fff\000"
.LASF872:
	.ascii	"n_fat\000"
.LASF658:
	.ascii	"SECTOR_SIZE_4096 8\000"
.LASF618:
	.ascii	"ERR_NOT_INITIALIZED -20\000"
.LASF499:
	.ascii	"_FS_SHARE 0\000"
.LASF121:
	.ascii	"__UINT32_C(c) c ## UL\000"
.LASF299:
	.ascii	"__UACCUM_MIN__ 0.0UK\000"
.LASF871:
	.ascii	"n_rsv\000"
.LASF218:
	.ascii	"__FLT64_NORM_MAX__ 1.1\000"
.LASF803:
	.ascii	"clust\000"
.LASF33:
	.ascii	"__PTRDIFF_TYPE__ int\000"
.LASF597:
	.ascii	"ERROR_CODES_H_INCLUDED \000"
.LASF412:
	.ascii	"__ARM_ARCH_ISA_THUMB\000"
.LASF560:
	.ascii	"INT_LEAST64_MAX INT64_MAX\000"
.LASF738:
	.ascii	"DDEM 0xE5\000"
.LASF654:
	.ascii	"SECTOR_SIZE_DEFAULT 512\000"
.LASF301:
	.ascii	"__UACCUM_EPSILON__ 0x1P-16UK\000"
.LASF440:
	.ascii	"__ARM_FEATURE_MATMUL_INT8\000"
.LASF467:
	.ascii	"_FS_MINIMIZE 0x0\000"
.LASF372:
	.ascii	"__GCC_ATOMIC_SHORT_LOCK_FREE 2\000"
.LASF718:
	.ascii	"BS_55AA 510\000"
.LASF885:
	.ascii	"f_truncate\000"
.LASF457:
	.ascii	"__SAM_E_FAMILY 1\000"
.LASF954:
	.ascii	"mem_set\000"
.LASF287:
	.ascii	"__USACCUM_FBIT__ 8\000"
.LASF569:
	.ascii	"INT_FAST8_MAX INT8_MAX\000"
.LASF376:
	.ascii	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1\000"
.LASF736:
	.ascii	"SZ_DIRE 32\000"
.LASF302:
	.ascii	"__LACCUM_FBIT__ 31\000"
.LASF481:
	.ascii	"_MULTI_PARTITION 0\000"
.LASF608:
	.ascii	"ERR_NOT_FOUND -10\000"
.LASF650:
	.ascii	"ATA_GET_MODEL 21\000"
.LASF732:
	.ascii	"LDIR_Attr 11\000"
.LASF208:
	.ascii	"__FLT32_HAS_QUIET_NAN__ 1\000"
.LASF764:
	.ascii	"__CTYPE_PRINT (__CTYPE_BLANK | __CTYPE_PUNCT | __CT"
	.ascii	"YPE_UPPER | __CTYPE_LOWER | __CTYPE_DIGIT)\000"
.LASF191:
	.ascii	"__LDBL_HAS_INFINITY__ 1\000"
.LASF282:
	.ascii	"__SACCUM_FBIT__ 7\000"
.LASF231:
	.ascii	"__FLT32X_MAX_10_EXP__ 308\000"
.LASF820:
	.ascii	"FR_NO_PATH\000"
.LASF858:
	.ascii	"f_gets\000"
.LASF944:
	.ascii	"remove_chain\000"
.LASF184:
	.ascii	"__LDBL_DECIMAL_DIG__ 17\000"
.LASF116:
	.ascii	"__UINT_LEAST8_MAX__ 0xff\000"
.LASF455:
	.ascii	"__THUMB 1\000"
.LASF849:
	.ascii	"CurrVol\000"
.LASF958:
	.ascii	"__ap\000"
.LASF9:
	.ascii	"__ATOMIC_RELAXED 0\000"
.LASF611:
	.ascii	"ERR_INVALID_ARG -13\000"
.LASF953:
	.ascii	"mem_cmp\000"
.LASF109:
	.ascii	"__INT_LEAST16_WIDTH__ 16\000"
.LASF267:
	.ascii	"__ULFRACT_FBIT__ 32\000"
.LASF826:
	.ascii	"FR_INVALID_DRIVE\000"
.LASF143:
	.ascii	"__DEC_EVAL_METHOD__ 2\000"
.LASF766:
	.ascii	"__MAX_CATEGORY 5\000"
.LASF423:
	.ascii	"__ARM_FEATURE_FP16_FML\000"
.LASF580:
	.ascii	"INTPTR_MIN INT32_MIN\000"
.LASF171:
	.ascii	"__DBL_EPSILON__ ((double)1.1)\000"
.LASF448:
	.ascii	"__ARM_ARCH_FPV5_D16__ 1\000"
.LASF622:
	.ascii	"ERR_PACKET_COLLISION -24\000"
.LASF706:
	.ascii	"BS_DrvNum32 64\000"
.LASF251:
	.ascii	"__USFRACT_EPSILON__ 0x1P-8UHR\000"
.LASF703:
	.ascii	"BPB_RootClus 44\000"
.LASF554:
	.ascii	"INT_LEAST16_MIN INT16_MIN\000"
.LASF247:
	.ascii	"__USFRACT_FBIT__ 8\000"
.LASF699:
	.ascii	"BS_FilSysType 54\000"
.LASF640:
	.ascii	"CTRL_ERASE_SECTOR 4\000"
.LASF939:
	.ascii	"dir_next\000"
.LASF359:
	.ascii	"__USER_LABEL_PREFIX__ \000"
.LASF103:
	.ascii	"__UINT64_MAX__ 0xffffffffffffffffULL\000"
.LASF729:
	.ascii	"DIR_FstClusLO 26\000"
.LASF889:
	.ascii	"nfree\000"
.LASF609:
	.ascii	"ERR_UNSUPPORTED_DEV -11\000"
.LASF1:
	.ascii	"__STDC_VERSION__ 201112L\000"
.LASF484:
	.ascii	"_USE_LFN 0\000"
.LASF104:
	.ascii	"__INT_LEAST8_MAX__ 0x7f\000"
.LASF377:
	.ascii	"__GCC_ATOMIC_POINTER_LOCK_FREE 2\000"
.LASF384:
	.ascii	"__ARM_FEATURE_QBIT 1\000"
.LASF397:
	.ascii	"__ARM_FEATURE_CLZ 1\000"
.LASF11:
	.ascii	"__ATOMIC_ACQUIRE 2\000"
.LASF391:
	.ascii	"__ARM_FEATURE_COMPLEX\000"
.LASF878:
	.ascii	"path_new\000"
.LASF730:
	.ascii	"DIR_FileSize 28\000"
.LASF401:
	.ascii	"__ARM_SIZEOF_WCHAR_T 4\000"
.LASF230:
	.ascii	"__FLT32X_MAX_EXP__ 1024\000"
.LASF688:
	.ascii	"BPB_Media 21\000"
.LASF668:
	.ascii	"IsDigit(c) (((c)>='0')&&((c)<='9'))\000"
.LASF120:
	.ascii	"__UINT_LEAST32_MAX__ 0xffffffffUL\000"
.LASF565:
	.ascii	"INT_FAST8_MIN INT8_MIN\000"
.LASF903:
	.ascii	"f_close\000"
.LASF264:
	.ascii	"__LFRACT_MIN__ (-0.5LR-0.5LR)\000"
.LASF599:
	.ascii	"ERR_INVALID_DATA -1\000"
.LASF115:
	.ascii	"__INT_LEAST64_WIDTH__ 64\000"
.LASF158:
	.ascii	"__FLT_HAS_INFINITY__ 1\000"
.LASF592:
	.ascii	"UINTMAX_C(x) (x ##ULL)\000"
.LASF620:
	.ascii	"ERR_RESOLUTION_UNAVAILABLE -22\000"
.LASF672:
	.ascii	"NS_LOSS 0x01\000"
.LASF96:
	.ascii	"__INT8_MAX__ 0x7f\000"
.LASF741:
	.ascii	"INIT_BUF(dobj) (dobj).fn = sfn\000"
.LASF389:
	.ascii	"__ARM_FEATURE_CRC32\000"
.LASF244:
	.ascii	"__SFRACT_MIN__ (-0.5HR-0.5HR)\000"
.LASF780:
	.ascii	"long unsigned int\000"
.LASF345:
	.ascii	"__SA_IBIT__ 16\000"
.LASF851:
	.ascii	"__va_list\000"
.LASF393:
	.ascii	"__ARM_FEATURE_MVE\000"
.LASF140:
	.ascii	"__GCC_IEC_559_COMPLEX 2\000"
.LASF418:
	.ascii	"__ARM_FP16_FORMAT_IEEE\000"
.LASF46:
	.ascii	"__UINT16_TYPE__ short unsigned int\000"
.LASF929:
	.ascii	"putc_bfd\000"
.LASF544:
	.ascii	"UINT32_MAX 4294967295UL\000"
.LASF128:
	.ascii	"__INT_FAST32_MAX__ 0x7fffffff\000"
.LASF186:
	.ascii	"__LDBL_NORM_MAX__ 1.1\000"
.LASF102:
	.ascii	"__UINT32_MAX__ 0xffffffffUL\000"
.LASF915:
	.ascii	"f_mount\000"
.LASF142:
	.ascii	"__FLT_EVAL_METHOD_TS_18661_3__ 0\000"
.LASF79:
	.ascii	"__SCHAR_WIDTH__ 8\000"
.LASF61:
	.ascii	"__UINT_FAST8_TYPE__ unsigned int\000"
.LASF313:
	.ascii	"__LLACCUM_IBIT__ 32\000"
.LASF256:
	.ascii	"__FRACT_EPSILON__ 0x1P-15R\000"
.LASF807:
	.ascii	"cltbl\000"
.LASF340:
	.ascii	"__UTQ_FBIT__ 128\000"
.LASF602:
	.ascii	"ERR_BUSY -4\000"
.LASF98:
	.ascii	"__INT32_MAX__ 0x7fffffffL\000"
.LASF590:
	.ascii	"UINT64_C(x) (x ##ULL)\000"
.LASF113:
	.ascii	"__INT_LEAST64_MAX__ 0x7fffffffffffffffLL\000"
.LASF442:
	.ascii	"__ARM_FEATURE_BF16_VECTOR_ARITHMETIC\000"
.LASF530:
	.ascii	"AM_MASK 0x3F\000"
.LASF648:
	.ascii	"MMC_GET_SDSTAT 14\000"
.LASF205:
	.ascii	"__FLT32_DENORM_MIN__ 1.1\000"
.LASF194:
	.ascii	"__FLT32_MANT_DIG__ 24\000"
.LASF835:
	.ascii	"FRESULT\000"
.LASF596:
	.ascii	"WINT_MAX 2147483647L\000"
.LASF123:
	.ascii	"__UINT64_C(c) c ## ULL\000"
.LASF56:
	.ascii	"__UINT_LEAST64_TYPE__ long long unsigned int\000"
.LASF593:
	.ascii	"WCHAR_MIN __WCHAR_MIN__\000"
.LASF840:
	.ascii	"dstatus_t\000"
.LASF312:
	.ascii	"__LLACCUM_FBIT__ 31\000"
.LASF369:
	.ascii	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2\000"
.LASF795:
	.ascii	"fatbase\000"
.LASF645:
	.ascii	"MMC_GET_CSD 11\000"
.LASF847:
	.ascii	"FatFs\000"
.LASF65:
	.ascii	"__INTPTR_TYPE__ int\000"
.LASF238:
	.ascii	"__FLT32X_HAS_DENORM__ 1\000"
.LASF947:
	.ascii	"clust2sect\000"
.LASF339:
	.ascii	"__UDQ_IBIT__ 0\000"
.LASF951:
	.ascii	"sync_window\000"
.LASF464:
	.ascii	"CONF_FATFS_H \000"
.LASF665:
	.ascii	"_EXCVT {0x43,0x55,0x45,0x41,0x41,0x41,0x41,0x43,0x4"
	.ascii	"5,0x45,0x45,0x49,0x49,0x49,0x41,0x41, 0x45,0x92,0x9"
	.ascii	"2,0x4F,0x4F,0x4F,0x55,0x55,0x59,0x4F,0x55,0x4F,0x9C"
	.ascii	",0x4F,0x9E,0x9F, 0x41,0x49,0x4F,0x55,0xA5,0xA5,0xA6"
	.ascii	",0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF, 0xB0"
	.ascii	",0xB1,0xB2,0xB3,0xB4,0x41,0x41,0x41,0xB8,0xB9,0xBA,"
	.ascii	"0xBB,0xBC,0xBD,0xBE,0xBF, 0xC0,0xC1,0xC2,0xC3,0xC4,"
	.ascii	"0xC5,0x41,0x41,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0"
	.ascii	"xCF, 0xD1,0xD1,0x45,0x45,0x45,0x49,0x49,0x49,0x49,0"
	.ascii	"xD9,0xDA,0xDB,0xDC,0xDD,0x49,0xDF, 0x4F,0xE1,0x4F,0"
	.ascii	"x4F,0x4F,0x4F,0xE6,0xE8,0xE8,0x55,0x55,0x55,0x59,0x"
	.ascii	"59,0xEE,0xEF, 0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0x"
	.ascii	"F7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}\000"
.LASF604:
	.ascii	"ERR_IO -6\000"
.LASF556:
	.ascii	"INT_LEAST64_MIN INT64_MIN\000"
.LASF841:
	.ascii	"DSTATUS\000"
.LASF724:
	.ascii	"DIR_CrtDate 16\000"
.LASF99:
	.ascii	"__INT64_MAX__ 0x7fffffffffffffffLL\000"
.LASF385:
	.ascii	"__ARM_FEATURE_SAT 1\000"
.LASF644:
	.ascii	"MMC_GET_TYPE 10\000"
.LASF278:
	.ascii	"__ULLFRACT_IBIT__ 0\000"
.LASF959:
	.ascii	"mem_cpy\000"
.LASF92:
	.ascii	"__INTMAX_WIDTH__ 64\000"
.LASF740:
	.ascii	"DEFINE_NAMEBUF BYTE sfn[12]\000"
.LASF503:
	.ascii	"_T(x) x\000"
.LASF5:
	.ascii	"__GNUC__ 10\000"
.LASF541:
	.ascii	"UINT16_MAX 65535\000"
.LASF378:
	.ascii	"__HAVE_SPECULATION_SAFE_VALUE 1\000"
.LASF221:
	.ascii	"__FLT64_DENORM_MIN__ 1.1\000"
.LASF453:
	.ascii	"__GNU_LINKER 1\000"
.LASF82:
	.ascii	"__LONG_WIDTH__ 32\000"
.LASF297:
	.ascii	"__UACCUM_FBIT__ 16\000"
.LASF261:
	.ascii	"__UFRACT_EPSILON__ 0x1P-16UR\000"
.LASF74:
	.ascii	"__WCHAR_MIN__ 0U\000"
.LASF364:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1\000"
.LASF333:
	.ascii	"__UQQ_IBIT__ 0\000"
.LASF831:
	.ascii	"FR_LOCKED\000"
.LASF374:
	.ascii	"__GCC_ATOMIC_LONG_LOCK_FREE 2\000"
.LASF309:
	.ascii	"__ULACCUM_MIN__ 0.0ULK\000"
.LASF406:
	.ascii	"__ARM_ARCH 7\000"
.LASF685:
	.ascii	"BPB_NumFATs 16\000"
.LASF492:
	.ascii	"_NORTC_YEAR 2015\000"
.LASF144:
	.ascii	"__FLT_RADIX__ 2\000"
.LASF838:
	.ascii	"long long int\000"
.LASF488:
	.ascii	"_FS_RPATH 2\000"
.LASF394:
	.ascii	"__ARM_FEATURE_CMSE\000"
.LASF679:
	.ascii	"MIN_FAT32 65526U\000"
.LASF852:
	.ascii	"va_list\000"
.LASF797:
	.ascii	"database\000"
.LASF192:
	.ascii	"__LDBL_HAS_QUIET_NAN__ 1\000"
.LASF533:
	.ascii	"LD_DWORD(ptr) (DWORD)(((DWORD)*((BYTE*)(ptr)+3)<<24"
	.ascii	")|((DWORD)*((BYTE*)(ptr)+2)<<16)|((WORD)*((BYTE*)(p"
	.ascii	"tr)+1)<<8)|*(BYTE*)(ptr))\000"
.LASF518:
	.ascii	"FA__WRITTEN 0x20\000"
.LASF83:
	.ascii	"__LONG_LONG_WIDTH__ 64\000"
.LASF189:
	.ascii	"__LDBL_DENORM_MIN__ 1.1\000"
.LASF813:
	.ascii	"fname\000"
.LASF135:
	.ascii	"__UINT_FAST64_MAX__ 0xffffffffffffffffULL\000"
.LASF416:
	.ascii	"__ARM_FP\000"
.LASF343:
	.ascii	"__HA_IBIT__ 8\000"
.LASF137:
	.ascii	"__INTPTR_WIDTH__ 32\000"
.LASF375:
	.ascii	"__GCC_ATOMIC_LLONG_LOCK_FREE 1\000"
.LASF463:
	.ascii	"_FATFS 64180\000"
.LASF709:
	.ascii	"BS_VolID32 67\000"
.LASF572:
	.ascii	"INT_FAST64_MAX INT64_MAX\000"
.LASF214:
	.ascii	"__FLT64_MAX_EXP__ 1024\000"
.LASF168:
	.ascii	"__DBL_MAX__ ((double)1.1)\000"
.LASF923:
	.ascii	"szbfat\000"
.LASF85:
	.ascii	"__WINT_WIDTH__ 32\000"
.LASF44:
	.ascii	"__INT64_TYPE__ long long int\000"
.LASF262:
	.ascii	"__LFRACT_FBIT__ 31\000"
.LASF24:
	.ascii	"__CHAR_BIT__ 8\000"
.LASF931:
	.ascii	"dir_remove\000"
.LASF508:
	.ascii	"f_size(fp) ((fp)->fsize)\000"
.LASF881:
	.ascii	"mask\000"
.LASF836:
	.ascii	"signed char\000"
.LASF479:
	.ascii	"_USE_TRIM 0\000"
.LASF234:
	.ascii	"__FLT32X_NORM_MAX__ 1.1\000"
.LASF809:
	.ascii	"sect\000"
.LASF408:
	.ascii	"__GCC_ASM_FLAG_OUTPUTS__ 1\000"
.LASF260:
	.ascii	"__UFRACT_MAX__ 0XFFFFP-16UR\000"
.LASF681:
	.ascii	"BS_OEMName 3\000"
.LASF490:
	.ascii	"_NORTC_MON 1\000"
.LASF716:
	.ascii	"MBR_Table 446\000"
.LASF784:
	.ascii	"csize\000"
.LASF110:
	.ascii	"__INT_LEAST32_MAX__ 0x7fffffffL\000"
.LASF243:
	.ascii	"__SFRACT_IBIT__ 0\000"
.LASF583:
	.ascii	"INT8_C(x) (x)\000"
.LASF29:
	.ascii	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF427:
	.ascii	"__ARM_NEON_FP\000"
.LASF657:
	.ascii	"SECTOR_SIZE_2048 4\000"
.LASF945:
	.ascii	"put_fat\000"
.LASF888:
	.ascii	"fatfs\000"
.LASF511:
	.ascii	"EOF (-1)\000"
.LASF257:
	.ascii	"__UFRACT_FBIT__ 16\000"
.LASF338:
	.ascii	"__UDQ_FBIT__ 64\000"
.LASF156:
	.ascii	"__FLT_DENORM_MIN__ 1.1\000"
.LASF713:
	.ascii	"FSI_StrucSig 484\000"
.LASF182:
	.ascii	"__LDBL_MAX_10_EXP__ 308\000"
.LASF684:
	.ascii	"BPB_RsvdSecCnt 14\000"
.LASF798:
	.ascii	"winsect\000"
.LASF504:
	.ascii	"_TEXT(x) x\000"
.LASF59:
	.ascii	"__INT_FAST32_TYPE__ int\000"
.LASF233:
	.ascii	"__FLT32X_MAX__ 1.1\000"
.LASF777:
	.ascii	"unsigned int\000"
.LASF950:
	.ascii	"sector\000"
.LASF553:
	.ascii	"INT_LEAST8_MIN INT8_MIN\000"
.LASF315:
	.ascii	"__LLACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LLK\000"
.LASF147:
	.ascii	"__FLT_MIN_EXP__ (-125)\000"
.LASF224:
	.ascii	"__FLT64_HAS_QUIET_NAN__ 1\000"
.LASF832:
	.ascii	"FR_NOT_ENOUGH_CORE\000"
.LASF320:
	.ascii	"__ULLACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULLK\000"
.LASF786:
	.ascii	"wflag\000"
.LASF288:
	.ascii	"__USACCUM_IBIT__ 8\000"
.LASF639:
	.ascii	"GET_BLOCK_SIZE 3\000"
.LASF429:
	.ascii	"__ARM_ARCH_7EM__ 1\000"
.LASF353:
	.ascii	"__USA_IBIT__ 16\000"
.LASF318:
	.ascii	"__ULLACCUM_IBIT__ 32\000"
.LASF37:
	.ascii	"__UINTMAX_TYPE__ long long unsigned int\000"
.LASF193:
	.ascii	"__FP_FAST_FMAL 1\000"
.LASF761:
	.ascii	"__CTYPE_ALPHA (__CTYPE_UPPER | __CTYPE_LOWER)\000"
.LASF141:
	.ascii	"__FLT_EVAL_METHOD__ 0\000"
.LASF787:
	.ascii	"fsi_flag\000"
.LASF68:
	.ascii	"__SCHAR_MAX__ 0x7f\000"
.LASF842:
	.ascii	"RES_OK\000"
.LASF125:
	.ascii	"__INT_FAST8_WIDTH__ 32\000"
.LASF2:
	.ascii	"__STDC_UTF_16__ 1\000"
.LASF678:
	.ascii	"MIN_FAT16 4086U\000"
.LASF395:
	.ascii	"__ARM_FEATURE_LDREX\000"
.LASF332:
	.ascii	"__UQQ_FBIT__ 8\000"
.LASF924:
	.ascii	"nrsv\000"
.LASF35:
	.ascii	"__WINT_TYPE__ unsigned int\000"
.LASF800:
	.ascii	"flag\000"
.LASF420:
	.ascii	"__ARM_FP16_ARGS\000"
.LASF300:
	.ascii	"__UACCUM_MAX__ 0XFFFFFFFFP-16UK\000"
.LASF139:
	.ascii	"__GCC_IEC_559 2\000"
.LASF911:
	.ascii	"rcnt\000"
.LASF265:
	.ascii	"__LFRACT_MAX__ 0X7FFFFFFFP-31LR\000"
.LASF382:
	.ascii	"__SIZEOF_PTRDIFF_T__ 4\000"
.LASF862:
	.ascii	"pdrv\000"
.LASF0:
	.ascii	"__STDC__ 1\000"
.LASF512:
	.ascii	"FA_READ 0x01\000"
.LASF434:
	.ascii	"__ARM_FEATURE_IDIV 1\000"
.LASF30:
	.ascii	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF45:
	.ascii	"__UINT8_TYPE__ unsigned char\000"
.LASF170:
	.ascii	"__DBL_MIN__ ((double)1.1)\000"
.LASF40:
	.ascii	"__SIG_ATOMIC_TYPE__ int\000"
.LASF630:
	.ascii	"DISKIO_ATA 0\000"
.LASF80:
	.ascii	"__SHRT_WIDTH__ 16\000"
.LASF789:
	.ascii	"last_clust\000"
.LASF222:
	.ascii	"__FLT64_HAS_DENORM__ 1\000"
.LASF352:
	.ascii	"__USA_FBIT__ 16\000"
.LASF714:
	.ascii	"FSI_Free_Count 488\000"
.LASF180:
	.ascii	"__LDBL_MIN_10_EXP__ (-307)\000"
.LASF159:
	.ascii	"__FLT_HAS_QUIET_NAN__ 1\000"
.LASF774:
	.ascii	"WORD\000"
.LASF368:
	.ascii	"__GCC_ATOMIC_CHAR_LOCK_FREE 2\000"
.LASF937:
	.ascii	"dir_alloc\000"
.LASF266:
	.ascii	"__LFRACT_EPSILON__ 0x1P-31LR\000"
.LASF241:
	.ascii	"__FP_FAST_FMAF32x 1\000"
.LASF169:
	.ascii	"__DBL_NORM_MAX__ ((double)1.1)\000"
.LASF785:
	.ascii	"n_fats\000"
.LASF400:
	.ascii	"__ARM_SIZEOF_MINIMAL_ENUM 1\000"
.LASF899:
	.ascii	"ulen\000"
.LASF404:
	.ascii	"__arm__ 1\000"
.LASF614:
	.ascii	"ERR_BAD_FRQ -16\000"
.LASF776:
	.ascii	"UINT\000"
.LASF197:
	.ascii	"__FLT32_MIN_10_EXP__ (-37)\000"
.LASF643:
	.ascii	"CTRL_EJECT 7\000"
.LASF779:
	.ascii	"DWORD\000"
.LASF419:
	.ascii	"__ARM_FP16_FORMAT_ALTERNATIVE\000"
.LASF755:
	.ascii	"__CTYPE_DIGIT 0x04\000"
.LASF545:
	.ascii	"INT32_MAX 2147483647L\000"
.LASF827:
	.ascii	"FR_NOT_ENABLED\000"
.LASF25:
	.ascii	"__BIGGEST_ALIGNMENT__ 8\000"
.LASF829:
	.ascii	"FR_MKFS_ABORTED\000"
.LASF349:
	.ascii	"__TA_IBIT__ 64\000"
.LASF616:
	.ascii	"ERR_ALREADY_INITIALIZED -18\000"
.LASF546:
	.ascii	"INT32_MIN (-2147483647L-1)\000"
.LASF474:
	.ascii	"_VOLUMES 5\000"
.LASF388:
	.ascii	"__ARM_FEATURE_QRDMX\000"
.LASF812:
	.ascii	"fattrib\000"
.LASF487:
	.ascii	"_STRF_ENCODE 3\000"
.LASF933:
	.ascii	"dir_read\000"
.LASF605:
	.ascii	"ERR_REQ_FLUSHED -7\000"
.LASF72:
	.ascii	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL\000"
.LASF627:
	.ascii	"ERR_NOT_READY -29\000"
.LASF898:
	.ascii	"tlen\000"
.LASF739:
	.ascii	"RDDEM 0x05\000"
.LASF258:
	.ascii	"__UFRACT_IBIT__ 0\000"
.LASF392:
	.ascii	"__ARM_32BIT_STATE 1\000"
.LASF506:
	.ascii	"f_error(fp) ((fp)->err)\000"
.LASF531:
	.ascii	"CREATE_LINKMAP 0xFFFFFFFF\000"
.LASF105:
	.ascii	"__INT8_C(c) c\000"
.LASF263:
	.ascii	"__LFRACT_IBIT__ 0\000"
.LASF689:
	.ascii	"BPB_FATSz16 22\000"
.LASF163:
	.ascii	"__DBL_MIN_EXP__ (-1021)\000"
.LASF955:
	.ascii	"GNU C11 10.2.1 20201103 (release) -fmessage-length="
	.ascii	"0 -mcpu=cortex-m7 -mlittle-endian -mfloat-abi=hard "
	.ascii	"-mfpu=fpv5-d16 -mthumb -mtp=soft -munaligned-access"
	.ascii	" -std=c11 -g3 -gpubnames -O0 -fomit-frame-pointer -"
	.ascii	"fno-dwarf2-cfi-asm -fno-builtin -ffunction-sections"
	.ascii	" -fdata-sections -fshort-enums -fno-common\000"
.LASF562:
	.ascii	"UINT_LEAST16_MAX UINT16_MAX\000"
.LASF768:
	.ascii	"va_arg __builtin_va_arg\000"
.LASF824:
	.ascii	"FR_INVALID_OBJECT\000"
.LASF567:
	.ascii	"INT_FAST32_MIN INT32_MIN\000"
.LASF498:
	.ascii	"_SYNC_t \"HANDLE\"\000"
.LASF693:
	.ascii	"BPB_TotSec32 32\000"
.LASF890:
	.ascii	"clst\000"
.LASF119:
	.ascii	"__UINT16_C(c) c\000"
.LASF921:
	.ascii	"tsect\000"
.LASF628:
	.ascii	"ERR_FAILURE -30\000"
.LASF8:
	.ascii	"__VERSION__ \"10.2.1 20201103 (release)\"\000"
.LASF190:
	.ascii	"__LDBL_HAS_DENORM__ 1\000"
.LASF788:
	.ascii	"n_rootdir\000"
.LASF294:
	.ascii	"__ACCUM_MIN__ (-0X1P15K-0X1P15K)\000"
.LASF386:
	.ascii	"__ARM_FEATURE_CRYPTO\000"
.LASF51:
	.ascii	"__INT_LEAST32_TYPE__ long int\000"
.LASF884:
	.ascii	"dclst\000"
.LASF402:
	.ascii	"__ARM_ARCH_PROFILE\000"
.LASF122:
	.ascii	"__UINT_LEAST64_MAX__ 0xffffffffffffffffULL\000"
.LASF167:
	.ascii	"__DBL_DECIMAL_DIG__ 17\000"
.LASF253:
	.ascii	"__FRACT_IBIT__ 0\000"
.LASF810:
	.ascii	"fdate\000"
.LASF26:
	.ascii	"__ORDER_LITTLE_ENDIAN__ 1234\000"
.LASF647:
	.ascii	"MMC_GET_OCR 13\000"
.LASF532:
	.ascii	"LD_WORD(ptr) (WORD)(((WORD)*((BYTE*)(ptr)+1)<<8)|(W"
	.ascii	"ORD)*(BYTE*)(ptr))\000"
.LASF750:
	.ascii	"__RAL_SIZE_MAX 4294967295UL\000"
.LASF839:
	.ascii	"long long unsigned int\000"
.LASF633:
	.ascii	"STA_NOINIT 0x01\000"
.LASF557:
	.ascii	"INT_LEAST8_MAX INT8_MAX\000"
.LASF308:
	.ascii	"__ULACCUM_IBIT__ 32\000"
.LASF559:
	.ascii	"INT_LEAST32_MAX INT32_MAX\000"
.LASF69:
	.ascii	"__SHRT_MAX__ 0x7fff\000"
.LASF576:
	.ascii	"UINT_FAST64_MAX UINT64_MAX\000"
.LASF321:
	.ascii	"__ULLACCUM_EPSILON__ 0x1P-32ULLK\000"
.LASF407:
	.ascii	"__APCS_32__ 1\000"
.LASF75:
	.ascii	"__WINT_MAX__ 0xffffffffU\000"
.LASF603:
	.ascii	"ERR_SUSPEND -5\000"
.LASF328:
	.ascii	"__DQ_FBIT__ 63\000"
.LASF759:
	.ascii	"__CTYPE_BLANK 0x40\000"
.LASF335:
	.ascii	"__UHQ_IBIT__ 0\000"
.LASF366:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1\000"
.LASF58:
	.ascii	"__INT_FAST16_TYPE__ int\000"
.LASF284:
	.ascii	"__SACCUM_MIN__ (-0X1P7HK-0X1P7HK)\000"
.LASF270:
	.ascii	"__ULFRACT_MAX__ 0XFFFFFFFFP-32ULR\000"
.LASF54:
	.ascii	"__UINT_LEAST16_TYPE__ short unsigned int\000"
.LASF155:
	.ascii	"__FLT_EPSILON__ 1.1\000"
.LASF305:
	.ascii	"__LACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LK\000"
.LASF38:
	.ascii	"__CHAR16_TYPE__ short unsigned int\000"
.LASF770:
	.ascii	"va_end(ap) __builtin_va_end(ap)\000"
.LASF566:
	.ascii	"INT_FAST16_MIN INT32_MIN\000"
.LASF227:
	.ascii	"__FLT32X_DIG__ 15\000"
.LASF893:
	.ascii	"f_closedir\000"
.LASF154:
	.ascii	"__FLT_MIN__ 1.1\000"
.LASF613:
	.ascii	"ERR_BAD_FORMAT -15\000"
.LASF489:
	.ascii	"_FS_NORTC 0\000"
.LASF316:
	.ascii	"__LLACCUM_EPSILON__ 0x1P-31LLK\000"
.LASF15:
	.ascii	"__FINITE_MATH_ONLY__ 0\000"
.LASF126:
	.ascii	"__INT_FAST16_MAX__ 0x7fffffff\000"
.LASF610:
	.ascii	"ERR_NO_MEMORY -12\000"
.LASF272:
	.ascii	"__LLFRACT_FBIT__ 63\000"
.LASF19:
	.ascii	"__SIZEOF_SHORT__ 2\000"
.LASF555:
	.ascii	"INT_LEAST32_MIN INT32_MIN\000"
.LASF598:
	.ascii	"ERR_NONE 0\000"
.LASF791:
	.ascii	"cdir\000"
.LASF830:
	.ascii	"FR_TIMEOUT\000"
.LASF310:
	.ascii	"__ULACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULK\000"
.LASF794:
	.ascii	"volbase\000"
.LASF269:
	.ascii	"__ULFRACT_MIN__ 0.0ULR\000"
.LASF636:
	.ascii	"CTRL_SYNC 0\000"
.LASF876:
	.ascii	"f_rename\000"
.LASF329:
	.ascii	"__DQ_IBIT__ 0\000"
.LASF539:
	.ascii	"INT8_MAX 127\000"
.LASF443:
	.ascii	"__ARM_BF16_FORMAT_ALTERNATIVE\000"
.LASF43:
	.ascii	"__INT32_TYPE__ long int\000"
.LASF701:
	.ascii	"BPB_ExtFlags 40\000"
.LASF666:
	.ascii	"IsUpper(c) (((c)>='A')&&((c)<='Z'))\000"
.LASF495:
	.ascii	"_WORD_ACCESS 0\000"
.LASF12:
	.ascii	"__ATOMIC_RELEASE 3\000"
.LASF524:
	.ascii	"AM_HID 0x02\000"
.LASF661:
	.ascii	"ABORT(fs,res) { fp->err = (BYTE)(res); LEAVE_FF(fs,"
	.ascii	" res); }\000"
.LASF886:
	.ascii	"f_getfree\000"
.LASF458:
	.ascii	"ARM_MATH_CM7 1\000"
.LASF527:
	.ascii	"AM_LFN 0x0F\000"
.LASF564:
	.ascii	"UINT_LEAST64_MAX UINT64_MAX\000"
.LASF637:
	.ascii	"GET_SECTOR_COUNT 1\000"
.LASF417:
	.ascii	"__ARM_FP 14\000"
.LASF900:
	.ascii	"f_getcwd\000"
.LASF514:
	.ascii	"FA_WRITE 0x02\000"
.LASF341:
	.ascii	"__UTQ_IBIT__ 0\000"
.LASF802:
	.ascii	"sclust\000"
.LASF344:
	.ascii	"__SA_FBIT__ 15\000"
.LASF276:
	.ascii	"__LLFRACT_EPSILON__ 0x1P-63LLR\000"
.LASF700:
	.ascii	"BPB_FATSz32 36\000"
.LASF612:
	.ascii	"ERR_BAD_ADDRESS -14\000"
.LASF469:
	.ascii	"_USE_MKFS 0x1\000"
.LASF431:
	.ascii	"__ARM_EABI__ 1\000"
.LASF558:
	.ascii	"INT_LEAST16_MAX INT16_MAX\000"
.LASF411:
	.ascii	"__THUMBEL__ 1\000"
.LASF534:
	.ascii	"ST_WORD(ptr,val) *(BYTE*)(ptr)=(BYTE)(val); *((BYTE"
	.ascii	"*)(ptr)+1)=(BYTE)((WORD)(val)>>8)\000"
.LASF383:
	.ascii	"__ARM_FEATURE_DSP 1\000"
.LASF905:
	.ascii	"f_write\000"
.LASF635:
	.ascii	"STA_PROTECT 0x04\000"
.LASF323:
	.ascii	"__QQ_IBIT__ 0\000"
.LASF626:
	.ascii	"ERR_NO_RESOURCE -28\000"
.LASF536:
	.ascii	"_DISKIO_DEFINED \000"
.LASF765:
	.ascii	"__RAL_WCHAR_T __WCHAR_TYPE__\000"
.LASF203:
	.ascii	"__FLT32_MIN__ 1.1\000"
.LASF537:
	.ascii	"__stdint_H \000"
.LASF651:
	.ascii	"ATA_GET_SN 22\000"
.LASF670:
	.ascii	"IsDBCS2(c) 0\000"
.LASF337:
	.ascii	"__USQ_IBIT__ 0\000"
.LASF621:
	.ascii	"ERR_BAUDRATE_UNAVAILABLE -23\000"
.LASF55:
	.ascii	"__UINT_LEAST32_TYPE__ long unsigned int\000"
.LASF758:
	.ascii	"__CTYPE_CNTRL 0x20\000"
.LASF398:
	.ascii	"__ARM_FEATURE_NUMERIC_MAXMIN\000"
.LASF36:
	.ascii	"__INTMAX_TYPE__ long long int\000"
.LASF517:
	.ascii	"FA_OPEN_ALWAYS 0x10\000"
.LASF373:
	.ascii	"__GCC_ATOMIC_INT_LOCK_FREE 2\000"
.LASF529:
	.ascii	"AM_ARC 0x20\000"
.LASF845:
	.ascii	"RES_NOTRDY\000"
.LASF743:
	.ascii	"N_ROOTDIR 512\000"
.LASF421:
	.ascii	"__ARM_FEATURE_FP16_SCALAR_ARITHMETIC\000"
.LASF806:
	.ascii	"dir_ptr\000"
.LASF175:
	.ascii	"__DBL_HAS_QUIET_NAN__ 1\000"
.LASF601:
	.ascii	"ERR_ABORTED -3\000"
.LASF275:
	.ascii	"__LLFRACT_MAX__ 0X7FFFFFFFFFFFFFFFP-63LLR\000"
.LASF493:
	.ascii	"_FS_LOCK 0\000"
.LASF285:
	.ascii	"__SACCUM_MAX__ 0X7FFFP-7HK\000"
.LASF769:
	.ascii	"va_copy(d,s) __builtin_va_copy((d),(s))\000"
.LASF66:
	.ascii	"__UINTPTR_TYPE__ unsigned int\000"
.LASF662:
	.ascii	"SS(fs) ((UINT)_MAX_SS)\000"
.LASF711:
	.ascii	"BS_FilSysType32 82\000"
.LASF358:
	.ascii	"__REGISTER_PREFIX__ \000"
.LASF162:
	.ascii	"__DBL_DIG__ 15\000"
.LASF271:
	.ascii	"__ULFRACT_EPSILON__ 0x1P-32ULR\000"
.LASF594:
	.ascii	"WCHAR_MAX __WCHAR_MAX__\000"
.LASF153:
	.ascii	"__FLT_NORM_MAX__ 1.1\000"
.LASF23:
	.ascii	"__SIZEOF_SIZE_T__ 4\000"
.LASF728:
	.ascii	"DIR_WrtDate 24\000"
.LASF114:
	.ascii	"__INT64_C(c) c ## LL\000"
.LASF632:
	.ascii	"DISKIO_USB 2\000"
.LASF952:
	.ascii	"chk_chr\000"
.LASF855:
	.ascii	"f_printf\000"
.LASF438:
	.ascii	"__ARM_FEATURE_CDE\000"
.LASF293:
	.ascii	"__ACCUM_IBIT__ 16\000"
.LASF882:
	.ascii	"f_mkdir\000"
.LASF664:
	.ascii	"_DF1S 0\000"
.LASF934:
	.ascii	"dir_find\000"
.LASF891:
	.ascii	"f_stat\000"
.LASF568:
	.ascii	"INT_FAST64_MIN INT64_MIN\000"
.LASF772:
	.ascii	"short int\000"
.LASF877:
	.ascii	"path_old\000"
.LASF355:
	.ascii	"__UDA_IBIT__ 32\000"
.LASF914:
	.ascii	"mode\000"
.LASF799:
	.ascii	"FATFS\000"
.LASF361:
	.ascii	"__NO_INLINE__ 1\000"
.LASF692:
	.ascii	"BPB_HiddSec 28\000"
.LASF804:
	.ascii	"dsect\000"
.LASF436:
	.ascii	"__ARM_FEATURE_COPROC\000"
.LASF174:
	.ascii	"__DBL_HAS_INFINITY__ 1\000"
.LASF93:
	.ascii	"__SIG_ATOMIC_MAX__ 0x7fffffff\000"
.LASF625:
	.ascii	"ERR_UNSUPPORTED_OP -27\000"
.LASF210:
	.ascii	"__FLT64_MANT_DIG__ 53\000"
.LASF674:
	.ascii	"NS_LAST 0x04\000"
.LASF623:
	.ascii	"ERR_PROTOCOL -25\000"
.LASF551:
	.ascii	"INTMAX_MAX 9223372036854775807LL\000"
.LASF930:
	.ascii	"get_fileinfo\000"
.LASF465:
	.ascii	"_FFCONF 64180\000"
.LASF523:
	.ascii	"AM_RDO 0x01\000"
.LASF433:
	.ascii	"__ARM_ARCH_EXT_IDIV__ 1\000"
.LASF942:
	.ascii	"clmt_clust\000"
.LASF691:
	.ascii	"BPB_NumHeads 26\000"
.LASF808:
	.ascii	"index\000"
.LASF901:
	.ascii	"f_chdir\000"
.LASF507:
	.ascii	"f_tell(fp) ((fp)->fptr)\000"
.LASF595:
	.ascii	"WINT_MIN (-2147483647L-1)\000"
.LASF97:
	.ascii	"__INT16_MAX__ 0x7fff\000"
.LASF879:
	.ascii	"f_chmod\000"
.LASF866:
	.ascii	"b_vol\000"
.LASF81:
	.ascii	"__INT_WIDTH__ 32\000"
.LASF399:
	.ascii	"__ARM_FEATURE_SIMD32 1\000"
.LASF201:
	.ascii	"__FLT32_MAX__ 1.1\000"
.LASF756:
	.ascii	"__CTYPE_SPACE 0x08\000"
.LASF322:
	.ascii	"__QQ_FBIT__ 7\000"
.LASF486:
	.ascii	"_LFN_UNICODE 0\000"
.LASF941:
	.ascii	"dir_sdi\000"
.LASF671:
	.ascii	"NSFLAG 11\000"
.LASF95:
	.ascii	"__SIG_ATOMIC_WIDTH__ 32\000"
.LASF509:
	.ascii	"f_rewind(fp) f_lseek((fp), 0)\000"
.LASF731:
	.ascii	"LDIR_Ord 0\000"
.LASF357:
	.ascii	"__UTA_IBIT__ 64\000"
.LASF892:
	.ascii	"f_readdir\000"
.LASF501:
	.ascii	"LD2PD(vol) (BYTE)(vol)\000"
.LASF281:
	.ascii	"__ULLFRACT_EPSILON__ 0x1P-64ULLR\000"
.LASF381:
	.ascii	"__SIZEOF_WINT_T__ 4\000"
.LASF387:
	.ascii	"__ARM_FEATURE_UNALIGNED 1\000"
.LASF444:
	.ascii	"__GXX_TYPEINFO_EQUALITY_INLINE 0\000"
.LASF187:
	.ascii	"__LDBL_MIN__ 1.1\000"
.LASF696:
	.ascii	"BS_BootSig 38\000"
.LASF304:
	.ascii	"__LACCUM_MIN__ (-0X1P31LK-0X1P31LK)\000"
.LASF124:
	.ascii	"__INT_FAST8_MAX__ 0x7fffffff\000"
.LASF206:
	.ascii	"__FLT32_HAS_DENORM__ 1\000"
.LASF319:
	.ascii	"__ULLACCUM_MIN__ 0.0ULLK\000"
.LASF129:
	.ascii	"__INT_FAST32_WIDTH__ 32\000"
.LASF452:
	.ascii	"__CROSSWORKS_REVISION 0\000"
.LASF760:
	.ascii	"__CTYPE_XDIGIT 0x80\000"
.LASF707:
	.ascii	"BS_NTres32 65\000"
.LASF435:
	.ascii	"__ARM_ASM_SYNTAX_UNIFIED__ 1\000"
.LASF687:
	.ascii	"BPB_TotSec16 19\000"
.LASF762:
	.ascii	"__CTYPE_ALNUM (__CTYPE_UPPER | __CTYPE_LOWER | __CT"
	.ascii	"YPE_DIGIT)\000"
.LASF726:
	.ascii	"DIR_FstClusHI 20\000"
.LASF607:
	.ascii	"ERR_BAD_DATA -9\000"
.LASF47:
	.ascii	"__UINT32_TYPE__ long unsigned int\000"
.LASF390:
	.ascii	"__ARM_FEATURE_DOTPROD\000"
.LASF894:
	.ascii	"f_opendir\000"
.LASF573:
	.ascii	"UINT_FAST8_MAX UINT8_MAX\000"
.LASF430:
	.ascii	"__ARM_PCS_VFP 1\000"
.LASF816:
	.ascii	"FR_DISK_ERR\000"
.LASF733:
	.ascii	"LDIR_Type 12\000"
.LASF279:
	.ascii	"__ULLFRACT_MIN__ 0.0ULLR\000"
.LASF478:
	.ascii	"_VOLUME_STRS \"RAM\",\"NAND\",\"CF\",\"SD1\",\"SD2\""
	.ascii	",\"USB1\",\"USB2\",\"USB3\"\000"
.LASF459:
	.ascii	"FLASH_PLACEMENT 1\000"
.LASF16:
	.ascii	"__SIZEOF_INT__ 4\000"
.LASF737:
	.ascii	"LLEF 0x40\000"
.LASF273:
	.ascii	"__LLFRACT_IBIT__ 0\000"
.LASF748:
	.ascii	"__RAL_SIZE_T\000"
.LASF548:
	.ascii	"INT64_MAX 9223372036854775807LL\000"
.LASF588:
	.ascii	"UINT32_C(x) (x ##UL)\000"
.LASF286:
	.ascii	"__SACCUM_EPSILON__ 0x1P-7HK\000"
.LASF413:
	.ascii	"__ARM_ARCH_ISA_THUMB 2\000"
.LASF380:
	.ascii	"__SIZEOF_WCHAR_T__ 4\000"
.LASF470:
	.ascii	"_USE_FORWARD 0x1\000"
.LASF720:
	.ascii	"DIR_Attr 11\000"
.LASF62:
	.ascii	"__UINT_FAST16_TYPE__ unsigned int\000"
.LASF351:
	.ascii	"__UHA_IBIT__ 8\000"
.LASF296:
	.ascii	"__ACCUM_EPSILON__ 0x1P-15K\000"
.LASF311:
	.ascii	"__ULACCUM_EPSILON__ 0x1P-32ULK\000"
.LASF342:
	.ascii	"__HA_FBIT__ 7\000"
.LASF178:
	.ascii	"__LDBL_DIG__ 15\000"
.LASF935:
	.ascii	"st_clust\000"
.LASF734:
	.ascii	"LDIR_Chksum 13\000"
.LASF87:
	.ascii	"__SIZE_WIDTH__ 32\000"
.LASF815:
	.ascii	"FR_OK\000"
.LASF76:
	.ascii	"__WINT_MIN__ 0U\000"
.LASF482:
	.ascii	"_USE_ERASE 0\000"
.LASF211:
	.ascii	"__FLT64_DIG__ 15\000"
.LASF94:
	.ascii	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)\000"
.LASF106:
	.ascii	"__INT_LEAST8_WIDTH__ 8\000"
.LASF50:
	.ascii	"__INT_LEAST16_TYPE__ short int\000"
.LASF850:
	.ascii	"ExCvt\000"
.LASF535:
	.ascii	"ST_DWORD(ptr,val) *(BYTE*)(ptr)=(BYTE)(val); *((BYT"
	.ascii	"E*)(ptr)+1)=(BYTE)((WORD)(val)>>8); *((BYTE*)(ptr)+"
	.ascii	"2)=(BYTE)((DWORD)(val)>>16); *((BYTE*)(ptr)+3)=(BYT"
	.ascii	"E)((DWORD)(val)>>24)\000"
.LASF185:
	.ascii	"__LDBL_MAX__ 1.1\000"
.LASF775:
	.ascii	"short unsigned int\000"
.LASF823:
	.ascii	"FR_EXIST\000"
.LASF207:
	.ascii	"__FLT32_HAS_INFINITY__ 1\000"
.LASF907:
	.ascii	"wbuff\000"
.LASF624:
	.ascii	"ERR_PIN_MUX_INVALID -26\000"
.LASF480:
	.ascii	"_FS_NOFSINFO 0\000"
.LASF763:
	.ascii	"__CTYPE_GRAPH (__CTYPE_PUNCT | __CTYPE_UPPER | __CT"
	.ascii	"YPE_LOWER | __CTYPE_DIGIT)\000"
.LASF414:
	.ascii	"__ARMEL__ 1\000"
.LASF324:
	.ascii	"__HQ_FBIT__ 15\000"
.LASF586:
	.ascii	"UINT16_C(x) (x ##U)\000"
.LASF295:
	.ascii	"__ACCUM_MAX__ 0X7FFFFFFFP-15K\000"
.LASF78:
	.ascii	"__SIZE_MAX__ 0xffffffffU\000"
.LASF682:
	.ascii	"BPB_BytsPerSec 11\000"
.LASF563:
	.ascii	"UINT_LEAST32_MAX UINT32_MAX\000"
.LASF405:
	.ascii	"__ARM_ARCH\000"
.LASF202:
	.ascii	"__FLT32_NORM_MAX__ 1.1\000"
.LASF71:
	.ascii	"__LONG_MAX__ 0x7fffffffL\000"
.LASF828:
	.ascii	"FR_NO_FILESYSTEM\000"
.LASF710:
	.ascii	"BS_VolLab32 71\000"
.LASF912:
	.ascii	"rbuff\000"
.LASF712:
	.ascii	"FSI_LeadSig 0\000"
.LASF525:
	.ascii	"AM_SYS 0x04\000"
.LASF396:
	.ascii	"__ARM_FEATURE_LDREX 7\000"
.LASF617:
	.ascii	"ERR_OVERFLOW -19\000"
.LASF32:
	.ascii	"__SIZE_TYPE__ unsigned int\000"
.LASF336:
	.ascii	"__USQ_FBIT__ 32\000"
.LASF690:
	.ascii	"BPB_SecPerTrk 24\000"
.LASF245:
	.ascii	"__SFRACT_MAX__ 0X7FP-7HR\000"
.LASF226:
	.ascii	"__FLT32X_MANT_DIG__ 53\000"
.LASF502:
	.ascii	"LD2PT(vol) 0\000"
.LASF84:
	.ascii	"__WCHAR_WIDTH__ 32\000"
.LASF910:
	.ascii	"remain\000"
.LASF108:
	.ascii	"__INT16_C(c) c\000"
.LASF476:
	.ascii	"_MAX_SS 512\000"
.LASF347:
	.ascii	"__DA_IBIT__ 32\000"
.LASF86:
	.ascii	"__PTRDIFF_WIDTH__ 32\000"
.LASF717:
	.ascii	"SZ_PTE 16\000"
.LASF928:
	.ascii	"create_name\000"
.LASF13:
	.ascii	"__ATOMIC_ACQ_REL 4\000"
.LASF325:
	.ascii	"__HQ_IBIT__ 0\000"
.LASF164:
	.ascii	"__DBL_MIN_10_EXP__ (-307)\000"
.LASF722:
	.ascii	"DIR_CrtTimeTenth 13\000"
.LASF277:
	.ascii	"__ULLFRACT_FBIT__ 64\000"
.LASF575:
	.ascii	"UINT_FAST32_MAX UINT32_MAX\000"
.LASF908:
	.ascii	"csect\000"
.LASF938:
	.ascii	"nent\000"
.LASF863:
	.ascii	"part\000"
.LASF694:
	.ascii	"BS_DrvNum 36\000"
.LASF472:
	.ascii	"_USE_FIND 0x0\000"
.LASF220:
	.ascii	"__FLT64_EPSILON__ 1.1\000"
.LASF90:
	.ascii	"__UINTMAX_MAX__ 0xffffffffffffffffULL\000"
.LASF751:
	.ascii	"__RAL_PTRDIFF_T int\000"
.LASF161:
	.ascii	"__DBL_MANT_DIG__ 53\000"
.LASF268:
	.ascii	"__ULFRACT_IBIT__ 0\000"
.LASF870:
	.ascii	"n_vol\000"
.LASF814:
	.ascii	"FILINFO\000"
.LASF485:
	.ascii	"_MAX_LFN 255\000"
.LASF466:
	.ascii	"_FS_READONLY 0x0\000"
.LASF70:
	.ascii	"__INT_MAX__ 0x7fffffff\000"
.LASF52:
	.ascii	"__INT_LEAST64_TYPE__ long long int\000"
.LASF101:
	.ascii	"__UINT16_MAX__ 0xffff\000"
.LASF582:
	.ascii	"UINTPTR_MAX UINT32_MAX\000"
.LASF585:
	.ascii	"INT16_C(x) (x)\000"
.LASF439:
	.ascii	"__ARM_FEATURE_CDE_COPROC\000"
.LASF902:
	.ascii	"f_chdrive\000"
.LASF561:
	.ascii	"UINT_LEAST8_MAX UINT8_MAX\000"
	.ident	"GCC: (GNU) 10.2.1 20201103 (release)"
