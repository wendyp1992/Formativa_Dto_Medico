<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "medicamentos".
 *
 * @property integer $id_medicamento
 * @property string $codigo_med
 * @property string $nombre_med
 * @property string $tipo_med
 * @property string $descripcion
 * @property string $fecha_caduc
 * @property integer $cantidad_med
 * @property string $fecha_regMedic
 *
 * @property RecetaDetalle[] $recetaDetalles
 * @property CitaMedica[] $idCitas
 */
class Medicamentos extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'medicamentos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['descripcion'], 'string'],
            [['fecha_caduc', 'fecha_regMedic'], 'safe'],
            [['cantidad_med'], 'integer'],
            [['codigo_med', 'nombre_med', 'tipo_med'], 'string', 'max' => 40],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id_medicamento' => 'Id Medicamento',
            'codigo_med' => 'Código Medicamento',
            'nombre_med' => 'Nombre Medicamento',
            'tipo_med' => 'Tipo Medicamento',
            'descripcion' => 'Descripción',
            'fecha_caduc' => 'Fecha Caducidad',
            'cantidad_med' => 'Cantidad Medicamento',
            'fecha_regMedic' => 'Fecha Actual',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRecetaDetalles()
    {
        return $this->hasMany(RecetaDetalle::className(), ['id_medicamento' => 'id_medicamento']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdCitas()
    {
        return $this->hasMany(CitaMedica::className(), ['id_cita' => 'id_cita'])->viaTable('receta_detalle', ['id_medicamento' => 'id_medicamento']);
    }
}
