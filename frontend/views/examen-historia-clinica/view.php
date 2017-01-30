<?php

use yii\widgets\DetailView;
use app\models\Paciente;
use yii\helpers\Html;
/* @var $this yii\web\View */
/* @var $model app\models\ExamenHistoriaClinica */
use kartik\mpdf\Pdf;
echo Html::a('<i class="fa glyphicon glyphicon-hand-up"></i> Imprimir Examen', ['report', 'id'=>$_GET['id']], [
    'class'=>'btn btn-danger', 
    'target'=>'_blank', 
    'data-toggle'=>'tooltip', 
    'title'=>'Imprimir Examen'
]);
?>
<br><br>
<div class="examen-historia-clinica-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'IdExamenHistoria',
            [
            'attribute' => 'id_paciente',
            'label'=>'Paciente',
             'value' => Paciente::findOne($model->id_paciente)->cedula,
            ],
            [
            'attribute' => 'idTiposExamen',
            'label'=>'Examenes',
             'value' => $model->getTiposExamenes(array_map('intval', explode(',', $model->idTiposExamen))),
            ],
            'indicacion',
        ],
    ]) ?>

</div>
