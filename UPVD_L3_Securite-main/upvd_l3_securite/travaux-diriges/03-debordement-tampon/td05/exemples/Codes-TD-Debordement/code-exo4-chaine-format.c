#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
  unsigned long d;
  char texte[512];
  
  
  static int test_var = 100*256*256+100*256+100;
  if(argc < 3) {
    printf("Usage: %s  <text to print> <entier>\n", argv[0]);
    exit(0);
  }
  d=atoi(argv[2]);
  
  strcpy(texte, argv[1]);
  printf("La bonne facon d'afficher des entrees utilisateurs:\n");
  printf("%s", texte);
  printf("\nLa mauvaise facon d'afficher des entrees utilisateurs:\n");
  printf(texte);
  printf("\n");
  // Debug output
  printf("[*] test_var @ %p =  %lu, %04x\n", &test_var,&test_var,  test_var);
  printf("[*] adresse de d=%p, valeur de d=0x%016lx\n",&d,d);
  printf("[*] adresse de texte=%p\n",texte);
  exit(0);
}


