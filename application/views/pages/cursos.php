<div class="container">
	<section class="content-header">
		<h1>Listado <strong><small>de Cursos</small></strong></h1>
	</section>
	<section class="content">
		<div class="row">
			<div class="col-md-3">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Busqueda por Carrera</h3>
						<div class="box-tools">
							<button class="btn btn-box-tool" data-widget="collapse">
								<i class="glyphicon glyphicon-minus"></i>
							</button>
						</div>
					</div>
					<div class="box-body no padding">
						<div class="table-responsive mailbox-messages">
							<form method="post" id="formBuscar" action="<?=base_url("Publicaciones/cursos")?>">
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
					if(isset($cursos) && !empty($cursos) && $cursos->num_rows()>0){
						foreach($cursos->result() as $row){
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
										<h3 class="timeline-header"><a href="#"> <?= ucfirst($row->nombre_curso); ?></a></h3>

										<div class="timeline-body">
											<?php
												echo ucfirst($row->descripcion);
											?>
											<br>
											<strong>Información</strong>
											<table class='table table-hover'>
												<tr>
													<td>Duración</td>
													<td><?= $row->duracion; ?> meses</td>
												</tr>
												<tr>
													<td>Fecha de inicio</td>
													<td><?= date_toDMY($row->inicio);?></td>
												</tr>
												<tr>
													<td>Costo</td>
													<td> <?= "$".$row->costo; ?> dólares</td>
												</tr>
												<tr>
													<td>Tipo de curso</td>
													<td>
														<?php
															if ($row->libre==TRUE) {
																echo "Curso Libre";
															}else{
																echo "Curso de Posgrado";
															}
														?>
													</td>
												</tr>
											</table>
											<?php
												if (!empty($row->imagen)) {
											?>
													<img class="margin" alt="" src="<?= base_url('Imagen/Cargar/'.$row->imagen_publicacion_id) ?>">
											<?php
												}
											?>
										</div>

										<div class="timeline-footer">
											
										</div>
									</div>
								</li>
							
				<?php
						}
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
										No se han encontrado Cursos que mostrar.
									</h4>
								</div>
							</div>
						</div>
				<?php
					}
				?>
							</ul>

				<ul class="timeline">
					<li>
						<i class="glyphicon glyphicon-lock bg-gray"></i>
					</li>
				</ul>
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
</script>