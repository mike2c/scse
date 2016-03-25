<?php defined('BASEPATH') OR exit('No direct script access allowed');
	
	class Pregunta_Model extends CI_Model{

		function __construct(){
			parent::__construct();
		}

		// Inserta una nueva pregunta
		function insertar($pregunta){

			if(!is_array($pregunta)){
				throw new Exception("El parametro proporcinado debe de ser arreglo", 1);
			}

			$this->db->insert("pregunta",$pregunta);
			return $this->db->insert_id();// Regresa el ultimo id generado por la base de datos
		}

		// Elimina una pregunta
		function eliminar($id_pregunta){

			if(!is_integer($id_pregunta)){
				throw new Exception("El parametro proporcinado debe de ser de tipo entero", 1);
			}
			
			$this->db->where("pregunta_id",$id_pregunta);
			$this->db->delete("pregunta");
		}

		/** Borra todas las preguntas
		  * de una encuesta
		  */
		function eliminar_todas($id_encuesta){

			if(!is_integer($id_encuesta)){
				throw new Exception("El parametro proporcinado debe de ser de tipo entero", 1);
			}

			$this->db->where("encuesta_id",$id_encuesta);
			$this->db->delete("pregunta");
		}

		/**Lista el numero de preguntas*/
		function listar_preguntas($id_encuesta){

			if(!is_numeric($id_encuesta)){
				throw new Exception("El id de la encuesta debe de ser un entero", 1);				
			}
			if($id_encuesta == null){
				throw new Exception("El id de la encuesta no debe de ser null", 1);
			}

			$this->db->where("encuesta_id",$id_encuesta);
			$result = $this->db->get("pregunta");

			return $result;
		}

		function consultar_pregunta($idPregunta){

			$this->db->where("pregunta_id", $idPregunta);
			$result = $this->db->get("pregunta");

			if($result->num_rows() == 1){
				return $result->row();
			}

			return null;
		}

		function listar_preguntas_abiertas($encuesta_id){
			
			$this->db->where("encuesta_id",$encuesta_id);
			$this->db->where("categoria_id","1");

			return $this->db->get("pregunta");// Retornamos el resultado
		}

		/**Cuenta el numero de preguntas*/
		function contar_preguntas($id_encuesta){
			if($id_encuesta == null){
				throw new Exception("El id de la encuesta no debe de ser null", 1);
			}

			$this->db->where("encuesta_id",$id_encuesta);
			$result = $this->db->get("pregunta");

			/**Si el resultado es null significa que no se encontro ningun registro
			  *con esos criterios y por lo tanto retornamos 0*/
			if($result == null){ 
				return 0;
			}

			$no_preguntas = $result->num_rows();
			unset($result); /**Eliminamos la variable de la memoria porque no se utilizara mas*/

			return $no_preguntas; /**Retornamos el numero de preguntas*/
		}
	}
?>