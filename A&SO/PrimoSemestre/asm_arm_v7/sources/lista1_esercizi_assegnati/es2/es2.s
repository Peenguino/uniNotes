.data
    array: .word 1,4,7,12,16,23,32,43
    str1: .string "La ricerca ha dato esito %d"
.text
.global main

@ricorsiva o iterativa?

main:
    push {lr}
    mov r12,#1
    ldr r0,[r1,r12,lsl #2] @argv[1] -> r0
    bl atoi
    mov r1, #0 @start
    mov r2, #7 @end
    ldr r3, =array @base arr
    push {r4}
    @ r0 x, r1 start, r2 end, r3 base arr, r4 curr val
loop:
    cmp r1,r2
    beq fine

fine
    

    @parametro %d
    ldr r0,=str1
    bl printf
    pop {lr}
    mov pc,lr
    
    

