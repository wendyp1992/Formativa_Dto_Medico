<?php

namespace app\models;

use Yii;
use yii\helpers\ArrayHelper;
/**
 * This is the model class for table "examen".
 *
 * @property integer $idExamen
 * @property string $categoria
 * @property string $nom_examen
 *
 * @property ExamenHistoriaClinica[] $examenHistoriaClinicas
 * @property HistoriaClinica[] $idPacientes
 */
class Examen extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'examen';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['categoria', 'nom_examen'], 'string', 'max' => 40],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'idExamen' => 'Id Examen',
            'categoria' => 'Categoria',
            'nom_examen' => 'Nom Examen',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getExamenHistoriaClinicas()
    {
        return $this->hasMany(ExamenHistoriaClinica::className(), ['idExamen' => 'idExamen']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdPacientes()
    {
        return $this->hasMany(HistoriaClinica::className(), ['id_paciente' => 'id_paciente'])->viaTable('examen_historia_clinica', ['idExamen' => 'idExamen']);
    }
}
