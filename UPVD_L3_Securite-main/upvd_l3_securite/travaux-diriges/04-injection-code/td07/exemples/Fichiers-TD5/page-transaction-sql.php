<html> 
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
echo 'Nom rentré :"' . $_POST['UserInput'].'"<BR/>';
$sql = 'SELECT montant FROM Transaction WHERE nom="' . $_POST['UserInput']  . '";';
echo "Requete SQL=" . $sql . "<BR/>";
$result = $conn->query($sql);
echo "Résultat:<BR/>";
if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
      echo"Nom: ". $_POST['UserInput']." Montant :" .   $row["montant"]."<br/>";
    }
}
 else {
  echo "0 results";
}
$conn->close();
?>
 
</html>

