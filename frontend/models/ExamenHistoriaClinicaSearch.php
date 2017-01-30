<?php

namespace frontend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\ExamenHistoriaClinica;

/**
 * ExamenHistoriaClinicaSearch represents the model behind the search form about `app\models\ExamenHistoriaClinica`.
 */
class ExamenHistoriaClinicaSearch extends ExamenHistoriaClinica
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['IdExamenHistoria', 'id_paciente'], 'integer'],
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
        $query = ExamenHistoriaClinica::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'IdExamenHistoria' => $this->IdExamenHistoria,
            'id_paciente' => $this->id_paciente,
        ]);

        return $dataProvider;
    }
}
