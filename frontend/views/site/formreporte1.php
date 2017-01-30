<?php
/* @var $this yii\web\View */

use yii\helpers\Html;
use app\assets\AppAsset;
use yii\widgets\ActiveForm;


?>
<div class="site-formReporte1" >
    <?php $form = ActiveForm::begin(); ?>
    <center><h1>REPORTE DE PACIENTES ATENDIDOS</h1></center>
    <?=
    $form->field($model, 'fecha_nac')->widget(kartik\date\DatePicker::classname(), [
        'options' => ['placeholder' => 'Reporte desde'],
        'pluginOptions' => [
            'autoclose' => true,
            'todayHighlight' => TRUE,
            'format' => 'yyyy-mm-dd',
        ]
    ])
    ?>
    <div class="form-group">
        <?= Html::submitButton('Enviar', ['class' => 'btn btn-success']) ?>
    </div>
    <?php ActiveForm::end(); ?>
</div>
