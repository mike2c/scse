<div class="container">
	<section class="content-header">
		<h1>Recuperar <strong><small>Contraseña</small></strong></h1>
	</section>
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">
					<div class="box-body text-justify">
						En caso de que hayas olvidado la contraseña de tu cuenta, ingresa en la caja de texto el correo electrónico con el que registraste en la página, a continuación te será enviada una contraseña a tu correo para que puedas ingresar al sistema.<br><br>
						<div class="col-md-offset-4">
							<form action="<?=base_url('Mensaje/recuperarPass')?>" class="form-inline" method="post" id="formRecuperarPass">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-envelope"></i>
									</span>
									<input type="email" class="form-control" name="correo" placeholder="ejemplo@gmail.com" id="correo">
								</div>
								<div class="input-group">
									<input type="submit" class="btn btn-primary" >
								</div>
							</form>
						</div>
						<br>
						<div class="col-md-offset-4">
							<?php
								if (isset($existe)||isset($no_existe)) {
									?>
									<div class="col-md-6 text-justify">
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
									<div class="col-md-6 text-justify">
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
			<div class="col-md-12">
				<div class="alert alert-info alert-dismissable text-justify">
					<button class="close" aria-hidden="true" data-dismiss="alert" type="button">x</button>
					<h4 >
						<i class="icon glyphicon glyphicon-info-sign"></i>
						Nota
					</h4>
					Te aconsejamos que no borres el correo que te será enviado, en caso de que olvides tu contraseña nuevamente podrás acceder con la contraseña almacenada en ese correo.
				</div>
			</div>
		</div>
	</section>
</div>