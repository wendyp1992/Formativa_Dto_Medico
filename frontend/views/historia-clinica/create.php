<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\HistoriaClinica */
?>
<div class="historia-clinica-create">
    <?=
    $this->render('_form', [
        'model' => $model,
        'antecedentes' => $antecedentes,
        'cedula' => $cedula,
        'modelP' => $modelP,
        'dataProvider' => $dataProvider,
    ])
    ?>
</div>
