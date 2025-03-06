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
        //PRIMERA OPCION LA MEJOR
        //ya sabe que dia es hoy asi que le sumas lo que necesitas
        $proxima_recarga = strtotime("+90 days");
        //construir la fecha
        echo "<p>".date('d/m/y', $proxima_recarga)."</p>";
        
        //crear la fecha hoy
        $fechahoy=date("d-m-Y");
        echo $fechahoy;
        //crear otra vez la fecha pero con  la suma
        echo "<p>".date("d-m-Y",strtotime($fechahoy."+90 days"))."</p>";

        https://www.php.net/manual/en/function.strtotime.php
        
    ?>
</body>

</html>