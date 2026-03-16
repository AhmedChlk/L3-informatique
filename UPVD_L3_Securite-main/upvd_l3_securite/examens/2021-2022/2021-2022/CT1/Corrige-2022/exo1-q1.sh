#!/bin/bash
# $1 est le fichier et $2 est le numéro de ligne à afficher
cat $1 | head -n $2 | tail -n 1 
