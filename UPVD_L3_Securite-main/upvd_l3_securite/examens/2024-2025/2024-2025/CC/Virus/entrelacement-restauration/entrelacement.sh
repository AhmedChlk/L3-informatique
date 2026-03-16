#!/bin/bash

fichier=$1
chaine=$2
output=$3
l=$(wc -l $fichier | cut -d" " -f1)    
n=$(echo -n $chaine | wc -c )

echo "fichier=$fichier, chaine=\"$chaine\", output=$output, n=$n, l=$l"
i=1
j=0
echo "" > $output
while [ $i -le $l ]
do
    ligne=$(cat $fichier | head -n $i |  tail -n 1)
    #echo "ligne=$ligne"
    for mot in $ligne
    do            
        if [ $j -lt $n ]
        then
            echo -n "$mot${chaine:$j:1} "  >> $output                   
        else
            echo -n "$mot " >> $output
        fi
        j=$(($j+1))
    done
    echo ""  >> $output
    i=$(($i+1))
done    
