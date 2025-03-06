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
    
    $array1=[11,22,33,44];
    $array2=[66,77,88,99];

    $suma=0;
    for ($i=0;$i<count($array1);$i++){
        for ($a=0;$a<count($array2);$a++){
            $suma=$array1[$i]+$array2[$a];
            echo "la suma del numero   ".$array1[$i]."  y el numero   ".$array2[$a]."  es -->".$suma."<br><br>";
        }
    }

    ?>
</body>
</html>