
<style>
table, th, td {
    border: 1px solid black;
}
</style>


    <div class="panel panel-info">
      <div class="panel-heading">REPORTE MEDICO</div>
      <div class="panel-body">
     
          <h6>
              <strong>TIPO: </strong> <?= $model->tipo_certificado?>
          </h6>              
 

          <h6>
              <strong>IDENTIFICACION: </strong> <?= $model->identificacion_persona?>
          </h6>              


      </div>
    </div>

<br><hr>
<table class=" table table-bordered" cellspacing="40">
    <thead>

    </thead>
    <tbody>
        
           <tr>
            <td><?=$model->detalle?></td>
        </tr>  

    </tbody>
</table>





