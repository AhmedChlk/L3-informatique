<html> 

<body>
<form name="malveillant" method="POST" action="liste-taches-sql.php">
Entrez votre nom : <input   name="UserLogin"> <BR/>
Entrez votre mot de passe : <input   name="UserPW">
<input type="submit">
</form>



 <?php
$servername = "localhost";
$username = "l2info";
$password = "l2info";
$dbname = "l2info";

if( isset($_POST['UserLogin']) && isset($_POST['UserPW']) )
{


  // Create connection
  $conn = new mysqli($servername, $username, $password, $dbname);
  // Check connection
  if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
  }
  echo 'Liste des taches de ' . $_POST['UserLogin'] . ':<BR>';
  $sql = 'SELECT Users.login,Taches.date,Taches.tache FROM Users INNER JOIN Taches ON Users.id=Taches.id WHERE login="' . $_POST['UserLogin']  . '"AND  password="' . $_POST['UserPW']  . '";'    ;
 // echo "requete =" . $sql . "<BR>";
  $result = $conn->query($sql);

  if ($result->num_rows > 0) {
  // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "Login: " . $row["login"]. ", Date : " . $row["date"]. ", Tache :" .   $row["tache"]."<br>";
     }
  }
 else {
  echo "0 results";
  }
}
$conn->close();
?>

 </body>
</html>

