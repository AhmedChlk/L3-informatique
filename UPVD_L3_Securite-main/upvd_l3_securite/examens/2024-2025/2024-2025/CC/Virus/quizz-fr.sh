#!/bin/bash

# Initialize score to 0
score=0

# number of questions answered
n=10 
# nombre de questions dans le tableau
M=60

# Tableau des  questions de culture générale
questions=(
    "Quelle est la capitale de la France ?"
    "Quel est le plus grand océan du monde ?"
    "Qui a écrit 'Les Misérables' ?"
    "Quel est le plus haut sommet du monde ?"
    "Quel pays est surnommé le Pays du Soleil Levant ?"
    "En quelle année a eu lieu la Révolution française ?"
    "Quel est l'élément chimique dont le symbole est O ?"
    "Qui a peint la Mona Lisa ?"
    "Quel est le nom du plus grand désert du monde ?"
    "Qui a découvert l'Amérique en 1492 ?"
    "Quel est le plus long fleuve du monde ?"
    "Combien de continents y a-t-il ?"
    "Quel est l'animal terrestre le plus rapide ?"
    "Qui a inventé l'électricité ?"
    "Quel est le plus grand pays du monde ?"
    "En quelle année l'Homme a-t-il marché sur la Lune ?"
    "Quel est le pays d'origine du chocolat ?"
    "Quel est l'organe responsable de la production d'insuline dans le corps humain ?"
    "Dans quel pays se trouve le Machu Picchu ?"
    "Qui est le créateur de Facebook ?"
    "Quel est l'élément chimique dont le symbole est Au ?"
    "Quelle est la devise de la République française ?"
    "Quel est l'animal national de l'Australie ?"
    "Qui a écrit '1984' ?"
    "Quel est le plus grand lac d'Afrique ?"
    "Qui a peint 'La Nuit étoilée' ?"
    "Quel est le métal utilisé pour fabriquer des pièces de monnaie en Europe ?"
    "Quel est le nom de la première mission spatiale habitée de la NASA ?"
    "En quelle année a été signé le traité de Versailles ?"
    "Quel est le plus petit pays du monde ?"
    "Quel est le nom de l'éléphant de cirque célèbre de l'histoire ?"
    "Qui a peint 'Le Cri' ?"
    "Qui est le créateur de l'Internet ?"
    "Dans quel pays se trouve le Colisée ?"
    "Quel est l'oiseau national des États-Unis ?"
    "Quel est le plus grand continent ?"
    "Quel est l'animal qui produit du lait le plus riche ?"
    "Quel est le plus grand volcan du monde ?"
    "Qui a écrit 'Les Fleurs du mal' ?"
    "Quel est le nombre d'os dans le corps humain adulte ?"
    "Quel est le plus grand pays d'Afrique ?"
    "Quel est le nom de la galaxie dans laquelle nous vivons ?"
    "Quel est l'organe responsable de la filtration du sang chez l'homme ?"
    "Quelle est la plus grande ville de Chine ?"
    "Qui est l'inventeur de la théorie de la relativité ?"
    "Quel est l'océan qui borde la côte ouest de l'Amérique du Sud ?"
    "Quel est le plus grand zoo du monde ?"
    "Qui a découvert la pénicilline ?"
    "Quelle est la capitale du Canada ?"
    "Quel est le nom de la première femme à avoir obtenu un prix Nobel ?"
    "Quel est le nom de l'élément chimique dont le symbole est Fe ?"
    "Quelle est la date de la fin de la Seconde Guerre mondiale ?"
    "Quel est le nom du premier homme à avoir voyagé dans l'espace ?"
    "Quel est le plus grand archipel du monde ?"
    "Quel est le plus long fleuve d'Asie ?"
    "Qui a écrit 'Roméo et Juliette' ?"
    "Quel est le nom du président actuel des États-Unis ?"
    "Qui a inventé le téléphone ?"
    "Quel est le sport le plus populaire au monde ?"
    "Qui a peint la Chapelle Sixtine ?"
    "Quel est le plus grand pays d'Amérique du Sud ?"
    "Quel est l'élément chimique dont le symbole est Na ?"
    "Quel est l'organe humain responsable de la digestion ?"
    "Quel est le nom de la plus grande île du monde ?"
    "Quel est le plus grand arbre du monde ?"
    "Dans quelle ville se trouve la Tour Eiffel ?"
    "Quel est le nom de la plus grande chaîne de montagnes du monde ?"
    "Quel est le plus grand animal marin ?"
    "Quel est le nom du philosophe qui a dit 'Je pense, donc je suis' ?"
    "Quel est l'océan qui borde la côte est de l'Amérique du Nord ?"
    "Quel est le plus grand stade de football du monde ?"
    "Quel est le plus grand désert chaud du monde ?"
    "Qui a écrit 'Don Quichotte' ?"
    "Quel est le nom de la plus grande cascade du monde ?"
    "Quel est l'élément chimique dont le symbole est C ?"
    "Dans quel pays se trouve le Taj Mahal ?"
    "Quel est le nom du premier président des États-Unis ?"
    "Quel est le plus grand lac d'Amérique du Nord ?"
    "Qui a découvert la loi de la gravitation universelle ?"
    "Quel est le nom de la planète la plus proche du Soleil ?"
    "Dans quelle ville se trouve le musée du Louvre ?"
)

