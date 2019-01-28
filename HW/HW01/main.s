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
	.global	setPixel
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, r0, lsl #4
	ldr	r3, [r3]
	lsl	r1, r1, #1
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	drawHorizontalLine
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHorizontalLine, %function
drawHorizontalLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	rsb	r0, r0, r0, lsl #4
	str	lr, [sp, #-4]!
	ldr	lr, .L13
	lsl	ip, r0, #4
	add	r2, ip, r2
	ldr	r0, [lr]
	add	r2, r2, r1
	add	r1, r1, ip
	add	r2, r0, r2, lsl #1
	add	r1, r0, r1, lsl #1
.L7:
	strh	r3, [r1], #2	@ movhi
	cmp	r1, r2
	bne	.L7
	ldr	lr, [sp], #4
	bx	lr
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	.size	drawHorizontalLine, .-drawHorizontalLine
	.align	2
	.global	drawVerticalLine
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawVerticalLine, %function
drawVerticalLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	str	lr, [sp, #-4]!
	ldr	lr, .L23
	add	r2, r0, r2
	rsb	ip, r2, r2, lsl #4
	rsb	r0, r0, r0, lsl #4
	ldr	r2, [lr]
	add	ip, r1, ip, lsl #4
	add	r1, r1, r0, lsl #4
	add	r1, r2, r1, lsl #1
	add	r0, r2, ip, lsl #1
.L17:
	strh	r3, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, r0
	bne	.L17
	ldr	lr, [sp], #4
	bx	lr
.L24:
	.align	2
.L23:
	.word	.LANCHOR0
	.size	drawVerticalLine, .-drawVerticalLine
	.align	2
	.global	drawDiagonalUpLine
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDiagonalUpLine, %function
drawDiagonalUpLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r2, #0
	bxle	lr
	rsb	r0, r0, r0, lsl #4
	ldr	ip, .L29
	add	r0, r1, r0, lsl #4
	rsb	r1, r2, r2, lsl #4
	lsl	r0, r0, #1
	rsb	r1, r2, r1, lsl #4
	ldr	r2, [ip]
	sub	r1, r0, r1, lsl #1
	add	r1, r2, r1
	add	r2, r2, r0
.L27:
	strh	r3, [r2]	@ movhi
	sub	r2, r2, #476
	sub	r2, r2, #2
	cmp	r2, r1
	bne	.L27
	bx	lr
.L30:
	.align	2
.L29:
	.word	.LANCHOR0
	.size	drawDiagonalUpLine, .-drawDiagonalUpLine
	.align	2
	.global	drawDiagonalDownLine
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDiagonalDownLine, %function
drawDiagonalDownLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	ldr	ip, .L39
	str	lr, [sp, #-4]!
	rsb	r0, r0, r0, lsl #4
	rsb	lr, r2, r2, lsl #4
	add	r0, r1, r0, lsl #4
	add	r2, r2, lr, lsl #4
	ldr	r1, [ip]
	add	r2, r0, r2
	add	r2, r1, r2, lsl #1
	add	r1, r1, r0, lsl #1
.L33:
	strh	r3, [r1]	@ movhi
	add	r1, r1, #480
	add	r1, r1, #2
	cmp	r1, r2
	bne	.L33
	ldr	lr, [sp], #4
	bx	lr
.L40:
	.align	2
.L39:
	.word	.LANCHOR0
	.size	drawDiagonalDownLine, .-drawDiagonalDownLine
	.align	2
	.global	drawRectangle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRectangle, %function
drawRectangle:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	cmp	r2, #0
	add	r7, r1, r3
	ldrh	lr, [sp, #24]
	ble	.L42
	ldr	r4, .L62
	lsl	r8, r0, #4
	add	r5, r0, r2
	ldr	r4, [r4]
	sub	ip, r8, r0
	rsb	r6, r5, r5, lsl #4
	add	ip, r1, ip, lsl #4
	add	r6, r1, r6, lsl #4
	add	ip, r4, ip, lsl #1
	add	r6, r4, r6, lsl #1
.L43:
	strh	lr, [ip]	@ movhi
	add	ip, ip, #480
	cmp	ip, r6
	bne	.L43
.L44:
	mov	r6, #0
	sub	ip, r8, r0
	add	ip, r7, ip, lsl #4
	add	ip, r4, ip, lsl #1
.L48:
	add	r6, r6, #1
	cmp	r2, r6
	strh	lr, [ip]	@ movhi
	add	ip, ip, #480
	bge	.L48
	cmp	r3, #0
	ble	.L61
.L46:
	ldr	r2, .L62
	rsb	r0, r0, r0, lsl #4
	lsl	r0, r0, #4
	ldr	ip, [r2]
	add	r7, r7, r0
	add	r0, r1, r0
	add	r2, ip, r0, lsl #1
	add	r7, ip, r7, lsl #1
.L50:
	strh	lr, [r2], #2	@ movhi
	cmp	r7, r2
	bne	.L50
.L51:
	mov	r2, #0
	rsb	r5, r5, r5, lsl #4
	add	r1, r1, r5, lsl #4
	add	r1, ip, r1, lsl #1
.L53:
	add	r2, r2, #1
	cmp	r3, r2
	strh	lr, [r1], #2	@ movhi
	bge	.L53
.L41:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L42:
	beq	.L45
	cmp	r3, #0
	add	r5, r0, r2
	bgt	.L46
.L61:
	bne	.L41
	ldr	r2, .L62
	ldr	ip, [r2]
	b	.L51
.L45:
	ldr	ip, .L62
	mov	r5, r0
	ldr	r4, [ip]
	lsl	r8, r0, #4
	b	.L44
.L63:
	.align	2
.L62:
	.word	.LANCHOR0
	.size	drawRectangle, .-drawRectangle
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L68
	ldr	r2, .L68+4
	ldr	r1, [r3]
	sub	r3, r1, #2
	add	r2, r1, r2
.L65:
	strh	r0, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L65
	bx	lr
.L69:
	.align	2
.L68:
	.word	.LANCHOR0
	.word	76798
	.size	fillScreen, .-fillScreen
	.align	2
	.global	delay
	.syntax unified
	.arm
	.fpu softvfp
	.type	delay, %function
delay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	rsb	r3, r0, r0, lsl #5
	add	r0, r0, r3, lsl #2
	lsl	r0, r0, #3
	sub	sp, sp, #8
	cmp	r0, r2
	str	r2, [sp, #4]
	ble	.L70
.L72:
	ldr	r3, [sp, #4]
	add	r2, r2, #1
	add	r3, r3, #1
	cmp	r2, r0
	str	r3, [sp, #4]
	bne	.L72
.L70:
	add	sp, sp, #8
	@ sp needed
	bx	lr
	.size	delay, .-delay
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L76:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L76
	mov	r2, #67108864
.L77:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L77
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	frame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame1, %function
frame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, lr}
	ldr	r2, .L105
	ldr	r1, [r2]
	ldr	lr, .L105+4
	add	r0, r1, #12032
	ldr	ip, .L105+8
	sub	sp, sp, #8
	add	r0, r0, #18
	add	r2, r1, #12032
.L82:
	strh	lr, [r0, r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, ip
	bne	.L82
	mov	r3, #0
	add	r0, r1, #12032
	ldr	lr, .L105+4
	ldr	ip, .L105+8
	add	r0, r0, #48
.L83:
	strh	lr, [r0, r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, ip
	bne	.L83
	add	r3, r1, #23808
	add	r0, r1, #24064
	ldr	lr, .L105+4
	add	r3, r3, #240
	add	ip, r0, #14
.L84:
	strh	lr, [r3, #2]!	@ movhi
	cmp	ip, r3
	bne	.L84
	mov	r3, #0
	add	ip, r1, #12032
	ldr	r4, .L105+4
	ldr	lr, .L105+8
	add	ip, ip, #58
.L85:
	strh	r4, [ip, r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, lr
	bne	.L85
	add	ip, r1, #12096
	ldr	lr, .L105+4
	add	r3, r2, #56
	add	ip, ip, #22
.L86:
	strh	lr, [r3, #2]!	@ movhi
	cmp	ip, r3
	bne	.L86
	ldr	ip, .L105+4
	add	r3, r0, #24
	add	r2, r0, #54
.L87:
	strh	ip, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L87
	add	r3, r1, #35840
	add	r2, r1, #36096
	ldr	ip, .L105+4
	add	r3, r3, #248
	add	r0, r2, #22
.L88:
	strh	ip, [r3, #2]!	@ movhi
	cmp	r0, r3
	bne	.L88
	mov	r3, #0
	add	r0, r1, #12096
	ldr	lr, .L105+4
	ldr	ip, .L105+8
	add	r0, r0, #34
.L89:
	strh	lr, [r0, r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, ip
	bne	.L89
	ldr	ip, .L105+4
	add	r3, r2, #32
	add	r0, r2, #62
.L90:
	strh	ip, [r3, #2]!	@ movhi
	cmp	r3, r0
	bne	.L90
	mov	r3, #0
	add	r1, r1, #12160
	ldr	ip, .L105+4
	ldr	r0, .L105+8
	add	r1, r1, #10
.L91:
	strh	ip, [r1, r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r0
	bne	.L91
	ldr	r1, .L105+4
	add	r3, r2, #72
	add	r2, r2, #102
.L92:
	strh	r1, [r3, #2]!	@ movhi
	cmp	r2, r3
	bne	.L92
	str	r1, [sp]
	mov	r3, #15
	mov	r2, #50
	mov	r1, #105
	mov	r0, #25
	bl	drawRectangle
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L106:
	.align	2
.L105:
	.word	.LANCHOR0
	.word	30399
	.word	24000
	.size	frame1, .-frame1
	.align	2
	.global	frame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame2, %function
frame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mvn	ip, #64512
	push	{r4, r5, lr}
	ldr	r4, .L131
	ldr	r2, [r4]
	ldr	r0, .L131+4
	add	r1, r2, #12032
	sub	sp, sp, #12
	add	r1, r1, #18
.L108:
	strh	ip, [r1, r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r0
	bne	.L108
	mov	r3, #0
	mvn	ip, #64512
	add	r1, r2, #12032
	ldr	r0, .L131+4
	add	r1, r1, #48
.L109:
	strh	ip, [r1, r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r0
	bne	.L109
	mov	r3, #0
	mvn	ip, #64512
	add	r1, r2, #12096
	ldr	r0, .L131+4
	add	r1, r1, #14
.L110:
	strh	ip, [r1, r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r0
	bne	.L110
	mvn	r1, #64512
	add	r3, r2, #35840
	add	r2, r2, #36096
	add	r3, r3, #208
	add	r2, r2, #12
.L111:
	strh	r1, [r3, #2]!	@ movhi
	cmp	r2, r3
	bne	.L111
	ldr	r5, .L131+8
	mov	r3, #15
	mov	r2, #50
	mov	r1, #60
	mov	r0, #25
	str	r5, [sp]
	bl	drawRectangle
	mov	r3, #15
	mov	r2, #30
	mov	r1, #80
	mov	r0, #25
	str	r5, [sp]
	bl	drawRectangle
	mov	r3, #0
	mvn	r0, #64512
	ldr	r1, [r4]
	add	r2, r1, #26368
	add	r2, r2, #192
.L112:
	strh	r0, [r2, r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, #9600
	bne	.L112
	mov	r3, #0
	mvn	ip, #64512
	ldr	r0, .L131+12
.L113:
	strh	ip, [r2, r3]	@ movhi
	add	r3, r3, #480
	add	r3, r3, #2
	cmp	r3, r0
	bne	.L113
	mov	r3, #0
	mvn	ip, #64512
	add	r2, r1, #12160
	ldr	r0, .L131+4
	add	r2, r2, #50
.L114:
	strh	ip, [r2, r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r0
	bne	.L114
	mvn	r0, #64512
	add	r2, r1, #36096
	add	r3, r2, #112
	add	r2, r2, #142
.L115:
	strh	r0, [r3, #2]!	@ movhi
	cmp	r2, r3
	bne	.L115
	mov	r3, #0
	mvn	ip, #64512
	add	r2, r1, #12224
	ldr	r0, .L131+4
	add	r2, r2, #26
.L116:
	strh	ip, [r2, r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r0
	bne	.L116
	mov	r3, #0
	mvn	ip, #64512
	add	r1, r1, #36096
	ldr	r0, .L131+16
	add	r1, r1, #154
.L117:
	strh	ip, [r1, r3]	@ movhi
	sub	r3, r3, #476
	sub	r3, r3, #2
	cmp	r3, r0
	bne	.L117
	mov	r3, #0
	mvn	r0, #64512
	ldr	r1, .L131+20
.L118:
	strh	r0, [r2, r3]	@ movhi
	add	r3, r3, #480
	add	r3, r3, #2
	cmp	r3, r1
	bne	.L118
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L132:
	.align	2
.L131:
	.word	.LANCHOR0
	.word	24000
	.word	1023
	.word	9640
	.word	-12428
	.word	12050
	.size	frame2, .-frame2
	.align	2
	.global	frame3
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame3, %function
frame3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #7
	mov	r1, #50
	push	{r4, lr}
	ldr	r4, .L141
	sub	sp, sp, #8
	mov	r2, r3
	mov	r0, r1
	str	r4, [sp]
	bl	drawRectangle
	mov	r3, #7
	mov	r1, #93
	mov	r2, r3
	mov	r0, #50
	str	r4, [sp]
	bl	drawRectangle
	mov	ip, r4
	mov	r3, #0
	ldr	r2, .L141+4
	ldr	r2, [r2]
	add	r1, r2, #36864
	add	r0, r1, #1632
	strh	r4, [r0, #4]	@ movhi
	add	r0, r1, #2112
	strh	r4, [r0, #4]	@ movhi
	add	r0, r1, #2592
	strh	r4, [r0, #4]	@ movhi
	add	r0, r2, #39936
	strh	r4, [r0, #4]	@ movhi
	add	r0, r1, #3552
	strh	r4, [r0, #4]	@ movhi
	add	r0, r1, #4032
	strh	r4, [r0, #4]	@ movhi
	add	r0, r1, #1728
	strh	r4, [r0, #8]	@ movhi
	add	r0, r1, #2208
	strh	r4, [r0, #8]	@ movhi
	add	r0, r1, #2688
	strh	r4, [r0, #8]	@ movhi
	add	r0, r1, #3168
	strh	r4, [r0, #8]	@ movhi
	add	r1, r1, #3648
	add	r0, r2, #40960
	strh	r4, [r1, #8]	@ movhi
	strh	r4, [r0, #40]	@ movhi
	add	r1, r2, #41216
	ldr	r0, .L141+8
	add	r1, r1, #164
.L134:
	strh	ip, [r1, r3]	@ movhi
	add	r3, r3, #480
	add	r3, r3, #2
	cmp	r3, r0
	bne	.L134
	mov	r3, #0
	add	r1, r2, #45568
	ldr	ip, .L141
	ldr	r0, .L141+12
	add	r1, r1, #212
	add	r2, r2, #45568
.L135:
	strh	ip, [r1, r3]	@ movhi
	sub	r3, r3, #476
	sub	r3, r3, #2
	cmp	r3, r0
	bne	.L135
	ldr	r1, .L141
	add	r3, r2, #148
	add	r2, r2, #210
.L136:
	strh	r1, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L136
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L142:
	.align	2
.L141:
	.word	32736
	.word	.LANCHOR0
	.word	4820
	.word	-4780
	.size	frame3, .-frame3
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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r4, #0
	mov	r9, r3
	push	{r7, lr}
	ldr	r2, .L170
	ldr	r10, .L170+4
	strh	r2, [r3]	@ movhi
	ldr	r8, .L170+8
	ldr	r7, .L170+12
	ldr	r6, .L170+16
	ldr	r5, .L170+20
	sub	sp, sp, #16
.L156:
	ldr	r2, [r10]
	sub	r3, r2, #2
	add	r2, r2, r5
.L144:
	strh	r4, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L144
.L145:
	ldrh	r3, [r9, #6]
	cmp	r3, #160
	bhi	.L145
.L146:
	ldrh	r3, [r9, #6]
	cmp	r3, #159
	bls	.L146
	mov	lr, pc
	bx	r8
	str	r4, [sp, #12]
	ldr	r2, .L170+24
.L147:
	ldr	r3, [sp, #12]
	subs	r2, r2, #1
	add	r3, r3, #1
	str	r3, [sp, #12]
	bne	.L147
	ldr	r2, [r10]
	sub	r3, r2, #2
	add	r2, r2, r5
.L148:
	strh	r4, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L148
.L149:
	ldrh	r3, [r9, #6]
	cmp	r3, #160
	bhi	.L149
.L150:
	ldrh	r3, [r9, #6]
	cmp	r3, #159
	bls	.L150
	mov	lr, pc
	bx	r7
	str	r4, [sp, #8]
	ldr	r2, .L170+24
.L151:
	ldr	r3, [sp, #8]
	subs	r2, r2, #1
	add	r3, r3, #1
	str	r3, [sp, #8]
	bne	.L151
	ldr	r2, [r10]
	sub	r3, r2, #2
	add	r2, r2, r5
.L152:
	strh	r4, [r3, #2]!	@ movhi
	cmp	r2, r3
	bne	.L152
.L153:
	ldrh	r3, [r9, #6]
	cmp	r3, #160
	bhi	.L153
.L154:
	ldrh	r3, [r9, #6]
	cmp	r3, #159
	bls	.L154
	mov	lr, pc
	bx	r6
	str	r4, [sp, #4]
	ldr	r2, .L170+24
.L155:
	ldr	r3, [sp, #4]
	subs	r2, r2, #1
	add	r3, r3, #1
	str	r3, [sp, #4]
	bne	.L155
	b	.L156
.L171:
	.align	2
.L170:
	.word	1027
	.word	.LANCHOR0
	.word	frame1
	.word	frame2
	.word	frame3
	.word	76798
	.word	200000
	.size	main, .-main
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 50) 8.2.0"
