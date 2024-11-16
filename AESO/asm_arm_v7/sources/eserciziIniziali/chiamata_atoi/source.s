.text
.global main
main: 
    push {lr} @deposito lr sullo stack

    ldr r2, [r1, #4] @ricordiamo che r1 è char**, di conseguenza stiamo accedendo al secondo parametro
    push {r0} @attenzione sintassi, richiede spazio tra comando e parametri

    mov r0, r2
    bl atoi
    pop {r1}
    add r2,r0,#10

    ldr r0, =fmt
    bl printf

    pop {pc}
.data
    fmt: .string "Il numero di parametri da riga di comando e' %d e il primo aumentato di 10 è %d\n" @,%d,%d