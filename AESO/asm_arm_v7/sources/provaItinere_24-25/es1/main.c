#include <stdio.h>

extern int conta(char *);

int main(int argc, char ** argv) {

  if(argc != 1) 
printf("conta(%s)=%d\n",argv[1],conta(argv[1]));
  else 
printf("conta(abe2EfGHijjkkmkl)=%d\n",conta( "abe2EfGHijjkkmkl"));
  return(0);

}
