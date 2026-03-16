#!/bin/bash
#Ce type de script n'est pas à utilisé car il est imparfait
#Un bon exercice est de trouver une solution meilleur que celle trouvée ici
#On peut par exemple utiliser awk ou sed

for fichier in *
do
ext="$(echo $fichier | cut -d"." -f2)"
echo $ext
if test "$ext" = "c"
then 
nom="$(echo $fichier | cut -d"." -f1)"
echo $nom
mv $fichier "$nom.bak"
fi
done
