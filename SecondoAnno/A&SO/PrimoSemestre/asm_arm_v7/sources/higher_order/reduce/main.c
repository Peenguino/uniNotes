#include <stdio.h>

typedef int (*redFun)(int,int); // (acc,curr) -> (acc*curr),(acc+curr), ....

extern int reduce (int* arr, redFun ptrFun, int initAcc, int len);

int somma_red(int acc, int curr){
    return acc+curr;
}

int prod_red(int acc, int curr){
    return acc*curr;
}

int max_red(int acc, int curr){
    if(curr >= acc)
        acc = curr;
    return acc;
}

int min_red(int acc, int curr){
    if(curr <= acc)
        acc = curr;
    return acc;
}

int main (){
    int array[10] = {1,2,3,4,5,6,7,8,9,10};
    int somma = reduce(array,somma_red,0,10);
    int prodotto = reduce(array,prod_red,1,10);
    int max = reduce(array,max_red,-9999,10);
    int min = reduce(array,min_red,9999,10);

    printf("Dato l'array, tutte le operazioni:\nSomma:%d\nProdotto:%d\nMax:%d\nMin:%d\n",somma,prodotto,max,min);
    return 0;
}