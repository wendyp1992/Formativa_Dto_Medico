<?php

namespace frontend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Examen;

/**
 * ExamenSearch represents the model behind the search form about `app\models\Examen`.
 */
class ExamenSearch extends Examen
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['idExamen'], 'integer'],
            [['categoria', 'nom_examen'], 'safe'],
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
        $query = Examen::find();

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
            'idExamen' => $this->idExamen,
        ]);

        $query->andFilterWhere(['like', 'categoria', $this->categoria])
            ->andFilterWhere(['like', 'nom_examen', $this->nom_examen]);

        return $dataProvider;
    }
}
