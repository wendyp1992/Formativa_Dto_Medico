<?php

use yii\widgets\DetailView;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\RecetaDetalle */

echo Html::a('<i class="glyphicon glyphicon-print"></i> Imprimir Receta', ['reportes', 'id_cita'=>$_GET['id_cita']], [
    'class'=>'btn pull-right', 
    'target'=>'_blank', 
    'data-toggle'=>'tooltip', 
    'title'=>'Imprimir Receta'
]);
?>

<div class="receta-detalle-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id_cita',
            'id_medicamento',
            'cantidad_med',
            'indicaciones:ntext',
            'observacion:ntext',
        ],
    ]) ?>

</div>
