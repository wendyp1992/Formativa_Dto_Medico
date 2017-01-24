<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model frontend\models\SearchMedicamentos */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="medicamentos-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id_medicamento') ?>

    <?= $form->field($model, 'codigo_med') ?>

    <?= $form->field($model, 'nombre_med') ?>

    <?= $form->field($model, 'tipo_med') ?>

    <?= $form->field($model, 'descripcion') ?>

    <?php // echo $form->field($model, 'fecha_caduc') ?>

    <?php // echo $form->field($model, 'cantidad_med') ?>

    <?php // echo $form->field($model, 'fecha_regMedic') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
