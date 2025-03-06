<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>Untitled Document</title>

    <style type="text/css">
        body {
            font: 100%/1.4 Verdana, Arial, Helvetica, sans-serif;
            padding: 0;
            color: #000;
            
        }
       
        .container {
            width: 960px;
            background:  #d6f5f5;
            margin: 0 auto;
            /* the auto value on the sides, coupled with the width, centers the layout */
            margin-top: 20vh;
        }
        /* ~~ the header is not given a width. It will extend the full width of your layout. It contains an image placeholder that should be replaced with your own linked logo ~~ */
        
        .header {
            background: #006666;
            font-size: 60px;
            padding-left: 50px;
            height: 100px;
            position: relative;
            text-align: center;
            color:white;
        }
        
        .content {
            padding: 20px 0;
            text-align: center;

        }
        /* ~~ The footer ~~ */
        
        .footer {
            padding: 10px;
            background:  #006666;
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
        <div class="header"> WALLAPOP

        </div>

        <div class="content">
            <h1>MOSTRAR ANUNCIOS</h1>
            
        <?php
            function test_input($data)
            {
                $data = trim($data);
                $data = stripslashes($data);
                $data = htmlspecialchars($data);
                return $data;
            }
        
            //print_r($_POST);

            if (!isset($_POST['categoria']) || !isset($_POST['pmin']) || !isset($_POST['pmax']) ){
                die("No has entrado desde el formulario correcto");
            }

            $categoria = test_input($_POST['categoria']);
            $pmin = test_input($_POST['pmin']);
            $pmax = test_input($_POST['pmax']);
    
            if ($pmax == "" ){
                $pmax=100000;
            }
            if ($pmin == ""){
                $pmin=0;
            }
            if ($pmin>$pmax){
                die ("ERROR: precio minimo es mayor que el máximo.");
            }

            $servername = "localhost";
            $username = "otro";
            $password = "";
            $dbname = "anuncios";

            // Create connection
            $conn = mysqli_connect($servername, $username, $password, $dbname);
            // Check connection
            if (!$conn) {
                die("Connection failed: " . mysqli_connect_error());
            }

            // Busco el producto en la BBDD local

            try {
                $sql = "SELECT * FROM anuncios WHERE categoria='$categoria' AND precioventa>='$pmin' AND precioventa<='$pmax'";
                $result = mysqli_query($conn, $sql);
                // Comprobamos ell número de líneas que ha devuelto la instrucción select
                if (mysqli_num_rows($result) == 0) {
                    die ("NO HAY RESULTADOS");
                }
                else if (mysqli_num_rows($result) > 0){
                    echo "<table style='margin:auto;'>";
                    $ptotal=0;
                    while ($row = mysqli_fetch_assoc($result)) {
                        echo "<tr>";
                        // $row es un array asociativo que contiene los datos de la línea que devuelve la select
                        //echo "codigo: " . $row["codigo"] . " - nombre: " . $row["nombre"] . " - curso: " . $row["curso"] . " - nota: " . $row["nota"] . "<br>";
                            echo "<td> $row[codigo] </td> 
                            <td> $row[categoria] </td> 
                            <td>$row[descripcion]</td> 
                            <td>$row[precioventa] </td>";
                        echo "</tr>";
                        $ptotal=$ptotal+1;
                    }
                    echo "</table";
                    echo "<p>Total productos: $ptotal</p>";
                ?>
                <form action="confirmar.php" method="POST">
                <p>Anote código producto que desea comprar</p><input type="text" name="cod">
                <p>Anota tu mail</p><input type="text" name="mail">
                <input type="submit" value="Comprar">

            </form>
                <?php
                }
            } catch (Exception $e) {
            echo "Se ha producido un error al buscar el producto";
            echo "Error: " . $sql . "<br>" . mysqli_error($conn);
            }
            mysqli_close($conn);//CERRAR LA BBDD IMPORTANTE!!!


            
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