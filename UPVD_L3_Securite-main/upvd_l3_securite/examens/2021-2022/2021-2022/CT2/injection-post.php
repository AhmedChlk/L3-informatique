<html>

<body>
<?php
if( isset($_POST['UserInput'])){
$out ='vous avez saisi: "' . $_POST['UserInput'] . '".';
}
else{
$out = '<form method="POST"> saisissez quelque chose ici :';
$out .= '<input name="UserInput" size="50">';
$out .=  '<input type="submit">';
$out .='<form>';
}
print $out;
?>
</body>

</html>