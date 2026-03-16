//--------------- predict match ----------------
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

int is_match(int r)
{
  int compteur=0;
  srand(r);
  int i,j;
  int number[16];
  for(i=0;i<16;i++)
    {
      number[i]=rand() % 100;
    }
  for(i=0;i<15;i++)
    {
      for(j=i+1;j<16;j++)
	{
	  if( number[i] == number[j] )
	    {
	      compteur++;	      	      
	    }
	 
	}
    }
  return(compteur);
}

int main(int argc,char **argv)
{
  int prediction;
  char nom[16];
  unsigned int r=time(0);
  
    
  printf("Entrez votre nom :");
  scanf("%s",nom);

  
  printf("\n::::: No Match Dealer :::::\n");
   printf("Dans ce jeux vous devez prédire le nombre de paires d'entiers parmi 16\n");
  printf("tous tirés  au hasard dans [0,100] qui sont égaux\n");
  
  printf("Donnez votre prédiction:");
  scanf("%d",&prediction);
      
  if( is_match(r) == prediction)
    printf("Bravo %s vous avez gagnez!\n",nom);
  else
    printf("Désolé %s c'est perdu!\n",nom);
    

  return(0);  
}
