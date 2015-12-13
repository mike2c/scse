<div class="container">
	<section class="content-header">
		<h1>Curriculum <strong><small>Vitae</small></strong></h1>
	</section>
	<section class="content">
		<div class="row">
			<?php
			if (!$existe_curriculum) {
			?>
				<div class="col-md-6">
					<div class="callout callout-info text-justify">
						<h4>
							Esta información no esta disponible en este momento.
						</h4>
					</div>
				</div>
			<?php
			}else{
			?>
				<div class="col-md-3">
					<div class="box box-primary">
						<div class="box-body box-profile">
							<?php
								if (file_exists("uploads/".$egresado->imagen)) {
									?>
									<img alt="Imagen del Usuario" class="profile-user-img img-responsive" src="<?=base_url("uploads/". $egresado->imagen)?>">
									<?php
								}else{
									?>
									<img src="<?=base_url("dist/img/no_image.gif")?>" class="profile-user-img img-responsive" alt="Imagen del Usuario">
									<?php
								}
							?>
							<h3 class="profile-username text-center"><?=$egresado->nombre. " ". $egresado->apellido?></h3>
							<p class="text-muted text-center"><?=$egresado->carrera?></p>
						</div>
						<div id="accordion" class="box-group">
							<div class="panel box box-primary">
								<div class="box-header with-border">
									<h4 class="box-title">
										<a href="#collapseOne" data-parent="#accordion" data-toggle="collapse">
											Información de Contacto
										</a>
									</h4>
								</div>
								<div class="panel-collapse collpase in" id="collapseOne">
									<div class="box-body">
										<strong>
											<i class="glyphicon glyphicon-earphone"></i>
											Teléfonos
										</strong>
										<p class="text-muted">
											<?=$egresado->telefono?><br>
											<?=$egresado->celular?>
										</p>
										<hr></hr>
										<strong>
											<i class="glyphicon glyphicon-envelope"></i>
											Correo
										</strong>
										<p class="text-muted">
											<?=$egresado->correo?>
										</p>
										<hr></hr>
										<strong>
											<i class="glyphicon glyphicon-map-marker"></i>
											Dirección
										</strong>
										<p class="text-muted">
											<?=$egresado->direccion?>
										</p>
									</div>
								</div>
							</div>

							<div class="panel box box-primary">
								<div class="box-header with-border">
									<h4 class="box-title">
										<a href="#collapseTwo" data-parent="#accordion" data-toggle="collapse">
											Idiomas
										</a>
									</h4>
								</div>
								<div class="panel-collapse collpase" id="collapseTwo">
									<div class="box-body">
										<?php
										if ($curriculum["idioma"] != null && !empty($curriculum["idioma"])) {
											echo "<table class='table table-hover table-default'>";
											echo "
											<thread>
												<tr role='row'>
												<th></th>
												<th>Nivel</th>
												</tr>
											</thread>
											";
											foreach($curriculum["idioma"]->result() as $row){
												?>
												<tr class="text-muted">
													<td><?=$row->idioma?></td>
													<td><?=$row->nivel?></td>
												</tr>
												<?php
											}
											echo "</table>";
										}else{
											echo "<p class='text-muted'>No Definidos.</p>";
										}
										?>
									</div>
								</div>
							</div>

							<div class="panel box box-primary">
								<div class="box-header with-border">
									<h4 class="box-title">
										<a href="#collapseThree" data-parent="#accordion" data-toggle="collapse">
											Informática
										</a>
									</h4>
								</div>
								<div class="panel-collapse collpase" id="collapseThree">
									<div class="box-body">
										<?php
										if ($curriculum["informatica"] != null && !empty($curriculum["informatica"])) {
											echo "<table class='table table-hover table-default'>";
											echo "
											<thread>
												<tr role='row'>
												<th></th>
												<th>Nivel</th>
												</tr>
											</thread>
											";
											foreach ($curriculum["informatica"]->result() as $row) {
												?>
												<tr class="text-muted">
													<td><?=$row->software?></td>
													<td><?=$row->nivel?></td>
												</tr>
												<?php
											}
											echo "</table>";
										}else{
											echo "<p class='text-muted'>No Definidos.</p>";
										}
										?>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-9">
					<div class="box box-primary">
						<div class="box-header with-border ">
							<div class="col-md-offset-3">
								<h1 class="box-title text-center">
									<span class="glyphicon glyphicon-education"></span><br>
									<strong>Educación</strong><br>
									<strong>Universidad Nacional de Ingeniería</strong><br>
									Recinto Universitario Augusto César Sandino
								</h1>
							</div>	
						</div>
						<div class="panel box box-primary">
							<div class="box-header with-border">
								<h4 class="box-title">
									<strong>
										Experiencia Laboral.
									</strong>
								</h4>
							</div>
							<div class="box-body">
								<?php
									if($curriculum["experiencia_laboral"] !== null && !empty($curriculum["experiencia_laboral"])){
										foreach ($curriculum["experiencia_laboral"]->result() as $row){
											
											echo "<h4 class='text-primary'><span class='glyphicon glyphicon-briefcase'></span> $row->empresa,</h4>";
											echo "<h5 class=''><strong>$row->cargo</strong></h5>";
											echo "<h5 class='text-muted'><span class=''>Periodo </span>$row->fecha_comienzo - $row->fecha_finalizacion</h5><br>";
										}
									}else{
										echo "<h5 class='text-center'><strong>Sin Experiencia Laboral</strong><br>";
									}
								?>
							</div>
						</div>

						<div class="panel box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">
									<strong>
										Formación Académica
									</strong>
								</h3>
							</div>
							<div class="box-body">
								<?php
									foreach ($curriculum["formacion_academica"]->result() as $row) {
										echo "<h4 class='text-primary'><span class='glyphicon glyphicon-book'></span> $row->titulo, <small>$row->fecha_comienzo - $row->fecha_finalizacion</small></h4><br>";
									}	
								?>
							</div>
						</div>

						<div class="panel box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">
									<strong>
										Formación Complementaria
									</strong>
								</h3>
							</div>
							<div class="box-body">
								<?php
									if($curriculum["formacion_complementaria"] !== null && !empty($curriculum["formacion_complementaria"])){
										foreach ($curriculum["formacion_complementaria"]->result() as $row) {
											echo "<h4 class='text-primary'><span class='glyphicon glyphicon-book'></span> $row->curso, <small>$row->fecha_comienzo - $row->fecha_finalizacion</small></h4><br>";
										}	
									}else{
										echo "<h3 class='text-center'><strong>Sin Fórmacion Complementaria</strong></h3><br>";
									}
								?>
							</div>
						</div>
					</div>
				</div>
			<?php
			}
			?>
		</div>
	</section>
</div>