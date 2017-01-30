<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Antecedentes */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="antecedentes-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'hb_alcohol')->checkbox() ?>

    <?= $form->field($model, 'hb_tabaco')->checkbox() ?>

    <?= $form->field($model, 'hb_malaAliment')->checkbox() ?>

    <?= $form->field($model, 'hb_vidaSedent')->checkbox() ?>

    <?= $form->field($model, 'alg_cardiaca')->checkbox() ?>

    <?= $form->field($model, 'alg_respiratoria')->checkbox() ?>

    <?= $form->field($model, 'alg_quirurgica')->checkbox() ?>

    <?= $form->field($model, 'alg_traumatolog')->checkbox() ?>

    <?= $form->field($model, 'cancer')->checkbox() ?>

    <?= $form->field($model, 'diabetes')->checkbox() ?>

    <?= $form->field($model, 'hipertension')->checkbox() ?>

    <?= $form->field($model, 'tuberculosis')->checkbox() ?>

    <?= $form->field($model, 'id_paciente')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
