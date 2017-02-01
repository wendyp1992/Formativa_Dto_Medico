<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model app\models\CitaMedica */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cita-medica-form">
    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <center><h2>HOJA DE EVOLUCIÓN</h2></center>
        <hr>
        <div class="form-group col-md-4"> 
            <?=
                    $form->field($model, 'id_paciente')->
                    widget(Select2::className(), [
                        'data' => [(ArrayHelper::map(app\models\Paciente::find()->asArray()->all(), 'id_paciente', function($model, $defaultValue) {
                                        return (empty($model['cedula'])) ? $model['num_matricula'] : $model['cedula'];
                                    }))],
                        'options' => ['placeholder' => 'Elegir una opción', 'id' => 'opcion'],
                        'pluginOptions' => [
                            'allowClear' => true,
                        ],
                    ])
            ?></div>
        <div class="form-group col-md-4"> 
            <?= $form->field($model, 'doctor')->textInput(['maxlength' => true, 'readonly' => true, 'value' => Yii::$app->user->identity->username]) ?> 
        </div>
        <div class="form-group col-md-4"> 
            <?= $form->field($model, 'fecha_cita')->textInput(['readonly' => true, 'value' => date('Y-m-d')]) ?>
        </div>

        <div class="col-md-12">
            <h3>DATOS PRINCIPALES</h3><hr>
        </div>

        <div class="form-group col-md-4"> 
            <?= $form->field($model, 'tipo_atencion')->dropDownList(['Urgente' => 'Urgente', 'Emergente' => 'Emergente'], ['maxlength' => true]) ?>    
        </div>
        <div class="form-group col-md-2"> 
            <?= $form->field($model, 'presion_arterial')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="form-group col-md-2"> 
            <?= $form->field($model, 'frc_cardiaca')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="form-group col-md-2"> 
            <?= $form->field($model, 'temperatura')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="form-group col-md-2"> 
            <?= $form->field($model, 'peso')->textInput(['maxlength' => true]) ?>
        </div>

        <div class="form-group col-md-4"> 
            <?= $form->field($model, 'sintomas')->textarea(['rows' => 6]) ?>
        </div>
        <div class="form-group col-md-4"> 
            <?= $form->field($model, 'revision_fisica')->textarea(['rows' => 6]) ?>
        </div>
        <div class="form-group col-md-4"> 
            <?= $form->field($model, 'diagnostico')->textarea(['rows' => 6]) ?>
        </div>    
        <div class="form-group col-md-6"> 
            <?= $form->field($model, 'diagnostico_exFisicos')->textarea(['rows' => 6]) ?>
        </div>
        <div class="form-group col-md-6"> 
            <?= $form->field($model, 'tratamiento_sm')->textarea(['rows' => 6]) ?>
        </div>
    </div>

    <?php if (!Yii::$app->request->isAjax) { ?>
        <div class="row">
            <center> <?= Html::submitButton($model->isNewRecord ? '<i class="glyphicon glyphicon-floppy-disk"></i> GUARDAR' : 'GUARDAR', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
            </center>
        </div>
    <?php } ?>

    <?php ActiveForm::end(); ?>

</div>
