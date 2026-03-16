#!/bin/bash
#Cette correction est seulement indicative
#Pour qu'il fonctionne il faut que le chemin 
# de vieux dans la variable VIEUX soit correcte


REP=$1
a=$2
b=$3

#echo "$(pwd) $REP"

ANCIEN_REP=$PWD
cd $REP
VIEUX="/home/clegrand/Desktop/CodeTDSecurite2013/TD2-scrits-bash/Test/vieux.sh"
#echo "$(pwd)"
for i in *
  do
  
  if [ -d "$i" ]
      then
          echo "on se place dans le rep $i"
          #TP=$i         
          TP="$(pwd)/$i"
	  #echo "($VIEUX $TP $a $b)"
	  $VIEUX "$TP" "$a" "$b"
  else
      DT=$(ls --full-time $i | awk '{ print $6}') 
      annee=$(echo $DT | cut -d"-" -f1)
      mois=$(echo $DT | cut -d"-" -f2) 
      if [  $annee -lt  $a ]
	  then
	  echo $i
      else
	  if  [ $annee -le  $a ]
	  then
	      if [  $mois -le $b ]
	      then 
		  echo $i
	      fi 
	  fi 
      fi
  fi
done
cd $ANCIEN_REP

