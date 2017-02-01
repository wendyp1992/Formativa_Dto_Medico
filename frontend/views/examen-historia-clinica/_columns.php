<?php

use yii\helpers\Url;
use yii\helpers\Html;
use app\models\Paciente;
use kartik\grid\GridView;
use yii\helpers\ArrayHelper;

return [
    [
        'class' => 'kartik\grid\SerialColumn',
        'width' => '30px',
    ],
      /*  [
        'class'=>'\kartik\grid\DataColumn',
        'attribute'=>'IdExamenHistoria',
    ],*/
    [
        'class'=>'\kartik\grid\DataColumn',
        'attribute'=>'id_paciente',
        'contentOptions' => ['style' => 'width: 200px; text-align:center'],
        'label'=>'Paciente',
        'value'=> function ($data){
        return Paciente::findOne($data->id_paciente)->cedula;
        },
             'format' => 'raw',
        'filterType' => GridView::FILTER_SELECT2,
                    'filter' => ArrayHelper::map(Paciente::find()->orderBy('id_paciente')->asArray()->all(), 'id_paciente', 'cedula'),
                    'filterWidgetOptions' => [
                        'pluginOptions' => ['allowClear' => true],
                    ],
                    'filterInputOptions' => ['placeholder' => 'Seleccionar Cedula'],
    ],

    /*[
        'class'=>'\kartik\grid\DataColumn',
        'attribute'=>'idTiposExamen',
    ],*/
    [
        'class'=>'\kartik\grid\DataColumn',
        'attribute'=>'indicacion',
         'value'=> function ($data){
        return substr(strip_tags($data->indicacion), 0, 90);
        },
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
        'deleteOptions'=>['role'=>'modal-remote','title'=>'Borrar', 
                          'data-confirm'=>false, 'data-method'=>false,// for overide yii data api
                          'data-request-method'=>'post',
                          'data-toggle'=>'tooltip',
                          'data-confirm-title'=>'Está Seguro?',
                          'data-confirm-message'=>'Está seguro de eliminar este Examen.'], 
    ],

];   