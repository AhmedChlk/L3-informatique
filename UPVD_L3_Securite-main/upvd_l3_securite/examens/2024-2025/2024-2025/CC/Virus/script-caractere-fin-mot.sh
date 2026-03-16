#!/bin/bash


f()
{    
    #ligne="Bonjour monsieur êtes vous bien arrive"
    fichier=$1
    chaine=$2
    echo "fichier=$fichier"
    echo "code viral \"$chaine\""
    l=$(wc -l $fichier | cut -d" " -f1)
    n=$4
    echo $l
    i=1
    tempf="temp.txt"
    vir="vir-output.txt"
    echo "" > temp.txt
    echo "fichiers : $fichier $tempf $vir, n=$n"
    j=0
    while [ $i -le $l ]
    do
        ligne=$(cat $fichier | head -n $i |  tail -n 1)
        #echo "ligne=$ligne"
        for mot in $ligne
        do
            #cf=$(echo $mot | wc -c )    
            #cd=$(($cf-1))
            #echo  -n "$mot $cd,$cf "
            #c=$(echo -n "$mot" | cut -c $cd-$cf)
            #echo "$mot$chaine{$j,1} "
            # echo "j=$j n=$n"
            if [ $j -lt $n ]
            then
                echo $3
               if [ $3 -eq 1 ]
               then
                   echo "coucou"
                   cf=$(echo $mot | wc -c )    
                   cd=$(($cf-1))
                   echo "${mot:0:$cd}" >> $tempf
                   echo "${mot:$cd:1}" >> $vir
               else

                   echo -n "$mot${chaine:$j:1} "  >> $tempf              
               fi               
            else
                echo -n "$mot " >> $tempf
            fi
            j=$(($j+1))
        done        
        i=$(($i+1))
    done    
}

fichier="fic.txt"
# f $fichier

codevir=$(cat vir.sh | tr ' \n' '#@')
echo $fichier
echo "code viral \"$codevir\""
n=$(echo $codevir | wc -c )
#echo "${codevir:2:1} "

#f $fichier $codevir 0 $n
f temp1.txt "" 1 $n

# remplacer les caractère blanc et des caractères de fin de ligne par des caractères spéciaux dans le fichier viral pour avoir une seul ligne

# parcourir les mots du fichier à infecter ajouter les caracteres du code viral

# désinfection ?
