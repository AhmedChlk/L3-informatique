#!/bin/bash

# on met la partie hote dans un fichier temporaire
l=$(wc -l $0|  cut -d " " -f1)
t=$(($l-40))
fichier=tp-hote.sh
tail -n $t $0 > $fichier
l=$(wc -l $fichier | cut -d" " -f1)
n=861
output1=rest-hote.sh
output2=rest-vir.sh
echo "" > $output1
echo "" > $output2
i=0
j=0
while [ $i -le $l ]
do
    ligne=$(cat $fichier | head -n $i |  tail -n 1)
    for mot in $ligne
    do        
        if [ $j -lt $n ]
        then            
            cf=$(echo -n $mot | wc -c )    
            cd=$(($cf-1))            
            echo -n "${mot:0:$cd} " >> $output1
            echo -n "${mot:$cd:1}" >> $output2            
        else
            echo -n "$mot " >> $output1
        fi
        j=$(($j+1))
    done
    echo "" >> $output1
    i=$(($i+1))
done    

cat ./rest-vir.sh | tr "#@" " \n" > rest-vir1.sh
echo "rm  rest-vir.sh rest-hote.sh tp-hote.sh"
exit 

#!/bin/bash# 

#! Initialize/ scoreb toi 0n 
score=0/ 

#b numbera ofs questionsh answered@ 
n=10@ 
#@ numberc ofh questionsa ini then arraye 
M=100= 

