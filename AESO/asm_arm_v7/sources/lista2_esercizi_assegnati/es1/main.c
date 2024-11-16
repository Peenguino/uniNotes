#include <stdio.h>
#include <stdlib.h>

struct elem{
    int val;
    struct elem* next;
} typedef elemList;

struct array_wrapper
{
    int len;
    int* arr;
}typedef ArrayWrapper;


void contaElemLista(elemList* testaLista);
ArrayWrapper* arraySupportoLista(elemList* lista1,elemList* lista2);
elemList* concatenaListe(elemList* lista1,elemList* lista2);

void stampaArray(int* arr, int len){
    for(int i=0;i<len;i++){
        printf(" %d ",arr[i]);
    }
}

void stampaLista(elemList* elem){
    if(elem->next == NULL)
    {
        printf(" {elem: %d, next: NULL} ",elem->val);
        return;
    }
    printf(" {elem: %d, next: %p} ",elem->val,elem->next);
    stampaLista(elem->next);
}

void liberaMemoriaLista(elemList* elem){
    if(elem->next == NULL)
    {
        free(elem);
        return;
    }
    elemList* nextElem = elem->next;
    free(elem);
    liberaMemoriaLista(nextElem);
}
    
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

    elemList* testa1 = &elemento1;

    elemList elemento8;
    elemento8.val = 8;
    elemento8.next = NULL;

    elemList elemento7;
    elemento7.val = 7;
    elemento7.next = &elemento8;

    elemList elemento6;
    elemento6.val = 6;
    elemento6.next = &elemento7;
    
    elemList elemento5;
    elemento5.val = 5;
    elemento5.next = &elemento6;

    elemList* testa2 = &elemento5;

    /*
    ArrayWrapper* wrapper = arraySupportoLista(testa1,testa2);
    printf("La len dell'array è: %d\n",wrapper->len);
    stampaArray(wrapper->arr,wrapper->len);
    */

    elemList* listaConcatenata = concatenaListe(testa2,testa1);

    stampaLista(listaConcatenata);

    liberaMemoriaLista(listaConcatenata);

    return 0;
}