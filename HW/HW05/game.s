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
	.type	fireEnemy.part.0, %function
fireEnemy.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	mov	ip, #0
	ldr	r3, .L3
	add	r0, r0, #17
	add	r1, r1, #7
	stm	r3, {r0, r1}
	str	ip, [r3, #24]
	str	r2, [r3, #8]
	str	r2, [r3, #20]
	bx	lr
.L4:
	.align	2
.L3:
	.word	enemyBullets
	.size	fireEnemy.part.0, .-fireEnemy.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBulletE.part.2, %function
updateBulletE.part.2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L8
	ldr	r3, [r1]
	cmp	r3, #159
	movgt	r2, #0
	str	lr, [sp, #-4]!
	strgt	r2, [r1, #20]
	ldr	r2, .L8+4
	ldr	r2, [r2]
	ldmib	r1, {ip, lr}
	ldr	r0, .L8+8
	lsl	r2, r2, #6
	add	r3, r3, lr
	sub	r2, r2, #60
	orr	ip, ip, #16384
	strh	r2, [r0, #4]	@ movhi
	strh	ip, [r0, #2]	@ movhi
	strh	r3, [r0]	@ movhi
	str	r3, [r1]
	ldr	lr, [sp], #4
	bx	lr
.L9:
	.align	2
.L8:
	.word	enemyBullets
	.word	enemyType
	.word	shadowOAM+464
	.size	updateBulletE.part.2, .-updateBulletE.part.2
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, #5
	mov	r3, #0
	mov	r1, #40
	mov	fp, r6
	mov	r4, #3
	mov	lr, #16
	mov	r7, #1
	mov	r10, #23
	mov	r9, #41
	ldr	r0, .L14
	ldr	r2, .L14+4
	str	r3, [r0]
	str	r1, [r2]
	mov	r5, r3
	ldr	ip, .L14+8
	ldr	r0, .L14+12
	ldr	r1, .L14+16
	ldr	r2, .L14+20
	ldr	r3, .L14+24
.L11:
	mov	r8, #59
	str	r8, [r2]
	mov	r8, #77
	str	r6, [ip, #4]
	str	r6, [r0, #4]
	str	r6, [r1, #4]
	str	r6, [r2, #4]
	str	fp, [ip]
	str	r4, [ip, #8]
	str	r4, [ip, #12]
	str	lr, [ip, #16]
	str	lr, [ip, #20]
	str	r7, [ip, #28]
	str	r5, [ip, #24]
	str	r5, [ip, #32]
	str	r10, [r0]
	str	r4, [r0, #8]
	str	r4, [r0, #12]
	str	lr, [r0, #16]
	str	lr, [r0, #20]
	str	r7, [r0, #28]
	str	r5, [r0, #24]
	str	r5, [r0, #32]
	str	r9, [r1]
	str	r4, [r1, #8]
	str	r4, [r1, #12]
	str	lr, [r1, #16]
	str	lr, [r1, #20]
	str	r7, [r1, #28]
	str	r5, [r1, #24]
	str	r5, [r1, #32]
	str	r4, [r2, #8]
	str	r4, [r2, #12]
	str	lr, [r2, #16]
	str	lr, [r2, #20]
	str	r6, [r3, #4]
	add	r6, r6, #18
	cmp	r6, #149
	str	r7, [r2, #28]
	str	r5, [r2, #24]
	str	r5, [r2, #32]
	str	r8, [r3]
	str	r4, [r3, #8]
	str	r4, [r3, #12]
	str	lr, [r3, #16]
	str	lr, [r3, #20]
	str	r7, [r3, #28]
	str	r5, [r3, #24]
	str	r7, [r3, #32]
	add	ip, ip, #36
	add	r0, r0, #36
	add	r1, r1, #36
	add	r2, r2, #36
	add	r3, r3, #36
	bne	.L11
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	enemyBulletTimer
	.word	enemiesRemaining
	.word	enemy1
	.word	enemy2
	.word	enemy2b
	.word	enemy3
	.word	enemy3b
	.size	initEnemies, .-initEnemies
	.global	__aeabi_idivmod
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L191
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L191+4
	ldr	r7, [r2]
	smull	r2, r1, r7, r3
	asr	r8, r7, #31
	rsb	r3, r8, r1, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r7, r3, lsl #2
	ldr	r3, .L191+8
	sub	sp, sp, #52
	str	r3, [sp, #28]
	beq	.L17
	ldr	r2, .L191+12
	str	r2, [sp, #32]
	ldr	r2, .L191+16
	str	r2, [sp, #40]
	ldr	r2, .L191+20
	str	r2, [sp, #36]
	ldr	r2, .L191+24
	add	r3, r3, #288
	str	r2, [sp, #44]
	str	r3, [sp, #24]
.L21:
	ldr	r3, .L191+28
	smull	r2, r1, r7, r3
	rsb	r8, r8, r1, asr #5
	add	r8, r8, r8, lsl #2
	add	r8, r8, r8, lsl #2
	cmp	r7, #0
	lsl	r8, r8, #2
	movle	r3, #0
	movgt	r3, #1
	cmp	r8, r7
	movne	r3, #0
	cmp	r3, #0
	bne	.L179
.L19:
	ldr	fp, .L191+32
	add	r3, fp, #264
	ldr	r7, .L191+12
	ldr	r10, .L191+16
	ldr	r8, .L191+20
	ldr	r9, .L191+24
	ldr	r5, .L191+8
	str	r3, [sp, #20]
.L87:
	ldr	r3, [r5, #28]
	cmp	r3, #0
	beq	.L22
	ldr	r2, [r5, #24]
	ldr	r3, [r5, #4]
	add	r2, r2, #64
	lsl	r2, r2, #1
	ldr	r1, [r5]
	strh	r2, [fp, #12]	@ movhi
	orr	r2, r3, #16384
	strh	r2, [fp, #10]	@ movhi
	strh	r1, [fp, #8]	@ movhi
.L23:
	ldr	r2, [r7, #28]
	cmp	r2, #0
	beq	.L24
	ldr	r2, [r10, #24]
	ldr	r1, [r7, #24]
	ldr	r4, [r7, #4]
	add	r2, r2, #32
	lsl	r2, r2, #1
	add	r1, r1, #32
	lsl	r1, r1, #1
	ldr	r0, [r10, #4]
	strh	r2, [fp, #204]	@ movhi
	orr	r2, r4, #16384
	strh	r1, [fp, #140]	@ movhi
	strh	r2, [fp, #138]	@ movhi
	ldr	r1, [r7]
	ldr	r2, [r10]
	orr	r0, r0, #16384
	strh	r0, [fp, #202]	@ movhi
	strh	r1, [fp, #136]	@ movhi
	strh	r2, [fp, #200]	@ movhi
.L25:
	ldr	r2, [r8, #28]
	cmp	r2, #0
	beq	.L26
	ldr	ip, [r8, #4]
	ldr	r0, [sp, #20]
	orr	r1, ip, #16384
	ldr	r2, [r8, #24]
	strh	r1, [r0, #2]	@ movhi
	ldr	r1, [r8]
	lsl	r2, r2, #1
	strh	r2, [r0, #4]	@ movhi
	strh	r1, [r0]	@ movhi
.L27:
	ldr	r2, [r9, #28]
	cmp	r2, #0
	ldr	r0, [r9, #4]
	beq	.L28
	ldr	r2, [r9, #24]
	ldr	lr, [sp, #20]
	lsl	r2, r2, #1
	ldr	r1, [r9]
	strh	r2, [lr, #68]	@ movhi
	orr	r2, r0, #16384
	strh	r1, [lr, #64]	@ movhi
	strh	r2, [lr, #66]	@ movhi
.L29:
	cmp	r3, #4
	movgt	r2, #0
	movle	r2, #1
	ldr	r1, [r5, #16]
	add	r1, r3, r1
	cmp	r1, #235
	orrgt	r2, r2, #1
	cmp	r2, #0
	bne	.L180
	ldr	r2, .L191
	ldr	lr, .L191+4
	ldr	r1, [r2]
	smull	r2, lr, r1, lr
	asr	r2, r1, #31
	rsb	r2, r2, lr, asr #3
	add	r2, r2, r2, lsl #2
	cmp	r1, r2, lsl #2
	bne	.L34
	cmp	r4, #4
	movgt	r1, #0
	movle	r1, #1
	ldr	r2, [r7, #16]
	add	r2, r4, r2
	cmp	r2, #235
	orrgt	r1, r1, #1
	ldr	r2, [r5, #12]
	cmp	r1, #0
	add	r3, r2, r3
	str	r3, [r5, #4]
	bne	.L32
.L35:
	ldr	r3, [r10, #4]
	cmp	r3, #4
	movgt	r1, #0
	movle	r1, #1
	ldr	r2, [r10, #16]
	add	r2, r3, r2
	cmp	r2, #235
	orrgt	r1, r1, #1
	ldr	r2, [r7, #12]
	cmp	r1, #0
	add	r4, r2, r4
	str	r4, [r7, #4]
	bne	.L37
.L40:
	cmp	ip, #4
	movgt	r1, #0
	movle	r1, #1
	ldr	r2, [r8, #16]
	add	r2, ip, r2
	cmp	r2, #235
	orrgt	r1, r1, #1
	ldr	r2, [r10, #12]
	cmp	r1, #0
	add	r3, r2, r3
	str	r3, [r10, #4]
	bne	.L42
.L45:
	cmp	r0, #4
	movgt	r2, #0
	movle	r2, #1
	ldr	r3, [r9, #16]
	add	r3, r0, r3
	cmp	r3, #235
	orrgt	r2, r2, #1
	ldr	r3, [r8, #12]
	cmp	r2, #0
	add	ip, r3, ip
	str	ip, [r8, #4]
	bne	.L47
.L50:
	ldr	r3, [r9, #12]
	add	r0, r3, r0
	str	r0, [r9, #4]
.L52:
	ldr	r2, .L191+36
	ldr	r3, [r5]
	ldr	r1, [r5, #20]
	ldr	r2, [r2]
	add	r3, r3, r1
	cmp	r3, r2
	bge	.L56
	ldr	r3, [r7]
	ldr	r1, [r7, #20]
	add	r3, r3, r1
	cmp	r2, r3
	ble	.L56
	ldr	r3, [r10]
	ldr	r1, [r10, #20]
	add	r3, r3, r1
	cmp	r2, r3
	ble	.L56
	ldr	r3, [r8]
	ldr	r1, [r8, #20]
	add	r3, r3, r1
	cmp	r2, r3
	ble	.L56
	ldr	r3, [r9]
	ldr	r1, [r9, #20]
	add	r3, r3, r1
	cmp	r2, r3
	ble	.L56
.L55:
	mov	r6, #0
	ldr	r4, .L191+40
.L71:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L57
	ldr	r3, [r9, #28]
	cmp	r3, #0
	bne	.L181
.L58:
	ldr	r3, [r8, #28]
	cmp	r3, #0
	bne	.L182
.L64:
	ldr	r3, [r10, #28]
	cmp	r3, #0
	bne	.L183
.L68:
	ldr	r3, [r7, #28]
	cmp	r3, #0
	bne	.L184
.L70:
	ldr	r3, [r5, #28]
	cmp	r3, #0
	bne	.L185
.L57:
	add	r6, r6, #1
	cmp	r6, #5
	add	r4, r4, #32
	bne	.L71
.L60:
	ldr	r3, .L191+44
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq	.L186
.L73:
	ldr	r3, [sp, #24]
	add	r5, r5, #36
	cmp	r5, r3
	ldr	r3, [sp, #20]
	add	r3, r3, #8
	add	r9, r9, #36
	add	r8, r8, #36
	add	r10, r10, #36
	add	r7, r7, #36
	add	fp, fp, #8
	str	r3, [sp, #20]
	bne	.L87
	add	sp, sp, #52
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L56:
	ldr	r2, .L191+48
	ldr	r3, [r2]
	sub	r3, r3, #3
	str	r3, [r2]
	ldr	r3, .L191+52
	mov	lr, pc
	bx	r3
	b	.L55
.L181:
	ldr	r0, [r4, #16]
	ldr	r1, [r4, #12]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	ip, .L191+56
	ldr	r3, [r9, #16]
	ldr	r2, [r9, #20]
	ldm	r9, {r0, r1}
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L58
	mov	r1, #0
	ldr	r2, .L191+60
	ldr	r3, [r8, #28]
	cmp	r3, r1
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r3, [r2]
	movne	r3, #1
	ldr	r0, .L191+40
	add	r6, r0, r6, lsl #5
	str	r1, [r6, #20]
	str	r1, [r9, #28]
	strne	r3, [r8, #32]
	bne	.L60
	ldr	r3, [r10, #28]
	cmp	r3, #0
	bne	.L175
.L65:
	ldr	r3, [r7, #28]
	cmp	r3, #0
	bne	.L174
.L69:
	ldr	r3, [r5, #28]
	cmp	r3, #0
	beq	.L60
	b	.L173
.L182:
	ldr	r0, [r4, #16]
	ldr	r1, [r4, #12]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	ip, .L191+56
	ldr	r3, [r8, #16]
	ldr	r2, [r8, #20]
	ldm	r8, {r0, r1}
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L64
	mov	r1, #0
	ldr	r2, .L191+60
	ldr	r3, [r10, #28]
	ldr	r0, .L191+40
	cmp	r3, r1
	ldr	r3, [r2]
	add	r6, r0, r6, lsl #5
	sub	r3, r3, #1
	str	r1, [r6, #20]
	str	r1, [r8, #28]
	str	r3, [r2]
	beq	.L65
.L175:
	mov	r3, #1
	str	r3, [r10, #32]
	b	.L60
.L183:
	ldr	r0, [r4, #16]
	ldr	r1, [r4, #12]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	ldr	ip, .L191+56
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r10, #20]
	ldr	r3, [r10, #16]
	ldm	r10, {r0, r1}
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L68
	mov	r1, #0
	ldr	r2, .L191+60
	ldr	r3, [r7, #28]
	ldr	r0, .L191+40
	cmp	r3, r1
	ldr	r3, [r2]
	add	r6, r0, r6, lsl #5
	sub	r3, r3, #1
	str	r1, [r6, #20]
	str	r1, [r10, #28]
	str	r3, [r2]
	beq	.L69
.L174:
	mov	r3, #1
	str	r3, [r7, #32]
	ldr	r3, .L191+44
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bne	.L73
.L186:
	ldr	r3, .L191+64
	mov	lr, pc
	bx	r3
	ldr	r3, .L191+68
	smull	r2, r3, r0, r3
	asr	r4, r0, #31
	rsb	r4, r4, r3, asr #6
	ldr	r2, [r5, #28]
	rsb	r3, r4, r4, lsl #5
	add	r4, r4, r3, lsl #2
	cmp	r2, #0
	sub	r4, r0, r4, lsl #3
	beq	.L75
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L75
	ldr	r2, .L191+72
	ldr	r3, .L191+76
	ldr	r0, [r2]
	mov	r1, r4
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	beq	.L187
.L75:
	ldr	r3, [r7, #28]
	cmp	r3, #0
	beq	.L78
	ldr	r3, [r7, #32]
	cmp	r3, #0
	beq	.L78
	ldr	r2, .L191+72
	ldr	r3, .L191+76
	ldr	r0, [r2]
	mov	r1, r4
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	beq	.L188
.L78:
	ldr	r3, [r10, #28]
	cmp	r3, #0
	beq	.L81
	ldr	r3, [r10, #32]
	cmp	r3, #0
	beq	.L81
	ldr	r2, .L191+72
	ldr	r3, .L191+76
	ldr	r0, [r2]
	mov	r1, r4
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	beq	.L189
.L81:
	ldr	r3, [r8, #28]
	cmp	r3, #0
	beq	.L84
	ldr	r3, [r8, #32]
	cmp	r3, #0
	beq	.L84
	ldr	r2, .L191+72
	ldr	r3, .L191+76
	ldr	r0, [r2]
	mov	r1, r4
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	beq	.L190
.L84:
	ldr	r3, [r9, #28]
	cmp	r3, #0
	beq	.L73
	ldr	r3, [r9, #32]
	cmp	r3, #0
	beq	.L73
	ldr	r3, .L191+72
	mov	r1, r4
	ldr	r0, [r3]
	ldr	r3, .L191+76
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	bne	.L73
	mov	r2, #1
	ldr	r3, .L191+44
	ldr	r1, [r3, #20]
	ldr	r3, .L191+80
	cmp	r1, #0
	str	r2, [r3]
	bne	.L73
	ldm	r9, {r0, r1}
	bl	fireEnemy.part.0
	b	.L73
.L184:
	ldr	r0, [r4, #16]
	ldr	r1, [r4, #12]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	ip, .L191+56
	ldr	r3, [r7, #16]
	ldr	r2, [r7, #20]
	ldm	r7, {r0, r1}
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L70
	mov	r1, #0
	ldr	r2, .L191+60
	ldr	r3, [r5, #28]
	ldr	r0, .L191+40
	cmp	r3, r1
	ldr	r3, [r2]
	add	r6, r0, r6, lsl #5
	sub	r3, r3, #1
	str	r1, [r6, #20]
	str	r1, [r7, #28]
	str	r3, [r2]
	beq	.L60
.L173:
	mov	r3, #1
	str	r3, [r5, #32]
	b	.L60
.L185:
	ldr	r0, [r4, #16]
	ldr	r1, [r4, #12]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	ip, .L191+56
	ldr	r3, [r5, #16]
	ldr	r2, [r5, #20]
	ldm	r5, {r0, r1}
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L57
	mov	r1, #0
	ldr	r2, .L191+60
	ldr	r0, .L191+40
	ldr	r3, [r2]
	add	r6, r0, r6, lsl #5
	sub	r3, r3, #1
	str	r1, [r6, #20]
	str	r1, [r5, #28]
	str	r3, [r2]
	b	.L60
.L180:
	ldr	r3, [sp, #28]
	ldr	r6, [sp, #24]
.L31:
	add	r1, r3, #8
	ldm	r1, {r1, r2}
	ldr	lr, [r3]
	add	lr, lr, r1
	ldr	r1, [r3, #4]
	sub	r1, r1, r2
	rsb	r2, r2, #0
	str	lr, [r3]
	str	r2, [r3, #12]
	str	r1, [r3, #4]
	add	r3, r3, #36
	cmp	r3, r6
	bne	.L31
.L34:
	cmp	r4, #4
	movgt	r3, #0
	movle	r3, #1
	ldr	r2, [r7, #16]
	add	r2, r4, r2
	cmp	r2, #235
	orrgt	r3, r3, #1
	cmp	r3, #0
	bne	.L32
	ldr	r3, .L191
	ldr	r1, .L191+4
	ldr	r2, [r3]
	smull	r3, r1, r2, r1
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #2
	beq	.L35
.L39:
	ldr	r3, [r10, #4]
	cmp	r3, #4
	movgt	r2, #0
	movle	r2, #1
	ldr	r1, [r10, #16]
	add	r1, r3, r1
	cmp	r1, #235
	orrgt	r2, r2, #1
	cmp	r2, #0
	bne	.L37
	ldr	r2, .L191
	ldr	lr, .L191+4
	ldr	r1, [r2]
	smull	r2, lr, r1, lr
	asr	r2, r1, #31
	rsb	r2, r2, lr, asr #3
	add	r2, r2, r2, lsl #2
	cmp	r1, r2, lsl #2
	beq	.L40
.L44:
	cmp	ip, #4
	movgt	r3, #0
	movle	r3, #1
	ldr	r2, [r8, #16]
	add	r2, ip, r2
	cmp	r2, #235
	orrgt	r3, r3, #1
	cmp	r3, #0
	bne	.L42
	ldr	r3, .L191
	ldr	r1, .L191+4
	ldr	r2, [r3]
	smull	r3, r1, r2, r1
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #2
	beq	.L45
.L49:
	cmp	r0, #4
	movgt	r3, #0
	movle	r3, #1
	ldr	r2, [r9, #16]
	add	r2, r0, r2
	cmp	r2, #235
	orrgt	r3, r3, #1
	cmp	r3, #0
	bne	.L47
	ldr	r3, .L191
	ldr	r1, .L191+4
	ldr	r2, [r3]
	smull	r3, r1, r2, r1
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #2
	bne	.L52
	b	.L50
.L28:
	mov	r2, #512
	ldr	r1, [sp, #20]
	strh	r2, [r1, #64]	@ movhi
	b	.L29
.L26:
	mov	r2, #512
	ldr	r1, [sp, #20]
	ldr	ip, [r8, #4]
	strh	r2, [r1]	@ movhi
	b	.L27
.L24:
	mov	r2, #512
	ldr	r4, [r7, #4]
	strh	r2, [fp, #136]	@ movhi
	strh	r2, [fp, #200]	@ movhi
	b	.L25
.L22:
	mov	r3, #512
	strh	r3, [fp, #8]	@ movhi
	ldr	r3, [r5, #4]
	b	.L23
.L47:
	ldr	r2, [sp, #44]
	mov	r3, r2
	add	ip, r2, #288
.L51:
	add	r1, r3, #8
	ldm	r1, {r1, r2}
	ldr	r0, [r3]
	add	r0, r0, r1
	ldr	r1, [r3, #4]
	sub	r1, r1, r2
	rsb	r2, r2, #0
	str	r0, [r3]
	str	r2, [r3, #12]
	str	r1, [r3, #4]
	add	r3, r3, #36
	cmp	ip, r3
	bne	.L51
	b	.L52
.L42:
	ldr	r2, [sp, #36]
	mov	r3, r2
	add	lr, r2, #288
.L46:
	add	r1, r3, #8
	ldm	r1, {r1, r2}
	ldr	ip, [r3]
	add	ip, ip, r1
	ldr	r1, [r3, #4]
	sub	r1, r1, r2
	rsb	r2, r2, #0
	str	ip, [r3]
	str	r2, [r3, #12]
	str	r1, [r3, #4]
	add	r3, r3, #36
	cmp	lr, r3
	bne	.L46
	b	.L49
.L37:
	ldr	r2, [sp, #40]
	mov	r3, r2
	add	r4, r2, #288
.L41:
	add	r1, r3, #8
	ldm	r1, {r1, r2}
	ldr	lr, [r3]
	add	lr, lr, r1
	ldr	r1, [r3, #4]
	sub	r1, r1, r2
	rsb	r2, r2, #0
	str	lr, [r3]
	str	r2, [r3, #12]
	str	r1, [r3, #4]
	add	r3, r3, #36
	cmp	r4, r3
	bne	.L41
	b	.L44
.L32:
	ldr	r2, [sp, #32]
	mov	r3, r2
	add	r4, r2, #288
.L36:
	add	r1, r3, #8
	ldm	r1, {r1, r2}
	ldr	lr, [r3]
	add	lr, lr, r1
	ldr	r1, [r3, #4]
	sub	r1, r1, r2
	rsb	r2, r2, #0
	str	lr, [r3]
	str	r2, [r3, #12]
	str	r1, [r3, #4]
	add	r3, r3, #36
	cmp	r3, r4
	bne	.L36
	b	.L39
.L17:
	mov	ip, r3
	ldr	r6, .L191+12
	ldr	r5, .L191+16
	ldr	r4, .L191+20
	ldr	lr, .L191+24
	add	r9, r3, #288
	str	r6, [sp, #32]
	str	r5, [sp, #40]
	str	r4, [sp, #36]
	str	lr, [sp, #44]
	str	r9, [sp, #24]
.L20:
	ldr	r3, [ip, #24]
	ldr	r0, [r6, #24]
	adds	r3, r3, #1
	and	r3, r3, #1
	rsbmi	r3, r3, #0
	ldr	r1, [r5, #24]
	adds	r0, r0, #1
	and	r0, r0, #1
	ldr	r2, [r4, #24]
	rsbmi	r0, r0, #0
	adds	r1, r1, #1
	and	r1, r1, #1
	str	r3, [ip, #24]
	rsbmi	r1, r1, #0
	ldr	r3, [lr, #24]
	adds	r2, r2, #1
	and	r2, r2, #1
	rsbmi	r2, r2, #0
	adds	r3, r3, #1
	and	r3, r3, #1
	add	ip, ip, #36
	rsbmi	r3, r3, #0
	cmp	ip, r9
	str	r0, [r6, #24]
	str	r1, [r5, #24]
	str	r2, [r4, #24]
	str	r3, [lr, #24]
	add	r6, r6, #36
	add	r5, r5, #36
	add	r4, r4, #36
	add	lr, lr, #36
	bne	.L20
	b	.L21
.L190:
	mov	r2, #1
	ldr	r3, .L191+44
	ldr	r1, [r3, #20]
	ldr	r3, .L191+80
	cmp	r1, #0
	str	r2, [r3]
	bne	.L84
	ldm	r8, {r0, r1}
	bl	fireEnemy.part.0
	b	.L84
.L189:
	mov	r2, #2
	ldr	r3, .L191+44
	ldr	r1, [r3, #20]
	ldr	r3, .L191+80
	cmp	r1, #0
	str	r2, [r3]
	bne	.L81
	ldm	r10, {r0, r1}
	bl	fireEnemy.part.0
	b	.L81
.L188:
	mov	r2, #2
	ldr	r3, .L191+44
	ldr	r1, [r3, #20]
	ldr	r3, .L191+80
	cmp	r1, #0
	str	r2, [r3]
	bne	.L78
	ldm	r7, {r0, r1}
	bl	fireEnemy.part.0
	b	.L78
.L187:
	mov	r2, #3
	ldr	r3, .L191+44
	ldr	r1, [r3, #20]
	ldr	r3, .L191+80
	cmp	r1, #0
	str	r2, [r3]
	bne	.L75
	ldm	r5, {r0, r1}
	bl	fireEnemy.part.0
	b	.L75
.L179:
	ldr	r2, .L191+72
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	b	.L19
.L192:
	.align	2
.L191:
	.word	frameCounter
	.word	1717986919
	.word	enemy1
	.word	enemy2
	.word	enemy2b
	.word	enemy3
	.word	enemy3b
	.word	1374389535
	.word	shadowOAM
	.word	player
	.word	bullets
	.word	enemyBullets
	.word	livesRemaining
	.word	goToLose
	.word	collision
	.word	enemiesRemaining
	.word	rand
	.word	274877907
	.word	enemyBulletTimer
	.word	__aeabi_idivmod
	.word	enemyType
	.size	updateEnemy, .-updateEnemy
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
	str	lr, [sp, #-4]!
	mov	r2, #16
	mov	lr, #1
	mov	ip, #142
	mov	r0, #112
	mov	r1, #50
	ldr	r3, .L195
	str	lr, [r3, #16]
	str	r2, [r3, #24]
	str	r2, [r3, #20]
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r1, [r3, #28]
	ldr	lr, [sp], #4
	bx	lr
.L196:
	.align	2
.L195:
	.word	player
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
	push	{r4, r5, r6, r7, lr}
	ldr	r5, .L215
	ldr	r0, [r5, #16]
	ldr	r1, [r5, #12]
	ldr	r2, [r5, #4]
	ldr	r3, [r5]
	sub	sp, sp, #20
	ldr	r4, .L215+4
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #20
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	ldr	r6, .L215+8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L210
	ldr	r1, .L215+12
.L198:
	ldr	r3, .L215+16
	ldrh	r3, [r3, #48]
	tst	r3, #32
	ldr	r2, [r4, #4]
	beq	.L213
.L199:
	ldr	r3, .L215+16
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L200
	ldr	r3, [r4, #24]
	add	r3, r2, r3
	cmp	r3, #234
	ldrle	r3, [r4, #16]
	addle	r2, r2, r3
	strle	r2, [r4, #4]
.L200:
	ldr	r3, .L215+16
	ldrh	r3, [r3, #48]
	ands	r3, r3, #1
	ldr	r0, [r4, #28]
	ldr	ip, [r4]
	bne	.L212
	cmp	r0, #59
	ble	.L212
	ldr	r5, .L215+20
.L203:
	ldr	r0, [r5, r3, lsl #5]
	cmp	r0, #0
	lsl	lr, r3, #5
	beq	.L214
	add	r3, r3, #1
	cmp	r3, #5
	bne	.L203
.L205:
	mov	r0, #1
	b	.L202
.L212:
	add	r0, r0, #1
.L202:
	mov	r3, #192
	orr	r2, r2, #16384
	strh	r2, [r1, #2]	@ movhi
	strh	ip, [r1]	@ movhi
	str	r0, [r4, #28]
	strh	r3, [r1, #4]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L213:
	cmp	r2, #5
	ldrgt	r3, [r4, #16]
	subgt	r2, r2, r3
	strgt	r2, [r4, #4]
	b	.L199
.L210:
	mov	r0, #512
	mov	lr, #0
	ldr	r1, .L215+24
	ldr	ip, .L215+28
	ldr	r2, [r1]
	ldr	r3, [ip]
	sub	r2, r2, #1
	str	r2, [r1]
	ldr	r1, .L215+12
	sub	r2, r3, #1
	str	r2, [ip]
	lsl	r3, r3, #3
	add	r2, r1, #464
	strh	r0, [r2]	@ movhi
	str	lr, [r5, #20]
	strh	r0, [r1, r3]	@ movhi
	b	.L198
.L214:
	mvn	r7, #1
	mov	r6, #1
	ldr	r5, .L215+32
	add	lr, r5, lr
	str	r2, [lr, #4]
	str	r0, [lr, #24]
	str	ip, [r5, r3, lsl #5]
	str	r7, [lr, #8]
	str	r6, [lr, #20]
	b	.L205
.L216:
	.align	2
.L215:
	.word	enemyBullets
	.word	player
	.word	collision
	.word	shadowOAM
	.word	67109120
	.word	bullets+20
	.word	livesRemaining
	.word	lifeIndex
	.word	bullets
	.size	updatePlayer, .-updatePlayer
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
	@ link register save eliminated.
	mov	r2, #0
	mov	ip, #5
	mov	r1, r2
	mov	r0, #2
	ldr	r3, .L220
.L218:
	str	r2, [r3, #28]
	add	r2, r2, #1
	cmp	r2, #5
	str	ip, [r3, #12]
	str	r0, [r3, #16]
	str	r1, [r3, #20]
	add	r3, r3, #32
	bne	.L218
	ldr	r3, .L220+4
	str	r2, [r3, #12]
	str	r0, [r3, #16]
	str	r1, [r3, #20]
	bx	lr
.L221:
	.align	2
.L220:
	.word	bullets
	.word	enemyBullets
	.size	initBullets, .-initBullets
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	bl	initEnemies
	mov	r2, #11
	mov	r1, #98
	mov	r4, #1
	mov	r0, #16
	mov	r8, #142
	mov	r7, #112
	mov	r6, #50
	mov	lr, #56
	mov	r5, #3
	ldr	r3, .L224
	ldr	r9, .L224+4
	add	ip, r3, #432
	strh	r2, [ip]	@ movhi
	strh	r9, [ip, #2]	@ movhi
	add	ip, r3, #436
	strh	r1, [ip]	@ movhi
	add	ip, r3, #444
	strh	r1, [ip]	@ movhi
	add	ip, r3, #452
	strh	r1, [ip]	@ movhi
	add	r1, r3, #440
	add	r3, r3, #448
	strh	r2, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r2, .L224+8
	strh	r2, [r1, #2]	@ movhi
	add	r2, r2, #8
	strh	r2, [r3, #2]	@ movhi
	ldr	r3, .L224+12
	str	r4, [r3, #16]
	ldr	r4, .L224+16
	ldr	r2, .L224+20
	str	r8, [r3]
	str	r0, [r3, #24]
	str	r0, [r3, #20]
	str	r7, [r3, #4]
	str	r6, [r3, #28]
	ldr	r3, .L224+24
	mov	r0, r4
	str	r5, [r2]
	str	lr, [r3]
	bl	initBullets
	add	r0, r4, #32
	bl	initBullets
	add	r0, r4, #64
	bl	initBullets
	add	r0, r4, #96
	bl	initBullets
	add	r0, r4, #128
	bl	initBullets
	mov	r3, #0
	ldr	r2, .L224+28
	ldr	r0, .L224+32
	ldrh	ip, [r2, #48]
	ldr	r1, .L224+36
	ldr	r2, .L224+40
	strh	ip, [r0]	@ movhi
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L225:
	.align	2
.L224:
	.word	shadowOAM
	.word	16591
	.word	16599
	.word	player
	.word	bullets
	.word	livesRemaining
	.word	lifeIndex
	.word	67109120
	.word	buttons
	.word	frameCounter
	.word	seed
	.size	initGame, .-initGame
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
	mov	r3, #0
	ldr	r0, .L237
	ldr	r2, [r0, r3, lsl #5]
	cmp	r2, #0
	lsl	r1, r3, #5
	beq	.L236
.L227:
	add	r3, r3, #1
	cmp	r3, #5
	bxeq	lr
	ldr	r2, [r0, r3, lsl #5]
	cmp	r2, #0
	lsl	r1, r3, #5
	bne	.L227
.L236:
	push	{r4, r5, lr}
	mvn	r4, #1
	mov	lr, #1
	ldr	ip, .L237+4
	ldr	r0, .L237+8
	ldm	ip, {r5, ip}
	add	r1, r0, r1
	str	r5, [r0, r3, lsl #5]
	str	r4, [r1, #8]
	str	lr, [r1, #20]
	str	ip, [r1, #4]
	str	r2, [r1, #24]
	pop	{r4, r5, lr}
	bx	lr
.L238:
	.align	2
.L237:
	.word	bullets+20
	.word	player
	.word	bullets
	.size	fireBullet, .-fireBullet
	.align	2
	.global	fireEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireEnemy, %function
fireEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L241
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bxne	lr
	b	fireEnemy.part.0
.L242:
	.align	2
.L241:
	.word	enemyBullets
	.size	fireEnemy, .-fireEnemy
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
	ldr	r3, [r0, #20]
	cmp	r3, #0
	beq	.L244
	ldr	r2, [r0]
	cmp	r2, #0
	movle	r3, #0
	push	{r4, r5, lr}
	mov	r4, #196
	strle	r3, [r0, #20]
	ldr	r3, [r0, #28]
	ldr	r5, [r0, #8]
	ldr	r1, [r0, #4]
	ldr	lr, .L251
	add	r3, r3, #49
	lsl	r3, r3, #3
	add	ip, lr, r3
	add	r2, r2, r5
	orr	r1, r1, #16384
	str	r2, [r0]
	strh	r2, [lr, r3]	@ movhi
	strh	r4, [ip, #4]	@ movhi
	strh	r1, [ip, #2]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L244:
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxne	lr
	mov	ip, #512
	mov	r2, #1
	ldr	r3, [r0, #28]
	ldr	r1, .L251
	add	r3, r3, #49
	lsl	r3, r3, #3
	strh	ip, [r1, r3]	@ movhi
	str	r2, [r0, #24]
	bx	lr
.L252:
	.align	2
.L251:
	.word	shadowOAM
	.size	updateBullet, .-updateBullet
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
	ldr	r1, .L261
	push	{r4, r5, r6, lr}
	ldr	r4, .L261+4
	ldr	r3, [r1]
	ldr	r2, [r4]
	add	r3, r3, #1
	mov	r0, r3
	add	r2, r2, #1
	ldr	r5, .L261+8
	str	r3, [r1]
	str	r2, [r4]
	mov	lr, pc
	bx	r5
	bl	updatePlayer
	bl	updateEnemy
	ldr	r0, .L261+12
	bl	updateBullet
	ldr	r0, .L261+16
	bl	updateBullet
	ldr	r0, .L261+20
	bl	updateBullet
	ldr	r0, .L261+24
	bl	updateBullet
	ldr	r0, .L261+28
	bl	updateBullet
	ldr	r3, .L261+32
	ldr	r3, [r3, #20]
	cmp	r3, #0
	blne	updateBulletE.part.2
.L254:
	ldr	r3, .L261+36
	mov	lr, pc
	bx	r3
	ldr	r5, .L261+40
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L261+44
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r2, [r4]
	ldr	r3, .L261+48
	smull	r1, r0, r2, r3
	sub	r3, r0, r2, asr #31
	add	r3, r3, r3, lsl #1
	cmp	r2, r3
	ldreq	r2, .L261+52
	ldreq	r3, [r2]
	subeq	r3, r3, #1
	streq	r3, [r2]
	mov	r2, #67108864
	ldrne	r3, .L261+52
	ldrne	r3, [r3]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r2, #18]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L262:
	.align	2
.L261:
	.word	seed
	.word	frameCounter
	.word	srand
	.word	bullets
	.word	bullets+32
	.word	bullets+64
	.word	bullets+96
	.word	bullets+128
	.word	enemyBullets
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	1431655766
	.word	vOff
	.size	updateGame, .-updateGame
	.align	2
	.global	updateBulletE
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBulletE, %function
updateBulletE:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L265
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bxeq	lr
	b	updateBulletE.part.2
.L266:
	.align	2
.L265:
	.word	enemyBullets
	.size	updateBulletE, .-updateBulletE
	.align	2
	.global	initLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLives, %function
initLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #11
	mov	r1, #98
	push	{r4, lr}
	mov	ip, #56
	mov	lr, #3
	ldr	r3, .L269
	ldr	r4, .L269+4
	add	r0, r3, #432
	strh	r2, [r0]	@ movhi
	strh	r4, [r0, #2]	@ movhi
	add	r0, r3, #436
	strh	r1, [r0]	@ movhi
	add	r0, r3, #444
	strh	r1, [r0]	@ movhi
	add	r0, r3, #452
	strh	r1, [r0]	@ movhi
	add	r4, r4, #8
	add	r1, r3, #440
	add	r3, r3, #448
	strh	r2, [r1]	@ movhi
	strh	r4, [r1, #2]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r0, .L269+8
	ldr	r1, .L269+12
	ldr	r2, .L269+16
	str	lr, [r1]
	strh	r0, [r3, #2]	@ movhi
	str	ip, [r2]
	pop	{r4, lr}
	bx	lr
.L270:
	.align	2
.L269:
	.word	shadowOAM
	.word	16591
	.word	16607
	.word	livesRemaining
	.word	lifeIndex
	.size	initLives, .-initLives
	.align	2
	.global	drawLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLives, %function
drawLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L279
	ldr	r0, [r3]
	cmp	r0, #0
	bxle	lr
	mov	r2, #207
	str	lr, [sp, #-4]!
	mov	ip, #98
	mov	lr, #11
	lsl	r0, r0, #3
	ldr	r3, .L279+4
	add	r0, r0, r2
.L273:
	orr	r1, r2, #16384
	add	r2, r2, #8
	cmp	r2, r0
	strh	lr, [r3]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	add	r3, r3, #8
	bne	.L273
	ldr	lr, [sp], #4
	bx	lr
.L280:
	.align	2
.L279:
	.word	livesRemaining
	.word	shadowOAM+432
	.size	drawLives, .-drawLives
	.comm	vOff,4,4
	.comm	frameCounter,4,4
	.comm	shadowOAM,1024,4
	.comm	lifeIndex,4,4
	.comm	seed,4,4
	.comm	enemyType,4,4
	.comm	enemyBulletTimer,4,4
	.comm	livesRemaining,4,4
	.comm	enemiesRemaining,4,4
	.comm	enemyBullets,32,4
	.comm	bullets,160,4
	.comm	enemy3b,288,4
	.comm	enemy3,288,4
	.comm	enemy2b,288,4
	.comm	enemy2,288,4
	.comm	enemy1,288,4
	.comm	player,32,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
