.text
.global generaProfiloFreqStr
.type generaProfiloFreqStr, %function

@ assumo che in r0 mi abbiano passato una stringa
generaProfiloFreqStr:
    push {r4-r8,lr}
    mov r4,r0 @ r4 mantiene ptr str
    mov r1,#4 @ corrisponde a grandezza array (25 pos * 4 byte ciascuna)
    mov r0,#26
    bl calloc
    mov r5,r0 @ r5 mantiene ptr array
    mov r6,#0 @ corrente elemento della stringa
    mov r7,#0 @ indice
    mov r8,#0 @ elemento corrente da array
loop:
    ldrb r6,[r4,r7]
    cmp r6,#0
    beq fine
    cmp r6,#97
    bge mag_a_minus
    cmp r6,#65
    bge mag_A_maius
    add r7,r7,#1
    b loop

mag_A_maius:
    cmp r6,#80
    ble min_Z_maius
    add r7,r7,#1
    b loop

min_Z_maius:
    mov r0,r6
    bl myToLower
    mov r6,r0
    b min_z_minus

mag_a_minus:
    cmp r6,#122
    ble min_z_minus
    add r7,r7,#1
    b loop

min_z_minus:
    sub r6,r6,#97
    ldr r8,[r5,r6,lsl#2]
    add r8,r8,#1
    str r8,[r5,r6,lsl#2]
    add r7,r7,#1
    b loop

fine:
    mov r0,r5
    pop {r4-r8,pc}

    
