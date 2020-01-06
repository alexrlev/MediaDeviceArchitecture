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
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r3, #256
	sub	sp, sp, #12
	mov	r2, #83886080
	ldr	r1, .L4
	mov	r0, #3
	ldr	r4, .L4+4
	mov	lr, pc
	bx	r4
	mov	r4, #0
	mvn	r1, #32768
	mvn	r2, #64512
	mov	r0, #31
	ldr	ip, .L4+8
	ldr	r3, .L4+12
	strh	ip, [r3, #248]	@ movhi
	strh	r4, [r3, #246]	@ movhi
	strh	r0, [r3, #250]	@ movhi
	strh	r1, [r3, #252]	@ movhi
	strh	r2, [r3, #254]	@ movhi
	ldr	r0, .L4+16
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	mov	r2, #254
	mov	r3, #122
	str	r2, [sp]
	mov	r1, #59
	mov	r2, #10
	mov	r0, #75
	ldr	r5, .L4+24
	mov	lr, pc
	bx	r5
	ldr	r2, .L4+28
	mov	r1, #60
	mov	r0, #76
	mov	r3, #251
	ldr	r5, .L4+32
	mov	lr, pc
	bx	r5
	ldr	r3, .L4+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+44
	strb	r4, [r3]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	wallPal
	.word	DMANow
	.word	18578
	.word	83886336
	.word	wallBitmap
	.word	drawFullscreenImage4
	.word	drawRect4
	.word	.LC1
	.word	drawString4
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToStart, .-goToStart
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
	mov	r3, #67108864
	ldr	r2, .L8
	push	{r4, lr}
	strh	r2, [r3]	@ movhi
	bl	goToStart
	mov	r1, #0
	ldr	r3, .L8+4
	ldr	r2, .L8+8
	strh	r1, [r3]	@ movhi
	ldr	r3, .L8+12
	ldrh	r2, [r2, #48]
	pop	{r4, lr}
	strh	r2, [r3]	@ movhi
	bx	lr
.L9:
	.align	2
.L8:
	.word	1044
	.word	oldButtons
	.word	67109120
	.word	buttons
	.size	initialize, .-initialize
	.align	2
	.global	goToInstr
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstr, %function
goToInstr:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #252
	ldr	r3, .L12
	mov	lr, pc
	bx	r3
	mov	r1, #10
	ldr	r4, .L12+4
	mov	r0, r1
	mov	r3, #254
	ldr	r2, .L12+8
	mov	lr, pc
	bx	r4
	mov	r1, #20
	mov	r3, #254
	mov	r0, r1
	ldr	r2, .L12+12
	mov	lr, pc
	bx	r4
	mov	r3, #254
	ldr	r2, .L12+16
	mov	r1, #10
	mov	r0, #40
	mov	lr, pc
	bx	r4
	mov	r3, #254
	ldr	r2, .L12+20
	mov	r1, #20
	mov	r0, #50
	mov	lr, pc
	bx	r4
	mov	r3, #254
	ldr	r2, .L12+24
	mov	r1, #10
	mov	r0, #70
	mov	lr, pc
	bx	r4
	mov	r3, #254
	ldr	r2, .L12+28
	mov	r1, #20
	mov	r0, #80
	mov	lr, pc
	bx	r4
	mov	r3, #254
	ldr	r2, .L12+32
	mov	r1, #10
	mov	r0, #100
	mov	lr, pc
	bx	r4
	ldr	r2, .L12+36
	mov	r1, #10
	mov	r0, #125
	mov	r3, #254
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+44
	mov	lr, pc
	bx	r3
	mov	r0, #1
	mov	r2, #0
	ldr	r1, .L12+48
	ldr	r3, .L12+52
	strb	r0, [r1]
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	fillScreen4
	.word	drawString4
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.word	seed
	.size	goToInstr, .-goToInstr
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L21
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L14
	ldr	r3, .L21+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L20
.L14:
	pop	{r4, lr}
	bx	lr
.L20:
	pop	{r4, lr}
	b	goToInstr
.L22:
	.align	2
.L21:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	start, .-start
	.align	2
	.global	instr
	.syntax unified
	.arm
	.fpu softvfp
	.type	instr, %function
instr:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L30
	ldr	r3, [r4]
	ldr	r2, .L30+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L30+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L23
	ldr	r3, .L30+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L29
.L23:
	pop	{r4, lr}
	bx	lr
.L29:
	ldr	r0, [r4]
	ldr	r3, .L30+16
	mov	lr, pc
	bx	r3
	mov	r1, #2
	ldr	r2, .L30+20
	ldr	r3, .L30+24
	strb	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	state
	.word	initGame
	.size	instr, .-instr
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #2
	ldr	r3, .L33
	strb	r2, [r3]
	bx	lr
.L34:
	.align	2
.L33:
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #252
	ldr	r3, .L37
	mov	lr, pc
	bx	r3
	mov	r1, #10
	ldr	r4, .L37+4
	mov	r0, r1
	mov	r3, #251
	ldr	r2, .L37+8
	mov	lr, pc
	bx	r4
	mov	r3, #254
	ldr	r2, .L37+12
	mov	r1, #10
	mov	r0, #30
	mov	lr, pc
	bx	r4
	ldr	r2, .L37+16
	mov	r1, #10
	mov	r0, #40
	mov	r3, #254
	mov	lr, pc
	bx	r4
	ldr	r3, .L37+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L37+24
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L37+28
	pop	{r4, lr}
	strb	r2, [r3]
	bx	lr
.L38:
	.align	2
.L37:
	.word	fillScreen4
	.word	drawString4
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L49
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L49+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L40
	ldr	r2, .L49+8
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L40
	mov	r2, #2
	ldr	r3, .L49+12
	strb	r2, [r3]
.L39:
	pop	{r4, lr}
	bx	lr
.L40:
	tst	r3, #4
	beq	.L39
	ldr	r3, .L49+8
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L39
	pop	{r4, lr}
	b	goToStart
.L50:
	.align	2
.L49:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #252
	ldr	r3, .L53
	mov	lr, pc
	bx	r3
	mov	r1, #10
	ldr	r4, .L53+4
	mov	r0, r1
	mov	r3, #251
	ldr	r2, .L53+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L53+12
	mov	r1, #10
	mov	r0, #30
	mov	r3, #254
	mov	lr, pc
	bx	r4
	ldr	r3, .L53+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L53+20
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L53+24
	pop	{r4, lr}
	strb	r2, [r3]
	bx	lr
.L54:
	.align	2
.L53:
	.word	fillScreen4
	.word	drawString4
	.word	.LC13
	.word	.LC14
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L62
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L55
	ldr	r3, .L62+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L61
.L55:
	pop	{r4, lr}
	bx	lr
.L61:
	pop	{r4, lr}
	b	goToStart
.L63:
	.align	2
.L62:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #252
	ldr	r3, .L66
	mov	lr, pc
	bx	r3
	mov	r1, #10
	ldr	r4, .L66+4
	mov	r0, r1
	mov	r3, #251
	ldr	r2, .L66+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L66+12
	mov	r1, #10
	mov	r0, #30
	mov	r3, #254
	mov	lr, pc
	bx	r4
	ldr	r3, .L66+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L66+20
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L66+24
	pop	{r4, lr}
	strb	r2, [r3]
	bx	lr
.L67:
	.align	2
.L66:
	.word	fillScreen4
	.word	drawString4
	.word	.LC15
	.word	.LC14
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L79
	mov	lr, pc
	bx	r3
	ldr	r3, .L79+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L79+8
	mov	r3, #254
	mov	r2, #88
	mov	r1, #0
	ldr	r4, .L79+12
	mov	r0, #150
	mov	lr, pc
	bx	r5
	mov	r3, #254
	mov	r2, #10
	mov	r1, #88
	ldr	r5, .L79+16
	mov	r0, #150
	mov	lr, pc
	bx	r5
	ldr	r2, [r4]
	ldr	r1, .L79+20
	ldr	r3, .L79+24
	ldr	r0, .L79+28
	mov	lr, pc
	bx	r3
	ldr	r5, .L79+32
	ldr	r2, .L79+28
	mov	r1, #2
	mov	r0, #152
	mov	r3, #254
	mov	lr, pc
	bx	r5
	ldr	r3, .L79+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L79+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L79+44
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L69
	ldr	r3, .L79+48
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L76
.L69:
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L77
	ldr	r3, .L79+52
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L78
	pop	{r4, r5, r6, lr}
	bx	lr
.L77:
	pop	{r4, r5, r6, lr}
	b	goToWin
.L78:
	pop	{r4, r5, r6, lr}
	b	goToLose
.L76:
	pop	{r4, r5, r6, lr}
	b	goToPause
.L80:
	.align	2
.L79:
	.word	updateGame
	.word	drawGame
	.word	drawHorizontalLine4
	.word	blocksRemaining
	.word	drawVerticalLine4
	.word	.LC16
	.word	sprintf
	.word	buffer
	.word	drawString4
	.word	waitForVBlank
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.word	losing
	.size	game, .-game
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
	mov	r2, #67108864
	ldr	r1, .L93
	push	{r4, r7, fp, lr}
	ldr	r3, .L93+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r5, .L93+8
	ldr	r4, .L93+12
	strh	r3, [r5]	@ movhi
	ldr	r8, .L93+16
	ldrh	r3, [r4, #48]
	ldr	r6, .L93+20
	strh	r3, [r8]	@ movhi
	ldr	fp, .L93+24
	ldr	r10, .L93+28
	ldr	r9, .L93+32
	ldr	r7, .L93+36
.L82:
	ldrb	r2, [r6]	@ zero_extendqisi2
.L83:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L83
.L85:
	.word	.L89
	.word	.L88
	.word	.L87
	.word	.L86
	.word	.L84
	.word	.L84
.L84:
	mov	lr, pc
	bx	r7
.L90:
	ldrh	r3, [r8]
	b	.L82
.L86:
	ldr	r3, .L93+40
	mov	lr, pc
	bx	r3
	b	.L90
.L87:
	mov	lr, pc
	bx	r9
	b	.L90
.L88:
	mov	lr, pc
	bx	r10
	b	.L90
.L89:
	mov	lr, pc
	bx	fp
	b	.L90
.L94:
	.align	2
.L93:
	.word	1044
	.word	goToStart
	.word	oldButtons
	.word	67109120
	.word	buttons
	.word	state
	.word	start
	.word	instr
	.word	game
	.word	win
	.word	pause
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	buffer,41,4
	.comm	seed,4,4
	.comm	state,1,1
	.comm	textColor,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"Press Start to Begin\000"
	.space	3
.LC2:
	.ascii	"Press A and B to control\000"
	.space	3
.LC3:
	.ascii	"the Red player\000"
	.space	1
.LC4:
	.ascii	"Press Right and Left to control\000"
.LC5:
	.ascii	"the Black player\000"
	.space	3
.LC6:
	.ascii	"Don't let any blocks hit\000"
	.space	3
.LC7:
	.ascii	"the bottom of the screen\000"
	.space	3
.LC8:
	.ascii	"Burst all the bricks to win\000"
.LC9:
	.ascii	"Press Start to Begin!\000"
	.space	2
.LC10:
	.ascii	"Pause\000"
	.space	2
.LC11:
	.ascii	"Press Start to resume game\000"
	.space	1
.LC12:
	.ascii	"Prese Select to restart\000"
.LC13:
	.ascii	"You win!!\000"
	.space	2
.LC14:
	.ascii	"Press Start to play again\000"
	.space	2
.LC15:
	.ascii	"You lose\000"
	.space	3
.LC16:
	.ascii	"Bricks Left: %d\000"
	.ident	"GCC: (devkitARM release 50) 8.2.0"
