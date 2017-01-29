<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel frontend\models\CertificadoMedicoSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'COPIAS DE CERTIFICADOS MÉDICOS';
?>
<div class="certificado-medico-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'id',
            'identificacion_persona',
            'tipo_certificado',
            //'detalle',

            ['class' => 'yii\grid\ActionColumn'],
            [
            'class' => yii\grid\ActionColumn::className(),
            'template' => '{copia_certificado}',
            'buttons' => [
                'copia_certificado' => function ($url, $model, $key) {
                    return Html::a('<span class="glyphicon glyphicon-file"></span> Copia Certificado', ['reporte', 'id' => $model->id], ['title' => 'Crear nuevo Dependientes', 'class' => 'btn btn-warning', 'target' => '_blank']);
                },
                    ]
                ]
            ],
    ]); ?>
</div>
