
var base_url = "";
if(document.getElementById("base_url") != null){
	base_url = document.getElementById("base_url").value;
}else{
	console.log("El url base no se ha cargado");
}

function registrarTitulo(nombre_titulo){
	$.ajax({
		url: base_url+"Ajax/RegistrarTitulo", 
		type: "post",
		data: {titulo: nombre_titulo},
		datatype: "text",
		success: function(data){
			if(data == ""){
				alert("Registrado");
			}
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log(jqXHR.responseText);
			alert("Se ha producido un error y no se ha podido procesar la solicitud. \n"+errorThrown);
		},
		async: false
	});
}