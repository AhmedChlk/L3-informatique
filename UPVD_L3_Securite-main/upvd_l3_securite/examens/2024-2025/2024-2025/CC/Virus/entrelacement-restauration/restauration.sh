#!/bin/bash

fichier=$1
l=$(wc -l $fichier | cut -d" " -f1)
n=$2
output1=$3
output2=$4
echo "" > $output1
echo "" > $output2
i=0
j=0
while [ $i -le $l ]
do
    ligne=$(cat $fichier | head -n $i |  tail -n 1)
    for mot in $ligne
    do        
        if [ $j -lt $n ]
        then            
            cf=$(echo -n $mot | wc -c )    
            cd=$(($cf-1))
            #echo "${mot:0:$cd},cd=$cd,cf=$cf"
            echo -n "${mot:0:$cd} " >> $output1
            echo -n "${mot:$cd:1}" >> $output2
            #echo "${mot:$cd:1}"
        else
            echo -n "$mot " >> $output1
        fi
        j=$(($j+1))
    done
    echo "" >> $output1
    i=$(($i+1))
done    
