<div class="container">
	<section class="content-header">
          <h1>
            Resultado de la encuesta 
            <small>respuestas abiertas</small>
          </h1>
    </section>
	<div class="content">
		<div class="col-md-12 no-padding">
			<a style="margin-bottom: 15px;" href="<?=base_url('encuesta/listar_encuestas')?>" class="btn btn-primary">Regresar</a>
		</div>
		
		<div class="col-md-12 no-padding">
		<?php
			$cont = 1;
			foreach ($egresados as $key => $egresado) {
				?>
				<div class="box box-primary">
					<div class="box-header with-border">
						<div class="box-title">
							<h4 class="text-primary">
								<?="#$cont - ". $egresado->getNombreCompleto()?>
							</h4>
						
						</div>
							<div class="box-tools pull-right">
			                <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse"><i class="fa fa-minus"></i></button>
			                <button class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="" data-original-title="Remove"><i class="fa fa-times"></i></button>
			              	</div>
					</div>
					<div class="box-body">
						<?
							foreach ($preguntas as $key => $pregunta) {
								?>
									<div >
										<label class="pregunta"><?=$pregunta->getPregunta()?></label >
										<p class="respuesta">
											<?=ucfirst($respuestas[$egresado->getIdEgresado()][$pregunta->getIdPregunta()])?>
										</p>
									</div>
									
								<?
							}
						?>
					</div>
				</div>		
				<?
				$cont++;
			}
		?>
		</div>		
	</div>
</div>
<style>
	h4{
		margin: 5px 0px;
	}
	.pregunta{
		margin-left: 10px;
		font-family: "Calibri";
		font-size: 17px;
	}
	.respuesta{
		border-bottom-left-radius: 10px;
		border-top-right-radius: 6px;
		border-bottom-right-radius: 6px;
		padding: 6px 8px;
		padding-left: 10px;
		margin-left: 10px;
		margin-bottom: 5px;
		color: black;
		background-color: #f1f1f1;
		font-style: italic;
		font-family: "Calibri";
		font-size: 17px;
		color: #7c7c7c;
		border: 1px solid lightgray;
	}

	.box-header{
		padding: 5px;
		padding-left: 10px;
	}
</style>