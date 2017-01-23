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

    function calculaedad($fechanacimiento) {
        list($ano, $mes, $dia) = explode("-", $fechanacimiento);
        $ano_diferencia = date("Y") - $ano;
        $mes_diferencia = date("m") - $mes;
        $dia_diferencia = date("d") - $dia;
        if ($dia_diferencia < 0 || $mes_diferencia < 0)
            $ano_diferencia--;
        return $ano_diferencia;
    }

    function estdoCivil($fechanacimiento) {
        $edad = $this->calculaedad($fechanacimiento);
        if ($edad >= 0) {
            if (($edad < 18 && ($_POST['Dependiente']['estado_civil'] == 'Casado' || $_POST['Dependiente']['estado_civil'] == 'Viudo' || $_POST['Dependiente']['estado_civil'] == 'Divorciado' || $_POST['Dependiente']['estado_civil'] == 'Union Libre'))) {
                return 0;
            } elseif ($edad >= 0) {
                return 1;
            }
        }
    }

}
