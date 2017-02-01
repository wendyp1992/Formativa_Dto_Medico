<?php
/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use frontend\assets\AppAsset;
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
                //$menuItems[] = ['label' => 'Signup', 'url' => ['/site/signup']];
                $menuItems[] = ['label' => 'Entrar', 'url' => ['/user/security/login']];
            } else {
                $menuItems[] = [
                    'label' => 'ADMINISTRACIÓN',
                    'items' => [
                        [
                            'label' => 'Historia Clínica Paciente',
                            'url' => ['/paciente'],
                        ],
                        [
                            'label' => 'Historia Clínica Dependiente',
                            'url' => ['/dependiente'],
                        ],
                        [
                            'label' => 'Hoja Evolución',
                            'url' => ['/cita-medica/create'],
                        ],
                        '<li class="divider"></li>',
                        [
                            'label' => 'Emisión de Exámenes',
                            'url' => ['/examen-historia-clinica'],
                        ],
//                        [
//                            'label' => 'Agendar Cita',
//                            'url' => ['/'],
//                        ],
                        [
                            'label' => 'Certificado Médico',
                            'url' => ['/certificado-medico/create'],
                        ],
                    ],
                ];
                $menuItems[] = [
                    'label' => 'REPORTES',
                    'items' => [
//                        [
//                            'label' => 'Medicamentos en Stock',
//                            'url' => ['/'],
//                        ],
//                        [
//                            'label' => 'Medicamentos por caducar',
//                            'url' => ['/'],
//                        ],
                        [
                            'label' => 'Pacientes Atendidos',
                            //clasificar por estudiantes, trabajadores y dependientes y brindarlo por servicio despues
                            'url' => ['/reportepacientes'],
                        ],
                        [
                            'label' => 'Emisión de copia de Certificado',
                            'url' => ['/certificado-medico/index'],
                        ],
                    ],
                ];
                $menuItems[] = [
                    'label' => Yii::$app->user->identity->username,
                    'items' => [
                        [
                            'label' => 'Perfil de Usuario',
                            'url' => ['/user/settings/profile'],
                        ],
                        [
                            'label' => 'Ir a Escritorio',
                            'url' => ['/../../backend/web'],
                        ],
                        '<li class="divider"></li>',
                        [
                            'label' => 'Salir del Sistema',
                            'url' => ['/user/security/logout'],
                            'linkOptions' => ['data-method' => 'post']
                        ],
                    ],
                ];
            }
            echo Nav::widget([
                'options' => ['class' => 'navbar-nav navbar-right'],
                'items' => $menuItems,
            ]);
            NavBar::end();
            ?>

            <div class="container" >
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
