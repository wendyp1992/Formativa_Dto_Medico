<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "cita_medica".
 *
 * @property integer $id_doctor
 * @property integer $id_cita
 * @property integer $presion_baja
 * @property integer $temperatura
 * @property integer $peso
 * @property integer $frc_cardiaca
 * @property string $revision_fisica
 * @property string $sintomas
 * @property string $diagnostico_exFisicos
 * @property string $diagnostico
 * @property integer $id_paciente
 * @property string $fecha_cita
 * @property string $tratamiento_sm
 * @property integer $presion_alta
 *
 * @property Paciente $idPaciente
 * @property RecetaDetalle[] $recetaDetalles
 * @property Medicamentos[] $idMedicamentos
 */
class CitaMedica extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cita_medica';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_doctor', 'id_paciente', 'presion_alta'], 'required'],
            [['id_doctor', 'presion_baja', 'temperatura', 'peso', 'frc_cardiaca', 'id_paciente', 'presion_alta'], 'integer'],
            [['revision_fisica', 'sintomas', 'diagnostico_exFisicos', 'diagnostico', 'tratamiento_sm'], 'string'],
            [['fecha_cita'], 'safe'],
            [['id_paciente'], 'exist', 'skipOnError' => true, 'targetClass' => Paciente::className(), 'targetAttribute' => ['id_paciente' => 'id_paciente']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id_doctor' => 'Id Doctor',
            'id_cita' => 'Id Cita',
            'presion_baja' => 'Presion Baja',
            'temperatura' => 'Temperatura',
            'peso' => 'Peso',
            'frc_cardiaca' => 'Frc Cardiaca',
            'revision_fisica' => 'Revision Fisica',
            'sintomas' => 'Sintomas',
            'diagnostico_exFisicos' => 'Diagnostico Ex Fisicos',
            'diagnostico' => 'Diagnostico',
            'id_paciente' => 'Id Paciente',
            'fecha_cita' => 'Fecha Cita',
            'tratamiento_sm' => 'Tratamiento Sm',
            'presion_alta' => 'Presion Alta',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdPaciente()
    {
        return $this->hasOne(Paciente::className(), ['id_paciente' => 'id_paciente']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRecetaDetalles()
    {
        return $this->hasMany(RecetaDetalle::className(), ['id_cita' => 'id_cita']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdMedicamentos()
    {
        return $this->hasMany(Medicamentos::className(), ['id_medicamento' => 'id_medicamento'])->viaTable('receta_detalle', ['id_cita' => 'id_cita']);
    }
}
