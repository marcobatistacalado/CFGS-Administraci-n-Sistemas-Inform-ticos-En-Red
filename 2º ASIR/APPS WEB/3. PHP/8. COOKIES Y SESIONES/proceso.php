<?php
if ($_REQUEST['opcion'] == "recordar") {
  setcookie("mail", $_REQUEST['mailusuario'], time() + (60 * 60 * 24 * 365), "/");
  echo 'cookie creada';
} else if ($_REQUEST['opcion'] == "norecordar") {
  setcookie("mail", "", time() - 100, "/");
  echo 'cookie borrada';
}
?>
<html>
<head>
<title>Problema</title>
</head>
<body>

<br>
<a href="index.php">Ir a la otra p�gina</a>
</body>
</html>
 
