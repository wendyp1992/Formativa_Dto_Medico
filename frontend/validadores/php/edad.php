<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of edad
 *
 * @author romario
 */
class edad {
    
    function calculaedad($fechanacimiento){
	list($ano,$mes,$dia) = explode("-",$fechanacimiento);
	$ano_diferencia  = date("Y") - $ano;
	$mes_diferencia = date("m") - $mes;
	$dia_diferencia   = date("d") - $dia;
	if ($dia_diferencia < 0 || $mes_diferencia < 0)
		$ano_diferencia--;
	return $ano_diferencia;
}
function estdoCivil($fechanacimiento){
    
    if($edad=$this->calculaedad($fechanacimiento)){
        if(($edad<18 && $_POST['Dependiente']['estado_civil']=='Casado')){
            return false;
        }
        elseif ($edad>=18) {
            return TRUE;
    }
    }
}
}
