<section class="content-header">
  <h1>
     Publicaciones
     <small>Cursos</small>
  </h1>
</section>
<div class="content">
  
<div class="box box-primary">
  <div class="box-header with-border">
    <h3 class="box-title">Listado de cursos publicados</h3>
  </div>
  <div class="box-body">
    <div class="publicacion-controls">
       <button class="btn btn-primary" onclick="crear_curso()"> <i class="glyphicon glyphicon-file
"></i> Nuevo curso</button>
    </div>
    <br>
    <table class="table table-default table-condensed table-hover">
      <tbody>
        <?php
          if(!is_null($cursos) && !empty($cursos) && $cursos->num_rows() > 0){
            $cont = 1;
            foreach ($cursos->result() as $row) {
              echo "<tr>";
              echo "<td>$cont</td>";
              echo "<td><a href='javascript:editar_curso($row->publicacion_id)'><i class='fa fa-edit'></i> $row->nombre_curso</a></td>";
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
            <br>
              <div class="alert alert-danger alert-dismissable">
                <!--<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>-->
                <h4> Mensaje</h4>
                No se han encontrado publicaciones de cursos
              </div>
            <?
          }
        ?>
      </tbody>  
    </table>
  </div><!-- /.box-body -->

</div>
</div>
<script type="text/javascript" src="<?=base_url('dist/js/publicaciones.js')?>"></script>
<script type="text/javascript">
  $(document).ready(function(){
    $(".toggle-publicacion").bootstrapToggle({
      on:   "visible",
      off:  "oculta",
      size: "small"
    });
    //1 - 48
    $(".toggle-publicacion").change(function(){

      var data = {
        publicacion:  this.value,
        valor:        $(this).prop('checked')
      };
      actualizar_visibilidad(data);
    });
  });
</script>