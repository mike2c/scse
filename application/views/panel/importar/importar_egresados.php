<section class="content-header">
  <h1>
    Importar
    <small>egresados</small>
  </h1>
</section>
<div class="content">
	<div class="box box-primary">
		<div class="box-body">
			<form class="form-inline" action="<?=base_url("importar/subir_archivo")?>" method="post" id="formImportarEgresados" enctype="multipart/form-data">
								
				<input type="hidden" value="upload" name="action">
				<label for="">Selecciona un archivo de excel</label><br>
				<div class="form-group">
					<input type="file" name="excel" accept=".xlsx">
				</div>
				<div class="form-group">
					<input class="btn btn-primary btn-sm" type="submit" value="subir archivo">	
				</div>
				<div class="form-group">
					
				</div>
			</form>
		</div>
	</div>
</div>