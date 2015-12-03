<script type="text/javascript">
	function cargarTitulos(contenedor,titulo_id){
		$.ajax({
			url: "<?=base_url('Ajax/CargarTitulos').'/'?>"+ titulo_id,
			datatype: "html",
			success: function(data){
				if(data != null){
					$(contenedor).html(data);
					$("select[name='titulo[]']").addClass("form-control");
					$("select[name='titulo[]']").css("width","230px");
				}
			},
			error: function(jqXHR, textStatus, errorThrown){
				console.log(jqXHR.responseText);
				alert("Ha ocurrido un error y no se ha podido procesar la peticion. \n"+errorThrown);
			},
			async: true
		});
	}
</script>
<div class="container">
	<section class="content-header">
		<h1>Editar <strong><small>Curriculum</small></strong></h1>
	</section>
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<?php
				    if(!isset($formacion_academica)){
				?>
						<div class="alert alert-danger alert-dismissable text-justify">
							<button class="close" aria-hidden="true" data-dismiss="alert" type="button">x</button>
							<h4>
								<i class="icon fa fa-warning"></i>
								Aviso
							</h4>
							No se ha podido cargar la informacion de curriculum.
						</div>
				<?php
				    }else{
				 ?>
		 				<form id="form_actualizar_curriculum" action="<?=base_url('Curriculum/Actualizar')?>" method="POST">
		 					<input name="curriculum_id" type="hidden" value="<?php echo $curriculum_id; ?>">
		 					<div class="box box-success">
		 						<div class="box-header with-border">
		 							<span class="glyphicon glyphicon-book"></span>
		 							<h3 class="box-title">Formación académica</h3>
		 							<span class='pull-right'>
										<button id="btnAgregarTitulo" onclick='agregarTitulo()' type='button' class='btn btn-success btn-flat btn-sm'>Agregar Titulo</button>
									</span>
		 						</div>
		 						<div class="box-body table-responsive no-padding">
		 							<div class="col-md-12">
		 								<table class="table table-striped table-hover">
		 									<tbody id="tabla_academica" class="Add-Fila">
		 										<tr>
													<th style="width:20px;">#</th>
													<th class="text-center">Nombre de la titulación</th>
													<th class="text-center" style="width:350px;">Año de comienzo</th>
													<th class="text-center" style="width:350px;">Año de finalización</th>
		 										</tr>
		 										<?php
		 											$cont = 1;
		 											foreach ($formacion_academica->result() as $FA){
		 												echo'
		 												<tr>
		 													<td>'.$cont.'.</td>
		 													<td>
		 														<input name="formacion_academica_id[]" type="hidden" value="'.$FA->formacion_academica_id.'">
		 														<div class="input-group">
																	<span class="input-group-addon">
																		<i class="glyphicon glyphicon-bookmark"></i>
																	</span>
																	<div class="titulo" id="titulo_'.$cont.'"></div>
																</div>
		 													</td>
		 													<td>
		 														<div class="input-group">
																	<span class="input-group-addon">
																		<i class="fa fa-calendar-plus-o"></i>
																	</span>
																	<input class="form-control fecha" type="text" name="comienzo_formacion[]" value="'.$FA->fecha_comienzo.'"/>
																</div>
		 													</td>
		 													<td>
		 														<div class="input-group">
																	<span class="input-group-addon">
																		<i class="fa fa-calendar-times-o"></i>
																	</span>
																	<input class="form-control fecha" type="text" name="finalizacion_formacion[]" value="'.$FA->fecha_finalizacion.'"/>
																</div>
		 													</td>
		 												</tr>
		 												';
		 												echo "<script>
															cargarTitulos($('#titulo_".$cont."'),'$FA->titulo_id');
														</script>";
														$cont +=1;
		 											}
		 										?>
		 									</tbody>
		 									<tfoot>
												<tr>
													<th></th>
													<th>
														<div class="input-group">
															<a href='javascript:nuevaFormacionAcademica()' class="btn btn-info btn-flat btn-sm" name='btn_agregar'>Agregar Fila</a>
															<a href='javascript:removerFilaFA()' class="btn btn-danger btn-flat btn-sm" name='btn_eliminar'>Eliminar Fila</a>
														</div>
													</th>
													<th></th>
													<th></th>
												</tr>
											</tfoot>
		 								</table>
		 							</div>
		 						</div>
		 						<div class="panel box box-success">
		 							<div class="box-header with-border">
										<span class="glyphicon glyphicon-briefcase"></span>
										<h3 class="box-title">Experiencia Laboral</h3>
									</div>
									<div class="box-body table-responsive no-padding">
										<div class="col-md-12">
											<table class="table table-striped table-hover">
												<tbody id="tabla_laboral" class="Add-Fila">
													<tr>
														<th>#</th>
														<th class="text-center">Cargo</th>
														<th class="text-center">Nombre de la Empresa</th>
														<th class="text-center">Año de Comienzo</th>
														<th class="text-center">Año de Finalizacón</th>
													</tr>
													<?php
													if ($experiencia_laboral=="") {
														echo'
														<tr>
															<td>1.</td>
															<td>
																<div class="input-group">
																	<span class="input-group-addon">
																		<i class="fa fa-suitcase"></i>
																	</span>
																	<input class="form-control" type="text" name="cargo[]" >
																</div>
															</td>
															<td>
																<div class="input-group">
																	<span class="input-group-addon">
																		<i class="fa fa-users"></i>
																	</span>
																	<input class="form-control" type="text" name="empresa[]" >
																</div>
															</td>
															<td>
																<div class="input-group">
																	<span class="input-group-addon">
																		<i class="fa fa-calendar-plus-o"></i>
																	</span>
																	<input class="form-control" type="text" name="comienzo_laboral[]" >
																</div>
															</td>
															<td>
																<div class="input-group">
																	<span class="input-group-addon">
																		<i class="fa fa-calendar-times-o"></i>
																	</span>
																	<input class="form-control" type="text" name="finalizacion_laboral[]" >
																</div>
															</td>
														</tr>
														';
													}else{
														$cont = 1;
														foreach($experiencia_laboral->result() as $EP){
															echo"
															<tr>
																<td>$cont.</td>
																<td>
																	<div class='input-group'>
																		<input name='experiencia_laboral_id[]' type='hidden' value= '$EP->experiencia_laboral_id' >
																		<span class='input-group-addon'>
																			<i class='fa fa-suitcase'></i>
																		</span>
																		<input class='form-control' type='text' name='cargo[]' value='$EP->cargo' >
																	</div>
																</td>
																<td>
																	<div class='input-group'>
																		<span class='input-group-addon'>
																			<i class='fa fa-users'></i>
																		</span>
																		<input class='form-control' type='text' name='empresa[]' value='$EP->empresa' >
																	</div>
																</td>
																<td>
																	<div class='input-group'>
																		<span class='input-group-addon'>
																			<i class='fa fa-calendar-plus-o'></i>
																		</span>
																		<input class='form-control' type='text' name='comienzo_laboral[]' value='$EP->fecha_comienzo' >
																	</div>
																</td>
																<td>
																	<div class='input-group'>
																		<span class='input-group-addon'>
																			<i class='fa fa-calendar-times-o'></i>
																		</span>
																		<input class='form-control' type='text' name='finalizacion_laboral[]' value='$EP->fecha_finalizacion' >
																	</div>
																</td>
															</tr>
															";
															$cont +=1;
														}
													}
													?>
												</tbody>
												<tfoot>
													<tr>
														<th></th>
														<th>
															<div class="input-group">
																<a href='javascript:agregarExperienciaLaboral()' class="btn btn-info btn-flat btn-sm" name='btn_agregar'>Agregar Fila</a>
																<a href='javascript:removerFila("tabla_laboral")' class="btn btn-danger btn-flat btn-sm" name='btn_eliminar'>Eliminar Fila</a>
															</div>
														</th>
														<th></th>
														<th></th>
														<th></th>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
		 						</div>
		 						<div class="panel box box-success">
		 							<div class="box-header with-border">
										<span class="fa fa-book"></span>
										<h3 class="box-title">Formación Complementaria</h3>
									</div>
									<div class="box-body table-responsive no-padding">
										<div class="col-md-12">
											<table class="table table-striped table-hover">
												<tbody id="tabla_complementaria" class="Add-Fila">
													<tr>
														<th>#</th>
														<th class="text-center">Nombre del Curso</th>
														<th class="text-center">Año de Comienzo</th>
														<th class="text-center">Año de Finalización</th>
													</tr>
													<?php
													if ($formacion_complementaria=="") {
														echo"
														<tr>
															<td>1.</td>
															<td>
																<div class='input-group'>
																	<span class='input-group-addon'>
																		<i class='fa fa-contao'></i>
																	</span>
																	<input class='form-control' type='text' name='curso[]' >
																</div>
															</td>
															<td>
																<div class='input-group'>
																	<span class='input-group-addon'>
																		<i class='fa fa-calendar-plus-o'></i>
																	</span>
																	<input class='form-control' type='text' name='comienzo_curso[]' >
																</div>
															</td>
															<td>
																<div class='input-group'>
																	<span class='input-group-addon'>
																		<i class='fa fa-calendar-times-o'></i>
																	</span>
																	<input class='form-control' type='text' name='finalizacion_curso[]' >
																</div>
															</td>
														</tr>
														";
													}else{
														$cont = 1;
														foreach($formacion_complementaria->result() as $FC){
															echo"
															<tr>
																<td>$cont.</td>
																<td>
																	<div class='input-group'>
																	<input name='formacion_complementaria_id[]' type='hidden' value= '$FC->formacion_complementaria_id'>
																		<span class='input-group-addon'>
																			<i class='fa fa-contao'></i>
																		</span>
																		<input class='form-control' type='text' name='curso[]' value= '$FC->curso'>
																	</div>
																</td>
																<td>
																	<div class='input-group'>
																		<span class='input-group-addon'>
																			<i class='fa fa-calendar-plus-o'></i>
																		</span>
																		<input class='form-control' type='text' name='comienzo_curso[]' value= '$FC->fecha_comienzo'>
																	</div>
																</td>
																<td>
																	<div class='input-group'>
																		<span class='input-group-addon'>
																			<i class='fa fa-calendar-times-o'></i>
																		</span>
																		<input class='form-control' type='text' name='finalizacion_curso[]' value= '$FC->fecha_finalizacion'>
																	</div>
																</td>
															</tr>
															";
															$cont +=1;
														}
													}
													?>
												</tbody>
												<tfoot>
													<tr>
														<th></th>
														<th>
															<div class="input-group">
																<a href='javascript:agregarFormacionComplementaria()' class="btn btn-info btn-flat btn-sm" name='btn_agregar'>Agregar Fila</a>
																<a href='javascript:removerFila("tabla_complementaria")' class="btn btn-danger btn-flat btn-sm" name='btn_eliminar'>Eliminar Fila</a>
															</div>
														</th>
														<th></th>
														<th></th>
														<th></th>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
		 						</div>
		 						<div class="panel box box-success">
		 							<div class="box-header with-border">
										<span class="fa fa-language"></span>
										<h3 class="box-title">Dominio de Idiomas</h3>
										
									</div>
									<div class="box-body table-responsive no-padding">
										<div class="col-md-12">
											<table class="table table-striped table-hover">
												<tbody id="tabla_idiomas" class="Add-Fila">
													<tr>
														<th style="width:10px;">#</th>
														<th class="text-center">Idioma</th>
														<th class="text-center" colspan="3">Nivel de Dominio</th>
													</tr>
													<?php
														if ($idioma=="") {
															echo"
																<tr>
																	<td style='width:10px;'>
																		1.
																	</td>
																	<td style='width:500px;'>
																		<div class='input-group'>
																			<span class='input-group-addon'>
																				<i class='fa fa-language'></i>
																			</span>
																			<input placeholder='ejemplo: Ingles' class='form-control' type='text' name='idioma[]' >
																		</div>
																	</td>
																	<td style='width:100px;'>
																		<div class='input-group'>
																			<label>Basico</label>
																			<input type='radio' class='flat-red' value='basico' name='nivel_idioma[]'>
																		</div>
																	</td>
																	<td style='width:100px;'>
																		<div class='input-group'>
																			<label>Medio</label>
																			<input type='radio' class='flat-red' value='medio' name='nivel_idioma[]'>
																		</div>
																	</td>
																	<td style='width:100px;'> 
																		<div class='input-group'>
																			<label>Alto</label>
																			<input type='radio' class='flat-red' value='alto' name='nivel_idioma[]'>
																		</div>
																	</td>
																</tr>
															";
														}else{
															$cont1 = 0;
															$cont2 = 1;
															foreach($idioma->result() as $idiom){
																echo "
																	<tr>
																	<td style='width:10px;'>
																		$cont2.
																	</td>
																	<td style='width:500px;'>
																		<div class='input-group'>
																			<input name='idioma_id[]' type='hidden' value= '$idiom->idioma_id'>
																			<span class='input-group-addon'>
																				<i class='fa fa-language'></i>
																			</span>
																			<input placeholder='ejemplo: Ingles' class='form-control' type='text' name='idioma[]' value='$idiom->idioma'>
																		</div>
																	</td>
																	<td style='width:100px;'>
																		<div class='input-group'>
																			<label>Basico</label>
																			<input type='radio' class='flat-red' value='basico' name='nivel_idioma[".$cont1."]' ".(($idiom->nivel == "basico") ? 'checked':'').">
																		</div>
																	</td>
																	<td style='width:100px;'>
																		<div class='input-group'>
																			<label>Medio</label>
																			<input type='radio' class='flat-red' value='medio' name='nivel_idioma[".$cont1."]' ".(($idiom->nivel == "medio") ? 'checked':'').">
																		</div>
																	</td>
																	<td style='width:100px;'> 
																		<div class='input-group'>
																			<label>Alto</label>
																			<input type='radio' class='flat-red' value='alto' name='nivel_idioma[".$cont1."]' ".(($idiom->nivel == "alto") ? 'checked':'').">
																		</div>
																	</td>
																</tr>
																";
																$cont1+=1;
																$cont2+=1;
															}
														}
													?>
												</tbody>
												<tfoot>
													<tr>
														<th></th>
														<th>
															<div class="input-group">
																<a href='javascript:agregarIdioma()' class="btn btn-info btn-flat btn-sm" name='btn_agregar'>Agregar Fila</a>
																<a href='javascript:removerFila("tabla_idiomas")' class="btn btn-danger btn-flat btn-sm" name='btn_eliminar'>Eliminar Fila</a>
															</div>
														</th>
														<th></th>
														<th></th>
														<th></th>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
		 						</div>
		 						<div class="panel box box-success">
		 							<div class="box-header with-border">
										<span class="fa fa-desktop"></span>
										<h3 class="box-title">Informática</h3>
									</div>
									<div class="box-body table-responsive no-padding">
										<div class="col-md-12">
											<table class="table table-striped table-hover">
												<tbody id="tabla_informatica" class="Add-Fila">
													<tr>
														<th style="width:10px;">#</th>
														<th class="text-center">Software</th>
														<th class="text-center" colspan="3">Nivel de Dominio</th>
													</tr>
													<?php
													if ($informatica=="") {
														echo"
														<tr>
															<td style='width:10px;'>
																1.
															</td>
															<td style='width:500px;'>
																<div class='input-group'>
																	<span class='input-group-addon'>
																		<i class='fa fa-laptop'></i>
																	</span>
																	<input placeholder='ejemplo: Microsoft Word' class='form-control' type='text' name='software[]' >
																</div>
															</td>
															<td style='width:100px;'>
																<div class='input-group'>
																	<label>Basico</label>
																	<input type='radio' class='flat-red' value='basico' name='nivel_software[]'>
																</div>
															</td>
															<td style='width:100px;'>
																<div class='input-group'>
																	<label>Medio</label>
																	<input type='radio' class='flat-red' value='usuario' name='nivel_software[]'>
																</div>
															</td>
															<td style='width:100px;'> 
																<div class='input-group'>
																	<label>Alto</label>
																	<input type='radio' class='flat-red' value='experto' name='nivel_software[]'>
																</div>
															</td>
														</tr>
														";
													}else{
														$cont1 = 0;
														$cont2 = 1;
														foreach($informatica->result() as $infor){
															echo"
															<tr>
																<td style='width:10px;'>
																	1.
																</td>
																<td style='width:500px;'>
																	<div class='input-group'>
																		<input name='informatica_id[]' type='hidden' id='$infor->informatica_id' value='$infor->informatica_id'>
																		<span class='input-group-addon'>
																			<i class='fa fa-laptop'></i>
																		</span>
																		<input placeholder='ejemplo: Microsoft Word' class='form-control' type='text' name='software[]' value='$infor->software' >
																	</div>
																</td>
																<td style='width:100px;'>
																	<div class='input-group'>
																		<label>Basico</label>
																		<input type='radio' class='flat-red' value='basico' name='nivel_software[".$cont."]' ".(($infor->nivel == "basico") ? 'checked':'').">
																	</div>
																</td>
																<td style='width:100px;'>
																	<div class='input-group'>
																		<label>Medio</label>
																		<input type='radio' class='flat-red' value='usuario' name='nivel_software[".$cont."]' ".(($infor->nivel == "usuario") ? 'checked':'').">
																	</div>
																</td>
																<td style='width:100px;'> 
																	<div class='input-group'>
																		<label>Alto</label>
																		<input type='radio' class='flat-red' value='experto' name='nivel_software[".$cont."]' ".(($infor->nivel == "experto") ? 'checked':'').">
																	</div>
																</td>
															</tr>
															";
															$cont1+=1;
															$cont2+=1;
														}
													}
													?>
												</tbody>
												<tfoot>
													<tr>
														<th></th>
														<th>
															<div class="input-group">
																<a href='javascript:agregarInformatica()' class="btn btn-info btn-flat btn-sm" name='btn_agregar'>Agregar Fila</a>
																<a href='javascript:removerFila("tabla_informatica")' class="btn btn-danger btn-flat btn-sm" name='btn_eliminar'>Eliminar Fila</a>
															</div>
														</th>
														<th></th>
														<th></th>
														<th></th>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
									<div class="box-footer">
				 						<div class="pull-right">
				 							<button class="btn btn-primary btn-flat" type="submit">Actualizar curriculum</button>
											<a class="btn btn-danger btn-flat" href="<?= base_url('Perfil')?>" >Cancelar</a>
				 						</div>
			 						</div>
		 						</div>
		 					</div>
		 				</form>
				 <?php
				    }
				?>
			</div>
		</div>
	</section>
