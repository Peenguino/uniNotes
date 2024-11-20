.text
.global conta
.type conta, %function

@ r0 contiene base str
conta:
    push {r4-r6}
    mov r1,#0 @indice corr.
    mov r5,#1 @indice succ.
    mov r2,#0 @elemento corr.
    mov r3,#0 @elemento succ.
    mov r4,#0 @contatore
    mov r6,#0 @diff. corrente

loop:
    mov r6,#0 @azzero ris. precedente
    ldrb r2,[r0,r1]
    cmp r2,#0 @fine stringa \0
    beq fine
    ldrb r3,[r0,r5]
    sub r6,r3,r2
    cmp r6,#1
    bne skip_sum_cont
    add r4,r4,#1

skip_sum_cont:
    add r1,r1,#1
    add r5,r5,#1
    b loop

fine:
    mov r0,r4
    pop {r4,r5}
    mov pc,lr


