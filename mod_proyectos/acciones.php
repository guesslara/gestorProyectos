<?php
session_start();
$ac=$_POST["action"];
//print_r($_POST);
switch ($ac){
	case "agregarDia":
		require_once("aviso.php");
		$proyectos=new proyectos();
		$proyectos->agregarDia($_POST['dia'],$_POST['otro']);
	break;
	case "agregarR":
		require_once("aviso.php");
		$proyectos=new proyectos();
		$proyectos->agregaR($_POST['id'],$_POST['div']);
	break;
	//next
	case "registro":
		require_once("aviso.php");
		$proyectos=new proyectos();
		$proyectos->agregarProyecto($_POST['id_usuario']);
	break;	
	case "guardaProyecto":
		//print_r($_POST);
		require_once("aviso.php");
		$proyectos=new proyectos();
		$titulo=$_POST["titulo"];
		$descripcion=$_POST["descripcion"];
		$fecha_creacion=$_POST["fecha_creacion"];
		$fecha_termino=$_POST["fecha_termino"];
		$responsable=$_POST["responsable"];
		$observacionesProyecto=$_POST["observacionesProyecto"];
		$id_usuario=$_POST["id_usuario"];
		$proyectos->guardarRegistroProyecto($titulo,$descripcion,$fecha_creacion,$fecha_termino,$responsable,$observacionesProyecto,$id_usuario,$_POST["HxS"],$_POST["HxP"],$_POST["DyH"]);
	break;
	case "addHito":
		require_once("aviso.php");
		$proyectos=new proyectos();
		$proyectos->agregarHito($_POST['id_usuario'],$_POST["idProyectoActual"]);
	break;
	case "guardarHitoProyecto":
		//print_r($_POST);
		require_once("aviso.php");
		$proyectos=new proyectos();
		$proyectos->guardarHitoProyecto($_POST["txtHitoProyectoActual"],$_POST["tituloHito"],$_POST["objetivoH"],$_POST["fecha_inicioHito"],$_POST["fecha_vencimientoHito"],$_POST["observacionesHito"],$_POST["id_usuario"]);
	break;
	case "mostrarHito":
		//print_r($_POST);
		require_once("aviso.php");
		$proyectos=new proyectos();
		$proyectos->mostrarHito($_POST["idHito"]);
	break;
	case "mostrarTareasHito":
		//print_r($_POST);
		require_once("aviso.php");
		$proyectos=new proyectos();
		$proyectos->mostrarTareasHito($_POST["idHito"]);
	break;
	case "addTareaHito":
		//print_r($_POST);
		require_once("aviso.php");
		$proyectos=new proyectos();
		$proyectos->agregarTareasHito($_POST["idHitoActual"]);
	break;
	case "guardarTareaHito":
		//print_r($_POST);		
		require_once("aviso.php");
		$proyectos=new proyectos();
		$proyectos->guardarTareasHitoProyecto($_POST["tituloTareaHito"],$_POST["objetivoT"],$_POST["descripcionTareaHito"],$_POST["fecha_inicioTareaHito"],$_POST["fecha_vencimientoTareaHito"],$_POST["responsableTarea"],$_POST["observacionesTareaHito"],$_POST["evidenciasT"],$_POST["idHitoTareaActual"],$_POST["id_usuario"]);
	break;
	case "mostrarDetalleTareaHito":
		//print_r($_POST);
		require_once("aviso.php");
		$proyectos=new proyectos();
		$proyectos->verDetalleTareaHito($_POST["id_tarea"]);
	break;
	case "guardarReg":	
		$titulo=$_GET["titulo"];
		$mensaje=$_GET["mensaje"];
		$prioridad=$_GET["prioridad"];
		$fecha_creacion=$_GET["fecha_creacion"];
		$hora_creacion =$_GET["hora_creacion"];
		$id_usuarioS=$_GET["id_usuario"];
		require_once("aviso.php");
		$tareas=new tareas();
		$tareas->guardarRegistro($titulo,$mensaje,$prioridad,$fecha_creacion,$hora_creacion,$id_usuarioS);	
		break;
		
	case "consultar":	
		include "aviso.php";
		$proyectos=new proyectos();
		$proyectos->listarProyectos($_POST["status"]);		
	break;			
	case "detalle":
		require_once("aviso.php");
		$proyectos=new proyectos();
		$proyectos->detalleProyecto($_POST['id_proyecto']);
	break;	
	case "mostrarHitos":
		require_once("aviso.php");
		$proyectos=new proyectos();
		$proyectos->mostrarHitos($_POST['id_proyecto']);
	break;
	case "detalle_guardar":
		$msj_detalle=$_GET["msj_detalle"];
		$fecha_detalle=$_GET["fecha_detalle"];
		$hora_detalle =$_GET["hora_detalle"];
		$id_tarea=$_GET["id_tarea"];
		$id_usuario=$_GET["id_usuario"];
		$porcentaje=$_GET["porcentaje"];
		require_once("aviso.php");
		$tareas=new tareas(); 
		$tareas->guardarDetalle($msj_detalle,$fecha_detalle,$hora_detalle,$id_detalle,$id_usuario,$id_tarea,$porcentaje);
		break;	
		
	case "agregar_detalle":
		require_once("aviso.php");
		$tareas=new tareas();
		$tareas->agregar_detalle($_GET['id_tarea'],$_GET['tarea'],$_GET['porcentaje']);
		break;	
		
	case "cierreAviso":		
		$fecha_cierre=$_GET["fecha_cierre"];
		$hora_cierre =$_GET["hora_cierre"];
		$id_tarea=$_GET["id_tarea"];		
		require_once("aviso.php");
		$tareas=new tareas(); 
		$tareas->cambiarStatus($fecha_cierre,$hora_cierre,$id_tarea);	
	break;			
	case "finalizarAviso":
		require_once("aviso.php");
		$tareas=new tareas();
		$tareas->cierreAviso($_GET['id_tarea'],$_GET["txtIdUsuarioSistemas"]);
	break;		
	case "registrar":
		require_once("aviso.php");
		$tareas=new tareas();
		$tareas->nuevoAviso($_GET['remitente']);
	break;			
	case "guardarAviso":		
		$nombreS=$_GET["remitente"];
		$destinatario=$_GET["destinatario"];
		$msj=$_GET["msj"];
		$caducidad=$_GET["caducidad"];
		$fecha_aviso =$_GET["fecha_aviso"];
		$hora_aviso=$_GET["hora_aviso"];
		require_once("aviso.php");
		$tareas=new tareas();
		$tareas->avisoRegistro($nombreS,$destinatario,$msj,$caducidad,$fecha_aviso,$hora_aviso);
	break;		
	case "consultar_aviso":
		require_once("aviso.php");
		$tareas=new tareas();
		$tareas->listar($_GET['id_aviso'],$_GET['status'],$_GET['destinatario'],$_GET['nivel']);
	break;			
	case "detalle_aviso":
		require_once("aviso.php");
		$tareas=new tareas();
		$tareas->avisoDetalle($_GET['id_aviso'],$_GET['Dias']);
	break;		
	case "status_aviso":
		require_once("aviso.php");
		$tareas=new tareas();
		$tareas->avisoStatus();
	break;
	case "fin_tarea":
		require_once("aviso.php");
		$proyectos=new proyectos();
		$proyectos->fin_tarea($_POST["id_tarea"],$_POST["id_hito"],$_POST["id_usuario"]);
	break;
	case "agregar_obs":
		require_once("aviso.php");
		$proyectos=new proyectos();
		$proyectos->agregar_obs($_POST["id_tarea"],$_POST["id_hito"],$_POST["id_usuario"]);
	break;
	case "guardaObs":
		print_r($_POST);
		require_once("aviso.php");
		$proyectos=new proyectos();
		$proyectos->guarda_obs($_POST["id_tarea"],$_POST["id_hito"],$_POST["id_usuario"],$_POST["observacioNTarea"]);
	break;
}
exit;
?>
