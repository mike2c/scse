<div class="container">
	<div class="content">
	<div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header">
				<h4 class="centrar-texto">La siguiente encuesta fue aplicada  a los egresados de las carreras de 
				<?
					foreach ($carreras->result() as $row) {
						echo $row->nombre_carrera. ",";
					}
				?> dando como resultado los siguientes datos.</h4>
				<p class="help-block centrar-texto">El resultado se calculó tomando como base a la cantidad de egresados encuestados y no a encuestar.</p>
			</div>
			<div class="box-body">
				
				
				<br>
				<table class="tabla-encabezado">
					<tr>
						<td>
							<label>Titulo de la encuesta:</label>
						</td>
						<td><?=$encuesta->titulo?></td>
					</tr>
					<tr>
						<td>
							<label>Objetivo:</label>
						</td>
						<td>
							<?=$encuesta->objetivo?>
						</td>
					</tr>
					<tr>
						<td>
							<label>Descripción:</label>
						</td>
						<td>
							<?=$encuesta->descripcion?>
						</td>
					</tr>
				</table>
				
				<br>
				<?php
					$cont = 1;
					foreach ($preguntas->result() as $row) {
						if($row->categoria_id == '2'){

							?>
								<label class="pregunta"><?="#".$cont . " - ". $row->pregunta?></label>
								<table class="tabla">
									<th>
										<tr>
											<td>Respuesta</td>
											<td># de personas que seleccionarón esta respuesta</td>
											<td>% de personas que seleccionarón esta respuesta</td>
										</tr>
									</th>
									<tr>
										<td>Si</td>
										<td class="text-center">
											<?php
												if($respuestas_cerradas[$row->pregunta_id]["si"] == 0){
													echo "ninguna";
												}else{
													echo $respuestas_cerradas[$row->pregunta_id]["si"];
												}
											?>
										</td>
										<td class="text-center">
										<?php
											if($total_egresados == 0){
												echo "0";
											}else{
											 echo ($respuestas_cerradas[$row->pregunta_id]["si"]/$total_egresados) * 100;
											}
										?>%</td>
									</tr>
									<tr>
										<td>No</td>
										<td class="text-center"><?php
										if($respuestas_cerradas[$row->pregunta_id]["no"] == 0){
											echo "ninguna";
										}else{
											$respuestas_cerradas[$row->pregunta_id]["no"];
										}
										?></td>
										<td class="text-center">
										<?php
											if($total_egresados == 0){
												echo "0";
											}else{
												echo ($respuestas_cerradas[$row->pregunta_id]["no"]/$total_egresados) * 100;
											}
											
										?>%
										</td>
									</tr>
									<tr><td class="text-right bg-info" colspan="3"><a target="_new" href="<?=base_url('encuesta/grafico/'. $row->pregunta_id)?>">Ver diagrama de pastel</a></td></tr>
								</table>
							<?
							$cont ++;
						}else if($row->categoria_id == '3' || $row->categoria_id == '4'){
							?>
							<label class="pregunta"><?="#".$cont . " - ". $row->pregunta?></label>
							<table class="tabla">
							<th>
								<tr>
									<td>Respuesta</td>
									<td># de personas que seleccionarón esta respuesta</td>
									<td>% de personas que seleccionarón esta respuesta</td>
								</tr>
							</th>
							<?
							if(isset($opciones[$row->pregunta_id])){
								foreach ($opciones[$row->pregunta_id]->result() as $opc) {
									?>
										<tr>
											<td>
												<?=$opc->opcion?>
											</td>
											<td class="text-center">
												<?php

													if($respuestas[$opc->respuesta_sugerida_id] == 0){
														echo "ninguna";
													}else{
														echo $respuestas[$opc->respuesta_sugerida_id];
													}
												?>
											</td>
											<td class="text-center">
												<?php
													if($total_egresados == 0){
														echo "0";
													}else{
														echo ($respuestas[$opc->respuesta_sugerida_id]/$total_egresados) * 100;
													}
												?>%
											</td>
										</tr>	
									<?
								}
							}
							?>
							<tr><td class="text-right bg-info" colspan="3"><a target="_new" href="<?=base_url('encuesta/grafico/'. $row->pregunta_id)?>">Ver diagrama de pastel</a></td></tr>
							</table>

							<?
							$cont ++;
						}

					} 
				?>
			</div>
		</div>
		<a href="<?=base_url('encuesta/listar_encuestas')?>" class="btn btn-primary pull-right">Regresar</a>
	</div>
	
</div>
<style>
	.centrar-texto{
		margin-left: 20px;

	}
	.tabla-encabezado{
		margin-left: 20px;
		display: block;
		padding-top: 10px;
		padding-bottom: 10px;
		border-bottom: 1px solid lightgray;
		border-top: 1px solid lightgray;
		margin-bottom: 20px;
		margin-top: 0px;
	}
	.tabla-encabezado td{
		padding:  3px 5px;
	}

	.tabla{
		margin: 10px;
		margin-left: 60px;
		margin-bottom: 30px;
		font-size: 16px;
		font-family: calibri;
		border:1px solid lightgray;
		width: 90%;
	}

	.tabla td{

		padding: 3px 20px;
		border: 1px solid lightgray;
	}
	.pregunta{
		margin-left: 20px;
	}
	hr{
		margin-bottom: 0px;
	}
	.box-header{
		padding-bottom: 0px;
	}
	.box-header p{
		margin-bottom: 0px;
	}
</style>
</div>