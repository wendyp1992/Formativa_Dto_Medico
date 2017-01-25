<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\date\DatePicker;

/* @var $this yii\web\View */
/* @var $model app\models\Dependiente */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="dependiente-form">
    <center><b><p class="lead">REGISTRO DEPENDIENTE</p></b></center>
    <div class="form-group col-md-12">
        <?php $form = ActiveForm::begin(['id' => 'paciente']); ?>
        <?= $form->field($modelP, 'cedula')->textInput(['maxlength' => true, 'id' => 'cedula'])->label('Cedula del Trabajador') ?>
        <?= Html::button('Buscar', ['class' => 'btn btn-primary', 'type' => "submit"]) ?>
        <?php ActiveForm::end(); ?>
    </div>
    <div class="form-group col-md-12">
        <h3>Responsable</h3>
    </div>
    <div class="form-group col-md-2"> 
        <?= $form->field($modelP, 'id_paciente')->textInput(['readonly' => true, 'value' => $dataProvider->allModels[0]['idTrabajador']])->label('Id') ?>
    </div>
    <div class="form-group col-md-5"> 
        <?= $form->field($modelP, 'cedula')->textInput(['maxlength' => true, 'readonly' => true, 'value' => $dataProvider->allModels[0]['nombres']])->label("Nombres") ?>
    </div> 
    <div class="form-group col-md-5"> 
        <?= $form->field($modelP, 'cedula')->textInput(['maxlength' => true, 'readonly' => true, 'value' => $dataProvider->allModels[0]['apellidos']])->label("Apellidos") ?>
    </div>
    <div class="form-group col-md-5"> 
        <?= $form->field($modelP, 'cedula')->textInput(['maxlength' => true, 'readonly' => true, 'value' => $dataProvider->allModels[0]['cedula']])->label("Cedula") ?>
    </div> 
    <div class="form-group col-md-7"> 
        <?= $form->field($modelP, 'cedula')->textInput(['maxlength' => true, 'readonly' => true, 'value' => $dataProvider->allModels[0]['CargoInstitucional'] . ' / ' . $dataProvider->allModels[0]['departamento']])->label("Cargo Institucional / Departamento") ?>
    </div>

    <center><b><p class="lead">INFORMACION PERSONAL PACIENTE</p></b></center>

    <?php $form = ActiveForm::begin(); ?>
    <div class="form-group col-md-4"> 
        <?= $form->field($model, 'cedula')->textInput(['maxlength' => true, 'style' => 'width:300px']) ?>
    </div>
    <div class="form-group col-md-4"> 
        <?= $form->field($model, 'nombres')->textInput(['maxlength' => true, 'style' => 'width:300px'])->label('Nombres') ?>
    </div>    <div class="form-group col-md-4"> 

        <?= $form->field($model, 'apellidos')->textInput(['maxlength' => true, 'style' => 'width:300px'])->label('Apellidos') ?>
    </div>
    <div class="form-group col-md-4"> 

        <?=
        $form->field($model, 'fecha_nac')->widget(kartik\date\DatePicker::classname(), [
            'options' => ['placeholder' => 'Fecha de nacimiento ...'],
            'pluginOptions' => [
                'autoclose' => true,
                'todayHighlight' => TRUE,
                'format' => 'yyyy-mm-dd',
                'style' => 'width:300px',
            ]
        ])
        ?></div>

    <!--controlar estado civil-->
    <div class="form-group col-md-4"> 
        <?=
        $form->field($model, 'estado_civil')->dropDownList(['Soltero' => 'Soltero/a', 'Casado' => 'Casado/a', 'Viudo' => 'Viudo/a',
            'Divorciado' => 'Divorciado/a', 'Union Libre' => 'Unión Libre'], ['maxlength' => true])->label('Estado Civil')
        ?></div>
    <?= $form->field($model, 'id_paciente')->textInput(['type' => "hidden"])->label('') ?>
    <?= $form->field($model, 'fecha_regDependiente')->textInput(['type' => "hidden", 'value' => date('Y-m-d h:m:s')])->label('') ?>
    <?= $form->field($model, 'cedula_trab')->textInput(['maxlength' => true, 'type' => "hidden"])->label('') ?>


    <?php if (!Yii::$app->request->isAjax) { ?>
        <div class="form-group">
            <?= Html::submitButton($model->isNewRecord ? 'Guardar' : 'Guardar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        </div>
    <?php } ?>

    <?php ActiveForm::end(); ?>

</div>