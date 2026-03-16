#!/bin/bash

nbrep=0
nbfic=0

for file in * 
do
#echo $file
if [ -f $file ]
then
    nbfic=$(($nbfic+1))
fi
if [ -d $file ]
then
    nbrep=$(($nbrep+1))
fi
done 

echo "nombre de fichiers reguliers= $nbfic"
echo "nombre de repertoires= $nbrep"