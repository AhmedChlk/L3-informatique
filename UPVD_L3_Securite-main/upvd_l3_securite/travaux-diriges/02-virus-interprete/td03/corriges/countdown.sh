#!/bin/bash

compteur=10
if [ $# -ge 1 ]
then
    compteur=$1
fi

while [ $compteur -gt 0 ]
do
    echo $compteur
    compteur=$(($compteur-1))
done
echo "GO!"
