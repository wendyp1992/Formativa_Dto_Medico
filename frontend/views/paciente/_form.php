<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Paciente */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="paciente-form">

    <?php $form = ActiveForm::begin(); ?>
    <?= $form->field($model, 'tipo_paciente')->dropDownList(['Estudiante' => 'Estudiante', 'Trabajador' => 'Trabajador/a']) ?>

    <?= $form->field($model, 'cedula')->textInput(['maxlength' => true]) ?>
    <?= $form->field($model, 'num_matricula')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'fecha_regPaciente')->textInput(['type' => "hidden", 'value' => date('Y-m-d H:i')])->label(" ") ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
