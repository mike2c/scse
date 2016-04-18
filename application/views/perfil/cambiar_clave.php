<div class="modal fade" id="modalCambiarClave">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title">Cambiar contraseña</h4>
      </div>
      <div class="modal-body">

        <form id="form_cambiar_clave" name="form_cambiar_clave" method="post" action="<?=base_url("perfil/cambiar_clave")?>">
          <div class="form-group">
            <label>Contraseña actual</label>
            <input type="password" class="form-control input-sm" name="clave_actual" id="clave_actual">
          </div>
          <div class="form-group">
            <label>Nueva contraseña</label>
            <input type="password" class="form-control input-sm" name="clave_nueva" id="clave_nueva">
          </div>
          <div class="form-group">
            <label>Repetir contraseña</label>
            <input type="password" class="form-control input-sm" name="clave_repetida" id="clave_repetida">
          </div>
          <div class="form-group">
            <div id="response" class="hidden alert alert-warning alert-dismissable">
             
            </div>
          </div>
        </form>        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
        <button type="submit" form="form_cambiar_clave" class="btn btn-primary">Cambiar contraseña</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div>
<script type="text/javascript">
  $("#form_cambiar_clave").submit(function(e){
    e.preventDefault();
    $.post(baseURL("perfil/cambiar_clave"), $("#form_cambiar_clave").serialize(), function(data){
      if(data == "")  {
        $("#form_cambiar_clave").trigger("submit");
      }else{
        $("#response").removeClass("hidden");
        $("#response").html(data);
      }
    });

  });

  $("#modalCambiarClave").on("hidden.bs.modal", function(){
    $(form_cambiar_clave).trigger("reset");
    $("#response").addClass("hidden");
  });
</script>