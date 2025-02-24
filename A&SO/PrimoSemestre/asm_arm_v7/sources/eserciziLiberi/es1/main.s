.data
    str1: .string "%s %c %s = %d"
.text
.global main

main:
    push {r4,r5,lr}
    ldr r2,[r1,#4] @primo operando
    ldr r3,[r1,#8] @operatore (stringa)
    ldrb r5,[r3,#0] @operatore (char)
    ldr r12,[r1,#12] @secondo operando
    push {r2,r5,r12}
    mov r0,r2
    mov r1,r5
    mov r2,r12
    bl funOperazione
    mov r4,r0
    pop {r1,r2,r3}
    push {r4}
    ldr r0,=str1
    bl printf
    pop {r4}
    pop {r4,r5,pc}

