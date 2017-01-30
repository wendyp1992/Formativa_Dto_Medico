<?php

namespace frontend\controllers;

use Yii;
use app\models\Dependiente;
use app\models\Paciente;
use frontend\models\DependienteSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use \yii\web\Response;
use yii\helpers\Html;
use yii\httpclient\Client;
use yii\helpers\Json;
use yii\data\ArrayDataProvider;

/**
 * DependienteController implements the CRUD actions for Dependiente model.
 */
class DependienteController extends Controller {

    /**
     * @inheritdoc
     */
    public function behaviors() {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                    'bulk-delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all Dependiente models.
     * @return mixed
     */
    public function actionIndex() {
        $searchModel = new DependienteSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
                    'searchModel' => $searchModel,
                    'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Dependiente model.
     * @param integer $id_paciente
     * @return mixed
     */
    public function actionView( $id_paciente) {
        $request = Yii::$app->request;
        if ($request->isAjax) {
            Yii::$app->response->format = Response::FORMAT_JSON;
            return [
                'title' => "Dependiente #" . $id_paciente,
                'content' => $this->renderAjax('view', [
                    'model' => $this->findModel($id_paciente),
                ]),
                'footer' => Html::button('Close', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                Html::a('Edit', ['update', 'id_paciente' =>  $id_paciente], ['class' => 'btn btn-primary', 'role' => 'modal-remote'])
            ];
        } else {
            return $this->render('view', [
                        'model' => $this->findModel($id_paciente),
            ]);
        }
    }

    /**
     * Creates a new Dependiente model.
     * For ajax request will return json object
     * and for non-ajax request if creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate() {
        $request = Yii::$app->request;
        $model = new Dependiente();
        $modelP = new Paciente();
        $sesion = Yii::$app->session;
        $dataProvider = new ArrayDataProvider([
            'allModels' => null,
        ]);

        /*
         *   Process for non-ajax request
         */
        if ($modelP->load(Yii::$app->request->post())) {
            $paciente = new Paciente();
            $client = new Client(['baseUrl' => 'http://mundogya.com/servicios/frontend/web/']);
            $response = $client->createRequest()
                    ->setUrl('trabajadores?cedula=' . $modelP->cedula)//toma los datos del controlador 
                    ->addHeaders(['content-type' => 'application/json'])
                    ->send();
            $data = Json::decode($response->content);
            $dataProvider = new ArrayDataProvider([
                'allModels' => $data,
                'pagination' => [
                    'pageSize' => 10,
                ],
            ]);

            if ($dataProvider->count != 0) {

                $paciente = Paciente::findOne(['cedula' => $modelP->cedula]);
                if (count($paciente) == 0) {
                    $paciente = new Paciente();
                    $paciente->tipo_paciente = 'Trabajador';
                    $paciente->fecha_regPaciente = date('Y-m-d h:m:s');
                    $paciente->cedula = $modelP->cedula;
                    $paciente->save();
                    $sesion->set("cedulaT", $modelP->cedula);
                }
                $sesion->set("dataProvider", $dataProvider);
                return $this->render('create', [
                            'model' => $model,
                            'modelP' => $modelP,
                            'dataProvider' => $dataProvider,
                ]);
            }
        } else {
            if ($model->load($request->post())) {
                
                if($model->validate()){
                $model->cedula_trab = $sesion->get("cedulaT");
                $paciente = Paciente::findOne(['cedula' => $model->cedula]);
                if (count($paciente) == 0) {
                    $paciente = new Paciente();
                    $paciente->tipo_paciente = 'Dependiente';
                    $paciente->fecha_regPaciente = date('Y-m-d h:m:s');
                    $paciente->cedula = $model->cedula;
                    $paciente->save();
                    $sesion->remove("cedulaT");
                }
                if ($model->save()) {

                    return $this->redirect(['view', 'id' => $model->id_paciente]);
                }
            } else {
                    if (empty($sesion->get("dataProvider"))) {
                        $dataProvider = $sesion->get("dataProvider");
                        $sesion->remove("dataProvider");
                    }
                    return $this->render('create', [
                                'model' => $model,
                                'modelP' => $modelP,
                                'dataProvider' => $dataProvider,
                    ]);
                }

            } else {
                return $this->render('create', [
                            'model' => $model,
                            'modelP' => $modelP,
                            'dataProvider' => $dataProvider,
                ]);
            }
        }
    }

    /**
     * Updates an existing Dependiente model.
     * For ajax request will return json object
     * and for non-ajax request if update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id_paciente
     * @return mixed
     */
    public function actionUpdate($id_paciente) {
        $request = Yii::$app->request;
        $model = $this->findModel($id_paciente);
        $modelP = new Paciente();
        $dataProvider = new ArrayDataProvider([
            'allModels' => null,
        ]);
        if ($request->isAjax) {
            /*
             *   Process for ajax request
             */
            Yii::$app->response->format = Response::FORMAT_JSON;
            if ($request->isGet) {
                return [
                    'title' => "Update Dependiente #" .$id_paciente,
                    'content' => $this->renderAjax('update', [
                        'model' => $model,
                        'modelP' => $modelP,
                        'dataProvider' => $dataProvider,
                    ]),
                    'footer' => Html::button('Close', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                    Html::button('Save', ['class' => 'btn btn-primary', 'type' => "submit"])
                ];
            } else if ($model->load($request->post()) && $model->save()) {
                return [
                    'forceReload' => '#crud-datatable-pjax',
                    'title' => "Dependiente #" . $id_paciente,
                    'content' => $this->renderAjax('view', [
                        'model' => $model,
                        'modelP' => $modelP,
                        'dataProvider' => $dataProvider,
                    ]),
                    'footer' => Html::button('Close', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                    Html::a('Edit', ['update', 'id_paciente' => $id_paciente], ['class' => 'btn btn-primary', 'role' => 'modal-remote'])
                ];
            } else {
                return [
                    'title' => "Update Dependiente #" . $id_paciente,
                    'content' => $this->renderAjax('update', [
                        'model' => $model,
                        'modelP' => $modelP,
                        'dataProvider' => $dataProvider,
                    ]),
                    'footer' => Html::button('Close', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                    Html::button('Save', ['class' => 'btn btn-primary', 'type' => "submit"])
                ];
            }
        } else {
            /*
             *   Process for non-ajax request
             */
            if ($model->load($request->post()) && $model->save()) {
                return $this->redirect(['view','id_paciente' => $model->id_paciente]);
            } else {
                return $this->render('update', [
                            'model' => $model,
                            'modelP' => $modelP,
                            'dataProvider' => $dataProvider,
                ]);
            }
        }
    }

    /**
     * Delete an existing Dependiente model.
     * For ajax request will return json object
     * and for non-ajax request if deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id_paciente
     * @return mixed
     */
    public function actionDelete( $id_paciente) {
        $request = Yii::$app->request;
        $this->findModel($id_paciente)->delete();

        if ($request->isAjax) {
            /*
             *   Process for ajax request
             */
            Yii::$app->response->format = Response::FORMAT_JSON;
            return ['forceClose' => true, 'forceReload' => '#crud-datatable-pjax'];
        } else {
            /*
             *   Process for non-ajax request
             */
            return $this->redirect(['index']);
        }
    }

    /**
     * Delete multiple existing Dependiente model.
     * For ajax request will return json object
     * and for non-ajax request if deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id_paciente
     * @return mixed
     */
    public function actionBulkDelete() {
        $request = Yii::$app->request;
        $pks = explode(',', $request->post('pks')); // Array or selected records primary keys
        foreach ($pks as $pk) {
            $model = $this->findModel($pk);
            $model->delete();
        }

        if ($request->isAjax) {
            /*
             *   Process for ajax request
             */
            Yii::$app->response->format = Response::FORMAT_JSON;
            return ['forceClose' => true, 'forceReload' => '#crud-datatable-pjax'];
        } else {
            /*
             *   Process for non-ajax request
             */
            return $this->redirect(['index']);
        }
    }

    /**
     * Finds the Dependiente model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id_paciente
     * @return Dependiente the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_paciente) {
        if (($model = Dependiente::findOne(['id_paciente' => $id_paciente])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

}
