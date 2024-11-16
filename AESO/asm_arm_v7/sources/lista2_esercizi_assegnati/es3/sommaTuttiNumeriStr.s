.text
.global sommaTuttiNumeriStr
.type sommaTuttiNumeriStr, %function

@assumiamo di ricevere dal chiamante in r0 il ptr alla stringa, e questa termina in '\0'
sommaTuttiNumeriStr:
    mov r1,#0 @indice
    mov r2,#0 @elemento corrente
    mov r3,#0 @somma
loop:
    ldrb r2,[r0,r1]
    cmp r2,#0
    beq fine
    cmp r2,#48
    bge maggioreDiZero
    add r1,r1,#1
    b loop
maggioreDiZero:
    cmp r2,#57
    ble minoreDiNove
    add r1,r1,#1
    b loop
minoreDiNove:
    sub r2,r2,#48
    add r3,r3,r2
    add r1,r1,#1
    b loop
fine:
    mov r0,r3
    mov pc,lr

