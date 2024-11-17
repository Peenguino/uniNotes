.text
.global map
.type map, %function

map:
    push {r4-r8,lr}
    mov r4, r0 @r4 contiene base array di stringhe
    mov r5, #0 @somma, risultato finale
    mov r6, #0 @indice
    mov r7, #0 @stringa corrente su cui chiamerò la myatoi
    mov r8, r1 @len dell'array di stringhe
loop:
    cmp r6,r8
    beq fine
    ldr r7,[r4,r6,lsl #2]
    mov r0,r7
    bl myatoi
    cmp r0,#-1
    addeq r6,r6,#1
    beq loop
    lsr r0,r0,#2 
    add r5,r5,r0
    add r6,r6,#1
    b loop
fine:
    mov r0,r5
    @azzero tutti i temporanei prima del ritorno, tranne l'effettivo r0 val rit.
    mov r1,#0
    mov r2,#0
    mov r3,#0
    pop {r4-r8,pc}