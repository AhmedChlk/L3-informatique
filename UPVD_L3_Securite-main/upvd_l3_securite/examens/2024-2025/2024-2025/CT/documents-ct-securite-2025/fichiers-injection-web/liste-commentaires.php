<html>
<head>
<style>
body{
display:flex;
align-items: center;
justify-content:center;
}

main{
width: 600px;
display:flex;
flex-direction:column;
padding:30px;
}

.right{
width:600px;
display:flex;
justify-content:flex-end;
margin-top:5px;
}

.left{
width:540px;
display:flex;
justify-content:flex-start;
margin-top:5px;
}

.commentaire{
width:400px;
background-color:#f0f0f0;
border-radius:20px;
/*border-top-left-radius:0;*/
padding:20px;
margin-top:10px;
margin-bottom:10px;
}

/*
.commentaire-left{
width:400px;
margin-top:20px;
float:left;
left=0;
background-color:#f0f0f0;
border-radius:20px;
border-top-left-radius:0;
padding:20px;
clear:left;
}
*/
.bold{
    font-weight:bold;
}
</style>
</head>
<body>

<main>
<h1> Liste des commentaires </h1>
<div>
<form action="liste-commentaires.php" method="get">
<fieldset>
<p>
Login : <input type="text" name="user">
<input type="submit">
</p>
</fieldset>
</form>
</div>

<?php

 if( isset( $_GET['user'] ) )
 {

 $user = $_GET['user'];
 $serveur="localhost";
 $login="l2info";
 $mdp="l2info";
 $base="l2info";
 $connexion = mysqli_connect($serveur, $login, $mdp, $base);

 if( !$connexion)
 {
 die("erreur de connexion à la base de données");
  }

 // requete
 $req1="SELECT comment,date FROM Comments,Users WHERE Users.iduser=Comments.iduser AND Users.login='$user'";
 //echo $req1;
 // resultat
 $resultat =  mysqli_query($connexion,$req1);
 // affichage du résultat
 
 if( !$resultat )
 {
 die("Erreur de traitement de la requête");
 }
  echo mysqli_num_rows( $resultat ) . " commentaires trouvés pour $user <br > " ;
  $i=0;
 while ( $ligne = mysqli_fetch_array( $resultat ) )
 {
   if( $i % 2 == 0)
   {
    echo "<div class=\"left\">\n";
    }
    else
    {
      echo "<div class=\"right\">\n";
   }
   echo "<div class=\"commentaire\">\n";
   echo "<span class=\"bold\">" . $ligne['date'] . " : </span>" . $ligne['comment'];	
   echo "</div>\n";
   echo "</div>\n";
$i++;   
 }
}
?>

</main>
</body>
</html>
