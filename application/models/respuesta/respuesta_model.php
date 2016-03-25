<?php defined('BASEPATH') OR exit('No direct script access allowed');
	
	class Respuesta_Model extends CI_Model{

		function __construct(){
			parent::__construct();
		}

		function guardar_respuesta($respuesta){

			if(!is_array($respuesta)){
				throw new Exception("El parametro debe de ser un arreglo", 1);
			}

			$this->db->insert("respuesta", $respuesta);
			return $this->db->insert_id();
		}

		function eliminar_respuesta($id_respuesta){

			if(is_numeric($id_respuesta)){
				throw new Exception("El parametro debe ser un numero entero", 1);
			}

			$this->db->where("respuesta_id",$id_respuesta);
			$this->db->delete("respuesta");
			
		}

		
	}
?>