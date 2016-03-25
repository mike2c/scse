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
	}
?>