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
    $numero=$_REQUEST["num"];

    if ($numero>7 || $numero<1){
        echo "mal";
    }
    else{
        $dia="";
        switch ($numero) {
            case 1:
                $dia="Lunes";
                break;
            case 2:
                $dia="Martes";
                break;
            case 3:
                $dia="Miercoles";
                break;
            case 4:
                $dia="Jueves";
                break;
            case 5:
                $dia="Viernes";
                break;
            case 6:
                $dia="Sabado";
                break;
            case 7:
                $dia="Domingo";
                break;
        }
        echo "EL dia de la semana es: $dia";
    }
?>
</body>
</html>