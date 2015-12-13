<div class="modal fade" id="redactar_mensaje" role="dialog" aria-labelledby="redactar_mensaje_label">
	<div class="modal-dialog modal-md" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
				<h4 class="modal-title">Nuevo mensaje</h4>				
			</div>
			<div class="modal-body">
				<form id="form_enviar_mensaje" action="<?=base_url('correo/enviar_mensaje')?>" method="post">
					
					<div class="form-group">
						<select name="tipo_usuario" id="tipo_usuario" class="form-control" style="max-width:300px;">
							<option value="1">Egresado</option>
							<option value="2">Empresa</option>
							<option value="3">Publicador</option>
							<option value="4">Administrador</option>
						</select>
					</div>

					<!--Lista de usuarios-->
					<div class="form-group">
						<div class="users-list" id="lista_usuarios_nm">
							
						</div>
					</div>

					<!--Asunto-->
					<div class="form-group">
						<input autocomplete="off" required placeholder="asunto" id="asunto" name="asunto" type="text" class="form-control">
					</div>
					<div class="form-group">
						<textarea rows="10" name="mensaje" id="mensaje" required class="form-control" placeholder="Escribe tu mensaje aqui..."></textarea>
					</div>
					<?php
						if(esEgresado()){
							if($tiene_curriculum){
								?>
								<div class="form-group">
									<div class="checkbox">
										<label><input type="checkbox" name="curriculum_adjuntado" id="curriculum_adjuntado"> Adjuntar curriculum</label>
									</div>
								</div>
								<?
							}
						}
					?>
					<div class="modal-footer">
						<button id="btn_borrador" type="button" onclick="guardar_borrador()" class="btn btn-default pull-left">Borrador</button>
						
						<button id="btn_cancelar" type="button" onclick="cancelar_envio()" class="btn btn-danger pull-right">Cancelar</button>
						<button id="btn_enviar" type="button" onclick="enviar_mensaje()" class="btn btn-primary pull-right btn-send">Enviar mensaje</button>
					</div>
					<img class="loading-img hidden-content" src="<?=base_url('dist/img/loading.gif')?>" alt="No se puede visualizar la imagen.">
				</form>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="<?=base_url('plugins/chosen/chosen.min.css')?>"></link>
<script type="text/javascript" src="<?=base_url('plugins/chosen/chosen.jquery.min.js')?>"></script>
<script type="text/javascript">

	$("#redactar_mensaje").on("hide.bs.modal",function(){
		limpiar_campos();	
	});
	
	$("#tipo_usuario").change(function(){
		listar_usuarios(this.value,$("#lista_usuarios_nm"));
	});

	$("#redactar_mensaje").on("shown.bs.modal",function(){
		listar_usuarios("1",$("#lista_usuarios_nm"));
	});
	/*Funciones*/
	function limpiar_campos(){
		$("#redactar_mensaje").trigger("reset");
		listar_usuarios(1,$(".listar_usuarios"));
	}

	function cancelar_envio(){
		$("#redactar_mensaje").modal("hide");
	}
	
</script>