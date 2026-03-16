#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

struct key{
  int pos[3]; // donne les positions initiale des rotors (on ne les réarrange pas)
  int connecteur[6][2]; // 3 paires 
};

typedef struct key key;

void inverse(char *in, char *out)
{
  int i,j;
  for(i=0;i<26;i++)
    {
      for( j=0;j<26;j++)
	{
	  if( in[i] == (((char)j)+'A') )
	    {
	      out[j]=((char)i)+'A';
	    }
	}
    }
  out[26]='\0';
}

void chiffrement_enigma(char *clair, char *chiffre, key k)
{
  //                 ABCDEFGHIJKLMNOPQRSTUVWXYZ             
  //char *RI     ="JGDQOXUSCAMIFRVTPNEWKBLZYH";
   int RI[26]={9,6,3,16,14,23,20,18,2,0,12,8,5,17,21,19,15,13,4,22,10,1,11,25,24,7};
   //char *inv_RI="JVICSMBZLAUWKREQDNHPGOTFYX";
   int inv_RI[26]={9,21,8,2,18,12,1,25,11,0,20,22,10,17,4,16,3,13,7,15,6,14,19,5,24,23};

   //char *RII    ="NTZPSFBOKMWRCJDIVLAEYUXHGQ";
   int RII[26]={13,19,25,15,18,5,1,14,10,12,22,17,2,9,3,8,21,11,0,4,24,20,23,7,6,16};
   //char *inv_RII="SGMOTFYXPNIRJAHDZLEBVQKWUC";
  int inv_RII[26]={18,6,12,14,19,5,24,23,15,13,8,17,9,0,7,3,25,11,4,1,21,16,10,22,20,2};

  //char *RIII   ="JVIUBHTCDYAKEQZPOSGXNRMWFL";
  int RIII[26]={9,21,8,20,1,7,19,2,3,24,0,10,4,16,25,15,14,18,6,23,13,17,12,22,5,11};
  //char *inv_RIII="KEHIMYSFCALZWUQPNVRGDBXTJO";
   int inv_RIII[26]={10,4,7,8,12,24,18,5,2,0,11,25,22,20,16,15,13,21,17,6,3,1,23,19,9,14};
   //char *reflecteur ="YRUHQSLDPXNGOKMIEBFZCWVJAT";
  int reflecteur[26]={24,17,20,7,16,18,11,3,15,23,13,6,14,10,12,8,4,1,5,25,2,22,21,9,0,19};
  //char tp[27];

  int l,i,j;
  int posI,posII,posIII;

  char cc,c0,c1;
  int u,c;

  /*
  for(i=0;i<26;i++)
    {
      printf("%u,", (unsigned int)(reflecteur[i]-'A'));
    }
  printf("\n");


  // inverse 
  for(i=0;i<26;i++)
    {
      c=reflecteur[reflecteur[i]];
      
      printf("%d,%d\n",i,c);
    }
  */

  l=strlen(clair);
 
  posI=k.pos[0];
  posII=k.pos[1];
  posIII=k.pos[2];

  for(i=0;i<l;i++)
    {
      c=(int)(clair[i]-'A');     

      // connecteur entrant
      for(j=0;j<6;j++)
	{
	  if( c == k.connecteur[j][0])
	    c= k.connecteur[j][1];
	  else if( c == k.connecteur[j][1])
	    c= k.connecteur[j][0];
	    }

      // passage dans les trois rotors            
      u=(c+i+posI) % 26;      
      c=RI[u];

      u=(c+posII+i) % 26;
      c=RII[u];

      u=(c+posIII+i) % 26;
      c=RIII[u];
      
      // reflecteur
      u=c;
      c=reflecteur[u];

      // passage dans les trois rotors inverse      
      u=c;
      c=inv_RIII[u];
      u=(c +26- (( i+posIII) % 26)) % 26;
            
      c=inv_RII[u];
      u=(c +26- (( i+posII) % 26)) % 26;
      
      c=inv_RI[u];
      u=(c +26- (( i+posI) % 26)) % 26;
      c=u;
      
      // connecteur sortant
      for(j=0;j<6;j++)
	{
	  if( c == k.connecteur[j][0])
	    c=k.connecteur[j][1];
	  else if( c == k.connecteur[j][1])
	    c=k.connecteur[j][0];
	}
      chiffre[i]=((char) c) + 'A';      
    }
  chiffre[l]='\0';
  
  return;
}

double indice_confiance(char * message, int l)
{
  int i;
  int freq[26];
  double freq_francais[26]={9.42, 1.02,	2.64, 3.39, 15.87, 0.95, 1.04, 0.77, 8.41, 0.89, 0.00, 5.34, 3.24, 7.15, 5.14, 2.86, 1.06, 6.46, 7.90, 7.26, 6.24,  2.15, 0.00, 0.30, 0.24, 0.32};
  double freq_attendues[26];
  char c;
  double r=0,r1=0;


  // tableau freq attendu
  for(i=0;i<26;i++)
    {
      freq_attendues[i]=((double)6*100)/((double) 13*26)+(((double)7)*freq_francais[i])/((double)13);
      freq[i]=0;
      //printf("%lf ", freq_attendues[i]);
    }
  //  printf("\n");
  // getchar();
  for(i=0;i<l;i++)
    {
      c=message[i];
      freq[c-'A']++;
    }

 for(i=0;i<26;i++)
    {
      // r=r+ (((double)freq[i])/((double)l)-freq_attendues[i])*(((double)freq[i])/((double)l)-freq_attendues[i]);
      r1=r1+freq[i]*freq[i]; //*freq[i];
      //r=r+ (((double)freq[i])/((double)l)-freq_attendues[i])*(((double)freq[i])/((double)l)-freq_attendues[i]);
      r=r+freq_attendues[i]*freq_attendues[i];//*freq_attendues[i];
    }
 
 r1=((double)(r1*100*100))/((double)l*l);
 //printf("%lf,%lf\n",r1,r);
 r=abs(r1-r);
 //r=sqrt(r);
 return(r);
}


