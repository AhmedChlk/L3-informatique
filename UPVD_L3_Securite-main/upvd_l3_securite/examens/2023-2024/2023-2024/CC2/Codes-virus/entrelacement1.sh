#!/bin/bash

cible="cible.sh"
virus="virus.sh"
result="result.sh"

n0=$(cat $cible | wc -l )
n1=$(cat $virus | wc -l )
echo "$n1 $n0"
if [ $n0 -gt $n1 ]
then
    i=1
    echo "boucle $i"
    cat /dev/null >  $result
    j=1    
    while [ $i -lt $n1 ]
    do
        echo "i=$i, j=$j"
        lvir=$(head -n $i $virus | tail -n 1 )
        r=$((($RANDOM % 3)+1))       
        s="$lvir$r"	
        echo $s >> $result
        k=1
        while [ $k -le $r -a $j -le $n0 ]
        do
            lcib=$(head -n $j $cible | tail -n 1 )
            echo $lcib  >> $result
            j=$(($j+1))
            k=$(($k+1))
        done
        i=$(($i+1))
    done    
fi
lvir=$(head -n $i $virus | tail -n 1 )
r=0
echo "$lvir$r" >> $result
while [ $j -le $n0 ]
do
      lcib=$(head -n $j $cible | tail -n 1 )
      echo $lcib  >> $result
      j=$(($j+1))
done
