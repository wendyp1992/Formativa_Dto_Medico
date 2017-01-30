<?php

namespace app\models;

use Yii;
use \yii\db\Query;
use yii\helpers\ArrayHelper;
/**
 * This is the model class for table "examen_historia_clinica".
 *
 * @property integer $IdExamenHistoria
 * @property integer $id_paciente
 * @property string $idTiposExamen
 * @property string $indicacion
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
            [['id_paciente', 'idTiposExamen', 'indicacion'], 'required'],
            [['id_paciente'], 'integer'],
            //[['idTiposExamen', 'indicacion'], 'string'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'IdExamenHistoria' => 'Id Examen Historia',
            'id_paciente' => 'Id Paciente',
            'idTiposExamen' => 'Id Tipos Examen',
            'indicacion' => 'Indicacion',
        ];
    }
     public function getExamenes() {
        $query = new Query();
        $query->select('*')
                ->from('examen');
        $model = $query->createCommand()->queryAll();
        return ArrayHelper::map($model, 'idExamen', 'nom_examen');
    }
     public function getTiposExamenes($resp) {
        $query = new \yii\db\Query();
        $query->select(['examen.*', 'nom_examen', 'idExamen'])
                ->from('examen')->where(['idExamen' => $resp]);
        $cmd = $query->createCommand();
        $levels = $cmd->queryAll();
        $textResp = '';
        foreach ($levels as $responsable):
            $textResp.="(" . $responsable['nom_examen'] . ") ";
        endforeach;
        return $textResp;
    }

    public function getIndicaciones($id) {
                $dataProvider = new ActiveDataProvider([
            'query' => Indicaciones::find(['idExamenHistoriaClinica' => $id]),
        ]);
            return $dataProvider;
    }
    public function getPacientes() {
        $query = new Query();
        $query->select('*')
                ->from('paciente');
        $model = $query->createCommand()->queryAll();
        return ArrayHelper::map($model, 'id_paciente', 'cedula');
    }
}
