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
            background: #d6f5f5;
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
            color: white;
        }

        .content {
            padding: 20px 0;
            text-align: center;
        }

        /* ~~ The footer ~~ */

        .footer {
            padding: 10px;
            background: #006666;
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
            <h1>REALIZANDO COMPRA</h1>
            <?php
            if (!isset($_REQUEST['codigo']) || !isset($_POST['mail']) || !isset($_POST['precio']))
                die("NO has entrado por la página correcta");

            $codigo = $_POST['codigo'];
            $mail = $_POST['mail'];
            $total = $_POST['precio'];

            //Alta Venta
            $servername = "localhost";
            $username = "nuevo";
            $password = "a1234567";
            $dbname = "Wallapop";

            // Create connection
            $conn = mysqli_connect($servername, $username, $password, $dbname);
            // Check connection
            if (!$conn) {
                die("Connection failed: " . mysqli_connect_error());
            }

            // Escribimos la instrución sql a ejecutar, observa que se ponen entre comillas los datos que son String
            $sql = "INSERT INTO vendidos (codigo, mailcomprador, precioventa)
              VALUES ('$codigo','$mail',$total)";
            try {
                if (mysqli_query($conn, $sql)) {
                    echo "Venta realizada";

                    $sql = "delete from anuncios where codigo='$codigo'";

                    try {
                        if (mysqli_query($conn, $sql)) {
                            // Comprobamos cuantas filas se han borrado
                            $filas = mysqli_affected_rows($conn);
                            if ($filas > 0)
                                echo "<p>Anuncio borrado</p>";
                            else
                                echo "<p>No se ha borrado ningún anuncio</p>";
                        }
                    } catch (Exception $e) {
                        echo "Se ha producido un error al borrar el anuncio";
                        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
                    }
                }
            } catch (Exception $e) {
                echo "Se ha producido un error al insertar venta";
                echo "Error: " . $sql . "<br>" . mysqli_error($conn);
            }


            mysqli_close($conn);
            //Baja anuncio
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