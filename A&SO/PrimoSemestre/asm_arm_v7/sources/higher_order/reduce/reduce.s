.text
.global reduce
.type reduce, %function

@extern int reduce (int* arr, redFun ptrFun, int initAcc, int len);
@typedef int (*redFun)(int acc,int curr);

reduce:
    push {r4-r9,lr}
    mov r4,r2 @r4 accum
    mov r5,r0 @r5 base array
    mov r6,r1 @puntatore a funz.
    mov r7,r3 @len dell'array
    mov r8,#0 @indice
    mov r9,#0 @elemento corrente

loop:
    cmp r8,r7
    beq fine
    ldr r9,[r5,r8, lsl #2]
    mov r1,r9
    mov r0,r4
    mov lr,pc @salto a funzione puntata
    mov pc,r6 @salto a funzione puntata
    mov r4,r0
    add r8,r8,#1
    b loop

fine:
    mov r0,r4
    pop {r4-r9,pc}
