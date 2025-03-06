<html>
<body>
<?php
if (isset($_GET['numero'])){
	$dato=$_GET['numero'];
	if ($dato=="")
		echo "Dato vacio";
	else{
		$doble=$dato*2;
		echo "El doble de $dato es:$doble";
		}
	}
else
	echo "Estas intentando entrar por la puerta de atrás";
?>
</body>
</html>