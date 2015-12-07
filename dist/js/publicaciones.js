function editar_ficha_ocupacional(ficha){
	$("#contenido").load(baseURL('ficha/editar/'+ ficha));
}

function crear_ficha_ocupacional(){
	$("#contenido").load(baseURL('ficha/crear'));
}

function editar_curso(curso){
	$("#contenido").load(baseURL('curso/editar/'+ curso));
}

function crear_curso(){
	$("#contenido").load(baseURL('curso/crear'));
}

function editar_beca(beca){
	$("#contenido").load(baseURL('beca/editar/'+ beca));
}

function crear_beca(){
	$("#contenido").load(baseURL('beca/crear'));
}

function eliminar_beca(id){
	if(!confirm("¿Esta seguro que desea eliminar esta beca?")){
		return;
	}
	
	$.post(baseURL('beca/eliminar'),
		{publicacion: id},
		function(data){
			if(data == ""){
				alert('Beca eliminada');
				window.location = window.location;
			}else{
				console.log(data);
			}
		},
		"html");
}

function eliminar_curso(id){
	if(!confirm("¿Esta seguro que desea eliminar este curso?")){
		return;
	}
	
	$.post(baseURL('curso/eliminar'),
		{publicacion: id},
		function(data){
			if(data == ""){
				alert('Curso eliminado');
				window.location = window.location;
			}else{
				console.log(data);
			}
		},
		"html");
}

function eliminar_ficha(id){
	if(!confirm("¿Esta seguro que desea eliminar esta ficha ocupacional?")){
		return;
	}
	
	$.post(baseURL('ficha/eliminar'),
		{publicacion: id},
		function(data){
			if(data == ""){
				alert('Ficha eliminada');
				window.location = window.location;
			}else{
				console.log(data);
			}
		},
		"html");
}

function actualizar_visibilidad(data){

	$.post(baseURL('ficha/actualizar_visiblidad'),
		data,
		function(data){
			if(data != ""){
				alert("Ha ocurrido un error y no se ha podido procesar la petición \n"+data);
			}
		});
}