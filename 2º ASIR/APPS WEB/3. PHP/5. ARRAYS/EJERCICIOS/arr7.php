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
        $empleados=array("Juan"=>2000,"Ana"=>1800,"Carmen"=>2250,"Adan"=>2100);
        $maximo=0;
        $minimo=PHP_INT_MAX;
        $nombreMax="";
        $nombreMin="";
        foreach($empleados as $n=>$s){
            if ($maximo<$s){
                $maximo=$s;
                $nombreMax=$n;
            }
            if ($minimo>$s){
                $minimo=$s;
                $nombreMin=$n;
            }
        }
        echo "<h1>El sueldo más alto es:".$maximo.", lo cobra:".$nombreMax."</h1>";
        echo "<h1>El sueldo más bajo es:".$minimo.",lo cobra:".$nombreMin."</h1>";
        ?>
    </body>
</html>