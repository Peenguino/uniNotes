.text
.global main
.global tibonacci_fun
.type tibonacci_fun, %function

@ contenuto reg: r0=n

tibonacci_fun:
    @caso base
    cmp r0,#1
    movle pc,lr

    @caso ricorsivo1
    push {lr}
    sub r0,r0,#1
    push {r0} @(n-1)
    bl tibonacci_fun
    pop {r1} @(n-1)
    push {r0} @fib(n-1)
    sub r0,r1,#1 @(n-2)
    bl tibonacci_fun 
    pop {r1}
    add r0,r0,r1
    pop {pc}

main:
    push {lr}
    mov r12,#1
    ldr r0, [r1,r12,lsl #2]
    bl atoi
    push {r0}
    bl tibonacci_fun
    pop {r1}
    mov r2,r0
    ldr r0,=str1
    bl printf

end:
    pop {pc}

.data
    str1: .string "Fib(%d) = %d\n"

    
