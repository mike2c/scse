$(document).ready(function(){

	$("#formCambiarClave").submit(function(e){
		e.preventDefault();
		cambiarClave(this);
	});

	$("#formDesactivarCuenta").submit(function(e){
		e.preventDefault();
		if(confirm("¿Esta seguro que desea desactivar su cuenta?")){
			this.submit();
		}
	});
	
});

//Informacion adicional
function cambiarClave(form){
	if(form.clave_actual.value !="" && form.clave_nueva.value != "" && form.clave_repetida.value != ""){
		if(confirm("¿Esta seguro que desea cambiar su contraseña?")){
		   	$.ajax({url:form.action,
			data: $(form).serialize(),
			type: "post",
			datatype: "html",
			success:function(data){
				$("#cambiarClaveRespuesta").show("slow");
				$("#cambiarClaveRespuesta").html(data);
			},
			aync: false
			});
		}

	}else{
		alert("Hay campos incompletos");
	}
}