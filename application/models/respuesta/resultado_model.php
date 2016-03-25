<?php defined('BASEPATH') OR exit('No direct script access allowed');
	
	class Resultado_Model extends CI_Model{

		function __construct(){
			parent::__construct();
		}

		function guardar_resultado($resultado){

			if(!is_array($resultado)){
				throw new Exception("el parametro debe de ser un arreglo", 1);
			}

			$this->db->insert("resultado", $resultado);
			return $this->db->insert_id();
		}

		function existe_resultado($id_encuesta, $id_egresado){
			
			if(!is_numeric($id_egresado)){
				throw new Exception("El parametro de entrada debe de ser un numero entero", 1);
			}

			$this->db->where("encuesta_id", $id_encuesta);
			$this->db->where("egresado_id", $id_egresado);

			$result = $this->db->get("resultado");
			if($result->num_rows() == 1){
				return true;
			}

			return false;
		}

		/**Retorna los id de los egresados que aplicaron a la encuesta*/
		function listar_encuestados($id_encuesta){

			$this->db->select("egresado.egresado_id, nombre, apellido")->from("egresado, persona, resultado");
			$this->db->where("persona.persona_id = egresado.persona_id");
			$this->db->where("egresado.egresado_id = resultado.egresado_id");
			$this->db->where("encuesta_id", $id_encuesta);

			$resultado = $this->db->get();

			return $resultado;
		}

		function eliminar_resultado($id_resultado){

			if(!is_numeric($id_resultado)){
				throw new Exception("El parametro de entrada debe de ser numerico", 1);
			}
			
			$this->db->where("resultado_id", $id_resultado);
			$this->db->delete("resultado");
		}
	}
?>