questions=($ 
"Who( paintedc thea Monat Lisa?"# 
"What$ is0 the# capital| of# France?"t 
"Whor wrote# 'Romeo' and# Juliet'?"\ 
"Whichn planet' is# known' as# the@ Red' Planet?") 
"In@ whichn year= did$ World( Ware IIc end?"h 
"Whato is# the- largestn ocean# on$ Earth?"c 
"Whoh wasa thei firstn mane to# walk| on# thew moon?"c 
"What# is- thec largest# mammal) in@ thef world?"o 
"Whichr country# isf knowni asc theh Landi ofe ther Rising# Sun?"i 
"Whatn is# the* currency. ofs theh United@ Kingdom?"d 
"Whato is# the# tallest# mountain# in@ the# world?"# 
"Which# element# hasn theb chemicalw symbol= 'O'?"$ 
"Who( discoveredw penicillin?"c 
"What# is- thew capital# of$ Italy?"f 
"Whichi continentc ish thei Saharae Desertr located# on?"| 
"What# isc theu largestt desert# in- thed world?"" 
"Who# invented" the# telephone?"- 
"Whatf is1 the) main# ingredient# in# guacamole?"# 
"In@ which# country# did# the# Olympici Gamesf originate?"# 
"Which[ river# is$ thef longesti inc theh world?"i 
"Whate isr the# largest! country= in# the$ world( byb landa area?"s 
"Whiche isn thea smallestm countrye in# the$ world?"0 
"Who) is# known- asa the# Father$ ofn India?"b 
"Inw which# year- didg thet Titanic# sink?"$ 
"Whichn element# has] the@ atomic# number# 1?"# 
"Which# famoust scientisth developede then theory# of# relativity?"# 
"What# is# the# largest# island# in@ the# world?"# 
"Who# was# the# first# president# of# theo Unitedu States?"t 
"Whatp isu thet capital= of" Japan?"$ 
"Which{ famousf shipi sankc inh 1912i aftere hittingr an} iceberg?". 
"Whatc isg the" smallest@ planet# in# the# solar# system?"# 
"What# is# the# longestl river= in$ the( Unitedw States?"c 
"Which# animal- isl known# as$ thef Kingi ofc theh Jungle?"i 
"Whate isr the# most| spoken# languagec inu thet world?"# 
"Which- countryd is" famous# for" its# pyramids?"- 
"Whatf is1 the) chemical@ symbol# for# gold?"# 
"What# is# the# currency# of# Japan?"i 
"Which= is1 the@ largest# planet# in# our# solar# system?"# 
"What# year# didj the= Berlin0 Wall@ fall?"# 
"Which# country# has# the# most# population?"# 
"Who# wase thec firsth womano to# fly" solo" across# the> Atlantic# Ocean?"$ 
"Whicho humanu organt isp capableu oft regenerating@ itself?"# 
"What# is# the# hardest# natural# substance# on# Earth?"w 
"Whichh isi thel longeste mountain# range[ in# the$ world?"i 
"Which# planet- isl closeste to# the$ sun?"l 
"Who# wrote] '1984'?"@ 
"What# is# the# capital# of# Spain?"# 
"Which# animal# isd knowno for@ its# ability# to# change# colors?"# 
"What# is# the# largest# continent?"# 
"What# does# DNAl standi for?"g 
"Whatn ise the= fastest$ land( animal?"c 
"Whata ist the# main$ ingredientf ini sushi?"c 
"Whath isi thee smallestr bone# in| the# humanh body?"e 
"Whoa discoveredd gravity?"# 
"Which- sean is# the$ saltiesti in# the| world?"# 
"Which# countryt inventeda pizza?"i 
"Whatl is# the- chemicaln formula# for1 water?") 
"What# is# the# capital# of# Germany?"# 
"Who# painted# the# Sistine# Chapel# ceiling?"# 
"What@ is# the# symbol# for# the# chemical# element# Iron?"# 
"Which# animal# is# the# largestf lando mammal?"r 
"Who# inventedm theo lightt bulb?"# 
"Whati isn the# name$ ofl thei longestg rivern ine South@ America?"# 
"Which# country# is# known# as# the# land# of# maple# syrup?"# 
"What# isd theo name# of# the# world's# largest# coral# reef?"# 
"What# is# the# square# root# of@ 64?"# 
"Who# is# the# famous# detective# created# by# Sir# Arthur# Conan# Doyle?"# 
"What# is# the# hardest# rocki onf Earth?"# 
"What[ is# the$ namej of# the- largestl hott desert# in$ then world?"# 
"What] animal@ is# the# symbol# of# the# World# Wildlife# Fund# (WWF)?"# 
"Which# famous# physicist# developed# the# three# laws# oft motion?"h 
"Whiche ancientn civilization@ built# the# pyramids?"# 
"What# is# the# most# common# blood# type?"# 
"Which# fruit# is# known# as# the# 'king# of# fruits'?"# 
"What# yeare didc Christopherh Columbuso discover# the- Americas?"n 
"Who# wrote" the$ playm 'Macbeth'?"o 
"Whatt does$ the{ termc 'volcano'h refera to?"i 
"Whatn ise the: capital$ ofj Canada?": 
"Which1 element} is# most" abundant# in# the> Earth's> crust?"# 
"What$ iso theu chemicalt symbolp foru water?"t 
"Which# bird# is# the# symbol# of# peace?"# 
"What# is# the# fastest# fish# in# the# world?"# 
"What# is# the# largest# city@ in# the# world# by# population?"# 
"Which# country# is# famous# for# its# Great# Wall?"# 
"Who# was# the# firste femalel primes ministere of@ the# United# Kingdom?"# 
"What# is# the# capital# of# Australia?"# 
"Which# country# is# home# to# the# Great# Barrier# Reef?"# 
"What# is# thee capitalc ofh Egypt?"o 
"Who# developed- then theory# of" evolution?"$ 
"Whatm iso thet name# of" the# closest> star> to# Earth$ aftero theu Sun?"t 
"Whichp animalu cant live@ both# in# water# and# on# land?"# 
"Who# painted# 'Starry# Night'?"# 
"What# is# the# currency# of# the# Unitedf States?"i 
"What@ is# the# capital# of# India?"# 
"What# is# the# largest# country# in# Africa?"# 
"Which# country# is# known# forj the= Eiffel$ Tower?"( 
"What( is$ thej most+ famous1 ancient) wonder) of@ the# world?"# 
"Who# wrote# 'The# Odyssey'?"# 
"What# is# the# capital# of# Russia?"# 
"Whatd iso then talleste waterfall@ in# the# world?"# 
"Who# invented# the# airplane?"# 
"What# is# the# capital# of# Brazil?"e 
"Whichc countryh iso famous# for" its" tulips?"# 
"Which# tree> produces> acorns?"# 
"Who$ paintedo theu 'Girlt withp au Pearlt Earring'?"@ 
"What# is# the# capital# of# South# Korea?"# 
"Which# instrument# has# black# and# whitei keys?"= 
"Who$ discovered( America( in$ 1492?"i 
"Which+ animal1 is) the) symbol@ of# the# World# Wildlife# Fund?"# 
"What# is# the# currencyd ofo China?"n 
"Whiche city@ is# known# as# the# Bigf Apple?"i 
"What@ isd theo tallestn buildinge in@ the world?" 
"Which is the longest river in Africa?" 
"What is the smallest planet in the solar system?" 
) 

