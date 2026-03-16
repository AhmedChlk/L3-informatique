
echo "Vous etes l'utilisateur $USER"
echo "Aujourd'hui nous sommes le $(date '+%A %d %B %Y')"

mois=$(date +%m)
if test $mois -le 3
then
echo "C'est l'hivers"
else if test $mois -le 6
then 
echo "C'est le printemps"
else if test $mois -le 9
then 
echo "C'est l'ete"
else if test $mois -le 12
then 
echo "C'est l'automne"
fi
fi
fi
fi

freq="$(cat "/proc/cpuinfo" | grep "cpu MHz" |  cut -d" " -f3 | head -n 2)"
echo $freq
echo "La frequence du processeur est la suivante $freq Mhz"

