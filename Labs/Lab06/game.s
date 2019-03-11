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
	.type	updateBullet.part.0, %function
updateBullet.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0]
	ldr	r3, [r0, #16]
	add	r3, r2, r3
	cmp	r3, #0
	ble	.L2
	ldr	r1, [r0, #12]
	ldr	r3, [r0, #4]
	add	r3, r3, r1
	sub	r1, r3, #1
	cmp	r1, #237
	bls	.L5
.L2:
	mov	r3, #0
	str	r3, [r0, #28]
	bx	lr
.L5:
	ldr	r1, [r0, #8]
	add	r2, r1, r2
	stm	r0, {r2, r3}
	bx	lr
	.size	updateBullet.part.0, .-updateBullet.part.0
	.align	2
	.global	drawBar
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBar, %function
drawBar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #253
	push	{r4, lr}
	sub	sp, sp, #8
	str	r2, [sp]
	mov	r3, #240
	mov	r2, #3
	mov	r1, #0
	mov	r0, #120
	ldr	r4, .L8
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	drawRect4
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
	mvn	r1, #3
	push	{r4, r5, lr}
	mov	ip, #10
	mov	r5, #130
	mov	r4, #118
	mov	lr, #2
	mov	r0, #5
	mov	r2, #20
	ldr	r3, .L12
	strb	r1, [r3, #20]
	str	r5, [r3]
	stmib	r3, {r4, lr}
	str	ip, [r3, #12]
	str	r0, [r3, #16]
	str	r2, [r3, #24]
	pop	{r4, r5, lr}
	bx	lr
.L13:
	.align	2
.L12:
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
	push	{r4, lr}
	ldr	r0, .L16
	ldrb	r2, [r0, #20]	@ zero_extendqisi2
	sub	sp, sp, #8
	ldr	r3, [r0, #16]
	str	r2, [sp]
	ldr	r4, .L16+4
	ldr	r2, [r0, #12]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	player
	.word	drawRect4
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
	@ link register save eliminated.
	mov	r2, #0
	mvn	r0, #1
	mov	r1, r2
	ldr	r3, .L22
.L19:
	add	r2, r2, #1
	rsb	ip, r2, #0
	cmp	r2, #5
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r1, [r3, #4]
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	strb	r0, [r3, #24]
	str	r1, [r3, #28]
	str	ip, [r3]
	add	r3, r3, #32
	bne	.L19
	bx	lr
.L23:
	.align	2
.L22:
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
	mov	r3, #0
	ldr	r1, .L35
	ldr	r2, [r1, r3, lsl #5]
	cmp	r2, #0
	lsl	r2, r3, #5
	beq	.L34
.L25:
	add	r3, r3, #1
	cmp	r3, #5
	bxeq	lr
	ldr	r2, [r1, r3, lsl #5]
	cmp	r2, #0
	lsl	r2, r3, #5
	bne	.L25
.L34:
	push	{r4, r5, lr}
	mov	r5, #1
	ldr	ip, .L35+4
	ldr	r4, .L35+8
	ldr	lr, [ip, #16]
	add	r2, r4, r2
	ldr	r1, [ip, #4]
	ldr	r0, [r2, #20]
	add	lr, lr, lr, lsr #31
	add	r1, r1, lr, asr r5
	add	r0, r0, r0, lsr #31
	ldr	lr, [ip, #28]
	ldr	ip, [ip]
	sub	r1, r1, r0, asr r5
	str	lr, [r2, #12]
	str	ip, [r4, r3, lsl #5]
	str	r5, [r2, #28]
	str	r1, [r2, #4]
	pop	{r4, r5, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	bullets+28
	.word	player
	.word	bullets
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
	ldr	r3, .L50
	ldrh	r3, [r3, #48]
	tst	r3, #32
	push	{r4, lr}
	ldr	r4, .L50+4
	bne	.L38
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #8]
	cmp	r3, r2
	blt	.L38
	mvn	r1, #0
	sub	r3, r3, r2
	str	r3, [r4, #4]
	str	r1, [r4, #28]
	b	.L39
.L38:
	ldr	r3, .L50
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L49
.L40:
	mov	r3, #0
	str	r3, [r4, #28]
.L39:
	ldr	r3, .L50+8
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r3, [r4, #24]
	beq	.L48
	ldr	r2, .L50+12
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L43
.L48:
	add	r3, r3, #1
.L42:
	str	r3, [r4, #24]
	pop	{r4, lr}
	bx	lr
.L49:
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #16]
	ldr	r1, [r4, #8]
	add	r3, r2, r3
	rsb	r0, r1, #240
	cmp	r3, r0
	bgt	.L40
	mov	r3, #1
	add	r2, r2, r1
	str	r2, [r4, #4]
	str	r3, [r4, #28]
	b	.L39
.L43:
	cmp	r3, #12
	ble	.L48
	bl	fireBullet
	mov	r3, #1
	b	.L42
.L51:
	.align	2
.L50:
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
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	b	updateBullet.part.0
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
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	push	{r4, lr}
	ldrb	r2, [r0, #24]	@ zero_extendqisi2
	sub	sp, sp, #8
	ldr	r3, [r0, #20]
	str	r2, [sp]
	ldr	r4, .L63
	ldr	r2, [r0, #16]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L64:
	.align	2
.L63:
	.word	drawRect4
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
	mov	r8, #0
	mov	r9, #12
	ldr	r4, .L69
	ldr	r5, .L69+4
	ldr	r7, .L69+8
	ldr	r6, .L69+12
.L66:
	str	r9, [r4, #16]
	str	r9, [r4, #20]
	mov	lr, pc
	bx	r5
	smull	r3, r2, r7, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #2
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #3
	sub	r3, r0, r3, lsl #1
	str	r3, [r4]
	mov	lr, pc
	bx	r5
	mov	r1, #1
	mov	r2, #2
	smull	r3, ip, r6, r0
	asr	r3, r0, #31
	rsb	r3, r3, ip, asr #6
	add	r3, r3, r3, lsl #6
	sub	r0, r0, r3, lsl r1
	and	r3, r8, r1
	add	r8, r8, r1
	add	r0, r0, #10
	cmp	r8, #5
	stmib	r4, {r0, r2}
	str	r2, [r4, #12]
	str	r1, [r4, #28]
	str	r3, [r4, #24]
	add	r4, r4, #32
	bne	.L66
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L70:
	.align	2
.L69:
	.word	balls
	.word	rand
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #0
	mov	r8, #130
	mov	r7, #118
	mov	r6, #2
	mov	lr, #10
	mov	ip, #5
	mvn	r0, #3
	mov	r1, #20
	mov	r5, r4
	mvn	r2, #1
	ldr	r3, .L75
	str	r8, [r3]
	str	r7, [r3, #4]
	str	r6, [r3, #8]
	str	lr, [r3, #12]
	str	ip, [r3, #16]
	strb	r0, [r3, #20]
	str	r1, [r3, #24]
	ldr	r3, .L75+4
.L72:
	add	r4, r4, #1
	rsb	r1, r4, #0
	cmp	r4, #5
	str	r4, [r3, #16]
	str	r4, [r3, #20]
	str	r5, [r3, #4]
	str	r2, [r3, #8]
	str	r5, [r3, #12]
	strb	r2, [r3, #24]
	str	r5, [r3, #28]
	str	r1, [r3]
	add	r3, r3, #32
	bne	.L72
	bl	initBalls
	ldr	ip, .L75+8
	mov	r3, #256
	str	r4, [ip]
	mov	r2, #83886080
	ldr	r1, .L75+12
	mov	r0, #3
	ldr	r4, .L75+16
	mov	lr, pc
	bx	r4
	mov	lr, #31744
	mov	ip, #992
	mov	r0, #31
	mvn	r1, #32768
	ldr	r3, .L75+20
	ldr	r2, .L75+24
	strh	lr, [r3, #246]	@ movhi
	strh	r5, [r3, #244]	@ movhi
	strh	ip, [r3, #248]	@ movhi
	strh	r0, [r3, #250]	@ movhi
	strh	r1, [r3, #252]	@ movhi
	strh	r2, [r3, #254]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L76:
	.align	2
.L75:
	.word	player
	.word	bullets
	.word	ballsRemaining
	.word	pumpkinPal
	.word	DMANow
	.word	83886336
	.word	15855
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
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r2, [r0]
	cmp	r2, #1
	sub	sp, sp, #20
	ldr	ip, [r0, #8]
	ble	.L79
	ldr	r3, [r0, #16]
	add	r3, r2, r3
	cmp	r3, #119
	ble	.L80
.L79:
	rsb	ip, ip, #0
	str	ip, [r0, #8]
.L80:
	ldr	r3, [r0, #4]
	cmp	r3, #1
	ldr	r1, [r0, #12]
	ble	.L81
	ldr	lr, [r0, #20]
	add	lr, r3, lr
	cmp	lr, #238
	bgt	.L81
.L82:
	mov	r5, r0
	mov	r7, #0
	add	r2, r2, ip
	add	r3, r3, r1
	ldr	r4, .L97
	stm	r0, {r2, r3}
	ldr	r8, .L97+4
	ldr	r9, .L97+8
	add	r6, r4, #160
.L86:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L96
.L84:
	add	r4, r4, #32
	cmp	r6, r4
	bne	.L86
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L81:
	rsb	r1, r1, #0
	str	r1, [r0, #12]
	b	.L82
.L96:
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldm	r5, {r0, r1}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	ldrne	r3, [r9]
	subne	r3, r3, #1
	strne	r7, [r4, #28]
	strne	r3, [r9]
	strne	r7, [r5, #28]
	b	.L84
.L98:
	.align	2
.L97:
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
	push	{r4, r5, r6, lr}
	bl	updatePlayer
	ldr	r4, .L107
	add	r5, r4, #160
.L101:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	movne	r0, r4
	blne	updateBullet.part.0
.L100:
	add	r4, r4, #32
	cmp	r4, r5
	bne	.L101
	ldr	r0, .L107+4
	bl	updateBall
	ldr	r0, .L107+8
	bl	updateBall
	ldr	r0, .L107+12
	bl	updateBall
	ldr	r0, .L107+16
	bl	updateBall
	ldr	r0, .L107+20
	pop	{r4, r5, r6, lr}
	b	updateBall
.L108:
	.align	2
.L107:
	.word	bullets
	.word	balls
	.word	balls+32
	.word	balls+64
	.word	balls+96
	.word	balls+128
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
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	mov	r3, r0
	push	{r4, lr}
	ldr	r2, [r0, #24]
	cmp	r2, #0
	add	r2, r3, #16
	sub	sp, sp, #8
	ldm	r0, {r0, r1}
	ldm	r2, {r2, r3}
	bne	.L119
	mov	ip, #251
	ldr	r4, .L120
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L119:
	ldr	ip, .L120+4
	ldr	r4, .L120+8
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L121:
	.align	2
.L120:
	.word	drawRect4
	.word	pumpkinBitmap
	.word	drawImage4
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
	push	{r4, r5, r6, lr}
	mov	r0, #250
	sub	sp, sp, #8
	ldr	r3, .L131
	mov	lr, pc
	bx	r3
	bl	drawPlayer
	mov	r2, #253
	mov	r3, #240
	str	r2, [sp]
	mov	r1, #0
	mov	r2, #3
	mov	r0, #120
	ldr	r6, .L131+4
	mov	lr, pc
	bx	r6
	ldr	r4, .L131+8
	add	r5, r4, #160
.L124:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L130
.L123:
	add	r4, r4, #32
	cmp	r4, r5
	bne	.L124
	ldr	r0, .L131+12
	bl	drawBall
	ldr	r0, .L131+16
	bl	drawBall
	ldr	r0, .L131+20
	bl	drawBall
	ldr	r0, .L131+24
	bl	drawBall
	ldr	r0, .L131+28
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	drawBall
.L130:
	ldrb	r2, [r4, #24]	@ zero_extendqisi2
	ldr	r3, [r4, #20]
	str	r2, [sp]
	ldm	r4, {r0, r1}
	ldr	r2, [r4, #16]
	mov	lr, pc
	bx	r6
	b	.L123
.L132:
	.align	2
.L131:
	.word	fillScreen4
	.word	drawRect4
	.word	bullets
	.word	balls
	.word	balls+32
	.word	balls+64
	.word	balls+96
	.word	balls+128
	.size	drawGame, .-drawGame
	.comm	ballsRemaining,4,4
	.comm	balls,160,4
	.comm	bullets,160,4
	.comm	player,32,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
