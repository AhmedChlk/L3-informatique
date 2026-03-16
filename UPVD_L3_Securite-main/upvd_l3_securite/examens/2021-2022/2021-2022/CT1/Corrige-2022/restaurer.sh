#!/bin/bash
# parametres : $1 le nom du fichier à restaurer et $2 vaut s
echo "$1 avec un pas de $2"
s=$(($2))
L=$(wc -l $1 | cut -d " " -f1)
echo "L=$L"
head -n $s  $1  > cible.sh.res
cp /dev/null codeviral.sh.res
i=$(($s))
while [ $i -lt $(($L)) ]
do
    echo "i=$i"
    head -n $(($i+1))  $1 | tail -n 1 >> codeviral.sh.res
    if [ $(($i+$s+1)) -gt $(($L)) ]
    then
	tail -n $(($L-($i+1))) $1 >> cible.sh.res
    else
	head -n $(($i+1+$s))  $1 | tail -n $s >> cible.sh.res
    fi
    i=$(($i+$s+1))
done

	      
