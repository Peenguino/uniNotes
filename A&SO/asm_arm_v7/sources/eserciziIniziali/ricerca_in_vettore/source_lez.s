.text
.global cerca
.type cerca, %function
cerca:
    push {r4} @preserva r4 originale
    mov r4,#0 @r4 sarà indice
for:
    ldr r3,[r1],#4 @r3 assumerà corrente elemento array, post incremento sulla base dell'array
    cmp r3, r0 @confronto se curr == val_cercato
    beq fine_trovato @se l'ho trovato, salto a fine trovato
    add r4,r4,#1 @incremento indice depositato in r4
    cmp r4,r2 @compare indice e len
    beq fine_non_trovato @se questi sono uguali, allora ho finito di scorrere
    B for @ altrimenti reitera
fine_trovato:
    mov r0,r4 @ se ho trovato, sposto indice in reg. risultato r0
    pop {r4} @ ritorno al valore originale di r4
    mov pc,lr @ ritorno al chiamante
fine_non_trovato:
    mov r0,#-1 @ se non ho trovato ritorno -1 mettendolo nel reg. risultato r0
    pop {r4} @ ritorno al valore originale di r4
    mov pc,lr @ ritorno al chiamante