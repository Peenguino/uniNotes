#include <stdio.h>

extern int fattoriale(int num);

int main(){
    int num;
    printf("Inserisci un numero: ");
    scanf("%d",&num);
    printf("Il fattoriale di %d è %d\n",num,fattoriale(num));

    return 0;
}