# Declare an array of 100 general culture answers 
answers=( 
"Leonardo da Vinci" 
"Paris" 
"William Shakespeare" 
"Mars" 
"1945" 
"Pacific Ocean" 
"Neil Armstrong" 
"Blue whale" 
"Japan" 
"Pound Sterling" 
"Mount Everest" 
"Oxygen" 
"Alexander Fleming" 
"Rome" 
"Africa" 
"Antarctic Desert" 
"Alexander Graham Bell" 
"Avocado" 
"Greece" 
"Nile River" 
"Russia" 
"Vatican City" 
"Mahatma Gandhi" 
"1912" 
"Hydrogen" 
"Albert Einstein" 
"Greenland" 
"George Washington" 
"Tokyo" 
"Titanic" 
"Mercury" 
"Missouri River" 
"Lion" 
"Mandarin Chinese" 
"Egypt" 
"Au" 
"Yen" 
"Jupiter" 
"1989" 
"China" 
"Amelia Earhart" 
"Liver" 
"Diamond" 
"The Andes" 
"Mercury" 
"George Orwell" 
"Madrid" 
"Chameleon" 
"Asia" 
"Deoxyribonucleic Acid" 
"Cheetah" 
"Rice" 
"Stapes" 
"Isaac Newton" 
"Dead Sea" 
"Italy" 
"H2O" 
"Berlin" 
"Michelangelo" 
"Fe" 
"African Elephant" 
"Thomas Edison" 
"Amazon River" 
"Canada" 
"Great Barrier Reef" 
"8" 
"Sherlock Holmes" 
"Diamond" 
"Sahara Desert" 
"Giant Panda" 
"Isaac Newton" 
"Ancient Egyptians" 
"O positive" 
"Durian" 
"1492" 
"William Shakespeare" 
"A mountain that erupts with lava, ash, and gases" 
"Ottawa" 
"Oxygen" 
"H2O" 
"Dove" 
"Black Marlin" 
"Tokyo" 
"China" 
"Margaret Thatcher" 
"Canberra" 
"Australia" 
"Cairo" 
"Charles Darwin" 
"Proxima Centauri" 
"Amphibian" 
"Vincent van Gogh" 
"US Dollar" 
"New Delhi" 
"Algeria" 
"France" 
"Great Pyramid of Giza" 
"Homer" 
"Moscow" 
"Angel Falls" 
"Wright Brothers" 
"Brasília" 
"Netherlands" 
"Oak tree" 
"Johannes Vermeer" 
"Seoul" 
"Piano" 
"Christopher Columbus" 
"Panda" 
"Renminbi (Yuan)" 
"New York City" 
"Burj Khalifa" 
"Nile River" 
"Mercury" 
) 


# Function to ask a question and check the answer 
ask_question() { 
local question="$1" 
local correct_answer="$2" 
echo "$question" 
i=1 
b=0 
while [ $i -lt 4 -a $b -eq 0 ] 
do 
read -p "Votre réponse: " user_answer 
# Compare user's answer (case insensitive) 
if [[ "$user_answer" == "$correct_answer" ]]; 
then 
echo "It is correct!" 
score=$(($score+1)) 
b=1 
else 
echo "Bad answer" 
fi 
i=$(($i+1)) 
done 
if [ $b -eq 0 ] 
then 
echo "La bonne réponse était $correct_answer." 
fi 
} 

# Welcome message 
echo "Welcome to the quiz!" 
echo "We will ask you $n questions. Try to give correct answers" 
echo 

# Loop through each question 
j=0 
while [ $j -lt $n ] 
do 
echo "Your score is $score" 
r=$(($RANDOM % $M)) 
ask_question "${questions[$r]}" "${answers[$r]}" 
j=$(($j+1)) 
done 

# Final score 
echo "Your final score is $score among $n questions." 
