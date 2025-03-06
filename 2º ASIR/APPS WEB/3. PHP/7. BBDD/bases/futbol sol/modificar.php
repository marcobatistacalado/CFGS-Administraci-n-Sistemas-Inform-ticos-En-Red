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

    function test_input($data)
    {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    //print_r($_POST);

    if (!isset($_POST['local']) || !isset($_POST['glocal']) || !isset($_POST['visitante']) || !isset($_POST['gvisitante']))
        die("No has entrado por el formulario correcto");

    $local = test_input($_POST['local']);
    $glocal = test_input($_POST['glocal']);
    $visitante = test_input($_POST['visitante']);
    $gvisitante = test_input($_POST['gvisitante']);


    if ($local == "" || $glocal == "" || $visitante == "" || $gvisitante == "")
        die("Algún dato ha llegado vacío");

    $servername = "localhost";
    $username = "otro";
    $password = "";
    $dbname = "futbol";

    // Create connection
    $conn = mysqli_connect($servername, $username, $password, $dbname);
    // Check connection
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    // Busco el equipo local en la bbdd

    try {
        $sql = "SELECT nombre FROM equipos WHERE nombre='$local'";
        $result = mysqli_query($conn, $sql);
       

        // Comprobamos ell número de líneas que ha devuelto la instrucción select
        if (mysqli_num_rows($result) > 0) {
            echo "Equipò local correcto";
            $puntos=0;
            $ganados=0;
            $perdidos=0;
            if ($glocal>$gvisitante){
                $puntos=3;
                $ganados++;
            }
            else if ($glocal==$gvisitante)
                $puntos=1;
            else    
                $perdidos++;
            // Modificamos los puntos y los goles del primer equipo
            $sql = "UPDATE equipos set partidos=partidos+1,puntos=puntos+$puntos, partidos_ganados=partidos_ganados+$ganados, partidos_perdidos=partidos_perdidos+$perdidos where nombre='$local' ";
            mysqli_query($conn, $sql);
        }
        // Si la select no ha devuelto ninguna línea entramos en el else
        else {
            die("No existe ningún equipo con ese nombre");
        }
    } catch (Exception $e) {
        echo "Se ha producido un error al buscar el equipo";
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }

     //Busco equipo visitante

     try {
        $sql = "SELECT nombre FROM equipos WHERE nombre='$visitante'";
        $result = mysqli_query($conn, $sql);

        // Comprobamos ell número de líneas que ha devuelto la instrucción select
        if (mysqli_num_rows($result) > 0) {
            echo "Equipò local correcto";
            $puntos=0;
            $ganados=0;
            $perdidos=0;
            if ($visitante>$glocal){
                $puntos=3;
                $ganados++;
            }
            else if ($glocal==$gvisitante)
                $puntos=1;
            else    
                $perdidos++;
            // Modificamos los puntos y los goles del primer equipo
            $sql = "UPDATE equipos set partidos=partidos+1,puntos=puntos+$puntos, partidos_ganados=partidos_ganados+$ganados, partidos_perdidos=partidos_perdidos+$perdidos where nombre='$visitante' ";
            mysqli_query($conn, $sql);
        }
        // Si la select no ha devuelto ninguna línea entramos en el else
        else {
            die("No existe ningún equipo con ese nombre");
        }
    } catch (Exception $e) {
        echo "Se ha producido un error al buscar el equipo";
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }



    // Escribimos la instrución sql a ejecutar, observa que se ponen entre comillas los datos que son String
    $sql = "INSERT INTO partidos (numero, equipo_local, equipo_visitante, goles_local, goles_visitante)
VALUES (0,'$local','$visitante',$glocal,$gvisitante)";
    try {
        if (mysqli_query($conn, $sql)) {
            echo "New record created successfully";
        }
    } catch (Exception $e) {
        echo "Se ha producido un error al insertar partido";
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }

    mysqli_close($conn);
    ?>
</body>

</html>