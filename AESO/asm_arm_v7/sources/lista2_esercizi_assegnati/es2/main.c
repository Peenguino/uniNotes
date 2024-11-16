#include <stdio.h>
#define MAX_LEN 100

extern int contaMaiuscole(char* str);

int main(){
    char str[MAX_LEN];
    printf("Inserisci una stringa:");
    scanf("%s",str);
    printf("Il numero di maiuscole in %s è %d\n",str, contaMaiuscole(str));
    return 0;
}