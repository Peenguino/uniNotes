#include <stdio.h>

extern void map_mul_even_odd (int* arr, int len, int fatt_pari, int fatt_dispari);

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


    map_mul_even_odd(array, len, 10, 100);

    printf("L'array post map è: ");

    for (int i = 0; i < len; i++)
    {
        printf(" %d ",array[i]);
    }

    printf("\n");
    
    return 0;
}