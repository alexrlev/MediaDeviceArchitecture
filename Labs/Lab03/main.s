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
	@ link register save eliminated.
	mov	r2, #67108864
	ldr	r3, .L8
	ldr	ip, [r3]
	ldr	r1, .L8+4
	add	r3, ip, #47872
	ldr	r0, .L8+8
	strh	r1, [r2]	@ movhi
	add	r1, r3, #126
	sub	r2, ip, #2
.L2:
	strh	r0, [r2, #2]!	@ movhi
	cmp	r2, r1
	bne	.L2
	mvn	r1, #49152
	ldr	r2, .L8+12
	add	r3, r3, #126
	add	r2, ip, r2
.L3:
	strh	r1, [r3, #2]!	@ movhi
	cmp	r2, r3
	bne	.L3
	bx	lr
.L9:
	.align	2
.L8:
	.word	videoBuffer
	.word	1027
	.word	32239
	.word	76798
	.size	initialize, .-initialize
	.align	2
	.global	swap
	.syntax unified
	.arm
	.fpu softvfp
	.type	swap, %function
swap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	ldr	r2, [r1]
	str	r2, [r0]
	str	r3, [r1]
	bx	lr
	.size	swap, .-swap
	.align	2
	.global	drawPerson
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPerson, %function
drawPerson:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	subs	r6, r2, #0
	ble	.L11
	mov	r7, r3
	sub	r4, r0, #4
	ldr	r8, .L16
	add	r6, r4, r6, lsl #2
	sub	r5, r1, #4
.L13:
	ldr	r0, [r4, #4]!
	mov	r2, r7
	ldr	r1, [r5, #4]!
	mov	lr, pc
	bx	r8
	cmp	r4, r6
	bne	.L13
.L11:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	setPixel
	.size	drawPerson, .-drawPerson
	.align	2
	.global	drawBackground
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBackground, %function
drawBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L24
	ldr	ip, [r3]
	ldr	r0, .L24+4
	add	r3, ip, #47872
	add	r1, r3, #126
	sub	r2, ip, #2
.L19:
	strh	r0, [r2, #2]!	@ movhi
	cmp	r2, r1
	bne	.L19
	mvn	r1, #49152
	ldr	r2, .L24+8
	add	r3, r3, #126
	add	r2, ip, r2
.L20:
	strh	r1, [r3, #2]!	@ movhi
	cmp	r2, r3
	bne	.L20
	bx	lr
.L25:
	.align	2
.L24:
	.word	videoBuffer
	.word	32239
	.word	76798
	.size	drawBackground, .-drawBackground
	.align	2
	.global	drawCactus
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCactus, %function
drawCactus:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, r0
	ldr	r6, .L28
	sub	sp, sp, #8
	ldr	r4, .L28+4
	mov	r1, r0
	str	r6, [sp]
	mov	r3, #4
	mov	r2, #9
	mov	r0, #79
	mov	lr, pc
	bx	r4
	add	r1, r5, #4
	str	r6, [sp]
	mov	r3, #3
	mov	r2, #4
	mov	r0, #84
	mov	lr, pc
	bx	r4
	add	r1, r5, #7
	str	r6, [sp]
	mov	r3, #6
	mov	r2, #30
	mov	r0, #72
	mov	lr, pc
	bx	r4
	add	r1, r5, #13
	str	r6, [sp]
	mov	r3, #3
	mov	r2, #4
	mov	r0, #87
	mov	lr, pc
	bx	r4
	str	r6, [sp]
	add	r1, r5, #16
	mov	r3, #4
	mov	r2, #9
	mov	r0, #82
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	4067
	.word	drawRect
	.size	drawCactus, .-drawCactus
	.align	2
	.global	eraseCactus
	.syntax unified
	.arm
	.fpu softvfp
	.type	eraseCactus, %function
eraseCactus:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r5, r0
	ldr	r3, .L32
	sub	sp, sp, #12
	mov	r1, r0
	str	r3, [sp]
	ldr	r4, .L32+4
	mov	r3, #20
	mov	r2, #28
	mov	r0, #72
	mov	lr, pc
	bx	r4
	ldr	r3, .L32+8
	mov	r1, r5
	str	r3, [sp]
	mov	r2, #2
	mov	r3, #20
	mov	r0, #100
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	32239
	.word	drawRect
	.word	16383
	.size	eraseCactus, .-eraseCactus
	.align	2
	.global	drawCacti
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCacti, %function
drawCacti:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L36
	ldr	r0, [r4]
	bl	eraseCactus
	ldr	r0, [r4, #8]
	bl	drawCactus
	ldr	r0, [r4, #4]
	bl	eraseCactus
	ldr	r0, [r4, #12]
	pop	{r4, lr}
	b	drawCactus
.L37:
	.align	2
.L36:
	.word	.LANCHOR0
	.size	drawCacti, .-drawCacti
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r1, .L60
	ldr	r3, .L60+4
	strh	r1, [r2]	@ movhi
	ldr	r1, [r3]
	ldr	ip, .L60+8
	add	r3, r1, #47872
	add	r0, r3, #126
	sub	r2, r1, #2
.L39:
	strh	ip, [r2, #2]!	@ movhi
	cmp	r2, r0
	bne	.L39
	mvn	r0, #49152
	ldr	r2, .L60+12
	add	r3, r3, #126
	add	r2, r1, r2
.L40:
	strh	r0, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L40
	ldr	r9, .L60+16
	ldr	r4, .L60+20
	ldr	r8, .L60+24
	ldr	r5, .L60+28
	ldr	r7, .L60+8
	ldr	r6, .L60+32
.L49:
	ldr	ip, .L60+36
	ldr	r1, [r9, #8]
	ldrh	r2, [ip]
	ldr	r3, .L60+40
	add	r0, r1, #1
	strh	r2, [r3]	@ movhi
	ldr	r3, .L60+44
	cmp	r0, #220
	ldrh	r3, [r3, #48]
	str	r1, [r9]
	movgt	r1, #0
	strgt	r1, [r9, #8]
	ldr	r1, [r9, #12]
	strle	r0, [r9, #8]
	add	r0, r1, #1
	cmp	r0, #220
	str	r1, [r9, #4]
	movgt	r1, #0
	strle	r0, [r9, #12]
	strgt	r1, [r9, #12]
	tst	r2, #8
	strh	r3, [ip]	@ movhi
	beq	.L45
	tst	r3, #8
	beq	.L59
.L45:
	ldr	r3, .L60+48
	mov	lr, pc
	bx	r3
	ldr	r10, .L60+52
	ldr	fp, .L60+56
.L47:
	ldr	r0, [r10, #4]!
	mov	r2, r7
	ldr	r1, [fp, #4]!
	mov	lr, pc
	bx	r5
	cmp	r8, r10
	bne	.L47
	ldr	r3, .L60+60
	mov	lr, pc
	bx	r3
	ldr	r10, .L60+64
	ldr	fp, .L60+68
.L48:
	ldr	r0, [r10, #4]!
	mov	r2, r6
	ldr	r1, [fp, #4]!
	mov	lr, pc
	bx	r5
	cmp	r10, r4
	bne	.L48
	b	.L49
.L59:
	ldr	r3, .L60+64
	ldr	r0, .L60+52
	ldr	r1, .L60+68
	ldr	r2, .L60+56
.L46:
	ldr	r10, [r3, #4]!
	ldr	lr, [r0, #4]!
	ldr	ip, [r1, #4]!
	str	lr, [r3]
	ldr	lr, [r2, #4]!
	cmp	r3, r4
	str	r10, [r0]
	str	lr, [r1]
	str	ip, [r2]
	bne	.L46
	b	.L45
.L61:
	.align	2
.L60:
	.word	1027
	.word	videoBuffer
	.word	32239
	.word	76798
	.word	.LANCHOR0
	.word	visiblePersonRows+756
	.word	invisiblePersonRows+756
	.word	setPixel
	.word	32767
	.word	buttons
	.word	oldButtons
	.word	67109120
	.word	waitForVBlank
	.word	invisiblePersonRows-4
	.word	invisiblePersonCols-4
	.word	drawCacti
	.word	visiblePersonRows-4
	.word	visiblePersonCols-4
	.size	main, .-main
	.text
	.align	2
	.global	advanceCacti
	.syntax unified
	.arm
	.fpu softvfp
	.type	advanceCacti, %function
advanceCacti:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L67
	ldr	r2, [r3, #8]
	add	r1, r2, #1
	cmp	r1, #220
	str	r2, [r3]
	movgt	r2, #0
	strgt	r2, [r3, #8]
	ldr	r2, [r3, #12]
	strle	r1, [r3, #8]
	add	r1, r2, #1
	cmp	r1, #220
	str	r2, [r3, #4]
	movgt	r2, #0
	strle	r1, [r3, #12]
	strgt	r2, [r3, #12]
	bx	lr
.L68:
	.align	2
.L67:
	.word	.LANCHOR0
	.size	advanceCacti, .-advanceCacti
	.global	oldCactusCols
	.global	cactusCols
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	oldCactusCols, %object
	.size	oldCactusCols, 8
oldCactusCols:
	.word	0
	.word	110
	.type	cactusCols, %object
	.size	cactusCols, 8
cactusCols:
	.word	0
	.word	110
	.ident	"GCC: (devkitARM release 50) 8.2.0"
