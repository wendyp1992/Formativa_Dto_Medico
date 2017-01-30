<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Historia Clinicas';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="historia-clinica-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Historia Clinica', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'num_historia',
            'tipo_sangre',
            'fecha_regHistoria',
            'id_paciente',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
