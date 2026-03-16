#include <stdio.h>
#include <stdlib.h>
#include <crypt.h>
#include <string.h>

void hachage(char *passwd, char *pwd_hash)
{
  char md5[] = "$1$";
  char *hash;
  char *pw_hash;
  
  pw_hash = crypt(passwd, md5);
  //printf("pw_hash=%s\n",pw_hash+4);
  strcpy(pwd_hash,pw_hash+4);
}

int auth(char *nom, char *passwd)
{

  char pw_hash[100];
  FILE *f;
  char log[40],hash[40];
  //pw_hash = crypt(passwd, md5);
  hachage(passwd,pw_hash);
  printf("pw_hash=%s\n",pw_hash);

  // on parcourt le fichier pour trouver
  f=fopen("passwd.txt","r");

  while( ( fscanf(f,"%s",log) != EOF ) && ( fscanf(f,"%s",hash) != EOF ) )
    {   
      //printf("log=%s, hash=%s\n",log,hash);
      if( (strcmp(log,nom) == 0  ) &&  (strcmp(hash,pw_hash) == 0  ) )
        {
          fclose(f);
          return(1);
        }
    }
  fclose(f);
  return 0;
}


int main(int argc, char **argv)
{
  char nom[8];
  char passwd[8];
  char annee[5];
  char command[60];
    
  if( argc < 3)
    {
      printf("usage arg1=login, arg2=passwd\n");
      return(0);
    }
  else
    {
      strcpy(nom,argv[1]);
      strcpy(passwd,argv[2]);

      // verification que l on a les droits d'acces aux fichiers
      // avant de l'affichier
      if( auth(nom,passwd) == 1 )
        {
          // on fabrique la commande pour afficher le contenu du fichier
          strcpy(command,"cat ");   
          printf("Entrez l annee des transactions:");
          scanf("%s",annee);
          strcat(command,annee);
          strcat(command,"-transaction.txt");
          printf("command=%s\n",command);
          system(command);
        }
    }  
}


