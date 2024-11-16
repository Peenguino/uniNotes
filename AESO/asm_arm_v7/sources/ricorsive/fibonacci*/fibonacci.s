.text
@ contenuto reg: r0=n

fibonacci:
    @caso base
    cmp r0,#1
    beq fine
    blt fine
    @caso ricorsivo
    sub r1,r0,#1
    sub r2,r0,#2
    push {r0,lr}
fine
    
