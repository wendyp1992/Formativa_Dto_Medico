<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $model app\models\RecetaDetalle */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="receta-detalle-form">
    <div class="row">
        <center><h2>HISTORIA CLÍNICA DEL PACIENTE DEPENDIENTE</h2></center>
        <hr>
        <?php $form = ActiveForm::begin(); ?>

        <div class="col-md-6"> 
            <?=
                    $form->field($model, 'id_medicamento')->
                    widget(Select2::className(), [
                        'data' => [(\yii\helpers\ArrayHelper::map(common\models\Medicamentos::find()->asArray()->all(), 'id_medicamento', function($model, $defaultValue) {
                                        return (empty($model['id_medicamento'])) ? $model['nombre_med'] : $model['nombre_med'];
                                    }))],
                        'options' => ['placeholder' => 'Elegir una opción', 'id' => 'opcion'],
                        'pluginOptions' => [
                            'allowClear' => true,
                        ],
                    ])
            ?></div>

        <div class="col-md-2"> 
            <?= $form->field($model, 'cantidad_med')->textInput() ?>
        </div>    

        <div class="form-group col-md-4">
            <?= $form->field($model, 'indicaciones')->textInput() ?>
        </div>

        <div class="form-group col-md-12">
            <?= $form->field($model, 'observacion')->textarea(['rows' => 6]) ?>
        </div>

        <?php if (!Yii::$app->request->isAjax) { ?>
            <div class="row">
                <center> <?= Html::submitButton($model->isNewRecord ? '<i class="glyphicon glyphicon-plus-sign"></i> RECETAR' : 'RECETAR', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
                </center>
            </div>
        <?php } ?>

        <div class="form-group col-md-12">
            <?= $form->field($model, 'id_cita')->textInput(['value' => $id_cita, 'readonly' => true, 'type' => "hidden",])->label('') ?>
        </div>

        <?php ActiveForm::end(); ?>

        <div class="form-group col-md-12">
            <?php
            echo Html::a('<i class="glyphicon glyphicon-print"></i> Imprimir Receta', ['reportes', 'id_cita' => $_GET['id_cita']], [
                'class' => 'btn btn-info',
                'target' => '_blank',
                'data-toggle' => 'tooltip',
                'title' => 'Imprimir Receta'
            ]);
            ?>
            <?= Html::a('OMITIR <i class="glyphicon glyphicon-arrow-right"></i>', ['/site/index'], ['class' => 'btn btn-danger pull-right']) ?></div>
    </div>
</div>