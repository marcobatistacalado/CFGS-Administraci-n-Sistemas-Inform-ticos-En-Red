<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
    print_r($_REQUEST);
    if (isset ($_REQUEST["usu"]) && isset($_REQUEST["pass"])){

        $usuarios=array("Juan"=>"a1234","Ana"=>"b1234","Luis"=>"c1234","Esther"=>"d1234");
        $nombre=$_REQUEST['usu'];
        $password=$_REQUEST['pass'];

        $cont=0;

        foreach($usuarios as $usuario=>$contrasena){
            if ($usuario == $nombre && $password == $contrasena){
                    $cont=1;
                    break;
                    }
            
           
          
         }
         
         if ($cont == 1){
             echo "acceso concedido";
         }else
         echo "acceso denegado";
          
         
        

    }else{?> 

    <form action="arr1.php" method="POST">
        Usuario:<input type="text" name="usu"><br><br>
        Contraseña: <input type="text" name="pass"><br><br>
        <input type="submit" value="ENVIAR">    

    </form>
    <?php
    }
    ?>
</body>
</html>