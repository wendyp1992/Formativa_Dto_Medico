<?php

namespace frontend\controllers;

use Yii;
use app\models\ExamenHistoriaClinica;
use frontend\models\ExamenHistoriaClinicaSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use \yii\web\Response;
use yii\helpers\Html;
use kartik\mpdf\Pdf;

/**
 * ExamenHistoriaClinicaController implements the CRUD actions for ExamenHistoriaClinica model.
 */
class ExamenHistoriaClinicaController extends Controller
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
                    'delete' => ['post'],
                    'bulk-delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all ExamenHistoriaClinica models.
     * @return mixed
     */
    public function actionIndex()
    {    
        $searchModel = new ExamenHistoriaClinicaSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }


    /**
     * Displays a single ExamenHistoriaClinica model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {   
        $request = Yii::$app->request;
        if($request->isAjax){
            Yii::$app->response->format = Response::FORMAT_JSON;
            return [
                    'title'=> "ExamenHistoriaClinica #".$id,
                    'content'=>$this->renderAjax('view', [
                        'model' => $this->findModel($id),
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                            Html::a('Edit',['update','id'=>$id],['class'=>'btn btn-primary','role'=>'modal-remote'])
                ];    
        }else{
            return $this->render('view', [
                'model' => $this->findModel($id),
            ]);
        }
    }

    /**
     * Creates a new ExamenHistoriaClinica model.
     * For ajax request will return json object
     * and for non-ajax request if creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $request = Yii::$app->request;
        $model = new ExamenHistoriaClinica();   

        if($request->isAjax){
            /*
            *   Process for ajax request
            */
            Yii::$app->response->format = Response::FORMAT_JSON;
            if($request->isGet){
                return [
                    'title'=> "Create new ExamenHistoriaClinica",
                    'content'=>$this->renderAjax('create', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                                Html::button('Save',['class'=>'btn btn-primary','type'=>"submit"])
        
                ];         
            }else if($model->load($request->post())){
                $model->idTiposExamen = implode(",", $model->idTiposExamen);
                if($model->save()){
                    return [
                    'forceReload'=>'#crud-datatable-pjax',
                    'title'=> "Create new ExamenHistoriaClinica",
                    'content'=>'<span class="text-success">Create ExamenHistoriaClinica success</span>',
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                            Html::a('Create More',['create'],['class'=>'btn btn-primary','role'=>'modal-remote'])
        
                ]; 
                }else{
                 return [
                    'title'=> "Create new ExamenHistoriaClinica",
                    'content'=>$this->renderAjax('create', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                                Html::button('Save',['class'=>'btn btn-primary','type'=>"submit"])
        
                ]; 
                }          
            }else{           
                return [
                    'title'=> "Create new ExamenHistoriaClinica",
                    'content'=>$this->renderAjax('create', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                                Html::button('Save',['class'=>'btn btn-primary','type'=>"submit"])
        
                ];         
            }
        }else{
            /*
            *   Process for non-ajax request
            */
            if ($model->load($request->post())) {
                 if ($model->validate()) {           
                $model->idTiposExamen = implode(",", $model->idTiposExamen);
                if($model->save()){
                    return $this->redirect(['view', 'id' => $model->IdExamenHistoria]);
                }else{
                 return $this->render('create', [
                    'model' => $model,
                ]);
                }
                }
            } else {
                return $this->render('create', [
                    'model' => $model,
                ]);
            }
        }
       
    }

    /**
     * Updates an existing ExamenHistoriaClinica model.
     * For ajax request will return json object
     * and for non-ajax request if update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {

        $request = Yii::$app->request;
        $model = $this->findModel($id);       
        if($request->isAjax){
            /*
            *   Process for ajax request
            */
            Yii::$app->response->format = Response::FORMAT_JSON;
            if($request->isGet){
                return [
                    'title'=> "Update ExamenHistoriaClinica #".$id,
                    'content'=>$this->renderAjax('update', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                                Html::button('Save',['class'=>'btn btn-primary','type'=>"submit"])
                ];         
            }else 

            if($model->load($request->post())){
                // $modelIndicaciones->idExamenHistoriaClinica=$model->IdExamenHistoria;
                $model->idTiposExamen = implode(",", $model->idTiposExamen);
                if($model->save()){
                    return [
                    'forceReload'=>'#crud-datatable-pjax',
                    'title'=> "ExamenHistoriaClinica #".$id,
                    'content'=>$this->renderAjax('view', [
                        'model' => $model,
                        'modelIndicaciones'=>$model
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                            Html::a('Edit',['update','id'=>$id],['class'=>'btn btn-primary','role'=>'modal-remote'])
                ];
                }else{
                return [
                    'title'=> "Update ExamenHistoriaClinica #".$id,
                    'content'=>$this->renderAjax('update', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                                Html::button('Save',['class'=>'btn btn-primary','type'=>"submit"])
                ];    
                }    
            }else{
                 return [
                    'title'=> "Update ExamenHistoriaClinica #".$id,
                    'content'=>$this->renderAjax('update', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                                Html::button('Save',['class'=>'btn btn-primary','type'=>"submit"])
                ];        
            }
        }else{
            /*
            *   Process for non-ajax request
            */
            if ($model->load($request->post())) {
                $model->idTiposExamen = implode(",", $model->idTiposExamen);
                if($model->save()){
                    return $this->redirect(['view', 'id' => $model->IdExamenHistoria]);
                }else{
                 return $this->render('update', [
                    'model' => $model,
                ]);
                }
                
            } else {
                return $this->render('update', [
                    'model' => $model,
                ]);
            }
        }
    }

    /**
     * Delete an existing ExamenHistoriaClinica model.
     * For ajax request will return json object
     * and for non-ajax request if deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $request = Yii::$app->request;
        $this->findModel($id)->delete();

        if($request->isAjax){
            /*
            *   Process for ajax request
            */
            Yii::$app->response->format = Response::FORMAT_JSON;
            return ['forceClose'=>true,'forceReload'=>'#crud-datatable-pjax'];
        }else{
            /*
            *   Process for non-ajax request
            */
            return $this->redirect(['index']);
        }


    }

     /**
     * Delete multiple existing ExamenHistoriaClinica model.
     * For ajax request will return json object
     * and for non-ajax request if deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionBulkDelete()
    {        
        $request = Yii::$app->request;
        $pks = explode(',', $request->post( 'pks' )); // Array or selected records primary keys
        foreach ( $pks as $pk ) {
            $model = $this->findModel($pk);
            $model->delete();
        }

        if($request->isAjax){
            /*
            *   Process for ajax request
            */
            Yii::$app->response->format = Response::FORMAT_JSON;
            return ['forceClose'=>true,'forceReload'=>'#crud-datatable-pjax'];
        }else{
            /*
            *   Process for non-ajax request
            */
            return $this->redirect(['index']);
        }
       
    }
    public function actionReport($id) {
     $pdf = new Pdf([
        'mode' => Pdf::MODE_CORE, // leaner size using standard fonts
        'content' => $this->renderPartial('examen_pdf',['model'=> $this->findModel($id)]),
        'options' => [
            'title' => 'Examen',
            'subject' => 'Examenes PUCESE'
        ],
        'methods' => [
            'SetHeader' => ['Generado Por PUCESE||Fecha : ' . date("r")],
            'SetFooter' => ['|Pagina {PAGENO}|'],
        ]
    ]);
    return $pdf->render();
}

    /**
     * Finds the ExamenHistoriaClinica model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return ExamenHistoriaClinica the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = ExamenHistoriaClinica::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
