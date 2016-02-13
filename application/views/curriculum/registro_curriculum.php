<div class="container">
	<section class="content-header">
		<h1>Registrar <strong><small>Curriculum</small></strong></h1>
	</section>
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="alert alert-info alert-dismissable text-justify">
					<button class="close" aria-hidden="true" data-dismiss="alert" type="button">x</button>
					<h4>
						<i class="icon glyphicon glyphicon-info-sign"></i>
						Aviso
					</h4>
					Las secciones marcadas con el simbolo <small><span class="glyphicon glyphicon-asterisk"></span></small> son de caracter obligatorio, no olvides llenar sus campos.
				</div>
				<form id="form_guardar_curriculum" method="POST" action='<?=base_url('Curriculum/Guardar')?>'>
					<div class="box box-success">
						<div class="box-header with-border">
							<span class="glyphicon glyphicon-book"></span>
							<h3 class="box-title">Formación académica <small><span class="glyphicon glyphicon-asterisk"></span></small></h3>
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
										<tr>
											<td>1.</td>
											<td>
												<div class="input-group">
													<span class="input-group-addon">
														<i class="glyphicon glyphicon-bookmark"></i>
													</span>
													<div class="titulo"></div>
												</div>
											</td>
											<td>
												<div class="input-group">
													<span class="input-group-addon">
														<i class="fa fa-calendar-plus-o"></i>
													</span>
													<input class="form-control fecha" type="text" name="comienzo_formacion[]" >
												</div>
											</td>
											<td>
												<div class="input-group">
													<span class="input-group-addon">
														<i class="fa fa-calendar-times-o"></i>
													</span>
													<input class="form-control fecha" type="text" name="finalizacion_formacion[]" >
												</div>
											</td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<th></th>
											<th>
												<div class="input-group">
													<a href='javascript:nuevaFormacionAcademica()' class="btn btn-info btn-flat btn-sm" name='btn_agregar'>Agregar Fila</a>
													<a href='javascript:removerFila("tabla_academica")' class="btn btn-danger btn-flat btn-sm" name='btn_eliminar'>Eliminar Fila</a>
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
											<tr>
												<td>1.</td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">
															<i class="fa fa-contao"></i>
														</span>
														<input class="form-control" type="text" name="curso[]" >
													</div>
												</td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">
															<i class="fa fa-calendar-plus-o"></i>
														</span>
														<input class="form-control" type="text" name="comienzo_curso[]" >
													</div>
												</td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">
															<i class="fa fa-calendar-times-o"></i>
														</span>
														<input class="form-control" type="text" name="finalizacion_curso[]" >
													</div>
												</td>
											</tr>
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
											<tr>
												<td style="width:10px;">
													1.
												</td>
												<td style="width:500px;">
													<div class="input-group">
														<span class="input-group-addon">
															<i class="fa fa-language"></i>
														</span>
														<input placeholder='ejemplo: Ingles' class='form-control' type='text' name='idioma[]' >
													</div>
												</td>
												<td style="width:100px;">
													<div class="input-group">
														<label>Basico</label>
														<input type="radio" class="flat-red" value="basico" name="nivel_idioma[]">
													</div>
												</td>
												<td style="width:100px;">
													<div class="input-group">
														<label>Medio</label>
														<input type="radio" class="flat-red" value="medio" name="nivel_idioma[]">
													</div>
												</td>
												<td style="width:100px;"> 
													<div class="input-group">
														<label>Alto</label>
														<input type="radio" class="flat-red" value="alto" name="nivel_idioma[]">
													</div>
												</td>
											</tr>
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
											<tr>
												<td style="width:10px;">
													1.
												</td>
												<td style="width:500px;">
													<div class="input-group">
														<span class="input-group-addon">
															<i class="fa fa-laptop"></i>
														</span>
														<input placeholder='ejemplo: Microsoft Word' class='form-control' type='text' name='software[]' >
													</div>
												</td>
												<td style="width:100px;">
													<div class="input-group">
														<label>Basico</label>
														<input type="radio" class="flat-red" value="basico" name="nivel_software[]">
													</div>
												</td>
												<td style="width:100px;">
													<div class="input-group">
														<label>Medio</label>
														<input type="radio" class="flat-red" value="usuario" name="nivel_software[]">
													</div>
												</td>
												<td style="width:100px;"> 
													<div class="input-group">
														<label>Alto</label>
														<input type="radio" class="flat-red" value="experto" name="nivel_software[]">
													</div>
												</td>
											</tr>
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
						</div>
						<div id="respuesta">
							
						</div>
						<div class="box-footer">
							<div class="pull-right">
								<button class="btn btn-primary btn-flat" type="submit">Crear curriculum</button>
								<a class="btn btn-danger btn-flat" href="<?= base_url('Perfil')?>" >Cancelar</a>
							</div>
						</div>
					</div>
				</form>
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
<script type="text/javascript" src="<?=base_url()?>dist/js/curriculum.js"></script>
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
							<div class="titulo"></div>\
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
		cargarTitulos($('#tabla_academica').find(".titulo"));
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

	function removerFila(parent){
		var table = document.getElementById(parent);
		if(table.rows.length > 2){
			table.deleteRow(table.rows.length-1);
		}
	}

	function agregarTitulo(){
		var titulo = prompt("Digita el nombre del titulo","");
		
		if(titulo != null){
			registrarTitulo(titulo);
			cargarTitulos($(".titulo"));
		}
		
	}

	cargarTitulos($(".titulo"));
	function cargarTitulos(contenedor){
		$.ajax({
			url: "<?=base_url('Ajax/CargarTitulos')?>",
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

	$("#form_guardar_curriculum").submit(function(e){
		e.preventDefault();
		validar_form(this,$("#respuesta"));
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