<section class="content-header">
  <h1>
     Publicaciones
     <small>Fichas ocupacionales</small>
  </h1>
</section>
<div class="content">
  
<div class="box box-primary">
  <div class="box-header with-border">
    <h3 class="box-title">Fichas ocupacionales publicadas</h3>
  </div>
  <div class="box-body">
    <div class="publicacion-controls">
       <button class="btn btn-primary">Nueva ficha</button>
    </div>
    <table class="table table-default table-condensed table-hover">
      <tbody>
        <?php
          if(!is_null($fichas) && !empty($fichas) && $fichas->num_rows() > 0){
            $cont = 1;
            foreach ($fichas->result() as $row) {
              echo "<tr>";
              echo "<td>$cont</td>";
              echo "<td><a href='javascript:editar_ficha_ocupacional($row->publicacion_id)'><i class='fa fa-edit'></i> $row->cargo</a></td>";
              echo "<td><p>".date_toDMY($row->fecha_publicacion)."</p></td>";
              if($row->visible == true){
                echo "<td><input type='checkbox' checked class='toggle-publicacion' value='$row->publicacion_id'></td>";  
              }else{
                echo "<td><input type='checkbox' class='toggle-publicacion' value='$row->publicacion_id'></td>";  
              }              
              echo "</tr>";
              $cont++;
            }
          }else{
            ?>
              
            <?
          }
        ?>
      </tbody>  
    </table>
  </div><!-- /.box-body -->
  <div class="box-footer">

  </div><!-- /.box-footer-->
</div>
</div>
<link rel="stylesheet" type="text/css" href="<?=base_url('plugins/bootstrap-toggle/css/bootstrap-toggle.min.css')?>">
<script type="text/javascript" src="<?=base_url('plugins/bootstrap-toggle/js/bootstrap-toggle.min.js')?>"></script>
<script type="text/javascript">
  $(document).ready(function(){
    $(".toggle-publicacion").bootstrapToggle({
      on:   "visible",
      off:  "oculta",
      size: "small"
    });
    //1 - 48
    $(".toggle-publicacion").change(function(){
      actualizar_visiblidad(this.value,$(this).prop('checked'));
    });
  });
</script>