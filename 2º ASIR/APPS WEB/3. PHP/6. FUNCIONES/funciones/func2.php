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
    if (isset ($_REQUEST["cad1"]) && isset($_REQUEST["cad2"])){

        $cad1=$_REQUEST['cad1'];
        $cad2=$_REQUEST['cad2'];
        $cont=substr_count($cad1,$cad2);

        echo "El resultado es $cont";
         
        

    }else{?> 

    <form action="func2.php" method="POST">
        Palabra1:<input type="text" name="cad1"><br><br>
        Palabra2: <input type="text" name="cad2"><br><br>
        <input type="submit" value="ENVIAR">    

    </form>
    <?php
    }
    ?>
</body>
</html>