#!/bin/bash

echo "Bonjour $USER, vous utilisez  le shell $SHELL"
echo "Aujourd'hui nous sommes le $(date +%D)"

# on indique la saison (pour simplifier je n'ai tenu compte que du mois
mois=$(date +%m)

if [ $mois -le 3 ]
then 
echo "Nous sommes en hiver"
elif [ $mois -gt 3 -a  $mois -le 6 ]
then
echo "Nous sommes au printemps"
elif [ $mois -gt 6 -a  $mois -le 9 ]
then
echo "Nous sommes en ete"
elif [ $mois -gt 9 -a  $mois -le 12 ]
then
echo "Nous sommes a l'automne"
fi
