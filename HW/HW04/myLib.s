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
	ldr	r3, .L8
	rsb	r0, r0, r0, lsl #4
	add	r0, r1, r0, lsl #4
	ldr	ip, [r3]
	add	r0, r0, r0, lsr #31
	bic	r0, r0, #1
	ldrh	r3, [ip, r0]
	tst	r1, #1
	andne	r3, r3, #255
	andeq	r3, r3, #65280
	orrne	r2, r3, r2, lsl #8
	orreq	r2, r3, r2
	strh	r2, [ip, r0]	@ movhi
	bx	lr
.L9:
	.align	2
.L8:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawHorizontalLine3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHorizontalLine3, %function
drawHorizontalLine3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	rsb	r0, r0, r0, lsl #4
	str	lr, [sp, #-4]!
	ldr	lr, .L18
	lsl	ip, r0, #4
	add	r2, ip, r2
	ldr	r0, [lr]
	add	r2, r2, r1
	add	r1, r1, ip
	add	r2, r0, r2, lsl #1
	add	r1, r0, r1, lsl #1
.L12:
	strh	r3, [r1], #2	@ movhi
	cmp	r1, r2
	bne	.L12
	ldr	lr, [sp], #4
	bx	lr
.L19:
	.align	2
.L18:
	.word	.LANCHOR0
	.size	drawHorizontalLine3, .-drawHorizontalLine3
	.align	2
	.global	drawHorizontalLine4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHorizontalLine4, %function
drawHorizontalLine4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	ldr	ip, .L30
	rsb	r0, r0, r0, lsl #4
	push	{r4, r5, r6, lr}
	lsl	r5, r0, #4
	lsl	r6, r3, #24
	ldr	r4, [ip]
	sub	r5, r5, #1
	add	r2, r2, r1
	asr	r6, r6, #16
.L24:
	add	lr, r1, #1
	add	r0, r5, lr
	add	r0, r0, r0, lsr #31
	bic	r0, r0, #1
	tst	r1, #1
	ldrh	r1, [r4, r0]
	and	ip, r1, #255
	orr	ip, r6, ip
	lsl	ip, ip, #16
	andeq	ip, r1, #65280
	lsrne	ip, ip, #16
	orreq	ip, ip, r3
	cmp	r2, lr
	mov	r1, lr
	strh	ip, [r4, r0]	@ movhi
	bne	.L24
	pop	{r4, r5, r6, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	.LANCHOR0
	.size	drawHorizontalLine4, .-drawHorizontalLine4
	.align	2
	.global	drawVerticalLine3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawVerticalLine3, %function
drawVerticalLine3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	str	lr, [sp, #-4]!
	ldr	lr, .L40
	add	r2, r0, r2
	rsb	ip, r2, r2, lsl #4
	rsb	r0, r0, r0, lsl #4
	ldr	r2, [lr]
	add	ip, r1, ip, lsl #4
	add	r1, r1, r0, lsl #4
	add	r1, r2, r1, lsl #1
	add	r0, r2, ip, lsl #1
.L34:
	strh	r3, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, r0
	bne	.L34
	ldr	lr, [sp], #4
	bx	lr
.L41:
	.align	2
.L40:
	.word	.LANCHOR0
	.size	drawVerticalLine3, .-drawVerticalLine3
	.align	2
	.global	drawVerticalLine4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawVerticalLine4, %function
drawVerticalLine4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	push	{r4, r5, r6, lr}
	ldr	ip, .L53
	add	r5, r2, r0
	rsb	r5, r5, r5, lsl #4
	rsb	r0, r0, r0, lsl #4
	lsl	r6, r3, #24
	ldr	r4, [ip]
	add	r5, r1, r5, lsl #4
	add	ip, r1, r0, lsl #4
	asr	r6, r6, #16
	and	r1, r1, #1
.L46:
	add	r0, ip, ip, lsr #31
	bic	r0, r0, #1
	ldrh	lr, [r4, r0]
	and	r2, lr, #255
	cmp	r1, #0
	orr	r2, r6, r2
	lsl	r2, r2, #16
	add	ip, ip, #240
	andeq	r2, lr, #65280
	lsrne	r2, r2, #16
	orreq	r2, r2, r3
	cmp	r5, ip
	strh	r2, [r4, r0]	@ movhi
	bne	.L46
	pop	{r4, r5, r6, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	.LANCHOR0
	.size	drawVerticalLine4, .-drawVerticalLine4
	.align	2
	.global	drawRect3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	push	{r4, lr}
	mov	lr, #0
	ldr	r4, .L64
	add	r2, r0, r2
	rsb	ip, r2, r2, lsl #4
	rsb	r0, r0, r0, lsl #4
	ldr	r2, [r4]
	add	ip, r1, ip, lsl #4
	add	r1, r1, r0, lsl #4
	ldr	r0, [r4, #4]
	orr	r3, r3, #-2130706432
	add	ip, r2, ip, lsl #1
	add	r1, r2, r1, lsl #1
.L57:
	add	r2, sp, #8
	str	lr, [r0, #44]
	str	r2, [r0, #36]
	str	r1, [r0, #40]
	add	r1, r1, #480
	cmp	r1, ip
	str	r3, [r0, #44]
	bne	.L57
	pop	{r4, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
	.align	2
	.global	drawRect4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #20
	ldrb	ip, [sp, #56]	@ zero_extendqisi2
	ldrb	lr, [sp, #56]	@ zero_extendqisi2
	cmp	r2, #0
	orr	ip, ip, lr, lsl #8
	strh	ip, [sp, #14]	@ movhi
	ble	.L66
	add	r4, r0, r2
	add	r2, r3, r3, lsr #31
	asr	r7, r3, #1
	asr	r2, r2, #1
	sub	r5, r7, #1
	ldr	ip, .L85
	add	r6, r1, r3
	orr	r2, r2, #-2130706432
	rsb	r4, r4, r4, lsl #4
	rsb	r0, r0, r0, lsl #4
	sub	r6, r6, #1
	str	r2, [sp]
	orr	r2, r5, #-2130706432
	ldr	lr, [ip]
	add	r4, r1, r4, lsl #4
	add	r0, r1, r0, lsl #4
	ldr	ip, [ip, #4]
	str	r2, [sp, #4]
	orr	r7, r7, #-2130706432
	and	r6, r6, #1
	and	r1, r1, #1
	and	r5, r3, #1
	add	r8, sp, #14
	sub	r9, r3, #1
	b	.L78
.L84:
	add	r2, r0, r0, lsr #31
	bic	r2, r2, #1
	cmp	r5, #0
	ldrb	r10, [lr, r2]	@ zero_extendqisi2
	ldrb	fp, [sp, #56]	@ zero_extendqisi2
	beq	.L69
	orr	r10, r10, fp, lsl #8
	cmp	r3, #1
	strh	r10, [lr, r2]	@ movhi
	ble	.L70
	mov	r10, #0
	add	r2, r0, #1
	add	r2, r2, r2, lsr #31
	bic	r2, r2, #1
	add	r2, lr, r2
	str	r10, [ip, #44]
	str	r8, [ip, #36]
	str	r2, [ip, #40]
	str	r7, [ip, #44]
.L70:
	add	r0, r0, #240
	cmp	r4, r0
	beq	.L66
.L78:
	cmp	r1, #0
	bne	.L84
	cmp	r5, #0
	beq	.L74
	cmp	r3, #1
	ble	.L75
	add	r2, r0, r0, lsr #31
	bic	r2, r2, #1
	add	r2, lr, r2
	str	r1, [ip, #44]
	str	r8, [ip, #36]
	str	r2, [ip, #40]
	str	r7, [ip, #44]
.L75:
	add	r2, r9, r0
	add	r2, r2, r2, lsr #31
	bic	r2, r2, #1
	ldrh	fp, [lr, r2]
	ldrb	r10, [sp, #56]	@ zero_extendqisi2
	cmp	r6, #0
	andne	fp, fp, #255
	andeq	fp, fp, #65280
	and	r10, r10, #255
	add	r0, r0, #240
	orrne	fp, fp, r10, lsl #8
	orreq	fp, fp, r10
	cmp	r4, r0
	strh	fp, [lr, r2]	@ movhi
	bne	.L78
.L66:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L74:
	add	r2, r0, r0, lsr #31
	bic	r2, r2, #1
	add	r2, lr, r2
	str	r5, [ip, #44]
	str	r8, [ip, #36]
	str	r2, [ip, #40]
	ldr	r2, [sp]
	str	r2, [ip, #44]
	b	.L70
.L69:
	orr	r10, r10, fp, lsl #8
	cmp	r3, #2
	strh	r10, [lr, r2]	@ movhi
	ble	.L75
	add	r2, r0, #1
	add	r2, r2, r2, lsr #31
	bic	r2, r2, #1
	add	r2, lr, r2
	str	r5, [ip, #44]
	str	r8, [ip, #36]
	str	r2, [ip, #40]
	ldr	r2, [sp, #4]
	str	r2, [ip, #44]
	b	.L75
.L86:
	.align	2
.L85:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
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
	str	lr, [sp, #-4]!
	mov	lr, #0
	ldr	r2, .L89
	sub	sp, sp, #12
	ldm	r2, {r2, r3}
	ldr	r1, .L89+4
	add	ip, sp, #6
	strh	r0, [sp, #6]	@ movhi
	str	lr, [r3, #44]
	str	ip, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L90:
	.align	2
.L89:
	.word	.LANCHOR0
	.word	-2130668032
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	sub	sp, sp, #20
	strb	r0, [sp, #7]
	ldrb	r0, [sp, #7]	@ zero_extendqisi2
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	ldr	r1, .L93
	ldrb	ip, [sp, #7]	@ zero_extendqisi2
	lsl	r3, r3, #16
	ldrb	r2, [sp, #7]	@ zero_extendqisi2
	orr	r3, r3, r0, lsl #24
	orr	r3, r3, r2
	ldm	r1, {r0, r2}
	ldr	r1, .L93+4
	orr	r3, r3, ip, lsl #8
	add	ip, sp, #12
	str	r3, [sp, #12]
	str	lr, [r2, #44]
	str	ip, [r2, #36]
	str	r0, [r2, #40]
	str	r1, [r2, #44]
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L94:
	.align	2
.L93:
	.word	.LANCHOR0
	.word	-2063587968
	.size	fillScreen4, .-fillScreen4
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
	cmp	r2, #0
	bxle	lr
	push	{r4, r5, lr}
	mov	r4, #0
	ldr	r5, .L104
	add	r2, r0, r2
	rsb	lr, r2, r2, lsl #4
	rsb	r0, r0, r0, lsl #4
	ldr	r2, [r5]
	add	lr, r1, lr, lsl #4
	ldr	ip, [sp, #12]
	add	r1, r1, r0, lsl #4
	ldr	r0, [r5, #4]
	add	lr, r2, lr, lsl #1
	add	r1, r2, r1, lsl #1
	orr	r2, r3, #-2147483648
	lsl	r3, r3, #1
.L97:
	str	r4, [r0, #44]
	str	ip, [r0, #36]
	str	r1, [r0, #40]
	add	r1, r1, #480
	cmp	r1, lr
	str	r2, [r0, #44]
	add	ip, ip, r3
	bne	.L97
	pop	{r4, r5, lr}
	bx	lr
.L105:
	.align	2
.L104:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	drawImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	cmp	r2, #0
	ldr	r6, [sp, #24]
	ble	.L106
	mov	ip, #0
	mov	r8, ip
	ldr	lr, .L111
	add	r4, r0, r2
	add	r5, r3, r3, lsr #31
	rsb	r4, r4, r4, lsl #4
	rsb	r0, r0, r0, lsl #4
	asr	r5, r5, #1
	ldm	lr, {r7, lr}
	add	r4, r1, r4, lsl #4
	orr	r5, r5, #-2147483648
	add	r1, r1, r0, lsl #4
.L108:
	add	r0, ip, ip, lsr #31
	add	r2, r1, r1, lsr #31
	bic	r0, r0, #1
	bic	r2, r2, #1
	add	r1, r1, #240
	add	r0, r6, r0
	add	r2, r7, r2
	cmp	r4, r1
	str	r8, [lr, #44]
	add	ip, ip, r3
	str	r0, [lr, #36]
	str	r2, [lr, #40]
	str	r5, [lr, #44]
	bne	.L108
.L106:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L112:
	.align	2
.L111:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawFullscreenImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage3, %function
drawFullscreenImage3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L114
	ldr	r1, .L114+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L115:
	.align	2
.L114:
	.word	.LANCHOR0
	.word	-2147445248
	.size	drawFullscreenImage3, .-drawFullscreenImage3
	.align	2
	.global	drawFullscreenImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage4, %function
drawFullscreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L117
	ldr	r1, .L117+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L118:
	.align	2
.L117:
	.word	.LANCHOR0
	.word	-2147464448
	.size	drawFullscreenImage4, .-drawFullscreenImage4
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L120:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L120
	mov	r2, #67108864
.L121:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L121
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
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
	mov	r1, #67108864
	ldrh	r3, [r1]
	tst	r3, #16
	ldr	r2, .L128
	moveq	r2, #100663296
	ldr	r0, .L128+4
	eor	r3, r3, #16
	str	r2, [r0]
	strh	r3, [r1]	@ movhi
	bx	lr
.L129:
	.align	2
.L128:
	.word	100704256
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
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
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L132
	add	r0, r0, r0, lsl #1
	ldr	lr, [ip, #4]
	lsl	r0, r0, #2
	add	ip, lr, r0
	orr	r3, r3, #-2147483648
	str	r4, [ip, #8]
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	pop	{r4, lr}
	str	r3, [ip, #8]
	bx	lr
.L133:
	.align	2
.L132:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #4]
	ldr	ip, [sp, #12]
	add	ip, lr, ip
	sub	ip, ip, #1
	cmp	ip, r0
	ble	.L138
	add	r0, r0, r2
	sub	r0, r0, #1
	cmp	r0, lr
	bgt	.L140
.L138:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L140:
	ldr	r2, [sp, #8]
	ldr	r0, [sp, #16]
	add	r2, r2, r0
	sub	r2, r2, #1
	cmp	r2, r1
	ble	.L138
	add	r0, r1, r3
	ldr	r3, [sp, #8]
	sub	r0, r0, #1
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.global	dma
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
	.ident	"GCC: (devkitARM release 50) 8.2.0"
