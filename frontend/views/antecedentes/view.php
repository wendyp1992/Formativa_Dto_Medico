<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Antecedentes */

$this->title = $model->id_paciente;
$this->params['breadcrumbs'][] = ['label' => 'Antecedentes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="antecedentes-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id_paciente], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id_paciente], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'hb_alcohol:boolean',
            'hb_tabaco:boolean',
            'hb_malaAliment:boolean',
            'hb_vidaSedent:boolean',
            'alg_cardiaca:boolean',
            'alg_respiratoria:boolean',
            'alg_quirurgica:boolean',
            'alg_traumatolog:boolean',
            'cancer:boolean',
            'diabetes:boolean',
            'hipertension:boolean',
            'tuberculosis:boolean',
            'id_paciente',
        ],
    ]) ?>

</div>
