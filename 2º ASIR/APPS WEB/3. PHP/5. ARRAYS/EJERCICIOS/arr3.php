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
    if (isset($_REQUEST["nombre"])){
        $nombre=$_REQUEST['nombre'];
        if ($nombre == ""){
            die ("<h1>Anota tu nombre</h1>"); //muestra el mensaje y no va para abajo
        }
        if (!isset($_REQUEST["afic"])){
            echo "<h1>"."$nombre eres un soso "."</h1>";
        }else{
            $afic=$_REQUEST["afic"];
            if (count($_REQUEST["afic"])==1){
                echo "<h1>"."$nombre deberías buscar más aficiones aparte de ".$afic[0]."</h1>";
            }else{
                if (count($_REQUEST["afic"])==5){
                    echo "<h1>"."$nombre creo que tienes demasiadas aficciones";
                }else{
                    $cuantos=0;
                    echo "<ul>";
                    while ($cuantos < count($_REQUEST["afic"])) {
                        echo "<li>".$afic[$cuantos]."</li>";
                        $cuantos=$cuantos+1;
                    }//podemos hacer esto con un foreach --- foreach ($afic as $num=>$na){ echo "<p> $afic </p>"}
                    echo "</ul>";
                }
            }
        }

    }else{?> 

    <form action="arr3.php" method="POST">
        Nombre:<input type="text" name="nombre"><br/><br/>
        <input type="checkbox" name="afic[]" value="autos"> Autos<br/><br/><!-- poner mismo name para crear un array[] !-->
        <input type="checkbox" name="afic[]" value="deporte"> Deportes<br/><br/>
        <input type="checkbox" name="afic[]" value="videojuegos"> Videojuegos<br/><br/>
        <input type="checkbox" name="afic[]" value="natacion"> Natación<br/><br/>
        <input type="checkbox" name="afic[]" value="airsoft"> Airsoft<br/><br/>
        <input type="submit" value="ENVIAR">    

    </form>
    <?php
    }
    ?>
</body>
</html>