#include <stdio.h>
#include <stdib.h>
#include <stdio.h>

void g()
{
  printf("on est dans la fonction secrete\n");
}

int main()
{
  
  int tab[30];
  long i;
  
  srand(time(NULL));
  for(i=0;i<N;i++)
    {
      tab[i]=rand() % 20;
    }
  i=0;
  while( i >= 0)
    {
      printf("Donnez l'indice du tableau \n");
      scanf("%d",&i);
      printf("Donnez la valeur à l'indice %d \n",i);
      scanf("%d",t+i);
    }
  return(0);
}


