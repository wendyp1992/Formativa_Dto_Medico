<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
/* @var $this yii\web\View */
/* @var $model app\models\ExamenHistoriaClinica */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="examen-historia-clinica-form">

    <?php $form = ActiveForm::begin(); ?>
     <?php
    if (Yii::$app->controller->action->id == 'update') {
        if ($model->validate()) {
            $model->idTiposExamen = array_map('intval', explode(',', $model->idTiposExamen));
        }
    }
    echo $form->field($model, 'idTiposExamen')->widget(Select2::classname(), [
    'data' => $model->getExamenes(),
            'options' => [
            'placeholder' => 'Seleccione examen...',
            'id' => 'items',
            'multiple' => true,
            'tags' => true,
            'tokenSeparators' => [',', ' '],
            'maximumInputLength' => 10
        ],
])->label("Examen");
     ?>

   <?php echo $form->field($model, 'id_paciente')->widget(Select2::className(), [
            'data' => $model->getPacientes(),
        ])->label("Paciente");
     ?>

    <?= $form->field($model, 'indicacion')->textarea(['rows' => 6]) ?>
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Editar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
