.text
.global myatoi
.type myatoi, %function

@r0 ptr str
myatoi:
    mov r1,#0 @indice
    @r2 corrente char
    mov r3,#1 @r3 moltiplicatore posizionale per 10 (1,10,100,1000...)
    mov r12,#10
    push {r4} @r4 risultato accumulato
    mov r4,#0

first_loop:
    ldrb r2,[r0,r1]
    cmp r2,#0
    add r1,r1,#1
    bne first_loop
    sub r1,r1,#2
loop:
    ldrb r2,[r0,r1]
    cmp r1,#0
    blt fine
    cmp r2,#48
    bge mag_char_zero
    b errore_simbolo

mag_char_zero:
    cmp r2,#57
    ble min_char_nove
    b errore_simbolo

min_char_nove:
    sub r2,r2,#48
    mul r2,r2,r3
    mul r3,r3,r12
    add r4,r4,r2
    sub r1,r1,#1
    b loop

errore_simbolo:
    pop {r4}
    mov r0,#-1
    mov pc,lr

fine:
    mov r0,r4
    pop {r4}
    mov pc,lr
