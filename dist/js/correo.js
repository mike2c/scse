var base_url = baseURL();
var mensaje_actual = null;
var usuario = null;
var bandeja = "inbox";
var buscar = null;
var lista = $("datalist").get(0);
var dir = baseURL("Ajax/lista_egresados");

$(document).ready(function(){

	$("#btnEliminar").click(function(){
		
		var checked_messages = $("input:checked");//Seleccinamos todos los input checkbox que esten marcados
		var data_msg = Array();

		if(checked_messages.length > 0){//Preguntamos si los mensajes marcados son mayor que 0

			$(checked_messages).each(function(indice,elemento){
				data_msg.push(elemento.value);
			});

			if(checked_messages[0].name == "mensajes_a_eliminar"){
				eliminarMensajes(data_msg);	
			}else{
			
				destruirBorradores(data_msg);
			}
		}else{
			alert("No se han seleccionado mensajes a eliminar");
		}
	});

	$("#btnEnviar").click(function(){
		enviarMensaje();
	});

	$("#btnBorrador").click(function(){
		
		guardarComoBorrador();
	});

	$("#btnCancelar").click(function(){
		cancelar();
	});
	
	$("#destinatario").change(function(){
		validarNombreUsuario($(this).val());
	});

	$("#destinatario").keyup(function(){
		validarNombreUsuario($(this).val());
	});

	//$("#busqueda").keydown(function(e){
	//	buscar();
	//});

	$("#formBusqueda").submit(function(e){
		e.preventDefault();
	});

	/*$(".left-menu li a").click(function(){
		$(".left-menu li a").removeClass("activo");
		$(this).addClass("activo");
	});*/

	$('#redactarMensaje').on('hidden.bs.modal', function (e) {
		limpiarCampos();

	})
	
	/*Cambiar entre listas*/
	
	$("#tipo_usuario").change(function(){
		
		if(this.selectedIndex == 0){
			dir = baseURL("Ajax/lista_egresados");
		}else if(this.selectedIndex == 1){
			dir = baseURL("Ajax/lista_empresas");
		}if(this.selectedIndex == 2){
			dir = baseURL("Ajax/lista_publicadores");
		}if(this.selectedIndex == 3){
			dir = baseURL("Ajax/lista_administradores");
		}

		listar_usuarios(dir);
	});

	$('.my_select_box').on('change', function(evt, params) {
		alert("") ;
	});

	getInbox();
	listar_usuarios(dir);
});
	
function listar_usuarios(dir){

	$.ajax({
    url: dir,
    type:"post",
    datatype: "html",
    success: function(data){
    	
    	$("#lista_usuarios").html(data);
     	$("#destinatario").chosen({
     		max_selected_options: 1,
     		no_results_text : "No se han encontrado resultados",
     		placeholder_text_multiple: "Digita el nombre de un usuario",
     		placeholder_text_single: "Digita el nombre de un usuario"
     	});
		$("#destinatario_chosen").css("width","400px");
    },
    async: false
  });
}

function validarNombreUsuario(strValue){
	if(lista != null){
		options = lista.options;
		for(var i = 0; i < options.length; i++){
        	if(options[i].value == strValue){
        		
        		usuario = options[i].getAttribute('data-id');
        		console.log(usuario);
        		return;
            }
    	}

    	usuario = null;
	}
}

function enviarMensaje(){

	if($("#asunto").val() == ""){
		alert("El campo asunto* es obligatorio");
	}else if($("#mensaje").val() == ""){
		alert("El campo mensaje* es obligatorio");
	}else{

		var curr = false;
		if($("#curr_adjuntado").prop("checked")){
			curr = true;
		}
		
		var json_data = {
			mensaje_id: mensaje_actual,
			usuario_id: $("#destinatario").val(),
			asunto: $("#asunto").val(),
			mensaje: $("#mensaje").val(),
			curr_adjuntado: curr
		};

		$.ajax({
			url: baseURL("Correo/EnviarMensaje"),
			type: "post",
			data: json_data,
			datatype: "text",
			success: function(data){
				if(data == ""){
					alert("Mensaje enviado");
					$("#redactarMensaje").modal("hide");
					actualizar();
					dir = baseURL("Ajax/lista_egresados");
					listar_usuarios(dir);
				}else{
					console.log(data);
				}
			},
			error: function(jqXHR, textStatus, errorThrown){
				alert("Ha ocurrido un error y no se ha podido procesar la petición.\n"+ errorThrown);
				console.log(jqXHR.responseText);
			},
			async: true
		});

	}
}

function guardarComoBorrador(){

	if($("#asunto").val() != "" && $("#mensaje").val() != ""){
		var json_data = {
			asunto: $("#asunto").val(),
			mensaje: $("#mensaje").val(),
			curr_adjuntado: $("#curr_adjuntado").prop("checked")
		};

		$.ajax({
			url: baseURL("Correo/GuardarBorrador"),
			type: "post",
			data: json_data,
			datatype: "text",
			success: function(data){
				if(data == ""){
					alert("Mensaje guardado");
					$("#redactarMensaje").modal("hide");
					actualizar();
					dir = baseURL("Ajax/lista_egresados");
					listar_usuarios(dir);
				}else{
					console.log(data);
				}
			},
			error: function(jqXHR, textStatus, errorThrown){
				alert("Ha ocurrido un error y no se ha podido procesar la petición.\n"+ errorThrown);
				console.log(jqXHR.responseText);
			},
			async: true
		});

	}else{
		alert("Asegurese de haber ingresado el campo y el asunto");
	}

}

