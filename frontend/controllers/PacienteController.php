<?php

namespace frontend\controllers;

use Yii;
use app\models\Paciente;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\httpclient\Client;
use yii\helpers\Json;
use yii\data\ArrayDataProvider;

/**
 * PacienteController implements the CRUD actions for Paciente model.
 */
class PacienteController extends Controller {

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
     * Lists all Paciente models.
     * @return mixed
     */
    public function actionIndex() {
        $dataProvider = new ActiveDataProvider([
            'query' => Paciente::find(),
        ]);

        return $this->render('index', [
                    'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Paciente model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id) {
        return $this->render('view', [
                    'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Paciente model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate() {
        $model = new Paciente();
       

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            $client = new Client(['baseUrl' => 'http://mundogya.com/servicios/frontend/web/']);
            if ($model->tipo_paciente === 'estudiantes') {
                $response = $client->createRequest()
                        ->setUrl($model->tipo_paciente . '?nummatricula=' . $model->num_matricula)//toma los datos del controlador estudiantes del servicio que nos estan dando
                        //->setMethod('post')
                        //->setData(['nummatricula'=>9854])busca por matricula, esto sera remplazado por el nombre del campo del formulario
                        ->addHeaders(['content-type' => 'application/json'])
                        ->send();
            } else {
                $response = $client->createRequest()
                        ->setUrl($model->tipo_paciente . '?cedula=' . $model->cedula)//toma los datos del controlador estudiantes del servicio que nos estan dando
                        //->setMethod('post')
                        //->setData(['nummatricula'=>9854])busca por matricula, esto sera remplazado por el nombre del campo del formulario
                        ->addHeaders(['content-type' => 'application/json'])
                        ->send();
            }
            $data = Json::decode($response->content);
            $dataProvider = new ArrayDataProvider([
                'allModels' => $data,
                'pagination' => [
                    'pageSize' => 10,
                ],
            ]);
            return $this->render('../site/historia', [
                        'dataProvider' => $dataProvider,
                        'id_paciente' => $model->id_paciente,
            ]);
        } else {
            return $this->render('create', [
                        'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Paciente model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id) {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id_paciente]);
        } else {
            return $this->render('update', [
                        'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Paciente model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id) {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Paciente model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Paciente the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id) {
        if (($model = Paciente::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

}
