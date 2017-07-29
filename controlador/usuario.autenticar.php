<?php session_start();
require_once '../modelo/Usuario.php';

$retorno = array("exito"=>0,"mensaje"=>"Verifique usuario y/o contraseña", "data"=>array());

$_SESSION['autenticado'] = 0;
$_SESSION['usuario'] = '';
$_SESSION['nombreUsuario'] = '';

try{
    $usuario = filter_input(INPUT_POST, 'txtUsuario');
    $contrasenia = filter_input(INPUT_POST, 'txtContrasenia');
    
    $usuarioE = new \entidad\Usuario();
    $usuarioM = new \modelo\Usuario($usuarioE, null);
    $usuarioM->autenticar($usuario);
    if($fila = $usuarioM->conexion->obtenerObjeto()){
        if($fila->contrasenia === md5($contrasenia)){
            $retorno['exito'] = 1;
            $_SESSION['autenticado'] = 1;
            $_SESSION['usuario'] = $usuario;
            $_SESSION['nombreUsuario'] = $fila->nombre;
        }
    }    
}catch (Exception $error){
    $retorno['exito'] = 0;
    $retorno['mensaje'] = $error->getMessage();
}
echo json_encode($retorno);
