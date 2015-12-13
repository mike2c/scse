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
				<hr>
				<div class="form-group">
					<h4>Antes de subir un archivo al servidor tenga en cuenta las siguientes consideraciones:</h4>
					<ul>
						<li><p>El archivo debe de tener el formato adecuado tal y como se muestra a continuación:</p>
						<img class="img-responsive" src="<?=base_url('dist/img/formato_excel.jpg')?>" alt="La imagen no puede ser visualizada."></li>
						<li>La primera fila del archivo debe de contener las cabeceras mostradas en la imagen, estan no son leidas por el sistema pero son necesarias para identificar el formato de este.</li>
						<li>Las fechas proporcionadas deben de ir separadas por guiones y no por espacios o plecas a como se muestra en este ejemplo: 12-12-2005</li>
						<li>Asegurese de evitar los maximos errores posibles para que el sistema no presente problemas.</li>
						<li>Las carreras deben de ir en formato de texto y no ids u otro tipo de entrada, el sistema se encarga de identificar las carreras y si no la encuentra la registra automaticamente</li>
						<li>El formato del archivo se puede descargar de aqui: <a href="<?=base_url('dist/excel/formato vacio.xlsx')?>"> descargar</a></li>
					</ul>
				</div>
			</form>
		</div>
	</div>
</div>