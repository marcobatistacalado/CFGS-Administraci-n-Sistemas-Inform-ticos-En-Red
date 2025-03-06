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
        $nota1=$_POST['nota1'];
        $nota2=$_POST['nota2'];
        $nota3=$_POST['nota3'];
        $media=($nota1+$nota2+$nota3)/3;
        echo "<p> La media es: $media</p>"
    ?>
</body>
</html>