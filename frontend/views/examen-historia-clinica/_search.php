<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model frontend\models\ExamenHistoriaClinicaSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="examen-historia-clinica-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'idExamenHistoria') ?>

    <?= $form->field($model, 'id_paciente') ?>

    <?= $form->field($model, 'indicacion') ?>

    <?= $form->field($model, 'idTiposExamen') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
