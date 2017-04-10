function ajaxApp(url,divCarga,divResultado,tipoPeticion){
	$.ajax({
		url: url,
		type: tipoPeticion,
		data: "",
		beforeSend:function(){ 
			$("#"+divCarga).show().html("Procesando Informacion ..."); 
		},
		success: function(data) {
			$("#"+divCarga).hide();
			//controladorAccionesApp(accion,data,divResultado);
			$("#"+divResultado).show().html(data);
		},
		timeout:90000000,
		error:function() {
		    $("#"+divCarga).hide();
		    console.log("Error en la peticon ajax")
		    // $("#error").show();
		    // $("#error_mensaje").html('Ocurrio un error al procesar la solicitud.');
		}
	});
}