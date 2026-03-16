<html>
<body>
<?php

//print 'my name is "victor" ';
if( isset($_GET['UserInput'])){
$out = 'vous avez saisi: '. $_GET['UserInput'] . '.';
}
else
{
$out = '<form method="GET"> Saississez quelque chose ici :';
$out .= '<input name="UserInput" size="50">';
$out .= '<input type="submit">';
$out .= '</form>';
}
print $out;
?>
</body>
</html>