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
      <div class="form-group">
        <label>Cargo o puesto:</label>
        <input type="text" class="form-control" name="cargo" id="cargo" value="<?=$ficha->cargo?>">
      </div>
      <div class="form-group">
        <label>Descripción: </label>
        <textarea class="form-control" name="descripcion" id="descripcion" rows="5"><?=$ficha->descripcion?></textarea>        
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
        <input class="form-control" type="text" name="cantidad" id="cantidad" value="<?=$ficha->cantidad?>">
        <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> La experiencia minima en <b>años</b> solicitada para el cargo. Si no se requiere experiencia porfavor digitar N/A.</p>
      </div>
       <div class="form-group">
        <label for="">Personal a cargo</label>
        <textarea name="a_cargo" id="a_cargo" rows="5" class="form-control"><?=$ficha->a_cargo?></textarea>
        <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> Los cargos que estaran bajo tu responsabilidad. Ejemplo: Produccion, Bodega, Informatica, etc.</p>
      </div>
      <div class="form-group">
        <label for="">Finalidad del cargo</label>
          <textarea name="finalidad" id="finalidad" rows="5" class="form-control"><?=$ficha->finalidad?></textarea>
          <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> Los cargos que estaran bajo tu responsabilidad. Ejemplo: Produccion, Bodega, Informatica, etc.</p>
      </div>
      <div class="form-group">
        <label for="">Requisitos del cargo</label>
          <textarea name="requisitos" id="requisitos" rows="5" class="form-control"><?=$ficha->requisitos?></textarea>
          <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> Destrezas o estudios necesarios para poder aplicar al cargo. Titulaciones, certificaciones, cursos o el dominio de alguna herramienta.</p>
      </div>
      <div class="form-group">
        <label for="">Requisitos</label>
          <textarea name="requisitos" id="requisitos" rows="5" class="form-control"><?=$ficha->requisitos?></textarea>
          <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> Las aptitudes que debera de poseer el aplicante al cargo. Ejemplo: sentido de la responsabilidad, alta capacidad de analisis, etica, etc.</p>
      </div>
      <div class="form-group">
        <label for="">Funciones y responsabilidades</label>
          <textarea name="funciones" id="funciones" rows="5" class="form-control"><?=$ficha->funciones?></textarea>
          <p class="help-block hidden-content"><i class="fa fa-info-circle"></i> Describe las funciones y responsabilidades que debera de ejecutar el aspirante al puesto.</p>
      </div>
      <div class="form group">
        <label>Fecha de culminación:</label>
        <input value="<?=$fecha->fecha_alta?>" autocomplete="off" placeholder="00/00/0000" type="text" class="form-control" id="fecha" name="fecha_alta">
        <p class="help-block"><i class="fa fa-info-circle"></i> Fecha en la que dejara de estar visible la publicacion</p>
      </div>
      <div class="form-group">
        <label for="">Adjuntar imagen</label>
        <input type="file" name="imagen" id="imagen">
      </div>
      <div class="box-footer">
          <ul class="mailbox-attachments">
          <li>
            <span class="mailbox-attachment-icon has-img">
              <div id="preview">
                
              </div>
            </span>
          </li>
        </ul>
      </div>
      <div class="form-footer">
        <button type="button" onclick="" class="btn btn-default pull-right">Cancelar</button>
        <button type="submit" class="btn btn-primary pull-right">Guardar cambios</button>
      </div>
    </form>
  </div><!-- /.box-body -->
</div>
<script type="text/javascript" src="<?=base_url('plugins/jquery-form/jquery.form.js')?>"></script>
<script type="text/javascript">
  help_block();
  $("#fecha").datepicker();
  $("#imagen").change(function(){
    $("#form_editar_publicacion").ajaxForm({
      target: '#preview'
    }).submit();
  });
</script>