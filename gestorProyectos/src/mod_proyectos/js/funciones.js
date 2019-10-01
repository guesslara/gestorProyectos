var otrResp=0;
var arreDias=0;
var t=0;
function ajax(capa,datos,ocultar_capa){
	if (!(ocultar_capa==""||ocultar_capa==undefined||ocultar_capa==null)) { $("#"+ocultar_capa).hide(); }
	var url="acciones.php";
	//alert("URL="+url+"\nCAPA="+capa+"\nDATOS="+datos);
	$.ajax({
		async:true,
		type: "POST",
		dataType: "html",
		contentType: "application/x-www-form-urlencoded",
		url:url,
		data:datos,
		beforeSend:function(){ 
			$("#"+capa).show().html('<center>Procesando, espere un momento.</center>');
		},
		success:function(datos){
			if(capa=="otroR"){
				$("#"+capa).show().append(datos);
			}else{
				$("#"+capa).show().html(datos);
			}
		},
		timeout:90000000,
		error:function(datos) { $("#"+capa).show().html('<center>Error: El servidor no responde. <br>Por favor intente mas tarde. </center>'); }
	});
}
function guardarRegProyecto(id_usuario){
	var responsP = new Array(otrResp);
	var concares="",DyH="";
	for(var i=0; i<responsP.length;i++){
		responsP[i]=document.getElementById("resP"+i).value;
		concares+=responsP[i]+",";
	}
	concares=concares.substring(0,(concares.length-1));
	var titulo=document.getElementById("titulo").value;
	var descripcion=document.getElementById("descripcion").value;	
	var fecha_creacion=document.getElementById("fecha_inicio").value;
	var fecha_termino=document.getElementById("fecha_termino").value;
	var observacionesProyecto=document.getElementById("observacionesProyecto").value;
	id_usuario=1;
	thxs=document.getElementById("TOTAL").value;
	thxp=document.getElementById("TOTALPROY").value;
	for(var g=0;g<7;g++){
		if(document.getElementById("d"+g).checked){
			nomd=document.getElementById("d"+g).value;
			nd=document.getElementById("dia_"+nomd).value;
			DyH+=nomd+"="+nd+",";
		}
	}
	DyH=DyH.substring(0,(DyH.length-1));
	if (fecha_termino<fecha_creacion){
		alert('Verifique la Fecha de Vencimiento (que la haya colocado y que no sea menor a la de Inicio)');
		return 0;
	}
	if(titulo=="" || descripcion=="" || id_usuario=="" || fecha_creacion=="" || fecha_termino=="" || concares=="" || TOTAL==""){
		alert("Error: \n\n Verifique que no deje ningun espacio en blanco.");
		return 0;
	}else{
		parametros="action=guardaProyecto&titulo="+titulo+"&descripcion="+descripcion+"&fecha_creacion="+fecha_creacion+"&fecha_termino="+fecha_termino+"&responsable="+concares+"&observacionesProyecto="+observacionesProyecto+"&id_usuario="+id_usuario+"&HxS="+thxs+"&HxP="+thxp+"&DyH="+DyH;
		ajax("listadoProyectos",parametros);
	}
	return 1;
}
function filtraAvisos(){
	var status=document.getElementById("cboFiltro").value;	
	ajax('listadoProyectos','action=consultar&status='+status);
}
function cancelarAviso(id_tarea){		
	alert("Accion cancelada");				
}
function verDeatlleAviso(idMsg){
	alert(idMsg);
	
}
function detalle(id_proyecto){
	$("#txtidProyectoActual").attr("value",id_proyecto)
	ajax("mostrar","action=detalle&id_proyecto="+id_proyecto);
	//se oculta el panel de los proyectos
	$("#listadoProyectos").hide();
	//se ocultan el boton y el filtro del proyecto
	$("#nuevoProyecto").hide();
	$("#opcionesFiltroProyectos").hide();
	//se muestran las opciones de navegacion
	$("#btnRegresar").show();
	$("#nuevoHito").show();
	$("#opcionesTitulo").show();
	$("#listadoHitos").show();
	ajax("listadoHitos","action=mostrarHitos&id_proyecto="+id_proyecto);
}
function actualizaHito(id_proyecto){
	ajax("listadoHitos","action=mostrarHitos&id_proyecto="+id_proyecto);
}
function btnRegresar(opcion){
	if(opcion=="proyectos"){
		//se limpia la informacion del proyecto
		$("#mostrar").html("");
		//se muestra el listado de los proyectos
		$("#listadoProyectos").show();
		//se muestra el boton y el filtro del proyecto
		$("#nuevoProyecto").show();
		$("#opcionesFiltroProyectos").show();
		//se ocultan las opciones de navegacion
		$("#btnRegresar").hide();
		$("#nuevoHito").hide();
		$("#opcionesTitulo").hide();
		$("#listadoHitos").hide();
	}else if(opcion=="hitos"){
		//se muestra el listado de hitos
		$("#listadoHitos").show();
		//se ocultan las tareas
		$("#listadoTareasHito").hide();
		//se muestra los botones de navegacion
		$("#btnRegresar").show();
		$("#nuevoHito").show();
		//se ocultan los botones anteriores
		$("#btnRegresarHitos").hide();
		$("#nuevoTareaHito").hide();
	}
}
/*//function cancelarMensaje(id_tarea){
//		
//		ajax("listadoAvisos","action=consultar&status="+status)
//}*/
function detalle_guardar(id_tarea,id_usuario){
	var msj_detalle=document.getElementById("msj_detalle").value;
	var fecha_detalle=document.getElementById("fecha_detalle").value;
	var hora_detalle=document.getElementById("hora_detalle").value;
	//var fecha_cierre=document.getElementById("fecha_cierre").value;
	//var hora_cierre=document.getElementById("hora_cierre").value;
	var id_usuario=document.getElementById("id_usuario").value;
	var id_tarea=document.getElementById("id_tarea").value;
	var porcentaje=parseInt(document.getElementById("txtPorcentajeAvance").value);
	var porcentajeBd=parseInt(document.getElementById("txtPorcentajeAvanceBd").value);
	var limiteAvance=100;
	
	//var status=document.getElementById("status").value;
	//$("#guardaDatos").html("action=detalle_guardar&msj_detalle="+msj_detalle+"&fecha_detalle="+fecha_detalle+"&hora_detalle="+hora_detalle+"&id_usuario="+id_usuario+"&id_tarea="+id_tarea);
	if(isNaN(porcentaje) || porcentaje == "" || porcentaje > limiteAvance || msj_detalle=="" || porcentaje <= porcentajeBd){
		alert("Error: \n\n El porcentaje de avance debe ser un numero.\n\n El porcentaje de avance no puede superar el 100 %.\n\nEl texto del seguimiento no debe de estar vacio.\n\nEl porcentaje de Avance no puede ser igual o menor al introducido.");
	}else{
		ajax("listadoProyectos","action=detalle_guardar&msj_detalle="+msj_detalle+"&fecha_detalle="+fecha_detalle+"&hora_detalle="+hora_detalle+"&id_usuario="+id_usuario+"&id_tarea="+id_tarea+"&porcentaje="+porcentaje)
	}
}
function finalizarAviso(id_tarea){
	var txtIdUsuarioSistemas=$("#txtIdUsuarioSistemas").val();
	if(confirm("Desea finalizar la Tarea: "+id_tarea)){
		ajax("mostrar","action=finalizarAviso&id_tarea="+id_tarea+"&txtIdUsuarioSistemas="+txtIdUsuarioSistemas)
	} else {
		alert("Accion cancelada");
	}
}
function guardarAviso(remitente){
	//var id_aviso=document.getElementById("id_aviso").value;
	var remitente=document.getElementById("remitente").value;
	var destinatario=document.getElementById("destinatario").value;
	var msj=document.getElementById("msj").value;
	var caducidad=document.getElementById("caducidad").value;
	var fecha_aviso=document.getElementById("fecha_aviso").value;
	//var fecha_cierre=document.getElementById("fecha_cierre").value;
	//var hora_cierre=document.getElementById("hora_cierre").value;
	var hora_aviso=document.getElementById("hora_aviso").value;
	//var status=document.getElementById("status").value;
	//$("#guardaDatos").html("action=guardarAviso&remitente="+remitente+"&destinatario="+destinatario+"&msj="+msj+"&caducidad="+caducidad+"&fecha_aviso="+fecha_aviso+"&hora_aviso="+hora_aviso);
	ajax("listadoAvisos","action=guardarAviso&remitente="+remitente+"&destinatario="+destinatario+"&msj="+msj+"&caducidad="+caducidad+"&fecha_aviso="+fecha_aviso+"&hora_aviso="+hora_aviso)
}
function detalle_aviso(id_aviso){
	ajax("mostrar","action=detalle_aviso&id_aviso="+id_aviso)
}
function filtrarAvisos(destinatario,nivel){
	var status=document.getElementById("filtro").value;
	ajax('listadoAvisos','action=consultar_aviso&status='+status+'&destinatario='+destinatario+'&nivel='+nivel);
}
function abreVentana(div,accion){
	if(div=="msgVentanaDialogo"){
		$("#ventanaDialogo").show();
	}else if(div=="msgVentanaDialogoHito"){
		$("#ventanaDialogoHito").show();
	}	
	ajax(div,accion);
}
function cerrarVentana(div){
	$("#"+div).hide();
}
function agregarHito(div,id_usuarioSistemas){
	//se recupera el id del proyecto
	idProyecto=$("#txtidProyectoActual").val();
	parametros="action=addHito&id_usuario="+id_usuarioSistemas+"&idProyectoActual="+idProyecto;
	$("#ventanaDialogoHito").show();
	ajax(div,parametros);
}
function guardarRegHito(){
	fecha_inicio_proy=$("#fecha_inicio_proy").val();
	fecha_fin_proy=$("#fecha_fin_proy").val();
	txtHitoProyectoActual=$("#txtHitoProyectoActual").val();
	tituloHito=$("#tituloHito").val();
	objetivoH=$("#objetivoH").val();
	fecha_inicioHito=$("#fecha_inicioHito").val();
	fecha_vencimientoHito=$("#fecha_vencimientoHito").val();
	observacionesHito=$("#observacionesHito").val();
	//id_usuario=$("$id_usuario").val();
	var id_usuario=1;
	if((fecha_inicioHito>=fecha_inicio_proy && fecha_inicioHito<=fecha_fin_proy)&&(fecha_vencimientoHito>=fecha_inicio_proy && fecha_vencimientoHito<=fecha_fin_proy)){
		if (fecha_vencimientoHito<fecha_inicioHito){
			alert('Verifique la Fecha de Vencimiento que no sea menor a la de Inicio');
			return 0;
		}
		if(tituloHito=="" || fecha_inicioHito=="" || fecha_vencimientoHito=="" || id_usuario==""){
			alert("Error: \n\n Verifique que no deje ningun espacio en blanco.");
			return 0;
		}else{
			parametros="action=guardarHitoProyecto&txtHitoProyectoActual="+txtHitoProyectoActual+"&tituloHito="+tituloHito+"&objetivoH="+objetivoH+"&fecha_inicioHito="+fecha_inicioHito+"&fecha_vencimientoHito="+fecha_vencimientoHito+"&observacionesHito="+observacionesHito+"&id_usuario="+id_usuario;
			ajax("listadoHitos",parametros);
		}
	}else{
		alert("Verifique que las fechas del Hito, que no sobrepasen las fechas del Proyecto\n\t\tFecha inicio Proyecto:\t"+fecha_inicio_proy+"\n\t\tFecha Fin Proyecto:\t\t"+fecha_fin_proy);
		return 0;
	}
	return 1;
}
function detalleHito(idHito){
	parametros="action=mostrarHito&idHito="+idHito;
	ajax("mostrar",parametros);
	//se muestran los botones de navegacion
	$("#btnRegresarHitos").show();
	$("#nuevoTareaHito").show();
	//se ocultan los botones
	$("#btnRegresar").hide();
	$("#nuevoHito").hide();
	//se ocultan los hitos
	$("#listadoHitos").hide();
	//se muestran las tareas
	$("#listadoTareasHito").show();
	parametros="action=mostrarTareasHito&idHito="+idHito;
	ajax("listadoTareasHito",parametros);
	//se asigna el valor al campo oculto
	$("#txtidHitoActual").attr("value",idHito);
}
function agregarTareaHito(div,id_usuarioSistemas){
	//se recupera el di del hito
	idHitoActual=$("#txtidHitoActual").val();
	$("#ventanaDialogoTarea").show();
	parametros="action=addTareaHito&id_usuario="+id_usuarioSistemas+"&idHitoActual="+idHitoActual;
	ajax(div,parametros);
}
function guardarRegTareaHito(){
	fecha_inicio_hito=document.getElementById("fecha_inicio_hito").value;
	fecha_fin_hito=document.getElementById("fecha_fin_hito").value;
	var responsP = new Array(otrResp);
	var concares="";
	for(var i=0; i<responsP.length;i++){
		responsP[i]=document.getElementById("resP"+i).value;
		concares+=responsP[i]+",";
	}
	concares=concares.substring(0,(concares.length-1));
	idHitoTareaActual=$("#txtHitoTareaActual").val();
	tituloTareaHito=$("#tituloTareaHito").val();
	objetivoT=$("#objetivoT").val();
	descripcionTareaHito=$("#descripcionTareaHito").val();
	fecha_inicioTareaHito=$("#fecha_inicioTareaHito").val();
	fecha_vencimientoTareaHito=$("#fecha_vencimientoTareaHito").val();
	observacionesTareaHito=$("#observacionesTareaHito").val();
	evidenciasT=$("#evidenciasT").val();
	//id_usuario=$("#id_usuario").val();
	id_usuario=1;
	if((fecha_inicioTareaHito>=fecha_inicio_hito && fecha_inicioTareaHito<=fecha_fin_hito)&&(fecha_vencimientoTareaHito>=fecha_inicio_hito && fecha_vencimientoTareaHito<=fecha_fin_hito)){
		if (fecha_vencimientoTareaHito<fecha_inicioTareaHito){
			alert('Verifique la Fecha de Vencimiento (que la haya colocado y que no sea menor a la de Inicio)');
			return 0;
		}
		if(tituloTareaHito=="" || descripcionTareaHito=="" || objetivoT=="" || concares=="" || id_usuario==""){
			alert("Error: \n\n Verifique que no deje ningun espacio en blanco.");
			return 0;
		}else{
			parametros="action=guardarTareaHito&tituloTareaHito="+tituloTareaHito+"&objetivoT="+objetivoT+"&descripcionTareaHito="+descripcionTareaHito+"&fecha_inicioTareaHito="+fecha_inicioTareaHito+"&fecha_vencimientoTareaHito="+fecha_vencimientoTareaHito+"&responsableTarea="+concares+"&observacionesTareaHito="+observacionesTareaHito+"&evidenciasT="+evidenciasT+"&idHitoTareaActual="+idHitoTareaActual+"&id_usuario="+id_usuario;
			ajax("listadoTareasHito",parametros);
		}
	}else{
		alert("Verifique que las fechas de la Tarea que no sobrepasen las fechas del Hito\n\t\tFecha inicio Hito:\t"+fecha_inicio_hito+"\n\t\tFecha Fin Hito:\t\t"+fecha_fin_hito);
		return 0;
	}
	return 1;
}
function actualizaTareasHito(idHito){
	parametros="action=mostrarTareasHito&idHito="+idHito;
	ajax("listadoTareasHito",parametros);
	//se asigna el valor al campo oculto
	$("#txtidHitoActual").attr("value",idHito);
}
function detalleTareaHito(id_tarea){
	parametros="action=mostrarDetalleTareaHito&id_tarea="+id_tarea;
	ajax("mostrar",parametros)
}
function sumar(nom) {
	cero=document.getElementById("dia_"+nom).value.charAt(0);
	if(cero!=0){
		if(isNaN(document.getElementById("dia_"+nom).value)){
			alert("Debe de introducir solo Números");
			$("#dia_"+nom).attr("value","0");
			return 0;
		}else{
			var n=parseInt(document.getElementById("dia_"+nom).value);
			t=t+n;
			document.form1.TOTAL.value=t;
			var ls=document.getElementById("semanas").value;
			var ns=parseFloat(ls)
			tp=t*ns;
			document.form1.TOTALPROY.value=tp.toFixed(2);
			return 1;
		}
	}else{
		alert("La cifra no debe comenzar con 0");
		return 0;
	}
}
function agregaH(box,div){
	var nom=box.value;
	if(box.checked){
		caja="Horas:<input type='text' name='dia_"+nom+"' id='dia_"+nom+"' onChange='sumar(\""+nom+"\")' value='0' style='width: 50px;'/>";
		$("#"+div).append(caja);		
		arreDias++;
	}else{
		var l=document.getElementById("dia_"+nom).value;
		var n=parseInt(l);
		t=t-n;
		document.form1.TOTAL.value=t;
		var ls=document.getElementById("semanas").value;
		var ns=parseFloat(ls);
		tp=t*ns;
		document.form1.TOTALPROY.value=tp.toFixed(2);
		$("#"+div).html("");
	}
}
function tproy(){
	var fecha_inicio=new Date(document.getElementById("fecha_inicio").value);
	var fecha_termino=new Date(document.getElementById("fecha_termino").value);
	var one_day = 1000*60*60*24;
	var daysApart = Math.abs(Math.ceil((fecha_termino.getTime()-fecha_inicio.getTime())/one_day));
	var semanas=daysApart/7;
	document.form1.semanas.value=semanas;
}
function anadeR(){
	div="otroR_"+otrResp;
	otrResp++;
	parametros="action=agregarR&id=resP"+otrResp+"&div=otroR_"+otrResp;
	ajaxApp(div,"acciones.php",parametros,"POST");
	
}
function borraResp(){
	otrResp--;
	alert('otroR_'+otrResp);
	$("#otroR_"+otrResp).html("");	
}
function fin_tarea(id_tarea,id_hito){
	txtIdUsuarioSistemas=document.getElementById("txtIdUsuarioSistemas").value;
	if (confirm("¿Estas seguro de Finalizar esta Tarea?")){ 
		parametros="action=fin_tarea&id_tarea="+id_tarea+"&id_hito="+id_hito+"&id_usuario="+txtIdUsuarioSistemas;
		ajax("mostrar",parametros);
	}else{
		return 0;
	}
	return 1;
}
function agregar_obs(id_tarea,id_hito){
	txtIdUsuarioSistemas=document.getElementById("txtIdUsuarioSistemas").value;
	parametros="action=agregar_obs&id_tarea="+id_tarea+"&id_hito="+id_hito+"&id_usuario="+txtIdUsuarioSistemas;
	$("#msgVentanaNuevoSeguimiento").show();
	ajax("ventanaNuevoSeguimiento",parametros);
}
function guardarRegObs(){
	id_tarea=document.getElementById("id_tarea").value;
	id_hito=document.getElementById("id_hito").value;
	id_usuario=document.getElementById("id_usuario").value;
	observacioNTarea=document.getElementById("observacioNTarea").value;
	if(observacioNTarea==""){
		alert('Debe Ingresar la Nueva Observacion y/o Seguiemiento');
		return 0;
	}else{
		parametros="action=guardaObs&id_tarea="+id_tarea+"&id_hito="+id_hito+"&id_usuario="+id_usuario+"&observacioNTarea="+observacioNTarea;
		ajax("mostrar",parametros);
	}
	return 1;
}
function ajaxApp(divDestino,url,parametros,metodo){	
	$.ajax({
	async:true,
	type: metodo,
	dataType: "html",
	contentType: "application/x-www-form-urlencoded",
	url:url,
	data:parametros,
	beforeSend:function(){ 
		$("#divFooter").show().html("Cargando informacion..."); 
	},
	success:function(datos){ 
		$("#divFooter").hide();
		if(divDestino=="otroR_0" || divDestino=="otroR_1" || divDestino=="otroR_2" || divDestino=="otroR_3"){
			$("#"+divDestino).show().append(datos);
		}else{
			$("#"+divDestino).show().html(datos);		
		}		
	},
	timeout:90000000,
	error:function() { $("#"+divDestino).show().html('<center>Error: El servidor no responde. <br>Por favor intente mas tarde. </center>'); }
	});
}