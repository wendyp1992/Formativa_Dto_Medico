<?php

use yii\helpers\Url;
use yii\helpers\Html;
use app\models\Paciente;
use kartik\grid\GridView;
use yii\helpers\ArrayHelper;

return [
    [
        'class' => 'kartik\grid\CheckboxColumn',
        'width' => '20px',
    ],
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
        'contentOptions' => ['style' => 'width: 85px; text-align:center'],
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
        'viewOptions'=>['role'=>'modal-remote','title'=>'View','data-toggle'=>'tooltip'],
        'updateOptions'=>['role'=>'modal-remote','title'=>'Update', 'data-toggle'=>'tooltip'],
        'deleteOptions'=>['role'=>'modal-remote','title'=>'Delete', 
                          'data-confirm'=>false, 'data-method'=>false,// for overide yii data api
                          'data-request-method'=>'post',
                          'data-toggle'=>'tooltip',
                          'data-confirm-title'=>'Are you sure?',
                          'data-confirm-message'=>'Are you sure want to delete this item'], 
    ],

];   