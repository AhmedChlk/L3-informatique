<HTML>

  <HEAD>
    <TITLE> Catalogue des éditions Injections</TITLE>
  </HEAD>
  
 <BODY>
 <H1> Catalogue des éditions Injections </H1>

 <H3> Recherche de livre :</H3>

 <FORM name="recherche" method="POST" action="recherche.php">
 Mot clef de la recherche : <INPUT   name="keyword" > <BR/>
 <INPUT type="submit">
 </FORM>

 <BR/>
 <hr/>

 <?php
   $servername = "localhost";
   $username = "l2info";
   $password = "l2info";
   $dbname = "l2info";
     
   if( isset($_POST['keyword']) )
   {
   // Create connection
   $conn = new mysqli($servername, $username, $password, $dbname);

   // Check connection
   if ($conn->connect_error)
   { 
      die("Connection failed: " . $conn->connect_error);
    }
    else
    {
    echo "<H3> Résultat recherche pour keyword=" . $_POST['keyword']. ":</H3> ";
    
       $sql = 'SELECT  titre FROM Livres WHERE titre LIKE \'%'.$_POST['keyword'].'%\' ORDER BY id  DESC LIMIT 20 ;';
      // echo "requete =" . $sql . "<BR>";
       $result = $conn->query($sql);

       if ($result->num_rows > 0)
       {
          // output data of each row
          echo "<ul>";
          while($row = $result->fetch_assoc()) {
            echo "<li>";
            echo "<i>" . $row["titre"]. "</i> <br>";
            echo "</li>";
          }
          echo "</ul>";
       }
       else
       {
          echo "Aucune entrée de la base ne correspond.";
       }      
 $conn->close();
 echo "<BR/><HR/><BR/>";
}
  }
?>
 
 </BODY>

</HTML>

