<?php
	//include("../../clases/funcionesComunes.php");
	include("funcionesComunes.php");
class proyectos{
	private function conectarBd(){
		//require("../../includes/config.inc.php");
		//$link=mysql_connect($host,$usuario,$pass);
		$link=mysql_connect("localhost","root","xampp");
		if($link==false){
			echo "Error en la conexion a la base de datos1";
		}else{
			mysql_select_db("2012_control_sistemas");
			return $link;
		}				
	}
	function Conexion(){
		if (!($link=mysql_connect("localhost","root",""))){ 
			echo "Error conectando a la base de datos."; 
			exit(); 
		} 
		if (!mysql_select_db("2011_iqe_sistemas",$link)){ 
			echo "Error seleccionando la base de datos."; 
			exit(); 
		} 
		return $link;		   
	} 
	//muestra la tarea
	function verDetalleTareaHito($id_tarea){
		$sqlConsulRespT="SELECT responsable, observaciones FROM tareas WHERE id_tarea='".$id_tarea."'";$cont=0;
		$resulRespT=mysql_query($sqlConsulRespT,$this->conectarBd());
		$responsT = mysql_fetch_array($resulRespT);
		$cadresponsT = explode(",",$responsT["responsable"]);
		$cadobs=explode("*",$responsT["observaciones"]);$long=count($cadobs);
		foreach($cadresponsT as $valor){
			$sqlConNomRespT="SELECT nombre, apaterno FROM userdbsistemas WHERE ID ='".$valor."'";
			$rNomRespT=mysql_query($sqlConNomRespT,$this->conectarBd());
			$resNomT = mysql_fetch_array($rNomRespT);
			$NomRespT[$cont]="".$resNomT["nombre"]." ".$resNomT["apaterno"];
			//$todo=$todo."".$NomResp;
			$cont++;	
		}
		$sqlTarea="select * from tareas where id_tarea='".$id_tarea."'";
		$resTarea=mysql_query($sqlTarea,$this->conectarBd());
		$rowTarea=mysql_fetch_array($resTarea);
?>
		<table cellpadding="0" cellspacing="0" width="90%" style="margin: 5px; font-size: 12px;">
		<tr><td><div style="border:none solid #000; text-align: left; background:#666; color:#FFF; height:20px; padding:5px; font-size:10px;">Mostrando Tarea <?=$id_tarea;?></div></td>
		<?if($rowTarea["status"]!="FINALIZADA"){?>
		    <td><div id="btn_agr" onclick="agregar_obs(<?=$id_tarea?>,<?=$rowTarea['id_hito']?>)" style="border:none solid #000; text-align: right; background:#666; color:#FFF; height:20px; padding:5px; font-size:10px;">Agregar Observaciones</div></td>
		    <td><div id="btn_fin" onclick="fin_tarea(<?=$id_tarea?>,<?=$rowTarea['id_hito']?>)" style="border:none solid #000; text-align: right; background:#666; color:#FFF; height:20px; padding:5px; font-size:10px;">Finalizar Tarea</div></td>
		<?}else{?>
		    <td><div id="status" style="border:none solid #000; text-align: right; background:#666; color:#FFF; height:20px; padding:5px; font-size:10px;">Status: <?=$rowTarea["status"]?></div></td>
		<?}?>
		</tr>
		</table>
		
		<table border="1" cellpadding="1" cellspacing="1" width="90%" style="margin: 5px;font-size: 12px;">
			<tr>
				<td width="20%" style="height: 20px;padding: 5px;">Tarea:</td>
				<td width="60%"><?=$rowTarea["titulo"];?></td>
			</tr>
			<tr>
				<td width="20%" style="height: 20px;padding: 5px;">Objetivo:</td>
				<td width="60%"><?=$rowTarea["objetivo"];?></td>
			</tr>
			<tr>
				<td width="20%" style="height: 20px;padding: 5px;">Descripci&oacute;n:</td>
				<td width="60%"><?=$rowTarea["descripcion"];?></td>
			</tr>
			<tr>
				<td width="20%" style="height: 20px;padding: 5px;">Fecha Inicio:</td>
				<td width="60%"><?=$rowTarea["fecha_creacion"];?></td>
			</tr>
			
			<tr>
				<td styleajax("mostrar",parametros);="height: 20px;padding: 5px;">Fecha de Vencimiento:</td>
				<td><?=$rowTarea["fecha_cierre"];?></td>
			</tr>
			<tr>
				<td width="20%" rowspan="<?=$cont?>" style="height: 20px;padding: 5px;">Asignados:</td>
				<td width="60%"><?=$NomRespT[0];?></td>
			</tr>
			<?
				for($t=1; $t < $cont ; $t++){
			?>
					<tr>
						<td width="60%"><?=$NomRespT[$t]?></td>
					</tr>
			<?
				}
			?>
			<tr>
				<td width="20%" rowspan="<?=$long?>" style="height: 20px;padding: 5px;">Observaciones:</td>
				<td width="60%">-<?=$cadobs[0];?></td>
			</tr>
			<?
				for($t=1; $t < $long ; $t++){
			?>
					<tr>
						<td width="60%">-<?=$cadobs[$t]?></td>
					</tr>
			<?
				}
			?>
			<tr>
				<td width="20%" style="height: 20px;padding: 5px;">Evidencias:</td>
				<td width="60%"><?=$rowTarea["evidencias"];?></td>
			</tr>
			
		</table>
<?
	}
	function guardarTareasHitoProyecto($tituloTareaHito,$objetivoT,$descripcionTareaHito,$fecha_inicioTareaHito,$fecha_vencimientoTareaHito,$responsableTarea,$observacionesTareaHito,$evidenciasT,$idHitoTareaActual,$id_usuario){
		$funcionesComunes=new funcionesComunes();
		$sqlTareas="INSERT INTO tareas (titulo,	objetivo, descripcion, fecha_creacion, hora_creacion, fecha_cierre, responsable, status, id_hito, observaciones, evidencias) VALUES ('".$tituloTareaHito."','".$objetivoT."','".$descripcionTareaHito."','".$fecha_inicioTareaHito."','".date("H:i:s")."','".$fecha_vencimientoTareaHito."','".$responsableTarea."','Nueva','".$idHitoTareaActual."','".$observacionesTareaHito."','".$evidenciasT."')";
		$resTareas=mysql_query($sqlTareas,$this->conectarBd()) or die(mysql_error());
		$sakrid="SELECT id_proyecto FROM hitos WHERE id='".$idHitoTareaActual."'";
		$resAkrid=mysql_query($sakrid,$this->conectarBd()) or die(mysql_error());
		$idksake = mysql_fetch_array($resAkrid);
		if($resTareas){
			$accionRealizada="TAREA INICIADA";
			$funcionesComunes->guardaDetalleSistema($idksake["id_proyecto"],$accionRealizada,$id_usuario);
?>
			<script type="text/javascript"> alert("Tarea Agregada"); detalleHito('<?=$idHitoTareaActual;?>'); cerrarVentana('ventanaDialogoTarea'); </script>
<?
		}else{
?>
			<script type="text/javascript"> alert("Error al guardar el Hito del proyecto 99"); </script>
<?
		}
	}
	//agrega la tarea en el formulario
	function agregarTareasHito($idHitoActual){
		$sqlResp="select * from userdbsistemas where nivel_acceso in (1,0)";
		$resResp=mysql_query($sqlResp,$this->conectarBd());
		$proyecto="select * from hitos where id='".$idHitoActual."'";
		$resP=mysql_query($proyecto,$this->conectarBd());
		$rowP=mysql_fetch_array($resP);
?> 
		<input type="hidden" name="txtHitoTareaActual" id="txtHitoTareaActual" value="<?=$idHitoActual;?>" />
		<div  align="center"><br />
			<form  id="form1" name="form1">
			<table width="500" border="0" cellpadding="1" cellspacing="1" style="font-size:12px; z-index: 23;">
				<input type="hidden" name="fecha_inicio_hito" id="fecha_inicio_hito" value="<?=$rowP["fecha_inicio"];?>" />
				<input type="hidden" name="fecha_fin_hito" id="fecha_fin_hito" value="<?=$rowP["vencimiento"];?>" />
				<tr>
					<td colspan="2" style="background:#000; color:#FFF; height:20px; padding:5px;">Agregar Nueva Tarea</td>
				</tr>
				<tr>
					<td colspan="2"><div style="height: 20px;padding: 10px;background: #F0F0F0;border: 1px solid #CCC;color:#666;font-weight: bold;font-size: 12px;"><?=strtoupper($rowP["hito"]);?></div></td>
				</tr>
				<tr>
					<td width="80">T&iacute;tulo:</td>
					<td width="307"><input name="tituloTareaHito"  id="tituloTareaHito" type="text" onkeyup="this.value = this.value.replace (/[^aA-zZ ]/, ''); " style="width: 350px;" /></td>
				</tr>
				<tr>
					<td>Objetivo:</td>
					<td><textarea name="objetivoT" id="objetivoT" cols="40" rows="5"></textarea></td>
				</tr>
				<tr>
					<td>Descripci&oacute;n:</td>
					<td><textarea name="descripcionTareaHito" id="descripcionTareaHito" cols="40" rows="5"></textarea></td>
				</tr>
				<tr>
					<td>Fecha Inicio:</td>
					<td>
						<input type="text" readonly="readonly" name="fecha_inicioTareaHito" id="fecha_inicioTareaHito" value="<?=date("Y-m-d")?>">
						<input type="button" id="lanzador1" value="..." />
					<!-- script que define y configura el calendario-->
					<script type="text/javascript">
						Calendar.setup({
							inputField     :    "fecha_inicioTareaHito",      // id del campo de texto
							ifFormat       :    "%Y-%m-%d",       // formato de la fecha, cuando se escriba en el campo de texto
							button         :    "lanzador1"   // el id del botón que lanzará el calendario
						});
					</script>
					</td>
				</tr>	
				<tr>
					<td>Fecha de Vencimiento:</td>
					<td>
						<input type="text" readonly="readonly" name="fecha_vencimientoTareaHito" id="fecha_vencimientoTareaHito">
						<input type="button" id="lanzador4" value="..." />
					<!-- script que define y configura el calendario-->
					<script type="text/javascript">
						Calendar.setup({
							inputField     :    "fecha_vencimientoTareaHito",      // id del campo de texto
							ifFormat       :    "%Y-%m-%d",       // formato de la fecha, cuando se escriba en el campo de texto
							button         :    "lanzador4"   // el id del botón que lanzará el calendario
						});
					</script>
					</td>
				</tr>
				<tr>
					<td>Responsable:</td>
					<td>
						<select name="resP0" size="1" id="resP0">
							<option value="" selected="selected">Selecciona...</option>
<?
						while($rowResp=mysql_fetch_array($resResp)){
?>
							<option value="<?=$rowResp["ID"];?>"><?=$rowResp["nombre"]." ".$rowResp["apaterno"];?></option>
<?
						}
?>
						</select><input class="bt_plus" id="1" type="button" value="+" />
						<a href="#" onclick=anadeR();>A&ntilde;adir Responsable</a>
					</td>
				</tr>
				<tr><td colspan="2"><div id="otroR"></div></tr>
				<tr>
					<td>Observaciones:</td>
					<td><textarea name="observacionesTareaHito" id="observacionesTareaHito" cols="40" rows="5"></textarea></td>
				</tr>
				<tr>
					<td>Evidencias:</td>
					<td><textarea name="evidenciasT" id="evidenciasT" cols="40" rows="5"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><hr style=" background:#CCC;" /></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
					<input name="guardar" type="button" value="GUARDAR" onclick="guardarRegTareaHito()" />&nbsp;&nbsp;
					<input type="button" onclick="cerrarVentana('ventanaDialogoTarea')" value="CANCELAR" />					
					<input type="hidden" name="id_usuario" id="id_usuario" value="<?=$id_usuario;?>" />
					</td>
				</tr>
			</table>
			</form>
			<div id="guardaDatos" style="border:1px solid #00000; background:# #0099CC; height:50px; h">&nbsp;</div>
		</div>
<?
	}	
	function mostrarTareasHito($idHito){
		$sqlConsulta="Select * from tareas where id_hito='".$idHito."'";
		$resConsulta=@mysql_query($sqlConsulta,$this->conectarBd()) or die(mysql_error());
?>
		<div style="height: 20px;padding: 10px;background: #F0F0F0;border: 1px solid #CCC;color:#666;font-weight: bold;font-size: 14px;">
			<div style="float:left;">Tareas del Hito seleccionado</div>
			<div onclick="actualizaTareasHito('<?=$idHito;?>')" style="float:right;border: 1px solid #CCC;height: 25px;width: 25px;text-align: center;margin-left: 5px;">A</div>
		</div>
<?
		if(mysql_num_rows($resConsulta)==0){
			echo "<br>( 0 ) Registros encontrados.<br>";
		}else{
			while($row=mysql_fetch_array($resConsulta)){
?>
			<div class="resultadosAvisos" style="height: 60px;" title="Da un click para ver el detalle del hito" onclick="detalleTareaHito('<?=$row["id_tarea"];?>')">
			D:<?=substr($row["titulo"],0,100);?>
			</div>
<?
			}
		}		
	}	
	function mostrarHito($idHito){
		$sqlHito="select * from hitos where id='".$idHito."'";
		$resHito=mysql_query($sqlHito,$this->conectarBd());
		$rowHito=mysql_fetch_array($resHito);
?>
		<div style="border:1px solid #000; background:#666; color:#FFF; height:20px; padding:5px; font-size:10px;">Mostrando Hito <?=$idHito;?></div>
		<table border="1" cellpadding="1" cellspacing="1" width="90%" style="margin: 5px;font-size: 12px;">
			<tr>
				<td width="20%" style="height: 20px;padding: 5px;">Nombre del Hito</td>
				<td width="60%"><?=$rowHito["hito"];?></td>
			</tr>
			<tr>
				<td style="height: 20px;padding: 5px;">Objetivo</td>
				<td><?=$rowHito["objetivo"];?></td>
			</tr>
			<tr>
				<td style="height: 20px;padding: 5px;">Inicio</td>
				<td><?=$rowHito["fecha_inicio"];?></td>
			</tr>
			<tr>
				<td style="height: 20px;padding: 5px;">Vencimiento</td>
				<td><?=$rowHito["vencimiento"];?></td>
			</tr>
			<tr>
				<td style="height: 20px;padding: 5px;">Observaciones</td>
				<td><?=$rowHito["observaciones"];?></td>
			</tr>
		</table>
<?
	}
	//Inserta el hito
	function guardarHitoProyecto($txtHitoProyectoActual,$tituloHito,$objetivoH,$fecha_inicioHito,$fecha_vencimientoHito,$observacionesHito,$id_usuario){
		//se procede a guardar el hito del proyecto actual
		$funcionesComunes=new funcionesComunes();
		$sqlHito="INSERT INTO hitos (id_proyecto,hito,vencimiento,observaciones,fecha_inicio, objetivo) VALUES ('".$txtHitoProyectoActual."','".$tituloHito."','".$fecha_vencimientoHito."','".$observacionesHito."','".$fecha_inicioHito."','".$objetivoH."')";
		$resHito=mysql_query($sqlHito,$this->conectarBd());
		if($resHito){
			$accionRealizada="HITO CREADO";
			$funcionesComunes->guardaDetalleSistema($txtHitoProyectoActual,$accionRealizada,$id_usuario);
?>
			<script type="text/javascript"> alert("Hito agregado"); detalle('<?=$txtHitoProyectoActual?>'); cerrarVentana('ventanaDialogoHito'); </script>
<?
		}else{
?>
			<script type="text/javascript"> alert("Error al guardar el Hito del proyecto"); </script>
<?
		}
	}
	//Formulario que agrega hito
	function agregarHito($id_usuario,$idProyectoActual){
		$sqlResp="select * from userdbsistemas where nivel_acceso='1'";
		$resResp=mysql_query($sqlResp,$this->conectarBd());
		$proyecto="select * from proyectos where id='".$idProyectoActual."'";
		$resP=mysql_query($proyecto,$this->conectarBd());
		$rowP=mysql_fetch_array($resP);
?> 
		<input type="hidden" name="txtHitoProyectoActual" id="txtHitoProyectoActual" value="<?=$idProyectoActual;?>" />
		<div  align="center"><br />
			<form  id="form1" name="form1">
			<table width="500" border="0" cellpadding="1" cellspacing="1" style="font-size:12px; z-index: 23;">
				<input type="hidden" name="fecha_inicio_proy" id="fecha_inicio_proy" value="<?=$rowP["fecha_inicio"]?>" />
				<input type="hidden" name="fecha_fin_proy" id="fecha_fin_proy" value="<?=$rowP["fecha_vencimiento"]?>" />
				<tr>
					<td colspan="2" style="background:#000; color:#FFF; height:20px; padding:5px;">Agregar Nuevo Hito</td>
				</tr>
				<tr>
					<td colspan="2"><div style="height: 20px;padding: 10px;background: #F0F0F0;border: 1px solid #CCC;color:#666;font-weight: bold;font-size: 12px;"><?=strtoupper($rowP["nombre"]);?></div></td>
				</tr>
				<tr>
					<td width="80">Nombre del Hito:</td>
					<td width="307"><input name="tituloHito"  id="tituloHito" type="text" onkeyup="this.value = this.value.replace (/[^aA-zZ ]/, ''); " style="width: 350px;" /></td>
				</tr>
				<tr>
					<td>Objetivo:</td>
					<td><textarea name="objetivoH" id="objetivoH" cols="40" rows="5"></textarea></td>
				</tr>
				<tr>
					<td>Fecha Inicio:</td>
					<td>
						<input type="text" readonly="readonly" name="fecha_inicioHito" id="fecha_inicioHito" value="<?=date("Y-m-d")?>">
						<input type="button" id="lanzador3" value="..." />
					<!-- script que define y configura el calendario-->
					<script type="text/javascript">
						Calendar.setup({
							inputField     :    "fecha_inicioHito",      // id del campo de texto
							ifFormat       :    "%Y-%m-%d",       // formato de la fecha, cuando se escriba en el campo de texto
							button         :    "lanzador3"   // el id del botón que lanzará el calendario
						});
					</script>
					</td>
				</tr>				
				<tr>
					<td>Fecha de Vencimiento:</td>
					<td>
						<input type="text" readonly="readonly" name="fecha_vencimientoHito" id="fecha_vencimientoHito">
						<input type="button" id="lanzador6" value="..." />
					<!-- script que define y configura el calendario-->
					<script type="text/javascript">
						Calendar.setup({
							inputField     :    "fecha_vencimientoHito",      // id del campo de texto
							ifFormat       :    "%Y-%m-%d",       // formato de la fecha, cuando se escriba en el campo de texto
							button         :    "lanzador6"   // el id del botón que lanzará el calendario
						});
					</script>
					</td>
				</tr>				
				<tr>
					<td>Observaciones:</td>
					<td><textarea name="observacionesHito" id="observacionesHito" cols="40" rows="5"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><hr style=" background:#CCC;" /></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
					<input name="guardar" type="button" value="GUARDAR" onclick="guardarRegHito()" />&nbsp;&nbsp;
					<input type="button" onclick="cerrarVentana('ventanaDialogoHito')" value="CANCELAR" />					
					<input type="hidden" name="id_usuario" id="id_usuario" value="<?=$id_usuario;?>" />
					</td>
				</tr>
			</table>
		</form>
		<div id="guardaDatos" style="border:1px solid #00000; background:# #0099CC; height:50px; h">&nbsp;</div>
        </div>
<?
	}
	//AKI Ingresas nuevo proyecto en formulario
	function agregarProyecto($id_usuario){
		$sqlResp="select * from userdbsistemas where nivel_acceso in (1,0)";
		$resResp=mysql_query($sqlResp,$this->conectarBd());
		
?>
		<script type="text/javascript" src="ajax.js"></script>
		<div  align="center"><br />
			<form  id="form1" name="form1">
			<table width="500" border="0" cellpadding="1" cellspacing="1" style="font-size:12px; z-index: 23;">
				<tr>
					<td colspan="2" style="background:#000; color:#FFF; height:20px; padding:5px;">Agregar Nuevo Proyecto</td>
				</tr>
				<tr>
					<td width="80">Nombre:</td>
					<td width="307"><input name="titulo"  id="titulo" type="text" onkeyup="this.value = this.value.replace (/[^aA-zZ ]/, ''); " style="width: 350px;" /></td>
				</tr>
				<tr>
					<td>Descripci&oacute;n:</td>
					<td><textarea name="descripcion" id="descripcion" cols="40" rows="5"></textarea></td>
				</tr>
				<tr>
					<td>Responsable</td>
					<td>
						<select name="resP0" size="1" id="resP0">
						<option value="" selected="selected">Selecciona...</option>
<?
						while($rowResp=mysql_fetch_array($resResp)){
?>
							<option value="<?=$rowResp["ID"];?>"><?=$rowResp["nombre"]." ".$rowResp["apaterno"];?></option>
<?
						}
?>
						</select>
						<a href="#" onclick="anadeR()">A&ntilde;adir Responsable</a>
					</td>
				</tr>
				
					<td colspan="2"><div id="otroR_0"></div>				
				<tr>
					<td>Fecha Inicio:</td>
					<td>
						<input type="text" readonly="readonly" name="fecha_inicio" id="fecha_inicio">
						<input type="button" id="lanzador5" value="..." />
					<!-- script que define y configura el calendario-->
					<script type="text/javascript">
						Calendar.setup({
							inputField     :    "fecha_inicio",      // id del campo de texto
							ifFormat       :    "%Y-%m-%d",       // formato de la fecha, cuando se escriba en el campo de texto
							button         :    "lanzador5"   // el id del botón que lanzará el calendario
						});
					</script>
					</td>
				</tr>
				<tr>
					<td>Fecha Vencimiento:</td>
					<td>
						<input type="text" readonly="readonly" name="fecha_termino" id="fecha_termino" onChange="tproy()">
						<input type="button" id="lanzador2" value="..." />
					<!-- script que define y configura el calendario-->
					<script type="text/javascript">
						Calendar.setup({
							inputField     :    "fecha_termino",      // id del campo de texto
							ifFormat       :    "%Y-%m-%d",       // formato de la fecha, cuando se escriba en el campo de texto
							button         :    "lanzador2"   // el id del botón que lanzará el calendario
						});
					</script>
					</td>
				</tr>
			</table>
			<table width="500" border="0" cellpadding="1" cellspacing="1" style="font-size:12px; z-index: 23;">
				<input type="hidden" name="semanas" id="semanas" value="0"/>
				<tr>
					<td colspan="3" style="height:20px; padding:5px;"><hr style=" background:#CCC;" />Selecciones los dias y coloque las horas que dedicara al proyecto:<hr style=" background:#CCC;" /></td>
				</tr>
				<tr>
					<td width="30">Lunes:</td>
					<td>
	<input type="checkbox" name="Lunes" id="d0" value="Lunes" onclick="agregaH(this,'Lunes')">
		<div style="float:left; width: auto;"></div></td>
					<td><div id="Lunes" name="Lunes" style="float: left;"></div></td>
						<div style="clear: both"></div></td>
				</tr>
				<tr>
					<td>Martes:</td>
					<td><input type="checkbox" name="Martes" id="d1" value="Martes" onclick="agregaH(this,'Martes')"><div style="float:left; width: auto;"></div></td>
					<td><div id="Martes" name="Martes" style="float: left;"></div></td>
						<div style="clear: both"></div>
				</tr>
				<tr>
					<td>Miercoles:</td>
					<td><input type="checkbox" name="Miercoles" id="d2" value="Miercoles" onclick="agregaH(this,'Miercoles')"><div style="float:left; width: auto;"></div></td>
					<td><div id="Miercoles" name="Miercoles" style="float: left;"></div></td>
						<div style="clear: both"></div>
				</tr>
				<tr>
					<td>Jueves:</td>
					<td><input type="checkbox" name="Jueves" id="d3" value="Jueves" onclick="agregaH(this,'Jueves')"><div style="float:left; width: auto;"></div></td>
					<td><div id="Jueves" name="Jueves" style="float: left;"></div></td>
						<div style="clear: both"></div>
				</tr>
				<tr>
					<td>Viernes:</td>
					<td><input type="checkbox" name="Viernes" id="d4" value="Viernes" onclick="agregaH(this,'Viernes')"><div style="float:left; width: auto;"></div></td>
					<td><div id="Viernes" name="Viernes" style="float: left;"></div></td>
						<div style="clear: both"></div>
				</tr>
				<tr>
					<td>Sabado:</td>
					<td><input type="checkbox" name="Sabado" id="d5" value="Sabado" onclick="agregaH(this,'Sabado')"><div style="float:left; width: auto;"></div></td>
					<td><div id="Sabado" name="Sabado" style="float: left;"></div></td>
						<div style="clear: both"></div>
				</tr>
				<tr>
					<td>Domingo:</td>
					<td><input type="checkbox" name="Domingo" id="d6" value="Domingo" onclick="agregaH(this,'Domingo')"><div style="float:left; width: auto;"></div></td>
					<td><div id="Domingo" name="Domingo" style="float: left;"></div></td>
						<div style="clear: both"></div>
				</tr>
				<tr>
					<td colspan="2">Total de Horas a la Semana: </td>
					<td aling="right"><input type="text" readonly="readonly" name="TOTAL" id="TOTAL" style="width: 50px;"/></td>
				</tr>
				<tr>
					<td colspan="2">Total de Horas del Proyecto: </td>
					<td aling="right"><input type="text" readonly="readonly" name="TOTALPROY" id="TOTALPROY" style="width: 50px;"/></td>
				</tr>
				<tr>
					<td colspan="3"><hr style=" background:#CCC;" /></td>
				</tr>
				<tr>
					<td>Observaciones:</td>
					<td colspan="3"><textarea name="observacionesProyecto" id="observacionesProyecto" cols="40" rows="5"></textarea></td>
				</tr>
				<tr>
					<td colspan="3"><hr style=" background:#CCC;" /></td>
				</tr>
				<tr>
					<td colspan="3" align="right">
					<input name="guardar" type="button" value="GUARDAR" onclick="guardarRegProyecto()" />&nbsp;&nbsp;
					<input type="button" onclick="cerrarVentana('ventanaDialogo')" value="CANCELAR" />					
					<input type="hidden" name="id_usuario" id="id_usuario" value="<?=$id_usuario;?>" />
					</td>
				</tr>
			</table>
		</form>
		<div id="guardaDatos" style="border:1px solid #00000; background:# #0099CC; height:50px; h">&nbsp;</div>
        </div>
<?	
	}
	public function agregaR($valor,$div){
		$sqlResp="select * from userdbsistemas where nivel_acceso in (1,0)";
		$resResp=mysql_query($sqlResp,$this->conectarBd());
?>
		<tr>
			<td>Responsable&nbsp;&nbsp;&nbsp;</td>
			<td>
				<select name="<?=$valor?>" size="1" id="<?=$valor?>">
				<option value="" selected="selected">Selecciona...</option>
<?				while($rowResp=mysql_fetch_array($resResp)){
?>					<option value="<?=$rowResp["ID"];?>"><?=$rowResp["nombre"]." ".$rowResp["apaterno"];?></option>
<?
				}
?>				</select>
				<a href="#" onclick="borraResp()">Borrar</a>
			</td>
		</tr>
		<td colspan="2"><div id="<?=$div?>"></div>
<?
	}/*Aki guarda nuevo Proyecto*/
	public function guardarRegistroProyecto($titulo,$descripcion,$fecha_creacion,$fecha_termino,$responsable,$observacionesProyecto,$id_usuario,$HxS,$HxP,$DyH){		
		$funcionesComunes=new funcionesComunes();		
		$sqlReg="INSERT INTO proyectos(nombre,descripcion,fecha_inicio,fecha_vencimiento,responsable,observaciones,HrsSemanal,HrsTotal,hxdia)
		VALUES('".$titulo."','".$descripcion."', '".$fecha_creacion."','".$fecha_termino."','".$responsable."','".$observacionesProyecto."',".$HxS.",".$HxP.",'".$DyH."')";
		$rs=mysql_query($sqlReg,$this->conectarBd());
		//SELECT TIMEDIFF( fecha_vencimiento, fecha_inicio ) FROM proyectos
		if($rs==true){
			$sqlId="SELECT LAST_INSERT_ID() as idReg";
			$resId=mysql_query($sqlId,$this->conectarBd());
			$rowId=mysql_fetch_array($resId);
			echo $rowId["idReg"]."<br>";
			$horas="SELECT TIMEDIFF( fecha_vencimiento, fecha_inicio ) AS totalHoras FROM proyectos WHERE id='".$rowId["idReg"]."'";
			$resHoras=mysql_query($horas,$this->conectarBd());
			$rowHoras=mysql_fetch_array($resHoras);
			$sqlHoras="UPDATE proyectos set totalHoras='".$rowHoras["totalHoras"]."' WHERE id='".$rowId["idReg"]."'";
			$resHoras=mysql_query($sqlHoras,$this->conectarBd());
			echo $id_usuario;
			//se procede a insertar el detalle en la bitacora
			$accionRealizada="PROYECTO CREADO";
			$funcionesComunes->guardaDetalleSistema($rowId["idReg"],$accionRealizada,$id_usuario);
?>
			<script type="text/javascript" > ajax('listadoProyectos','action=consultar&status=Nuevo');</script>
			<script type="text/javascript" > ajax('mostrar','action='); cerrarVentana('ventanaDialogo');</script>
			
<?	
		}else{			
			echo "Error al Guardar el Registro";
		}
	}//cerrar funcion guardarRegistro
		
