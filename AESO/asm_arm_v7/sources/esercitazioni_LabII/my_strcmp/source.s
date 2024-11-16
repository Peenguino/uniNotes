.text
@date due stringhe, ritorno 0 se uguali, 1 se diverse
@controllo se nelle due stringhe sono uguali o meno gli n caratteri dati
@ r0 str1, r1 str2, r3 n (quanti caratteri voglio testare)
.global my_strcmp
.type my_strcmp, %function

my_strcmp:




    @
    @ r2
    @ r1
    @ r0   ---> push {r0,r1,r2} 

    @ pop {r0,r1,r2} non pop {r2,r1,r0}
