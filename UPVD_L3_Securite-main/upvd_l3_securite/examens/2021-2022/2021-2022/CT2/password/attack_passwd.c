#include <stdlib.h>
#include <stdio.h>
#include <crypt.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <fcntl.h>

#define NB_FILS 8
#define N 1000000

int main()
{
  char passwd[20];
  char *res,*res1;
  char md5[] = "$1$";
  char hash[100], message[100];

  // on met le hache du mot passe recherche dans la variable hash
  strcpy(hash,"$1$$juX0ne5gqsCzboyivwz4.0");

  int mode;
  int statut;
  int i,j,d;
  int pid[NB_FILS];
  int desc[2];

  // on cree le pipe pour l'envoi du mot de passe au père
  pipe(desc);

  // création des processus fils
  for(i=0;i<NB_FILS;i++)
    {

      d=fork();
      pid[i]=d;
      if( d == 0 )
	{
	  printf("Fils %d cherche le mot de passe dans [%d,%d]\n",i,i*N/NB_FILS,(i+1)*N/NB_FILS);
	  for(j=0;j<N/NB_FILS;j++)
	    {
	      if( j== (N/2*NB_FILS) )
		printf("moitiée\n");
	      sprintf(passwd,"%d",i*N/NB_FILS+j);
	      res1=crypt(passwd, md5);
	      if( strcmp(hash,res1) == 0)
		{
		  close(desc[0]);
		  printf("Fils %d a trouvé passwd = %s, hache=%s\n",i,passwd,res1);
		  write(desc[1],passwd,strlen(passwd)+1);
		  exit(0);
		}
	    }
	  printf("Fils %d a fini sa recherche et se termine\n",i);
	  exit(0);

	}
    }


  close(desc[1]);
 
  int nl;
  int end =0;

  sleep(5);
  nl=read(desc[0],message,100);
  if( nl > 0)
    {
      printf("Père: message reçu = %s, nl = %d\n",message,nl);	  
    }
  printf("Envoie un SIGTERM et waitpid pour tous les processus\n");
  for(i=0;i<8;i++)
    {
      kill(pid[i],SIGTERM);
      waitpid(pid[i],&statut,0);
    }
  return(0);
}
