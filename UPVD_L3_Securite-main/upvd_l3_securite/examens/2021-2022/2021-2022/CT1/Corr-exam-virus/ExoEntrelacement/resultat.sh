 
blabla1
blabla2
# calcul du nombre de ligne #                              code viral
blabla3
blabla4
 #                              code viral
blabla5
blabla6
##----------------------- #                              code viral
blabla7
blabla8
lgviral=$(wc -l $1) #                              code viral
blabla9
blabla10
lgviral=$(echo $lgviral | cut -d " " -f1)  #                              code viral
blabla11
blabla12
echo "\$lgvira=$lgviral" #                              code viral
blabla13
blabla14
 #                              code viral
blabla15
blabla16
##----------------------- #                              code viral
blabla17
blabla18
lgcible=$(wc -l $2) #                              code viral
blabla19
blabla20
lgcible=$(echo $lgcible | cut -d " " -f1)  #                              code viral
blabla21
blabla22
echo "\$lgcible=$lgcible" #                              code viral
blabla23
blabla24
 #                              code viral
blabla25
------------------------------------
 #                              code viral
blabla1
blabla2
r=$(($lgcible/$lgviral)) #                              code viral
blabla3
blabla4
echo "\$r=$r" #                              code viral
blabla5
blabla6
 #                              code viral
blabla7
blabla8
 #                              code viral
blabla9
blabla10
echo " " > resultat.sh #                              code viral
blabla11
blabla12
i=0 #                              code viral
blabla13
blabla14
j=1 #                              code viral
blabla15
blabla16
while read ligne #                              code viral
blabla17
blabla18
do #                              code viral
blabla19
blabla20
   i=$(( ($i+1) % $r)) #                              code viral
blabla21
blabla22
   echo $ligne   >> resultat.sh #                              code viral
blabla23
blabla24
   if [ $i -eq 0 -a $j -lt $lgviral  ] #                              code viral
blabla25
------------------------------------
   then #                              code viral
blabla1
blabla2
       #echo $i #                              code viral
blabla3
blabla4
       j=$(($j+1)) #                              code viral
blabla5
blabla6
       ligne1=$(head -n $j $1 | tail -n 1 )  #                              code viral
blabla7
blabla8
       echo "$ligne1 #                              code viral"   >> resultat.sh #                              code viral
blabla9
blabla10
   fi #                              code viral
blabla11
blabla12
done  < $2 #                              code viral
blabla13
blabla14
blabla15
blabla16
blabla17
blabla18
blabla19
blabla20
blabla21
blabla22
blabla23
blabla24
blabla25

#2
