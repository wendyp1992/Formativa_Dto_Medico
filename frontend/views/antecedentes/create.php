<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Antecedentes */

$this->title = 'Create Antecedentes';
$this->params['breadcrumbs'][] = ['label' => 'Antecedentes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="antecedentes-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
