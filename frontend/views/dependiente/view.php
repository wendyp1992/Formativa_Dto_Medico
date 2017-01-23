<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Dependiente */
?>
<div class="dependiente-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'cedula',
            'fecha_regDependiente',
            'id_paciente',
            'nombres',
            'apellidos',
            'fecha_nac',
            'estado_civil',
        ],
    ]) ?>

</div>
