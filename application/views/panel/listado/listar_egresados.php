<section class="content-header">
  <h1>
    Listado
    <small>de egresados</small>
  </h1>
</section>
<div class="content">
	<div class="box box-primary" style="overflow:auto;">
		<div class="box-body">
			<!--Barra de busqueda-->
			<form id="formBusqueda" class="form-inline" action="<?=base_url("CPanel/ListarEgresados")?>" type="post">
				<div class="form-group">
					<select class="form-control" name="carrera" id="carrera">
					<option value="">todas las carreras</option>
						<?php
							$carr_selecc = (isset($carrera_seleccionada))? $carrera_seleccionada : "";
							foreach ($carreras->result() as $row) {
								if($carr_selecc == $row->carrera_id){

									echo "<option selected value='$row->carrera_id'>$row->nombre_carrera</option>";
								}else{

									echo "<option value='$row->carrera_id'>$row->nombre_carrera</option>";
								}
							}
							
						?>
					</select>
				</div>
				<div class="input-group">
		    		<input type="text" value="<?=(isset($busqueda)? $busqueda:"")?>" name="busqueda" class="form-control" placeholder="Buscar por...">
		    		<span class="input-group-btn">
		        	<div class="form-group">
		        		<?php
		        			$campo_seleccionado = (isset($campo))? $campo: "";
		        		?>
						<select class="form-control" name="campo" id="campo">
							<option value="carnet" <?php if($campo_seleccionado == "carnet") echo "selected";?>>Carnet</option>
							<option value="correo" <?php if($campo_seleccionado == "correo") echo "selected";?>>Correo</option>
							<option value="nombre" <?php if($campo_seleccionado == "nombre") echo "selected";?>>Nombre</option>
							<option value="apellido" <?php if($campo_seleccionado == "apellido") echo "selected";?>>Apellido</option>
						</select>
					</div>
					</span>
		    	</div>
			</form><!--Fin barra de busqueda-->
			<br>
			<?php
				if(!isset($registros) || $registros == null || empty($registros)){
					?>
						
					<?
				}else{
					?>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<td>Carnét</td>
								<td>Cedula</td>
								<td>Nombre</td>
								<td>Apellido</td>
								<td>Carrera</td>
								<td>Genero</td>
								<td>Trabajando</td>
								<td>Titulado</td>
								<td>Año de egresado</td>
								<td>Correo</td>
								<td>Cuenta</td>
								<td>Telefono</td>
								<td>Celular</td>
								<td>Dirección</td>
							</tr>
						</thead>
						<tbody style="overflow:auto;">
							<?php
								foreach ($registros->result() as $row) {
									echo "<tr>";
									echo "<td>$row->carnet</td>";
									echo "<td>$row->cedula</td>";
									echo "<td>$row->nombre</td>";
									echo "<td>$row->apellido</td>";
									echo "<td>$row->carrera</td>";
									echo "<td>$row->sexo</td>";
									echo "<td>". (($row->trabaja)? "Trabajando":"Desempleado") ."</td>";
									echo "<td>". (($row->titulado)? "Titulado":"Sin titulo") ."</td>";
									echo "<td>$row->fecha_egresado</td>";
									echo "<td>$row->correo</td>";
									echo "<td>". (($row->activo == TRUE)? "Activa":"Desactivada") ."</td>";
									echo "<td>$row->telefono</td>";
									echo "<td>$row->celular</td>";
									echo "<td>$row->direccion</td>";
									echo "</tr>";
								}
							?>
						</tbody>
					</table>
					<?
				}
			?>
		</div>
	</div>
</div>
<style>
	td{
		white-space: nowrap;
	}
	.input-group-btn select.form-control{
		color: gray;
		border-left:none;
	}
</style>
<script type="text/javascript">
	$("#formBusqueda").submit(function(e){
		e.preventDefault();
		$.post(baseURL("CPanel/ListarEgresados"),$(this).serialize(),
			function(data){
				$("#contenido").html(data);
			})
	});

	$("#carrera").change(function(){
		$("#formBusqueda").trigger("submit");
	});
</script>