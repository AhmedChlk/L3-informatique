#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include <sys/wait.h>

int main( int argc,char *argv[])
{

  pid_t pid_fils;
  int cpteur;
  char s_cpteur[3];
  char nomprog[10],command[30];

  if( argc !=2 )
    {
      printf("mauvais nombre d'argument");
      return(EXIT_SUCCESS);
    }
  else
    {
      sscanf(argv[1],"%d", &cpteur);
      printf("cpteur=%d\n",cpteur);
    }

  // le nmobre de fork est limité à 3 
  //(à chaque fork la variable cpteur est incrementee)
  if( cpteur < 10 )
    {
      cpteur++;
      sprintf(s_cpteur,"%d",cpteur);
      pid_fils=fork();

      if(pid_fils == -1)
	{
	  fprintf(stderr,"for() impossible errno=%d",errno);
	  return(EXIT_FAILURE);
	}
      if(pid_fils == 0)
	{
	  fprintf(stdout,"Fils : PID=%ld,PPID=%ld\n",(long) getpid(),(long) getppid()); 
	  fprintf(stdout,"execlp(%s,%s,%s,NULL)//PID=%ld\n",argv[0],argv[0],s_cpteur,(long) getpid());
	  sleep(20);
	  // rafraichissement du code
	  sprintf(command,"cp  %s a.out-%d",argv[0], getpid());
	  printf("%s\n",command);
	  system(command);
	  sprintf(nomprog,"./a.out-%d",getpid());
	  int r=execlp(nomprog,nomprog,s_cpteur, (char *) NULL);
	  //int r=execlp(argv[0],argv[0],s_cpteur, (char *) NULL);
	  

	  printf("result execlp=%d\n",r);
	}
      else
	{
	  fprintf(stdout,"Pere : PID=%ld, PPID=%ld, PIDFILS=%ld\n",(long) getpid(),(long) getppid(), (long) pid_fils); 
	  //  sleep(31);
	}
    }
  return(EXIT_SUCCESS);

}
