<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\CertificadoMedico */

$this->title = 'Emisión de Certificados Médicos';

?>
<div class="certificado-medico-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
