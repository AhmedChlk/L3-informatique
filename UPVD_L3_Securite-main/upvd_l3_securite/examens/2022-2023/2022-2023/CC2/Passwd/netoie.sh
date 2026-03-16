#!/bin/bash


 
compteur=0;
oldprenom=""
while read f
do
    
    prenom=$(echo $f | cut -d ";" -f2)
    #echo $prenom
    if [ "$prenom" != "$oldprenom" ]
    then
	echo $prenom  >> prenoms.txt
	compteur=$(($compteur+1))
	oldprenom=$prenom
    fi
done < nat2021.csv

echo $compteur
