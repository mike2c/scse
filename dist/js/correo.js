function eliminar_mensajes(){

	mjs_marcados = $("input:checked");

	/*Nos salimos de la funcion si no esta ninguna checkbox marcada*/
	if(mjs_marcados.length ==  0){
		alert('No se han seleccionado mensajes');
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

function destruir_borradores(){
	
		mjs_marcados = $("input:checked");

	/*Nos salimos de la funcion si no esta ninguna checkbox marcada*/
	if(mjs_marcados.length ==  0){
		alert('No se han seleccionado mensajes');
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