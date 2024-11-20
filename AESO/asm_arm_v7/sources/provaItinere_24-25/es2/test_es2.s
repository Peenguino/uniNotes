.text
.global main
.type main, %function

main: 	push {lr}
	bl prep    	@ prepara v
	ldr r0,=v
	ldr r1,=n
	ldr r1,[r1]
	bl conta
	mov r1, r0	@QUI SI PUÒ CONTROLLARE IL RISULTATO
	ldr r0, =fmt @ DA QUI IN POI FUNZIONA SOLO CON CROSS-TOOLCHAIN … 
	bl printf
	pop {pc}


	.data
fmt:	.string "Ris = %d\n"
s1:	.string "abdefhu"	@ deve dare 3 (ab, de, ef)
s2:	.string "HJdfg" 	@ deve dare 1 (fg)
s3:	.string "aerdswxz"	@ deve dare 1 (wx)
n:	.word 3
v:	.fill 12

	.text
    
prep:	ldr r0, =v
	ldr r1, =s1
	str r1, [r0],#4
	ldr r1, =s2
	str r1, [r0],#4
	ldr r1, =s3
	str r1, [r0],#4
	mov pc, lr
