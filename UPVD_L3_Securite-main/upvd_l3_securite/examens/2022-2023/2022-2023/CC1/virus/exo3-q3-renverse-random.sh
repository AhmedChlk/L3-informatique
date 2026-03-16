#!/bin/bash

renverse(){
    a=""
    for i in $*
    do
	a="$i $a"
    done
    echo $a
}

i=1
n=$(wc -l $1 | cut -d " "  -f1)
n=$(($n+0))
while [ $i -le $n ]
do
    ligne="$(cat $1 | head -n $i | tail -1 )"
    b=$(($RANDOM % 2))
    if [ $b -eq 1 ]
       then
	   ligne=$(renverse $ligne)
	   ligne="$ligne#$b"
    else
	ligne="$ligne#$b"
    fi
    echo "$ligne"
    i=$(($i+1))
done 

