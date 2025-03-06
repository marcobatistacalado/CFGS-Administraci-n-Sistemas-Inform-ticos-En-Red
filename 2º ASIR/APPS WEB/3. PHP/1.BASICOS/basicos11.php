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
        $precio=70;
        $descuento=0;
        if($precio<6){
            echo "<p>Precio Inicial: $precio - Precio Final: $precio</p>";
        }elseif($precio>=6 && $precio<60){
            $descuento=$precio-($precio*0.05);
            echo "<p>Precio Inicial: $precio - Precio Final: $descuento</p>";
        }elseif($precio>=60){
            $descuento=$precio-($precio*0.1);
            echo "<p>Precio Inicial: $precio - Precio Final: $descuento</p>";
        }
    ?>
</body>
</html>