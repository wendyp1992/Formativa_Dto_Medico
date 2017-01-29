<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model frontend\models\ReportepacientesSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="reportepacientes-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'idreporte') ?>

    <?= $form->field($model, 'fechainicio') ?>

    <?= $form->field($model, 'fechafin') ?>

    <?= $form->field($model, 'fechaRegistro') ?>

    <?= $form->field($model, 'reporte') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
