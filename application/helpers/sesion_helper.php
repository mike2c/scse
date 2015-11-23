<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
	
	//Si al menos una sesion existe la funcion regresara true.
	function sesionIniciada(){
		return isset($_SESSION["egresado"]) || isset($_SESSION["empresa"]) || isset($_SESSION["administrador"]) || isset($_SESSION["publicador"]);
	}

	//Esta función retorna la sesión en manera de arreglo realizando previamente si existe la sesión.
	function getSesion(){
		if(isset($_SESSION["egresado"])){
			return $_SESSION["egresado"];
		}elseif(isset($_SESSION["empresa"])){
			 return $_SESSION["empresa"]; 
		}elseif(isset($_SESSION["administrador"])){
			 return $_SESSION["administrador"];
		}elseif(isset($_SESSION["publicador"])){
			 return $_SESSION["publicador"];
		}

		return null;
	}

	function esEgresado(){
		if(isset($_SESSION["egresado"])){
			return true;
		}
		return false;
	}

	function esEmpresa(){
		if(isset($_SESSION["empresa"])){
			return true;
		}
		return false;
	}

	function esPublicador(){
		if(isset($_SESSION["publicador"])){
			return true;
		}
		return false;
	}

	function esAdministrador(){
		if(isset($_SESSION["administrador"])){
			return true;
		}
		return false;
	}
	
	function getNombre(){
		$val = getSesion();
		return $val["nombre"];
	}
	
	function getNombreCompleto(){
		$val = getSesion();
		return $val["nombre"]. " ". $val["apellido"];
	}

	function getUsuarioId(){
		$val = getSesion();
		return $val["usuario_id"];
	}

	function getCorreo(){
		$val = getSesion();
		return $val["correo"];
	}
	
	function getImagenPerfil(){
		$val = getSesion();
		return $val["imagen"];
	}

	function setImagenPerfil($nombre_imagen){
		if(esEgresado()){
			$_SESSION["egresado"]["imagen"] = $nombre_imagen;
		}elseif(esEmpresa()){
			$_SESSION["empresa"]["imagen"] = $nombre_imagen;
		}elseif(esPublicador()){
			$_SESSION["publicador"]["imagen"] = $nombre_imagen;
		}elseif(esAdministrador()){
			$_SESSION["administrador"]["imagen"] = $nombre_imagen;
		}

	}

	function imagen_disponible(){

		if(isset($_SESSION) && !empty($_SESSION)){

			if(file_exists("uploads/".getImagenPerfil()) && (getImagenPerfil() !== null) && (getImagenPerfil() !== "")){
				return true;
			}
		}
		return false;
	}

	function is_session_started(){

	    if ( php_sapi_name() !== 'cli' ) {
	        if ( version_compare(phpversion(), '5.4.0', '>=') ) {
	            return session_status() === PHP_SESSION_ACTIVE ? TRUE : FALSE;
	        } else {
	            return session_id() === '' ? FALSE : TRUE;
	        }
	    }
	    return FALSE;
	}
?>