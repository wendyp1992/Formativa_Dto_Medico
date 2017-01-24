<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Dependiente */

?>
<div class="dependiente-create">
    <?= $this->render('_form', [
        'model' => $model,
        'modelP' => $modelP,
        'dataProvider'=>$dataProvider,
    ]) ?>
</div>
