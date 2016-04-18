<div class="container">
	<section class="content-header">
		<h1>Listados <strong><small>de Egresados</small></strong></h1>
	</section>
	<section class="content">
		<div class="row">
			<div class="col-md-12">

				<div class="alert alert-info alert-dismissable text-justify">
					<button class="close" aria-hidden="true" data-dismiss="alert" type="button">x</button>
					<h4 >
						<i class="icon glyphicon glyphicon-info-sign"></i>
						Nota
					</h4>
					La información de algunos egresados puede permanecer privada o parcialmente visible para determinados usuarios.
				</div>

				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Filtrar por Carrera</h3>
						<form class="form-inline" method="post" action="<?=base_url("egresado/listado")?>" id="formBuscarEgresado">
							<div class="input-group">
								<select class="form-control" style="width:100%;" name="carrera" id="carrera">
								 	<option value="0">- Todas las carreras -</option>
								  	<?php
								 		if(isset($carreras)){
								 			foreach ($carreras->result() as $row) {
								 				if($row->carrera_id == $carrera){
								 					echo "<option selected value='$row->carrera_id'>$row->nombre_carrera</option>";
								 				}else{
								 					echo "<option value='$row->carrera_id'>$row->nombre_carrera</option>";
								 				}			 				
								 			}
								 		}else{
								 	?>
								 			<option class="text-red" value="1">No se han podido cargar las carreras</option>
								 	<?php
								 		}
								 	?>
								</select>
							</div>
						</form>
					</div>

					<div class="box-body">
						<div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
							<div class="row">
								<div class="col-sm-12">
									<table id="example1" class="table table-bordered table-striped datatable" role="grid" aria-describedby="example1_info">
										<thead>
											<tr role="row">
												<th class="sortin_desc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" style="width:80px;" aria-label="Imagen: activate to sort column ascending" aria-sort="descending"></th>
												<th class="sortin_desc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" style="width:180px;" aria-label="Nombre: activate to sort column ascending" aria-sort="descending">
													Nombre
												</th>
												<th class="sortin_desc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" style="width:180px;" aria-label="Ubicacion Actual: activate to sort column ascending" aria-sort="descending">
													Ubicacion Actual
												</th>
												<th class="sortin_desc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" style="width:180px;" aria-label="Información de Contacto: activate to sort column ascending" aria-sort="descending">
													Información de Contacto
												</th>
												<th class="sortin_desc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" style="width:180px;" aria-label="Curriculum: activate to sort column ascending" aria-sort="descending">
													Curriculum
												</th>
											</tr>
										</thead>
										<?php
											if (isset($registro) && $registro->num_rows()>0){
												?>
												<tbody>
													<?php
														$clase = "";
														$cambio = true;
														$tdclass = "";
														$cambio2 = true;

														foreach ($registro->result() as $row) {

															if ($cambio) {
																$clase = "odd";
																$cambio=false;
															}else{
																$clase="even";
																$cambio=true;
															}
															if ($cambio2) {
																$tdclass = "sortin_1";
															}else{
																$tdclass = "";
															}

															echo "<tr>";
																if ($privacidad[$row->usuario_id] == null || empty($privacidad[$row->usuario_id])) {
																	echo "<td class='no-padding'><img title='ampliar' class='thumbnail zoom' src='" . base_url("dist/img/no_image.gif") . "' alt=''></td>";
																	echo "<td class='$clase'><p class='text-info'>Información no disponible</p></td>";
																	echo "<td><p class='text-info'>Información no disponible</p></td>";
																	echo "<td><p class='text-info'>Información no disponible</p></td>";
																	echo "<td><p class='text-info'>Información no disponible</p></td>";
																}else{
																	/* FOTO DE PERFIL */
																	if ($privacidad[$row->usuario_id]["foto_perfil"] == "publica") {
																		if (file_exists("uploads/".$row->imagen)) {
																			echo "<td class='no-padding'><img title='ampliar' class='thumbnail zoom' src='" . base_url("uploads/". $row->imagen) . "' alt=''></td>";
																		}else{
																			echo "<td class='no-padding'><img title='ampliar' class='thumbnail zoom' src='" . base_url("dist/img/no_image.gif") . "' alt=''></td>";
																		}
																	}elseif ($privacidad[$row->usuario_id]["foto_perfil"] == "empresas") {
																		if (esEmpresa() || esPublicador() || esAdministrador()) {
																			if (file_exists("uploads/".$row->imagen)) {
																				echo "<td class='no-padding'><img title='ampliar' class='thumbnail zoom' src='" . base_url("uploads/". $row->imagen) . "' alt=''></td>";
																			}else{
																				echo "<td class='no-padding'><img title='ampliar' class='thumbnail zoom' src='" . base_url("dist/img/no_image.gif") . "' alt=''></td>";
																			}
																		}else{
																			echo "<td class='no-padding'><img title='ampliar' class='thumbnail zoom' src='" . base_url("dist/img/no_image.gif") . "' alt=''></td>";
																		}
																	}else{
																		echo "<td class='no-padding'><img title='ampliar' class='thumbnail zoom' src='" . base_url("dist/img/no_image.gif") . "' alt=''></td>";
																	}
																	/*DATOS PERSONALES */
																	echo "<td class='$tdclass'><label>$row->nombre $row->apellido</label>
																	<p class='help-block'>$row->carrera</p>";
																	if ($row->sexo=="F") {
																		echo "<p class='help-block'>Mujer</p></td>";
																	}else{
																		echo "<pclass='help-block'>Hombre</p></td>";
																	}
																	/* INFORMACION DE UBICACION */
																	if ($privacidad[$row->usuario_id]["info_ubicacion"] == "publica") {
																		echo "<td>$row->municipio, $row->departamento. <br>$row->direccion</td>";
																	}elseif ($privacidad[$row->usuario_id]["info_ubicacion"] == "empresas") {
																		if (esEmpresa() || esPublicador() || esAdministrador()) {
																			echo "<td>$row->municipio, $row->departamento. <br>$row->direccion</td>";
																		}else{
																			echo "<td><p class='text-info'>Información no disponible</p></td>";
																		}
																	}
																	/*INFORMACION CONTACTO */
																	if ($privacidad[$row->usuario_id]["info_contacto"] == "publica") {
																		echo "<td>";
																		if ($row->telefono != null && !empty($row->telefono)) {
																			echo $row->telefono;
																			if ($row->celular != null && !empty($row->celular)) {
																				echo ",". $row->celular."<br>";
																			}
																		}else{
																			if ($row->celular != null && !empty($row->celular)) {
																				echo $row->celular. "<br>";
																			}
																		}
																		echo $row->correo;
																		echo "</td>";
																	}elseif ($privacidad[$row->usuario_id]["info_contacto"] == "empresas") {
																		if (esEmpresa() || esPublicador() || esAdministrador()) {
																			echo "<td>";
																			if ($row->telefono != null && !empty($row->telefono)) {
																				echo $row->telefono;
																				if ($row->celular != null && !empty($row->celular)) {
																					echo "," . $row->celular . "<br>";
																				}
																			}else{
																				if ($row->celular != null && !empty($row->celular)) {
																					echo $row->celular . "<br>";
																				}
																			}
																			echo $row->correo;
																			echo "</td>";
																		}else{
																			echo "<td><p class='text-info'>Información no disponible</p></td>";
																		}
																	}
																	/*INFROMACION DE CURRICULUM */
																	if ($privacidad[$row->usuario_id]["info_curriculum"] == "publica") {
																		echo "<td><a target='blank' href='" . base_url("Curriculum/Ver/". $row->usuario_id) . "' class='btn btn-primary btn-sm'>Ver curriculum</a></td";
																	}elseif ($privacidad[$row->usuario_id]["info_curriculum"] == "empresas") {
																		if (esEmpresa() || esPublicador() || esAdministrador()) {
																			echo "<td><a target='blank' href='" . base_url("Curriculum/Ver/". $row->usuario_id) . "' class='btn btn-primary btn-sm'>Ver curriculum</a></td>";
																		}else{
																			echo "<td><p class='text-info'>Información no disponible</p></td>";
																		}
																	}
																}
															echo "</tr>";
															$cambio2 = false;
														}
													?>
												</tbody>
												<?php
											}else{

											}
										?>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<script src="<?= base_url()?>plugins/datatables/jquery.dataTables.min.js"></script>
