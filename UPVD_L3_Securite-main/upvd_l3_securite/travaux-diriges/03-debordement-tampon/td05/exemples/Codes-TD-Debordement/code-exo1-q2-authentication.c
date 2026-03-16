#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int verif_authentication(char *password){

  int auth_flag = 0;
  char password_tampon[16];

  strcpy(password_tampon, password);

  if( strcmp(password_tampon, "brillig") == 0)
    auth_flag = 1;
  if(strcmp(password_tampon, "outgrabe") == 0)
    auth_flag = 1;

  return auth_flag;

}

int main( int argc, char *argv[]){
  if(argc < 2){
    printf("Usage: %s <password>\n", argv[0]);
    exit(0);
  }

  if(verif_authentication(argv[1])){
    printf("\n-=-=-=-=-=-=-=-=-=-=--=-=-·\n");
    printf("      Acces accorde.\n");
    printf("-=-=-=-=-=-=-=-=-=-=--=-=-·\n");
  }
  else
    printf("     Acces refuse\n");

}

