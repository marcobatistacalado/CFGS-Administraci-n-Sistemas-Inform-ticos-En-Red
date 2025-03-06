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
    if (isset ($_REQUEST["coche"]) && isset($_REQUEST["ano"]) && isset($_REQUEST["edad"])){

        $coche=$_REQUEST["coche"];
        $añocompra=$_REQUEST["ano"];
        $edad=$_REQUEST["edad"];

        if ($añocompra == "" || $edad =="")
            die ("No has anotado todos los datos");

        //lo calcularemos bien cuando trabajemos con fechas
        if ($añocompra < 2000){
            die ("El año de compra tiene que ser superior o igual a 2000");
        
        if ($edad <18 || $edad >70)
            die ("La edad tiene quee star comprendida entre 18 y 70 años");
        }

        if ($coche == "Seat Ibiza")
            $precio = 500;
        else 
               
        if ($coche == "Opel Astra")
            $precio = 700;
        else
			if ($coche = "Mondeo")
            $precio = 800;

        $ant= 2022-$añocompra;
        if ($ant >=4 && $ant <=8){
            $precio = $precio * 1.4;
        }
        if ($edad <25 || $edad >60){
            $precio =$precio +50;
        }
        echo "<table><tr><td>Modelo:$coche</td><td>Año de compra:$añocompra</td><td>Edad:$edad</td><td>Precio=$precio euros</td></tr></table>";


    }else{ ?> 

    <form action="form4.php" method="POST">
        MODELO:
        <input type="radio" name="coche" value="Seat Ibiza">Seat Ibiza
        <input type="radio" name="coche" value="Opel Astra">Opel Astra
        <input type="radio" name="coche" value="Mondeo">Mondeo<br><br>
        AÑO:<input type="text" name="ano"><br><br>
        EDAD: <input type="text" name="edad"><br><br>
        <input type="submit" value="ENVIAR">    

    </form>
    <?php
    }
    ?>
</body>
</html>