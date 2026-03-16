#!/bin/bash 

function rec {
    echo $1 
    for i in *
    do
	if [ -d "$i" ]
	then
	    cd $i	    
	    rec $i
            cd ..
	elif [ -f "$i" ]
	then
             # on recupere l'annee de
	    DT=$(ls --full-time $i | tr -s ' ' | cut -d " " -f6) 
	    annee=$(echo $DT | cut -d "-" -f1)	    
            # on compare avec l'annee donne en parametre du script
	    if [ $annee -gt  $anneelim ]
	    then
		echo "$i a ete cree en $DT il se trouve dans $(pwd)"
	    fi
	fi
    done
}

if [ $# -ge 1 ]
then
    anneelim=$1
    export anneelim       
    rec ./
else
    echo "il faut donner une annee en paramettre"
fi
