#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

int main()
{
  char nom[8];
  int a,b;
  srand(time(NULL));
  b=rand() & 0x3f;
   
  printf("Entrez votre nom:\n");
  scanf("%s",nom);  
  printf("Proposez un nombre dans 0,..,63:\n");
  scanf("%d",&a);

  write(STDOUT_FILENO,nom,8);
  if( b == a )
    {
      printf(" vous avez gagné!\n");
    }
   else
    {
      printf(" vous avez perdu!\n");
    }
  printf("Le numéro à trouvé était:%d\n",b);
  return(0);
}
