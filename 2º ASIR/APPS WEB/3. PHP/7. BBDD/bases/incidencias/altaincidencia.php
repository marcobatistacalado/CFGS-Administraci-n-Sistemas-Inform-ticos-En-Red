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
    $sql = "SELECT * FROM usuarios WHERE mail='$_REQUEST[mail]'";
    $result = mysqli_query($conn, $sql);

    // Comprobamos ell número de líneas que ha devuelto la instrucción select
    if (mysqli_num_rows($result) > 0) {
        echo "Hemos encontrado la consulta <br>";
        $sql2= "INSERT INTO incidencias (descripcion,codordenador,mail)
        VALUES('$_REQUEST[descr]', '$_REQUEST[pc]', '$_REQUEST[mail]')";
        
        if (mysqli_query($conn, $sql2)) {
            echo "Incidencia registrada";
          }
         
    }else{
        echo "No hemos encontrado el usuario <br>";
        echo "REGISTRESE AQUI: <a href='altausuario.html'>registro</a> <br>";
        echo "VOLVER: <a href='index.html'>pagina principal</a> <br>";
    }
  } catch (Exception $e) {
    echo "Se ha producido un error al insertar la incidencia";
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
  }

  mysqli_close($conn);
  ?>
</body>

</html>
