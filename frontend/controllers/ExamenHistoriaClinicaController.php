<?php

namespace frontend\controllers;

use Yii;
use frontend\models\ExamenHistoriaClinica;
use frontend\models\ExamenHistoriaClinicaSearch;
use app\models\Indicaciones;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use \yii\web\Response;
use yii\helpers\Html;
use frontend\models\Model;
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
     * @param integer $idExamen
     * @param integer $id_paciente
     * @return mixed
     */
    public function actionView($idExamen, $id_paciente)
    {   
        $request = Yii::$app->request;
        if($request->isAjax){
            Yii::$app->response->format = Response::FORMAT_JSON;
            return [
                    'title'=> "ExamenHistoriaClinica #".$idExamen, $id_paciente,
                    'content'=>$this->renderAjax('view', [
                        'model' => $this->findModel($idExamen, $id_paciente),
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                            Html::a('Edit',['update','idExamen, $id_paciente'=>$idExamen, $id_paciente],['class'=>'btn btn-primary','role'=>'modal-remote'])
                ];    
        }else{
            return $this->render('view', [
                'model' => $this->findModel($idExamen, $id_paciente),
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

        $model = new \app\models\ExamenHistoriaClinica();  
        $modelExamen = [new Indicaciones];
        $modelIndicaciones = [[new Indicaciones]];
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
                        'modelsExamen' => (empty($modelExamen)) ? [new Indicaciones] : $modelExamen,
                        'modelsIndicaciones' => (empty($modelIndicaciones)) ? [[new Indicaciones]] : $modelIndicaciones
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                                Html::button('Save',['class'=>'btn btn-primary','type'=>"submit"])
        
                ];         
            }else if($model->load($request->post())){
                $modelsExamen = Model::createMultiple(Indicaciones::classname());
            Model::loadMultiple($modelsExamen, Yii::$app->request->post());

            // validate person and houses models
            $valid = $model->validate();
            $valid = Model::validateMultiple($modelsExamen) && $valid;

            if (isset($_POST['Indicaciones'][0][0])) {
                foreach ($_POST['Indicaciones'] as $indexExamen => $indicaciones) {
                    foreach ($indicaciones as $indexIndicacion => $indicacion) {
                        $data['indicacion'] = $indicacion;
                        $modelIndicacion = new Indicaciones;
                        $modelIndicacion->load($data);
                        $modelsIndicacion[$indexExamen][$indexIndicacion] = $modelIndicacion;
                        $valid = $modelIndicacion->validate();
                        echo $data['indicacion'].'<br>';
                    }

                }

            }
die();
            if ($valid) {
                $transaction = Yii::$app->db->beginTransaction();
                try {
                    if ($flag = $model->save(false)) {
                        foreach ($modelsExamen as $indexExamen => $modelExamen) {

                            if ($flag === false) {
                                break;
                            }

                            $modelExamen->idExamen = $model->idExamen;
                            $modelExamen->id_paciente = $model->id_paciente;

                            if (!($flag = $modelExamen->save(false))) {
                                break;
                            }

                            if (isset($modelsIndicacion[$indexExamen]) && is_array($modelsIndicacion[$indexExamen])) {
                                foreach ($modelsIndicacion[$indexExamen] as $indexIndicacion => $modelIndicacion) {
                                    $modelIndicacion->idExamen = $model->idExamen;
                                    $modelIndicacion->id_paciente = $model->id_paciente;
                                    if (!($flag = $modelIndicacion->save(false))) {
                                        break;
                                    }
                                }
                            }
                        }
                    }

                    if ($flag) {
                        $transaction->commit();
                        return $this->redirect(['view', 'id' => $model->id_paciente]);
                    } else {
                        $transaction->rollBack();
                    }
                } catch (Exception $e) {
                    $transaction->rollBack();
                }
            }else{
                return [
                    'title'=> "Crear ExamenHistoriaClinica",
                    'content'=>$this->renderAjax('create', [
                        'model' => $model,
                        'modelsExamen' => (empty($modelExamen)) ? [new Indicaciones] : $modelExamen,
                        'modelsIndicaciones' => (empty($modelIndicaciones)) ? [[new Indicaciones]] : $modelIndicaciones
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                                Html::button('Save',['class'=>'btn btn-primary','type'=>"submit"])
        
                ];
            }
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
                        'modelsExamen' => (empty($modelExamen)) ? [new Indicaciones] : $modelExamen,
                        'modelsIndicaciones' => (empty($modelIndicaciones)) ? [[new Indicaciones]] : $modelIndicaciones
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                                Html::button('Save',['class'=>'btn btn-primary','type'=>"submit"])
        
                ];         
            }
        }else{
            /*
            *   Process for non-ajax request
            */
            if ($model->load($request->post()) && $model->save()) {
                return $this->redirect(['view', 'idExamen' => $model->idExamen, 'id_paciente' => $model->id_paciente]);
            } else {
                return $this->render('create', [
                    'model' => $model,
                    'modelsExamen' => (empty($modelExamen)) ? [new Indicaciones] : $modelExamen,
                    'modelsIndicaciones' => (empty($modelIndicaciones)) ? [[new Indicaciones]] : $modelIndicaciones
                ]);
            }
        }
       
    }
 public function multiple(){
            $modelsExamen = Model::createMultiple(ExamenHistoriaClinica::classname());
            Model::loadMultiple($modelsExamen, Yii::$app->request->post());

            // validate person and houses models
            $valid = $model->validate();
            $valid = Model::validateMultiple($modelsExamen) && $valid;

            if (isset($_POST['indicacion'][0][0])) {
                foreach ($_POST['indicacion'] as $indexExamen => $indicaciones) {
                    foreach ($indicacioness as $indexIndicacionn => $indicacion) {
                        $data['indicacion'] = $examen;
                        $modelIndicacion = new ExamenHistoriaClinica;
                        $modelIndicacion->load($data);
                        $modelsIndicacion[$indexExamen][$indexIndicacion] = $modelIndicacion;
                        $valid = $modelIndicacion->validate();
                    }
                }
            }

            if ($valid) {
                $transaction = Yii::$app->db->beginTransaction();
                try {
                    if ($flag = $model->save(false)) {
                        foreach ($modelsExamen as $indexExamen => $modelExamen) {

                            if ($flag === false) {
                                break;
                            }

                            $modelExamen->idExamen = $model->idExamen;
                            $modelExamen->id_paciente = $model->id_paciente;

                            if (!($flag = $modelExamen->save(false))) {
                                break;
                            }

                            if (isset($modelsIndicacion[$indexExamen]) && is_array($modelsIndicacion[$indexExamen])) {
                                foreach ($modelsIndicacion[$indexExamen] as $indexIndicacion => $modelIndicacion) {
                                    $modelIndicacion->idExamen = $model->idExamen;
                                    $modelIndicacion->id_paciente = $model->id_paciente;
                                    if (!($flag = $modelIndicacion->save(false))) {
                                        break;
                                    }
                                }
                            }
                        }
                    }

                    if ($flag) {
                        $transaction->commit();
                        return $this->redirect(['view', 'id' => $model->id_paciente]);
                    } else {
                        $transaction->rollBack();
                    }
                } catch (Exception $e) {
                    $transaction->rollBack();
                }
            }
 }
    /**
     * Updates an existing ExamenHistoriaClinica model.
     * For ajax request will return json object
     * and for non-ajax request if update is successful, the browser will be redirected to the 'view' page.
     * @param integer $idExamen
     * @param integer $id_paciente
     * @return mixed
     */
    public function actionUpdate($idExamen, $id_paciente)
    {
        $request = Yii::$app->request;
        $model = $this->findModel($idExamen, $id_paciente);       

        if($request->isAjax){
            /*
            *   Process for ajax request
            */
            Yii::$app->response->format = Response::FORMAT_JSON;
            if($request->isGet){
                return [
                    'title'=> "Update ExamenHistoriaClinica #".$idExamen, $id_paciente,
                    'content'=>$this->renderAjax('update', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                                Html::button('Save',['class'=>'btn btn-primary','type'=>"submit"])
                ];         
            }else if($model->load($request->post()) && $model->save()){
                return [
                    'forceReload'=>'#crud-datatable-pjax',
                    'title'=> "ExamenHistoriaClinica #".$idExamen, $id_paciente,
                    'content'=>$this->renderAjax('view', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                            Html::a('Edit',['update','idExamen, $id_paciente'=>$idExamen, $id_paciente],['class'=>'btn btn-primary','role'=>'modal-remote'])
                ];    
            }else{
                 return [
                    'title'=> "Update ExamenHistoriaClinica #".$idExamen, $id_paciente,
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
            if ($model->load($request->post()) && $model->save()) {
                return $this->redirect(['view', 'idExamen' => $model->idExamen, 'id_paciente' => $model->id_paciente]);
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
     * @param integer $idExamen
     * @param integer $id_paciente
     * @return mixed
     */
    public function actionDelete($idExamen, $id_paciente)
    {
        $request = Yii::$app->request;
        $this->findModel($idExamen, $id_paciente)->delete();

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
     * @param integer $idExamen
     * @param integer $id_paciente
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

    /**
     * Finds the ExamenHistoriaClinica model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $idExamen
     * @param integer $id_paciente
     * @return ExamenHistoriaClinica the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($idExamen, $id_paciente)
    {
        if (($model = ExamenHistoriaClinica::findOne(['idExamen' => $idExamen, 'id_paciente' => $id_paciente])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
