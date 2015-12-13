function actualizar_borrador(){

	if($("#asunto_borrador").val() == "" || $("#asunto").val() == null){
		alert("Escribe un asunto");
		return
	}
	if($("#mensaje_borrador").val() == "" || $("#mensaje").val() == null){
		alert("Escribe un mensaje");
		return
	}

	var mensaje = {
		"mensaje_id": $("#mensaje_id").val(),
		"asunto"	: $("#asunto_borrador").val(),
		"mensaje"	: $("#mensaje_borrador").val()
	};

	ajax_without_return(baseURL("correo/actualizar_borrador"),mensaje,function(){
		alert("Mensaje guardado");
		actualizar();
	});
}

function editar_borrador(_mensaje){

	$.post(baseURL('correo/editar_borrador'),
		{mensaje: _mensaje},
		function(data){
			if(data != "" && data != null){
				$("#mensaje_id").val(data.mensaje_id);
				$("#asunto_borrador").val(data.asunto);
				$("#mensaje_borrador").val(data.mensaje);
				$("#editar_borrador").modal("show");
			}
		},
		"json");
}

function enviar_mensaje(){

	if($("#destinatario").val() == null || !$("#destinatario").length){
		alert("Selecciona un usuario de la lista");	
		return;
	}
	if($("#asunto").val() == "" || $("#asunto").val() == null){
		alert("Escribe un asunto");
		return
	}
	if($("#mensaje").val() == "" || $("#mensaje").val() == null){
		alert("Escribe un mensaje");
		return
	}

	mensaje = {
		usuarios: 	$("#destinatario").val(),
		asunto: 	$("#asunto").val(),
		mensaje: 	$("#mensaje").val(), 
		curr_adj: 	curriculum_adjuntado()
	};

	$(".btn-send").attr("disabled",'true');
	$(".loading-img").show();

	ajax_without_return(baseURL("correo/enviar_mensaje"),mensaje,function(){
		$(".btn-send").attr("disabled",'false');
		$(".loading-img").hide();
		alert("Mensaje enviado");
		window.location = window.location;
		$("#redactar_mensaje").modal("hide");
	});
}

function enviar_borrador(){

	if($("#destinatario").val() == null || !$("#destinatario").length){
		alert("Selecciona un usuario de la lista");	
		return;
	}
	if($("#asunto_borrador").val() == "" || $("#asunto").val() == null){
		alert("Escribe un asunto");
		return
	}
	if($("#mensaje_borrador").val() == "" || $("#mensaje").val() == null){
		alert("Escribe un mensaje");
		return
	}

	mensaje = {
		mensaje_id: $("#mensaje_id").val(),
		usuarios: 	$("#destinatario").val(),
		asunto: 	$("#asunto_borrador").val(),
		mensaje: 	$("#mensaje_borrador").val(), 
		curr_adj: 	curriculum_adjuntado(true)
	};


	$(".btn-send").attr("disabled",'true');
	$(".loading-img").show();

	ajax_without_return(baseURL("correo/enviar_mensaje"),mensaje,function(){

		$(".btn-send").attr("disabled",'false');
		$(".loading-img").hide();
		alert("Mensaje enviado");
		window.location = window.location;
		$("#redactar_mensaje").modal("hide");
	});	
}

function curriculum_adjuntado(borrador){
	if(borrador != undefined && borrador == true){
		if($("#curriculum_adjuntado_borrador").length){
			if($("#curriculum_adjuntado_borrador").prop("checked")){
				return "true";
			}
			return "false";
		}
	}

	if($("#curriculum_adjuntado").length){
		if($("#curriculum_adjuntado").prop("checked")){
			return "true";
		}	
	}

	return "false";
}

function eliminar_mensaje(mensaje){

	if(!confirm("¿Estas seguro que deseas borrar este mensaje?")){
		return;
	}

	$.post(baseURL('correo/eliminar_mensajes'),
		{mensajes: mensaje},
		function(data){
			if(data == "" || data == null){
				alert("Mensaje eliminado");
				actualizar();
			}else{
				console.log(data);
			}
		});
}

