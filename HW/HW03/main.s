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
	push	{r4, r5, r6, lr}
	ldr	r0, .L8
	ldr	r3, .L8+4
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
	.word	6790
	.word	fillScreen
	.word	drawHorizontalLine
	.word	32767
	.word	drawVerticalLine
	.size	drawBackground, .-drawBackground
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #0
	bl	drawBackground
	ldr	ip, .L12
	mov	r3, r4
	ldr	r5, .L12+4
	ldr	r2, .L12+8
	mov	r1, #10
	mov	r0, #20
	strb	r4, [ip]
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r2, #72
	mov	r1, #10
	mov	r0, #28
	ldr	r4, .L12+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+16
	ldr	r2, .L12+20
	mov	r1, #10
	mov	r0, #40
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	state
	.word	drawString
	.word	.LC0
	.word	drawHorizontalLine
	.word	32767
	.word	.LC1
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
	ldr	r2, .L16
	push	{r4, lr}
	strh	r2, [r3]	@ movhi
	bl	goToStart
	mov	r1, #0
	ldr	r3, .L16+4
	ldr	r2, .L16+8
	strh	r1, [r3]	@ movhi
	ldr	r3, .L16+12
	ldrh	r2, [r2, #48]
	pop	{r4, lr}
	strh	r2, [r3]	@ movhi
	bx	lr
.L17:
	.align	2
.L16:
	.word	1027
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
	push	{r4, r5, r6, lr}
	bl	drawBackground
	mov	lr, #1
	ldr	r5, .L20
	ldr	ip, .L20+4
	ldr	r4, .L20+8
	mov	r3, r5
	ldr	r2, .L20+12
	mov	r1, #10
	mov	r0, #30
	strb	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L20+16
	mov	r1, #10
	mov	r0, #40
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L20+20
	mov	r1, #10
	mov	r0, #50
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L20+24
	mov	r1, #10
	mov	r0, #70
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L20+28
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L21:
	.align	2
.L20:
	.word	32767
	.word	state
	.word	drawString
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
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
	ldr	r3, .L29
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L29+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L22
	ldr	r3, .L29+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L28
.L22:
	pop	{r4, lr}
	bx	lr
.L28:
	pop	{r4, lr}
	b	goToInstr
.L30:
	.align	2
.L29:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	start, .-start
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
	push	{r4, lr}
	bl	drawBackground
	mov	lr, #2
	ldr	ip, .L33
	ldr	r4, .L33+4
	mov	r3, #0
	ldr	r2, .L33+8
	mov	r1, #5
	mov	r0, #140
	strb	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r2, .L33+12
	mov	r1, #5
	mov	r0, #150
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	state
	.word	drawString
	.word	.LC6
	.word	.LC7
	.size	goToGame, .-goToGame
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
	ldr	r4, .L42
	ldr	r3, [r4]
	ldr	r2, .L42+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L42+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L35
	ldr	r3, .L42+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L41
.L35:
	pop	{r4, lr}
	bx	lr
.L41:
	ldr	r0, [r4]
	ldr	r3, .L42+16
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L42+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initGame
	.size	instr, .-instr
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
	push	{r4, r5, r6, lr}
	bl	drawBackground
	mov	r1, #10
	ldr	r5, .L46
	ldr	r4, .L46+4
	mov	r0, r1
	mov	r3, #0
	ldr	r2, .L46+8
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L46+12
	mov	r1, #10
	mov	r0, #30
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L46+16
	mov	r1, #10
	mov	r0, #40
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L46+20
	pop	{r4, r5, r6, lr}
	strb	r2, [r3]
	bx	lr
.L47:
	.align	2
.L46:
	.word	32767
	.word	drawString
	.word	.LC8
	.word	.LC9
	.word	.LC10
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
	ldr	r3, .L60
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L60+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L49
	ldr	r2, .L60+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L58
.L49:
	tst	r3, #4
	beq	.L48
	ldr	r3, .L60+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L59
.L48:
	pop	{r4, lr}
	bx	lr
.L58:
	pop	{r4, lr}
	b	goToGame
.L59:
	pop	{r4, lr}
	b	goToStart
.L61:
	.align	2
.L60:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
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
	bl	drawBackground
	mov	r1, #10
	ldr	r4, .L64
	mov	r0, r1
	mov	r3, #0
	ldr	r2, .L64+4
	mov	lr, pc
	bx	r4
	ldr	r3, .L64+8
	ldr	r2, .L64+12
	mov	r1, #10
	mov	r0, #30
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L64+16
	pop	{r4, lr}
	strb	r2, [r3]
	bx	lr
.L65:
	.align	2
.L64:
	.word	drawString
	.word	.LC11
	.word	32767
	.word	.LC12
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
	ldr	r3, .L73
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L73+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L66
	ldr	r3, .L73+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L72
.L66:
	pop	{r4, lr}
	bx	lr
.L72:
	pop	{r4, lr}
	b	goToStart
.L74:
	.align	2
.L73:
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
	sub	sp, sp, #8
	bl	drawBackground
	ldr	r2, .L77
	mov	r3, #6
	str	r2, [sp]
	mov	r1, #41
	mov	r2, #8
	mov	r0, #142
	ldr	r4, .L77+4
	mov	lr, pc
	bx	r4
	mov	r1, #10
	ldr	r4, .L77+8
	mov	r0, r1
	mov	r3, #0
	ldr	r2, .L77+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L77+16
	ldr	r2, .L77+20
	mov	r1, #10
	mov	r0, #30
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L77+24
	strb	r2, [r3]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L78:
	.align	2
.L77:
	.word	6790
	.word	drawBox
	.word	drawString
	.word	.LC13
	.word	32767
	.word	.LC12
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
	push	{r4, r5, lr}
	ldr	r3, .L90
	sub	sp, sp, #12
	mov	lr, pc
	bx	r3
	ldr	r3, .L90+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L90+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L90+12
	ldr	r4, .L90+16
	str	r3, [sp]
	mov	r2, #8
	mov	r3, #6
	mov	r1, #41
	mov	r0, #150
	ldr	r5, .L90+20
	mov	lr, pc
	bx	r5
	ldr	r2, [r4]
	add	r2, r2, #48
	mov	r3, #0
	and	r2, r2, #255
	mov	r1, #41
	mov	r0, #150
	ldr	r5, .L90+24
	mov	lr, pc
	bx	r5
	ldr	r3, .L90+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L80
	ldr	r3, .L90+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L87
.L80:
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L88
	ldr	r3, .L90+36
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L89
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L88:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	goToWin
.L89:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	goToLose
.L87:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	goToPause
.L91:
	.align	2
.L90:
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	6790
	.word	ballsRemaining
	.word	drawBox
	.word	drawChar
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
	ldr	r1, .L104
	push	{r4, r7, fp, lr}
	ldr	r3, .L104+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r5, .L104+8
	ldr	r4, .L104+12
	strh	r3, [r5]	@ movhi
	ldr	r8, .L104+16
	ldrh	r3, [r4, #48]
	ldr	r6, .L104+20
	strh	r3, [r8]	@ movhi
	ldr	fp, .L104+24
	ldr	r10, .L104+28
	ldr	r9, .L104+32
	ldr	r7, .L104+36
.L93:
	ldrb	r2, [r6]	@ zero_extendqisi2
.L94:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L94
.L96:
	.word	.L100
	.word	.L99
	.word	.L98
	.word	.L97
	.word	.L95
	.word	.L95
.L95:
	mov	lr, pc
	bx	r7
.L101:
	ldrh	r3, [r8]
	b	.L93
.L97:
	ldr	r3, .L104+40
	mov	lr, pc
	bx	r3
	b	.L101
.L98:
	mov	lr, pc
	bx	r9
	b	.L101
.L99:
	mov	lr, pc
	bx	r10
	b	.L101
.L100:
	mov	lr, pc
	bx	fp
	b	.L101
.L105:
	.align	2
.L104:
	.word	1027
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
.LC0:
	.ascii	"Skeet Soccer\000"
	.space	3
.LC1:
	.ascii	"Press Start to Continue\000"
.LC2:
	.ascii	"Press A to shoot soccer balls\000"
	.space	2
.LC3:
	.ascii	"Press Start to pause game\000"
	.space	2
.LC4:
	.ascii	"Don't let any balls enter the goal\000"
	.space	1
.LC5:
	.ascii	"Press Start to Begin!\000"
	.space	2
.LC6:
	.ascii	"Balls \000"
	.space	1
.LC7:
	.ascii	"Left: \000"
	.space	1
.LC8:
	.ascii	"Pause\000"
	.space	2
.LC9:
	.ascii	"Press Start to resume game\000"
	.space	1
.LC10:
	.ascii	"Prese Select to restart\000"
.LC11:
	.ascii	"You win!!\000"
	.space	2
.LC12:
	.ascii	"Press Start to play again\000"
	.space	2
.LC13:
	.ascii	"You lose\000"
	.ident	"GCC: (devkitARM release 50) 8.2.0"
