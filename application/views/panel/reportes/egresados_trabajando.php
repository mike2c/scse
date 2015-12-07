<div class="content">
	<div class="row">
			<div class="col-md-8">
				<div class="box box-primary">
					<div class="box-body">
						<div class="box-body">
							<?crear_grafico_pastel($data,"Porcentaje de egresados trabajando","Porcentaje");?>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="box box-solid">
	                <div class="box-header with-border">
	                  <h3 class="box-title">Filtro</h3>
	                  <div class="box-tools">
	                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	                  </div>
	                </div>
	                <div class="box-body no-padding" style="display: block;">
	                	<form type="post" id="form_filtrar_reporte" action="<?=base_url('CPanel/ReporteEgresadosTrabajando')?>">
							<ul class="nav nav-pills nav-stacked">
								<?
									foreach ($carreras->result() as $row) {

										if(marcar_carrera($row->carrera_id, $sel_carreras)){
											echo "<li><div class='checkbox'>
											<label>	<input type='checkbox' name='carrera[]' checked value='$row->carrera_id'>$row->nombre_carrera</label>
											</div></li>";
										}else{
											echo "<li><div class='checkbox'>
											<label>	<input type='checkbox' name='carrera[]' value='$row->carrera_id'>$row->nombre_carrera</label>
											</div></li>";
										}
									
									}

									function marcar_carrera($id_carrera,$arr){
										
										if(isset($arr) && !empty($arr)){
											foreach ($arr as $key => $value) {
												if($value == $id_carrera){
													return true;
												}
											}
										}
										return false;
									}
								?>
								<li>
									<div class="checkbox"><label><input type="checkbox" name='titulado' value="true" 
									<?php
										

									?>> Titulado</label></div>
								</li>
								<li><button class="btn btn-primary btn-block btn-flat">aplicar</button></li>
							</ul>
	                	</form>
	                  
	                </div><!-- /.box-body -->
	              </div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">
					<div class="box-body">
						<?
							$porcentaje_trabajando = ($data[0]["y"] == 0) ? 0 : (($data[0]["y"]/($data[0]["y"]+$data[1]["y"]))*100);	
							$porcentaje_notrabajando = ($data[1]["y"] == 0) ? 0: (($data[1]["y"]/($data[0]["y"]+$data[1]["y"]))*100);	
						?>
						<table class='table table-striped table-hover'>
							<thead>
							<tr>
								<td></td>
								<td>Cantidad</td>
								<td>Porcentaje</td>
								
							</tr>
							</thead>
							<tbody>
							<tr>
							<?=
								"<td>Egresados trabajando</td><td>".$data[0]["y"]."</td><td>".(round($porcentaje_trabajando*100)/100)."% </td>
								</tr>
									<tr>
								<td>Egresados desempleados</td><td>".$data[1]["y"]."</td><td>".(round($porcentaje_notrabajando*100)/100)."% </td>
								</tr>
									<tr>
								<td>Totales</td><td>".($data[1]["y"] + $data[0]["y"])."</td><td>".($porcentaje_notrabajando + $porcentaje_trabajando)."% </td>"
							?>
							</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
</div><!--Fin de content-->
<style type="text/css">
	.nav.nav-pills.nav-stacked .checkbox{
		padding-left: 20px;
	}
</style>
<script type="text/javascript">
	
	$("#form_filtrar_reporte").submit(function(e){
		e.preventDefault();

		$.ajax({
			url: this.action,
			type: "post",
			data: $(this).serialize(),
			datatype: "html",
			success: function(data){
				$("#contenido").html(data);
			},
			error: function(jqXHR,textStatus,errorThrown){
				console.log(jqXHR.responseText);
			},
			async:true
		});
	});
	
</script>