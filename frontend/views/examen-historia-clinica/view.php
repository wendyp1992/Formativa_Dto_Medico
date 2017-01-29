<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\ExamenHistoriaClinica */
?>
<div class="examen-historia-clinica-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'IdExamenHistoria',
            'idExamen',
            'id_paciente',
        ],
    ]) ?>

</div>