	public function mostrarHitos($id_proyecto){
		$sqlConsulta="Select * from hitos where id_proyecto='".$id_proyecto."'";
		$resConsulta=@mysql_query($sqlConsulta,$this->conectarBd()) or die(mysql_error());
?>
		<div style="height: 20px;padding: 10px;background: #F0F0F0;border: 1px solid #CCC;color:#666;font-weight: bold;font-size: 14px;">
			<div style="float:left;">Hitos del Proyecto</div>
			<div onclick="actualizaHito('<?=$id_proyecto;?>')" style="float:right;border: 1px solid #CCC;height: 25px;width: 25px;text-align: center;margin-left: 5px;">A</div>
		</div>
<?
		if(mysql_num_rows($resConsulta)==0){
			echo "<br>( 0 ) Registros encontrados.<br>";
		}else{
			while($row=mysql_fetch_array($resConsulta)){
?>
			<div class="resultadosAvisos" style="height: 60px;" title="Da un click para ver el detalle del hito" onclick="detalleHito('<?=$row["id"];?>')">
			D:<?=substr($row["hito"],0,100);?>
			</div>
<?
			}
		}
	}	
	public function listarProyectos($status){
		if($status !="Todos")
			$sqlConsult="SELECT * FROM proyectos where status='".$status."' ORDER BY id DESC";
		else
			$sqlConsult="SELECT * FROM proyectos ORDER BY id DESC";
		//echo $sqlConsult."<br>";
		$resulta=@mysql_query($sqlConsult,$this->conectarBd()) or die(mysql_error());
		
		if(mysql_num_rows($resulta)==0){
			echo "<br>( 0 ) Registros encontrados.<br>";
		}else{
			$color="#F0F0F0";
			while($row = mysql_fetch_array($resulta)){
				if($row["prioridad"]=="alta"){  $color="#FF0000";$fuente="#FFF"; }else{ $color="#F0F0F0"; $fuente="#000";};			
?>
			<div class="resultadosAvisos" style="height: 60px;" title="Da un click para ver el detalle de la tarea" onclick="detalle('<?=$row["id"];?>')">
				<table border="0" cellpadding="1" cellspacing="1" width="98%" style="font-size: 10px;">
					<tr>
						<td width="10%">T&iacute;tulo:</td>
						<td width="88%"><?=substr($row["nombre"],0,40)."..."; ?></td>
					</tr>
					<tr>
						<td>Descripci&oacute;n:</td>
						<td><?=substr($row["descripcion"],0,40)."..."; ?></td>
					</tr>
					<tr>
						<td>Avance:</td>
						<td>
							<div style="float: left;left: 55px;top: -12px;width:100px;overflow: hidden;height: 16px;background: #666;"><div style="background: #89FF8F;height: 19px;width: <?=$row["porcentaje"];?>px;"></div></div>
							<div style="float: right;width:100px;overflow: hidden;height: 20px;"><?=$row["porcentaje"];?> %</div>
						</td>
					</tr>
				</table>
			</div>			   
<?	

			}
			//mysql_free_result($resulta);
		} 
	}
	
