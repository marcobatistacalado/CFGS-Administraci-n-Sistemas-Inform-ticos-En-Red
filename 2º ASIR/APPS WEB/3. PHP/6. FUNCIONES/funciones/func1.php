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
    if (isset ($_REQUEST["nom"]) && isset($_REQUEST["ap"])){

        $nombre=trim($_REQUEST['nom']);
        $apellido=trim($_REQUEST['ap']);
        $codigo=substr($nombre,0,2).substr($apellido,-2);
        echo $codigo;
          
         
        

    }else{?> 

    <form action="func1.php" method="POST">
        Nombre:<input type="text" name="nom"><br><br>
        Apellido: <input type="text" name="ap"><br><br>
        <input type="submit" value="ENVIAR">    

    </form>
    <?php
    }
    ?>
</body>
</html>