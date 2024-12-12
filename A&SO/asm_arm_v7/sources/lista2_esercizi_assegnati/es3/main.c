#include <stdio.h>
#define MAX_LEN 100

extern int sommaTuttiNumeriStr(char* str);

int main(){
    char str[MAX_LEN];
    printf("Inserisci una stringa:");
    scanf("%s",str);
    printf("La somma di tutti i numeri in %s è %d\n",str, sommaTuttiNumeriStr(str));
    return 0;
}