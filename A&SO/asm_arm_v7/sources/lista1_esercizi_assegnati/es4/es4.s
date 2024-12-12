.data
    str1: .string "La lista passata ha %d elementi\n"
.text
.global contaElemLista
.type contaElemLista, %function

contaElemLista:
    @ r0 ptr a elemento della lista
    mov r12, #0 @contatore
    @ se r0 punta a 8 byte, noi ne skippiamo 4 e dereferenziamo il puntatore dopo aver incrementato
    @ depositamo quindi il corrente campo "next" nel registro r3
loop:
    ldr r3,[r0,#4]
    cmp r3, #0
    add r12,r12,#1
    beq fine
    mov r0,r3
    b loop
fine:
    ldr r0,=str1
    mov r1,r12
    push {lr}
    bl printf
    pop {lr}
    mov r0,r1
    mov pc,lr