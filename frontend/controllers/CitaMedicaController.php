<?php

namespace frontend\controllers;

use Yii;
use app\models\CitaMedica;
use frontend\models\SearchCitaMedica;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * CitaMedicaController implements the CRUD actions for CitaMedica model.
 */
class CitaMedicaController extends Controller {

    /**
     * @inheritdoc
     */
    public function behaviors() {
        return [
            'access' => [
                'class' => \yii\filters\AccessControl::className(),
                'rules' => [
                    [ //permitir solo a los logueados ver la información
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all CitaMedica models.
     * @return mixed
     */
    public function actionIndex() {
        $searchModel = new SearchCitaMedica();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
                    'searchModel' => $searchModel,
                    'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single CitaMedica model.
     * @param integer $id_cita
     * @param integer $id_paciente
     * @return mixed
     */
    public function actionView($id_cita, $id_paciente) {
        return $this->render('view', [
                    'model' => $this->findModel($id_cita, $id_paciente),
        ]);
    }

    /**
     * Creates a new CitaMedica model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate() {
        $model = new CitaMedica();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['index']);
        } else {
            return $this->render('create', [
                        'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing CitaMedica model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id_cita
     * @param integer $id_paciente
     * @return mixed
     */
    public function actionUpdate($id_cita, $id_paciente) {
        $model = $this->findModel($id_cita, $id_paciente);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id_cita' => $model->id_cita, 'id_paciente' => $model->id_paciente]);
        } else {
            return $this->render('update', [
                        'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing CitaMedica model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id_cita
     * @param integer $id_paciente
     * @return mixed
     */
    public function actionDelete($id_cita, $id_paciente) {
        $this->findModel($id_cita, $id_paciente)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the CitaMedica model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id_cita
     * @param integer $id_paciente
     * @return CitaMedica the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_cita, $id_paciente) {
        if (($model = CitaMedica::findOne(['id_cita' => $id_cita, 'id_paciente' => $id_paciente])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

}
