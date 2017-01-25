<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Antecedentes */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="antecedentes-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id_paciente')->textInput() ?>

    <?= $form->field($model, 'alergica')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'respiratoria')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'traumatologica')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cardiaca')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'quirurgica')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'familiar_tipo')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'enfermedad_familiar')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'tabaco')->checkbox() ?>

    <?= $form->field($model, 'alcohol')->checkbox() ?>

    <?= $form->field($model, 'alimentacion')->checkbox() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
