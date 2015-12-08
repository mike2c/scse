<?php
	if(!isset($title) && !isset($errors)){
		exit();
	}
?>
<div class="container">
	<section class="content-header">
	  <h1>
		<?=$title?>
	  </h1>
	</section>

	<div class="content">
		<div class="box box-danger">
			<div class="box-body">
				<?php
					if(is_array($errors)){
						?>
							<div class="alert alert-danger alert-dismissable">
			                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
			                <h4><i class="icon fa fa-ban"></i> Alert!</h4>
								<?
									foreach ($errors as $key => $value) {
										?>
											<?=$value?>
						            	<?	
									}
								echo "</div>";
					}else{
						?>
							<div class="alert alert-danger alert-dismissable">
			                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
			                    <h4><i class="icon fa fa-ban"></i> Alert!</h4>
			                    <?=$errors?>
			              	</div>
						<?
					}
				?>
		</div>
		<div class="box-footer">
			<a href="<?=base_url('cpanel')?>" class="btn btn-primary btn-flat">Regresar</a>
		</div>
		
	</div>
</div>
</div>