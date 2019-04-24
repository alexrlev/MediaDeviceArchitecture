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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel3
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel3, %function
setPixel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, r0, lsl #4
	ldr	r3, [r3]
	lsl	r1, r1, #1
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	setPixel3, .-setPixel3
	.align	2
	.global	drawRect3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	str	lr, [sp, #-4]!
	ldr	lr, .L14
	add	r2, r0, r2
	rsb	ip, r2, r2, lsl #4
	rsb	r0, r0, r0, lsl #4
	ldr	r2, [lr]
	add	ip, r1, ip, lsl #4
	sub	sp, sp, #12
	add	r1, r1, r0, lsl #4
	ldr	r0, [lr, #4]
	add	ip, r2, ip, lsl #1
	add	r1, r2, r1, lsl #1
	orr	r3, r3, #-2130706432
	add	r2, sp, #6
.L7:
	str	r2, [r0, #36]
	str	r1, [r0, #40]
	add	r1, r1, #480
	cmp	r1, ip
	str	r3, [r0, #44]
	bne	.L7
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L15:
	.align	2
.L14:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
	.align	2
	.global	drawImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	cmp	r3, #0
	ldr	lr, [sp, #8]
	ble	.L16
	ldr	r4, .L22
	add	r3, r1, r3
	rsb	ip, r3, r3, lsl #4
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r4]
	add	ip, r2, ip, lsl #4
	add	r2, r2, r1, lsl #4
	add	ip, r3, ip, lsl #1
	ldr	r1, [r4, #4]
	add	r2, r3, r2, lsl #1
	orr	r4, lr, #-2147483648
	lsl	r3, lr, #1
.L18:
	str	r0, [r1, #36]
	str	r2, [r1, #40]
	add	r2, r2, #480
	cmp	r2, ip
	str	r4, [r1, #44]
	add	r0, r0, r3
	bne	.L18
.L16:
	pop	{r4, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	fillScreen3
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen3, %function
fillScreen3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L26
	sub	sp, sp, #8
	ldm	r2, {r2, r3}
	ldr	r1, .L26+4
	add	ip, sp, #6
	strh	r0, [sp, #6]	@ movhi
	str	ip, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L27:
	.align	2
.L26:
	.word	.LANCHOR0
	.word	-2130668032
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	setPixel4
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L31
	add	r3, r1, r1, lsr #31
	rsb	r0, r0, r0, lsl #4
	asr	r3, r3, #1
	add	r3, r3, r0, lsl #3
	ldr	ip, [ip]
	lsl	r0, r3, #1
	ldrh	r3, [ip, r0]
	tst	r1, #1
	andne	r3, r3, #255
	biceq	r3, r3, #255
	orrne	r2, r3, r2, lsl #8
	orreq	r2, r3, r2
	strh	r2, [ip, r0]	@ movhi
	bx	lr
.L32:
	.align	2
.L31:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #28
	ldrb	r7, [sp, #64]	@ zero_extendqisi2
	lsl	r8, r7, #24
	subs	r4, r2, #0
	orr	r2, r7, r8, lsr #16
	strh	r2, [sp, #22]	@ movhi
	ble	.L33
	ldr	r6, .L48
	add	r4, r0, r4
	add	r9, r1, r1, lsr #31
	add	lr, r1, #1
	add	r5, r3, r3, lsr #31
	asr	r9, r9, #1
	sub	ip, r3, #1
	rsb	r2, r0, r0, lsl #4
	add	lr, lr, lr, lsr #31
	asr	r5, r5, #1
	rsb	r4, r4, r4, lsl #4
	ldr	r10, [r6]
	add	ip, ip, r1
	add	r4, r9, r4, lsl #3
	add	r2, r9, r2, lsl #3
	rsb	fp, r9, r9, lsl #31
	rsb	r9, r9, lr, asr #1
	sub	lr, r5, #1
	ldr	r0, [r6, #4]
	orr	lr, lr, #-2130706432
	add	r6, ip, ip, lsr #31
	and	ip, ip, #1
	add	r2, r10, r2, lsl #1
	add	r4, r10, r4, lsl #1
	asr	r8, r8, #16
	lsl	fp, fp, #1
	lsl	r9, r9, #1
	str	lr, [sp, #8]
	orr	r5, r5, #-2130706432
	and	r1, r1, #1
	and	r3, r3, #1
	bic	r6, r6, #1
	add	r10, sp, #22
	str	r7, [sp, #12]
	str	ip, [sp, #4]
	b	.L40
.L47:
	mov	lr, r2
	ldrb	ip, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	orr	ip, r8, ip
	strh	ip, [lr], r9	@ movhi
	beq	.L36
	str	r10, [r0, #36]
	str	lr, [r0, #40]
	str	r5, [r0, #44]
.L37:
	add	r2, r2, #240
	cmp	r4, r2
	beq	.L33
.L40:
	cmp	r1, #0
	bne	.L47
	cmp	r3, #0
	str	r10, [r0, #36]
	str	r2, [r0, #40]
	str	r5, [r0, #44]
	beq	.L37
	ldr	ip, [sp, #4]
	add	lr, fp, r2
	cmp	ip, #0
	ldrh	ip, [lr, r6]
	ldreq	r7, [sp, #12]
	andne	ip, ip, #255
	biceq	ip, ip, #255
	add	r2, r2, #240
	orrne	ip, r8, ip
	orreq	ip, ip, r7
	cmp	r4, r2
	strh	ip, [lr, r6]	@ movhi
	bne	.L40
.L33:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L36:
	ldr	ip, [sp, #4]
	ldr	r7, [sp, #8]
	cmp	ip, #0
	add	ip, fp, r2
	str	r10, [r0, #36]
	str	lr, [r0, #40]
	ldrh	lr, [ip, r6]
	str	r7, [r0, #44]
	ldreq	r7, [sp, #12]
	andne	lr, lr, #255
	biceq	lr, lr, #255
	orrne	lr, r8, lr
	orreq	lr, lr, r7
	strh	lr, [ip, r6]	@ movhi
	b	.L37
.L49:
	.align	2
.L48:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L52
	sub	sp, sp, #8
	ldm	r2, {r2, r3}
	ldr	r1, .L52+4
	orr	r0, r0, r0, lsl #8
	add	ip, sp, #6
	strh	r0, [sp, #6]	@ movhi
	str	ip, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L53:
	.align	2
.L52:
	.word	.LANCHOR0
	.word	-2130687232
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L56
	str	lr, [sp, #-4]!
	add	r0, r0, r0, lsl #1
	ldr	lr, [ip, #4]
	lsl	r0, r0, #2
	add	ip, lr, r0
	orr	r3, r3, #-2147483648
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	ldr	lr, [sp], #4
	str	r3, [ip, #8]
	bx	lr
.L57:
	.align	2
.L56:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	waitForVblank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVblank, %function
waitForVblank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L59:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L59
	mov	r2, #67108864
.L60:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L60
	bx	lr
	.size	waitForVblank, .-waitForVblank
	.align	2
	.global	flipPage
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	ldrh	r3, [r2]
	ldr	r1, .L67
	tst	r3, #16
	ldrne	r0, [r1, #8]
	ldreq	r0, [r1, #12]
	bicne	r3, r3, #16
	orreq	r3, r3, #16
	strh	r3, [r2]	@ movhi
	str	r0, [r1]
	bx	lr
.L68:
	.align	2
.L67:
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.global	dma
	.global	backBuffer
	.global	frontBuffer
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.type	backBuffer, %object
	.size	backBuffer, 4
backBuffer:
	.word	100704256
	.type	frontBuffer, %object
	.size	frontBuffer, 4
frontBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 50) 8.2.0"
