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
      $sql = "INSERT INTO usuarios (mail, nombre, apellidos, tlfno)
        VALUES ('$_REQUEST[email]','$_REQUEST[nombre]','$_REQUEST[apellidos]','$_REQUEST[telefono]')";

      if (mysqli_query($conn, $sql)) {
        echo "Usuario registrado";
        ?>
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