	function detalleProyecto($detalle){
		//echo $sqlConsult="SELECT id_tarea,titulo,mensaje,prioridad,fecha_creacion,hora_creacion,id_usuario FROM tareas where id_tarea='$detalle' ";		
		//$sqlConsult="SELECT id_tarea, titulo, mensaje, prioridad, fecha_creacion, hora_creacion, nombre , img_profile , porcentaje,status FROM proyectos LEFT JOIN cat_usuarios ON tareas.id_usuario = cat_usuarios.id WHERE id_tarea = '".$detalle."'";
		$sqlConsulResp="SELECT responsable FROM proyectos WHERE id='".$detalle."'";$cont=0;
		$resulResp=mysql_query($sqlConsulResp,$this->conectarBd());
		$respons = mysql_fetch_array($resulResp);
		$cadrespons = explode(",",$respons["responsable"]);
		foreach($cadrespons as $valor){
			$sqlConNomResp="SELECT nombre, apaterno FROM userdbsistemas WHERE ID ='".$valor."'";
			$rNomResp=mysql_query($sqlConNomResp,$this->conectarBd());
			$resNom = mysql_fetch_array($rNomResp);
			$NomResp[$cont]="".$resNom["nombre"]." ".$resNom["apaterno"];
			//$todo=$todo."".$NomResp;
			$cont++;	
		}
		$sqlConsult="SELECT proyectos.id AS id,	proyectos.nombre AS nombre, descripcion, fecha_inicio, fecha_vencimiento, observaciones, status, totalHoras, porcentaje, userdbsistemas.nombre AS nombreUsuario, apaterno FROM proyectos inner join userdbsistemas on proyectos.responsable=userdbsistemas.ID WHERE proyectos.id='".$detalle."'";
		$resulta=mysql_query($sqlConsult,$this->conectarBd());	
		$row = mysql_fetch_array($resulta);
		$imgProfile="../../img/other_profile.png";//.$row['img_profile'];
?>
		<script type="text/javascript"> $("#opcionesTitulo").html('<?=$row["nombre"]?>'); </script>
		<div style="border:1px solid #000; background:#666; color:#FFF; height:20px; padding:5px; font-size:10px;">
			<a href="#" onclick="detale('<?=$detalle;?>')" style="color: #FFF;text-decoration: none;">Actualizar Proyecto</a>
		</div>
		<div style="margin:4px; height:92%; font-size:10px;">
			<div style="float:left; width:64px; height:64px; border:1px solid #F0F0F0; margin:5px; text-align:center;"><img src="<?=$imgProfile;?>" width="64" border="0" /></div>
			<div style="float:left;margin:5px; width:86%; height:auto;border:0px solid #000;">				
				<span style="font-weight:bold; font-size:14px; margin-left:5px;">Resumen del proyecto:</span><br>
				<table border="0" cellpadding="1" cellspacing="1" width="98%" style="margin: 5px 5px 5px 0;">
					<tr>
						<td colspan="3">
							<div style="height: 20px;padding: 10px;background: #F0F0F0;border: 1px solid #CCC;color:#666;font-weight: bold;font-size: 14px;"><?=strtoupper($row["nombre"]);?></div>
						</td>
					</tr>
<?
				if($row["prioridad"]=="alta"){
?>
					<tr>
						<td colspan="3">
							<div style="height: 20px;padding: 10px;background: #FF0000;color:#FFF;font-weight: bold;">La tarea es de prioridad <?=strtoupper($row["prioridad"]);?></div>
						</td>
					</tr>
<?
				}
?>
					<tr>
						<td width="20%" rowspan="<?=$cont?>" align="center" valign="middle" style="height: 20px;padding: 5px;font-weight: bold;">Responsable(s):</td>
						<td width="40%" style="height: 20px;padding: 5px;"><?=$NomResp[0]?></td>
						<td width="37%" rowspan="<?=$cont?>" align="center" valign="middle" style="text-align: center;">
							<div style="margin: 0 auto 0 auto;height: 20px;width: 100px;background: #666;overflow: hidden;"><div style="height: 20px;width: <?=$row["porcentaje"]?>px;background:#89FF8F;"></div></div> Avance <?=$row["porcentaje"]?> %
						</td>
					</tr>
					<?
					for($t=0; $t < $cont ; $t++){
					?>
						<tr>
							<td style="height: 20px;padding: 5px;"><?=$NomResp[($t+1)]?></td>
						</tr>
					<?
					}
					?>
					<tr>			
						<td style="height: 20px;padding: 5px;font-weight: bold;">Fecha Inicio:</td>
						<td style="height: 20px;padding: 5px;">&nbsp;<?=$row["fecha_inicio"]; ?></td>						
					</tr>
					<tr>
						<td style="height: 20px;padding: 5px;font-weight: bold;">Fecha Termino:</td>
						<td style="height: 20px;padding: 5px;">&nbsp;<?=$row["fecha_vencimiento"]; ?></td>						
					</tr>					
				</table>								
				<span style="font-weight:bold; margin-left:5px;">Descripci&oacute;n:</span> <br /><br /><span style="font-size:16px; margin-left:5px;"><?=$row["descripcion"]; ?></span><BR/><br />
				<span style="font-weight:bold; margin-left:5px;">Observaciones:</span> <br /><br /><span style="font-size:16px; margin-left:5px;"><?=$row["observaciones"]; ?></span><BR/><br />
				<input type="hidden" name="nombre" id="nombre" value="<?=$nombre;?>" />
<?	
				echo "--------------------------------------------------------------------------<br>Seguimiento:";
				$sqlDetalle="SELECT COUNT(id) AS total FROM bitacora where id_proyecto='$detalle'";
				$resul=mysql_query($sqlDetalle,$this->conectarBd());
				$rowTotal=mysql_fetch_array($resul);				
				//--------------			
				if($rowTotal['total']==0){
					echo "<br>&nbsp;No hay seguimiento a esta Tarea<br>";
					
				}else {
					//echo $sqlSeguimiento="SELECT * FROM detalle_tarea WHERE id_tarea='$detalle'";
					$sqlSeguimiento="SELECT bitacora.id AS id, id_proyecto, accion_realizada, responsable_bitacora, fecha_bitacora, hora_bitacora, nombre, apaterno FROM bitacora INNER JOIN userdbsistemas ON bitacora.responsable_bitacora = userdbsistemas.ID WHERE id_proyecto='".$detalle."'";
					$resultSeg=mysql_query($sqlSeguimiento,$this->conectarBd());				
					echo "<br> Numero de seguimientos: ".$rowTotal["total"]."<br><br>";
					$color="#F0F0F0";						
					while($rowSeg=mysql_fetch_array($resultSeg)){
						//$imgProfileDetalle="../../../images/ui/img_profiles/".$rowSeg['img_profile'];
						$imgProfileDetalle="../../img/other_profile.png";
						$fechaB=explode("-",$rowSeg['fecha_bitacora']);						
						$diaSeg=date("w",mktime(0,0,0,$fechaB[1],$fechaB[2],$fechaB[0]));
						$mesSeg=date("n",mktime(0,0,0,$fechaB[1],$fechaB[2],$fechaB[0]));
						$dias= array("Domingo","Lunes","Martes","Miercoles","Jueves","Viernes","S&aacute;bado");
						$meses= array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");						
?>					
						<div style=" margin:4px 4px 10px 10px; overflow: hidden; border-bottom:1px solid #CCC; height:auto;">
							<div style="float:left;"><a href="#"><img src="../../../images/ui/indice.jpeg" title="Me Gusta" width="15" height="15" /></a>&nbsp;</div>
							<div style="height:50px; width:50px; float:left; border:1px solid #F0F0F0; text-align:center;"><img src="<?=$imgProfileDetalle;?>" border="0" height="49" width="49" /></div>
   							<div style="background:<?=$color;?>;height:auto; width:80%;float:left; padding:3px;"><strong>El <?=$dias[$diaSeg]." ".$fechaB[2]." de ".$meses[$mesSeg-1]." de ".$fechaB[0]." a las ".$rowSeg['hora_bitacora']." ".$rowSeg['nombre']." ";?>comento:</strong><br />&nbsp;&nbsp;<?=$rowSeg['accion_realizada'];?></div>						
						</div>
<?						
						($color=="#F0F0F0") ? $color="#FFF" : $color="#F0F0F0";
					}
					
				}
			mysql_free_result($resulta);
?>			</div>
		</div>
<?	 
	}	
	function agregar_detalle($id_tarea,$tituloTarea,$porcentaje){
		echo "<br>&nbsp;<span style='font-size:12px;'><strong>".$tituloTarea."</strong></span>";
?>
		<div style="margin:10px; width:96%;">
			<form  id="form1" name="form1"> 
			<table border="0" cellspacing="1" cellpadding="1" width="100%">
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
				    <td style="font-size:12px;">Seguimiento:</td>
				</tr>
				<tr>
				    <td>&nbsp;</td>
				</tr>
				<tr>
				    <td>&nbsp;<textarea name="msj_detalle" id="msj_detalle" cols="55" rows="5"></textarea></td>
				</tr>
				<tr>
				    <td>&nbsp;</td>
				</tr>
				<tr>
				    <td style="font-size:12px;">Porcentaje de Avance: <input type="text" name="txtPorcentajeAvance" id="txtPorcentajeAvance" style="width: 100px;" /></td>
				</tr>
				<tr>
				    <td><hr color="#CCCCCC" /></td>
				</tr>
				<tr>
				    <td style="text-align:right;">
				    <input name="cancelar" type="button" onclick="cerrarVentana('ventanaDialogo')" value="Cancelar"/>&nbsp;&nbsp;
				    <input name="guardar" type="button" onclick="detalle_guardar()" value="Guardar"  />
						    
				    </td>
				</tr>
				<tr>
				    <td>&nbsp;</td>
				</tr>
			</table>
        		<input type="hidden" name="fecha_detalle" id="fecha_detalle" value="<?=date("Y-m-d");?>">
			<input type="hidden" name="hora_detalle" id="hora_detalle" value="<?=date("H:i:s");?>">
			<input type="hidden" name="id_detalle" id="id_detalle" value="<?=$id_detalle;?>"/>
			<input type="hidden" name="id_usuario" id="id_usuario" value="<?=$_SESSION['id_usuario_sistemas']?>"/>
			<input type="hidden" name="id_tarea" id="id_tarea" value="<?=$id_tarea?>"/>
			<input type="hidden" name="txtPorcentajeAvanceBd" id="txtPorcentajeAvanceBd" value="<?=$porcentaje;?>"/>
			</form>
	       </div>
		<div id="guardaDatos"></div>        
<?	
	}	
	public function guardarDetalle($msj_detalle,$fecha_detalle,$hora_detalle,$id_detalle,$id_usuario,$id_tarea,$porcentaje){
		$sqlRegistro="SELECT * FROM detalle_tarea WHERE id_detalle='$id_detalle' ";
		$re = mysql_query($sqlRegistro,$this->conectarBd());
		if ($row = mysql_fetch_array($re)){
			echo "<script>alert(' YA EXISTE!!!');</SCRIPT>";
                }else{  
			$sqlReg="INSERT INTO detalle_tarea(msj_detalle,fecha_detalle,hora_detalle,id_detalle,id_usuario,id_tarea)VALUES('$msj_detalle','$fecha_detalle','$hora_detalle','$id_detalle','$id_usuario','$id_tarea')";
			$rs=mysql_query($sqlReg,$this->conectarBd());
			if($rs==true){
				//se actualiza el avance de la tarea
				$sqlAvance="UPDATE tareas set porcentaje='".$porcentaje."' WHERE id_tarea='".$id_tarea."'";
				$resAvance=mysql_query($sqlAvance,$this->conectarBd());
?>
			<script type="text/javascript" > ajax('listadoTareas','action=consultar&status=Nuevo');</script>
			<script type="text/javascript" > ajax('mostrar','action=detalle&id_tarea=<?=$id_tarea?>'); cerrarVentana('ventanaDialogo');</script>
<? 
			}else{
				echo "Error al Guardar el Registro";
			}
		}
	}//cerrar funcion guardarRegistro
		
