<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "antecedentes".
 *
 * @property integer $id_paciente
 * @property string $alergica
 * @property string $respiratoria
 * @property string $traumatologica
 * @property string $cardiaca
 * @property string $quirurgica
 * @property string $familiar_tipo
 * @property string $enfermedad_familiar
 * @property boolean $tabaco
 * @property boolean $alcohol
 * @property boolean $alimentacion
 *
 * @property HistoriaClinica $idPaciente
 */
class Antecedentes extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'antecedentes';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_paciente'], 'required'],
            [['id_paciente'], 'integer'],
            [['tabaco', 'alcohol', 'alimentacion'], 'boolean'],
            [['alergica', 'respiratoria', 'traumatologica', 'cardiaca', 'quirurgica'], 'string', 'max' => 100],
            [['familiar_tipo', 'enfermedad_familiar'], 'string', 'max' => 50],
            [['id_paciente'], 'exist', 'skipOnError' => true, 'targetClass' => HistoriaClinica::className(), 'targetAttribute' => ['id_paciente' => 'id_paciente']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id_paciente' => 'Id Paciente',
            'alergica' => 'Enfermedad Alérgica',
            'respiratoria' => 'Enfermedad Respiratoria',
            'traumatologica' => 'Enfermedad Traumatológica',
            'cardiaca' => 'Enfermedad Cardíaca',
            'quirurgica' => 'Enfermedad Quirúrgica',
            'familiar_tipo' => 'Familiar Tipo',
            'enfermedad_familiar' => 'Enfermedad Familiar',
            'tabaco' => 'Tabaco',
            'alcohol' => 'Alcohol',
            'alimentacion' => 'Alimentación',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdPaciente()
    {
        return $this->hasOne(HistoriaClinica::className(), ['id_paciente' => 'id_paciente']);
    }
}
