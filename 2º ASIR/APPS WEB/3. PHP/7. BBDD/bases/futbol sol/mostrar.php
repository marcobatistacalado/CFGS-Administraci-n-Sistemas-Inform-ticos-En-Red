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

    print_r($_POST);

    if (!isset($_POST['equipo']) )
        die("No has entrado desde el formulario correcto");

    $equipo = test_input($_POST['equipo']);
    
    if ($equipo == "" )
        die("El dato ha llegado vacío");

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
        $sql = "SELECT * FROM partidos WHERE equipo_local='$equipo' OR equipo_visitante='$equipo'";
        $result = mysqli_query($conn, $sql);

        // Comprobamos ell número de líneas que ha devuelto la instrucción select
        if (mysqli_num_rows($result) > 0) {
         
            echo "<ul>";
            while ($row = mysqli_fetch_assoc($result)) {
                // $row es un array asociativo que contiene los datos de la línea que devuelve la select
                //echo "codigo: " . $row["codigo"] . " - nombre: " . $row["nombre"] . " - curso: " . $row["curso"] . " - nota: " . $row["nota"] . "<br>";
                echo "<li>numero: $row[numero] - equipo local: $row[equipo_local] - goles: $row[goles_local] - equipo visitante: $row[equipo_visitante] - goles: $row[goles_visitante]</li>";
            }
            echo "</ul>";
        }
        // Si la select no ha devuelto ninguna línea entramos en el else
        else {
            echo "No hay ningún partido del equipo:".$equipo;
           
        }
    } catch (Exception $e) {
        echo "Se ha producido un error al buscar el equipo";
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }

   
    mysqli_close($conn);
    ?>
</body>

</html>