#!/bin/bash
i=1
echo "#!/bin/bash" > victime.sh
while [ $i -le $1 ]
do
    echo "echo \"ligne $i\"" >> victime.sh
    i=$(($i+1))
done
chmod u+x victime.sh






