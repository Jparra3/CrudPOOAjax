<?php namespace modelo;
require_once '../entorno/Conexion.php';
require_once '../entidad/Usuario.php';
class Usuario{
    public $conexion;
    
    private $idUsuario;
    private $usuario;
    private $contrasenia;
    private $nombre;
    
    function __construct(\entidad\Usuario $usuario, $conexion = null) {
        $this->idUsuario = $usuario->getIdUsuario();
        $this->usuario = $usuario->getUsuario();
        $this->contrasenia = $usuario->getContrasenia();
        $this->nombre = $usuario->getNombre();
        
        if($conexion == null)
            $this->conexion = new \Conexion();
        else
            $this->conexion = $conexion;
    }
    function autenticar($usuario){
        $sentenciaSql = "SELECT 
                            * 
                        FROM 
                            usuario
                         WHERE 
                            usuario = '$usuario'
                        ";
        $this->conexion->ejecutar($sentenciaSql);
    }
}