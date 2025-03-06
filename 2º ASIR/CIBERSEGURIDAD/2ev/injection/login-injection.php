      <?php
       $nombre=$_POST['nombre'];
       $clave=$_POST['clave'];
       $conexion=mysqli_connect('localhost','root');
       mysqli_select_db($conexion,"usuarios");
       $cadenaSQL="SELECT * FROM usuarios WHERE nombre='$nombre' AND contrasena='$clave'";
       $fila=mysqli_query($conexion,$cadenaSQL);
       if(mysqli_num_rows($fila)!=0)
       {
        echo("<html><body>Acceso Concedido</body></html>");
       }
       else
       {
        echo("<html><body>Acceso Denegado</body></html>");
       }
       mysqli_close($conexion);
      ?>

