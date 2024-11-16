.text
.global map
.type map, %function

@ r0 ptr a fn, r1 vett, r2 len vett, r3 indice, r4 valore corrente

map:
    push {r4,lr} @preserva val r4 e lr al chiamante nel main
    mov r3, #0 @inizializza indice a 0

loop:
    cmp r3,r2
    beq fine

    push {r0-r3}

    ldr r4,[r1,r3,lsl #2]
    mov r1,r0 @metto ptr fn in r1
    mov r0,r4 @per invocare fn, metto curr. val in r0
    @invocazione funzione il cui ptr è in r1
    mov lr,pc
    mov pc,r1
    mov r12, r0 @sposto valore calcolato nella fn puntata in r12

    pop {r0-r3}

    str r12, [r1,r3,lsl #2]

    add r3, r3, #1
    cmp r3,r2
    blt loop

fine:
    pop {r4,lr}
    mov pc,lr

    