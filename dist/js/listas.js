function listar_departamentos(dep_actual,form,classes){
	
	if(dep_actual == undefined){
		dep_actual = "";
	}
	
	$.ajax({url: baseURL("Ajax/CargarDepartamentos/"+dep_actual),
	type: "post",
	dataType: "html",
	success: function(data){
		//Comprobamos si el elemento existe
		if($("#departamento_area").length){

			$("#departamento_area").html(data);

			if(form != undefined && form != null){
				$("#departamento").attr("form",form);
			}
			if(classes != undefined && classes != null){
				$("#departamento").addClass(classes);
			}

			$("#departamento").change(function(){
				listar_municipios($("#departamento").val(),null,$("#departamento").attr("form"),$("#departamento").attr("class"));
			});
		}
	},
	error: function(jqXHR,textStatus,errorThrown){
		console.log(jqXHR.responseText);
		alert("Ha ocurrido un error y no se ha podido procesar la petición \n"+textStatus);
	},
	async: false});

}

function listar_municipios(departamento,mun_actual,form,classes){
	
	//Salimos de la funcion si no se proporciona la variable departamento
	if(departamento == undefined){
		return;
	}

	if(mun_actual == undefined){
		mun_actual == "";
	}
	
	$.ajax({url: baseURL("Ajax/CargarMunicipios/"+departamento+"/"+mun_actual),
	type: "post",
	dataType: "html",
	success: function(data){
		if($("#municipio_area").length){
			
			$("#municipio_area").html(data);

			if(form != undefined && form != null){
				$("#municipio").attr("form",form);
			}
			if(classes != undefined && classes != null){
				$("#municipio").addClass(classes);
			}
		}
	},
	error: function(jqXHR,textStatus,errorThrown){
		console.log(jqXHR.responseText);
		alert("Ha ocurrido un error y no se ha podido procesar la petición \n"+textStatus);
	},
	async: false}); 

}

function listar_carreras(carr_actual,form,classes){

	if(carr_actual == undefined){
		carr_actual = "";
	}

	$.ajax({
		url: baseURL("Ajax/CargarCarreras/"+carr_actual),
		type: "post",
		datatype: "html",
		success: function(data){

			if($("#carrera_area").length){

				$("#carrera_area").html(data);

				if(form != undefined && form != null){
					$("#carrera").attr("form",form);
				}
				if(classes != undefined && classes != null){
					$("#carrera").addClass(classes);
				}
			}
		},
		error: function(jqXHR,textStatus,errorThrown){
			console.log(jqXHR.responseText);
			alert("Ha ocurrido un error y no se ha podido procesar la petición \n"+textStatus);
		},
		async: false
	});

}

function listar_sociedades(soc_actual,form,classes){

	if(soc_actual == undefined){
		soc_actual = "";
	}

	$.ajax({
		url: baseURL("Ajax/CargarSociedades/"+soc_actual),
		type: "post",
		datatype: "html",
		success: function(data){

			if($("#sociedad_area").length){

				$("#sociedad_area").html(data);

				if(form != undefined && form != null){
					$("#sociedad").attr("form",form);
				}
				if(classes != undefined && classes != null){
					$("#sociedad").addClass(classes);
				}
			}
		},
		error: function(jqXHR,textStatus,errorThrown){
			console.log(jqXHR.responseText);
			alert("Ha ocurrido un error y no se ha podido procesar la petición \n"+textStatus);
		},
		async: false
	});

}

function registrar_sociedad(){

	var soc = prompt("Digita el tipo de organización");
	if(soc == null || soc == ""){
		return;
	}
	$.post(baseURL("Ajax/RegistrarSociedad"),{sociedad:soc},
		function(data){
			if(data == ""){
				alert("Sociedad registrada");
				listar_sociedades($("#sociedad").val(),$("#sociedad").attr("form"),$("#sociedad").attr("class"));
			}else{
				console.log(data);
			}
	});
}

function listar_areas(area_actual,form,classes){

	if(area_actual == undefined){
		area_actual = "";
	}

	$.ajax({
		url: baseURL("Ajax/CargarAreas/" + area_actual),
		type: "post",
		datatype: "html",
		success: function(data){

			if($("#area_area").length){
				$("#area_area").html(data);
			}

			if(form != undefined && form != null){
				$("#area").attr("form",form);
			}
			if(classes != undefined && classes != null){
				$("#area").addClass(classes);
			}else{
				return;
			}
		
			$("#area").change(function(){
		      listar_cargos($("#area").val(),null,$("#area").attr("form"),$("#area").attr("class"));
		    });
		},
		error: function(jqXHR,textStatus,errorThrown){
			console.log(jqXHR.responseText);
			alert("Ha ocurrido un error y no se ha podido procesar la petición \n"+textStatus);
		},
		async: false});
}

function listar_cargos(area,cargo_actual,form,classes){

	if(area == undefined || area == null || area == ""){
		return;
	}

	if(cargo_actual == undefined || cargo_actual == null){
		cargo_actual = "";	
	}

	$.ajax({url: baseURL("Ajax/CargarCargos/"+area+"/"+cargo_actual),
		type: "get",
		datatype: "html",
		success: function(data){
			
			if($("#cargo_area").length){
				$("#cargo_area").html(data);
			}else{
				return;
			}

			if(form != undefined && form != null){
				$("#cargo").attr("form",form);
			}
			if(classes != undefined && classes != null){
				$("#cargo").addClass(classes);
			}
		},
		error: function(jqXHR,textStatus,errorThrown){
			console.log(jqXHR.responseText);
			alert("Ha ocurrido un error y no se ha podido procesar la petición \n"+textStatus);
		},
		async: false
	});
}

function registrar_area(){

	if($("#area").length){
		var a = prompt("Escribe el nombre de la area");
		if(a == null || a == ""){
			return;
		}
		$.post(baseURL("Ajax/RegistrarArea"),{area:a},
		function(data){
			if(data == ""){
				alert("Area registrada");
				listar_areas($("#area").val(),$("#area").attr("form"),$("#area").attr("class"));


			}else{
				console.log(data);
			}
		});
	}
}

function registrar_cargo(){

	if($("#area").length){
		var c = prompt("Escribe el nombre del cargo");
		if(c == null || c == ""){
			return;
		}
		$.post(baseURL("Ajax/RegistrarCargo"),{area:$("#area").val(),cargo:c},
		function(data){
			if(data == ""){
				alert("Cargo registrado");
				listar_cargos($("#area").val(),$("#cargo").val(),$("#area").attr("form"),$("#area").attr("class"));
			}else{
				console.log(data);
			}
		});
	}
}

function listar_fichas(){
	$("#contenido").load(baseURL('ficha/listar'));
}
function listar_cursos(){
	$("#contenido").load(baseURL('curso/listar'));
}
function listar_becas(){
	$("#contenido").load(baseURL('becas/listar'));
}
function esta(element_id){
if(document.getElementById(element_id) != null){
	return true;
}

return false;
}
/*
*/