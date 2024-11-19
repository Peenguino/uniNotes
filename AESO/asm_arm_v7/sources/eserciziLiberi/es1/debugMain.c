#include <stdio.h>

extern int funOperazione(char* a, char* b, char* c);

int main(int argc, char** argv){
    char* op1 = "15\0";
    char* op2 = "20\0";
    char* op = "+\0";
    char* strOutput= "%s %s %s = %d";
    //int risultato = funOperazione(argv[1],argv[2],argv[3]);

    int risultato = funOperazione(op1,op,op2);

    printf(strOutput,op1,op,op2,risultato);

    return 0;
}