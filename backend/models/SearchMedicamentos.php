<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Medicamentos;

/**
 * SearchMedicamentos represents the model behind the search form about `app\models\Medicamentos`.
 */
class SearchMedicamentos extends Medicamentos
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_medicamento', 'cantidad_med'], 'integer'],
            [['codigo_med', 'nombre_med', 'tipo_med', 'descripcion', 'fecha_caduc', 'fecha_regMedic'], 'safe'],
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
        $query = Medicamentos::find();

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
            'id_medicamento' => $this->id_medicamento,
            'fecha_caduc' => $this->fecha_caduc,
            'cantidad_med' => $this->cantidad_med,
            'fecha_regMedic' => $this->fecha_regMedic,
        ]);

        $query->andFilterWhere(['like', 'codigo_med', $this->codigo_med])
            ->andFilterWhere(['like', 'nombre_med', $this->nombre_med])
            ->andFilterWhere(['like', 'tipo_med', $this->tipo_med])
            ->andFilterWhere(['like', 'descripcion', $this->descripcion]);

        return $dataProvider;
    }
}
