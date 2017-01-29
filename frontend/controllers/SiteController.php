<?php

namespace frontend\controllers;

use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use kartik\mpdf\Pdf;

/**
 * Site controller
 */
class SiteController extends Controller {

    /**
     * @inheritdoc
     */
    public function behaviors() {
        return [
            'AuditTrailBehavior' => [
                'class' => 'bedezign\yii2\audit\AuditTrailBehavior',
                'active' => true,
                'dateFormat' => 'Y-m-d H:i:s',
            ],
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout', 'signup'],
                'rules' => [
                    [
                        'actions' => ['signup'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions() {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * @return mixed
     */
    public function actionIndex() {
        return $this->render('index');
    }

    /* REPORTE DE PACIENTES ATENDIDOS MENSUALMENTE DIVIDIDOS POR ESTUDIANTES, TRAB Y DEPENDIENTES */

    public function actionReporte1() {
//        $mpdf= new \mPDF;
//        $mpdf->WriteHTML('hello');
//        $mpdf->Output();
//        exit;
        //http://demos.krajee.com/mpdf
        $id_reporte = \app\models\Reportepacientes::findOne(['idreporte' => $_GET['idreporte']]);
        $pdf = new Pdf([
            'content' => $this->renderPartial('reporte1', ['id_reporte' => $id_reporte]),
            // 'mode'=> Pdf::MODE_CORE,
            'format' => Pdf::FORMAT_A4,
            //'orientation'=>Pdf::ORIENT_POTRAIT,
            'destination' => Pdf::DEST_BROWSER,
            //'cssFile' => '@vendor/kartik-v/yii2-mpdf/assets/kv-mpdf-bootstrap.min.css',
            //'cssInline' => '.kv-heading-1{font-size:14px}',
            'options' => ['title' => 'Reporte de Pacientes atendidos mensualmente'],
            'methods' => [
                'setHeader' => ['Generado: ' . date("r")],
                'setFooter' => ['|Página {PAGENO}|'],
            ]
        ]);
        return $pdf->render('reporte1');
    }

    /**
     * Logs out the current user.
     *
     * @return mixed
     */
    public function actionLogout() {
        Yii::$app->user->logout();

        return $this->goHome();
    }

//    public function actionFormreporte1() {
//        $model = new \app\models\Dependiente;
//        if ($model->load(Yii::$app->request->post())) {
//            return $this->redirect(['reporte1', 'fecha_nac' => $model->fecha_nac]);
//        }
//        return $this->render('formreporte1', [
//                    'model' => $model,
//        ]);
//    }
}
