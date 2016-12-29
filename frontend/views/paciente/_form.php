<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\grid\GridView;
use yii\widgets\DetailView;
use yii\data\ArrayDataProvider;
use kartik\select2\Select2;
/* @var $this yii\web\View */
/* @var $model app\models\Paciente */
/* @var $form yii\widgets\ActiveForm */

?>

<div class="paciente-form">

    <?php $form = ActiveForm::begin(); ?>
    <?=
            $form->field($model, 'tipo_paciente')->
            widget(Select2::className(), [
                'data' => ['estudiantes' => 'estudiantes', 'trabajadores' => 'trabajadores'],
                'options' => ['placeholder' => 'Elegir una opción', 'id' => 'opcion'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ])
    ?>
    <?= $form->field($model, 'cedula')->textInput(['maxlength' => true, 'style' => 'width:300px', 'readonly' => true, 'id' => 'cedula']) ?> <!--    ['disabled' => ($model->tipo_paciente=='estudiantes') ? 'disabled' : false]-->
    <?= $form->field($model, 'num_matricula')->textInput(['maxlength' => true, 'id' => 'matricula', 'style' => 'width:300px', 'readonly' => true]) ?>

    <?= $form->field($model, 'fecha_regPaciente')->textInput(['type' => "hidden", 'value' => date('Y-m-d H:i'), 'style' => 'width:300px'])->label(" ") ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Create', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>
    <?php ActiveForm::end(); ?>

</div>


<!-- funcion>
    <?php
$script = <<< JS
        
$('#opcion').change(function()
    {
 val = $(this).find('option:selected').val();
                if(val == 'estudiantes'){
                        // Desactivo el input
                         $('#matricula').removeAttr('readonly');
                   $('#cedula').attr('readonly', 'readonly');

                } else {
   $('#cedula').removeAttr('readonly');
                   $('#matricula').attr('readonly', 'readonly');
                }
        });  
JS;
$this->registerJs($script);
?>