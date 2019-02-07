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
	.global	drawBackground
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBackground, %function
drawBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L8
	push	{r4, r5, r6, lr}
	ldr	r3, .L8+4
	ldrh	r0, [r2]
	mov	lr, pc
	bx	r3
	mov	r4, #139
	ldr	r6, .L8+8
	ldr	r5, .L8+12
.L2:
	mov	r0, r4
	mov	r3, r5
	mov	r2, #100
	mov	r1, #70
	add	r4, r4, #7
	mov	lr, pc
	bx	r6
	cmp	r4, #167
	bne	.L2
	mov	r4, #80
	ldr	r5, .L8+16
	ldr	r6, .L8+12
.L3:
	mov	r1, r4
	mov	r3, r6
	mov	r2, #21
	mov	r0, #139
	add	r4, r4, #10
	mov	lr, pc
	bx	r5
	cmp	r4, #170
	bne	.L3
	mov	r3, #31
	mov	r2, #21
	mov	r1, #70
	mov	r0, #139
	mov	lr, pc
	bx	r5
	mov	r1, r4
	mov	r3, #31
	mov	r2, #21
	mov	r0, #139
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	bgColor
	.word	fillScreen
	.word	drawHorizontalLine
	.word	32767
	.word	drawVerticalLine
	.size	drawBackground, .-drawBackground
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	ldr	r1, .L12
	push	{r4, lr}
	ldr	r2, .L12+4
	strh	r3, [r1]	@ movhi
	ldr	lr, .L12+8
	ldrh	ip, [r2, #48]
	ldr	r0, .L12+12
	ldr	r2, .L12+16
	ldr	r1, .L12+20
	strb	r3, [lr]
	strh	ip, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	bl	drawBackground
	mov	r3, #20
	mov	ip, #1
	mov	r0, #7
	mov	r1, #130
	mov	r2, #113
	mov	lr, #2
	ldr	r4, .L12+24
	str	r3, [r4]
	ldr	r4, .L12+28
	str	r3, [r4]
	ldr	r4, .L12+32
	str	r3, [r4]
	ldr	r4, .L12+36
	str	r3, [r4]
	ldr	r4, .L12+40
	str	r3, [r4]
	ldr	r3, .L12+44
	str	ip, [r3]
	ldr	r3, .L12+48
	str	ip, [r3]
	ldr	r3, .L12+52
	ldr	ip, .L12+56
	str	r0, [r3]
	ldr	r3, .L12+60
	str	r0, [ip]
	ldr	r4, .L12+64
	str	r1, [r3]
	ldr	ip, .L12+68
	ldr	r0, .L12+72
	ldr	r3, .L12+76
	str	r1, [r4]
	str	lr, [r3]
	str	r2, [ip]
	str	r2, [r0]
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	oldButtons
	.word	67109120
	.word	state
	.word	buttons
	.word	bgColor
	.word	6790
	.word	bRow
	.word	bCol
	.word	bOldRow
	.word	bOldCol
	.word	pWidth
	.word	bRVel
	.word	bCVel
	.word	bWidth
	.word	bHeight
	.word	pOldRow
	.word	pRow
	.word	pCol
	.word	pOldCol
	.word	pHeight
	.size	initialize, .-initialize
	.align	2
	.global	initializeGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeGame, %function
initializeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #20
	push	{r4, lr}
	mov	r4, #0
	ldr	r3, .L16
	ldr	r2, .L16+4
	ldr	r1, [r3]
	ldr	r3, .L16+8
	str	r1, [r2]
	str	ip, [r3]
	ldr	r0, .L16+12
	ldr	r3, .L16+16
	ldr	r1, .L16+20
	ldr	r2, .L16+24
	str	r4, [r3]
	str	r4, [r0]
	str	r4, [r1]
	str	r4, [r2]
	bl	drawBackground
	ldr	r3, .L16+28
	strb	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	pCol
	.word	bCol
	.word	bRow
	.word	bOldRow
	.word	pOldCol
	.word	bOldCol
	.word	pOldRow
	.word	state
	.size	initializeGame, .-initializeGame
	.align	2
	.global	gameState
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameState, %function
gameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r10, .L46
	ldr	r7, .L46+4
	ldr	lr, [r10]
	ldr	r2, [r7]
	cmp	lr, #0
	sub	sp, sp, #16
	ldr	r4, .L46+8
	add	ip, lr, r2
	ble	.L19
	cmp	ip, #159
	bgt	.L19
.L20:
	ldr	r6, .L46+12
	ldr	r1, [r6]
	ldr	r9, .L46+16
	cmp	r1, #0
	ldr	r5, .L46+20
	ldr	r3, [r9]
	ble	.L21
	add	r0, r1, r3
	cmp	r0, #239
	ble	.L22
.L21:
	ldr	r0, [r5]
	rsb	r0, r0, #0
	str	r0, [r5]
.L22:
	cmp	ip, #138
	bgt	.L23
	ldr	r7, [r4]
	ldr	ip, [r5]
.L24:
	add	ip, r1, ip
	ldr	r1, .L46+24
	ldr	r8, .L46+28
	ldr	r1, [r1]
	ldr	r0, .L46+32
	ldr	r0, [r0]
	str	r1, [sp]
	ldr	r1, [r8]
	add	lr, lr, r7
	str	r0, [sp, #8]
	str	r1, [sp, #12]
	ldr	r7, .L46+36
	ldr	r1, [r7]
	mov	r0, lr
	str	r1, [sp, #4]
	str	lr, [r10]
	mov	r1, ip
	ldr	r10, .L46+40
	str	ip, [r6]
	mov	lr, pc
	bx	r10
	cmp	r0, #1
	beq	.L41
	ldr	r3, [r7]
	cmp	r3, #0
	ble	.L36
	ldr	r2, .L46+44
	ldrh	r2, [r2, #48]
	tst	r2, #32
	subeq	r3, r3, #1
	streq	r3, [r7]
.L36:
	ldr	r2, [r8]
	add	r2, r3, r2
	cmp	r2, #239
	bgt	.L18
	ldr	r2, .L46+44
	ldrh	r2, [r2, #48]
	tst	r2, #16
	addeq	r3, r3, #1
	streq	r3, [r7]
.L18:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L19:
	ldr	r3, [r4]
	rsb	r3, r3, #0
	str	r3, [r4]
	b	.L20
.L23:
	cmp	r1, #70
	ble	.L25
	add	r0, r1, r3
	cmp	r0, #169
	ble	.L42
	ldr	ip, [r5]
	ldr	r7, [r4]
.L37:
	sub	r0, r1, #167
	cmp	r0, #3
	bls	.L43
	add	r0, r1, r3
	cmp	r0, #70
	beq	.L44
.L30:
	cmp	r1, #171
	bne	.L24
	cmp	ip, #0
	bge	.L24
.L31:
	rsb	ip, ip, #0
	str	ip, [r5]
	b	.L24
.L41:
	ldr	r1, [r7]
	ldr	r3, [r8]
	ldr	r2, [r6]
	add	r3, r1, r3
	sub	r3, r3, #1
	cmp	r3, r2
	beq	.L33
	ldr	r3, [r9]
	add	r2, r2, r3
	sub	r2, r2, #1
	cmp	r1, r2
	beq	.L33
	ldr	r3, [r4]
	rsb	r3, r3, #0
	str	r3, [r4]
.L45:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L42:
	bl	drawBackground
	mov	r1, #1
	mov	ip, #0
	ldr	r3, .L46+48
	ldr	r0, .L46+52
	strb	r1, [r3]
	ldr	r2, [r7]
	strh	ip, [r0]	@ movhi
	ldr	r1, [r6]
	ldr	lr, [r10]
	ldr	r3, [r9]
.L25:
	sub	r0, r1, #65
	cmp	r0, #3
	ldr	ip, [r5]
	ldr	r7, [r4]
	bhi	.L37
.L27:
	rsb	r7, r7, #0
	str	r7, [r4]
	b	.L24
.L43:
	add	r0, lr, r2
	cmp	r0, #140
	beq	.L27
	add	r0, r1, r3
	cmp	r0, #70
	bne	.L24
	cmp	ip, #0
	bgt	.L31
	b	.L24
.L33:
	ldr	r3, [r5]
	rsb	r3, r3, #0
	str	r3, [r5]
	ldr	r3, [r4]
	rsb	r3, r3, #0
	str	r3, [r4]
	b	.L45
.L44:
	cmp	ip, #0
	bgt	.L31
	b	.L30
.L47:
	.align	2
.L46:
	.word	bRow
	.word	bHeight
	.word	bRVel
	.word	bCol
	.word	bWidth
	.word	bCVel
	.word	pRow
	.word	pWidth
	.word	pHeight
	.word	pCol
	.word	collision
	.word	67109120
	.word	state
	.word	textColor
	.size	gameState, .-gameState
	.align	2
	.global	gameDraw
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameDraw, %function
gameDraw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r10, #0
	ldr	r7, .L50
	ldrh	r3, [r7]
	sub	sp, sp, #12
	ldr	r9, .L50+4
	ldr	r8, .L50+8
	str	r3, [sp]
	ldr	ip, .L50+12
	ldr	r1, .L50+16
	ldr	r6, .L50+20
	ldr	r3, [r9]
	ldr	r2, [r8]
	ldr	r0, [ip]
	ldr	r1, [r1]
	mov	lr, pc
	bx	r6
	ldrh	r3, [r7]
	ldr	lr, .L50+24
	str	r3, [sp]
	ldr	r4, .L50+28
	ldr	r3, .L50+32
	ldr	r2, .L50+36
	ldr	r1, [lr]
	ldr	r3, [r3]
	ldr	r2, [r2]
	ldr	r0, [r4]
	mov	lr, pc
	bx	r6
	ldr	r4, .L50+40
	ldr	ip, .L50+44
	ldr	r5, .L50+48
	ldr	r1, [r4]
	ldr	r3, [r9]
	str	ip, [sp]
	ldr	r2, [r8]
	ldr	r0, [r5]
	mov	lr, pc
	bx	r6
	ldr	r3, .L50+32
	ldr	r2, .L50+36
	ldr	fp, .L50+52
	ldr	r3, [r3]
	ldr	r2, [r2]
	ldr	r1, .L50+56
	str	r10, [sp]
	ldr	r0, [fp]
	ldr	r1, [r1]
	mov	lr, pc
	bx	r6
	mov	r3, #2
	ldr	r1, [r4]
	ldr	r0, [r5]
	mov	r2, r3
	str	r10, [sp]
	add	r1, r1, #4
	add	r0, r0, #1
	mov	lr, pc
	bx	r6
	ldr	r0, [r5]
	str	r10, [sp]
	mov	r3, #1
	ldr	r1, [r4]
	mov	r2, #2
	add	r0, r0, #3
	mov	lr, pc
	bx	r6
	ldr	r1, [r4]
	ldr	r0, [r5]
	mov	r3, #2
	str	r10, [sp]
	add	r1, r1, #3
	mov	r2, #1
	add	r0, r0, #6
	mov	lr, pc
	bx	r6
	ldr	r6, .L50+60
	ldrh	r2, [r7]
	ldr	r1, [r4]
	ldr	r0, [r5]
	mov	lr, pc
	bx	r6
	ldr	r3, [r9]
	ldr	r1, [r4]
	add	r1, r1, r3
	ldrh	r2, [r7]
	ldr	r0, [r5]
	sub	r1, r1, #1
	mov	lr, pc
	bx	r6
	ldr	r3, [r8]
	ldr	r0, [r5]
	add	r0, r0, r3
	ldrh	r2, [r7]
	ldr	r1, [r4]
	sub	r0, r0, #1
	mov	lr, pc
	bx	r6
	ldr	r2, [r9]
	ldr	r3, [r8]
	ldr	r1, [r4]
	ldr	r0, [r5]
	add	r1, r1, r2
	add	r0, r0, r3
	ldrh	r2, [r7]
	sub	r1, r1, #1
	sub	r0, r0, #1
	mov	lr, pc
	bx	r6
	ldr	r0, [r5]
	ldr	ip, .L50+12
	ldr	r3, .L50+56
	ldr	r1, [r4]
	ldr	r2, [fp]
	ldr	r3, [r3]
	str	r0, [ip]
	ldr	r4, .L50+28
	ldr	r0, .L50+16
	ldr	lr, .L50+24
	str	r1, [r0]
	str	r2, [r4]
	str	r3, [lr]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L51:
	.align	2
.L50:
	.word	bgColor
	.word	bWidth
	.word	bHeight
	.word	bOldRow
	.word	bOldCol
	.word	drawBox
	.word	pOldCol
	.word	pOldRow
	.word	pWidth
	.word	pHeight
	.word	bCol
	.word	32767
	.word	bRow
	.word	pRow
	.word	pCol
	.word	setPixel
	.size	gameDraw, .-gameDraw
	.align	2
	.global	initializeLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeLose, %function
initializeLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	drawBackground
	mov	r0, #0
	mov	r2, #1
	ldr	r1, .L54
	ldr	r3, .L54+4
	strh	r0, [r1]	@ movhi
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	textColor
	.word	state
	.size	initializeLose, .-initializeLose
	.align	2
	.global	loseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	loseState, %function
loseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L61
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L61+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	initializeGame
.L62:
	.align	2
.L61:
	.word	oldButtons
	.word	buttons
	.size	loseState, .-loseState
	.align	2
	.global	loseDraw
	.syntax unified
	.arm
	.fpu softvfp
	.type	loseDraw, %function
loseDraw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L65
	sub	sp, sp, #8
	ldrh	r3, [r4]
	mov	r2, #8
	mov	r1, #23
	ldr	r5, .L65+4
	mov	r0, #55
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	mov	r2, #9
	mov	r1, #31
	ldr	r5, .L65+8
	mov	r0, #63
	mov	lr, pc
	bx	r5
	ldr	r5, .L65+12
	ldrh	r3, [r4]
	mov	r2, #17
	mov	r1, #31
	mov	r0, #64
	mov	lr, pc
	bx	r5
	mov	r3, #15
	ldrh	r1, [r4]
	ldr	r6, .L65+16
	mov	r2, r3
	str	r1, [sp]
	mov	r0, #65
	mov	r1, #40
	mov	lr, pc
	bx	r6
	mov	r3, #15
	ldrh	r2, [r4]
	ldr	r8, .L65+20
	str	r2, [sp]
	mov	r1, #60
	mov	r2, r3
	mov	r0, #65
	mov	lr, pc
	bx	r6
	ldr	r7, .L65+24
	ldrh	r3, [r8]
	mov	r2, #14
	mov	r1, #61
	mov	r0, #65
	mov	lr, pc
	bx	r7
	ldrh	r3, [r4]
	mov	r2, #26
	mov	r1, #95
	mov	r0, #55
	mov	lr, pc
	bx	r5
	mov	r3, #15
	ldrh	r1, [r4]
	mov	r2, r3
	str	r1, [sp]
	mov	r0, #65
	mov	r1, #100
	mov	lr, pc
	bx	r6
	ldrh	r3, [r4]
	mov	r2, #15
	mov	r1, #120
	mov	r0, #65
	mov	lr, pc
	bx	r7
	ldrh	r3, [r4]
	mov	r2, #7
	mov	r1, #120
	mov	r0, #65
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	mov	r2, #15
	mov	r1, #120
	mov	r0, #72
	mov	lr, pc
	bx	r7
	ldrh	r3, [r4]
	mov	r2, #8
	mov	r1, #134
	mov	r0, #72
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	mov	r2, #15
	mov	r1, #120
	mov	r0, #80
	mov	lr, pc
	bx	r7
	ldrh	r2, [r4]
	mov	r3, #15
	str	r2, [sp]
	mov	r1, #140
	mov	r2, #7
	mov	r0, #65
	mov	lr, pc
	bx	r6
	ldrh	r2, [r4]
	mov	r3, #15
	str	r2, [sp]
	mov	r1, #140
	mov	r2, #8
	mov	r0, #72
	mov	lr, pc
	bx	r6
	ldrh	r3, [r8]
	mov	r2, #7
	mov	r1, #155
	mov	r0, #73
	mov	lr, pc
	bx	r5
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	textColor
	.word	drawDiagonalDownLine
	.word	drawDiagonalUpLine
	.word	drawVerticalLine
	.word	drawRectangle
	.word	bgColor
	.word	drawHorizontalLine
	.size	loseDraw, .-loseDraw
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0
	ldr	r1, .L80
	ldr	r6, .L80+4
	push	{r4, r7, fp, lr}
	strh	r1, [r3]	@ movhi
	ldr	r3, .L80+8
	strb	r2, [r6]
	mov	lr, pc
	bx	r3
	ldr	fp, .L80+12
	ldr	r8, .L80+16
	ldr	r10, .L80+20
	ldr	r5, .L80+24
	ldr	r7, .L80+28
	ldr	r9, .L80+32
	ldr	r4, .L80+36
.L68:
	ldrb	r3, [r6]	@ zero_extendqisi2
.L71:
	cmp	r3, #0
	beq	.L69
.L79:
	cmp	r3, #1
	bne	.L71
	mov	lr, pc
	bx	r9
	ldrh	r3, [r4, #48]
	tst	r3, #8
	strh	r3, [r8]	@ movhi
	beq	.L73
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L78
.L73:
	ldrh	r3, [r4, #48]
	strh	r3, [r5]	@ movhi
	mov	lr, pc
	bx	r7
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L79
.L69:
	mov	lr, pc
	bx	fp
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	mov	lr, pc
	bx	r10
	ldrh	r3, [r4, #48]
	strh	r3, [r5]	@ movhi
	mov	lr, pc
	bx	r7
	b	.L68
.L78:
	ldr	r3, .L80+40
	mov	lr, pc
	bx	r3
	b	.L73
.L81:
	.align	2
.L80:
	.word	1027
	.word	state
	.word	initialize
	.word	gameDraw
	.word	oldButtons
	.word	gameState
	.word	buttons
	.word	waitForVBlank
	.word	loseDraw
	.word	67109120
	.word	initializeGame
	.size	main, .-main
	.comm	state,1,1
	.comm	pWidth,4,4
	.comm	pHeight,4,4
	.comm	pOldRow,4,4
	.comm	pOldCol,4,4
	.comm	pCol,4,4
	.comm	pRow,4,4
	.comm	bWidth,4,4
	.comm	bHeight,4,4
	.comm	bCVel,4,4
	.comm	bRVel,4,4
	.comm	bOldCol,4,4
	.comm	bOldRow,4,4
	.comm	bCol,4,4
	.comm	bRow,4,4
	.comm	textColor,2,2
	.comm	bgColor,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 50) 8.2.0"