function eliminarMensajes(data_msg){

	$.post(baseURL("Correo/EliminarMensajes"),
		{mensajes: data_msg},
		function(data,textStatus,jqXHR){
			if(data == ""){
				alert("Mensajes eliminados");
				//actualizar();
			}else{
				alert("Ha ocurrido un error y no se ha podido procesar la petición. \n"+ textStatus);
				console.log(jqXHR.responseText);
			}
		}
	);

}

function destruirBorradores(data_msg){
	
	$.post(baseURL("Correo/DestruirBorradores"),
		{mensajes: data_msg},
		function(data,textStatus,jqXHR){
			if(data == ""){
				alert("Mensajes eliminados");
				//actualizar();
			}else{
				alert("Ha ocurrido un error y no se ha podido procesar la petición. \n"+ textStatus);
				console.log(jqXHR.responseText);
			}
		}
	);
}

function leerInbox(mensaje){

	$.ajax({url: baseURL("Correo/LeerInbox"),
		data: {mensaje_id: mensaje},
		type: "post",
		datatype: "html",
		success: function(data){
			$("#bandeja").html(data);
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log(jqXHR.responseText);
			console.log(textStatus);
			console.log(errorThrown);

		},
		async: true});
}

function leerSent(mensaje){

	$.ajax({url: baseURL("Correo/LeerSent"),
		data: {mensaje_id: mensaje},
		type: "post",
		datatype: "html",
		success: function(data){
			$("#bandeja").html(data);
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log(jqXHR.responseText);
			console.log(textStatus);
			console.log(errorThrown);

		},
		async: true});
}

function cancelar(){
	if($("#mensaje").val() != ""){
		if(confirm("¿Esta seguro que desea cancelar el envio de este mensaje?")){
			$("#redactarMensaje").modal("hide");
		}
	}else{
		$("#redactarMensaje").modal("hide");
	}

}

function buscarEnInbox(){

	var json_data = {
		campo: $("#filtro").val(),
		busqueda: $("#busqueda").val()
	};

	$.ajax({
		url: baseURL("Correo/BuscarInbox"),
		data: json_data,
		type: "post",
		datatype: "html",
		success: function(data){
			if(data != ""){

				$("#bandeja").html(data);
			}
		},
		error: function(jqXHR){
			console.log(jqXHR.responseText);
		},
		async: true
	});
}

function buscarEnSent(){
	var json_data = {
		campo: $("#filtro").val(),
		busqueda: $("#busqueda").val()
	};

	$.ajax({
		url: baseURL("Correo/BuscarSent"),
		data: json_data,
		type: "post",
		datatype: "html",
		success: function(data){
			if(data != ""){

				$("#bandeja").html(data);
			}
		},
		error: function(jqXHR){
			console.log(jqXHR.responseText);
		},
		async: true
	});
}

function buscarEnDrafts(){
	
	var json_data = {
		campo: $("#filtro").val(),
		busqueda: $("#busqueda").val()
	};

	$.post(baseURL("Correo/BuscarDrafts"),json_data,function(data,textStatus,jqXHR){
		$("#area_mensajes").html(data);
	});
}

function cargarBorrador(id_mensaje){

	$.ajax({
		url: baseURL("Correo/CargarBorrador"),
		type: "get",
		data: {mensaje: id_mensaje},
		success: function(data){
			json_data = $.parseJSON(data);
				if(json_data != null && json_data != ""){

				$("#asunto").val(json_data.asunto);
				$("#mensaje").val(json_data.mensaje);
			
				if(json_data.curr_adjuntado == true){
					//console.log("entra");
					$("#curr_adjuntado").prop("checked",true);
				}
				mensaje_actual = json_data.mensaje_id;
				$("#redactarMensaje").modal("show");
			}
		},
		error: function(jqXHR){
			console.log(jqXHR.responseText);
		},
		async: false
	});

}

function getInbox(){

	actualizar = getInbox;
	buscar = buscarEnInbox;
	$("#area_mensajes").load(base_url+"Correo/Inbox");
}

function getSent(){
	actualizar = getSent;
	buscar = buscarEnSent;
	$("#area_mensajes").load(base_url+"Correo/Sent");
}

function getDrafts(){
	actualizar = getDrafts;
	buscar = buscarEnDrafts;
	$("#area_mensajes").load(base_url+"Correo/Drafts");
}

function limpiarCampos(){
	document.getElementById("formEnviarMensaje").reset();
	lista = $("datalist").get(0);
	$("#destinatario").attr("list","lista_egresados");
	usuario = null;
	mensaje_actual = null;
}