.data
    str1: .string "La somma dei pari è %d\nLa somma dei dispari è %d\n"
.text
.global main

main:
    push {r4-r9,lr}
    mov r4,r0 @len argc
    mov r5,r1 @base array parametri (argv)
    mov r6,#1 @indice
    mov r7,#0 @accumulatore somma pari
    mov r8,#1 @accumulatore prodotto dispari
    mov r9,#0 @elemento corrente
loop:
    cmp r6,r4
    beq fine
    ldr r0,[r5,r6,lsl #2] @stringa corrente
    bl atoi
    mov r9,r0
    ands r12,r9,#1 @ultimo bit 1 in and con contenuto r9
    bne dispari
    add r7,r7,r9
    add r6,r6,#1
    b loop
dispari:
    mul r8,r8,r9
    add r6,r6,#1
    b loop
fine:
    ldr r0,=str1
    mov r1,r7
    mov r2,r8
    bl printf
    pop {r4-r9,pc}