<html>

<head>
  <title>Alta incidencia</title>
</head>

<body>

  <?php
  $servername = "localhost";
  $username = "otro";
  $password = "";
  $dbname = "incidencias";

  // Create connection
  $conn = mysqli_connect($servername, $username, $password, $dbname);
  // Check connection
  if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
  }

  try {
    $sql= "INSERT INTO usuarios (mail,nombre,apellidos,tlfno)
        VALUES('$_REQUEST[mail]', '$_REQUEST[nom]', '$_REQUEST[ape]', '$_REQUEST[telefono]')";
    if (mysqli_query($conn, $sql)) {
        echo "Usuario registrado<br><br>";
        echo "<a href='index.html'>pagina principal</a>";
    }
    
}
   catch (Exception $e) {
    echo "Se ha producido un error al insertar el usuario <br>";
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
  }

  mysqli_close($conn);
  ?>
</body>

</html>
