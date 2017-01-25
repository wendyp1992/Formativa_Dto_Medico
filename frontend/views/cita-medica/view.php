<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\CitaMedica */

$this->title = $model->id_cita;
$this->params['breadcrumbs'][] = ['label' => 'Cita Medicas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cita-medica-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id_cita' => $model->id_cita, 'id_paciente' => $model->id_paciente], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id_cita' => $model->id_cita, 'id_paciente' => $model->id_paciente], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'doctor',
            'id_cita',
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
            'presion_arterial',
            'tipo_atencion',
        ],
    ]) ?>

</div>
