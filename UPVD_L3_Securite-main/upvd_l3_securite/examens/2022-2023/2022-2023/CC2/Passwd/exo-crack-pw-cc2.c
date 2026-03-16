#include <stdio.h>
#include <crypt.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

// convertit alphanum
//  a-z,A-Z0-9
void gen_password(char *s)
{
  int i;
  unsigned long x, y;
  int t=time(NULL);
  
  printf("graine gen_password = %d,Max=%d\n",t,RAND_MAX);
  t=82792193;
  srand(t);
  x=(((unsigned long) rand() ) << 32) ^ ((unsigned long) rand() );
  x=x & 0xfffffffffffffff ;
  
  for(i=0;i<10;i++)
    {
      y=(x>>(6*i)) & 0x3f;
      // a-z
      if( y < 26)
	{
	  s[i]='a'+y;
	}
      else if( y < 52)
	{
	  s[i]='A'+(y-26);
	}
      else if( y < 62)
	{
	  s[i]='0'+(y-52);
	}
      else
	{
	  s[i]='$'+(y-62);
	}
    }
  s[10]='\0';
}


void brute_force_gen_password(char * hash)
{

  int i;
  unsigned long x, y;
  char *h;
  char s[100];
  char mode[200]="$3$";
  unsigned long  g;
  
  for(g=0;g < RAND_MAX; g++)
    {
      if( (g & 0xffffff) == 0 )
	printf(" x=%ld\n",g);
      
      srand(g);
      x=(((unsigned long) rand() ) << 32) ^ ((unsigned long) rand() );
      x=x & 0xfffffffffffffff ;
      
      // on convertit
      for(i=0;i<10;i++)
	{
	  y=(x>>(6*i)) & 0x3f;
	  // a-z
	  if( y < 26)
	    {
	      s[i]='a'+y;
	    }
	  else if( y < 52)
	    {
	      s[i]='A'+(y-26);
	    }
	  else if( y < 62)
	    {
	      s[i]='0'+(y-52);
	    }
	  else
	    {
	      s[i]='$'+(y-62);
	    }	  
	}
      s[10]='\0';
      
      // on hache
      h=crypt(s,mode);
       
      // on compare avec le hash
      if( strcmp(h,hash) == 0)
	{
	  printf("pw=%s,h=%s\n",s,h);
	  return;
	}
    }
  return;
}



//--------
void brute_force_prenomnaiss(char *hash)
{
  char prenom[1000],pw[1000];
  char slash[2]="/";
  char date[1000];
  int annee,mois,jour;
  char s_annee[10],s_mois[10],s_jour[10];
  char mode[200]="$3$"; 
  char *h;
  FILE *f;
  long int compteur;
  // on lit les prénoms
  // on parcourt les dates de naissance

  f=fopen("prenoms3.txt","r");
  if( f == NULL)
    {
      perror("overture fichier\n");
      return;
    }
  compteur=0;
  while( fscanf(f,"%s",prenom) != EOF )
    {

      // boucle sur les annee
      for(annee=1973;annee <2024; annee++)
	{
	  sprintf(s_annee,"%04d",annee);
		  
	  // boucle sur les mois
	  for(mois=0;mois <12; mois++)
	    {
	      sprintf(s_mois,"%02d",mois);
	      
	      // boucle sur les jours

	      for(jour=0;jour <=31; jour++)
		{
		  sprintf(s_jour,"%02d",jour);
		  
		  //----------------- date sans le slash ---------------
		  date[0]='\0';
		  strcat(date,s_jour);
		  strcat(date,s_mois);
		  strcat(date,s_annee);
	      
		  
		  //---------------- prenom + date
		  pw[0]='\0';
		  
		  strcat(pw,prenom);
		  strcat(pw,date);
		  //printf("pw=%s\n",pw);
		  
		  h=crypt(pw,mode);		  
		  
		  // on compare avec le hache
		  if( strcmp(h,hash) == 0)
		    {
		      printf("pw=%s,h=%s\n",pw,h);
		      fclose(f);
		      return;
		    }

		  //---------------- date + prenom 
		  pw[0]='\0';
		  
		  strcat(pw,date);
		  strcat(pw,prenom);
		  		  
		  h=crypt(pw,mode);		  
		  
		  // on compare avec le hache
		  if( strcmp(h,hash) == 0)
		    {
		      printf("pw=%s,h=%s\n",pw,h);
		      fclose(f);
		      return;
		    }

		  
		  		  
		  //---------- date avec le slash ---------------
		  date[0]='\0';
		  strcat(date,s_jour);
		  strcat(date,slash);
		  strcat(date,s_mois);
		  strcat(date,slash);
		  strcat(date,s_annee);
	      
		  //---------------- prenom + date/		  

		  pw[0]='\0';
		  
		  strcat(pw,prenom);
		  strcat(pw,date);
		  
		  h=crypt(pw,mode);

		  if( strcmp(prenom,"NADINE") == 0 && annee == 1984 && jour == 2)
		    printf("pw=%s\n",pw);
		  
		  // on compare avec le hache
		  if( strcmp(h,hash) == 0)
		    {
		      printf("pw=%s,h=%s\n",pw,h);
		      fclose(f);
		      return;
		    }
		  
		  //---------------- date/ + prenom

		  pw[0]='\0';
		  
		  strcat(pw,date);		  
		  strcat(pw,prenom);

		  
		  h=crypt(pw,mode);
		  
		  // on compare avec le hache
		  if( strcmp(h,hash) == 0)
		    {
		      printf("pw=%s,h=%s\n",pw,h);
		      fclose(f);
		      return;
		    }
		  compteur++;
		  
		  if( (compteur & 0x3ffff) == 0)
		    printf("compteur=%ld\n",compteur);
		}
	    }
	}
    }
  fclose(f);
  return;
}


int main()
{
  char pw1[100],h1[100],h2[100];
  
  gen_password(pw1);
  
  printf("pw=%s\n",pw1);
  char pw2[100]="NADINE02/10/1984";
  char *h;
  char mode[10]="$3$";
  
  // on génère les hachés
  h=crypt(pw1,mode);
  strcpy(h1,h);
  printf("passwd1 = %s, hash1 = %s\n",pw1,h1);
  
  h=crypt(pw2,mode);
  strcpy(h2,h);
  printf("passwd2 = %s, hash2 = %s\n",pw2,h2);
  
  // attaque bruteforce rand
  brute_force_gen_password(h1);
  printf("coucou\n");
  // attaque bruteforce prenomdatenaiss
  //brute_force_prenomnaiss(h2);
  
  return(0);
}
