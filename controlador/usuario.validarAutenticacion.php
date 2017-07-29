<?php session_start();
$retorno = array("exito"=>1,"mensaje"=>"", "data"=>array(), "autenticado"=>1);
if(!isset($_SESSION['autenticado']) || $_SESSION['autenticado'] === 0){
    $retorno['autenticado'] = 0;
    $retorno['mensaje'] = 'Debe realizar la autenticación para poder acceder a este formulario';
    echo json_encode($retorno);
    exit();
}
