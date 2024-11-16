    .text
    .global main

main:   
        mov r2, #8
        mov r0, #0
        mov r1, #1
        cmp r1, r2
        bge fine
loop:   
        add r0, r0, r1
        add r1,r1,#1
        cmp r1,r2
        bmi loop
fine: 