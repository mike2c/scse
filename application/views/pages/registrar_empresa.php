<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<section class="content-header">
				<h1>Registro <strong><small>de Empresa</small></strong></h1>
			</section>		
		</div>
	</div>
	<section class="content">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Los campos marcados con <small><i class="glyphicon glyphicon-asterisk"></i></small> son obligatorios</h3>
					</div>
					<div class="box-body">
						<form action="<?=base_url('empresa/registro')?>" method="post" id="formRegistroEmpresa" name="formRegistroEmpresa">
							
							<label for="nombre_empresa">Nombre de la Empresa.</label>
							<div class="input-group">
								<span class="input-group-addon">
									<i class="glyphicon glyphicon-user"></i>
								</span>
								<input required autocomplete="off" name="nombre_empresa" class="form-control" type="text" placeholder="Nombre de la Empresa"></input>
								<span class="input-group-addon">
									<small><i class="glyphicon glyphicon-asterisk"></i></small>
								</span>
							</div>
							<br>

							<label for="correo">Correo Electronico.</label>
							<div class="input-group">
								<span class="input-group-addon">
									<i class="glyphicon glyphicon-envelope"></i>
								</span>
								<input class="form-control" pattern="^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$" placeholder="ejemplo@gmail.com" required autocomplete="off" type="email" name="correo">
								<span class="input-group-addon">
									<small><i class="glyphicon glyphicon-asterisk"></i></small>
								</span>
							</div>
							<br>

							<label for="clave">Contraseña</label>
							<div class="input-group">
								<span class="input-group-addon">
									<i class="glyphicon glyphicon-lock"></i>
								</span>
								<input class="form-control" placeholder="Contraseña" autocomplete="off" type="password" required name="clave">
								<span class="input-group-addon">
									<small><i class="glyphicon glyphicon-asterisk"></i></small>
								</span>
							</div>
							<br>

							<label for="clave_conf">Confirmar Contraseña</label>
							<div class="input-group">
								<span class="input-group-addon">
									<i class="glyphicon glyphicon-lock"></i>
								</span>
								<input class="form-control" placeholder="Confirmar Contraseña" autocomplete="off" type="password" required name="clave_conf">
								<span class="input-group-addon">
									<small><i class="glyphicon glyphicon-asterisk"></i></small>
								</span>
							</div>
							<br>

							<label for="telefono">Telefono</label>
							<div class="input-group">
								<span class="input-group-addon">
									<i class="glyphicon glyphicon-earphone"></i>
								</span>
								<input class="form-control" id="telefono" pattern="([0-9]{4})+[-]([0-9]{4})" placeholder="0000-0000" autocomplete="off" type="text" name="telefono">
							</div>
							<br>

							<label for="departamento">Departamento</label>
							<div class="input-group">
								<span class="input-group-addon">
									<i class="glyphicon glyphicon-map-marker"></i>
								</span>
								<div id="departamento_area"></div>
								<span class="input-group-addon">
									<small><i class="glyphicon glyphicon-asterisk"></i></small>
								</span>
							</div>
							<br>

							<label for="municipios">Municipios</label>
							<div class="input-group">
								<span class="input-group-addon">
									<i class="glyphicon glyphicon-map-marker"></i>
								</span>
								<div id="municipio_area"></div>
								<span class="input-group-addon">
									<small><i class="glyphicon glyphicon-asterisk"></i></small>
								</span>
							</div>
							<br>

							<label for="direccion">Dirección</label>
							<textarea style="resize:none;" class="form-control" autocomplete="off" name="direccion" rows="3" class="form-control"></textarea>
							<br>

							<input type="submit" class="btn btn-primary" value="Registrar">

						</form>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-md-offset-3">
				<div id="respuesta" class="box box-danger box-body hidden-content">

				</div>
			</div>
		</div>
	</section>
</div>
<script type="text/javascript" src="<?=base_url('dist/js/listas.js')?>"></script>
<script type="text/javascript" src="<?=base_url('dist/js/validar.js')?>"></script>
<script type="text/javascript" src="<?=base_url('plugins/jquery.mask/jquery.mask.js')?>"></script>
<script type="text/javascript">
	
	listar_departamentos(null,null,"form-control");
	listar_municipios($("#departamento").val(),null,null,"form-control");
	$("#formRegistroEmpresa").submit(function(e){
		e.preventDefault();
		validar_form(this,$("#respuesta"));
	});
	$(".active").removeClass("active");
	$("#menu_registro").addClass("active");

	$('#telefono').mask('0000-0000');
</script>