<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "reportepacientes".
 *
 * @property integer $idreporte
 * @property string $fechainicio
 * @property string $fechafin
 * @property string $fechaRegistro
 * @property string $reporte
 */
class Reportepacientes extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'reportepacientes';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['fechainicio', 'fechafin', 'fechaRegistro'], 'required'],
            [['fechainicio', 'fechafin', 'fechaRegistro'], 'safe'],
            [['reporte'], 'string', 'max' => 240],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'idreporte' => 'Idreporte',
            'fechainicio' => 'Fechainicio',
            'fechafin' => 'Fechafin',
            'fechaRegistro' => 'Fecha Registro',
            'reporte' => 'Reporte',
        ];
    }
}
