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
       $uno=7;
       $dos=15;
       $tres=6;
       if($uno>=$dos && $uno>=$tres)
          echo "El mayor es $uno";
       else
          if($dos>=$uno && $dos>=$tres)
             echo "El mayor es $dos";
        else
           echo "El mayor es $tres";
    ?>
</body>
</html>