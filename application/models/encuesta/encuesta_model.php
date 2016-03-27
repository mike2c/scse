<?php
	
	class Encuesta_Model extends CI_Model{

		function __construct(){

		}

		/**Inserta un nuevo registro en la tabla
		  *de encuestsa
		  */
		function insertar($values){

			if(!is_array($values)){
				throw new Exception("El parametro proporcionado debe de ser de tipo arreglo.", 1);
			}
		
			$this->db->insert("encuesta",$values);
			return $this->db->insert_id(); // Regresa el ultimo id generado automaticamente en la tabla
		}

		function agregar_carrera($datos){

			if(!is_array($datos)){
				throw new Exception("El parametro debe de ser de tipo array");
			}

			$this->db->insert("encuesta_carrera",$datos);
			return $this->db->insert_id(); // Regresa el ultimo id generado en la tabla
		}

		/**Elimina una registro de la tabla
		 */
		function eliminar_encuesta($id_encuesta){

			$this->db->where('encuesta_id',$id_encuesta);
			$this->db->delete('encuesta');

			$this->db->query("delete from encuesta_carrera where encuesta_id = $id_encuesta");
		}

		/**Retorna todas las encuestas por publicador
		  */
		function listar_por_publicador($usuario_id){

			$this->db->where("usuario_id",$usuario_id);
			return $this->db->get("encuesta");
		}

		/**Lista las encuestas publicadas por carrera*/
		function listar_encuestas($arr_carrera){

			$this->db->select("encuesta.encuesta_id, objetivo, descripcion")->from("encuesta,encuesta_carrera");
			$this->db->where("encuesta.encuesta_id = encuesta_carrera.encuesta_id");
			$this->db->where_in("carrera_id", $arr_carrera);

			/**Retornamos el resultado*/
			return $this->db->get();
			 
		}

		function listar_carreras($id_encuesta){

			$resultado = $this->db->query("select carrera.carrera_id, nombre_carrera
				from carrera, encuesta_carrera
				where 
				carrera.carrera_id = encuesta_carrera.carrera_id
				and encuesta_carrera.encuesta_id = $id_encuesta");

			if($resultado->num_rows() > 0){
				return $resultado;
			}

			return null;
		}

		function total_egresados_a_encuestar($id_encuesta){

			$carreras = $this->listar_carreras($id_encuesta);
			$total = 0;
			foreach ($carreras->result() as $row) {
				$total = $total + $this->db->query("select egresado_id from egresado where egresado.carrera_id = $row->carrera_id")->num_rows();
			}

			return $total;
		}

		function contar_egresados_encuestados($id_encuesta){

			$this->db->where("encuesta_id", $id_encuesta);
			$result = $this->db->get("resultado");

			$var = $result->num_rows();

			unset($result);
			return $var;
		}

		function encuesta_contestada($id_egresado, $id_encuesta){

			$this->db->where("egresado_id", $id_egresado);
			$this->db->where("encuesta_id", $id_encuesta);

			$result = $this->db->get("resultado");
			if($result->num_rows() == 1){
				return true;
			}

			return false;
		}

		function leer($id_encuesta){

			if(!is_numeric($id_encuesta)){
				throw new Exception("El parametro debe de ser un numero entero");
			}
			if($id_encuesta == null){
				throw new Exception("El parametro no puede ser null");
			}

			$this->db->where("encuesta_id",$id_encuesta);
			return $this->db->get("encuesta");
		}
	}
?>