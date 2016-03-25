<div class="container">
	
	<div class="content">
		<div class="box box-primary">
			<div class="box-header with-border">
				<div class="box-title"><?=$encuesta->titulo?></div>
			</div>
			<div class="box-body">
				<h4>Objetivo de la encuesta: <small class="text-primary"><?=$encuesta->objetivo?></small></h4>
				<p><?=$encuesta->descripcion?></p>
				<br>
				<form action="<?=base_url('responder_encuesta/guardar_respuestas/'. $id_encuesta)?>" method="post">
					<?php
						foreach ($preguntas->result() as $row) {
							?>
							<h4><?=$row->pregunta?></h4>
							<input type="hidden" name="tipo_pregunta[<?=$row->pregunta_id?>]" value="<?=$row->categoria_id?>">
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
										<label class="label" class=""><input  type="radio" name='radio[<?=$row->pregunta_id?>]' value="si"> Si</label><br>
										<label class="label" class=""><input  type="radio" name='radio[<?=$row->pregunta_id?>]' value="no"> No</label>
									<?
									break;
								case '3':/**Crear una pregunta seleccion unica*/
									foreach ($respuesta_sugerida[$row->pregunta_id]->result() as $row) {
										?>
											<label class="label" class=""><input  type="radio" name='radio[<?=$row->pregunta_id?>][]' value="<?=$row->respuesta_sugerida_id?>"> <?=$row->opcion?></label><br>
										<?
									}
									break;
								case '4':/**Crear una pregunta seleccion multiple*/
									foreach ($respuesta_sugerida[$row->pregunta_id]->result() as $row) {
										?>
											<label class="label" class=""><input  type="checkbox" name='checkbox[<?=$row->pregunta_id?>][]' value="<?=$row->respuesta_sugerida_id?>"> <?=$row->opcion?></label><br>
										<?
									}
									break;
							}
							echo "<hr>";
						}
					?>
					<input class="btn btn-primary" type="submit" value="Enviar respuestas">
				</form>
			</div>
		</div>	
	</div>
</div><style>
	h4{
		margin-bottom: 0px;
	}
	table tr td{
		padding-left: 10px;
	}
	
	.label{
		color: black;
		margin-left: 10px;
		font-size: 14px;
	}
	.label input[type="radio"]{
		
	
	}
</style>