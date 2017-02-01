<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\CertificadoMedico */
?>
<div class="certificado-medico-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'identificacion_persona',
            'tipo_certificado',
            'detalle',
        ],
    ]) ?>

</div>
