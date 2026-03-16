#!/bin/bash


countdown()
{
    echo $1
    if [ $1 -gt 1 ]
    then
        countdown $(($1-1))
    fi
}

if [ $# -ge 1 ]
then
    countdown $1
else
    echo "Donnez un entier en paramettre"
fi
