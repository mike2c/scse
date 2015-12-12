<?php 
	
	class Import_manager{
		
		function cargar_archivo($_FILES){	
			if ( !$_FILES["excel"]["name"] == "" ){
				
				//cargamos el archivo al servidor con el mismo nombre

				//solo le agregue el sufijo bak_

				$archivo = $_FILES["excel"]["name"];

				$tipo = $_FILES['excel']['type'];

				$destino = "bak_".$archivo;

				if (copy($_FILES['excel']['tmp_name'],$destino)){
					//echo "Archivo Cargado Con Éxito <br>";
					return $destino;
				}else{
					echo "Error Al Cargar el Archivo";
				}
			}else {
				echo "ERROR, No se pudo cargar el archivo selecionado";
			}
		}
	}
	
?>