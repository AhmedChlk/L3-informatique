#include <stdio.h>

void function(long a, long b)
{
  long buffer[2]={0,1};  
  buffer[a]+=b;
}
void main()
{
  long a,b;
  a=1;
  b=6;
  function(a,b);
  printf("coucou1\n");
  printf("coucou2\n");
}

