#!/bin/bash


ligne="une petite phrase"
r=""
for mot in $ligne
do
    l=$(echo -n $mot | wc -c )
    i=$l    
    while [ $i -gt 0 ]
    do
        c=$(echo -n $mot | head -c $i |  tail -c 1  )        
        r="$r$c"
        i=$(($i-1))
    done
    r="$r "
done
echo $r

# echo $line | tr ' ' '\n' | 
