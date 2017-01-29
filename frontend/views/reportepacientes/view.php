<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Reportepacientes */
?>
<div class="reportepacientes-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'idreporte',
            'fechainicio',
            'fechafin',
            'fechaRegistro',
            'reporte',
        ],
    ]) ?>

</div>
