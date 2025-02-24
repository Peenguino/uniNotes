.text
.global main
main: 
    push {lr} @deposito lr sullo stack
    ldr r2, [r1, #4] @ricordiamo che r1 è char**, di conseguenza stiamo accedendo al secondo parametro
    mov r1, r0
    ldr r0, =fmt
    bl printf
    pop {pc}
.data
    fmt: .string "Il numero di parametri da riga di comando e' %d e il primo è %s\n"