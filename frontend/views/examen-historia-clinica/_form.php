<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use wbraganca\dynamicform\DynamicFormWidget;
/* @var $this yii\web\View */
/* @var $model app\models\ExamenHistoriaClinica */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="examen-historia-clinica-form">

    <?php $form = ActiveForm::begin(['id' => 'dynamic-form']);
           
    ?>
     <div class="padding-v-md">
        <div class="line line-dashed"></div>
    </div>
   <?php echo $form->field($model, 'id_paciente')->widget(Select2::className(), [
            'data' => $model->getPacientes(),
        ])->label("Paciente");
     ?>

  <?php DynamicFormWidget::begin([
        'widgetContainer' => 'dynamicform_wrapper',
        'widgetBody' => '.container-items',
        'widgetItem' => '.examen-item',
        'limit' => 10,
        'min' => 1,
        'insertButton' => '.add-examen',
        'deleteButton' => '.remove-examen',
        'model' => $modelsExamen[0],
        'formId' => 'dynamic-form',
        'formFields' => [
            'indicacion',
        ],
    ]); ?>
        <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>Tipo Examen</th>
                <th style="width: 750px;">Indicaciones</th>
                <th class="text-center" style="width: 90px;">
                    <button type="button" class="add-examen btn btn-success btn-xs"><span class="glyphicon glyphicon-plus"></span></button>
                </th>
            </tr>
        </thead>
        <tbody class="container-items">
        <?php foreach ($modelsExamen as $indexExamen => $modelExamen): ?>
            <tr class="examen-item">
                <td class="vcenter">
                    <?php
                        // necessary for update action.
                        if (! $modelExamen->isNewRecord) {
                            echo Html::activeHiddenInput($modelExamen, "[{".$indexExamen."}]idExamenHistoria");
                        }
                    ?>
                    <?php echo $form->field($modelExamen, '['.$indexExamen.']idExamenHistoria')->widget(Select2::classname(), [
    'data' => $model->getExamenes(),
    'options' => ['placeholder' => 'Seleccione examen...', 'multiple' => true],
])->label("Examen");
                    ?>
                </td>
                <td>
                    <?= $this->render('indicaciones', [
                        'form' => $form,
                        'indexExamen' => $indexExamen,
                        'modelsIndicacion' => $modelsIndicaciones[$indexExamen],
                    ]) ?>
                </td>
                <td class="text-center vcenter" style="width: 90px; verti">
                    <button type="button" class="remove-examen btn btn-danger btn-xs"><span class="glyphicon glyphicon-minus"></span></button>
                </td>
            </tr>
         <?php endforeach; ?>
        </tbody>
    </table>
    <?php DynamicFormWidget::end(); ?>

 
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
