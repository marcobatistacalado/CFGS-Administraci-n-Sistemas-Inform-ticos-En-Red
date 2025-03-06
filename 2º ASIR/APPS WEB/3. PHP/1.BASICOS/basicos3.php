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
        $importe=$_POST['importe'];
        $porcentaje=$_POST['porcentaje'];
        $descuento=$importe-(($importe*$porcentaje)/100);
        echo "<p>Importe: $importe</p>";
        echo "<p>Porcentaje: $porcentaje</p>";
        echo "<p>Descuento: $descuento</p>";
    ?>
</body>
</html>