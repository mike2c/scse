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
				<h3 class="text-primary">Registros insertados correctamente</h3>
			</div>
			<div class="box-body">
				<table class="table table-hover table-condensed">
					<tbody>
						<?php
					
							if(isset($registros_correctos) && count($registros_correctos) > 0){
								foreach ($registros_correctos as $key => $value) {
									echo "<tr>
									<td>". ($key + 1). "</td>
									<td>$value[1]</td>
									<td>$value[0]</td>
									<td>$value[2]</td>
									<td>$value[3]</td>
									</tr>";
								}
							}else{
								?>
									<div class="callout callout-warning">
					                    <h4>Mensaje</h4>
					                    <p>No se ha insertado ningún registro.</p>
				                  	</div>
								<?
							}
						?>
					</tbody>
				</table>
			</div>
			<div class="box-header">
				<h3 class="text-danger">Registros no insertados</h3>
			</div>
			<div class="box-body">
				<table class="table table-hover table-condensed">
					<tbody>
						<?php

							if(isset($registros_incorrectos) && count($registros_incorrectos) > 0){
								foreach ($registros_incorrectos as $key => $value) {
									echo "<tr>
									<td><i class='fa fa-warning text-danger'></i></td>
									<td>$value[1]</td>
									<td>$value[0]</td>
									<td>$value[2]</td>
									<td>$value[3]</td>
									<td class='text-danger'><b>$value[4]</b></td>
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
			</div>
			<div class="box-footer">
				<a href="<?=base_url('cpanel')?>" class="btn btn-primary btn-flat">Aceptar</a>
			</div>
		</div>
	</div>
</div>