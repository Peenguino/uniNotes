.text
.global fattoriale
.type fattoriale, %function

fattoriale:
    @caso base
    cmp r0,#1
    moveq pc,lr
    @caso ricorsivo 
    push {r0,lr}
    sub r0,r0,#1
    bl fattoriale
end:
    pop {r1}
    mul r0,r1,r0
    pop {pc}
