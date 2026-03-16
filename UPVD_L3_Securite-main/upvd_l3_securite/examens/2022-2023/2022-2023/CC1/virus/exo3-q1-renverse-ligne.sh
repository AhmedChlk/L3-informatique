#!/bin/bash

renverse(){
    a=""
    for i in $*
    do
	a="$i $a"
    done
    echo $a
}

renverse $*
