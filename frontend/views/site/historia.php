<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\bootstrap\Modal;
use kartik\grid\DataColumn;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */

$this->title = 'Historia';
?>
<div class="site-index">
    <div class="jumbotron">
        <h1>Departamento Medico</h1>
        <p class="lead">Datos Personales</p>
    </div>

    <div class="body-content">
        <?=
        GridView::widget([
            'dataProvider' => $dataProvider,
            'summary' => ''
        ]);
        ?>
    </div>
</div>
<div class="form-group">
    <?= Html::a('Siguiente', ['/historia-clinica/create', 'id_paciente' => $id_paciente], ['class' => 'btn btn-primary']) ?>

</div>

