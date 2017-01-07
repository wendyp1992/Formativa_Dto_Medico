<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Paciente */

?>
<div class="paciente-create">
    <?= $this->render('_form', [
        'model' => $model,
        'modelP' => $modelP,
        'dependiente' => $dependiente,
        'dataProvider_busqueda' => $dataProvider_busqueda,
    ]) ?>
</div>
