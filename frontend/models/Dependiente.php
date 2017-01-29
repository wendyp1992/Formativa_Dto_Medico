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
 *
 * @property Paciente $idPaciente
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
            [['cedula', 'nombres', 'apellidos', 'id_paciente', 'cedula_trab'], 'required'],
            [['fecha_regDependiente'], 'safe'],
            [['id_paciente'], 'integer'],
            [['cedula', 'cedula_trab'], 'string', 'max' => 10],
            [['nombres', 'apellidos', 'fecha_nac', 'estado_civil'], 'string', 'max' => 40],
            [['cedula'], 'unique'],
            [['id_paciente'], 'exist', 'skipOnError' => true, 'targetClass' => Paciente::className(), 'targetAttribute' => ['id_paciente' => 'id_paciente']],
            ['fecha_nac', 'validarFechaNacimiento'],
            ['cedula', 'validarCedula'],
            ['estado_civil', 'validarEdad'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels() {
        return [
            'cedula' => 'Cedula',
            'fecha_regDependiente' => 'Fecha Registro Dependiente',
            'nombres' => 'Nombres',
            'apellidos' => 'Apellidos',
            'fecha_nac' => 'Fecha Nacimiento',
            'estado_civil' => 'Estado Civil',
            'id_paciente' => 'Id Paciente',
            'cedula_trab' => 'Cedula Trabajador',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdPaciente() {
        return $this->hasOne(Paciente::className(), ['id_paciente' => 'id_paciente']);
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
