#include <stdio.h>
#define MAX_LEN 100
extern int contaOccorrenze(char* str, char lett);

int main(){
    char str[MAX_LEN];
    char carattere;

    printf("Inserisci stringa: ");
    scanf("%s",str);

    printf("Inserisci carattere: ");
    scanf(" %c",&carattere);

    printf("Il numero di occorrenze di %c in %s è di %d volte.",
    carattere,str,contaOccorrenze(str,carattere));

    return 0;
}