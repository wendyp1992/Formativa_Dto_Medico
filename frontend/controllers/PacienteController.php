<?php

namespace frontend\controllers;

use Yii;
use app\models\Paciente;
use app\models\Dependiente;
use frontend\models\PacienteSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use \yii\web\Response;
use yii\helpers\Html;
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
            'access' => [
                'class' => \yii\filters\AccessControl::className(),
                'rules' => [
                    [//permitir solo a los logueados ver la información
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
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
     * Lists all Paciente models.
     * @return mixed
     */
    public function actionIndex() {
        $searchModel = new PacienteSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
                    'searchModel' => $searchModel,
                    'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Paciente model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id) {
        $request = Yii::$app->request;
        if ($request->isAjax) {
            Yii::$app->response->format = Response::FORMAT_JSON;
            return [
                'title' => "Paciente #" . $id,
                'content' => $this->renderAjax('view', [
                    'model' => $this->findModel($id),
                ]),
                'footer' => Html::button('Close', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                Html::a('Edit', ['update', 'id' => $id], ['class' => 'btn btn-primary', 'role' => 'modal-remote'])
            ];
        } else {
            return $this->render('view', [
                        'model' => $this->findModel($id),
            ]);
        }
    }

    /**
     * Creates a new Paciente model.
     * For ajax request will return json object
     * and for non-ajax request if creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate() {
        $request = Yii::$app->request;
        $model = new Paciente();
        $modelP = new Paciente();
        $dataProvider = new ArrayDataProvider([
            'allModels' => null,
        ]);
        if ($request->isAjax) {
            Yii::$app->response->format = Response::FORMAT_JSON;
            if ($request->isGet) {
                return [
                    'title' => "Crear Nuevo Paciente",
                    'content' => $this->renderAjax('create', [
                        'model' => $model,
                        'modelP' => $modelP,
                        'dataProvider' => $dataProvider,
                ])];
            } else if ($model->load($request->post()) && $model->save()) {
                return [
                    'forceReload' => '#crud-datatable-pjax',
                    'title' => "Crear Nuevo Paciente",
                    'content' => '<span class="text-success">Paciente Creado con Éxito</span>',
                    'footer' => Html::button('Cerrar', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                    Html::a('Crear Más', ['create'], ['class' => 'btn btn-primary', 'role' => 'modal-remote'])
                ];
            } else {
                return [
                    'title' => "Crear Nuevo Paciente",
                    'content' => $this->renderAjax('create', [
                        'model' => $model,
                        'modelP' => $modelP,
                        'dataProvider' => $dataProvider,
                    ]),
                    'footer' => Html::button('Cerrar', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                    Html::button('Guardar', ['class' => 'btn btn-primary', 'type' => "submit"])
                ];
            }
        } else {
            try {

                if ($model->load($request->post()) && $model->save()) {
                    $client = new Client(['baseUrl' => 'http://mundogya.com/servicios/frontend/web/']);
                    if ($model->tipo_paciente == 'Estudiante') {
                        $response = $client->createRequest()
                                ->setUrl('estudiantes?nummatricula=' . $model->num_matricula)//toma los datos del controlador estudiantes del servicio que nos estan dando
                                ->addHeaders(['content-type' => 'application/json'])
                                ->send();
                        $data = Json::decode($response->content);
                        $dataProvider = new ArrayDataProvider([
                            'allModels' => $data,
                            'pagination' => [
                                'pageSize' => 10,
                            ],
                        ]);
                        $model->cedula = $dataProvider->allModels[0]['E_cedula'];
                        $model->save();
                    } else {
                        $response = $client->createRequest()
                                ->setUrl('trabajadores?cedula=' . $model->cedula)//toma los datos del controlador estudiantes del servicio que nos estan dando
                                ->addHeaders(['content-type' => 'application/json'])
                                ->send();
                        $data = Json::decode($response->content);
                        $dataProvider = new ArrayDataProvider([
                            'allModels' => $data,
                            'pagination' => [
                                'pageSize' => 10,
                            ],
                        ]);
                        $model->cedula = $dataProvider->allModels[0]['cedula'];
                        $model->save();
                    }
                    return $this->redirect(['historia-clinica/create', 'id_paciente' => $model->id_paciente]);
                } else {
                    if ($model->load(Yii::$app->request->post()) && $model->save()) {
                        return $this->redirect(['historia-clinica/create', 'id_paciente' => $modelP->id_paciente]);
                    } else {
                        return $this->render('create', [
                                    'model' => $model,
                                    'modelP' => $modelP,
                                    'dataProvider' => $dataProvider,
                        ]);
                    }
                }
            } catch (\yii\base\Exception $e) {
                $model->delete();
                print(" - Error de Comunicación con el Servidor, Verifique la conexión a Internet!\n");
            }
        }
    }

    /**
     * Updates an existing Paciente model.
     * For ajax request will return json object
     * and for non-ajax request if update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id) {
        $request = Yii::$app->request;
        $model = $this->findModel($id);

        if ($request->isAjax) {
            /* Process for ajax request */
            Yii::$app->response->format = Response::FORMAT_JSON;
            if ($request->isGet) {
                return [
                    'title' => "Actualizar Paciente #" . $id,
                    'content' => $this->renderAjax('update', [
                        'model' => $model,
                    ]),
                    'footer' => Html::button('Cerrar', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                    Html::button('Guardar', ['class' => 'btn btn-primary', 'type' => "submit"])
                ];
            } else if ($model->load($request->post()) && $model->save()) {
                return [
                    'forceReload' => '#crud-datatable-pjax',
                    'title' => "Paciente #" . $id,
                    'content' => $this->renderAjax('view', [
                        'model' => $model,
                    ]),
                    'footer' => Html::button('Cerrar', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                    Html::a('Editar', ['update', 'id' => $id], ['class' => 'btn btn-primary', 'role' => 'modal-remote'])
                ];
            } else {
                return [
                    'title' => "Update Paciente #" . $id,
                    'content' => $this->renderAjax('update', [
                        'model' => $model,
                    ]),
                    'footer' => Html::button('Cerrar', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                    Html::button('Guardar', ['class' => 'btn btn-primary', 'type' => "submit"])
                ];
            }
        } else {
            /*
             *   Process for non-ajax request
             */
            if ($model->load($request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->id_paciente]);
            } else {
                return $this->render('update', [
                            'model' => $model,
                ]);
            }
        }
    }

    /**
      ACCION ELIMINAR PACIENTE - HISTORIA CLINICA Y ANTECEDENTES
     */
    public function actionDelete($id) {
        $request = Yii::$app->request;
        $paciente = $this->findModel($id);
        if ($paciente->tipo_paciente == 'Dependiente') {
            $dependiente = \app\models\Dependiente::findOne($id);
            $dependiente->delete();
        }

        $paciente->delete();
        if ($request->isAjax) {
            Yii::$app->response->format = Response::FORMAT_JSON;
            return ['forceClose' => true, 'forceReload' => '#crud-datatable-pjax'];
        } else {
            return $this->redirect(['index']);
        }
    }

    /**
     * Delete multiple existing Paciente model.
     * For ajax request will return json object
     * and for non-ajax request if deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionBulkDelete() {
        $request = Yii::$app->request;
        $pks = explode(',', $request->post('pks')); // Array or selected records primary keys
        foreach ($pks as $pk) {
            $model = $this->findModel($pk);
            if ($model->tipo_paciente == 'Dependiente') {
                $dependiente = \app\models\Dependiente::findOne($pk);
                $dependiente->delete();
            }
            $model->delete();
        }
        if ($request->isAjax) {

            Yii::$app->response->format = Response::FORMAT_JSON;
            return ['forceClose' => true, 'forceReload' => '#crud-datatable-pjax'];
        } else {
            return $this->redirect(['index']);
        }
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
