<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Examen */
?>
<div class="examen-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'idExamen',
            'categoria',
            'nom_examen',
        ],
    ]) ?>

</div>