</div>
<style type="text/css">
	.titulo select#titulo{
		border-style: solid;
		width: auto;
		display: block;
		box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px 0px inset;
	}
	.input-group{
		margin-left: 35px;
	}
	#btnAgregarTitulo{
		margin-top: -5px;
		margin-right: 6px;
	}
</style>
<script type="text/javascript" src="<?=base_url()?>dist/js/validar.js"></script>
<script type="text/javascript" src="<?=base_url()?>plugins/jquery/jQuery-2.1.4.min.js"></script>
<script type="text/javascript" src="<?=base_url()?>plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript" src="<?=base_url()?>dist/js/app.min.js"></script>
<script type="text/javascript">
	function nuevaFormacionAcademica(){
		//Creamos una nueva fila en la tabla
		var table = document.getElementById('tabla_academica');
		var filas = table.rows.length;
		var fila = table.insertRow(-1);
		var celda0 = fila.insertCell(0);
		var celda1 = fila.insertCell(1);
		var celda2 = fila.insertCell(2);
		var celda3 = fila.insertCell(3);
		celda0.innerHTML= filas+".";
		celda1.innerHTML='<div class="input-group">\
							<span class="input-group-addon">\
								<i class="glyphicon glyphicon-bookmark"></i>\
							</span>\
							<div class="titulo" id="titulo_'+filas+'"></div>\
					</div>';

		celda2.innerHTML='<div class="input-group">\
							<span class="input-group-addon">\
								<i class="fa fa-calendar-plus-o"></i>\
							</span>\
							<input class="form-control fecha" type="text" name="comienzo_formacion[]" >\
						</div>';

		celda3.innerHTML='<div class="input-group">\
							<span class="input-group-addon">\
								<i class="fa fa-calendar-times-o"></i>\
							</span>\
							<input class="form-control fecha" type="text" name="finalizacion_formacion[]" >\
						</div>';
		cargarTitulos($('#titulo_'+filas+''),'1');
	}

	function agregarExperienciaLaboral(){
		var table = document.getElementById('tabla_laboral');
		var filas = table.rows.length;
		var fila = table.insertRow(-1);
		var celda0 = fila.insertCell(0);
		var celda1 = fila.insertCell(1);
		var celda2 = fila.insertCell(2);
		var celda3 = fila.insertCell(3);
		var celda4 = fila.insertCell(4);
		celda0.innerHTML= filas+".";
		celda1.innerHTML='<div class="input-group">\
							<span class="input-group-addon">\
								<i class="fa fa-suitcase"></i>\
							</span>\
							<input class="form-control" type="text" name="cargo[]" >\
					</div>';
		celda2.innerHTML='<div class="input-group">\
							<span class="input-group-addon">\
								<i class="fa fa-users"></i>\
							</span>\
							<input class="form-control" type="text" name="empresa[]" >\
						</div>';
		celda3.innerHTML='<div class="input-group">\
							<span class="input-group-addon">\
								<i class="fa fa-calendar-plus-o"></i>\
							</span>\
							<input class="form-control" type="text" name="comienzo_laboral[]" >\
						</div>';
		celda4.innerHTML='<div class="input-group">\
							<span class="input-group-addon">\
								<i class="fa fa-calendar-times-o"></i>\
							</span>\
							<input class="form-control" type="text" name="finalizacion_laboral[]" >\
						</div>';
	}

	function agregarFormacionComplementaria(){
		var table = document.getElementById('tabla_complementaria');
		var filas = table.rows.length;
		var fila = table.insertRow(-1);
		var celda0 = fila.insertCell(0);
		var celda1 = fila.insertCell(1);
		var celda2 = fila.insertCell(2);
		var celda3 = fila.insertCell(3);
		celda0.innerHTML= filas+".";
		celda1.innerHTML='<div class="input-group">\
							<span class="input-group-addon">\
								<i class="fa fa-contao"></i>\
							</span>\
							<input class="form-control" type="text" name="curso[]" >\
					</div>';

		celda2.innerHTML='<div class="input-group">\
							<span class="input-group-addon">\
								<i class="fa fa-calendar-plus-o"></i>\
							</span>\
							<input class="form-control fecha" type="text" name="comienzo_curso[]" >\
						</div>';

		celda3.innerHTML='<div class="input-group">\
							<span class="input-group-addon">\
								<i class="fa fa-calendar-times-o"></i>\
							</span>\
							<input class="form-control fecha" type="text" name="finalizacion_curso[]" >\
						</div>';
	}

	function agregarIdioma(){
		var table = document.getElementById('tabla_idiomas');
		var filas = table.rows.length;
		var fila = table.insertRow(-1);
		var celda0 = fila.insertCell(0);
		var celda1 = fila.insertCell(1);
		var celda2 = fila.insertCell(2);
		var celda3 = fila.insertCell(3);
		var celda4 = fila.insertCell(4);
		var contador = filas - 1;
		celda0.innerHTML= filas+".";
		celda1.innerHTML='<div class="input-group">\
							<span class="input-group-addon">\
								<i class="fa fa-language"></i>\
							</span>\
							<input placeholder="ejemplo: Ingles" class="form-control" type="text" name="idioma[]" >\
					</div>';
		celda2.innerHTML = '<div class="input-group">\
								<label>Basico</label>\
								<input type="radio" class="flat-red" value="basico" name="nivel_idioma['+contador+']">\
							</div>';
		celda3.innerHTML = '<div class="input-group">\
								<label>Medio</label>\
								<input type="radio" class="flat-red" value="medio" name="nivel_idioma['+contador+']">\
							</div>';
		celda4.innerHTML = '<div class="input-group">\
								<label>Alto</label>\
								<input type="radio" class="flat-red" value="alto" name="nivel_idioma['+contador+']">\
							</div>';
		estiloRadio();
	}

	function agregarInformatica(){
		var table = document.getElementById('tabla_informatica');
		var filas = table.rows.length;
		var fila = table.insertRow(-1);
		var celda0 = fila.insertCell(0);
		var celda1 = fila.insertCell(1);
		var celda2 = fila.insertCell(2);
		var celda3 = fila.insertCell(3);
		var celda4 = fila.insertCell(4);
		var contador = filas - 1;
		celda0.innerHTML= filas+".";
		celda1.innerHTML='<div class="input-group">\
							<span class="input-group-addon">\
								<i class="fa fa-laptop"></i>\
							</span>\
							<input placeholder="ejemplo: Microsoft Word" class="form-control" type="text" name="software[]" >\
					</div>';
		celda2.innerHTML = '<div class="input-group">\
								<label>Basico</label>\
								<input type="radio" class="flat-red" value="basico" name="nivel_software['+contador+']">\
							</div>';
		celda3.innerHTML = '<div class="input-group">\
								<label>Medio</label>\
								<input type="radio" class="flat-red" value="usuario" name="nivel_software['+contador+']">\
							</div>';
		celda4.innerHTML = '<div class="input-group">\
								<label>Alto</label>\
								<input type="radio" class="flat-red" value="experto" name="nivel_software['+contador+']">\
							</div>';
		estiloRadio();
	}

	function removerFilaFA(){
		if (!confirm('¿Esta seguro que desea eliminar este campo?')) {
			return ;
		}
		var parent = $("#tabla_academica");
		var hidden_value = $(parent).find("tr").last().find("input:hidden").val();
		var table = document.getElementById(parent);

		if(table.rows.length > 2){
			eliminarDOM(table);
			if(hidden_value != 0 && hidden_value > 0 && hidden_value != ""){
				json_data = {
					campo: 	parent,
					id: 	hidden_value
				};

				eliminarDatosBD(json_data);
			}
		}else{
			alert("Debes tener al menos un campo en formación académica.");
		}
	}

	function removerFila(parent){
	
		if (!confirm('¿De verdad Desea eliminar esta fila?')) {
			return ;
		}

		var hidden_value = $("#"+parent).find("tr").last().find("input:hidden").val();
		var table = document.getElementById(parent);
		
		if(table.rows.length > 0){
			eliminarDOM(table);
			if(hidden_value != 0 && hidden_value > 0 && hidden_value != ""){
				json_data = {
					campo: 	parent,
					id: 	hidden_value
				};

				eliminarDatosBD(json_data);
			}
		}
	}

	function eliminarDOM(table){
		table.deleteRow(table.rows.length-1);
	}

	function eliminarDatosBD(json_data){

		$.post(baseURL('curriculum/borrar'),
			json_data,
			function(data){
				if(data == ""){
					alert("Campo eliminado");
				}else{
					alert("Ha ocurrido un error y no se ha podido procesar la petición.");
					console.log(data);
				}
			},
			"text");
	}

	function agregarTitulo(){
		var titulo = prompt("Digita el nombre del titulo","");
		
		if(titulo != null){
			registrarTitulo(titulo);
			cargarTitulos($(".titulo"));
		}
		
	}

	$("#form_guardar_curriculum").submit(function(e){
		e.preventDefault();
		validarForm(this,$("#respuesta"));
	});

	estiloRadio();
	function estiloRadio(){
		 //Flat red color scheme for iCheck
        $('input[type="radio"].flat-red').iCheck({
          checkboxClass: 'icheckbox_flat-green',
          radioClass: 'iradio_flat-green'
        });
	}
</script>