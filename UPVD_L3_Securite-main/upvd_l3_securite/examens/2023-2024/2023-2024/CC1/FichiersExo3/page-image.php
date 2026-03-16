<html> 
<body>

<H1> Petite gallerie d'images </H1>

<form method="post" action="page-image.php">
Choisir l'image à afficher (1,2 ou 3) : <input   name="numero"  > <BR/>
</form>

 <?php
if(  isset($_POST['numero'])  )
{
  $num=$_POST['numero'];
  echo "vous avez demandé l'image". $num."<BR/>";
   echo  '<IMG src="image'. $num.'.jpg" align="center"/>';
}
?>
</body>
</html>
