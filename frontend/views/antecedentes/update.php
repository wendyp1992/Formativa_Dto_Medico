<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Antecedentes */

$this->title = 'Update Antecedentes: ' . $model->id_paciente;
$this->params['breadcrumbs'][] = ['label' => 'Antecedentes', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_paciente, 'url' => ['view', 'id' => $model->id_paciente]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="antecedentes-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
