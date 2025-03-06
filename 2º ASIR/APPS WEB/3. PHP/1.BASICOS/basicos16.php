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
        $num=0;
        $contador=0;

        for ($i=0;$i<20;$i++){
            $contador++;
            $num=$num+$contador;
        }

        echo "<p>$num</p>"
    ?>
</body>
</html>