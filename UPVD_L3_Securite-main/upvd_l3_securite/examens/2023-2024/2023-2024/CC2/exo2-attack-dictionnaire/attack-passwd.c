#include <stdlib.h>
#include <stdio.h>
#include <crypt.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <fcntl.h>

void hachage(char *passwd, char *pwd_hash)
{
  char md5[] = "$1$";
  char *hash;
  char *pw_hash;
  
  pw_hash = crypt(passwd, md5);
  //printf("pw_hash=%s\n",pw_hash+4);
  strcpy(pwd_hash,pw_hash+4);
}

int main()
{
  FILE *F1,*F2;
  F1=fopen("dictionnary-french-passwords.txt","r+");
  
  char passwd[200];
  char mot1[200];
  char mot2[200];
  char pwd_hash[200];
  //  char *hash_admin="ScMbjFG7X0lduHhErJ8sb.";
  char *pwd_admin="corbeau333";
  char *hash_admin="aw6xYF4rvMm3CVlqcM3PX1";
  int compteur;
  
  hachage(pwd_admin,pwd_hash);
  printf("hasché=%s\n",pwd_hash);
  while( fscanf(F1,"%s",mot1) != EOF)
    {
      printf("mot1=%s\n",mot1);
      F2=fopen("dictionnary-french-passwords.txt","r+");
      while( fscanf(F2,"%s",mot2) != EOF)
        {
          compteur++;
          passwd[0]='\0';
          
          strcat(passwd,mot1);
          strcat(passwd,mot2);
          if( strcmp(passwd,"corbeau333") == 0)
            {
              printf("%s\n",passwd);
            }
          hachage(passwd,pwd_hash);
          if( strcmp(pwd_hash,hash_admin) == 0)
            {
              printf("%s,%s\n",passwd,pwd_hash);
            }
        }
      fclose(F2);
    }
  printf("compteur=%d\n",compteur);
  fclose(F1);
  


}
