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
            'hb_alcohol' => 'Hb Alcohol',
            'hb_tabaco' => 'Hb Tabaco',
            'hb_malaAliment' => 'Hb Mala Aliment',
            'hb_vidaSedent' => 'Hb Vida Sedent',
            'alg_cardiaca' => 'Alg Cardiaca',
            'alg_respiratoria' => 'Alg Respiratoria',
            'alg_quirurgica' => 'Alg Quirurgica',
            'alg_traumatolog' => 'Alg Traumatolog',
            'cancer' => 'Cancer',
            'diabetes' => 'Diabetes',
            'hipertension' => 'Hipertension',
            'tuberculosis' => 'Tuberculosis',
            'id_paciente' => 'Id Paciente',
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
