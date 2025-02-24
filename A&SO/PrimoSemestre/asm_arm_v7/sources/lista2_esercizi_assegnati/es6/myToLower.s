.text
.global myToLower
.type myToLower, %function

@assumo di ricevere in r0 un carattere maiuscolo, quindi somma l'offset
myToLower:
    add r0,r0,#32
    mov pc,lr
