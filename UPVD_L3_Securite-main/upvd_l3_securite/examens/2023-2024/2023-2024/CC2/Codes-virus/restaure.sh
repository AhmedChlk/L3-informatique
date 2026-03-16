#!/bin/bash
i=1
ligne=$(head -n $i $virus | tail -n 1 )
n=$(($(echo -n $ligne | wc -c)-1))
res0=$(echo -n $var | cut -c 1-$n )
r=$(echo -n $var | cut -c $n-$n )
echo "res0=$res0"
