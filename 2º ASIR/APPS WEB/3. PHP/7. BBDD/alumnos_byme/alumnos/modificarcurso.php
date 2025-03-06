
<html>
<head>
<title>Modificar alumno</title>
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
  $sql = "UPDATE cursos SET descripcion='$_REQUEST[descr]', aula='$_REQUEST[aula]' WHERE nombre='$_REQUEST[curso]'";

  try {
    if (mysqli_query($conn, $sql)) {
      // Comprobamos cuantas filas se han borrado
      $filas=mysqli_affected_rows($conn);
      if ($filas>0)
        echo "$filas CURSO MODIFICADO";
      else
        echo "No se ha modificado ningun CURSO";
    } 
    else
      die("Error actualizando");
  } catch (Exception $e) {
    echo "Se ha producido un error al modificar el alumno";
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
  }

  mysqli_close($conn);
  ?>

</body>
</html> 