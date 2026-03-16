#!/bin/bash

 
compteur=0
echo "" > prenoms3.txt

while read f
do
    compteur=$(($compteur+1))
    echo $compteur
    if [ "$compteur" -eq "16" ]
    then
	echo $f  >> prenoms3.txt
	compteur=0
    fi    
done < prenoms2.txt


