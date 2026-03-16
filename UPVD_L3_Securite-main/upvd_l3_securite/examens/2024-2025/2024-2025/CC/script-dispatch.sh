#!/bin/bash
# examen1 a2q7e2q, examen2 d62suwj, examen3 s9tn42r
i=22
while [ $i -lt 37 ]
do
    sshpass -p a2q7e2q scp -r documents-cc-ia-2025/  examen2@pctd36.univ-perp.fr:Bureau/
    i=$(($i+1))
done
