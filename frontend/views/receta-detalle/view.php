<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\RecetaDetalle */
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
