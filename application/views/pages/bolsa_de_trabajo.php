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
								<i class="glyphicon glyphicon-minus"></i>
							</button>
						</div>
					</div>
					<div class="box-body no padding">
						<div class="table-responsive mailbox-messages">
							<form method="post" id="formBuscar" action="<?=base_url("Publicaciones/Cursos")?>">
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

			
		</div>
	</section>
</div>