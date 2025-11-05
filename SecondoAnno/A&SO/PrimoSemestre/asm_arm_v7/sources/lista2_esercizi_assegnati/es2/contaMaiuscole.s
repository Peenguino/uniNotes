.text
.global contaMaiuscole
.type contaMaiuscole, %function

@ assumiamo che il chiamante ci passi una stringa in r0, quindi char* con '\0' alla fine
contaMaiuscole:
    mov r3,#0 @contatore lettere maiuscole
    mov r2,#0 @indice
loop:
    ldrb r1,[r0,r2] @corrente char
    cmp r1,#0
    beq fine
    cmp r1,#65
    bge maggioreDiA
    add r2,r2,#1
    b loop
maggioreDiA:
    cmp r1,#90
    ble minoreDiZ
    add r2,r2,#1
    b loop
minoreDiZ:
    add r3,r3,#1
    add r2,r2,#1
    b loop
fine:
    mov r0,r3
    mov pc,lr

