<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "paciente".
 *
 * @property integer $id_paciente
 * @property string $cedula
 * @property string $tipo_paciente
 * @property string $fecha_regPaciente
 * @property string $num_matricula
 */
class Paciente extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'paciente';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['tipo_paciente'], 'required'],
            [['fecha_regPaciente'], 'safe'],
            [['cedula'], 'string', 'max' => 10],
            [['tipo_paciente', 'num_matricula'], 'string', 'max' => 40],
            [['cedula'], 'unique'],
            [['num_matricula'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id_paciente' => 'Id Paciente',
            'cedula' => 'Cedula',
            'tipo_paciente' => 'Tipo Paciente',
            'fecha_regPaciente' => 'Fecha Reg Paciente',
            'num_matricula' => 'Num Matricula',
        ];
    }
}
