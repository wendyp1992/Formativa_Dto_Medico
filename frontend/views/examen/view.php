<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Examen */

$this->title = $model->idExamen;
$this->params['breadcrumbs'][] = ['label' => 'Examens', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="examen-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->idExamen], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->idExamen], [
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
            'idExamen',
            'categoria',
            'nom_examen',
        ],
    ]) ?>

</div>
