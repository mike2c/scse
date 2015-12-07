<div class="content">
	<div class="row">
		<div class="col-md-7">
			<div class="box box-primary">
				<div class="box-body">
					<?php
						crear_grafico_pastel($data,"Porcentaje de egresados titulados","Porcentaje");
					?>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">
				<div class="box-body">
					<?php
						$porcentaje_titulados = (($data[0]["y"]/($data[0]["y"]+$data[1]["y"]))*100);
						$porcentaje_notitulados = (($data[1]["y"]/($data[0]["y"]+$data[1]["y"]))*100);
					?>
					<table class="table table-default table-striped-table-hover">
						<thead>
							<tr>
								<td></td>
								<td>Cantidad</td>
								<td>Porcentaje</td>
							</tr>
						</thead>
						<tbody>
							<?php
								echo "<tr>
								<td>Titulados</td><td>".$data[0]["y"]."</td><td>".$porcentaje_titulados."% </td>

								</tr>";
									echo "<tr>
								<td>No Titulados</td><td>".$data[1]["y"]."</td><td>".$porcentaje_notitulados."% </td>

								</tr>";
									echo "<tr>
								<td>Totales</td><td>".($data[1]["y"] + $data[0]["y"])."</td><td>".($porcentaje_notitulados + $porcentaje_titulados)."% </td>

								</tr>";
							?>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>