<?php
use app\models\Paciente;
use yii\helpers\Html;
?>

<style type="text/css">
<!--
table { vertical-align: top; }
tr    { vertical-align: top; }
td    { vertical-align: top; }
.midnight-blue{
	background:#2c3e50;
	padding: 4px 4px 4px;
	color:white;
	font-weight:bold;
	font-size:12px;
}
.silver{
	background:white;
	padding: 3px 4px 3px;
}
.clouds{
	background:#ecf0f1;
	padding: 3px 4px 3px;
}
.border-top{
	border-top: solid 1px #bdc3c7;
	
}
.border-left{
	border-left: solid 1px #bdc3c7;
}
.border-right{
	border-right: solid 1px #bdc3c7;
}
.border-bottom{
	border-bottom: solid 1px #bdc3c7;
}
table.page_footer {width: 100%; border: none; background-color: white; padding: 2mm;border-collapse:collapse; border: none;}

-->
</style>
<page backtop="15mm" backbottom="15mm" backleft="15mm" backright="15mm" style="font-size: 12pt; font-family: arial" >
    <table cellspacing="0" style="width: 100%;">
        <tr>

            <td style="width: 25%; color: #444444;">
                <img style="width: 100%;" src="logo.png" alt="Logo"><br>
                
            </td>
			<td style="width: 50%; color: #34495e;font-size:12px;text-align:center">
                <span style="color: #34495e;font-size:14px;font-weight:bold">PUCESE</span>
				<br>Subida Sta Cruz.<br> 
				Teléfono: 000000000<br>
				Email: pucese@pucese.edu.ec
                
            </td>	
            	<td style="width: 25%;text-align:right">
			
			</td>	
        </tr>
    </table>
    <br>
    	
    <table cellspacing="0" style="width: 100%; text-align: left; font-size: 11pt;">
        <tr>
           <td style="width:50%;" class='midnight-blue'>PACIENTE</td>
           <td style="width:50%;" class='midnight-blue'>Tipo de Examen</td>
        </tr>
		<tr>
           <td style="width:50%;" >
			<?php 
				echo Paciente::findOne($model->id_paciente)->cedula;
				echo "<br>";
			?>
			
		   </td>
		   <td style="width:50%;" >
			<?php 
				echo $model->getTiposExamenes(array_map('intval', explode(',', $model->idTiposExamen)));
				echo "<br>";
			?>
			
		   </td>
        </tr>
        
   
    </table>
    
       <br>
		<table cellspacing="0" style="width: 100%; text-align: left; font-size: 11pt;">
        <tr>
           <td style="width:35%;" class='midnight-blue'>Doctor</td>
		  <td style="width:25%;" class='midnight-blue'>FECHA</td>
        </tr>
		<tr>
           <td style="width:35%;">
			<?=Yii::$app->user->identity->username?>
		   </td>
		  <td style="width:25%;"><?php echo date("d/m/Y");?></td>
        </tr>
		
        
   
    </table>
	<br>
  
    <table cellspacing="0" style="width: 100%; text-align: left; font-size: 10pt;">
        <tr>

            <th style="width: 100%" class='midnight-blue'>DESCRIPCION</th>
            
        </tr>

        <tr>
            <td style="width: 10%; text-align: justify"><?php echo $model->indicacion; ?></td>          
        </tr>
	  
       
    </table>
	
	
	
	<br>
	<div style="font-size:11pt;text-align:center;font-weight:bold">Espero te mejores!</div>
	
	
	  

</page>

