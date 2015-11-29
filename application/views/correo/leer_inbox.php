<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">Mensaje de entrada</h3>
		<div class="box-tools pull-right">
			
		</div>
	</div>
	<div class="box-body no-padding">
		<div class="mailbox-read-info">
			<h3><?=$mensaje->asunto?></h3>
			<h5>From: <?=$mensaje->remitente?>
				<span class="mailbox-read-time pull-right"><?=$mensaje->fecha_envio?></span>
			</h5>
		</div>
		<div class="mailbox-read-message">	
			<p><?=$mensaje->mensaje?></p>
		</div>
	</div>
	<div class="box-footer">
		<?php
			if($mensaje->curr_adjuntado == TRUE){
				?>
					<ul class="mailbox-attachments clearfix">
						<li>
							<span class="mailbox-attachment-icon">
								<i class="fa-file-o"></i>
							</span>
							<div class="mailbox-attachment-info">
								<a target="_new" href="<?=base_url('curriculum/ver_curriculum/' . $mensaje->remitente_id)?>" class="mailbox-attachment-name"><i class="fa fa-paperclip"></i> curriculum adjuntado</a>
							</div>
						</li>
					</ul>
				<?
			}
		?>
	</div>
	<div class="box-footer">
		<a href="<?=base_url('correo/inbox')?>" class="btn btn-default">Cerrar</a>
	</div>
</div>