<html>

<head>
  <title>Alta alumno</title>
</head>

<body>

  <?php
  $servername = "localhost";
  $username = "otro";
  $password = "";
  $dbname = "colegio";

  // Create connection
  $conn = mysqli_connect($servername, $username, $password, $dbname);
  // Check connection
  if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
  }

  // Escribimos la instrución sql a ejecutar, observa que se ponen entre comillas los datos que son String
  $sql = "INSERT INTO cursos (nombre, descripcion, aula)
VALUES ('$_REQUEST[nombre]','$_REQUEST[descr]',$_REQUEST[aula])";
  try {
    if (mysqli_query($conn, $sql)) {
      echo "New record created successfully";
    } 
  } catch (Exception $e) {
    echo "Se ha producido un error al insertar curso";
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
  }

  mysqli_close($conn);
  ?>
</body>

</html>