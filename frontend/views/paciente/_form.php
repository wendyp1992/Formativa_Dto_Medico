<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;

/* @var $this yii\web\View */
/* @var $model app\models\Paciente */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="paciente-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="col-md-12">
        <?=
                $form->field($model, 'tipo_paciente')->
                widget(Select2::className(), [
                    'data' => ['Estudiante' => 'Estudiante', 'Trabajador' => 'Trabajador'],
                    'options' => ['placeholder' => 'Elegir una opción', 'id' => 'opcion', 'style' => 'width:300px'],
                    'size' => Select2::MEDIUM,
                    'pluginOptions' => [
                        'allowClear' => true,
                    ],])
        ?>
    </div>
    <div class="col-md-6">
        <?= $form->field($model, 'cedula')->textInput(['maxlength' => true, 'readonly' => true, 'id' => 'cedula']) ?> <!--    ['disabled' => ($model->tipo_paciente=='estudiantes') ? 'disabled' : false]-->
    </div>
    <div class="col-md-6">
        <?= $form->field($model, 'num_matricula')->textInput(['maxlength' => true, 'id' => 'matricula', 'readonly' => true]) ?>
    </div>
    <?= $form->field($model, 'fecha_regPaciente')->textInput(['type' => "hidden", 'value' => date('Y-m-d H:i')])->label(" ") ?>
    
    <div class="form-group col-md-12">
        <?= Html::submitButton($model->isNewRecord ? 'Buscar' : 'Buscar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>
    <?php ActiveForm::end(); ?>
</div>


<?php
$script = <<< JS
$('#opcion').change(function()
    { val = $(this).find('option:selected').val();
        if(val == 'Estudiante'){
           $('#matricula').removeAttr('readonly');
           $('#cedula').attr('readonly', 'readonly');

               } else if (val == 'Trabajador') {
            $('#cedula').removeAttr('readonly');
            $('#matricula').attr('readonly', 'readonly');

      }else  
   { $('#matricula').attr('readonly', 'readonly'); 
  $('#cedula').attr('readonly', 'readonly');
   }});  
JS;
$this->registerJs($script);
?>



