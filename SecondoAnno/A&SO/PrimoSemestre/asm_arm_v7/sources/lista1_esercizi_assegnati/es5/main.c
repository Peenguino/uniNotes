#include <stdio.h>

extern void cercaIn_IesimoVettore (int** arrPtr, int index, int val);

int main(){

    int array1[8] = {11,11,11,11,11,11,11,11};
    int array2[8] = {21,21,23,23,23,23,21,21};
    int array3[8] = {11,44,44,44,44,44,44,11};
    int array4[8] = {11,19,19,19,19,19,19,11};
    int array5[8] = {11,17,17,15,17,17,17,11};
    int array6[8] = {51,51,51,51,51,51,11,11};
    int array7[8] = {11,13,31,11,11,31,11,11};
    int array8[8] = {11,67,67,67,67,67,67,11};

    int* array[8] = {array1,array2,array3,array4,array5,
    array6,array7,array8};

    cercaIn_IesimoVettore(array, 4, 15);

    return 0;
}