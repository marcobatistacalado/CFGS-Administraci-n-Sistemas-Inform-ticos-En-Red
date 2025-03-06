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
    $segundos=3669;
    // El resto de dividir los segundos totales entre 60 son los segundos sobrantes
    $restoseg=$segundos%60;
    // Agrupamos los segundos en grupos de 60 para obtener los minutos.
    $minutos=(int)($segundos/60);
    // El resto de dividir los minutos entre 60 son los minutos sobrantes.
    $restomin=$minutos%60;
    // Agrupamos los minutos en grupos de 60 para obtener las horas
    $horas=(int)($minutos/60);
    echo "<p>Son las $horas:$restomin:$restoseg</p>";
    
    ?>
</body>
</html>