# Tableau des réponses correspondantes
reponses=(
    "Paris"
    "Pacifique"
    "Victor Hugo"
    "Everest"
    "Japon"
    "1789"
    "Oxygène"
    "Leonardo da Vinci"
    "Sahara"
    "Christophe Colomb"
    "Nil"
    "7"
    "Guépard"
    "Thomas Edison"
    "Russie"
    "1969"
    "Mexique"
    "Pancréas"
    "Pérou"
    "Mark Zuckerberg"
    "Or"
    "Liberté, égalité, fraternité"
    "Kangourou"
    "George Orwell"
    "Lac Victoria"
    "Vincent van Gogh"
    "Cuivre"
    "Apollo 11"
    "1919"
    "Vatican"
    "Togo"
    "Edvard Munch"
    "Tim Berners-Lee"
    "Italie"
    "Pélican"
    "Asie"
    "Vache"
    "Mauna Loa"
    "Charles Baudelaire"
    "206"
    "Algérie"
    "Voie lactée"
    "Rein"
    "Shanghai"
    "Albert Einstein"
    "Pacifique"
    "San Diego Zoo"
    "Alexander Fleming"
    "Ottawa"
    "Marie Curie"
    "Fer"
    "1945"
    "Yuri Gagarin"
    "Indonésie"
    "Yangtsé"
    "Shakespeare"
    "Joe Biden"
    "Alexander Graham Bell"
    "Football"
    "Michel-Ange"
    "Brésil"
    "Sodium"
    "Estomac"
    "Groenland"
    "Séquoia"
    "Paris"
    "Himalayas"
    "Baleine bleue"
    "Descartes"
    "Atlantique"
    "Rungrado 1er mai"
    "Sahara"
    "Cervantès"
    "Salto Ángel"
    "Carbone"
    "Inde"
    "George Washington"
    "Lac Supérieur"
    "Isaac Newton"
    "Mercure"
    "Paris"
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
            echo "C'est correct!"
            score=$(($score+1))
            b=1
        else
            echo "Mauvaise réponse"
        fi
        i=$(($i+1))
    done
    if [ $b -eq 0 ]
    then        
        echo "La bonne réponse était $correct_answer."        
    fi
}

# Welcome message
echo "Bienvenu sur le jeu de culture générales!"
echo "On va vous poser $n question. Essayez de bien répondre!"
echo

# Loop through each question
j=0
while [ $j -lt $n ]
do
    echo "Votre score est  $score"
    r=$(($RANDOM % $M))
    ask_question "${questions[$r]}" "${reponses[$r]}"
    j=$(($j+1))
done

# Final score
echo "Votre score final est de $score parmi $n questions."
