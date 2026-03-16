#!/bin/bash
#script facilitant l'ecriture de script

# On ecrit "#!/bin/bash"
# dans la premiere ligne du fichier donne en parametre
echo "#!/bin/bash" > $1

#On met le droit d'execution sur le fichier
chmod u+x $1
echo "Ecrivez votre script et terminez par C-d"
# On ajoute en fin ce qui est sur l'entree standard
cat >> $1
