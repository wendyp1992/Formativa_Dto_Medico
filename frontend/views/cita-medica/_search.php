<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model frontend\models\SearchCitaMedica */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cita-medica-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id_doctor') ?>

    <?= $form->field($model, 'id_cita') ?>

    <?= $form->field($model, 'presion_baja') ?>

    <?= $form->field($model, 'temperatura') ?>

    <?= $form->field($model, 'peso') ?>

    <?php // echo $form->field($model, 'frc_cardiaca') ?>

    <?php // echo $form->field($model, 'revision_fisica') ?>

    <?php // echo $form->field($model, 'sintomas') ?>

    <?php // echo $form->field($model, 'diagnostico_exFisicos') ?>

    <?php // echo $form->field($model, 'diagnostico') ?>

    <?php // echo $form->field($model, 'id_paciente') ?>

    <?php // echo $form->field($model, 'fecha_cita') ?>

    <?php // echo $form->field($model, 'tratamiento_sm') ?>

    <?php // echo $form->field($model, 'presion_alta') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
