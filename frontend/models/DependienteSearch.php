<?php

namespace frontend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Dependiente;

/**
 * DependienteSearch represents the model behind the search form about `app\models\Dependiente`.
 */
class DependienteSearch extends Dependiente
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cedula', 'fecha_regDependiente', 'nombres', 'apellidos', 'fecha_nac', 'estado_civil', 'cedula_trab'], 'safe'],
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
        $query = Dependiente::find();

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
            'fecha_regDependiente' => $this->fecha_regDependiente,
            'id_paciente' => $this->id_paciente,
        ]);

        $query->andFilterWhere(['like', 'cedula', $this->cedula])
            ->andFilterWhere(['like', 'nombres', $this->nombres])
            ->andFilterWhere(['like', 'apellidos', $this->apellidos])
            ->andFilterWhere(['like', 'fecha_nac', $this->fecha_nac])
            ->andFilterWhere(['like', 'estado_civil', $this->estado_civil])
            ->andFilterWhere(['like', 'cedula_trab', $this->cedula_trab]);

        return $dataProvider;
    }
}
