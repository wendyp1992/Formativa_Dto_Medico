<?php
/* @var $this \yii\web\View */
/* @var $content string */

use backend\assets\AppAsset;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use common\widgets\Alert;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
    <head>
        <meta charset="<?= Yii::$app->charset ?>">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <?= Html::csrfMetaTags() ?>
        <title><?= Html::encode($this->title) ?></title>
        <?php $this->head() ?>
    </head>
    <body>
        <?php $this->beginBody() ?>

        <div class="wrap">
            <?php
            NavBar::begin([
                'brandLabel' => 'SISTEMA MÉDICO',
                'brandUrl' => Yii::$app->homeUrl,
                'options' => [
                    'class' => 'navbar-blue navbar-fixed-top',
                ],
            ]);
            $menuItems = [
                ['label' => 'INICIO', 'url' => ['/site/index']],
            ];
            if (Yii::$app->user->isGuest) {
                $menuItems[] = ['label' => 'Entrar', 'url' => ['/user/login']];
            } else {
                $menuItems = [
                    ['label' => 'INICIO', 'url' => ['/site/index']],
                        //permitir borrar los datos de los doctores si no ha creado cita medica
                ];
                $menuItems[] = [
                    'label' => 'INSERTAR',
                    'visible' => Yii::$app->user->identity->isAdmin || Yii::$app->user->can('superadmin'),
                    'items' => [
                        ['label' => 'Nuevos Doctores', 'url' => ['/user/admin/create'], 'visible' => Yii::$app->user->identity->isAdmin || Yii::$app->user->can('superadmin'),],
                        ['label' => 'Nuevos Exámenes', 'url' => ['/examen'],],
                        ['label' => 'Nuevos Medicamentos', 'url' => ['/medicamentos'],'visible' => Yii::$app->user->identity->isAdmin || Yii::$app->user->can('superadmin'),
],
                    ],
                ];
                $menuItems[] = [
                    'label' => 'AUDITORÍA',
                    'visible' => Yii::$app->user->identity->isAdmin || Yii::$app->user->can('superadmin'),
                    'items' => [
                        ['label' => 'Accesos', 'url' => ['/audit/entry'],],
                        ['label' => 'Acciones', 'url' => ['/audit/trail'],],
                        ['label' => 'Inicio de sesión', 'url' => ['/logs/index'],],
                    ],
                ];
                $menuItems[] = [
                    'label' => Yii::$app->user->identity->username,
                    'items' => [
                        ['label' => 'Mi Cuenta', 'url' => ['user/settings/account'],],
                        ['label' => 'Vista Principal', 'url' => ['/../../frontend/web'],],
                        '<li class="divider"></li>',
                        ['label' => 'Salir del Sistema', 'url' => ['/user/security/logout'], 'linkOptions' => ['data-method' => 'post']],
                    ],
                ];
            }
            echo Nav::widget([
                'options' => ['class' => 'navbar-nav navbar-right'],
                'items' => $menuItems,
            ]);
            NavBar::end();
            ?>

            <div class="container">
                <?= Alert::widget() ?>
                <?= $content ?>
            </div>
        </div>

        <footer class="section-primary">
            <div class="container">
                <div class="row">
                    <div class="col-md-5">
                        <img src="/DtoMedico/frontend/web/images/logo-puce.png" class="img-responsive pull-right" style="width: 50px">
                    </div>
                    <div class="col-md-7" style="padding: 10px;">
                        PONTIFICIA UNIVERSIDAD CATÓLICA DEL ECUADOR<br>SEDE ESMERALDAS
                    </div>
                </div>
            </div>
        </footer>

        <?php $this->endBody() ?>
    </body>
</html>
<?php $this->endPage() ?>
