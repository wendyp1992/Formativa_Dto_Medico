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
            [['usuario', 'ip', 'acceso'], 'required'],
            [['usuario', 'acceso'], 'string', 'max' => 250],
            [['ip'], 'string', 'max' => 50],
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
        ];
    }
}
