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
            $num=5;
            $resul=0;

            for($i=1;$i<=10;$i++){
                $resul=$num*$i;
                echo "<p>$num x $i = $resul</p>";
            }
        ?>
</body>
</html>