<?php defined('BASEPATH') OR exit('No direct script access allowed');
	
	include_once "respuesta_model.php";

	class Respuesta_Seleccionada_Model extends Respuesta_Model{

		function __construct(){
			parent::__construct();
		}

		function guardar_respuesta_seleccionada($respuesta, $respuesta_seleccionada){
			if(!is_array($respuesta)){
				throw new Exception("El parametro de entrada debe de ser un arreglo", 1);
			}

			$respuesta_id = parent::guardar_respuesta($respuesta);
			
			foreach ($respuesta_seleccionada as $key => $value) {
				$fields = array("respuesta_id"=>$respuesta_id, "respuesta_sugerida_id"=>$value);
				$this->db->insert("respuesta_seleccionada", $fields);	
			}
			 
		}

		function numero_respuestas($id_respuesta_sugerida){
			
			if(!is_numeric($id_respuesta_sugerida))
				throw new Exception("El dato de entrada debe de ser entero, 1");
			
			$result = $this->db->query("select count(*) as resultado from respuesta_seleccionada
			where respuesta_seleccionada.respuesta_sugerida_id = $id_respuesta_sugerida;");
			
			$cont = $result->row("resultado");
			unset($result)	;
			
			return $cont;
		}
	}
?>