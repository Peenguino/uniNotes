.text
.global map_mul_even_odd
.type map_mul_even_odd, %function

@ r0 base arr, r1 len, r2 fatt_pari, r3 fatt_dispari, r4 indice, r5 val. corrente

map_mul_even_odd:
    push {r4,r5,r6}
    mov r4, #0 @init indice
    mov r5, #0 @init val.corrente
loop:
    cmp r4,r1 @cmp indice e len
    beq fine
    ldr r5, [r0, r4, lsl #2] @ carico in r5 ind r0 base con indice r4
if:
    ands r6,r5,#1 @ands influenza Z, dunque se ris di ands è 1, allora Z = 0 altrimenti Z = 1, per questo è BNE per i dispari
    bne else
    mul r5,r5,r2
    str r5, [r0,r4, lsl #2]
    b oltre_else
else:
    mul r5,r5,r3
    str r5, [r0, r4, lsl #2]
oltre_else:
    add r4,r4,#1
    cmp r4,r1
    blt loop
fine:
    pop {r4,r5,r6}
    mov pc,lr
