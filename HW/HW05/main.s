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
	mov	r2, #67108864
	ldr	r1, .L4
	push	{r4, lr}
	mov	r3, #512
	ldr	r4, .L4+4
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #3552
	mov	r2, #100663296
	ldr	r1, .L4+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #117440512
	mov	r3, #512
	ldr	r1, .L4+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L4+32
	pop	{r4, lr}
	strb	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	-9088
	.word	DMANow
	.word	bgStartPal
	.word	bgStartTiles
	.word	100720640
	.word	bgStartMap
	.word	shadowOAM
	.word	waitForVBlank
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
	push	{r4, lr}
	mov	r3, #16384
	ldr	r4, .L8
	ldr	r2, .L8+4
	ldr	r1, .L8+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r3, #255
	ldr	r2, .L8+12
	ldr	r1, .L8+16
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r1, #4352
	ldr	r3, .L8+20
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	bl	goToStart
	mov	r1, #0
	ldr	r3, .L8+24
	ldr	r2, .L8+28
	strh	r1, [r3]	@ movhi
	ldr	r3, .L8+32
	ldrh	r2, [r2, #48]
	pop	{r4, lr}
	strh	r2, [r3]	@ movhi
	bx	lr
.L9:
	.align	2
.L8:
	.word	DMANow
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	hideSprites
	.word	oldButtons
	.word	67109120
	.word	buttons
	.size	initialize, .-initialize
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
	mov	r2, #67108864
	ldr	r1, .L12
	push	{r4, lr}
	ldr	r3, .L12+4
	ldr	r4, .L12+8
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L12+12
	mov	lr, pc
	bx	r4
	mov	r3, #1248
	mov	r2, #100663296
	ldr	r1, .L12+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L12+20
	mov	r3, #1024
	ldr	r1, .L12+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+28
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L12+32
	pop	{r4, lr}
	strb	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	-9088
	.word	510
	.word	DMANow
	.word	bgPal
	.word	bgTiles
	.word	100720640
	.word	bgMap
	.word	waitForVBlank
	.word	state
	.size	goToGame, .-goToGame
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
	ldr	r2, .L21
	ldr	r3, [r2]
	push	{r4, lr}
	add	r3, r3, #1
	ldr	r1, .L21+4
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	ldr	r3, .L21+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L15
	ldr	r3, .L21+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L20
.L15:
	ldr	r3, .L21+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L20:
	bl	goToGame
	b	.L15
.L22:
	.align	2
.L21:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	initGame
	.size	start, .-start
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
	ldr	r3, .L25
	mov	lr, pc
	bx	r3
	ldr	r3, .L25+4
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L25+8
	pop	{r4, lr}
	strb	r2, [r3]
	bx	lr
.L26:
	.align	2
.L25:
	.word	hideSprites
	.word	waitForVBlank
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
	push	{r4, lr}
	ldr	r4, .L39
	ldr	r3, .L39+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L28
	ldr	r2, .L39+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L37
.L28:
	tst	r3, #4
	beq	.L27
	ldr	r3, .L39+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L38
.L27:
	pop	{r4, lr}
	bx	lr
.L38:
	pop	{r4, lr}
	b	goToStart
.L37:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L28
.L40:
	.align	2
.L39:
	.word	oldButtons
	.word	waitForVBlank
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
	mov	r2, #67108864
	ldr	r1, .L43
	push	{r4, lr}
	mov	r3, #512
	ldr	r4, .L43+4
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L43+8
	mov	lr, pc
	bx	r4
	mov	r3, #1376
	mov	r2, #100663296
	ldr	r1, .L43+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L43+16
	mov	r3, #1024
	ldr	r1, .L43+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L43+24
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L43+28
	pop	{r4, lr}
	strb	r2, [r3]
	bx	lr
.L44:
	.align	2
.L43:
	.word	-9088
	.word	DMANow
	.word	bgWinPal
	.word	bgWinTiles
	.word	100720640
	.word	bgWinMap
	.word	hideSprites
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
	ldr	r3, .L52
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L45
	ldr	r3, .L52+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L51
.L45:
	pop	{r4, lr}
	bx	lr
.L51:
	pop	{r4, lr}
	b	goToStart
.L53:
	.align	2
.L52:
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
	mov	r2, #67108864
	ldr	r1, .L56
	push	{r4, lr}
	mov	r3, #512
	ldr	r4, .L56+4
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L56+8
	mov	lr, pc
	bx	r4
	mov	r3, #1280
	mov	r2, #100663296
	ldr	r1, .L56+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L56+16
	mov	r3, #1024
	ldr	r1, .L56+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L56+24
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L56+28
	pop	{r4, lr}
	strb	r2, [r3]
	bx	lr
.L57:
	.align	2
.L56:
	.word	-9088
	.word	DMANow
	.word	bgLosePal
	.word	bgLoseTiles
	.word	100720640
	.word	bgLoseMap
	.word	hideSprites
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
	push	{r4, lr}
	ldr	r3, .L69
	ldr	r4, .L69+4
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	ldr	r3, .L69+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L59
	ldr	r3, .L69+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L66
.L59:
	ldr	r3, .L69+16
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L67
.L60:
	ldr	r3, .L69+20
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L68
	pop	{r4, lr}
	bx	lr
.L68:
	pop	{r4, lr}
	b	goToWin
.L67:
	bl	goToLose
	b	.L60
.L66:
	ldr	r3, .L69+24
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L69+28
	strb	r2, [r3]
	b	.L59
.L70:
	.align	2
.L69:
	.word	updateGame
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	livesRemaining
	.word	enemiesRemaining
	.word	hideSprites
	.word	state
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
	push	{r4, r7, fp, lr}
	ldr	r3, .L80
	mov	lr, pc
	bx	r3
	ldr	r8, .L80+4
	ldr	r4, .L80+8
	ldr	r7, .L80+12
	ldr	fp, .L80+16
	ldr	r10, .L80+20
	ldr	r9, .L80+24
	ldr	r5, .L80+28
	ldr	r6, .L80+32
.L78:
	ldrh	r3, [r4]
	strh	r3, [r8]	@ movhi
	ldrb	r3, [r7]	@ zero_extendqisi2
	ldrh	r2, [r6, #48]
	strh	r2, [r4]	@ movhi
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L72
.L74:
	.word	.L77
	.word	.L76
	.word	.L75
	.word	.L73
	.word	.L73
.L73:
	mov	lr, pc
	bx	r9
.L72:
	mov	lr, pc
	bx	r5
	b	.L78
.L75:
	ldr	r3, .L80+36
	mov	lr, pc
	bx	r3
	b	.L72
.L77:
	mov	lr, pc
	bx	fp
	b	.L72
.L76:
	mov	lr, pc
	bx	r10
	b	.L72
.L81:
	.align	2
.L80:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	state
	.word	start
	.word	game
	.word	win
	.word	waitForVBlank
	.word	67109120
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
	.comm	state,1,1
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 50) 8.2.0"
