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
			<h1>CONFIRMAR PEDIDO</h1>
			<?php

			// Función que limpia los datos recibidos
			function test_input($data)
			{
				$data = trim($data);
				$data = stripslashes($data);
				$data = htmlspecialchars($data);
				return $data;
			}
			//print_r($_POST);
			if (!isset($_POST['codigo']) || !isset($_POST['mail'])) {
				die("No has llegado aquí desde la página adecuada");
			} else {

				$codigo = test_input($_POST['codigo']);
				$mail = test_input($_POST['mail']);

				// if (strpos($mail,'@') == false){
				if (strlen($codigo) != 6 || $mail=="" || substr($codigo, 1, 3) != strtoupper(substr($codigo, 1, 3))) { ?>
					<p>DATOS INCORRECTOS</p>
					<p><a href="index.html">Volver a la página inicial</a></p>
					
					<?php

				} else {
					// Accedo a la base de datos 
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

					try {
						$sql = "SELECT * FROM anuncios WHERE codigo='$codigo'";
						//echo $sql;
						$result = mysqli_query($conn, $sql);

						// Comprobamos el número de líneas que ha devuelto la instrucción select
						if (mysqli_num_rows($result) > 0) {
							// Extraemos la información de la fila
							$row = mysqli_fetch_assoc($result);
							$peso = $row['peso'];
							$precioventa = $row['precioventa'];
						

							echo "<h2>Ha elegido usted comprar el siguiente producto</h2>";
							echo "<h3>$row[descripcion]</h3>";

							if ($peso == 0)
								$precioenvio = 0;
							else {
								if ($peso <= 5)
									$precioenvio = 3;
								else if ($peso <= 10)
									$precioenvio = 5;
								else
									$precioenvio = $peso * 0.7;
							}
							$preciototal = $precioventa + $precioenvio;
							if ($precioenvio == 0)
								echo "<p>El producto se recoge en domicilio, el precio del producto es de: $preciototal euros</p>";
							else {
								echo "<p>El producto se envía, el precio total es de: $preciototal euros</p>";
								echo "<p>$precioventa euros + $precioenvio euros de envío";
							}
					?>
							<form method="POST" action="comprar.php">
							<input type="hidden" value="<?php echo $codigo?>" name="codigo">
							<input type="hidden" value="<?php echo $precioventa?>" name="precio">
							<input type="hidden" value="<?php echo $mail?>" name="mail">
							<input type="submit" value="CONFIRMAR">
							
			<?php



						}
						// Si la select no ha devuelto ninguna línea
						else {
							echo "<p>Código incorrecto</p>";
							echo "<p><a href='index.html'>Volver a la pantalla inicial</a></p>";
						}
					} catch (Exception $e) {
						echo "Se ha producido un error accediendo a la base de datos";
						echo "Error: " . $sql . "<br>" . mysqli_error($conn);
					}

					mysqli_close($conn);
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