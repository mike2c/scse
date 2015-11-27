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
						<div id="lista_usuarios">
							<select class="form-control" name="usuario" id="usuario" multiple>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select>
						</div>
					</div>

					<!--Asunto-->
					<div class="form-group">
						<input required placeholder="asunto" name="asunto" type="text" class="form-control">
					</div>
					<div class="form-group">
						<textarea rows="10" name="mensaje" id="mensaje" required class="form-control" placeholder="Escribe tu mensaje aqui..."></textarea>
					</div>
					<div class="form-group">
						<div class="checkbox">
							<label><input type="checkbox" name="curriculum"> Adjuntar curriculum </label>

						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-default pull-left">Borrador</button>
						<button class="btn btn-danger pull-right">Cancelar</button>
						<button class="btn btn-primary pull-right">Enviar mensaje</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="<?=base_url('plugins/chosen/chosen.min.css')?>"></link>
<script type="text/javascript" src="<?=base_url('plugins/chosen/chosen.jquery.min.js')?>"></script>
<script type="text/javascript">
	$("#usuario").chosen({
		width: "570px",
		placeholder_text_multiple: "selecciona un usuario de la lista",
		max_selected_options: 1
	});
</script>