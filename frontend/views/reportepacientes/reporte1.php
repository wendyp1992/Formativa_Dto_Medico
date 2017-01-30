<?php

use app\models\Paciente;
use yii\httpclient\Client;
use yii\helpers\Json;
use yii\data\ArrayDataProvider;

/* @var $this yii\web\View */

$this->title = 'Reporte Pacientes Atendidos';
$HomeUrl = yii\helpers\Url::base();
$URL = yii\helpers\BaseUrl::current();

$Cita = Yii::$app->db->createCommand('SELECT id_paciente, fecha_cita, tipo_atencion from cita_medica WHERE fecha_cita>="' . $id->fechainicio . '" AND fecha_cita<="' . $id->fechafin . '"')->queryAll();
$cont = count($Cita);
$modelo = \app\models\Reportepacientes::find(['Idreporte' => $id]);
$modelo = \app\models\Reportepacientes::find()->where(['Idreporte' => $id])->one();
Yii::$app->db->createCommand()->update('reportepacientes', ['Reporte' => $URL])->execute();
$modelo->save();
?>

<div class="site-index">
    <table>
        <tr>
            <td><IMG SRC=<?php echo $HomeUrl ?>/images/logo.jpg WIDTH=100>
            </td>
            <td><h3>PONTIFICIA UNIVERSIDAD CATÓLICA DEL ECUADOR</h3>
        <center><h5>SEDE ESMERALDAS</h5></center>
        </td>
        </tr>

    </table>

    <b><h4 ALIGN=center>REPORTE DE PACIENTES ATENDIDOS</h4></b>
    <b><p> Desde <?php echo $id->fechainicio ?> Hasta <?php echo $id->fechafin ?></p></b>

    <table class="table table-striped table-bordered">
        <thead>
            <tr>
                <th>Id Paciente</th>
                <th>Cedula</td>
                <th>Tipo Paciente</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Fecha Cita</th>
                <th>Tipo de Atención</th>
            </tr>
        </thead>
        <?php
        for ($i = 0; $i < $cont; $i++) {
            $fila = $Cita[$i];
            $idP = $fila['id_paciente'];
            $fecha = $fila['fecha_cita'];
            $tipoA = $fila['tipo_atencion'];
            $Datos = Paciente::findOne(['id_paciente' => $idP]);
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
                <tr>
                    <td><?php echo $idP ?></td>
                    <td><?php echo $Datos->cedula ?></td>
                    <td><?php echo $Datos->tipo_paciente ?></td>
                    <td><?php echo $dataProvider->allModels[0]['nombres'] ?></td>
                    <td><?php echo $dataProvider->allModels[0]['apellidos'] ?></td>
                    <td><?php echo $fecha ?></td>
                    <td><?php echo $tipoA ?></td>
                </tr>
                <?php
            } else {
                $dependiente = \app\models\Dependiente::findOne(['id_paciente' => $idP]);
                ?>
                <tr>
                    <td><?php echo $idP ?></td>
                    <td><?php echo $Datos->cedula ?></td>
                    <td><?php echo $Datos->tipo_paciente ?></td>
                    <td><?php echo $dependiente->nombres ?></td>
                    <td><?php echo $dependiente->apellidos ?></td>
                    <td><?php echo $fecha ?></td>
                    <td><?php echo $tipoA ?></td>
                </tr>
            <?php } ?>
        <?php } ?>

    </table>
    <p>Total de Pacientes atendidos: <?php echo $cont ?> </p>

</div>


