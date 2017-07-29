<?php namespace modelo;
class _POST{
    public function castearVariablesPOST($param) {
        foreach ($param as $key => $value) {
            if (is_array($value)) {
                global $$key;
                $$key = array();
                $$key = $value;
            }  else {
                $primeraLetra = strtolower(substr($key, 3, 1));
                $variable = $primeraLetra.substr($key, 4);
                global $$variable;
                $$variable = $value;
            }
        }
    }
}