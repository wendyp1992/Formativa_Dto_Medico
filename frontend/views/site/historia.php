<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */

$this->title = 'Historia';
?>
<div class="site-index">
    <div class="jumbotron">
        <h1>PUCESE</h1>
        <p class="lead">Tomando informacion</p>
    </div>

    <div class="body-content">
        <?=
        GridView::widget([
            'dataProvider' => $dataProvider,
            'summary' => ''
        ]);
        ?>
    </div>
</div>