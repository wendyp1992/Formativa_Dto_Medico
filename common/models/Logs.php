<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "logs".
 *
 * @property integer $id
 * @property string $usuario
 * @property string $ip
 * @property string $acceso
 * @property string $fecha
 */
class Logs extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'logs';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['usuario', 'ip', 'acceso','fecha'], 'required'],
            [['usuario', 'ip', 'acceso','fecha'], 'string'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'usuario' => 'Usuario',
            'ip' => 'Ip',
            'acceso' => 'Acceso',
            'fecha' => 'Fecha',
        ];
    }
}
