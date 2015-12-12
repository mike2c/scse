<div class="box box-primary">
  <div class="box-header with-border">
    <h3 class="box-title">Editar beca: <span class="text-default"><?=$beca->programa_academico?></span></h3>
    <div class="box-tools pull-right">
      <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
      <button class="btn btn-box-tool" onclick="javascript:listar_becas()"><i class="fa fa-times"></i></button>
    </div>
  </div>
  <div class="box-body">
    <form action="<?=base_url('beca/actualizar')?>" method="post" id="form_editar_publicacion" enctype="multipart/form-data">
      <input type="hidden" name="beca_id" id="beca_id" value="<?=$beca->beca_id?>">
      <input type="hidden" name="publicacion_id" id="publicacion_id" value="<?=$beca->publicacion_id?>">
      <input type="hidden" name="imagen_publicacion_id" id="imagen_publicacion_id" value="<?=$beca->imagen_publicacion_id?>">
      <div class="form-group">
        <label>Programa académico:</label>
        <input autocomplete="off" type="text" class="form-control" name="programa_academico" id="programa_academico" value="<?=$beca->programa_academico?>">
        <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> Nombre del curso</p>
      </div>
      <div class="form-group">
        <label>Descripción: </label>
        <textarea class="form-control" name="descripcion" id="descripcion" rows="5"><?=saltar_linea($beca->descripcion)?></textarea>        
        <p class="help-block hidden-content"><i class="fa fa-info-circle"></i>Descripción general sobre la publicación</p>
      </div>
      <div class="form-group">
        <label>Pagina o link con mas información:</label>
        <input autocomplete="off" data-parsley-type="url" type="url" class="form-control" name="url" id="url" value="<?=$beca->url?>">
        <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> Sitio web opcional en donde el estudiante puede encontrar mas información.</p>
      </div>

      <div class="form-group">
        <label>Fecha de culminación:</label>
        <input value="<?=date_toDMY($beca->fecha_alta)?>" autocomplete="off" placeholder="00/00/0000" type="text" class="form-control" id="fecha_alta" name="fecha_alta">
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
          if(!empty($beca->imagen)){
            ?> <img style="max-width:300px;max-height:500px;" src="<?=base_url('imagen/cargar/'. $beca->imagen_publicacion_id)?>" alt="No se ha seleccionado imagen para esta publicación"> <?
          }
        ?>       
      </div>
      <div class="form-group">
        <div id="errors_panel" class="panel panel-danger panel-body text-danger hidden-content">
          
        </div>
      </div>
      <div class="form-footer box-footer">
        <button type="button" onclick="eliminar_beca(<?=$beca->publicacion_id?>);" class="btn btn-danger">Eliminar beca</button>
        <button type="button" onclick="listar_becas()" class="btn btn-default pull-right">Cancelar</button>
        <button type="submit" class="btn btn-primary pull-right">Guardar cambios</button>
      </div>
    </form>
  </div><!-- /.box-body -->
</div>
<script type="text/javascript" src="<?=base_url('plugins/jquery-form/jquery.form.js')?>"></script>
<script type="text/javascript" src="<?=base_url('plugins/Parsley.js-master/dist/parsley.min.js')?>"></script>
<script type="text/javascript" src="<?=base_url('plugins/Parsley.js-master/dist/i18n/es.js')?>"></script>
<script type="text/javascript">
  $("#fecha_alta").datepicker();
  $("#inicio").datepicker();
  help_block();
  $("#form_editar_publicacion").submit(function(e){
    e.preventDefault();
    validar_form(this,$("#errors_panel"));
  });
</script>