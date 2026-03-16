<HTML>
  <HEAD>
    <TITLE> Editions Injections</TITLE>
  </HEAD>
 <BODY>
 <H1> Catalogue des éditions Injections </H1>

 <H3> Insertion de livre :</H3>

 <FORM name="insertion" method="POST" action="insertion.php">
   Login : <INPUT   name="login" > <BR/>
   Passwd : <INPUT   name="passwd" > <BR/>
   Titre : <INPUT   name="titre" > <BR/>
   Auteur : <INPUT   name="auteur" > <BR/>
   Annee : <INPUT   name="annee" > <BR/>
 <INPUT type="submit">
 </FORM>

 <BR/>
 <hr/>




 <?php
   $servername = "localhost";
   $username = "l2info";
   $password = "l2info";
   $dbname = "l2info";
   
   //echo $_POST['login'] . " " . $_POST['passwd'] . "<BR/>";

   if( isset($_POST['login'])  && isset($_POST['passwd']) )
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
       // on verifie login et passwd
       $sql='SELECT * FROM Users WHERE login =\'' . $_POST['login']. '\' and passwd = \''  . $_POST['passwd']. '\';';
       //echo 'Requete1 = '. $sql . '<BR/>';

       $result = $conn->query($sql);
       
       if ($result->num_rows > 0)
       {
          echo 'acces accordé <BR/>';
 
          $sql='INSERT INTO Livres(auteur,titre,annee) VALUES(\''. $_POST['auteur']. '\',\'' . $_POST['titre']. '\',\''   . $_POST['annee']. '\');';
 
          //echo 'Requete2 = '. $sql . '<BR/>';   
          $result = $conn->query($sql);
          
           if( $result )
             echo "insertion correcte <BR/>";
           else
             echo "insertion incorrecte <BR/>";
        }
       $conn->close();
      }
    }
 
   

?>



 </BODY>

</HTML>

