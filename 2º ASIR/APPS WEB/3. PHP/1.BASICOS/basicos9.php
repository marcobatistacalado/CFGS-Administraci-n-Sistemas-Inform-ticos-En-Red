<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <?php
    $nombre =$_POST['nombre'];
    $cantidadtotal = 30;
    $cantidadbien =$_POST['bien'];
    $porcentaje = ($cantidadbien * 100) / 30;

    if ($porcentaje >= 90) {
        echo "<p>Nivel Superior</p>";
    }

    if ($porcentaje >= 75 && $porcentaje < 90) {
        echo "<p>Nivel Medio</p>";
    }

    if ($porcentaje >= 50 && $porcentaje < 75) {
        echo "<p>Nivel Regular</p>";
    }

    if ($porcentaje < 50) {
        echo "<p>Fuera de Nivel</p>";
    }

    ?>
</body>

</html>