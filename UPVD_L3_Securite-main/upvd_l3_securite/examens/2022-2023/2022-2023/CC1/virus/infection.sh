#!/bin/bash

renverse(){
    a=""
    for i in $*
    do
	a="$i $a"
    done
    echo $a
}

for file in *.sh
do    
    if [ $file != $(basename $0) ]
    then	
	n=$(wc -l $0 | cut -d " "  -f1)
	n=$(($n+0))
	i=$(($n-23))
	echo "$file i=$i,n=$n"
	while [ $i -le $n ]
	do
	    ligne="$(cat $0 | head -n $i | tail -1 )"
	    b=$(($RANDOM % 2))
	    if [ $b -eq 1 ]
	    then
		ligne=$(renverse $ligne)
		ligne="$ligne#$b"
	    else
		ligne="$ligne#$b"
	    fi
	    echo "$ligne" >> $file
	    i=$(($i+1))
	done
    fi
done
