	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #0
	ldr	r0, .L4
	ldr	r3, .L4+4
	push	{r4, r5, r6, lr}
	strh	r0, [r2]	@ movhi
	strh	r1, [r3]	@ movhi
	add	r2, r2, #256
	ldr	r3, .L4+8
	ldrh	lr, [r2, #48]
	ldr	ip, .L4+12
	ldr	r1, .L4+16
	mov	r0, r3
	ldr	r2, .L4+20
	strh	lr, [ip]	@ movhi
	strh	r3, [r1]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r1, #20
	mov	r2, #1
	mov	lr, #19
	mov	r4, #15
	mov	r3, #120
	mov	ip, #17
	mov	r0, #10
	ldr	r5, .L4+24
	str	r1, [r5]
	ldr	r5, .L4+28
	str	r1, [r5]
	ldr	r5, .L4+32
	str	r1, [r5]
	ldr	r5, .L4+36
	str	r1, [r5]
	ldr	r1, .L4+40
	str	r2, [r1]
	ldr	r1, .L4+44
	str	r2, [r1]
	ldr	r1, .L4+48
	str	r2, [r1]
	ldr	r1, .L4+52
	str	r2, [r1]
	ldr	r2, .L4+56
	str	lr, [r2]
	ldr	r2, .L4+60
	ldr	lr, .L4+64
	str	r4, [r2]
	ldr	r1, .L4+68
	ldr	r2, .L4+72
	str	r3, [lr]
	str	r3, [r1]
	ldr	lr, .L4+76
	str	r3, [r2]
	ldr	r1, .L4+80
	ldr	r2, .L4+84
	str	r3, [lr]
	str	ip, [r1]
	str	r0, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	oldButtons
	.word	32736
	.word	buttons
	.word	bgColor
	.word	fillScreen
	.word	gRow
	.word	gCol
	.word	gOldRow
	.word	gOldCol
	.word	gRDel
	.word	gCDel
	.word	bRDel
	.word	bCDel
	.word	gHeight
	.word	gWidth
	.word	bRow
	.word	bCol
	.word	bOldRow
	.word	bOldCol
	.word	bHeight
	.word	bWidth
	.size	initialize, .-initialize
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L30
	ldrh	r3, [r3]
	tst	r3, #8
	sub	sp, sp, #16
	beq	.L7
	ldr	r3, .L30+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L26
.L7:
	ldr	r3, .L30+8
	ldr	lr, [r3]
	cmp	lr, #0
	ble	.L9
	ldr	r2, .L30+12
	ldrh	r2, [r2, #48]
	tst	r2, #32
	subeq	lr, lr, #1
	streq	lr, [r3]
.L9:
	ldr	r2, .L30+16
	ldr	r9, [r2]
	add	r2, r9, lr
	cmp	r2, #239
	ble	.L27
.L10:
	ldr	r3, .L30+20
	ldr	ip, [r3]
	cmp	ip, #0
	ble	.L11
	ldr	r2, .L30+12
	ldrh	r2, [r2, #48]
	tst	r2, #64
	subeq	ip, ip, #1
	streq	ip, [r3]
.L11:
	ldr	r2, .L30+24
	ldr	r8, [r2]
	add	r2, r8, ip
	cmp	r2, #159
	ble	.L28
.L12:
	ldr	r5, .L30+28
	ldr	r0, [r5]
	ldr	r3, .L30+32
	cmp	r0, #0
	ldr	r7, .L30+36
	ldr	r2, [r3]
	ble	.L13
	add	r3, r0, r2
	cmp	r3, #159
	bgt	.L13
.L14:
	ldr	r4, .L30+40
	ldr	r1, [r4]
	ldr	r3, .L30+44
	cmp	r1, #0
	ldr	r3, [r3]
	ble	.L15
	add	r6, r1, r3
	cmp	r6, #239
	ble	.L29
.L15:
	ldr	r6, .L30+48
	ldr	r10, [r6]
	rsb	r10, r10, #0
	str	r10, [r6]
.L16:
	str	r8, [sp, #8]
	str	r9, [sp, #12]
	stm	sp, {ip, lr}
	ldr	r8, .L30+52
	mov	lr, pc
	bx	r8
	cmp	r0, #1
	ldreq	r2, [r7]
	ldreq	r3, [r6]
	rsbeq	r0, r2, #0
	rsbeq	r1, r3, #0
	ldr	r2, [r5]
	ldr	r3, [r4]
	ldrne	r0, [r7]
	ldrne	r1, [r6]
	add	r2, r2, r0
	add	r3, r3, r1
	streq	r0, [r7]
	streq	r1, [r6]
	str	r2, [r5]
	str	r3, [r4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L13:
	ldr	r3, [r7]
	rsb	r3, r3, #0
	str	r3, [r7]
	b	.L14
.L28:
	ldr	r2, .L30+12
	ldrh	r2, [r2, #48]
	tst	r2, #128
	addeq	ip, ip, #1
	streq	ip, [r3]
	b	.L12
.L27:
	ldr	r2, .L30+12
	ldrh	r2, [r2, #48]
	tst	r2, #16
	addeq	lr, lr, #1
	streq	lr, [r3]
	b	.L10
.L29:
	ldr	r6, .L30+48
	b	.L16
.L26:
	ldr	r2, .L30+56
	ldr	r3, .L30+60
	ldrh	r0, [r2]
	ldr	r1, .L30+64
	cmp	r0, r3
	moveq	r3, r1
	ldr	r1, .L30+68
	mov	r0, r3
	strh	r3, [r2]	@ movhi
	mov	lr, pc
	bx	r1
	b	.L7
.L31:
	.align	2
.L30:
	.word	oldButtons
	.word	buttons
	.word	bCol
	.word	67109120
	.word	bWidth
	.word	bRow
	.word	bHeight
	.word	gRow
	.word	gHeight
	.word	gRDel
	.word	gCol
	.word	gWidth
	.word	gCDel
	.word	collision
	.word	bgColor
	.word	32736
	.word	1023
	.word	fillScreen
	.size	update, .-update
	.align	2
	.global	draw
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, .L34
	ldrh	r3, [r8]
	sub	sp, sp, #12
	str	r3, [sp]
	ldr	r7, .L34+4
	ldr	r6, .L34+8
	ldr	r5, .L34+12
	ldr	r1, .L34+16
	ldr	r4, .L34+20
	ldr	r3, [r7]
	ldr	r2, [r6]
	ldr	r0, [r5]
	ldr	r1, [r1]
	mov	lr, pc
	bx	r4
	ldrh	r3, [r8]
	ldr	ip, .L34+24
	ldr	lr, .L34+28
	str	r3, [sp]
	ldr	fp, .L34+32
	ldr	r10, .L34+36
	ldr	r1, [ip]
	ldr	r0, [lr]
	ldr	r3, [fp]
	ldr	r2, [r10]
	mov	lr, pc
	bx	r4
	mov	r1, #992
	ldr	r3, [r7]
	ldr	r2, [r6]
	ldr	r8, .L34+40
	ldr	r9, .L34+44
	str	r1, [sp]
	ldr	r0, [r9]
	ldr	r1, [r8]
	mov	lr, pc
	bx	r4
	mov	r1, #31744
	ldr	r6, .L34+48
	str	r1, [sp]
	ldr	r7, .L34+52
	ldr	r3, [fp]
	ldr	r2, [r10]
	ldr	r1, [r6]
	ldr	r0, [r7]
	mov	lr, pc
	bx	r4
	ldr	r0, [r9]
	ldr	r1, [r8]
	ldr	r2, [r7]
	ldr	r3, [r6]
	str	r0, [r5]
	ldr	lr, .L34+28
	ldr	r0, .L34+16
	ldr	ip, .L34+24
	str	r1, [r0]
	str	r2, [lr]
	str	r3, [ip]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	bgColor
	.word	gWidth
	.word	gHeight
	.word	gOldRow
	.word	gOldCol
	.word	drawRect
	.word	bOldCol
	.word	bOldRow
	.word	bWidth
	.word	bHeight
	.word	gCol
	.word	gRow
	.word	bCol
	.word	bRow
	.size	draw, .-draw
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r7, lr}
	ldr	r3, .L39
	mov	lr, pc
	bx	r3
	ldr	r9, .L39+4
	ldr	r8, .L39+8
	ldr	r7, .L39+12
	ldr	r6, .L39+16
	ldr	r5, .L39+20
	ldr	r4, .L39+24
.L37:
	ldrh	r3, [r4, #48]
	strh	r3, [r9]	@ movhi
	mov	lr, pc
	bx	r8
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	b	.L37
.L40:
	.align	2
.L39:
	.word	initialize
	.word	oldButtons
	.word	update
	.word	buttons
	.word	waitForVBlank
	.word	draw
	.word	67109120
	.size	main, .-main
	.comm	bWidth,4,4
	.comm	bHeight,4,4
	.comm	bCDel,4,4
	.comm	bRDel,4,4
	.comm	bOldCol,4,4
	.comm	bOldRow,4,4
	.comm	bCol,4,4
	.comm	bRow,4,4
	.comm	gWidth,4,4
	.comm	gHeight,4,4
	.comm	gCDel,4,4
	.comm	gRDel,4,4
	.comm	gOldCol,4,4
	.comm	gOldRow,4,4
	.comm	gCol,4,4
	.comm	gRow,4,4
	.comm	bgColor,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 50) 8.2.0"
