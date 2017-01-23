<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\HistoriaClinica */

$this->title = 'Update Historia Clinica: ' . $model->id_paciente;
$this->params['breadcrumbs'][] = ['label' => 'Historia Clinicas', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_paciente, 'url' => ['view', 'id' => $model->id_paciente]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="historia-clinica-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?=
    $this->render('_form', [
        'model' => $model,
        'antecedentes' => $antecedentes,
    ])
    ?>

</div>
