#include <stdio.h>
#include <stdlib.h>
#include <time.h>


unsigned int r[344];
int n;


void my_srand(uint seed)
{
  //unsigned int r[344];

  r[0] = seed;
  for (int i = 1; i < 31; i++)
    {
      r[i] = (uint)((16807 * (ulong)r[i - 1]) % 2147483647);
    }
  for (int i = 31; i < 34; i++)
    {
      r[i] = r[i - 31];
    }
  for (int i = 34; i < 344; i++)
    {
      r[i] = r[i - 31] + r[i - 3];
    }
   
  n = 0;
}

int my_rand()
{
  unsigned int x = r[n % 344] = r[(n + 313) % 344] + r[(n + 341) % 344];
  n = (n + 1) % 344;
  return (int)(x >> 1);
}


int main()
{
  int r=time(0);
  my_srand(r);
  srand(r);
  printf("%d\n",rand());
  printf("%d\n",my_rand());
  return(0);
}

