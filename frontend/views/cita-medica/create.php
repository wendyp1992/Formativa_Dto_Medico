<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\CitaMedica */

$this->title = 'Crear Cita Medica';
$this->params['breadcrumbs'][] = ['label' => 'Cita Medicas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cita-medica-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
