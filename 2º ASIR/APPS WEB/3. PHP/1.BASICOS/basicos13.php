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
		
	$mes = 7;
	echo isset($mes);
	switch ($mes) {
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12:
			echo "31 días";
			break;
		case 2:
			echo "28 días";
			break;
		case 4:
		case 6:
		case 9:
		case 11:
			echo "30 días";
			break;
	}
	?>
</body>

</html>