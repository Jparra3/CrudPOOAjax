<?php 
require_once './usuario.validarAutenticacion.php';
require_once '../modelo/Municipio.php';


try{
    $retorno = array('data'=>null, 'autenticado'=>1, 'exito'=>1, 'mensaje'=>'HOLA PRUEBA');
    $municipioE = new \entidad\Municipio();
    $municipioM = new \modelo\Municipio($municipioE);
    $municipioM->consultar();
    $contador = 0;

    while($fila = $municipioM->conexion->obtenerObjeto()){
        $retorno['data']['municipios'][$contador]['idMunicipio'] = $fila->idMunicipio;
        $retorno['data']['municipios'][$contador]['municipio'] = utf8_encode($fila->municipio);
        $contador++;
    }
    //var_dump($retorno);
}catch (Exception $error){
    $retorno['exito'] = 0;
    $retorno['mensaje'] = $error->getMessage();
}
echo json_encode($retorno);

//echo json_last_error_msg();


