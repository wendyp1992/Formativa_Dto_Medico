<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Medicamentos */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="medicamentos-form">
    <div class="row">
        <?php $form = ActiveForm::begin(); ?>
        <div class="col-md-4">
            <?= $form->field($model, 'codigo_med')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'nombre_med')->textInput(['maxlength' => true]) ?></div>
        <div class="col-md-4">
            <?=
            $form->field($model, 'tipo_med')->dropDownList(['ANTIBIOTICOS' => 'ANTIBIOTICOS', 'AMINOGLUCOSIDOS' => 'AMINOGLUCOSIDOS', 'ANESTESICOS' => 'ANESTESICOS'], ['maxlength' => true])
            ?></div>
        <div class="col-md-4">
            <?=
            $form->field($model, 'fecha_caduc')->widget(kartik\date\DatePicker::classname(), [
                'name' => 'check_date',
                'options' => ['placeholder' => 'Fecha Caducidad'],
                'removeButton' => false,
                'pluginOptions' => [
                    'autoclose' => true,
                    'format' => 'mm/dd/yyyy',
                    'style' => 'width:150px',
                ]
            ])
            ?>

            <?= $form->field($model, 'cantidad_med')->textInput() ?></div>
        <div class="col">
        </div>
        <div class="col-md-8">
            <?= $form->field($model, 'descripcion')->textarea(['rows' => 6]) ?></div>
        <?= $form->field($model, 'fecha_regMedic')->textInput(['type' => "hidden", 'value' => date('Y-m-d h:m:s')])->label('') ?>

    </div> 
    <?php if (!Yii::$app->request->isAjax) { ?>
        <div class="form-group">
            <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        </div>
    <?php } ?>

    <?php ActiveForm::end(); ?>

</div>
