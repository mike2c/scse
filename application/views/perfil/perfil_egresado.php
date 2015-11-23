<div class="container">
	<section class="content-header">
		<h1>Perfil de usuario</h1>
	</section>
	<div class="content">
		<div class="row">
			<div class="col-md-3">
				<div class="box box-primary">
					<form class="hidden-content" action="<??>" id="form_cambiar_imagen" method="post">
						<input type="file" name="imagen" id="imagen">
					</form>
					<div class="box-body box-profile">
					
						<img src="<?=base_url('dist/img/no_image.gif')?>" alt="" class="profile-user-img img-responsive img-circle">
						<a class="profile-change-image" href="javascript:cambiar_imagen()"><span class="glyphicon glyphicon-camera"></span> cambiar imagen</a>
						<h3 class="profile-username text-center"><?="Miguel Angel Castillo Cornejo"?></h3>
						<p class="text-muted text-center"><?="Ingeniero de Sistemas"?></p>
						<ul class="list-group list-group-unbordered">
							<li class="list-group-item"><a href="<?=base_url()?>">Mi Perfil</a></b></li>
							<li class="list-group-item"><a href="<?=base_url()?>">Curriculum</a></b></li>
							<li class="list-group-item"><a href="<?=base_url()?>">Mensajes</a></b></li>
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
								<div class="form-group">
									<label class="control-label col-sm-2">Cedula</label>
									<div class="col-sm-6">
										<input value=<?=$perfil->cedula?> name="cedula" type="text" class="form-control input-sm cedula">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">Nombre</label>
									<div class="col-sm-6">
										<input value=<?=$perfil->nombre?> placeholder="nombre" name="nombre" type="text" class="form-control input-sm">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">Apellido</label>
									<div class="col-sm-6">
										<input value=<?=$perfil->apellido?> placeholder="apellido" name="apellido" type="text" class="form-control input-sm">
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
										<input value="<?=$perfil->carnet?>" placeholder="0000-00000" name="carnet" type="text" class="form-control input-sm">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">Carrera</label>
									<div class="col-sm-6">
										<select class="form-control input-sm" name="carrera" id="carrera">
											<option value="M">Masculino</option>
											<option value="F">Femenino</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">F. de egresado</label>
									<div class="col-sm-6">
										<input autocomplete="off" placeholder="año" type="text" class="form-control input-sm">
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
							</div>
							
							<form class="form-horizontal" id="form_cambiar_clave" action="<?=base_url('perfil/cambiar_clave');?>">
								<p class="help-block">Cambiar contraseña</p>
								<div class="form-group">
									<label class="control-label col-md-3">Contraseña actual</label>
									<div class="col-md-5">
										<input name='clave_actual' type="password" class="form-control input-sm">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">Nueva contraseña</label>
									<div class="col-md-5">
										<input name='clave_nueva' type="password" class="form-control input-sm">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">Confirmar contraseña</label>
									<div class="col-md-5">
										<input name='clave_repetida' type="password" class="form-control input-sm">
									</div>
								</div>
							</form>
						</div>

						<!--Panel de privacidad-->
						<div class="tab-pane" id="privacidad">
							<p>prueba 2</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--Cargando plugins-->
<script type="text/javascript" src="<?=base_url('dist/js/listas.js')?>"></script>
<script type="text/javascript" src="<?=base_url('plugins/jquery.mask/jquery.mask.js')?>"></script>
<script>
	$(".tel").mask('0000-0000', {placeholder:'0000-0000'});
	$(".cedula").mask('000-000000-0000A',
		{placeholder: '000-000000-0000L'});
	$("#fecha_nacimiento").datepicker();

	function cambiar_imagen(){
		$("#imagen").trigger("click");
	}
	$("#imagen").change(function(){
		$("#form_cambiar_imagen").submit();
	});
	listar_departamentos("<?=$perfil->departamento_id?>",null,'form-control');
	listar_municipios($("#departamento").val(),<?=$perfil->municipio_id?>,null,'form-control');
</script>
<style>
	body{
		overflow-y: scroll;
	}
</style>