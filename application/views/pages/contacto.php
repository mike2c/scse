<div class="container">
	<section class="invoice">
		<div class="row">
			<div class="col-md-12 col-lg-12">
				<h2 class="page-header">Contacto</h2>
				<p class="help-block">Si tienes alguna duda o problema puedes consultar por medio del siguiente formulario.<br>Un administrador te responderá a tu correo electrónico lo antes posible,asegurate de ingresar un correo valido o propio.</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-lg-6">
				<form action="<?=base_url('Mensaje/mensajeContacto')?>" method="post">
					<div class="form-group has-feedback">
						<input placeholder="nombre" type="text" name="nombre" class="form-control"
						<?php
							if(sesionIniciada()){
								echo "value='".getNombreCompleto()."' disabled";
							}
						?>>
					</div>
					<div class="form-group ">
						<input placeholder="correo" type="text" name="correo" class="form-control"
						<?php
							if(sesionIniciada()){
								echo "value='".getCorreo()."' disabled";
							}
						?>>
					</div>
					<div class="form-group ">
						<input placeholder="asunto" type="text" name="asunto" class="form-control">
					</div>
					<div class="form-group">
						<textarea placeholder="mensaje" name="mensaje" id="mensaje" rows=5 class="form-control"></textarea>
					</div>
					<button class="btn btn-primary">Enviar mensaje</button>
		
				</form>
			</div>
		</div>
	</section>
</div>