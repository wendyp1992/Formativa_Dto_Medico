<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\CitaMedica */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cita-medica-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id_doctor')->textInput() ?> <!-- Salga el nombre del doctor logueado en ese momento y el campo en readonly-->

    <!-- Sea un dropwlist buscador y al seleccionar la cedula salga el nombre del paciente en alguna casilla extra-->
    <?=
    $form->field($model, 'id_paciente')->dropDownList(\yii\helpers\ArrayHelper::map(app\models\Paciente::find()->asArray()->all(), 'id_paciente', function($model, $defaultValue) {
                return (empty($model['cedula'])) ? $model['num_matricula'] : $model['cedula'];
            }), ['prompt' => 'Seleccione ..'])->label('Paciente')
    ?>
    <!-- Buscar los rangos de la presion y colocarlos en drowp y que esten en la misma linea los dos -->
    <?= $form->field($model, 'presion_baja')->textInput()->label('Presión Arterial baja') ?>
    <?= $form->field($model, 'presion_alta')->textInput()->label('Presión Arterial alta') ?>

    <?= $form->field($model, 'temperatura')->textInput()->label('Temperatura') ?>
    <?= $form->field($model, 'peso')->textInput() ?>

    <?= $form->field($model, 'frc_cardiaca')->textInput() ?>
    <?= $form->field($model, 'revision_fisica')->textarea(['rows' => 6])->label('Revisión Fìsica') ?>
    <?= $form->field($model, 'sintomas')->textarea(['rows' => 6])->label('Sintomas') ?>
    <?= $form->field($model, 'diagnostico')->textarea(['rows' => 6])->label('Diagnostico') ?>

    <?= $form->field($model, 'diagnostico_exFisicos')->textarea(['rows' => 6])->label('Diagnostico de los Examenes Fisicos') ?>

    <?= $form->field($model, 'tratamiento_sm')->textarea(['rows' => 6])->label('Tratamiento') ?>
    <?= $form->field($model, 'fecha_cita')->textInput(['type' => "hidden", 'value' => date('Y-m-d h:m:s')])->label('') ?>

    <?php if (!Yii::$app->request->isAjax) { ?>
        <div class="form-group">
            <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        </div>
    <?php } ?>

    <?php ActiveForm::end(); ?>

</div>
