#!/bin/bash


path=$(pwd)
fname=$(basename $0)
fpath=$(realpath $0)

lname=${#fname}
lrep=${#fpath}
lpath=$(($lrep - $lname))

lname=$(echo -n $fname | wc -c)
lpath=$(echo -n $fpath | wc -c)
lrep=$(($lpath - $lname))

echo "Longueur du chemin complet: $lpath"
echo "Longueur du fichier: $lname"
echo "Longueur de l'emplacement: $lrep"

echo -n $fpath | wc -c
echo -n $fname | wc -c 
echo $fname
echo $fpath



echo  -n $fpath | head -c $lrep
echo ${fpath:0:10}
