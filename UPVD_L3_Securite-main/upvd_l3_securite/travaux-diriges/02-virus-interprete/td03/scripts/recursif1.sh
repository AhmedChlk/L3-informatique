#!/bin/bash 

anneelim=$1
export anneelim

function rec {
    #echo $1 
    for i in *
    do
	if [ -d "$i" ]
	then
	    cd $i	    
	    rec $i
	elif [ -f "$i" ]
	then
             # on recupere l'annee de
	    DT=$(ls --full-time $i | cut -d " " -f6) 

	    annee=$(echo $DT | cut -d "-" -f1)
	    #echo "$DT et $annee"
            # on compare avec l'annee donne en parametre du script
	    if [ $annee -gt  $anneelim ]
	    then
		echo "$i a ete cree en $DT il se trouve dans $(pwd)"
	    fi
	fi
    done
}  

rec ./
