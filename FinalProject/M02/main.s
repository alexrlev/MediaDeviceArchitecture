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
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r0, #7296
	mov	r1, #768
	ldr	r2, .L4
	push	{r4, lr}
	ldr	r4, .L4+4
	strh	r0, [r3, #10]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r1, .L4+8
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+12
	mov	r2, #100663296
	ldr	r1, .L4+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #512
	ldr	r2, .L4+20
	ldr	r1, .L4+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #512
	ldr	r2, .L4+28
	ldr	r1, .L4+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L4+36
	ldr	r1, .L4+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r1, .L4+44
	ldr	r2, .L4+48
	str	r3, [r1]
	ldrh	r0, [r2, #48]
	ldr	ip, .L4+52
	ldr	r1, .L4+56
	ldr	r2, .L4+60
	strb	r3, [ip]
	strh	r0, [r1]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r3, .L4+64
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	24068
	.word	DMANow
	.word	sampleBackgroundPal
	.word	7840
	.word	sampleBackgroundTiles
	.word	100720640
	.word	sampleBackgroundMap
	.word	100679680
	.word	frontgroundTiles
	.word	100724736
	.word	frontgroundMap
	.word	hOff
	.word	67109120
	.word	state
	.word	buttons
	.word	waitForVBlank
	.word	flipPage
	.size	initialize, .-initialize
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
	mov	r1, #0
	push	{r4, lr}
	ldr	r2, .L8
	ldr	r3, .L8+4
	strb	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	state
	.word	waitForVBlank
	.word	flipPage
	.size	goToStart, .-goToStart
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
	push	{r4, lr}
	ldr	r4, .L17
	mov	lr, pc
	bx	r4
	ldr	r3, .L17+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L10
	ldr	r3, .L17+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L16
.L10:
	pop	{r4, lr}
	bx	lr
.L16:
	mov	r2, #1
	ldr	r3, .L17+12
	strb	r2, [r3]
	mov	lr, pc
	bx	r4
	ldr	r3, .L17+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.word	flipPage
	.size	start, .-start
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
	mov	r1, #1
	push	{r4, lr}
	ldr	r2, .L21
	ldr	r3, .L21+4
	strb	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	state
	.word	waitForVBlank
	.word	flipPage
	.size	goToInstr, .-goToInstr
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
	mov	lr, pc
	bx	r4
	ldr	r3, .L30+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L23
	ldr	r3, .L30+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L29
.L23:
	pop	{r4, lr}
	bx	lr
.L29:
	mov	r2, #2
	ldr	r3, .L30+12
	strb	r2, [r3]
	mov	lr, pc
	bx	r4
	ldr	r3, .L30+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.word	flipPage
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
	mov	r1, #2
	push	{r4, lr}
	ldr	r2, .L34
	ldr	r3, .L34+4
	strb	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	state
	.word	waitForVBlank
	.word	flipPage
	.size	goToGame, .-goToGame
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
	mov	r0, #67108864
	ldr	ip, .L48
	ldr	r2, [ip]
	add	r2, r2, #1
	add	r3, r2, r2, lsr #31
	asr	r3, r3, #1
	lsl	r1, r2, #16
	lsl	r3, r3, #16
	push	{r4, r5, r6, lr}
	lsr	r3, r3, #16
	lsr	r1, r1, #16
	ldr	r5, .L48+4
	str	r2, [ip]
	ldr	r6, .L48+8
	strh	r3, [r0, #20]	@ movhi
	ldr	r4, .L48+12
	strh	r1, [r0, #16]	@ movhi
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r4
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L37
	ldr	r2, .L48+16
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L46
.L37:
	tst	r3, #1
	beq	.L36
	ldr	r3, .L48+16
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L47
.L36:
	pop	{r4, r5, r6, lr}
	bx	lr
.L47:
	mov	r2, #5
	ldr	r3, .L48+20
	strb	r2, [r3]
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L46:
	mov	r2, #3
	ldr	r3, .L48+20
	strb	r2, [r3]
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r4
	ldrh	r3, [r5]
	b	.L37
.L49:
	.align	2
.L48:
	.word	hOff
	.word	oldButtons
	.word	waitForVBlank
	.word	flipPage
	.word	buttons
	.word	state
	.size	game, .-game
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
	mov	r1, #3
	push	{r4, lr}
	ldr	r2, .L52
	ldr	r3, .L52+4
	strb	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	state
	.word	waitForVBlank
	.word	flipPage
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
	push	{r4, r5, r6, lr}
	ldr	r5, .L66
	ldr	r4, .L66+4
	mov	lr, pc
	bx	r4
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L55
	ldr	r2, .L66+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L64
.L55:
	tst	r3, #4
	beq	.L54
	ldr	r3, .L66+8
	ldrh	r3, [r3]
	ands	r3, r3, #4
	beq	.L65
.L54:
	pop	{r4, r5, r6, lr}
	bx	lr
.L65:
	ldr	r2, .L66+12
	strb	r3, [r2]
	mov	lr, pc
	bx	r4
	ldr	r3, .L66+16
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L64:
	mov	r2, #2
	ldr	r3, .L66+12
	strb	r2, [r3]
	mov	lr, pc
	bx	r4
	ldr	r3, .L66+16
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	b	.L55
.L67:
	.align	2
.L66:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	state
	.word	flipPage
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
	mov	r1, #5
	push	{r4, lr}
	ldr	r2, .L70
	ldr	r3, .L70+4
	strb	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L71:
	.align	2
.L70:
	.word	state
	.word	waitForVBlank
	.word	flipPage
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
	push	{r4, lr}
	ldr	r4, .L79
	mov	lr, pc
	bx	r4
	ldr	r3, .L79+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L72
	ldr	r3, .L79+8
	ldrh	r3, [r3]
	ands	r3, r3, #8
	beq	.L78
.L72:
	pop	{r4, lr}
	bx	lr
.L78:
	ldr	r2, .L79+12
	strb	r3, [r2]
	mov	lr, pc
	bx	r4
	ldr	r3, .L79+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L80:
	.align	2
.L79:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.word	flipPage
	.size	lose, .-lose
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
	ldr	r10, .L91
	ldr	r4, .L91+4
	ldr	r3, .L91+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L91+12
	ldrh	r3, [r10]
	ldrb	r1, [r4]	@ zero_extendqisi2
	ldr	r9, .L91+16
	ldr	r8, .L91+20
	ldr	r7, .L91+24
	ldr	r6, .L91+28
	ldr	fp, .L91+32
.L89:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [fp, #48]
	strh	r3, [r10]	@ movhi
	cmp	r1, #5
	ldrls	pc, [pc, r1, asl #2]
	b	.L82
.L84:
	.word	.L88
	.word	.L87
	.word	.L86
	.word	.L85
	.word	.L82
	.word	.L83
.L83:
	ldr	r3, .L91+36
	mov	lr, pc
	bx	r3
	ldrh	r3, [r10]
	ldrb	r1, [r4]	@ zero_extendqisi2
.L82:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [fp, #48]
	strh	r3, [r10]	@ movhi
	b	.L89
.L85:
	mov	lr, pc
	bx	r6
	ldrh	r3, [r10]
	ldrb	r1, [r4]	@ zero_extendqisi2
	b	.L82
.L86:
	mov	lr, pc
	bx	r7
	ldrh	r3, [r10]
	ldrb	r1, [r4]	@ zero_extendqisi2
	b	.L82
.L88:
	mov	lr, pc
	bx	r9
	ldrh	r3, [r10]
	ldrb	r1, [r4]	@ zero_extendqisi2
	b	.L82
.L87:
	mov	lr, pc
	bx	r8
	ldrh	r3, [r10]
	ldrb	r1, [r4]	@ zero_extendqisi2
	b	.L82
.L92:
	.align	2
.L91:
	.word	buttons
	.word	state
	.word	initialize
	.word	oldButtons
	.word	start
	.word	instr
	.word	game
	.word	pause
	.word	67109120
	.word	lose
	.size	main, .-main
	.comm	hOff,4,4
	.comm	state,1,1
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 50) 8.2.0"
