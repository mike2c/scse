<div class="container">
	<section class="content-header">
		<h1>Perfil de <small>Egresado</small></h1>
	</section>
	<div class="content">
		<div class="row">
			<div class="col-md-3">
				<div class="box box-primary">
					<form class="hidden-content" action="<?=base_url('perfil/cambiar_imagen_perfil')?>" id="form_cambiar_imagen" method="post" enctype="multipart/form-data">
						<input type="file" name="imagen" id="imagen">
					</form>
					<div class="box-body box-profile">
						<?php
							if(!file_exists('uploads/'. getImagenPerfil())){
								?><img src="<?=base_url('dist/img/no_image.gif')?>" alt="" class="profile-user-img img-responsive img-circle"><?
							}else{
								?><img src="<?=base_url('uploads/'. getImagenPerfil())?>" alt="" class="profile-user-img img-responsive img-circle"><?
							}
						?>
						<a class="profile-change-image" href="javascript:cambiar_imagen()"><span class="glyphicon glyphicon-camera"></span> cambiar imagen</a>
						<h3 class="profile-username text-center"><?=$perfil->nombre. ' '. $perfil->apellido?></h3>
						<p class="text-muted text-center"><?=$perfil->carrera?></p>
						<ul class="list-group list-group-unbordered">
							<li class="list-group-item"><a href="<?=base_url('perfil')?>">Mi Perfil</a></b></li>
							<li class="list-group-item"><a href="<?=base_url('Curriculum')?>">Curriculum</a></b></li>
							<li class="list-group-item"><a href="<?=base_url('correo')?>">Mensajes</a></b></li>
						</ul>
						
						<a class="btn btn-primary btn-block" href="<?=base_url('sesion/cerrar_sesion')?>">cerrar sesión</a>
					</div>
					
				</div>
			</div>
			<div class="col-md-9">
				<div id="alert" class="alert alert-danger alert-dismissable hidden-content">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
					<h4>ERROR:</h4>
					<p></p>
				</div>
				<div class="nav-tabs-custom">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#miperfil" data-toggle="tab" aria-expanded="true">Mi perfil</a></li>
						<li><a href="#seguridad" data-toggle="tab" aria-expanded="false">Seguridad</a></li>
						<li><a href="#privacidad" data-toggle="tab" aria-expanded="false">Privacidad</a></li>
					</ul>
					<div class="tab-content">
						<!--Panel de mi perfil-->
						<div class="active tab-pane" id="miperfil">
							<form class="form-horizontal" id='form_actualizar_perfil' action="<?=base_url('egresado/actualizar_perfil')?>" method='post'>
								<input type="hidden" name="egresado_id" value="<?=$perfil->egresado_id?>" id="egresado_id">
								<input type="hidden" name="contacto_id" value="<?=$perfil->contacto_id?>" id="contacto_id">
								<input type="hidden" name="usuario_id" value="<?=$perfil->usuario_id?>" id="usuario_id">
								<input type="hidden" name="municipio_id" value="<?=$perfil->municipio_id?>" id="municipio_id">
								<input type="hidden" name="departamento_id" value="<?=$perfil->departamento_id?>" id="departamento_id">
								<input type="hidden" name="carrera_id" value="<?=$perfil->carrera_id?>" id="carrera_id">
								<input type="hidden" name="persona_id" value="<?=$perfil->persona_id?>" id="persona_id">
								
								<div class="form-group">
									<label class="control-label col-sm-2">Cedula</label>
									<div class="col-sm-6">
										<input value="<?=$perfil->cedula?>" name="cedula" type="text" class="form-control input-sm cedula">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">Nombre</label>
									<div class="col-sm-6">
										<input value="<?=$perfil->nombre?>" placeholder="nombre" name="nombre" type="text" class="form-control input-sm">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">Apellido</label>
									<div class="col-sm-6">
										<input value="<?=$perfil->apellido?>" placeholder="apellido" name="apellido" type="text" class="form-control input-sm">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">Genero</label>
									<div class="col-sm-6">
										<select class="form-control input-sm" name="genero" id="genero">
											<option value="M" <?=($perfil->sexo == "M")? 'selected' : '';?>>Masculino</option>
											<option value="F" <?=($perfil->sexo == "F")? 'selected' : '';?>>Femenino</option>
										</select>
									</div>
								</div>
								<div class="form-group has-feedback">
									<label class="control-label col-sm-2">F. de nacimiento</label>
									<div class="col-sm-6">
										<input value="<?=date_toDMY($perfil->fecha_nacimiento)?>" autocomplete="off" placeholder="dia/mes/año" type="text" name="fecha_nacimiento" id="fecha_nacimiento" class="form-control input-sm">
										<span class="glyphicon glyphicon-calendar form-control-feedback"></span>
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-2">Carnet</label>
									<div class="col-sm-6">
										<input disabled value="<?=$perfil->carnet?>" placeholder="0000-00000" type="text" class="form-control input-sm">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">Carrera</label>
									<div class="col-sm-6">
										<div id="carrera_area">
											
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">F. de egresado</label>
									<div class="col-sm-6">
										<input placeholder="Fecha de egresado: Año" id="fecha_egresado" autocomplete="off" placeholder="año" type="text" class="form-control input-sm">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">Telefono</label>
									<div class="col-sm-6">
										<input value="<?=$perfil->telefono?>" placeholder="0000-0000" name="telefono" type="text" class="form-control input-sm tel">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">Celular</label>
									<div class="col-sm-6">
										<input value="<?=$perfil->celular?>" placeholder="0000-0000" name="celular" type="text" class="form-control input-sm tel">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">Departamento</label>
									<div class="col-sm-6" id="departamento_area">
										
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">Municipio</label>
									<div class="col-sm-6" id="municipio_area">
									
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">Direccion</label>
									<div class="col-sm-6">
										<textarea class="form-control" name="direccion" id="direccion" rows="2"><?=$perfil->direccion?></textarea>
									</div>
								</div>
								<div class="form-group">
									<?php
										if($perfil->trabaja){
											?>
											<div class="checkbox">
												<label class="col-sm-offset-2"><input checked type="checkbox" value="true" name="trabaja">Actualmente me encuentro trabajando</label>
											</div>
											<?
										}else{
											?>
											<div class="checkbox">
												<label class="col-sm-offset-2"><input type="checkbox" value="true" name="trabaja">Actualmente me encuentro trabajando</label>
											</div>
											<?
										}
									?>
									<?php
										if($perfil->titulado){
											?>
											<div class="checkbox">
												<label class="col-sm-offset-2">	<input checked type="checkbox" value="true" name="titulado">Ya poseo el titulo de mi carrera</label>
											</div>
											<?
										}else{
											?>
											<div class="checkbox">
												<label class="col-sm-offset-2">	<input type="checkbox" value="true" name="titulado">Ya poseo el titulo de mi carrera</label>
											</div>
											<?
										}
									?>
								</div>
								<div class="form-group">
									<div class="col-sm-6 col-sm-offset-2">
										<button type="submit" class="btn btn-primary btn-sm">guardar cambios</button>
									</div>
								</div>

							</form>							
						</div>

						<!--Panel de seguridad-->
						<div class="tab-pane" id="seguridad">
							<div class="form-horizontal">
								<p class="help-block">Cambiar correo</p>
								<div class="form-group">
									<label class="control-label col-md-2">Correo</label>
									<div class="col-md-6">
										<input value="<?=$perfil->correo?>" form="form_actualizar_perfil" name="correo" type="text" class="form-control input-sm">
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-6 col-md-offset-2">
										<button form="form_actualizar_perfil" class="btn btn-primary btn-sm">cambiar correo</button>
									</div>
								</div>
							</div>
							
							<form class="form-horizontal" id="form_cambiar_clave" action="<?=base_url('perfil/cambiar_clave');?>">
								<p class="help-block">Cambiar contraseña</p>
								<div class="form-group">
									<label class="control-label col-md-2">Contraseña actual</label>
									<div class="col-md-6">
										<input name='clave_actual' type="password" class="form-control input-sm">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2">Nueva contraseña</label>
									<div class="col-md-6">
										<input name='clave_nueva' type="password" class="form-control input-sm">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2">Confirmar contraseña</label>
									<div class="col-md-6">
										<input name='clave_repetida' type="password" class="form-control input-sm">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<div id="alert2" class="hidden-content alert alert-warning alert-dismissable">
											<button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
											<h4>ERROR:</h4>
											<p></p>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-5">
										<button class="btn btn-primary btn-sm" type="submit">cambiar clave</button>
									</div>
								</div>
							</form>
						</div>

						<!--Panel de privacidad-->
						<div class="tab-pane" id="privacidad">
							<div class="form-horizontal">
								<div class="form-group">
									<label class="col-sm-3 control-label">Foto de perfil</label>
									<div class="col-sm-5">
										<select form="form_actualizar_perfil" class="form-control" name="visibilidad_foto" id="visibilidad_foto">
											<option <?=($privacidad['foto_perfil'] == "publica") ? "selected" : ""?> value="publica"><i class=""></i> Publica</option>
											<option <?=($privacidad['foto_perfil'] == "empresas") ? "selected" : ""?> value="empresas"><i class=""></i> Empresas únicamente</option>
											<option <?=($privacidad['foto_perfil'] == "privada") ? "selected" : ""?> value="privada"><i class=""></i> Privada</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Información de contacto</label>
									<div class="col-sm-5">
										<select form="form_actualizar_perfil" class="form-control" name="visibilidad_contacto" id="visibilidad_contacto">
											<option <?=($privacidad['info_contacto'] == "publica") ? "selected" : ""?> value="publica"><i class=""></i> Publica</option>
											<option <?=($privacidad['info_contacto'] == "empresas") ? "selected" : ""?> value="empresas"><i class=""></i> Empresas únicamente</option>
											<option <?=($privacidad['info_contacto'] == "privada") ? "selected" : ""?> value="privada"><i class=""></i> Privada</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Información de ubicación</label>
									<div class="col-sm-5">
										<select form="form_actualizar_perfil" class="form-control" name="visibilidad_ubicacion" id="visibilidad_ubicacion">
											<option <?=($privacidad['info_ubicacion'] == "publica") ? "selected" : ""?> value="publica"><i class=""></i> Publica</option>
											<option <?=($privacidad['info_ubicacion'] == "empresas") ? "selected" : ""?> value="empresas"><i class=""></i> Empresas únicamente</option>
											<option <?=($privacidad['info_ubicacion'] == "privada") ? "selected" : ""?> value="privada"><i class=""></i> Privada</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Información de curriculum</label>
									<div class="col-sm-5">
										<select form="form_actualizar_perfil" class="form-control" name="visibilidad_curriculum" id="visibilidad_curriculum">
											<option <?=($privacidad['info_curriculum'] == "publica") ? "selected" : ""?> value="publica"><i class=""></i> Publica</option>
											<option <?=($privacidad['info_curriculum'] == "empresas") ? "selected" : ""?> value="empresas"><i class=""></i> Empresas únicamente</option>
											<option <?=($privacidad['info_curriculum'] == "privada") ? "selected" : ""?> value="privada"><i class=""></i> Privada</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Información adicional</label>
									<div class="col-sm-5">
										<select form="form_actualizar_perfil" class="form-control" name="visibilidad_info_adicional" id="visibilidad_info_adicional">
											<option <?=($privacidad['info_adicional'] == "publica") ? "selected" : ""?> value="publica"><i class=""></i> Publica</option>
											<option <?=($privacidad['info_adicional'] == "empresas") ? "selected" : ""?> value="empresas"><i class=""></i> Empresas únicamente</option>
											<option <?=($privacidad['info_adicional'] == "privada") ? "selected" : ""?> value="privada"><i class=""></i> Privada</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-5 col-sm-offset-3">
										<button form="form_actualizar_perfil" class="btn btn-primary btn-sm">guardar cambios</button>	
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--Cargando plugins-->
<script type="text/javascript" src="<?=base_url('dist/js/listas.js')?>"></script>
<script type="text/javascript" src="<?=base_url('dist/js/validar.js')?>"></script>
<script type="text/javascript" src="<?=base_url('plugins/jquery.mask/jquery.mask.js')?>"></script>
<script>
	$(".tel").mask('0000-0000', {placeholder:'0000-0000'});
	$(".cedula").mask('000-000000-0000A',
		{placeholder: '000-000000-0000L'});
	$("#fecha_egresado").mask('0000');
	$("#fecha_nacimiento").datepicker();

	function cambiar_imagen(){
		$("#imagen").trigger("click");
	}
	$("#imagen").change(function(){
		$("#form_cambiar_imagen").submit();
	});
	listar_departamentos("<?=$perfil->departamento_id?>",null,'form-control');
	listar_municipios($("#departamento").val(),<?=$perfil->municipio_id?>,null,'form-control');
	listar_carreras('<?=$perfil->carrera_id?>', null, 'form-control');
	$("#form_actualizar_perfil").submit(function(e){
		e.preventDefault();
		validar_form(this,$("#alert"));
	});
	$("#form_cambiar_clave").submit(function(e){
		e.preventDefault();
		validar_form(this,$("#alert2"));
	});
</script>
<style>
	body{
		overflow-y: scroll;
	}
</style>