/*Preferiblemente llamar a este archivo al final del documento html*/

$(document).ready(function(){

  function archivo(evt) {
    var files = evt.target.files; // FileList object

    // Obtenemos la imagen del campo "file".
    for (var i = 0, f; f = files[i]; i++) {
      //Solo admitimos imágenes.
      if (!f.type.match('image.*')) {
          continue;

      }

      var reader = new FileReader();

      reader.onload = (function(theFile) {
          return function(e) {
            // Insertamos la imagen
            var imagen = document.getElementById("precarga");
            imagen.src = e.target.result;
            imagen.title = theFile.name;

           //document.getElementById("list").innerHTML = ['<img class="thumb" src="', e.target.result,'" title="', escape(theFile.name), '"/>'].join('');
          };
      })(f);

      reader.readAsDataURL(f);
    }
  }

  document.getElementById('imagen').addEventListener('change', archivo, false);

});
