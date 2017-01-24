<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\HistoriaClinica */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="historia-clinica-form">
    <center><b><p class="lead">HISTORIA CLINICA</p></b></center>
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

        <div class="col-md-12">
            <?= $form->field($model, 'tipo_sangre')->dropDownList(['A+' => 'A+', 'A-' => 'A-', 'B+' => 'B+', 'B-' => 'B-', 'AB+' => 'AB+', 'AB-' => 'AB-', 'O+' => 'O+', 'O-' => 'O-']) ?>
            <?= $form->field($model, 'fecha_regHistoria')->textInput(['type' => "hidden", 'value' => date('Y-m-d H:i')])->label(" ") ?>
            <h2>Antecedentes</h2>
        </div>

        <div class="col-md-6">
            <?= $form->field($antecedentes, 'hb_alcohol')->checkbox() ?>
            <?= $form->field($antecedentes, 'hb_tabaco')->checkbox() ?>
            <?= $form->field($antecedentes, 'hb_malaAliment')->checkbox() ?>
            <?= $form->field($antecedentes, 'hb_vidaSedent')->checkbox() ?>
            <?= $form->field($antecedentes, 'alg_cardiaca')->checkbox() ?>
            <?= $form->field($antecedentes, 'alg_respiratoria')->checkbox() ?>
        </div>
        <div class="col-md-6">
            <?= $form->field($antecedentes, 'alg_quirurgica')->checkbox() ?>
            <?= $form->field($antecedentes, 'alg_traumatolog')->checkbox() ?>
            <?= $form->field($antecedentes, 'cancer')->checkbox() ?>
            <?= $form->field($antecedentes, 'diabetes')->checkbox() ?>
            <?= $form->field($antecedentes, 'hipertension')->checkbox() ?>
            <?= $form->field($antecedentes, 'tuberculosis')->checkbox() ?>
            <?= $form->field($antecedentes, 'id_paciente')->textInput(['type' => "hidden",])->label(" ") ?>
        </div>
    </div>




    <?php if (!Yii::$app->request->isAjax) { ?>
        <div class="form-group">
            <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        </div>
    <?php } ?>

    <?php ActiveForm::end(); ?>

</div>
