<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model frontend\models\SearchAntecedentes */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="antecedentes-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id_paciente') ?>

    <?= $form->field($model, 'alergica') ?>

    <?= $form->field($model, 'respiratoria') ?>

    <?= $form->field($model, 'traumatologica') ?>

    <?= $form->field($model, 'cardiaca') ?>

    <?php // echo $form->field($model, 'quirurgica') ?>

    <?php // echo $form->field($model, 'familiar_tipo') ?>

    <?php // echo $form->field($model, 'enfermedad_familiar') ?>

    <?php // echo $form->field($model, 'tabaco')->checkbox() ?>

    <?php // echo $form->field($model, 'alcohol')->checkbox() ?>

    <?php // echo $form->field($model, 'alimentacion')->checkbox() ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
