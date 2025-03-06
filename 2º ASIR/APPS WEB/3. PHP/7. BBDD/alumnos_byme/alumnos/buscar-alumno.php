<html>

<head>
  <title>Buscar alumno</title>
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
    $sql = "SELECT codigo, nombre, curso, nota FROM alumnos WHERE nombre='$_REQUEST[nombre]'";
    $result = mysqli_query($conn, $sql);

    // Comprobamos ell número de líneas que ha devuelto la instrucción select
    if (mysqli_num_rows($result) > 0) {
      // Extraemos la información de la fila
      $row = mysqli_fetch_assoc($result);
      // $row es un array asociativo que contiene los datos de la línea que devuelve la select
      //echo "codigo: " . $row["codigo"] . " - nombre: " . $row["nombre"] . " - curso: " . $row["curso"] . " - nota: " . $row["nota"] . "<br>";
      echo "codigo: $row[codigo] - nombre: $row[nombre] - curso: $row[curso] - nota: $row[nota] <br>";
    } 
    // Si la select no ha devuelto ninguna línea entramos en el else
    else {
      echo "No existe ningún alumno con ese nombre";
    }
  } catch (Exception $e) {
    echo "Se ha producido un error al buscar el alumno";
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
  }

  mysqli_close($conn);
  ?>



</body>

</html>