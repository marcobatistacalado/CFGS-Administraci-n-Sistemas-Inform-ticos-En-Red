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
    if (isset($_REQUEST["num"]) && isset($_REQUEST["esp"])) {
        $precio=9;
        $diaespectador=$_REQUEST["esp"];
        if ($diaespectador=="si"){
            $precio=5;
        }

        if (isset($_REQUEST["fam"])){
            $precio=$precio-($precio * 0.2);
        }
        $numero=$_REQUEST["num"];
        $precio=$precio * $numero;
        echo "<h1>EL precio es: $precio</h1>";
    }else{
        echo "TIENES QUE RELLENAR BIEN EL FORMULARIO";
    }
    ?>
</body>
</html>