void analyse(char *chiffre)
{
  int i,l;
  int pI,pII,pIII;
  // on parcourt toutes les configs de rotor possible
  key k,kmin;
  char *clair;
  l=strlen(chiffre)+1;
  clair = (char *)malloc(l*sizeof(char));
  double r,rmin=1000000;

  for(i=0;i<6;i++)
    {
      k.connecteur[i][0]=0;
      k.connecteur[i][1]=0;
    }

  for(pI=0;pI<26;pI++)
    {
      k.pos[0]=pI;;
      for(pII=0;pII<26;pII++)
	{	  	
	  k.pos[1]=pII;
	  for(pIII=0;pIII<26;pIII++)
	    {
	      k.pos[2]=pIII;
	      chiffrement_enigma(chiffre,clair,k);
	      r=indice_confiance(clair,l);
	      if(r < rmin)
		{
		  rmin=r;
		  printf("indice confiance=%lf\n",r);
 		  kmin=k;
		}
	    }
	}
    }
  printf("indice confiance=%lf\n",rmin);
  printf("position des rotors de la clef:\n posI=%d\n posII=%d, posIII=%d \n",kmin.pos[0],kmin.pos[1],kmin.pos[2]);
  // afficher la clef

}


int main()
{
  char *clair="COSETTEETAITLAIDEHEUREUSEELLEEUTPEUTETREETEJOLIENOUSAVONSDEJAESQUISSECETTEPETITEFIGURESOMBRECOSETTEETAITMAIGREETBLEMEELLEAVAITPRESDEHUITANSONLUIENEUTDONNEAPEINESIXSESGRANDSYEUXENFONCESDANSUNESORTEDOMBREPROFONDEETAIENTPRESQUEETEINTSAFORCEDAVOIRPLEURELESCOINSDESABOUCHEAVAIENTCETTECOURBEDELANGOISSEHABITUELLEQUONOBSERVECHEZLESCONDAMNESETCHEZLESMALADESDESESPERESSESMAINSETAIENTCOMMESAMERELAVAITDEVINEPERDUESDENGELURESLEFEUQUILECLAIRAITENCEMOMENTFAISAITSAILLIRLESANGLESDESESOSETRENDAITSAMAIGREURAFFREUSEMENTVISIBLECOMMEELLEGRELOTAITTOUJOURSELLEAVAITPRISLHABITUDEDESERRERSESDEUXGENOUXLUNCONTRELAUTRETOUTSONVETEMENTNETAITQUUNHAILLONQUIEUTFAITPITIELETEETQUIFAISAITHORREURLHIVERELLENAVAITSURELLEQUEDELATOILETROUEEPASUNCHIFFONDELAINEONVOYAITSAPEAUÇAETLAETLONYDISTINGUAITPARTOUTDESTACHESBLEUESOUNOIRESQUIINDIQUAIENTLESENDROITSOULATHENARDIERLAVAITTOUCHEESESJAMBESNUESETAIENTROUGESETGRELESLECREUXDESESCLAVICULESETAITAFAIREPLEURERTOUTELAPERSONNEDECETTEENFANTSONALLURESONATTITUDELESONDESAVOIXSESINTERVALLESENTREUNMOTETLAUTRESONREGARDSONSILENCESONMOINDREGESTEEXPRIMAIENTETTRADUISAIENTUNESEULEIDEELACRAINTELACRAINTEETAITREPANDUESURELLEELLEENETAITPOURAINSIDIRECOUVERTELACRAINTERAMENAITSESCOUDESCONTRESESHANCHESRETIRAITSESTALONSSOUSSESJUPESLUIFAISAITTENIRLEMOINSDEPLACEPOSSIBLENELUILAISSAITDESOUFFLEQUELENECESSAIREETETAITDEVENUECEQUONPOURRAITAPPELERSONHABITUDEDECORPSSANSVARIATIONPOSSIBLEQUEDAUGMENTERILYAVAITAUFONDDESAPRUNELLEUNCOINETONNEOUETAITLATERREUR";
  int l;
  char *chiffre,*clair1;

  // on initialise la clef.
  //key k={{2,17,7},{{1+'A',2+'A'},{3+'A',5+'A'},{7+'A',17+'A'},{5+'A',11+'A'},{19+'A',21+'A'},{23+'A',18+'A'}}};

  key k={{2,17,7},{{1,2},{3,5},{7,17},{8,11},{19,21},{23,18}}};
  

  // on chiffre
  l=strlen(clair);
  chiffre=(char*)malloc((l+1)*sizeof(char));
  clair1=(char*)malloc((l+1)*sizeof(char));

  chiffrement_enigma(clair,chiffre,k);
  
  printf("clair\n %s\n \n chiffre\n %s \n\n",clair,chiffre);
  
  // on dechiffre
  chiffrement_enigma(chiffre,clair1,k);
  
  //  on affiche
  printf("clair\n %s\n \n dechiffre\n %s \n\n",clair,clair1);

  
  // on fait l'analyse de fréquence pour casser enigma
  analyse(chiffre);

  return(0);
}



