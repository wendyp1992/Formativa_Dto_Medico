<?php

use yii\widgets\DetailView;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Reportepacientes */
use kartik\mpdf\Pdf;

echo Html::a('<i class="glyphicon glyphicon-print"></i> Imprimir Reporte', ['vista', 'id' => $_GET['id']], [
    'class' => 'btn pull-right',
    'target' => '_blank',
    'data-toggle' => 'tooltip',
    'title' => 'Imprimir Reporte'
]);
?>
<br><br>

<div class="reportepacientes-view">

    <?=
    DetailView::widget([
        'model' => $model,
        'attributes' => [
            'idreporte',
            'fechainicio',
            'fechafin',
            'fechaRegistro',
            'reporte',
        ],
    ])
    ?>

</div>
