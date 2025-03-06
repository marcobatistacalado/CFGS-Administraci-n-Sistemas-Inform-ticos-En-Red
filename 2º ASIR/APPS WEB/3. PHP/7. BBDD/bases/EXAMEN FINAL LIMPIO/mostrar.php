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
            <h1>MOSTRAR ANUNCIOS</h1>


            <?php

            // Función que limpia los datos recibidos
            function test_input($data)
            {
                $data = trim($data);
                $data = stripslashes($data);
                $data = htmlspecialchars($data);
                return $data;
            }

            //print_r($_REQUEST);
            if (!isset($_POST['categoria']) || !isset($_POST['pmax']) || !isset($_POST['pmin']))
                die("No vienes de la página adecuada");

            $categoria = test_input($_POST['categoria']);
            $pmax = test_input($_POST['pmax']);
            $pmin = test_input($_POST['pmin']);

            if ($categoria == "") {
                echo "<p>No has anotado la categoria</p>";
                echo "<p><a href='index.html'>Volver a introducir los datos</a></p>";
            } else {
                if ($pmax == "")
                    $pmax = 1000000;
                if ($pmin == "")
                    $pmin = 0;
                if ($pmin > $pmax) {
                    echo "<p>Datos incorrectos</p>";
                    echo "<a href='index.html'>Volver a introducir los datos</a>";
                }

                $servername = "localhost";
                $username = "nuevo";
                $password = "a1234567";
                $dbname = "wallapop";


                // Create connection
                $conn = mysqli_connect($servername, $username, $password, $dbname);
                // Check connection
                if (!$conn) {
                    die("Connection failed: " . mysqli_connect_error());
                }

                $total = 0;

                try {
                    $sql = "SELECT * FROM anuncios WHERE categoria='$categoria' and precioventa>=$pmin and precioventa<=$pmax";
                    $result = mysqli_query($conn, $sql);
                    // Comprobamos el número de filas que devuelve la select

                    if (mysqli_num_rows($result) > 0) {
                        echo "<table style='margin:auto'>";
                        // Extraemos la información de cada una de las filas que ha devuelto la select
                        while ($row = mysqli_fetch_assoc($result)) {
                            echo "<tr><td>" . $row['codigo'] . "</td><td> " . $row['categoria'] . "</td><td>" . $row['descripcion'] . "</td><td> " . $row['precioventa'] . " euros</td></tr>";
                            $total = $total + 1;
                        }
                        echo "</table>";
                    } else {
                        echo "No se ha encontrado ningún anuncio con esos criterios de búsqueda";
                    }
                    echo "</ul><p>Total productos:" . $total . "</p>";

                    mysqli_close($conn);
                } catch (Exception $e) {
                    echo "Se ha producido un error al mostrar los anuncios";
                    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
                }

                if ($total > 0) {
            ?>
                    <form method="POST" action="confirmar.php">
                        <p>Anote código producto que desea comprar <input type="text" name="codigo" size="6"></p>
                        <p>Anota tu mail <input type="email" name="mail"></p>
                        <p><input type="submit" value="COMPRAR"></p>
                    </form>
            <?php
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