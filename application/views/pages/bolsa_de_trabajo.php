<div class="container">
	<section class="content-header">
		<h1>Bolsa <strong><small>de Empleo</small></strong></h1>
	</section>
	<section class="content">
		<div class="row">
			<div class="col-md-3">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Busqueda por Carrera</h3>
						<div class="box-tools">
							<button class="btn btn-box-tool" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
						</div>
					</div>
					<div class="box-body no padding">
						<div class="table-responsive mailbox-messages">
							<form method="post" id="formBuscar" action="<?=base_url("Publicaciones/BolsaDeTrabajo")?>">
								<table class="table table-hover table-striped">
									<tbody>
										<?php

											if (isset($carreras) && !empty($carreras)) {
												foreach($carreras->result() as $row){
													echo "<tr>";
													if (isset($carreras_marcadas) && !empty($carreras_marcadas)) {
														if (buscar_carrera($row->carrera_id,$carreras_marcadas)) {
															echo "
															<td> 
																<input type='checkbox' id='carr_" . $row->carrera_id . "' name='carrera[]' value='$row->carrera_id' checked style='position: absolute;'/>
															</td>
															<td class='mailbox-name'>
																<a href='#'>$row->nombre_carrera</a>
															</td>
															";
														}else{
															echo "
															<td> 
																<input type='checkbox' id='carr_" . $row->carrera_id . "' name='carrera[]' value='$row->carrera_id' style='position: absolute;'/>
															</td>
															<td class='mailbox-name'>
																<a href='#'>$row->nombre_carrera</a>
															</td>
															";
														}
													}else{
														echo "
														<td> 
															<input type='checkbox' id='carr_" . $row->carrera_id . "' name='carrera[]' value='$row->carrera_id' style='position: absolute;'/>
														</td>
														<td class='mailbox-name'>
															<a href='#'>$row->nombre_carrera</a>
														</td>
														";
													}
													echo "</tr>";
												}
											}

											function buscar_carrera($id_carrera,$carreras){
												foreach ($carreras as $key => $value){
													if($value == $id_carrera){
														return TRUE;
													}
												}
												return FALSE;
											}

										?>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-9">
				<?php
					if (isset($fichas) && !empty($fichas) && $fichas->num_rows()>0) {
						foreach($fichas->result() as $row){
				?>
							<ul class="timeline">
								<li class="timeline-label">
									<span class="bg-blue">
										<?php
											$fecha = new DateTime($row->fecha_publicacion);
										 	echo $fecha->format("F j, Y");
										?>
									</span>
								</li>

								<li>
									<i class="glyphicon glyphicon-user bg-aqua"></i>
									<div class="timeline-item">
										<span class="time">
											<i class="glyphicon glyphicon-calendar"></i>
											<strong>Esta publicación expirará el dia: <?= date_toDMY($row->fecha_alta); ?></strong>
										</span>
										<h3 class="timeline-header"><a href="#"><?= ucfirst($row->cargo); ?></a></h3>

										<div class="timeline-body">
											<p><?= $row->descripcion ?></p>
											<strong>Ubicación del cargo</strong>
											<p><?= $row->ubicacion ?></p>
											<strong>Cantidad de puestos</strong>
											<p><?= $row->cantidad ?></p>
											<strong>Jefe inmediato</strong>
											<p><?= $row->jefe ?></p>
											<strong>Personal a Cargo</strong>
											<p><?= $row->a_cargo ?></p>
											<strong>Finalidad</strong>
											<p><?= $row->finalidad ?></p>
											<strong>Funciones</strong>
											<p><?= $row->funciones ?></p>
											<strong>Requisitos</strong>
											<p><?= $row->requisitos ?></p>
											<strong>Experiencia</strong>
											<p><?= $row->experiencia ?></p>
											<strong>Competencia</strong>
											<p><?= $row->competencia ?></p>

											<?php
												if (!empty($row->imagen)) {
											?>
													<img src="<?=base_url("Imagen/Cargar/".$row->imagen_publicacion_id)?>" alt="">
											<?php
												}
											?>
										</div>
										<div class="timeline-footer">
											<?php
												if (empty($row->ficha_solicitante_id)) {
											?>
													<form id="formAplicar" method="post" action="<?=base_url('Publicaciones/aplicarFicha')?>">
														<input type="hidden" name="ficha_id" value="<?=$row->ficha_id?>">
														<button type="submit" class='btn btn-info'><span class='glyphicon glyphicon-share-alt'></span> Aplicar </button>
													</form>
											<?php
												}else{
											?>
													<button type="button" disabled class='btn btn-info'><span class='glyphicon glyphicon-share-alt'></span> Solicitud enviada </button>
											<?php
												}
											?>
										</div>
									</div>
								</li>
								
				<?php
						}
				?>
							</ul>
				<ul class="timeline">
					<li>
						<i class="glyphicon glyphicon-lock bg-gray"></i>
					</li>
				</ul>

				<?php
					}else{
				?>
					<div class="box box-info">
							<div class="box-header wit-border">
								<i class="glyphicon glyphicon-exclamation-sign"></i>
								<h3 class="box-title">Notificación</h3>
							</div>
							<div class="box-body">
								<div class="alert alert-info alert-dismissable">
									<button class="close" aria-hidden="true" data-dismiss="alert" type="button">x</button>
									<h4 >
										<i class="icon glyphicon glyphicon-info-sign"></i>
										No se han encontrado Ofertas de Empleo que mostrar.
									</h4>
								</div>
							</div>
						</div>
				<?php
					}
				?>
			</div>

		</div>
	</section>
</div>
<style type="text/css">
	.bg-blue{
		border-bottom-left-radius: 4px;
		border-bottom-right-radius: 4px;
		border-top-left-radius: 4px;
		border-top-right-radius: 4px;
		display: inline-block;
		font-weight: 600;
		padding-top: 5px;
		padding-bottom: 5px;
		padding-left: 5px;
		padding-right: 5px;
	}
	img{
		max-width: 150px;
		max-height: 200px;
	}
</style>
<script type="text/javascript">
	$("[name='carrera[]']").change(function(){
		$("#formBuscar").trigger("submit");
	});

	$("#formAplicar").submit(function(e){
		e.preventDefault();
		if(confirm("¿Estas seguro que deseas aplicar a esta oferta de empleo? \n Se enviará un correo a la empresa que publicó la ficha ocupacional con tu currículum vitae.")){
			this.submit();
		}
	});
</script>