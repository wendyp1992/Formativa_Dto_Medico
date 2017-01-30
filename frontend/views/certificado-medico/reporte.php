<?php

use app\models\Paciente;
use yii\httpclient\Client;
use yii\data\ArrayDataProvider;
use yii\helpers\Json;

$HomeUrl = yii\helpers\Url::base();
?>


<div>
    <table>
        <tr>
            <td><IMG SRC=<?php echo $HomeUrl ?>/images/logo.jpg WIDTH=100>
            </td>
            <td><h3>PONTIFICIA UNIVERSIDAD CATÓLICA DEL ECUADOR</h3>
        <center><h4>SEDE ESMERALDAS</h4></center>
        </td>
        </tr>
    </table>
        <b><h2 ALIGN=center>SERVICIO MÉDICO</h2></b><br>

    <b><h3 ALIGN=center><u>CERTIFICADO MÉDICO</u></h3></b><br>
    <b><p ALIGN=right>Esmeraldas, <?php echo " " . date("d") . " del " . date("m") . " de " . date("Y"); ?></p></b>

    <?php
    $Datos = Paciente::findOne(['cedula' => $model->identificacion_persona]);
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

        <strong>Tipo de Paciente: </strong><?php echo $Datos->tipo_paciente ?><br>
        <br>        <br>

        <?php echo $dataProvider->allModels[0]['nombres'] ?>
        <?php echo $dataProvider->allModels[0]['apellidos'] ?>, con cedula de ciudadanía #<?php echo $Datos->cedula ?>.  <?= $model->detalle ?><br>
        <?php
    } else {
        $dependiente = \app\models\Dependiente::findOne(['id_paciente' => $id]);
        ?>
        <strong>Tipo de Paciente: </strong><?php echo $Datos->tipo_paciente ?><br>
        <br>
        <?php echo $dependiente->nombres ?> 
        <?php echo $dependiente->apellidos ?>,  con cedula de ciudadanía #<?php echo $Datos->cedula ?>.  <?= $model->detalle ?><br>
    <?php } ?>


    <br><br><br><br><br><br>
    <b><div ALIGN=center>Dr.</div></b>
    <b><div ALIGN=center>Medicina General</div></b>
    <b><div ALIGN=center>REG.H</div></b><br>




</div>





