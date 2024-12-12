#include <stdio.h>
#define MAX_LEN 100
extern int myatoi (char* str);
extern int map (char** v, int n);

int main(){
    char str[MAX_LEN];
    char* arrayStr[5] = {"1000","1abc","100","33","456"};
    
    printf("Il ritorno della map sull'array dato è: %d",map(arrayStr,5));

    return 0;
}