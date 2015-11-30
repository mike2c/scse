<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">Mensaje de salida</h3>
		<div class="box-tools pull-right">
			
		</div>
	</div>
	<div class="box-body no-padding">
		<div class="mailbox-read-info">
			<h3><?=$mensaje->asunto?></h3>
			<h5>Para: <?=$mensaje->destinatario?>
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
								<i class="fa fa-file-o"></i>
							</span>
							<div class="mailbox-attachment-info">
								<a target="_new" href="<?=base_url('curriculum/ver_curriculum/' . $mensaje->destinatario_id)?>" class="mailbox-attachment-name"><i class="fa fa-paperclip"></i> curriculum adjuntado</a>
							</div>
						</li>
					</ul>
				<?
			}
		?>
	</div>
	<div class="box-footer">
		<button onclick="eliminar_mensaje(<?=$mensaje->mensaje_id?>)" class="btn btn-danger btn-sm"><i class="glyphicon glyphicon-trash"></i> Eliminar mensaje</button>
		<a href="<?=base_url('correo/sent')?>" class="btn btn-default btn-sm">Cerrar</a>
	</div>
</div>