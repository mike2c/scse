<section class="content-header">
  <h1>
    Listado
    <small>de administradores</small>
  </h1>
</section>
	<div class="content">
		<?php
		
		if(!isset($registros) || $registros == null || empty($registros)){
			exit("<h2>ERROR: no se han podido leer los registros.</h2>");
		}	
	?>
	<div class="box box-primary">
		<div class="box-body">
			<form id="formBusqueda" class="form-inline" action="<?=base_url("CPanel/ListarAdministradores")?>" type="post">
				<div class="input-group" style="margin-top:25px;">
		    		<input type="text" value="<?=(isset($busqueda)? $busqueda:"")?>" name="busqueda" class="form-control" placeholder="Buscar por...">
		    		<span class="input-group-btn">
		        	<div class="form-group">
		        		<?php
		        			$campo_seleccionado = (isset($campo))? $campo: "";
		        		?>
						<select class="form-control" name="campo" id="campo">
							<option value="correo" <?php if($campo_seleccionado == "correo") echo "selected";?>>Correo</option>
							<option value="nombre" <?php if($campo_seleccionado == "nombre") echo "selected";?>>Nombre</option>
							<option value="apellido" <?php if($campo_seleccionado == "apellido") echo "selected";?>>Apellido</option>
						</select>
					</div>
					</span>
		    	</div>
			</form>
			<br>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<td>Nombre</td>
						<td>Apellido</td>
						<td>Genero</td>
						<td>Correo</td>
						<td>Cuenta</td>
						<td>Ultima conexion</td>
					</tr>
				</thead>
				<tbody>
					<?php
						foreach ($registros->result() as $row) {
							echo "<tr>";
							echo "<td>$row->nombre</td>";
							echo "<td>$row->apellido</td>";
							echo "<td>$row->sexo</td>";
							echo "<td>$row->correo</td>";
							echo "<td>". (($row->activo == TRUE)? "Activa":"Desactivada") ."</td>";
							echo "<td>$row->ultima_sesion</td>";
							echo "</tr>";
						}
					?>
				</tbody>
			</table>
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
	select.form-control{
		min-width: 180px;
	}
</style>
<script type="text/javascript">

	$("#formBusqueda").submit(function(e){
		e.preventDefault();
		$.post(baseURL("CPanel/ListarAdministradores"),$(this).serialize(),
		function(data){
			$("#contenido").html(data);
		})
	});

</script>