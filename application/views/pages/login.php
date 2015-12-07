<br>
<div class="login-box">
	<div class="login-logo">
		<b>Iniciar</b> sesión
	</div>
	<div class="login-box-body">
		<form action="<?=base_url('sesion/iniciar_sesion')?>" method="post">
			<?php
				if(isset($login_errors) and !empty($login_errors)){
					?>
					<div class="panel panel-danger">
						<div class="panel-body text-danger">
							<h3>ERROR:</h3>
							<?php
								echo $login_errors;
							?>
						</div>
					</div>
					<?
				}
			?>
			<div class="form-group has-feedback">
				<input required type="email" class="form-control" placeholder="correo" name="correo">
				<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
				<input required type="password" class="form-control" placeholder="contraseña" name="clave">
				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<button class="btn btn-primary btn-flat" type="submit">Aceptar</button>
			<hr>
			<a href="<?=base_url()?>">He olvidado mi contraseña</a>
			<br>
			<a href="<?=base_url()?>">Registrarme (empresa)</a>
		</form>
	</div>
</div>
<style type="text/css">
	.login-box{
		margin-top: 0px;
	}
</style>