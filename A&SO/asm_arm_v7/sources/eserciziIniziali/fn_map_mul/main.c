#include <stdio.h>

extern int map_mul (int* arr, int len, int fattore);

int main(){
    int len;
    printf("Inserisci len array: ");
    scanf("%d",&len);
    int array[len];
    printf("\n");
    for(int i = 0; i<len; i++){
        printf("Inserisci %d elemento: ",i);
        scanf("%d",&array[i]);
        printf("\n");
    }

    map_mul(array, len, 10);

    printf("L'array post map è: ");

    for (int i = 0; i < len; i++)
    {
        printf(" %d ",array[i]);
    }

    printf("\n");
    
    return 0;
}