<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        // put your code here
        $numeros=array(3,6,7,8,4,9,2);
        echo "Estoy probando arrays<br>";
        $naprobados=0;
        for($i=0; $i<=6; $i++){
            if ($numeros[$i]>=5){
                echo $numeros[$i]."<br>";
                $naprobados++;
            }
        }
        echo 'total aprobados:'.$naprobados;
        
        ?>
    </body>
</html>