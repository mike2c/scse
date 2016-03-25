<div class="container">
	<section class="content-header">
		<h1>
            Listar
            <small>encuestas</small>
     	</h1>
	</section>
	<div class="content">
		<div class="box box-primary">
			<div class="box-header with-border">
				<a href="<?=base_url('perfil')?>" class="btn btn-success"><i class="fa  fa-reply"></i> Volver a mi perfil</a>
				<a href="<?=base_url('encuesta/crear_encuesta')?>" class="btn btn-primary"><i class="fa fa-file-text-o"></i> Nueva encuesta</a>
			</div>
			<div class="box-body">
				<?php
					if($encuestas == null || $encuestas->num_rows() == 0){
						?>
							<div class="alert alert-info alert-dismissable">
			                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
			                    <h4><i class="icon fa fa-info"></i> Mensaje!</h4>
			                    No se han encontrado encuestas creadas por este usuario.
		                	</div>
						<?
					}else{

						foreach ($encuestas->result() as $row) {
							?>
								<div class="small-box box-encuesta">
									<h4 class="titulo-encuesta">
										<?=$row->titulo?> | 
										<span class="">
											<?php
											echo ($egresados_encuestados[$row->encuesta_id] / $total_egresados[$row->encuesta_id]) * 100;
											?>% completada
										</span>
											
									</h4><div class="divider"></div>
									<div class="inner">

										<label>
											<?=$row->objetivo?>
										</label>
										<p><?=$row->descripcion?></p>
										<div class="">
											<?php
												foreach ($carreras[$row->encuesta_id]->result() as $carr) {
													echo "<span class='badge bg-blue tag'>$carr->nombre_carrera</span>";
												}
											?>
										</div>
									</div>
																		
									<div class="small-box-footer overflow-auto">
										<div class="btn-group pull-left">
                          					<a href="<?=base_url('encuesta/eliminar_encuesta/'. $row->encuesta_id)?>" title="Eliminar encuesta" class="btn btn-primary btn-md"><i class="fa fa-trash-o"></i></a href="<?=base_url('encuesta/respuestas/'. $row->encuesta_id)?>?>">
				                        	<a href="<?=base_url('encuesta/respuestas/'. $row->encuesta_id)?>" title="Leer respuestas" class="btn btn-primary btn-md"><i class="fa fa-file-text-o"></i></a>
				                        	<a href="<?=base_url('encuesta/resultado/'. $row->encuesta_id)?>" title="Ver resultados" class="btn btn-primary btn-md"><i class="fa fa-mail-forward"></i></a>
				                        </div>
									</div>
									
								</div>
							<?	
						}
					}
				?>
			</div>
		</div>
	</div>
</div>
<style>
	.overflow-auto{
		overflow: auto;

	}
	.btn-group{
		padding: 3px;
		padding-left: 6px;
	}
	
	.tag{
		margin-right: 5px;
		font-size: 13px;
		padding: 5px;
		padding-left: 10px;
		padding-right: 10px;
	}
	.titulo-encuesta{
		padding-top: 10px;
		padding-left: 10px;
		padding-bottom: 10px;
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 5px;
	}
	.inner{
		margin-top: 0px;

	}
	.inner h4{
		margin-top: 5px;
	}
	.divider{
		border-top: 1px solid white;
		margin: 0px 10px;
	}
	.box-encuesta{
		color: white;
		background-color: #3f9ace;
	}
</style>
<?
	/*<div class="box">
									<div class="box-header with-border">
										<h4 class="box-title text-primary"><?=$row->titulo?></h4>
									</div>
									<div class="box-body">
										<p class=""><i class="fa fa-circle"></i> <b> <?=$row->objetivo?></b></p>
										<!--<label>Numero de preguntas: <span class="text-primary"><?=$no_preguntas[$row->encuesta_id]?></span></label>-->
										<p class="">
											<?=$row->descripcion?>
										</p>
									</div>
									<div class="box-footer">
										<div class="btn-group pull-right">
                          					<a href="<?=base_url('encuesta/eliminar/'. $row->encuesta_id)?>" title="Eliminar encuesta" class="btn btn-default"><i class="fa fa-trash-o"></i></a href="<?=base_url('encuesta/respuestas/'. $row->encuesta_id)?>?>">
				                        	<a href="<?=base_url('encuesta/respuestas/'. $row->encuesta_id)?>" title="Leer respuestas" class="btn btn-default"><i class="fa fa-file-text-o"></i></a>
				                        	<a href="<?=base_url('encuesta/resultado/'. $row->encuesta_id)?>" title="Ver resultados" class="btn btn-default"><i class="fa fa-mail-forward"></i></a>
				                        </div>
									</div>
								</div>*/
?>