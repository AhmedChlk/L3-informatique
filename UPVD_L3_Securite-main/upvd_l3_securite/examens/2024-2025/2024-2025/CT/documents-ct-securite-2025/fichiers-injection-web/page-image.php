<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Galerie d'Images </title>
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
            margin-top: 10px;
        }
        .comment {
            padding: 8px;
            background-color: #f9f9f9;
            border-radius: 6px;
            margin-bottom: 5px;
            font-size: 14px;
        }
        .comment .user-name {
            font-weight: bold;
            color: #333;
        }
        .comment .comment-text {
	    margin: 0px;
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
            width: 95%;
        }
	.add-comment input{
	    border-radius: 6px;
	    border: 1px solid #ddd;
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
	.alerte {
	    color: red;	    
	    background-color: lightgrey;	    
	    width: 300px;
	    border: 3px solid black;	    	    
	    border-radius:25px;	    
	    position:absolute;	    
	    left:300px;	    
	    top:200px;	   	   
	    padding:20px;	    
	}

    </style>
</head>
<body>

<div class="container">
    <h1>Galerie d'Images</h1>
    <div class="image-container">


<?php

 if( !isset( $_GET['user'] ) )
 {
 die("Utilisateur inexistant");
 }

$user = $_GET['user'];
 $serveur="localhost";
 $login="l2info";
 $mdp="l2info";
 $base="l2info";
 //echo "$login $mdp $serveur $base <br>";

$connexion = mysqli_connect($serveur, $login, $mdp, $base);
 if( !$connexion)
 {
 die("erreur de connexion à la base de données");
  }

 
// ajout de commentaire
if( isset( $_GET['login'] ) && isset( $_GET['comment']) && isset( $_GET['idimg'] ) )
{
 $login=$_GET['login'];
 $idimg=$_GET['idimg'];
$comment=$_GET['comment'];

 //echo "$login,$idimg,$user".$_GET['comment']."<br>";

 // on cherche l'identifiant de login
$req1="SELECT * FROM Users WHERE Users.login='$login'";
//echo "$req1<br>";
 $result1 =  mysqli_query($connexion,$req1);


if( $result1 &&  mysqli_num_rows( $result1 ) > 0 )
 {
   $ligne=mysqli_fetch_array( $result1 );
$iduser=$ligne['iduser'];
$dt=date("Y-m-d");
   //echo "$iduser <br>";
   $req2="INSERT INTO  Comments(comment,date,idimg,iduser) VALUE(\" $comment\",\"$dt\",$idimg,$iduser)";
//   echo "$req2 <br>";
  $result2 =  mysqli_query($connexion,$req2);
}

}

// affichage des images et commentaires
 // requete pour avoir la liste des images de l'utilisateur
 $requete="SELECT * FROM Images,Users WHERE Users.login='$user' AND Images.iduser=Users.iduser;";
 // echo $requete . "<br>";
 
 $resultat =  mysqli_query($connexion,$requete);

 if( !$resultat )
 {
 die("Erreur de traitement de la requête");
 }
// echo mysqli_num_rows( $resultat ) . " images trouvées <br > " ;

// un boucle sur les images, qu'il faut mettre dans un tableau.
$i=1;
while ( $ligne = mysqli_fetch_array( $resultat ) )
{
  $fichier=$ligne['fichier'];
  $idimg=$ligne['idimg'];
  echo "<!-- Image $i -->\n";
  echo "<div class=\"image-item\">\n";
  echo "<img src=\"http://localhost/web/$fichier\" alt=\"image$i\"> \n";
	



  // requete de recherche de commentairer pour l'image
  $requete1="SELECT * FROM Users,Comments WHERE Users.iduser=Comments.iduser AND Comments.idimg=$idimg";
//echo "$requete1<br>";


  $resultat1 =  mysqli_query($connexion,$requete1);
  echo mysqli_num_rows( $resultat ) . " commentaires trouvés <br > " ;

  while ( $ligne1 = mysqli_fetch_array( $resultat1 ) )
{
	
    $login_comment=$ligne1['login'];
    $comment=$ligne1['comment'];
    //echo "$login_comment,$comment <br>";
    	
    // pour chaque image une nouvelle requete 
    echo "<div class=\"comment\">\n";
    echo "<p class=\"comment-text\"> <span class=\"user-name\">$login_comment</span> $comment </p>\n";
    echo "</div>\n";      

  }
  echo "<!-- Ajouter un commentaire -->\n";
  echo "<div class=\"add-comment\">\n";
  echo "<form action=\"http://localhost/web/page-image.php\">\n";
  echo "<input type=\"hidden\" name=\"idimg\" value=\"$idimg\"> \n";  
  echo "<input type=\"hidden\" name=\"user\" value=\"$user\"> \n";  
  echo "<input type=\"text\" name=\"login\" placeholder=\"Login\"> \n";
  echo "<textarea rows=\"2\" placeholder=\"Laissez un commentaire...\" name=\"comment\"></textarea>\n";
  echo "<button>Ajouter Commentaire</button>\n";
  echo "</form> </div>\n";
  echo "</div>\n";
  $i=$i+1;
} 
?>

        </div>
    </div>
</body>
</html>
