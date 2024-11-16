#include <stdio.h>

extern int red_sum (int* arr, int len);

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

    printf("La somma in reduce dell'array dato è: %d\n", red_sum(array, len));

    return 0;
}