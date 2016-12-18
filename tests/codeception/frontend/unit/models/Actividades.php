<?php

namespace tests\codeception\frontend\unit\models;

use tests\codeception\frontend\unit\DbTestCase;
use tests\codeception\frontend\unit\fixtures\ActividadesFixture;
use Codeception\Specify;
use app\models\Actividades;

class ActividadesTest extends DbTestCase {

    use Specify;

    public function testCorrectActividades() {
        $model = new Actividades([
           'usuario'=>1,
        'descripcion' => 'Juegos de ajedrez',
        'dependencia' => 1,
        'prioridad'=>1,
        'estado' => 1,
        'fecha_inicio' => date('y-m-d'),
        ]);

        $actividad = $model->saveObjetivo();

        $this->assertInstanceOf('app\models\Actividades', $actividad, 'Actividad debe ser valido');
    }

    public function testNotCorrectActividades() {
        $model = new Actividades([
        'usuario'=>1,
        'descripcion' => 'Juegos de ajedrez',
        'dependencia' => 0,
        'prioridad'=>0,
        'estado' => 0,
        'fecha_inicio' => date('y-m-d'),
        ]);

        expect('No puedes crear un actividad con fecha antigua, cree uno nuevo', $model->saveObjetivo())->null();
    }

    public function fixtures() {
        return [
            'actividades' => [
                'class' => ActividadesFixture::className(),
                'dataFile' => '@tests/codeception/frontend/unit/fixtures/data/models/actividades.php',
            ],
        ];
    }

}
