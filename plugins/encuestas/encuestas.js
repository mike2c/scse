(function($){

	$.extend({
		agregar_pregunta: _agregar_pregunta,
		eliminar_pregunta: _eliminar_elemento,
		agregar_cambiador: _agregar_cambiador,
		encuesta: _encuesta
	});

	var options = {
		opcion1: "valor1",
		opcion2: "valor2",
		opcion3: "valor3"
	};
	var categorias = {};
	function _encuesta(_categorias, _options){

		if(_options != undefined){
			//configurar
		}

		if(_categorias == undefined){
			console.log("Necesitan especificarse las categorias");
		}else{
			categorias = _categorias;
		}

		//programar boton para eliminar preguntas
		var botones = $("button[data-widget='remove-question']");
		
		_agregar_boton_eliminar_pregunta(botones);
		_agregar_boton_agregar_pregunta();
	}

	function _agregar_boton_eliminar_pregunta(elements){

		if(elements instanceof Array){
			$(elements).each(function(indice, element){
				$(elements).click(function(){
					_eliminar_pregunta($(element).parent().parent().parent());
				});
			});
		}else{
			$(elements).click(function(){
				_eliminar_pregunta($(elements).parent().parent().parent());
			});
		}
	}

	function _agregar_boton_agregar_pregunta(boton){

	}

	function _eliminar_pregunta(elemento){
		if(confirm("¿Esta seguro que desea eliminar esta pregunta?")){
			_eliminar_elemento(elemento);
		}
	}

	var contador = 1;
	function _agregar_pregunta(parent, categorias){
		
		var textbox_pregunta = $("<input name='pregunta[" + contador + "]' type='text' placeholder='Escribe una pregunta'> ");
		var textbox_ayuda = $("<input autocomplete='off' name='texto_ayuda[]' type='text' placeholder='texto de ayuda (opcional)'>");
		var contenedor = $("<div class='pregunta'></div>");
		var opciones = $("<div class='opciones'></div>");
		var select = $(" <select name='select_tipo_pregunta[]'></select>");
		var ancla_cerrar = $("<a href='#'>cerrar</a>");
		
		$(ancla_cerrar).click(function(){
			_eliminar_elemento($(this).parent());
		});
		for(i = 0; i < categorias.length; i++){
			var option = $("<option value='"+categorias[i].categoria_id+"'>"+categorias[i].categoria+"</option>");
			$(select).append(option);
		}

		_agregar_cambiador(select);

		$(contenedor).append(textbox_pregunta);
		$(contenedor).append(select);
		$(contenedor).append(textbox_ayuda);
		$(contenedor).append(opciones);
		$(contenedor).append(ancla_cerrar);
		$(parent).append(contenedor);

		contador = contador + 1;//incrementamos 1 al contador si se ha agregado una nueva pregunta
	}

	/**Evalua el valor del select para cambiar el tipo de pregunta
	  */
	function _cambiar_tipo_pregunta(element, parent){
				
		if(parent != undefined){
			
			var contenedor = $(parent).find(".opciones");
			
			if(contenedor != null && contenedor != undefined){
				
				var valor = $(element).val();
				switch(valor){

					case "1":
						_agregar_pregunta_abierta(contenedor, valor);
					break;
					case "2":
						_agregar_pregunta_cerrada(contenedor, valor);
					break;
					case "3":
						_agregar_pregunta_seleccion_unica(contenedor, valor);
					break;
					case "4":
						_agregar_pregunta_seleccion_multiple(contenedor, valor);
					break;
				}
			}
		}
	}

	/**Modifica un select o una lista desplegable para que se pueda cambiar el 
	  *tipo de pregunta
	  */
	function _agregar_cambiador(select){
		
		$(select).change(function(){
			_cambiar_tipo_pregunta(this, $(this).parent());
		});
	}

	/**Agrega un campo solo para editar la pregunta
	  */
	function _agregar_pregunta_abierta(contenedor,id_tipo_pregunta){

		if(id_tipo_pregunta == undefined || id_tipo_pregunta == null){
			id_tipo_pregunta = 1;
		}

		$(contenedor).empty();
		var campo_invisible = $("<input type='hidden' name='tipo_pregunta[]' value='"+id_tipo_pregunta+">");
		$(contenedor).append(campo_invisible);
	}

	/**Agregar un campo de pregunta solo con 2 opciones
	  *si y no
	  */
	function _agregar_pregunta_cerrada(contenedor, id_tipo_pregunta){
		
		if(id_tipo_pregunta == undefined || id_tipo_pregunta == null){
			id_tipo_pregunta = 2;
		}

		$(contenedor).empty();
		var campo_invisible = $("<input type='hidden' name='tipo_pregunta[]' value='"+id_tipo_pregunta+">");

		var lista_opciones = "<ul></ul>";
		var opcion_verdadera = $("<li><label>Si<label></li>");
		var opcion_falsa = $("<li><label>No</label></li>");
		$(contenedor).append(opcion_verdadera);
		$(contenedor).append(opcion_falsa);
	}

	/**Agrega un campo de pregunta con radio buttons
	  */
	function _agregar_pregunta_seleccion_unica(contenedor, id_tipo_pregunta){
		if(id_tipo_pregunta == undefined || id_tipo_pregunta == null){
			id_tipo_pregunta = 3;
		}

		$(contenedor).empty();
		var campo_invisible = $("<input type='hidden' name='tipo_pregunta[]' value='"+id_tipo_pregunta+">");
		var textbox_opcion = $("<input autocomplete='off' class='textbox-agregar-opcion' type='text' placeholder='Escribe una opcion'>");
		var lista_opciones = $("<ul class='seleccion-unica'></ul>");
		
		$(contenedor).append(campo_invisible);// ¿En serio tambien tengo que comentar esto? :V que hueva
		$(contenedor).append(lista_opciones);// Agregar una lista desordenada vacia
		$(contenedor).append(textbox_opcion);// agrega el campo input de tipo texto para agregar las opciones
				
		$(textbox_opcion).keypress(function(e){
			tecla = (document.all) ? e.keyCode : e.which;
			if (tecla==13){
				$(lista_opciones).append(_crear_opcion(this.value));
				this.value = "";
				this.focus();
			}
			
		});
	}

	/**Agrega un campo de pregunta con checkboxs
	  */
	function _agregar_pregunta_seleccion_multiple(contenedor, id_tipo_pregunta){
		if(id_tipo_pregunta == undefined || id_tipo_pregunta == null){
			id_tipo_pregunta = 4;
		}

		$(contenedor).empty();
		var campo_invisible = $("<input type='hidden' name='tipo_pregunta[]' value='"+id_tipo_pregunta+">");
		var textbox_opcion = $("<input autocomplete='off' class='textbox-agregar-opcion' type='text' placeholder='Escribe una opcion'>");
		var lista_opciones = $("<ul class='seleccion-multiple'></ul>");
		
		$(contenedor).append(campo_invisible);// ¿En serio tambien tengo que comentar esto? :V que hueva
		$(contenedor).append(lista_opciones);// Agregar una lista desordenada vacia
		$(contenedor).append(textbox_opcion);// agrega el campo input de tipo texto para agregar las opciones
				
		$(textbox_opcion).keypress(function(e){
			tecla = (document.all) ? e.keyCode : e.which;
			if (tecla==13){
				$(lista_opciones).append(_crear_opcion(this.value));
				this.value = "";
				this.focus();
			}
			
		});
	}

	function _crear_opcion(texto){
		if(texto == ""){
			return;
		}
		var opcion = $("<li></li>");
		var label = $("<label>"+texto+"</label>");
		var close_button = $("<button type='button'> X </button>");
		var hidden_value = $("<input type='hidden' name='opciones["+contador+"][]' value='"+texto+"'>");

		$(close_button).click(function(){
			_eliminar_elemento($(this).parent());
		});

		$(opcion).append(label);
		$(opcion).append(close_button);
		$(opcion).append(hidden_value);
		return opcion;
	}

	function _eliminar_elemento(elemento){
		return $(elemento).remove();
	}

})(jQuery);