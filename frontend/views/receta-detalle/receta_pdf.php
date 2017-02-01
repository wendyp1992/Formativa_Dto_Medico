<?php

use app\models\Paciente;
use yii\httpclient\Client;
use yii\data\ArrayDataProvider;
use yii\helpers\Json;

$HomeUrl = yii\helpers\Url::base();
?>

<table>
    <tr>
        <td><IMG SRC=<?php echo $HomeUrl ?>/images/logo.jpg WIDTH=100>
        </td>
        <td><h3>PONTIFICIA UNIVERSIDAD CATÓLICA DEL ECUADOR</h3>
    <center><h5>SEDE ESMERALDAS</h5></center>
</td>
</tr>
</table>
<br><br>    	
<b><h2 ALIGN=center>SERVICIO MÉDICO</h2></b><br>
<b><p ALIGN=right>Esmeraldas, <?php echo " " . date("d") . " del " . date("m") . " de " . date("Y"); ?></p></b>
<strong>CEDULA: </strong> <?php
$cita = \app\models\CitaMedica::find()->where(['id_cita' => $model->id_cita])->one();
echo Paciente::findOne($cita)->cedula;
echo "<br>";
?>

<?php
$Datos = Paciente::findOne(['id_paciente' => $cita->id_paciente]);
$client = new Client(['baseUrl' => 'http://mundogya.com/servicios/frontend/web/']);
if ($Datos->tipo_paciente != 'Dependiente') {
    if ($Datos->tipo_paciente == 'Estudiante') {
        $response = $client->createRequest()
                ->setUrl('estudiantes?nummatricula=' . $Datos->num_matricula)//toma los datos del controlador estudiantes del servicio que nos estan dando
                ->addHeaders(['content-type' => 'application/json'])
                ->send();
    } else {
        $response = $client->createRequest()
                ->setUrl('trabajadores?cedula=' . $Datos->cedula)//toma los datos del controlador estudiantes del servicio que nos estan dando
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
    ?>

    <strong>TIPO DE PACIENTE: </strong><?php echo $Datos->tipo_paciente ?><br>
    <strong>NOMBRE DEL PACIENTE: </strong><?php echo $dataProvider->allModels[0]['nombres'] ?>
    <?php echo $dataProvider->allModels[0]['apellidos'] ?><br><br>
    <?php
} else {
    $dependiente = \app\models\Dependiente::findOne(['id_paciente' => $model->id_paciente]);
    ?>
    <strong>TIPO DE PACIENTE: </strong><?php echo $Datos->tipo_paciente ?><br>
    <strong>NOMBRE DEL PACIENTE: </strong><?php echo $dependiente->nombres ?> 
    <?php echo $dependiente->apellidos ?><br><br>
<?php } ?>

<strong>RECETA: </strong>
<br><br>
<table class="table table-striped table-bordered">
    <thead>
        <tr>
            <th>ID Medicamento</th>
            <th>Nombre del Medicamento</th>
            <th>Cantidad</th>
            <th>Indicaciones</th>
        </tr>
    </thead>
    <tbody>
    <?php
    $medicamento = app\models\RecetaDetalle::find()->where(['id_cita' => $model->id_cita])->all();
    $cont = count($medicamento);
    
    for ($i = 0; $i < $cont; $i++) {
        $idMed = $medicamento[$i]['id_medicamento'];
        $medi =  app\models\Medicamentos::find()->where(['id_medicamento'=>$idMed])->one();
        ?>
        <tr>
            <th> <?php echo $medi->codigo_med ?></th>
            <th> <?php echo $medi->nombre_med ?></th>
            <th> <?php echo $medicamento[$i]['cantidad_med'] ?></th>
            <th> <?php echo $medicamento[$i]['indicaciones'] ?></th>
        </tr>

<?php } ?>
    </tbody>
    <p style="text-align: justify">hola <?php echo $cont; ?></p> 
</table>



<br><br><br><br><br><br>
<b><div ALIGN=center>Dr.</div></b>
<b><div ALIGN=center>Medicina General</div></b>
<b><div ALIGN=center>REG.H</div></b><br>
