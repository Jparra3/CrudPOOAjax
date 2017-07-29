<?php namespace entidad;
class Usuario{
    function getIdUsuario() {
        return $this->idUsuario;
    }
    function getUsuario() {
        return $this->usuario;
    }
    function getContrasenia() {
        return $this->contrasenia;
    }
    function getNombre() {
        return $this->nombre;
    }
    function setIdUsuario($idUsuario) {
        $this->idUsuario = $idUsuario;
    }
    function setUsuario($usuario) {
        $this->usuario = $usuario;
    }
    function setContrasenia($contrasenia) {
        $this->contrasenia = $contrasenia;
    }
    function setNombre($nombre) {
        $this->nombre = $nombre;
    }
    private $idUsuario;
    private $usuario;
    private $contrasenia;
    private $nombre;
}

