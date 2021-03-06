<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "reportepacientes".
 *
 * @property integer $idreporte
 * @property string $fechainicio
 * @property string $fechafin
 * @property string $fechaRegistro
 * @property string $reporte
 */
class Reportepacientes extends \yii\db\ActiveRecord {

    /**
     * @inheritdoc
     */
    public static function tableName() {
        return 'reportepacientes';
    }

    /**
     * @inheritdoc
     */
    public function rules() {
        return [
            [['fechainicio', 'fechafin', 'fechaRegistro'], 'required'],
            [['fechainicio', 'fechafin', 'fechaRegistro'], 'safe'],
            ['fechainicio', 'validarFechaInicio'],
            ['fechafin', 'validarFechaFin'],
            [['reporte'], 'string', 'max' => 240],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels() {
        return [
            'idreporte' => 'Id Reporte',
            'fechainicio' => 'Fecha de Inicio',
            'fechafin' => 'Fecha de Fin',
            'fechaRegistro' => 'Fecha de Registro',
            'reporte' => 'Dirección del Reporte',
        ];
    }

    public function validarFechaInicio($attribute, $params) {
        if (strtotime($this->fechainicio) > strtotime($this->fechafin)) {
            $this->addError($attribute, 'Fecha de Inicio Incorrecta.');
        }
    }

    public function validarFechafin($attribute, $params) {
        if (strtotime($this->fechafin) < strtotime($this->fechainicio)) {
            $this->addError($attribute, 'Fecha Fin Incorrecta.');
        }
    }

}
