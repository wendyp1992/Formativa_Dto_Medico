<?php

namespace app\models;

use Yii;
use \yii\db\Query;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "examen_historia_clinica".
 *
 * @property integer $idExamen
 * @property integer $id_paciente
 * @property string $indicaciones
 *
 * @property Examen $idExamen0
 * @property HistoriaClinica $idPaciente
 */
class ExamenHistoriaClinica extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'examen_historia_clinica';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['idExamen', 'id_paciente'], 'required'],
            [['idExamen', 'id_paciente'], 'integer'],
            [['indicaciones'], 'string'],
            [['idExamen'], 'exist', 'skipOnError' => true, 'targetClass' => \common\models\Examen::className(), 'targetAttribute' => ['idExamen' => 'idExamen']],
            [['id_paciente'], 'exist', 'skipOnError' => true, 'targetClass' => HistoriaClinica::className(), 'targetAttribute' => ['id_paciente' => 'id_paciente']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'idExamen' => 'Id Examen',
            'id_paciente' => 'Id Paciente',
            'indicaciones' => 'Indicaciones',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
   
     public function getExamenes() {
        $query = new Query();
        $query->select('*')
                ->from('examen');
        $model = $query->createCommand()->queryAll();
        return ArrayHelper::map($model, 'idExamen', 'nom_examen');
    }
    public function getPacientes() {
        $query = new Query();
        $query->select('*')
                ->from('paciente');
        $model = $query->createCommand()->queryAll();
        return ArrayHelper::map($model, 'id_paciente', 'cedula');
    }
}

