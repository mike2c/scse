<?php defined('BASEPATH') OR exit('No direct script access allowed');
	
	class Respuesta_Sugerida_Model extends CI_Model{

		function __construct(){
			parent::__construct();
		}

		/**Inserta un nuevo registro en la tabla de respuesta_sugerida
		  *y regresa el ultimo id insertado
		  */
		function insertar($opcion){

			if(!is_array($opcion)){
				throw new Exception("El parametro debe de ser de tipo arreglo");
			}

			$this->db->insert("respuesta_sugerida",$opcion);
			return $this->db->insert_id();
		}

		function eliminar($id_opcion){
			
			$this->db->where("opcion_id",$id_opcion);
			$this->db->delete("opcion");
		}

		/**Elimina todas las opciones con respecto a una pregunta
		  */
		function eliminar_todas($id_pregunta){

			$this->db->where("pregunta_id",$id_pregunta);
			$this->db->delete("opcion");
		}

		function listar($id_pregunta){

			$this->db->where("pregunta_id",$id_pregunta);
			return $this->db->get("respuesta_sugerida");
		}

		function listar_opciones($idPregunta){

			if(!is_numeric($idPregunta)){
				throw new Exception("El dato de entrada debe de ser numerico", 1);
			}

			$this->db->where("pregunta_id", $idPregunta);
			return $this->db->get("respuesta_sugerida");

		}
	}
?>