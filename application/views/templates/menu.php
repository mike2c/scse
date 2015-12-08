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
								<a href="<?= base_url('egresado/listado') ?>">Lista de egresados</a>
								<a href="<?= base_url('page/informacion_egresados') ?>">Información para egresados</a>
								<a href="<?= base_url('page/informacion_empresas') ?>">Información para empresas</a>
							</li>
						</ul>
					</li>
					<li><a href="<?=base_url('Publicaciones/cursos')?>">Cursos</a></li>
					<li><a href="<?=base_url('Publicaciones/becas')?>">Becas</a></li>
					<?php
						if(sesionIniciada()){
							if(esEgresado()){
								?>
								<li><a href="<?=base_url('Publicaciones/bolsa_de_trabajo')?>">Bolsa de trabajo</a></li>
								<?
							}
						}
					?>
					<li><a href="#">Registro</a>
						<ul>
							<li>
								<a href="<?= base_url('page/registrar_empresa') ?>">Registrar empresa</a>
								<a href="<?= base_url('page/autenticar_egresado') ?>">Autenticar egresado</a>

							</li>
						</ul>
					</li>
					<li><a href="<?=base_url('page/contacto')?>">Contacto</a></li>
					<?php
						if(!sesionIniciada()){
							?>
								<li><a href="<?=base_url('sesion/iniciar_sesion')?>">Login</a></li>
							<?
						}
					?>
				</ul>
				<div class="dropdown menu-perfil pull-right">
					<a href="#" data-toggle="dropdown"><?=getNombre()?> <i class="glyphicon glyphicon-menu-down"></i></a>
					<ul class="dropdown-menu">
						<li class="menu-header">
							<?php
								if(!file_exists('uploads/'. getImagenPerfil())){
									?><img src="<?=base_url('dist/img/no_image.gif')?>" alt="" class="img-circle"><?
								}else{
									?><img src="<?=base_url('uploads/'. getImagenPerfil())?>" alt="" class="img-circle"><?
								}
							?>
							<p><?=getNombreCompleto()?>
								<small><?=getCorreo()?></small>
							</p>
						</li>
						<li class="menu-footer">
							<div class="pull-left">
								<a href="<?=base_url('perfil')?>" class="btn btn-default btn-flat">Mi perfil</a>
							</div>
							<div class="pull-right">
								<a href="<?=base_url('sesion/cerrar_sesion')?>" class="btn btn-default btn-flat">Cerrar sesión</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</nav>