#include <stdio.h>
#include <crypt.h>

int main(int argc, char *argv[])
{
  char md5[] = "$1$";
  char *res;
  res = crypt("202427", md5);
  printf("le haché avec md5sum de \"102239\" vaut %s\n",res);
}
