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
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer.part.0, %function
drawPlayer.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L3
	ldr	r3, [r1, #4]
	ldr	ip, [r1, #44]
	ldr	r2, [r1, #36]
	lsl	r3, r3, #23
	ldr	r0, .L3+4
	lsr	r3, r3, #23
	ldrb	r1, [r1]	@ zero_extendqisi2
	add	r2, r2, ip, lsl #5
	orr	r3, r3, #16384
	lsl	r2, r2, #1
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	person
	.word	shadowOAM
	.size	drawPlayer.part.0, .-drawPlayer.part.0
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, #0
	mov	r3, #65
	mov	r5, #5
	mov	ip, #10
	mov	r6, #35
	ldr	r1, .L7
	ldr	r2, .L7+4
	ldr	r0, .L7+8
	str	r4, [r1]
	str	r4, [r2]
	ldr	r1, .L7+12
	ldr	r2, .L7+16
	str	r4, [r0]
	ldr	r0, .L7+20
	str	r3, [r1]
	str	r3, [r2]
	ldr	lr, .L7+24
	ldr	r1, .L7+28
	ldr	r2, .L7+32
	str	r4, [r0]
	ldr	r3, .L7+36
	mov	r0, #78
	str	r6, [lr]
	str	ip, [r1]
	str	r5, [r2]
	mov	lr, pc
	bx	r3
	mov	r2, #1
	mov	r1, #12
	mov	r0, #2
	mov	fp, #210
	mov	r10, #245
	mov	r7, #9
	mov	r9, #4
	mov	r8, #6
	mov	lr, #14
	mov	ip, #11
	mov	r6, #3
	ldr	r3, .L7+40
	str	r5, [r3, #12]
	str	r1, [r3, #28]
	str	r2, [r3, #8]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r5, [r3, #24]
	str	r4, [r3, #52]
	str	r4, [r3, #32]
	str	r4, [r3, #44]
	str	r4, [r3, #36]
	str	r0, [r3, #48]
	ldr	r3, .L7+44
	str	r5, [r3, #12]
	str	r1, [r3, #8]
	str	fp, [r3]
	str	r10, [r3, #4]
	ldr	r3, .L7+48
	str	r5, [r3, #16]
	str	r1, [r3, #8]
	str	r4, [r3, #20]
	str	r7, [r3, #12]
	str	r2, [r3, #28]
	ldr	r3, .L7+52
	str	r7, [r3, #12]
	str	r1, [r3, #8]
	str	r4, [r3, #20]
	str	r9, [r3, #16]
	str	r2, [r3, #28]
	ldr	r3, .L7+56
	str	r7, [r3, #12]
	str	r1, [r3, #8]
	str	r4, [r3, #20]
	ldr	r1, .L7+60
	str	r8, [r3, #16]
	str	r2, [r3, #28]
	ldr	r3, .L7+64
	str	lr, [r1, #12]
	str	ip, [r1, #8]
	str	r4, [r1, #20]
	str	r4, [r1, #32]
	str	lr, [r3, #12]
	str	ip, [r3, #8]
	str	r4, [r3, #20]
	str	r2, [r3, #28]
	str	r4, [r3, #32]
	str	r0, [r3, #36]
	str	r6, [r3, #16]
	str	r0, [r1, #16]
	str	r2, [r1, #28]
	str	r0, [r1, #36]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	hOff
	.word	foodCounter
	.word	vOff
	.word	hFOff
	.word	vFOff
	.word	winBool
	.word	moneyCounter
	.word	foodPrice
	.word	couponPrice
	.word	srand
	.word	person
	.word	cashier
	.word	apple
	.word	can
	.word	poptart
	.word	yellow
	.word	pink
	.size	initGame, .-initGame
	.align	2
	.global	drawScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawScore, %function
drawScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #1
	ldr	r3, .L15
	mov	ip, #448
	push	{r4, r5, r6, r7, r8, lr}
	mov	r1, r3
	mov	r0, r3
	mov	lr, r3
	mov	r4, #8
	mov	r7, #5
	ldr	r5, .L15+4
	strh	r2, [r3, #48]	@ movhi
	ldr	r2, .L15+8
	strh	r5, [r3, #50]	@ movhi
	strh	ip, [r3, #52]	@ movhi
	ldr	r6, .L15+12
	ldr	ip, [r2]
	ldr	r5, .L15+16
.L10:
	smull	r2, r3, r5, ip
	asr	r2, ip, #31
	rsb	r2, r2, r3, asr #2
	add	r3, r2, r2, lsl #2
	sub	r3, ip, r3, lsl #1
	and	r8, r4, r6
	lsl	r3, r3, #6
	add	r3, r3, #8
	subs	ip, r2, #0
	orr	r2, r8, #16384
	strh	r7, [lr, #56]	@ movhi
	strh	r3, [lr, #60]	@ movhi
	strh	r2, [lr, #58]	@ movhi
	sub	r4, r4, #4
	add	lr, lr, #8
	bne	.L10
	ldr	r3, .L15+20
	mov	r4, #234
	ldr	lr, [r3]
	mov	r7, #2
	ldr	r5, .L15+12
	ldr	r6, .L15+16
	b	.L11
.L12:
	mov	ip, r3
.L11:
	smull	r2, r3, r6, lr
	asr	r2, lr, #31
	rsb	r2, r2, r3, asr #2
	add	r3, r2, r2, lsl #2
	sub	r3, lr, r3, lsl #1
	and	r8, r4, r5
	lsl	r3, r3, #6
	add	r3, r3, #8
	subs	lr, r2, #0
	orr	r2, r8, #16384
	strh	r3, [r1, #164]	@ movhi
	strh	r7, [r1, #160]	@ movhi
	strh	r2, [r1, #162]	@ movhi
	sub	r4, r4, #4
	add	r1, r1, #8
	add	r3, ip, #1
	bne	.L12
	mov	lr, #648
	mov	r1, #1
	sub	r4, r4, #2
	add	r3, ip, #21
	lsl	r3, r3, #3
	and	r5, r5, r4
	orr	r5, r5, #16384
	add	r2, r0, r3
	strh	r5, [r2, #2]	@ movhi
	strh	lr, [r2, #4]	@ movhi
	strh	r1, [r0, r3]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	shadowOAM
	.word	16385
	.word	foodCounter
	.word	511
	.word	1717986919
	.word	moneyCounter
	.size	drawScore, .-drawScore
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	r1, #1
	mov	r0, #5
	mov	lr, #12
	mov	ip, #2
	ldr	r3, .L19
	str	lr, [r3, #28]
	str	r0, [r3, #24]
	str	r0, [r3, #12]
	str	ip, [r3, #48]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r1, [r3, #8]
	str	r2, [r3, #52]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r2, [r3, #36]
	ldr	lr, [sp], #4
	bx	lr
.L20:
	.align	2
.L19:
	.word	person
	.size	initPlayer, .-initPlayer
	.global	__aeabi_idivmod
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #4
	push	{r4, r5, r6, lr}
	ldr	r4, .L34
	ldr	r3, .L34+4
	ldr	r5, [r4, #32]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #36]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #40]
	str	r1, [r4, #36]
	bne	.L22
	ldr	r0, [r4, #44]
	ldr	r3, .L34+8
	add	r0, r0, #1
	ldr	r1, [r4, #48]
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L22:
	ldr	r3, .L34+12
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #36]
	ldr	r3, .L34+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	streq	r3, [r4, #36]
	ldr	r3, .L34+12
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L25
	mov	r2, #3
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #36]
	bne	.L27
.L28:
	mov	r3, #2
	str	r3, [r4, #36]
.L27:
	add	r5, r5, #1
	str	r5, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L25:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L28
	ldr	r3, [r4, #36]
	cmp	r3, #4
	bne	.L27
	mov	r3, #0
	str	r6, [r4, #36]
	str	r3, [r4, #44]
	str	r3, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	person
	.word	1717986919
	.word	__aeabi_idivmod
	.word	67109120
	.size	animatePlayer, .-animatePlayer
	.align	2
	.global	testCollisions
	.syntax unified
	.arm
	.fpu softvfp
	.type	testCollisions, %function
testCollisions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r8, .L76
	ldr	r3, [r8, #20]
	ldr	r4, .L76+4
	ldr	r7, .L76+8
	ldr	r6, .L76+12
	cmp	r3, #0
	sub	sp, sp, #16
	ldm	r4, {r0, r1}
	ldr	r2, [r4, #28]
	ldr	r3, [r4, #24]
	ldr	ip, [r7]
	ldr	lr, [r6]
	bne	.L65
	ldr	r8, .L76+16
	ldr	r9, [r8, #20]
	cmp	r9, #0
	ldr	r5, .L76+20
	bne	.L72
.L39:
	ldr	r8, .L76+24
	ldr	r9, [r8, #20]
	cmp	r9, #0
	bne	.L73
.L41:
	ldr	r8, .L76+28
	ldr	r9, [r8, #20]
	cmp	r9, #0
	bne	.L74
.L43:
	ldr	r8, .L76+32
	ldr	r9, [r8, #20]
	cmp	r9, #0
	bne	.L75
.L45:
	ldr	r4, .L76+36
	ldr	r6, [r4, #4]
	ldr	r7, [r4]
	add	r4, r4, #8
	sub	lr, r6, lr
	ldm	r4, {r4, r6}
	sub	ip, r7, ip
	stm	sp, {ip, lr}
	str	r6, [sp, #12]
	str	r4, [sp, #8]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r2, #1
	ldrne	r3, .L76+40
	strne	r2, [r3]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L65:
	ldr	r5, [r8, #4]
	ldr	r9, [r8]
	sub	lr, r5, lr
	sub	ip, r9, ip
	ldr	r5, [r8, #12]
	ldr	r9, [r8, #8]
	str	r5, [sp, #12]
	stm	sp, {ip, lr}
	str	r9, [sp, #8]
	ldr	r5, .L76+20
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L38
.L67:
	ldr	r8, .L76+16
	ldr	r9, [r8, #20]
	cmp	r9, #0
	ldm	r4, {r0, r1}
	ldr	r2, [r4, #28]
	ldr	r3, [r4, #24]
	ldr	ip, [r7]
	ldr	lr, [r6]
	beq	.L39
.L72:
	ldr	r9, [r8, #4]
	ldr	r10, [r8]
	sub	lr, r9, lr
	sub	ip, r10, ip
	ldr	r9, [r8, #12]
	ldr	r10, [r8, #8]
	stm	sp, {ip, lr}
	str	r9, [sp, #12]
	str	r10, [sp, #8]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L40
.L68:
	ldr	r8, .L76+24
	ldr	r9, [r8, #20]
	cmp	r9, #0
	ldm	r4, {r0, r1}
	ldr	r2, [r4, #28]
	ldr	r3, [r4, #24]
	ldr	ip, [r7]
	ldr	lr, [r6]
	beq	.L41
.L73:
	ldr	r9, [r8, #4]
	ldr	r10, [r8]
	sub	lr, r9, lr
	sub	ip, r10, ip
	ldr	r9, [r8, #12]
	ldr	r10, [r8, #8]
	stm	sp, {ip, lr}
	str	r9, [sp, #12]
	str	r10, [sp, #8]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L42
.L69:
	ldr	r8, .L76+28
	ldr	r9, [r8, #20]
	cmp	r9, #0
	ldm	r4, {r0, r1}
	ldr	r2, [r4, #28]
	ldr	r3, [r4, #24]
	ldr	ip, [r7]
	ldr	lr, [r6]
	beq	.L43
.L74:
	ldr	r9, [r8, #4]
	ldr	r10, [r8]
	sub	lr, r9, lr
	sub	ip, r10, ip
	ldr	r9, [r8, #12]
	ldr	r10, [r8, #8]
	stm	sp, {ip, lr}
	str	r9, [sp, #12]
	str	r10, [sp, #8]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L44
.L70:
	ldr	r8, .L76+32
	ldr	r9, [r8, #20]
	cmp	r9, #0
	ldm	r4, {r0, r1}
	ldr	r2, [r4, #28]
	ldr	r3, [r4, #24]
	ldr	ip, [r7]
	ldr	lr, [r6]
	beq	.L45
.L75:
	ldr	r9, [r8, #4]
	ldr	r10, [r8]
	sub	lr, r9, lr
	sub	ip, r10, ip
	ldr	r9, [r8, #12]
	ldr	r10, [r8, #8]
	stm	sp, {ip, lr}
	str	r9, [sp, #12]
	str	r10, [sp, #8]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L46
.L71:
	ldr	ip, [r7]
	ldr	lr, [r6]
	ldm	r4, {r0, r1}
	ldr	r2, [r4, #28]
	ldr	r3, [r4, #24]
	b	.L45
.L38:
	mov	ip, #0
	ldr	r1, .L76+44
	ldr	lr, .L76+48
	ldr	r3, .L76+52
	ldr	r2, [r1]
	ldr	r0, [lr]
	ldr	r3, [r3]
	add	r0, r0, #1
	sub	r2, r2, r3
	str	r2, [r1]
	str	r0, [lr]
	mov	r3, ip
	ldr	r2, .L76+56
	ldr	r1, .L76+60
	ldr	r9, .L76+64
	ldr	r0, .L76+68
	str	ip, [r8, #20]
	str	ip, [r8, #28]
	mov	lr, pc
	bx	r9
	b	.L67
.L40:
	mov	ip, #0
	ldr	r1, .L76+44
	ldr	lr, .L76+48
	ldr	r3, .L76+52
	ldr	r2, [r1]
	ldr	r0, [lr]
	ldr	r3, [r3]
	add	r0, r0, #1
	sub	r2, r2, r3
	str	r2, [r1]
	str	r0, [lr]
	mov	r3, ip
	ldr	r2, .L76+56
	ldr	r1, .L76+60
	ldr	r9, .L76+64
	ldr	r0, .L76+68
	str	ip, [r8, #20]
	str	ip, [r8, #28]
	mov	lr, pc
	bx	r9
	b	.L68
.L42:
	mov	ip, #0
	ldr	r1, .L76+44
	ldr	lr, .L76+48
	ldr	r3, .L76+52
	ldr	r2, [r1]
	ldr	r0, [lr]
	ldr	r3, [r3]
	add	r0, r0, #1
	sub	r2, r2, r3
	str	r2, [r1]
	str	r0, [lr]
	mov	r3, ip
	ldr	r2, .L76+56
	ldr	r1, .L76+60
	ldr	r9, .L76+64
	ldr	r0, .L76+68
	str	ip, [r8, #20]
	str	ip, [r8, #28]
	mov	lr, pc
	bx	r9
	b	.L69
.L44:
	mov	ip, #0
	ldr	lr, .L76+44
	ldr	r3, .L76+72
	ldr	r0, [lr]
	ldr	r2, [r3]
	add	r0, r0, r2
	str	r0, [lr]
	mov	r3, ip
	ldr	r2, .L76+56
	ldr	r1, .L76+60
	ldr	r9, .L76+64
	ldr	r0, .L76+68
	str	ip, [r8, #20]
	str	ip, [r8, #28]
	mov	lr, pc
	bx	r9
	b	.L70
.L46:
	mov	ip, #0
	ldr	r0, .L76+44
	ldr	r3, .L76+72
	ldr	r1, [r0]
	ldr	r3, [r3]
	add	r1, r1, r3
	str	r1, [r0]
	str	ip, [r8, #20]
	str	ip, [r8, #28]
	mov	r3, ip
	ldr	r2, .L76+56
	ldr	r1, .L76+60
	ldr	r8, .L76+64
	ldr	r0, .L76+68
	mov	lr, pc
	bx	r8
	b	.L71
.L77:
	.align	2
.L76:
	.word	can
	.word	person
	.word	vOff
	.word	hOff
	.word	apple
	.word	collision
	.word	poptart
	.word	yellow
	.word	pink
	.word	cashier
	.word	winBool
	.word	moneyCounter
	.word	foodCounter
	.word	foodPrice
	.word	11025
	.word	8773
	.word	playSoundB
	.word	chaChing
	.word	couponPrice
	.size	testCollisions, .-testCollisions
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L113
	ldrh	r2, [r3, #48]
	ldr	r3, .L113+4
	ldr	ip, .L113+8
	tst	r2, #64
	add	r1, r3, #8
	push	{r4, r5, r6, r7, r8, lr}
	ldm	r1, {r1, r2}
	ldr	lr, [ip]
	bne	.L79
	cmp	r1, #0
	ble	.L79
	ldr	r0, [r3, #16]
	sub	r0, r1, r0
	lsl	r0, r0, #8
	add	r4, r0, r2
	ldr	r5, .L113+12
	lsl	r4, r4, #1
	ldrh	r4, [r5, r4]
	cmp	r4, #0
	beq	.L79
	ldr	r4, [r3, #24]
	ldr	r6, [r3, #20]
	add	r4, r2, r4
	sub	r4, r4, r6
	add	r0, r4, r0
	lsl	r0, r0, #1
	ldrh	r0, [r5, r0]
	cmp	r0, #0
	beq	.L79
	sub	r1, r1, #1
	cmp	lr, #0
	str	r1, [r3, #8]
	ble	.L80
	ldr	r0, [r3]
	cmp	r0, #79
	suble	lr, lr, #1
	strle	lr, [ip]
	bgt	.L80
.L79:
	ldr	r0, .L113
	ldrh	r0, [r0, #48]
	tst	r0, #128
	bne	.L81
	ldr	r0, [r3, #28]
	add	r0, r1, r0
	cmp	r0, #255
	ble	.L112
.L81:
	ldr	r0, .L113
	ldrh	r0, [r0, #48]
	ldr	r4, .L113+16
	tst	r0, #32
	ldr	ip, [r4]
	bne	.L83
	cmp	r2, #0
	ble	.L83
	ldr	r0, [r3, #20]
	sub	r0, r2, r0
	add	r0, r0, r1, lsl #8
	ldr	r5, .L113+12
	lsl	r0, r0, #1
	ldrh	r0, [r5, r0]
	cmp	r0, #0
	beq	.L83
	ldr	r0, [r3, #28]
	ldr	r6, [r3, #16]
	add	r0, r1, r0
	sub	r0, r0, r6
	add	r0, r2, r0, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r5, r0]
	cmp	r0, #0
	beq	.L83
	sub	r2, r2, #1
	cmp	ip, #0
	str	r2, [r3, #12]
	ble	.L84
	ldr	r0, [r3, #4]
	cmp	r0, #119
	suble	ip, ip, #1
	strle	ip, [r4]
	bgt	.L84
.L83:
	ldr	r0, .L113
	ldrh	r0, [r0, #48]
	tst	r0, #16
	bne	.L85
	ldr	r0, [r3, #24]
	add	r0, r2, r0
	cmp	r0, #255
	bgt	.L85
	add	r5, r0, #1
	add	r5, r5, r1, lsl #8
	ldr	r6, .L113+12
	lsl	r5, r5, #1
	ldrh	r5, [r6, r5]
	cmp	r5, #0
	beq	.L85
	ldr	r5, [r3, #28]
	ldr	r7, [r3, #16]
	add	r5, r1, r5
	sub	r5, r5, r7
	add	r0, r0, r5, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r6, r0]
	cmp	r0, #0
	beq	.L85
	add	r2, r2, #1
	cmp	ip, #15
	str	r2, [r3, #12]
	bgt	.L86
	ldr	r0, [r3, #4]
	cmp	r0, #120
	addgt	ip, ip, #1
	strgt	ip, [r4]
	bgt	.L85
.L86:
	ldr	r4, .L113+20
	ldr	r0, [r4]
	sub	r0, r0, #1
	str	r0, [r4]
.L85:
	sub	r1, r1, lr
	sub	r2, r2, ip
	stm	r3, {r1, r2}
	bl	animatePlayer
	pop	{r4, r5, r6, r7, r8, lr}
	b	testCollisions
.L112:
	lsl	r0, r0, #8
	add	r4, r0, r2
	ldr	r5, .L113+12
	lsl	r4, r4, #1
	ldrh	r4, [r5, r4]
	cmp	r4, #0
	beq	.L81
	ldr	r4, [r3, #24]
	ldr	r6, [r3, #20]
	add	r4, r2, r4
	sub	r4, r4, r6
	add	r0, r4, r0
	lsl	r0, r0, #1
	ldrh	r0, [r5, r0]
	cmp	r0, #0
	beq	.L81
	add	r1, r1, #1
	cmp	lr, #95
	str	r1, [r3, #8]
	bgt	.L82
	ldr	r0, [r3]
	cmp	r0, #80
	addgt	lr, lr, #1
	strgt	lr, [ip]
	bgt	.L81
.L82:
	ldr	ip, .L113+24
	ldr	r0, [ip]
	sub	r0, r0, #1
	str	r0, [ip]
	b	.L81
.L80:
	ldr	r4, .L113+24
	ldr	r0, [r4]
	add	r0, r0, #1
	str	r0, [r4]
	b	.L79
.L84:
	ldr	r5, .L113+20
	ldr	r0, [r5]
	add	r0, r0, #1
	str	r0, [r5]
	b	.L83
.L114:
	.align	2
.L113:
	.word	67109120
	.word	person
	.word	vOff
	.word	collisionMapBitmap
	.word	hOff
	.word	hFOff
	.word	vFOff
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L119
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L116
	ldr	r2, .L119+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L116:
	b	drawPlayer.part.0
.L120:
	.align	2
.L119:
	.word	person
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initCashier
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCashier, %function
initCashier:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #5
	mov	r0, #12
	mov	r1, #210
	mov	r2, #245
	ldr	r3, .L122
	str	ip, [r3, #12]
	str	r0, [r3, #8]
	stm	r3, {r1, r2}
	bx	lr
.L123:
	.align	2
.L122:
	.word	cashier
	.size	initCashier, .-initCashier
	.align	2
	.global	drawCashier
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCashier, %function
drawCashier:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #5632
	ldr	r2, .L125
	ldr	r1, .L125+4
	ldr	r3, [r2, #4]
	ldr	r0, [r1]
	ldr	r1, .L125+8
	sub	r3, r3, r0
	ldr	r2, [r2]
	ldr	r0, [r1]
	lsl	r3, r3, #23
	ldr	r1, .L125+12
	sub	r2, r2, r0
	lsr	r3, r3, #23
	add	r0, r1, #320
	orr	r3, r3, #16384
	add	r1, r1, #324
	and	r2, r2, #255
	strh	r3, [r0, #2]	@ movhi
	strh	r2, [r0]	@ movhi
	strh	ip, [r1]	@ movhi
	bx	lr
.L126:
	.align	2
.L125:
	.word	cashier
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawCashier, .-drawCashier
	.align	2
	.global	initFood
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFood, %function
initFood:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #4
	push	{r4, r5, lr}
	mov	ip, #12
	mov	lr, #9
	mov	r0, #0
	mov	r1, #1
	mov	r5, #5
	mov	r4, #6
	ldr	r2, .L129
	str	r3, [r2, #16]
	ldr	r3, .L129+4
	str	lr, [r3, #12]
	str	r5, [r3, #16]
	str	ip, [r3, #8]
	str	r0, [r3, #20]
	str	r1, [r3, #28]
	ldr	r3, .L129+8
	str	lr, [r2, #12]
	str	lr, [r3, #12]
	str	r4, [r3, #16]
	str	ip, [r2, #8]
	str	r0, [r2, #20]
	str	r1, [r2, #28]
	str	ip, [r3, #8]
	str	r0, [r3, #20]
	str	r1, [r3, #28]
	pop	{r4, r5, lr}
	bx	lr
.L130:
	.align	2
.L129:
	.word	can
	.word	apple
	.word	poptart
	.size	initFood, .-initFood
	.align	2
	.global	updateFood
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFood, %function
updateFood:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r6, .L139
	ldr	r5, .L139+4
	ldr	r4, .L139+8
	ldr	r2, [r6, #28]
	ldr	r3, [r5, #28]
	ldr	r1, [r4, #28]
	add	r2, r2, #1
	add	r3, r3, #1
	add	r1, r1, #1
	cmp	r2, #90
	str	r2, [r6, #28]
	str	r3, [r5, #28]
	str	r1, [r4, #28]
	beq	.L136
	cmp	r3, #180
	beq	.L137
.L133:
	ldr	r3, .L139+12
	ldr	r2, [r4, #28]
	cmp	r2, r3
	beq	.L138
.L131:
	pop	{r4, r5, r6, lr}
	bx	lr
.L136:
	mov	r2, #1
	ldr	r3, .L139+16
	str	r2, [r6, #20]
	mov	lr, pc
	bx	r3
	mov	r1, #3
	ldr	r3, .L139+20
	smull	ip, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #1
	add	r3, r3, #20
	str	r3, [r6]
	ldr	r3, [r5, #28]
	cmp	r3, #180
	str	r1, [r6, #4]
	bne	.L133
.L137:
	mov	r3, #1
	ldr	r6, .L139+16
	str	r3, [r5, #20]
	mov	lr, pc
	bx	r6
	ldr	r3, .L139+20
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	add	r3, r3, #20
	str	r3, [r5]
	mov	lr, pc
	bx	r6
	ldr	r3, .L139+24
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #3
	ldr	r2, [r4, #28]
	ldr	r3, .L139+12
	add	r0, r0, #111
	cmp	r2, r3
	str	r0, [r5, #4]
	bne	.L131
.L138:
	mov	r2, #1
	ldr	r3, .L139+16
	str	r2, [r4, #20]
	mov	lr, pc
	bx	r3
	mov	r1, #180
	ldr	r3, .L139+20
	smull	ip, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #1
	add	r3, r3, #20
	str	r3, [r4]
	str	r1, [r4, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L140:
	.align	2
.L139:
	.word	can
	.word	apple
	.word	poptart
	.word	270
	.word	rand
	.word	1374389535
	.word	1717986919
	.size	updateFood, .-updateFood
	.align	2
	.global	drawFood
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFood, %function
drawFood:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L152
	ldr	r2, [r3, #20]
	cmp	r2, #1
	str	lr, [sp, #-4]!
	beq	.L149
	ldr	r3, .L152+4
	ldrh	r2, [r3, #8]
	ldr	r1, .L152+8
	orr	r2, r2, #512
	strh	r2, [r3, #8]	@ movhi
	ldr	r2, [r1, #20]
	cmp	r2, #1
	beq	.L150
.L144:
	ldrh	r2, [r3, #16]
	ldr	r1, .L152+12
	orr	r2, r2, #512
	strh	r2, [r3, #16]	@ movhi
	ldr	r2, [r1, #20]
	cmp	r2, #1
	beq	.L151
.L146:
	ldrh	r2, [r3, #24]
	orr	r2, r2, #512
	strh	r2, [r3, #24]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L149:
	mov	r0, #1280
	ldr	r1, .L152+16
	ldr	r2, [r3, #4]
	ldr	r1, [r1]
	ldr	ip, .L152+20
	sub	r2, r2, r1
	ldr	ip, [ip]
	ldr	r1, [r3]
	ldr	r3, .L152+4
	sub	r1, r1, ip
	and	r1, r1, #255
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L152+8
	orr	r2, r2, #16384
	strh	r2, [r3, #10]	@ movhi
	ldr	r2, [r1, #20]
	cmp	r2, #1
	strh	r0, [r3, #12]	@ movhi
	bne	.L144
.L150:
	mov	r0, #1344
	ldr	ip, .L152+16
	ldr	lr, [ip]
	ldr	ip, .L152+20
	ldr	r2, [r1, #4]
	ldr	ip, [ip]
	ldr	r1, [r1]
	sub	r2, r2, lr
	sub	r1, r1, ip
	and	r1, r1, #255
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	strh	r1, [r3, #16]	@ movhi
	ldr	r1, .L152+12
	orr	r2, r2, #16384
	strh	r2, [r3, #18]	@ movhi
	ldr	r2, [r1, #20]
	cmp	r2, #1
	strh	r0, [r3, #20]	@ movhi
	bne	.L146
.L151:
	mov	r0, #1408
	ldr	ip, .L152+16
	ldr	r2, [r1, #4]
	ldr	lr, [ip]
	ldr	ip, .L152+20
	sub	r2, r2, lr
	ldr	r1, [r1]
	ldr	ip, [ip]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	sub	r1, r1, ip
	orr	r2, r2, #16384
	and	r1, r1, #255
	strh	r2, [r3, #26]	@ movhi
	strh	r1, [r3, #24]	@ movhi
	strh	r0, [r3, #28]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L153:
	.align	2
.L152:
	.word	can
	.word	shadowOAM
	.word	apple
	.word	poptart
	.word	hOff
	.word	vOff
	.size	drawFood, .-drawFood
	.align	2
	.global	initCoupons
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCoupons, %function
initCoupons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r1, #0
	mov	r4, #14
	mov	lr, #11
	mov	r0, #2
	mov	r5, #3
	mov	ip, #1
	ldr	r2, .L156
	ldr	r3, .L156+4
	str	r4, [r2, #12]
	str	r4, [r3, #12]
	str	r5, [r3, #16]
	str	lr, [r2, #8]
	str	lr, [r3, #8]
	str	r1, [r2, #20]
	str	r1, [r2, #32]
	str	r1, [r3, #20]
	str	r1, [r3, #32]
	str	r0, [r2, #16]
	str	r0, [r2, #36]
	str	r0, [r3, #36]
	str	ip, [r2, #28]
	str	ip, [r3, #28]
	pop	{r4, r5, lr}
	bx	lr
.L157:
	.align	2
.L156:
	.word	yellow
	.word	pink
	.size	initCoupons, .-initCoupons
	.align	2
	.global	updateCoupons
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCoupons, %function
updateCoupons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r6, .L166
	ldr	r5, .L166+4
	ldr	r3, [r6, #28]
	ldr	r4, [r5, #28]
	add	r3, r3, #1
	add	r4, r4, #1
	cmp	r3, #260
	str	r3, [r6, #28]
	str	r4, [r5, #28]
	beq	.L164
.L159:
	ldr	r2, .L166+8
	smull	r0, r1, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #3
	add	r2, r2, r2, lsl #2
	cmp	r3, r2, lsl #2
	bne	.L160
	ldr	r0, [r6, #32]
	ldr	r3, .L166+12
	add	r0, r0, #1
	ldr	r1, [r6, #36]
	mov	lr, pc
	bx	r3
	str	r1, [r6, #32]
.L160:
	cmp	r4, #460
	beq	.L165
.L161:
	ldr	r3, .L166+8
	smull	r1, r2, r3, r4
	asr	r3, r4, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r4, r3, lsl #2
	bne	.L158
	ldr	r0, [r5, #32]
	ldr	r3, .L166+12
	add	r0, r0, #1
	ldr	r1, [r5, #36]
	mov	lr, pc
	bx	r3
	str	r1, [r5, #32]
.L158:
	pop	{r4, r5, r6, lr}
	bx	lr
.L164:
	mov	r1, #1
	mov	r2, #5
	ldr	r3, .L166+16
	str	r1, [r6, #20]
	str	r2, [r6]
	mov	lr, pc
	bx	r3
	ldr	r3, .L166+20
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #3
	str	r3, [r6, #4]
	ldr	r4, [r5, #28]
	ldr	r3, [r6, #28]
	b	.L159
.L165:
	mov	r1, #1
	mov	r2, #230
	ldr	r3, .L166+16
	str	r1, [r5, #20]
	str	r2, [r5]
	mov	lr, pc
	bx	r3
	ldr	r3, .L166+20
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #3
	str	r3, [r5, #4]
	ldr	r4, [r5, #28]
	b	.L161
.L167:
	.align	2
.L166:
	.word	yellow
	.word	pink
	.word	1717986919
	.word	__aeabi_idivmod
	.word	rand
	.word	1374389535
	.size	updateCoupons, .-updateCoupons
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updatePlayer
	bl	updateFood
	pop	{r4, lr}
	b	updateCoupons
	.size	updateGame, .-updateGame
	.align	2
	.global	drawCoupons
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCoupons, %function
drawCoupons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L181
	ldr	r2, [r3, #20]
	cmp	r2, #1
	beq	.L179
	ldr	r3, .L181+4
	ldrh	r2, [r3, #32]
	ldr	r1, .L181+8
	orr	r2, r2, #512
	strh	r2, [r3, #32]	@ movhi
	ldr	r2, [r1, #20]
	cmp	r2, #1
	beq	.L180
.L173:
	ldrh	r2, [r3, #40]
	orr	r2, r2, #512
	strh	r2, [r3, #40]	@ movhi
	bx	lr
.L179:
	ldr	r1, .L181+12
	ldr	ip, [r1]
	ldr	r1, [r3, #32]
	ldr	r2, [r3, #4]
	ldr	r0, .L181+16
	add	r1, r1, #64
	sub	r2, r2, ip
	lsl	r1, r1, #1
	ldr	ip, [r0]
	ldr	r0, [r3]
	ldr	r3, .L181+4
	orr	r1, r1, #1024
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	strh	r1, [r3, #36]	@ movhi
	ldr	r1, .L181+8
	orr	r2, r2, #16384
	strh	r2, [r3, #34]	@ movhi
	ldr	r2, [r1, #20]
	sub	r0, r0, ip
	and	r0, r0, #255
	cmp	r2, #1
	strh	r0, [r3, #32]	@ movhi
	bne	.L173
.L180:
	ldr	r0, .L181+12
	str	lr, [sp, #-4]!
	ldr	r2, [r1, #4]
	ldr	lr, [r0]
	ldr	ip, .L181+16
	ldr	r0, [r1, #32]
	sub	r2, r2, lr
	ldr	lr, [ip]
	ldr	ip, [r1]
	lsl	r2, r2, #23
	add	r1, r0, #96
	lsr	r2, r2, #23
	sub	r0, ip, lr
	lsl	r1, r1, #1
	orr	r2, r2, #16384
	and	r0, r0, #255
	orr	r1, r1, #1024
	strh	r2, [r3, #42]	@ movhi
	strh	r0, [r3, #40]	@ movhi
	strh	r1, [r3, #44]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L182:
	.align	2
.L181:
	.word	yellow
	.word	shadowOAM
	.word	pink
	.word	hOff
	.word	vOff
	.size	drawCoupons, .-drawCoupons
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L187
	ldr	r3, [r3, #52]
	cmp	r3, #0
	push	{r4, r5, r6, lr}
	beq	.L184
	ldr	r2, .L187+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
.L185:
	mov	r1, #5632
	ldr	r5, .L187+8
	ldr	r2, .L187+12
	ldr	r0, [r5]
	ldr	r3, [r2, #4]
	ldr	r4, .L187+16
	ldr	r2, [r2]
	sub	r3, r3, r0
	ldr	r0, [r4]
	lsl	r3, r3, #23
	sub	r2, r2, r0
	ldr	r6, .L187+20
	lsr	r3, r3, #23
	and	r2, r2, #255
	orr	r3, r3, #16384
	strh	r2, [r6]	@ movhi
	strh	r1, [r6, #4]	@ movhi
	strh	r3, [r6, #2]	@ movhi
	bl	drawFood
	bl	drawCoupons
	bl	drawScore
	ldr	r3, .L187+24
	mov	lr, pc
	bx	r3
	sub	r1, r6, #320
	mov	r3, #512
	mov	r2, #117440512
	ldr	r6, .L187+28
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r3, #67108864
	ldrh	r2, [r5]
	ldrh	r1, [r4]
	strh	r2, [r3, #20]	@ movhi
	ldr	r2, .L187+32
	strh	r1, [r3, #22]	@ movhi
	ldrh	r1, [r2]
	ldr	r2, .L187+36
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L184:
	bl	drawPlayer.part.0
	b	.L185
.L188:
	.align	2
.L187:
	.word	person
	.word	shadowOAM
	.word	hOff
	.word	cashier
	.word	vOff
	.word	shadowOAM+320
	.word	waitForVBlank
	.word	DMANow
	.word	hFOff
	.word	vFOff
	.size	drawGame, .-drawGame
	.comm	shadowOAM,1024,4
	.comm	couponPrice,4,4
	.comm	foodPrice,4,4
	.comm	moneyCounter,4,4
	.comm	foodCounter,4,4
	.comm	cashier,16,4
	.comm	pink,40,4
	.comm	yellow,40,4
	.comm	poptart,32,4
	.comm	apple,32,4
	.comm	can,32,4
	.comm	person,56,4
	.comm	winBool,4,4
	.comm	vFOff,4,4
	.comm	hFOff,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	soundB,32,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
