#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void f(char *s)
{
  char nom[10];
  strcpy(nom,s);
  printf("\n");
  printf("%lx\n",*((unsigned long *)(nom+18)));
  printf("Bonjour %s, on est dans f\n",nom);
  
}

void secret()
{
  printf("on est dans secret\n");
}

int main(int argc, char **argv)
{
  printf("adresse de f=%p, et de secret=%p\n",f,secret);
  f(argv[1]);
}

