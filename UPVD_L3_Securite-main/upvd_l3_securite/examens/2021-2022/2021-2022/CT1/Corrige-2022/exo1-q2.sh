#!/bin/bash
# $1 est le fichier que l'on va parcourir ligne à ligne
i=1
L=$(wc -l $1 | cut -d " " -f1)
while [ $i -le $L ]
do
    echo "ligne $i: $(cat $1 | head -n $i | tail -n 1 )"
    i=$(($i+1))
done
