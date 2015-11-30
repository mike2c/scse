<div class="content">
	<div class="container">
	<div class="row">
		<div class="col-md-3 col-lg-3">
			<!--Redactar-->
			<button data-toggle="modal" data-target="#redactar_mensaje" class="btn btn-primary btn-block" style="margin-bottom:10px;">Redactar</button>
			<!--Bendeja-->
			<div class="box box-solid">
				<div class="box-header with-border">
					<h3 class="box-title">Folders</h3>
					<div class="box-tools">
						<button class="btn btn-box-tool" data-widget='collapse'><i class="fa fa-minus"></i></button>
					</div>
				</div>
				<div class="box-body no-padding" style="display:block;">
					<ul class="nav nav-pills nav-stacked">
						<li><a href="<?=base_url('correo/inbox')?>">Bandeja de entrada <span class="label label-primary pull-right"><?=$cantidad_inbox?></span></a></li>
						<li><a href="<?=base_url('correo/sent')?>">Bandeja de salida <span class="label label-primary pull-right"><?=$cantidad_sent?></span></a></li>
						<li class="active"><a href="<?=base_url('correo/drafts')?>">Borradores <span class="label label-primary pull-right"><?=$cantidad_drafts?></span></a></li>
						<li><a href="<?=base_url('perfil')?>">Salir</a></li>
					</ul>
				</div>
			</div>			
		</div>
		<div class="col-md-9 col-lg-9">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Borradores</h3>
					<div class="box-tools pull-right">
						<form action="<?=base_url('correo/drafts')?>" method="post" id="form_buscar_correo">
							<div class="has-feedback">
								<input type="search" name="busqueda" class="form-control input-sm" placeholder='buscar correo' value="<?php
									if(isset($_POST['busqueda'])){
										echo $_POST['busqueda'];
									}
								?>">
								<span class="glyphicon glyphicon-search form-control-feedback"></span>
							</div>
						</form>
					</div>
				</div>
				<div class="box-body no-padding">
					<div class="mailbox-controls">
						<button onclick="marcar_mensajes()" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i></button>
						<button onclick="destruir_borradores()" class="btn btn-default btn-sm"><i class="fa fa-trash-o"></i></button>
						<a href="<?=base_url('correo/drafts')?>" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></a>
					</div>
					<div class="table-responsive mailbox-messages">
						<?php
							if($mensajes != null || !empty($mensajes)){
								if($mensajes->num_rows()){
									?>
									<table class="table table-hover table-striped">
										<?
											foreach ($mensajes->result() as $row) {
												echo "<tr>
												<td><input type='checkbox' name='mensajes_marcados' value='$row->mensaje_id'></td>
												<td><a href='javascript:editar_borrador($row->mensaje_id)'>$row->asunto</a></td>
												<td>Enviado el $row->fecha_creacion</td>
											
												</tr>";
											}
										?>
									</table>
									<?
								}else{
									?>
									<div class="box-body">
										<div class="alert alert-info alert-dismissable">
						                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
						                    <h4><i class="icon fa fa-info"></i> Mensaje</h4>
						                    No se han encontrado mensajes
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
	</div>
</div>
</div>
<script type="text/javascript" src="<?=base_url('dist/js/correo.js')?>"></script>