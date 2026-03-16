#!/bin/bash

cible="fic2.sh"
virus="fic1.sh"
result="result.sh"

n0=$(cat $cible | wc -l )
n1=$(cat $virus | wc -l )
m1=$((3*$n1))

if [ $n0 -gt $m1 ]
then
    i=1
    cat /dev/null >  $result
    j=0    
    while [ $i -lt $n1 ]
    do
        lvir=$(head -n $i $virus | tail -n 1 )
        r=$((($RANDOM % 3)+1))       
        echo "$lvir$r" >> $result        
	j=$(($j+$r))
	head -n $j $cible | tail -n $r >> $result
        i=$(($i+1))
    done    
fi
lvir=$(head -n $i $virus | tail -n 1 )
r=0
echo "$lvir$r" >> $result
r=$(($n0 - $j))
cat $cible | tail -n $r >> $result
