.data
    str1: .string "Il fattoriale di %d è %d"
.text
.global main
.global fact
.type fact, %function

@assumo di ricevere in r0 n, calcolo fact(n)
fact:
    cmp r0,#1
    moveq pc,lr
    push {r0,lr}
    sub r0,r0,#1
    bl fact

end_fact:
    pop {r1}
    mul r0,r1,r0
    pop {pc}

main:
    push {lr}
    mov r3,#1
    ldr r2,[r1,r3,lsl #2]
    mov r0,r2
    bl atoi
    push {r0}
    bl fact
    mov r2,r0
    ldr r0,=str1
    pop {r1}
    bl printf

end:
    pop {pc}





