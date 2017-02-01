<?php

namespace frontend\controllers;

use Yii;
use app\models\RecetaDetalle;
use frontend\models\RecetaDetalleSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use \yii\web\Response;
use yii\helpers\Html;
use kartik\mpdf\Pdf;

/**
 * RecetaDetalleController implements the CRUD actions for RecetaDetalle model.
 */
class RecetaDetalleController extends Controller {

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
     * Lists all RecetaDetalle models.
     * @return mixed
     */
    public function actionIndex() {
        $searchModel = new RecetaDetalleSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
                    'searchModel' => $searchModel,
                    'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single RecetaDetalle model.
     * @param integer $id_cita
     * @param integer $id_medicamento
     * @return mixed
     */
    public function actionView($id_cita, $id_medicamento) {
        $request = Yii::$app->request;
        if ($request->isAjax) {
            Yii::$app->response->format = Response::FORMAT_JSON;
            return [
                'title' => "RecetaDetalle #" . $id_cita, $id_medicamento,
                'content' => $this->renderAjax('view', [
                    'model' => $this->findModel($id_cita, $id_medicamento),
                ]),
                'footer' => Html::button('Close', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                Html::a('Edit', ['update', 'id_cita, $id_medicamento' => $id_cita, $id_medicamento], ['class' => 'btn btn-primary', 'role' => 'modal-remote'])
            ];
        } else {
            return $this->render('view', [
                        'model' => $this->findModel($id_cita, $id_medicamento),
            ]);
        }
    }

    /**
     * Creates a new RecetaDetalle model.
     * For ajax request will return json object
     * and for non-ajax request if creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate() {
        $request = Yii::$app->request;
        $model = new RecetaDetalle();
        $id_cita = $_GET['id_cita'];
        $searchModel = new RecetaDetalleSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        if ($request->isAjax) {
            Yii::$app->response->format = Response::FORMAT_JSON;
            if ($request->isGet) {
                return [
                    'title' => "Create new RecetaDetalle",
                    'content' => $this->renderAjax('create', [
                        'model' => $model,
                        'id_cita' => $id_cita,
                        'searchModel' => $searchModel,
                        'dataProvider' => $dataProvider,
                    ]),
                    'footer' => Html::button('Close', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                    Html::button('Save', ['class' => 'btn btn-primary', 'type' => "submit"])
                ];
            } else if ($model->load($request->post()) && $model->save()) {
                return [
                    'forceReload' => '#crud-datatable-pjax',
                    'title' => "Create new RecetaDetalle",
                    'content' => '<span class="text-success">Create RecetaDetalle success</span>',
                    'footer' => Html::button('Close', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                    Html::a('Create More', ['create'], ['class' => 'btn btn-primary', 'role' => 'modal-remote'])
                ];
            } else {
                return [
                    'title' => "Create new RecetaDetalle",
                    'content' => $this->renderAjax('create', [
                        'model' => $model,
                        'id_cita' => $id_cita,
                        'searchModel' => $searchModel,
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
            return $this->redirect(['create', 'id_cita' => $model->id_cita, 'id_medicamento'=>$model->id_medicamento]);
            } else {
                return $this->render('create', [
                            'model' => $model,
                            'id_cita' => $id_cita,
                            'searchModel' => $searchModel,
                            'dataProvider' => $dataProvider,
                ]);
            }
        }
    }

    /**
     * Updates an existing RecetaDetalle model.
     * For ajax request will return json object
     * and for non-ajax request if update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id_cita
     * @param integer $id_medicamento
     * @return mixed
     */
    public function actionUpdate($id_cita, $id_medicamento) {
        $request = Yii::$app->request;
        $model = $this->findModel($id_cita, $id_medicamento);

        if ($request->isAjax) {
            /*
             *   Process for ajax request
             */
            Yii::$app->response->format = Response::FORMAT_JSON;
            if ($request->isGet) {
                return [
                    'title' => "Update RecetaDetalle #" . $id_cita, $id_medicamento,
                    'content' => $this->renderAjax('update', [
                        'model' => $model,
                    ]),
                    'footer' => Html::button('Close', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                    Html::button('Save', ['class' => 'btn btn-primary', 'type' => "submit"])
                ];
            } else if ($model->load($request->post()) && $model->save()) {
                return [
                    'forceReload' => '#crud-datatable-pjax',
                    'title' => "RecetaDetalle #" . $id_cita, $id_medicamento,
                    'content' => $this->renderAjax('view', [
                        'model' => $model,
                    ]),
                    'footer' => Html::button('Close', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                    Html::a('Edit', ['update', 'id_cita, $id_medicamento' => $id_cita, $id_medicamento], ['class' => 'btn btn-primary', 'role' => 'modal-remote'])
                ];
            } else {
                return [
                    'title' => "Update RecetaDetalle #" . $id_cita, $id_medicamento,
                    'content' => $this->renderAjax('update', [
                        'model' => $model,
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
                return $this->redirect(['view', 'id_cita' => $model->id_cita]);
            } else {
                return $this->render('update', [
                            'model' => $model,
                ]);
            }
        }
    }

    /**
     * Delete an existing RecetaDetalle model.
     * For ajax request will return json object
     * and for non-ajax request if deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id_cita
     * @param integer $id_medicamento
     * @return mixed
     */
    public function actionDelete($id_cita, $id_medicamento) {
        $request = Yii::$app->request;
        $this->findModel($id_cita, $id_medicamento)->delete();

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
            return $this->redirect(['/receta-detalle/create', 'id_cita'=>$id_cita]);
        }
    }

    /**
     * Delete multiple existing RecetaDetalle model.
     * For ajax request will return json object
     * and for non-ajax request if deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id_cita
     * @param integer $id_medicamento
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

    public function actionReportes($id_cita) {
        $pdf = new Pdf([
            'mode' => Pdf::MODE_CORE, // leaner size using standard fonts
            'content' => $this->renderPartial('receta_pdf', ['model' => $this->findModel1($id_cita)]),
            'options' => [
                'title' => 'Receta',
                'subject' => 'Receta PUCESE'
            ],
            'methods' => [
                'SetHeader' => ['Generado Por PUCESE||Fecha : ' . date("r")],
                'SetFooter' => ['|Pagina {PAGENO}|'],
            ]
        ]);
        return $pdf->render();
    }

    /**
     * Finds the RecetaDetalle model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id_cita
     * @param integer $id_medicamento
     * @return RecetaDetalle the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    
    protected function findModel1($id_cita) {
        if (($model = RecetaDetalle::findOne(['id_cita' => $id_cita])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
    
    protected function findModel($id_cita, $id_medicamento) {
        if (($model = RecetaDetalle::findOne(['id_cita' => $id_cita, 'id_medicamento' => $id_medicamento])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

}
