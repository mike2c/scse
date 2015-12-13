<?php
	if(!isset($titulo) || !isset($mensaje)){
		exit("Los parametros no se han proporcionado");
	}
?>
<div class="container">
	<section class="content-header">
	  <h1>
		<?=$titulo?>
	  </h1>
	</section>
	<!--Contenido-->
	<div class="content">
		<div class="box box-primary">
			<div class="box-body">
				<p><?=$mensaje?></p>
			</div>
			<div class="box-footer">
				<a href="<?=base_url('cpanel')?>" class="btn btn-primary btn-flat">Regresar</a>
			</div>
		</div>
	</div>
</div>