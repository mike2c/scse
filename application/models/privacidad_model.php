<?php defined('BASEPATH') OR exit('No direct script access allowed');
	
	class Privacidad_Model extends CI_Model{

		function __construct(){
			parent::__construct();
		}

		function configurar_privacidad($arr){

			foreach ($arr as $key => $value) {
				if($value == null || empty($value)){
					throw new Exception("El elemento $key no puede ser null o vacio");
				}
			}
		
			if(is_array($arr)){
				$this->db->insert("privacidad",$arr);
				return TRUE;
			}else{
				throw new Exception("La variable propocionada debe de ser un arreglo");
			}
			
			return FALSE;
		}

		function actualizar_privacidad($arr){

			foreach ($arr as $key => $value) {
				if($value == null || empty($value)){
					throw new Exception("El elemento $key no puede ser null o vacio");
				}
			}
	
			if(is_array($arr)){
				$this->db->where("usuario_id",$arr["usuario_id"]);
				$this->db->update("privacidad",$arr);
				return TRUE;
			}else{
				throw new Exception("La variable propocionada debe de ser un arreglo");
			}
			
			return FALSE;
		}

		function consultar_privacidad($usuario_id){

			if($usuario_id == null || empty($usuario_id)){
				throw new Exception("La variable propocionada debe no puede ser null o vacia");	
			}

			$query = $this->db->query("select foto_perfil,info_contacto,info_ubicacion,info_curriculum,info_adicional from privacidad where usuario_id='$usuario_id'");
				
			if($query->num_rows() == 1){
				
				return $query->row_array();	
			}

			return FALSE;
		}

	}
?>