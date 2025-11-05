.text
.global cerca
.type cerca, %function
@   r0: val_cercato, r1: base_vett, r2: len_vett, r3: risultato, r4: indice, r5: val. corrente
cerca:
    push {r4,r5}
    mov r4,#0
loop:
    cmp r4,r2
    beq fine
    ldr r5, [r1, r4, lsl #2] @ r1 + (r4 * 4)
    cmp r0,r5
    add r4,r4,#1
    bne oltrethen
then:
    mov r3,r4
    b fine
oltrethen:
    cmp r4,r2
    blt loop
fine:
    bne fine_neq
    mov r0,r3
    pop {r4,r5}
    mov pc,lr
fine_neq:
    mov r0,#-1
    pop {r4,r5}
    mov pc,lr