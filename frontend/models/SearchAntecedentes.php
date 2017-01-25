<?php

namespace frontend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Antecedentes;

/**
 * SearchAntecedentes represents the model behind the search form about `app\models\Antecedentes`.
 */
class SearchAntecedentes extends Antecedentes
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_paciente'], 'integer'],
            [['alergica', 'respiratoria', 'traumatologica', 'cardiaca', 'quirurgica', 'familiar_tipo', 'enfermedad_familiar'], 'safe'],
            [['tabaco', 'alcohol', 'alimentacion'], 'boolean'],
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
        $query = Antecedentes::find();

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
            'id_paciente' => $this->id_paciente,
            'tabaco' => $this->tabaco,
            'alcohol' => $this->alcohol,
            'alimentacion' => $this->alimentacion,
        ]);

        $query->andFilterWhere(['like', 'alergica', $this->alergica])
            ->andFilterWhere(['like', 'respiratoria', $this->respiratoria])
            ->andFilterWhere(['like', 'traumatologica', $this->traumatologica])
            ->andFilterWhere(['like', 'cardiaca', $this->cardiaca])
            ->andFilterWhere(['like', 'quirurgica', $this->quirurgica])
            ->andFilterWhere(['like', 'familiar_tipo', $this->familiar_tipo])
            ->andFilterWhere(['like', 'enfermedad_familiar', $this->enfermedad_familiar]);

        return $dataProvider;
    }
}
