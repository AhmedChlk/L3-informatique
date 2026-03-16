<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Galerie d'Images et Commentaires</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .image-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-bottom: 30px;
        }
        .image-item {
            width: 30%;
            margin-bottom: 20px;
            border-radius: 10px;
            overflow: hidden;
        }
        .image-item img {
            width: 100%;
            height: auto;
            display: block;
        }
        .comments-section {
            margin-top: 20px;
        }
        .comment {
            padding: 8px;
            background-color: #f9f9f9;
            border-radius: 6px;
            margin-bottom: 10px;
            font-size: 14px;
        }
        .comment .user-name {
            font-weight: bold;
            color: #333;
        }
        .comment .comment-text {
            margin-top: 5px;
            color: #555;
        }
        .add-comment {
            display: flex;
            flex-direction: column;
            margin-top: 15px;
        }
        .add-comment textarea {
            padding: 8px;
            font-size: 14px;
            resize: none;
            margin-bottom: 10px;
            border-radius: 6px;
            border: 1px solid #ddd;
            width: 100%;
        }
        .add-comment button {
            padding: 8px 15px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        .add-comment button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Galerie d'Images et Commentaires</h1>
    <div class="image-container">


<?php

 if( !isset( $_GET['login'] )
 {
 die("Utilisateur inexistant");
 }
 $user = $_GET['login'];
 $serveur="localhost";
 $login="l2info";
 $mdp="l2info";
 $base="l2info";
 //echo "$login $mdp $serveur $base";


 $connexion = mysqli_connect($serveur, $login, $mdp, $base);
 if( !$connexion)
 {
 die("erreur de connexion à la base de données");
 }

 $requete="SELECT * FROM Image,Users WHERE Users.login=$user AND Image.iduser=Users.iduser;";

 
 $resultat =  mysqli_query($connexion,$requete);

 if( !$resultat )
 {
 die("Erreur de traitement de la requête");
 }
 echo mysqli_num_rows( $resultat ) . " films trouvés <br > " ;


while ( $ligne = mysqli_fetch_array( $resultat ) )
{
   $image=$ligne['img'];
   $requete1="SELECT * FROM Image,Users WHERE Users.login=$user AND Image.iduser=Users.iduser;";

   $resultat1 =  mysqli_query($connexion,$requete);

   while ( $ligne1 = mysqli_fetch_array( $resultat ) )
    { 

	// requete pour avoir la liste des images de l'utilisateur
	// un boucle sur les images, qu'il faut mettre dans un tableau. 
	echo "<!-- Image $i -->";
        echo "<div class=\"image-item\">";
        echo "<img src=\"$lien\" alt=\"image$i\"> ";

        // pour chaque image une nouvelle requete 
	echo "<div class=\"comment\">"
        echo "<p class=\"comment-text\"> <span class=\"user-name\">$login</span> Superbe photo ! J'adore la lumière.</p>"
        echo "</div>";

        echo "</div>"
    }
} 
?>

        </div>
    </div>
</div>

</body>
</html>
