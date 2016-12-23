<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\HistoriaClinica */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="historia-clinica-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'num_historia')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'tipo_sangre')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'fecha_regHistoria')->textInput() ?>

    <?= $form->field($model, 'id_paciente')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