function eliminar_mensajes(){
	mjs_marcados = $("input:checked");

	/*Nos salimos de la funcion si no esta ninguna checkbox marcada*/
	if(mjs_marcados.length ==  0){
		alert('No se han seleccionado mensajes');
		return;
	}

	if(!confirm("¿Estas seguro que deseas eliminar los mensajes seleccionados?")){
		return;
	}

	data = Array();
	$(mjs_marcados).each(function(indice, elemento){
		data.push(elemento.value);
	});
	
	$.ajax({
		url: baseURL('correo/eliminar_mensajes'),
		type: 		'post',
		datatype: 	'html',
		data: 		{mensajes: data},
		success: 	function(data){
			/*Si el servidor no nos devuelve nada se ejecuto la operacion correctamente*/
			if(data == "" || data == null){
				alert('Mensajes eliminados!');
				window.location = window.location;
			}else{
				console.log(data);
			}
		},
		error: 		function(jqXHR, textStatus, errorThrown){
			alert("Ha ocurrido un error y no se ha podido procesar la petición.\n"+ errorThrown);
			console.log(jqXHR.responseText);
		}
	});

}

function marcar_mensajes(){
	$("[name='mensajes_marcados']").prop('checked',!$("[name='mensajes_marcados']").prop('checked'));
}

function guardar_borrador(){

	if($("#mensaje").val() == ""){
		alert("Escribe un mensaje");
		return;
	}
	if($("#asunto").val() == ""){
		alert("Escribe un asunto");
		return;
	}
	var mensaje = {
		asunto: 	document.getElementById('asunto').value,
		mensaje: 	document.getElementById('mensaje').value
	};

	ajax_without_return(baseURL('correo/guardar_borrador'), mensaje, function(){
		alert("Mensaje guardado!");
		actualizar();
	});
}

function destruir_borradores(){

	mjs_marcados = $("input:checked");

	/*Nos salimos de la funcion si no esta ninguna checkbox marcada*/
	if(mjs_marcados.length ==  0){
		alert('No se han seleccionado mensajes');
		return;
	}

	if(!confirm("¿Esta seguro que desea eliminar los mensajes seleccionados?")){
		return;
	}

	data = Array();
	$(mjs_marcados).each(function(indice, elemento){
		data.push(elemento.value);
	});
	
	data_json = {mensajes: data};

	ajax_without_return(baseURL('correo/destruir_borradores'),data_json, function(){
		alert("Mensaje(s) eliminado(s)");
		actualizar();
	});
}

function actualizar(){
	window.location = window.location;
}

function ajax_without_return(target, _data, handler){

	if(target != undefined && target != null){
		_target = target;
	}

	$.ajax({
		url: 		_target,
		type: 		"post",
		data: 		_data,
		datatype: 	"text",
		success: 	function(data){
			if(data == "" || data == null){
				if(handler != undefined){
					handler();
				}
			}else{
				console.log(data);
			}
		},
		error: 		function(jqXHR, textStatus, errorThrown){
			alert("Ha ocurrido un error y no se ha podido procesar la petición.\n" + errorThrown);
			console.log(jqXHR.responseText);
		}
	});
}

function listar_usuarios(indice, contenedor){
	$(".users-list").empty();
	switch(indice){
		case "1":
			listar_egresados(contenedor);
			break;
		case "2":
			listar_empresas(contenedor);
			break;
		case "3":
			listar_publicadores(contenedor);
			break;
		case "4":
			listar_administradores(contenedor);
			break;
	}
}

function listar_egresados(contenedor){
	$(contenedor).load(baseURL('ajax/lista_egresados'),after_list);
}
function listar_empresas(contenedor){
	$(contenedor).load(baseURL('ajax/lista_empresas'),after_list);
}
function listar_publicadores(contenedor){
	$(contenedor).load(baseURL('ajax/lista_publicadores'),after_list);
}
function listar_administradores(contenedor){
	$(contenedor).load(baseURL('ajax/lista_administradores'),after_list);
}

/*Despues de listar a los usuarios*/
function after_list(){

	$("#destinatario").chosen({
			width: "570px",
			placeholder_text_multiple: "selecciona un usuario de la lista",
			max_selected_options: 2
		});
}
/*Leer mensajes individuales*/
function leer_mensaje_entrada(mensaje){

	$.post(baseURL('correo/leer_inbox'),
		{mensaje_id: mensaje},
		function(data){
			$("#contenido").html(data);
		},
		"html");
}
function leer_mensaje_salida(mensaje){

	$.post(baseURL('correo/leer_sent'),
		{mensaje_id: mensaje},
		function(data){
			$("#contenido").html(data);
		},
		"html");
}

