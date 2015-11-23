<?php defined('BASEPATH') OR exit('No direct script access allowed');
	
	function escaparImagen($nombre){
		$data = null;

		if (is_uploaded_file($_FILES["$nombre"]["tmp_name"])){
		    # verificamos el formato de la imagen
		    if($_FILES["$nombre"]["type"]=="image/jpeg" || $_FILES["$nombre"]["type"]=="image/jpg" || $_FILES["$nombre"]["type"]=="image/gif" || $_FILES["$nombre"]["type"]=="image/bmp" || $_FILES["$nombre"]["type"]=="image/png"){
		        # Cogemos la anchura y altura de la imagen 
		        $info=getimagesize($_FILES["$nombre"]["tmp_name"]);
		        //echo "<BR>".$info[0]; //anchura
		        //echo "<BR>".$info[1]; //altura
		        //echo "<BR>".$info[2]; //1-GIF, 2-JPG, 3-PNG
		        //echo "<BR>".$info[3]; //cadena de texto para el tag <img
		 
		        # Escapa caracteres especiales
		        $data["imagen"]= file_get_contents($_FILES["$nombre"]["tmp_name"]);
		 		$data["tipo"]= $_FILES["$nombre"]["type"];
		 		return $data;
		  	}else{
			 	echo "<div class='error'>Error: El formato de archivo tiene que ser JPG, GIF, BMP o PNG.</div>";
			}

		}
		return null;
	}

	function subirImagen($nombre_imagen,$nombre= "",$alto = 1000,$ancho = 1000){
		
		$config['upload_path'] = './uploads/';
		$config['allowed_types'] = 'gif|jpeg|png|jpg';
		$config['max_size'] = 2048;
		$config['max_width'] = $ancho;
		$config['max_height'] = $alto;
		$config['overwrite'] = TRUE;
		
		if($nombre == ""){
			$config['file_name'] = "profile_image_".getUsuarioId();
		}
		
		$this->load->library('upload',$config);

		if(!$this->upload->do_upload($nombre_imagen)){
			throw new Exception($this->load->display_errors()); 
		}

		return $this->upload->data();
	}

	function redimensionarImagen($ruta){
		
		list($ancho,$alto,$tipo_imagen) = getimagesize($ruta);
			if ($alto<=350 && $ancho<=350) {
				
			}else{
				$config["image_library"] = "gd2";
				$config["source_image"] = $ruta;
				$config["maintain_ratio"] = TRUE;
				$config["width"] = 350;
				$config["height"] = 350;
				
				return $config;
			}
	}
	function casoEmergencia($ruta){
		/*$img = $empresa['data_usuario']->row()->imagen_perfil;
			if ($img == "") {
				$defaultImg = "/Tesis/uploads/Male.jpg";
			}else{
				$defaultImg= "/Tesis/uploads/".$img;
				$ruta = "C:/AppServ/www/Tesis/uploads/".$img;
			}*/

			list($ancho,$alto,$tipo_imagen) = getimagesize($ruta);
			if ($alto>350 && $ancho >350) {
				return $ruta;
			}else{
				$nuevo_ancho = 350;
				$nuevo_alto = 350;
			}

			$thumb = imagecreatetruecolor($nuevo_ancho, $nuevo_alto);

			switch ( $tipo_imagen ){
			case "image/jpg":
				$origen = imagecreatefromjpeg($ruta);
				$this->output->set_header("image/jpeg");
				break;
			case IMAGETYPE_JPEG:
				$origen = imagecreatefromjpeg($ruta);
				$this->output->set_header("image/jpeg");
				break;
			case IMAGETYPE_PNG:
				$origen = imagecreatefrompng($ruta);
				$this->output->set_header("image/png");
				break;
			case IMAGETYPE_GIF:
				$origen = imagecreatefromgif($ruta);
				$this->output->set_header("image/gif");
				break;
		}
			imagecopyresampled($thumb, $origen, 0, 0, 0, 0, $nuevo_ancho, $nuevo_alto, $ancho, $alto);
			imagejpeg($thumb,$ruta, 90);
	}
?>