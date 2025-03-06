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
    //print_r($_POST);
    if (!isset($_POST["opcion"]))
        die("No han llegado todos los campos requeridos");
    $opcion = $_POST["opcion"];
    switch ($opcion) {
        case 1:
            echo "<h2>Has elegido mostrar todos los equipos</h2>";
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

            try {
                $sql = "SELECT * FROM equipos";
                $result = mysqli_query($conn, $sql);

                // Comprobamos el número de líneas que ha devuelto la instrucción select
                if (mysqli_num_rows($result) > 0) {
                    // Extraemos la información de la fila
                    echo "<table>";
                    echo "<tr><td>nombre</td><td>partidos</td><td>puntos</td><td>ganados</td><td>perdidos</td></tr>";
                    while ($row = mysqli_fetch_assoc($result)) {
                        // $row es un array asociativo que contiene los datos de la línea que devuelve la select
                        //echo "codigo: " . $row["codigo"] . " - nombre: " . $row["nombre"] . " - curso: " . $row["curso"] . " - nota: " . $row["nota"] . "<br>";
                        echo "<tr><td>$row[nombre]</td><td>$row[partidos]</td><td>$row[puntos]</td><td>$row[partidos_ganados]</td><td>$row[partidos_perdidos]</td></tr>";
                    }
                    echo "</table>";
                }
                // Si la select no ha devuelto ninguna línea entramos en el else
                else {
                    echo "No existe ningún equipo";
                }
            } catch (Exception $e) {
                echo "Se ha producido un error al buscar los equipos";
                echo "Error: " . $sql . "<br>" . mysqli_error($conn);
            }

            mysqli_close($conn);

            break;
        case 2:
            echo "<h2>Has elegido mostrar partidos</h2>";
            ?>
            <form action="mostrar.php" method="POST">
                Nombre del equipo: <input type="text" name="equipo">
                <input type="submit" value="ANOTAR">
            </form>
    <?php
            break;
        case 3:
            echo "Has elegido dar de alta un partido";
    ?>
            <form action="modificar.php" method="POST">
                Equipo local <input type="text" name="local">
                Goles <input type="number" name="glocal">
                Equipo visitante <input type="text" name="visitante">
                Goles <input type="number" name="gvisitante">
                <input type="submit" value="ANOTAR">
            </form>
    <?php
            break;
        default:
            die("Opción incorrecta");
    }
    ?>
</body>

</html>