<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "doctor".
 *
 * @property string $nombres
 * @property string $apellidos
 * @property string $direccion
 * @property string $mobil
 * @property integer $id_user
 *
 * @property User $idUser
 */
class Doctor extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'doctor';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_user'], 'required'],
            [['id_user'], 'integer'],
            [['nombres', 'apellidos', 'direccion'], 'string', 'max' => 40],
            [['mobil'], 'string', 'max' => 10],
            [['id_user'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['id_user' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'nombres' => 'Nombres',
            'apellidos' => 'Apellidos',
            'direccion' => 'Direccion',
            'mobil' => 'Mobil',
            'id_user' => 'Id User',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdUser()
    {
        return $this->hasOne(User::className(), ['id' => 'id_user']);
    }
}