	public function cierreAviso($id_tarea,$txtIdUsuarioSistemas){
		//se verifica si tiene seguimientos antes de cerrarla
		$sqlSeg="SELECT * FROM detalle_tarea WHERE id_tarea='".$id_tarea."'";
		$resSeg=mysql_query($sqlSeg,$this->conectarBd());
		if(mysql_num_rows($resSeg)==0){
			echo "<script type='text/javascript'> alert('Error: La tarea no puede ser Finalizada si no cuenta con seguimientos.'); detalle('".$id_tarea."');</script>";
		}else{
			//se introduce un mensaje de cierre de la tarea
			$msj_detalle="<strong>Tarea Finalizada</strong>";
			$sqlReg="INSERT INTO detalle_tarea(id_tarea,fecha_detalle,hora_detalle,id_usuario,msj_detalle) VALUES ('".$id_tarea."','".date("Y-m-d")."','".date("H:i:s")."','".$txtIdUsuarioSistemas."','".$msj_detalle."')";
			$rsReg=mysql_query($sqlReg,$this->conectarBd());
			if($rsReg){
				//se finaliza la tarea
				$sql="UPDATE tareas SET fecha_cierre='".date("Y-m-d")."',hora_cierre='".date("H:i:s")."',status='terminado',porcentaje='100' WHERE  id_tarea='$id_tarea' LIMIT 1; ";
				$re = mysql_query($sql,$this->conectarBd());
				if($re==true){		
?>	
					<script type="text/javascript" > ajax('listadoTareas','action=consultar&status=Nuevo');</script>
<? 
				}else{
					echo "Error al Guardar el Registro";
				}				
			}else{
				echo "Error en la consulta";
			}
		}
	}//cerrar funcion guardarRegistro
		
