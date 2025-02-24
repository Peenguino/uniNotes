.data
    str1: .string "pippopluto"
    str2: .string "Le occorrenze di della lettera p sono %d\n"
.text
.global main
.type main, %function

main:
    ldr r0, =str1 @base stringa
    mov r1, #'p' @carattere cercato
    mov r2, #0 @indice
    mov r3, #0 @contatore
loop:
    ldrb r12, [r0,r2] @curr. val, ATTENZIONE ALLA LDRB/STRB se lavori su char
    cmp r12, #0
    beq fine
    cmp r12,r1
    bne afterthen
then:
    add r3,r3,#1
afterthen:
    add r2,r2,#1
    b loop
fine:
    ldr r0,=str2
    mov r1,r3
    push {lr}
    bl printf
    pop {lr}
    mov pc,lr




