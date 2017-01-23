<?php

namespace frontend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\HistoriaClinica;

/**
 * HistoriaClinicaSearch represents the model behind the search form about `app\models\HistoriaClinica`.
 */
class HistoriaClinicaSearch extends HistoriaClinica
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['num_historia', 'tipo_sangre', 'fecha_regHistoria'], 'safe'],
            [['id_paciente'], 'integer'],
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
        $query = HistoriaClinica::find();

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
            'fecha_regHistoria' => $this->fecha_regHistoria,
            'id_paciente' => $this->id_paciente,
        ]);

        $query->andFilterWhere(['like', 'num_historia', $this->num_historia])
            ->andFilterWhere(['like', 'tipo_sangre', $this->tipo_sangre]);

        return $dataProvider;
    }
}
