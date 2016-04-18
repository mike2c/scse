<div class="box box-primary">
  <div class="box-header with-border">
    <h3 class="box-title">Nueva ficha ocupacional:</h3>
    <div class="box-tools pull-right">
      <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
      <button class="btn btn-box-tool" onclick="javascript:listar_fichas()"><i class="fa fa-times"></i></button>
    </div>
  </div>
  <div class="box-body">
    <form action="<?=base_url('ficha/insertar')?>" method="post" id="form_crear_publicacion" enctype="multipart/form-data">
   	  <div class="form-group">
        <label>Cargo o puesto:</label>
        <input type="text" class="form-control" name="cargo" id="cargo">
      </div>
      <div class="form-group">
        <label>Descripción: </label>
        <textarea class="form-control" name="descripcion" id="descripcion" rows="5"></textarea>
        <p class="help-block hidden-content"><i class="fa fa-info-circle"></i>Descripción general sobre la publicación</p>     
      </div>
      <div class="form-group">
        <label for="">Ubicación del cargo</label>
        <input class="form-control" type="text" name="ubicacion" id="ubicacion">
        <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> El área de la empresa en la que se encuentra ubicado el cargo.</p>
      </div>
      <!--Cantidad de puestos-->
      <div class="form-group">
        <label for="">Cantidad de puestos</label>
        <input class="form-control" type="text" name="cantidad" id="cantidad">
        <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> Cantidad de puestos disponibles para le cargo.</p>
      </div>
       <div class="form-group">
        <label for="">Jefe inmediato</label>
        <input class="form-control" type="text" name="jefe" id="jefe">
      </div>
       <div class="form-group">
        <label for="">Experiencia</label>
        <input class="form-control" type="text" name="experiencia" id="experiencia">
        <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> La experiencia minima en <b>años</b> solicitada para el cargo. Si no se requiere experiencia porfavor digitar N/A.</p>
      </div>
       <div class="form-group">
        <label for="">Personal a cargo</label>
        <textarea name="a_cargo" id="a_cargo" rows="5" class="form-control"></textarea>
        <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> Personal o areas que estaran bajo tu responsabilidad. Ejemplo: Produccion, Bodega, Informatica, etc.</p>
      </div>
      <div class="form-group">
        <label for="">Finalidad del cargo</label>
          <textarea name="finalidad" id="finalidad" rows="5" class="form-control"></textarea>
          <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> Breve descripcion de las actividades a realizar en el cargo. Ejemplo: Responsable de preveer, organizar, dirigir, planear, etc.</p>
      </div>
      <div class="form-group">
        <label for="">Requisitos del cargo</label>
          <textarea name="requisitos" id="requisitos" rows="5" class="form-control"></textarea>
          <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> Destrezas o estudios necesarios para poder aplicar al cargo. Titulaciones, certificaciones, cursos o el dominio de alguna herramienta.</p>
      </div>
      <div class="form-group">
        <label for="">Competencia</label>
          <textarea name="competencia" id="competencia" rows="5" class="form-control"></textarea>
          <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> Las aptitudes que debera de poseer el aplicante al cargo. Ejemplo: sentido de la responsabilidad, alta capacidad de analisis, etica, etc.</p>
      </div>
      <div class="form-group">
        <label for="">Funciones y responsabilidades</label>
          <textarea name="funciones" id="funciones" rows="5" class="form-control"></textarea>
          <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> Especifiar las funciones y responsabilidades que debera de ejecutar la persona en el cargo.</p>
      </div>
      <div class="form-group">
        <label>Fecha de culminación:</label>
        <input autocomplete="off" placeholder="00/00/0000" type="text" class="form-control" id="fecha_alta" name="fecha_alta">
        <p class="help-block"><i class="fa fa-info-circle"></i> Fecha en la que dejara de estar visible la publicacion</p>
      </div>
      <div class="form-group">
        <label>Selecciona las carreras a las que va dirigida la publicación</label>
        <?php

            if(isset($carreras) && $carreras->num_rows() > 0){
            	foreach ($carreras->result() as $row){
					?>
	                <div class="checkbox">
	                  <label><input type="checkbox" name="carreras[]" value="<?=$row->carrera_id?>"> <?=$row->nombre_carrera?></label>
	                </div>
	              	<?              
              	}
            }
          ?>
      </div>
      <div class="form-group">
        <label for="">Adjuntar imagen</label>
        <input type="file" name="imagen" id="imagen">
      </div>
      <div class="form-group">
        <div id="errors_panel" class="panel panel-danger panel-body text-danger hidden-content">
          
        </div>
      </div>
      <div class="form-footer box-footer">
        <button type="button" onclick="listar_fichas()" class="btn btn-default pull-right">Cancelar</button>
        <button type="submit" class="btn btn-primary pull-right">Guardar cambios</button>
      </div>
    </form>
  </div><!-- /.box-body -->
</div>
<script type="text/javascript" src="<?=base_url('plugins/jquery-form/jquery.form.js')?>"></script>
<script type="text/javascript">
  $("#fecha_alta").datepicker();
  help_block();
  $("#form_crear_publicacion").submit(function(e){
    e.preventDefault();
    validar_form(this,$("#errors_panel"));
  });
</script>