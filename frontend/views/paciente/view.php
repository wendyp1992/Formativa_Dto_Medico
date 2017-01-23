<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Paciente */
?>
<div class="paciente-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id_paciente',
            'cedula',
            'tipo_paciente',
            'fecha_regPaciente',
            'num_matricula',
        ],
    ]) ?>

</div>
