<?php

namespace frontend\controllers;

use Yii;
use common\models\CertificadoMedico;
use frontend\models\CertificadoMedicoSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use kartik\mpdf\Pdf;
/**
 * CertificadoMedicoController implements the CRUD actions for CertificadoMedico model.
 */
class CertificadoMedicoController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all CertificadoMedico models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new CertificadoMedicoSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single CertificadoMedico model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new CertificadoMedico model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new CertificadoMedico();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['reporte', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing CertificadoMedico model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing CertificadoMedico model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the CertificadoMedico model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return CertificadoMedico the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = CertificadoMedico::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    
//    public function actionReporte($id){
//        Yii::$app->response->format = 'pdf';
//        //$mpdf=new \mPDF('utf-8', 'A4-L');
//        $model = $this->findModel($id);
//        $this->layout = 'reportes/certificado';
//        return $this->render('reporte', 
//                [
//                    'model' => $model,
//                ]);        
//    }
    

    
    public function actionReporte($id) {
        $model = $this->findModel($id);
        $pdf = new Pdf([
            'content' => $this->renderPartial('reporte', [
                'model' => $model,
            ]),
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
        return $pdf->render('reporte');
    }

}
