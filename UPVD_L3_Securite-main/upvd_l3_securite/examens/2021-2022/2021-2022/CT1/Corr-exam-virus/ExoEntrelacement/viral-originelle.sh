

# calcul du nombre de ligne # code viral
# code viral
##----------------------- # code viral
lgviral=$(wc -l $1) # code viral
lgviral=$(echo $lgviral | cut -d " " -f1) # code viral
echo "$lgvira=$lgviral" # code viral
# code viral
##----------------------- # code viral
lgcible=$(wc -l $2) # code viral
lgcible=$(echo $lgcible | cut -d " " -f1) # code viral
echo "$lgcible=$lgcible" # code viral
# code viral
# code viral
r=$(($lgcible/$lgviral)) # code viral
echo "$r=$r" # code viral
# code viral
# code viral
echo " " > resultat.sh # code viral
i=0 # code viral
j=1 # code viral
while read ligne # code viral
do # code viral
    i=$(( ($i+1) % $r)) # code viral
    echo $ligne >> resultat.sh # code viral
    if [ $i -eq 0 -a $j -lt $lgviral ] # code viral
    then # code viral
#echo $i # code viral
	j=$(($j+1)) # code viral
	ligne1=$(head -n $j $1 | tail -n 1 ) # code viral
	echo "$ligne1 # code viral" >> resultat.sh # code viral
    fi # code viral
done < $2 # code viral
