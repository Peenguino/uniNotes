#include <stdio.h>

struct elem{
    int val;
    struct elem* next;
} typedef elemList;

void contaElemLista(elemList* testaLista);
    
int main(){

    elemList elemento4;
    elemento4.val = 4;
    elemento4.next = NULL;

    elemList elemento3;
    elemento3.val = 3;
    elemento3.next = &elemento4;

    elemList elemento2;
    elemento2.val = 2;
    elemento2.next = &elemento3;
    
    elemList elemento1;
    elemento1.val = 1;
    elemento1.next = &elemento2;

    elemList* testa = &elemento1;

    contaElemLista(testa);

    return 0;
}