<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\CitaMedica */

$this->title = 'Update Cita Medica: ' . $model->id_cita;
$this->params['breadcrumbs'][] = ['label' => 'Cita Medicas', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_cita, 'url' => ['view', 'id_cita' => $model->id_cita, 'id_paciente' => $model->id_paciente]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="cita-medica-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
