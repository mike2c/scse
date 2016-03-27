<?php defined('BASEPATH') OR exit('No direct script access allowed');
	
	/**Importar clase base*/
	include_once ("respuesta_model.php");

	class Respuesta_Abierta_Model extends Respuesta_Model{

		function __construct(){
			parent::__construct();
		}

		public function guardar_respuesta_abierta($respuesta, $respuesta_abierta){

			if(!array($respuesta)){
				throw new Exception("El parametro debe de ser una arreglo", 1);
			}

			$respuesta_abierta["respuesta_id"] = parent::guardar_respuesta($respuesta);
			$this->db->insert("respuesta_abierta", $respuesta_abierta);
			return $this->db->insert_id();
		}

		public function eliminar_respuesta_abierta($id_respuesta){
			
		}
	
		function consultar_respuesta($id_egresado, $id_pregunta){

			$result = $this->db->query("select respuesta.respuesta_id, respuesta_abierta.respuesta
				from 
					respuesta, respuesta_abierta, resultado
				where
					respuesta.respuesta_id = respuesta_abierta.respuesta_id
				and
					respuesta.resultado_id = resultado.resultado_id
				and 
					respuesta.pregunta_id = $id_pregunta
				and
					resultado.egresado_id = $id_egresado");

			if($result->num_rows() == 0){
				return null;
			}

			return $result->row("respuesta");
		}

		function eliminar_respuestas($idEncuesta){

			$preguntas = $this->db->query("select * from pregunta where encuesta_id = $idEncuesta and categoria_id = '1'");

			foreach ($preguntas->result() as $row) {
				$respuestas = $this->db->query("select respuesta_id from respuesta 
					where respuesta.pregunta_id = $row->pregunta_id");

				foreach ($respuestas->result() as $r) {
					$this->db->query("delete from respuesta_abierta where respuesta_id = $r->respuesta_id");
				}

				$this->db->query("delete from respuesta where pregunta_id = $row->pregunta_id");
				unset($respuestas);
			}

			unset($preguntas);
		
		}
	}
?>