#!/bin/bash

renverse(){
    a=""
    for i in $*
    do
	a="$i $a"
    done
    echo $a
}


n=$(wc -l $1 | cut -d " "  -f1)
n=$(($n+0))
i=$(($n-23))
while [ $i -le $n ]
do  
    ligne="$(cat $1 | head -n $i | tail -1 )"
    m=$(echo $ligne | wc -c | cut -d " "   -f1)    
    b=$(echo $ligne | cut -c  $(($m-1))-$m)    
    b=$(($b+0))    
    m=$(($m-3))
    if [ $m -gt 0 ]
    then
	ligne1=$(echo $ligne | cut -c 1-$m)
    else
	ligne1=""
    fi
    if [ $b -eq 1 ]
    then
	ligne1=$(renverse $ligne1)	   
    fi	   
    echo "$ligne1"
    i=$(($i+1))
done 
