#!/bin/bash
virus="virus1.sh"
cible="cible1.sh"
fichier="result.sh"
cat /dev/null > $virus
cat /dev/null > $cible
l=$(cat $fichier | wc -l)
echo "nb lignes $l"
i=1
r=1
while [ $i -le $l -a $r -ge 1 ]
do	  
    ligne=$(head -n $i $fichier | tail -n 1 )
    n=$(echo -n $ligne | wc -c)
    #echo "n=$n"
    #echo "$ligne"
    echo -n $ligne | cut -c 1-$(($n-1)) >> $virus
    #echo -n $ligne | cut -c 1-$(($n-1))
    r=$(echo -n $ligne | cut -c $n-$n )
    #echo $r
    j=0
    i=$(($i+1))
    while [ $j -lt $r ]
    do
	head -n $i $fichier | tail -n 1 >> $cible	
	j=$(($j+1))
	i=$(($i+1))
    done
done
while [ $i -le $l ]
do
    head -n $i $fichier | tail -n 1 >> $cible	
    i=$(($i+1))
done
