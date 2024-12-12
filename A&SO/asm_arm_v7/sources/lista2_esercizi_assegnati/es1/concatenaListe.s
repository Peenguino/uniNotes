.text
.global concatenaListe
.type concatenaListe, %function

@supponiamo di invocare con r0 lista1 e r1 lista2
concatenaListe:
    push {r4-r10,lr}
    bl arraySupportoLista
    @r0 è la struct array/len, destrutturo quindi in registri preservati
    ldr r4,[r0] @carico la len in r4
    ldr r5,[r0,#4] @carico il ptr arr in r5
    mov r6, #0 @r6 mantiene il riferimento alla testa della lista iniziale
    mov r8,#8 @carico in r12 il valore cst da passare alla malloc
    mov r7,#0 @inizializzo un indice i
    mov r9,#0 @r9 corrente elemento
loop:
    cmp r7,r4
    beq fine
    mov r0,r8
    bl malloc
    push {r9}
    mov r9,r0 @r9 elemento corrente
    cmp r7,#0 @comparo indice
    bne not_first
    mov r6,r9
    @str r7,[r9,r8,lsr #1]
not_first:
    ldr r1,[r5,r7,lsl #2] @carica in r1 l'elemento a[i]
    str r1,[r9] @deposita in memoria a [r8] l'elemento a[i]
    pop {r10}
    cmp r10,#0
    beq still_first
    str r9,[r10,r8,lsr #1]
still_first:
    add r7,r7,#1
    b loop
fine:
    mov r0,r6
    pop {r4-r10,pc}
    


