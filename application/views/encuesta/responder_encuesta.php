<div class="container">
	
	<div class="content">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h4 style="padding-left: 30px;">Nombre completo: <?=$nombre?></h4>
			</div>
			<div class="box-body">
				<p class="descripcion">
					<?=$encuesta->descripcion?>
				</p>
				<p class="objetivo"><?=$encuesta->objetivo?></p>
				<hr>
				<form id="formGuardarRespuestas" action="<?=base_url('responder_encuesta/guardar_respuestas/'. $id_encuesta)?>" method="post">
					<?php
						foreach ($preguntas->result() as $row) {
							?>
							<label><?=$row->pregunta?></label>
							<input type="hidden" name="tipo_pregunta[<?=$row->pregunta_id?>]" value="<?=$row->categoria_id?>">
							<input type="hidden" name="preguntas[<?=$row->pregunta_id?>]" value="<?=$row->pregunta?>">
							<p class="help-block"><?=$row->texto_ayuda?></p>
							<?
							switch ($row->categoria_id) {
								case '1':/**Crear una pregunta abierta*/
									?>
									<textarea placeholder="escriba su respuesta aqui..." class="form-control" name="respuesta[<?=$row->pregunta_id?>]" id="" rows="3"></textarea>
									<?
									break;
								case '2':/**Crear una pregunta cerrada*/
									?>
										<label class="opcion"><input type="radio" name='radio[<?=$row->pregunta_id?>]' value="si"> Si</label>
										<label class="opcion"><input type="radio" name='radio[<?=$row->pregunta_id?>]' value="no"> No</label>
									<?
									break;
								case '3':/**Crear una pregunta seleccion unica*/
									foreach ($respuesta_sugerida[$row->pregunta_id]->result() as $row) {
										?>
											<label class="opcion"><input type="radio" name='radio[<?=$row->pregunta_id?>][]' value="<?=$row->respuesta_sugerida_id?>"> <?=$row->opcion?></label>
										<?
									}
									break;
								case '4':/**Crear una pregunta seleccion multiple*/
									foreach ($respuesta_sugerida[$row->pregunta_id]->result() as $row) {
										?>
											<label class="opcion"><input type="checkbox" name='checkbox[<?=$row->pregunta_id?>][]' value="<?=$row->respuesta_sugerida_id?>"> <?=$row->opcion?></label>
										<?
									}
									break;
							}
							echo "<hr>";
						}
					?>
					<div id="mensaje" class="callout callout-danger oculto">
                    	<h4>ERROR:</h4>
                    	<p>Debes marcar al menos una opción</p>
                  	</div>
					<input class="btn btn-primary" type="submit" value="Enviar respuestas">
				</form>
			</div>
		</div>	
	</div>
</div>
<script type="text/javascript">
	$("#formGuardarRespuestas").submit(function(e){
		e.preventDefault();
		$.post(baseURL('responder_encuesta/guardar_respuestas/'+ <?=$encuesta->encuesta_id?>),$(this).serialize(),function(data){
				if(data != ""){
					$("#mensaje").empty();
					$("#mensaje").show("slow");
					$("#mensaje").append(data);
				}else{
					formGuardarRespuestas.submit();
				}
		});
	});
</script>
<style>
	.oculto{
		display: none;
	}
	.descripcion, .objetivo{
		
		margin-left: 30px;
		font-size: 18px;
		font-family: "Arial";
	}
	.objetivo{
		font-size: 16px;
		color: #3c8dbc;
	}

	label{
		display: block;
		padding-left: 30px;
		font-size: 16px;
	}
	p.help-block{
		padding-left: 30px;
	}
	textarea.form-control{
		display: block;
		margin-left: 45px;
		width: 92%;
	}

	label.opcion>input{
		margin-left: 15px;
	}
	label.opcion{
		font-size: 14px;
		cursor: pointer;
	}
</style>