<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\grid\GridView;
use yii\widgets\DetailView;
use yii\data\ArrayDataProvider;

/* @var $this yii\web\View */
/* @var $model app\models\Paciente */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="paciente-form">

    <?php $form = ActiveForm::begin(); ?>
    <?= $form->field($model, 'tipo_paciente')->dropDownList(['ninguno' => 'ninguno', 'estudiantes' => 'estudiantes', 'Trabajador' => 'Trabajador/a'], ['id'=>'selec', 'style'=>'width:300px']) ?>
 <?= $form->field($model, 'cedula')->textInput(['maxlength' => true, 'style'=>'width:300px','readonly' => ($model->tipo_paciente=='estudiantes') ? true : false]) ?> <!--    ['disabled' => ($model->tipo_paciente=='estudiantes') ? 'disabled' : false]-->
    <?= $form->field($model, 'num_matricula')->textInput(['maxlength' => true,'id'=>'matricula','style'=>'width:300px']) ?>

    <?= $form->field($model, 'fecha_regPaciente')->textInput(['type' => "hidden", 'value' => date('Y-m-d H:i'),'style'=>'width:300px'])->label(" ") ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Create', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>
    <?php ActiveForm::end(); ?>


</div>


