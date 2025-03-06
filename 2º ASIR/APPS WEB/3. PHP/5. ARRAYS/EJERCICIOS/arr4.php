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
    print_r($_REQUEST);
    
    $array1=[11,22,33,44,55,66,77,88,99,10];

    for ($i=0;$i<count($array1);$i++){
        if ($array1[$i]%2==0){
            echo "   El numero es par,   ";
        }else {
            echo "   El numero es impar,   ";
        }
        echo "posicion= $i numero= ".$array1[$i]."<br>";
    }
    ?>
</body>
</html>