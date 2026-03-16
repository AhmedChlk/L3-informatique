 <?php
$servername = "db";
$username = "l2info";
$password = "l2info";
$dbname = "l2info";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


if( isset($_POST['quantite']) && isset($_POST['prix']) )
{
   //echo "coucou2\n";
    $sql = 'INSERT INTO Achat(prix,quantite) VALUES("' . $_POST['prix']. '","' . $_POST['quantite'].'");';
    
    //echo "requete =" . $sql . "<BR>";
   $mess="insertion de quantite=" .   $_POST['quantite'] . " et prix=" . $_POST['prix'] . "<BR/>";
   echo $mess;
   $result0 = $conn->query($sql);
    
   // echo "number of line inserted : " . $result0->num_rows;
}
 else {
  echo "Aucune champs quantite ou prix manquant.";
}
$conn->close();
?>