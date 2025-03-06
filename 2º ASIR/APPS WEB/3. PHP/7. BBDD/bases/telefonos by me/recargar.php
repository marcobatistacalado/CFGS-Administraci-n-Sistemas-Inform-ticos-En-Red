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
    print_r($_POST);
    
    function test_input($data)
    {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    if (!isset($_POST["tel"]) && !isset($_POST["clave"]) && !isset($_POST["imp"])){
        echo "No has rellenado nada <br><br><a href='index.html'>Volver a intentarlo</a>";
    }else{
        $tel = test_input($_POST['tel']);
        $clave = test_input($_POST['clave']);
        $imp = test_input($_POST['imp']);

        if ($tel == "" || $clave == "" || $imp == "" ){
            echo("<br><br>Algún dato ha llegado vacío <br><br><a href='index.html'>Volver a intentarlo</a>");
        }else {
            if (substr($tel,0,2) != '66' && substr($tel,0,2) != '65'){
                echo "<br><br>Error de telefono <br><br><a href='index.html'>Volver a intentarlo</a>";
            }else{ 
                if ( $imp < 10 ){
                    echo "<br>Error de importe menor de 10 <br><br><a href='index.html'>Volver a intentarlo</a>";
                }
                else {
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
                    // Busco el numero y clave
                
                    try {
                        $sql = "SELECT * FROM abonados WHERE numero='$tel' AND clave='$clave'";
                        $result = mysqli_query($conn, $sql);
                        
                        // Comprobamos ell número de líneas que ha devuelto la instrucción select
                        if (mysqli_num_rows($result) > 0) { 
                            if ($row = mysqli_fetch_assoc($result)) { //aqui puedes poner while si te devuelve muchas filas
                                // $row es un array asociativo que contiene los datos de la línea que devuelve la select
                                $fechahoy=date("d-m-Y");
                                echo " <br><br>Usuario: " . $row["nombre"] . " - Saldo anterior: " 
                                . $row["saldo"] . " - Saldo nuevo: " . $row["saldo"]+$imp . 
                                " - Fecha limite: " . date("d-m-Y",strtotime($fechahoy."+90 days"));
                                
                                $sql = "UPDATE abonados set saldo=saldo+$imp where numero='$tel'";
                                mysqli_query($conn, $sql);
                                echo "<br><br>SALDO ACTUALIZADO";
                                echo "<br><br><a href='mostrar.php?numero=$tel'>si quiere ver sus llamadas pinche aquí</a>";
                            }
                        }else{
                            echo "Error: no existe el telefono y la clave <br><br><a href='index.html'>Volver a intentarlo</a>";
                        }
                    } catch (Exception $e) {
                        echo "Se ha producido un error al buscar el equipo";
                        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
                    }  
                    mysqli_close($conn);     
                }      
            }
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