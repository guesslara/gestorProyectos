<?
	session_start();
	/*if(!isset($_SESSION['id_usuario_sistemas'])){
		header("../mod_login/index.php");
		exit;	
	}*/
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--<META HTTP-EQUIV="Refresh" CONTENT="5;URL=index.php">-->
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Proyectos</title>
<!-- embebemos la tipografía Tangerine --> 
  <!-Hoja de estilos del calendario -->
  <link rel="stylesheet" type="text/css" media="all" href="js/calendar-green.css" title="win2k-cold-1" />
  <!-- librería principal del calendario -->
  <script type="text/javascript" src="js/calendar.js"></script>
  <!-- librería para cargar el lenguaje deseado -->
  <script type="text/javascript" src="js/calendar-es.js"></script>
  <!-- librería que declara la función Calendar.setup, que ayuda a generar un calendario en unas pocas líneas de código -->
  <script type="text/javascript" src="js/calendar-setup.js"></script>
<link rel="StyleSheet" href="css/estilos.css" type="text/css" media="screen">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/funciones.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		ajax('listadoProyectos','action=consultar&status=Nuevo');
		redimensionar();
	});
	function redimensionar(){
		var altoDiv=$("#contenedorEnsamble3").height();
		var anchoDiv=$("#contenedorEnsamble3").width();
		var altoCuerpo=altoDiv-50;
		$("#mostrar").css("height",altoCuerpo+"px");		
		//$("#mostrar").css("width",(anchoDiv-500)+"px");
		$("#infoEnsamble3").css("height",altoCuerpo+"px");
	}
	
	window.onresize=redimensionar;
