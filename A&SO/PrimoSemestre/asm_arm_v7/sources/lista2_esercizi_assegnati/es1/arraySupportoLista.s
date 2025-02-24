.text
.global arraySupportoLista
.type arraySupportoLista , %function

    @r0/r7 testa prima lista, r1/r6 testa seconda lista, r5 testa nuova lista, r9 prima len, r10 seconda len, poi len finale
    @r4 indirizzo array contenente valori

arraySupportoLista:
    push {r4-r10,lr}
    mov r7,r0
    mov r6,r1
    bl contaElemLista
    mov r9,r0
    mov r0,r6
    bl contaElemLista
    mov r10,r0
    add r10,r10,r9
    lsl r0,r10,#2
    bl malloc
    mov r4,r0
    mov r3,#0 @indice
loop1:
    ldr r2,[r7,#4] @carica in r2 il campo next
    cmp r2,#0 @cnt se è null
    ldr r12,[r7]
    str r12,[r4,r3,lsl #2] 
    beq afterloop1
    ldr r7,[r7,#4]
    add r3,r3,#1
    b loop1
afterloop1:
    add r3,r3,#1
loop2:
    ldr r2,[r6,#4]
    cmp r2,#0
    ldr r12,[r6]
    str r12,[r4,r3,lsl #2]
    beq afterloop2
    ldr r6,[r6,#4]
    add r3,r3,#1
    b loop2
afterloop2:
    @r10 contiene la len
    mov r0,#8 @grandezza attesa della struct che voglio ritornare
    bl malloc
    str r10,[r0]
    str r4,[r0,#4]
    pop {r4-r10}
    pop {pc}


    

 