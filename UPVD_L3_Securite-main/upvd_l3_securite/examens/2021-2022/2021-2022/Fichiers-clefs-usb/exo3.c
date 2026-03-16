#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 20
void g()
{
  printf("on est dans la fonction secrete\n");
}

void f()
{
  unsigned long T[4];
  int i;
  
  //-----------
  T[0]=0;
  T[1]=1;
  T[2]=2;
  T[3]=3;

  //-----------
  printf("i=");
  scanf("%d",&i);
  printf("Old T[i]=%016lx\nNew T[i]=",T[i]);  
  scanf("%lx",T+i);
    
  //-----------
  return;
}

int main()
{
  //printf("main=%p,g=%p,diff=%ld\n",main,g,(long)main-(long)g);
  f();
  return(0);
}


