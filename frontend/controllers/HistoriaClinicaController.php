<?php

namespace frontend\controllers;

use Yii;
use app\models\HistoriaClinica;
use app\models\Antecedentes;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * HistoriaClinicaController implements the CRUD actions for HistoriaClinica model.
 */
class HistoriaClinicaController extends Controller {

    /**
     * @inheritdoc
     */
    public function behaviors() {
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
     * Lists all HistoriaClinica models.
     * @return mixed
     */
    public function actionIndex() {
        $dataProvider = new ActiveDataProvider([
            'query' => HistoriaClinica::find(),
        ]);

        return $this->render('index', [
                    'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single HistoriaClinica model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id) {
        return $this->render('view', [
                    'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new HistoriaClinica model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate() {
        $model = new HistoriaClinica();
        $antecedentes = new Antecedentes();
        $id_paciente = \app\models\Paciente::findOne(['id_paciente' => $_GET['id_paciente']]);
        if ($model->load(Yii::$app->request->post()) && $antecedentes->load(Yii::$app->request->post())) {
            $model->id_paciente = $antecedentes->id_paciente;
            $model->fecha_regHistoria = date('Y-m-d h:m:s');
            $model->save();
            $antecedentes->save();
            return $this->redirect(['view', 'id' => $model->id_paciente]);
        } else {
            $model->id_paciente = $id_paciente->id_paciente;
            $antecedentes->id_paciente = $id_paciente->id_paciente;
            return $this->render('create', [
                        'model' => $model,
                        'antecedentes' => $antecedentes,
            ]);
        }
    }

    /**
     * Updates an existing HistoriaClinica model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id) {
        $model = $this->findModel($id);
        $antecedentes = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save() && $antecedentes->load(Yii::$app->request->post()) && $antecedentes->save()) {
            return $this->redirect(['view', 'id' => $model->id_paciente]);
        } else {
            return $this->render('update', [
                        'model' => $model,
                        'antecedentes' => $antecedentes,
            ]);
        }
    }

    /**
     * Deletes an existing HistoriaClinica model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id) {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the HistoriaClinica model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return HistoriaClinica the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id) {
        if (($model = HistoriaClinica::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

}
