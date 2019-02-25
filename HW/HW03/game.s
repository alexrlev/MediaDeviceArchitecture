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
	.type	updateBall.part.1, %function
updateBall.part.1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r0
	ldr	r0, [r0]
	ldr	r2, [r5, #24]
	cmp	r0, #0
	sub	sp, sp, #20
	add	ip, r0, r2
	ble	.L2
	cmp	ip, #159
	bgt	.L2
.L3:
	ldr	r1, [r5, #4]
	cmp	r1, #0
	ldr	r3, [r5, #28]
	ble	.L4
	add	lr, r1, r3
	cmp	lr, #239
	bgt	.L4
.L5:
	cmp	ip, #138
	ble	.L7
	cmp	r1, #70
	ble	.L8
	add	lr, r1, r3
	cmp	lr, #169
	movle	r4, #1
	ldrle	lr, .L34
	strle	r4, [lr]
.L8:
	cmp	r1, #68
	movgt	lr, #0
	movle	lr, #1
	sub	r4, r1, #167
	cmp	r4, #3
	orrls	lr, lr, #1
	cmp	ip, #140
	movne	ip, #0
	andeq	ip, lr, #1
	cmp	ip, #0
	bne	.L28
	add	ip, r1, r3
	cmp	ip, #70
	beq	.L29
.L10:
	cmp	r1, #171
	beq	.L30
.L7:
	ldr	r4, .L34+4
	add	ip, r4, #20
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	ldr	lr, [r4, #4]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	ldr	r7, .L34+8
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #1
	ldr	r1, [r4, #4]
	beq	.L31
	cmp	r1, #0
	ble	.L17
	ldr	r3, .L34+12
	ldrh	r3, [r3, #48]
	tst	r3, #32
	subeq	r1, r1, #1
	streq	r1, [r4, #4]
.L17:
	ldr	r3, [r4, #24]
	add	r3, r1, r3
	cmp	r3, #239
	add	r0, r5, #16
	ldr	r3, [r5, #4]
	ldm	r0, {r0, ip}
	ble	.L32
.L16:
	mov	r8, #0
	ldr	r2, [r5]
	add	r3, r3, ip
	add	r2, r2, r0
	ldr	r4, .L34+16
	stm	r5, {r2, r3}
	ldr	r9, .L34+20
	add	r6, r4, #200
.L21:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L33
.L19:
	add	r4, r4, #40
	cmp	r6, r4
	bne	.L21
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L4:
	ldr	lr, [r5, #20]
	rsb	lr, lr, #0
	str	lr, [r5, #20]
	b	.L5
.L2:
	ldr	r3, [r5, #16]
	rsb	r3, r3, #0
	str	r3, [r5, #16]
	b	.L3
.L33:
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
	bx	r7
	cmp	r0, #0
	ldrne	r3, [r9]
	subne	r3, r3, #1
	strne	r8, [r4, #32]
	strne	r3, [r9]
	strne	r8, [r5, #36]
	b	.L19
.L32:
	ldr	r2, .L34+12
	ldrh	r2, [r2, #48]
	tst	r2, #16
	addeq	r1, r1, #1
	streq	r1, [r4, #4]
	b	.L16
.L31:
	ldr	r2, [r4, #24]
	ldr	r3, [r5, #4]
	add	r2, r1, r2
	sub	r2, r2, #1
	cmp	r3, r2
	ldr	ip, [r5, #20]
	beq	.L14
	ldr	r2, [r5, #28]
	add	r2, r3, r2
	sub	r2, r2, #1
	cmp	r1, r2
	beq	.L14
	ldr	r2, [r5, #16]
	rsb	r0, r2, #0
	str	r0, [r5, #16]
	b	.L16
.L30:
	ldr	ip, [r5, #20]
	cmp	ip, #0
	bge	.L7
.L11:
	rsb	ip, ip, #0
	str	ip, [r5, #20]
	b	.L7
.L28:
	ldr	ip, [r5, #16]
	rsb	ip, ip, #0
	str	ip, [r5, #16]
	b	.L7
.L14:
	ldr	r2, [r5, #16]
	rsb	ip, ip, #0
	rsb	r0, r2, #0
	str	ip, [r5, #20]
	str	r0, [r5, #16]
	b	.L16
.L29:
	ldr	ip, [r5, #20]
	cmp	ip, #0
	bgt	.L11
	b	.L10
.L35:
	.align	2
.L34:
	.word	losing
	.word	player
	.word	collision
	.word	67109120
	.word	bullets
	.word	ballsRemaining
	.size	updateBall.part.1, .-updateBall.part.1
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
	push	{r4, lr}
	mov	r0, #130
	mov	r4, #1
	mov	lr, #2
	mov	r1, #113
	mov	r2, #20
	mov	ip, #0
	ldr	r3, .L38
	str	r4, [r3, #16]
	str	lr, [r3, #20]
	str	r0, [r3]
	str	r0, [r3, #8]
	strh	ip, [r3, #28]	@ movhi
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #32]
	pop	{r4, lr}
	bx	lr
.L39:
	.align	2
.L38:
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
	push	{r4, r5, lr}
	ldr	r4, .L42
	ldr	ip, .L42+4
	sub	sp, sp, #12
	add	r2, r4, #20
	add	r0, r4, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L42+8
	str	ip, [sp]
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
.L43:
	.align	2
.L42:
	.word	player
	.word	6790
	.word	drawBox
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
	ldr	ip, .L48
	ldr	r3, .L48+4
	ldm	ip, {r4, lr}
	add	ip, r3, #200
.L45:
	str	r6, [r3, #20]
	str	r0, [r3, #24]
	str	r1, [r3, #16]
	strh	r5, [r3, #28]	@ movhi
	str	r2, [r3, #32]
	str	r0, [r3, #36]
	stm	r3, {r1, r2, r4, lr}
	add	r3, r3, #40
	cmp	r3, ip
	bne	.L45
	pop	{r4, r5, r6, lr}
	bx	lr
.L49:
	.align	2
.L48:
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
	ldr	r0, .L61
	mov	r2, r0
	ldr	r1, [r2, #32]
	cmp	r1, #0
	mov	r3, #0
	beq	.L60
.L51:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #40
	bxeq	lr
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L51
.L60:
	push	{r4, r5, r6, lr}
	mov	r4, #1
	ldr	r5, .L61+4
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
.L62:
	.align	2
.L61:
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
	ldr	r3, .L70
	ldrh	r3, [r3]
	push	{r4, lr}
	ldr	r4, .L70+4
	tst	r3, #1
	ldr	r3, [r4, #32]
	beq	.L69
	ldr	r2, .L70+8
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L66
.L69:
	add	r3, r3, #1
.L65:
	str	r3, [r4, #32]
	pop	{r4, lr}
	bx	lr
.L66:
	cmp	r3, #19
	ble	.L69
	bl	fireBullet
	mov	r3, #1
	b	.L65
.L71:
	.align	2
.L70:
	.word	oldButtons
	.word	player
	.word	buttons
	.size	updatePlayer, .-updatePlayer
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
	ldr	r3, .L90
	add	r0, r3, #200
.L75:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L73
	ldr	r1, [r3]
	ldr	r2, [r3, #20]
	add	r2, r1, r2
	cmp	r2, #0
	ldrgt	r2, [r3, #16]
	addgt	r1, r2, r1
	strgt	r1, [r3]
	strle	ip, [r3, #32]
.L73:
	add	r3, r3, #40
	cmp	r3, r0
	bne	.L75
	ldr	r4, .L90+4
	ldr	r3, [r4, #36]
	cmp	r3, #0
	movne	r0, r4
	blne	updateBall.part.1
.L76:
	ldr	r3, [r4, #80]
	cmp	r3, #0
	ldrne	r0, .L90+8
	blne	updateBall.part.1
.L77:
	ldr	r3, [r4, #124]
	cmp	r3, #0
	ldrne	r0, .L90+12
	popne	{r4, lr}
	bne	updateBall.part.1
.L72:
	pop	{r4, lr}
	bx	lr
.L91:
	.align	2
.L90:
	.word	bullets
	.word	balls
	.word	balls+44
	.word	balls+88
	.size	updateGame, .-updateGame
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
	bne	.L102
	ldr	r3, [r0, #36]
	cmp	r3, #0
	beq	.L103
.L100:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L103:
	ldr	r2, .L104
	ldr	r3, [r0, #24]
	str	r2, [sp]
	add	r0, r0, #8
	ldr	r2, [r0, #12]
	ldr	r5, .L104+4
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #36]
	b	.L100
.L102:
	ldr	r2, .L104
	ldr	r3, [r0, #24]
	str	r2, [sp]
	add	r0, r0, #8
	ldr	r2, [r0, #12]
	ldr	r5, .L104+4
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
	b	.L100
.L105:
	.align	2
.L104:
	.word	6790
	.word	drawBox
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
	mov	r10, #7
	mov	r8, #15
	ldr	r4, .L110
	ldr	r7, .L110+4
	ldr	r9, .L110+8
	ldr	r6, .L110+12
	add	r5, r4, #132
.L107:
	str	r10, [r4, #24]
	str	r10, [r4, #28]
	str	r8, [r4]
	mov	lr, pc
	bx	r7
	mov	r2, #1
	mvn	ip, #32768
	mov	r1, #0
	smull	r3, lr, r6, r0
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
	cmp	r4, r5
	bne	.L107
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L111:
	.align	2
.L110:
	.word	balls
	.word	rand
	.word	player
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
	mov	fp, #1
	mov	r10, #2
	mov	r8, #0
	mov	r3, #113
	mov	r9, #20
	mov	r6, r7
	mov	r1, fp
	mov	lr, r10
	mov	r4, r8
	mvn	r2, #1
	mvn	ip, #32768
	ldr	r0, .L116
	mov	r5, r3
	stmib	r0, {r3, r7}
	str	r3, [r0, #12]
	ldr	r3, .L116+4
	str	r7, [r0]
	str	fp, [r0, #16]
	str	r10, [r0, #20]
	str	r9, [r0, #24]
	str	r9, [r0, #32]
	strh	r8, [r0, #28]	@ movhi
	add	r0, r3, #200
.L113:
	str	lr, [r3, #20]
	str	r1, [r3, #24]
	str	r5, [r3, #12]
	str	r2, [r3, #16]
	strh	ip, [r3, #28]	@ movhi
	str	r4, [r3, #32]
	str	r1, [r3, #36]
	stm	r3, {r2, r4, r6}
	add	r3, r3, #40
	cmp	r3, r0
	bne	.L113
	bl	initBalls
	mov	ip, #3
	ldr	r3, .L116+8
	ldr	r0, .L116+12
	ldr	r2, .L116+16
	ldr	r1, .L116+20
	str	r4, [r3]
	str	ip, [r0]
	strh	r1, [r2]	@ movhi
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L117:
	.align	2
.L116:
	.word	player
	.word	bullets
	.word	losing
	.word	ballsRemaining
	.word	bgColor
	.word	6790
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
	@ link register save eliminated.
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bxeq	lr
	b	updateBall.part.1
	.size	updateBall, .-updateBall
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
	push	{r4, r5, r6, r7, lr}
	ldr	r3, [r0, #36]
	cmp	r3, #0
	sub	sp, sp, #12
	mov	r4, r0
	bne	.L124
	ldr	r3, [r0, #40]
	cmp	r3, #0
	beq	.L125
.L122:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L125:
	ldr	r2, .L126
	ldr	r3, [r0, #28]
	str	r2, [sp]
	add	r0, r0, #8
	ldr	r2, [r0, #16]
	ldr	r5, .L126+4
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #40]
	b	.L122
.L124:
	ldr	r5, .L126+8
	ldrh	r2, [r5]
	ldr	r3, [r0, #28]
	str	r2, [sp]
	add	r0, r0, #8
	ldr	r2, [r0, #16]
	ldr	r6, .L126+4
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r6
	ldr	r2, .L126+12
	ldr	r3, [r4, #28]
	str	r2, [sp]
	ldr	r2, [r4, #24]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r6
	mov	r7, #0
	mov	r3, #2
	ldm	r4, {r0, r1}
	mov	r2, r3
	str	r7, [sp]
	add	r1, r1, #4
	add	r0, r0, #1
	mov	lr, pc
	bx	r6
	ldr	r0, [r4]
	str	r7, [sp]
	add	r0, r0, #3
	ldr	r1, [r4, #4]
	mov	r3, #1
	mov	r2, #2
	mov	lr, pc
	bx	r6
	ldm	r4, {r0, r1}
	mov	r3, #2
	str	r7, [sp]
	add	r1, r1, #3
	add	r0, r0, #6
	mov	r2, #1
	mov	lr, pc
	bx	r6
	ldr	r6, .L126+16
	ldm	r4, {r0, r1}
	ldrh	r2, [r5]
	mov	lr, pc
	bx	r6
	ldr	r3, [r4, #28]
	ldr	r1, [r4, #4]
	add	r1, r1, r3
	ldrh	r2, [r5]
	ldr	r0, [r4]
	sub	r1, r1, #1
	mov	lr, pc
	bx	r6
	ldr	r3, [r4, #24]
	ldr	r0, [r4]
	add	r0, r0, r3
	ldrh	r2, [r5]
	ldr	r1, [r4, #4]
	sub	r0, r0, #1
	mov	lr, pc
	bx	r6
	ldr	r2, [r4, #28]
	ldr	r1, [r4, #4]
	ldr	r0, [r4]
	ldr	r3, [r4, #24]
	add	r1, r1, r2
	add	r0, r0, r3
	ldrh	r2, [r5]
	sub	r1, r1, #1
	sub	r0, r0, #1
	mov	lr, pc
	bx	r6
	b	.L122
.L127:
	.align	2
.L126:
	.word	6790
	.word	drawBox
	.word	bgColor
	.word	32767
	.word	setPixel
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
	ldr	r4, .L130
	bl	drawPlayer
	mov	r0, r4
	bl	drawBullet
	add	r0, r4, #40
	bl	drawBullet
	add	r0, r4, #80
	ldr	r5, .L130+4
	bl	drawBullet
	add	r0, r4, #120
	bl	drawBullet
	add	r0, r4, #160
	bl	drawBullet
	mov	r0, r5
	bl	drawBall
	add	r0, r5, #44
	bl	drawBall
	add	r0, r5, #88
	pop	{r4, r5, r6, lr}
	b	drawBall
.L131:
	.align	2
.L130:
	.word	bullets
	.word	balls
	.size	drawGame, .-drawGame
	.comm	losing,4,4
	.comm	ballsRemaining,4,4
	.comm	bgColor,2,2
	.comm	balls,132,4
	.comm	bullets,200,4
	.comm	player,36,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
