#!/bin/bash
echo "" > fic.txt
n=5000
i=0
echo "bla " >> fic.txt
while [ $i -le 200 ]
do
    echo -n "bla " >> fic.txt
    r=$(($RANDOM % 20))
    if [ $r -eq 0 ]
    then
        echo -n "." >> fic.txt
        r=$(($RANDOM % 3))
        if [ $r -eq 0 ]
        then
            echo "" >> fic.txt        
        fi
    fi
    
    i=$(($i+1))
done
