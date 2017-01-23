<?php

namespace frontend\controllers;

use Yii;
use app\models\HistoriaClinica;
use app\models\Paciente;
use app\models\Antecedentes;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\httpclient\Client;
use yii\helpers\Json;
use yii\data\ArrayDataProvider;

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
     * Creates a new HistoriaClinica model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionDependiente() {
        $model = new HistoriaClinica();
        $modelP = new Paciente();
        $antecedentes = new Antecedentes();
        $dataProvider = new ArrayDataProvider([
                'allModels' => null,
            ]);
        if ($modelP->load(Yii::$app->request->post())) {
            $client = new Client(['baseUrl' => 'http://mundogya.com/servicios/frontend/web/']);
            $response = $client->createRequest()
                    ->setUrl($modelP->tipo_paciente . '?cedula=' . $modelP->cedula)//toma los datos del controlador 
                    //->setMethod('post')
                    //->setData(['nummatricula'=>9854])busca por matricula, esto sera remplazado por el nombre del campo del formulario
                    ->addHeaders(['content-type' => 'application/json'])
                    ->send();
            $data = Json::decode($response->content);
            $dataProvider = new ArrayDataProvider([
                'allModels' => $data,
                'pagination' => [
                    'pageSize' => 10,
                ],
            ]);
            if (isset($dataProvider)) {
                //$modelP->id_paciente = $antecedentes->id_paciente;
                $modelP->cedula = $dataProvider->allModels[0]['cedula'];
                $modelP->fecha_regPaciente = date('Y-m-d h:m:s');
                $modelP->save();
                $model->id_paciente = $modelP->id_paciente;
            }else{
                $dataProvider->allModels[0]['nombres']="";
                $dataProvider->allModels[0]['telefono']="";
                $dataProvider->allModels[0]['departamento']="";
            }
            return $this->render('createdependiente', [
                        'dataProvider' => $dataProvider,
                        'id_paciente' => $modelP->id_paciente,
                        'model' => $model,
                        'modelP' => $modelP,
                        'antecedentes' => $antecedentes,
            ]);
        } else {

            return $this->render('createdependiente', [
                        'model' => $model,
                        'modelP' => $modelP,
                        'dataProvider' => $dataProvider,
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
