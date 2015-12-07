<div class="container">
	<section class="content-header">
		<h1>Perfil de <small>Publicador</small></h1>
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
						<h3 class="profile-username text-center"><?=$perfil->nombre . ' '. $perfil->apellido?></h3>
						<p class="text-muted text-center"><?=$perfil->cargo?></p>
						<ul class="list-group list-group-unbordered">
							<li class="list-group-item"><a href="<?=base_url('perfil')?>">Mi Perfil</a></b></li>
							<li class="list-group-item"><a href="<?=base_url('correo')?>">Mensajes</a></b></li>

							<li class="list-group-item"><a href="javascript:listar_cursos();">Cursos publicados</a></b></li>
							<li class="list-group-item"><a href="javascript:listar_fichas();">Fichas publicados</a></b></li>
							<li class="list-group-item"><a href="javascript:listar_becas();">Becas publicados</a></b></li>
						</ul>
						
						<a class="btn btn-primary btn-block" href="<?=base_url('sesion/cerrar_sesion')?>">cerrar sesión</a>
					</div>
					
				</div>
			</div>
			<div class="col-md-9" id="contenido">
				<div id="alert" class="alert alert-danger alert-dismissable hidden-content">
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
							<form class="form-horizontal" id='form_actualizar_perfil' action="<?=base_url('publicador/actualizar_perfil')?>" method='post'>
								<input type="hidden" name="publicador_id" value="<?=$perfil->publicador_id?>" id="publicador_id">
								<input type="hidden" name="usuario_id" value="<?=$perfil->usuario_id?>" id="usuario_id">
								<input type="hidden" name="persona_id" value="<?=$perfil->persona_id?>" id="persona_id">
								
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
								
								<!--Selección de area-->
								<div class="form-group">
									<label class="control-label col-sm-2">Area</label>
									<div class="col-sm-6" id="sd">
										<div class="input-group">
											<div id="area_area">
												
											</div>
											<div class="input-group-btn">
												<button onclick="registrar_area()" type="button" class="btn btn-info btn-sm btn-flat">Nueva</button>
											</div>
										</div>
									</div>
								</div>
								
								<!--Selección de cargo-->
								<div class="form-group">
									<label class="control-label col-sm-2">Cargo</label>
									<div class="col-sm-6" id="sd">
										<div class="input-group">
											<div id="cargo_area">
												
											</div>
											<div class="input-group-btn">
												<button onclick="registrar_cargo()" type="button" class="btn btn-info btn-sm btn-flat">Nueva</button>
											</div>
										</div>
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-6 col-sm-offset-2">
										<button type="submit" class="btn btn-primary btn-sm">actualizar</button>
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
<script type="text/javascript" src="<?=base_url('dist/js/publicaciones.js')?>"></script>
<script type="text/javascript" src="<?=base_url('dist/js/validar.js')?>"></script>
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
	listar_areas("<?=$perfil->area_id?>",null,'form-control input-sm');
	listar_cargos($("#area").val(),<?=$perfil->cargo_id?>,null,'form-control input-sm');

	$("#form_actualizar_perfil").submit(function(e){
		e.preventDefault();
		if(!$("#area").length){
			alert("Selecciona una area");
			return;
		}
		if(!$("#cargo").length){
			alert("Selecciona un cargo");
			return;
		}
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
<?php
	if(isset($_GET["page"])){
		if ($_GET["page"] == "fichas") {
			?>
				<script>listar_fichas();</script>
			<?
		}elseif($_GET["page"] == "cursos") {
			?>
				<script>listar_cursos();</script>
			<?
		}if ($_GET["page"] == "becas") {
			?>
				<script>listar_becas();</script>
			<?
		}
	}
?>