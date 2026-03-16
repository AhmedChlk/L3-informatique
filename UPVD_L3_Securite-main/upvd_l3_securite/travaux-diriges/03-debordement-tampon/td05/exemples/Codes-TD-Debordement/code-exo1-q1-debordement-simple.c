#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]){
  int valeur=5;
  char tampon_un[8], tampon_deux[8];

  strcpy(tampon_un,"un"); // mettre "un" dans le tampon_un
  strcpy(tampon_deux,"deux"); // mettre "deux" dans le tampon_deux

  printf("[AVANT] tampon_deux est a %p et contient \'%s\'\n", tampon_deux, tampon_deux);
  printf("[AVANT] tampon_un est a %p et contient \'%s\'\n", tampon_un, tampon_un);
  printf("[AVANT] valeur est a %p et vaut %d (0x%08x)\n", &valeur,valeur,valeur);

  printf("\n [STRCPY] copie de %d octets dans tampon_deux \n\n", (int) strlen(argv[1]));
  strcpy(tampon_deux,argv[1]); // copie du premier argument dans tampon_two

  printf("[APRES] tampon_deux est a %p et contient \'%s\'\n", tampon_deux, tampon_deux);
  printf("[APRES] tampon_un est a %p et contient \'%s\'\n", tampon_un, tampon_un);
  printf("[APRES] valeur est a %p et vaut %d (0x%08x)\n", &valeur,valeur,valeur);

  return(0);
}
