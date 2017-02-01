<?php
use yii\helpers\Url;

return [
    [
        'class' => 'kartik\grid\SerialColumn',
        'width' => '30px',
    ],
    [
        'class'=>'\kartik\grid\DataColumn',
        'attribute'=>'fechainicio',
    ],
    [
        'class'=>'\kartik\grid\DataColumn',
        'attribute'=>'fechafin',
    ],
    [
        'class'=>'\kartik\grid\DataColumn',
        'attribute'=>'fechaRegistro',
    ],
    [
        'class'=>'\kartik\grid\DataColumn',
        'attribute'=>'reporte',
    ],
    [
        'class' => 'kartik\grid\ActionColumn',
        'dropdown' => false,
        'vAlign'=>'middle',
        'urlCreator' => function($action, $model, $key, $index) { 
                return Url::to([$action,'id'=>$key]);
        },
        'viewOptions'=>['role'=>'modal-remote','title'=>'Ver','data-toggle'=>'tooltip'],
        'updateOptions'=>['role'=>'modal-remote','title'=>'Editar', 'data-toggle'=>'tooltip'],
        'deleteOptions'=>['role'=>'modal-remote','title'=>'Eliminar', 
                          'data-confirm'=>false, 'data-method'=>false,// for overide yii data api
                          'data-request-method'=>'post',
                          'data-toggle'=>'tooltip',
                          'data-confirm-title'=>'Está Seguro?',
                          'data-confirm-message'=>'Está Seguro de que quiere eliminar este Reporte.'], 
    ],

];   