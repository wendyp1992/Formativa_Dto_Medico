<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "dependiente".
 *
 * @property string $cedula
 * @property string $fecha_regDependiente
 * @property string $nombres
 * @property string $apellidos
 * @property string $fecha_nac
 * @property string $estado_civil
 * @property integer $id_paciente
 * @property string $cedula_trab
 */
class Dependiente extends \yii\db\ActiveRecord {

    /**
     * @inheritdoc
     */
    public static function tableName() {
        return 'dependiente';
    }

    /**
     * @inheritdoc
     */
    public function rules() {

        return [
            [['fecha_regDependiente'], 'safe'],
            [['id_paciente', 'cedula_trab'], 'required'],
            [['id_paciente'], 'integer'],
            ['fecha_nac', 'validarFechaNacimiento'],
            ['cedula', 'validarCedula'],
            ['estado_civil', 'validarEdad'],
            [['cedula', 'cedula_trab'], 'string', 'max' => 10],
            [['nombres', 'apellidos', 'fecha_nac', 'estado_civil'], 'string', 'max' => 40],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels() {
        return [
            'cedula' => 'Cedula',
            'fecha_regDependiente' => 'Fecha Reg Dependiente',
            'nombres' => 'Nombres',
            'apellidos' => 'Apellidos',
            'fecha_nac' => 'Fecha Nac',
            'estado_civil' => 'Estado Civil',
            'id_paciente' => 'Id Paciente',
            'cedula_trab' => 'Cedula Trab',
        ];
    }

    public function validarFechaNacimiento($attribute, $params) {
        if (strtotime($this->fecha_nac) > strtotime($this->fecha_regDependiente)) {
            $this->addError($attribute, 'Fecha de Nacimiento no válida.');
        }
    }

    public function validarCedula($attribute, $params) {
        include("../../frontend/validadores/php/ValidarIdentificacion.php");
        $validador = new \ValidarIdentificacion();
        if (!$validador->validarCedula($this->cedula)) {
            $this->addError($attribute, 'Numero de Identificación no válida.');
        }
    }

    public function validarEdad($attribute, $params) {
        include("../../frontend/validadores/php/edad.php");
        $edad = new \edad();

        if (!$edad->estdoCivil($this->fecha_nac)) {
            $this->addError($attribute, 'Error');
        }
    }

}
