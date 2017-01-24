<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\HistoriaClinica */
?>
<div class="historia-clinica-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'num_historia',
            'tipo_sangre',
            'fecha_regHistoria',
            'id_paciente',
        ],
    ]) ?>

</div>
