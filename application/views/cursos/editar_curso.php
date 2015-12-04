<div class="box box-primary">
  <div class="box-header with-border">
    <h3 class="box-title">Editar curso: <span class="text-default"><?=$curso->nombre_curso?></span></h3>
    <div class="box-tools pull-right">
      <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
      <button class="btn btn-box-tool" onclick="javascript:listar_cursos()"><i class="fa fa-times"></i></button>
    </div>
  </div>
  <div class="box-body">
    <form action="<?=base_url('curso/actualizar')?>" method="post" id="form_editar_publicacion" enctype="multipart/form-data">
      <input type="hidden" name="curso_id" id="curso_id" value="<?=$curso->curso_id?>">
      <input type="hidden" name="publicacion_id" id="publicacion_id" value="<?=$curso->publicacion_id?>">
      <input type="hidden" name="imagen_publicacion_id" id="imagen_publicacion_id" value="<?=$curso->imagen_publicacion_id?>">
      <div class="form-group">
        <label>Nombre del curso:</label>
        <input autocomplete="off" type="text" class="form-control" name="nombre_curso" id="nombre_curso" value="<?=$curso->nombre_curso?>">
      </div>
      <div class="form-group">
        <label>Descripción: </label>
        <textarea class="form-control" name="descripcion" id="descripcion" rows="5"><?=saltar_linea($curso->descripcion)?></textarea>        
        <p class="help-block hidden-content"><i class="fa fa-info-circle"></i>Descripción general sobre la publicación</p>
      </div>
      <div class="form-group">
        <label>Costo del curso:</label>
        <input autocomplete="off" type="text" class="form-control" name="costo" id="costo" value="<?=$curso->costo?>">
        <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> El precio del curso en <b>dólares</b></p>
      </div>
      <div class="form-group">
        <label>Duración:</label>
        <input autocomplete="off" type="text" class="form-control" name="duracion" id="duracion" value="<?=$curso->duracion?>">
        <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> La duración que tendrá el curso en <b>meses</b></p>
      </div>
      <div class="form-group">
        <div class="checkbox">
          <?php
            if($curso->libre == true){
              ?><label><input checked type="checkbox" id="libre" name="libre"> <b>Curso libre</b></label><?
            }else{
              ?><label><input type="checkbox" id="libre" name="libre"> <b>Curso libre</b></label><?
            }
          ?>
          <p class="help-block"> Marcar si es un curso libre de lo contrario se publicara como curso de posgrado.</p>  
        </div>
      </div>
        <div class="form-group">
        <label>Inicio del curso:</label>
        <input value="<?=date_toDMY($curso->inicio)?>" autocomplete="off" placeholder="00/00/0000" type="text" class="form-control" id="inicio" name="inicio">
        <p class="help-block"> Seleccione la fecha que se iniciará el curso.(campo no obligatorio)</p>
      </div>
      <div class="form-group">
        <label>Fecha de culminación:</label>
        <input value="<?=date_toDMY($curso->fecha_alta)?>" autocomplete="off" placeholder="00/00/0000" type="text" class="form-control" id="fecha_alta" name="fecha_alta">
        <p class="help-block"> Fecha en la que dejara de estar visible la publicación</p>
      </div>
      <div class="form-group">
        <label>Selecciona las carreras a las que va dirigida la publicación</label>
        <?php
       
            function checked($id,$carreras_marcadas){

              if($carreras_marcadas != null && $carreras_marcadas->num_rows() > 0){
                foreach ($carreras_marcadas->result() as $row) {
                  if($id == $row->carrera_id and $row->filtro == true){
                    return true;
                  }
                }
              }
              return false;
            }

            if(isset($carreras) && $carreras->num_rows() > 0){
              foreach ($carreras->result() as $row){
                if(!checked($row->carrera_id,$carrera)){
                  ?>
                    <div class="checkbox">
                      <label><input type="checkbox" name="carreras[]" value="<?=$row->carrera_id?>"> <?=$row->nombre_carrera?></label>
                    </div>
                  <?
                }else{
                  ?>
                    <div class="checkbox">
                      <label><input checked type="checkbox" name="carreras[]" value="<?=$row->carrera_id?>"> <?=$row->nombre_carrera?></label>
                    </div>
                  <?
                }                
              }
            }
          ?>
      </div>
      <div class="form-group">
        <label for="">Adjuntar imagen</label>
        <input type="file" name="imagen" id="imagen">
        <br>
        <?php
          if(!empty($curso->imagen)){
            ?> <img style="max-width:300px;max-height:500px;" src="<?=base_url('imagen/cargar/'. $curso->imagen_publicacion_id)?>" alt="No se ha seleccionado imagen para esta publicación"> <?
          }
        ?>       
      </div>
      <div class="form-group">
        <div id="errors_panel" class="panel panel-danger panel-body text-danger hidden-content">
          
        </div>
      </div>
      <div class="form-footer box-footer">
        <button type="button" onclick="eliminar_curso(<?=$curso->publicacion_id?>);" class="btn btn-danger">Eliminar curso</button>
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
  $("#form_editar_publicacion").submit(function(e){
    e.preventDefault();
    validar_form(this,$("#errors_panel"));
  });
</script>