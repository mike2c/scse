<div class="container">
	<div class="row">
		<div class="col-xs-12 col-xs-12">
			<section class="content-header">
				<h1>Información <strong><small>egresados</small></strong></h1>
			</section>
			<section class="content">
				<div class="box box-primary">
					
					<div class="box-body text-justify">
						<hp>El Recinto Universitario Augusto C. Sandino, sede regional del norte, Estelí – Nicaragua, está implementando un sistema para el control y seguimiento de sus estudiantes egresados y graduados con el objetivo de obtener información actualizada de estos. El sistema está diseñado para mantener informados a los egresados y graduados interesados en cursos libre y de posgrado que ofrece la universidad, así como las posibles oportunidades de empleo publicadas directamente por las empresas.</hp>
					</div>
					
					<div class="box-header with-border">
						<h3 class="box-title"><strong>Registro</strong></h3>
					</div>
					
					<div class="box-body text-justify">
						Para autenticar la cuenta de los egresados o graduados, sigue las instrucciones dadas en el siguiente <a href="<?php echo base_url('egresado/Autenticar') ?>"> enlace </a>
					</div>
					<div class="box-header with-border">
						<h3 class="box-title"><strong>Características</strong></h3>
					</div>

					<div class="box-body text-justify">
						<div id="accordion" class="box-group">

							<div class="panel box box-primary">
								<div class="box-header with-border">
									<h4 class="box-title">
										<a class="" href="#collapseOne" data-parent="#accordion" data-toggle="collapse" aria-expanded="true">
											Formar parte de la bolsa laboral con los CV de profesionales egresados y graduados del Recinto Universitario Augusto C. Sandino.
										</a>
									</h4>
								</div>

								<div id="collapseOne" class="panel-collapse collapse in" aria-expanded="true" style="">
									<div class="box-body">
										Al hacer click en el formulario de currículo desde el perfil de usuario, los egresados o graduados podrán crear su hoja de vida sin la tediosa necesidad de subir archivos, simplemente deben completar la información requerida por el formulario y guardarla.
										Una de las ventajas de esto es que podrán actualizar la información de sus currículos en cualquier momento sin necesidad de subir un archivo siempre que deseen agregar información en su currículo, volviendo este proceso más rápido y menos tedioso.
										Si aún no has completado el formulario de currículo, haz click <a href="<?= base_url('Curriculum/Crear') ?>">aquí.
									</div>
								</div>							
							</div>

							<div class="panel box box-primary">
								<div class="box-header with-border">
									<h4 class="box-title">
										<a class="collapsed" href="#collapseTwo" data-parent="#accordion" data-toggle="collapse" aria-expanded="false">
											Promover la inserción laboral por medio de ofertas laborales online.
										</a>
									</h4>
								</div>

								<div class="panel-collapse collapse" id="collapseTwo" aria-expanded="false" style="height:0px;">
									<div class="box-body">
										La bolsa de trabajo muestra las ofertas de empleo publicadas por las empresas, estas publicaciones estarán clasificadas según las carreras impartidas en el Recinto Universitario Augusto C. Sandino, esto con el fin de crear un filtro en las publicaciones y mostrar únicamente lo relevante a cada usuario.
										Los egresados y graduados tendrán la posibilidad de navegar en la bolsa de trabajo, y podrán enviar su currículo si creen que cumple con los requisitos del cargo ofertado.
										Si eres un egresado o graduado del Recinto Universitario Augusto C. Sandino te invitamos a que pruebes la <a href="<?= base_url('Publicaciones/BolsaDeTrabajo') ?>">bolsa de trabajo.</a>
									</div>
								</div>
							</div>

							<div class="panel box box-primary">
								<div class="box-header with-border">
									<h4 class="box-title">
										<a href="#collapseThree" class="collapsed" data-parent="#accordion" data-toggle="collapse" aria-expanded="false">
											Facilitar información relevante de los cursos libres y de posgrados, asi como las becas ofertadas por la universidad.
										</a>
									</h4>
								</div>

								<div class="panel-collapse collapse" id="collapseThree" aria-expanded="false">
									<div class="box-body">
										El apartado de Becas y cursos, muestra una breve descripción de los diferentes cursos libres o de posgrados impartidos en el Recinto Universitario Augusto C. Sandino así como las diferentes becas ofertadas.
										<br>Para ver los cursos ofertados has click <a href="<?=BASE_URL('Publicaciones/Cursos')?>">aquí</a>.
										<br>Para ver as becas disponibles has click <a href="<?=BASE_URL('Publicaciones/Becas')?>">aquí</a>.
									</div>
								</div>
							</div>

						</div>
					</div>

				</div>
			</section>
		</div>
	</div>
</div>