<html>

<head>
  <title>Alta alumno</title>
</head>

<body>

  <?php
  $servername = "localhost";
  $username = "nuevo";
  $password = "a1234567";
  $dbname = "incidencias";

  // Create connection
  $conn = mysqli_connect($servername, $username, $password, $dbname);
  // Check connection
  if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
  }


  try {
    $sql = "SELECT * FROM usuarios WHERE mail='$_REQUEST[email]'";
    $result = mysqli_query($conn, $sql);

    // Comprobamos ell número de líneas que ha devuelto la instrucción select
    if (mysqli_num_rows($result) > 0) {

      // Escribimos la instrución sql a ejecutar, observa que se ponen entre comillas los datos que son String
      $sql = "INSERT INTO incidencias (descripcion, codordenador, mail)
        VALUES ('$_REQUEST[descripcion]',$_REQUEST[ordenador],'$_REQUEST[email]')";

      if (mysqli_query($conn, $sql)) {
        echo "Incidencia registrada";
      }
    }
    // Si la select no ha devuelto ninguna línea es que el mail no existe
    else {
      echo "Usuario no registrado";
      ?>
      <p><a href="altausuario.html">Registrar usuario</a></p>
      <p><a href="altaincidencia.html">Volver a incidencias</a></p>
      <?php
    }
  } catch (Exception $e) {
    echo "Se ha producido un error al buscar el alumno";
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
  }

  mysqli_close($conn);


  ?>
</body>

</html>