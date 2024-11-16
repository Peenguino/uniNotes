#include <stdio.h>
#include <stdlib.h>
#define MAX_LEN 100

extern int* generaProfiloFreqStr (char* str);

void stampaArray(int* arr, int len){
    for(int i=0;i<len;i++){
        printf(" %d ",arr[i]);
    }
}

int main(){
    char str[MAX_LEN];

    printf("Inserisci una stringa: ");
    scanf("%s",str);

    int* dict = generaProfiloFreqStr(str);

    stampaArray(dict,25);

    free(dict);

    return 0;
}