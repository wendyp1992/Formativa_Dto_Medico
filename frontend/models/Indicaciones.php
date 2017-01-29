<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "indicaciones".
 *
 * @property integer $idIndicacion
 * @property integer $idExamenHistoria
 * @property string $indicacion
 */
class Indicaciones extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'indicaciones';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [[/*'idExamenHistoria',*/ 'indicacion'], 'required'],
            [['idExamenHistoria'], 'integer'],
            [['indicacion'], 'string'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'idIndicacion' => 'Id Indicacion',
            'idExamenHistoria' => 'Id Examen Historia',
            'indicacion' => 'Indicacion',
        ];
    }
}
