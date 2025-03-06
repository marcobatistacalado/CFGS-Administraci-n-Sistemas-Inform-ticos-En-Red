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
    
    $array1=[11,22,33,44,55];

    $suma=0;
    for ($i=0;$i<count($array1);$i++){
        $suma=$suma+$array1[$i];
    }
    echo "LA SUMA ES: $suma"
    ?>
</body>
</html>