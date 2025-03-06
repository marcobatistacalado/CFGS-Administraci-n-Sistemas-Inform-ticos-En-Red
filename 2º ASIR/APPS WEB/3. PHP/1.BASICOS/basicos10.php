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
    $sueldo=1000;
    $antiguedad=5;
    $aumento=0;
    if ($sueldo>500 && $antiguedad>=10)
       $aumento=0.2;
    if ($sueldo>500 && $antiguedad<10)
       $aumento=0.1;

    $sueldo=$sueldo+$sueldo*$aumento;
    echo "<h1>El sueldo final es de $sueldo euros</h1>"
    ?>
</body>
</html>