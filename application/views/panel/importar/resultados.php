<div class="container">
	<section class="content-header">
	  <h1>
		Resultado
		<small>importar egresados</small>
	  </h1>
	</section>
	<div class="content">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="text-primary">Informe de la operación</h3>
			</div>
			<div class="box-body">

				<h4 class="text-primary">Registros guardados correctamente <span class="pull-right"><?=count($correctos)?></span></h4>
				<br>
				<table class="table table-hover table-condensed">
					<tbody>
						<?php
					
							if(isset($correctos) && count($correctos) > 0){
								foreach ($correctos as $key => $value) {
									echo "<tr>
									<td><i class='fa fa-check-square text-success'></i></td>
									<td>$value[cedula]</td>
									<td>$value[carnet]</td>
									<td>$value[nombre] ". $value['apellido'] ."</td>
									<td>$value[correo]</td>
									</tr>";
								}
							}else{
								?>
									<div class="callout callout-danger">
					                    <h4>Mensaje</h4>
					                    <p>No se ha insertado ningún registro.</p>
				                  	</div>
								<?
							}
						?>
					</tbody>
				</table>
			</div>
			<div class="box-body">
				<h4 class="text-danger">Registros que no pudieron ser guardados <span class="pull-right"><?=count($invalidos)?></span></h4>
				<br>
				<table class="table table-hover table-condensed">
					<tbody>
						<?php

							if(isset($invalidos) && count($invalidos) > 0){
								foreach ($invalidos as $key => $value) {
									echo "<tr>
									<td><i class='fa fa-warning text-danger'></i></td>
									<td>$value[cedula]</td>
									<td>$value[carnet]</td>
									<td>$value[nombre] ". $value['apellido'] ."</td>
									<td>$value[correo]</td>
									<td class='text-danger'><b>$value[error]</b></td>
									</tr>";
								}
							}else{
								?>
									<div class="callout callout-success">
					                    <h4>Mensaje</h4>
					                    <p>No se han encontrado errores.</p>
				                	</div>
								<?
							}
						?>
					</tbody>
				</table>
				<hr>
				<h4>Total de registros leidos: <span class="pull-right"> <?=$total?></span></h4>
			</div>
			
			<div class="box-footer">
				<a href="<?=base_url('cpanel')?>" class="btn btn-primary btn-flat">Aceptar</a>
			</div>
		</div>
	</div>
</div>