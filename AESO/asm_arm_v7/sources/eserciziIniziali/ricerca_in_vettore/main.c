#include <stdio.h>
#include <stdlib.h>

extern int cerca (int x, int* v, int n);

int main (int argc, char** argv){
    int n = atoi(argv[1]);
    int x = atoi(argv[2]);
    int* v = (int*) malloc (sizeof(int)*n);
    int i,res;

    srand(123);
    for (int i = 0; i < n; i++){
        v[i] = rand()%n;
    }
    printf("Cerco nel vettore:%d \n",x);
    for (int i = 0; i < n; i++){
        printf("%d ",v[i]);
    }
    printf("\n");

    res = cerca(x, v, n);

    if(res != -1){
        printf("%d trovato nella pos %d\n",x,res);
    }
    else{
        printf("Elemento non trovato!\n");
    }

    return 0;

}