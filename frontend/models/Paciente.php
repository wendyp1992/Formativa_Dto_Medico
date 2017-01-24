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
 *
 * @property CitaAgendada[] $citaAgendadas
 * @property CitaMedica[] $citaMedicas
 * @property HistoriaClinica $historiaClinica
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
            [['fecha_regPaciente'], 'safe'],
            [['cedula'], 'string', 'max' => 10],
            [['tipo_paciente', 'num_matricula'], 'string', 'max' => 40],
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

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCitaAgendadas()
    {
        return $this->hasMany(CitaAgendada::className(), ['id_paciente' => 'id_paciente']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCitaMedicas()
    {
        return $this->hasMany(CitaMedica::className(), ['id_paciente' => 'id_paciente']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getHistoriaClinica()
    {
        return $this->hasOne(HistoriaClinica::className(), ['id_paciente' => 'id_paciente']);
    }
}
