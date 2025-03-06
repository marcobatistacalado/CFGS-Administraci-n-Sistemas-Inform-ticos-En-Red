<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <!-- probarlo poniendo en la url http://localhost/program/seguridad/seguridad1.php/%22%3E%3Cscript%3Ealert('hacked')%3C/script%3E -->
<form method="post" action="<?php echo ($_SERVER["PHP_SELF"]);?>">
Código<input type="text">
<input type="submit" value="enviar">
</body>
</html>