<html>
<head>
<title>Borrar alumnos</title>
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
  $sql = "delete from alumnos where curso='$_REQUEST[codigo]'"; //HAY QUE PONER COMILLA SIMPLE SI ES UNA CADENA SI ES UN NUMERO DA IGUAL.

  try {
    if (mysqli_query($conn, $sql)) {
      // Comprobamos cuantas filas se han borrado
      $filas=mysqli_affected_rows($conn);
      if ($filas>0)
        echo "$filas alumnos borrados";
      else
        echo "No se ha borrado ningún alumno";
    } 
  } catch (Exception $e) {
    echo "Se ha producido un error al borrar el alumno";
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
  }

  mysqli_close($conn);
  ?>
</body>
</html> 

