<?php

return [
    
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    'components' => [
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        'errorHandler' => [
            // web error handler
            'class' => '\bedezign\yii2\audit\components\web\ErrorHandler',
            // console error handler
            //'class' => '\bedezign\yii2\audit\components\console\ErrorHandler',
        ],
    ],
    'modules' => [
        'user' => [
            'class' => 'dektrium\user\Module',
            'enableUnconfirmedLogin' => true,
            'confirmWithin' => 21600,
            'cost' => 12,
            'enableRegistration' => false,
            'admins' => ['superadmin'],
        ],
        'audit' => [
            'class' => 'bedezign\yii2\audit\Audit',
            'accessRoles' => ['superadmin'],
            'accessUsers' => [1, 2],
            ],
        //'rbac' => 'dektrium\rbac\RbacWebModule',
        'gridview' => [
            'class' => '\kartik\grid\Module'
        ],
        [
            'class' => 'yii\i18n\PhpMessageSource',
            'basePath' => '@kvgrid/messages',
            'forceTranslation' => true
        ]
    ],
    'timeZone' => 'America/Guayaquil',
    'language' => 'es',
];
