<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "historia_clinica".
 *
 * @property string $num_historia
 * @property string $tipo_sangre
 * @property string $fecha_regHistoria
 * @property integer $id_paciente
 *
 * @property Antecedentes $antecedentes
 * @property ExamenHistoriaClinica[] $examenHistoriaClinicas
 * @property Examen[] $idExamens
 * @property Paciente $idPaciente
 */
class HistoriaClinica extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'historia_clinica';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['fecha_regHistoria'], 'safe'],
            [['id_paciente'], 'required'],
            [['id_paciente'], 'integer'],
            [['num_historia'], 'string', 'max' => 10],
            [['tipo_sangre'], 'string', 'max' => 5],
            [['id_paciente'], 'exist', 'skipOnError' => true, 'targetClass' => Paciente::className(), 'targetAttribute' => ['id_paciente' => 'id_paciente']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'num_historia' => 'Num Historia',
            'tipo_sangre' => 'Tipo Sangre',
            'fecha_regHistoria' => 'Fecha Reg Historia',
            'id_paciente' => 'Id Paciente',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAntecedentes()
    {
        return $this->hasOne(Antecedentes::className(), ['id_paciente' => 'id_paciente']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getExamenHistoriaClinicas()
    {
        return $this->hasMany(ExamenHistoriaClinica::className(), ['id_paciente' => 'id_paciente']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdExamens()
    {
        return $this->hasMany(Examen::className(), ['idExamen' => 'idExamen'])->viaTable('examen_historia_clinica', ['id_paciente' => 'id_paciente']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdPaciente()
    {
        return $this->hasOne(Paciente::className(), ['id_paciente' => 'id_paciente']);
    }
}
