.text
.global red_sum
.type red_sum, %function

@ int sum_arr (int* arr (r0), int len)

red_sum:
    push {r4}
    @ ldr r0, =word @ ptr primo elem
    @ mov r1, #5 @ len prefissata
    mov r2, #0 @ indice
    mov r3, #0 @ somma
    
loop:
    cmp r2,r1
    beq fine
    ldr r4, [r0, r2, lsl #2] @ curr
    add r3, r3, r4 @ acc += curr
    add r2,r2,#1 @ i++
    cmp r2,r1
    blt loop

fine:
    mov r0,r3
    pop {r4}
    mov pc,lr

@.data
@    word: .word 11,22,33,44,55