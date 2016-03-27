<?php defined('BASEPATH') OR exit('No direct script access allowed');
	
	include_once "respuesta_model.php";

	class Respuesta_Cerrada_Model extends Respuesta_Model{

		function __construct(){
			parent::__construct();
		}

		function guardar_respuesta_cerrada($respuesta, $respuesta_cerrada){

			if(!is_array($respuesta)){
				throw new Exception("El parametro de entrada debe de ser un arreglo", 1);
			}
			
			$respuesta_cerrada["respuesta_id"] = parent::guardar_respuesta($respuesta);
			$this->db->insert("respuesta_cerrada", $respuesta_cerrada);

			return $this->db->insert_id();
		}

		function resultado($idPregunta,	$tipo){

			$result = $this->db->query("select count(*) as resultado 	
				from respuesta, respuesta_cerrada 
				where respuesta.respuesta_id = respuesta_cerrada.respuesta_id 
				and respuesta_cerrada.valor = $tipo 
				and respuesta.pregunta_id = $idPregunta");

			$cont = $result->row("resultado");
			unset($result);

			return $cont;
		}

		function eliminar_respuestas($idEncuesta){

			$preguntas = $this->db->query("select * from pregunta where encuesta_id = $idEncuesta and categoria_id = '2'");

			foreach ($preguntas->result() as $row) {
				$respuestas = $this->db->query("select respuesta_id from respuesta 
					where respuesta.pregunta_id = $row->pregunta_id");

				foreach ($respuestas->result() as $r) {
					$this->db->query("delete from respuesta_cerrada where respuesta_id = $r->respuesta_id");
				}

				$this->db->query("delete from respuesta where pregunta_id = $row->pregunta_id");
				unset($respuestas);
			}

			unset($preguntas);
		
		}
	}
?>