<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\bootstrap\Modal;
use kartik\grid\DataColumn;
use yii\widgets\ActiveForm;
use yii\widgets\DetailView;
use yii\data\ActiveDataProvider;
use yii\widgets\ListView;

/* @var $this yii\web\View */

$this->title = 'Historia';
?>
<div class="site-index">
    <div class="jumbotron">
        <h1>Departamento Medico</h1>
        <p class="lead">Datos Personales</p>
    </div>
    <div class="body-content">

        <div class="paciente-form">

            <?php $form = ActiveForm::begin(['id' => 'paciente']); ?>

            <?= $form->field($model, 'cedula')->textInput(['maxlength' => true, 'value' => $dataProvider->allModels[0]['E_cedula'], 'readonly' => true,]) ?> <!--    ['disabled' => ($model->tipo_paciente=='estudiantes') ? 'disabled' : false]-->
            <?= $form->field($model, 'tipo_paciente')->textInput(['maxlength' => true, 'value' => $paciente, 'readonly' => true]) ?>
            <?= $form->field($model, 'num_matricula')->textInput(['maxlength' => true, 'value' => $dataProvider->allModels[0]['nummatricula'], 'readonly' => true]) ?>
            <?= $form->field($model, 'fecha_regPaciente')->textInput(['type' => "hidden", 'value' => date('Y-m-d H:i'),])->label(" ") ?>

                <div class="form-group">
                    <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
                </div>

            <?php ActiveForm::end(); ?>

        </div>
    </div>
</div>
