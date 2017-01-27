<?php

namespace frontend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\RecetaDetalle;

/**
 * RecetaDetalleSearch represents the model behind the search form about `app\models\RecetaDetalle`.
 */
class RecetaDetalleSearch extends RecetaDetalle
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_cita', 'id_medicamento', 'cantidad_med'], 'integer'],
            [['indicaciones', 'observacion'], 'safe'],
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
        $query = RecetaDetalle::find();

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
            'id_cita' => $this->id_cita,
            'id_medicamento' => $this->id_medicamento,
            'cantidad_med' => $this->cantidad_med,
        ]);

        $query->andFilterWhere(['like', 'indicaciones', $this->indicaciones])
            ->andFilterWhere(['like', 'observacion', $this->observacion]);

        return $dataProvider;
    }
}
