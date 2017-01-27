<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "receta_detalle".
 *
 * @property integer $id_cita
 * @property integer $id_medicamento
 * @property integer $cantidad_med
 * @property string $indicaciones
 * @property string $observacion
 *
 * @property CitaMedica $idCita
 * @property Medicamentos $idMedicamento
 */
class RecetaDetalle extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'receta_detalle';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_cita', 'id_medicamento', 'cantidad_med', 'indicaciones'], 'required'],
            [['id_cita', 'id_medicamento', 'cantidad_med'], 'integer'],
            [['indicaciones', 'observacion'], 'string'],
            [['id_cita'], 'exist', 'skipOnError' => true, 'targetClass' => CitaMedica::className(), 'targetAttribute' => ['id_cita' => 'id_cita']],
            [['id_medicamento'], 'exist', 'skipOnError' => true, 'targetClass' => Medicamentos::className(), 'targetAttribute' => ['id_medicamento' => 'id_medicamento']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id_cita' => 'ID',
            'id_medicamento' => 'Medicamento',
            'cantidad_med' => 'Cantidad',
            'indicaciones' => 'Indicaciones',
            'observacion' => 'Observaciones',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdCita()
    {
        return $this->hasOne(CitaMedica::className(), ['id_cita' => 'id_cita']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdMedicamento()
    {
        return $this->hasOne(Medicamentos::className(), ['id_medicamento' => 'id_medicamento']);
    }
}
