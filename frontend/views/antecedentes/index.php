<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Antecedentes';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="antecedentes-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Antecedentes', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'hb_alcohol:boolean',
            'hb_tabaco:boolean',
            'hb_malaAliment:boolean',
            'hb_vidaSedent:boolean',
            'alg_cardiaca:boolean',
            // 'alg_respiratoria:boolean',
            // 'alg_quirurgica:boolean',
            // 'alg_traumatolog:boolean',
            // 'cancer:boolean',
            // 'diabetes:boolean',
            // 'hipertension:boolean',
            // 'tuberculosis:boolean',
            // 'id_paciente',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
