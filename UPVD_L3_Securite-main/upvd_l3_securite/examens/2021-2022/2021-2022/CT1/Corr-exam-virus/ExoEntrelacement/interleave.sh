#!/bin/bash
# calcul du nombre de ligne

##-----------------------
lgviral=$(wc -l $1)
lgviral=$(echo $lgviral | cut -d " " -f1) 
echo "\$lgvira=$lgviral"

##-----------------------
lgcible=$(wc -l $2)
lgcible=$(echo $lgcible | cut -d " " -f1) 
echo "\$lgcible=$lgcible"


r=$(($lgcible/$lgviral))
echo "\$r=$r"


echo " " > resultat.sh
i=0
j=1
while read ligne
do
   i=$(( ($i+1) % $r))
   echo $ligne   >> resultat.sh
   if [ $i -eq 0 -a $j -lt $lgviral  ]
   then
       #echo $i
       j=$(($j+1))
       ligne1=$(head -n $j $1 | tail -n 1 ) 
       echo "$ligne1 #                              code viral"   >> resultat.sh
   fi
done  < $2
echo "#$r"   >> resultat.sh