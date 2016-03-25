<div class="container">
	<div class="content">
	<section class="content-header">
			<h1>
	            Crear
	            <small>nueva encuesta</small>
	     	</h1>
	</section>
	<br>
	<script type="text/javascript"></script>
	<div class="col-md-3" on>
		<div class="box box-primary">
			<div class="box-header">
				<div class="box-title">Seleccione una carrera</div>
			</div>
			<div class="box-body">
				<table class="table table-responsive table-stripped table-condensed">
					<?php
						if(isset($carreras)){
							foreach ($carreras->result() as $row) {
								echo "<tr><td>
								<label class='text-primary'><input form='form_crear_encuesta' type='checkbox' name='carreras[]' value='$row->carrera_id'> $row->nombre_carrera</label>
								</td></tr>";
							}
						}
					?>
				</table>
			</div>
		</div>
	</div>
	<div class="col-md-9">
		
			<form id="form_crear_encuesta" name="form_crear_encuesta" class="encuesta" method="post" action="<?=base_url('encuesta/insertar')?>" onsubmit="return false;">
				
				 <!--Titulo y objetivo de la encuesta-->
				 <div class="box box-primary">
				 	<div class="box-header with-border">
						<h3 class="box-title">Nueva encuesta</h3>
					</div>
					<div class="box-body with-border">
						<div class="form-group">
							<label>Titulo de la encuesta</label>
							<input required autocomplete="off" class="form-control input-sm" type="text" name="titulo" id="titulo" placeholder="titulo de la encuesta">
						</div>
						<div class="form-group">
							<label>Descripción</label>
							<textarea  class="form-control input-sm" name="descripcion" id="descripcion" rows="4" placeholder="descripcion de la encuesta..."></textarea>
						</div>
						<div class="form-group">
							<label>Objetivo de la encuesta</label>
							<input required autocomplete="off"  class="form-control input-sm" type="text" name="objetivo" id="objetivo" placeholder="objetivo de la encuesta">
						</div>	
					 </div>
				</div>
				
				<!--Primer pregunta por default-->
				<div class="box box-primary pregunta">
					<div class="box-header">
						<div class="box-tools pull-right"></div>
					</div>
					<div class="box-body">
						<div class="input-group">
							<label>Pregunta</label>
								<input class="form-control input-sm" required type="text" data-id="0" name="pregunta[0]" placeholder="Escribe la pregunta...">
						    	<span class="input-group-btn">
									<select style="width:150px;min-width:150px;margin-top:25px;" class="form-control input-sm" name="tipo_pregunta[0]">
										<?php
											//Cargamos un select con las categorias
											foreach ($categorias as $key => $value) {
												echo "<option value='$value[categoria_id]'>$value[categoria]</option>";
											}
										?>
									</select>
						    	</span>
							</div><!-- /input-group -->
					
						<div class="form-group">
							<label>Texto de ayuda</label>
							<input class="form-control input-sm" type="text" name="texto_ayuda[0]" placeholder="texto de ayuda (opcional)">
						</div>
						<!--##############-->
						<div class="form-group answer-options">
							<label>Respuesta</label>
							<textarea disabled class="form-control" ></textarea>
						</div>
						<br>
					</div>
				</div>
				
			</form>
			<div id="response"></div><!-- div para cargar los mensajes-->
			<!--Botones-->
			<a href="<?=base_url('encuesta/listar_encuestas')?>" style="margin-left:10px;" class="btn btn-danger pull-right">Cancelar</a>
			<input onclick="validar_formulario();" type="submit" class="btn btn-success pull-right" value="Publicar encuesta">
			<button type="button" class="btn btn-primary add-question">Agregar pregunta</button>
			
		</div>
	</div>
</div>
<link rel="stylesheet" href="<?=base_url('plugins/encuestas/encuesta.css')?>">
<script src="<?=base_url('plugins/encuestas/encuesta.js')?>"></script>
<script type="text/javascript">
	

	var opciones = {
		_categorias: <?=json_encode($categorias)?>,
		_contenedor: $(".encuesta")
	};

	function validar_formulario(){

		$.post(baseURL('encuesta/insertar'),$(form_crear_encuesta).serialize(),function(response){
			if(response == ""){
				form_crear_encuesta.submit();
			}else{
				$("#response").empty();
				$("#response").append(crear_mensaje(response));
			}
		});
		//form_crear_encuesta.submit();
	}

	function crear_mensaje(html){

		var mensaje = $("<div>",{
			"class": "alert alert-danger alert-dismissable"
		}).append('<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>');
		
		$(mensaje).append("<h4><i class='icon fa fa-ban'></i>Mensaje</h4>");
		$(mensaje).append(html);
		return mensaje;
	}

	//inicializar el plugin de encuesta
	$.encuesta(opciones);

</script>