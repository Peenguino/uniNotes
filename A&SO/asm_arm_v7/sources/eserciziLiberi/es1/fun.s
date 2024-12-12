.text
.global funOperazione
.type funOperazione, %function

funOperazione:
    push {r4-r7,lr}
    mov r7,r0
    mov r5,r1
    mov r6,r2
    mov r0,r7 @converto primo operando
    bl atoi
    mov r4,r0 @salvo primo risultato numerico in r4
    mov r0,r6 @sposto secondo operando in r0
    bl atoi
    mov r6,r0 @salvo secondo risultato numerico in r6
caso1:
    cmp r5,#43
    bne caso2
    add r0,r4,r6
    b fine
caso2:
    cmp r5,#45
    bne caso3
    sub r0,r4,r6
    b fine
caso3:
    cmp r5,#42
    bne default
    mul r0,r4,r6
    b fine
default:
    mov r0,#-1
fine:
    pop {r4-r7,pc}
