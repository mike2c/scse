<nav id="menu_superior">
	<div class="container">
		<!--<div class="row">
			<div class="col-md-2 col-lg-2">
				
			</div>
			<div class="col-md-8 col-lg-8">
				<center>
					<h2>Universidad Nacional de Ingenieria</h2>
					<h4>Recinto Universitario Augusto César Sandino</h4>
					<h5>Sistema de control y seguimiento de egresados</h5>
				</center>
			</div>
		</div>-->
		<div class="row">
			<div class="col-md-12 col-lg-12">
				<ul class="menu">
					<li class="active"><a href="<?=base_url()?>">Inicio</a></li>
					<li><a href="#">Informacion</a>
						<ul>
							<li>
								<a href="<?= base_url('page/informacion_egresados') ?>">Información para egresados</a>
								<a href="<?= base_url('page/informacion_empresas') ?>">Información para empresas</a>
							</li>
						</ul>
					</li>
					<li><a href="<?=base_url('Publicaciones/Cursos')?>">Cursos</a></li>
					<li><a href="<?=base_url('Publicaciones/Becas')?>">Becas</a></li>
					<li><a href="<?=base_url('registro')?>">Registro</a>
						<ul>
							<li>
								<a href="<?= base_url('page/informacion_egresados') ?>">Registrar empresa</a>
								<a href="<?= base_url('page/informacion_empresas') ?>">Autenticar egresado</a>
							</li>
						</ul>
					</li>
					<li><a href="<?=base_url('page/contacto')?>">Contacto</a></li>
					<li><a href="<?=base_url('sesion/iniciar_sesion')?>">Login</a></li>
				</ul>
			</div>
		</div>
	</div>
</nav>