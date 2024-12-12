.data
    str1: .string "Quadrato: %d\nCubo: %d\n"
    firstOutput: .string "Inserisci un numero: "
    formatInput: .string "%d"
    num: .word 0
.text
.global main

main:
    push {lr}
    ldr r0,=firstOutput
    bl printf
    ldr r0,=formatInput
    ldr r1,=num
    bl scanf
    ldr r0,=num
    ldr r0,[r0]
    mul r1,r0,r0 @quadrato in r1
    mul r2,r1,r0 @cubo in r2
    ldr r0,=str1
    bl printf
    pop {pc}
