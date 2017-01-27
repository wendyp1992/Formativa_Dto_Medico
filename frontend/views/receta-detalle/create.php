<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\RecetaDetalle */
?>
<div class="receta-detalle-create">
    <?=
    $this->render('_form', [
        'model' => $model,
        'id_cita' => $id_cita,
        'searchModel' => $searchModel,
        'dataProvider' => $dataProvider,
    ])
    ?>
</div>
