#!/bin/bash
# les fichiers d'entree et de sortie
cible=$1
codeviral=$2
resultat="resultat.sh"
echo "$cible, $codeviral, $resultat"
if [ -f $resultat ]
then
    rm $resultat
fi
touch $resultat
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
	
