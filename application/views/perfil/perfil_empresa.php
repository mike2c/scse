<div class="container">
	<section class="content-header">
		<h1>Perfil de <small>Empresa</small></h1>
	</section>
	<div class="content">
		<div class="row">
			<div class="col-md-3">
				<div class="box box-primary">
					<form class="hidden-content" action="<?=base_url('perfil/cambiar_imagen_perfil')?>" id="form_cambiar_imagen" method="post">
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
						<h3 class="profile-username text-center"><?=$perfil->nombre_empresa?></h3>
						<ul class="list-group list-group-unbordered">
							<li class="list-group-item"><a href="<?=base_url('perfil')?>">Mi Perfil</a></b></li>
							<li class="list-group-item"><a href="<?=base_url('correo')?>">Mensajes</a></b></li>
							<li class="list-group-item"><a href="javascript:listar_fichas();">Fichas publicadas</a></b></li>
						</ul>
						
						<a class="btn btn-primary btn-block" href="<?=base_url('sesion/cerrar_sesion')?>">cerrar sesión</a>
					</div>
					
				</div>
			</div>
			<div class="col-md-9" id="contenido">
				<div id="alert" class="hidden-content alert alert-warning alert-dismissable">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
					<h4>ERROR:</h4>
					<p></p>
				</div>
				<div class="nav-tabs-custom">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#miperfil" data-toggle="tab" aria-expanded="true">Mi perfil</a></li>
						<li><a href="#seguridad" data-toggle="tab" aria-expanded="false">Seguridad</a></li>
						
					</ul>
					<div class="tab-content">
						<!--Panel de mi perfil-->
						<div class="active tab-pane" id="miperfil">
							<form class="form-horizontal" id='form_actualizar_perfil' action="<?=base_url('empresa/actualizar_perfil')?>" method='post'>
								<input type="hidden" name="empresa_id" value="<?=$perfil->empresa_id?>" id="empresa_id">
								<input type="hidden" name="contacto_id" value="<?=$perfil->contacto_id?>" id="contacto_id">
								<input type="hidden" name="usuario_id" value="<?=$perfil->usuario_id?>" id="usuario_id">
								<input type="hidden" name="municipio_id" value="<?=$perfil->municipio_id?>" id="municipio_id">
								<input type="hidden" name="departamento_id" value="<?=$perfil->departamento_id?>" id="departamento_id">
								<input type="hidden" name="sociedad_id" value="<?=$perfil->sociedad_id?>" id="sociedad_id">

								<div class="form-group">
									<label class="control-label col-sm-2">Numero ruc</label>
									<div class="col-sm-6">
										<input value=<?=$perfil->ruc?> id="ruc" name="ruc" type="text" class="form-control input-sm">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">Nombre</label>
									<div class="col-sm-6">
										<input placeholder="nombre de la empresa" name="nombre_empresa" type="text" class="form-control input-sm" value="<?=$perfil->nombre_empresa?>">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">Sitio web</label>
									<div class="col-sm-6">
										<input value="<?=$perfil->sitio_web?>" placeholder="sitio web" name="sitio_web" type="text" class="form-control input-sm">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">Tipo de organización</label>
									<div class="col-sm-6" id="sd">
										<div class="input-group">
											<div id="sociedad_area">
												
											</div>
											<div class="input-group-btn">
												<button onclick="registrar_sociedad()" type="button" class="btn btn-info btn-sm btn-flat">Nueva</button>
											</div>
										</div>
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
									<div class="col-sm-6 col-sm-offset-2">
										<input type="submit" value="Actualizar" class="btn btn-primary btn-sm">
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
									<div class="col-md-5">
										<input name='clave_actual' type="password" class="form-control input-sm">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2">Nueva contraseña</label>
									<div class="col-md-5">
										<input name='clave_nueva' type="password" class="form-control input-sm">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2">Confirmar contraseña</label>
									<div class="col-md-5">
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
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--Cargando plugins-->
<link rel="stylesheet" type="text/css" href="<?=base_url('plugins/bootstrap-toggle/css/bootstrap-toggle.min.css')?>">
<script type="text/javascript" src="<?=base_url('plugins/bootstrap-toggle/js/bootstrap-toggle.min.js')?>"></script>
<script type="text/javascript" src="<?=base_url('dist/js/listas.js')?>"></script>
<script type="text/javascript" src="<?=base_url('dist/js/validar.js')?>"></script>
<script type="text/javascript" src="<?=base_url('plugins/jquery.mask/jquery.mask.js')?>"></script>
<script>
	$(".tel").mask('0000-0000', {placeholder:'0000-0000'});
	$(".cedula").mask('000-000000-0000A',
		{placeholder: '000-000000-0000L'});
	$("#fecha_nacimiento").datepicker();
	$("#ruc").mask('AAAAAAAAAA-AAAA',{placeholder: '0000000000-0000'});
	function cambiar_imagen(){
		$("#imagen").trigger("click");
	}
	$("#imagen").change(function(){
		$("#form_cambiar_imagen").submit();
	});
	listar_departamentos("<?=$perfil->departamento_id?>",null,'form-control input-sm');
	listar_municipios($("#departamento").val(),<?=$perfil->municipio_id?>,null,'form-control input-sm');
	listar_sociedades("<?=$perfil->sociedad_id?>",null,'form-control input-sm');

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