</script>
<style type="text/css">
html,body,document{position:absolute;margin:0px;height:100%; width:100%; margin:0px; overflow:hidden; font-family:Verdana, Geneva, sans-serif;}
#contenedorEnsamble{height:99%; position:relative;margin:0 auto 0 auto; width:99.5%; overflow:auto; background:#CCC;border:1px solid #000;}
#contenedorEnsamble3{width:99%;height:99%;background:#FFF;border:1px solid #000;margin:3px auto 0 auto;}
#barraOpcionesEnsamble{height:33px;padding:5px;background:#f0f0f0;border:1px solid #CCC;}
.opcionesEnsamble{border:1px solid #000;background:#FFF;height:20px;padding:5px;width:100px;text-align:center;float:left;margin-left:3px;font-size: 12px;}
.opcionesEnsamble:hover{background:#e1e1e1;cursor:pointer;}
.ventanaEnsambleContenido{background:#fff;border:1px solid #CCC;overflow:auto; float:left; width: 58%;}
#barraInferiorEnsamble{height:33px;padding:5px;background:#f0f0f0;border:1px solid #CCC;}
#opcionFlex{border:1px solid #CCC;font-size:12px;font-weight:bold;background:#FFF;height:20px;padding:5px;width:100px;text-align:center;float:left;margin-left:3px;}
#opcionCancelar{border:1px solid #CCC;font-size:12px;font-weight:bold;background:#FFF;width:100px;text-align:center;float:right;margin-left:3px;}
#erroresCaptura{float:left; margin-left:3px; height:20px;padding:5px; width:500px; background:#FFF;border:1px solid #000;overflow:auto;}
#infoEnsamble3{width:40%;border:1px solid #CCC;background:#f0f0f0;float:left;}
#msgFlexCaptura{border:1px solid #000;background-color:#FFF;height:150px;width:300px;position:absolute;left:50%;top:50%;margin-left:-150px;margin-top:-75px;z-index:4;}
#advertencia{height:20px;padding:5px;background:#000;color:#FFF; text-align:left;font-size:12px;}
#transparenciaGeneral{background:url(../../img/desv.png) repeat;position: absolute; left: 0; top: 0; width: 100%; height: 100%; z-index:20;}
.transparenciaGeneral{background:url(../../img/desv.png) repeat;position: absolute; left: 0; top: 0; width: 100%; height: 100%; z-index:20;}
#barraTitulo1VentanaDialogo{ height:20px; padding:5px; color:#FFF; font-size:12px; background:#000;}
.barraTitulo1VentanaDialogoValidacion{ height:20px; padding:5px; color:#FFF; font-size:12px; background:#000;}
#btnCerrarVentanaDialogo{ float:right;}
.opcionesTitulo{border:1px solid #000;background:#FFF;height:20px;padding:5px;width:auto;text-align:left;float:left;margin-left:3px;font-size: 12px;}
</style>
</head>

<body>
<input type="hidden" name="txtIdUsuarioSistemas" id="txtIdUsuarioSistemas" value="1" />
<input type="hidden" name="txtidProyectoActual" id="txtidProyectoActual" />
<input type="hidden" name="txtidHitoActual" id="txtidHitoActual" />
<div id="contenedorEnsamble">
	<div id="contenedorEnsamble3">
		<div id="barraOpcionesEnsamble">
			<!--
			<div id="nuevoProyecto" class="opcionesEnsamble"
			     onclick="abreVentana('msgVentanaDialogo','action=registro&id_usuario=<?=$_SESSION['id_usuario_sistemas']?>')"
				title="Nuevo Proyecto">Nuevo Proyecto</div>
		-->
			<div id="nuevoProyecto" class="opcionesEnsamble"
			     onclick="abreVentana('msgVentanaDialogo','action=registro&id_usuario=<?=$_SESSION['id_usuario_sistemas']?>')"
				title="Nuevo Proyecto">Nuevo Proyecto</div>
		
			<div id="opcionesFiltroProyectos" class="opcionesEnsamble" style="width: 200px;">
			Filtros:<select name="cboFiltro" id="cboFiltro" onchange="filtraAvisos()" style="width:100px;text-align: left;">
				    <option value="" selected="selected">Selecciona...</option>
				    <option value="Todos">Todos</option>
				    <option value="Nuevo">Nuevos</option>
				    <option value="Terminado">Finalizados</option>
				</select>
			</div>			
			<div id="btnRegresar" class="opcionesEnsamble" onclick="btnRegresar('proyectos')" style="display: none; width: 150px;">&laquo;&laquo; Regresar a Proyectos</div>
			<div id="nuevoHito" class="opcionesEnsamble" onclick="agregarHito('msgVentanaDialogoHito','<?=$_SESSION['id_usuario_sistemas']?>')" style="display: none;">Nuevo Hito</div>
			<div id="btnRegresarHitos" class="opcionesEnsamble" onclick="btnRegresar('hitos')" style="display: none; width:150px;">&laquo;&laquo; Regresar a Hitos</div>
			<div id="nuevoTareaHito" class="opcionesEnsamble" onclick="agregarTareaHito('msgVentanaDialogoTarea','<?=$_SESSION['id_usuario_sistemas']?>')" style="display: none;">Nuevo Tarea</div>
			<div id="opcionesTitulo" class="opcionesTitulo" style="display: none;">&nbsp;</div>
			<!--<div style="float:right;width:200px;height:20px;padding:5px;background:#FFF;border:1px solid #CCC;font-size:13px;text-align:right;"></div>-->
		</div>
		<div id="infoEnsamble3">
			<div id="listadoProyectos" style="border:1px solid #e1e1e1;background:#fff; height:98.5%;width:98%;font-size:12px;margin:3px;overflow: auto;"></div>
			<div id="listadoHitos" style="display: none;border:1px solid #e1e1e1;background:#fff; height:98.5%;width:98%;font-size:12px;margin:3px;overflow: auto;"></div>
			<div id="listadoTareasHito" style="display: none;border:1px solid #e1e1e1;background:#fff; height:98.5%;width:98%;font-size:12px;margin:3px;overflow: auto;"></div>
			<!--<div id="infoCapturaFlex" style="border:1px solid #e1e1e1;background:#fff; height:100px;width:180px;font-size:12px;text-align:left;margin:0 auto 0 auto;"></div>
			<div id="infoEquiposIng" style="border:1px solid #e1e1e1;background:#fff; height:220px;width:180px;font-size:20px;text-align:center;margin:0 auto 0 auto;"></div>
			<input type="hidden" id="txtOpcionFlex" name="txtOpcionFlex" value="" />-->
		</div>
		<div id="mostrar" class="ventanaEnsambleContenido"></div>
		<div id="ventanaEnsambleContenido2" class="ventanaEnsambleContenido" style="display:none;"></div>
		<div style="clear:both;"></div>
	</div>
</div>
<div id="ventanaDialogo" class="ventanaDialogo" style="display:none;">
	<div id="barraTitulo1">Opciones...<div id="btnCerrar"><a href="#" onclick="cerrarVentana('ventanaDialogo')" title="Cerrar Ventana Dialogo"><img src="../../../images/close.gif" border="0" /></a></div></div>
	<div id="msgVentanaDialogo" class="msgVentanaDialogo"></div>
</div>
<div id="ventanaDialogoHito" class="ventanaDialogo" style="display:none;">
	<div id="barraTitulo1">Opciones...<div id="btnCerrar"><a href="#" onclick="cerrarVentana('ventanaDialogoHito')" title="Cerrar Ventana Dialogo"><img src="../../../images/close.gif" border="0" /></a></div></div>
	<div id="msgVentanaDialogoHito" class="msgVentanaDialogo"></div>
</div>
<div id="ventanaDialogoTarea" class="ventanaDialogo" style="display:none;">
	<div id="barraTitulo1">Opciones...<div id="btnCerrar"><a href="#" onclick="cerrarVentana('ventanaDialogoHito')" title="Cerrar Ventana Dialogo"><img src="../../../images/close.gif" border="0" /></a></div></div>
	<div id="msgVentanaDialogoTarea" class="msgVentanaDialogo"></div>
</div>
<div id="ventanaNuevoSeguimiento" class="ventanaDialogo" style="display:none;">
	<div id="barraTitulo1">Opciones...<div id="btnCerrar"><a href="#" onclick="cerrarVentana('ventanaDialogoHito')" title="Cerrar Ventana Dialogo"><img src="../../../images/close.gif" border="0" /></a></div></div>
	<div id="msgVentanaNuevoSeguimiento" class="msgVentanaDialogo"></div>
</div>
</body>
</html>