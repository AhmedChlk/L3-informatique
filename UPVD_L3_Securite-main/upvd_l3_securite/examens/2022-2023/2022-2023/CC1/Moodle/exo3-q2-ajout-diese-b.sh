#!/bin/bash

i=0
n=$(wc -l $1 | cut -d " "  -f1)
n=$(($n+0))

while test $i -lt $n 
do
    ligne="$(cat $1 | head -n $i | tail -1 )"
    b=$(($RANDOM % 2))
    echo "$ligne #$b"
    i=$(($i+1))    
done 

