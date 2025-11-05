@assumiamo di voler essere invocati da terminale con due parametri, ossia due istruzioni in linguaggio macchina
@queste saranno in esadecimale, ogni cifra rappresenta mezzo byte, e in totale saranno 8, dunque 4 byte
@consultando gli appunti (lez 15-24/25) possiamo notare che nelle istruzioni operative il registro destinazione
@è contenuto nella prima metà del terzo byte. La logica sarà quindi quella di caricare in dei registri il quinto char delle due
@stringhe passate e confrontarle.
.data
    strCnt: .string "L'esito è %d\n"
.text
.global main
@r0 numero argomenti, r1 array di parametri (il primo è il nome del programma)
main:
    push {lr}
    mov r12,#1
    ldr r2,[r1,r12,lsl #2] @r2 contiene ptr prima str
    add r12,r12,#1
    ldr r3,[r1,r12,lsl #2] @r3 contiene ptr seconda str
    mov r12,#4
    push {r4,r5}
    ldrb r4,[r2,r12] @r2 contiene adesso il quinto char della stringa1
    ldrb r5,[r3,r12] @r3 contiene adesso il quinto char della stringa2
    cmp r4,r5
    pop {r4,r5}
    beq fineTrovato
    mov r1,#0
    ldr r0,=strCnt
    bl printf
    pop {pc}
fineTrovato:
    mov r1,#1
    ldr r0,=strCnt
    bl printf
    pop {pc}
