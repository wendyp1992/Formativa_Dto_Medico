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

    <?php $form = ActiveForm::begin(); ?>

    <div class="form-group col-md-6"> 
        <?=
                $form->field($model, 'id_medicamento')->
                widget(Select2::className(), [
                    'data' => [(\yii\helpers\ArrayHelper::map(app\models\Medicamentos::find()->asArray()->all(), 'id_medicamento', function($model, $defaultValue) {
                                    return (empty($model['id_medicamento'])) ? $model['nombre_med'] : $model['nombre_med'];
                                }))],
                    'options' => ['placeholder' => 'Elegir una opción', 'id' => 'opcion'],
                    'pluginOptions' => [
                        'allowClear' => true,
                    ],
                ])
        ?></div>

    <div class="form-group col-md-2"> 
        <?= $form->field($model, 'cantidad_med')->textInput() ?>
    </div>

    <?php if (!Yii::$app->request->isAjax) { ?>
        <div class="form-group col-md-4 pull-right">
            <?= Html::submitButton($model->isNewRecord ? '<i class="glyphicon glyphicon-plus"></i> Recetar' : '<i class="glyphicon glyphicon-plus"></i> Recetar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary', 'style' => 'width:150px']) ?>
        </div>
    <?php } ?>

    <div class="form-group col-md-6">
        <?= $form->field($model, 'indicaciones')->textarea(['rows' => 6]) ?>
    </div>

    <div class="form-group col-md-6">
        <?= $form->field($model, 'observacion')->textarea(['rows' => 6]) ?>
    </div>

    <div class="form-group col-md-12">
        <?= $form->field($model, 'id_cita')->textInput(['value' => $id_cita, 'readonly' => true, 'type' => "hidden",])->label('') ?>
    </div>
    <?php ActiveForm::end(); ?>
    <div class="form-group col-md-12">
        <?=
        GridView::widget([
            'dataProvider' => $dataProvider,
            'filterModel' => $searchModel,
            'columns' => [
                'id_medicamento',
                'cantidad_med',
                'indicaciones',
                'observacion',
                ['class' => 'yii\grid\ActionColumn'],
            ],
        ]);
        ?>
    </div>
</div>
