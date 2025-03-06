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
    if (isset($_REQUEST["numero"])){
        $mes=$_REQUEST["numero"];
        $nombres=array("1"=>"Enero","2"=>"febrero","3"=>"marzo","4"=>"abril","5"=>"mayo","6"=>"junio","7"=>"julio","8"=>"agosto","9"=>"septiembre","10"=>"octubre","11"=>"noviembre","12"=>"diciembre");
        $dias=array("1"=>"31","2"=>"28","3"=>"31","4"=>"30","5"=>"31","6"=>"30","7"=>"31","8"=>"31","9"=>"30","10"=>"31","11"=>"30","12"=>"31");
        
        foreach($nombres as $num=>$nom){
         
               if ($mes == $num){
                   echo "hoy estamos en el mes de $nom y este mes tiene $dias[$mes]";
               }
            
        }

    }else{?> 

    <form action="arr2.php" method="POST">
        Mes: <input type="text" name="numero">
        <input type="submit" value="ENVIAR">    

    </form>
    <?php
    }
    ?>
</body>
</html>