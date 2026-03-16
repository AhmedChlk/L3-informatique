
#echo "nombre $# premier $1 second $2"

REP=$1

#echo "$(ls $REP)"
cd $REP
for i in *
  do
      if [ -d $i ]
	  then
	  if test "$i" !=  "$REP"
	      then
	      if test "$i" !=  "$(echo $REP/..)"
		  then
		  echo "$i"
     # if test "$i" "$REP"
       #Si c'est un repertoire on appel recursivement le script
		  tp=$i
		  echo "$(test-rec.sh $tp)"
	      fi
      fi
      fi
done


