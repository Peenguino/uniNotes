.text
.global map_mul
.type map_mul, %function

@ r0 ind. vett, r1 len, r2 fattore, r3 indice, r4 valore corrente

map_mul:
    push {r4}
    mov r3, #0
    cmp r3,r1
    beq fine
loop:
    cmp r3,r1
    beq fine
    ldr r4, [r0, r3, lsl #2]
    mul r4, r4, r2
    str r4, [r0, r3, lsl #2]
    add r3, r3, #1
    cmp r3,r1
    blt loop 
fine:
    pop {r4}
    mov pc, lr