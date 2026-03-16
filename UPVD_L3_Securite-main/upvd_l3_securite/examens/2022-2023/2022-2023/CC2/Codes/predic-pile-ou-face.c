//--------------- Debut code jeu pile ou face ----------------
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>


static int points=20;


int pileface(char *input)
{
  char PouF[72];
  int r;
  strcpy(PouF,input);
  printf("Binvenu sur le jeu de pile ou face\n");            
      
  
  // lecture de l entree utilisateur
  // stockee dans PouF
  printf("votre prediction ");
  printf(PouF);
  //printf("code=%p\n",pileface);
  // on lance la piece
  r=rand() & 1;

  //  printf("prediction =");
  //  printf(PouF);
  printf(" et le lance = %c \n",r*'P'+(1-r)*'F');

  

  // on compare avec l entree utilisateur
  if( PouF[0] == (r*'P'+ (1-r)*'F') )
    return(1);
  else
    return(0);
}

int main(int argc, char *argv[])
{
  int f=1;
  
  srand(time(NULL));
  printf("%p\n",main);
  printf("%p\n",&f);
  if(argc >= 2)
    {  
      f=pileface(argv[1]);           
      if( f == 0)
	points=points-10;	     
      else
	points=points+10;
      printf("Vos points =%d\n",points);
    }
  else
    {
      printf("Donnez votre prediction (P ou F) en argument\n");
    }
  return(0);
}
//--------------- Fin code jeu pile ou face ----------------




//  ./a.out $(python2 -c "print \"x\"*20+\"\x0c\x13\x40\"")
