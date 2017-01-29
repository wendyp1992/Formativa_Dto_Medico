<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "certificado_medico".
 *
 * @property integer $id
 * @property string $identificacion_persona
 * @property string $tipo_certificado
 * @property string $detalle
 */
class CertificadoMedico extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'certificado_medico';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['identificacion_persona','tipo_certificado','detalle'], 'required'],
            [['tipo_certificado'], 'string'],
            [['identificacion_persona'], 'string', 'max' => 10],
            [['detalle'], 'string', 'max' => 400],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'identificacion_persona' => 'Identificacion Persona',
            'tipo_certificado' => 'Tipo Certificado',
            'detalle' => 'Detalle',
        ];
    }
}
