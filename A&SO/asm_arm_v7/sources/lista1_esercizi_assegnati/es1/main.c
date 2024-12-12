#include <stdio.h>

extern int fn (int a, int b, int c, int x);

int main (){
    int a,b,c,x;
    printf("Inserisci a: ");
    scanf("%d",&a);
    printf("Inserisci b: ");
    scanf("%d",&b);
    printf("Inserisci c: ");
    scanf("%d",&c);
    printf("Inserisci x: ");
    scanf("%d",&x);

    printf("Il valore è %d\n", fn(a,b,c,x));
    return 0;
}