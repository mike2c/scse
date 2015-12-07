<div class="box box-primary">
  <div class="box-header with-border">
    <h3 class="box-title">Nueva publicación de curso <span class="text-default"></span></h3>
    <div class="box-tools pull-right">
      <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
      <button class="btn btn-box-tool" onclick="javascript:listar_cursos()"><i class="fa fa-times"></i></button>
    </div>
  </div>
  <div class="box-body">
    <form action="<?=base_url('curso/insertar')?>" method="post" id="form_crear_publicacion" enctype="multipart/form-data">
      <div class="form-group">
        <label>Nombre del curso:</label>
        <input autocomplete="off" type="text" class="form-control" name="nombre_curso" id="nombre_curso">
      </div>
      <div class="form-group">
        <label>Descripción: </label>
        <textarea class="form-control" name="descripcion" id="descripcion" rows="5"></textarea>        
        <p class="help-block hidden-content"><i class="fa fa-info-circle"></i>Descripción general sobre la publicación</p>
      </div>
      <div class="form-group">
        <label>Costo del curso:</label>
        <input autocomplete="off" type="text" class="form-control" name="costo" id="costo">
        <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> El precio del curso en <b>dólares</b></p>
      </div>
      <div class="form-group">
        <label>Duración:</label>
        <input autocomplete="off" type="text" class="form-control" name="duracion" id="duracion">
        <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> La duración que tendrá el curso en <b>meses</b></p>
      </div>
      <div class="form-group">
        <div class="checkbox">
          <label><input type="checkbox" id="libre" name="libre"> <b>Curso libre</b></label>
         </div>
         <p class="help-block"> Marcar si es un curso libre de lo contrario se publicara como curso de posgrado.</p>  
      </div>
        <div class="form-group">
        <label>Inicio del curso:</label>
        <input autocomplete="off" placeholder="00/00/0000" type="text" class="form-control" id="inicio" name="inicio">
        <p class="help-block"> Seleccione la fecha que se iniciará el curso.(campo no obligatorio)</p>
      </div>
      <div class="form-group">
        <label>Fecha de culminación:</label>
        <input autocomplete="off" placeholder="00/00/0000" type="text" class="form-control" id="fecha_alta" name="fecha_alta">
        <p class="help-block"> Fecha en la que dejara de estar visible la publicación</p>
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
        <br>
        <div id="preload"></div>
      </div>
      <div class="form-group">
        <div id="errors_panel" class="panel panel-danger panel-body text-danger hidden-content">
          
        </div>
      </div>
      <div class="form-footer box-footer">
      
        <button type="button" onclick="listar_cursos()" class="btn btn-default pull-right">Cancelar</button>
        <button type="submit" class="btn btn-primary pull-right">Guardar cambios</button>
      </div>
    </form>
  </div><!-- /.box-body -->
</div>
<script type="text/javascript" src="<?=base_url('plugins/jquery-form/jquery.form.js')?>"></script>
<script type="text/javascript">
  $("#fecha_alta").datepicker();
  $("#inicio").datepicker();
  help_block();
  $("#form_crear_publicacion").submit(function(e){
    e.preventDefault();
    validar_form(this,$("#errors_panel"));
  });
</script>