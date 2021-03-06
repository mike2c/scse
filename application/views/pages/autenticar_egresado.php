<div class="container">
	<div class="row">
		<div class="col-md 12">
			<section class="content-header">
				<h1>Autenticación <strong>
				<small>de Egresados</small></strong></h1>
			</section>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">
				<div class="box-body">
					<p>
						La universidad ya cuenta con información básica de sus egresados que se obtiene por medio de registro academico.
						Digita tu correo electronico y verifica si se encuentra registrado en el sistema, si el correo ingresado se encuentra registrado se enviará un mensaje con
						la información para que puedas acceder y actualizar tu cuenta. <br><br>
					</p>
					<form action="<?=base_url('egresado/autenticar')?>" class="form-inline" method="post" id="formAutenticarEgresado">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-envelope"></i>
							</span>
							<input required type="email" class="form-control" name="correo" placeholder="ejemplo@gmail.com" id="correo">
						</div>
						<div class="input-group">
							<button type="submit" class="btn btn-primary">Autenticar</button>
						</div>
					</form>
					<br>
					<!--respuesta del servidor-->
					<?php
						if (isset($existe)||isset($no_existe)) {
							?>
							<div class="">
								<div class="alert alert-danger alert-dismissable text-justify">
									<button class="close" aria-hidden="true" data-dismiss="alert" type="button">x</button>
									<h4 >
										<i class="icon glyphicon glyphicon-ban-circle"></i>
										Error
									</h4>
									<?php 
										if (isset($existe)) {
											echo $existe;
										}else{
											echo $no_existe;
										}
									 ?>
								</div>
							</div>
							<?php
						}elseif (isset($success)) {
							?>
							<div class="">
								<div class="alert alert-success alert-dismissable text-justify">
									<button class="close" aria-hidden="true" data-dismiss="alert" type="button">x</button>
									<h4 >
										<i class="icon glyphicon glyphicon-ok"></i>
										éxito
									</h4>
									<?= $success ?>
								</div>
							</div>
							<?php
						}
					?>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="alert alert-info alert-dismissable text-justify">
				<button class="close" aria-hidden="true" data-dismiss="alert" type="button">x</button>
				<h4 >
					<i class="icon glyphicon glyphicon-info-sign"></i>
					Nota
				</h4>
				Si tu correo no se encuentra o no coincide con el que has proporcionado a la universidad, 
				puedes ponerte en contacto con el administrador del sitio u otra autoridad de la universidad desde <a href="<?=base_url('page/contacto')?>">aqui</a>, exponiendo el problema y adjuntandole 
				tu correo electronico para que este sea registrado en el sistema, recuerda proporcionar tu numero de carnet para que puedas ser identificado.
				Para obtener más información sobre las funciones y beneficios para los egresados haz click <a href="<?php echo base_url('page/informacion_egresados') ?>">aquí</a>
			</div>
		</div>
	</div>
</div>