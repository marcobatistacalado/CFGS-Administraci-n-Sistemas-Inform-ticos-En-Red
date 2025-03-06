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
    $num=45;
    echo "Números menores de $num no diviibles entre 3:<br>";
    while($num>0){
        // Si el resto de dividir un número entre tres no es cero, es que el número no es divisible por 3
        if ($num%3!=0)
            echo $num.'<br>';
        $num--;
    }
    ?>
</body>
</html>