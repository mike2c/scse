<div class="content">
	<div class="row">
		<div class="col-md-7">
			<div class="box box-primary">
				<div class="box-body">
					<?php
						crear_grafico_pastel($data,"Porcentaje de egresados por carrera","Porcentaje");
					?>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">
				<div class="box-body">
					<table class="table table-default table-hover table-striped">
						<thead>
							<tr>
								<td></td>
								<td>Cantidad</td>
								<td>Porcentaje</td>
							</tr>
						</thead>
						<div class="tbody">
							<?php
								$porcentaje_titulados = (($data[0]["y"]/($data[0]["y"]+$data[1]["y"]))*100);
								$porcentaje_notitulados = (($data[1]["y"]/($data[0]["y"]+$data[1]["y"]))*100);
								foreach ($data as $key => $value) {
									$porcentaje = ($value['y']/$total_egresados)*100;
									echo "<tr><td>$value[name]</td><td>$value[y]</td><td>". round($porcentaje,2) ."% </td></td>";
								}
							?>
							<tr><td>Total</td><td><?=$total_egresados?></td><td>100%</td></tr>
						</div>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>