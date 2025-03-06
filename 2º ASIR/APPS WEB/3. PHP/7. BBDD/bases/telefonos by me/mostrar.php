<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style type="text/css">
        body {
            font: 100%/1.4 Verdana, Arial, Helvetica, sans-serif;
            background: #42413C;
            padding: 0;
            color: #000;
            font-family: pueblo;
        }
        
        @font-face {
            font-family: pueblo;
            src: url(caligrafia.ttf);
        }
        /* ~~ Element/tag selectors ~~ */
        /* ~~ this fixed width container surrounds the other divs ~~ */
        
        .container {
            width: 960px;
            background: #FFF;
            margin: 0 auto;
            /* the auto value on the sides, coupled with the width, centers the layout */
            margin-top: 20vh;
        }
        /* ~~ the header is not given a width. It will extend the full width of your layout. It contains an image placeholder that should be replaced with your own linked logo ~~ */
        
        .header {
            background: #ADB96E;
            font-size: 60px;
            padding-left: 50px;
            height: 100px;
            position: relative;
            text-align: center;
        }
        
        .content {
            padding: 20px 0;
            text-align: center;
        }
        /* ~~ The footer ~~ */
        
        .footer {
            padding: 10px;
            background: #CCC49F;
            font-style: italic;
        }
        
        .container .footer p {
            font-style: italic;
            text-align: right;
            font-size: 14px;
        }
        
        p {
            font-size: 14%;
        }
        
        p {
            font-size: 14px;
        }
    </style>
</head>

<body>
<div class="container">
        <div class="header"> Movil Telephone

        </div>

        <div class="content">
        <h1>Area clientes</h1>
    <?php

    function test_input($data)
    {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }
    if (!isset($_GET["numero"])){
        die ("NO HA LLEGADO NADA");
    }else{
        $numero=test_input($_GET['numero']);
        
        $servername = "localhost";
        $username = "otro";
        $password = "";
        $dbname = "telefonos";
        // Create connection
        $conn = mysqli_connect($servername, $username, $password, $dbname);
        // Check connection
        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());
        }
        // Busco LO QUE ME PIDEN
        try {
            $sql = "SELECT nombre, apellido, telefono_des, importe 
            FROM abonados join llamadas on llamadas.telefono = abonados.numero 
            where abonados.numero='$numero';";
            $result = mysqli_query($conn, $sql);
            
            $impt=0;
            echo "<ul>";
            while ($row = mysqli_fetch_assoc($result)) { 
                // $row es un array asociativo que contiene los datos de la línea que devuelve la select
                echo "<li>" . $row["telefono_des"] . " imp: " . $row["importe"] . " <li>";
                $impt=$row["importe"]+$impt;
            }
            echo "</ul>";
            echo "Importe total llamadas: $impt";


            mysqli_close($conn);   
        } catch (Exception $e) {
            echo "Se ha producido un error al buscar el equipo";
            echo "Error: " . $sql . "<br>" . mysqli_error($conn);
        }
    }


    ?>
    </div>
        <div class="footer ">
            <p>Copyright SalesianasNSPilar</p>
            <!-- end .footer -->
        </div>
        <!-- end .container -->
    </div>
</body>

</html>