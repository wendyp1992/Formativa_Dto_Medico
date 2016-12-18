<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Logs */
?>
<div class="logs-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'usuario',
            'ip',
            'acceso',
            'fecha',
        ],
    ]) ?>

</div>
