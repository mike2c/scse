<section class="content-header">
  <h1>
    Listado
    <small>de empresas</small>
  </h1>
</section>
<?php
	
	if(!isset($registros) || $registros == null || empty($registros)){
		exit("<h2>ERROR: no se han podido leer los registros.</h2>");
	}	
?>
<div class="content">
	<div class="box box-primary">
		<div class="box-body" style="overflow:auto;">
			<form id="formBusqueda" class="form-inline" action="<?=base_url("CPanel/ListarEgresados")?>" type="post">
				<div class="form-group">
					<select class="form-control" name="sociedad" id="sociedad">
					<option value="">Todas las sociedades</option>
						<?php
							$soc_seleccionada = (isset($sociedad_seleccionada))? $sociedad_seleccionada : "";
							foreach ($sociedades->result() as $row) {
								if($soc_seleccionada == $row->sociedad_id){

									echo "<option selected value='$row->sociedad_id'>$row->sociedad</option>";
								}else{

									echo "<option value='$row->sociedad_id'>$row->sociedad</option>";
								}
							}
							
						?>
					</select>
				</div>
				<div class="input-group">
		    		<input autocomplete="off" type="text" value="<?=(isset($busqueda)? $busqueda:"")?>" name="busqueda" class="form-control" placeholder="Buscar por...">
		    		<span class="input-group-btn">
		        	<div class="form-group">
		        		<?php
		        			$campo_seleccionado = (isset($campo))? $campo: "";
		        		?>
						<select class="form-control" name="campo" id="campo">
							<option value="ruc" <?php if($campo_seleccionado == "ruc") echo "selected";?>>RUC</option>
							<option value="correo" <?php if($campo_seleccionado == "correo") echo "selected";?>>Correo</option>
							<option value="nombre_empresa" <?php if($campo_seleccionado == "nombre_empresa") echo "selected";?>>Nombre</option>
						</select>
					</div>
					</span>
		    	</div>
			</form>
			<br>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<td>RUC</td>
						<td>Nombre de la Empresa</td>
						<td>Sociedad</td>
						<td>Correo</td>
						<td>Sitio web</td>
						<td>Autenticada</td>
						<td>Telefono</td>
						<td>Celular</td>
						<td>Departamento</td>
						<td>Municipio</td>
						<td>Dirección</td>
						<td>Última sesión</td>
					
					</tr>
				</thead>
				<tbody>
					<?php
						foreach ($registros->result() as $row) {
							echo "<tr>";
							echo "<td>$row->ruc</td>";
							echo "<td>$row->nombre_empresa</td>";
							echo "<td>$row->sociedad</td>";
							echo "<td>$row->correo</td>";
							echo "<td>$row->sitio_web</td>";
							//echo "<td>". (($row->autenticada)? "Autenticada":"Sin autenticar") ."</td>";
							
							echo "<td>$row->telefono</td>";
							echo "<td>$row->celular</td>";
							echo "<td>$row->departamento</td>";
							echo "<td>$row->municipio</td>";
							echo "<td>$row->direccion</td>";
							echo "<td>". date_toDMY($row->ultima_sesion) ."</td>";
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
</style>
<script type="text/javascript">
	$("#formBusqueda").submit(function(e){
		e.preventDefault();
		$.post(baseURL("CPanel/ListarEmpresas"),$(this).serialize(),
			function(data){
				$("#contenido").html(data);
			})
	});

	$("#sociedad").change(function(){
		$("#formBusqueda").trigger("submit");
	});
</script>