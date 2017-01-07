<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\CitaMedica */
?>
<div class="cita-medica-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id_doctor',
            'id_cita',
            'presion_baja',
            'temperatura',
            'peso',
            'frc_cardiaca',
            'revision_fisica:ntext',
            'sintomas:ntext',
            'diagnostico_exFisicos:ntext',
            'diagnostico:ntext',
            'id_paciente',
            'fecha_cita',
            'tratamiento_sm:ntext',
            'presion_alta',
        ],
    ]) ?>

</div>
