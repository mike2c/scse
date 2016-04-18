<div class="box box-primary">
  <div class="box-header with-border">
    <h3 class="box-title">Editar ficha ocupacional: <span class="text-default"><?=$ficha->cargo?></span></h3>
    <div class="box-tools pull-right">
      <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
      <button class="btn btn-box-tool" onclick="javascript:listar_fichas()"><i class="fa fa-times"></i></button>
    </div>
  </div>
  <div class="box-body">
    <form action="<?=base_url('ficha/actualizar')?>" method="post" id="form_editar_publicacion" enctype="multipart/form-data">
      <input type="hidden" name="ficha_id" id="ficha_id" value="<?=$ficha->ficha_id?>">
      <input type="hidden" name="publicacion_id" id="publicacion_id" value="<?=$ficha->publicacion_id?>">
      <input type="hidden" name="imagen_publicacion_id" id="imagen_publicacion_id" value="<?=$ficha->imagen_publicacion_id?>">
      <div class="form-group">
        <label>Cargo o puesto:</label>
        <input type="text" class="form-control" name="cargo" id="cargo" value="<?=$ficha->cargo?>">
      </div>
      <div class="form-group">
        <label>Descripción: </label>
        <textarea class="form-control" name="descripcion" id="descripcion" rows="5"><?=saltar_linea($ficha->descripcion)?></textarea>        
        <p class="help-block hidden-content"><i class="fa fa-info-circle"></i>Descripción general sobre la publicación</p>
      </div>
      <div class="form-group">
        <label for="">Ubicación del cargo</label>
        <input class="form-control" type="text" name="ubicacion" id="ubicacion" value="<?=$ficha->ubicacion?>">
        <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> El área de la empresa en la que se encuentra ubicado el cargo.</p>
      </div>
      <!--Cantidad de puestos-->
      <div class="form-group">
        <label for="">Cantidad de puestos</label>
        <input class="form-control" type="text" name="cantidad" id="cantidad" value="<?=$ficha->cantidad?>">
        <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> Cantidad de puestos disponibles para le cargo.</p>
      </div>
       <div class="form-group">
        <label for="">Jefe inmediato</label>
        <input class="form-control" type="text" name="jefe" id="jefe" value="<?=$ficha->jefe?>">
      </div>
       <div class="form-group">
        <label for="">Experiencia</label>
        <input class="form-control" type="text" name="experiencia" id="experiencia" value="<?=$ficha->cantidad?>">
        <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> La experiencia minima en <b>años</b> solicitada para el cargo. Si no se requiere experiencia porfavor digitar N/A.</p>
      </div>
       <div class="form-group">
        <label for="">Personal a cargo</label>
        <textarea name="a_cargo" id="a_cargo" rows="5" class="form-control"><?=saltar_linea($ficha->a_cargo)?></textarea>
        <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> Los cargos que estaran bajo tu responsabilidad. Ejemplo: Produccion, Bodega, Informatica, etc.</p>
      </div>
      <div class="form-group">
        <label for="">Finalidad del cargo</label>
          <textarea name="finalidad" id="finalidad" rows="5" class="form-control"><?=saltar_linea($ficha->finalidad)?></textarea>
          <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> Breve descripcion de las actividades a realizar en el cargo. Ejemplo: Responsable de preveer, organizar, dirigir, planear, etc.</p>
      </div>
      <div class="form-group">
        <label for="">Requisitos del cargo</label>
          <textarea name="requisitos" id="requisitos" rows="5" class="form-control"><?=saltar_linea($ficha->requisitos)?></textarea>
          <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> Destrezas o estudios necesarios para poder aplicar al cargo. Titulaciones, certificaciones, cursos o el dominio de alguna herramienta.</p>
      </div>
      <div class="form-group">
        <label for="">Competencia</label>
          <textarea name="competencia" id="competencia" rows="5" class="form-control"><?=saltar_linea($ficha->competencia)?></textarea>
          <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> Las aptitudes que debera de poseer el aplicante al cargo. Ejemplo: sentido de la responsabilidad, alta capacidad de analisis, etica, etc.</p>
      </div>
      <div class="form-group">
        <label for="">Funciones y responsabilidades</label>
          <textarea name="funciones" id="funciones" rows="5" class="form-control"><?=saltar_linea($ficha->funciones)?></textarea>
          <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> Especifiar las funciones y responsabilidades que debera de ejecutar la persona en el cargo.</p>
      </div>
      <div class="form-group">
        <label>Fecha de culminación:</label>
        <input value="<?=date_toDMY($ficha->fecha_alta)?>" autocomplete="off" placeholder="00/00/0000" type="text" class="form-control" id="fecha_alta" name="fecha_alta">
        <p class="help-block"><i class="fa fa-info-circle"></i> Fecha en la que dejara de estar visible la publicacion</p>
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
          if(!empty($ficha->imagen)){
            ?> <img style="max-width:300px;max-height:500px;" src="<?=base_url('imagen/cargar/'. $ficha->imagen_publicacion_id)?>" alt="No se ha seleccionado imagen para esta publicación"> <?
          }
        ?>
      </div>
      <div class="form-group">
        <div id="errors_panel" class="panel panel-danger panel-body text-danger hidden-content">
          
        </div>
      </div>
      <div class="form-footer box-footer">
        <button type="button" onclick="eliminar_ficha(<?=$ficha->publicacion_id?>);" class="btn btn-danger">Eliminar ficha</button>
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
  $("#form_editar_publicacion").submit(function(e){
    e.preventDefault();
    validar_form(this,$("#errors_panel"));
  });
</script>