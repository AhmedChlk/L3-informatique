#!/bin/bash

function dir() {

    path=$(pwd)
    fname=$(basename $0)
    fpath=$(realpath $0)

    lname=${#fname}
    lpath=${#fpath}
    lpath=$(($lpath - $lname))
    echo "Longueur du chemin complet: $lrep"
    echo "Longueur du fichier: $lname"
    echo "Longueur de l'emplacement: $lpath"

    rpath1=$(echo -n $fpath | head -c $lpath)
    rpath2=${fpath:0:lpath}
    
    echo "Nom du fichier: $fname"    
    echo "Répertoire courant: $path"
    echo "Chemin du fichier: $fpath"
    echo -e
    
    echo "RPATH = "
    echo  $rpath1
    echo  $rpath2
}

dir

#/media/etudiants/z92403559/Mon_dossier_reseau_UPVD/Sécurité/shell/repertoire.sh
