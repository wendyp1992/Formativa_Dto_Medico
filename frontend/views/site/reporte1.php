<?php

use app\models\Paciente;
use yii\httpclient\Client;
use yii\helpers\Json;
use yii\data\ArrayDataProvider;

/* @var $this yii\web\View */

$this->title = 'Reporte1';

$Cita = Yii::$app->db->createCommand('SELECT id_paciente, fecha_cita, tipo_atencion from cita_medica WHERE fecha_cita>="'. $id_reporte->fechainicio.'" AND fecha_cita<="'. $id_reporte->fechafin.'"')->queryAll();
$cont = count($Cita);
?>

<div class="site-index">
    <div class="jumbotron">
        <div class="row">
            <h1>REPORTE DE PACIENTES ATENDIDOS <?php echo $cont ?></h1>
            <h5>   Desde <?php echo $id_reporte->fechainicio ?> Hasta <?php echo $id_reporte->fechafin ?></h5>

            <table>
                <tr>
                    <td>Id Paciente</td>
                    <td>Cedula</td>
                    <td>Tipo Paciente</td>
                    <td>Nombres</td>
                    <td>Apellidos</td>
                    <td>Fecha Cita</td>
                    <td>Tipo de Atención</td>
                </tr>
                <?php
                for ($i = 0; $i < $cont; $i++) {
                    $fila = $Cita[$i];
                    $id = $fila['id_paciente'];
                    $fecha = $fila['fecha_cita'];
                    $tipoA = $fila['tipo_atencion'];
                    $Datos = Paciente::findOne(['id_paciente' => $id]);
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
                            <td><?php echo $id ?></td>
                            <td><?php echo $Datos->cedula ?></td>
                            <td><?php echo $Datos->tipo_paciente ?></td>
                            <td><?php echo $dataProvider->allModels[0]['nombres'] ?></td>
                            <td><?php echo $dataProvider->allModels[0]['apellidos'] ?></td>
                            <td><?php echo $fecha ?></td>
                            <td><?php echo $tipoA ?></td>
                        </tr>
                        <?php
                    } else {
                        $dependiente = \app\models\Dependiente::findOne(['id_paciente' => $id]);
                        ?>
                        <tr>
                            <td><?php echo $id ?></td>
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
        </div>       
    </div>
</div>


