<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel frontend\models\SearchCitaMedica */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Cita Medicas';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cita-medica-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Cita Medica', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'doctor',
            'id_cita',
            'temperatura',
            'peso',
            'frc_cardiaca',
            // 'revision_fisica:ntext',
            // 'sintomas:ntext',
            // 'diagnostico_exFisicos:ntext',
            // 'diagnostico:ntext',
            // 'id_paciente',
            // 'fecha_cita',
            // 'tratamiento_sm:ntext',
            // 'presion_arterial',
            // 'tipo_atencion',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
