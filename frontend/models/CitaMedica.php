<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "cita_medica".
 *
 * @property string $doctor
 * @property integer $id_cita
 * @property double $temperatura
 * @property double $peso
 * @property string $frc_cardiaca
 * @property string $revision_fisica
 * @property string $sintomas
 * @property string $diagnostico_exFisicos
 * @property string $diagnostico
 * @property integer $id_paciente
 * @property string $fecha_cita
 * @property string $tratamiento_sm
 * @property string $presion_arterial
 * @property string $tipo_atencion
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
            [['doctor', 'id_paciente'], 'required'],
            [['temperatura', 'peso'], 'number'],
            [['revision_fisica', 'sintomas', 'diagnostico_exFisicos', 'diagnostico', 'tratamiento_sm'], 'string'],
            [['id_paciente'], 'integer'],
            [['fecha_cita'], 'safe'],
            [['doctor'], 'string', 'max' => 20],
            [['frc_cardiaca', 'tipo_atencion'], 'string', 'max' => 40],
            [['presion_arterial'], 'string', 'max' => 30],
            [['id_paciente'], 'exist', 'skipOnError' => true, 'targetClass' => Paciente::className(), 'targetAttribute' => ['id_paciente' => 'id_paciente']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        
        return [
            'doctor' => 'Doctor',
            'id_cita' => 'Id Cita',
            'temperatura' => 'Temperatura º',
            'peso' => 'Peso Kg',
            'frc_cardiaca' => 'Frecuencia Cardiaca',
            'revision_fisica' => 'Exámen Físico',
            'sintomas' => 'Cuadro Clínico',
            'diagnostico_exFisicos' => 'Exámenes Complementarios',
            'diagnostico' => 'Diagnóstico',
            'id_paciente' => '# Historia Clínica',
            'fecha_cita' => 'Fecha Cita:',
            'tratamiento_sm' => 'Tratamiento',
            'presion_arterial' => 'Presion Arterial',
            'tipo_atencion' => 'Tipo Atención',
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
