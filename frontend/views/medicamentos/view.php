<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Medicamentos */
?>
<div class="medicamentos-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id_medicamento',
            'codigo_med',
            'nombre_med',
            'tipo_med',
            'descripcion:ntext',
            'fecha_caduc',
            'cantidad_med',
            'fecha_regMedic',
        ],
    ]) ?>

</div>