	function nuevoAviso($remitente){
?>     
       <div  align="center"><br />
		<form  id="form1" name="form1" action="#" method="get">
		<table width="400" border="0" cellpadding="1" cellspacing="1" style="font-size:12px;">
			<tr>
				<td colspan="2" style="background:#000; color:#FFF; height:20px; padding:5px;">Agregar Aviso...</td>
			</tr>
			<tr>
				<td width="80">De</td>
			    <td width="307"><input type="text" name="remitente" id="remitente" value="<?=$_SESSION['nombreS']?>" readonly="readonly"/></td>
			</tr>
			<tr>
			<td>Para</td>
			<td>
<?
			$link=$this->Conexion();
			mysql_select_db($dbname, $link);   
			$result=mysql_query("SELECT nombre FROM cat_usuarios WHERE grupo = '2' AND activo='1' ",$link); 
			$num_rows = mysql_num_rows($result); 
			echo "<select name='`destinatario'  id='destinatario'>"; 
			echo "<option selected='selected'>Todos</option>"; 
			for ($i = 0; $i < $num_rows; $i++){ 
				$table = mysql_tablename($result,$i); 
				echo "<option>".$table."</option>"; 
			} 
			echo "</select>"; 
?>
			</td>
			</tr>
			<tr>
			<td>Mensaje</td>
			<td><textarea name="msj" id="msj" cols="40" rows="4"></textarea></td>
			</tr>
			<tr>
			<td>Fecha t&eacute;rmino </td>
			<td>
				<input type="text" readonly="readonly" name="caducidad" id="caducidad">
				<input type="button" id="lanzador" value="..." />
			<!-- script que define y configura el calendario-->
		
		<script type="text/javascript">
		
			Calendar.setup({
		
				inputField     :    "caducidad",      // id del campo de texto
		
				ifFormat       :    "%Y-%m-%d",       // formato de la fecha, cuando se escriba en el campo de texto
		
				button         :    "lanzador"   // el id del botón que lanzará el calendario
		
			});
		
		</script>
          </td>
        </tr>
        <tr>
        	<td colspan="2"><hr style=" background:#CCC;" /></td>
        </tr>
        <tr>
        	<td colspan="2" align="right">
            <input name="guardar" type="button" value="GUARDAR" onclick="guardarAviso()" />&nbsp;&nbsp;
            <input type="button" onclick="cerrarVentana('ventanaDialogo')" value="CANCELAR" />
            <input type="hidden" name="fecha_aviso" id="fecha_aviso" value="<?=date("Y-m-d");?>">
            <input type="hidden" name="hora_aviso" id="hora_aviso" value="<?=date("H:i:s");?>">
            
            </td>
        </tr>
       </table>
       </form>
         <div id="guardaDatos" style="border:1px solid #00000; background:# #0099CC; height:50px; h">&nbsp;</div>
        </div>
<?	
	}		
	public function avisoRegistro($remitente,$destinatario,$msj,$caducidad,$fecha_aviso,$hora_aviso){
		$link=$this->Conexion();
		$sqlRegistro="SELECT * FROM avisos WHERE id_aviso='$id_aviso' ";
		$re = mysql_query($sqlRegistro,$link);
		if ($row = mysql_fetch_array($re)){
	              echo "<script>alert(' YA EXISTE!!!');</SCRIPT>";
		      echo "<script language='Javascript'> window.location.href='index.html';</script>";
		}else{  
			$sqlReg="INSERT INTO avisos(remitente,destinatario,msj,caducidad,fecha_aviso,hora_aviso)   VALUES('$remitente','$destinatario', '$msj','$caducidad','$fecha_aviso','$hora_aviso')";
			$rs=mysql_query($sqlReg,$link);
			if($rs==true){
?>
		        <script type="text/javascript" > ajax('listadoAvisos','action=consultar_aviso&status=Vigente');</script>
			<script type="text/javascript" > ajax('mostrar','action='); cerrarVentana('ventanaDialogo');</script>
<? 
			}else{
				echo "Error al Guardar el Registro";
			}
		}
	}//cerrar funcion guardarRegistro
		
