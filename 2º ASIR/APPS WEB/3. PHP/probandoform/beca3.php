<html>
<body>
<?php
if (isset($_POST['beca'])){
	
		$valor=$_POST['beca'];
		if ($valor=="si")
			echo "Enhorabuena!!";
		else
			echo "Lo sentimos...";
	}
	
else
	echo "Estas intentando entrar por la puerta de atr&aacute;s";
?>
</body>
</html>