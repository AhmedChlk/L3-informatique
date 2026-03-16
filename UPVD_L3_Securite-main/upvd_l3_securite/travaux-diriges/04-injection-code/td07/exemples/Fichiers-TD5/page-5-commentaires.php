<html> 
<H1> Computer Security  </H1>
<IMG src="img_security.jpeg">  Computer security, cybersecurity, or information technology security (IT security) is the
 protection of computer systems and networks from information disclosure, 
theft of or damage to their hardware, software, or electronic data, 
as well as from the disruption or misdirection of the services they provide.
The field is becoming increasingly significant due to the continuously expanding reliance 
on computer systems, the Internet[2] and wireless network standards such as Bluetooth 
and Wi-Fi, and due to the growth of "smart" devices, including smartphones, televisions, 
and the various devices that constitute the Internet of things (IoT). 
Cybersecurity is also one of the significant challenges in the contemporary world, due to
 its complexity, both in terms of political usage and technology.
 Its primary goal is to ensure the system's dependability, integrity, and data privacy.

<BR/>
<hr/>
<h3> Visitors comments :</h3>
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



if( isset($_POST['login']) && isset($_POST['commentaire']) )
{
    $sql = 'INSERT INTO Commentaires(login,commentaire) VALUES("' . $_POST['login']. '","' . $_POST['commentaire'].'");';
    //echo "requete =" . $sql . "<BR>";
    $result0 = $conn->query($sql);
   // echo "number of line inserted : " . $result0->num_rows;
}


$sql = 'SELECT id,login, commentaire FROM Commentaires ORDER BY id  DESC LIMIT 4 ;';
//echo "requete =" . $sql . "<BR>";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
    echo "<ul>";
  while($row = $result->fetch_assoc()) {
      echo "<li>";
      echo "[" . $row["login"]. "]: " . $row["commentaire"]."<br>";
      echo "</li>";
    }
     echo "</ul>";
}
 else {
  echo "Aucun utilisateur n'a laissé de commentaire.";
}
$conn->close();
?>
 
<BR/>
<hr/>
<BR/>

<form name="postcomment" method="POST" action="page-5-commentaires.php">
Provide your pseudo : <input   name="login" > <BR/>
Provide your comment : <input  type="text"  name="commentaire" ><BR/>
<input type="submit">

</form>



</html>

