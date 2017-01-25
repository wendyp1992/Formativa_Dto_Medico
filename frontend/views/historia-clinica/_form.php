<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\HistoriaClinica */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="historia-clinica-form">
    <center><h2>HISTORIA CLÍNICA DEL PACIENTE</h2></center>
    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <div class="col-md-4">
            <?= $form->field($model, 'id_paciente')->textInput(['readonly' => true, 'value' => $model->id_paciente]) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'num_historia')->textInput(['maxlength' => true, 'readonly' => true, 'value' => $cedula]) ?>
        </div>
        <?php if ($model->idPaciente->tipo_paciente == 'Dependiente') : ?>
            <div class="col-md-4">
                <?= $form->field($modelP, 'cedula')->textInput(['readonly' => true, 'value' => $dataProvider->fecha_nac])->label('Fecha de Nacimiento') ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($modelP, 'cedula')->textInput(['readonly' => true, 'value' => $dataProvider->nombres])->label('Nombres') ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($modelP, 'cedula')->textInput(['readonly' => true, 'value' => $dataProvider->apellidos])->label('Apellidos') ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($modelP, 'cedula')->textInput(['readonly' => true, 'value' => $dataProvider->estado_civil])->label('Estado Civil') ?>
            </div>
        <?php else : ?>
            <div class="col-md-4">
                <?= $form->field($modelP, 'cedula')->textInput(['readonly' => true, 'value' => $dataProvider->allModels[0]['fechanac']])->label('Fecha de Nacimiento') ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($modelP, 'cedula')->textInput(['readonly' => true, 'value' => $dataProvider->allModels[0]['nombres']])->label('Nombres') ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($modelP, 'cedula')->textInput(['readonly' => true, 'value' => $dataProvider->allModels[0]['apellidos']])->label('Apellidos') ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($modelP, 'cedula')->textInput(['readonly' => true, 'value' => $dataProvider->allModels[0]['nacionalidad']])->label('Nacionalidad') ?>
            </div>
        <?php endif; ?>

        <center><h2>Hábitos</h2></center>
        <div class="col-md-4">
            <?= $form->field($antecedentes, 'tabaco')->checkbox() ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($antecedentes, 'alcohol')->checkbox() ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($antecedentes, 'alimentacion')->checkbox() ?>
        </div>
        <br><center><h2>Antecedentes Personales</h2></center>

        <div class="col-md-4">
            <?= $form->field($model, 'tipo_sangre')->dropDownList(['A+' => 'A+', 'A-' => 'A-', 'B+' => 'B+', 'B-' => 'B-', 'AB+' => 'AB+', 'AB-' => 'AB-', 'O+' => 'O+', 'O-' => 'O-'], ['style' => 'width:300px']) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($antecedentes, 'alergica')->textInput(['maxlength' => true, 'style' => 'width:300px']) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($antecedentes, 'respiratoria')->textInput(['maxlength' => true, 'style' => 'width:300px']) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($antecedentes, 'traumatologica')->textInput(['maxlength' => true, 'style' => 'width:300px']) ?>
        </div>            
        <div class="col-md-4">
            <?= $form->field($antecedentes, 'cardiaca')->textInput(['maxlength' => true, 'style' => 'width:300px']) ?>
        </div>            
        <div class="col-md-4">
            <?= $form->field($antecedentes, 'quirurgica')->textInput(['maxlength' => true, 'style' => 'width:300px']) ?>
        </div>


        <br> <center><h2>Antecedentes Familiares</h2></center>
        <div class="col-md-4">
            <?= $form->field($antecedentes, 'familiar_tipo')->dropDownList(['Ninguna' => 'Ninguna', 'Papa' => 'Papá', 'mama' => 'mamá', 'Hermanos' => 'Hermanos', 'Abuelos' => 'Abuelos',], ['maxlength' => true, 'style' => 'width:300px']) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($antecedentes, 'enfermedad_familiar')->dropDownList(['Ninguna' => 'Ninguna', 'Hipertension' => 'Hipertensión', 'Diabetes' => 'Diabetes', 'Cancer' => 'Cáncer', 'Tuberculosis' => 'Tuberculosis'], ['maxlength' => true, 'style' => 'width:300px']) ?>
        </div>
        <?= $form->field($antecedentes, 'id_paciente')->textInput(['type' => "hidden",])->label(" ") ?>
    </div>

    <div class="col-md-12">
        <?= $form->field($model, 'fecha_regHistoria')->textInput(['type' => "hidden", 'value' => date('Y-m-d H:i')])->label(" ") ?>
    </div>


    <?php if (!Yii::$app->request->isAjax) { ?>
        <div class="row">
            <center> <?= Html::submitButton($model->isNewRecord ? 'Guardar' : 'Guardar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
            </center>
        </div>
    <?php } ?>

    <?php ActiveForm::end(); ?>

</div>
