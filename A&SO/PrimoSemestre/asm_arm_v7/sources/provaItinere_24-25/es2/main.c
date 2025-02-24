/* conto le occorrenze nelle stringhe passate come parametri della
   riga di comando 
   -/a.out aa ab abc Dedfde deve restituire 4
*/

#include <stdio.h>

extern int conta_stringhe(char **, int);

int main(int argc, char ** argv) {

  char ** v = &argv[1];
  int n = argc - 1;

  printf("contastringhe=%d\n", conta_stringhe(v,n));
  return(0);

}
