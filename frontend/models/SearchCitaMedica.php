<?php

namespace frontend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\CitaMedica;

/**
 * SearchCitaMedica represents the model behind the search form about `app\models\CitaMedica`.
 */
class SearchCitaMedica extends CitaMedica
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['doctor', 'id_cita', 'temperatura', 'peso', 'id_paciente'], 'integer'],
            [['frc_cardiaca', 'revision_fisica', 'sintomas', 'diagnostico_exFisicos', 'diagnostico', 'fecha_cita', 'tratamiento_sm', 'presion_arterial', 'tipo_atencion'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = CitaMedica::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'doctor' => $this->doctor,
            'id_cita' => $this->id_cita,
            'temperatura' => $this->temperatura,
            'peso' => $this->peso,
            'id_paciente' => $this->id_paciente,
            'fecha_cita' => $this->fecha_cita,
        ]);

        $query->andFilterWhere(['like', 'frc_cardiaca', $this->frc_cardiaca])
            ->andFilterWhere(['like', 'revision_fisica', $this->revision_fisica])
            ->andFilterWhere(['like', 'sintomas', $this->sintomas])
            ->andFilterWhere(['like', 'diagnostico_exFisicos', $this->diagnostico_exFisicos])
            ->andFilterWhere(['like', 'diagnostico', $this->diagnostico])
            ->andFilterWhere(['like', 'tratamiento_sm', $this->tratamiento_sm])
            ->andFilterWhere(['like', 'presion_arterial', $this->presion_arterial])
            ->andFilterWhere(['like', 'tipo_atencion', $this->tipo_atencion]);

        return $dataProvider;
    }
}
