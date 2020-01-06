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
	.global	drawBar
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBar, %function
drawBar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #31
	push	{r4, lr}
	sub	sp, sp, #8
	str	r2, [sp]
	mov	r3, #240
	mov	r2, #3
	mov	r1, #0
	mov	r0, #120
	ldr	r4, .L4
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	drawRect
	.size	drawBar, .-drawBar
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
	push	{r4, r5, lr}
	mov	r1, #130
	mov	r5, #1
	mov	r4, #10
	mov	lr, #5
	mov	r2, #118
	mov	ip, #992
	mov	r0, #20
	ldr	r3, .L8
	str	r5, [r3, #16]
	str	r4, [r3, #20]
	str	lr, [r3, #24]
	str	r1, [r3]
	str	r1, [r3, #8]
	strh	ip, [r3, #28]	@ movhi
	str	r0, [r3, #32]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	pop	{r4, r5, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	player
	.size	initPlayer, .-initPlayer
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
	mov	r3, #0
	push	{r4, r5, lr}
	ldr	r4, .L12
	sub	sp, sp, #12
	str	r3, [sp]
	add	r2, r4, #20
	add	r0, r4, #8
	ldm	r2, {r2, r3}
	ldr	r5, .L12+4
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #28]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldm	r4, {r0, r1}
	ldr	r2, [r4, #20]
	mov	lr, pc
	bx	r5
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	player
	.word	drawRect
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #1
	mov	r6, #2
	mvn	r1, #1
	mov	r2, #0
	mvn	r5, #32768
	ldr	ip, .L18
	ldr	r3, .L18+4
	ldm	ip, {r4, lr}
	add	ip, r3, #200
.L15:
	str	r6, [r3, #20]
	str	r0, [r3, #24]
	str	r1, [r3, #16]
	strh	r5, [r3, #28]	@ movhi
	str	r2, [r3, #32]
	str	r0, [r3, #36]
	stm	r3, {r1, r2, r4, lr}
	add	r3, r3, #40
	cmp	r3, ip
	bne	.L15
	pop	{r4, r5, r6, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	player
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L31
	mov	r2, r0
	ldr	r1, [r2, #32]
	cmp	r1, #0
	mov	r3, #0
	beq	.L30
.L21:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #40
	bxeq	lr
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L21
.L30:
	push	{r4, r5, r6, lr}
	mov	r4, #1
	ldr	r5, .L31+4
	add	r3, r3, r3, lsl #2
	lsl	r3, r3, #3
	ldr	r2, [r5, #24]
	ldr	r6, [r5]
	add	ip, r0, r3
	add	lr, r2, r2, lsr #31
	str	r6, [r0, r3]
	ldr	r2, [r5, #4]
	ldr	r3, [ip, #24]
	add	r2, r2, lr, asr r4
	add	r3, r3, r3, lsr #31
	sub	r3, r2, r3, asr r4
	str	r4, [ip, #32]
	str	r1, [ip, #36]
	str	r3, [ip, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	bullets
	.word	player
	.size	fireBullet, .-fireBullet
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
	ldr	r3, .L44
	ldrh	r3, [r3, #48]
	tst	r3, #32
	push	{r4, lr}
	ldr	r4, .L44+4
	bne	.L34
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #16]
	cmp	r3, r2
	subge	r3, r3, r2
	strge	r3, [r4, #4]
	blt	.L34
.L35:
	ldr	r3, .L44+8
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r3, [r4, #32]
	beq	.L43
	ldr	r2, .L44+12
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L38
.L43:
	add	r3, r3, #1
.L37:
	str	r3, [r4, #32]
	pop	{r4, lr}
	bx	lr
.L34:
	ldr	r3, .L44
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L35
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #16]
	ldr	r3, [r4, #24]
	rsb	r0, r1, #240
	add	r3, r2, r3
	cmp	r3, r0
	addle	r2, r2, r1
	strle	r2, [r4, #4]
	b	.L35
.L38:
	cmp	r3, #19
	ble	.L43
	bl	fireBullet
	mov	r3, #1
	b	.L37
.L45:
	.align	2
.L44:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	ldr	r2, [r0]
	ldr	r3, [r0, #20]
	add	r3, r2, r3
	cmp	r3, #0
	movle	r3, #0
	ldrgt	r3, [r0, #16]
	addgt	r2, r3, r2
	strgt	r2, [r0]
	strle	r3, [r0, #32]
	bx	lr
	.size	updateBullet, .-updateBullet
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #32]
	cmp	r3, #0
	sub	sp, sp, #12
	mov	r4, r0
	bne	.L56
	ldr	r3, [r0, #36]
	cmp	r3, #0
	beq	.L57
.L54:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L57:
	str	r3, [sp]
	add	r2, r0, #20
	add	r0, r0, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L58
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #36]
	b	.L54
.L56:
	mov	r2, #0
	ldr	r3, [r0, #24]
	str	r2, [sp]
	add	r0, r0, #8
	ldr	r2, [r0, #12]
	ldr	r5, .L58
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #28]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	b	.L54
.L59:
	.align	2
.L58:
	.word	drawRect
	.size	drawBullet, .-drawBullet
	.align	2
	.global	initBalls
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBalls, %function
initBalls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r10, #10
	ldr	r4, .L64
	ldr	r5, .L64+4
	ldr	r9, .L64+8
	ldr	r8, .L64+12
	ldr	r7, .L64+16
	add	r6, r4, #220
.L61:
	str	r10, [r4, #24]
	str	r10, [r4, #28]
	mov	lr, pc
	bx	r5
	smull	r3, r2, r8, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #2
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #3
	sub	r3, r0, r3, lsl #1
	str	r3, [r4]
	mov	lr, pc
	bx	r5
	mov	r2, #1
	mov	ip, #31744
	mov	r1, #0
	smull	r3, lr, r7, r0
	asr	r3, r0, #31
	rsb	r3, r3, lr, asr #6
	add	r3, r3, r3, lsl #6
	sub	r0, r0, r3, lsl r2
	ldr	lr, [r9]
	ldr	r3, [r9, #4]
	add	r0, r0, #10
	str	r0, [r4, #4]
	str	r2, [r4, #16]
	str	r2, [r4, #20]
	str	r2, [r4, #36]
	strh	ip, [r4, #32]	@ movhi
	str	r1, [r4, #40]
	str	lr, [r4, #8]
	str	r3, [r4, #12]
	add	r4, r4, #44
	cmp	r4, r6
	bne	.L61
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	balls
	.word	rand
	.word	player
	.word	156180629
	.word	2114445439
	.size	initBalls, .-initBalls
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
	mov	r7, #130
	mov	r8, #1
	ldr	r0, .L70
	mov	r6, #118
	str	r7, [r0]
	str	r7, [r0, #8]
	mov	fp, #10
	mov	r10, #5
	mov	r9, #992
	mov	r5, r7
	mov	r7, #20
	mov	r1, r8
	mov	lr, #2
	mvn	r2, #1
	mov	r3, #0
	mvn	ip, #32768
	str	r6, [r0, #4]
	str	r6, [r0, #12]
	mov	r4, r6
	ldr	r6, .L70+4
	str	fp, [r0, #20]
	str	r10, [r0, #24]
	strh	r9, [r0, #28]	@ movhi
	str	r7, [r0, #32]
	str	r8, [r0, #16]
	add	r0, r6, #200
.L67:
	str	lr, [r6, #20]
	str	r1, [r6, #24]
	str	r4, [r6, #12]
	str	r2, [r6, #16]
	strh	ip, [r6, #28]	@ movhi
	str	r3, [r6, #32]
	str	r1, [r6, #36]
	stm	r6, {r2, r3, r5}
	add	r6, r6, #40
	cmp	r6, r0
	bne	.L67
	bl	initBalls
	mov	r2, #5
	ldr	r3, .L70+8
	str	r2, [r3]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L71:
	.align	2
.L70:
	.word	player
	.word	bullets
	.word	ballsRemaining
	.size	initGame, .-initGame
	.align	2
	.global	updateBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBall, %function
updateBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bxeq	lr
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r2, [r0]
	cmp	r2, #0
	sub	sp, sp, #20
	ldr	ip, [r0, #16]
	ble	.L74
	ldr	r3, [r0, #24]
	add	r3, r2, r3
	cmp	r3, #120
	ble	.L75
.L74:
	rsb	ip, ip, #0
	str	ip, [r0, #16]
.L75:
	ldr	r3, [r0, #4]
	cmp	r3, #0
	ldr	r1, [r0, #20]
	ble	.L76
	ldr	lr, [r0, #28]
	add	lr, r3, lr
	cmp	lr, #239
	bgt	.L76
.L77:
	mov	r5, r0
	mov	r7, #0
	add	r2, r2, ip
	add	r3, r3, r1
	ldr	r4, .L92
	stm	r0, {r2, r3}
	ldr	r8, .L92+4
	ldr	r9, .L92+8
	add	r6, r4, #200
.L81:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L91
.L79:
	add	r4, r4, #40
	cmp	r6, r4
	bne	.L81
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L76:
	rsb	r1, r1, #0
	str	r1, [r0, #20]
	b	.L77
.L91:
	ldr	r0, [r4, #24]
	ldr	r1, [r4, #20]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r5, #24
	ldm	r2, {r2, r3}
	ldm	r5, {r0, r1}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	ldrne	r3, [r9]
	subne	r3, r3, #1
	strne	r7, [r4, #32]
	strne	r3, [r9]
	strne	r7, [r5, #36]
	b	.L79
.L93:
	.align	2
.L92:
	.word	bullets
	.word	collision
	.word	ballsRemaining
	.size	updateBall, .-updateBall
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
	mov	ip, #0
	ldr	r3, .L103
	add	r0, r3, #200
.L97:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L95
	ldr	r1, [r3]
	ldr	r2, [r3, #20]
	add	r2, r1, r2
	cmp	r2, #0
	ldrgt	r2, [r3, #16]
	addgt	r1, r2, r1
	strgt	r1, [r3]
	strle	ip, [r3, #32]
.L95:
	add	r3, r3, #40
	cmp	r3, r0
	bne	.L97
	ldr	r0, .L103+4
	bl	updateBall
	ldr	r0, .L103+8
	bl	updateBall
	ldr	r0, .L103+12
	bl	updateBall
	ldr	r0, .L103+16
	bl	updateBall
	ldr	r0, .L103+20
	pop	{r4, lr}
	b	updateBall
.L104:
	.align	2
.L103:
	.word	bullets
	.word	balls
	.word	balls+44
	.word	balls+88
	.word	balls+132
	.word	balls+176
	.size	updateGame, .-updateGame
	.align	2
	.global	drawBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #36]
	cmp	r3, #0
	sub	sp, sp, #12
	mov	r4, r0
	bne	.L109
	ldr	r3, [r0, #40]
	cmp	r3, #0
	beq	.L110
.L107:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L110:
	str	r3, [sp]
	add	r2, r0, #24
	add	r0, r0, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L111
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #40]
	b	.L107
.L109:
	mov	r2, #0
	ldr	r3, [r0, #28]
	str	r2, [sp]
	add	r0, r0, #8
	ldr	r2, [r0, #16]
	ldr	r5, .L111
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #32]
	ldr	r3, [r4, #28]
	str	r2, [sp]
	ldr	r2, [r4, #24]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	b	.L107
.L112:
	.align	2
.L111:
	.word	drawRect
	.size	drawBall, .-drawBall
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
	push	{r4, r5, lr}
	sub	sp, sp, #12
	bl	drawPlayer
	mov	r3, #31
	ldr	r5, .L115
	mov	r2, #3
	mov	r1, #0
	str	r3, [sp]
	mov	r0, #120
	mov	r3, #240
	ldr	r4, .L115+4
	mov	lr, pc
	bx	r4
	mov	r0, r5
	bl	drawBullet
	add	r0, r5, #40
	bl	drawBullet
	add	r0, r5, #80
	ldr	r4, .L115+8
	bl	drawBullet
	add	r0, r5, #120
	bl	drawBullet
	add	r0, r5, #160
	bl	drawBullet
	mov	r0, r4
	bl	drawBall
	add	r0, r4, #44
	bl	drawBall
	add	r0, r4, #88
	bl	drawBall
	add	r0, r4, #132
	bl	drawBall
	add	r0, r4, #176
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	drawBall
.L116:
	.align	2
.L115:
	.word	bullets
	.word	drawRect
	.word	balls
	.size	drawGame, .-drawGame
	.comm	ballsRemaining,4,4
	.comm	balls,220,4
	.comm	bullets,200,4
	.comm	player,36,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
