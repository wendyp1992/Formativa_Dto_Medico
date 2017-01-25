<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel frontend\models\SearchAntecedentes */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Antecedentes';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="antecedentes-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Antecedentes', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id_paciente',
            'alergica',
            'respiratoria',
            'traumatologica',
            'cardiaca',
            // 'quirurgica',
            // 'familiar_tipo',
            // 'enfermedad_familiar',
            // 'tabaco:boolean',
            // 'alcohol:boolean',
            // 'alimentacion:boolean',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