	function listar($id_aviso,$status,$destinatario,$nivel){
		$link=$this->Conexion();

		if($nivel==0){
		 	if($status=="Todos"){
				$sqlConsult="SELECT id_aviso,remitente,destinatario,msj FROM avisos ORDER BY id_aviso DESC";
			}else{
				$sqlConsult="SELECT id_aviso,remitente,destinatario,msj FROM avisos WHERE status='".$status."'  ORDER BY id_aviso DESC";
			}				
		}else if($nivel==1){
			if($status=="Todos"){
				$sqlConsult="SELECT id_aviso,remitente,destinatario,msj FROM avisos WHERE (destinatario='".$destinatario."' OR destinatario='Todos') ORDER BY id_aviso DESC";
			}else{
				$sqlConsult="SELECT id_aviso,remitente,destinatario,msj FROM avisos WHERE (destinatario='".$destinatario."' OR destinatario='Todos') AND status='".$status."'  ORDER BY id_aviso DESC";
			}
		}
		
			$resulta=mysql_query($sqlConsult,$link);
			if(mysql_num_rows($resulta)==0){
				echo "<br>( 0 ) Registros encontrados.<br>";
			}
			while($row = mysql_fetch_array($resulta)){ 		
?>
			   <div class="resultadosAvisos" title="Da un click para ver el detalle del aviso" onclick="detalle_aviso('<?=$row["id_aviso"];?>')">
		               	<div id="numAviso" style=" font-weight:bold;border:1px solid #CCC; background:#F0F0F0; height:63%; width:8%; margin:3px; float:left; text-align:center; font-size:14px; padding-top:10px; "><?=$row["id_aviso"]; ?> </div>
				De: <?=$row["remitente"]; ?><br />
				Para: <?=$row["destinatario"]; ?><br />
				Mensaje: <?=substr($row["msj"],0,20)."..."; ?>
				</div>
			   </div>
<?	
		} 
		mysql_free_result($resulta); 
		mysql_close($link); 
	}
	function agregar_obs ($id_tarea,$id_hito,$id_usuario){
		$consultarea="SELECT * FROM tareas WHERE id_tarea=".$id_tarea;
		$resCT=mysql_query($consultarea,$this->conectarBd());
		$rowRCT=mysql_fetch_array($resCT);
		$cadobs=explode("*",$rowRCT["observaciones"]);$long=count($cadobs);
?> 
		<div  align="center"><br />
			<form  id="form1" name="form1">
			<input type="hidden" name="id_tarea" id="id_tarea" value="<?=$id_tarea;?>" />
			<input type="hidden" name="id_hito" id="id_hito" value="<?=$id_hito;?>" />
			<input type="hidden" name="id_usuario" id="id_usuario" value="<?=$id_usuario;?>" />
			<table width="500" border="0" cellpadding="1" cellspacing="1" style="font-size:12px; z-index: 23;">
				<tr>
					<td colspan="2" style="background:#000; color:#FFF; height:20px; padding:5px;">Agregar Observaciones (Seguimientos)</td>
				</tr>
				<tr>
					<td colspan="2"><div style="height: 20px;padding: 10px;background: #F0F0F0;border: 1px solid #CCC;color:#666;font-weight: bold;font-size: 12px;"><?=strtoupper($rowRCT["titulo"]);?></div></td>
				</tr>
				<tr>
					<td width="20%" rowspan="<?=$long?>" style="height: 20px;padding: 5px;">Observaciones Anteriores:</td>
					<td width="60%">-<?=$cadobs[0];?></td>
				</tr>
				<?
					for($t=1; $t < $long ; $t++){
				?>
						<tr>
							<td width="60%">-<?=$cadobs[$t]?></td>
						</tr>
				<?
					}
				?>	
				<tr>
					<td>Nueva Observacion:</td>
					<td><textarea name="observacioNTarea" id="observacioNTarea" cols="40" rows="5"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><hr style=" background:#CCC;" /></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
					<input name="guardar" type="button" value="GUARDAR" onclick="guardarRegObs()" />&nbsp;&nbsp;
					<input type="button" onclick="cerrarVentana('ventanaNuevoSeguimiento')" value="CANCELAR" />					
					</td>
				</tr>
			</table>
		</form>
		<div id="guardaDatos" style="border:1px solid #00000; background:# #0099CC; height:50px; h">&nbsp;</div>
        </div>
<?	
	}
	function guarda_obs($id_tarea,$id_hito,$id_usuario,$observacioNTarea){
		$funcionesComunes=new funcionesComunes();
		$sqlobs="SELECT observaciones FROM tareas WHERE id_tarea='".$id_tarea."'";
		$resobs=mysql_query($sqlobs,$this->conectarBd());
		$respobs = mysql_fetch_array($resobs);
		$completa="".$respobs["observaciones"]."*".$observacioNTarea."";
		$sqlins="UPDATE tareas SET observaciones='".$completa."' WHERE id_tarea='".$id_tarea."'";
		$resins=mysql_query($sqlins,$this->conectarBd());
		$sakrid="SELECT id_proyecto FROM hitos WHERE id='".$id_hito."'";
		$resAkrid=mysql_query($sakrid,$this->conectarBd()) or die(mysql_error());
		$idksake = mysql_fetch_array($resAkrid);
		if($resins){
			$accionRealizada="OBSERVACION AGREGADA";
			$funcionesComunes->guardaDetalleSistema($idksake["id_proyecto"],$accionRealizada,$id_usuario);
?>
			<script type="text/javascript">
				alert('Observacion Agregada');
				cerrarVentana('ventanaNuevoSeguimiento');
				parametros='action=mostrarDetalleTareaHito&id_tarea='+<?=$id_tarea?>;
				ajax('mostrar',parametros);
				parametros='action=mostrarTareasHito&idHito='+<?=$id_hito?>;
				ajax('listadoTareasHito',parametros);
			</script>
<?
		}else{
?>
			<script type="text/javascript"> alert("Error al guardar el Hito del proyecto"); </script>
<?
		}
	}
	function fin_tarea($id_tarea,$id_hito,$id_usuario){
		$funcionesComunes=new funcionesComunes();
		$sqlUpdate="UPDATE tareas SET status='FINALIZADA' WHERE  id_tarea='".$id_tarea."'";;
		$resulUpdate=mysql_query($sqlUpdate,$this->conectarBd());
		$sakrid="SELECT id_proyecto FROM hitos WHERE id='".$id_hito."'";
		$resAkrid=mysql_query($sakrid,$this->conectarBd()) or die(mysql_error());
		$idksake = mysql_fetch_array($resAkrid);
		if($resulUpdate){
			$accionRealizada="TAREA FINALIZADA";
			$funcionesComunes->guardaDetalleSistema($idksake["id_proyecto"],$accionRealizada,$id_usuario);
?>
			<script type="text/javascript">
				alert("Tarea Finalizada");
				cerrarVentana('ventanaDialogoTarea');
				parametros='action=mostrarDetalleTareaHito&id_tarea='+<?=$id_tarea?>;
				ajax('mostrar',parametros);
				parametros='action=mostrarTareasHito&idHito='+<?=$id_hito?>;
				ajax('listadoTareasHito',parametros);
			</script>
<?
		}else{
?>
			<script type="text/javascript"> alert("Error al guardar el Hito del proyecto"); </script>
<?
		}
		
	}
	function avisoDetalle($detalle_aviso){
		$link=$this->Conexion();		
		$sqlConsult="SELECT id_aviso, remitente, destinatario, msj, fecha_aviso, hora_aviso, caducidad , img_profile FROM avisos LEFT JOIN cat_usuarios ON avisos.remitente = cat_usuarios.nombre WHERE id_aviso = '".$detalle_aviso."'";
		$resulta=mysql_query($sqlConsult,$link);	
		$row = mysql_fetch_array($resulta);
		$imgProfile="../../../images/ui//img_profiles/".$row['img_profile'];
?>
		<div style="margin:4px; height:97%; font-size:10px; border-top:1px solid #CCC;">			
			<div style="float:left; width:64px; height:64px; border:1px solid #F0F0F0; margin:5px;"><img src="<?=$imgProfile;?>" border="0" /></div>
			<div style="float:left;margin:5px; width:80%; height:98%; background:#F3F781; border:1px solid #CCC;/*sombra*/-webkit-box-shadow:10px 10px 5px #CCC;-moz-box-shadow:10px 10px 5px #CCC;">
				<div style=" height:20px; padding:5px; background:#000;color:#FFF; text-align:center; font-size:16px;border:1px solid #000;">Avisos</div>
				<span style="font-weight:bold; font-size:14px; margin-left:10px; font-style:italic;">Para: <?=$row["destinatario"]; ?></span><br><br>
				<span style="font-size:14px; margin-left:10px; font-style:italic;">De: <?=$row["remitente"]; ?></span><br /><br />
				<span style="font-weight:bold; margin-left:10px; font-style:italic;">Fecha Creacion:</span> <?=$row["fecha_aviso"]; ?>&nbsp;&nbsp;&nbsp;<span style="font-weight:bold;">Hora Creacion:</span> <?=$row["hora_aviso"]; ?><br /><br />
				<span style="font-weight:bold; margin-left:10px; font-style:italic;">Fecha t&eacute;rmino:</span> <span style="font-size:16px; margin-left:10px;"><?=$row["caducidad"]; ?></span><br /><br />
				<span style="font-weight:bold; margin-left:10px; font-style:italic;"><?=$row["msj"]; ?></span><br /><br />				
			</div>
		</div>
<?					
		mysql_free_result($resulta); 
		mysql_close($link); 	
	}
	function avisoStatus(){
		$link=$this->Conexion();
		//se extraen los avisos
		$sqlAvisos="SELECT id_aviso,caducidad FROM avisos WHERE status='Vigente'";
		$resAvisos=mysql_query($sqlAvisos,$link);
		if(mysql_num_rows($resAvisos) != "0"){
			//se recorren los resultados
			while($rowAvisos=mysql_fetch_array($resAvisos)){
				//se extrae la diferencia en dias por cada registro
				$sqlDias="SELECT DATEDIFF('".$rowAvisos["caducidad"]."','".date("Y-m-d")."') AS ndias";
				$resDias=mysql_query($sqlDias,$link);
				$rowDias=mysql_fetch_array($resDias);
				//se evalua si el valor es negativo
				if($rowDias['ndias']<'0'){
					//si es negativo se actualiza el valor en la base de datos
					$sqlStatus="UPDATE avisos SET status='Finalizado' WHERE  id_aviso='".$rowAvisos['id_aviso']."'";
					$resStatus=mysql_query($sqlStatus,$link);				
				}
			}
		}
		
	}//Cerrar funcion
	
}	
?>