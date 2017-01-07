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
class Dependiente extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'dependiente';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['fecha_regDependiente'], 'safe'],
            [['id_paciente', 'cedula_trab'], 'required'],
            [['id_paciente'], 'integer'],
            [['cedula', 'cedula_trab'], 'string', 'max' => 10],
            [['nombres', 'apellidos', 'fecha_nac', 'estado_civil'], 'string', 'max' => 40],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
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
}
