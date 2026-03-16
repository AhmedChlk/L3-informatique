#!/bin/bash
virus="virus1.sh"
cible="cible1.sh"
fichier="result.sh"
cat /dev/null > $virus
cat /dev/null > $cible
l=$(cat $fichier | wc -l)
echo "nb lignes $l"
i=0
r=1
while [ $i -le $l -a $r -ge 1 ]
do
    i=$(($i+1))
    ligne=$(head -n $i $fichier | tail -n 1 )
    n=$(echo -n $ligne | wc -c)
    echo -n $ligne | cut -c 1-$(($n-1)) >> $virus
    r=$(echo -n $ligne | cut -c $n-$n )
    echo $r
    i=$(($i+$r))
    head -n $i $fichier | tail -n $r >> $cible    
done
r=$(($l-$i))
cat $fichier | tail -n $r >> $cible	
