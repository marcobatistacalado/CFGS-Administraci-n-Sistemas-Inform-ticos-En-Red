<html>

<head>
  <title>Buscar alumno</title>
</head>

<body>

  <?php

  $host_name = 'db5011172650.hosting-data.io';
  $database = 'dbs9435871';
  $user_name = 'dbu5426456';
  $password = 'xxxxxxxx';

  $link = new mysqli($host_name, $user_name, $password, $database);

  if ($link->connect_error) {
    die('<p>Error al conectar con servidor MySQL: ' . $link->connect_error . '</p>');
  } else {
    echo '<p>Se ha establecido la conexión al servidor MySQL con éxito.</p>';
  }


  try {
    $sql = "SELECT codigo, nombre, curso, nota FROM alumnos WHERE nombre='$_REQUEST[nombre]'";



    $result = $link->query($sql);

    if ($result->num_rows > 0) {
      // output data of each row
      while ($row = $result->fetch_assoc()) {

        echo "codigo: $row[codigo] - nombre: $row[nombre] - curso: $row[curso] - nota: $row[nota] <br>";
      }
      // Si la select no ha devuelto ninguna línea entramos en el else
    } else {
      echo "No existe ningún alumno con ese nombre";
    }
  } catch (Exception $e) {
    echo "Se ha producido un error al buscar el alumno";
    echo "Error: " . $sql . "<br>" . $link->connect_error;
  }

  $link->close();
  ?>



</body>

</html>