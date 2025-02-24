@ r0 -> a, r1 -> b, r2 -> c, r3 -> x, r12 risultato tmp

.text
.global fn
.type fn, %function

fn:
    mul r12,r3,r3 @x^2
    mul r12,r12,r0 @ ax^2
    mov r0, r12
    mul r12, r1, r3 @b*x
    add r0,r0,r12 @ax^2 + bx
    add r0,r0,r2 @ax^2 + bx + c
    mov pc,lr
