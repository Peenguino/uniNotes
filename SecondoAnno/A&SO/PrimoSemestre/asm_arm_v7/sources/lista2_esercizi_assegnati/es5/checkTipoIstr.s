.data
    hex: .string "%x"
    dec: .string "%d"
    binary: .string "%b"
.text
.global main

main:
    mov r2, #1
    ldr r0, [r1,r2,lsl #2]
    ldrb r0, [r0,r2]
    
    mov r1,#0
    mov r2,#2
    bl strtol
    mov r1,r0
    mov pc,lr




