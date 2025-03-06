<!DOCTYPE HTML>
<html>

<head>
  <style>
    .error {
      color: #FF0000;
    }
  </style>
</head>

<body>

  <?php

  // Función que limpia los datos recibidos
  function test_input($data)
  {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
  }

  // define variables y las inicializa a nulo
  $nameErr = $emailErr = "";
  $name = $email = "";
 
  // Si me llegan los datos, compruebo que no están vacíos
  // si están vacíos, relleno el error que mostraré en el formulario
  if (isset($_POST['name']) && isset($_POST['email'])) {
    $completo = true;
    if (empty($_POST["name"])) {
      $nameErr = "Name is required";
      $completo = false;
    } else {
      $name = test_input($_POST["name"]);
    }

    if (empty($_POST["email"])) {
      $emailErr = "Email is required";
      $completo = false;
    } else {
      $email = test_input($_POST["email"]);
    }
  }
  else
    $completo = false;

  if ($completo) {
    echo "<h2>Gracias por contactarnos $name. </h2><h2>Le enviaremos un correo con toda la información a $email</h2>";
  } else {
  ?>

    <h2>PHP Form Validation Example</h2>
    <p><span class="error">* required field</span></p>
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
      Name: <input type="text" name="name" value="<?php echo $name;?>">
      <span class="error">* <?php echo $nameErr; ?></span>
      <br><br>
      E-mail: <input type="email" name="email" value="<?php echo $email;?>">
      <span class="error">* <?php echo $emailErr; ?></span>
      <br><br>
      <input type="submit" name="submit" value="Submit">
    </form>

  <?php
  }
  ?>

</body>

</html>