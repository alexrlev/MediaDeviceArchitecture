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
	.global	drawRain
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRain, %function
drawRain:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L4
	sub	r8, r1, #1
	smull	r3, r5, r8, r5
	asr	ip, r8, #31
	lsl	r2, r8, #1
	rsb	ip, ip, r5, asr #7
	ldr	r5, .L4
	add	r7, r2, #40
	smull	r6, r5, r7, r5
	ldr	fp, .L4
	ldr	r10, .L4
	smull	r3, fp, r2, fp
	add	lr, r2, r8
	smull	r3, r10, lr, r10
	rsb	r3, r1, r1, lsl #4
	sub	sp, sp, #12
	add	r4, r0, r3, lsl #4
	add	ip, ip, ip, lsl #4
	ldr	r9, .L4+4
	str	r5, [sp, #4]
	sub	ip, r8, ip, lsl #4
	lsl	r5, r4, #1
	lsl	ip, ip, #1
	add	r5, r5, #100663296
	ldr	r6, .L4
	strh	r9, [r5]	@ movhi
	str	ip, [sp]
	sub	r5, lr, #42
	ldr	r8, .L4+8
	smull	ip, r6, r5, r6
	ldr	ip, [sp]
	sub	r4, r4, #241
	ldrh	ip, [r8, ip]
	lsl	r4, r4, #1
	add	r4, r4, #100663296
	strh	ip, [r4]	@ movhi
	add	r1, r1, r1, lsl #1
	lsl	ip, r0, #1
	add	r3, ip, r3, lsl #5
	add	r0, ip, r0
	rsb	r1, r1, r1, lsl #4
	add	r1, r0, r1, lsl #4
	lsl	r0, r3, #1
	add	r0, r0, #100663296
	strh	r9, [r0]	@ movhi
	asr	r0, r2, #31
	rsb	fp, r0, fp, asr #7
	add	fp, fp, fp, lsl #4
	sub	r2, r2, fp, lsl #4
	lsl	r0, r3, #1
	lsl	r2, r2, #1
	ldrh	ip, [r8, r2]
	add	r2, r0, #100663296
	sub	r2, r2, #964
	strh	ip, [r2]	@ movhi
	lsl	r0, r1, #1
	asr	r2, lr, #31
	rsb	r10, r2, r10, asr #7
	ldr	r4, [sp, #4]
	add	r2, r0, #100663296
	strh	r9, [r2]	@ movhi
	asr	r2, r7, #31
	rsb	r2, r2, r4, asr #7
	add	r2, r2, r2, lsl #4
	sub	r7, r7, r2, lsl #4
	asr	r2, r5, #31
	rsb	r6, r2, r6, asr #7
	lsl	r2, r1, #1
	mov	r1, r2
	add	r10, r10, r10, lsl #4
	sub	lr, lr, r10, lsl #4
	lsl	lr, lr, #1
	ldr	ip, .L4+12
	ldrh	lr, [r8, lr]
	add	ip, r0, ip
	ldr	r0, .L4+16
	strh	lr, [ip]	@ movhi
	lsl	ip, r3, #1
	add	r0, ip, r0
	strh	r9, [r0]	@ movhi
	lsl	r7, r7, #1
	ldr	ip, .L4+20
	ldr	r0, .L4+24
	ldrh	lr, [r8, r7]
	lsl	r3, r3, #1
	add	ip, r3, ip
	add	r0, r2, r0
	add	r6, r6, r6, lsl #4
	strh	lr, [ip]	@ movhi
	sub	r5, r5, r6, lsl #4
	strh	r9, [r0]	@ movhi
	lsl	r5, r5, #1
	ldr	r3, .L4+28
	ldrh	r2, [r8, r5]
	add	r3, r1, r3
	strh	r2, [r3]	@ movhi
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	2021161081
	.word	30653
	.word	bg
	.word	100661850
	.word	100682536
	.word	100681572
	.word	100642896
	.word	100641450
	.size	drawRain, .-drawRain
	.align	2
	.global	updateBG
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBG, %function
updateBG:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	add	r9, r0, #20
	sub	sp, sp, #60
	add	r6, r0, #26
	add	r5, r0, #7
	mov	r1, r9
	bl	drawRain
	mov	r0, r5
	mov	r1, r6
	add	r8, r4, #17
	str	r5, [sp, #4]
	str	r6, [sp, #8]
	bl	drawRain
	mov	r1, r9
	mov	r0, r4
	bl	drawRain
	add	r7, r4, #30
	add	r10, r4, #32
	mov	r0, r8
	mov	r1, r4
	bl	drawRain
	mov	r0, r7
	mov	r1, r10
	add	fp, r4, #60
	str	r7, [sp, #12]
	str	r10, [sp, #16]
	bl	drawRain
	add	r3, r4, #42
	mov	r5, r3
	mov	r0, r8
	add	r3, r4, #44
	mov	r1, fp
	mov	r6, r3
	str	fp, [sp, #20]
	bl	drawRain
	add	r3, r4, #11
	mov	r7, r3
	add	r3, r4, #46
	mov	r10, r3
	mov	r0, r5
	mov	r1, r6
	str	r5, [sp, #24]
	str	r6, [sp, #28]
	bl	drawRain
	add	r3, r4, #86
	mov	fp, r3
	mov	r0, r7
	add	r3, r4, #93
	mov	r1, r10
	mov	r5, r3
	str	r7, [sp, #32]
	str	r10, [sp, #36]
	bl	drawRain
	add	r3, r4, #88
	mov	r10, r3
	add	r7, r4, #77
	mov	r0, fp
	mov	r1, r5
	add	r6, r4, #66
	str	fp, [sp, #40]
	str	r5, [sp, #44]
	bl	drawRain
	mov	r0, r10
	mov	r1, r7
	str	r10, [sp, #48]
	bl	drawRain
	mov	r0, r7
	mov	r1, r6
	bl	drawRain
	add	r3, r4, #40
	mov	fp, r3
	add	r5, r4, #55
	mov	r0, r6
	mov	r1, r5
	bl	drawRain
	add	r10, r4, #2
	mov	r0, r5
	str	fp, [sp, #52]
	mov	r1, fp
	add	fp, r4, #3
	bl	drawRain
	mov	r0, r10
	mov	r1, fp
	bl	drawRain
	mov	r1, r9
	mov	r0, r4
	bl	drawRain
	ldmib	sp, {r0, r1}
	bl	drawRain
	mov	r1, r9
	mov	r0, r4
	bl	drawRain
	mov	r1, r4
	mov	r0, r8
	bl	drawRain
	add	r0, sp, #12
	ldm	r0, {r0, r1}
	bl	drawRain
	ldr	r1, [sp, #20]
	mov	r0, r8
	bl	drawRain
	add	r0, sp, #24
	ldm	r0, {r0, r1}
	bl	drawRain
	add	r0, sp, #32
	ldm	r0, {r0, r1}
	bl	drawRain
	add	r0, sp, #40
	ldm	r0, {r0, r1}
	bl	drawRain
	mov	r1, r7
	ldr	r0, [sp, #48]
	bl	drawRain
	mov	r1, r6
	mov	r0, r7
	bl	drawRain
	mov	r1, r5
	mov	r0, r6
	bl	drawRain
	ldr	r1, [sp, #52]
	mov	r0, r5
	bl	drawRain
	mov	r1, fp
	mov	r0, r10
	add	sp, sp, #60
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	drawRain
	.size	updateBG, .-updateBG
	.align	2
	.global	backgroundColor
	.syntax unified
	.arm
	.fpu softvfp
	.type	backgroundColor, %function
backgroundColor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L9
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #7
	add	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #4
	ldr	r3, .L9+4
	lsl	r0, r0, #1
	ldrh	r0, [r3, r0]
	bx	lr
.L10:
	.align	2
.L9:
	.word	2021161081
	.word	bg
	.size	backgroundColor, .-backgroundColor
	.align	2
	.global	drawCharacterAt
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCharacterAt, %function
drawCharacterAt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	rsb	r3, r1, r1, lsl #4
	lsl	r3, r3, #4
	ldr	lr, .L65
	ldr	r5, .L65+4
	add	r9, r3, r0
	add	lr, r9, lr
	add	r5, r9, r5
	ldr	r4, .L65+8
	sub	sp, sp, #36
	lsl	lr, lr, #1
	lsl	r5, r5, #1
.L12:
	sub	ip, lr, #5248
	sub	ip, ip, #32
.L13:
	strh	r4, [ip]	@ movhi
	add	ip, ip, #480
	cmp	ip, lr
	bne	.L13
	add	lr, ip, #2
	cmp	lr, r5
	bne	.L12
	add	r2, r2, r2, lsr #31
	asr	ip, r2, #1
	add	r2, ip, #31
	add	lr, ip, #10
	add	r7, r0, #20
	orr	lr, lr, r2, lsl #5
	add	ip, ip, #29
	orr	ip, lr, ip, lsl #10
	add	lr, r7, r3
	lsl	ip, ip, #16
	lsl	lr, lr, #1
	lsr	ip, ip, #16
	add	r6, r0, #21
	add	lr, lr, #100663296
	strh	ip, [lr]	@ movhi
	add	lr, r6, r3
	lsl	lr, lr, #1
	add	r2, r0, #18
	add	lr, lr, #100663296
	strh	ip, [lr]	@ movhi
	str	r2, [sp, #8]
	add	lr, r0, #18
	add	r2, r3, #240
	add	lr, lr, r2
	lsl	lr, lr, #1
	add	lr, lr, #100663296
	strh	ip, [lr]	@ movhi
	add	lr, r0, #19
	add	lr, lr, r2
	lsl	lr, lr, #1
	add	lr, lr, #100663296
	strh	ip, [lr]	@ movhi
	add	lr, r7, r2
	lsl	lr, lr, #1
	add	lr, lr, #100663296
	strh	ip, [lr]	@ movhi
	add	lr, r6, r2
	add	r4, r0, #19
	lsl	lr, lr, #1
	add	lr, lr, #100663296
	str	r4, [sp, #12]
	add	r4, r0, #24
	strh	ip, [lr]	@ movhi
	str	r4, [sp, #4]
	add	lr, r0, #22
	add	r4, r0, #23
	add	lr, lr, r2
	add	r2, r4, r2
	add	r5, r0, #23
	lsl	lr, lr, #1
	lsl	r2, r2, #1
	add	lr, lr, #100663296
	add	r2, r2, #100663296
	str	r5, [sp, #16]
	add	r5, r3, #480
	strh	ip, [lr]	@ movhi
	strh	ip, [r2]	@ movhi
	mov	r2, r5
	add	r5, r0, #19
	add	lr, r5, r2
	lsl	lr, lr, #1
	add	lr, lr, #100663296
	strh	ip, [lr]	@ movhi
	add	lr, r7, r2
	lsl	lr, lr, #1
	add	lr, lr, #100663296
	add	r5, r0, #22
	strh	ip, [lr]	@ movhi
	add	lr, r6, r2
	add	r2, r5, r2
	lsl	lr, lr, #1
	lsl	r2, r2, #1
	add	r8, r3, #720
	add	lr, lr, #100663296
	add	r2, r2, #100663296
	strh	ip, [lr]	@ movhi
	strh	ip, [r2]	@ movhi
	add	r2, r7, r8
	add	lr, r6, r8
	lsl	r2, r2, #1
	add	fp, r3, #1440
	add	r2, r2, #100663296
	add	r10, r0, #17
	lsl	lr, lr, #1
	strh	ip, [r2]	@ movhi
	add	lr, lr, #100663296
	add	r2, r10, fp
	strh	ip, [lr]	@ movhi
	lsl	r2, r2, #1
	add	lr, r0, #18
	add	r2, r2, #100663296
	add	lr, lr, fp
	strh	ip, [r2]	@ movhi
	lsl	lr, lr, #1
	add	r2, r4, fp
	add	r4, r0, #24
	add	lr, lr, #100663296
	add	r8, r4, fp
	strh	ip, [lr]	@ movhi
	lsl	r2, r2, #1
	add	lr, r3, #2160
	lsl	r8, r8, #1
	add	r2, r2, #100663296
	add	r8, r8, #100663296
	add	r5, r7, lr
	add	lr, r6, lr
	strh	ip, [r2]	@ movhi
	lsl	r5, r5, #1
	strh	ip, [r8]	@ movhi
	lsl	lr, lr, #1
	ldr	r8, .L65+12
	ldr	r2, .L65+16
	ldr	ip, .L65+20
	add	r5, r5, #100663296
	add	lr, lr, #100663296
	strh	r8, [r5]	@ movhi
	add	r2, r9, r2
	add	ip, r9, ip
	strh	r8, [lr]	@ movhi
	ldr	r5, .L65+24
	lsl	r2, r2, #1
	lsl	ip, ip, #1
	add	r4, r0, #22
.L15:
	sub	lr, r2, #3840
.L16:
	strh	r5, [lr]	@ movhi
	add	lr, lr, #480
	cmp	lr, r2
	bne	.L16
	add	r2, lr, #2
	cmp	r2, ip
	bne	.L15
	add	ip, r3, #5504
	add	ip, ip, #16
	add	r2, r0, #12
	add	lr, r0, #50331648
	add	r2, r2, ip
	add	lr, lr, #30
	add	ip, lr, ip
	lsl	r2, r2, #1
	ldr	lr, .L65+24
	add	r2, r2, #100663296
	lsl	ip, ip, #1
.L18:
	strh	lr, [r2], #2	@ movhi
	cmp	r2, ip
	bne	.L18
	ldr	r5, .L65+28
	ldr	r8, .L65+32
	add	ip, r3, r0
	add	r5, ip, r5
	add	r8, ip, r8
	ldr	r2, .L65+24
	lsl	r5, r5, #1
	lsl	r8, r8, #1
.L19:
	sub	lr, r5, #5248
	sub	lr, lr, #32
.L20:
	strh	r2, [lr]	@ movhi
	add	lr, lr, #480
	cmp	lr, r5
	bne	.L20
	add	r5, lr, #2
	cmp	r5, r8
	bne	.L19
	add	r9, r3, #3360
	add	lr, r9, r0
	lsl	r5, lr, #1
	add	r5, r5, #100663296
	str	r4, [sp]
	mov	r4, r5
	ldr	lr, [sp, #4]
	add	r8, r3, #3120
	add	fp, r10, r9
	add	r9, lr, r9
	add	r10, r10, r8
	add	r8, lr, r8
	strh	r2, [r5, #32]	@ movhi
	lsl	fp, fp, #1
	lsl	r9, r9, #1
	lsl	r10, r10, #1
	lsl	r8, r8, #1
	ldr	lr, .L65+36
	ldr	r5, .L65+40
	add	r8, r8, #100663296
	add	fp, fp, #100663296
	add	r9, r9, #100663296
	add	r10, r10, #100663296
	strh	r2, [fp]	@ movhi
	add	lr, ip, lr
	strh	r2, [r10]	@ movhi
	add	r5, ip, r5
	strh	r2, [r8]	@ movhi
	strh	r2, [r9]	@ movhi
	ldr	r8, .L65+8
	strh	r2, [r4, #50]	@ movhi
	ldr	r4, [sp]
	lsl	lr, lr, #1
	lsl	r5, r5, #1
.L22:
	sub	r2, lr, #3360
.L23:
	strh	r8, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, lr
	bne	.L23
	add	lr, r2, #2
	cmp	lr, r5
	bne	.L22
	add	r5, r3, #4288
	add	r5, r5, #32
	add	r7, r7, r5
	add	lr, r6, r5
	lsl	r6, r7, #1
	add	r2, r0, #31
	add	r10, r3, #3600
	add	r6, r6, #100663296
	strh	r8, [r6]	@ movhi
	add	fp, r10, r0
	add	r6, r2, r10
	lsl	lr, lr, #1
	lsl	r7, fp, #1
	lsl	r6, r6, #1
	add	r7, r7, #100663296
	add	lr, lr, #100663296
	add	r6, r6, #100663296
	strh	r8, [lr]	@ movhi
	strh	r8, [r6]	@ movhi
	strh	r8, [r7, #64]	@ movhi
	mov	r7, #3
	add	r9, r3, #3840
	str	r4, [sp]
	add	lr, r2, r9
	add	r4, r3, #4080
	add	r6, r2, r5
	lsl	lr, lr, #1
	add	r2, r2, r4
	add	lr, lr, #100663296
	lsl	r6, r6, #1
	lsl	r2, r2, #1
	strh	r8, [lr]	@ movhi
	add	r6, r6, #100663296
	add	r2, r2, #100663296
	add	lr, ip, #50331648
	str	r4, [sp, #20]
	add	lr, lr, #7232
	strh	r8, [r2]	@ movhi
	ldr	r4, [sp]
	strh	r8, [r6]	@ movhi
	ldr	r6, .L65+8
	lsl	lr, lr, #1
.L25:
	sub	r2, lr, #6720
.L26:
	strh	r6, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, lr
	bne	.L26
	subs	r7, r7, #1
	add	lr, r2, #2
	bne	.L25
	add	r2, r3, #6464
	add	r2, r2, #16
	ldr	r8, .L65+44
	add	r7, r2, r4
	str	r2, [sp, #28]
	lsl	r7, r7, #1
	add	r8, ip, r8
	ldr	r2, .L65+8
	add	r7, r7, #100663296
	lsl	r8, r8, #1
.L27:
	mov	r6, r7
	mov	lr, #27
.L28:
	add	lr, lr, #1
	cmp	lr, #30
	strh	r2, [r6]	@ movhi
	add	r6, r6, #480
	bne	.L28
	add	r7, r7, #2
	cmp	r8, r7
	bne	.L27
	mov	r6, r4
	add	r4, r3, #5760
	add	r7, r6, r4
	str	r4, [sp, #4]
	ldr	r4, [sp, #20]
	str	r6, [sp]
	add	r6, r0, #10
	add	r4, r6, r4
	lsl	r7, r7, #1
	lsl	r4, r4, #1
	add	r7, r7, #100663296
	add	r4, r4, #100663296
	add	r5, r6, r5
	strh	r2, [r7]	@ movhi
	str	r4, [sp, #20]
	ldr	r7, [sp, #16]
	ldr	r4, [sp, #4]
	lsl	r5, r5, #1
	add	r5, r5, #100663296
	str	r5, [sp, #24]
	add	r5, r7, r4
	add	r8, r3, #5952
	ldr	r4, [sp]
	lsl	r5, r5, #1
	add	r8, r8, #48
	add	r5, r5, #100663296
	strh	r2, [r5]	@ movhi
	add	r5, r4, r8
	add	lr, r3, #6208
	lsl	r5, r5, #1
	add	lr, lr, #32
	add	r5, r5, #100663296
	strh	r2, [r5]	@ movhi
	add	r4, r4, lr
	add	r5, r7, r8
	add	r7, r7, lr
	lsl	r4, r4, #1
	lsl	r5, r5, #1
	lsl	r7, r7, #1
	add	r4, r4, #100663296
	add	r5, r5, #100663296
	add	r7, r7, #100663296
	strh	r2, [r5]	@ movhi
	strh	r2, [r4]	@ movhi
	strh	r2, [r7]	@ movhi
	mov	r7, #3
	add	r10, r6, r10
	add	r9, r6, r9
	lsl	fp, fp, #1
	lsl	r10, r10, #1
	lsl	r9, r9, #1
	add	r9, r9, #100663296
	add	fp, fp, #100663296
	add	r10, r10, #100663296
	strh	r2, [fp, #18]	@ movhi
	strh	r2, [r10]	@ movhi
	strh	r2, [r9]	@ movhi
	ldr	r9, [sp, #20]
	ldr	r5, .L65+48
	strh	r2, [r9]	@ movhi
	ldr	r9, [sp, #24]
	add	r5, ip, r5
	lsl	r4, r5, #1
	strh	r2, [r9]	@ movhi
	ldr	r5, .L65+8
.L30:
	sub	r2, r4, #6720
.L31:
	strh	r5, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r4
	bne	.L31
	subs	r7, r7, #1
	add	r4, r2, #2
	bne	.L30
	ldr	r2, [sp, #28]
	ldr	r7, .L65+52
	add	r6, r2, r6
	lsl	r6, r6, #1
	add	r7, ip, r7
	ldr	r5, .L65+8
	add	r6, r6, #100663296
	lsl	r7, r7, #1
.L32:
	mov	r4, r6
	mov	r2, #27
.L33:
	add	r2, r2, #1
	cmp	r2, #30
	strh	r5, [r4]	@ movhi
	add	r4, r4, #480
	bne	.L33
	add	r6, r6, #2
	cmp	r7, r6
	bne	.L32
	ldr	r2, [sp, #8]
	ldr	r10, [sp, #12]
	ldr	r4, [sp, #4]
	add	r9, r2, lr
	add	r6, r2, r4
	add	r7, r10, r4
	add	lr, r10, lr
	add	r4, r2, r8
	add	r8, r10, r8
	lsl	lr, lr, #1
	lsl	r10, r4, #1
	ldr	r2, .L65+56
	lsl	r6, r6, #1
	lsl	r7, r7, #1
	lsl	r8, r8, #1
	lsl	r9, r9, #1
	ldr	r4, .L65+60
	add	r6, r6, #100663296
	add	fp, lr, #100663296
	add	r7, r7, #100663296
	add	r10, r10, #100663296
	add	r8, r8, #100663296
	add	r9, r9, #100663296
	strh	r5, [r6]	@ movhi
	add	r2, ip, r2
	strh	r5, [r7]	@ movhi
	add	r4, ip, r4
	strh	r5, [r10]	@ movhi
	ldr	r6, .L65+64
	strh	r5, [r8]	@ movhi
	strh	r5, [r9]	@ movhi
	strh	r5, [fp]	@ movhi
	lsl	lr, r2, #1
	lsl	r4, r4, #1
.L35:
	sub	r2, lr, #5248
	sub	r2, r2, #32
.L36:
	strh	r6, [r2]	@ movhi
	add	r2, r2, #480
	cmp	lr, r2
	bne	.L36
	add	lr, lr, #2
	cmp	r4, lr
	bne	.L35
	add	lr, r3, #8640
	add	r2, r0, #1
	ldr	r4, .L65+68
	add	r2, r2, lr
	lsl	r2, r2, #1
	add	r4, ip, r4
	ldr	r5, .L65+64
	add	r2, r2, #100663296
	lsl	r4, r4, #1
.L38:
	strh	r5, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r4, r2
	bne	.L38
	add	r2, r0, #2
	ldr	r4, .L65+72
	add	r2, r2, lr
	lsl	r2, r2, #1
	add	r4, ip, r4
	ldr	r5, .L65+64
	add	r2, r2, #100663296
	lsl	r4, r4, #1
.L39:
	strh	r5, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r4, r2
	bne	.L39
	add	r3, r3, #8832
	add	r2, r3, #48
	ldr	r4, .L65+76
	add	r2, r2, r0
	lsl	r2, r2, #1
	add	r4, ip, r4
	ldr	r5, .L65+64
	add	r2, r2, #100663296
	lsl	r4, r4, #1
.L40:
	strh	r5, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r4, r2
	bne	.L40
	add	r2, r0, #39
	ldr	r4, .L65+80
	add	r2, r2, lr
	lsl	r2, r2, #1
	add	r4, ip, r4
	ldr	r5, .L65+64
	add	r2, r2, #100663296
	lsl	r4, r4, #1
.L41:
	strh	r5, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r4, r2
	bne	.L41
	add	r2, r0, #40
	ldr	r4, .L65+84
	add	r2, r2, lr
	lsl	r2, r2, #1
	add	r4, ip, r4
	ldr	r5, .L65+64
	add	r2, r2, #100663296
	lsl	lr, r4, #1
.L42:
	strh	r5, [r2]	@ movhi
	add	r2, r2, #480
	cmp	lr, r2
	bne	.L42
	add	r3, r0, r3
	ldr	r2, .L65+88
	lsl	r3, r3, #1
	add	r2, ip, r2
	add	r3, r3, #100663296
	ldr	ip, .L65+64
	add	r3, r3, #178
	lsl	r2, r2, #1
.L43:
	strh	ip, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L43
	ldr	ip, .L65+92
	add	lr, ip, #192
	mov	r5, lr
	ldr	r4, .L65+96
.L44:
	ldr	r2, [lr, #4]!
	ldr	r3, [ip, #4]!
	add	r2, r1, r2
	rsb	r2, r2, r2, lsl #4
	add	r3, r0, r3
	add	r3, r3, r2, lsl #4
	lsl	r3, r3, #1
	add	r3, r3, #100663296
	cmp	r5, ip
	strh	r4, [r3]	@ movhi
	bne	.L44
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	50334302
	.word	50334316
	.word	10674
	.word	8526
	.word	50337179
	.word	50337199
	.word	14076
	.word	50340061
	.word	50340077
	.word	50335986
	.word	50335992
	.word	50338160
	.word	50338855
	.word	50338148
	.word	50342691
	.word	50342727
	.word	26591
	.word	50342449
	.word	50342450
	.word	50341968
	.word	50342487
	.word	50342488
	.word	50342009
	.word	.LANCHOR0-4
	.word	20216
	.size	drawCharacterAt, .-drawCharacterAt
	.align	2
	.global	updateCharacter
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCharacter, %function
updateCharacter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, r0
	ldr	r1, .L81
	smull	r3, r0, r2, r1
	push	{r4, r5, r6, lr}
	ldr	r5, .L81+4
	sub	r1, r0, r2, asr #31
	ldr	r3, [r5, #384]
	add	r1, r1, r1, lsl #1
	ldr	r6, .L81+8
	sub	r1, r2, r1, lsl #1
	cmp	r3, #1
	str	r1, [r6]
	beq	.L77
	ldr	ip, .L81+12
	ldr	lr, .L81+16
	ldr	r4, .L81+20
.L69:
	sub	r3, ip, #23040
.L74:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, ip
	bne	.L74
	add	ip, r3, #2
	cmp	ip, r4
	bne	.L69
	rsb	r1, r1, #45
	mov	r0, #100
	bl	drawCharacterAt
	ldr	r3, [r6]
	cmp	r3, #5
	moveq	r3, #1
	streq	r3, [r5, #384]
	pop	{r4, r5, r6, lr}
	bx	lr
.L77:
	ldr	ip, .L81+24
	ldr	lr, .L81+16
	ldr	r0, .L81+28
.L68:
	sub	r3, ip, #23040
.L70:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	ip, r3
	bne	.L70
	add	ip, ip, #2
	cmp	ip, r0
	bne	.L68
	add	r1, r1, #40
	mov	r0, #100
	bl	drawCharacterAt
	ldr	r3, [r6]
	cmp	r3, #5
	moveq	r3, #0
	streq	r3, [r5, #384]
	pop	{r4, r5, r6, lr}
	bx	lr
.L82:
	.align	2
.L81:
	.word	715827883
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	100708616
	.word	32272
	.word	100708702
	.word	100705256
	.word	100705342
	.size	updateCharacter, .-updateCharacter
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r3, #100663296
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r1, .L104
	ldr	r0, .L104+4
	strh	r1, [r2]	@ movhi
	ldr	r2, .L104+8
	sub	sp, sp, #12
.L84:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L84
	ldr	r1, .L104+12
	ldr	r2, .L104+16
.L85:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L85
	ldr	r2, .L104+20
	ldr	r0, .L104+4
	add	r3, r2, #2
	add	r1, r3, #208
.L86:
	strh	r0, [r2, #2]!	@ movhi
	cmp	r2, r1
	bne	.L86
	add	r3, r3, #540
	ldr	r2, .L104+24
	ldr	r1, .L104+12
	add	r3, r3, #2
.L87:
	strh	r1, [r2, #2]!	@ movhi
	cmp	r3, r2
	bne	.L87
	mov	r9, #0
	ldr	r5, .L104+28
	ldr	r6, .L104+32
	ldr	r4, .L104+36
	ldr	r8, .L104+4
	ldr	r7, .L104+8
.L93:
	umull	r2, r3, r4, r9
	lsr	r3, r3, #5
	rsb	r2, r3, r3, lsl #5
	add	r3, r3, r2, lsl #2
	cmp	r9, r3, lsl #2
	beq	.L102
.L88:
	mov	r0, r9
	mov	lr, pc
	bx	r5
	tst	r9, #7
	beq	.L103
.L91:
	ldr	r2, .L104+40
	add	r9, r9, #1
.L92:
	ldr	r3, [sp, #4]
	subs	r2, r2, #1
	add	r3, r3, #1
	str	r3, [sp, #4]
	bne	.L92
	b	.L93
.L103:
	asr	r0, r9, #3
	mov	lr, pc
	bx	r6
	b	.L91
.L102:
	mov	r3, #100663296
.L89:
	strh	r8, [r3], #2	@ movhi
	cmp	r3, r7
	bne	.L89
	ldr	r1, .L104+12
	ldr	r2, .L104+16
.L90:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L90
	b	.L88
.L105:
	.align	2
.L104:
	.word	1027
	.word	32272
	.word	100713696
	.word	16912
	.word	100740096
	.word	bg-2
	.word	bg+208
	.word	updateBG
	.word	updateCharacter
	.word	274877907
	.word	30000
	.size	main, .-main
	.text
	.align	2
	.global	setPixel
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r1, r1, r1, lsl #4
	add	r1, r0, r1, lsl #4
	lsl	r1, r1, #1
	add	r1, r1, #100663296
	strh	r2, [r1]	@ movhi
	bx	lr
	.size	setPixel, .-setPixel
	.align	2
	.global	delay
	.syntax unified
	.arm
	.fpu softvfp
	.type	delay, %function
delay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L111
	sub	sp, sp, #8
.L108:
	ldr	r3, [sp, #4]
	subs	r2, r2, #1
	add	r3, r3, #1
	str	r3, [sp, #4]
	bne	.L108
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L112:
	.align	2
.L111:
	.word	30000
	.size	delay, .-delay
	.global	up
	.global	characterposition
	.comm	bg,544,4
	.global	cy
	.global	cx
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	cx, %object
	.size	cx, 192
cx:
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	9
	.word	10
	.word	11
	.word	12
	.word	12
	.word	13
	.word	14
	.word	15
	.word	16
	.word	17
	.word	17
	.word	18
	.word	19
	.word	19
	.word	19
	.word	19
	.word	19
	.word	38
	.word	37
	.word	36
	.word	35
	.word	34
	.word	33
	.word	32
	.word	32
	.word	31
	.word	30
	.word	29
	.word	29
	.word	28
	.word	27
	.word	26
	.word	25
	.word	24
	.word	24
	.word	23
	.word	22
	.word	22
	.word	22
	.word	22
	.word	22
	.type	cy, %object
	.size	cy, 192
cy:
	.word	38
	.word	38
	.word	38
	.word	38
	.word	38
	.word	38
	.word	38
	.word	39
	.word	39
	.word	39
	.word	39
	.word	40
	.word	40
	.word	40
	.word	40
	.word	40
	.word	40
	.word	41
	.word	41
	.word	41
	.word	42
	.word	43
	.word	44
	.word	45
	.word	38
	.word	38
	.word	38
	.word	38
	.word	38
	.word	38
	.word	38
	.word	39
	.word	39
	.word	39
	.word	39
	.word	40
	.word	40
	.word	40
	.word	40
	.word	40
	.word	40
	.word	41
	.word	41
	.word	41
	.word	42
	.word	43
	.word	44
	.word	45
	.type	up, %object
	.size	up, 4
up:
	.word	1
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	characterposition, %object
	.size	characterposition, 4
characterposition:
	.space	4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
