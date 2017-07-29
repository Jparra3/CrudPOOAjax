<?php
session_start();
if(!isset($_SESSION['autenticado']) || $_SESSION['autenticado'] === 0){
    echo "Debe realiar la autenticación";
    exit();
}
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        echo "BIEVENIDO ".$_SESSION['nombreUsuario'];
        ?>
        
    </body>
</html>
