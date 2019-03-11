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
	cmp	r0, #0
	sub	sp, sp, #20
	ldr	r2, [r5, #16]
	ble	.L2
	add	r3, r0, r2
	cmp	r3, #159
	bgt	.L2
.L3:
	ldr	r1, [r5, #4]
	cmp	r1, #0
	ldr	r3, [r5, #20]
	ble	.L4
	add	ip, r1, r3
	cmp	ip, #239
	bgt	.L4
.L5:
	cmp	r1, #88
	bgt	.L6
	add	ip, r0, r2
	cmp	ip, #150
	mvngt	ip, #0
	strgt	ip, [r5, #8]
.L6:
	ldr	ip, .L24
	add	r4, ip, #12
	ldm	r4, {r4, lr}
	str	lr, [sp, #12]
	ldm	ip, {ip, lr}
	ldr	r7, .L24+4
	str	r4, [sp, #8]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #1
	mvneq	r3, #0
	ldr	r4, .L24+8
	streq	r3, [r5, #8]
	ldr	r0, [r4, #16]
	ldr	r1, [r4, #12]
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
	bx	r7
	cmp	r0, #1
	beq	.L8
	ldr	r1, [r5, #4]
.L9:
	ldr	r0, [r5]
	ldr	r3, [r5, #16]
	add	r3, r0, r3
	cmp	r3, #158
	movgt	r2, #1
	ldrgt	r3, .L24+12
	ldr	r4, .L24+16
	strgt	r2, [r3]
	mov	r9, #0
	ldr	r8, .L24+20
	add	r6, r4, #224
	b	.L15
.L13:
	add	r4, r4, #28
	cmp	r6, r4
	beq	.L23
.L15:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L13
	ldr	r3, [r4, #20]
	ldr	r2, [r4, #4]
	ldr	ip, [r4, #16]
	str	r3, [sp, #12]
	ldr	r3, [r4]
	stmib	sp, {r2, ip}
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldrne	r2, [r5, #8]
	ldrne	r3, [r8]
	rsbne	r2, r2, #0
	strne	r2, [r5, #8]
	subne	r3, r3, #1
	strne	r9, [r4, #24]
	add	r4, r4, #28
	strne	r3, [r8]
	cmp	r6, r4
	ldm	r5, {r0, r1}
	bne	.L15
.L23:
	add	r2, r5, #8
	ldm	r2, {r2, r3}
	add	r0, r2, r0
	add	r1, r3, r1
	stm	r5, {r0, r1}
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L4:
	ldr	ip, [r5, #12]
	rsb	ip, ip, #0
	str	ip, [r5, #12]
	b	.L5
.L2:
	ldr	r3, [r5, #8]
	rsb	r3, r3, #0
	str	r3, [r5, #8]
	b	.L3
.L8:
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #16]
	ldr	r1, [r5, #4]
	add	r3, r2, r3
	sub	r3, r3, #1
	cmp	r1, r3
	beq	.L10
	ldr	r3, [r5, #20]
	add	r3, r1, r3
	sub	r3, r3, #1
	cmp	r2, r3
	ldrne	r3, [r5, #8]
	rsbne	r3, r3, #0
	strne	r3, [r5, #8]
	bne	.L9
.L10:
	ldr	r3, [r5, #12]
	rsb	r3, r3, #0
	str	r3, [r5, #12]
	ldr	r3, [r5, #8]
	rsb	r3, r3, #0
	str	r3, [r5, #8]
	b	.L9
.L25:
	.align	2
.L24:
	.word	player1
	.word	collision
	.word	player2
	.word	losing
	.word	blocks
	.word	blocksRemaining
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
	mov	r3, #251
	push	{r4, r5, r6, lr}
	mov	ip, #1
	mov	lr, #146
	mov	r6, #120
	mov	r5, #60
	mov	r4, #253
	mov	r0, #2
	mov	r1, #27
	ldr	r2, .L28
	strh	r3, [r2, #20]	@ movhi
	ldr	r3, .L28+4
	str	lr, [r2]
	str	r6, [r2, #4]
	str	lr, [r3]
	str	r5, [r3, #4]
	strh	r4, [r3, #20]	@ movhi
	str	ip, [r2, #8]
	str	ip, [r3, #8]
	str	r0, [r2, #12]
	str	r0, [r3, #12]
	str	r1, [r2, #16]
	str	r1, [r3, #16]
	pop	{r4, r5, r6, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	player1
	.word	player2
	.size	initPlayer, .-initPlayer
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
	@ link register save eliminated.
	ldr	r3, .L36
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L31
	ldr	r2, .L36+4
	ldr	r3, [r2, #4]
	cmp	r3, #0
	ble	.L31
	ldr	r1, [r2, #8]
	sub	r3, r3, r1
	str	r3, [r2, #4]
.L32:
	ldr	r3, .L36
	ldrh	r3, [r3, #48]
	tst	r3, #2
	bne	.L33
.L35:
	ldr	r2, .L36+8
	ldr	r3, [r2, #4]
	cmp	r3, #0
	ble	.L33
	ldr	r1, [r2, #8]
	sub	r3, r3, r1
	str	r3, [r2, #4]
	bx	lr
.L31:
	ldr	r3, .L36
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L32
	ldr	r3, .L36+4
	ldr	r1, [r3, #4]
	ldr	r0, [r3, #8]
	ldr	r2, [r3, #16]
	rsb	ip, r0, #240
	add	r2, r1, r2
	cmp	r2, ip
	addle	r1, r1, r0
	strle	r1, [r3, #4]
	ldr	r3, .L36
	ldrh	r3, [r3, #48]
	tst	r3, #2
	beq	.L35
.L33:
	ldr	r3, .L36
	ldrh	r3, [r3, #48]
	tst	r3, #1
	bxne	lr
	ldr	r3, .L36+8
	ldr	r1, [r3, #4]
	ldr	r0, [r3, #8]
	ldr	r2, [r3, #16]
	rsb	ip, r0, #240
	add	r2, r1, r2
	cmp	r2, ip
	addle	r1, r1, r0
	strle	r1, [r3, #4]
	bx	lr
.L37:
	.align	2
.L36:
	.word	67109120
	.word	player1
	.word	player2
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
	ldr	r4, .L49
	bl	updatePlayer
	ldr	r3, [r4, #28]
	cmp	r3, #0
	movne	r0, r4
	blne	updateBall.part.1
.L39:
	ldr	r3, [r4, #60]
	cmp	r3, #0
	ldrne	r0, .L49+4
	blne	updateBall.part.1
.L40:
	ldr	r3, [r4, #92]
	cmp	r3, #0
	ldrne	r0, .L49+8
	popne	{r4, lr}
	bne	updateBall.part.1
.L38:
	pop	{r4, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	balls
	.word	balls+32
	.word	balls+64
	.size	updateGame, .-updateGame
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
	ldr	r0, .L53
	ldrb	r2, [r0, #20]	@ zero_extendqisi2
	sub	sp, sp, #8
	ldr	r3, [r0, #16]
	str	r2, [sp]
	ldr	r4, .L53+4
	ldr	r2, [r0, #12]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r4
	ldr	r0, .L53+8
	ldrb	r2, [r0, #20]	@ zero_extendqisi2
	ldr	r3, [r0, #16]
	str	r2, [sp]
	ldr	r2, [r0, #12]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	player1
	.word	drawRect4
	.word	player2
	.size	drawPlayer, .-drawPlayer
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
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L71
	sub	sp, sp, #12
	mov	r0, #252
	ldr	r3, .L71+4
	mov	lr, pc
	bx	r3
	ldr	r7, .L71+8
	bl	drawPlayer
	ldr	r6, .L71+12
	add	r5, r4, #224
	b	.L57
.L56:
	add	r4, r4, #28
	cmp	r4, r5
	beq	.L69
.L57:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L56
	str	r7, [sp]
	add	r2, r4, #16
	ldm	r4, {r0, r1}
	ldm	r2, {r2, r3}
	add	r4, r4, #28
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L57
.L69:
	ldr	r4, .L71+16
	ldr	r6, .L71+20
	add	r5, r4, #96
.L59:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L70
.L58:
	add	r4, r4, #32
	cmp	r4, r5
	bne	.L59
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L70:
	ldrb	r2, [r4, #24]	@ zero_extendqisi2
	ldr	r3, [r4, #20]
	str	r2, [sp]
	ldr	r2, [r4, #16]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r6
	b	.L58
.L72:
	.align	2
.L71:
	.word	blocks
	.word	fillScreen4
	.word	brickBitmap
	.word	drawImage4
	.word	balls
	.word	drawRect4
	.size	drawGame, .-drawGame
	.align	2
	.global	initBlocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBlocks, %function
initBlocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, #9
	ldr	r8, .L77
	ldr	r4, .L77+4
	ldr	r7, .L77+8
	ldr	r6, .L77+12
	add	r5, r8, #224
.L74:
	str	r9, [r8, #16]
	str	r9, [r8, #20]
	mov	lr, pc
	bx	r4
	smull	r3, r2, r7, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #1
	add	r3, r3, #2
	str	r3, [r8]
	mov	lr, pc
	bx	r4
	mov	r2, #1
	smull	r3, r1, r6, r0
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr #3
	rsb	r1, r3, r3, lsl #3
	rsb	r3, r3, r1, lsl #3
	sub	r3, r0, r3, lsl #2
	str	r3, [r8, #4]
	str	r2, [r8, #24]
	add	r8, r8, #28
	cmp	r8, r5
	bne	.L74
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L78:
	.align	2
.L77:
	.word	blocks
	.word	rand
	.word	1374389535
	.word	156180629
	.size	initBlocks, .-initBlocks
	.align	2
	.global	drawBlock
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBlock, %function
drawBlock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	push	{r4, lr}
	ldr	r2, .L88
	sub	sp, sp, #8
	ldr	r3, [r0, #20]
	str	r2, [sp]
	ldr	r4, .L88+4
	ldr	r2, [r0, #16]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L89:
	.align	2
.L88:
	.word	brickBitmap
	.word	drawImage4
	.size	drawBlock, .-drawBlock
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
	mov	r9, #7
	mov	r8, #120
	ldr	r4, .L94
	ldr	r7, .L94+4
	ldr	r6, .L94+8
	add	r5, r4, #96
.L91:
	str	r9, [r4, #16]
	str	r9, [r4, #20]
	str	r8, [r4]
	mov	lr, pc
	bx	r7
	mov	r2, #1
	mvn	ip, #0
	mov	r1, #255
	smull	r3, lr, r6, r0
	asr	r3, r0, #31
	rsb	r3, r3, lr, asr #6
	add	r3, r3, r3, lsl #6
	sub	r0, r0, r3, lsl r2
	add	r0, r0, #10
	str	r2, [r4, #12]
	str	r2, [r4, #28]
	strh	r1, [r4, #24]	@ movhi
	stmib	r4, {r0, ip}
	add	r4, r4, #32
	cmp	r4, r5
	bne	.L91
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L95:
	.align	2
.L94:
	.word	balls
	.word	rand
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
	mov	r3, #251
	push	{r4, r5, r6, lr}
	mov	ip, #1
	mov	lr, #146
	mov	r0, #2
	mov	r1, #27
	mov	r6, #120
	mov	r5, #60
	mov	r4, #253
	ldr	r2, .L98
	strh	r3, [r2, #20]	@ movhi
	ldr	r3, .L98+4
	str	lr, [r2]
	str	r6, [r2, #4]
	str	ip, [r2, #8]
	str	lr, [r3]
	str	r5, [r3, #4]
	strh	r4, [r3, #20]	@ movhi
	str	ip, [r3, #8]
	str	r0, [r2, #12]
	str	r0, [r3, #12]
	str	r1, [r2, #16]
	str	r1, [r3, #16]
	bl	initBlocks
	bl	initBalls
	mov	lr, #8
	ldr	ip, .L98+8
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L98+12
	mov	r0, #3
	ldr	r4, .L98+16
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r2, #0
	mov	lr, #31
	mvn	ip, #32768
	mvn	r0, #64512
	ldr	r3, .L98+20
	ldr	r1, .L98+24
	strh	r1, [r3, #248]	@ movhi
	ldr	r1, .L98+28
	strh	lr, [r3, #250]	@ movhi
	strh	r2, [r3, #246]	@ movhi
	strh	ip, [r3, #252]	@ movhi
	strh	r0, [r3, #254]	@ movhi
	pop	{r4, r5, r6, lr}
	str	r2, [r1]
	bx	lr
.L99:
	.align	2
.L98:
	.word	player1
	.word	player2
	.word	blocksRemaining
	.word	brickPal
	.word	DMANow
	.word	83886336
	.word	18578
	.word	losing
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
	ldr	r3, [r0, #28]
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
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	push	{r4, lr}
	ldrb	r2, [r0, #24]	@ zero_extendqisi2
	sub	sp, sp, #8
	ldr	r3, [r0, #20]
	str	r2, [sp]
	ldr	r4, .L111
	ldr	r2, [r0, #16]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L112:
	.align	2
.L111:
	.word	drawRect4
	.size	drawBall, .-drawBall
	.comm	losing,4,4
	.comm	blocksRemaining,4,4
	.comm	balls,96,4
	.comm	blocks,224,4
	.comm	player2,24,4
	.comm	player1,24,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
