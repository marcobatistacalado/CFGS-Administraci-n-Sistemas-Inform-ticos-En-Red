<html>
<head>
<title>Problema</title>
</head>
<body>
<form action="proceso.php" method="post">
Introduce su mail:
<input type="text" name="mailusuario" value="<?php if (isset($_COOKIE['mail'])) echo $_COOKIE['mail'];?>">
<br>
<input type="radio" name="opcion" value="recordar">
Recordar el mail introducido.
<br>
<input type="radio" name="opcion" value="norecordar">
No recordar.
<br>
<input type="submit" value="confirmar">
</form>
</body>
</html>
