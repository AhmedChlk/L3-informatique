#!/bin/bash

u=$(tail -n 1 $1 | cut -d "#" -f2)
#echo "$u"
u=$(($u+1))


echo "" > viral-originelle.sh
echo "" > cible-originelle.txt
i=0
j=1
while read ligne
do
    i=$(( ($i+1) % $u))
    echo $i
    if [ $i -eq 1 -a $j -le 33 ]
    then
	j=$(($j+1))
	echo $ligne >> viral-originelle.sh
    else
	echo $ligne >> cible-originelle.txt
    fi
done  < $1
