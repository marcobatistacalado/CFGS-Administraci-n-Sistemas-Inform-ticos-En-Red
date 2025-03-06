<html>

<head>
  <title>Muestra todos los alumnos</title>
</head>

<body>

  <?php
  $servername = "localhost";
  $username = "nuevo";
  $password = "a1234567";
  $dbname = "colegio";

  // Create connection
  $conn = mysqli_connect($servername, $username, $password, $dbname);
  // Check connection
  if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
  }

  try {
    $sql = "SELECT codigo, nombre, curso, nota FROM alumnos WHERE nota>=5";
    $result = mysqli_query($conn, $sql);
    // Comprobamos el número de filas que devuelve la select
    if (mysqli_num_rows($result) > 0) {
      // Extraemos la información de cada una de las filas que ha devuelto la select
      while ($row = mysqli_fetch_assoc($result)) {
        echo "codigo: " . $row["codigo"] . " - nombre: " . $row["nombre"] . " - curso: " . $row["curso"] . " - nota: " . $row["nota"] . "<br>";
        /*foreach($row as $campo=>$valor)
          echo "$campo:$valor   ";
        echo "<br>";
        */
      }
    } else {
      echo "La tabla está vacía";
    }
  } catch (Exception $e) {
    echo "Se ha producido un error al mostrar los alumnos";
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
  }

  mysqli_close($conn);
  ?>



</body>

</html>