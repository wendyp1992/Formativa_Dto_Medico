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
                'brandLabel' => 'App',
                'brandUrl' => Yii::$app->homeUrl,
                'options' => [
                    'class' => 'navbar-inverse navbar-fixed-top',
                ],
            ]);
            $menuItems = [
                ['label' => 'Home', 'url' => ['/site/index']],
            ];
            if (Yii::$app->user->isGuest) {
                $menuItems[] = ['label' => 'Login', 'url' => ['/user/login']];
            } else {
                $menuItems = [
                    ['label' => 'Inicio', 'url' => ['/site/index']],
                    //['label' => 'FRONTEND', 'url' => '../../frontend/web','visible' => Yii::$app->user->identity->isAdmin || Yii::$app->user->can('admin'),],
                ];
                $menuItems[] = [
                    'label' => 'Administración',
                    'visible' => Yii::$app->user->identity->isAdmin || Yii::$app->user->can('admin'),
                    'items' => [
                        ['label' => 'Usuarios', 'url' => ['/user/admin/index'],],
                    ],
                ];
          
                $menuItems[] = [
                    'label' => 'Auditoría',
                    'visible' => Yii::$app->user->identity->isAdmin || Yii::$app->user->can('admin'),
                    'items' => [
                        ['label' => 'Accesos', 'url' => ['/audit/entry'],],
                        
                        ['label' => 'Acciones', 'url' => ['/audit/trail'],],

                         ['label' => 'Inicio de sesión', 'url' => ['/logs/index'],],

                    ],
                ];

                $menuItems[] = '<li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Perfil <b class="caret"></b></a>'
                               .'<ul id="w4" class="dropdown-menu">'
                                .'<li><a href="'.Yii::$app->homeUrl.'user/settings/account" tabindex="-1">Mi cuenta</a></li>'
                        .'<li>'
                        . Html::beginForm(['/site/logout'], 'post')
                        . Html::submitButton(
                                'Salir (' . Yii::$app->user->identity->username . ')', ['class' => 'btn btn-link']
                        )
                        . Html::endForm()
                        . '</li>'
                        . '</ul>';
            }
            echo Nav::widget([
                'options' => ['class' => 'navbar-nav navbar-right'],
                'items' => $menuItems,
            ]);
            NavBar::end();
            ?>

            <div class="container">
<?=
Breadcrumbs::widget([
    'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
])
?>
                <?= Alert::widget() ?>
                <?= $content ?>
            </div>
        </div>

        <footer class="footer">
            <div class="container">
                <p class="pull-left">&copy; PUCESE <?= date('Y') ?></p>

                <!--p class="pull-right">< ?= Yii::powered() ?></p-->
            </div>
        </footer>

        <?php $this->endBody() ?>
    </body>
</html>
<?php $this->endPage() ?>