<script src="<?= base_url()?>plugins/datatables/dataTables.bootstrap.min.js"></script>
<style type="text/css">
	.help-block{
		margin-bottom: 0px;
		margin-top: 0px;
	}
	table tr td label{
		margin: 0px 0px;
	}
	table img{
		border: 1px solid lightgray;
		height: 65px;
		width: 70px;
		margin-right: 0px;
	}
	.thumbnail{
		margin: 0px 0px;
		cursor: pointer;
		border-radius: 2px;
	}
	.zoom{
        /* Aumentamos la anchura y altura durante 2 segundos */
        transition: width 0.3s, height 0.3s, transform 0.3s;
        -moz-transition: width 0.3s, height 0.3s, -moz-transform 0.3s;
        -webkit-transition: width 0.3s, height 0.3s, -webkit-transform 0.3s;
        -o-transition: width 0.3s, height 0.3s,-o-transform 0.3s;

    }
    .zoom-in{
        /* tranformamos el elemento al pasar el mouse por encima al doble de
           su tamaño con scale(1). */
        transform : scale(2);
        -moz-transform : scale(2);      /* Firefox */
        -webkit-transform : scale(2);   /* Chrome - Safari */
        -o-transform : scale(2);        /* Opera */
    }
</style>
<script type="text/javascript">
	$("#carrera").change(function(){
		$("#formBuscarEgresado").submit();
	});
	$("table tr td img").click(function(){
		$(this).addClass("zoom-in");
	});
	$("table tr td img").mouseleave(function(){
			$(this).removeClass("zoom-in");
	});
     $(function () {
        $("#example1").DataTable();
        $('#example2').DataTable({
          "paging": true,
          "lengthChange": false,
          "searching": false,
          "ordering": true,
          "info": true,
          "autoWidth": false
        });
    });
    
</script>


