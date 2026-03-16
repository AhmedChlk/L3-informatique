
REP=$1

cd $REP
for i in *
  do
  if [ -d "$i" ]
      then
      if [ "$i" !=  "$REP" ]
	  then
          #Si c'est un repertoire on appel recursivement le script
	  #echo "$(recursifs.sh $i)"
	  TP="$REP$i"
	  echo "$(recursifs.sh $TP)"
     fi
  else
      DT=$(ls --full-time $i | cut -d" " -f7) 
      annee=$(echo $DT | cut -d"-" -f1)
      mois=$(echo $DT | cut -d"-" -f2) 
      Y=$(($annee+0))
      M=$(($mois+0))
      b=$(($8+0))
      a=$(($2+0))
#      echo $Y
      if [ $Y -gt  $a ]
	  then
	  echo $i
      fi
      if [ "$Y" = "$a" ]
	  then
	  if [ $M -lt $b ]
	      then 
	      echo $i
	  fi 
      fi 
  fi
done
