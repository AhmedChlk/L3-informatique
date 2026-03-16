<html> 
<body>

<H1> Petite gallerie d'images </H1>

<form method="post" action="page-image-protegee.php">
Choisir l'image à afficher (1,2 ou 3) : <input   name="numero"  > <BR/>
</form>

 <?php
if(  isset($_POST['numero'])  )
{
  $num=$_POST['numero'];
  $n=strlen($num);
  $num1="";
  for($i=0;$i<$n;$i++)
  {
   if( $num[$i]  == '>' )
    $num1=$num1."&gt;";
   elseif ( $num[$i]  == '<' )
 { 
    $num1=$num1."&lt;";
  }
else{
  $num1=$num1.$num[$i];
}
}

  echo "vous avez demandé l'image". $num1."<BR/>";
   echo  '<IMG src="image'. $num.'.jpg" align="center"/>';
}
?>
</body>
</html>
