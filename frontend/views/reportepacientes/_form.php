<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Reportepacientes */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="reportepacientes-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <div class="col-md-6">

            <?=
            $form->field($model, 'fechainicio')->widget(kartik\date\DatePicker::classname(), [
                'options' => ['placeholder' => 'Fecha Inicio'],
                'pluginOptions' => [
                    'autoclose' => true,
                    'todayHighlight' => TRUE,
                    'format' => 'yyyy-mm-dd',
                    'style' => 'width:200px',
                ]
            ])
            ?></div>
        <div class="col-md-6">

            <?=
            $form->field($model, 'fechafin')->widget(kartik\date\DatePicker::classname(), [
                'options' => ['placeholder' => 'Fecha Final'],
                'pluginOptions' => [
                    'autoclose' => true,
                    'todayHighlight' => TRUE,
                    'format' => 'yyyy-mm-dd',
                    'style' => 'width:200px',
                ]
            ])
            ?>
        </div>
    </div>
    <?= $form->field($model, 'fechaRegistro')->textInput(['type' => "hidden", 'value' => date('Y-m-d h:m:s')])->label('') ?>

    <?= $form->field($model, 'reporte')->textInput(['maxlength' => true, 'type' => "hidden"])->label('') ?>


    <?php if (!Yii::$app->request->isAjax) { ?>
        <div class="form-group">
            <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        </div>
    <?php } ?>

    <?php ActiveForm::end(); ?>

</div>
