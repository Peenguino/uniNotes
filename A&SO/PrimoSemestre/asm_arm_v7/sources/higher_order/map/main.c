#include <stdio.h>

typedef int (*fn_int_int)(int);

extern void map (fn_int_int fn, int* v, int len);

int quadrato (int num){
    return num*num;
}

int cubo (int num){
    return num*num*num;
}

int triplo (int num){
    return 3*num;
}

int doppio (int num){
    return 2*num;
}

void stampa_array(int* arr, int len){
    for (int i = 0; i < len; i++){
        printf(" %d ",arr[i]);
    }
    printf("\n");
}

void resetta_array(int* arr, int len){
    for (int i = 1; i < len+1; i++){
        arr[i-1] = i;
    }
}

int main(){
    int len = 5;
    int arr[5] = {1,2,3,4,5};

    printf("Array dopo il map del quadrato: \n ");
    map(quadrato, arr, 5);
    stampa_array(arr, 5);
    resetta_array(arr, 5);

    printf("Array dopo il map del cubo: \n ");
    map(cubo, arr, 5);
    stampa_array(arr, 5);
    resetta_array(arr, 5);

    printf("Array dopo il map del triplo: \n ");
    map(triplo, arr, 5);
    stampa_array(arr, 5);
    resetta_array(arr, 5);

    printf("Array dopo il map del doppio: \n ");
    map(doppio, arr, 5);
    stampa_array(arr, 5);

    return 0;
}