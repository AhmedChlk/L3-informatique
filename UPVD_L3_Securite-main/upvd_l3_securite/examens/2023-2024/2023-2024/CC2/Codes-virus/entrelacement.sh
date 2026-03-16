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
    while [ $i -le $n1 ]
    do
        echo "i=$i, j=$j"
        lvir=$(head -n $i $virus | tail -n 1 )
        echo "ligne virale=$lvir"
        r=$((($RANDOM % 3)+1))
        if [ $i -eq $n1 ]
        then
            r=0
        fi
        res0=$(echo $lvir |  grep "=")
        if [ -n "$res0" ]
        then
            res1=$(echo $lvir | cut -d"=" -f1)
            res2=$(echo $lvri | cut -d"=" -f2)        
            s="$res1$r=$res2"        
        else
            s="$lvir#$r"
        fi
        echo $s >> $result
        echo "$s ecrit dans le fichier"         
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
while [ $j -le $n0 ]
do
      lcib=$(head -n $j $cible | tail -n 1 )
      echo $lcib  >> $result
      j=$(($j+1))
done
