<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Dependiente */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="dependiente-form">
    <div class="row">
        <?php if ($modelP->cedula != null) : ?>
            <center><h2>HISTORIA CLÍNICA DEL PACIENTE DEPENDIENTE</h2></center>
            <hr>
        <?php endif; ?>

        <div class="col-md-12">
            <?php $form = ActiveForm::begin(['id' => 'paciente']); ?>
            <?= $form->field($modelP, 'cedula')->textInput(['maxlength' => true, 'id' => 'cedula'])->label('Cedula del Trabajador') ?>
            <?= Html::button('<i class="glyphicon glyphicon-search"></i> BUSCAR', ['class' => 'btn btn-primary pull-right', 'type' => "submit"]) ?>
            <?php ActiveForm::end(); ?>
        </div>


        <?php if ($modelP->cedula != null) : ?>
            <div class="col-md-12">
                <h3>RESPONSABLE</h3><hr>
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
            <br>

            <div class="col-md-12">
                <h3>INFORMACIÓN DEL PACIENTE</h3><hr>
            </div>

            <?php $form = ActiveForm::begin(); ?>
            <div class="form-group col-md-4"> 
                <?= $form->field($model, 'cedula')->textInput(['maxlength' => true, 'style' => 'width:300px']) ?>
            </div>
            <div class="form-group col-md-4"> 
                <?= $form->field($model, 'nombres')->textInput(['maxlength' => true, 'style' => 'width:300px'])->label('Nombres') ?>
            </div>    <div class="form-group col-md-4"> 

                <?= $form->field($model, 'apellidos')->textInput(['maxlength' => true, 'style' => 'width:300px'])->label('Apellidos') ?>
            </div>
            <div class="form-group col-md-6"> 

                <?=
                $form->field($model, 'fecha_nac')->widget(kartik\date\DatePicker::classname(), [
                    'options' => ['placeholder' => 'Fecha de nacimiento ...'],
                    'pluginOptions' => [
                        'autoclose' => true,
                        'todayHighlight' => TRUE,
                        'format' => 'yyyy-mm-dd',
                    ]
                ])
                ?></div>

            <!--controlar estado civil-->
            <div class="form-group col-md-6"> 
                <?=
                $form->field($model, 'estado_civil')->dropDownList(['Soltero' => 'Soltero/a', 'Casado' => 'Casado/a', 'Viudo' => 'Viudo/a',
                    'Divorciado' => 'Divorciado/a', 'Union Libre' => 'Unión Libre'], ['maxlength' => true])->label('Estado Civil')
                ?>
            </div>

            <?= $form->field($model, 'id_paciente')->textInput(['type' => "hidden"])->label('') ?>
            <?php if (!Yii::$app->request->isAjax) { ?>
                <div class="row">
                    <center> <?= Html::submitButton($model->isNewRecord ? '<i class="glyphicon glyphicon-floppy-disk"></i> GUARDAR' : 'GUARDAR', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
                    </center>
                </div>
            <?php } ?>
            <?= $form->field($model, 'fecha_regDependiente')->textInput(['type' => "hidden", 'value' => date('Y-m-d h:m:s')])->label('') ?>
            <?= $form->field($model, 'cedula_trab')->textInput(['maxlength' => true, 'type' => "hidden"])->label('') ?>
            <?php ActiveForm::end(); ?>
        <?php endif; ?>
    </div>
</div>

