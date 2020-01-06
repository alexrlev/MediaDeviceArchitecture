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
	.global	initGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r6, #96
	mov	r5, #9
	mov	r2, #0
	mov	r0, #16
	mov	r4, #168
	mov	lr, #121
	mov	r1, #1
	mov	ip, #3
	ldr	r3, .L4
	str	r6, [r3]
	ldr	r3, .L4+4
	str	r5, [r3]
	ldr	r3, .L4+8
	str	r4, [r3, #8]
	str	lr, [r3, #12]
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	ip, [r3, #48]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r2, [r3, #36]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	vOff
	.word	hOff
	.word	pikachu
	.size	initGame, .-initGame
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
	ldr	r1, .L8
	ldr	r3, [r1, #4]
	ldr	ip, [r1, #44]
	ldr	r2, [r1, #36]
	lsl	r3, r3, #23
	push	{r4, lr}
	ldrb	r0, [r1]	@ zero_extendqisi2
	ldr	r4, .L8+4
	add	r2, r2, ip, lsl #5
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	lsl	r2, r2, #1
	strh	r3, [r4, #2]	@ movhi
	strh	r0, [r4]	@ movhi
	strh	r2, [r4, #4]	@ movhi
	ldr	r1, .L8+8
	mov	lr, pc
	bx	r1
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r4, .L8+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L8+16
	ldrh	r1, [r2]
	ldr	r2, .L8+20
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L9:
	.align	2
.L8:
	.word	pikachu
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.word	hOff
	.word	vOff
	.size	drawGame, .-drawGame
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
	mov	r2, #0
	mov	lr, #16
	mov	r4, #3
	mov	ip, #1
	ldr	r1, .L12
	ldr	r3, .L12+4
	ldr	r0, [r1]
	ldr	r1, [r3]
	ldr	r3, .L12+8
	add	r0, r0, #72
	add	r1, r1, #112
	str	r4, [r3, #48]
	str	lr, [r3, #24]
	str	lr, [r3, #28]
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r2, [r3, #36]
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	vOff
	.word	hOff
	.word	pikachu
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
	ldr	r4, .L27
	ldr	r3, .L27+4
	ldr	r5, [r4, #32]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #36]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #40]
	str	r1, [r4, #36]
	bne	.L15
	ldr	r0, [r4, #44]
	ldr	r3, .L27+8
	add	r0, r0, #1
	ldr	r1, [r4, #48]
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L15:
	ldr	r3, .L27+12
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #36]
	ldr	r3, .L27+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	streq	r3, [r4, #36]
	ldr	r3, .L27+12
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L18
	mov	r2, #3
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #36]
	bne	.L20
.L21:
	mov	r3, #2
	str	r3, [r4, #36]
.L20:
	add	r5, r5, #1
	str	r5, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L18:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L21
	ldr	r3, [r4, #36]
	cmp	r3, #4
	bne	.L20
	mov	r3, #0
	str	r6, [r4, #36]
	str	r3, [r4, #44]
	str	r3, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	pikachu
	.word	1717986919
	.word	__aeabi_idivmod
	.word	67109120
	.size	animatePlayer, .-animatePlayer
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
	ldr	r3, .L64
	ldrh	r2, [r3, #48]
	ldr	r3, .L64+4
	push	{r4, r5, r6, r7, r8, lr}
	ldr	lr, .L64+8
	tst	r2, #64
	add	r1, r3, #8
	ldm	r1, {r1, r2}
	ldr	ip, [lr]
	bne	.L30
	cmp	r1, #0
	ble	.L30
	ldr	r5, [r3, #16]
	sub	r5, r1, r5
	lsl	r7, r5, #8
	add	r4, r7, r2
	ldr	r6, .L64+12
	lsl	r4, r4, #1
	ldrh	r0, [r6, r4]
	cmp	r0, #0
	beq	.L30
	ldr	r0, [r3, #24]
	ldr	r4, [r3, #20]
	add	r0, r2, r0
	sub	r0, r0, r4
	add	r0, r0, r7
	lsl	r0, r0, #1
	ldrh	r0, [r6, r0]
	cmp	r0, #0
	beq	.L30
	cmp	ip, #0
	str	r5, [r3, #8]
	ble	.L35
	ldr	r1, [r3]
	cmp	r1, #79
	bgt	.L35
	mov	r1, r5
	sub	ip, ip, #1
	str	ip, [lr]
.L30:
	ldr	r0, .L64
	ldrh	r0, [r0, #48]
	tst	r0, #128
	bne	.L31
	ldr	r0, [r3, #28]
	add	r0, r1, r0
	cmp	r0, #255
	ble	.L63
.L31:
	ldr	r0, .L64
	ldrh	r0, [r0, #48]
	ldr	r4, .L64+16
	tst	r0, #32
	ldr	lr, [r4]
	bne	.L32
	cmp	r2, #0
	ble	.L32
	ldr	r5, [r3, #20]
	sub	r5, r2, r5
	add	r0, r5, r1, lsl #8
	ldr	r6, .L64+12
	lsl	r0, r0, #1
	ldrh	r0, [r6, r0]
	cmp	r0, #0
	beq	.L32
	ldr	r7, [r3, #28]
	ldr	r8, [r3, #16]
	ldr	r0, [r3, #24]
	add	r7, r1, r7
	sub	r7, r7, r8
	add	r0, r2, r0
	add	r0, r0, r7, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r6, r0]
	cmp	r0, #0
	beq	.L32
	cmp	lr, #0
	str	r5, [r3, #12]
	ble	.L37
	ldr	r2, [r3, #4]
	cmp	r2, #119
	bgt	.L37
	mov	r2, r5
	sub	lr, lr, #1
	str	lr, [r4]
.L32:
	ldr	r0, .L64
	ldrh	r0, [r0, #48]
	tst	r0, #16
	bne	.L33
	ldr	r0, [r3, #24]
	add	r0, r2, r0
	cmp	r0, #255
	bgt	.L33
	add	r5, r0, r1, lsl #8
	ldr	r6, .L64+12
	lsl	r5, r5, #1
	ldrh	r5, [r6, r5]
	cmp	r5, #0
	beq	.L33
	ldr	r5, [r3, #28]
	ldr	r7, [r3, #16]
	add	r5, r1, r5
	sub	r5, r5, r7
	add	r0, r0, r5, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r6, r0]
	cmp	r0, #0
	beq	.L33
	ldr	r0, [r3, #20]
	cmp	lr, #15
	add	r2, r2, r0
	str	r2, [r3, #12]
	bgt	.L33
	ldr	r0, [r3, #4]
	cmp	r0, #120
	addgt	lr, lr, #1
	strgt	lr, [r4]
.L33:
	sub	r2, r2, lr
	sub	r1, r1, ip
	pop	{r4, r5, r6, r7, r8, lr}
	stm	r3, {r1, r2}
	b	animatePlayer
.L63:
	lsl	r0, r0, #8
	add	r4, r0, r2
	ldr	r5, .L64+12
	lsl	r4, r4, #1
	ldrh	r4, [r5, r4]
	cmp	r4, #0
	beq	.L31
	ldr	r4, [r3, #24]
	ldr	r6, [r3, #20]
	add	r4, r2, r4
	sub	r4, r4, r6
	add	r0, r4, r0
	lsl	r0, r0, #1
	ldrh	r0, [r5, r0]
	cmp	r0, #0
	beq	.L31
	ldr	r0, [r3, #16]
	cmp	ip, #95
	add	r1, r1, r0
	str	r1, [r3, #8]
	bgt	.L31
	ldr	r0, [r3]
	cmp	r0, #80
	addgt	ip, ip, #1
	strgt	ip, [lr]
	b	.L31
.L35:
	mov	r1, r5
	b	.L30
.L37:
	mov	r2, r5
	b	.L32
.L65:
	.align	2
.L64:
	.word	67109120
	.word	pikachu
	.word	vOff
	.word	collisionmapBitmap
	.word	hOff
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
	@ link register save eliminated.
	b	updatePlayer
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
	@ link register save eliminated.
	ldr	r1, .L68
	ldr	r3, [r1, #4]
	ldr	ip, [r1, #44]
	ldr	r2, [r1, #36]
	lsl	r3, r3, #23
	ldr	r0, .L68+4
	lsr	r3, r3, #23
	ldrb	r1, [r1]	@ zero_extendqisi2
	add	r2, r2, ip, lsl #5
	orr	r3, r3, #16384
	lsl	r2, r2, #1
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	bx	lr
.L69:
	.align	2
.L68:
	.word	pikachu
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.comm	pikachu,56,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
