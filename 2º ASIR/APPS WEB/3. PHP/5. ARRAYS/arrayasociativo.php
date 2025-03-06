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
        $alumnos=array("Juan"=>7,"Ana"=>9,"Luis"=>5,"Esther"=>4);
        echo "Almacenando alumnos<br>";
        foreach($alumnos as $nom=>$nota){
            echo $nom." su nota es:".$nota."<br>";
        }
        
        ?>
    </body>
</html>
