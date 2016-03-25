(function($){

	$.extend({
		eliminar_pregunta: _eliminar_pregunta,
		encuesta: _encuesta
	});

	var categorias = null;
	var contenedor = null;
	var registro = null;

	function _encuesta(_opciones){

		if(_opciones._categorias != undefined && _opciones._categorias != null){
			categorias = _opciones._categorias;
		}
		if(_opciones._contenedor != undefined && _opciones._contenedor != null){
			contenedor = _opciones._contenedor;
		}

		_inicializar_plugin();
	}

	function _inicializar_plugin(){
		
		$(".add-question").click(function(){
			$(contenedor).append(_crear_pregunta);
		});

		$(".remove-question").click(function(){
			$(this).parent().remove();
		});

		$("select[name='tipo_pregunta[0]']").each(function(indice, elemento){
			_agregar_lista(this);
		});
	}

	function _agregar_lista(select){

		$(select).change(function(){
			
			var temp_cont = $(select).parent().parent().parent().find(".answer-options");
			$(temp_cont).empty();

			switch(this.value){

				case "1":
					$(temp_cont).append(_crear_pregunta_abierta());
				break;
				case "2":
					$(temp_cont).append(_crear_pregunta_cerrada());
				break;
				case "3":
					$(temp_cont).append(_crear_pregunta_seleccion());
				break;
				case "4":
					$(temp_cont).append(_crear_pregunta_seleccion(true));
				break;
			}
		});
	}

	function _crear_pregunta_abierta(){

		var div = $("<div></div>");
		var label = $("<label>Respuesta</label>");
		var textarea = $("<textarea disabled class='form-control'></textarea>");

		$(div).append(label);
		$(div).append(textarea);
		return div;
	}
	function _crear_pregunta_cerrada(){

		var div = $("<div></div>");
		var label = $("<label>Respuesta</label>");
		var list = $("<ul class='close-question'></ul>");

		$(list).append("<li value='true'>Si</li>");
		$(list).append("<li value='false'>No</li>");

		$(div).append(label);
		$(div).append(list);
		return div;
	}

	function _crear_pregunta_seleccion(multiple){

		var input_opciones = $("<input type='text' class='form-control input-add-options' placeholder='Escriba una opcion'>");
		if(multiple != undefined && multiple == true){
			var lista = $("<ul class='multiple-selection'></ul>");
		}else{
			var lista = $("<ul class='single-selection'></ul>");
		}
		
		var div = $("<div></div>").append("<label>Respuesta</label>");

		$(div).append(lista);
		$(div).append(input_opciones);
		
		$(input_opciones).keypress(function(e){
			tecla = (document.all) ? e.keyCode : e.which;
			if (tecla==13){

				var id = $(input_opciones).parent().parent().parent().find("input[data-id]").data("id");
				
				$(lista).append(crear_opcion($(input_opciones).val(), id));
				$(input_opciones).val("");
			}
		});

		return div;
	}

	function crear_opcion(texto, id_pregunta){
		if(id_pregunta == null){
			return;
		}
		if(texto == undefined || texto == null || texto == ""){
			return;
		}

		var li = $("<li>"+ texto + "</li>");
		var value = $("<input type='hidden' name='opciones[" + id_pregunta + "][]' value='" + texto + "'>");
		var button = $("<button type='button' class='btn btn-box-tool pull-right'></button>").append('<i class="fa fa-times"></i>');

		$(button).click(function(){
			$(this).parent().remove();
		});

		$(li).append(value);
		$(li).append(button);

		return li;
	}

	function _remover_opcion(opcion){

		if(opcion == undefined || opcion == null){
			return;
		}

		$(opcion).remove();
	}

	function _crear_pregunta(){
		contador++;
		var box = crear_box();
		var box_control = crear_box_control();
		var box_body = crear_box_body();
		
		$(box).append(box_control);
		$(box).append(box_body);

		var select = $("<select name='tipo_pregunta[" + contador + "]' class='form-control input-sm' style='margin-top:25px;width:150px;'></select>");
		for(i = 0; i < categorias.length;i++){
			$(select).append($("<option value='" + categorias[i].categoria_id + "'>" + categorias[i].categoria + "</option>"));
		}

		var input_group = crear_input_group();
		
		_agregar_lista(select);
		$(input_group).append(crear_input_group_btn(select));
		$(box_body).append(input_group);
		$(box_body).append(crear_texto_ayuda);
		$(box_body).append(crear_campo_respuesta);

		return box;
	}

	function crear_texto_ayuda(){

		var group = crear_form_group();
		$(group).append("<label>Texto de ayuda</label>");
		$(group).append("<input class='form-control input-sm' type='text' name='texto_ayuda[" + contador + "]' placeholder='texto de ayuda (opcional)'>");
		
		return group;
	}

	function crear_campo_respuesta(){
		
		var group = crear_form_group();
		$(group).addClass("answer-options");
		$(group).append("<label>Respuesta</label>");
		$(group).append("<textarea class='form-control' disabled></textarea>");

		return group;
	}

	var contador = 0;
	function crear_input_group(){

		var input_group = $("<div class='input-group'></div>").append("<label>Pregunta</label>");
		$(input_group).append($("<input required type='text' data-id='" + contador + "' name='pregunta[" + contador + "]' class='form-control input-sm' placeholder='Escribe la pregunta...'>"));
		
		return input_group;
	}

	function crear_input_group_btn(select){
		
		if(select == undefined){
			return;
		}

		var input_group_btn = $("<span class='input-group-btn'></span>");
		$(input_group_btn).append(select);

		return input_group_btn;
	}

	function crear_box(){
		return $("<div class='box box-primary pregunta'></box>");
	}

	function crear_box_body(){
		return $("<div class='box-body'></box>");
	}

	/*Crea la cabecera de la caja*/
	function crear_box_control(){
		var box_control = $("<div class='box-tools pull-right'></div>");
		var close_button = $('<button type="button" class="btn btn-box-tool" data-widget="remove-question" data-toggle="tooltip" title="eliminar pregunta" data-original-title="eliminar pregunta"></button>');
		$(close_button).click(function(){
			$(close_button).parent().parent().parent().remove();
		});

		$(close_button).append('<i class="fa fa-times"></i>');
		
		$(box_control).append(close_button);
		return $("<div clasS='box-header'></div>").append(box_control);
	}

	function crear_form_group(){

		return $("<div class='form-group'></div>");
	}

	function _eliminar_pregunta(){

	}

	function _eliminar_opcion(){

	}

})(jQuery);