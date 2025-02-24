.data
    strFound: .string "L'elemento %d cercato è all'indice %d"
    strNotFound: .string "L'elemento %d cercato non è presente nell'array"
.text
.global cercaIn_IesimoVettore
.type cercaIn_IesimoVettore, %function

cercaIn_IesimoVettore:
    @r0 int**, r1 indice vettore da cercare, r2 x da cercare, r12 val. ritorno, r3 elem. corrente
    mov r12, #-1
    push {r2}
    ldr r0, [r0, r1, lsl #2] @sovrascrivo il valore dell'int** che uso una sola volta
    mov r1,#0 @sovrascrivo anche l'indice, ormai ho già dereferenziato l'array i-esimo
    
loop:
    cmp r1,#8
    beq fineNonTrovato
    ldr r3, [r0,r1,lsl #2]
    cmp r3,r2
    mov r12,r1
    beq fineTrovato
    add r1,r1,#1
    b loop

fineTrovato:
    pop {r1}
    push {lr}
    mov r2,r12
    ldr r0, =strFound
    bl printf
    pop {lr}
    mov pc,lr

fineNonTrovato:
    pop {r1}
    ldr r0, =strNotFound
    push {lr}
    bl printf
    pop {lr}
    mov pc,lr


    
