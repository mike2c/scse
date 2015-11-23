function validarForm(form,responseArea){

	if(form == undefined || form == null){
		return;
	}
	if(responseArea == undefined || responseArea == null){
		return;
	}

	$.ajax({
		url: form.action,
		data: $(form).serialize(),
		type: "post",
		datatype: "html",
		success: function(data){
			if(data == ""){
				form.submit();
			}else{
				$(responseArea).show("slow");
				$(responseArea).html(data);
				$(responseArea).trigger("scrollIntoView");
			}
		},
		error: function(jqXHR,textStatus,errorThrown){
			console.log(jqXHR.responseText);
			alert("Ha ocurrido un error y no se ha podido procesar la petición");
		},
		async: true
	});
}