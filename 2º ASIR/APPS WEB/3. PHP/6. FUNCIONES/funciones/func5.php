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
    if (isset ($_REQUEST["num"])){

        $num=($_REQUEST['num']);
        $contador=$num;
        while ($contador>0){
            $raiz_cuadrada = sqrt($contador);
            if ($raiz_cuadrada == round ($raiz_cuadrada)){
                echo "<br> Numero perfecto : $contador <br>";
            }
            $contador=$contador-1;
        }


         
        

    }else{?> 

    <form action="func5.php" method="POST">
        Numero:<input type="number" name="num"><br><br>
        <input type="submit" value="ENVIAR">    

    </form>
    <?php
    }
    ?>
</body>
</html>