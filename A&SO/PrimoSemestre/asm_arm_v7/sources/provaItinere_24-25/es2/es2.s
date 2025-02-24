.text
.global conta_stringhe
.type conta_stringhe, %function

@r0 base array di str
@r1 len dell'array di str
conta_stringhe:
    push {r4-r9,lr}
    mov r4,r0 @base array
    mov r5,r1 @len array
    mov r6,#0 @ptr str corrente
    mov r7,#0 @contatore finale
    mov r8,#0 @indice
    mov r9,#0 @ris. corrente

loop:
    cmp r8,r5
    beq fine
    ldr r9,[r4,r8,lsl #2]
    mov r0,r9
    bl conta
    mov r9,r0
    add r7,r7,r9
    add r8,r8,#1
    b loop

fine:
    mov r0,r7
    pop {r4-r9,lr}
    mov pc,lr
        
