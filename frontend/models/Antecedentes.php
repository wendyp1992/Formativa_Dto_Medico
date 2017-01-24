<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "antecedentes".
 *
 * @property boolean $hb_alcohol
 * @property boolean $hb_tabaco
 * @property boolean $hb_malaAliment
 * @property boolean $hb_vidaSedent
 * @property boolean $alg_cardiaca
 * @property boolean $alg_respiratoria
 * @property boolean $alg_quirurgica
 * @property boolean $alg_traumatolog
 * @property boolean $cancer
 * @property boolean $diabetes
 * @property boolean $hipertension
 * @property boolean $tuberculosis
 * @property integer $id_paciente
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
            [['hb_alcohol', 'hb_tabaco', 'hb_malaAliment', 'hb_vidaSedent', 'alg_cardiaca', 'alg_respiratoria', 'alg_quirurgica', 'alg_traumatolog', 'cancer', 'diabetes', 'hipertension', 'tuberculosis'], 'boolean'],
            [['id_paciente'], 'required'],
            [['id_paciente'], 'integer'],
            [['id_paciente'], 'exist', 'skipOnError' => true, 'targetClass' => HistoriaClinica::className(), 'targetAttribute' => ['id_paciente' => 'id_paciente']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'hb_alcohol' => 'Hábito de Alcohol',
            'hb_tabaco' => 'Hábito de Tabaco',
            'hb_malaAliment' => 'Hábito de Mala Alimentación',
            'hb_vidaSedent' => 'Hábito de Vida Sedentaria',
            'alg_cardiaca' => 'Alergia Cardiaca',
            'alg_respiratoria' => 'Alergia Respiratoria',
            'alg_quirurgica' => 'Alergia Quirurgica',
            'alg_traumatolog' => 'Alergia Traumatolog',
            'cancer' => '¿Tiene Cancer?',
            'diabetes' => '¿Tiene Diabetes?',
            'hipertension' => '¿Tiene Hipertension?',
            'tuberculosis' => '¿Tiene Tuberculosis?',
            'id_paciente' => 'Id del Paciente',
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
