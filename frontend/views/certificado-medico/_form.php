<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\CertificadoMedico */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="certificado-medico-form">

    <?php $form = ActiveForm::begin(); ?>


    <div class="row">
        <div class="col-lg-5">
            <?=
                    $form->field($model, 'identificacion_persona')->
                    widget(\kartik\select2\Select2::className(), [
                        'data' => [(yii\helpers\ArrayHelper::map(app\models\Paciente::find()->asArray()->all(), function($model, $defaultValue) {
                                        return (empty($model['cedula'])) ? $model['num_matricula'] : $model['cedula'];
                                    }, function($model, $defaultValue) {
                                        return (empty($model['cedula'])) ? $model['num_matricula'] : $model['cedula'];
                                    }))],
                        'options' => ['placeholder' => 'Elegir una opción', 'id' => 'opcion'],
                        'pluginOptions' => [
                            'allowClear' => true,
                        ],
                    ])
            ?>

           
        </div>
        <div class="col-lg-7">
    <?= $form->field($model, 'tipo_certificado')->dropDownList([ 'certificado de atencion' => 'Certificado de atencion', 'certificado de estado clínico' => 'Certificado de estado clínico', 'certificado de reporte medico' => 'Certificado de reporte medico', ], ['prompt' => 'Elija el tipo de certificado']) ?>
             
        </div>
    </div>
    
    
    
    <?= $form->field($model, 'detalle')->textarea(['maxlength' => true, 'rows'=> '8'])->hint('Una vez que se emita el certificado proceda a imprimirlo dando click en la parte superior derecha.') ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Guardar e Imprimir' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-info' : 'btn btn-primary']) ?>
 <?= yii\bootstrap\Html::a('<i class="glyphicon glyphicon-chevron-left">&nbsp;Cancelar</i>', ['certificado-medico/index'],
                    ['role'=>'modal-remote', 'class'=>'btn btn-danger' ,'title'=> 'Volver al formulario principal'])?>
    </div>
               
                 
  

    <?php ActiveForm::end(); ?>

</div>
