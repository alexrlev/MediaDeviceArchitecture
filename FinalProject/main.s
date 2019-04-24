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
	push	{r4, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+4
	mov	r3, #1
	ldr	r2, .L4+8
	ldr	r1, .L4+12
	ldr	r0, .L4+16
	mov	lr, pc
	bx	r4
	ldr	r4, .L4+20
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L4+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #9728
	mov	r2, #100663296
	ldr	r1, .L4+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+32
	ldr	r1, .L4+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L4+40
	ldr	r1, .L4+44
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L4+48
	ldr	r1, .L4+52
	mov	r0, #3
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+56
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r3, #0
	mov	r0, #7296
	ldr	r1, .L4+60
	strh	r3, [r2, #18]	@ movhi
	pop	{r4, lr}
	strh	r3, [r2, #16]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	strb	r3, [r1]
	bx	lr
.L5:
	.align	2
.L4:
	.word	waitForVBlank
	.word	playSoundA
	.word	11025
	.word	330750
	.word	softJazz
	.word	DMANow
	.word	startGroundPal
	.word	startGroundTiles
	.word	100720640
	.word	startGroundMap
	.word	100728832
	.word	numberSheetTiles
	.word	83886592
	.word	numberSheetPal
	.word	hideSprites
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
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	mov	r1, #0
	ldr	r2, .L8+4
	ldr	r3, .L8+8
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+12
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r2, #4352
	pop	{r4, lr}
	strh	r2, [r3]	@ movhi
	b	goToStart
.L9:
	.align	2
.L8:
	.word	waitForVBlank
	.word	highScore
	.word	setupSounds
	.word	setupInterrupts
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
	ldr	r3, .L12
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+4
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r1, #8064
	ldr	r4, .L12+8
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L12+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+16
	mov	r2, #100663296
	ldr	r1, .L12+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L12+24
	ldr	r1, .L12+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L12+32
	pop	{r4, lr}
	strb	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	waitForVBlank
	.word	hideSprites
	.word	DMANow
	.word	instrGroundPal
	.word	8544
	.word	instrGroundTiles
	.word	100726784
	.word	instrGroundMap
	.word	state
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
	push	{r4, r5, r6, lr}
	ldr	r3, .L23
	mov	lr, pc
	bx	r3
	mov	r6, #152
	mov	r3, #53
	ldr	r2, .L23+4
	ldr	lr, .L23+8
	ldr	r1, [r2]
	ldr	r5, .L23+12
	ldr	r4, .L23+16
.L15:
	smull	r2, r0, r4, r1
	asr	r2, r1, #31
	rsb	r2, r2, r0, asr #2
	add	r0, r2, r2, lsl #2
	sub	r1, r1, r0, lsl #1
	and	r0, r3, r5
	sub	r3, r3, #4
	lsl	ip, r1, #6
	lsl	r3, r3, #16
	subs	r1, r2, #0
	orr	r2, r0, #16384
	strh	r6, [lr]	@ movhi
	strh	ip, [lr, #4]	@ movhi
	strh	r2, [lr, #2]	@ movhi
	lsr	r3, r3, #16
	add	lr, lr, #8
	bne	.L15
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L23+20
	mov	r0, #3
	ldr	r4, .L23+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L23+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L14
	ldr	r3, .L23+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L22
.L14:
	pop	{r4, r5, r6, lr}
	bx	lr
.L22:
	pop	{r4, r5, r6, lr}
	b	goToInstr
.L24:
	.align	2
.L23:
	.word	waitForVBlank
	.word	highScore
	.word	shadowOAM+400
	.word	511
	.word	1717986919
	.word	shadowOAM
	.word	DMANow
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
	push	{r4, r5, r6, lr}
	mov	r2, #4864
	mov	r5, #67108864
	ldr	r3, .L27
	ldr	r4, .L27+4
	strh	r2, [r5]	@ movhi
	strh	r3, [r5, #10]	@ movhi
	mov	r2, #83886080
	mov	r3, #256
	ldr	r1, .L27+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #3072
	mov	r2, #100663296
	ldr	r1, .L27+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L27+16
	ldr	r1, .L27+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L27+24
	mov	r3, #192
	strh	r2, [r5, #8]	@ movhi
	ldr	r1, .L27+28
	ldr	r2, .L27+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #6144
	ldr	r2, .L27+36
	ldr	r1, .L27+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L27+44
	ldrh	r2, [r3]
	ldr	r3, .L27+48
	strh	r2, [r5, #18]	@ movhi
	ldrh	r2, [r3]
	ldr	r3, .L27+52
	strh	r2, [r5, #16]	@ movhi
	ldrh	r2, [r3]
	ldr	r3, .L27+56
	strh	r2, [r5, #22]	@ movhi
	ldrh	r2, [r3]
	ldr	r1, .L27+60
	strh	r2, [r5, #20]	@ movhi
	mov	r3, #16384
	ldr	r2, .L27+64
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L27+68
	ldr	r1, .L27+72
	mov	r0, #3
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L27+76
	mov	lr, pc
	bx	r3
	mov	ip, #10
	mov	r1, #5
	ldr	r2, .L27+80
	ldr	r0, .L27+84
	ldr	r3, .L27+88
	str	r1, [r2]
	str	ip, [r0]
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L27+92
	pop	{r4, r5, r6, lr}
	strb	r2, [r3]
	bx	lr
.L28:
	.align	2
.L27:
	.word	6786
	.word	DMANow
	.word	backgroundPal
	.word	backgroundTiles
	.word	100716544
	.word	backgroundMap
	.word	24068
	.word	frontgroundTiles
	.word	100679680
	.word	100724736
	.word	frontgroundMap
	.word	vFOff
	.word	hFOff
	.word	vOff
	.word	hOff
	.word	spritesheetTiles
	.word	100728832
	.word	83886592
	.word	spritesheetPal
	.word	hideSprites
	.word	couponPrice
	.word	foodPrice
	.word	waitForVBlank
	.word	state
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
	ldr	r4, .L41
	ldr	r3, .L41+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L30
	ldr	r2, .L41+8
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L39
.L30:
	tst	r3, #8
	beq	.L29
	ldr	r3, .L41+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L40
.L29:
	pop	{r4, lr}
	bx	lr
.L40:
	mov	r2, #2
	ldr	r3, .L41+12
	strb	r2, [r3]
	bl	goToGame
	ldr	r3, .L41+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L39:
	bl	goToStart
	ldrh	r3, [r4]
	b	.L30
.L42:
	.align	2
.L41:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	state
	.word	initGame
	.size	instr, .-instr
	.align	2
	.global	goToCheat
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToCheat, %function
goToCheat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #4864
	mov	r4, #67108864
	ldr	r3, .L45
	ldr	r5, .L45+4
	strh	r2, [r4]	@ movhi
	strh	r3, [r4, #10]	@ movhi
	mov	r2, #83886080
	mov	r3, #256
	ldr	r1, .L45+8
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #3072
	mov	r2, #100663296
	ldr	r1, .L45+12
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L45+16
	ldr	r1, .L45+20
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r2, .L45+24
	mov	r3, #192
	strh	r2, [r4, #8]	@ movhi
	ldr	r1, .L45+28
	ldr	r2, .L45+32
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #6144
	ldr	r2, .L45+36
	ldr	r1, .L45+40
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, .L45+44
	ldrh	r2, [r3]
	ldr	r3, .L45+48
	strh	r2, [r4, #18]	@ movhi
	ldrh	r2, [r3]
	ldr	r1, .L45+52
	strh	r2, [r4, #16]	@ movhi
	mov	r3, #16384
	ldr	r2, .L45+56
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r2, .L45+60
	ldr	r1, .L45+64
	mov	r0, #3
	mov	r3, #256
	mov	lr, pc
	bx	r5
	ldr	r3, .L45+68
	mov	lr, pc
	bx	r3
	mov	lr, #1
	mov	r0, #0
	mov	r2, #3
	ldr	r3, .L45+72
	ldrh	r1, [r3]
	ldr	r3, .L45+76
	ldrh	r3, [r3]
	strh	r1, [r4, #22]	@ movhi
	ldr	ip, .L45+80
	strh	r3, [r4, #20]	@ movhi
	ldr	r1, .L45+84
	ldr	r3, .L45+88
	str	lr, [ip]
	str	r0, [r1]
	strb	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L46:
	.align	2
.L45:
	.word	6786
	.word	DMANow
	.word	backgroundPal
	.word	backgroundTiles
	.word	100716544
	.word	backgroundMap
	.word	24068
	.word	cheatGroundTiles
	.word	100679680
	.word	100724736
	.word	cheatGroundMap
	.word	vFOff
	.word	hFOff
	.word	spritesheetTiles
	.word	100728832
	.word	83886592
	.word	spritesheetPal
	.word	hideSprites
	.word	vOff
	.word	hOff
	.word	foodPrice
	.word	couponPrice
	.word	state
	.size	goToCheat, .-goToCheat
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
	ldr	r3, .L49
	mov	lr, pc
	bx	r3
	ldr	r3, .L49+4
	mov	lr, pc
	bx	r3
	mov	r4, #67108864
	mov	r2, #4352
	mov	r3, #7296
	ldr	r5, .L49+8
	strh	r2, [r4]	@ movhi
	strh	r3, [r4, #8]	@ movhi
	mov	r2, #83886080
	mov	r3, #256
	ldr	r1, .L49+12
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, .L49+16
	mov	r2, #100663296
	ldr	r1, .L49+20
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L49+24
	ldr	r1, .L49+28
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #0
	mov	r1, #4
	ldr	r2, .L49+32
	strh	r3, [r4, #18]	@ movhi
	strh	r3, [r4, #16]	@ movhi
	strb	r1, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	waitForVBlank
	.word	hideSprites
	.word	DMANow
	.word	pauseGroundPal
	.word	6176
	.word	pauseGroundTiles
	.word	100720640
	.word	pauseGroundMap
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
	ldr	r4, .L63
	ldr	r3, .L63+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L52
	ldr	r2, .L63+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L61
.L52:
	tst	r3, #4
	beq	.L51
	ldr	r3, .L63+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L62
.L51:
	pop	{r4, lr}
	bx	lr
.L62:
	pop	{r4, lr}
	b	goToStart
.L61:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L52
.L64:
	.align	2
.L63:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.size	pause, .-pause
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
	push	{r4, r5, r6, lr}
	ldr	r3, .L67
	mov	lr, pc
	bx	r3
	ldr	r3, .L67+4
	mov	lr, pc
	bx	r3
	mov	r4, #67108864
	mov	r2, #4352
	mov	r3, #8064
	ldr	r5, .L67+8
	strh	r2, [r4]	@ movhi
	strh	r3, [r4, #8]	@ movhi
	mov	r2, #83886080
	mov	r3, #256
	ldr	r1, .L67+12
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, .L67+16
	mov	r2, #100663296
	ldr	r1, .L67+20
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L67+24
	ldr	r1, .L67+28
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #0
	mov	r1, #6
	ldr	r2, .L67+32
	strh	r3, [r4, #18]	@ movhi
	strh	r3, [r4, #16]	@ movhi
	strb	r1, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L68:
	.align	2
.L67:
	.word	waitForVBlank
	.word	hideSprites
	.word	DMANow
	.word	loseGroundPal
	.word	8416
	.word	loseGroundTiles
	.word	100726784
	.word	loseGroundMap
	.word	state
	.size	goToLose, .-goToLose
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
	ldr	r3, .L76
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L76+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L69
	ldr	r3, .L76+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L75
.L69:
	pop	{r4, lr}
	bx	lr
.L75:
	pop	{r4, lr}
	b	goToStart
.L77:
	.align	2
.L76:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
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
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L83
	ldr	r6, .L83+4
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	lr, pc
	bx	r6
	mov	r2, #4352
	mov	r3, #8064
	ldr	r4, .L83+8
	strh	r2, [r5]	@ movhi
	strh	r3, [r5, #8]	@ movhi
	mov	r2, #83886080
	mov	r3, #256
	ldr	r1, .L83+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #9280
	mov	r2, #100663296
	ldr	r1, .L83+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L83+20
	ldr	r1, .L83+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L83+28
	ldr	r1, .L83+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L83+36
	mov	r0, #3
	ldr	r1, .L83+40
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r6
	mov	r3, #0
	ldr	r2, .L83+44
	ldr	lr, .L83+48
	strh	r3, [r5, #18]	@ movhi
	ldr	ip, [lr]
	strh	r3, [r5, #16]	@ movhi
	ldr	r3, [r2]
	mov	r7, #153
	cmp	ip, r3
	mov	r3, #39
	strgt	ip, [r2]
	ldr	r0, .L83+52
	ldr	r6, .L83+56
	ldr	r5, .L83+60
.L80:
	smull	r2, r1, r5, ip
	asr	r2, ip, #31
	rsb	r2, r2, r1, asr #2
	add	r1, r2, r2, lsl #2
	sub	r1, ip, r1, lsl #1
	and	r8, r3, r6
	sub	r3, r3, #4
	lsl	r1, r1, #6
	subs	ip, r2, #0
	lsl	r3, r3, #16
	orr	r2, r8, #16384
	strh	r7, [r0]	@ movhi
	strh	r1, [r0, #4]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	lsr	r3, r3, #16
	add	r0, r0, #8
	bne	.L80
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L83+64
	mov	r0, #3
	str	ip, [lr]
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L83+68
	pop	{r4, r5, r6, r7, r8, lr}
	strb	r2, [r3]
	bx	lr
.L84:
	.align	2
.L83:
	.word	waitForVBlank
	.word	hideSprites
	.word	DMANow
	.word	winGroundPal
	.word	winGroundTiles
	.word	100726784
	.word	winGroundMap
	.word	100728832
	.word	numberSheetTiles
	.word	83886592
	.word	numberSheetPal
	.word	highScore
	.word	foodCounter
	.word	shadowOAM+480
	.word	511
	.word	1717986919
	.word	shadowOAM
	.word	state
	.size	goToWin, .-goToWin
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
	ldr	r3, .L101
	ldr	r4, .L101+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L101+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #2
	beq	.L86
	ldr	r2, .L101+12
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L97
.L86:
	tst	r3, #8
	beq	.L87
	ldr	r3, .L101+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L98
.L87:
	ldr	r3, .L101+16
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L99
.L88:
	ldr	r3, .L101+20
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L100
	pop	{r4, lr}
	bx	lr
.L100:
	pop	{r4, lr}
	b	goToWin
.L99:
	bl	goToLose
	b	.L88
.L98:
	bl	goToPause
	b	.L87
.L97:
	bl	goToCheat
	ldrh	r3, [r4]
	b	.L86
.L102:
	.align	2
.L101:
	.word	updateGame
	.word	oldButtons
	.word	drawGame
	.word	buttons
	.word	moneyCounter
	.word	winBool
	.size	game, .-game
	.align	2
	.global	cheat
	.syntax unified
	.arm
	.fpu softvfp
	.type	cheat, %function
cheat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L119
	ldr	r4, .L119+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L119+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #2
	beq	.L104
	ldr	r2, .L119+12
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L115
.L104:
	tst	r3, #8
	beq	.L105
	ldr	r3, .L119+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L116
.L105:
	ldr	r3, .L119+16
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L117
.L106:
	ldr	r3, .L119+20
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L118
	pop	{r4, lr}
	bx	lr
.L118:
	pop	{r4, lr}
	b	goToWin
.L117:
	bl	goToLose
	b	.L106
.L116:
	bl	goToPause
	b	.L105
.L115:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L104
.L120:
	.align	2
.L119:
	.word	updateGame
	.word	oldButtons
	.word	drawGame
	.word	buttons
	.word	moneyCounter
	.word	winBool
	.size	cheat, .-cheat
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
	ldr	r3, .L134
	mov	lr, pc
	bx	r3
	ldr	r6, .L134+4
	ldr	r8, .L134+8
	ldr	r5, .L134+12
	ldr	fp, .L134+16
	ldr	r10, .L134+20
	ldr	r9, .L134+24
	ldr	r7, .L134+28
	ldr	r4, .L134+32
.L122:
	ldrb	r2, [r6]	@ zero_extendqisi2
	ldrh	r3, [r8]
.L123:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #6
	ldrls	pc, [pc, r2, asl #2]
	b	.L123
.L125:
	.word	.L130
	.word	.L129
	.word	.L128
	.word	.L127
	.word	.L126
	.word	.L124
	.word	.L124
.L124:
	mov	lr, pc
	bx	r7
	b	.L122
.L126:
	ldr	r3, .L134+36
	mov	lr, pc
	bx	r3
	b	.L122
.L127:
	ldr	r3, .L134+40
	mov	lr, pc
	bx	r3
	b	.L122
.L128:
	mov	lr, pc
	bx	r9
	b	.L122
.L129:
	mov	lr, pc
	bx	r10
	b	.L122
.L130:
	mov	lr, pc
	bx	fp
	b	.L122
.L135:
	.align	2
.L134:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	instr
	.word	game
	.word	lose
	.word	67109120
	.word	pause
	.word	cheat
	.size	main, .-main
	.text
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
	@ link register save eliminated.
	b	lose
	.size	win, .-win
	.comm	state,1,1
	.comm	soundA,32,4
	.comm	shadowOAM,1024,4
	.comm	foodCounter,4,4
	.comm	highScore,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 50) 8.2.0"
